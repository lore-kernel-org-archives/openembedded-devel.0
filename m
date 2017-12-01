Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 28554783C9
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Dec 2017 15:42:54 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id t187so13667782qkh.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 07:42:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RhKQ4bCZu473FAVmBRKy1sACs0pS8hqJ4qkTdjvTAWs=;
	b=mhYZxU5oqqhsx0Sr/o9zVKkfmhle/+rmtr0/s6SqpaWdY9JK7VRHGEY/jqKgBy+Fg/
	SkPXG1QsLFDudF6zBxqJpVSv9LqSjiMYgdT3hHgnZN+wZFx7Xtpj/KLTCXLLk2arCicQ
	KDk5ldhyqv2u5H80MaFQEUfHLm0Djqtm03hnM7mm8iDT7hTJ1fOx1IvC7KeTmdNlGBRi
	SKKxWLrkdS/xyx/AB8qC/WMATT88QMlJ/qEm7NHPThypQYmrvoOCb0ASBlzvMi+uN4tl
	x5v18GfTbl54Jz6OodVmVdbIrTuNI0NasuC+w4A4ni+p13VApZP7Hy1rbzRHH2ot6Ks2
	TR6g==
X-Gm-Message-State: AKGB3mKosLTDSJkES7DOwBAA+lh3CYMswf7Kwvp0EP1iPY37JPAyarom
	K8Jo8qDoASC1EZQxiu4srBVnvYD/
X-Google-Smtp-Source: AGs4zMZTBHclubI464wy02+l2vpwYoVuNxPoVkk/2ABRwcOqUtKP27YCa9PQlCUwWvX1rKVpGoaKkQ==
X-Received: by 10.55.6.133 with SMTP id 127mr7987539qkg.219.1512142975872;
	Fri, 01 Dec 2017 07:42:55 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id y9sm4617445qkl.17.2017.12.01.07.42.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Dec 2017 07:42:55 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Dec 2017 10:42:48 -0500
Message-Id: <1512142968-18809-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH] nginx: correctly set the endianness of the target
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
X-List-Received-Date: Fri, 01 Dec 2017 15:42:55 -0000

Add an inherit for siteinfo to get access to SITEINFO_ENDIANNESS
Add a patch to have nginx actually use the user provided --with-endian

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...verriding-of-the-endianness-via-the-confi.patch | 80 ++++++++++++++++++++++
 meta-webserver/recipes-httpd/nginx/nginx.inc       |  3 +-
 2 files changed, 82 insertions(+), 1 deletion(-)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/0001-Allow-the-overriding-of-the-endianness-via-the-confi.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/0001-Allow-the-overriding-of-the-endianness-via-the-confi.patch b/meta-webserver/recipes-httpd/nginx/files/0001-Allow-the-overriding-of-the-endianness-via-the-confi.patch
new file mode 100644
index 0000000..ffd5ee3
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/0001-Allow-the-overriding-of-the-endianness-via-the-confi.patch
@@ -0,0 +1,80 @@
+From be9970aa16c5142ef814531d74a07990a8e9eb14 Mon Sep 17 00:00:00 2001
+From: Derek Straka <derek@asterius.io>
+Date: Fri, 1 Dec 2017 10:32:29 -0500
+Subject: [PATCH] Allow the overriding of the endianness via the configure flag
+ --with-endian
+
+The existing configure options contain the --with-endian; however, the command
+line flag does not actually function.  It does not set the endianness and it
+appears to do nothing.
+
+Upstream-Status: Pending
+
+Signed-off-by: Derek Straka <derek@asterius.io>
+
+diff --git a/auto/endianness b/auto/endianness
+index 1b552b6..be84487 100644
+--- a/auto/endianness
++++ b/auto/endianness
+@@ -13,7 +13,13 @@ checking for system byte ordering
+ END
+ 
+ 
+-cat << END > $NGX_AUTOTEST.c
++if [ ".$NGX_WITH_ENDIAN" = ".little" ]; then
++    echo " little endian"
++    have=NGX_HAVE_LITTLE_ENDIAN . auto/have
++elif [ ".$NGX_WITH_ENDIAN" = ".big" ]; then
++    echo " big endian"
++else
++    cat << END > $NGX_AUTOTEST.c
+ 
+ int main(void) {
+     int i = 0x11223344;
+@@ -26,25 +32,26 @@ int main(void) {
+ 
+ END
+ 
+-ngx_test="$CC $CC_TEST_FLAGS $CC_AUX_FLAGS \
+-          -o $NGX_AUTOTEST $NGX_AUTOTEST.c $NGX_LD_OPT $ngx_feature_libs"
++    ngx_test="$CC $CC_TEST_FLAGS $CC_AUX_FLAGS \
++              -o $NGX_AUTOTEST $NGX_AUTOTEST.c $NGX_LD_OPT $ngx_feature_libs"
+ 
+-eval "$ngx_test >> $NGX_AUTOCONF_ERR 2>&1"
++    eval "$ngx_test >> $NGX_AUTOCONF_ERR 2>&1"
+ 
+-if [ -x $NGX_AUTOTEST ]; then
+-    if $NGX_AUTOTEST >/dev/null 2>&1; then
+-        echo " little endian"
+-        have=NGX_HAVE_LITTLE_ENDIAN . auto/have
+-    else
+-        echo " big endian"
+-    fi
++    if [ -x $NGX_AUTOTEST ]; then
++        if $NGX_AUTOTEST >/dev/null 2>&1; then
++            echo " little endian"
++            have=NGX_HAVE_LITTLE_ENDIAN . auto/have
++        else
++            echo " big endian"
++        fi
+ 
+-    rm -rf $NGX_AUTOTEST*
++        rm -rf $NGX_AUTOTEST*
+ 
+-else
+-    rm -rf $NGX_AUTOTEST*
++    else
++        rm -rf $NGX_AUTOTEST*
+ 
+-    echo
+-    echo "$0: error: cannot detect system byte ordering"
+-    exit 1
++        echo
++        echo "$0: error: cannot detect system byte ordering"
++        exit 1
++    fi
+ fi
+-- 
+2.7.4
+
+
diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index 4a97e26..51523b6 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -14,13 +14,14 @@ DEPENDS = "libpcre zlib openssl"
 SRC_URI = " \
     http://nginx.org/download/nginx-${PV}.tar.gz \
     file://nginx-cross.patch \
+    file://0001-Allow-the-overriding-of-the-endianness-via-the-confi.patch \
     file://nginx.conf \
     file://nginx.init \
     file://nginx-volatile.conf \
     file://nginx.service \
 "
 
-inherit update-rc.d useradd systemd
+inherit siteinfo update-rc.d useradd systemd
 
 SYSTEMD_SERVICE_${PN} = "nginx.service"
 
-- 
2.7.4


