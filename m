Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF60BCAC5AE
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 13:59:47 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.17319.1758290379844932968
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Sep 2025 06:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z/ul6gBG;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so316376166b.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 06:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758290378; x=1758895178; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J0JQip8VtBu8cRuQW88JsmUTdzjOecwkVeCqSRyjYaU=;
        b=Z/ul6gBGY74yJbNOQwU1Owk9XSxuHGtRZs0G46m492qcWiWzx1qAEHbLGt7ViZgkdn
         e1JuqgXWxGQO0cJZj1va5xGmphU7CQ443kBHT+IpCO1DOtwXmDvgDoL5t+Qc4azG1qSQ
         +0QKNd3TZqrYTVfH+a9UTBIwfV2k1IAR1ihhGz8/1GkNRjgOGrMwfdEMUmflH14n1Cb5
         KwcjcbRbRAsNx5ZYlkAF97SriTkyl5Ir9d2RsBL/fMl70Lb4mqeCoGcANFz0RtMXmHVN
         k8pk+UBVfFlOvZz2EC86FmQbJFKHAw0ChC5HnWYvE56CmxzduS09mhqNNmGt580rScpx
         /aag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758290378; x=1758895178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J0JQip8VtBu8cRuQW88JsmUTdzjOecwkVeCqSRyjYaU=;
        b=NWPBKBkx09FeYJYm2jj5RwzKy7HXJgUs0LEX4hWl90rASY/L++Ru9bxCC5qKEpmxgZ
         Z453NH1/fwjwOya8X4YpsTvtI68C8qLZh86PnhJ4N5bN+M8mHizUz5oGsyAKNWwLKFV6
         ESUPj4p5jSd+nAwJTcOeRITznWjTYkveiNCy9QYlt+Y30r5vvkUhBgsT033f6tkmKvIj
         B82LRsa+xcYElb0dY8yKIQE0PJ/6JiiD6fQNE93qtmehko0qFw5bPc30CAt8ST50InVN
         Hav1k5c1WnyiBdT8OTSusXPDQ7swveAwGNxvCSMYETI4nRcFwU0Sm67aA6oK0Xp41l0G
         /v2A==
X-Gm-Message-State: AOJu0YwS6PKfHtZQ7ODD8aEc6Yqz2PrbhT/xNtp/WGf4nXWrO1RMNX4N
	1HaxSCQ6t9Vn3mVDwW+jJscNxKENOkL/9kywBmZaQzZtgECWTjMl91WMUmY1Lw==
X-Gm-Gg: ASbGncuIEd/ulynCD3QhdX2XvxdVCsg+NIII6SRJZEOi1+fZ/kn47Ya9VDDLP/nWjw/
	vRM72Qd9ZFTpmEI2hGBjBtmiV5lVGPw+YQuCbL5e5dUtLpBVkskB5tDqTQXviv0JoViQUxjTFYl
	aGogyYeaynkXo6xrlBU2bieR4a8jDeVtllCw25J2/icRNia7rY2WustvwDUCQQLQEwAYt5DxfLm
	F7rCNp2ZPenCW2tWfkfbR7RPTeR7o41MzP22RUK+YWBRkqjfnFlv9xKcK6wpHxrk1G48H2iOZwG
	5UHhy1503rH6WEiEHobe5fIuHba0XwK4dmQsPnvPqVToi/M8SwyjfH9YwLWXH+/RmVynuRuDoXo
	29dRo0zasBI5dYrI43iEd
X-Google-Smtp-Source: AGHT+IFp2BVoF0Tum+WRSwzLSVPUbKtACMvo8o8Nf5XmrN1z7czlCSWHSqOV4aOY0iDgSOr6BYPEDw==
X-Received: by 2002:a17:907:9815:b0:b09:2331:f150 with SMTP id a640c23a62f3a-b24ef2a8b22mr397899966b.16.1758290378106;
        Fri, 19 Sep 2025 06:59:38 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fd262993asm442209166b.94.2025.09.19.06.59.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 06:59:37 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 6/9] fltk-native: fix libdl link issue
Date: Fri, 19 Sep 2025 15:59:28 +0200
Message-ID: <20250919135933.916848-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919135933.916848-1-skandigraun@gmail.com>
References: <20250919135933.916848-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 13:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119603

From: Kai Kang <kai.kang@windriver.com>

It fails to build fltk-native on Ubuntu 20.04 with glibc 2.31:

| /path_to/tmp/hosttools/ld: lib/libfltk.a(Fl_Native_File_Chooser.cxx.o): in function `fl_dlopen(char const*, char const*)':
| Fl_Native_File_Chooser.cxx:(.text+0x61a): undefined reference to `dlopen'
| /path_to/tmp/hosttools/ld: lib/libfltk.a(Fl_Native_File_Chooser.cxx.o): in function `Fl_GTK_File_Chooser::probe_for_GTK_libs()':
| Fl_Native_File_Chooser.cxx:(.text+0xf92): undefined reference to `dlerror'

