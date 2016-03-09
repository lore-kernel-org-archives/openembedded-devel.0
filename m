Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6EEC671957
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Mar 2016 17:07:00 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id u190so16041566pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Mar 2016 09:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=hPvAhFqPBMY7o8d68OIA/UAXD2E9XyjSjsQK8rrj8Rk=;
	b=lkCYNIMgIghGt68dCpc0qDi8Z+pzBnxCOOtQL1F98cE45WsVMhpvF8y635gUakSO4Y
	swFlCQkU1fMsBN+BhtP2BQLRHAg9NnQ7V3LXr+T1Qan8kYRxHuU1zhRZBtnEtneB+a/k
	AIyp8WpnbNLIQ4kLpVDsvvtR119SK3yYZ9Otl1obO3aCr/18M2I/ZQ1tYim2n7cM39aU
	9eRwFXXZEE23Kd1F/ebSPmjyDsEQU2MTmzFJM5iz2SdHjDK4zrrTiP8Ogq7nvQL45i1j
	BKnMmCdqK62VpQvVAin0vwSS1qjsQi/thSqJvJ3xspFx8UBmVI+5MQeuEDQA+UedRWVh
	2AKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=hPvAhFqPBMY7o8d68OIA/UAXD2E9XyjSjsQK8rrj8Rk=;
	b=gMW1H3Uu44dUyhvxIiltbXPij6SkpxVlTW7zSPailBB/M/pGZI/m3vjby81bRcRAcz
	XKd2ygobjmLv4N+yThDvAXndoxeSS7om9U07RXmefPxfuVSq2qUn6px9mguvvSh7jKCJ
	gF45XdzigAzmfilRDigY99wCUVGRKHDnbIktErPMViQr9kSZNZV0+luUnHPMMcmxBVXm
	ji9eMwYFMkPD0AdOa9oYPnrkSl0ffyrXNfO97QLGt1giVgKwmOVoVZMUO5WnnUrHjxSA
	1fnWQUpz8kXDs2ABt/Fb3TQPFl3VqJ4UT6LOB/VgCWyoS35tQc/lEcx9MXMio3kuFp0F
	VBLQ==
X-Gm-Message-State: AD7BkJKh6iLpMIB88RmDJ2a/IceuT9HexOWqBCJnqqs7JtDM+Sl/X9RNTy99v5cGtXom1w==
X-Received: by 10.98.14.2 with SMTP id w2mr51755285pfi.35.1457543221437;
	Wed, 09 Mar 2016 09:07:01 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	n68sm13659161pfj.46.2016.03.09.09.06.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Mar 2016 09:07:00 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Wed,  9 Mar 2016 09:06:57 -0800
Message-Id: <1457543217-11211-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-python][jethro][PATCH][V2] python-m2crypto: fix SSLv2 symbol issue
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
X-List-Received-Date: Wed, 09 Mar 2016 17:07:01 -0000

From: Armin Kuster <akuster@mvista.com>

missed using "-D"  for OPENSSL_NO_SSL2 swig_features.

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
index ff6203f..9daea5e 100644
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
+SWIG_FEATURES += "-DOPENSSL_NO_SSL2"
 export SWIG_FEATURES
 
 # Get around a problem with swig, but only if the
-- 
2.3.5


