Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A0A2CCA472
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 13:04:46 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.53208.1759151078221888232
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Sep 2025 06:04:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UG+z3EXr;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-61cc281171cso9706550a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 06:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759151076; x=1759755876; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iu7H8jjW9mRxD3zVtx42RlVuJbw7PWcoFokLzhNR4Fc=;
        b=UG+z3EXrRkzOWnptppW2PX1Vp7a+VQCUA/yxKr1hbtfd3oO1gRF+NNFSeRCr58CVll
         4myv0jO4btmtk/qNol/hCpz7zV9z+mjoN5yzRs5eSU7wn/BvK8D7GfkHRR8J82tTUx2s
         2dYr0q3ZYp1WUZMs/UiDPDc3Fj5YW5kwsxiaZCXQwZtzqwW28Ikl7HoBlCrwnmIjCDWd
         hpD8Ro2nqjPOP8IfuJzdGqhOGP2DHbRPcES66mJiqkQm3epNvNFRMDlDgBWEBKgAXuBi
         JDQ5Kgv85bhctruTJ9aqpAQgpRnlzhVWtdk84BvXgXChqwycVQCNGeEbsEEbJ6JKii5g
         TzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151076; x=1759755876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iu7H8jjW9mRxD3zVtx42RlVuJbw7PWcoFokLzhNR4Fc=;
        b=etT2avWTwD1h+erUP0IEdiX76t186Sb4d8GwZKzWAZFB0DGBdxBZ9V7CvjWvKc4Rr8
         0f2SD/2kxn+GDmWE3FKdgfv4t4KQH1h18aJ9fbscsxShLCRnOMtg85V4YQJiXkRKg6cK
         4+LWqIFLnA14akFkxrWvx3XdrMFoAnq070FDpWh+sTo/Fr5C6Sy5ShfXfelU8da0hz8l
         86qlN9GAr5D65M6f7z1Wm3KmlbTQf2a5KKZC8GMZeBhkWSNGmstjD+0zd7jBgEW7dsbm
         tgFPhGzQoaxn575BB74eChNF3J1p8PUbEXGaigqSxwSS/RNh27qLfOFk0rB8Kzj+kmFX
         yTXw==
X-Gm-Message-State: AOJu0YyiFR5TVcd9cMbl7qlvomA+lwYXE7l3MrAaAFrQMQvlVj8Xjow3
	sJgBzGo6jjrKtwcuVo0qu0zaW6WPwRy5lKm4IHV/aWJcRLSsHM7J5h1Trlz5HA==
X-Gm-Gg: ASbGncs5XbG9V+dWSuMzz3/KlsrBo2R5WYIBaYaY4TgckUroh2+z8OG0lsvBSoV5k+K
	g1PLcmQxjOp9FyQyrGVWqIyUkAoZ7o/YI1UAAbBddf3QqGQYa2SiqcWadfZNjE29nsyOeeKPAG8
	D0ml+nq2w4imM/jvA5QJpg8Y2l4rxyx94Iz+sA95hbTZodr/UaQwf4hwUk1pBblrWrW7Q3SDr4W
	OfE7YX8sdTtkunw0mBtvrSSDZnMRkhr3cU834Xq+xTMuTltekV2QLstPTCRW/vaaV/rjNtVVpwL
	5h5ZNStaiCBDyop8/C2by1xaQahCzETy3ra/v30Vf9vf+SBdhFbVQSGFJ8JpMrrFIoIsHBZfW4y
	oKQT9HIkUtChJ29QKRIiXtmTGm1PafjI=
X-Google-Smtp-Source: AGHT+IGbTBd1lAb9TEyX4wxj35ugGSnv0F7LJFei0qZgeWEA8ow9MMmXXJFpY6UqZ1q4kdQsoxuB5Q==
X-Received: by 2002:a17:907:d93:b0:b3f:cc6d:e0a8 with SMTP id a640c23a62f3a-b3fcc7d24f9mr289316766b.17.1759151076420;
        Mon, 29 Sep 2025 06:04:36 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3cbd81bcfdsm335426166b.82.2025.09.29.06.04.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 06:04:35 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 10/22] libtdb: upgrade 1.4.3 -> 1.4.7
