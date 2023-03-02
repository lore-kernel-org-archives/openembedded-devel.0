Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B22CC7EE3A
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 08:31:28 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.10285.1677745880488950054
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Mar 2023 00:31:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jixvZGAD;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id n6so15396368plf.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 00:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JnaMcl/RFIlQYZSu/6LHqRtVJgWZZ5ypRMlXTgEC894=;
        b=jixvZGADx6JGJ7dpokqyAmmDPyJaT8ka6H+jMlhIp6N2STqgAsWCEJ9k1u0i1vHOEz
         5ZfO3bPwnabi3rbqyYtTMuIn+CpsCZuqk5//zbw4s7oQ1RYXj8tEW/rmrgs9G/xWgkUe
         EtI1fuqpCPFAEqjrKdz0hNmmVuWuXG8pvCciXLt3hEiqhGFqovmCaXrMSTOBM9sd4BNJ
         LO0+Pw8whMXSudZ8c+hTXvIIGgQjs41+b7ySHRorqu3G5D9WBF3kwG/EWdCkV/Dlfmkr
         Y93B8QYNHq9k/ppwT+z95vqY4kZtH86Hw3iOE3TDK2wKIoWyqfqnoLGC7f/D6vzbXCuK
         1S9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JnaMcl/RFIlQYZSu/6LHqRtVJgWZZ5ypRMlXTgEC894=;
        b=SCCQUffP0sLzZJ0/Z9Rlei6+aTYquaKZDClubLOsfB74cy08pVwfhOa4+B95xjGdTX
         wqHm9MGw9HroVhPplak7lZH9SS241QcaemVVmxlitoLAPxAzft64YKJpQtOdH9UMAUCT
         eJwNCMg6P3ptOH/z4UMm+Ghin1bkLyBwzknaSoIq6BIDAkawr8+ncQ7yTK6lDuIf6p7d
         7q6+QIpJY8HpL0nbCYBcHEZmuuQNnXf5UtGyjbO42E6ZFd7G67Bj1Har9P3F1ToFxe6B
         OOxyD3+vZIFLpLyOhLrOg855iJ7HhO2gbxATHEGWhRa15ybFrZ2Y8TKfQL0L8IeHovwX
         uIJw==
X-Gm-Message-State: AO0yUKXgxLj8n7d8a5FRm6bvPEIVIrFz7H6h3GbgT2B5qVhMZpC3Y9nt
	oscNBQV1LIGoyKsJe33Vm1A220tbIfU=
X-Google-Smtp-Source: AK7set/v7tHvhKCJHPaHPyKbDGwaVC3a7WHTKEuyOSUP31mhjUpJSRdrorXrzGXwblYOM1elwQP1qA==
X-Received: by 2002:a17:903:1d2:b0:19d:1f42:b018 with SMTP id e18-20020a17090301d200b0019d1f42b018mr1549114plh.27.1677745880982;
        Thu, 02 Mar 2023 00:31:20 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::1ac4])
        by smtp.gmail.com with ESMTPSA id w13-20020a170902d70d00b0019aeddce6casm9670994ply.205.2023.03.02.00.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 00:31:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/5] libsdl2-ttf: Upgrade to 2.20.2
Date: Thu,  2 Mar 2023 00:31:14 -0800
Message-Id: <20230302083116.1332448-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302083116.1332448-1-raj.khem@gmail.com>
References: <20230302083116.1332448-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 08:31:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101329

Fix build with clang16 while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ction-signatures-to-match-without-ca.patch | 69 +++++++++++++++++++
 ...l2-ttf_2.20.1.bb => libsdl2-ttf_2.20.2.bb} |  7 +-
 2 files changed, 73 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/libsdl/libsdl2-ttf/0001-freetype-Fix-function-signatures-to-match-without-ca.patch
 rename meta-oe/recipes-graphics/libsdl/{libsdl2-ttf_2.20.1.bb => libsdl2-ttf_2.20.2.bb} (76%)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf/0001-freetype-Fix-function-signatures-to-match-without-ca.patch b/meta-oe/recipes-graphics/libsdl/libsdl2-ttf/0001-freetype-Fix-function-signatures-to-match-without-ca.patch
