Return-Path: <Tillmann.Severin@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE635C88E40
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 15:02:05 +0000 (UTC)
Received: from esa11.hc324-48.eu.iphmx.com (esa11.hc324-48.eu.iphmx.com [207.54.69.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16470.1789052516199880186
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 08:01:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=ZlUBhYEJ;
 spf=permerror, err=parse error for token &{10 18 256wvd6dc.spf.checkpoint-spf.com}: parse error for token &{10 18 %{ir}.256wvd6dc.spf.checkpoint-spf.com}: invalid domain name (domain: bmw.de, ip: 207.54.69.30, mailfrom: prvs=706a5d13d=tillmann.severin@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1789052520; x=1820588520;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=O1G8i22S8cwIPubEUQP7KLggyFN9ouRtUQQ0Ed3hCms=;
  b=ZlUBhYEJ5cGaA8JwKJMRxkhYF2963PEka4H1QM4WolTWrlmXFcVdd6nW
   TnkN2ldaGrbFf2E1miK5fha5pbb/f030u4DcNQ/5z6E3KNhtDOMUjtggv
   7AAcix80F+zOqboCrAocbg7s5BMWpmtD0RtVbOrXUMux/vQfzklf1yDx1
   o=;
X-CSE-ConnectionGUID: Y2y3v9a/QXmds4Lko/sTUA==
X-CSE-MsgGUID: hHsEy3WXQ3+WnhPvUk7RdQ==
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa11.hc324-48.eu.iphmx.com with ESMTP/TLS; 10 Sep 2026 17:01:58 +0200
Received: from unknown (HELO esabb4.muc) ([10.31.187.135]) by esagw2.muc with
 ESMTP/TLS; 10 Sep 2026 17:01:53 +0200
Received: from smucmp21a.bmwgroup.net (HELO smucmp21a.europe.bmw.corp)
 ([10.100.172.92]) by esabb4.muc with ESMTP/TLS; 10 Sep 2026 17:01:54 +0200
Received: from localhost.localdomain (10.30.85.209) by smucmp21a.europe.bmw.corp
 (2a03:1e80:a01:524::1:44) with Microsoft SMTP Server (version=TLS;
 Thu, 10 Sep 2026 17:01:53 +0200
X-CSE-ConnectionGUID: WqZ+y17iTOu5iM1B6SjJ9A==
X-CSE-MsgGUID: OG92bJ7QR3mYMUw4HrF4yg==
X-CSE-ConnectionGUID: Cv3isMqTQImDI96WkJe0vw==
X-CSE-MsgGUID: cL04UwYaQviuMYh/1PKjCw==
From: Tillmann Severin <tillmann.severin@bmw.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Tillmann Severin <tillmann.severin@bmw.de>
Subject: [meta-oe][PATCH] polkit: Add a separate package for polkit systemd service/dbus config
Date: Thu, 10 Sep 2026 17:01:43 +0200
Message-ID: <20260910150143.2155047-1-tillmann.severin@bmw.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp17h.europe.bmw.corp (2a03:1e80:a15:58f::1:54) To
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 15:02:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129914

Creates a separate package for the polkit systemd
service, such that other implementations for polkit
could be used instead of polkit on systemd enabled
systems, while still keeping polkit available. This
is especially helpful for software that depends on
polkit or its libraries etc, e.g. udisks2.

Also package dbus configuration into an own package

Signed-off-by: Tillmann Severin <tillmann.severin@bmw.de>
---
 meta-oe/recipes-extended/polkit/polkit_127.bb | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/polkit/polkit_127.bb b/meta-oe/recipes-extended/polkit/polkit_127.bb
index f97c6efbf7..c0a301c8b0 100644
--- a/meta-oe/recipes-extended/polkit/polkit_127.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_127.bb
@@ -35,9 +35,26 @@ PACKAGECONFIG[libs-only] = "-Dlibs-only=true,-Dlibs-only=false"
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM:${PN} = "--system --no-create-home --user-group --home-dir ${sysconfdir}/${BPN}-1 --shell /bin/nologin polkitd"
 
-SYSTEMD_SERVICE:${PN} = "${BPN}.service"
+# Package the systemd service into a separate package to be able
+# to exclude the polkit service in favor of alternative implementations
+SYSTEMD_PACKAGES += "${PN}-service"
+SYSTEMD_SERVICE:${PN}-service = "${BPN}.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
+PACKAGES =+ "${PN}-service"
+RDEPENDS:${PN}-service += "polkit"
+FILES:${PN}-service += " \
+    ${systemd_system_unitdir} \
+    ${sysconfdir}/systemd/system/polkit-virtual-provider.service \
+"
+
+# Package also the dbus configuration into a separate package
+PACKAGES =+ "${PN}-dbus"
+RDEPENDS:${PN}-dbus += "polkit"
+FILES:${PN}-dbus += "\
+    ${datadir}/dbus-1 \
+"
+
 do_install:append() {
 	#Fix up permissions on polkit rules.d to work with rpm4 constraints
 	if ${@bb.utils.contains('PACKAGECONFIG', 'libs-only', 'false', 'true', d)}; then
-- 
2.43.0


