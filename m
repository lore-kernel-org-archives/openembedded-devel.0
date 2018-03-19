Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 095837891A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 06:03:21 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id u11-v6so5974883plq.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 23:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XwdnI1CNT8Dx+eliVL3MToxWY3B2dIUVKmOKRMgRUp4=;
	b=ebBHdrVH8YZs8x8LNmV/ol+sxhXzNdLiA1DRT7dKNggcfGlnuxgdJwzc2dKmKl3nQL
	jgwkPkfQdilwa7yPJNPl0ZJAOZIWFI0VFQdx2O8dowOXthqb4M0xAyOSeAz0Dk8tFX+D
	CrXHTypweo2ZkBg14fPI1naAyEoWz4Izo3y/h1CAIy2CgKkjiO7lC6Clbh0FZZa99dGj
	LwP5Y4eERXFzeSe/LHar5a0HTgkneWWbx/wkGnmzJ6I4hTkl4nZzYMVctfV+vzLjXk/3
	FLUe5YVEx117b23ES9KX0HB76Eit7WTGMQxVW1PPjIQtcwRp1c3LfMkcM9Vsen+dywdM
	AY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XwdnI1CNT8Dx+eliVL3MToxWY3B2dIUVKmOKRMgRUp4=;
	b=kbPOEKHTEaiD5yGM7n2ezpKFT/QTvExRx6D4gpMwd91+i+hNiGJrr1Cn+t12oThEri
	rXZ0jEtIwO25t+VbEnhjSKOPxVY7mXGPxMC8FTJxH7XHCa7KpiYjaOx8rXAD/9KsheFo
	79DDwtgF4Pd86f1Q9CRW4eZ0eyHyLOce2LmO8ZfGAYS4x2hOxhC6oegxhctMmzYJZshJ
	9JfcPS7ddCyzozhRomwtVqHMbIaJ8eCXtdoo9QjIxqbP61ROL6TOLSUdbVe4yaF0zU8D
	YsrT4nwp3s8pwIgWgWT0rJRb/aG1f/x31BvCbAjZMdvicirQn2GsL6En5Yt4uNpZ1H90
	8y3g==
X-Gm-Message-State: AElRT7Fb+9Y77F9bwg9NHbjoBYYgGx7vkLcdI3irlkK76PsN25Fw09Ap
	w3WEPCtPC47b6IN0PukXkPsI3g==
X-Google-Smtp-Source: AG47ELtQk9l942S0vOCL+iQRKM98jl+ynbn74q3WJwFY0fFM3nqhggqi2N7pd1dGmz+WElmjeHqFYA==
X-Received: by 2002:a17:902:47aa:: with SMTP id
	r39-v6mr210309pld.59.1521439402400; 
	Sun, 18 Mar 2018 23:03:22 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	a22sm5047426pgw.10.2018.03.18.23.03.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Mar 2018 23:03:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2018 23:02:49 -0700
Message-Id: <20180319060300.5366-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180319060300.5366-1-raj.khem@gmail.com>
References: <20180319060300.5366-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 07/18] libtalloc: Upgrade to 2.1.11
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Mar 2018 06:03:21 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libtalloc/libtalloc/options-2.1.10.patch       | 58 ++++++++++++----------
 .../{libtalloc_2.1.10.bb => libtalloc_2.1.11.bb}   |  5 +-
 2 files changed, 33 insertions(+), 30 deletions(-)
 rename meta-networking/recipes-support/libtalloc/{libtalloc_2.1.10.bb => libtalloc_2.1.11.bb} (93%)

diff --git a/meta-networking/recipes-support/libtalloc/libtalloc/options-2.1.10.patch b/meta-networking/recipes-support/libtalloc/libtalloc/options-2.1.10.patch
index 35f8eaf7d..63f21e775 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc/options-2.1.10.patch
+++ b/meta-networking/recipes-support/libtalloc/libtalloc/options-2.1.10.patch
@@ -25,10 +25,10 @@ Signed-off-by: Joe Slater <joe.slater@windriver.com>
  wscript                              |  7 ++-
  3 files changed, 79 insertions(+), 19 deletions(-)
 
-diff --git a/lib/replace/system/wscript_configure b/lib/replace/system/wscript_configure
-index 2035474..10f9ae7 100644
---- a/lib/replace/system/wscript_configure
-+++ b/lib/replace/system/wscript_configure
+Index: talloc-2.1.11/lib/replace/system/wscript_configure
+===================================================================
+--- talloc-2.1.11.orig/lib/replace/system/wscript_configure
++++ talloc-2.1.11/lib/replace/system/wscript_configure
 @@ -1,6 +1,10 @@
  #!/usr/bin/env python
  
@@ -41,10 +41,10 @@ index 2035474..10f9ae7 100644
  conf.CHECK_FUNCS('getpwnam_r getpwuid_r getpwent_r')
  
  # solaris varients of getXXent_r
