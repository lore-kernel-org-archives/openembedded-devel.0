Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48039.1795411867482134676
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=rr+XXEZ8;
 spf=pass (domain: gmail.com, ip: 74.125.82.54, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so3496160c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411867; x=1796016667; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LEKRrB6bHSV7IAiQAQnNyXnFbwPDR2Cqd3UzNJXDI6o=;
        b=rr+XXEZ8xTQD/c0gtL9rnGi3GD8GGecnDZCv982Vm8895qrUzhSa98o9TwF1EJNPmH
         1OWOUsIY3hywBxl+ut2ji/FUcqsOHeBrShTckQetNdKMUziGE90+Bb0ARgaLUjdoZ8MX
         iFu3n43tfHU8R/Gef1vMNiuMSPyePKs5dtkMPEAumhwD9wxxY0iCEZGAkHqw5m9ADA3f
         VEpJnv8+8n5BMcUV/Q1mQ6VCwHFK3qD3BiEc6ESxHTrJDDwHieUSX13mD5CwcFFx8+59
         UV1pmo71CI3mxVCiRKZb2TR/k5FpKb0q1PuEj7Jf6gbJJC1xMXpIrgkd0wUx1FpLt3nk
         AsMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411867; x=1796016667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LEKRrB6bHSV7IAiQAQnNyXnFbwPDR2Cqd3UzNJXDI6o=;
        b=jsKJE3qHSM4P5n4rhGT1PfavvIrvh4AfRvnLESfCgETAy8AgZ0glzBlwUo4006cIzi
         oIkCaM53zyi8sKZSQ8t+mZpuSDeI5DjiKLT9ufYVXGECdRyn+SOm8RfULgzbpSIrrsSI
         5Dgo5bm7+4dbX7uZ0vMjgUNQlvAImJ1z+wK88uO7Ks/rhlCut38CKJpBQ3Wq2Ek5XXdn
         qblRlFNehXzZal2x+6xpap2gkCcRLxWRPuUgY8haRE5dLezgzo+/Io/t51Y9HwUqUyrN
         ZqFlVGqWa1O1oOX1lFUknUUpc2RCy9Gfu5xMM4/rxEJSMh/JWRI/UvJ829EfJp1KN7ih
         Ihmg==
X-Gm-Message-State: APuU4Z9FX1R1v1/JaIVWpulU95wzsUF7lEv63uhr3/Q8Uo8+QuJyPUmA
	joY/G9NC1q5NJ672nzE+eyKIlYniOmBXCADHwPYcAJUfn2B2VhDhrLOxrY/a6p3pIA4=
X-Gm-Gg: AZFdTZdBxgAb+P+bML9tYHcwmlirtxcjOctMnnJCnEe/QeW+vQeXJKLURS4NYnLTHMa
	z53CkouvdUmTU9SnBhWxbKWzWOQSDYMDUJOrWOGFvejuJ5le6osfnRoagG/iFl90eYIIwFDXkmf
	0R6WLx0X1CGGFxb3Wo/cFpXdNTwQ0CVbPCXeZeGm767b0uR7CRTPOFIioRP9r0BYxRFQBZk6baL
	o6cyJyl6PvNyuBaJSfsHvdaJ2tx/SjNGZpt/JCsLnVlHb7M+eBTFbwp0zlHl3N6cna71QwJFC1R
	K+X4RZ4npIdCkIIExTToPoT+iD1hXtw+un43Ob/C549wHqwaKxGQajmFcqJM6kgW1dgrCQRFo4H
	I8K4gz9Sxa75KsP2uqcGq2mILZFWjtg/I2gDjKDbXE3BULWo//u0jgrsFNnPY5xHWDqFocZ9f1M
	VZmQu0S/ysi9PWC03fjt/eIDLvN+OSeMYGHFDZBSWDhSOF/DX0e2kw4LU8qqjsy9ENxtYts9MLQ
	o0z76jmEytykFaYM/XKoaS8pO0d+kFUbsrUet75LpYoNcjx0e6gw8PyQwBFfiyxrEudmpgNyzGW
	yXNSpCiXMJFt7QaE4TBT4iEXG0UjCGCZg3E3cAFEs3IwD/j+2w4PHBmSt9zxPU5f0kOTGC8PxLD
	bo4LtBHGV4VU87WAPTMrqaxLoHb8KX2aK0KsEz1Vm4hwz/OCIcAsflvhLNZdZvvlKiO/KQZHLi4
	k4F5CfgRKJ11jLWgU+jn0hKGtooGQzHgiAdxFEPEtQq6FhBxMLU55E3B31ErTRyeoAFkwNJ445O
	ms7ChmYYmU+fItCZY40VVl5+3UR6mSU5qJ9AT7Rwa+MXVwxNeNDJ/YyWwYnYgsWSlSPBgn/ieNR
	4VT4fsY2ex6m1O52PQEFNHHLfQ==
X-Received: by 2002:a05:693c:8210:b0:386:b0f2:fb1a with SMTP id 5a478bee46e88-386b0f2fbbamr2254879eec.18.1795411866730;
        Sun, 22 Nov 2026 21:31:06 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 30/42] php: upgrade 8.5.13 -> 8.6.0
Date: Sun, 22 Nov 2026 21:29:14 -0800
Message-ID: <20261123052953.3658549-58-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132845
Content-Type: text/plain; charset="utf-8"

New feature release PHP 8.6:
- Partial function application, readonly property defaults,
  #[\Override] on class constants, __debugInfo() on enums
- New Time\Duration class, polling API and stream errors API
- OpenSSL streams: TLS session resumption, external PSK and TLS 1.3
  early data; new curl, GMP, Intl and SNMP features
- Backward incompatible changes in several extensions (more
  ValueError/TypeError checks); mbregex and others deprecated
