Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE8E3FEE4FE
	for <webhook@archiver.kernel.org>; Sat, 28 Feb 2026 20:24:41 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.126390.1772310273664200079
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Feb 2026 12:24:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g4W4dQCb;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4806bf39419so30486005e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 12:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772310272; x=1772915072; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ADcRQsqOCwCbCZLFPN2Sai7OeRw2whI59Lc/LhVmzB0=;
        b=g4W4dQCbQ1N6TKvJGYnubP98S/AJiZgyjxZ80P2sRrHubcItcBNilBA5z1r7CDATCg
         1bZ9eu6PBrhbEBOSiPxfuEdUeFprS82kS6yoaG/cjAw1qX5qqAOBkHZYFsB+vI60WHIk
         CTnKKR/Ad2jInzEFAmrrHxZp01B0D3MvoOJPzqNN4JxDfM0fJVeNsLIO4nhJovi9WbzR
         5//c51DRBHCAapQ4JPHiLEFdDjD4WjM+6sFxU4ko3FtfYgq2LkfhNOsT5d/B3fFN82IV
         S5uX0cG1ph/Z0wvI7ad56UzibYHHSLrs5sYXvw4ErbzxfkMay/kC4XdP3O7+3NxDr2xR
         DJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772310272; x=1772915072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ADcRQsqOCwCbCZLFPN2Sai7OeRw2whI59Lc/LhVmzB0=;
        b=acHxjkgWu6S8SaP5jaZwMUk8kj4vmHSUdRgirMOnSetj5UrEst5zx2pREE3UpRaY9E
         DxX4O+irRgiSg+QTxwG8np+3WI87YGzFZ1S0CDjg6wrwprnGJU13lcIpdGhI6L/QB2LG
         euZOO/vqpvqSIEgjXtlWXXXcDwHkUxOpPQ4HGq5cgUyQ7c5e8ef+YUo1WtILo12lg9/4
         KARmgAis6eiw5LvtE25LXaShQEbwt2JwlDzjPDaG8x8xbaQaM/MZAdgxMWMCPmeTdr6q
         0zmiDeUs1q08b1sUTPTU02bHQHyMth2vYvBvXtL6qDuMOFB4naWEMBTpOJ6M2SVYz/Ht
         IUmw==
X-Gm-Message-State: AOJu0Yx2gL+7eiuHQlScbXjREPgLsbQM2QsX9YmenrKQhJa4CHETlEsA
	o9FC4/ozaaicNl/fTQkofulh0RFOvEml6OhOtveGX3mwwpHs2c0jPn6AfUyE1w==
X-Gm-Gg: ATEYQzxeC5kHGxWk+keYxciMB+BRciQqL9Vr65Z3v7lPzviulhdBucW0SaUq9VRMgr4
	QEA59jeJAcGkDGcJWSMoP1ZJ3fZ7AT2ngdR0ydjX07a/IYLPtRBWTDAg/V4iUtDOdNYQS8fbQcd
	DXCBKNL/dff/Gry1dQFANg+D/sMR4Oqo5x1FFp013eiezVWKMOKG3jraKFCMgIwEnNxyLg5twOW
	5VO//QRbwznD8Yyi1uWCYMYoDHUeDsHOGOo4dtJJrbccLOJO4lv542hRK2cg3K1hfQjppRFFmc6
	GMCu1Aky8xNAF7BxSUA9347qnu5b26SRvgujN+Pvo/S/PJo/EiCVlE6hn9+weYZQQRH+CJRzEBJ
	y0vcGXqlCygqNz1LgajZfIprFRMOdF4hnU1JahxzjMMKmlhLvDTW5n06rLh3tBNnxQ2iRy5+1fe
	1Cj+zGBN9cyxCybCT8nA0yOQVOjv+PKDA=
X-Received: by 2002:a05:600c:4e15:b0:483:29f4:26b3 with SMTP id 5b1f17b1804b1-483c9906a11mr132134745e9.1.1772310271898;
        Sat, 28 Feb 2026 12:24:31 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb776b0sm94889995e9.1.2026.02.28.12.24.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 12:24:30 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 2/5] exiv2: patch CVE-2021-37618
Date: Sat, 28 Feb 2026 21:24:26 +0100
Message-ID: <20260228202429.2424513-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260228202429.2424513-1-skandigraun@gmail.com>
References: <20260228202429.2424513-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 20:24:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124785

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-37618

Pick the patch from the PR that is referenced by the NVD advisory.

Note that the regression test was not backported, because it contains
a binary patch, that I couldn't apply with any of the patchtools
in the do_patch step. Before submission however I have applied the
patches, and ran all the tests successfully.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../exiv2/exiv2/CVE-2021-37618.patch          | 32 +++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37618.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37618.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37618.patch
new file mode 100644
index 0000000000..8799876232
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37618.patch
@@ -0,0 +1,32 @@
+From 37e0d4dac7c8b1a9e01448c359bf013ead53904a Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Mon, 5 Jul 2021 10:40:03 +0100
+Subject: [PATCH] Better bounds checking in Jp2Image::printStructure
+
+CVE: CVE-2021-37618
+Upstream-Status: Backport [https://github.com/Exiv2/exiv2/commit/0fcdde80997913dde284ea98f06f9305d06cb160]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/jp2image.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/jp2image.cpp b/src/jp2image.cpp
+index e14919c..2da69f1 100644
+--- a/src/jp2image.cpp
++++ b/src/jp2image.cpp
+@@ -538,6 +538,7 @@ static void boxes_check(size_t b,size_t m)
+ 
+                             if (subBox.type == kJp2BoxTypeColorHeader) {
+                                 long pad = 3;  // don't know why there are 3 padding bytes
++                                enforce(data.size_ >= pad, kerCorruptedMetadata);
+                                 if (bPrint) {
+                                     out << " | pad:";
+                                     for (int i = 0; i < 3; i++)
+@@ -547,6 +548,7 @@ static void boxes_check(size_t b,size_t m)
+                                 if (bPrint) {
+                                     out << " | iccLength:" << iccLength;
+                                 }
++                                enforce(iccLength <= data.size_ - pad, kerCorruptedMetadata);
+                                 if (bICC) {
+                                     out.write((const char*)data.pData_ + pad, iccLength);
+                                 }
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
index 83110b1e0e..3d41bc93b2 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
@@ -24,6 +24,7 @@ SRC_URI = "https://github.com/Exiv2/${BPN}/releases/download/v${PV}/${BP}-Source
            file://CVE-2021-34335-2.patch \
            file://CVE-2021-37615-1.patch \
            file://CVE-2021-37615-2.patch \
+           file://CVE-2021-37618.patch \
            "
 SRC_URI[sha256sum] = "a79f5613812aa21755d578a297874fb59a85101e793edc64ec2c6bd994e3e778"
 

