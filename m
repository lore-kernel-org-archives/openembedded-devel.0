Return-Path: <straka.derek@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 734D465C5C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2016 10:28:05 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id w18so1568220oie.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2016 03:28:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KAvfDDcp2IZ2xq8U+S5+CBuZ+0OgnScqtX8ywz3+BjM=;
	b=kroeMTHJYRNt4N3bDAYBnJt8tRuX+2dXh6DheguyAKfOf3Gic+lITJsmU0SvFMYQ/n
	dF/Je+W+YyIt3sCN5ftCqW6RVpBoqtBoY4pLg5Qg6jlsS2IEidJzO7iSM+zD8kqeSWjv
	yBbrvr/qP0wPLiSAG/mU32ePLk/aewIzpApSM8/1h6vvqRKqFXqcPDndKCZbp9kWKicn
	w2ADadt3y2vtJBa/oqdJGwgtYmsvW8u1JS5tNVF+WOqE3W4d3iAtC4xdvB8sT6vrpnNq
	LTjIIygzKzso+NSssw2Zm76Vkz94l+rkbP1j0h/yiaTRRynkW8G9/7tF7N+xirAU/ZwR
	L5CA==
X-Gm-Message-State: AOPr4FXybYkADce+jjcLcSTQfRcHW9Yp+YfW3UEp6NBjnlbXLitF9xyS0deaI+1TxABhlA==
X-Received: by 10.157.43.104 with SMTP id f37mr986396otd.77.1460456886092;
	Tue, 12 Apr 2016 03:28:06 -0700 (PDT)
Received: from localhost.localdomain ([172.56.3.92])
	by smtp.gmail.com with ESMTPSA id
	t89sm9511498ota.22.2016.04.12.03.28.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 12 Apr 2016 03:28:05 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Apr 2016 06:27:42 -0400
Message-Id: <1460456862-3653-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-webserver][PATCHv2] nginx: update to 1.9.14
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
X-List-Received-Date: Tue, 12 Apr 2016 10:28:06 -0000

