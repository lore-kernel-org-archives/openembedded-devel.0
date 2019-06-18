Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id EF4B87E95A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 16:53:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45SvKL1DXDz4h
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 18:53:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1560876790;
	bh=OTh50oLNn52KCL6bAk8FVHwhrBz9E2tMWOePG917TL0=;
	h=From:To:Subject:Date:From;
	b=ijSvbCtHVZYN4TZnGvUn82bKUelngil8N216tBzUD/w9y/tGmiVa4qiCsdb8q6Jvs
	SEnvnqBTacXHMrqdU9Qx+QO71hq3qMj1MyDFzf2Jh/FDaZ9L39U/8Nvtz5wLCEZ9Ma
	esIqFHNDeK3lnUlh9Jffh/VTd9iHsKz8vj/5F/Bmjz+6H9hwveC7mjnlaoo/L8hs/C
	W6ZvgGDMDKzfikmDPkumo3qiMFTC+LIfl3gxcwSWLT09x3LbtS/xRBxEB4caswu9kq
	df0OVL+efrtf6b7OdV7OypNp139myN+qvGmlZjDzYAr4MQDoxFWFwQ7Rn4sUUGjJzy
	/1GRuihfjtt+9ueDa3JH18ZoNISVmcNikxgtJn7+dKlBBbvYY0wpjPa37Q+gCtWR0S
	Ue3wJngGv+f72PQveBbiE5Bvyp2XVqcWclt1Lzah9CdP4g3aK8LgcL+kLaj2GWSwVX
	meoVorUA9aqceXctd1ciNkesilihKKkQSps02je/G47fV060mpPx6Hd5AFOGRdXc74
	SYbZGsmIU9ILxnrppPGEEEBWWkPuEWRP2LHJieIHFzn613Nf/w8bMit2l+cvZbPefu
	ciSsoqQ6aLoEOUQ7G0YPxxiScXXqiv4aLuWISKOIIJPb1oJTQUwlQsxfgvaLLwj8JR
	BoyKfOJq5MBplShlg4q+bExA=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Jun 2019 19:53:10 +0300
Message-Id: <20190618165311.31663-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] ndctl: Remove the unnecessary dependency on virtual/kernel
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
X-List-Received-Date: Tue, 18 Jun 2019 16:53:10 -0000

This also makes it no longer specific to MACHINE_ARCH.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/conf/layer.conf                 | 6 ------
 meta-oe/recipes-core/ndctl/ndctl_v63.bb | 5 +----
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 507ac50ec..31f2f17fc 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -51,12 +51,6 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   phoronix-test-suite->php \
 "
 
-# Depends on ndctl (through nvdimm PACKAGECONFIG) which depends on MACHINE_ARCH kernel
-# and making libblockdev MACHINE_ARCH is not an option as python3-blivet, udisks2, gvfs
-# would be MACHINE_ARCH as well
-SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
-  libblockdev->ndctl \
-"
 # ttf.inc inherits fontcache which adds fontconfig-utils to RDEPENDS
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   terminus-font->fontconfig \
diff --git a/meta-oe/recipes-core/ndctl/ndctl_v63.bb b/meta-oe/recipes-core/ndctl/ndctl_v63.bb
index 61e53029b..2f299b1ba 100644
--- a/meta-oe/recipes-core/ndctl/ndctl_v63.bb
+++ b/meta-oe/recipes-core/ndctl/ndctl_v63.bb
@@ -13,15 +13,12 @@ inherit autotools-brokensep pkgconfig bash-completion systemd
 SRCREV = "cb2d678dd6d286dd96d31548c32449a8b883ae32"
 SRC_URI = "git://github.com/pmem/ndctl.git"
 
-DEPENDS = "virtual/kernel kmod udev json-c"
+DEPENDS = "kmod udev json-c"
 
 S = "${WORKDIR}/git"
 
 EXTRA_OECONF += "--enable-test --enable-destructive --disable-docs"
 
-# Depends on MACHINE_ARCH kernel
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
 PACKAGECONFIG[systemd] = "--with-systemd, --without-systemd, systemd"
 
-- 
2.17.1


