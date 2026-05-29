Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31949CD6E43
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 12:17:16 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8834.1780056596363571178
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 May 2026 05:09:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZI7FlnA1;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alexander.v.yurkov@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45ef4223be7so276983f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 May 2026 05:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780056594; x=1780661394; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u7HhbjdqOo2fE5yOfXMFrjksMFwNOzgDNHYLj8mY3l8=;
        b=ZI7FlnA1R5MuYyQgEZjXuvHFg0O+dFUew161U4PXnLtdhKAST1QoBX7nnxJrkJIfB7
         1egVSpRc41Bkllx1fgu52muJpAUA9YCV+RsyaQXs2xoQcvu2BujTCuLEAKQ4uvIVaJmY
         0LudzzpVRhNYT1UlJluueLE8VnoCqX1+sPJLGbZ1W4mfIFylOrQf0peSNUp41alEFyIS
         h6AxVkvivydYEvXVVYm9MvAJ/NmydVeJGNGCHb5n+2BPcuUek9WLcdxVWgVjrpuuQsFY
         p4TOwlXhiaWoYMESovtlvWKjrJK7icP44SdmphF5MwXHjmBLEyISPHCzBOFNvc3PUS5N
         Z6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780056594; x=1780661394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u7HhbjdqOo2fE5yOfXMFrjksMFwNOzgDNHYLj8mY3l8=;
        b=pCUi9W+oRI8iOayWvuubEUcP4q2bpkleq7vl1e+NJPjabR/ToWHa2JJDrT4rWYOJbv
         0a0/Iy03YNKRgcfM38XNd+VFMACz8VU0PCT2qHq/O3u76SBiCv6RQARAO3tTv9US4xMj
         jgWfVCUk26gbTDqSFdkVegGnE46s5wsEZ7Xyb4w0tlg9wig88Ao8VSSggKcPcKXfbBn1
         GTkqQPfmgcIPIaK1zXKcKyaF15IKp0eDb7d4VUWXXcwmHvSPNjJLts2twxGHX7SmTPSL
         4xzYcsAf4mUE1li+EKZxJu1zlbUAhz79y/C6sU6IZFJ7QbccHbUSm4b0eHXErQBJ/WKi
         EbPQ==
X-Gm-Message-State: AOJu0Yy/0y3fjB6FdZVa5OlGnQ8Gd5JRERxKBKquQnfpOjCvRRmV1hiW
	11p83IX5EU3aLx2Lb3uIqA4VxLwh+lXBOGbOyUlwx1Jw+oNFz2cady53b8YP2gXDxQY=
X-Gm-Gg: Acq92OGSB1FmjxaTpYnN7rdhQNlmddXe4iXu5UsbUxNUI6Mp0/w6eRGyAAlSSUSoMXL
	R2vnmh7FQeswEIlDh/kvzOvZlkmS23ckqD46oppKXGrpmWv9xoRMdbT5mwl9412LjpxEMDS+oM0
	ww0MBjcqkpfz4CI6NUOefE2gG3mBvcL0hMa9lIUBQPRrA+v+Dq2R/1OLK6VZlgxoYPjEudPAUtg
	Vvw2U/k81slAPtWjn7nbSnO6KsgWaYVjSikPNym/ukghA6HmmhDNahMtTqKDjFlP4yxP/jbR36A
	FCYucHuj0TZ6fpe4vKQbPn5DnegQ3DLyjsx+OVkR71GXI7OrI8ofhq3teKFTOKH/l95cglloL2d
	yrch/XPOzKToNf55Uy6RgZd2MArTYts6cQQbQvtCQ1ddd8xrFsS1tS1iNRHoSv/F51jZWlFQTAP
	K7HidL73CKkyKh5Jtm20VBZwTt274Nvwnol3AB0/lcL6F8kNFQ
X-Received: by 2002:a05:6000:461b:b0:45e:73b4:e731 with SMTP id ffacd0b85a97d-45ef143d42bmr4566675f8f.14.1780056594136;
        Fri, 29 May 2026 05:09:54 -0700 (PDT)
