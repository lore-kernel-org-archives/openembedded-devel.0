Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0A83265D85
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Apr 2014 07:00:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3F70amn029638
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Apr 2014 00:00:36 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 15 Apr 2014 00:00:35 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 15 Apr 2014 15:01:24 +0800
Message-ID: <00038b50f96f259beae9e06813ec54085dd9fa17.1397545082.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1397545082.git.jackie.huang@windriver.com>
References: <cover.1397545082.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/3] gd: update to version 2.1.0
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
X-List-Received-Date: Tue, 15 Apr 2014 07:00:38 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Changes:
- Add DESCRIPTION and HOMEPAGE
- libgd.org is down, use bitbucket.org instead and also
  remove the MIRROR for it.
- Remove the unnecessary specified dir for --with-png.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../gd/{gd_2.0.35+2.0.36rc1.bb => gd_2.1.0.bb}     |   22 ++++++++++++--------
 1 file changed, 13 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-support/gd/{gd_2.0.35+2.0.36rc1.bb => gd_2.1.0.bb} (43%)

diff --git a/meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb b/meta-oe/recipes-support/gd/gd_2.1.0.bb
similarity index 43%
rename from meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb
rename to meta-oe/recipes-support/gd/gd_2.1.0.bb
index 957c4eb..1b78b9b 100644
--- a/meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb
+++ b/meta-oe/recipes-support/gd/gd_2.1.0.bb
@@ -1,22 +1,26 @@
+SUMMARY = "gd is a library used to create PNG, JPEG, or WBMP images"
+DESCRIPTION = "The gd graphics library allows your code to quickly draw images \
+complete with lines, arcs, text, multiple colors, cut and paste from other \
+images, and flood fills, and to write out the result as a PNG or JPEG file. \
+This is particularly useful in Web applications, where PNG and JPEG are two \
+of the formats accepted for inline images by most browsers. Note that gd is not \
+a paint program."
+HOMEPAGE = "http://libgd.bitbucket.org/"
 SECTION = "libs"
+
 LICENSE = "GD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c97638cafd3581eb87abd37332137669"
-SUMMARY = "gd is a library used to create PNG, JPEG, or WBMP images"
 DEPENDS = "freetype libpng jpeg zlib"
-PR = "r5"
-
-SRC_URI = "http://www.libgd.org/releases/gd-2.0.36RC1.tar.gz"
-SRC_URI[md5sum] = "39ac48e6d5e0012a3bd2248a0102f209"
-SRC_URI[sha256sum] = "dd7c1795271221b9237769b96b8cec7fbdc5db7b8954d864ead51fc1296a6ac8"
 
-MIRRORS += "http://www.libgd.org/releases/ http://fossies.org/unix/www/ \n"
+SRC_URI = "https://bitbucket.org/libgd/gd-libgd/downloads/libgd-${PV}.tar.bz2"
+SRC_URI[md5sum] = "5a1d5bab3a4a41d9f111bcceee4ad25b"
+SRC_URI[sha256sum] = "f3e1bc472bd81ee976a739436659fe752a14727a964c64530fde68531ddeee91"
 
-S = "${WORKDIR}/gd-2.0.36RC1"
+S = "${WORKDIR}/libgd-${PV}"
 
 inherit autotools binconfig gettext
 
 EXTRA_OECONF += " --with-zlib=${STAGING_LIBDIR}/.. \
-                  --with-png=${STAGING_LIBDIR}/.. \
                   --with-jpeg=${STAGING_LIBDIR}/.. \
                   --with-freetype \
                   --without-fontconfig \
-- 
1.7.9.5


