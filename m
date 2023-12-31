Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07140C47422
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 12:23:54 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.219022.1704025426228537108
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Dec 2023 04:23:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OKZnJsaw;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40d6b4e2945so28429395e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 04:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704025425; x=1704630225; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v18b8lqH+XkZUsm/Ce44RYikSm4sdtylfFn9CJDZqQ8=;
        b=OKZnJsawraZRwHk1YDNC50dv9EEwgXvNYJxMOL5DRqNfP8cQajIf9Z8fbLJegcWJCQ
         XlKrL+eYXZQQjnoiRN6F4LscZsTi4S9Yn/vLZBGTGfCTQ/bU/0H9gIRTUgKkUzfNJC39
         3kCCNRx+d+BSHMNnRIuccUQf253+F4u0drs+4mjqg8fK7rlf1ceepO9dxYjnjOzOq0JS
         JXV/On0G9ju7jfQzzX0u/aeZ4yE9+oA8stjAPH5d0ARBHhT2SQKOm6A+/m9ujPBFVFhk
         DYvIPXO/o69QKEouM0tO4AVkFpJoavSXzXDCkJGwTuy8p8I+kT03olLvj1xl48cQIxFo
         oASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704025425; x=1704630225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v18b8lqH+XkZUsm/Ce44RYikSm4sdtylfFn9CJDZqQ8=;
        b=ktObB1u6vxXCmJPBJ5+swu6QOc7ZKquVcFI9D7O60xTNacxNCFd9+SbKhJWM98ncxb
         iDFgBnODlRvbIg01QaOxfTEeobtTXvmSREeTi+qbIfX+jkkZTJyFL1WrPkgkCCmni1cI
         VkjDnjz/Iz/tLmdzYuuLcN5Of3xQ/f61RyXOH8d69eviEAPgrR1iBelKQnhAgWfxWBWy
         kDcTTagq9WA7v3FpPKdGHp0QsXlfJCsYw6ARS3dyffseDASm9HRj3te02fZ9kv0rR5GG
         WEkCAmfHHt7P2oC5jqEcTNbJqeX6mP72DevXhaeREtl3vgMh3mKCDVeRMfKjLXbAfyp4
         s4jg==
X-Gm-Message-State: AOJu0YxPMPGwHVsu3YXintpCRMCrCt4SG1xMTwCzEijzIdHFhk+JWUDz
	8v7MKdvszHgKk9V9/k+MSfevXVI7XKs=
X-Google-Smtp-Source: AGHT+IGmSvWYfw3Y8POBabrpoD17eMA8p6Kd6m1nRTkmwxEmQzDVJP313ZYiV49hcpaB3v1Bb9yV8w==
X-Received: by 2002:a05:600c:5014:b0:40d:5ec8:31b4 with SMTP id n20-20020a05600c501400b0040d5ec831b4mr2307054wmr.217.1704025424553;
        Sun, 31 Dec 2023 04:23:44 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ay23-20020a170907901700b00a26aea4942dsm9155474ejc.123.2023.12.31.04.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 04:23:43 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/23] openipmi: update 2.0.32 -> 2.0.34
Date: Sun, 31 Dec 2023 13:23:21 +0100
Message-Id: <20231231122329.405225-15-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231231122329.405225-1-alex@linutronix.de>
References: <20231231122329.405225-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 12:23:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107966

This resolves dependency on removed python distutils in particular.

openipmi-remove-host-path-from-la_LDFLAGS.patch is removed
as issue is fixed upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ..._devel.m4-do-not-check-for-distutils.patch | 41 ----------------
 ...fix-symlink-install-error-in-cmdlang.patch |  9 ++--
 .../openipmi/files/include_sys_types.patch    |  5 +-
 .../files/ipmi-init-fix-the-arguments.patch   |  6 +--
 .../files/openipmi-no-openipmigui-man.patch   |  3 +-
 ...pmi-remove-host-path-from-la_LDFLAGS.patch | 49 -------------------
 ...{openipmi_2.0.32.bb => openipmi_2.0.34.bb} | 12 ++---
 7 files changed, 16 insertions(+), 109 deletions(-)
 delete mode 100644 meta-networking/recipes-support/openipmi/files/0001-m4-ax_python_devel.m4-do-not-check-for-distutils.patch
 delete mode 100644 meta-networking/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch
 rename meta-networking/recipes-support/openipmi/{openipmi_2.0.32.bb => openipmi_2.0.34.bb} (87%)

