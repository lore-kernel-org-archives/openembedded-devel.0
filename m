Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD57AC433EF
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 06:11:37 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web09.286.1643004691556967909
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Jan 2022 22:11:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 20O6BUQ1005616
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Jan 2022 22:11:30 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 20O6BTwB001275
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Jan 2022 22:11:30 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 23 Jan 2022 22:11:29 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 23 Jan 2022 22:11:28 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH v2] plymouth: switch to KillMode=mixed
Date: Mon, 24 Jan 2022 14:11:27 +0800
Message-ID: <20220124061127.40621-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <16CD1F25F9E3C646.15117@lists.openembedded.org>
References: <16CD1F25F9E3C646.15117@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jan 2022 06:11:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95028

From: Mingli Yu <mingli.yu@windriver.com>

KillMode=none is deprecated, so we need to stop using it [1].

For now, use `KillMode=mixed` and `IgnoreOnIsolate=true` instead.

In the future, we should change plymouth to be able to exit and
start again without restarting the active animation, but that's
going to require some effort.

[1] https://gitlab.freedesktop.org/plymouth/plymouth/-/issues/123

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...001-systemd-switch-to-KillMode-mixed.patch | 43 +++++++++++++++++++
 .../recipes-core/plymouth/plymouth_0.9.5.bb   |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-core/plymouth/files/0001-systemd-switch-to-KillMode-mixed.patch

diff --git a/meta-oe/recipes-core/plymouth/files/0001-systemd-switch-to-KillMode-mixed.patch b/meta-oe/recipes-core/plymouth/files/0001-systemd-switch-to-KillMode-mixed.patch
new file mode 100644
index 000000000..eb1c8db21
--- /dev/null
+++ b/meta-oe/recipes-core/plymouth/files/0001-systemd-switch-to-KillMode-mixed.patch
@@ -0,0 +1,43 @@
+From 9d0f8b2e7bc2d1d2b0900fcdf119bb9a2cc4f474 Mon Sep 17 00:00:00 2001
+From: Ray Strode <rstrode@redhat.com>
+Date: Tue, 25 Aug 2020 10:49:11 -0400
+Subject: [PATCH] systemd: switch to KillMode=mixed
+
+KillMode=none is deprecated, so we need to stop using it.
+
+For now, use `KillMode=mixed` and `IgnoreOnIsolate=true` instead.
+
+In the future, we should change plymouth to be able to exit and
+start again without restarting the active animation, but that's
+going to require some effort.
+
+https://gitlab.freedesktop.org/plymouth/plymouth/-/issues/123
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/plymouth/plymouth/-/commit/9d0f8b2e7bc2d1d2b0900fcdf119bb9a2cc4f474]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ systemd-units/plymouth-start.service.in | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/systemd-units/plymouth-start.service.in b/systemd-units/plymouth-start.service.in
+index 3d00cc6..830a62d 100644
+--- a/systemd-units/plymouth-start.service.in
++++ b/systemd-units/plymouth-start.service.in
+@@ -6,11 +6,12 @@ After=systemd-vconsole-setup.service systemd-udev-trigger.service systemd-udevd.
+ Before=systemd-ask-password-plymouth.service
+ ConditionKernelCommandLine=!plymouth.enable=0
+ ConditionVirtualization=!container
++IgnoreOnIsolate=true
+ 
+ [Service]
+ ExecStart=@PLYMOUTH_DAEMON_DIR@/plymouthd --mode=boot --pid-file=@plymouthruntimedir@/pid --attach-to-session
+ ExecStartPost=-@PLYMOUTH_CLIENT_DIR@/plymouth show-splash
+ Type=forking
+ RemainAfterExit=yes
+-KillMode=none
++KillMode=mixed
+ SendSIGKILL=no
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.5.bb b/meta-oe/recipes-core/plymouth/plymouth_0.9.5.bb
index e5d8c9819..d096462ee 100644
--- a/meta-oe/recipes-core/plymouth/plymouth_0.9.5.bb
+++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.5.bb
@@ -20,6 +20,7 @@ RPROVIDES:${PN} = "virtual-psplash virtual-psplash-support"
 SRC_URI = " \
     http://www.freedesktop.org/software/plymouth/releases/${BPN}-${PV}.tar.xz \
     file://0001-Make-full-path-to-systemd-tty-ask-password-agent-con.patch \
+    file://0001-systemd-switch-to-KillMode-mixed.patch \
         "
 
 SRC_URI[md5sum] = "8a25d23f3ae732af300a56fa33cacff2"
-- 
2.17.1


