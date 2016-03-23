Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id B7C446B6EA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 21:53:05 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id tt10so5257375pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 14:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=edYIm8tRKpgMvNk0oPXcPVkMN9rlw0jChLNL5FoRhRc=;
	b=UvM9XgC9TQhanYW/Ii4dX+4DrvkCcc81Pq8ZyKJAsKCJ6Ma8XCbrF8akivg/27BCa0
	AC1sg5mBtl4aCkEgHuZZBg1GxhIzOzmfVr7U4A8jebKqqNotiVCJhkG+GnJjzmV6s//I
	mGGK1KgmY17bPDeWdgAjxVIT8RMUa8cWe4rlNmYjRMzeOC+mlYhqLsHLVUWf+6c8o1OL
	bqwQdBkXvWOw5DKJSI0aTEhXPLv6GHD3w5vfi3a7EINvLglbF9S9pZ0GoB9bMmiuPje+
	nSIAThwvXnVHHR7tRHHBlXgdTQMnC1QlmuKrIYLRQfEvjwpCjkf7kMSog15xsHzr/HtH
	OcsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=edYIm8tRKpgMvNk0oPXcPVkMN9rlw0jChLNL5FoRhRc=;
	b=mMOcu9qBpG1OYuNPxzabrRiGjCMDMRzPmb7HP2VdxDitV7UN/KnNYkzvBZz0BEXest
	YeKjArtN5E81otbck3lS69uJ2zhQiBmgIVyjIDbNeiQrIo5qZVPeWDFqC+WHUGgLya0g
	FjRpOuRnwcgiBhTB/4XMnRhP/XIxf0r8qgJeiz5J6F1+lTAzm1mTyGWsnHW2aeU1vd4U
	KKcknprErWbbikcdWKJR5ivWuBo4QHQ99LnqBribcXEHc8JwOXf1bsaANIXPQ3S13/cX
	eaFgAJggNXT/7hNWrazP1TjvKqKwmi0ZRBgNBNc886D98h3zgW6cHhENGXaaLwcQnx+F
	vDTA==
X-Gm-Message-State: AD7BkJImeqo7HunrDBICyogf/JIZeU/4ywXGK+F7t63purwOk/MSc4tM4TievZ6hCqHGHQ==
X-Received: by 10.66.147.74 with SMTP id ti10mr7638387pab.128.1458769985831;
	Wed, 23 Mar 2016 14:53:05 -0700 (PDT)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id y7sm6314765pfa.82.2016.03.23.14.53.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Mar 2016 14:53:04 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Mar 2016 14:53:03 -0700
Message-Id: <1458769983-8205-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-python][PATCH] python-crytograph: fix build issue do to openssl 1.0.1g upgrade
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
X-List-Received-Date: Wed, 23 Mar 2016 21:53:08 -0000

From: Armin Kuster <akuster@mvista.com>

this fixes

build/temp.linux-x86_64-2.7/_openssl.c:697:6: error: conflicting types for 'BIO_new_mem_buf'
BIO *BIO_new_mem_buf(void *, int);
       ^
In file included from /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/include/openssl/asn1.h:65:0,
from build/temp.linux-x86_64-2.7/_openssl.c:413:

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../build_fix_openssl_1.0.1g.patch                 | 28 ++++++++++++++++++++++
 .../python/python-cryptography_1.1.bb              |  3 ++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python-cryptography/build_fix_openssl_1.0.1g.patch

diff --git a/meta-python/recipes-devtools/python/python-cryptography/build_fix_openssl_1.0.1g.patch b/meta-python/recipes-devtools/python/python-cryptography/build_fix_openssl_1.0.1g.patch
new file mode 100644
index 0000000..d08994f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-cryptography/build_fix_openssl_1.0.1g.patch
@@ -0,0 +1,28 @@
+build issue do to openssl 1.0.1g upgrade
+
+BIO *BIO_new_mem_buf(void *, int);
+      ^
+In file included from /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/include/openssl/asn1.h:65:0,
+from build/temp.linux-x86_64-2.7/_openssl.c:413:
+
+
+Upstream-Status: Pending
+
+seems to be a known issue
+https://github.com/pyca/cryptography/issues/2750
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Index: src/_cffi_src/openssl/bio.py
+===================================================================
+--- a/src/_cffi_src/openssl/bio.py
++++ b/src/_cffi_src/openssl/bio.py
+@@ -99,7 +99,7 @@ BIO *BIO_pop(BIO *);
+ BIO *BIO_next(BIO *);
+ BIO *BIO_find_type(BIO *, int);
+ BIO_METHOD *BIO_s_mem(void);
+-BIO *BIO_new_mem_buf(void *, int);
++BIO *BIO_new_mem_buf(const void *, int);
+ BIO_METHOD *BIO_s_file(void);
+ BIO *BIO_new_file(const char *, const char *);
+ BIO *BIO_new_fp(FILE *, int);
diff --git a/meta-python/recipes-devtools/python/python-cryptography_1.1.bb b/meta-python/recipes-devtools/python/python-cryptography_1.1.bb
index ffc8fd9..c501787 100644
--- a/meta-python/recipes-devtools/python/python-cryptography_1.1.bb
+++ b/meta-python/recipes-devtools/python/python-cryptography_1.1.bb
@@ -4,7 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
 DEPENDS += " python-cffi-native python-cffi python-enum34 python-six python-pyasn1"
 SRCNAME = "cryptography"
 
-SRC_URI = "file://run-ptest"
+SRC_URI = "file://run-ptest \
+           file://build_fix_openssl_1.0.1g.patch"
 
 SRC_URI[md5sum] = "dd06da41535184f48f2c8e8b74dd570f"
 SRC_URI[sha256sum] = "059bc6428b1d0e2317f505698602642f1d8dda5b120ec573a59a430d8cb7a32d"
-- 
2.3.5


