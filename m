Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 967B8C433EF
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 02:59:53 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web11.2251.1643079592513191010
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jan 2022 18:59:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 20P2xoK7016911
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jan 2022 18:59:50 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 20P2xn3A029578
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jan 2022 18:59:50 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 24 Jan 2022 18:59:49 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 24 Jan 2022 18:59:49 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 24 Jan 2022 18:59:48 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] lxdm: remove conflicts setting
Date: Tue, 25 Jan 2022 10:59:48 +0800
Message-ID: <20220125025948.21599-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jan 2022 02:59:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95048

From: Mingli Yu <mingli.yu@windriver.com>

When use plymouth[1] with lxdm, the plymouth boot splash screen
will hang there as lxdm.service conflicts with plymouth-quit.service
and plymouth-quit will fail to start if plymouth-quit.service and
lxdm.service start at the same time and it will result in the boot
screen hang forever.

Consider there is also After setting for these two services, so
remove the conflicts setting to make the service start as expected.

[1] https://gitlab.freedesktop.org/plymouth/plymouth/-/tree/main

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...rvice-remove-plymouth-quit-conflicts.patch | 38 +++++++++++++++++++
 meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb   |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/0001-systemd-lxdm.service-remove-plymouth-quit-conflicts.patch

diff --git a/meta-oe/recipes-graphics/lxdm/lxdm/0001-systemd-lxdm.service-remove-plymouth-quit-conflicts.patch b/meta-oe/recipes-graphics/lxdm/lxdm/0001-systemd-lxdm.service-remove-plymouth-quit-conflicts.patch
new file mode 100644
index 000000000..7ec073b08
--- /dev/null
+++ b/meta-oe/recipes-graphics/lxdm/lxdm/0001-systemd-lxdm.service-remove-plymouth-quit-conflicts.patch
@@ -0,0 +1,38 @@
+From f662906c52f264e4c139e402932103f47269aa1b Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Mon, 24 Jan 2022 17:16:15 +0800
+Subject: [PATCH] systemd/lxdm.service: remove plymouth-quit conflicts
+
+When use plymouth[1] with lxdm, the plymouth boot splash screen
+will hang there as lxdm.service conflicts with plymouth-quit.service
+and plymouth-quit will fail to start if plymouth-quit.service and
+lxdm.service start at the same time and it will result in the boot
+screen hang forever.
+
+Consider there is also After setting for these two services, so
+remove the conflicts setting to make the service start as expected.
+
+[1] https://gitlab.freedesktop.org/plymouth/plymouth/-/tree/main
+
+Upstream-Status: Submitted [https://sourceforge.net/p/lxdm/code/merge-requests/3]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ systemd/lxdm.service | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/systemd/lxdm.service b/systemd/lxdm.service
+index bf4a0a8..90d8cdb 100644
+--- a/systemd/lxdm.service
++++ b/systemd/lxdm.service
+@@ -1,6 +1,6 @@
+ [Unit]
+ Description=LXDE Display Manager
+-Conflicts=getty@tty1.service plymouth-quit.service
++Conflicts=getty@tty1.service
+ After=systemd-user-sessions.service getty@tty1.service plymouth-quit.service
+ 
+ [Service]
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb b/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
index 2a8a8859b..a0c86223e 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
+++ b/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
@@ -18,6 +18,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}%20${PV}/${BPN}-${PV}.tar.
            file://0007-greeter.c-support-to-update-expired-password.patch \
            file://0008-greeter.c-show-information-on-gtk-label-info.patch \
            file://0009-greeter.c-disallow-empty-new-password.patch \
+           file://0001-systemd-lxdm.service-remove-plymouth-quit-conflicts.patch \
            "
 SRC_URI[md5sum] = "061caae432634e6db38bbdc84bc6ffa0"
 SRC_URI[sha256sum] = "4891efee81c72a400cc6703e40aa76f3f3853833d048b72ec805da0f93567f2f"
-- 
2.17.1


