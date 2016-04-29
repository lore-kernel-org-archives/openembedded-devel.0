Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2DE7373166
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 21:43:48 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id 90so32695226qgz.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 14:43:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7BijSSouzTgsb7km7nddYTABAQ1EzDrQUY5UAUq58k4=;
	b=UcwzD93G4NgUGiXNaM5M6+1FS+iC/vfyUNn1rh+kMkSMmXDFpIdldzUt4VHrVZEcU+
	C/nsKbOptMmIlj8+lFtEUbSOKWrqaL1T1LMP77cNTC1/HFfuvMWLES86VwQe5r5UHKI5
	OL+3opYrDMr9+I8rY4USXqxFuYSWcdioEpDruyJsh9oT0xNxXIwHxNotktziuYvHnQHU
	97ldTn6D6Ul98XJr6keO8/JqJu9qaKQNa9mHOOpGSBXVvvhQaSQTQJ5rLbJP+vFNW6Xd
	IK/yjCZolxr78SCQLM4prQYuhuaKDPVCCmWD6zBb8UpBew6RtOEAsdl6SbSEuvSbK64V
	FDLg==
X-Gm-Message-State: AOPr4FVulvlAlQWC2Yp/bgwxeXrE27A0hBAPt6wNo9Jjw2L3cj7Ysx2JBQopAIxo45TStw==
X-Received: by 10.140.255.2 with SMTP id a2mr22128688qhd.100.1461966229474;
	Fri, 29 Apr 2016 14:43:49 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	h75sm5054689qge.30.2016.04.29.14.43.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Apr 2016 14:43:48 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Apr 2016 17:43:39 -0400
Message-Id: <1461966219-12963-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1461966219-12963-1-git-send-email-derek@asterius.io>
References: <1461966219-12963-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-webserver][PATCH 2/2] nginx: update to version 1.9.15
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
X-List-Received-Date: Fri, 29 Apr 2016 21:43:49 -0000

