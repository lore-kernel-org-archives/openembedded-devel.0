Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 64A9077196
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2016 14:08:37 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id gp3so18222684pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2016 07:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=7Vy2Jqq02wR4LNu6NGhFH0RPMGLb4uz/gPc47YRWmNE=;
	b=mQ9d1PeuCUUxrSr26QPE1CypHaV0G4pq/Hf9AVdvzUyZYNi9tPyXhPKxzMzSop5kyR
	YiY8uMG3fDjGvqP0RecOEgo3un4yXTvYiFIeGbJCL/jdyqsaSN6ngtzb0o5xohR2b4q2
	k4I/Vu8aXJEhnSW02axTRKsfVXtg3Z9pX1Z6+sg8V6I3+PDnzbeqeNjpPfWs1h0DQ5WE
	bYZpRQYan6A1B+dx2IQ4Ac1u7k1wRsjjNRrcbwQaScwXy7zTKILayZJIBbVDGJITmEIS
	UfJlYozEd3/iNOaLZl9rA5W0mFy8mpYxlRl2DRbUBrT1cp+7v4B6m92ViffmNGxdmNPx
	HyEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7Vy2Jqq02wR4LNu6NGhFH0RPMGLb4uz/gPc47YRWmNE=;
	b=HKfuGdg1PHvFNYalu54hIccJ0votvDFRtv8D7pJwZSa4cbVYD1YFLiJOupC/dK/TPG
	F3VIql1CJl4Tc0VRfJgvPNPQJ9HLDX6paB+Hrq+MIXVCV7OHmx4VAzH9bPgSjW6GXy/B
	2MNMBpIO6nxYXGfysoci/lXu/D7eW1+9x/mYKyGEjCHpTkJyiXX0P2kIY3doreDWK1EQ
	Or/jty3FOPoM1G8JR9UQBQVjw5SRqJdBtL1NGpvLEfoDGjwYHTLqC3kQA7GuYznGsv0m
	vAWBDFUAJtnKq+9R6dsOQTiwzvlO6B51aWajYcvOlN38GL3u+C6MtrQ8v6fLgfWcoRZP
	pHjA==
X-Gm-Message-State: ALyK8tJMn9HVVrp//RFQsjKBSnv/IL7x+Ks/9+tyBYM2mlfHTwQhjZb0fGkK5/byLFWoQQ==
X-Received: by 10.66.255.7 with SMTP id am7mr24688429pad.75.1464703718465;
	Tue, 31 May 2016 07:08:38 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	ap3sm17071677pad.33.2016.05.31.07.08.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 May 2016 07:08:36 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 May 2016 07:08:25 -0700
Message-Id: <1464703706-28401-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-python][jethro][PATCH 1/2] python-crytograph: fix build issue do to openssl 1.0.1g upgrade
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
X-List-Received-Date: Tue, 31 May 2016 14:08:38 -0000

From: Armin Kuster <akuster@mvista.com>

this fixes

build/temp.linux-x86_64-2.7/_openssl.c:697:6: error: conflicting types for 'BIO_new_mem_buf'
BIO *BIO_new_mem_buf(void *, int);
       ^
In file included from /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/include/openssl/asn1.h:65:0,
from build/temp.linux-x86_64-2.7/_openssl.c:413:

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../build_fix_openssl_1.0.1g.patch                 | 28 ++++++++++++++++++++++
 .../python/python-cryptography_0.8.1.bb            |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-cryptography/build_fix_openssl_1.0.1g.patch

diff --git a/meta-python/recipes-devtools/python/python-cryptography/build_fix_openssl_1.0.1g.patch b/meta-python/recipes-devtools/python/python-cryptography/build_fix_openssl_1.0.1g.patch
new file mode 100644
index 0000000..cbdc8ce
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
+Index: cryptography-0.8.1/src/cryptography/hazmat/bindings/openssl/bio.py
+===================================================================
+--- cryptography-0.8.1.orig/src/cryptography/hazmat/bindings/openssl/bio.py
++++ cryptography-0.8.1/src/cryptography/hazmat/bindings/openssl/bio.py
+@@ -99,7 +99,7 @@ BIO *BIO_pop(BIO *);
+ BIO *BIO_next(BIO *);
+ BIO *BIO_find_type(BIO *, int);
+ BIO_METHOD *BIO_s_mem(void);
+-BIO *BIO_new_mem_buf(void *, int);
++BIO *BIO_new_mem_buf(const void *, int);
+ BIO_METHOD *BIO_s_file(void);
+ BIO *BIO_new_file(const char *, const char *);
+ BIO *BIO_new_fp(FILE *, int);
diff --git a/meta-python/recipes-devtools/python/python-cryptography_0.8.1.bb b/meta-python/recipes-devtools/python/python-cryptography_0.8.1.bb
index 41e4acd..cd10118 100644
--- a/meta-python/recipes-devtools/python/python-cryptography_0.8.1.bb
+++ b/meta-python/recipes-devtools/python/python-cryptography_0.8.1.bb
@@ -7,6 +7,7 @@ SRCNAME = "cryptography"
 
 SRC_URI = "https://pypi.python.org/packages/source/c/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
            file://run-ptest \
+           file://build_fix_openssl_1.0.1g.patch \
 "
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.3.5