- Security fixes: CVE-2026-129182, CVE-2026-129289, CVE-2026-129291,
  CVE-2026-129292, CVE-2026-129474, CVE-2026-129496, CVE-2026-129501,
  CVE-2026-129538

PHP 8.6 is relicensed from the PHP License 3.01 to BSD-3-Clause and
folds the Zend license into it. The bundled libtool is now split into
separate m4 files: drop all of them from configure.ac and install the
system copies individually for phpize. The libtool macros reject
--with-pic, use --enable-pic.

License-Update: PHP 8.6 is relicensed from PHP-3.01 to BSD-3-Clause
AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ure.ac-don-t-include-build-libtool.m4.patch | 15 +++++++++------
 .../php/{php_8.5.13.bb => php_8.6.0.bb}        | 18 ++++++++----------
 2 files changed, 17 insertions(+), 16 deletions(-)
 rename meta-oe/recipes-devtools/php/{php_8.5.13.bb => php_8.6.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/php/php/0001-configure.ac-don-t-include-build-libtool.m4.patch b/meta-oe/recipes-devtools/php/php/0001-configure.ac-don-t-include-build-libtool.m4.patch
index ae57c012ff..f6bf80ce49 100644
--- a/meta-oe/recipes-devtools/php/php/0001-configure.ac-don-t-include-build-libtool.m4.patch
+++ b/meta-oe/recipes-devtools/php/php/0001-configure.ac-don-t-include-build-libtool.m4.patch
@@ -13,18 +13,21 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
 update patch to 8.0.12
 Signed-off-by: Claude Bing <cbing@cybernetics.com>
 ---
- configure.ac | 1 -
- 1 file changed, 1 deletion(-)
+ configure.ac | 6 ------
+ 1 file changed, 6 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
-index b0ea82bf..31933cca 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -6,7 +6,6 @@ dnl ----------------------------------------------------------------------------
- m4_include([build/ax_check_compile_flag.m4])
+@@ -7,12 +7,6 @@
  m4_include([build/ax_func_which_gethostbyname_r.m4])
  m4_include([build/ax_gcc_func_attribute.m4])
+ 
 -m4_include([build/libtool.m4])
+-m4_include([build/ltoptions.m4])
+-m4_include([build/ltsugar.m4])
+-m4_include([build/ltversion.m4])
+-m4_include([build/lt~obsolete.m4])
+-
  m4_include([build/php_cxx_compile_stdcxx.m4])
  m4_include([build/php.m4])
  m4_include([build/pkg.m4])
diff --git a/meta-oe/recipes-devtools/php/php_8.5.13.bb b/meta-oe/recipes-devtools/php/php_8.6.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/php/php_8.5.13.bb
rename to meta-oe/recipes-devtools/php/php_8.6.0.bb
index 0fbcfd6ea2..b6cbf02a2f 100644
--- a/meta-oe/recipes-devtools/php/php_8.5.13.bb
+++ b/meta-oe/recipes-devtools/php/php_8.6.0.bb
@@ -2,8 +2,8 @@ SUMMARY = "A server-side, HTML-embedded scripting language"
 HOMEPAGE = "https://www.php.net"
 SECTION = "console/network"
 
-LICENSE = "PHP-3.01"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fd469cce1a919f0cc95bab7afb28d19d"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=31121fc749dab3726adb6deb79a59616"
 
 BBCLASSEXTEND = "native"
 DEPENDS = "zlib bzip2 libxml2 virtual/libiconv php-native"
@@ -32,7 +32,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/php-(?P<pver>\d+(\.\d+)+)"
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "47d50c36016784a4a71f019cd7bfa29c31e4be0de22d3fa06095b280a6299e2f"
+SRC_URI[sha256sum] = "9e233e38999a89f351a33ae6a7276d1caf5addcba11e09e3bbe3a8d25f411ff1"
 
 CVE_PRODUCT = "php:php php_group:php"
 
@@ -62,7 +62,7 @@ COMMON_EXTRA_OECONF = "--enable-sockets \
                        --enable-pcntl \
                        --enable-shared \
                        --disable-rpath \
-                       --with-pic \
+                       --enable-pic \
                        --libdir=${PHP_LIBDIR} \
 "
 EXTRA_OECONF = "--enable-mbstring \
@@ -134,7 +134,7 @@ LDFLAGS:append:riscv64 = " -latomic"
 EXTRA_OEMAKE = "INSTALL_ROOT=${D}"
 
 do_configure:prepend () {
-    rm -f ${S}/build/libtool.m4 ${S}/ltmain.sh ${S}/aclocal.m4
+    rm -f ${S}/build/libtool.m4 ${S}/build/lt*.m4 ${S}/ltmain.sh ${S}/aclocal.m4
     find ${S} -name config.m4 | xargs -n1 sed -i 's!APXS_HTTPD=.*!APXS_HTTPD=${STAGING_SBINDIR_NATIVE}/httpd!'
 }
 
@@ -158,11 +158,9 @@ do_install:append:class-native() {
 }
 
 do_install:prepend() {
-    cat ${STAGING_DATADIR}/aclocal/libtool.m4 \
-    ${STAGING_DATADIR}/aclocal/lt~obsolete.m4 \
-    ${STAGING_DATADIR}/aclocal/ltoptions.m4 \
-    ${STAGING_DATADIR}/aclocal/ltsugar.m4 \
-    ${STAGING_DATADIR}/aclocal/ltversion.m4 > ${S}/build/libtool.m4
+    for m4 in libtool lt~obsolete ltoptions ltsugar ltversion; do
+        cp ${STAGING_DATADIR}/aclocal/$m4.m4 ${S}/build/
+    done
 }
 
 do_install:prepend:class-target() {
