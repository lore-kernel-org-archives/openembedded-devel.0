Received: from 3a.49.1343.static.theplanet.com
	([67.19.73.58] helo=pug.o-hand.com ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <josh@linux.intel.com>) id 1NnFgT-0000RP-1I
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Mar 2010 19:22:09 +0100
Received: from [10.250.128.186] (unknown [158.43.2.102])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by pug.o-hand.com (Postfix) with ESMTP id EB8CD12EC332
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Mar 2010 12:17:02 -0600 (CST)
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 04 Mar 2010 17:54:25 +0000
Message-ID: <1267725265.28881.9.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 (2.28.2-1.fc12) 
X-SA-Exim-Connect-IP: 67.19.73.58
X-SA-Exim-Mail-From: josh@linux.intel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Fix packaged staging for cross packages
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
X-List-Received-Date: Thu, 04 Mar 2010 18:22:09 -0000
X-Groupsio-MsgNum: 17334
Content-Type: multipart/mixed; boundary="=-ED8c/mSXHi4+IPyE/+6f"

--=-ED8c/mSXHi4+IPyE/+6f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

While working on packaged staging in Poky I noticed that cross packages
where being incorrectly packaged.

After spending quite some time to track down the issue and fix it I
committed a patch to Poky master[1] to fix it.

Attached is a copy of the patch for packages-staging.bbclass against
oe.dev.

Regards,
Joshua

1.http://git.pokylinux.org/cgit.cgi/poky/commit/?id=538087d2036d9dd319e3a22aaa2f62e5a5285c55
-- 
Joshua Lock
        Intel Open Source Technology Centre

--=-ED8c/mSXHi4+IPyE/+6f
Content-Disposition: attachment; filename="0001-packaged-staging-Fix-packagaging-of-cross-packages.patch"
Content-Type: text/x-patch; name="0001-packaged-staging-Fix-packagaging-of-cross-packages.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From 76d07ab28c304f1b827ef9b7f8adda22599c67ec Mon Sep 17 00:00:00 2001
From: Joshua Lock <josh@linux.intel.com>
Date: Thu, 4 Mar 2010 17:47:33 +0000
Subject: [PATCH] packaged-staging: Fix packagaging of cross packages

packagedstaging_fastpath() was only copying the contents of CROSS_DIR to
PSTAGE_TMPDIR resulting in the folders contents being packaged and then
installed incorrectly at the top level of CROSS_DIR rather than in HOST_ARCH
specific sub directories.

This patch fixes that issue by copying the directory and its contents rather
than just the directory contents.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 classes/packaged-staging.bbclass |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/classes/packaged-staging.bbclass b/classes/packaged-staging.bbclass
index 1ede25c..1cf30e2 100644
--- a/classes/packaged-staging.bbclass
+++ b/classes/packaged-staging.bbclass
@@ -289,7 +289,9 @@ packagedstaging_fastpath () {
 		mkdir -p ${PSTAGE_TMPDIR_STAGE}/staging/
 		mkdir -p ${PSTAGE_TMPDIR_STAGE}/cross/
 		cp -fpPR ${SYSROOT_DESTDIR}${STAGING_DIR}/* ${PSTAGE_TMPDIR_STAGE}/staging/ || /bin/true
-		cp -fpPR ${SYSROOT_DESTDIR}${CROSS_DIR}/* ${PSTAGE_TMPDIR_STAGE}/cross/ || /bin/true
+                # CROSS_DIR is just the HOST_ARCH specific stuff and a sub
+                # directory of cross so copy it *and* its contents
+		cp -fpPR ${SYSROOT_DESTDIR}${CROSS_DIR} ${PSTAGE_TMPDIR_STAGE}/cross/ || /bin/true
 	fi
 }
 
-- 
1.6.6.1


--=-ED8c/mSXHi4+IPyE/+6f--
