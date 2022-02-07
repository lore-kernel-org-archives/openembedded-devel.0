Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 958A8C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 07:34:24 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.19314.1644219263113125870
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Feb 2022 23:34:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 2177YLoW026620
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 6 Feb 2022 23:34:21 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 2177YKkW010387
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 6 Feb 2022 23:34:21 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 6 Feb 2022 23:34:20 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 6 Feb 2022 23:34:20 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] plymouth: add extra kernel parameter
Date: Mon, 7 Feb 2022 15:34:19 +0800
Message-ID: <20220207073419.19935-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Feb 2022 07:34:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95237

From: Mingli Yu <mingli.yu@windriver.com>

Add extra kernel parameter to make sure the plymouth splash
screen display during boot.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...ervice-in-add-related-kernel-paramet.patch | 31 +++++++++++++++++++
 .../recipes-core/plymouth/plymouth_0.9.5.bb   |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-core/plymouth/files/0001-plymouth-start-service-in-add-related-kernel-paramet.patch

diff --git a/meta-oe/recipes-core/plymouth/files/0001-plymouth-start-service-in-add-related-kernel-paramet.patch b/meta-oe/recipes-core/plymouth/files/0001-plymouth-start-service-in-add-related-kernel-paramet.patch
new file mode 100644
index 000000000..7ba1034e9
--- /dev/null
+++ b/meta-oe/recipes-core/plymouth/files/0001-plymouth-start-service-in-add-related-kernel-paramet.patch
@@ -0,0 +1,31 @@
+From 658eac007d14d836cb002a5675487bac63d50324 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Mon, 7 Feb 2022 03:22:12 +0000
+Subject: [PATCH] plymouth-start.service.in: add related kernel parameter
+
+Add extra kernel parameter to make the plymouth splash screen
+display during boot.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/plymouth/plymouth/-/merge_requests/156]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ systemd-units/plymouth-start.service.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/systemd-units/plymouth-start.service.in b/systemd-units/plymouth-start.service.in
+index 830a62d..c20aabe 100644
+--- a/systemd-units/plymouth-start.service.in
++++ b/systemd-units/plymouth-start.service.in
+@@ -9,7 +9,7 @@ ConditionVirtualization=!container
+ IgnoreOnIsolate=true
+ 
+ [Service]
+-ExecStart=@PLYMOUTH_DAEMON_DIR@/plymouthd --mode=boot --pid-file=@plymouthruntimedir@/pid --attach-to-session
++ExecStart=@PLYMOUTH_DAEMON_DIR@/plymouthd --mode=boot  --kernel-command-line="splash plymouth.ignore-serial-consoles" --pid-file=@plymouthruntimedir@/pid --attach-to-session
+ ExecStartPost=-@PLYMOUTH_CLIENT_DIR@/plymouth show-splash
+ Type=forking
+ RemainAfterExit=yes
+-- 
+2.31.1
+
diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.5.bb b/meta-oe/recipes-core/plymouth/plymouth_0.9.5.bb
index d096462ee..8f9997e96 100644
--- a/meta-oe/recipes-core/plymouth/plymouth_0.9.5.bb
+++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.5.bb
@@ -21,6 +21,7 @@ SRC_URI = " \
     http://www.freedesktop.org/software/plymouth/releases/${BPN}-${PV}.tar.xz \
     file://0001-Make-full-path-to-systemd-tty-ask-password-agent-con.patch \
     file://0001-systemd-switch-to-KillMode-mixed.patch \
+    file://0001-plymouth-start-service-in-add-related-kernel-paramet.patch \
         "
 
 SRC_URI[md5sum] = "8a25d23f3ae732af300a56fa33cacff2"
-- 
2.17.1


