Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 03144777C0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Mar 2017 16:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B3D3420BA7;
	Tue, 14 Mar 2017 16:57:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id vwLdXBLNRnCW; Tue, 14 Mar 2017 16:57:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 93362208A2;
	Tue, 14 Mar 2017 16:57:24 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 096241623B7;
	Tue, 14 Mar 2017 12:57:24 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Mar 2017 12:57:22 -0400
Message-Id: <1489510642-85850-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-oe][PATCH] devmem2: use different filename to avoid checksum conflicts
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
X-List-Received-Date: Tue, 14 Mar 2017 16:57:25 -0000

From: Denys Dmytriyenko <denys@ti.com>

The newly resurrected devmem2.c file besides having a new location, also
updates its header, producing different checksums, which would conflict
with any previously cached or mirrored instances. To avoid such conflicts,
use a different filename locally.

WARNING: devmem2-1.0-r7 do_fetch: Fetcher failure for URL: 'http://www.free-electrons.com/pub/mirror/devmem2.c'. Checksum mismatch!
File: '/OE/master/downloads/devmem2.c' has md5 checksum be12c0132a1ae118cbf5e79d98427c1d when e23f236e94be4c429aa1ceac0f01544b was expected
File: '/OE/master/downloads/devmem2.c' has sha256 checksum ec382c90af3ef2f49695ff14a4d6521e58ac482c4e29d6c9ebca8768f699c191 when 3b15515693bae1ebd14d914e46d388edfec2175829ea1576a7a0c8606ebbe639 was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[md5sum] = "be12c0132a1ae118cbf5e79d98427c1d"
SRC_URI[sha256sum] = "ec382c90af3ef2f49695ff14a4d6521e58ac482c4e29d6c9ebca8768f699c191"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.

WARNING: devmem2-1.0-r7 do_fetch: Renaming /OE/sources/devmem2.c to /OE/sources/devmem2.c_bad-checksum_be12c0132a1ae118cbf5e79d98427c1d

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-oe/recipes-support/devmem2/devmem2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb b/meta-oe/recipes-support/devmem2/devmem2.bb
index c42eb5e..d59dbfa 100644
--- a/meta-oe/recipes-support/devmem2/devmem2.bb
+++ b/meta-oe/recipes-support/devmem2/devmem2.bb
@@ -3,14 +3,14 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://devmem2.c;endline=38;md5=a9eb9f3890384519f435aedf986297cf"
 PR = "r7"
 
-SRC_URI = "http://www.free-electrons.com/pub/mirror/devmem2.c \
+SRC_URI = "http://www.free-electrons.com/pub/mirror/devmem2.c;downloadfilename=devmem2-new.c \
            file://devmem2-fixups-2.patch;apply=yes;striplevel=0"
 S = "${WORKDIR}"
 
 CFLAGS += "-DFORCE_STRICT_ALIGNMENT"
 
 do_compile() {
-    ${CC} -o devmem2 devmem2.c ${CFLAGS} ${LDFLAGS}
+    ${CC} -o devmem2 devmem2-new.c ${CFLAGS} ${LDFLAGS}
 }
 
 do_install() {
-- 
2.7.4


