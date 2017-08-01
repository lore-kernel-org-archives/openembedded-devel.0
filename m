Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DFEDB7826C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Aug 2017 17:01:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v71H1sLt011367
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 1 Aug 2017 10:01:55 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 1 Aug 2017 10:01:54 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 1 Aug 2017 10:01:52 -0700
Message-ID: <20170801170152.94586-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] imagemagick: upgrade from 7.0.5 to 7.0.6p4
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
X-List-Received-Date: Tue, 01 Aug 2017 17:01:54 -0000
Content-Type: text/plain

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../imagemagick/{imagemagick_7.0.5.bb => imagemagick_7.0.6.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.0.5.bb => imagemagick_7.0.6.bb} (96%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.5.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.6.bb
similarity index 96%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.0.5.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.0.6.bb
index b8ee6e7be..6f967c3a1 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.5.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.6.bb
@@ -8,11 +8,11 @@ DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib fftw freetype"
 # Important note: tarballs for all patchsets within a version are deleted when
 # a new pachset is created. To avoid multiple patches for each patchset, try to
 # update to the last pachset of a version
-PATCHSET = "6"
+PATCHSET = "4"
 SRC_URI = "http://www.imagemagick.org/download/releases/ImageMagick-${PV}-${PATCHSET}.tar.xz \
 "
-SRC_URI[md5sum] = "dfaa2bd61f65d67ea8d5307ed6cd197f"
-SRC_URI[sha256sum] = "f60c3e3466ccbf9a0e643284ffec3467363edf9611f16a98387f927a974b49ab"
+SRC_URI[md5sum] = "079a857268536862148b00efcf3ad75a"
+SRC_URI[sha256sum] = "5fe1ce7d78befb5c8aa7f8ae69710d0f78063d2e3a35c656521a3ce468ea733b"
 
 S = "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"
 
-- 
2.11.0


