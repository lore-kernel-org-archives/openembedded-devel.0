Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1ShvQh-0006Qo-87
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jun 2012 06:25:07 +0200
Received: by dalh21 with SMTP id h21so1715878dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2012 21:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=hFN/Arb7yqEmmHlgrM6wM/c50zaLDAJ2DVoOwZ4aCPo=;
	b=HG10kVyHldCrkwepiB8qOnHtwc8EUVVbVQ7o81K/kBoigkNw7qAGVsRSXf2u1I38c7
	kqeumLamcHXgmzZsfEsMCxhefCg31Ywd2BrA1+DLIJ9pZ7AD5Zd/0j6w29EtRQQg1NkC
	VDdN5VPRWkH/g1oEnl5zcPUgpEOEpGVMFvM9NCrXkYYF/ziOFyaZSXHlQv3X84w9rXG1
	wLCWUrT/A1gLk/DKKRVe1k428lnTdzrSSgVW1GKtfdwMIlPvAZyIVBvp57ra38iTRWiE
	EqAccNvP6IbBj//YZnDFI60dlLKxtwvLxRVb5DJ4PFCH1Xi1H48mHHOnhxaUheCCDjgD
	9sQA==
Received: by 10.68.197.136 with SMTP id iu8mr5345865pbc.111.1340338459839;
	Thu, 21 Jun 2012 21:14:19 -0700 (PDT)
Received: from localhost.localdomain ([94.205.109.242])
	by mx.google.com with ESMTPS id ql3sm37663942pbc.72.2012.06.21.21.14.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jun 2012 21:14:19 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Jun 2012 06:14:10 +0200
Message-Id: <1340338450-23907-1-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [meta-openembedded] python_numpy: Fix SRC_URI warnings.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Jun 2012 04:25:07 -0000

This commit fixes the following warnings:
WARNING: Unable to get checksum for python-numpy SRC_URI entry config.h: file could not be found
WARNING: Unable to get checksum for python-numpy SRC_URI entry numpyconfig.h: file could not be found

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 .../recipes-devtools/python/python-numpy_1.4.1.bb  |   12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
index a67bf8b..bdcdf91 100644
--- a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
+++ b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
@@ -2,11 +2,17 @@ DESCRIPTION = "A sophisticated Numeric Processing Package for Python"
 SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3c42211d73c3faa1026e671dd39883fa"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/numpy/numpy-${PV}.tar.gz \
-	   file://config.h \
-	   file://numpyconfig.h \
+	  "
+SRC_URI_arm += " \
+           file://arm/config.h \
+           file://arm/numpyconfig.h \
+	  "
+SRC_URI_mipsel += " \
+           file://mipsel/config.h \
+           file://mipsel/numpyconfig.h \
 	  "
 
 S = "${WORKDIR}/numpy-${PV}"
-- 
1.7.9.5