diff --git a/meta-networking/recipes-support/openipmi/files/0001-m4-ax_python_devel.m4-do-not-check-for-distutils.patch b/meta-networking/recipes-support/openipmi/files/0001-m4-ax_python_devel.m4-do-not-check-for-distutils.patch
deleted file mode 100644
index 00956fb11..000000000
--- a/meta-networking/recipes-support/openipmi/files/0001-m4-ax_python_devel.m4-do-not-check-for-distutils.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 3a35611687864cf3599712d0d2ff54532b0118ac Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Sun, 3 Oct 2021 21:42:32 +0200
-Subject: [PATCH] m4/ax_python_devel.m4: do not check for distutils
-
-With py 3.10 this prints a deprecation warning which is
-taken as an error. Upstream should rework the code to not
-use distuils.
-
-Upstream-Status: Inappropriate [needs a proper fix upstream]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- m4/ax_python_devel.m4 | 15 ---------------
- 1 file changed, 15 deletions(-)
-
-diff --git a/m4/ax_python_devel.m4 b/m4/ax_python_devel.m4
-index e0804c5..cfc0b24 100644
---- a/m4/ax_python_devel.m4
-+++ b/m4/ax_python_devel.m4
-@@ -138,21 +138,6 @@ variable to configure. See ``configure --help'' for reference.
- 		fi
- 	fi
- 
--	#
--	# Check if you have distutils, else fail
--	#
--	AC_MSG_CHECKING([for the distutils Python package])
--	ac_distutils_result=`$PYTHON -c "import distutils" 2>&1`
--	if test -z "$ac_distutils_result"; then
--		AC_MSG_RESULT([yes])
--	else
--		AC_MSG_RESULT([no])
--		AC_MSG_ERROR([cannot import Python module "distutils".
--Please check your Python installation. The error was:
--$ac_distutils_result])
--		PYTHON_VERSION=""
--	fi
--
- 	#
- 	# Check for Python include path
- 	#
diff --git a/meta-networking/recipes-support/openipmi/files/fix-symlink-install-error-in-cmdlang.patch b/meta-networking/recipes-support/openipmi/files/fix-symlink-install-error-in-cmdlang.patch
index 243488424..5bbccdcbf 100644
--- a/meta-networking/recipes-support/openipmi/files/fix-symlink-install-error-in-cmdlang.patch
+++ b/meta-networking/recipes-support/openipmi/files/fix-symlink-install-error-in-cmdlang.patch
@@ -1,4 +1,4 @@
-From 7854c60c92243adb14ea89e16fc226d2e47dd4f9 Mon Sep 17 00:00:00 2001
+From 0ccfefe624e25f937b27b2caf3671e80c2c29391 Mon Sep 17 00:00:00 2001
 From: Aws Ismail <aws.ismail@windriver.com>
 Date: Thu, 7 Jun 2012 16:00:13 -0400
 Subject: [PATCH] Fix symlink install error in cmdlang
@@ -9,17 +9,18 @@ creating a symbolic link for opeipmish in openipmi/cmdlang
 Upstream-Status: Pending
 
 Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
+
 ---
  cmdlang/Makefile.am | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/cmdlang/Makefile.am b/cmdlang/Makefile.am
-index 0ca3827..d9a941f 100644
+index 7235446..4a81ae3 100644
 --- a/cmdlang/Makefile.am
 +++ b/cmdlang/Makefile.am
-@@ -35,6 +35,7 @@ openipmish_LDADD =  libOpenIPMIcmdlang.la \
+@@ -41,6 +41,7 @@ openipmish_CFLAGS = -Wall -Wsign-compare -I$(top_builddir)/include \
  # compatability.
- install-data-local:
+ install-exec-hook:
  	rm -f $(DESTDIR)$(bindir)/ipmish
 +	mkdir -p $(DESTDIR)$(bindir)/
  	$(LN_S) openipmish $(DESTDIR)$(bindir)/ipmish
