Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8D4B773166
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 21:43:48 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id 90so32695117qgz.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 14:43:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HocIGjaJR7kkxiBFRthZh/9/+DQJYWtOAVRGzd7S8Uc=;
	b=GvoEAYCCbiracKbGYOU2mvEDVSa3skdU6YHgIHydm36lRVJbekawRSre+He30O2P54
	hvyOghcE4DC1jUa6chF9HV6KqO2Rs7h5nJTBeyuXx3W/qd8vnzgwfYSaaGZE0OczqgO9
	YJAUiwvK36NlOQSBp+q7SUBnd8TZpv1eBgn1hrcweFI25gBtCTEx8wSJ1MUbFedv/1bg
	sNEop7HvITtMs49bLPBWz8lXFxm7EXoOTYMgt28kS854e8x85QnXT1P74uE60rVoUq0r
	HC7uOMIKEyRxtICcE3ULsB7+M43PZGLioh4/wZqWIl4NxOWWtvl3JtMsmVFoQipjt+Fb
	oc8g==
X-Gm-Message-State: AOPr4FUnq+EZN1G43zUOgnkcq/SEIiwSHY97gAM3Wrf+KjvaKyqtyzgWbdd18mVY3eYRQg==
X-Received: by 10.140.197.130 with SMTP id s124mr22413803qha.17.1461966228742; 
	Fri, 29 Apr 2016 14:43:48 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	h75sm5054689qge.30.2016.04.29.14.43.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Apr 2016 14:43:48 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Apr 2016 17:43:38 -0400
Message-Id: <1461966219-12963-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-webserver][PATCH 1/2] nginx: update stable version to 1.10.0
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
X-List-Received-Date: Fri, 29 Apr 2016 21:43:48 -0000

The 1.8 version is now considered legacy and the stable versions 1.10.X
Updated the license checksum to reflect copyright date update to 2016

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-httpd/nginx/files/nginx-cross.patch    | 31 +++++++++-------------
 meta-webserver/recipes-httpd/nginx/nginx_1.10.0.bb |  6 +++++
 meta-webserver/recipes-httpd/nginx/nginx_1.8.1.bb  |  6 -----
 3 files changed, 18 insertions(+), 25 deletions(-)
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.10.0.bb
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.8.1.bb

diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx-cross.patch b/meta-webserver/recipes-httpd/nginx/files/nginx-cross.patch
index 46792ba..5e96644 100644
--- a/meta-webserver/recipes-httpd/nginx/files/nginx-cross.patch
+++ b/meta-webserver/recipes-httpd/nginx/files/nginx-cross.patch
@@ -6,7 +6,7 @@ Upstream-Status: Pending
 diff -uraN nginx-1.0.11.orig/auto/feature nginx-1.0.11/auto/feature
 --- nginx-1.0.11.orig/auto/feature	2011-05-11 06:50:19.000000000 -0500
 +++ nginx-1.0.11/auto/feature	2011-12-27 13:56:42.323370040 -0600
-@@ -48,12 +48,20 @@
+@@ -49,12 +49,20 @@
  
  if [ -x $NGX_AUTOTEST ]; then
  
@@ -29,7 +29,7 @@ diff -uraN nginx-1.0.11.orig/auto/feature nginx-1.0.11/auto/feature
                  ngx_found=yes
  
                  if test -n "$ngx_feature_name"; then
-@@ -67,17 +75,27 @@
+@@ -68,17 +75,27 @@
  
          value)
              # /bin/sh is used to intercept "Killed" or "Abort trap" messages
@@ -61,7 +61,7 @@ diff -uraN nginx-1.0.11.orig/auto/feature nginx-1.0.11/auto/feature
              else
                  echo " found but is not working"
              fi
-@@ -85,7 +103,7 @@
+@@ -86,7 +105,7 @@
  
          bug)
              # /bin/sh is used to intercept "Killed" or "Abort trap" messages
@@ -73,8 +73,8 @@ diff -uraN nginx-1.0.11.orig/auto/feature nginx-1.0.11/auto/feature
 diff -uraN nginx-1.0.11.orig/auto/options nginx-1.0.11/auto/options
 --- nginx-1.0.11.orig/auto/options	2011-12-14 07:34:16.000000000 -0600
 +++ nginx-1.0.11/auto/options	2011-12-27 13:56:42.323370040 -0600