Date: Mon, 29 Sep 2025 15:04:13 +0200
Message-ID: <20250929130425.2912077-11-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929130425.2912077-1-skandigraun@gmail.com>
References: <20250929130425.2912077-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 13:04:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120023

From: Yi Zhao <yi.zhao@windriver.com>

* Refresh patches
* Add a patch to skip checking PYTHONHASHSEED

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit cf53340f000b770faba44560e81a3d1e15138805)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...-Add-configure-options-for-packages.patch} | 21 +++++++------
 ...pyext_PATTERN-for-cross-compilation.patch} | 10 +++----
 ...wscript-skip-checking-PYTHONHASHSEED.patch | 30 +++++++++++++++++++
 .../{libtdb_1.4.3.bb => libtdb_1.4.7.bb}      | 12 ++++----
 4 files changed, 52 insertions(+), 21 deletions(-)
 rename meta-networking/recipes-support/libtdb/libtdb/{tdb-Add-configure-options-for-packages.patch => 0001-tdb-Add-configure-options-for-packages.patch} (93%)
 rename meta-networking/recipes-support/libtdb/libtdb/{0001-Fix-pyext_PATTERN-for-cross-compilation.patch => 0002-Fix-pyext_PATTERN-for-cross-compilation.patch} (83%)
 create mode 100644 meta-networking/recipes-support/libtdb/libtdb/0003-wscript-skip-checking-PYTHONHASHSEED.patch
 rename meta-networking/recipes-support/libtdb/{libtdb_1.4.3.bb => libtdb_1.4.7.bb} (78%)

diff --git a/meta-networking/recipes-support/libtdb/libtdb/tdb-Add-configure-options-for-packages.patch b/meta-networking/recipes-support/libtdb/libtdb/0001-tdb-Add-configure-options-for-packages.patch
similarity index 93%
rename from meta-networking/recipes-support/libtdb/libtdb/tdb-Add-configure-options-for-packages.patch
rename to meta-networking/recipes-support/libtdb/libtdb/0001-tdb-Add-configure-options-for-packages.patch
index c35cab7c2f..93a85e8545 100644
--- a/meta-networking/recipes-support/libtdb/libtdb/tdb-Add-configure-options-for-packages.patch
+++ b/meta-networking/recipes-support/libtdb/libtdb/0001-tdb-Add-configure-options-for-packages.patch
@@ -1,4 +1,4 @@
-From 71a10c176c34da898c0169371b3c1b032d2f88b1 Mon Sep 17 00:00:00 2001
+From d3b1d23e01e323b9610843ab6bef096512f6c244 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 19 Jun 2019 17:53:34 +0800
 Subject: [PATCH] tdb: Add configure options for packages
@@ -19,12 +19,12 @@ Update to 1.4.0
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- lib/replace/wscript | 94 ++++++++++++++++++++++++++++++++++++++++-------------
- wscript             |  6 ++++
- 2 files changed, 78 insertions(+), 22 deletions(-)
+ lib/replace/wscript | 92 ++++++++++++++++++++++++++++++++++-----------
+ wscript             |  6 +++
+ 2 files changed, 77 insertions(+), 21 deletions(-)
 
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index 1d01e1e..2336dc3 100644
+index 827d74f..70cde6f 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
 @@ -25,6 +25,41 @@ def options(opt):
@@ -69,7 +69,7 @@ index 1d01e1e..2336dc3 100644
  @Utils.run_once
  def configure(conf):
      conf.RECURSE('buildtools/wafsamba')
-@@ -34,12 +69,25 @@ def configure(conf):
+@@ -35,12 +70,25 @@ def configure(conf):
      conf.DEFINE('HAVE_LIBREPLACE', 1)
      conf.DEFINE('LIBREPLACE_NETWORK_CHECKS', 1)
  