new file mode 100644
index 0000000000..8cb76c35d6
--- /dev/null
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-ttf/0001-freetype-Fix-function-signatures-to-match-without-ca.patch
@@ -0,0 +1,69 @@
+From 6c52693d264ca3dc8e15a92f56cf3a636639bb6c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Martin=20Storsj=C3=B6?= <martin@martin.st>
+Date: Fri, 28 Oct 2022 22:17:15 +0300
+Subject: [PATCH] freetype: Fix function signatures to match without casts
+
+Clang 16 has got a new stricter warning for casts of function types
+(see https://github.com/llvm/llvm-project/commit/1aad641c793090b4d036c03e737df2ebe2c32c57).
+
+This new warning gets included as part of the existing error
+diagnostic setting of -Wcast-function-type.
+
+This fixes errors like these:
+
+../src/hb-ft.cc:1011:34: error: cast from 'void (*)(FT_Face)' (aka 'void (*)(FT_FaceRec_ *)') to 'FT_Generic_Finalizer' (aka 'void (*)(void *)') converts to incompatible function type [-Werror,-Wcast-function-type-strict]
+    ft_face->generic.finalizer = (FT_Generic_Finalizer) hb_ft_face_finalize;
+                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Backport [https://github.com/harfbuzz/harfbuzz/commit/d88269c827895b38f99f7cf741fa60210d4d5169]
+---
+ src/hb-ft.cc | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/src/hb-ft.cc b/src/hb-ft.cc
+index a6beb9f0f..a35e75b18 100644
+--- a/src/hb-ft.cc
++++ b/src/hb-ft.cc
+@@ -729,8 +729,9 @@ hb_ft_face_create_referenced (FT_Face ft_face)
+ }
+ 
+ static void
+-hb_ft_face_finalize (FT_Face ft_face)
++hb_ft_face_finalize (void *arg)
+ {
++  FT_Face ft_face = (FT_Face) arg;
+   hb_face_destroy ((hb_face_t *) ft_face->generic.data);
+ }
+ 
+@@ -762,7 +763,7 @@ hb_ft_face_create_cached (FT_Face ft_face)
+       ft_face->generic.finalizer (ft_face);
+ 
+     ft_face->generic.data = hb_ft_face_create (ft_face, nullptr);
+-    ft_face->generic.finalizer = (FT_Generic_Finalizer) hb_ft_face_finalize;
++    ft_face->generic.finalizer = hb_ft_face_finalize;
+   }
+ 
+   return hb_face_reference ((hb_face_t *) ft_face->generic.data);
+@@ -949,8 +950,9 @@ get_ft_library ()
+ }
+ 
+ static void
+-_release_blob (FT_Face ft_face)
++_release_blob (void *arg)
+ {
++  FT_Face ft_face = (FT_Face) arg;
+   hb_blob_destroy ((hb_blob_t *) ft_face->generic.data);
+ }
+ 
+@@ -1032,7 +1034,7 @@ hb_ft_font_set_funcs (hb_font_t *font)
+ #endif
+ 
+   ft_face->generic.data = blob;
+-  ft_face->generic.finalizer = (FT_Generic_Finalizer) _release_blob;
++  ft_face->generic.finalizer = _release_blob;
+ 
+   _hb_ft_font_set_funcs (font, ft_face, true);
+   hb_ft_font_set_load_flags (font, FT_LOAD_DEFAULT | FT_LOAD_NO_HINTING);
+-- 
+2.39.2
+
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.20.1.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.20.2.bb
similarity index 76%
rename from meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.20.1.bb
rename to meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.20.2.bb
index b8732b4c86..7d352f4218 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.20.1.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.20.2.bb
@@ -2,17 +2,18 @@ SUMMARY = "Simple DirectMedia Layer truetype font library"
 SECTION = "libs"
 DEPENDS = "libsdl2 freetype virtual/egl"
 LICENSE = "Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=771dca8728b18d39b130e19b36514371"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a41cbf59bdea749fe34c1af6d3615f68"
 
 SRC_URI = " \
     git://github.com/libsdl-org/SDL_ttf.git;branch=release-2.20.x;protocol=https \
     git://github.com/libsdl-org/freetype.git;branch=VER-2-12-1-SDL;destsuffix=git/external/freetype;name=freetype;protocol=https \
     git://github.com/libsdl-org/harfbuzz.git;branch=2.9.1-SDL;destsuffix=git/external/harfbuzz;name=harfbuzz;protocol=https \
+    file://0001-freetype-Fix-function-signatures-to-match-without-ca.patch;patchdir=external/harfbuzz \
     file://automake_foreign.patch \
 "
-SRCREV = "0a652b598625d16ea7016665095cb1e9bce9ef4f"
+SRCREV = "89d1692fd8fe91a679bb943d377bfbd709b52c23"
 SRCREV_freetype = "6fc77cee03e078e97afcee0c0e06a2d3274b9a29"
-SRCREV_harfbuzz = "6022fe2f68d028ee178284f297b3902ffdf65b03"
+SRCREV_harfbuzz = "43931e3e596c04044861770b831c8f9452e2d3b0"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


