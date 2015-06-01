Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4B06A6AD0D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jun 2015 06:51:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t516phbD017717
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 May 2015 23:51:43 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 31 May 2015 23:51:43 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 31 May 2015 23:51:43 -0700
Message-ID: <1433141503-34322-1-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-oe] [PATCH V2] imagemagick: update patchset from 3 to 4
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
X-List-Received-Date: Mon, 01 Jun 2015 06:51:42 -0000
Content-Type: text/plain

The ImageMagick-6.9.1-3.tar.xz is gone on the download server, there is
ImageMagick-6.9.1-4.tar.xz now.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../imagemagick/imagemagick_6.9.1.bb               |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.9.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_6.9.1.bb
index e54135b..6ee3724 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_6.9.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.9.1.bb
@@ -5,11 +5,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0887b670be7ef0c3cb37092b64d57514"
 # FIXME: There are many more checked libraries. All should be added or explicitly disabled to get consistent results.
 DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib virtual/fftw freetype"
 
-PATCHSET = "3"
+PATCHSET = "4"
 SRC_URI = "http://www.imagemagick.org/download/releases/ImageMagick-${PV}-${PATCHSET}.tar.xz \
 "
-SRC_URI[md5sum] = "1171a6837defe10be288ab44869cc3a0"
-SRC_URI[sha256sum] = "5fd180603e60c624c05c644a8340f4f4e92c19dc3c41d374d38f76c69cd48ba3"
+SRC_URI[md5sum] = "b5929717d848a386f2674aeb31257c42"
+SRC_URI[sha256sum] = "74973478058069ce44040ff76b61df713d70adcadfd207836cc0622cadf1e4bf"
 
 S = "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"
 
-- 
1.7.9.5