Received: from Ubuntu-2204-jammy-amd64-base.. ([2a01:4f8:272:3f67::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34c50f6sm3572495f8f.16.2026.05.29.05.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 05:09:53 -0700 (PDT)
From: alexander.v.yurkov@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Yurkov <alexander.v.yurkov@gmail.com>
Subject: [PATCH 1/2] syslog-ng: Add backport patches from syslog-ng.
Date: Fri, 29 May 2026 12:09:45 +0000
Message-ID: <630c6256d52d36ebcb805c20c13a4867da6b4aaa.1780050236.git.alexander.v.yurkov@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 May 2026 12:17:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127287

From: Alexander Yurkov <alexander.v.yurkov@gmail.com>

Backport patches from syslog-ng for options to disable awk.
Gawk dependency in syslog-ng can only be turned off in the right way via
options.

Signed-off-by: Alexander Yurkov <alexander.v.yurkov@gmail.com>
---
 ...at-Add-option-in-cmake-to-remove-awk.patch | 37 +++++++++++++
 ...dd-option-in-autotools-to-remove-awk.patch | 55 +++++++++++++++++++
 .../syslog-ng/syslog-ng_4.11.0.bb             |  4 +-
 3 files changed, 95 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/0001-feat-Add-option-in-cmake-to-remove-awk.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/0002-feat-Add-option-in-autotools-to-remove-awk.patch

diff --git a/meta-oe/recipes-support/syslog-ng/files/0001-feat-Add-option-in-cmake-to-remove-awk.patch b/meta-oe/recipes-support/syslog-ng/files/0001-feat-Add-option-in-cmake-to-remove-awk.patch
new file mode 100644
index 0000000000..931b83a1d0
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/0001-feat-Add-option-in-cmake-to-remove-awk.patch
@@ -0,0 +1,37 @@
+From 57df53d6132cc77251cea746ad6ab6cfd9c8a9f1 Mon Sep 17 00:00:00 2001
+From: Alexander Yurkov <alexander.v.yurkov@gmail.com>
+Date: Thu, 28 May 2026 21:01:40 +0000
+Subject: [PATCH] feat: Add option in cmake to remove awk.
+
+Add an option in cmake to remove the need for awk to avoid licensing issues.
+
+Upstream-Status: Backport [cd7ca1019aca0619f83035f2b11e8f3a22c51a33]
+
+Signed-off-by: Alexander Yurkov <alexander.v.yurkov@gmail.com>
+---
+ scl/CMakeLists.txt | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/scl/CMakeLists.txt b/scl/CMakeLists.txt
+index e3f8c1d..bef4d50 100644
+--- a/scl/CMakeLists.txt
++++ b/scl/CMakeLists.txt
+@@ -54,8 +54,17 @@ set(SCL_DIRS
+     azure
+ )
+
++option(ENABLE_SCL_SYSLOGCONF_AWK "Install scl/syslogconf/convert-syslogconf.awk" ON)
++
+ install(DIRECTORY ${SCL_DIRS} DESTINATION share/syslog-ng/include/scl
+-        USE_SOURCE_PERMISSIONS)
++        USE_SOURCE_PERMISSIONS
++        PATTERN "convert-syslogconf.awk" EXCLUDE)
++
++if (ENABLE_SCL_SYSLOGCONF_AWK)
++    install(FILES syslogconf/convert-syslogconf.awk
++            DESTINATION share/syslog-ng/include/scl/syslogconf)
++endif()
++
+ install(FILES scl.conf DESTINATION share/syslog-ng/include)
+
+ if (NOT EXISTS ${CMAKE_INSTALL_PREFIX}/etc/syslog-ng.conf)
diff --git a/meta-oe/recipes-support/syslog-ng/files/0002-feat-Add-option-in-autotools-to-remove-awk.patch b/meta-oe/recipes-support/syslog-ng/files/0002-feat-Add-option-in-autotools-to-remove-awk.patch
new file mode 100644
index 0000000000..976066c3ff
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/0002-feat-Add-option-in-autotools-to-remove-awk.patch
@@ -0,0 +1,55 @@
+From dc42135ae830e34df7939bf3c08934904c402fa6 Mon Sep 17 00:00:00 2001
+From: Alexander Yurkov <alexander.v.yurkov@gmail.com>
+Date: Thu, 28 May 2026 21:04:27 +0000
+Subject: [PATCH] feat: Add option in autotools to remove awk.
+
+The option is to avoid licensing issues, and awk is turned off by
+default.
+
+Upstream-Status: Backport [eda6d019710048e81f00f3497d5f1143f3eca803]
+
+Signed-off-by: Alexander Yurkov <alexander.v.yurkov@gmail.com>
+---
+ configure.ac    | 7 +++++++
+ scl/Makefile.am | 3 +++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index b283836..b6c487b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -639,6 +639,12 @@ AC_ARG_ENABLE(all-modules,
+     AS_HELP_STRING([--enable-all-modules], [Forcibly enable all modules. (default: auto)]),
+     , enable_all_modules="auto")
+
++AC_ARG_ENABLE([scl-syslogconf-awk],
++  [AS_HELP_STRING([--disable-scl-syslogconf-awk],
++                  [Do not install scl/syslogconf/convert-syslogconf.awk])],
++  [],
++  [enable_scl_syslogconf_awk=yes])
++
+ if test "x$enable_all_modules" != "xauto"; then
+    state="$enable_all_modules"
+
+@@ -2685,6 +2691,7 @@ AM_CONDITIONAL([HAVE_GETRANDOM], [test x$ac_cv_func_getrandom = xyes])
+ AM_CONDITIONAL([HAVE_FMEMOPEN], [test x$ac_cv_func_fmemopen = xyes])
+ AM_CONDITIONAL([HAVE_JAVAH], [test -n "$JAVAH_BIN"])
+ AM_CONDITIONAL(ENABLE_IPV6, [test $enable_ipv6 = yes])
++AM_CONDITIONAL([ENABLE_SCL_SYSLOGCONF_AWK], [test "x$enable_scl_syslogconf_awk" = "xyes"])
+
+ AM_CONDITIONAL(OS_TYPE_MACOS, [test $ostype = "Darwin"])
+ AM_CONDITIONAL(OS_TYPE_FREEBSD, [test $ostype = "FreeBSD"])
+diff --git a/scl/Makefile.am b/scl/Makefile.am
+index 17d1a55..62b9d01 100644
+--- a/scl/Makefile.am
++++ b/scl/Makefile.am
+@@ -71,6 +71,9 @@ scl-install-data-local:
+		$(install_sh_DATA) $(srcdir)/scl/scl.conf  $(DESTDIR)/$(config_includedir)/scl.conf; \
+	fi
+	(cd $(srcdir)/scl; tar cf - $(SCL_SUBDIRS)) | (cd $(DESTDIR)/$(scldir) && tar xf - --no-same-owner)
++if !ENABLE_SCL_SYSLOGCONF_AWK
++	rm -f $(DESTDIR)/$(scldir)/syslogconf/convert-syslogconf.awk
++endif
+	chmod -R u+rwX $(DESTDIR)/$(scldir)
+
+ scl-uninstall-local:
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.11.0.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.11.0.bb
index 1846758681..9c6f62856b 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.11.0.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.11.0.bb
@@ -23,7 +23,9 @@ SRC_URI = "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.ta
            file://syslog-ng-tmp.conf \
            file://syslog-ng.service-the-syslog-ng-service.patch \
            file://0001-Fix-buildpaths-warning.patch \
-"
+           file://0001-feat-Add-option-in-cmake-to-remove-awk.patch \
+           file://0002-feat-Add-option-in-autotools-to-remove-awk.patch \
+           "
 SRC_URI:append:powerpc64le = " file://0001-plugin.c-workaround-powerpc64le-segfaults-error.patch"
 
 SRC_URI[sha256sum] = "37ea0d4588533316de122df4e1b249867b0a0575f646c7478d0cc4d747462943"

