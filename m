Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF78CA5FA5
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 17:37:45 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2178.1790703459551711742
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 10:37:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=i1MQcJ2l;
 spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout08.t-online.de (Postfix) with SMTP id EB033E5A3
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 19:37:36 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.97]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xBblo-1jhwiO0; Tue, 29 Sep 2026 19:37:36 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] bmap-writer: honour ImageSize for the last block
Date: Tue, 29 Sep 2026 19:37:28 +0200
Message-ID: <20260929173728.6952-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1790703456-0F7FD9F5-087D5317/0/0 CLEAN NORMAL
X-TOI-MSGID: 37b70901-0dd7-49f1-b09f-78f0da4995d0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790703456; i=f_l_k@t-online.de;
	bh=a989V/ES768gmey63EantMwmZC+ZtAHf6AOpzigJW4U=;
	h=From:To:Subject:Date;
	b=i1MQcJ2lZHdwJVRr2eGK9jufLTuDGHACsVL/60W8xDkGmwQe07PJQvrrRY3HdYwIj
	 y8l2HCvp8BsHRtGXCZCtgopNKSc9sdg3dapKvL8/9vB71aWIhcLcj0mX+ndb5ymyMc
	 LBc5zNQsCFXP9Olqgd8B/syrqQXLL9kUedrHDcAyQcuutqKlGnH0kaz6HxDGIp6AkP
	 aZNUPYXnZSFxe6XaY+wT2ikh+SLOR7X4gvbUpplR9BmRQmCqU2PAspwKKyNbyOBd4Z
	 tvsP4V9tCuIh4AdK3LRIRM72ijlmUTUwsWBYR5ehn4ArhP7HReoKjfjoOiz/iA1nwY
	 z4g1pxR1UyFTA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 17:37:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130486

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
 ...-Honour-ImageSize-for-the-last-block.patch | 85 +++++++++++++++++++
 .../bmap-writer/bmap-writer_1.0.5.bb          |  4 +-
 2 files changed, 88 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/bmap-writer/bmap-writer/0001-=
Honour-ImageSize-for-the-last-block.patch

diff --git a/meta-oe/recipes-support/bmap-writer/bmap-writer/0001-Honour-=
ImageSize-for-the-last-block.patch b/meta-oe/recipes-support/bmap-writer/=
bmap-writer/0001-Honour-ImageSize-for-the-last-block.patch
new file mode 100644
index 0000000000..1943256d71
--- /dev/null
+++ b/meta-oe/recipes-support/bmap-writer/bmap-writer/0001-Honour-ImageSi=
ze-for-the-last-block.patch
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
diff --git a/meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.5.bb b/m=
eta-oe/recipes-support/bmap-writer/bmap-writer_1.0.5.bb
index 160d1b7112..5d493f3122 100644
--- a/meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.5.bb
+++ b/meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.5.bb
@@ -8,7 +8,9 @@ SECTION =3D "console/utils"
 LICENSE =3D "GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De49f4652534af377a713df3d9dec6=
0cb"
=20
-SRC_URI =3D "git://github.com/embetrix/${BPN};branch=3Dmaster;protocol=3D=
https;tag=3D${PV}"
+SRC_URI =3D "git://github.com/embetrix/${BPN};branch=3Dmaster;protocol=3D=
https;tag=3D${PV} \
+           file://0001-Honour-ImageSize-for-the-last-block.patch \
+           "
 SRCREV =3D "c7b1bec0f40217d17e315226552e461a4a816abc"
=20
 DEPENDS =3D "libtinyxml2 libarchive"
--=20
2.55.0


