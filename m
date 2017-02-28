Return-Path: <Nicolas.Ferre@microchip.com>
X-Greylist: delayed 311 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 28 Feb 2017 15:06:23 UTC
Received: from email.microchip.com (smtpout.microchip.com [198.175.253.82])
	by mail.openembedded.org (Postfix) with ESMTP id 7C75772F7E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 15:06:23 +0000 (UTC)
Received: from tenerife.corp.atmel.com (10.10.76.4) by
	chn-sv-exch06.mchp-main.com (10.10.76.107) with Microsoft SMTP Server
	id 14.3.181.6; Tue, 28 Feb 2017 08:01:10 -0700
From: Nicolas Ferre <nicolas.ferre@microchip.com>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 28 Feb 2017 16:01:19 +0100
Message-ID: <20170228150119.21252-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: [meta-oe][PATCH] devmem2: Change source URL to regain access to it
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
X-List-Received-Date: Tue, 28 Feb 2017 15:06:24 -0000
Content-Type: text/plain

Change URL due to connexion error on the original page.
As the header of the new devmem2.c source file has changed, change the
signature and the LIC_FILES_CHKSUM specificaiton.

Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
 meta-oe/recipes-support/devmem2/devmem2.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb b/meta-oe/recipes-support/devmem2/devmem2.bb
index e48cc9210bb3..c42eb5e0b1c5 100644
--- a/meta-oe/recipes-support/devmem2/devmem2.bb
+++ b/meta-oe/recipes-support/devmem2/devmem2.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Simple program to read/write from/to any location in memory"
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://devmem2.c;endline=28;md5=dd68f2b0a5184b3db3dc25c99e0bd0cd"
+LIC_FILES_CHKSUM = "file://devmem2.c;endline=38;md5=a9eb9f3890384519f435aedf986297cf"
 PR = "r7"
 
-SRC_URI = "http://www.lartmaker.nl/lartware/port/devmem2.c \
+SRC_URI = "http://www.free-electrons.com/pub/mirror/devmem2.c \
            file://devmem2-fixups-2.patch;apply=yes;striplevel=0"
 S = "${WORKDIR}"
 
@@ -18,5 +18,5 @@ do_install() {
     install devmem2 ${D}${bindir}
 }
 
-SRC_URI[md5sum] = "be12c0132a1ae118cbf5e79d98427c1d"
-SRC_URI[sha256sum] = "ec382c90af3ef2f49695ff14a4d6521e58ac482c4e29d6c9ebca8768f699c191"
+SRC_URI[md5sum] = "e23f236e94be4c429aa1ceac0f01544b"
+SRC_URI[sha256sum] = "3b15515693bae1ebd14d914e46d388edfec2175829ea1576a7a0c8606ebbe639"
-- 
2.9.0


