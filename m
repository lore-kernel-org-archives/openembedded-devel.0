Return-Path: <f.pflug@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E2A2C79FA1
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 11:25:26 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4836.1788866721474263028
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Sep 2026 04:25:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: f.pflug@pengutronix.de)
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <f.pflug@pengutronix.de>)
	id 1x3tx1-0001pa-IZ; Tue, 08 Sep 2026 13:25:19 +0200
From: Fabian Pflug <f.pflug@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: yocto@pengutronix.de
Subject: [meta-oe][PATCH] systemd-systemctl: enable templated services
Date: Tue,  8 Sep 2026 13:24:43 +0200
Message-ID: <20260908112519.1089163-1-f.pflug@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::5c
X-SA-Exim-Mail-From: f.pflug@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Sep 2026 11:25:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129860

The wrapper script previously did not allow to instantiate templated
services without DefaultInstance defined. This change allows
foo@.service be installed and therefor be in enabled state.

In real systemd land, templated units without a specified instance are
valid, but we restrict it here a bit in order to not have a foo@.service
with:

  [Install]
  WantedBy=bar.service    # bar.service starts -> start foo@???.service

In this case, system can never resolve the specific instance of
foo@.service when bar.service is started. It is fixed by adding the
template_only variable, which restricts the dependents of generic
template units to template-only ones. This means the following is still
legal for the above foo@.service:

  [Install]
  WantedBy=bar@.service   # bar@1.service starts -> start foo@1.service
                          # bar@2.service starts -> start foo@2.service
                          # etc...

  WantedBy=bas@1.service  # bas@1.service starts -> start foo@1.service
                          # bas@2.service starts -> no dependency here
                          # etc...

Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>
---
 .../systemd/systemd-systemctl/systemctl       | 30 ++++++++++++-------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-devtools/systemd/systemd-systemctl/systemctl b/meta-oe/recipes-devtools/systemd/systemd-systemctl/systemctl
index 07d24fd175..a9785e8b4b 100755
--- a/meta-oe/recipes-devtools/systemd/systemd-systemctl/systemctl
+++ b/meta-oe/recipes-devtools/systemd/systemd-systemctl/systemctl
@@ -179,12 +179,18 @@ class SystemdUnit():
 
         raise SystemdUnitNotFoundError(self.root, unit)
 
-    def _process_deps(self, config, service, location, prop, dirstem):
+    def _process_deps(self, config, service, location, prop, dirstem,
+                      template_only):
         systemdir = self.root / SYSCONFDIR / "systemd" / "system"
 
         target = ROOT / location.relative_to(self.root)
         try:
             for dependent in config.get('Install', prop):
+                # template-only dependencies means either foo@.unit or foo@bar.unit,
+                # but not foo.unit, as then systemd cannot resolve the instance
+                if template_only and not re.match(r"[^@]+@[^\.]*\.", dependent):
+                        continue
+
                 wants = systemdir / "{}.{}".format(dependent, dirstem) / service
                 add_link(wants, target)
 
@@ -209,20 +215,24 @@ class SystemdUnit():
             return
 
         config = SystemdFile(self.root, path)
+        service = self.unit
+        template_only = False
+
+        # handle enabling a template unit with unspecified instance
         if instance == "":
             try:
                 default_instance = config.get('Install', 'DefaultInstance')[0]
             except KeyError:
-                # no default instance, so nothing to enable
-                return
+                # no default instance, allow template only dependencies
+                template_only = True
+            else:
+                # otherwise rewrite the service name with the default instance
+                service = self.unit.replace("@.", "@{}.".format(default_instance))
 
-            service = self.unit.replace("@.",
-                                        "@{}.".format(default_instance))
-        else:
-            service = self.unit
-
-        self._process_deps(config, service, path, 'WantedBy', 'wants')
-        self._process_deps(config, service, path, 'RequiredBy', 'requires')
+        self._process_deps(config, service, path, 'WantedBy', 'wants',
+                           template_only)
+        self._process_deps(config, service, path, 'RequiredBy', 'requires',
+                           template_only)
 
         try:
             for also in config.get('Install', 'Also'):
-- 
2.47.3


