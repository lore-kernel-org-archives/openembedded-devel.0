Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0150B7E6D1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2019 17:50:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45TXXk5TDCz4s
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2019 19:50:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1560966615;
	bh=BvA64oPlTcVDli07VY7+7b/II/BcwMGfZvVjoeXb6fw=;
	h=From:To:Subject:Date:From;
	b=NLOnutiJ0ZYO55bJIc3eZgNVU9TwxG+u+BWkkcJ04YGIxUBGslaNH28H4Q/EUOx2H
	BOV2kt3LGppDP8cmpZoBk9dOCC/OkJVledMW+yLrBlL+3PXh7csq0wn8xxYUiwA35G
	/Op+NRgLhXu+RKQUJPCB+y8fs7NlN84gRxqm43YakgvnF1UZQCsu5UvZPXqOQozzjc
	C5AikAgO9eo4/4PV1sD9PkU7lNqZfEYZah6SwHfQ0Gq/6bZI60huDCjsKDRZgcWqx6
	oVfHnQQUEi2fbl9F4Z8ZmB/LY7nrXzvZQy248TTOj29I+pnQOSPdXuXAkk1zjMvi+g
	Zx8LHcb3nAWmmN4VoHu0vLail1eHw0TruaAD5aev+cwvsPzb+nsPJ3Lqe9xI3GBoYS
	LiuuFu0KZtgIFshnIr2o8J6dHA23IGm93K98p/KZKt89tZhg1vmYsajlektjHFmjT0
	OX6xsbBopRMNszfmjagHglczBqBceWXA8eAnYUCcRkLf1C8KixcwpIje4HQn7cR4Sj
	vNv8m/iYDWQc2kJyENr5oMGx01e27+ltlOu9nAIxoavXSbgf6ww2sv0QFqwZVkxMaO
	GraujNb1i19ZtWEwZeLbU4isvbHLv2rv3yv5qiudHS7al4o9l35SC+mT7lXnRM4g7I
	QnzrcVfM2Z0aDw6/h/2IwhSI=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jun 2019 20:50:11 +0300
Message-Id: <20190619175012.10984-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] efibootmgr: Remove, was moved to oe-core
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
X-List-Received-Date: Wed, 19 Jun 2019 17:50:15 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../recipes-bsp/efibootmgr/efibootmgr_17.bb   | 28 -----------------
 .../files/0001-remove-extra-decl.patch        | 31 -------------------
 2 files changed, 59 deletions(-)
 delete mode 100644 meta-oe/recipes-bsp/efibootmgr/efibootmgr_17.bb
 delete mode 100644 meta-oe/recipes-bsp/efibootmgr/files/0001-remove-extra-decl.patch

diff --git a/meta-oe/recipes-bsp/efibootmgr/efibootmgr_17.bb b/meta-oe/recipes-bsp/efibootmgr/efibootmgr_17.bb
deleted file mode 100644
index 4edb2e664..000000000
--- a/meta-oe/recipes-bsp/efibootmgr/efibootmgr_17.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-DESCRIPTION = "Linux user-space application to modify the EFI Boot Manager."
-SUMMARY = "EFI Boot Manager"
-HOMEPAGE = "https://github.com/rhinstaller/efibootmgr"
-SECTION = "base"
-
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
-
-DEPENDS = "pciutils zlib efivar"
-
-COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
-
-SRCREV = "e067160ecef8208e1944002e5d50b275733211fb"
-SRC_URI = "git://github.com/rhinstaller/efibootmgr.git;protocol=https \
-           file://0001-remove-extra-decl.patch \
-          "
-S = "${WORKDIR}/git"
-
-inherit pkgconfig
-
-EXTRA_OEMAKE = "'EFIDIR=/' 'CC=${CC}' 'CFLAGS=${CFLAGS} -I${S}/src/include `pkg-config --cflags efivar`'"
-
-CFLAGS_append_toolchain-clang = " -Wno-error"
-do_install () {
-    install -D -p -m0755 ${B}/src/efibootmgr ${D}/${sbindir}/efibootmgr
-}
-
-CLEANBROKEN = "1"
diff --git a/meta-oe/recipes-bsp/efibootmgr/files/0001-remove-extra-decl.patch b/meta-oe/recipes-bsp/efibootmgr/files/0001-remove-extra-decl.patch
deleted file mode 100644
index 42f3a8182..000000000
--- a/meta-oe/recipes-bsp/efibootmgr/files/0001-remove-extra-decl.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 99b578501643377e0b1994b2a068b790d189d5ad Mon Sep 17 00:00:00 2001
-From: Peter Jones <pjones@redhat.com>
-Date: Wed, 13 Jun 2018 09:41:01 -0400
-Subject: [PATCH] remove extra decl
-
-Signed-off-by: Peter Jones <pjones@redhat.com>
-
-Upstream-Status: Backport [git://github.com/rhinstaller/efibootmgr.git]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
----
- src/efibootmgr.c | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/src/efibootmgr.c b/src/efibootmgr.c
-index de38f01..4e1a680 100644
---- a/src/efibootmgr.c
-+++ b/src/efibootmgr.c
-@@ -1536,9 +1536,6 @@ parse_opts(int argc, char **argv)
- 					       "invalid numeric value %s\n",
- 					       optarg);
- 			}
--                        /* XXX efivar-36 accidentally doesn't have a public
--                         * header for this */
--			extern int efi_set_verbose(int verbosity, FILE *errlog);
- 			efi_set_verbose(opts.verbose - 2, stderr);
- 			break;
- 		case 'V':
--- 
-2.7.4
-
-- 
2.17.1