-@@ -289,6 +289,18 @@
-         --test-build-rtsig)              NGX_TEST_BUILD_RTSIG=YES   ;;
+@@ -353,6 +353,18 @@
+         --test-build-epoll)              NGX_TEST_BUILD_EPOLL=YES   ;;
          --test-build-solaris-sendfilev)  NGX_TEST_BUILD_SOLARIS_SENDFILEV=YES ;;
  
 +        # cross compile support
@@ -92,7 +92,7 @@ diff -uraN nginx-1.0.11.orig/auto/options nginx-1.0.11/auto/options
          *)
              echo "$0: error: invalid option \"$option\""
              exit 1
-@@ -434,6 +446,17 @@
+@@ -533,6 +445,17 @@
  
    --with-debug                       enable debug logging
  
@@ -110,7 +110,7 @@ diff -uraN nginx-1.0.11.orig/auto/options nginx-1.0.11/auto/options
  END
  
      exit 1
-@@ -455,6 +478,8 @@
+@@ -554,6 +577,8 @@
  
  if [ ".$NGX_PLATFORM" = ".win32" ]; then
      NGX_WINE=$WINE
@@ -137,14 +137,14 @@ diff -uraN nginx-1.0.11.orig/auto/types/sizeof nginx-1.0.11/auto/types/sizeof
  
  #include <sys/types.h>
  #include <sys/time.h>
-@@ -33,20 +36,20 @@
+@@ -33,15 +36,16 @@
  END
  
  
 -ngx_test="$CC $CC_TEST_FLAGS $CC_AUX_FLAGS \
 -          -o $NGX_AUTOTEST $NGX_AUTOTEST.c $NGX_LD_OPT $ngx_feature_libs"
 +    ngx_test="$CC $CC_TEST_FLAGS $CC_AUX_FLAGS \
-+	      -o $NGX_AUTOTEST $NGX_AUTOTEST.c $NGX_LD_OPT $ngx_feature_libs"
++              -o $NGX_AUTOTEST $NGX_AUTOTEST.c $NGX_LD_OPT $ngx_feature_libs"
  
 -eval "$ngx_test >> $NGX_AUTOCONF_ERR 2>&1"
 +    eval "$ngx_test >> $NGX_AUTOCONF_ERR 2>&1"
@@ -153,20 +153,13 @@ diff -uraN nginx-1.0.11.orig/auto/types/sizeof nginx-1.0.11/auto/types/sizeof
 -if [ -x $NGX_AUTOTEST ]; then
 -    ngx_size=`$NGX_AUTOTEST`
 -    echo " $ngx_size bytes"
--fi
 +    if [ -x $NGX_AUTOTEST ]; then
-+	ngx_size=`$NGX_AUTOTEST`
-+	echo " $ngx_size bytes"
++        ngx_size=`$NGX_AUTOTEST`
++        echo " $ngx_size bytes"
 +    fi
+ fi
  
  
--rm -rf $NGX_AUTOTEST*
--
-+    rm -rf $NGX_AUTOTEST*
-+fi
- 
- case $ngx_size in
-     4)
 diff -uraN nginx-1.0.11.orig/auto/unix nginx-1.0.11/auto/unix
 --- nginx-1.0.11.orig/auto/unix	2011-12-14 07:34:16.000000000 -0600
 +++ nginx-1.0.11/auto/unix	2011-12-27 13:56:42.327370060 -0600
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.10.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.10.0.bb
new file mode 100644
index 0000000..53cce00
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.10.0.bb
@@ -0,0 +1,6 @@
+require nginx.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0bb58ed0dfd4f5dbece3b52aba79f023"
+
+SRC_URI[md5sum] = "c184c873d2798c5ba92be95ed1209c02"
+SRC_URI[sha256sum] = "8ed647c3dd65bc4ced03b0e0f6bf9e633eff6b01bac772bcf97077d58bc2be4d"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.8.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.8.1.bb
deleted file mode 100644
index 089f547..0000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.8.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require nginx.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3845852aedfa8d6d7765f55d06cc3ebd"
-
-SRC_URI[md5sum] = "2e91695074dbdfbf1bcec0ada9fda462"
-SRC_URI[sha256sum] = "8f4b3c630966c044ec72715754334d1fdf741caa1d5795fb4646c27d09f797b7"
-- 
1.9.1


