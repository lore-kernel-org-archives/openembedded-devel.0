Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id D87617F4F9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 21:37:42 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id w16so6720084pfn.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 14:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=wWSd0Sp3FL6qz6Ek50cm50pXjxpReD7ufYozeleZOUY=;
	b=I54cV/MyTW9icnkkkiiBzASdGydvxbDsAmnsB7elnZphfQh1UMmyPJidR7kiJcr543
	ubC+ErtQaqR7pIna0133eTTdt4XZzIhUtd1XbsusYcORTFfAQjvd0GYDHDk4d8voaxRO
	mdYsT5AJU5wNbIn8VZWvm4sfXh0BlCMOm0fHfIaatkZwZBUr5eJD7FM/uwHGGiWZk+go
	VS9mHto5Wv0fNPBv85myl3AZc+gVECNcJrI7KTFwZCXROTfWi1s+dteRw5mgGjofzpRI
	SnBvsPHJZqFcvrOM2i19ppybP6rTIvwZqQ0guyyrrjOppCowKUkD7jGtI4OrYfn3UP/F
	qrUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=wWSd0Sp3FL6qz6Ek50cm50pXjxpReD7ufYozeleZOUY=;
	b=Yvl3hAAFEpeQnmqyYoTz/sZcvetad4SiA7cxo2BTDcgjCOJxs/51OjuPmWXXdFwa5Y
	xxG7Up/vSD0gt4UTdFw+IyV/bSAuuqvcAzir8xaAJkZTXeNV1osFsb4RktwO5InDRk5g
	V6Rkg6HlL2LnKf16jAWhwC23dH4ivWet+e7BbgskV4YZYJgiaPMkMd44XmK8L7bIbjJF
	VyzFE/lW8ZdL7Btlw28dvneUr78Dj0lrXouLq42b5k/youav1RmvcwwxY8QlWFJBUXAB
	SzokrZoin/mkJW/u2VcwrcNlk1hG7y8CHgB8LkcSXvNtKPX8Gss6+yG++Z5flAdk+EjD
	xoog==
X-Gm-Message-State: APjAAAUgyBJXS4QVBLfmpjUQl8NRiZeQ/KS+rVAIWcHaKVASSczMzX73
	HJnJc7XDLxRmszakYl5ahgr0MEIs
X-Google-Smtp-Source: APXvYqw4PGX3D1XkdbPE1nuOqoAth3e906/71isJrYEMlSJg8eYEcXdM+zItXLjxPDi7fX9cI7YSaQ==
X-Received: by 2002:a63:184b:: with SMTP id 11mr19652196pgy.112.1567287463290; 
	Sat, 31 Aug 2019 14:37:43 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8107:6109:754a:f033])
	by smtp.gmail.com with ESMTPSA id d6sm9443836pgf.55.2019.08.31.14.37.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 31 Aug 2019 14:37:42 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Aug 2019 14:37:36 -0700
Message-Id: <b5fed3c566a579be8725e8b0fdd97a529eef831d.1567287402.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567287402.git.akuster808@gmail.com>
References: <cover.1567287402.git.akuster808@gmail.com>
Subject: [thud 2/4] apache2: upgrade 2.4.34 -> 2.4.39
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
X-List-Received-Date: Sat, 31 Aug 2019 21:37:43 -0000

From: Yi Zhao <yi.zhao@windriver.com>

* Drop apache2-native recipe.
  Add native to BBCLASSEXTEND in apache2 recipe.

* Refresh patches.
  Drop CVE-2018-11763.patch and apache-configure_perlbin.patch

* Cleanup recipe file. Remove obsolete code.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
[Bug fix only update:
Includes CVES: CVE-2018-17189
               CVE-2018-17199
               CVE-2019-0190
               CVE-2019-0220
               CVE-2019-0196
               CVE-2019-0197
               CVE-2019-0215
               CVE-2019-0217
               CVE-2019-0211
               ]
Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-httpd/apache2/apache2-native_2.4.34.bb |  46 --
 ...nfigure-use-pkg-config-for-PCRE-detection.patch |   8 +-
 ...-up-the-core-size-limit-if-CoreDumpDirec.patch} |  12 +-
 ...ot-export-apr-apr-util-symbols-when-usin.patch} |  10 +-
 ...ache2-log-the-SELinux-context-at-startup.patch} |  23 +-
 ...replace-lynx-to-curl-in-apachectl-script.patch} |   6 +-
 ...-the-race-issue-of-parallel-installation.patch} |   6 +-
 ...apache2-allow-to-disable-selinux-support.patch} |   8 +-
 ...-not-use-relative-path-for-gen_test_char.patch} |   8 +-
 .../apache2/apache2/CVE-2018-11763.patch           | 512 ---------------------
 .../apache2/apache2/apache-configure_perlbin.patch |  27 --
 .../{apache2_2.4.34.bb => apache2_2.4.39.bb}       | 204 ++++----
 meta-webserver/recipes-httpd/apache2/files/init    |   0
 13 files changed, 157 insertions(+), 713 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2-native_2.4.34.bb
 rename meta-webserver/recipes-httpd/apache2/apache2/{httpd-2.4.1-corelimit.patch => 0002-apache2-bump-up-the-core-size-limit-if-CoreDumpDirec.patch} (83%)
 rename meta-webserver/recipes-httpd/apache2/apache2/{httpd-2.4.4-export.patch => 0003-apache2-do-not-export-apr-apr-util-symbols-when-usin.patch} (80%)
 rename meta-webserver/recipes-httpd/apache2/apache2/{httpd-2.4.1-selinux.patch => 0004-apache2-log-the-SELinux-context-at-startup.patch} (85%)
 rename meta-webserver/recipes-httpd/apache2/apache2/{replace-lynx-to-curl-in-apachectl-script.patch => 0005-replace-lynx-to-curl-in-apachectl-script.patch} (95%)
 rename meta-webserver/recipes-httpd/apache2/apache2/{httpd-2.4.3-fix-race-issue-of-dir-install.patch => 0006-apache2-fix-the-race-issue-of-parallel-installation.patch} (94%)
 rename meta-webserver/recipes-httpd/apache2/apache2/{configure-allow-to-disable-selinux-support.patch => 0007-apache2-allow-to-disable-selinux-support.patch} (91%)
 rename meta-webserver/recipes-httpd/apache2/apache2/{server-makefile.patch => 0008-apache2-do-not-use-relative-path-for-gen_test_char.patch} (76%)
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2/CVE-2018-11763.patch
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2/apache-configure_perlbin.patch
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.34.bb => apache2_2.4.39.bb} (61%)
 mode change 100755 => 100644 meta-webserver/recipes-httpd/apache2/files/init