diff --git a/meta-networking/recipes-support/openipmi/files/include_sys_types.patch b/meta-networking/recipes-support/openipmi/files/include_sys_types.patch
index 61b39995a..18129e6fc 100644
--- a/meta-networking/recipes-support/openipmi/files/include_sys_types.patch
+++ b/meta-networking/recipes-support/openipmi/files/include_sys_types.patch
@@ -1,4 +1,4 @@
-From 4f41e090e33a00117a27f0c77b6338fb8b495f37 Mon Sep 17 00:00:00 2001
+From d667aedc37aeabdb9f8574ee0b9cf85b844ca2d2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 2 Jun 2017 21:58:32 -0700
 Subject: [PATCH] openipmi: Fix build with musl
@@ -12,12 +12,13 @@ ui.c:340:5: error: unknown type name 'u_int32_t'; did you mean 'uint32_t'?
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  ui/ui.c | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/ui/ui.c b/ui/ui.c
-index 529ff22..066d118 100644
+index 9c6a51f..34f7e34 100644
 --- a/ui/ui.c
 +++ b/ui/ui.c
 @@ -42,6 +42,7 @@
diff --git a/meta-networking/recipes-support/openipmi/files/ipmi-init-fix-the-arguments.patch b/meta-networking/recipes-support/openipmi/files/ipmi-init-fix-the-arguments.patch
index c4559c97b..d9ee5cc28 100644
--- a/meta-networking/recipes-support/openipmi/files/ipmi-init-fix-the-arguments.patch
+++ b/meta-networking/recipes-support/openipmi/files/ipmi-init-fix-the-arguments.patch
@@ -1,4 +1,4 @@
-From 6542ebe7a0d37dee8e9afb856feb8f6c3d334632 Mon Sep 17 00:00:00 2001
+From 7d9f6526dbcd46130d279c363d38781969807f74 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Mon, 29 Dec 2014 18:16:04 +0800
 Subject: [PATCH] ipmi-init: fix the arguments
@@ -10,12 +10,13 @@ not a string.
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+
 ---
  ipmi.init | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/ipmi.init b/ipmi.init
-index ea10b11..aac9f83 100644
+index bd80f0d..53305bb 100644
 --- a/ipmi.init
 +++ b/ipmi.init
 @@ -45,17 +45,17 @@ elif [ -r /etc/init.d/functions ]; then
@@ -39,4 +40,3 @@ index ea10b11..aac9f83 100644
  		echo
  		;;
  	    *)
-
diff --git a/meta-networking/recipes-support/openipmi/files/openipmi-no-openipmigui-man.patch b/meta-networking/recipes-support/openipmi/files/openipmi-no-openipmigui-man.patch
index 858adc50a..f14626a38 100644
--- a/meta-networking/recipes-support/openipmi/files/openipmi-no-openipmigui-man.patch
+++ b/meta-networking/recipes-support/openipmi/files/openipmi-no-openipmigui-man.patch
@@ -1,4 +1,4 @@
-From a6ffa3939a3ab2ad6a8d277cd8292b7dad6469c6 Mon Sep 17 00:00:00 2001
+From c76e727433ed895c605f9e7a3612bbc16ff558de Mon Sep 17 00:00:00 2001
 From: Aws Ismail <aws.ismail@windriver.com>
 Date: Thu, 7 Jun 2012 12:28:34 -0400
 Subject: [PATCH] Do not build openipmigui man page
@@ -11,6 +11,7 @@ Upstream-Status: Pending
 
 Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
 ---
  man/Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta-networking/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch b/meta-networking/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch
