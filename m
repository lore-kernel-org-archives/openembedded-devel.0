Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3590CC88E41
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 04:56:40 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32460.1789102593683430950
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 21:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FzREMx0V;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: alistair23@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d944747d41so5918595ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 21:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789102593; x=1789707393; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rwLwJMCd6/Lef+TeF/ik8F56fLpuDGcvP4a3oIkKwy0=;
        b=FzREMx0VPaZ2mmOZjId1w9kTnpoFvoSUYWJRQnPw1cFgkagxPP3M/XW5Kg/t/j/XaI
         JWYrYgaVSwhpFDL0cxYtei6F21rVQty97rMcTv+uui3dzpFo2IfpmrzVDsEjJCj8S6NW
         zQ9g09K2Aoy7yCene2aZSfQLoGJSgJMlx2qc3ntwi3bfmIXdgheKGe5Q5Pqtbr6RpM6m
         wThjYDzEmn/juAZZAbdtOll6o/1EdO0J6bUoVr/g82M/JXhdeLXxISAUt3AN/CrsiJmI
         CH5UHzN1SKeuQP9+9QLgKOFCTwIIrxNPBNTyTPPSk5L6fy0+S+qIU9KVEe8zqtghOwOO
         RZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789102593; x=1789707393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rwLwJMCd6/Lef+TeF/ik8F56fLpuDGcvP4a3oIkKwy0=;
        b=EGxw30M8AMQJEZQXCe3QTnYIipYOuAnx6GWtWYSsNSTWawXiPknNK4lZQFNq9uqyOe
         phMWKQctEMhfjS7UtrHhX393WEolc5Hsjl2MTU96Vu/zjJ2ncT/8spKNpevRRhnc/upH
         5OTT0UI25Q3tJ2IaXweFIYZO0/UU4bAW3RuOODbt4ayN5CXTB6GbdHMmZGY8h9VispXQ
         tAibD9lFjG/ItwAc5J5UBFDp7EreiOwFOolPNdg/fk9/du98I1V2KgKcrtPbTUkIXQzY
         U2wjN8gQBNuGQCkg39fZe3f90rv6vkD72p3/RFGatw954U5k9fMikz8CObqqbtcoOs1V
         MEog==
X-Gm-Message-State: AFuF++kjU5AXzH/DS9VafAJcPY5zYF48H0dM0OPrEoWHFbPd3xUiT9j7
	XbpAcxMiuSq0Y3p57AgkIT26auiAlo0YH2neMnp/vfS6JOoEnQ0iBmuNxM3D6A==
X-Gm-Gg: AYBFou3iskfpnZkXZ18O14LW+nYsYhPbPyfeGWPinX0NpbxDwUN2iswdyMWum6mgl33
	058n/vRXvfGDQxwZI8rrywL4JZ43/wu7d9X2kL5n829dSPdPTsIBaNQwzykez2WXhM86XXyBvjC
	jK4jnrc+BsWvYYS7yXwA0uFZcVOZySmuHKKPP80flPxNHi69vUumD2SR4QNgLxIgZsfXxQkNaJ7
	+Uvxw5Q7sSvOZKJRNAsWcCiM0d6vehM2Q3cN81J3iPrqDwrUkGZvJefYyCi9Fg+6BEkzPmuLMf2
	TEAJbWqOVVEHg19sXpL0qK2Zj6ykx8Hi7rDj1zWBqqToNlcTqLNO7/U3LSDcWgLAU58WuVKwE+r
	dt283BW5dJGygMJkhYWzUFKZ4SJXV0/xduoAhpnXOA3h7pIGBK7qMKh1wz6AyIPV7AKkk4blpRb
	HQl6SRCX1h0dpu1ZkudjQ7le/UCj9OnkDbvyq2SgBiHJ+gBY5JtV31zyt/BisPcpb0wSFVRJPiK
	Dh+hZkUc3bniA5V
X-Received: by 2002:a17:90b:57c5:b0:38e:9045:bac0 with SMTP id 98e67ed59e1d1-39d9bc1b0eemr4018411a91.5.1789102592792;
        Thu, 10 Sep 2026 21:56:32 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm2874736a91.12.2026.09.10.21.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 21:56:32 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: openembedded-devel@lists.openembedded.org
Cc: alistair@alistair23.me,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [meta-filesystems][PATCH] tcmu-runner: Initial commit
Date: Fri, 11 Sep 2026 14:56:24 +1000
Message-ID: <20260911045624.4072516-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 04:56:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129952

From: Alistair Francis <alistair.francis@wdc.com>

Initial support for verion 1.6.0 of tcmu-runner.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../tcmu-runner/tcmu-runner_1.6.0.bb          | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner_1.6.0.bb

diff --git a/meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner_1.6.0.bb b/meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner_1.6.0.bb
new file mode 100644
index 0000000000..c851bb10f7
--- /dev/null
+++ b/meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner_1.6.0.bb
@@ -0,0 +1,33 @@
+SUMMARY = "A daemon that handles the userspace side of the LIO TCM-User backstore"
+LICENSE = "Apache-2.0 OR LGPLv2.1"
+LIC_FILES_CHKSUM = " \
+	file://LICENSE.LGPLv2.1;md5=a7ef827a98fa240d37910ac4e8ce3f53 \
+	file://LICENSE.Apache2;md5=6c4db32a2fa8717faffa1d4f10136f47 \
+	"
+
+SRCREV = "1bdb239fa183c84d2ace6b52aa33476968a0cef7"
+
+SRC_URI = "git://github.com/open-iscsi/tcmu-runner.git;protocol=https;branch=main"
+
+inherit cmake pkgconfig systemd
+
+DEPENDS = "gtk4 libnl gperftools glib-2.0-native"
+
+EXTRA_OECMAKE = "-DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
+		 -Dwith-rbd=false \
+		 -Dwith-glfs=false \
+                "
+
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+
+PACKAGECONFIG[systemd] = "-DSUPPORT_SYSTEMD=ON,,"
+
+SYSTEMD_SERVICE:${PN} = "tcmu-runner.service"
+SYSTEMD_AUTO_ENABLE = "enable"
+
+FILES:${PN} += " \
+    ${systemd_user_unitdir}/lib \
+    ${systemd_user_unitdir}/tcmu-runner \
+    ${systemd_system_unitdir}/tcmu-runner.service \
+    ${datadir}/dbus-1 \
+"
-- 
2.55.0


