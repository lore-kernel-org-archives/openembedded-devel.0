Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id D7C0D70030
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Mar 2016 16:55:10 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id fy10so52740090pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Mar 2016 08:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=MorGN07hvI3M0hVfrgjqnkGEa8U8Lj5C3vxS/oDAwI0=;
	b=QwGkKiHqx07I+6OGwdi0evy3ZcvoIISGkQ2xsdOHgyAH9iLywRccx1mASTA4FcPON6
	P3ZsZPLGuivmh/n/o5SNbc506N4dogRMvY29Uur9B4+Ir0aIf3X7yUwYGs5wgT7hQwcp
	1UbhuaVy8rS6EsDV/9+D2XEqs8uOMM/nivIikCbwGTEXfPB9rRppQtsx8lVcHsg8WCQM
	lb5LC3WGsO1xIP+WpRMx8soJqny4gN9XpDgZH+7hqZqJw3N9deN6n19SZyicRdOX33Dt
	/lJy0jYjbF0AkWDy5XQuq3NOK5qVrpN1WBr3pX1xcSPKx/YxDRV8AX4dF4DKrqgNlcAc
	cSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=MorGN07hvI3M0hVfrgjqnkGEa8U8Lj5C3vxS/oDAwI0=;
	b=A+OgDbuNO/5Yvx3Plxw8lMU64QIZcW5HG59xceZRcAG1Fqe2ogbYIDmg1ykfvjd1Wl
	hmpDejsBitqfHpVDU+dqJo5tCDd3KRLhAl5dVf0X4RcDASR3c/NUBCclbfgvVpKEz25G
	5EIZt3dWOgU/fhl1lbabTxN7TacmfWN6FqpTxDxF+uAaeFxkua1NO023uo39WIsBhDdR
	mrfxS8ZhQHd6YQb3iukgmKPqA6nCzfu7KjTC+a5MFVCzBNJCrNpASlD/zblD/88hqb1J
	b5B+GCfVHBSEouxhMFoJzTZBLOdedvaV1NWn89eaJ08Dh4ZXqspy9ho8RO5MeDKxPms/
	mZWg==
X-Gm-Message-State: AD7BkJIvFv5lVKXy2wztXg88UJ7f8atRQSszr4BGXE/XeTj/7VsbI+BrE1wuH3Ub8QcgCA==
X-Received: by 10.66.190.168 with SMTP id gr8mr21194157pac.23.1457196911095;
	Sat, 05 Mar 2016 08:55:11 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	p79sm9126131pfi.61.2016.03.05.08.55.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 05 Mar 2016 08:55:09 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  5 Mar 2016 08:54:57 -0800
Message-Id: <1457196897-9174-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-python][jethro][fido][PATCH] python-m2crypto: fix SSLv2 symbol issue
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
X-List-Received-Date: Sat, 05 Mar 2016 16:55:11 -0000

From: Armin Kuster <akuster@mvista.com>

ERROR: Failed to import the "M2Crypto" module: .../usr/lib/python2.7/site-packages/M2Crypto/__m2crypto.so: undefined symbol: SSLv2_method

disable using SSLv2_method if not supported in openssl. This is now the case
with the advent of CVE-2016-0800

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 ...y_build_with_SSLv2_when_it_is_not_available.patch | 20 ++++++++++++++++++++
 .../python/python-m2crypto_0.21.1.bb                 |  4 +++-
 2 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python-m2crypto/dont_try_build_with_SSLv2_when_it_is_not_available.patch

diff --git a/meta-python/recipes-devtools/python/python-m2crypto/dont_try_build_with_SSLv2_when_it_is_not_available.patch b/meta-python/recipes-devtools/python/python-m2crypto/dont_try_build_with_SSLv2_when_it_is_not_available.patch
new file mode 100644
index 0000000..526c23f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-m2crypto/dont_try_build_with_SSLv2_when_it_is_not_available.patch
@@ -0,0 +1,20 @@
+Upstream-Status: Backport
+https://gitlab.com/m2crypto/m2crypto/commit/ac01b38302474920288c1a9eb63fd35fa8d1db5b
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Index: M2Crypto-0.21.1/SWIG/_ssl.i
+===================================================================
+--- M2Crypto-0.21.1.orig/SWIG/_ssl.i
++++ M2Crypto-0.21.1/SWIG/_ssl.i
+@@ -48,8 +48,10 @@ extern const char *SSL_alert_desc_string
+ %rename(ssl_get_alert_desc_v) SSL_alert_desc_string_long;
+ extern const char *SSL_alert_desc_string_long(int);
+ 
++#ifndef OPENSSL_NO_SSL2
+ %rename(sslv2_method) SSLv2_method;
+ extern SSL_METHOD *SSLv2_method(void);
++#endif
+ %rename(sslv3_method) SSLv3_method;
+ extern SSL_METHOD *SSLv3_method(void);
+ %rename(sslv23_method) SSLv23_method;
diff --git a/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb b/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
index ff6203f..7dfa8d8 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
+++ b/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=b0e1f0b7d0ce8a62c18b1287b991800e"
 
 SRC_URI = "http://pypi.python.org/packages/source/M/M2Crypto/M2Crypto-${PV}.tar.gz \
            file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch \
-           file://0001-M2Crypto-Error-fix.patch"
+           file://0001-M2Crypto-Error-fix.patch \
+           file://dont_try_build_with_SSLv2_when_it_is_not_available.patch"
 
 SRC_URI[md5sum] = "f93d8462ff7646397a9f77a2fe602d17"
 SRC_URI[sha256sum] = "25b94498505c2d800ee465db0cc1aff097b1615adc3ac042a1c85ceca264fc0a"
@@ -19,6 +20,7 @@ inherit setuptools
 
 SWIG_FEATURES_x86-64 = "-D__x86_64__"
 SWIG_FEATURES ?= ""
+SWIG_FEATURES += "OPENSSL_NO_SSL2"
 export SWIG_FEATURES
 
 # Get around a problem with swig, but only if the
-- 
2.3.5


