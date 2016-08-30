Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 03AEA6010B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2016 01:44:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7U1itZP025805
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Aug 2016 18:44:55 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 29 Aug 2016 18:44:54 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 29 Aug 2016 18:44:54 -0700
Message-ID: <20160830014454.1383-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [meta-oe] [PATCH] imagemagick: update patchset
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
X-List-Received-Date: Tue, 30 Aug 2016 01:44:58 -0000
Content-Type: text/plain

Fixed:
ERROR: imagemagick-7.0.2-r0 do_fetch: Fetcher failure:
--2016-08-28 04:07:12--  http://www.imagemagick.org/download/releases/ImageMagick-7.0.2-7.tar.xz
Resolving www.imagemagick.org... 198.72.81.86
Connecting to www.imagemagick.org|198.72.81.86|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2016-08-28 04:07:12 ERROR 404: Not Found.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
index 472e42d..5937062 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
@@ -8,11 +8,12 @@ DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib virtual/fftw freetype"
 # Important note: tarballs for all patchsets within a version are deleted when
 # a new pachset is created. To avoid multiple patches for each patchset, try to
 # update to the last pachset of a version
-PATCHSET = "7"
+PATCHSET = "9"
 SRC_URI = "http://www.imagemagick.org/download/releases/ImageMagick-${PV}-${PATCHSET}.tar.xz \
 "
-SRC_URI[md5sum] = "bd66b19bd6fc3d320bd8d51869c874f9"
-SRC_URI[sha256sum] = "1168f44cfcd1243acda6bb9663f5d9b3a4bca2acd372e979b97b58ecf5c713e2"
+
+SRC_URI[md5sum] = "2720ab8c480019f79e717b0237570311"
+SRC_URI[sha256sum] = "22df4f197985f36f77b7b0d44de92ff44415885045f0191b3319540bdc82ff53"
 
 S = "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"
 
-- 
2.9.0


