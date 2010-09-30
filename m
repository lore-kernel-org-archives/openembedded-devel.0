Received: from mailout-de.gmx.net ([213.165.64.22] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <Alexander.Stohr@gmx.de>) id 1P1IHe-0002c4-3E
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 14:30:48 +0200
Received: (qmail 29518 invoked by uid 0); 30 Sep 2010 12:30:30 -0000
Received: from 193.8.40.126 by www166.gmx.net with HTTP;
	Thu, 30 Sep 2010 14:30:29 +0200 (CEST)
Date: Thu, 30 Sep 2010 14:30:29 +0200
From: "Alexander Stohr" <Alexander.Stohr@gmx.de>
Message-ID: <20100930123029.23600@gmx.net>
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Authenticated: #15156664
X-Flags: 0001
X-Mailer: WWW-Mail 6100 (Global Message Exchange)
X-Priority: 3
X-Provags-ID: V01U2FsdGVkX19F9bNAyN9FEbKxzVq7TCRewu3pbfmfMHB8ISH3fw
	sfjHgXrtuxbtDQNU59sLIb+XqIdFIw5fnm7Q== 
X-GMX-UID: 0rqSfQo6YmYBa45ygnc3dYNCWkZTQZQU
X-FuHaFi: 0.75
X-SA-Exim-Connect-IP: 213.165.64.22
X-SA-Exim-Mail-From: Alexander.Stohr@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: freetype-devel@nongnu.org
Subject: [patch] fix for building freetype-native on a symlinked build environment
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
X-List-Received-Date: Thu, 30 Sep 2010 12:30:53 -0000
X-Groupsio-MsgNum: 24213
Content-Type: multipart/mixed; boundary="========GMX23601285849829271999"

--========GMX23601285849829271999
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

in an environment where the "/home" partition had not enough space
for holding a complete open embedded project i created a symlink to
an adequate partition on a second drive for hosting the build environment.

this turned out to badly impact on misc build steps.
the most recent problem i found is the build step used for freetype.

in the seemingly hand written configure script there is
a directory names comparison where some extra actions
are needed in case the directory is not the base dir of freetype build.
in my setup the names were different for some reasons in the embedding tools
(not caring whats the exact origin). in fact both were the very same dir object.
this lead to execution of parts of the script that were not intended
so that this mis-detection finally stopped the build.

the attached patch fixes that problem by changing the comparisonn code so that it
uses the inode numbers of the relevant paths for the comparison.

the patch further applies a check for an already existing subdir.
this suppresses a message on the console in a benign case.

the patch applies to freetype-2.3.6 but should be quite easily portable
to any known later release including the relatively fresh 2.4.2 version.

regards, Alex.
-- 
Neu: GMX De-Mail - Einfach wie E-Mail, sicher wie ein Brief!  
Jetzt De-Mail-Adresse reservieren: http://portal.gmx.net/de/go/demail

--========GMX23601285849829271999
Content-Type: text/x-patch;
 charset="iso-8859-15";
 name="fix-configure-symlink.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment; filename="fix-configure-symlink.patch"

--- freetype-2.3.6.orig/configure	2007-12-06 17:19:34.000000000 +0100
+++ freetype-2.3.6/configure	2010-09-30 13:43:30.000000000 +0200
@@ -68,9 +68,11 @@
 abs_ft2_dir=`cd "$ft2_dir" && pwd`
 
 # build a dummy Makefile if we are not building in the source tree
+inode_src=`ls -id $abs_ft2_dir | cut -d " " -f 1 || echo -1`
+inode_dst=`ls -id $abs_curr_dir | cut -d " " -f 1 || echo -2`
 
-if test "$abs_curr_dir" != "$abs_ft2_dir"; then
-  mkdir reference
+if test $inode_src -ne $inode_dst; then
+  if [ ! -d reference ]; then mkdir reference; fi
   echo "Copying \`modules.cfg'"
   cp $abs_ft2_dir/modules.cfg $abs_curr_dir
   echo "Generating \`Makefile'"

--========GMX23601285849829271999--
