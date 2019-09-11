Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id 810047EB41
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2019 20:50:56 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id w22so14452844pfi.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2019 13:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=co+Lpyv1rovLKJFe4+93yAmt8kyDfNR/GyXSVvOB0HQ=;
	b=YY3H5VFsJLgxWyKGAu3STBoQStmo3osQ4QjMjJfywaAZvwHi8Es1Nu0SZa+8NlnLfR
	6oy5tvytiie++JmUPh6CQOOAWY+KRrPXsC/fnwJxLHYgaRV/fiCWm5f5tI9y/aDKdx1N
	+aT6rDoCn/PLcqXZ1MSs2AosCTFJ5oM0utv36AwQKGmaVRoJAgfBzFZJON73M8IYBBSV
	Djiu//g5XCNu5Jm0RBhFMgOwNdUWipKaa5i2O9ZNCi7f+68XZq+OTUp4WzHfBCKco+2V
	/OuvWqFFhNx9AT2GG0goSxPYpYUc+1OgxqmRfE8IqUZux+Vx/1V7nfNloa3muBCN9I09
	jjuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=co+Lpyv1rovLKJFe4+93yAmt8kyDfNR/GyXSVvOB0HQ=;
	b=kLjTp68uh8w6prF+jaXzrrXhXgObBBVEAaSDZfAA2T8KDnfBQY7Zc2VcCGDOKP1c5l
	IOP5fTL8KUcPyR4jHWncBZLFJNDaSfr+qde9dgERQoNLnbCvPfOGuCyC1+cjl7LIvStb
	2GXyY2QCB1OeDt3FbQjsJ1hebB48beSWB9PFMFVlVj/L6wtd3Rw//SioQeicVlf9S4jR
	z257WNV+OOUg4uNg81CM3KQ9DeZq4I0FEUCKh/YYwYF84DT6dFKKb614cTpV11VU34Nr
	qUVmv+Mq99W+9qsz/E/CngKRWm3JPjIEOvZwb5rek+wih3BO+zvB9aBkHDMOE+Z+siPW
	pi8A==
X-Gm-Message-State: APjAAAU4sihM2l+UOplTN/r3jOw/HNVcXQtHO0e0EJb87ecCSeSQmb+T
	BE2b9hjENuJeqaN2lOcpv5iCMb1KK0k=
X-Google-Smtp-Source: APXvYqyNTq/YfdfbR/7cNO2h9ezuyYKq19nqizHnQEkidybsaz6Mv5WpZDMse64CrzwJXLC/ALjWjQ==
X-Received: by 2002:a17:90a:1996:: with SMTP id
	22mr7940433pji.17.1568235056578; 
	Wed, 11 Sep 2019 13:50:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	j2sm22832839pfe.130.2019.09.11.13.50.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Sep 2019 13:50:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Sep 2019 13:50:46 -0700
Message-Id: <20190911205046.1426775-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] safec: Upgrade to 3.5 release
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
X-List-Received-Date: Wed, 11 Sep 2019 20:50:56 -0000
Content-Transfer-Encoding: 8bit

Add a patch to fix build on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...r-Use-_ISOC11_SOURCE-only-with-glibc.patch | 30 +++++++++++++++++++
 .../safec/{safec_3.4.bb => safec_3.5.bb}      |  6 ++--
 2 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-core/safec/safec/0001-memrchr-Use-_ISOC11_SOURCE-only-with-glibc.patch
 rename meta-oe/recipes-core/safec/{safec_3.4.bb => safec_3.5.bb} (64%)

diff --git a/meta-oe/recipes-core/safec/safec/0001-memrchr-Use-_ISOC11_SOURCE-only-with-glibc.patch b/meta-oe/recipes-core/safec/safec/0001-memrchr-Use-_ISOC11_SOURCE-only-with-glibc.patch
new file mode 100644
index 0000000000..8f18f48720
--- /dev/null
+++ b/meta-oe/recipes-core/safec/safec/0001-memrchr-Use-_ISOC11_SOURCE-only-with-glibc.patch
@@ -0,0 +1,30 @@
+From 57456b5d034c8965b11eceed1bf861c98a18c324 Mon Sep 17 00:00:00 2001
+From: "jenkins@kwaj" <jenkins@kwaj>
+Date: Wed, 11 Sep 2019 13:43:45 -0700
+Subject: [PATCH] memrchr: Use _ISOC11_SOURCE only with glibc
+
+this is a glibc feature test macro which is not available
+on other libraries e.g. musl
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/extmem/memrchr_s.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/extmem/memrchr_s.c b/src/extmem/memrchr_s.c
+index 8d10a7b9..e73d3579 100644
+--- a/src/extmem/memrchr_s.c
++++ b/src/extmem/memrchr_s.c
+@@ -36,7 +36,7 @@
+ #endif
+ 
+ #ifdef HAVE_MEMRCHR
+-#ifndef _ISOC11_SOURCE
++#if defined (__GLIBC__) && !defined(_ISOC11_SOURCE)
+ extern void *memrchr(const void *, int, size_t);
+ #endif
+ #endif
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-core/safec/safec_3.4.bb b/meta-oe/recipes-core/safec/safec_3.5.bb
similarity index 64%
rename from meta-oe/recipes-core/safec/safec_3.4.bb
rename to meta-oe/recipes-core/safec/safec_3.5.bb
index cc1fbcb735..c9ace3b0b8 100644
--- a/meta-oe/recipes-core/safec/safec_3.4.bb
+++ b/meta-oe/recipes-core/safec/safec_3.5.bb
@@ -7,8 +7,10 @@ SECTION = "lib"
 inherit autotools pkgconfig
 
 S = "${WORKDIR}/git"
-SRCREV = "62e6b2df55084316d027165d286e46beb40513dc"
-SRC_URI = "git://github.com/rurban/safeclib.git"
+SRCREV = "a99a052a56da409638c9fe7e096a5ae6661ca7cb"
+SRC_URI = "git://github.com/rurban/safeclib.git \
+           file://0001-memrchr-Use-_ISOC11_SOURCE-only-with-glibc.patch \
+"
 
 CPPFLAGS_append_libc-musl = " -D_GNU_SOURCE"
 
-- 
2.23.0


