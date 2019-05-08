Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 105AA7DE92
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 May 2019 19:58:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44znNY5565z4q
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 May 2019 21:58:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557345534;
	bh=G4X7cEqjyOc5CgKe5z4pgDeTFQZ5EtD7RHQlvG+cTTE=;
	h=From:To:Subject:Date:From;
	b=kE/BYYPXlGdyShVNzzf3Uu5mctP16Y4ShkLRNGR3PA0ppqwdEix+ZTDFvgtK2yn7T
	rDrq53g++eQl2I1wrG8a4C3HduWaBD/tqkVU/aPBMvsgKRMgsbNXwdlAfgF4Guvy6e
	mEq/FDuS92Nm89PaK7lxUp93nNtq4kegDFylAe3hCQoGwKbnMf5ILRFHMnrD9tAJIv
	mp9sDRJf1xnnhxmT7Tt2cFayUYooF8gskobQ/zbCF2WocVm1jTTywtizG/ttn9B+oU
	NjjYPodJmYkZJEAlTz5yClIedVt74aDTomNnkwdqipyQRU+j8NME/miHWlJ4xNqBXu
	6CB20ujXxRBtQ3F5KnBfG+eEYGDcrhRYny9iym90fFOTB8wnK18PXPSLOaQRzWV+6Q
	6SmwnakkIHotP9UU61Tp6CXq3znMSPCFekbzK4+9kSNfCb4blK6LrdLI1TzC99s+rt
	FEsEGPR2e7fLW5tKW+Fr4t1Q5z+sAEiDY29HuotzXYZm1wkZbwr9h8s/TVAK8g6Ynz
	qAzd+PZKlqmnPJXSEyJAurqG87l5yEduf5Zz4rYF0jMrKFliiQVcD+C19GqkiptAkx
	EIMsJDLHIMs8wxAzZVg5xBcyciFQy2Ei2n3PPF1sYDze56zSO04v2H+85XZn68VrgQ
	RUIusIdigJC3MuruTY/aUKaE=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 May 2019 22:58:46 +0300
Message-Id: <20190508195852.28803-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-multimedia][PATCH] caps: Upgrade 0.9.24 -> 0.9.26
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
X-List-Received-Date: Wed, 08 May 2019 19:58:54 -0000

Remove patches applied upstream.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...-Do-not-use-obsolete-pow10f-function.patch | 50 -------------------
 .../Avoid-ambiguity-in-div-invocation.patch   | 32 ------------
 .../caps/{caps_0.9.24.bb => caps_0.9.26.bb}   |  6 +--
 3 files changed, 2 insertions(+), 86 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/caps/caps/0001-Do-not-use-obsolete-pow10f-function.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/caps/caps/Avoid-ambiguity-in-div-invocation.patch
 rename meta-multimedia/recipes-multimedia/caps/{caps_0.9.24.bb => caps_0.9.26.bb} (70%)

