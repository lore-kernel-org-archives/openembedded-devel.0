Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E7EF778869
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2018 01:58:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6H1wfdB015205
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2018 18:58:41 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 16 Jul 2018 18:58:40 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 16 Jul 2018 18:58:40 -0700
Message-ID: <20180717015840.131005-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] cryptsetup: Upgrade to 2.0.3
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
X-List-Received-Date: Tue, 17 Jul 2018 01:58:40 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

* Update the homepage to https://gitlab.com/cryptsetup/cryptsetup
* Add json-c to DEPENDS as cryptsetup requires the
  json-c library for JSON data processing since cryptsetup
  2.0.0 per "The LUKS2 format and features" part of
  https://mirrors.edge.kernel.org/pub/linux/utils/cryptsetup/v2.0/v2.0.0-ReleaseNotes
* Add file /usr/lib/tmpfiles.d/cryptsetup.conf to
  FILES_${PN} when systemd enabled in DISTRO_FEATURES

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../{cryptsetup_1.7.4.bb => cryptsetup_2.0.3.bb}     | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_1.7.4.bb => cryptsetup_2.0.3.bb} (72%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_1.7.4.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.0.3.bb
similarity index 72%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_1.7.4.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.0.3.bb
index c13b764f7..df85add6a 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_1.7.4.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.0.3.bb
@@ -4,16 +4,16 @@ device-mapper mappings. These include plain dm-crypt volumes and \
 LUKS volumes. The difference is that LUKS uses a metadata header \
 and can hence offer more features than plain dm-crypt. On the other \
 hand, the header is visible and vulnerable to damage."
-HOMEPAGE = "http://code.google.com/p/cryptsetup/"
+HOMEPAGE = "https://gitlab.com/cryptsetup/cryptsetup"
 SECTION = "console"
 LICENSE = "GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=32107dd283b1dfeb66c9b3e6be312326"
 
-DEPENDS = "util-linux libdevmapper popt libgcrypt"
+DEPENDS = "util-linux libdevmapper popt libgcrypt json-c"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v1.7/${BP}.tar.xz"
-SRC_URI[md5sum] = "058ed35c5b776032c2a036838f9e22a7"
-SRC_URI[sha256sum] = "7ccf893ef79a38fb92d61f03c17b964982119f5319cdaa85a1335b8558cca016"
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v2.0/${BP}.tar.xz"
+SRC_URI[md5sum] = "ea1c722f8d4c4e36427628b679b1f819"
+SRC_URI[sha256sum] = "4d6cca04c1f5ff4a68d045d190efb2623087eda0274ded92f92a4b6911e501d4"
 
 inherit autotools gettext pkgconfig
 
@@ -33,4 +33,6 @@ RRECOMMENDS_${PN} = "kernel-module-aes-generic \
 
 EXTRA_OECONF = "--enable-static"
 
+FILES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES','systemd','${exec_prefix}/lib/tmpfiles.d/cryptsetup.conf', '', d)}"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