diff --git a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.34.bb b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.34.bb
deleted file mode 100644
index 4cc3845..0000000
--- a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.34.bb
+++ /dev/null
@@ -1,46 +0,0 @@
-DESCRIPTION = "The Apache HTTP Server is a powerful, efficient, and \
-extensible web server."
-SUMMARY = "Apache HTTP Server"
-HOMEPAGE = "http://httpd.apache.org/"
-DEPENDS = "expat-native pcre-native apr-native apr-util-native"
-SECTION = "net"
-LICENSE = "Apache-2.0"
-
-inherit autotools pkgconfig native
-
-SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
-           file://0001-configure-use-pkg-config-for-PCRE-detection.patch \
-           file://CVE-2018-11763.patch \
-          "
-
-S = "${WORKDIR}/httpd-${PV}"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d52d0fd0bc788f068e647116c01ddfcd"
-SRC_URI[md5sum] = "818adca52f3be187fe45d6822755be95"
-SRC_URI[sha256sum] = "fa53c95631febb08a9de41fd2864cfff815cf62d9306723ab0d4b8d7aa1638f0"
-
-EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
-                --with-apr-util=${STAGING_BINDIR_CROSS}/apu-1-config \
-                --prefix=${prefix} --datadir=${datadir}/apache2 \
-               "
-
-do_install () {
-    install -d ${D}${bindir} ${D}${libdir}
-    cp server/gen_test_char ${D}${bindir}
-    install -m 755 support/apxs ${D}${bindir}/
-    install -m 755 httpd ${D}${bindir}/
-    install -d ${D}${datadir}/apache2/build
-    cp ${S}/build/*.mk ${D}${datadir}/apache2/build
-    cp build/*.mk ${D}${datadir}/apache2/build
-    cp ${S}/build/instdso.sh ${D}${datadir}/apache2/build
-
-    install -d ${D}${includedir}/apache2
-    cp ${S}/include/* ${D}${includedir}/apache2
-    cp include/* ${D}${includedir}/apache2
-    cp ${S}/os/unix/os.h ${D}${includedir}/apache2
-    cp ${S}/os/unix/unixd.h ${D}${includedir}/apache2
-
-    cp support/envvars-std ${D}${bindir}/envvars
-    chmod 755 ${D}${bindir}/envvars
-}
-
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0001-configure-use-pkg-config-for-PCRE-detection.patch b/meta-webserver/recipes-httpd/apache2/apache2/0001-configure-use-pkg-config-for-PCRE-detection.patch
index da38a8c..6c02864 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/0001-configure-use-pkg-config-for-PCRE-detection.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0001-configure-use-pkg-config-for-PCRE-detection.patch
@@ -1,4 +1,4 @@
-From 419181e242892ded050f5a375a709b9588fb581d Mon Sep 17 00:00:00 2001
+From d2cedfa3394365689a3f7c8cfe8e0dd56b29bed9 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen.kooi@linaro.org>
 Date: Tue, 17 Jun 2014 09:10:57 +0200
 Subject: [PATCH] configure: use pkg-config for PCRE detection
@@ -6,13 +6,12 @@ Subject: [PATCH] configure: use pkg-config for PCRE detection
 Upstream-Status: Pending
 
 Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
-
 ---
  configure.in | 27 +++++----------------------
  1 file changed, 5 insertions(+), 22 deletions(-)
 
 diff --git a/configure.in b/configure.in
-index be7bd25..54dfd0d 100644
+index 9feaceb..dc6ea15 100644
 --- a/configure.in
 +++ b/configure.in
 @@ -215,28 +215,11 @@ fi
@@ -49,3 +48,6 @@ index be7bd25..54dfd0d 100644
  APACHE_SUBST(PCRE_LIBS)
  
  AC_MSG_NOTICE([])
+-- 
+2.7.4
+
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/httpd-2.4.1-corelimit.patch b/meta-webserver/recipes-httpd/apache2/apache2/0002-apache2-bump-up-the-core-size-limit-if-CoreDumpDirec.patch
similarity index 83%
rename from meta-webserver/recipes-httpd/apache2/apache2/httpd-2.4.1-corelimit.patch
rename to meta-webserver/recipes-httpd/apache2/apache2/0002-apache2-bump-up-the-core-size-limit-if-CoreDumpDirec.patch
index ae4ff0c..85fe6ae 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/httpd-2.4.1-corelimit.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0002-apache2-bump-up-the-core-size-limit-if-CoreDumpDirec.patch
@@ -1,7 +1,8 @@
-From 55ebb07cc57854cbfb372c3a688365039b809bc8 Mon Sep 17 00:00:00 2001
+From 7df207ad4d0dcda2ad36e5642296e0dec7e13647 Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Tue, 17 Jul 2012 11:27:39 +0100
-Subject: [PATCH] apache2: add from OE-Classic, update to version 2.4.2 and fix
+Subject: [PATCH] apache2: bump up the core size limit if CoreDumpDirectory
+ is configured
 
 Bump up the core size limit if CoreDumpDirectory is
 configured.
@@ -16,10 +17,10 @@ Note: upstreaming was discussed but there are competing desires;
  1 file changed, 19 insertions(+)
 
 diff --git a/server/core.c b/server/core.c
-index 4af0816..4fd2b9f 100644
+index eacb54f..7aa841f 100644
 --- a/server/core.c
 +++ b/server/core.c
-@@ -4940,6 +4940,25 @@ static int core_post_config(apr_pool_t *pconf, apr_pool_t *plog, apr_pool_t *pte
+@@ -4965,6 +4965,25 @@ static int core_post_config(apr_pool_t *pconf, apr_pool_t *plog, apr_pool_t *pte
      }
      apr_pool_cleanup_register(pconf, NULL, ap_mpm_end_gen_helper,
                                apr_pool_cleanup_null);
@@ -45,3 +46,6 @@ index 4af0816..4fd2b9f 100644
      return OK;
  }
  
+-- 
+2.7.4
+
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/httpd-2.4.4-export.patch b/meta-webserver/recipes-httpd/apache2/apache2/0003-apache2-do-not-export-apr-apr-util-symbols-when-usin.patch
similarity index 80%
rename from meta-webserver/recipes-httpd/apache2/apache2/httpd-2.4.4-export.patch
rename to meta-webserver/recipes-httpd/apache2/apache2/0003-apache2-do-not-export-apr-apr-util-symbols-when-usin.patch
index 843226c..081a02b 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/httpd-2.4.4-export.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0003-apache2-do-not-export-apr-apr-util-symbols-when-usin.patch
@@ -1,7 +1,8 @@
-From a5627edbcc88cd50caaa42ca051ac7ed3d870172 Mon Sep 17 00:00:00 2001
+From ddd560024a6d526187fd126f306b59533ca3f7e2 Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Tue, 17 Jul 2012 11:27:39 +0100
-Subject: [PATCH] apache2: add from OE-Classic, update to version 2.4.2 and fix
+Subject: [PATCH] apache2: do not export apr/apr-util symbols when using
+ shared libapr
 
 There is no need to "suck in" the apr/apr-util symbols when using
 a shared libapr{,util}, it just bloats the symbol table; so don't.
@@ -15,7 +16,7 @@ Note: EXPORT_DIRS change is conditional on using shared apr
  1 file changed, 3 deletions(-)
 
 diff --git a/server/Makefile.in b/server/Makefile.in
-index cb11684..0d48924 100644
+index 1fa3344..f635d76 100644
 --- a/server/Makefile.in
 +++ b/server/Makefile.in
 @@ -60,9 +60,6 @@ export_files:
@@ -28,3 +29,6 @@ index cb11684..0d48924 100644
  	) | sed -e s,//,/,g | sort -u > $@
  
  exports.c: export_files
+-- 
+2.7.4
+
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/httpd-2.4.1-selinux.patch b/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch
similarity index 85%
rename from meta-webserver/recipes-httpd/apache2/apache2/httpd-2.4.1-selinux.patch
rename to meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch
index 015034c..78a04d9 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/httpd-2.4.1-selinux.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch
@@ -1,4 +1,4 @@
-From 33c0f2d88ccfe02777f183eb785bb2b891aff168 Mon Sep 17 00:00:00 2001
+From dfa834ebd449df299f54e98f0fb3a7bb4008fb03 Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Tue, 17 Jul 2012 11:27:39 +0100
 Subject: [PATCH] Log the SELinux context at startup.
@@ -15,10 +15,10 @@ Note: unlikely to be any interest in this upstream
  2 files changed, 31 insertions(+)
 
 diff --git a/configure.in b/configure.in
-index 761e836..d828512 100644
+index dc6ea15..caa6f54 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -483,6 +483,11 @@ getloadavg
+@@ -466,6 +466,11 @@ getloadavg
  dnl confirm that a void pointer is large enough to store a long integer
  APACHE_CHECK_VOID_PTR_LEN
  
@@ -31,7 +31,7 @@ index 761e836..d828512 100644
  [AC_TRY_RUN(#define _GNU_SOURCE
  #include <unistd.h>
 diff --git a/server/core.c b/server/core.c
-index 4fd2b9f..c61304a 100644
+index 7aa841f..79f34db 100644
 --- a/server/core.c
 +++ b/server/core.c
 @@ -59,6 +59,10 @@
@@ -45,7 +45,7 @@ index 4fd2b9f..c61304a 100644
  /* LimitRequestBody handling */
  #define AP_LIMIT_REQ_BODY_UNSET         ((apr_off_t) -1)
  #define AP_DEFAULT_LIMIT_REQ_BODY       ((apr_off_t) 0)
-@@ -4959,6 +4963,28 @@ static int core_post_config(apr_pool_t *pconf, apr_pool_t *plog, apr_pool_t *pte
+@@ -4984,6 +4988,28 @@ static int core_post_config(apr_pool_t *pconf, apr_pool_t *plog, apr_pool_t *pte
      }
  #endif
  
@@ -53,18 +53,18 @@ index 4fd2b9f..c61304a 100644
 +    {
 +        static int already_warned = 0;
 +        int is_enabled = is_selinux_enabled() > 0;
-+        
++
 +        if (is_enabled && !already_warned) {
 +            security_context_t con;
-+            
++
 +            if (getcon(&con) == 0) {
-+                
++
 +                ap_log_error(APLOG_MARK, APLOG_NOTICE, 0, NULL,
 +                             "SELinux policy enabled; "
 +                             "httpd running as context %s", con);
-+                
++
 +                already_warned = 1;
-+                
++
 +                freecon(con);
 +            }
 +        }
@@ -74,3 +74,6 @@ index 4fd2b9f..c61304a 100644
      return OK;
  }
  
+-- 
+2.7.4
+
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/replace-lynx-to-curl-in-apachectl-script.patch b/meta-webserver/recipes-httpd/apache2/apache2/0005-replace-lynx-to-curl-in-apachectl-script.patch
similarity index 95%
rename from meta-webserver/recipes-httpd/apache2/apache2/replace-lynx-to-curl-in-apachectl-script.patch
rename to meta-webserver/recipes-httpd/apache2/apache2/0005-replace-lynx-to-curl-in-apachectl-script.patch
index 020f1d7..47320a9 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/replace-lynx-to-curl-in-apachectl-script.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0005-replace-lynx-to-curl-in-apachectl-script.patch
@@ -1,4 +1,4 @@
-From 94a9e2241ea27e75babbfdeb38043b13049e23b0 Mon Sep 17 00:00:00 2001
+From 7db1b650bb4b01a5194a34cd7573f915656a595b Mon Sep 17 00:00:00 2001
 From: Yulong Pei <Yulong.pei@windriver.com>
 Date: Thu, 1 Sep 2011 01:03:14 +0800
 Subject: [PATCH] replace lynx to curl in apachectl script
@@ -6,7 +6,6 @@ Subject: [PATCH] replace lynx to curl in apachectl script
 Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Yulong Pei <Yulong.pei@windriver.com>
-
 ---
  support/apachectl.in | 14 ++++++++++----
  1 file changed, 10 insertions(+), 4 deletions(-)
@@ -48,3 +47,6 @@ index 3281c2e..6ab4ba5 100644
      ;;
  *)
      $HTTPD "$@"
+-- 
+2.7.4
+
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/httpd-2.4.3-fix-race-issue-of-dir-install.patch b/meta-webserver/recipes-httpd/apache2/apache2/0006-apache2-fix-the-race-issue-of-parallel-installation.patch
similarity index 94%
rename from meta-webserver/recipes-httpd/apache2/apache2/httpd-2.4.3-fix-race-issue-of-dir-install.patch
rename to meta-webserver/recipes-httpd/apache2/apache2/0006-apache2-fix-the-race-issue-of-parallel-installation.patch
index 2262e9f..227d040 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/httpd-2.4.3-fix-race-issue-of-dir-install.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0006-apache2-fix-the-race-issue-of-parallel-installation.patch
@@ -1,4 +1,4 @@
-From 3b079a9df7582e305246fd805837d87a2c4ef534 Mon Sep 17 00:00:00 2001
+From 4f4d7d6b88b6e440263ebeb22dfb40c52bb30fd8 Mon Sep 17 00:00:00 2001
 From: Zhenhua Luo <zhenhua.luo@freescale.com>
 Date: Fri, 25 Jan 2013 18:10:50 +0800
 Subject: [PATCH] apache2: fix the race issue of parallel installation
@@ -13,7 +13,6 @@ fix following race issue when do parallel install
 | make[1]: *** Waiting for unfinished jobs....
 
 Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
-
 ---
  build/mkdir.sh | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -31,3 +30,6 @@ index e2d5bb6..dde5ae0 100755
          fi
          pathcomp="$pathcomp/"
      done
+-- 
+2.7.4
+
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/configure-allow-to-disable-selinux-support.patch b/meta-webserver/recipes-httpd/apache2/apache2/0007-apache2-allow-to-disable-selinux-support.patch
similarity index 91%
rename from meta-webserver/recipes-httpd/apache2/apache2/configure-allow-to-disable-selinux-support.patch
rename to meta-webserver/recipes-httpd/apache2/apache2/0007-apache2-allow-to-disable-selinux-support.patch
index a6ccfb6..fed6b50 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/configure-allow-to-disable-selinux-support.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0007-apache2-allow-to-disable-selinux-support.patch
@@ -1,4 +1,4 @@
-From 166cbc02f72d13d5e7bf08ac2351c0f07e1ff4b9 Mon Sep 17 00:00:00 2001
+From 964ef2c1af74984602f46e7db938d3b95b148385 Mon Sep 17 00:00:00 2001
 From: Wenzong Fan <wenzong.fan@windriver.com>
 Date: Mon, 1 Dec 2014 02:08:27 -0500
 Subject: [PATCH] apache2: allow to disable selinux support
@@ -6,13 +6,12 @@ Subject: [PATCH] apache2: allow to disable selinux support
 Upstream-Status: Pending
 
 Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
-
 ---
  configure.in | 14 ++++++++++----
  1 file changed, 10 insertions(+), 4 deletions(-)
 
 diff --git a/configure.in b/configure.in
-index 54dfd0d..377e062 100644
+index caa6f54..eab2090 100644
 --- a/configure.in
 +++ b/configure.in
 @@ -466,10 +466,16 @@ getloadavg
@@ -36,3 +35,6 @@ index 54dfd0d..377e062 100644
  
  AC_CACHE_CHECK([for gettid()], ac_cv_gettid,
  [AC_TRY_RUN(#define _GNU_SOURCE
+-- 
+2.7.4
+
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/server-makefile.patch b/meta-webserver/recipes-httpd/apache2/apache2/0008-apache2-do-not-use-relative-path-for-gen_test_char.patch
similarity index 76%
rename from meta-webserver/recipes-httpd/apache2/apache2/server-makefile.patch
rename to meta-webserver/recipes-httpd/apache2/apache2/0008-apache2-do-not-use-relative-path-for-gen_test_char.patch
index 5476d4f..82e9e8c 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/server-makefile.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0008-apache2-do-not-use-relative-path-for-gen_test_char.patch
@@ -1,6 +1,7 @@
-From aa02bbfd8f16871db5563a95fa94dd170964949f Mon Sep 17 00:00:00 2001
+From b62c4cd2295c98b2ebe12641e5f01590bd96ae94 Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Tue, 17 Jul 2012 11:27:39 +0100
+Subject: [PATCH] apache2: do not use relative path for gen_test_char
 
 Upstream-Status: Inappropriate [embedded specific]
 
@@ -9,7 +10,7 @@ Upstream-Status: Inappropriate [embedded specific]
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/server/Makefile.in b/server/Makefile.in
-index 1fa3344..cb11684 100644
+index f635d76..0d48924 100644
 --- a/server/Makefile.in
 +++ b/server/Makefile.in
 @@ -29,7 +29,7 @@ gen_test_char: $(gen_test_char_OBJECTS)
@@ -21,3 +22,6 @@ index 1fa3344..cb11684 100644
  
  util.lo: test_char.h
  
+-- 
+2.7.4
+
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/CVE-2018-11763.patch b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2018-11763.patch
deleted file mode 100644
index a2c5b2e..0000000
--- a/meta-webserver/recipes-httpd/apache2/apache2/CVE-2018-11763.patch
+++ /dev/null
@@ -1,512 +0,0 @@
-From 484aba5048e3457dc1d15189f1910d007b1a4a76 Mon Sep 17 00:00:00 2001
-From: Jim Jagielski <jim@apache.org>
-Date: Wed, 12 Sep 2018 20:38:02 +0000
-Subject: [PATCH] Merge r1840010 from trunk:
-
-On the trunk:
-
-mod_http2: connection IO event handling reworked. Instead of reacting on
-     incoming bytes, the state machine now acts on incoming frames that are
-     affecting it. This reduces state transitions.
-
-
-Submitted by: icing
-Reviewed by: icing, ylavic, jim
-
-
-git-svn-id: https://svn.apache.org/repos/asf/httpd/httpd/branches/2.4.x@1840757 13f79535-47bb-0310-9956-ffa450edef68
-CVE: CVE-2018-11763
-Upstream-Status: Backport [https://github.com/apache/httpd/commit/484aba5048e3457dc1d15189f1910d007b1a4a76]
-
-Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
----
- modules/http2/h2_session.c | 238 +++++++++++++++++++++++--------------
- modules/http2/h2_session.h |   7 +-
- modules/http2/h2_version.h |   4 +-
- 3 files changed, 158 insertions(+), 97 deletions(-)
-
-diff --git a/modules/http2/h2_session.c b/modules/http2/h2_session.c
-index 805d6774dc..a1b31d2b30 100644
---- a/modules/http2/h2_session.c
-+++ b/modules/http2/h2_session.c
-@@ -235,6 +235,7 @@ static int on_data_chunk_recv_cb(nghttp2_session *ngh2, uint8_t flags,
-     stream = h2_session_stream_get(session, stream_id);
-     if (stream) {
-         status = h2_stream_recv_DATA(stream, flags, data, len);
-+        dispatch_event(session, H2_SESSION_EV_STREAM_CHANGE, 0, "stream data rcvd");
-     }
-     else {
-         ap_log_cerror(APLOG_MARK, APLOG_DEBUG, 0, session->c, APLOGNO(03064)
-@@ -317,9 +318,9 @@ static int on_header_cb(nghttp2_session *ngh2, const nghttp2_frame *frame,
- }
- 
- /**
-- * nghttp2 session has received a complete frame. Most, it uses
-- * for processing of internal state. HEADER and DATA frames however
-- * we need to handle ourself.
-+ * nghttp2 session has received a complete frame. Most are used by nghttp2
-+ * for processing of internal state. Some, like HEADER and DATA frames,
-+ * we need to act on.
-  */
- static int on_frame_recv_cb(nghttp2_session *ng2s,
-                             const nghttp2_frame *frame,
-@@ -378,6 +379,9 @@ static int on_frame_recv_cb(nghttp2_session *ng2s,
-                           "h2_stream(%ld-%d): WINDOW_UPDATE incr=%d", 
-                           session->id, (int)frame->hd.stream_id,
-                           frame->window_update.window_size_increment);
-+            if (nghttp2_session_want_write(session->ngh2)) {
-+                dispatch_event(session, H2_SESSION_EV_FRAME_RCVD, 0, "window update");
-+            }
-             break;
-         case NGHTTP2_RST_STREAM:
-             ap_log_cerror(APLOG_MARK, APLOG_DEBUG, 0, session->c, APLOGNO(03067)
-@@ -404,6 +408,12 @@ static int on_frame_recv_cb(nghttp2_session *ng2s,
-                                frame->goaway.error_code, NULL);
-             }
-             break;
-+        case NGHTTP2_SETTINGS:
-+            if (APLOGctrace2(session->c)) {
-+                ap_log_cerror(APLOG_MARK, APLOG_TRACE2, 0, session->c,
-+                              H2_SSSN_MSG(session, "SETTINGS, len=%ld"), (long)frame->hd.length);
-+            }
-+            break;
-         default:
-             if (APLOGctrace2(session->c)) {
-                 char buffer[256];
-@@ -415,7 +425,40 @@ static int on_frame_recv_cb(nghttp2_session *ng2s,
-             }
-             break;
-     }
--    return (APR_SUCCESS == rv)? 0 : NGHTTP2_ERR_PROTO;
-+    
-+    if (session->state == H2_SESSION_ST_IDLE) {
-+        /* We received a frame, but session is in state IDLE. That means the frame
-+         * did not really progress any of the (possibly) open streams. It was a meta
-+         * frame, e.g. SETTINGS/WINDOW_UPDATE/unknown/etc.
-+         * Remember: IDLE means we cannot send because either there are no streams open or
-+         * all open streams are blocked on exhausted WINDOWs for outgoing data.
-+         * The more frames we receive that do not change this, the less interested we
-+         * become in serving this connection. This is expressed in increasing "idle_delays".
-+         * Eventually, the connection will timeout and we'll close it. */
-+        session->idle_frames = H2MIN(session->idle_frames + 1, session->frames_received);
-+            ap_log_cerror( APLOG_MARK, APLOG_TRACE2, 0, session->c,
-+                          H2_SSSN_MSG(session, "session has %ld idle frames"), 
-+                          (long)session->idle_frames);
-+        if (session->idle_frames > 10) {
-+            apr_size_t busy_frames = H2MAX(session->frames_received - session->idle_frames, 1);
-+            int idle_ratio = (int)(session->idle_frames / busy_frames); 
-+            if (idle_ratio > 100) {
-+                session->idle_delay = apr_time_from_msec(H2MIN(1000, idle_ratio));
-+            }
-+            else if (idle_ratio > 10) {
-+                session->idle_delay = apr_time_from_msec(10);
-+            }
-+            else if (idle_ratio > 1) {
-+                session->idle_delay = apr_time_from_msec(1);
-+            }
-+            else {
-+                session->idle_delay = 0;
-+            }
-+        }
-+    }
-+    
-+    if (APR_SUCCESS != rv) return NGHTTP2_ERR_PROTO;
-+    return 0;
- }
- 
- static int h2_session_continue_data(h2_session *session) {
-@@ -1603,23 +1646,57 @@ static void update_child_status(h2_session *session, int status, const char *msg
- 
- static void transit(h2_session *session, const char *action, h2_session_state nstate)
- {
-+    apr_time_t timeout;
-+    int ostate, loglvl;
-+    const char *s;
-+    
-     if (session->state != nstate) {
--        int loglvl = APLOG_DEBUG;
--        if ((session->state == H2_SESSION_ST_BUSY && nstate == H2_SESSION_ST_WAIT)
--            || (session->state == H2_SESSION_ST_WAIT && nstate == H2_SESSION_ST_BUSY)){
-+        ostate = session->state;
-+        session->state = nstate;
-+        
-+        loglvl = APLOG_DEBUG;
-+        if ((ostate == H2_SESSION_ST_BUSY && nstate == H2_SESSION_ST_WAIT)
-+            || (ostate == H2_SESSION_ST_WAIT && nstate == H2_SESSION_ST_BUSY)){
-             loglvl = APLOG_TRACE1;
-         }
-         ap_log_cerror(APLOG_MARK, loglvl, 0, session->c, 
-                       H2_SSSN_LOG(APLOGNO(03078), session, 
-                       "transit [%s] -- %s --> [%s]"), 
--                      h2_session_state_str(session->state), action, 
-+                      h2_session_state_str(ostate), action, 
-                       h2_session_state_str(nstate));
--        session->state = nstate;
-+        
-         switch (session->state) {
-             case H2_SESSION_ST_IDLE:
--                update_child_status(session, (session->open_streams == 0? 
--                                              SERVER_BUSY_KEEPALIVE
--                                              : SERVER_BUSY_READ), "idle");
-+                if (!session->remote.emitted_count) {
-+                    /* on fresh connections, with async mpm, do not return
-+                     * to mpm for a second. This gives the first request a better
-+                     * chance to arrive (und connection leaving IDLE state).
-+                     * If we return to mpm right away, this connection has the
-+                     * same chance of being cleaned up by the mpm as connections
-+                     * that already served requests - not fair. */
-+                    session->idle_sync_until = apr_time_now() + apr_time_from_sec(1);
-+                    s = "timeout";
-+                    timeout = H2MAX(session->s->timeout, session->s->keep_alive_timeout);
-+                    update_child_status(session, SERVER_BUSY_READ, "idle");
-+                    ap_log_cerror(APLOG_MARK, APLOG_TRACE1, 0, session->c, 
-+                                  H2_SSSN_LOG("", session, "enter idle, timeout = %d sec"), 
-+                                  (int)apr_time_sec(H2MAX(session->s->timeout, session->s->keep_alive_timeout)));
-+                }
-+                else if (session->open_streams) {
-+                    s = "timeout";
-+                    timeout = session->s->keep_alive_timeout;
-+                    update_child_status(session, SERVER_BUSY_KEEPALIVE, "idle");
-+                }
-+                else {
-+                    /* normal keepalive setup */
-+                    s = "keepalive";
-+                    timeout = session->s->keep_alive_timeout;
-+                    update_child_status(session, SERVER_BUSY_KEEPALIVE, "idle");
-+                }
-+                session->idle_until = apr_time_now() + timeout; 
-+                ap_log_cerror(APLOG_MARK, APLOG_TRACE1, 0, session->c, 
-+                              H2_SSSN_LOG("", session, "enter idle, %s = %d sec"), 
-+                              s, (int)apr_time_sec(timeout));
-                 break;
-             case H2_SESSION_ST_DONE:
-                 update_child_status(session, SERVER_CLOSING, "done");
-@@ -1726,8 +1803,6 @@ static void h2_session_ev_no_io(h2_session *session, int arg, const char *msg)
-                      * This means we only wait for WINDOW_UPDATE from the 
-                      * client and can block on READ. */
-                     transit(session, "no io (flow wait)", H2_SESSION_ST_IDLE);
--                    session->idle_until = apr_time_now() + session->s->timeout;
--                    session->keep_sync_until = session->idle_until;
-                     /* Make sure we have flushed all previously written output
-                      * so that the client will react. */
-                     if (h2_conn_io_flush(&session->io) != APR_SUCCESS) {
-@@ -1738,12 +1813,7 @@ static void h2_session_ev_no_io(h2_session *session, int arg, const char *msg)
-             }
-             else if (session->local.accepting) {
-                 /* When we have no streams, but accept new, switch to idle */
--                apr_time_t now = apr_time_now();
-                 transit(session, "no io (keepalive)", H2_SESSION_ST_IDLE);
--                session->idle_until = (session->remote.emitted_count? 
--                                       session->s->keep_alive_timeout : 
--                                       session->s->timeout) + now;
--                session->keep_sync_until = now + apr_time_from_sec(1);
-             }
-             else {
-                 /* We are no longer accepting new streams and there are
-@@ -1758,12 +1828,25 @@ static void h2_session_ev_no_io(h2_session *session, int arg, const char *msg)
-     }
- }
- 
--static void h2_session_ev_data_read(h2_session *session, int arg, const char *msg)
-+static void h2_session_ev_frame_rcvd(h2_session *session, int arg, const char *msg)
-+{
-+    switch (session->state) {
-+        case H2_SESSION_ST_IDLE:
-+        case H2_SESSION_ST_WAIT:
-+            transit(session, "frame received", H2_SESSION_ST_BUSY);
-+            break;
-+        default:
-+            /* nop */
-+            break;
-+    }
-+}
-+
-+static void h2_session_ev_stream_change(h2_session *session, int arg, const char *msg)
- {
-     switch (session->state) {
-         case H2_SESSION_ST_IDLE:
-         case H2_SESSION_ST_WAIT:
--            transit(session, "data read", H2_SESSION_ST_BUSY);
-+            transit(session, "stream change", H2_SESSION_ST_BUSY);
-             break;
-         default:
-             /* nop */
-@@ -1803,16 +1886,6 @@ static void h2_session_ev_pre_close(h2_session *session, int arg, const char *ms
- static void ev_stream_open(h2_session *session, h2_stream *stream)
- {
-     h2_iq_append(session->in_process, stream->id);
--    switch (session->state) {
--        case H2_SESSION_ST_IDLE:
--            if (session->open_streams == 1) {
--                /* enter timeout, since we have a stream again */
--                session->idle_until = (session->s->timeout + apr_time_now());
--            }
--            break;
--        default:
--            break;
--    }
- }
- 
- static void ev_stream_closed(h2_session *session, h2_stream *stream)
-@@ -1825,11 +1898,6 @@ static void ev_stream_closed(h2_session *session, h2_stream *stream)
-     }
-     switch (session->state) {
-         case H2_SESSION_ST_IDLE:
--            if (session->open_streams == 0) {
--                /* enter keepalive timeout, since we no longer have streams */
--                session->idle_until = (session->s->keep_alive_timeout
--                                       + apr_time_now());
--            }
-             break;
-         default:
-             break;
-@@ -1887,6 +1955,7 @@ static void on_stream_state_enter(void *ctx, h2_stream *stream)
-         default:
-             break;
-     }
-+    dispatch_event(session, H2_SESSION_EV_STREAM_CHANGE, 0, "stream state change");
- }
- 
- static void on_stream_event(void *ctx, h2_stream *stream, 
-@@ -1945,8 +2014,8 @@ static void dispatch_event(h2_session *session, h2_session_event_t ev,
-         case H2_SESSION_EV_NO_IO:
-             h2_session_ev_no_io(session, arg, msg);
-             break;
--        case H2_SESSION_EV_DATA_READ:
--            h2_session_ev_data_read(session, arg, msg);
-+        case H2_SESSION_EV_FRAME_RCVD:
-+            h2_session_ev_frame_rcvd(session, arg, msg);
-             break;
-         case H2_SESSION_EV_NGH2_DONE:
-             h2_session_ev_ngh2_done(session, arg, msg);
-@@ -1957,6 +2026,9 @@ static void dispatch_event(h2_session *session, h2_session_event_t ev,
-         case H2_SESSION_EV_PRE_CLOSE:
-             h2_session_ev_pre_close(session, arg, msg);
-             break;
-+        case H2_SESSION_EV_STREAM_CHANGE:
-+            h2_session_ev_stream_change(session, arg, msg);
-+            break;
-         default:
-             ap_log_cerror(APLOG_MARK, APLOG_TRACE1, 0, session->c,
-                           H2_SSSN_MSG(session, "unknown event %d"), ev);
-@@ -1990,13 +2062,15 @@ apr_status_t h2_session_process(h2_session *session, int async)
-     apr_status_t status = APR_SUCCESS;
-     conn_rec *c = session->c;
-     int rv, mpm_state, trace = APLOGctrace3(c);
--
-+    apr_time_t now;
-+    
-     if (trace) {
-         ap_log_cerror( APLOG_MARK, APLOG_TRACE3, status, c,
-                       H2_SSSN_MSG(session, "process start, async=%d"), async);
-     }
-                   
-     while (session->state != H2_SESSION_ST_DONE) {
-+        now = apr_time_now();
-         session->have_read = session->have_written = 0;
- 
-         if (session->local.accepting 
-@@ -2034,39 +2108,42 @@ apr_status_t h2_session_process(h2_session *session, int async)
-                 break;
-                 
-             case H2_SESSION_ST_IDLE:
--                /* We trust our connection into the default timeout/keepalive
--                 * handling of the core filters/mpm iff:
--                 * - keep_sync_until is not set
--                 * - we have an async mpm
--                 * - we have no open streams to process
--                 * - we are not sitting on a Upgrade: request
--                 * - we already have seen at least one request
--                 */
--                if (!session->keep_sync_until && async && !session->open_streams
--                    && !session->r && session->remote.emitted_count) {
-+                if (session->idle_until && (apr_time_now() + session->idle_delay) > session->idle_until) {
-+                    ap_log_cerror( APLOG_MARK, APLOG_TRACE1, status, c,
-+                                  H2_SSSN_MSG(session, "idle, timeout reached, closing"));
-+                    if (session->idle_delay) {
-+                        apr_table_setn(session->c->notes, "short-lingering-close", "1"); 
-+                    }
-+                    dispatch_event(session, H2_SESSION_EV_CONN_TIMEOUT, 0, "timeout");
-+                    goto out;
-+                }
-+                
-+                if (session->idle_delay) {
-+                    /* we are less interested in spending time on this connection */
-+                    ap_log_cerror( APLOG_MARK, APLOG_TRACE2, status, c,
-+                                  H2_SSSN_MSG(session, "session is idle (%ld ms), idle wait %ld sec left"), 
-+                                  (long)apr_time_as_msec(session->idle_delay),
-+                                  (long)apr_time_sec(session->idle_until - now));
-+                    apr_sleep(session->idle_delay);
-+                    session->idle_delay = 0;
-+                }
-+
-+                h2_conn_io_flush(&session->io);
-+                if (async && !session->r && (now > session->idle_sync_until)) {
-                     if (trace) {
-                         ap_log_cerror(APLOG_MARK, APLOG_TRACE3, status, c,
-                                       H2_SSSN_MSG(session, 
-                                       "nonblock read, %d streams open"), 
-                                       session->open_streams);
-                     }
--                    h2_conn_io_flush(&session->io);
-                     status = h2_session_read(session, 0);
-                     
-                     if (status == APR_SUCCESS) {
-                         session->have_read = 1;
--                        dispatch_event(session, H2_SESSION_EV_DATA_READ, 0, NULL);
-                     }
--                    else if (APR_STATUS_IS_EAGAIN(status) 
--                        || APR_STATUS_IS_TIMEUP(status)) {
--                        if (apr_time_now() > session->idle_until) {
--                            dispatch_event(session, 
--                                           H2_SESSION_EV_CONN_TIMEOUT, 0, NULL);
--                        }
--                        else {
--                            status = APR_EAGAIN;
--                            goto out;
--                        }
-+                    else if (APR_STATUS_IS_EAGAIN(status) || APR_STATUS_IS_TIMEUP(status)) {
-+                        status = APR_EAGAIN;
-+                        goto out;
-                     }
-                     else {
-                         ap_log_cerror(APLOG_MARK, APLOG_DEBUG, status, c,
-@@ -2078,7 +2155,6 @@ apr_status_t h2_session_process(h2_session *session, int async)
-                 }
-                 else {
-                     /* make certain, we send everything before we idle */
--                    h2_conn_io_flush(&session->io);
-                     if (trace) {
-                         ap_log_cerror(APLOG_MARK, APLOG_TRACE3, status, c,
-                                       H2_SSSN_MSG(session, 
-@@ -2090,7 +2166,6 @@ apr_status_t h2_session_process(h2_session *session, int async)
-                      */
-                     status = h2_mplx_idle(session->mplx);
-                     if (status == APR_EAGAIN) {
--                        dispatch_event(session, H2_SESSION_EV_DATA_READ, 0, NULL);
-                         break;
-                     }
-                     else if (status != APR_SUCCESS) {
-@@ -2101,33 +2176,11 @@ apr_status_t h2_session_process(h2_session *session, int async)
-                     status = h2_session_read(session, 1);
-                     if (status == APR_SUCCESS) {
-                         session->have_read = 1;
--                        dispatch_event(session, H2_SESSION_EV_DATA_READ, 0, NULL);
-                     }
-                     else if (status == APR_EAGAIN) {
-                         /* nothing to read */
-                     }
-                     else if (APR_STATUS_IS_TIMEUP(status)) {
--                        apr_time_t now = apr_time_now();
--                        if (now > session->keep_sync_until) {
--                            /* if we are on an async mpm, now is the time that
--                             * we may dare to pass control to it. */
--                            session->keep_sync_until = 0;
--                        }
--                        if (now > session->idle_until) {
--                            if (trace) {
--                                ap_log_cerror(APLOG_MARK, APLOG_TRACE3, status, c,
--                                              H2_SSSN_MSG(session, 
--                                              "keepalive timeout"));
--                            }
--                            dispatch_event(session, 
--                                           H2_SESSION_EV_CONN_TIMEOUT, 0, "timeout");
--                        }
--                        else if (trace) {                        
--                            ap_log_cerror(APLOG_MARK, APLOG_TRACE3, status, c,
--                                          H2_SSSN_MSG(session, 
--                                          "keepalive, %f sec left"),
--                                          (session->idle_until - now) / 1000000.0f);
--                        }
-                         /* continue reading handling */
-                     }
-                     else if (APR_STATUS_IS_ECONNABORTED(status)
-@@ -2145,6 +2198,18 @@ apr_status_t h2_session_process(h2_session *session, int async)
-                         dispatch_event(session, H2_SESSION_EV_CONN_ERROR, 0, "error");
-                     }
-                 }
-+                if (nghttp2_session_want_write(session->ngh2)) {
-+                    ap_update_child_status(session->c->sbh, SERVER_BUSY_WRITE, NULL);
-+                    status = h2_session_send(session);
-+                    if (status == APR_SUCCESS) {
-+                        status = h2_conn_io_flush(&session->io);
-+                    }
-+                    if (status != APR_SUCCESS) {
-+                        dispatch_event(session, H2_SESSION_EV_CONN_ERROR, 
-+                                       H2_ERR_INTERNAL_ERROR, "writing");
-+                        break;
-+                    }
-+                }
-                 break;
-                 
-             case H2_SESSION_ST_BUSY:
-@@ -2154,7 +2219,6 @@ apr_status_t h2_session_process(h2_session *session, int async)
-                     status = h2_session_read(session, 0);
-                     if (status == APR_SUCCESS) {
-                         session->have_read = 1;
--                        dispatch_event(session, H2_SESSION_EV_DATA_READ, 0, NULL);
-                     }
-                     else if (status == APR_EAGAIN) {
-                         /* nothing to read */
-@@ -2218,7 +2282,7 @@ apr_status_t h2_session_process(h2_session *session, int async)
-                                              session->iowait);
-                 if (status == APR_SUCCESS) {
-                     session->wait_us = 0;
--                    dispatch_event(session, H2_SESSION_EV_DATA_READ, 0, NULL);
-+                        dispatch_event(session, H2_SESSION_EV_STREAM_CHANGE, 0, NULL);
-                 }
-                 else if (APR_STATUS_IS_TIMEUP(status)) {
-                     /* go back to checking all inputs again */
-diff --git a/modules/http2/h2_session.h b/modules/http2/h2_session.h
-index 486938b009..df2a862445 100644
---- a/modules/http2/h2_session.h
-+++ b/modules/http2/h2_session.h
-@@ -66,10 +66,11 @@ typedef enum {
-     H2_SESSION_EV_PROTO_ERROR,      /* protocol error */
-     H2_SESSION_EV_CONN_TIMEOUT,     /* connection timeout */
-     H2_SESSION_EV_NO_IO,            /* nothing has been read or written */
--    H2_SESSION_EV_DATA_READ,        /* connection data has been read */
-+    H2_SESSION_EV_FRAME_RCVD,       /* a frame has been received */
-     H2_SESSION_EV_NGH2_DONE,        /* nghttp2 wants neither read nor write anything */
-     H2_SESSION_EV_MPM_STOPPING,     /* the process is stopping */
-     H2_SESSION_EV_PRE_CLOSE,        /* connection will close after this */
-+    H2_SESSION_EV_STREAM_CHANGE,    /* a stream (state/input/output) changed */
- } h2_session_event_t;
- 
- typedef struct h2_session {
-@@ -118,7 +119,9 @@ typedef struct h2_session {
-     apr_size_t max_stream_mem;      /* max buffer memory for a single stream */
-     
-     apr_time_t idle_until;          /* Time we shut down due to sheer boredom */
--    apr_time_t keep_sync_until;     /* Time we sync wait until passing to async mpm */
-+    apr_time_t idle_sync_until;     /* Time we sync wait until keepalive handling kicks in */
-+    apr_size_t idle_frames;         /* number of rcvd frames that kept session in idle state */
-+    apr_interval_time_t idle_delay; /* Time we delay processing rcvd frames in idle state */
-     
-     apr_bucket_brigade *bbtmp;      /* brigade for keeping temporary data */
-     struct apr_thread_cond_t *iowait; /* our cond when trywaiting for data */
-diff --git a/modules/http2/h2_version.h b/modules/http2/h2_version.h
-index 5c53abd575..2ac718fc0f 100644
---- a/modules/http2/h2_version.h
-+++ b/modules/http2/h2_version.h
-@@ -27,7 +27,7 @@
-  * @macro
-  * Version number of the http2 module as c string
-  */
--#define MOD_HTTP2_VERSION "1.10.20"
-+#define MOD_HTTP2_VERSION "1.11.0"
- 
- /**
-  * @macro
-@@ -35,7 +35,7 @@
-  * release. This is a 24 bit number with 8 bits for major number, 8 bits
-  * for minor and 8 bits for patch. Version 1.2.3 becomes 0x010203.
-  */
--#define MOD_HTTP2_VERSION_NUM 0x010a14
-+#define MOD_HTTP2_VERSION_NUM 0x010b00
- 
- 
- #endif /* mod_h2_h2_version_h */
--- 
-2.17.1
-
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/apache-configure_perlbin.patch b/meta-webserver/recipes-httpd/apache2/apache2/apache-configure_perlbin.patch
deleted file mode 100644
index a2bc6e0..0000000
--- a/meta-webserver/recipes-httpd/apache2/apache2/apache-configure_perlbin.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 5412077c398dec74321388fe6e593a44c4c80de6 Mon Sep 17 00:00:00 2001
-From: echo <fei.geng@windriver.com>
-Date: Tue, 28 Apr 2009 03:11:06 +0000
-Subject: [PATCH] Fix perl install directory to /usr/bin
-
-Upstream-Status: Inappropriate [configuration]
-
----
- configure.in | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index d828512..be7bd25 100644
---- a/configure.in
-+++ b/configure.in
-@@ -855,10 +855,7 @@ AC_DEFINE_UNQUOTED(SERVER_CONFIG_FILE, "${rel_sysconfdir}/${progname}.conf",
- AC_DEFINE_UNQUOTED(AP_TYPES_CONFIG_FILE, "${rel_sysconfdir}/mime.types",
- 	[Location of the MIME types config file, relative to the Apache root directory])
- 
--perlbin=`$ac_aux_dir/PrintPath perl`
--if test "x$perlbin" = "x"; then
--    perlbin="/replace/with/path/to/perl/interpreter"
--fi
-+perlbin='/usr/bin/perl'
- AC_SUBST(perlbin)
- 
- dnl If we are running on BSD/OS, we need to use the BSD .include syntax.
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.34.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb
similarity index 61%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.34.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb
index 80c8b20..d58ccb8 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.34.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb
@@ -2,91 +2,98 @@ DESCRIPTION = "The Apache HTTP Server is a powerful, efficient, and \
 extensible web server."
 SUMMARY = "Apache HTTP Server"
 HOMEPAGE = "http://httpd.apache.org/"
-DEPENDS = "libtool-native apache2-native openssl expat pcre apr apr-util"
 SECTION = "net"
 LICENSE = "Apache-2.0"
 
 SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
-           file://server-makefile.patch \
-           file://httpd-2.4.1-corelimit.patch \
-           file://httpd-2.4.4-export.patch \
-           file://httpd-2.4.1-selinux.patch \
-           file://apache-configure_perlbin.patch \
-           file://replace-lynx-to-curl-in-apachectl-script.patch \
-           file://httpd-2.4.3-fix-race-issue-of-dir-install.patch \
            file://0001-configure-use-pkg-config-for-PCRE-detection.patch \
-           file://configure-allow-to-disable-selinux-support.patch \
-           file://CVE-2018-11763.patch \
+           file://0002-apache2-bump-up-the-core-size-limit-if-CoreDumpDirec.patch \
+           file://0003-apache2-do-not-export-apr-apr-util-symbols-when-usin.patch \
+           file://0004-apache2-log-the-SELinux-context-at-startup.patch \
+           file://0005-replace-lynx-to-curl-in-apachectl-script.patch \
+           file://0006-apache2-fix-the-race-issue-of-parallel-installation.patch \
+           file://0007-apache2-allow-to-disable-selinux-support.patch \
+          "
+
+SRC_URI_append_class-target = " \
+           file://0008-apache2-do-not-use-relative-path-for-gen_test_char.patch \
            file://init \
            file://apache2-volatile.conf \
            file://apache2.service \
            file://volatiles.04_apache2 \
-          "
+           "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d52d0fd0bc788f068e647116c01ddfcd"
-SRC_URI[md5sum] = "818adca52f3be187fe45d6822755be95"
-SRC_URI[sha256sum] = "fa53c95631febb08a9de41fd2864cfff815cf62d9306723ab0d4b8d7aa1638f0"
+SRC_URI[md5sum] = "930e217ba2d71e708a3f1521ecae7ec0"
+SRC_URI[sha256sum] = "b4ca9d05773aa59b54d66cd8f4744b945289f084d3be17d7981d1783a5decfa2"
 
 S = "${WORKDIR}/httpd-${PV}"
 
 inherit autotools update-rc.d pkgconfig systemd update-alternatives
 
-CVE_PRODUCT = "http_server"
+DEPENDS = "openssl expat pcre apr apr-util apache2-native "
 
-ALTERNATIVE_${PN}-doc = "htpasswd.1"
-ALTERNATIVE_LINK_NAME[htpasswd.1] = "${mandir}/man1/htpasswd.1"
-
-SYSTEMD_SERVICE_${PN} = "apache2.service"
-SYSTEMD_AUTO_ENABLE_${PN} = "disable"
+CVE_PRODUCT = "http_server"
 
 SSTATE_SCAN_FILES += "apxs config_vars.mk config.nice"
 
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
+PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
+PACKAGECONFIG[openldap] = "--enable-ldap --enable-authnz-ldap,--disable-ldap --disable-authnz-ldap,openldap"
+PACKAGECONFIG[zlib] = "--enable-deflate,,zlib,zlib"
+
 CFLAGS_append = " -DPATH_MAX=4096"
-CFLAGS_prepend = "-I${STAGING_INCDIR}/openssl "
-EXTRA_OECONF = "--enable-ssl \
-    --with-ssl=${STAGING_LIBDIR}/.. \
-    --with-expat=${STAGING_LIBDIR}/.. \
-    --with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
-    --with-apr-util=${STAGING_BINDIR_CROSS}/apu-1-config \
-    --enable-info \
-    --enable-rewrite \
-    --with-dbm=sdbm \
-    --with-berkeley-db=no \
-    --localstatedir=/var/${BPN} \
-    --with-gdbm=no \
-    --with-ndbm=no \
+
+EXTRA_OECONF_class-target = "\
+    --enable-layout=Debian \
+    --prefix=${base_prefix} \
+    --exec_prefix=${exec_prefix} \
     --includedir=${includedir}/${BPN} \
-    --datadir=${datadir}/${BPN} \
     --sysconfdir=${sysconfdir}/${BPN} \
+    --datadir=${datadir}/${BPN} \
+    --libdir=${libdir} \
     --libexecdir=${libdir}/${BPN}/modules \
-    ap_cv_void_ptr_lt_long=no \
+    --localstatedir=${localstatedir} \
+    --enable-ssl \
+    --with-dbm=sdbm \
+    --with-gdbm=no \
+    --with-ndbm=no \
+    --with-berkeley-db=no \
+    --enable-info \
+    --enable-rewrite \
     --enable-mpms-shared \
+    ap_cv_void_ptr_lt_long=no \
     ac_cv_have_threadsafe_pollset=no \
-    --enable-layout=Debian \
-    --prefix=${base_prefix}/"
+    "
 
-PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
-PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
-PACKAGECONFIG[openldap] = "--enable-ldap --enable-authnz-ldap,--disable-ldap --disable-authnz-ldap,openldap"
-PACKAGECONFIG[zlib] = "--enable-deflate --with-z=${STAGING_LIBDIR},,zlib,zlib"
+EXTRA_OECONF_class-native = "\
+    --prefix=${prefix} \
+    --includedir=${includedir}/${BPN} \
+    --sysconfdir=${sysconfdir}/${BPN} \
+    --datadir=${datadir}/${BPN} \
+    --libdir=${libdir} \
+    --libexecdir=${libdir}/${BPN}/modules \
+    --localstatedir=${localstatedir} \
+    "
 
 do_configure_prepend() {
-        sed -i -e 's:$''{prefix}/usr/lib/cgi-bin:$''{libdir}/cgi-bin:g' ${S}/config.layout
+    sed -i -e 's:$''{prefix}/usr/lib/cgi-bin:$''{libdir}/cgi-bin:g' ${S}/config.layout
 }
 
-do_install_append() {
+do_install_append_class-target() {
     install -d ${D}/${sysconfdir}/init.d
+
     cat ${WORKDIR}/init | \
         sed -e 's,/usr/sbin/,${sbindir}/,g' \
             -e 's,/usr/bin/,${bindir}/,g' \
-            -e 's,/usr/lib,${libdir}/,g' \
+            -e 's,/usr/lib/,${libdir}/,g' \
             -e 's,/etc/,${sysconfdir}/,g' \
             -e 's,/usr/,${prefix}/,g' > ${D}/${sysconfdir}/init.d/${BPN}
+
     chmod 755 ${D}/${sysconfdir}/init.d/${BPN}
-    # remove the goofy original files...
+
+    # Remove the goofy original files...
     rm -rf ${D}/${sysconfdir}/${BPN}/original
-    # Expat should be found in the staging area via DEPENDS...
-    rm -f ${D}/${libdir}/libexpat.*
 
     install -d ${D}${sysconfdir}/${BPN}/conf.d
     install -d ${D}${sysconfdir}/${BPN}/modules.d
@@ -95,44 +102,58 @@ do_install_append() {
     printf "\nIncludeOptional ${sysconfdir}/${BPN}/conf.d/*.conf" >> ${D}/${sysconfdir}/${BPN}/httpd.conf
     printf "\nIncludeOptional ${sysconfdir}/${BPN}/modules.d/*.load" >> ${D}/${sysconfdir}/${BPN}/httpd.conf
     printf "\nIncludeOptional ${sysconfdir}/${BPN}/modules.d/*.conf\n\n" >> ${D}/${sysconfdir}/${BPN}/httpd.conf
-    # match with that is in init script
+
+    # Match with that is in init script
     printf "\nPidFile /run/httpd.pid" >> ${D}/${sysconfdir}/${BPN}/httpd.conf
+
     # Set 'ServerName' to fix error messages when restart apache service
     sed -i 's/^#ServerName www.example.com/ServerName localhost/' ${D}/${sysconfdir}/${BPN}/httpd.conf
 
+    sed -i 's/^ServerRoot/#ServerRoot/' ${D}/${sysconfdir}/${BPN}/httpd.conf
+
+    sed -i -e 's,${STAGING_DIR_TARGET},,g' \
+           -e 's,${DEBUG_PREFIX_MAP},,g' \
+           -e 's,-fdebug-prefix-map[^ ]*,,g; s,-fmacro-prefix-map[^ ]*,,g' \
+           -e 's,${HOSTTOOLS_DIR}/,,g' \
+           -e 's,APU_INCLUDEDIR = .*,APU_INCLUDEDIR = ,g' \
+           -e 's,APU_CONFIG = .*,APU_CONFIG = ,g' ${D}${datadir}/apache2/build/config_vars.mk
+
+    sed -i -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
+           -e 's,${DEBUG_PREFIX_MAP},,g' \
+           -e 's,${RECIPE_SYSROOT},,g' \
+           -e 's,-fdebug-prefix-map[^ ]*,,g; s,-fmacro-prefix-map[^ ]*,,g' \
+           -e 's,APU_INCLUDEDIR = .*,APU_INCLUDEDIR = ,g' \
+           -e 's,".*/configure","configure",g' ${D}${datadir}/apache2/build/config.nice
+
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/tmpfiles.d/
         install -m 0644 ${WORKDIR}/apache2-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
+
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/apache2.service ${D}${systemd_unitdir}/system
+        sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/apache2.service
+        sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' ${D}${systemd_unitdir}/system/apache2.service
     elif ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/default/volatiles
         install -m 0644 ${WORKDIR}/volatiles.04_apache2 ${D}${sysconfdir}/default/volatiles/04_apache2
     fi
 
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/apache2.service ${D}${systemd_unitdir}/system
-    sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/apache2.service
-    sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' ${D}${systemd_unitdir}/system/apache2.service
-
+    rm -rf ${D}${localstatedir}
     chown -R root:root ${D}
 }
 
-do_install_append_class-target() {
-    sed -i -e 's,${STAGING_DIR_HOST},,g' \
-           -e 's,APU_INCLUDEDIR = .*,APU_INCLUDEDIR = ,g' \
-           -e 's,APU_CONFIG = .*,APU_CONFIG = ,g' ${D}${datadir}/apache2/build/config_vars.mk
-
-    sed -i -e 's,${STAGING_DIR_HOST},,g' \
-           -e 's,".*/configure","configure",g' ${D}${datadir}/apache2/build/config.nice
-    rm -rf ${D}${localstatedir}/run
+do_install_append_class-native() {
+    install -d ${D}${bindir} ${D}${libdir}
+    install -m 755 server/gen_test_char ${D}${bindir}
 }
 
-SYSROOT_PREPROCESS_FUNCS += "apache_sysroot_preprocess"
+SYSROOT_PREPROCESS_FUNCS_append_class-target = "apache_sysroot_preprocess"
 
-apache_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
-    install -m 755 ${D}${bindir}/apxs ${SYSROOT_DESTDIR}${bindir_crossscripts}/
-    install -d ${SYSROOT_DESTDIR}${sbindir}/
-    install -m 755 ${D}${sbindir}/apachectl ${SYSROOT_DESTDIR}${sbindir}/
+apache_sysroot_preprocess() {
+    install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
+    install -m 755 ${D}${bindir}/apxs ${SYSROOT_DESTDIR}${bindir_crossscripts}
+    install -d ${SYSROOT_DESTDIR}${sbindir}
+    install -m 755 ${D}${sbindir}/apachectl ${SYSROOT_DESTDIR}${sbindir}
     sed -i 's!my $installbuilddir = .*!my $installbuilddir = "${STAGING_DIR_HOST}/${datadir}/${BPN}/build";!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs
     sed -i 's!my $libtool = .*!my $libtool = "${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool";!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs
 
@@ -145,52 +166,38 @@ apache_sysroot_preprocess () {
     sed -i 's!--sysroot=[^ ]*!--sysroot=${STAGING_DIR_HOST}!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
 }
 
-#
-# implications - used by update-rc.d scripts
-#
+# Implications - used by update-rc.d scripts
 INITSCRIPT_NAME = "apache2"
 INITSCRIPT_PARAMS = "defaults 91 20"
-LEAD_SONAME = "libapr-1.so.0"
+
+SYSTEMD_SERVICE_${PN} = "apache2.service"
+SYSTEMD_AUTO_ENABLE_${PN} = "enable"
+
+ALTERNATIVE_${PN}-doc = "htpasswd.1"
+ALTERNATIVE_LINK_NAME[htpasswd.1] = "${mandir}/man1/htpasswd.1"
 
 PACKAGES = "${PN}-scripts ${PN}-doc ${PN}-dev ${PN}-dbg ${PN}"
 
 CONFFILES_${PN} = "${sysconfdir}/${BPN}/httpd.conf \
                    ${sysconfdir}/${BPN}/magic \
-                   ${sysconfdir}/${BPN}/mime.types \
-                   ${sysconfdir}/init.d/${BPN} "
+                   ${sysconfdir}/${BPN}/mime.types"
 
-# we override here rather than append so that .so links are
+# We override here rather than append so that .so links are
 # included in the runtime package rather than here (-dev)
-# and to get build, icons, error into the -dev package
-FILES_${PN}-dev = "${datadir}/${BPN}/build \
-                   ${datadir}/${BPN}/icons \
+# and to get icons, error into the -dev package
+FILES_${PN}-dev = "${datadir}/${BPN}/icons \
                    ${datadir}/${BPN}/error \
-                   ${bindir}/apr-config ${bindir}/apu-config \
-                   ${libdir}/apr*.exp \
                    ${includedir}/${BPN} \
-                   ${libdir}/*.la \
-                   ${libdir}/*.a \
-                   ${bindir}/apxs \
-                "
-
-
-# manual to manual
-FILES_${PN}-doc += " ${datadir}/${BPN}/manual"
+                  "
 
 FILES_${PN}-scripts += "${bindir}/dbmmanage"
 
-#
-# override this too - here is the default, less datadir
-#
-FILES_${PN} =  "${bindir} ${sbindir} ${libexecdir} ${libdir}/lib*.so.* ${sysconfdir} \
-                ${sharedstatedir} ${localstatedir} /bin /sbin /lib/*.so* \
-                ${libdir}/${BPN}"
-
-# we want htdocs and cgi-bin to go with the binary
-FILES_${PN} += "${datadir}/${BPN}/htdocs ${datadir}/${BPN}/cgi-bin"
+# Override this too - here is the default, less datadir
+FILES_${PN} =  "${bindir} ${sbindir} ${libexecdir} ${libdir} \
+                ${sysconfdir} ${libdir}/${BPN}"
 
-#make sure the lone .so links also get wrapped in the base package
-FILES_${PN} += "${libdir}/lib*.so ${libdir}/pkgconfig/*"
+# We want htdocs and cgi-bin to go with the binary
+FILES_${PN} += "${datadir}/${BPN}/ ${libdir}/cgi-bin"
 
 FILES_${PN}-dbg += "${libdir}/${BPN}/modules/.debug"
 
@@ -198,5 +205,4 @@ RDEPENDS_${PN} += "openssl libgcc"
 RDEPENDS_${PN}-scripts += "perl ${PN}"
 RDEPENDS_${PN}-dev = "perl"
 
-FILES_${PN} += "${libdir}/cgi-bin"
-FILES_${PN} += "${datadir}/${BPN}/"
+BBCLASSEXTEND = "native"
diff --git a/meta-webserver/recipes-httpd/apache2/files/init b/meta-webserver/recipes-httpd/apache2/files/init
old mode 100755
new mode 100644
-- 
2.7.4