@@ -78,10 +78,9 @@ index 1d01e1e..2336dc3 100644
 +    conf.CHECK_HEADERS('linux/types.h crypt.h locale.h compat.h')
 +    conf.CHECK_HEADERS('attr/xattr.h compat.h ctype.h dustat.h')
      conf.CHECK_HEADERS('fcntl.h fnmatch.h glob.h history.h krb5.h langinfo.h')
--    conf.CHECK_HEADERS('locale.h ndir.h pwd.h')
+     conf.CHECK_HEADERS('locale.h ndir.h pwd.h')
 -    conf.CHECK_HEADERS('shadow.h sys/acl.h')
 -    conf.CHECK_HEADERS('sys/attributes.h attr/attributes.h sys/capability.h sys/dir.h sys/epoll.h')
-+    conf.CHECK_HEADERS('locale.h ndir.h pwd.h')
 +    conf.CHECK_HEADERS('shadow.h')
 +    conf.CHECK_HEADERS('sys/attributes.h sys/dir.h sys/epoll.h')
 +
@@ -114,7 +113,7 @@ index 1d01e1e..2336dc3 100644
      conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
      conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
      conf.CHECK_HEADERS('syscall.h sys/syscall.h inttypes.h')
-@@ -380,20 +429,21 @@ def configure(conf):
+@@ -431,20 +480,21 @@ def configure(conf):
  
      strlcpy_in_bsd = False
  
@@ -151,7 +150,7 @@ index 1d01e1e..2336dc3 100644
      conf.CHECK_CODE('''
                  struct ucred cred;
 diff --git a/wscript b/wscript
-index 5598d02..8d47244 100644
+index 71ada31..10b16a7 100644
 --- a/wscript
 +++ b/wscript
 @@ -69,6 +69,12 @@ def options(opt):
@@ -168,5 +167,5 @@ index 5598d02..8d47244 100644
  def configure(conf):
      conf.env.disable_tdb_mutex_locking = getattr(Options.options,
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-networking/recipes-support/libtdb/libtdb/0001-Fix-pyext_PATTERN-for-cross-compilation.patch b/meta-networking/recipes-support/libtdb/libtdb/0002-Fix-pyext_PATTERN-for-cross-compilation.patch
similarity index 83%
rename from meta-networking/recipes-support/libtdb/libtdb/0001-Fix-pyext_PATTERN-for-cross-compilation.patch
rename to meta-networking/recipes-support/libtdb/libtdb/0002-Fix-pyext_PATTERN-for-cross-compilation.patch
index 6f221989fa..6bd118b536 100644
--- a/meta-networking/recipes-support/libtdb/libtdb/0001-Fix-pyext_PATTERN-for-cross-compilation.patch
+++ b/meta-networking/recipes-support/libtdb/libtdb/0002-Fix-pyext_PATTERN-for-cross-compilation.patch
@@ -1,4 +1,4 @@
-From 00bd6680ad38c20c95a35c963d7077269f3a3aa2 Mon Sep 17 00:00:00 2001
+From 10b4546edb194ede7a5e8bb5e4c9f5fdc67984eb Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Wed, 24 Nov 2021 13:33:35 +0800
 Subject: [PATCH] Fix pyext_PATTERN for cross compilation
@@ -25,18 +25,18 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/third_party/waf/waflib/Tools/python.py b/third_party/waf/waflib/Tools/python.py
-index 7c45a76..c9a90f7 100644
+index a23bd01..af202e0 100644
 --- a/third_party/waf/waflib/Tools/python.py
 +++ b/third_party/waf/waflib/Tools/python.py
 @@ -328,7 +328,7 @@ def check_python_headers(conf, features='pyembed pyext'):
  	x = 'MACOSX_DEPLOYMENT_TARGET'
  	if dct[x]:
- 		env[x] = conf.environ[x] = dct[x]
--	env.pyext_PATTERN = '%s' + dct['SO'] # not a mistake
+ 		env[x] = conf.environ[x] = str(dct[x])
+-	env.pyext_PATTERN = '%s' + (dct['EXT_SUFFIX'] or dct['SO']) # SO is deprecated in 3.5 and removed in 3.11
 +	env.pyext_PATTERN = '%s.so'
  
  
  	# Try to get pythonX.Y-config
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-networking/recipes-support/libtdb/libtdb/0003-wscript-skip-checking-PYTHONHASHSEED.patch b/meta-networking/recipes-support/libtdb/libtdb/0003-wscript-skip-checking-PYTHONHASHSEED.patch
new file mode 100644
index 0000000000..ebe3198f16
--- /dev/null
+++ b/meta-networking/recipes-support/libtdb/libtdb/0003-wscript-skip-checking-PYTHONHASHSEED.patch
@@ -0,0 +1,30 @@
+From b5864f0d542485c4fbfeb7b02fdd99e0b4e1dbc7 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Wed, 28 Dec 2022 16:31:05 +0800
+Subject: [PATCH] wscript: skip checking PYTHONHASHSEED
+
+Skip checking PYTHONHASHSEED as it is set to 0 in oe-core by default.
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ buildtools/wafsamba/wscript | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/buildtools/wafsamba/wscript b/buildtools/wafsamba/wscript
+index 8729b08..a4d6f3e 100644
+--- a/buildtools/wafsamba/wscript
++++ b/buildtools/wafsamba/wscript
+@@ -8,10 +8,6 @@ import wafsamba
+ from samba_utils import symlink
+ from optparse import SUPPRESS_HELP
+ 
+-phs = os.environ.get("PYTHONHASHSEED", None)
+-if phs != "1":
+-    raise Errors.WafError('''PYTHONHASHSEED=1 missing! Don't use waf directly, use ./configure and make!''')
+-
+ # this forces configure to be re-run if any of the configure
+ # sections of the build scripts change. We have to check
+ # for this in sys.argv as options have not yet been parsed when
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.4.3.bb b/meta-networking/recipes-support/libtdb/libtdb_1.4.7.bb
similarity index 78%
rename from meta-networking/recipes-support/libtdb/libtdb_1.4.3.bb
rename to meta-networking/recipes-support/libtdb/libtdb_1.4.7.bb
index 2affcf754e..6775e6f061 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.4.3.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.4.7.bb
@@ -1,5 +1,5 @@
 SUMMARY = "The tdb library"