The original fix in fltk-native recipe does not work any more because '-ldl'
appears before lib/libfltk.a and causes dlopen() unresolved. The reason why it
doesn't fail on other hosts is that the functions dlopen(), dlerror() etc. have
been moved to libc.so since glibc 2.34 via the commits in glibc:

0c1c3a771e dlfcn: Move dlopen into libc
add8d7ea01 dlfcn: Move dlvsym into libc
6dfc0207eb dlfcn: Move dlinfo into libc
492560a32e dlfcn: Move dladdr1 into libc
6a1ed32789 dlfcn: Move dlmopen into libc
77f876c0e3 dlfcn: Move dlsym into libc
602252b553 dlfcn: Move dladdr into libc
d8cce17d2a dlfcn: Move dlclose into libc

Append 'dl' to fltk link items explictly to fix the error.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e3606c223e8195dc57a41c64ca670958f1809d6f)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/fltk/fltk-native.bb   |  5 +--
 .../fltk/fltk/fltk-native-link-libdl.patch    | 44 +++++++++++++++++++
 2 files changed, 46 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/fltk/fltk/fltk-native-link-libdl.patch

diff --git a/meta-oe/recipes-support/fltk/fltk-native.bb b/meta-oe/recipes-support/fltk/fltk-native.bb
index 8d3992a6ec..3e8e2cdf77 100644
--- a/meta-oe/recipes-support/fltk/fltk-native.bb
+++ b/meta-oe/recipes-support/fltk/fltk-native.bb
@@ -2,6 +2,8 @@ require ${BPN}.inc
 
 DEPENDS = "zlib-native jpeg-native libpng-native libxext-native libxft-native"
 
+SRC_URI += "file://fltk-native-link-libdl.patch"
+
 inherit native
 
 EXTRA_OECMAKE += " \
@@ -15,9 +17,6 @@ EXTRA_OECMAKE += " \
     -DOPTION_USE_XCURSOR=OFF \
 "
 
-# lib/libfltk.a(Fl_Native_File_Chooser.cxx.o): undefined reference to symbol 'dlsym@@GLIBC_2.2.5'
-LDFLAGS += "-ldl"
-
 do_install:append() {
     # make sure native fltk-config is not used accidentaly
     rm -f ${D}${bindir}/fltk-config
diff --git a/meta-oe/recipes-support/fltk/fltk/fltk-native-link-libdl.patch b/meta-oe/recipes-support/fltk/fltk/fltk-native-link-libdl.patch
new file mode 100644
index 0000000000..e140ce2166
--- /dev/null
+++ b/meta-oe/recipes-support/fltk/fltk/fltk-native-link-libdl.patch
@@ -0,0 +1,44 @@
+Upstream-Status: Inappropriate [cross build specific]
+
+It fails to build fltk-native on Ubuntu 20.04 with glibc 2.31:
+
+| /path_to/tmp/hosttools/ld: lib/libfltk.a(Fl_Native_File_Chooser.cxx.o): in function `fl_dlopen(char const*, char const*)':
+| Fl_Native_File_Chooser.cxx:(.text+0x61a): undefined reference to `dlopen'
+| /path_to/tmp/hosttools/ld: lib/libfltk.a(Fl_Native_File_Chooser.cxx.o): in function `Fl_GTK_File_Chooser::probe_for_GTK_libs()':
+| Fl_Native_File_Chooser.cxx:(.text+0xf92): undefined reference to `dlerror'
+
+The original fix in fltk-native recipe does not work any more because '-ldl'
+appears before lib/libfltk.a and causes dlopen() unresolved. The reason why it
+doesn't fail on other hosts is that the functions dlopen(), dlerror() etc. have
+been moved to libc.so since glibc 2.34 via the commits in glibc:
+
+0c1c3a771e dlfcn: Move dlopen into libc
+add8d7ea01 dlfcn: Move dlvsym into libc
+6dfc0207eb dlfcn: Move dlinfo into libc
+492560a32e dlfcn: Move dladdr1 into libc
+6a1ed32789 dlfcn: Move dlmopen into libc
+77f876c0e3 dlfcn: Move dlsym into libc
+602252b553 dlfcn: Move dladdr into libc
+d8cce17d2a dlfcn: Move dlclose into libc
+
+Append 'dl' to fltk link items explictly to fix the error.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+---
+ src/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index d153b1c..0fe5c11 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -306,7 +306,7 @@ endif (USE_XFT)
+ #######################################################################
+ 
+ FL_ADD_LIBRARY (fltk STATIC "${STATIC_FILES}")
+-target_link_libraries (fltk ${OPTIONAL_LIBS})
++target_link_libraries (fltk ${OPTIONAL_LIBS} dl)
+ 
+ #######################################################################
+ 

