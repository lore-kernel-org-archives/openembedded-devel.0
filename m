Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D78F1CA5FAD
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 23:06:14 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1615.1790723170847653899
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 16:06:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=LgONAVr/;
 spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout09.t-online.de (Postfix) with SMTP id A8D3B37BD0
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 01:05:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.97]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xBgsv-0dmrkP0; Wed, 30 Sep 2026 01:05:19 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv2] bmap-writer: honour ImageSize for the last block
Date: Wed, 30 Sep 2026 01:04:51 +0200
Message-ID: <20260929230451.979693-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1790723120-3B7FD86D-FAE2042D/0/0 CLEAN NORMAL
X-TOI-MSGID: 24305e6a-2932-4ca0-838d-197e82ad9ceb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790723121; i=f_l_k@t-online.de;
	bh=pyF3TOchVIv0jSeePtUq67Mna2NbU+vcE3Q1rR4/vcQ=;
	h=From:To:Subject:Date;
	b=LgONAVr/n/vYXOhChEful1n3/IpLBdqNE1WqZ/9RQ8w62rk3pFgxl7qDLHiSfzLS/
	 97BT8IYJNF+7zwoF0cztcso43S3Ew1NH3DGnNgBOVxEXKcPhAlMFdq3M8j44vCmPaP
	 wAXzOkpTrNvHGtSCx91gUFEXWECth8vYDdqKaTBIlnPjMoplEtI3zRl3gC/eun1qgH
	 RdzOBnC/KzrSYlXeWSAJiYK1stQFpfYaa3Tx6DG6JTGd9//TsMlnjobAWd6jvbJu6q
	 VmKC/th0Bs8k6Eeqt0hkLhv0P2J7iUtoBthE5l8qKYAsQaGE6HTSd4dCKVdLOi7luF
	 +zcuUADDaOVCA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 23:06:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130514

Writing an image whose size is not a multiple of the bmap block size
failed at its last block with "Image ended before the block map did",
because every range was taken to end at (endBlock + 1) * BlockSize.
Add a patch that reads ImageSize from the bmap and clamps the ranges to
it.

Tested by writing a wic image whose size ends 2048 bytes into its
last 4 KiB block to an NVMe disk.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../bmap-writer/bmap-writer_1.0.5.bb          |  1 +
 ...-Honour-ImageSize-for-the-last-block.patch | 85 +++++++++++++++++++
 2 files changed, 86 insertions(+)
 create mode 100644 meta-oe/recipes-support/bmap-writer/files/0001-Honour=
-ImageSize-for-the-last-block.patch

diff --git a/meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.5.bb b/m=
eta-oe/recipes-support/bmap-writer/bmap-writer_1.0.5.bb
index 71ea721eed..3aefaa436f 100644
--- a/meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.5.bb
+++ b/meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.5.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De49f4652534a=
f377a713df3d9dec60cb"
=20
 SRC_URI =3D "git://github.com/embetrix/${BPN};branch=3Dmaster;protocol=3D=
https;tag=3D${PV} \
            file://0001-device-Use-the-C-library-s-ioctl-request-type-for=
-BL.patch \
+           file://0001-Honour-ImageSize-for-the-last-block.patch \
            "
 SRCREV =3D "c7b1bec0f40217d17e315226552e461a4a816abc"
