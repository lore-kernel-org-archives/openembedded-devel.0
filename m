Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4579C784F5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Feb 2018 05:35:21 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id b25so1345483pfd.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Feb 2018 21:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WIn34zKJrin94aHu9HEdHmCks9u2WGVYTXlI+iktdXo=;
	b=T9aQZxqqrGvgaAJpyaoMfF9uY2tANxNxsaAf5LXgeUfDDNo4TNJnVQFvQLt/+6Yj1s
	YHkymIwgf2/CjM2Df1ZFGlW2DrTm/gBegVCK0ZpJiBjoxtrhqhm7zzBXzXa8xAFmRV9q
	d3Cr8eCHGpnbPjYhl5gyUTiQ1edpLgoQ6NjrUjuYFhDVf/tawaaJuQSrPJ4IXNcBbcR6
	2yDWeSdDPUM9vKIbIUCRkmBgQ+gyTQJXPZl8gj3NBzVRSQj//b7HTf7SEHJZdudV7N3/
	+utPgNYkenbXsAE5v25yc53G6d6iUII7Br1icGUkCiyZYTdCb8YcH4UPgYhqC1z1JkmV
	GeTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WIn34zKJrin94aHu9HEdHmCks9u2WGVYTXlI+iktdXo=;
	b=rFhpmGCqwLjPyt9gHVuzGM3cEYrK27WQCwDgMJFfZjbYISFVGeDDriUP/XSB3X//4C
	3nwi1c2ECKhG8TJkb8efUvVn8CZzfiabuZBo3zX+xiAAld7OwF4FW+sF6MhfC+Im7mUO
	pNtr8Ur5UOrvgnXsVhsEZGvqkbN7iiM6YFtH81eByFZAEfQGaU65j21hfcb4GIyHdz1x
	Poh5maol8TUmTEorGRi9O6AYg5WahVSa6dlFEaYr8E1JlHAlXKMRexA8XTt7q6//lyty
	pqF81DGL/J3w8J/vqE1zwVdkp0CA+ndTabsgt9NIlSOPfJc8Y1r+wnhVVUH40JbLmoY0
	OWTg==
X-Gm-Message-State: APf1xPBcdKYGi8WdUpOoNcX4uTZfkC7jyLW5a4SY9OpMpubr45kjZ4Zh
	KidqGAVNecyUJfISNnca8tDdQQ==
X-Google-Smtp-Source: AH8x224FO6R9yvoqVptdYf7otoSDInM4itojWaORyywLBnPzy97TaqOZ3A/qxBjTIEtys2IsdYY5XQ==
X-Received: by 10.98.185.14 with SMTP id z14mr8294189pfe.185.1518068123133;
	Wed, 07 Feb 2018 21:35:23 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::5193])
	by smtp.gmail.com with ESMTPSA id
	k126sm8487493pfc.24.2018.02.07.21.35.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Feb 2018 21:35:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Feb 2018 21:35:13 -0800
Message-Id: <20180208053513.17273-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180208053513.17273-1-raj.khem@gmail.com>
References: <20180208053513.17273-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] libtalloc: Upgrade to 2.1.11
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
X-List-Received-Date: Thu, 08 Feb 2018 05:35:22 -0000

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
2.16.1


