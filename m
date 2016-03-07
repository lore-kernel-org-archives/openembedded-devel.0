Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id ECF5260125
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Mar 2016 22:14:10 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id tt10so23812513pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Mar 2016 14:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=nBhPq2sX/dSlyYWZwRk3PYj4tBJVXAfcnK+rSkJ9HYA=;
	b=BB3Ij00cOG3atz3EReFsL1HNrrs/UZWzvDDxn5OYpd0SlAFBGP4dLw7ux5rXvT/5KQ
	zTXL39W2k5vs3fOoYcD093COd/A48gGppecyVHrOIgV97TyOvbZtYE8XRZV21MvxrNng
	1/endHcuXfr1hQkQ9NiB2VZAHCSaKmAjJdxekn/SdXr+vqMsCYHSz9OfnFZo2PdzxeRv
	CI9dnWEBY1pX/vkKp4vfmcZX7NWvw/CeIoPHbdY4a11qZRTdo/iQW8fWdti3KHqT/1Tg
	UqTlZtCJV6FzIcdKAaSVnWRA4MC/akdhsPDUVJmeqPPKrSK7fKsiTZjmh4tbK+ZAflKg
	hgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nBhPq2sX/dSlyYWZwRk3PYj4tBJVXAfcnK+rSkJ9HYA=;
	b=ZDzCGa9MD+bZauMp/pu96I69ETT1wkJcFnS1owohwNtTIkBP4dkBilifXx7hjHHvcR
	kbu4Qb1CJb4Ndkjp4I4uGIZl22AsqUcbOEjw1AEflRJb1abaWvbbRAVY00o61PHvnOTG
	RfVfh0ckDumnhG0lJcd9hM0TkWjiVYTFmIFL3Pvee7KPgevJg/vEoPVKC/cuVir1/ugu
	YeEobeQd/P5ns9fVFMIk7qP7La+NAQfKqHzeqh2Re/ciXifWoEBH5GY9nMu35nl2SNsL
	t7S+b/gJgDfyylr4uxf+bTa1GhU49//2vJLqclkbzwx7OG+xxL46kDQ+xWmsIxU7SgM2
	UFog==
X-Gm-Message-State: AD7BkJK9YhHT5jpzbYSc846kHqrtSxM9njebwoshM4mXA/SOmWdbMrcjWS2d47/THwBnXg==
X-Received: by 10.66.235.9 with SMTP id ui9mr36921816pac.135.1457388851080;
	Mon, 07 Mar 2016 14:14:11 -0800 (PST)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id
	wq3sm6212440pac.44.2016.03.07.14.14.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Mar 2016 14:14:08 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Mar 2016 14:14:07 -0800
Message-Id: <1457388847-9547-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-python][fido][PATCH] python-m2crypto: fix SSLv2 symbol issue
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
X-List-Received-Date: Mon, 07 Mar 2016 22:14:13 -0000

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
index 67ec921..e03619a 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
+++ b/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
@@ -7,7 +7,8 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=b0e1f0b7d0ce8a62c18b1287b991800e"
 
 SRC_URI = "http://pypi.python.org/packages/source/M/M2Crypto/M2Crypto-${PV}.tar.gz \
-           file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch"
+           file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch \
+           file://dont_try_build_with_SSLv2_when_it_is_not_available.patch"
 
 SRC_URI[md5sum] = "f93d8462ff7646397a9f77a2fe602d17"
 SRC_URI[sha256sum] = "25b94498505c2d800ee465db0cc1aff097b1615adc3ac042a1c85ceca264fc0a"
@@ -18,6 +19,7 @@ inherit setuptools
 
 SWIG_FEATURES_x86-64 = "-D__x86_64__"
 SWIG_FEATURES ?= ""
+SWIG_FEATURES += "OPENSSL_NO_SSL2"
 export SWIG_FEATURES
 
 # Get around a problem with swig, but only if the
-- 
2.3.5