diff --git a/meta-multimedia/recipes-multimedia/caps/caps/0001-Do-not-use-obsolete-pow10f-function.patch b/meta-multimedia/recipes-multimedia/caps/caps/0001-Do-not-use-obsolete-pow10f-function.patch
deleted file mode 100644
index bd5e1b603..000000000
--- a/meta-multimedia/recipes-multimedia/caps/caps/0001-Do-not-use-obsolete-pow10f-function.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 0cc7362e171616dcfeb93c6e1576362761bf14e5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 31 Jan 2018 18:37:16 -0800
-Subject: [PATCH] Do not use obsolete pow10f() function
-
-exp10 name is standardized in TS 18661-4 and its
-available in glibc since version 2.1
-it has been now removed from glibc 2.27+
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- dsp/v4f_IIR2.h | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/dsp/v4f_IIR2.h b/dsp/v4f_IIR2.h
-index a68ecf5..ebd1234 100644
---- a/dsp/v4f_IIR2.h
-+++ b/dsp/v4f_IIR2.h
-@@ -33,7 +33,7 @@
- namespace DSP {
- 
- #ifdef __APPLE__
--inline float pow10f(float f) {return pow(10,f);}
-+inline float exp10f(float f) {return __exp10f(f);}
- #endif
- 
- class RBJv4
-@@ -142,7 +142,7 @@ class IIR2v4
- 				/* A = pow (10, gain / 40) */
- 				v4f_t A = (v4f_t) {.025,.025,.025,.025};
- 				A *= gain;
--				A = v4f_map<pow10f> (A);
-+				A = v4f_map<exp10f> (A);
- 
- 				RBJv4 p (f, Q);
- 
-@@ -429,7 +429,7 @@ class IIR2v4Bank
- 					/* A = pow (10, gain / 40) */
- 					v4f_t A = (v4f_t) {.025,.025,.025,.025};
- 					A *= gain[i];
--					A = v4f_map<pow10f> (A);
-+					A = v4f_map<exp10f> (A);
- 
- 					RBJv4 p (f[i], Q[i]);
- 
--- 
-2.16.1
-
diff --git a/meta-multimedia/recipes-multimedia/caps/caps/Avoid-ambiguity-in-div-invocation.patch b/meta-multimedia/recipes-multimedia/caps/caps/Avoid-ambiguity-in-div-invocation.patch
deleted file mode 100644
index 1a050af91..000000000
--- a/meta-multimedia/recipes-multimedia/caps/caps/Avoid-ambiguity-in-div-invocation.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 1ea09653692efdd6443fb6770e8523bf6c9e49b9 Mon Sep 17 00:00:00 2001
-From: Fabio Berton <fabio.berton@ossystems.com.br>
-Date: Thu, 6 Oct 2016 11:54:07 -0300
-Subject: Avoid ambiguity in div invocation
-Organization: O.S. Systems Software LTDA.
-
-Patch from:
-https://anonscm.debian.org/cgit/pkg-multimedia/caps.git/commit/?id=9a99c225fb813ae69f146e3d90f7b47bdbd97708
-
-Upstream-Status: Pending
-
-Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
----
- AutoFilter.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/AutoFilter.cc b/AutoFilter.cc
-index fc087d0..bd6b12f 100644
---- a/AutoFilter.cc
-+++ b/AutoFilter.cc
-@@ -69,7 +69,7 @@ AutoFilter::activate()
- void
- AutoFilter::cycle (uint frames)
- {
--	div_t qr = div (frames, blocksize);
-+	div_t qr = div ((int)frames, (int)blocksize);
- 	int blocks = qr.quot;
- 	if (qr.rem) ++blocks;
- 	double over_blocks = 1./blocks;
--- 
-2.1.4
-
diff --git a/meta-multimedia/recipes-multimedia/caps/caps_0.9.24.bb b/meta-multimedia/recipes-multimedia/caps/caps_0.9.26.bb
similarity index 70%
rename from meta-multimedia/recipes-multimedia/caps/caps_0.9.24.bb
rename to meta-multimedia/recipes-multimedia/caps/caps_0.9.26.bb
index 0404bd515..46bcf6c6a 100644
--- a/meta-multimedia/recipes-multimedia/caps/caps_0.9.24.bb
+++ b/meta-multimedia/recipes-multimedia/caps/caps_0.9.26.bb
@@ -4,14 +4,12 @@ LICENSE = "GPL-3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "http://quitte.de/dsp/${BPN}_${PV}.tar.bz2 \
-           file://Avoid-ambiguity-in-div-invocation.patch \
            file://0001-basic.h-Use-c99-supported-stdint-types.patch \
            file://append_ldflags.patch \
-           file://0001-Do-not-use-obsolete-pow10f-function.patch \
            "
 
-SRC_URI[md5sum] = "c1d634038dcb54702306c0e30cb1c626"
-SRC_URI[sha256sum] = "f746feba57af316b159f0169de5d78b4fd1064c2c0c8017cb5856b2f22e83f20"
+SRC_URI[md5sum] = "36b30c7c7db2d2bc5f4f54077e97b5ee"
+SRC_URI[sha256sum] = "e7496c5bce05abebe3dcb635926153bbb58a9337a6e423f048d3b61d8a4f98c9"
 
 EXTRA_OEMAKE = " \
     CC='${CXX}' \
-- 
2.17.1


