Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 82B5960043
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 06:33:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7I6XFNU024840
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 23:33:15 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Mon, 17 Aug 2015 23:33:15 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 18 Aug 2015 14:29:30 +0800
Message-ID: <1439879370-28698-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-oe] imagemagick: upgrade 6.9.1 -> 6.9.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Aug 2015 06:33:18 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../imagemagick/{imagemagick_6.9.1.bb => imagemagick_6.9.2.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_6.9.1.bb => imagemagick_6.9.2.bb} (92%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.9.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb
similarity index 92%
rename from meta-oe/recipes-support/imagemagick/imagemagick_6.9.1.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb
index 6ee3724..bb71037 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_6.9.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb
@@ -5,11 +5,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0887b670be7ef0c3cb37092b64d57514"
 # FIXME: There are many more checked libraries. All should be added or explicitly disabled to get consistent results.
 DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib virtual/fftw freetype"
 
-PATCHSET = "4"
+PATCHSET = "0"
 SRC_URI = "http://www.imagemagick.org/download/releases/ImageMagick-${PV}-${PATCHSET}.tar.xz \
 "
-SRC_URI[md5sum] = "b5929717d848a386f2674aeb31257c42"
-SRC_URI[sha256sum] = "74973478058069ce44040ff76b61df713d70adcadfd207836cc0622cadf1e4bf"
+SRC_URI[md5sum] = "99471c8c3f38c9264faf5c4ca7a31287"
+SRC_URI[sha256sum] = "07a2de28f7f9ab888ef47c02eb7e10cc3e0dd0e9797c5d71d6e71d19f842399e"
 
 S = "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"
 
-- 
1.9.1