=20
diff --git a/meta-oe/recipes-support/bmap-writer/files/0001-Honour-ImageS=
ize-for-the-last-block.patch b/meta-oe/recipes-support/bmap-writer/files/=
0001-Honour-ImageSize-for-the-last-block.patch
new file mode 100644
index 0000000000..1943256d71
--- /dev/null
+++ b/meta-oe/recipes-support/bmap-writer/files/0001-Honour-ImageSize-for=
-the-last-block.patch
@@ -0,0 +1,85 @@
+From e63a11dedcdece8b9b285485a86405fd258b37d8 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Tue, 29 Sep 2026 17:29:52 +0200
+Subject: [PATCH] Honour ImageSize for the last block
+
+bmaptool records the exact image size in ImageSize, and the last block
+of an image whose size is not a multiple of BlockSize is only partly
+filled. Writing and verifying used (endBlock + 1) * BlockSize as the end
+of every range, so the range containing that block asked for more bytes
+than the image has and the write failed with "Image ended before the
+block map did". Read ImageSize and clamp the end of each range to it.
+
+AI-Generated: Uses Claude Code (Claude Fable 5.1)
+Upstream-Status: Pending
+---
+ src/bmap.cpp         | 5 +++++
+ src/bmap.h           | 1 +
+ src/image_writer.cpp | 2 +-
+ src/main.cpp         | 2 +-
+ 4 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/src/bmap.cpp b/src/bmap.cpp
+index fabf2c2..0162ac0 100644
+--- a/src/bmap.cpp
++++ b/src/bmap.cpp
+@@ -135,6 +135,7 @@ int parseBMap(const std::string &filename, bmap_t& b=
mapData) {
+         bmapData.bmapVersion =3D (version !=3D nullptr) ? trimWhitespac=
e(version) : "unknown";
+=20
+         // Parse image information
++        bmapData.imageSize =3D requireChildUnsigned(p_root, "ImageSize"=
);
+         bmapData.blocksTotal =3D requireChildUnsigned(p_root, "BlocksCo=
unt");
+         bmapData.blocksMapped =3D requireChildUnsigned(p_root, "MappedB=
locksCount");
+         bmapData.blockSize =3D requireChildUnsigned(p_root, "BlockSize"=
);
+@@ -200,6 +201,10 @@ int validateBmap(const bmap_t& bmap, uint64_t devic=
eSize) {
+         if (bmap.blocksTotal =3D=3D 0) {
+             throw BmapError("BMAP: BlocksCount must not be zero");
+         }
++        if (bmap.imageSize > bmap.blocksTotal * bmap.blockSize ||
++            bmap.imageSize <=3D (bmap.blocksTotal - 1) * bmap.blockSize=
) {
++            throw BmapError("BMAP: ImageSize does not match BlocksCount=
 and BlockSize");
++        }
+         if (bmap.blocksMapped > bmap.blocksTotal) {
+             throw BmapError("BMAP: MappedBlocksCount exceeds BlocksCoun=
t");
+         }
+diff --git a/src/bmap.h b/src/bmap.h
+index cf6ff9d..98cb969 100644
+--- a/src/bmap.h
++++ b/src/bmap.h
+@@ -38,6 +38,7 @@ struct bmap_t {
+     std::string checksumType;
+     size_t blockSize =3D 0;
+     size_t blocksTotal =3D 0;
++    size_t imageSize =3D 0;
+     size_t blocksMapped =3D 0;
+     std::string bmapVersion;
+     std::string bmapChecksum;
+diff --git a/src/image_writer.cpp b/src/image_writer.cpp
+index bb802ea..f864151 100644
+--- a/src/image_writer.cpp
++++ b/src/image_writer.cpp
+@@ -177,7 +177,7 @@ int BmapWriteImage(int fd, const bmap_t &bmap, int d=
ev_fd, const std::string &de
+         for (const auto &range : bmap.ranges) {
+             // validateBmap() has already proven that none of this can =
overflow.
+             const size_t outStart =3D range.startBlock * bmap.blockSize=
;
+-            const size_t outEnd =3D (range.endBlock + 1) * bmap.blockSi=
ze;
++            const size_t outEnd =3D std::min((range.endBlock + 1) * bma=
p.blockSize, bmap.imageSize);
+             const size_t rangeSize =3D outEnd - outStart;
+             const off_t writeOffset =3D static_cast<off_t>(outStart);
+             size_t writtenSize =3D 0;
+diff --git a/src/main.cpp b/src/main.cpp
+index ca42c12..b8cbbc5 100644
+--- a/src/main.cpp
++++ b/src/main.cpp
+@@ -166,7 +166,7 @@ int main(int argc, char *argv[]) {
+     FdGuard imageGuard(image_fd);
+=20
+     std::cout << "BMAP format version: " << bmap.bmapVersion << std::en=
dl;
+-    std::cout << "Image size: " << (bmap.blocksTotal * bmap.blockSize) =
<< " bytes" << std::endl;
++    std::cout << "Image size: " << bmap.imageSize << " bytes" << std::e=
ndl;
+     std::cout << "Block size: " << bmap.blockSize << " bytes" << std::e=
ndl;
+     std::cout << "Mapped blocks: " << bmap.blocksMapped << " out of " <=
< bmap.blocksTotal
+               << " (" << std::fixed << std::setprecision(1)
+--=20
+2.55.0
+
--=20
2.55.0


