Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id BFDDD7FA21
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 18:31:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 472gCM0S8VzQt
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 19:31:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572373887;
	bh=rk/HMBDem5mB6WgpbnLiwWoGQWRyXrz+DJaHuQ214Z0=;
	h=From:To:Subject:Date:From;
	b=mDi+nJGvLiZIFnxmMCqDIKQYOJE/kjXuHgKZUuoqxAP7h8XpoGCY0mjx01DSi/ekH
	LS/cVQi+cnpdVWieS09N9R4WeQmyWfpPiNBZsTgf3ZcYV/sqfmca/mO7nv38x/Eeh+
	v1BmsziXeMidV+KLSAVpTVPYqNRlliBfpGp8uwlb6lLMptd86M5fRRRVL1l1sQcyH6
	7mxEmcDN3m/3p3OGvGHO5A3TKG+DIYMOTuX6h4PODCXy2BRK9M0ANzp0O/u2tSCkX5
	n7NKusD58DhjtinX11w+eZspV40DKB4SseN+um48Z/atXBNxPbjObz65i1Lnf97aEG
	t3MPqg5tIhYnKtLZW54zV0UsDD+6usczRPtkhA9z4cREnNV9EnEU6k8JWNwkQ8Kv4E
	sbaH2nye2P0oKlSbSgLvqULIOnASzIKWErgWDVpdHl4zN+6ptXyLqfkYNGcwAXcTf1
	xY8uTTVdPIfRMCgdhTvheuzDlPdCCrV0+tAC66jx4yUeJKomYtLRbSA1b+AaCkvViN
	ZP6ldoiXCzY5AhnvilbtItcrzMF+tgcvlUd73dtjXmInTRgbskFemXMAJpb7tiF+M1
	CLyPC7sfFRxvbXKVh6u674JuqY5/itrIJSV6FT8YxQGVvGmG+KvYN6lJno3dTNvB0j
	pPKUWLwr6aipauddk/CfvqKo=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2019 20:31:20 +0200
Message-Id: <20191029183123.1868-7-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] libdivecomputer: Upgrade to 0.6.0
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
X-List-Received-Date: Tue, 29 Oct 2019 18:31:27 -0000

Use new upstream repository.
Patch for issue fixed upstream removed.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../libdivecomputer/files/fix-ar.patch           | 16 ----------------
 .../libdivecomputer/libdivecomputer_git.bb       |  7 +++----
 2 files changed, 3 insertions(+), 20 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libdivecomputer/files/fix-ar.patch

diff --git a/meta-oe/recipes-extended/libdivecomputer/files/fix-ar.patch b/meta-oe/recipes-extended/libdivecomputer/files/fix-ar.patch
deleted file mode 100644
index f65d26aae..000000000
--- a/meta-oe/recipes-extended/libdivecomputer/files/fix-ar.patch
+++ /dev/null
@@ -1,16 +0,0 @@
----
- configure.ac |    1 +
- 1 file changed, 1 insertion(+)
-
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac
-+++ git/configure.ac
-@@ -56,6 +56,7 @@ AM_CONDITIONAL([ENABLE_EXAMPLES], [test
- # Checks for programs.
- AC_PROG_CC
- AC_PROG_CC_C99
-+AM_PROG_AR
- 
- # Enable automake silent build rules.
- m4_ifdef([AM_SILENT_RULES],[AM_SILENT_RULES([yes])])
diff --git a/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb b/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
index 6c4f4a072..b7c1958ee 100644
--- a/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
+++ b/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
@@ -8,11 +8,10 @@ DEPENDS = "libusb1"
 
 inherit autotools pkgconfig
 
-PV = "0.4.2+gitr${SRCPV}"
+PV = "0.6.0"
 
-SRCREV = "5f765f91430f16932d96b3777404420aa2dd4c7c"
-SRC_URI = "git://git.libdivecomputer.org/libdivecomputer.git \
-           file://fix-ar.patch \
+SRCREV = "1195abc2f4acc7b10175d570ec73549d0938c83e"
+SRC_URI = "git://github.com/libdivecomputer/libdivecomputer.git;protocol=https \
           "
 
 S = "${WORKDIR}/git"
-- 
2.17.1


