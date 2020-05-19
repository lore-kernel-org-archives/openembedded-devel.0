Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web12.13258.1589899415466755053
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2020 07:43:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XbXWqN5p;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id n15so15922pfd.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2020 07:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=eFT0YZgY5h272rOdiuQwmzrE56W/mIt72LGyMYXUi/k=;
        b=XbXWqN5pE9uJlgXgDCWAEtBZjs/J56OHaF/lbwQ90WMWJieHIoYFh4B1VnBqPjQKTy
         rNu+uNmwwy9K04mBnCXlSqYTwwlxjlSpfrwmr9oV0GsfNY290W3F3f6L7lybyl1GAIeD
         GpuAefyZCxuJ4wNtFY+0VZ4T/OVVaLtSiTP4wbXBifMfAGldk8v689VL3EXiT95tIyL9
         flYosFE3yh8qkUGXOEpfFZXuPbGhPCiR/6BKY00UABUvfK0Af0pqGnjYb9scZkVOzMxG
         vAZ+HkXwxOPoEfXbrPFgh33PmWtbEMKGaoK/TOCYF+SJ6sesgzBCppNfnUJf231UNVKO
         NsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=eFT0YZgY5h272rOdiuQwmzrE56W/mIt72LGyMYXUi/k=;
        b=L2inK7N0HAOuoRmCbD9WwLeYiLWFgERYynlOHjRJ1ydE9aFkpRIuwXwEuTJKX7VkaO
         ZxemhxQqJPnS1c6oVbOfSzHEsTcxYBLBJATUJy2ravDZ+rI3Slx0hPs8oZfxioSHSFix
         hEegKwM8IcT0vxRy5shw4N1SpJu2q0bIJOGrFMYXNkbkoD3n21Vh9EqeawAn9Pugsa3U
         hts71dfdMFZVZW3u7g4zDi+3agXzKzBpMGuoOm2258IsrTjz81624rls93GO8I1ixI9v
         beOOrLt7g2z8jw5bRBGOS+fFFiZVa8geVccUw2L1U+SLycymuiBI0eio599pnPYxh8R9
         MilQ==
X-Gm-Message-State: AOAM531+G7p1SToPzErfofxA7sWkPJawf+Oom9B+xlyNtU9UouWxkGGI
	9Z6Zx4lI3OXch5cWzSMe+DznKuPd
X-Google-Smtp-Source: ABdhPJzuLWzdeo2tfWv8FE0saC1IzGVGjywl6us58eSgcuFQCqYVoHqykv8/LEkWsyL6bJDsvlLSnQ==
X-Received: by 2002:a63:2a93:: with SMTP id q141mr19547056pgq.129.1589899414685;
        Tue, 19 May 2020 07:43:34 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9de6:6921:ec78:716d])
        by smtp.gmail.com with ESMTPSA id h3sm2382099pjk.10.2020.05.19.07.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 07:43:33 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Bunk <bunk@stusta.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [dunfell][PATCH 01/18] mraa: Replace -fcommon with fix
Date: Tue, 19 May 2020 07:43:15 -0700
Message-Id: <20200519144332.12822-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Adrian Bunk <bunk@stusta.de>

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 30b34a83d47239be0390bdaeefc5b3669fd74472)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...de-Declare-gVERSION-global-as-extern.patch | 31 +++++++++++++++++++
 meta-oe/recipes-extended/mraa/mraa_git.bb     |  3 +-
 2 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/mraa/mraa/0001-include-Declare-gVERSION-global-as-extern.patch

diff --git a/meta-oe/recipes-extended/mraa/mraa/0001-include-Declare-gVERSION-global-as-extern.patch b/meta-oe/recipes-extended/mraa/mraa/0001-include-Declare-gVERSION-global-as-extern.patch
new file mode 100644
index 0000000000..d1152ed641
--- /dev/null
+++ b/meta-oe/recipes-extended/mraa/mraa/0001-include-Declare-gVERSION-global-as-extern.patch
@@ -0,0 +1,31 @@
+From dbb5961f106ec42cd70689d933674c9c37aedfe1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bj=C3=B6rn=20Esser?= <besser82@fedoraproject.org>
+Date: Mon, 13 Apr 2020 20:12:11 +0200
+Subject: include: Declare gVERSION global as 'extern'.
+
+Fixes build with '-fno-common'.
+
+Upstream-Status: Submitted [https://github.com/eclipse/mraa/pull/1012]
+Signed-off-by: Adrian Bunk <bunk@stusta.de>
+---
+ include/version.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/version.h b/include/version.h
+index 47366ef..3a567a1 100644
+--- a/include/version.h
++++ b/include/version.h
+@@ -11,8 +11,8 @@
+ extern "C" {
+ #endif
+ 
+-const char* gVERSION;
+-const char* gVERSION_SHORT;
++extern const char* gVERSION;
++extern const char* gVERSION_SHORT;
+ 
+ #ifdef __cplusplus
+ }
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb b/meta-oe/recipes-extended/mraa/mraa_git.bb
index 403d641ee9..7c2441632e 100644
--- a/meta-oe/recipes-extended/mraa/mraa_git.bb
+++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
@@ -10,6 +10,7 @@ PV = "2.1.0+git${SRCPV}"
 
 SRC_URI = "git://github.com/eclipse/${BPN}.git;protocol=http \
            file://0001-cmake-Use-a-regular-expression-to-match-x86-architec.patch \
+           file://0001-include-Declare-gVERSION-global-as-extern.patch \
            "
 
 S = "${WORKDIR}/git"
@@ -27,8 +28,6 @@ EXTRA_OECMAKE_append = " -DINSTALLTOOLS:BOOL=ON -DFIRMATA=ON -DCMAKE_SKIP_RPATH=
                          -DPYTHON_INCLUDE_DIR=${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI} \
                        "
 
-CFLAGS += "-fcommon"
-
 # Prepend mraa-utils to make sure bindir ends up in there
 PACKAGES =+ "${PN}-utils"
 
-- 
2.17.1

