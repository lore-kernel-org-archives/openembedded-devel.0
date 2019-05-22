Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id F27357D691
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 12:11:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 458BLF3l7xz60
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 14:11:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558527061;
	bh=c54gKwUNj28KB/Uz9mvY+gDfjQG4QeSIUErmWKKmsaM=;
	h=From:To:Subject:Date:From;
	b=UhSpSnxSCLxC7fjUEkFOYdM11XUtZPO4v3LyIIlSnks2TJdswoh1h45FUj5nq8+ax
	m4LceDcaKuRgfQvaZipygALukIysCGXAKdWTHRLkKpzzeWgmT6d3j6xgZiyAmpK2dU
	TfDu91CLPeA21Qw4uz/Q+eZ4Fb6JnqdNkqZu/oA+MXWSNfVeJMswHqvUGzRd1/adZV
	sjYyr8+mz4AV2wi8XzgSmxYYeT4ARidsUg6aIPupDOA/dp9bu10J3yQCEcRUgRTa0P
	T51au3/uCFMwN0WIOEabo0JmdH2dlYkK5HuFSz9yN5FTQUazxWALzqqWRzyMYg+ZVJ
	fP5l6qMV9fAvOIPdG6w9FjoPGumpzK5R4nFIP26XHU8MIuclrr84LPsO9XMsccXqe3
	E16/woFEYrAL4exWo9gU9QVlOfjdcSXfA0a1O5G8BmqSXtASDMV4RNEgHgoiPehVNe
	5z6NMsnNTpbJwH55RHJ6NxmJr8S7VUsytJbTpDc3lEJQJyR+RUXzxtg2qwPSPKBV/K
	7wNk0ezwB4Gi9i1NrxTFWI8ZFB/lKi/53VtJXpK9amADZh6AsRlBSdwkTx9wMKPLRr
	og7xqnIB6qrthP0cjEp7AribAnR4nF/w57XES6JLReSXjk3FleiRMtpFDUFzqrrB4M
	mBTEx9A7ghRWaUKKJ+06ZQEQ=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 May 2019 15:11:00 +0300
Message-Id: <20190522121100.8858-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-multimedia][PATCH] dvb-apps: Remove workaround patch for ancient target compilers
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
X-List-Received-Date: Wed, 22 May 2019 12:11:01 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../dvb-apps/dvb-apps_1.1.1.bb                |  1 -
 .../0002-Fix-compiler-warning-flags.patch     | 44 -------------------
 2 files changed, 45 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/dvb-apps/files/0002-Fix-compiler-warning-flags.patch

diff --git a/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.bb b/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.bb
index 2aa7ccebf..3f491181d 100644
--- a/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.bb
+++ b/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.bb
@@ -7,7 +7,6 @@ SRCREV = "3d43b280298c39a67d1d889e01e173f52c12da35"
 SRC_URI = "hg://linuxtv.org/hg;module=dvb-apps;protocol=http \
           file://dvb-scan-table \
           file://0001-Fix-generate-keynames.patch \
-          file://0002-Fix-compiler-warning-flags.patch \
           file://0003-handle-static-shared-only-build.patch \
           file://0004-Makefile-remove-test.patch \
           file://0005-libucsi-optimization-removal.patch \
diff --git a/meta-multimedia/recipes-multimedia/dvb-apps/files/0002-Fix-compiler-warning-flags.patch b/meta-multimedia/recipes-multimedia/dvb-apps/files/0002-Fix-compiler-warning-flags.patch
deleted file mode 100644
index 9c6276beb..000000000
--- a/meta-multimedia/recipes-multimedia/dvb-apps/files/0002-Fix-compiler-warning-flags.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 9b8f1df41f7579da63c27763ff184d351e4c7fef Mon Sep 17 00:00:00 2001
-From: Simon Dawson <spdawson@gmail.com>
-Date: Sun, 4 Jan 2015 12:06:18 +0100
-Subject: [PATCH] Fix compiler warning flags
-
-  When building for bfin, the build fails as follows.
-
-  cc1: error: unrecognized command line option "-Wno-packed-bitfield-compat"
-
-An example of an autobuild failure arising from this is the following.
-
-  http://autobuild.buildroot.net/results/92e/92e472004812a3616f62d766a9ea07a997a66e89/
-  http://autobuild.buildroot.net/results/6e7/6e7b48ad9768349d983985c3067c4267cde80541/
-
-Clearly, not all toolchains provide a gcc that understands
-the -Wno-packed-bitfield-compat flag; remove usage of this flag.
-
-Wno-packed-bitfield-compat option was added in gcc 4.4.
-
-[Romain:
-  - This patch is also needed for bfin toolchains which use gcc 4.3.5
-  - Add a link to bfin build failure]
-Signed-off-by: Simon Dawson <spdawson@gmail.com>
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- util/scan/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/util/scan/Makefile b/util/scan/Makefile
-index d48c478..88667c5 100644
---- a/util/scan/Makefile
-+++ b/util/scan/Makefile
-@@ -14,7 +14,7 @@ inst_bin = $(binaries)
- 
- removing = atsc_psip_section.c atsc_psip_section.h
- 
--CPPFLAGS += -Wno-packed-bitfield-compat -D__KERNEL_STRICT_NAMES
-+CPPFLAGS += -D__KERNEL_STRICT_NAMES
- 
- .PHONY: all
- 
--- 
-1.9.3
-
-- 
2.17.1


