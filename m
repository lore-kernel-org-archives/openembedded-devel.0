Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web12.12374.1597383429488905112
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 22:37:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iIHBThnQ;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id m34so3985196pgl.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2020 22:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OHri67kRaZGtm+VeiqwovwboiFUDFCoCBM+xnnsMyr4=;
        b=iIHBThnQKyTkiwL++xgoYKWEsC5fZmRWtYH7Vno4HgI138Tw9oC5GiwlNFCWEypluS
         Mnf+xy5mrYjJpK9uXpr+yOoAxMOxoXXBOASQbll0/ej6KxLp5PGhVSyyyD0RtGT0Zb+q
         BJoAHYjQOFNjgtUA6KDnaOUOXO6GwJr/EirJIBwIhFSNjJxtpLUlNDt7jeGNRqeFe7N1
         Jc0KfKq3e1KZhfucjJRksIdiqPfrSUblPVYxgr/np8V1UBkI3yRFnhqcMRaFNxrirPit
         Lo/7lMEXJg2OEVapb6ChmsICDwQPMfwqA34pOVLyyte5x3P3/ZTflqWXs2r7opfv3Too
         bNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OHri67kRaZGtm+VeiqwovwboiFUDFCoCBM+xnnsMyr4=;
        b=TIVqvemkOVBvK/pStalTK1NYDAyCR2z1VS+5S72xA4EDllpaoTyy7MY5/1+7m15HoP
         aXEMCvMnSLozuC+7PyVqmo8JIPsYIFYwMFc2DVzSSakFmXeHFtooBY0Cfd+4qPLgun8Y
         aeCwdKk2HwjlEBoPYK2On7sbdkRIrvg2YlqgqXD5SkrjrEsD3p/iXLSLzr6+f7W9B0O0
         xEle/2wbpEkPyAuRISrTO5RhgRcYQ23Q4PY8KGjT/ccaH51WAeE2emwj+ka+qDm8Cvkc
         FGyj053R3wKx4DQp2naTK4F4zBley/10a1Sq8TozaMkh0BCPsXzAqZbiB+c8p9gc1fJR
         V2xQ==
X-Gm-Message-State: AOAM531cGxgOF5Rlr8H1H99iIpTGxC16/x6PzQhMIrM0W+Sf3+nc3+nf
	dkY2IZViafSGmqYW+dQ9k6h+61iS7xieGg==
X-Google-Smtp-Source: ABdhPJwm35QPBO3dB0PyzU9NjerG/fri24+aq+qk3DtJE7IOpq2IWAH+7M9nJkNZ3dKM9TXNEKrAHA==
X-Received: by 2002:aa7:8e8d:: with SMTP id a13mr678811pfr.250.1597383428698;
        Thu, 13 Aug 2020 22:37:08 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id k21sm7013974pgl.0.2020.08.13.22.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 22:37:08 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 10/21] liblbxutil: Fix build with gcc10/-fno-common
Date: Thu, 13 Aug 2020 22:36:46 -0700
Message-Id: <20200814053657.1701247-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200814053657.1701247-1-raj.khem@gmail.com>
References: <20200814053657.1701247-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...lbx_zlib-Mark-declration-with-extern.patch | 36 +++++++++++++++++++
 .../xorg-lib/liblbxutil_1.1.0.bb              |  4 ++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-lib/liblbxutil-1.1.0/0001-lbx_zlib-Mark-declration-with-extern.patch

diff --git a/meta-oe/recipes-graphics/xorg-lib/liblbxutil-1.1.0/0001-lbx_zlib-Mark-declration-with-extern.patch b/meta-oe/recipes-graphics/xorg-lib/liblbxutil-1.1.0/0001-lbx_zlib-Mark-declration-with-extern.patch
new file mode 100644
index 0000000000..32a24b4be1
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-lib/liblbxutil-1.1.0/0001-lbx_zlib-Mark-declration-with-extern.patch
@@ -0,0 +1,36 @@
+From 95ed4b743f197e20f1884a326d5a7128187a7ba6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Aug 2020 17:56:30 -0700
+Subject: [PATCH] lbx_zlib: Mark declration with extern
+
+Fixes build with gcc10/-fno-common
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/lbx_zlib/lbx_zlib.h | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/lbx_zlib/lbx_zlib.h b/src/lbx_zlib/lbx_zlib.h
+index 8ae8956..bec3b96 100644
+--- a/src/lbx_zlib/lbx_zlib.h
++++ b/src/lbx_zlib/lbx_zlib.h
+@@ -136,9 +136,9 @@ extern void Xfree(pointer /*ptr*/);
+ #endif
+ 
+ /* lbx_zlib.c */
+-unsigned long stream_out_compressed;
+-unsigned long stream_out_uncompressed;
+-unsigned long stream_out_plain;
+-unsigned long stream_in_compressed;
+-unsigned long stream_in_uncompressed;
+-unsigned long stream_in_plain;
++extern unsigned long stream_out_compressed;
++extern unsigned long stream_out_uncompressed;
++extern unsigned long stream_out_plain;
++extern unsigned long stream_in_compressed;
++extern unsigned long stream_in_uncompressed;
++extern unsigned long stream_in_plain;
+-- 
+2.28.0
+
diff --git a/meta-oe/recipes-graphics/xorg-lib/liblbxutil_1.1.0.bb b/meta-oe/recipes-graphics/xorg-lib/liblbxutil_1.1.0.bb
index 3e5c31a05d..58b4f31b17 100644
--- a/meta-oe/recipes-graphics/xorg-lib/liblbxutil_1.1.0.bb
+++ b/meta-oe/recipes-graphics/xorg-lib/liblbxutil_1.1.0.bb
@@ -7,7 +7,9 @@ DEPENDS += " xorgproto zlib"
 PE = "1"
 PR = "r11"
 
-SRC_URI += "file://mkg3states-1.1.patch"
+SRC_URI += "file://mkg3states-1.1.patch \
+            file://0001-lbx_zlib-Mark-declration-with-extern.patch \
+           "
 SRC_URI[md5sum] = "273329a78c2e9ea189ac416c7fde94a1"
 SRC_URI[sha256sum] = "c6b6ff7858ec619cafa8205debca6bf78c5610a2844a782ed643c7fd017cf8ae"
 
-- 
2.28.0