-diff --git a/lib/replace/wscript b/lib/replace/wscript
-index fc43e1a..12d2a70 100644
---- a/lib/replace/wscript
-+++ b/lib/replace/wscript
+Index: talloc-2.1.11/lib/replace/wscript
+===================================================================
+--- talloc-2.1.11.orig/lib/replace/wscript
++++ talloc-2.1.11/lib/replace/wscript
 @@ -23,6 +23,41 @@ def set_options(opt):
      opt.PRIVATE_EXTENSION_DEFAULT('')
      opt.RECURSE('buildtools/wafsamba')
@@ -129,38 +129,45 @@ index fc43e1a..12d2a70 100644
      conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
      conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
      conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
-@@ -248,17 +298,18 @@ def configure(conf):
- 
+@@ -267,21 +317,21 @@ def configure(conf):
      conf.CHECK_FUNCS('prctl dirname basename')
  
+     strlcpy_in_bsd = False
+-
 -    # libbsd on some platforms provides strlcpy and strlcat
 -    if not conf.CHECK_FUNCS('strlcpy strlcat'):
--        conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
--                checklibc=True)
+-        if conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
++    if Options.options.enable_libbsd:
++        # libbsd on some platforms provides strlcpy and strlcat
++        if not conf.CHECK_FUNCS('strlcpy strlcat'):
++            if conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
+                                checklibc=True):
+-            strlcpy_in_bsd = True
 -    if not conf.CHECK_FUNCS('getpeereid'):
 -        conf.CHECK_FUNCS_IN('getpeereid', 'bsd', headers='sys/types.h bsd/unistd.h')
 -    if not conf.CHECK_FUNCS_IN('setproctitle', 'setproctitle', headers='setproctitle.h'):
 -        conf.CHECK_FUNCS_IN('setproctitle', 'bsd', headers='sys/types.h bsd/unistd.h')
--
--    if not conf.CHECK_FUNCS('closefrom'):
--        conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
-+    if Options.options.enable_libbsd:
-+        # libbsd on some platforms provides strlcpy and strlcat
-+        if not conf.CHECK_FUNCS('strlcpy strlcat'):
-+            conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
-+                    checklibc=True)
+-    if not conf.CHECK_FUNCS('setproctitle_init'):
+-        conf.CHECK_FUNCS_IN('setproctitle_init', 'bsd', headers='sys/types.h bsd/unistd.h')
++                strlcpy_in_bsd = True
 +        if not conf.CHECK_FUNCS('getpeereid'):
 +            conf.CHECK_FUNCS_IN('getpeereid', 'bsd', headers='sys/types.h bsd/unistd.h')
 +        if not conf.CHECK_FUNCS_IN('setproctitle', 'setproctitle', headers='setproctitle.h'):
 +            conf.CHECK_FUNCS_IN('setproctitle', 'bsd', headers='sys/types.h bsd/unistd.h')
-+
++        if not conf.CHECK_FUNCS('setproctitle_init'):
++            conf.CHECK_FUNCS_IN('setproctitle_init', 'bsd', headers='sys/types.h bsd/unistd.h')
+ 
+-    if not conf.CHECK_FUNCS('closefrom'):
+-        conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
 +        if not conf.CHECK_FUNCS('closefrom'):
 +            conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
  
      conf.CHECK_CODE('''
                  struct ucred cred;
---- a/wscript
-+++ b/wscript
+Index: talloc-2.1.11/wscript
+===================================================================
+--- talloc-2.1.11.orig/wscript
++++ talloc-2.1.11/wscript
 @@ -32,7 +32,12 @@ def set_options(opt):
          opt.add_option('--enable-talloc-compat1',
                         help=("Build talloc 1.x.x compat library [False]"),
@@ -172,9 +179,6 @@ index fc43e1a..12d2a70 100644
 +        opt.add_option('--without-valgrind',
 +                       help=("disable use of valgrind"),
 +                       action="store_false", dest='enable_valgrind', default=False)
-
+ 
  def configure(conf):
      conf.RECURSE('lib/replace')
--- 
-2.8.3
-
diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.1.10.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.11.bb
similarity index 93%
rename from meta-networking/recipes-support/libtalloc/libtalloc_2.1.10.bb
rename to meta-networking/recipes-support/libtalloc/libtalloc_2.1.11.bb
index 23dca15fd..848cf4d99 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.1.10.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.11.bb
@@ -9,9 +9,8 @@ LIC_FILES_CHKSUM = "file://talloc.h;beginline=3;endline=27;md5=a301712782cad6dd6
 SRC_URI = "https://samba.org/ftp/talloc/talloc-${PV}.tar.gz \
            file://options-2.1.10.patch \
 "
-
-SRC_URI[md5sum] = "48b8822a76797bb143e3e38ed738c320"
-SRC_URI[sha256sum] = "c985e94bebd6ec2f6af3d95dcc3fcb192a2ddb7781a021d70ee899e26221f619"
+SRC_URI[md5sum] = "452596f904ca2b10322bdaabf147a721"
+SRC_URI[sha256sum] = "639eb35556a0af999123c4d883e79be05ff9f00ab4f9e4ac2e5775f9c5eeeed3"
 
 inherit waf-samba
 
-- 
2.16.2