update the nginx-cross path to work with the latest version of nginx

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../nginx/nginx-1.9.14/nginx-cross.patch           | 211 +++++++++++++++++++++
 .../nginx/{nginx_1.9.12.bb => nginx_1.9.14.bb}     |   4 +-
 2 files changed, 213 insertions(+), 2 deletions(-)
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.9.14/nginx-cross.patch
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.9.12.bb => nginx_1.9.14.bb} (66%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.9.14/nginx-cross.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.9.14/nginx-cross.patch
new file mode 100644
index 0000000..5e96644
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx-1.9.14/nginx-cross.patch
@@ -0,0 +1,211 @@
+We do not have capability to run binaries when cross compiling
+
+Upstream-Status: Pending
+
+
+diff -uraN nginx-1.0.11.orig/auto/feature nginx-1.0.11/auto/feature
+--- nginx-1.0.11.orig/auto/feature	2011-05-11 06:50:19.000000000 -0500
++++ nginx-1.0.11/auto/feature	2011-12-27 13:56:42.323370040 -0600
+@@ -49,12 +49,20 @@
+ 
+ if [ -x $NGX_AUTOTEST ]; then
+ 
++    if [ ".$NGX_CROSS_COMPILE" = ".yes" ]; then
++        NGX_AUTOTEST_EXEC="true"
++	NGX_FOUND_MSG=" (not tested, cross compiling)"
++    else
++        NGX_AUTOTEST_EXEC="$NGX_AUTOTEST"
++	NGX_FOUND_MSG=""
++    fi
++
+     case "$ngx_feature_run" in
+ 
+         yes)
+             # /bin/sh is used to intercept "Killed" or "Abort trap" messages
+-            if /bin/sh -c $NGX_AUTOTEST >> $NGX_AUTOCONF_ERR 2>&1; then
+-                echo " found"
++            if /bin/sh -c $NGX_AUTOTEST_EXEC >> $NGX_AUTOCONF_ERR 2>&1; then
++                echo " found$NGX_FOUND_MSG"
+                 ngx_found=yes
+ 
+                 if test -n "$ngx_feature_name"; then
+@@ -68,17 +75,27 @@
+ 
+         value)
+             # /bin/sh is used to intercept "Killed" or "Abort trap" messages
+-            if /bin/sh -c $NGX_AUTOTEST >> $NGX_AUTOCONF_ERR 2>&1; then
+-                echo " found"
++            if /bin/sh -c $NGX_AUTOTEST_EXEC >> $NGX_AUTOCONF_ERR 2>&1; then
++                echo " found$NGX_FOUND_MSG"
+                 ngx_found=yes
+ 
+-                cat << END >> $NGX_AUTO_CONFIG_H
++                if [ ".$NGX_CROSS_COMPILE" = ".yes" ]; then
++                    cat << END >> $NGX_AUTO_CONFIG_H
+ 
+ #ifndef $ngx_feature_name
+-#define $ngx_feature_name  `$NGX_AUTOTEST`
++#define $ngx_feature_name  $(eval "echo \$NGX_WITH_${ngx_feature_name}")
+ #endif
+ 
+ END
++		else
++                    cat << END >> $NGX_AUTO_CONFIG_H
++
++#ifndef $ngx_feature_name
++#define $ngx_feature_name  `$NGX_AUTOTEST_EXEC`
++#endif
++
++END
++                fi
+             else
+                 echo " found but is not working"
+             fi
+@@ -86,7 +105,7 @@
+ 
+         bug)
+             # /bin/sh is used to intercept "Killed" or "Abort trap" messages
+-            if /bin/sh -c $NGX_AUTOTEST >> $NGX_AUTOCONF_ERR 2>&1; then
++            if /bin/sh -c $NGX_AUTOTEST_EXEC >> $NGX_AUTOCONF_ERR 2>&1; then
+                 echo " not found"
+ 
+             else
+diff -uraN nginx-1.0.11.orig/auto/options nginx-1.0.11/auto/options
+--- nginx-1.0.11.orig/auto/options	2011-12-14 07:34:16.000000000 -0600
++++ nginx-1.0.11/auto/options	2011-12-27 13:56:42.323370040 -0600
+@@ -353,6 +353,18 @@
+         --test-build-epoll)              NGX_TEST_BUILD_EPOLL=YES   ;;
+         --test-build-solaris-sendfilev)  NGX_TEST_BUILD_SOLARIS_SENDFILEV=YES ;;
+ 
++        # cross compile support
++        --with-int=*)                    NGX_WITH_INT="$value"          ;;
++        --with-long=*)                   NGX_WITH_LONG="$value"         ;;
++        --with-long-long=*)              NGX_WITH_LONG_LONG="$value"    ;;
++        --with-ptr-size=*)               NGX_WITH_PTR_SIZE="$value"     ;;
++        --with-sig-atomic-t=*)           NGX_WITH_SIG_ATOMIC_T="$value" ;;
++        --with-size-t=*)                 NGX_WITH_SIZE_T="$value"       ;;
++        --with-off-t=*)                  NGX_WITH_OFF_T="$value"        ;;
++        --with-time-t=*)                 NGX_WITH_TIME_T="$value"       ;;
++        --with-sys-nerr=*)               NGX_WITH_NGX_SYS_NERR="$value" ;;
++        --with-endian=*)                 NGX_WITH_ENDIAN="$value"       ;;
++
+         *)
+             echo "$0: error: invalid option \"$option\""
+             exit 1
+@@ -533,6 +445,17 @@
+ 
+   --with-debug                       enable debug logging
+ 
++  --with-int=VALUE                   force int size
++  --with-long=VALUE                  force long size
++  --with-long-long=VALUE             force long long size
++  --with-ptr-size=VALUE              force pointer size
++  --with-sig-atomic-t=VALUE          force sig_atomic_t size
++  --with-size-t=VALUE                force size_t size
++  --with-off-t=VALUE                 force off_t size
++  --with-time-t=VALUE                force time_t size
++  --with-sys-nerr=VALUE              force sys_nerr value
++  --with-endian=VALUE                force system endianess
++
+ END
+ 
+     exit 1
+@@ -554,6 +577,8 @@
+ 
+ if [ ".$NGX_PLATFORM" = ".win32" ]; then
+     NGX_WINE=$WINE
++elif [ ! -z "$NGX_PLATFORM" ]; then
++    NGX_CROSS_COMPILE="yes"
+ fi
+ 
+ 
+diff -uraN nginx-1.0.11.orig/auto/types/sizeof nginx-1.0.11/auto/types/sizeof
+--- nginx-1.0.11.orig/auto/types/sizeof	2006-06-28 11:00:26.000000000 -0500
++++ nginx-1.0.11/auto/types/sizeof	2011-12-27 13:56:42.323370040 -0600
+@@ -12,9 +12,12 @@
+ 
+ END
+ 
+-ngx_size=
++ngx_size=$(eval "echo \$NGX_WITH_${ngx_param}")
+ 
+-cat << END > $NGX_AUTOTEST.c
++if [ ".$ngx_size" != "." ]; then
++    echo " $ngx_size bytes"
++else
++    cat << END > $NGX_AUTOTEST.c
+ 
+ #include <sys/types.h>
+ #include <sys/time.h>
+@@ -33,15 +36,16 @@
+ END
+ 
+ 
+-ngx_test="$CC $CC_TEST_FLAGS $CC_AUX_FLAGS \
+-          -o $NGX_AUTOTEST $NGX_AUTOTEST.c $NGX_LD_OPT $ngx_feature_libs"
++    ngx_test="$CC $CC_TEST_FLAGS $CC_AUX_FLAGS \
++              -o $NGX_AUTOTEST $NGX_AUTOTEST.c $NGX_LD_OPT $ngx_feature_libs"
+ 
+-eval "$ngx_test >> $NGX_AUTOCONF_ERR 2>&1"
++    eval "$ngx_test >> $NGX_AUTOCONF_ERR 2>&1"
+ 
+ 
+-if [ -x $NGX_AUTOTEST ]; then
+-    ngx_size=`$NGX_AUTOTEST`
+-    echo " $ngx_size bytes"
++    if [ -x $NGX_AUTOTEST ]; then
++        ngx_size=`$NGX_AUTOTEST`
++        echo " $ngx_size bytes"
++    fi
+ fi
+ 
+ 
+diff -uraN nginx-1.0.11.orig/auto/unix nginx-1.0.11/auto/unix
+--- nginx-1.0.11.orig/auto/unix	2011-12-14 07:34:16.000000000 -0600
++++ nginx-1.0.11/auto/unix	2011-12-27 13:56:42.327370060 -0600
+@@ -393,13 +393,13 @@
+ 
+ # C types
+ 
+-ngx_type="int"; . auto/types/sizeof
++ngx_type="int"; ngx_param="INT"; . auto/types/sizeof
+ 
+-ngx_type="long"; . auto/types/sizeof
++ngx_type="long"; ngx_param="LONG"; . auto/types/sizeof
+ 
+-ngx_type="long long"; . auto/types/sizeof
++ngx_type="long long"; ngx_param="LONG_LONG"; . auto/types/sizeof
+ 
+-ngx_type="void *"; . auto/types/sizeof; ngx_ptr_size=$ngx_size
++ngx_type="void *"; ngx_param="PTR_SIZE"; . auto/types/sizeof; ngx_ptr_size=$ngx_size
+ ngx_param=NGX_PTR_SIZE; ngx_value=$ngx_size; . auto/types/value
+ 
+ 
+@@ -416,7 +416,7 @@
+ 
+ ngx_type="uint64_t"; ngx_types="u_int64_t"; . auto/types/typedef
+ 
+-ngx_type="sig_atomic_t"; ngx_types="int"; . auto/types/typedef
++ngx_type="sig_atomic_t"; ngx_param="SIG_ATOMIC_T"; ngx_types="int"; . auto/types/typedef
+ . auto/types/sizeof
+ ngx_param=NGX_SIG_ATOMIC_T_SIZE; ngx_value=$ngx_size; . auto/types/value
+ 
+@@ -432,15 +432,15 @@
+ 
+ . auto/endianess
+ 
+-ngx_type="size_t"; . auto/types/sizeof
++ngx_type="size_t"; ngx_param="SIZE_T"; . auto/types/sizeof
+ ngx_param=NGX_MAX_SIZE_T_VALUE; ngx_value=$ngx_max_value; . auto/types/value
+ ngx_param=NGX_SIZE_T_LEN; ngx_value=$ngx_max_len; . auto/types/value
+ 
+-ngx_type="off_t"; . auto/types/sizeof
++ngx_type="off_t"; ngx_param="OFF_T"; . auto/types/sizeof
+ ngx_param=NGX_MAX_OFF_T_VALUE; ngx_value=$ngx_max_value; . auto/types/value
+ ngx_param=NGX_OFF_T_LEN; ngx_value=$ngx_max_len; . auto/types/value
+ 
+-ngx_type="time_t"; . auto/types/sizeof
++ngx_type="time_t"; ngx_param="TIME_T"; . auto/types/sizeof
+ ngx_param=NGX_TIME_T_SIZE; ngx_value=$ngx_size; . auto/types/value
+ ngx_param=NGX_TIME_T_LEN; ngx_value=$ngx_max_len; . auto/types/value
+ 
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.9.12.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.9.14.bb
similarity index 66%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.9.12.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.9.14.bb
index dabdb28..585c52c 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.9.12.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.9.14.bb
@@ -6,7 +6,7 @@ DEFAULT_PREFERENCE = "-1"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0bb58ed0dfd4f5dbece3b52aba79f023"
 
-SRC_URI[md5sum] = "0afe4a7e589a0de43b7b54aa055a4351"
-SRC_URI[sha256sum] = "1af2eb956910ed4b11aaf525a81bc37e135907e7127948f9179f5410337da042"
+SRC_URI[md5sum] = "a25818039f34b5d54b017d44c76321c4"
+SRC_URI[sha256sum] = "2b4893076d28e6b4384bba8c4fdebfca6de6f8f68ec48a1ca94b9b855ff457d2"
 
 DISABLE_STATIC = ""
-- 
1.9.1


