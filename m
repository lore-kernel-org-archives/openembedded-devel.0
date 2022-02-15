Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39383C433FE
	for <webhook@archiver.kernel.org>; Tue, 15 Feb 2022 09:17:13 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.7384.1644916623436540210
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Feb 2022 01:17:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 21F9H1s9011489
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Feb 2022 01:17:01 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 15 Feb 2022 01:17:00 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 15 Feb 2022 01:17:00 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] plymouth: Add the retain-splash option
Date: Tue, 15 Feb 2022 17:16:59 +0800
Message-ID: <20220215091659.37326-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.wrs.com id
 21F9H1s9011489
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Feb 2022 09:17:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95315

From: Mingli Yu <mingli.yu@windriver.com>

Adding the "retain-splash=E2=80=9D option to tell plymouth to keep the bo=
ot
splash=E2=80=99s contents on screen even after plymouth exits to make the
splash screen show more friendly on the system which boots so fast.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...lymouth-Add-the-retain-splash-option.patch | 35 +++++++++++++++++++
 .../recipes-core/plymouth/plymouth_0.9.5.bb   |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-core/plymouth/files/0001-plymouth-Add=
-the-retain-splash-option.patch

diff --git a/meta-oe/recipes-core/plymouth/files/0001-plymouth-Add-the-re=
tain-splash-option.patch b/meta-oe/recipes-core/plymouth/files/0001-plymo=
uth-Add-the-retain-splash-option.patch
new file mode 100644
index 000000000..09876d781
--- /dev/null
+++ b/meta-oe/recipes-core/plymouth/files/0001-plymouth-Add-the-retain-sp=
lash-option.patch
@@ -0,0 +1,35 @@
+From f270f80d4c36a22a0f7b8de8fb6b1abef6f7b183 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Tue, 15 Feb 2022 16:23:10 +0800
+Subject: [PATCH] plymouth : Add the retain-splash option
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Adding the "retain-splash=E2=80=9D option to tell plymouth to keep the b=
oot
+splash=E2=80=99s contents on screen even after plymouth exits to make th=
e
+splash screen show more friendly on the system which boots so fast.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/plymouth/plym=
outh/-/merge_requests/157]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ systemd-units/plymouth-quit.service.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/systemd-units/plymouth-quit.service.in b/systemd-units/plym=
outh-quit.service.in
+index ed9f9b9..147e9ee 100644
+--- a/systemd-units/plymouth-quit.service.in
++++ b/systemd-units/plymouth-quit.service.in
+@@ -3,7 +3,7 @@ Description=3DTerminate Plymouth Boot Screen
+ After=3Drc-local.service plymouth-start.service systemd-user-sessions.s=
ervice
+=20
+ [Service]
+-ExecStart=3D-@PLYMOUTH_CLIENT_DIR@/plymouth quit
++ExecStart=3D-@PLYMOUTH_CLIENT_DIR@/plymouth quit --retain-splash
+ Type=3Doneshot
+ RemainAfterExit=3Dyes
+ TimeoutSec=3D20
+--=20
+2.17.1
+
diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.5.bb b/meta-oe/re=
cipes-core/plymouth/plymouth_0.9.5.bb
index 8f9997e96..7d76ab76f 100644
--- a/meta-oe/recipes-core/plymouth/plymouth_0.9.5.bb
+++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.5.bb
@@ -22,6 +22,7 @@ SRC_URI =3D " \
     file://0001-Make-full-path-to-systemd-tty-ask-password-agent-con.pat=
ch \
     file://0001-systemd-switch-to-KillMode-mixed.patch \
     file://0001-plymouth-start-service-in-add-related-kernel-paramet.pat=
ch \
+    file://0001-plymouth-Add-the-retain-splash-option.patch \
         "
=20
 SRC_URI[md5sum] =3D "8a25d23f3ae732af300a56fa33cacff2"
--=20
2.17.1