-HOMEPAGE = "http://tdb.samba.org/"
+HOMEPAGE = "https://tdb.samba.org/"
 SECTION = "libs"
 LICENSE = "LGPL-3.0-or-later & GPL-3.0-or-later"
 
@@ -7,12 +7,13 @@ LIC_FILES_CHKSUM = "file://tools/tdbdump.c;endline=18;md5=b59cd45aa8624578126a8c
                     file://include/tdb.h;endline=27;md5=f5bb544641d3081821bcc1dd58310be6"
 
 SRC_URI = "https://samba.org/ftp/tdb/tdb-${PV}.tar.gz \
-           file://tdb-Add-configure-options-for-packages.patch \
-           file://0001-Fix-pyext_PATTERN-for-cross-compilation.patch \
+           file://0001-tdb-Add-configure-options-for-packages.patch \
+           file://0002-Fix-pyext_PATTERN-for-cross-compilation.patch \
+           file://0003-wscript-skip-checking-PYTHONHASHSEED.patch \
 "
 
-SRC_URI[md5sum] = "e638e8890f743624a754304b3f994f4d"
-SRC_URI[sha256sum] = "c8058393dfa15f47e11ebd2f1d132693f0b3b3b8bf22d0201bfb305026f88a1b"
+SRC_URI[md5sum] = "bc27d5b20c7f013305c40b3bced43b3a"
+SRC_URI[sha256sum] = "a4fb168def533f31ff2c07f7d9844bb3131e6799f094ebe77d0380adc987c20e"
 
 PACKAGECONFIG ??= "\
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)} \
@@ -35,6 +36,7 @@ inherit waf-samba
 export WAF_NO_PREFORK="yes"
 
 EXTRA_OECONF += "--disable-rpath \
+                 --disable-rpath-install \
                  --bundled-libraries=NONE \
                  --builtin-libraries=replace \
                  --with-libiconv=${STAGING_DIR_HOST}${prefix}\

