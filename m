Return-Path: <koen.kooi@linaro.org>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id A068A601A8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Oct 2014 09:55:14 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id a1so6026161wgh.23
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Oct 2014 02:55:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QBlUwsf9tZTxPJbpJ4yalcYfC9yY6Ud7G+Biu5+O2Fk=;
	b=bY+5NVwVVrJlEPh1zgwoL3Ngq2WHUmsCwLKkYESfmZ1oz1UiEyAFHT2LkFw7vHTHUT
	5GgCGvJ9szy0DA7xYz1f6pDczOuZ0hYrojFLWTheY7f+5JZi7UnD46c84DN51150ZBPV
	ECi9PjHKvlWU8RZaSWfxu1CjPK8UcAuXoZXEuRukCw86GV3XRnBVtkSiGL3LfY4DBA5d
	GQ+Iex8UTacCQYE4d/xFQbhKlzSVDRS6KxuaA2NjiDyrMs4BBNCKqQJrvyjuQYY50c/H
	GkGSLcuKv4TTODjnA843MtpBJWQH0hQx5hLbWDr7HmqS2WI8BtMjdE853zGfBIPvUsxw
	4pow==
X-Gm-Message-State: ALoCoQlCjBS31MWTpRv/HohpEs+kPkoE5XaQbXYhcO1PCH7KFh3oSrke+6Ed/CEdi9pzZAPP15+x
X-Received: by 10.194.47.134 with SMTP id d6mr28357061wjn.76.1412589315394;
	Mon, 06 Oct 2014 02:55:15 -0700 (PDT)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by mx.google.com with ESMTPSA id ka3sm16775801wjc.3.2014.10.06.02.55.14
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Oct 2014 02:55:14 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Oct 2014 11:55:00 +0200
Message-Id: <1412589301-6669-2-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1412589301-6669-1-git-send-email-koen.kooi@linaro.org>
References: <1412589301-6669-1-git-send-email-koen.kooi@linaro.org>
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH 2/3] php 5.4.14 : remove references to sysroot in target package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Oct 2014 09:55:17 -0000

This fixes:

WARNING: QA Issue: php requires /build/linaro/build/build/tmp-glibc/work/armv7at2hf-vfp-oe-linux-gnueabi/php/5.4.14-r5.0/image/usr/bin/php, but no providers in its RDEPENDS [file-rdeps]

The only sysroot references left are for the stored configure line:

[koen@thinkpad image]$ grep linaro . -rn
Binair bestand ./usr/sbin/php-fpm bevat de gezochte tekst.
./usr/include/php/main/build-defs.h:21:#define CONFIGURE_COMMAND " '/build/linaro/build/build/tmp-glibc/work/aarch64-oe-linux/php/5.4.14-r6/php-5.4.14/configure'  '--build=x86_64-linux' '--host=aarch64-oe-linux' '--target=aarch64-oe-linux' '--prefix=/usr' '--exec_prefix=/usr' '--bindir=/usr/bin' '--sbindir=/usr/sbin' '--libexecdir=/usr/lib/php' '--datadir=/usr/share' '--sysconfdir=/etc' '--sharedstatedir=/com' '--localstatedir=/var' '--libdir=/usr/lib' '--includedir=/usr/include' '--oldincludedir=/usr/include' '--infodir=/usr/share/info' '--mandir=/usr/share/man' '--disable-silent-rules' '--disable-dependency-tracking' '--with-libtool-sysroot=/build/linaro/build/build/tmp-glibc/sysroots/genericarmv8' '--enable-mbstring' '--enable-wddx' '--enable-fpm' '--with-imap=/build/linaro/build/build/tmp-glibc/sysroots/genericarmv8' '--with-gettext=/usr/lib/..' '--with-imap-ssl=/build/linaro/build/build/tmp-glibc/sysroots/genericarmv8' '--with-zlib=/usr/lib/..' '--with-iconv=/usr/lib/..' \
'--enable-sockets' '--enable-pcntl' '--enable-shared' '--enable-nls' '--with-mysql=/build/linaro/build/build/tmp-glibc/sysroots/genericarmv8/usr' '--with-mysqli=/build/linaro/build/build/tmp-glibc/sysroots/genericarmv8/usr/bin/crossscripts/mysql_config' '--with-pdo-mysql=/build/linaro/build/build/tmp-glibc/sysroots/genericarmv8/usr/bin/crossscripts/mysql_config' '--with-sqlite3=/usr/lib/..' '--with-pdo-sqlite=/usr/lib/..'"
Binair bestand ./usr/bin/phar.phar bevat de gezochte tekst.
./usr/bin/php-config:20:configure_options=" '--build=x86_64-linux' '--host=aarch64-oe-linux' '--target=aarch64-oe-linux' '--prefix=/usr' '--exec_prefix=/usr' '--bindir=/usr/bin' '--sbindir=/usr/sbin' '--libexecdir=/usr/lib/php' '--datadir=/usr/share' '--sysconfdir=/etc' '--sharedstatedir=/com' '--localstatedir=/var' '--libdir=/usr/lib' '--includedir=/usr/include' '--oldincludedir=/usr/include' '--infodir=/usr/share/info' '--mandir=/usr/share/man' '--disable-silent-rules' '--disable-dependency-tracking' '--with-libtool-sysroot=/build/linaro/build/build/tmp-glibc/sysroots/genericarmv8' '--enable-mbstring' '--enable-wddx' '--enable-fpm' '--with-imap=/build/linaro/build/build/tmp-glibc/sysroots/genericarmv8' '--with-gettext=/usr/lib/..' '--with-imap-ssl=/build/linaro/build/build/tmp-glibc/sysroots/genericarmv8' '--with-zlib=/usr/lib/..' '--with-iconv=/usr/lib/..' \
'--enable-sockets' '--enable-pcntl' '--enable-shared' '--enable-nls' '--with-mysql=/build/linaro/build/build/tmp-glibc/sysroots/genericarmv8/usr' '--with-mysqli=/build/linaro/build/build/tmp-glibc/sysroots/genericarmv8/usr/bin/crossscripts/mysql_config' '--with-pdo-mysql=/build/linaro/build/build/tmp-glibc/sysroots/genericarmv8/usr/bin/crossscripts/mysql_config' '--with-sqlite3=/usr/lib/..' '--with-pdo-sqlite=/usr/lib/..'"
Binair bestand ./usr/bin/php-cgi bevat de gezochte tekst.
Binair bestand ./usr/bin/php bevat de gezochte tekst.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta-oe/recipes-devtools/php/php_5.4.14.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-oe/recipes-devtools/php/php_5.4.14.bb b/meta-oe/recipes-devtools/php/php_5.4.14.bb
index 98a8cdc..b738701 100644
--- a/meta-oe/recipes-devtools/php/php_5.4.14.bb
+++ b/meta-oe/recipes-devtools/php/php_5.4.14.bb
@@ -114,6 +114,15 @@ do_install_append_class-target() {
         rmdir ${TMP}
         TMP=`dirname ${TMP}`;
     done
+
+    # Remove references to sysroot
+    for script in peardev pear pecl php-config ; do
+        sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g -e  s:${STAGING_LIBDIR}:${libdir}:g ${D}${bindir}/$script
+    done
+
+    for header in ${D}${includedir}/php/main/*.h ${D}${includedir}/php/ext/iconv/*.h ; do
+        sed -i -e s:${STAGING_LIBDIR}:${libdir}:g -e s:${STAGING_INCDIR}:${includedir}:g $header
+    done
 }
 
 PACKAGES = "${PN}-dbg ${PN}-cli ${PN}-cgi ${PN}-fpm ${PN}-fpm-apache2 ${PN}-pear ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}"
-- 
1.9.3


