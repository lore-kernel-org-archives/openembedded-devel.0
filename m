Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web09.6301.1622029989365034548
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 04:53:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dco+q5l2;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id v13-20020a17090abb8db029015f9f7d7290so3497011pjr.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 04:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=egX5GL3PWuNzG542v0a9MzJUDLZjNKMwMz5VRVDMUjY=;
        b=dco+q5l2q8EYkhwoDgXeOUGgo7vNBGzuX1NrxcVt5DN7L2IGLC85ClYKbGebk8t3Ig
         zNQUQTMeB5fG6YgXHbyv0iTHgYyuA+dmbVYRIUaetouwTNYG6A4MojiaDu9YtkpgYaCc
         1GPXglbxtv68nyeLchIegxOUYPdHCuncx4LahDDmYMIdelDbEWa/FsrmKYmKGhE3uyKA
         vqJTu/ZqbE53GlUtPXLZJyK9WjI6JGZX+sHHGD2gAFSOJcub6b6/WN3DX5wIbu2ZStLO
         33bPT0C5/YvuET2iKoysr567Djerru6ZtqFUuTrTKqOPVII5KfD3TkZR4Dr8O0aFv/Bw
         0K0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=egX5GL3PWuNzG542v0a9MzJUDLZjNKMwMz5VRVDMUjY=;
        b=C8aL6d03Sf5S9CdWrJRk96WcOCBEStNhy0rn7kz6Dww9OePnALjBkopPIr93QTfGyf
         gEXDK/d38OkOEDrhGKSuopdZXWwjaahExCT8TurCd+KawQdikfFO/n/1KGhwI1tZC55/
         SUz6vMgFfFfykUcBD7wJjz9I1agVkXgC2wPlPYZvndJ+G0KyegXOabg04EbydzmxSpFm
         nyB1OMbEOFOi7o9pWEOL0nBXqktxPwL55AgV0Nt7AQz30oVdxy17sviEW4YGiG2awF0g
         NfGJu+FCOXLmjdrPcpYT1wDV4P38h0iDeHjVQe3Qx779ky134cA4sDHr7ZvTbponXI8S
         6llQ==
X-Gm-Message-State: AOAM530NYB6L0cVNY72/GqPLk/g1PFR5byu0OOwTh/WEAOOFdY4o7e3B
	4lSegPpHt3xm9f5y6eswNOzepZVdLy0k8Q==
X-Google-Smtp-Source: ABdhPJzOeTxjYWIXBzeSv5MnO8oqvnyRXkZ/MhdGlAQeOonQh7duuiPicfroKABVLC1cqzu+yL9m+A==
X-Received: by 2002:a17:90a:e501:: with SMTP id t1mr3595963pjy.32.1622029988770;
        Wed, 26 May 2021 04:53:08 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:68d3:e59c:b64:76e3])
        by smtp.gmail.com with ESMTPSA id h22sm15408818pfn.55.2021.05.26.04.53.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 04:53:08 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [harkknott 23/23] libgtop: fix do_compile error
Date: Wed, 26 May 2021 04:52:38 -0700
Message-Id: <9ee0e08ba2395b9cb93f2273bb1018adb3630407.1622029873.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1622029873.git.akuster808@gmail.com>
References: <cover.1622029873.git.akuster808@gmail.com>

From: Changqing Li <changqing.li@windriver.com>

On some distros, such as fedora32, cross compile failed with following
error since host library is used. undefined reference to
`stat64@GLIBC_2.33'

According doc of ld, set searchdir begins with "=", but not hardcoded
locations.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a6d1ddf7a9972008261bb84ff4196446d182c683)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...-fix-compile-error-for-cross-compile.patch | 37 +++++++++++++++++++
 .../recipes-gnome/libgtop/libgtop_2.40.0.bb   |  2 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/libgtop/libgtop/0001-fix-compile-error-for-cross-compile.patch

diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop/0001-fix-compile-error-for-cross-compile.patch b/meta-gnome/recipes-gnome/libgtop/libgtop/0001-fix-compile-error-for-cross-compile.patch
new file mode 100644
index 0000000000..1bd6e101b5
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libgtop/libgtop/0001-fix-compile-error-for-cross-compile.patch
@@ -0,0 +1,37 @@
+From e865a93000913b4597607289356114cd159f4e28 Mon Sep 17 00:00:00 2001
+From: Your Name <you@example.com>
+Date: Fri, 21 May 2021 03:02:29 +0000
+Subject: [PATCH] fix compile error for cross compile
+
+On some distros, such as fedora32, cross compile failed with following
+error since host library is used. undefined reference to
+`stat64@GLIBC_2.33'
+
+According doc of ld, set searchdir begins with "=", but not hardcoded
+locations.
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libgtop/-/merge_requests/26]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 472f44b..ed6a4d7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -270,8 +270,8 @@ AC_ARG_ENABLE(fatal-warnings,
+                         [Define to enable fatal warnings]))
+ 
+ dnl These definitions are expanded in make.
+-LIBGTOP_LIBS='-L$(libdir)'
+-LIBGTOP_INCS='-I$(includedir)/libgtop-2.0'
++LIBGTOP_LIBS='-L=$(libdir)'
++LIBGTOP_INCS='-I=$(includedir)/libgtop-2.0'
+ 
+ if test x$libgtop_have_sysinfo = xyes ; then
+   LIBGTOP_INCS="$LIBGTOP_INCS -DHAVE_LIBGTOP_SYSINFO"
+-- 
+2.26.2
+
diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb b/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb
index 63615e4331..6d9398f4e4 100644
--- a/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb
+++ b/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb
@@ -8,6 +8,8 @@ inherit gnomebase lib_package gtk-doc gobject-introspection gettext upstream-ver
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
+SRC_URI += "file://0001-fix-compile-error-for-cross-compile.patch"
+
 SRC_URI[archive.sha256sum] = "78f3274c0c79c434c03655c1b35edf7b95ec0421430897fb1345a98a265ed2d4"
 
 DEPENDS = "glib-2.0 libxau"
-- 
2.17.1