Remove a now redundant nginx-cross patch with stable moving to 1.10.X
Remove a duplicate DISABLE_STATIC

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../nginx/nginx-1.9.14/nginx-cross.patch           | 211 ---------------------
 meta-webserver/recipes-httpd/nginx/nginx_1.9.14.bb |  12 --
 meta-webserver/recipes-httpd/nginx/nginx_1.9.15.bb |  10 +
 3 files changed, 10 insertions(+), 223 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.9.14/nginx-cross.patch
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.9.14.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.9.15.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.9.14/nginx-cross.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.9.14/nginx-cross.patch
deleted file mode 100644
index 5e96644..0000000
--- a/meta-webserver/recipes-httpd/nginx/nginx-1.9.14/nginx-cross.patch
+++ /dev/null
@@ -1,211 +0,0 @@
-We do not have capability to run binaries when cross compiling
-
-Upstream-Status: Pending
-
-
-diff -uraN nginx-1.0.11.orig/auto/feature nginx-1.0.11/auto/feature
---- nginx-1.0.11.orig/auto/feature	2011-05-11 06:50:19.000000000 -0500
-+++ nginx-1.0.11/auto/feature	2011-12-27 13:56:42.323370040 -0600
-@@ -49,12 +49,20 @@
- 
- if [ -x $NGX_AUTOTEST ]; then
- 
-+    if [ ".$NGX_CROSS_COMPILE" = ".yes" ]; then
-+        NGX_AUTOTEST_EXEC="true"
-+	NGX_FOUND_MSG=" (not tested, cross compiling)"
-+    else
-+        NGX_AUTOTEST_EXEC="$NGX_AUTOTEST"
-+	NGX_FOUND_MSG=""
-+    fi
-+
-     case "$ngx_feature_run" in
- 
-         yes)
-             # /bin/sh is used to intercept "Killed" or "Abort trap" messages
--            if /bin/sh -c $NGX_AUTOTEST >> $NGX_AUTOCONF_ERR 2>&1; then
--                echo " found"
-+            if /bin/sh -c $NGX_AUTOTEST_EXEC >> $NGX_AUTOCONF_ERR 2>&1; then
-+                echo " found$NGX_FOUND_MSG"
-                 ngx_found=yes
- 
-                 if test -n "$ngx_feature_name"; then
-@@ -68,17 +75,27 @@
- 
-         value)
-             # /bin/sh is used to intercept "Killed" or "Abort trap" messages
--            if /bin/sh -c $NGX_AUTOTEST >> $NGX_AUTOCONF_ERR 2>&1; then
--                echo " found"
-+            if /bin/sh -c $NGX_AUTOTEST_EXEC >> $NGX_AUTOCONF_ERR 2>&1; then
-+                echo " found$NGX_FOUND_MSG"
-                 ngx_found=yes
- 
--                cat << END >> $NGX_AUTO_CONFIG_H
-+                if [ ".$NGX_CROSS_COMPILE" = ".yes" ]; then
-+                    cat << END >> $NGX_AUTO_CONFIG_H
- 
- #ifndef $ngx_feature_name
--#define $ngx_feature_name  `$NGX_AUTOTEST`
-+#define $ngx_feature_name  $(eval "echo \$NGX_WITH_${ngx_feature_name}")
- #endif
- 
- END
-+		else
-+                    cat << END >> $NGX_AUTO_CONFIG_H
-+
-+#ifndef $ngx_feature_name
-+#define $ngx_feature_name  `$NGX_AUTOTEST_EXEC`
-+#endif
-+
-+END
-+                fi
-             else
-                 echo " found but is not working"
-             fi
-@@ -86,7 +105,7 @@
- 
-         bug)
-             # /bin/sh is used to intercept "Killed" or "Abort trap" messages
--            if /bin/sh -c $NGX_AUTOTEST >> $NGX_AUTOCONF_ERR 2>&1; then
-+            if /bin/sh -c $NGX_AUTOTEST_EXEC >> $NGX_AUTOCONF_ERR 2>&1; then
-                 echo " not found"
- 
-             else
-diff -uraN nginx-1.0.11.orig/auto/options nginx-1.0.11/auto/options
---- nginx-1.0.11.orig/auto/options	2011-12-14 07:34:16.000000000 -0600
-+++ nginx-1.0.11/auto/options	2011-12-27 13:56:42.323370040 -0600
-@@ -353,6 +353,18 @@
-         --test-build-epoll)              NGX_TEST_BUILD_EPOLL=YES   ;;
-         --test-build-solaris-sendfilev)  NGX_TEST_BUILD_SOLARIS_SENDFILEV=YES ;;
- 
-+        # cross compile support
-+        --with-int=*)                    NGX_WITH_INT="$value"          ;;
-+        --with-long=*)                   NGX_WITH_LONG="$value"         ;;
-+        --with-long-long=*)              NGX_WITH_LONG_LONG="$value"    ;;
-+        --with-ptr-size=*)               NGX_WITH_PTR_SIZE="$value"     ;;
-+        --with-sig-atomic-t=*)           NGX_WITH_SIG_ATOMIC_T="$value" ;;
-+        --with-size-t=*)                 NGX_WITH_SIZE_T="$value"       ;;
-+        --with-off-t=*)                  NGX_WITH_OFF_T="$value"        ;;
-+        --with-time-t=*)                 NGX_WITH_TIME_T="$value"       ;;
-+        --with-sys-nerr=*)               NGX_WITH_NGX_SYS_NERR="$value" ;;
-+        --with-endian=*)                 NGX_WITH_ENDIAN="$value"       ;;
-+
-         *)
-             echo "$0: error: invalid option \"$option\""
-             exit 1
-@@ -533,6 +445,17 @@
- 
-   --with-debug                       enable debug logging
- 
-+  --with-int=VALUE                   force int size
-+  --with-long=VALUE                  force long size
-+  --with-long-long=VALUE             force long long size
-+  --with-ptr-size=VALUE              force pointer size
-+  --with-sig-atomic-t=VALUE          force sig_atomic_t size
-+  --with-size-t=VALUE                force size_t size
-+  --with-off-t=VALUE                 force off_t size
-+  --with-time-t=VALUE                force time_t size
-+  --with-sys-nerr=VALUE              force sys_nerr value
-+  --with-endian=VALUE                force system endianess
-+
- END
- 
-     exit 1
-@@ -554,6 +577,8 @@
- 
- if [ ".$NGX_PLATFORM" = ".win32" ]; then
-     NGX_WINE=$WINE
-+elif [ ! -z "$NGX_PLATFORM" ]; then
-+    NGX_CROSS_COMPILE="yes"
- fi
- 
- 
-diff -uraN nginx-1.0.11.orig/auto/types/sizeof nginx-1.0.11/auto/types/sizeof
---- nginx-1.0.11.orig/auto/types/sizeof	2006-06-28 11:00:26.000000000 -0500
-+++ nginx-1.0.11/auto/types/sizeof	2011-12-27 13:56:42.323370040 -0600
-@@ -12,9 +12,12 @@
- 
- END
- 
--ngx_size=
-+ngx_size=$(eval "echo \$NGX_WITH_${ngx_param}")
- 
--cat << END > $NGX_AUTOTEST.c
-+if [ ".$ngx_size" != "." ]; then
-+    echo " $ngx_size bytes"
-+else
-+    cat << END > $NGX_AUTOTEST.c
- 
- #include <sys/types.h>
- #include <sys/time.h>
-@@ -33,15 +36,16 @@
- END
- 
- 
--ngx_test="$CC $CC_TEST_FLAGS $CC_AUX_FLAGS \
--          -o $NGX_AUTOTEST $NGX_AUTOTEST.c $NGX_LD_OPT $ngx_feature_libs"
-+    ngx_test="$CC $CC_TEST_FLAGS $CC_AUX_FLAGS \
-+              -o $NGX_AUTOTEST $NGX_AUTOTEST.c $NGX_LD_OPT $ngx_feature_libs"
- 
--eval "$ngx_test >> $NGX_AUTOCONF_ERR 2>&1"
-+    eval "$ngx_test >> $NGX_AUTOCONF_ERR 2>&1"
- 
- 
--if [ -x $NGX_AUTOTEST ]; then
--    ngx_size=`$NGX_AUTOTEST`
--    echo " $ngx_size bytes"
-+    if [ -x $NGX_AUTOTEST ]; then
-+        ngx_size=`$NGX_AUTOTEST`
-+        echo " $ngx_size bytes"
-+    fi
- fi
- 
- 
-diff -uraN nginx-1.0.11.orig/auto/unix nginx-1.0.11/auto/unix
---- nginx-1.0.11.orig/auto/unix	2011-12-14 07:34:16.000000000 -0600
-+++ nginx-1.0.11/auto/unix	2011-12-27 13:56:42.327370060 -0600
-@@ -393,13 +393,13 @@
- 
- # C types
- 
--ngx_type="int"; . auto/types/sizeof
-+ngx_type="int"; ngx_param="INT"; . auto/types/sizeof
- 
--ngx_type="long"; . auto/types/sizeof
-+ngx_type="long"; ngx_param="LONG"; . auto/types/sizeof
- 
--ngx_type="long long"; . auto/types/sizeof
-+ngx_type="long long"; ngx_param="LONG_LONG"; . auto/types/sizeof
- 
--ngx_type="void *"; . auto/types/sizeof; ngx_ptr_size=$ngx_size
-+ngx_type="void *"; ngx_param="PTR_SIZE"; . auto/types/sizeof; ngx_ptr_size=$ngx_size
- ngx_param=NGX_PTR_SIZE; ngx_value=$ngx_size; . auto/types/value
- 
- 
-@@ -416,7 +416,7 @@
- 
- ngx_type="uint64_t"; ngx_types="u_int64_t"; . auto/types/typedef
- 
--ngx_type="sig_atomic_t"; ngx_types="int"; . auto/types/typedef
-+ngx_type="sig_atomic_t"; ngx_param="SIG_ATOMIC_T"; ngx_types="int"; . auto/types/typedef
- . auto/types/sizeof
- ngx_param=NGX_SIG_ATOMIC_T_SIZE; ngx_value=$ngx_size; . auto/types/value
- 
-@@ -432,15 +432,15 @@
- 
- . auto/endianess
- 
--ngx_type="size_t"; . auto/types/sizeof
-+ngx_type="size_t"; ngx_param="SIZE_T"; . auto/types/sizeof
- ngx_param=NGX_MAX_SIZE_T_VALUE; ngx_value=$ngx_max_value; . auto/types/value
- ngx_param=NGX_SIZE_T_LEN; ngx_value=$ngx_max_len; . auto/types/value
- 
--ngx_type="off_t"; . auto/types/sizeof
-+ngx_type="off_t"; ngx_param="OFF_T"; . auto/types/sizeof
- ngx_param=NGX_MAX_OFF_T_VALUE; ngx_value=$ngx_max_value; . auto/types/value
- ngx_param=NGX_OFF_T_LEN; ngx_value=$ngx_max_len; . auto/types/value
- 
--ngx_type="time_t"; . auto/types/sizeof
-+ngx_type="time_t"; ngx_param="TIME_T"; . auto/types/sizeof
- ngx_param=NGX_TIME_T_SIZE; ngx_value=$ngx_size; . auto/types/value
- ngx_param=NGX_TIME_T_LEN; ngx_value=$ngx_max_len; . auto/types/value
- 
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.9.14.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.9.14.bb
deleted file mode 100644
index 585c52c..0000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.9.14.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require nginx.inc
-
-# 1.9.x is the current mainline branches containing all new features
-# 1.8.x branch is the current stable branch, the recommended default
-DEFAULT_PREFERENCE = "-1"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0bb58ed0dfd4f5dbece3b52aba79f023"
-
-SRC_URI[md5sum] = "a25818039f34b5d54b017d44c76321c4"
-SRC_URI[sha256sum] = "2b4893076d28e6b4384bba8c4fdebfca6de6f8f68ec48a1ca94b9b855ff457d2"
-
-DISABLE_STATIC = ""
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.9.15.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.9.15.bb
new file mode 100644
index 0000000..abbec53
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.9.15.bb
@@ -0,0 +1,10 @@
+require nginx.inc
+
+# 1.10.x branch is the current stable branch, the recommended default
+# 1.9.x is the current mainline branches containing all new features
+DEFAULT_PREFERENCE = "-1"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0bb58ed0dfd4f5dbece3b52aba79f023"
+
+SRC_URI[md5sum] = "13cd38e9da3789035750dd45882c4a26"
+SRC_URI[sha256sum] = "cc89b277cc03f403c0b746d60aa5943cdecf59ae48278f8cb7e2df0cbdb6dac3"
-- 
1.9.1


