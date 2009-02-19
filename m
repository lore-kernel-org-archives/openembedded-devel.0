Received: from [65.200.49.156] (helo=foul)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <clarson@foul>) id 1LaIMB-0003Ri-75
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Feb 2009 00:31:04 +0100
Received: by foul (Postfix, from userid 10669)
	id 7EDA517BF0C; Thu, 19 Feb 2009 16:28:52 -0700 (MST)
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Feb 2009 16:28:52 -0700
Message-Id: <1235086132-21843-1-git-send-email-clarson@kergoth.com>
X-Mailer: git-send-email 1.5.5.1.30.g58c1f
Cc: Chris Larson <clarson@mvista.com>
Subject: [PATCH] bitbake.conf: rework FILESPATH generation.
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
X-List-Received-Date: Thu, 19 Feb 2009 23:31:04 -0000

From: Chris Larson <clarson@mvista.com>

Rework FILESPATH generation to be done in bitbake.conf, avoiding the
confusion about it being in multiple places.  Adds FILESPATHBASE and
FILESPATHPKG which can be manipulated rather than manipulating FILESPATH
directly.

One usage possibility:

FILESPATHBASE =. "${TOPDIR}/files:"

Which would let me provide a custom busybox config for this build by
copying the defconfig from the openembedded metadata into my
build/files/busybox-1.0/ directory, for example.

Signed-off-by: Chris Larson <clarson@mvista.com>
---
 classes/base.bbclass |   12 ------------
 conf/bitbake.conf    |    6 ++++--
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 411adc9..2cfd398 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -180,18 +180,6 @@ def base_package_name(d):
 
   return pn
 
-def base_set_filespath(path, d):
-	import os, bb
-	filespath = []
-	# The ":" ensures we have an 'empty' override
-	overrides = (bb.data.getVar("OVERRIDES", d, 1) or "") + ":"
-	for p in path:
-		for o in overrides.split(":"):
-			filespath.append(os.path.join(p, o))
-	return ":".join(filespath)
-
-FILESPATH = "${@base_set_filespath([ "${FILE_DIRNAME}/${PF}", "${FILE_DIRNAME}/${P}", "${FILE_DIRNAME}/${PN}", "${FILE_DIRNAME}/${BP}", "${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files", "${FILE_DIRNAME}" ], d)}"
-
 def oe_filter(f, str, d):
 	from re import match
 	return " ".join(filter(lambda x: match(f, x, 0), str.split()))
diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index b00d125..06efaa0 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -231,9 +231,11 @@ FILES_${PN}-locale = "${datadir}/locale"
 
 export MANIFEST = "${FILESDIR}/manifest"
 
+# file:// search paths
 FILE_DIRNAME = "${@os.path.dirname(bb.data.getVar('FILE', d))}"
-FILESPATH = "${FILE_DIRNAME}/${PF}:${FILE_DIRNAME}/${P}:${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/${BP}:${FILE_DIRNAME}/${BPN}:${FILE_DIRNAME}/files:${FILE_DIRNAME}"
-FILESDIR = "${@bb.which(bb.data.getVar('FILESPATH', d, 1), '.')}"
+FILESPATHBASE = "${FILE_DIRNAME}"
+FILESPATHPKG = "${PF}:${P}:${PN}:${BP}:${BPN}:files:."
+FILESPATH = "${@':'.join(['%s/%s/%s' % (fp, p, o) for fp in d.getVar('FILESPATHBASE', 0).split(':') for p in d.getVar('FILESPATHPKG', 0).split(':') for o in (d.getVar('OVERRIDES', 0) + ':.').split(':')])}:${FILESDIR}"
 
 ##################################################################
 # General work and output directories for the build system.
-- 
1.5.5.1.30.g58c1f



