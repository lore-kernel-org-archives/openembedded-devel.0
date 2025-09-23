Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C46CAC5B1
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:07:01 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.14111.1758625611683673722
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X226phfV;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b3194020e86so13557666b.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 04:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758625610; x=1759230410; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bIPIe0LKS/I5r7tmG08D77v05xNa1i87dyQgA1Z9IZU=;
        b=X226phfVm2kexi4E6w31i07b1gfYVnU1nM2x/4JEiwbLU0B+aiOIi67RzAYl2yH8/Z
         uVtxhtYm8G+AbugfaYqxf08cAMD1xGV+w/asfP9rKGjQnYAUyi1XTmpJdShJrZrJHPmc
         7aM9H4lFxCxHtspF6HLmpf0kzzzC38PL+nyYOTEfb0eeKkhCbR66G+RZFKB78fGUWQ2z
         nAKXCJ5Oh+acIzBZB6cCdADXizF9Pi0wNjGA/0NFr2TZ3d4InRj8f4atzQv089b03V5D
         LJPu1YAWmNIHSTycls0ts5xNLUrdc97pLF1DhaQGn6H3KaxOwrlN09IYmvBFcBprPNO7
         tuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758625610; x=1759230410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bIPIe0LKS/I5r7tmG08D77v05xNa1i87dyQgA1Z9IZU=;
        b=kr82PAvRthe5w3zNiPnXoP+o6t/qpYWj2GEDfeUo3I2wdYAdSG1OhL8j+BCnzg4szE
         p80g9qk+cWvseO6rpfxbArRMtDlg8urIcmz91rI/thr7JmUfuq+2keRKNVfcJKt9i50u
         qo3MTSpiQcgz+toLL/1+P8xPFuAlG9fLg/xsB3R0NzfJ5hAiF1DOF2mPi6NLcNvZ6ajS
         k9rEcWOwcfVqWJgusQ/SqLBOdT01RMi3TVHNGtcBVp/d2dSiFONXzKq2239l9X3Yw34i
         KjXckyJo+8U1Gxc215wGmGsWRRrV8lmVSFaWbW4tYvXMcXn9yJ+UvukWbPv6jatHbhhn
         vTyw==
X-Gm-Message-State: AOJu0Yz7Auq/9VtSUacLSvtMp82vykD9WJQVLmCGFwUrSRIeZk0NdF38
	6GO8nWXDgoFYbt72x/L8voyGv8Lm+VjhjafL6Ob3orDUyj+LXu06kxdRbx9z6w==
X-Gm-Gg: ASbGncspV8snp+hWnDw0Yw+2WjSPVlgB75XKa1B2mma54Z2nynquDfGsZmQqDbObpdZ
	Ca8I6T+Nxfb0G6+GOd3trRY8NspOS4wQUVLVt3nqX8yXRVfTBLaAhQztOSMhglm2JfoEYXmf4fu
	J2EpYPYy/V7NVBycCTNwKAouiipfOt/+flWVX/ImTZx/LXycQS5c35WZmIzr2b5lkfoEQHVjCDA
	byOQKRNBZrq706T0JVTOxrzsH06o+jxgGRVQz0SGrLTmVHkjBE9NfnCHc5GHnZIJaeQ/bNP8gZI
	d86qBQJNno4WCEBvgA6he1UaygN3GsXieGFRnYX8jVRDJbDtgCGASuAMPDlajPIbI/A562xXN9O
	77sptsFMiCn9BPBQpHvmE
X-Google-Smtp-Source: AGHT+IH50lozUXT5pdVBSw3Nm/A6RCiyZ01W3LTgjDUsEYWIvf5dVeYA7kTdXtvT2s/REo2wT6M54A==
X-Received: by 2002:a17:907:1ca5:b0:aff:9906:e452 with SMTP id a640c23a62f3a-b302ab33e68mr237125766b.31.1758625609904;
        Tue, 23 Sep 2025 04:06:49 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b293fa07816sm709263166b.50.2025.09.23.04.06.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:06:49 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 19/22] libtimezonemap: correct package version
Date: Tue, 23 Sep 2025 13:06:33 +0200
Message-ID: <20250923110636.3413021-20-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923110636.3413021-1-skandigraun@gmail.com>
References: <20250923110636.3413021-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:07:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119683

From: Changqing Li <changqing.li@windriver.com>

correct the package version in configure.ac

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit adf3de70b24092ff3fe618cde3fee7226fb26522)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...001-configure.ac-correct-the-version.patch | 29 +++++++++++++++++++
 .../libtimezonemap/libtimezonemap_0.4.6.bb    |  3 +-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/libtimezonemap/files/0001-configure.ac-correct-the-version.patch

diff --git a/meta-gnome/recipes-gnome/libtimezonemap/files/0001-configure.ac-correct-the-version.patch b/meta-gnome/recipes-gnome/libtimezonemap/files/0001-configure.ac-correct-the-version.patch
new file mode 100644
index 0000000000..0538bc3e5c
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libtimezonemap/files/0001-configure.ac-correct-the-version.patch
@@ -0,0 +1,29 @@
+From 915bc44d9f243075d084238c72089a346036388c Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 29 May 2025 10:08:21 +0800
+Subject: [PATCH] configure.ac: correct the version
+
+The source is here:
+https://salsa.debian.org/cinnamon-team/libtimezonemap
+
+Upstream-Status: Pending [ register account rejected ]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3f74dae..24eb0e5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1,5 +1,5 @@
+ AC_INIT([libtimezonemap],
+-        [0.4.4],
++        [0.4.6],
+         [http://bugs.launchpad.net/libtimezonemap],
+         [libtimezonemap],
+         [http://launchpad.net/libtimezonemap])
+-- 
+2.34.1
+
diff --git a/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb b/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb
index bafe7af040..3f37890e8d 100644
--- a/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb
+++ b/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb
@@ -4,7 +4,8 @@ SECTION = "devel/lib"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/libt/${BPN}/${BPN}_${PV}.orig.tar.gz;downloadfilename=${BP}.tar.gz"
+SRC_URI = "${DEBIAN_MIRROR}/main/libt/${BPN}/${BPN}_${PV}.orig.tar.gz;downloadfilename=${BP}.tar.gz \
+           file://0001-configure.ac-correct-the-version.patch"
 SRC_URI[sha256sum] = "0d634cc2476d8f57d1ee1864bd4f442180ae4bf040a9ae4bf73b66bbd85d7195"
 
 DEPENDS = "gtk+3 gdk-pixbuf libsoup-2.4 json-glib gnome-common-native"

