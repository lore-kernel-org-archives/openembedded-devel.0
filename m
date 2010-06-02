Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229] helo=happy)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cbrake@hq.bec-systems.com>) id 1OJt1q-0008QP-5A
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 20:51:02 +0200
Received: from cbrake by happy with local (Exim 4.71)
	(envelope-from <cbrake@hq.bec-systems.com>)
	id 1OJsxi-0008Us-9p; Wed, 02 Jun 2010 14:46:46 -0400
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jun 2010 14:46:13 -0400
Message-Id: <1275504373-32623-1-git-send-email-cliff.brake@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 69.34.21.229
X-SA-Exim-Mail-From: cbrake@hq.bec-systems.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Cliff Brake <cbrake@bec-systems.com>
Subject: [PATCH] packaged-staging.bbclass: fix issue with no SRC_URI
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
X-List-Received-Date: Wed, 02 Jun 2010 18:51:02 -0000

From: Cliff Brake <cbrake@bec-systems.com>

Currently with srctree, we get errors like the following:
| + srcuri=
| + '[' '' == '' ']'
| + srcuri=OpenEmbedded
| + echo 'Source: '
| ++ find /scratch/oe/oe-build/oe/build/angstrom-2008.1/tmp/work/armv5te-angstrom-linux-gnueabi/autotools-demo-1.0-28-g3a96627-r0/staging-pkg '(' -name '*.la' -o -name '*-config' ')' -type f
| + stage-manager-ipkg-build -o 0 -g 0 /scratch/oe/oe-build/oe/build/angstrom-2008.1/tmp/work/armv5te-angstrom-linux-gnueabi/autotools-demo-1.0-28-g3a96627-r0/staging-pkg /scratch/oe/oe-build/oe/build/angstrom-2008.1/tmp/pstage/angstromglibc
| *** Error: CONTROL/control is missing field Source
| The Source field contain the URL's or filenames of the source code and any patches
| used to build this package.  Either gnu-style tarballs or Debian source packages
| are acceptable.  Relative filenames may be used if they are distributed in the same
| directory as the .ipk file.
|
| ipkg-build: Please fix the above errors and try again.
| ERROR: Function staging_packager failed
NOTE: package autotools-demo-1.0-28-g3a96627-r0: task do_package_stage: Failed
ERROR: TaskFailed event exception, aborting

This patch fixes that issue.

Signed-off-by: Cliff Brake <cbrake@bec-systems.com>
---
 classes/packaged-staging.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/packaged-staging.bbclass b/classes/packaged-staging.bbclass
index 83f3578..6413afb 100644
--- a/classes/packaged-staging.bbclass
+++ b/classes/packaged-staging.bbclass
@@ -374,7 +374,7 @@ staging_packager () {
 	if [ "$srcuri" == "" ]; then
 		srcuri="OpenEmbedded"
 	fi
-	echo "Source: ${SRC_URI}"               >> ${PSTAGE_TMPDIR_STAGE}/CONTROL/control
+	echo "Source: ${srcuri}"               >> ${PSTAGE_TMPDIR_STAGE}/CONTROL/control
 
 	# Deal with libtool not supporting sysroots
 	# Need to remove hardcoded paths and fix these when we install the
-- 
1.7.0.4