deleted file mode 100644
index 1aea32eae..000000000
--- a/meta-networking/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 5a4abf223d79d4e1a58bbad1e4f2f406c7cab748 Mon Sep 17 00:00:00 2001
-From: Jackie Huang <jackie.huang@windriver.com>
-Date: Mon, 29 Dec 2014 18:16:04 +0800
-Subject: [PATCH] remove host path from la_LDFLAGS
-
-Upstream-Status: Inappropriate [ cross compile specific ]
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- cmdlang/Makefile.am | 2 +-
- unix/Makefile.am    | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/cmdlang/Makefile.am b/cmdlang/Makefile.am
-index 9cf180d..da46ceb 100644
---- a/cmdlang/Makefile.am
-+++ b/cmdlang/Makefile.am
-@@ -18,7 +18,7 @@ libOpenIPMIcmdlang_la_LIBADD = -lm \
- 	$(top_builddir)/utils/libOpenIPMIutils.la \
- 	$(top_builddir)/lib/libOpenIPMI.la
- libOpenIPMIcmdlang_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
--	-L$(libdir) -no-undefined
-+	-no-undefined
- 
- bin_PROGRAMS = openipmish
- 
-diff --git a/unix/Makefile.am b/unix/Makefile.am
-index baf0815..80c3d5d 100644
---- a/unix/Makefile.am
-+++ b/unix/Makefile.am
-@@ -11,13 +11,13 @@ libOpenIPMIpthread_la_SOURCES = posix_thread_os_hnd.c selector.c
- libOpenIPMIpthread_la_LIBADD = -lpthread $(GDBM_LIB) \
- 	$(top_builddir)/utils/libOpenIPMIutils.la $(RT_LIB)
- libOpenIPMIpthread_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
--	-L$(libdir) -no-undefined
-+	-no-undefined
- 
- libOpenIPMIposix_la_SOURCES = posix_os_hnd.c selector.c
- libOpenIPMIposix_la_LIBADD = $(top_builddir)/utils/libOpenIPMIutils.la \
- 	$(GDBM_LIB) $(RT_LIB)
- libOpenIPMIposix_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
--	-L$(libdir) -no-undefined
-+	-no-undefined
- 
- noinst_HEADERS = heap.h
- 
--- 
-2.17.1
-
diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.34.bb
similarity index 87%
rename from meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb
rename to meta-networking/recipes-support/openipmi/openipmi_2.0.34.bb
index 18f4deca1..470ce1e25 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.34.bb
@@ -26,27 +26,22 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 SRC_URI = "${SOURCEFORGE_MIRROR}/openipmi/OpenIPMI-${PV}.tar.gz \
            file://fix-symlink-install-error-in-cmdlang.patch \
            file://openipmi-no-openipmigui-man.patch \
-           file://openipmi-remove-host-path-from-la_LDFLAGS.patch \
            file://ipmi-init-fix-the-arguments.patch \
            file://include_sys_types.patch \
            file://openipmi-helper \
            file://ipmi.service \
-           file://0001-m4-ax_python_devel.m4-do-not-check-for-distutils.patch \
            "
 
 S = "${WORKDIR}/OpenIPMI-${PV}"
 
-SRC_URI[md5sum] = "532404c9df7d0e8bde975b95b9e6775b"
-SRC_URI[sha256sum] = "f6d0fd4c0a74b05f80907229d0b270f54ca23294bcc11979f8b8d12766786945"
+SRC_URI[sha256sum] = "93227e43c72b5c3bd5949323e0669aa5527d1a971473a3a365af03fb8284a95f"
 
-inherit autotools-brokensep pkgconfig python3native perlnative update-rc.d systemd cpan-base python3targetconfig
+inherit autotools-brokensep pkgconfig perlnative update-rc.d systemd cpan-base python3targetconfig
 
 CFLAGS += "-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
 
 EXTRA_OECONF = "--disable-static \
                 --with-perl='${STAGING_BINDIR_NATIVE}/perl-native/perl' \
-                --with-python='${STAGING_BINDIR_NATIVE}/python3-native/python3' \
-                --with-pythoninstall='${PYTHON_SITEPACKAGES_DIR}' \
                 --with-glibver=2.0"
 
 PACKAGECONFIG ??= "gdbm"
@@ -68,9 +63,8 @@ FILES:${PN}-dbg += " \
     "
 
 do_configure () {
-
     # Let's perform regular configuration first then handle perl issues.
-    autotools_do_configure
+    PYTHON_CPPFLAGS=-I${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI} autotools_do_configure
 
     perl_ver=`perl -V:version | cut -d\' -f 2`
     
-- 
2.39.2


