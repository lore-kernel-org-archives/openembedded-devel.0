Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 9D3E07F53F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Aug 2019 17:20:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45zxs529rBz3J
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Aug 2019 19:20:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1564680057;
	bh=m93YzM/UhWfB23T2LDD1xF7qw/nRquqgvMZvOO5ggTU=;
	h=From:To:Subject:Date:From;
	b=p+KsWNXyfcg/kJYeE1bx8acqPjBGfSfLzpSfihepBwYGmSZdLzmIJG6Nf+KP4je9T
	g3pNo60DMR/yed1vqrgAqPgG/uDPQr0BPh23RC5XJaTnVNaHoe5idTZTsSZiqdlMxF
	Dq6vNBzMA0FHuQfo0rLT/IboLlk/6IeyHAgYIO5PIZY6Iuzblcn27RYL30K2smJJXD
	H3Ozto96ugNQZ2eZCFdj5c4fV4uI4fgUzIy/EVaJ656Hs44S+zBlhmOW7jc6mRwdKd
	4eLiQqsY1inVk7r5lGs6IVuxWZNIS9NYqeeHQAMNsRPm60/zWdl0+FYcrQrOW7QsZ+
	3+A5jDgVrmitIgwnq5s0IcM4Ga2dx/Wepm3JteEQwfCNaFMBSiGNIAazKhWszSGRxE
	Ei5ajXAK+ixCafXDU9eDqJVzx0DF+1ZQAMNkO9spd9x7B5FltpGtcXpssAy+lWTN0A
	uqoXrwuu8IM9oytSP+qrddfLn5hjmJEPNPYO7S70LihfarEQwrM71m28h352RTHnP5
	j5eCKBi8PkQJa37c7X1fUHijEtq1H7acN06ewiOxEfy/IOq+7Y/i9HLsE40fCTK2Ur
	18w37QIDKUt2OHHCRYlaFW2QVHiny7wgoCrJq/8JdnGyEmXMSlxK+43ZAMtFCz1fE1
	SM4Fgnkq6zRwawUw208wP+KI=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Aug 2019 20:20:56 +0300
Message-Id: <20190801172056.32722-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] meta-oe: Use GNU_MIRROR in more recipes
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
X-List-Received-Date: Thu, 01 Aug 2019 17:20:57 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-devtools/octave/octave_4.4.1.bb               | 2 +-
 meta-oe/recipes-kernel/crash/crash_7.2.6.bb                   | 2 +-
 meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.59.bb | 2 +-
 meta-oe/recipes-support/zile/zile_2.4.14.bb                   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/octave/octave_4.4.1.bb b/meta-oe/recipes-devtools/octave/octave_4.4.1.bb
index 1ec32ce89..71d24504f 100644
--- a/meta-oe/recipes-devtools/octave/octave_4.4.1.bb
+++ b/meta-oe/recipes-devtools/octave/octave_4.4.1.bb
@@ -11,7 +11,7 @@ inherit autotools pkgconfig texinfo gettext
 
 EXTRA_OECONF = "--disable-java --disable-docs"
 
-SRC_URI = "https://ftp.gnu.org/gnu/octave/${PN}-${PV}.tar.gz \
+SRC_URI = "${GNU_MIRROR}/octave/${PN}-${PV}.tar.gz \
            file://fix-blas-library-integer-size.patch \
 "
 
diff --git a/meta-oe/recipes-kernel/crash/crash_7.2.6.bb b/meta-oe/recipes-kernel/crash/crash_7.2.6.bb
index a8bfe27da..0a7c384a7 100644
--- a/meta-oe/recipes-kernel/crash/crash_7.2.6.bb
+++ b/meta-oe/recipes-kernel/crash/crash_7.2.6.bb
@@ -14,7 +14,7 @@ DEPENDS = "zlib readline coreutils-native"
 
 S = "${WORKDIR}/git"
 SRC_URI = "git://github.com/crash-utility/${BPN}.git \
-           http://ftp.gnu.org/gnu/gdb/gdb-7.6.tar.gz;name=gdb;subdir=git \
+           ${GNU_MIRROR}/gdb/gdb-7.6.tar.gz;name=gdb;subdir=git \
            file://7001force_define_architecture.patch \
            file://7003cross_ranlib.patch \
            file://0001-cross_add_configure_option.patch \
diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.59.bb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.59.bb
index b44c66af7..7e50edf7b 100644
--- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.59.bb
+++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.59.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9331186f4f80db7da0e724bdd6554ee5"
 SECTION = "net"
 DEPENDS = "file"
 
-SRC_URI = "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz"
 SRC_URI[md5sum] = "8ab5123535549195aff19e91b4e49f48"
 SRC_URI[sha256sum] = "9b9ccd7d0b11b0e179f1f58dc2caa3e0c62c8609e1e1dc7dcaadf941b67d923c"
 
diff --git a/meta-oe/recipes-support/zile/zile_2.4.14.bb b/meta-oe/recipes-support/zile/zile_2.4.14.bb
index 515cf4136..3b846c151 100644
--- a/meta-oe/recipes-support/zile/zile_2.4.14.bb
+++ b/meta-oe/recipes-support/zile/zile_2.4.14.bb
@@ -5,7 +5,7 @@ DEPENDS = "ncurses bdwgc"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
-SRC_URI = "http://ftp.gnu.org/gnu/zile/${BP}.tar.gz \
+SRC_URI = "${GNU_MIRROR}/zile/${BP}.tar.gz \
            file://remove-help2man.patch \
 "
 
-- 
2.17.1


