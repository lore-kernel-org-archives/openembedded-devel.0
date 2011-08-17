Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QtbT0-0002aG-Lq
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Aug 2011 10:27:14 +0200
Received: from localhost (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.137.0; Wed, 17 Aug 2011
	10:22:33 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Aug 2011 10:22:38 +0200
Message-ID: <1313569358-5171-1-git-send-email-anders@chargestorm.se>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH] ckermit: revert the SRC_URI change
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
X-List-Received-Date: Wed, 17 Aug 2011 08:27:14 -0000
Content-Type: text/plain

The SRC_URI was changed by mistake (although both works).
Revert back to the official one.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta-oe/recipes-support/ckermit/ckermit_301.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/ckermit/ckermit_301.bb b/meta-oe/recipes-support/ckermit/ckermit_301.bb
index c789ea5..4074cf0 100644
--- a/meta-oe/recipes-support/ckermit/ckermit_301.bb
+++ b/meta-oe/recipes-support/ckermit/ckermit_301.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://www.columbia.edu/kermit/"
 SECTION = "console/network"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.TXT;md5=932ca542d6c6cb8a59a0bcd76ab67cc3"
-SRC_URI = "ftp://www.columbia.edu/kermit/archives/cku${PV}.tar.gz;subdir=${BPN}-${PV}"
+SRC_URI = "ftp://kermit.columbia.edu/kermit/archives/cku${PV}.tar.gz;subdir=${BPN}-${PV}"
 PR = "r0"
 
 export CC2 = "${CC}"
-- 
1.7.5.4



