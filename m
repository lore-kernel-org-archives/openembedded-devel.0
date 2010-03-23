Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@build2.altell.local>) id 1Nu3Gf-0007Mt-49
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 13:31:34 +0100
Received: from build2.altell.local (build2.altell.local [192.168.1.26])
	by mail.altell.local (Postfix) with ESMTPS id 10FAA687E4;
	Tue, 23 Mar 2010 15:27:02 +0300 (MSK)
Received: from rik by build2.altell.local with local (Exim 4.69)
	(envelope-from <rik@build2.altell.local>)
	id 1Nu38J-0000Dz-B6; Tue, 23 Mar 2010 15:22:55 +0300
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Mar 2010 15:22:54 +0300
Message-Id: <1269346975-842-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.5.6.5
X-Altell-MailScanner-ID: 10FAA687E4.15237
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: rik@build2.altell.local
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: rik@build2.altell.local
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] distutils-common-base: move Python dir detection to separate class
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
X-List-Received-Date: Tue, 23 Mar 2010 12:31:35 -0000

Allows to inherit that in packages containing Python extensions but still tightly
control packaging of those extensions. Mainly for the cases where you want
those python modules/extensions/parts to be packaged separately from the main
package in order not to introduce python dependency where you don't need it.
Technically, you can do it with distutils-common-base, but it might require
more FILES_* work than with python-dir.

Introduce PYTHON_SITEPACKAGES_DIR along the way, site-packages directory is
referenced frequently enough within class files, but some recipes also pack this
directory as

${libdir}/python2.5/site-packages
${libdir}/python2.6/site-packages
${libdir}/python*/site-packages
/usr/lib/python*/site-packages
${libdir}/*/site-packages

all of which are not perfect.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 classes/distutils-common-base.bbclass |   13 ++-----------
 classes/python-dir.bbclass            |   11 +++++++++++
 2 files changed, 13 insertions(+), 11 deletions(-)
 create mode 100644 classes/python-dir.bbclass

diff --git a/classes/distutils-common-base.bbclass b/classes/distutils-common-base.bbclass
index 87578b7..b6dce7e 100644
--- a/classes/distutils-common-base.bbclass
+++ b/classes/distutils-common-base.bbclass
@@ -1,19 +1,10 @@
+inherit python-dir
+
 EXTRA_OEMAKE = ""
 
 export STAGING_INCDIR
 export STAGING_LIBDIR
 
-def python_dir(d):
-	import os, bb
-	staging_incdir = bb.data.getVar( "STAGING_INCDIR", d, 1 )
-	for majmin in "2.6 2.5 2.4 2.3".split():
-		if os.path.exists( "%s/python%s" % ( staging_incdir, majmin ) ): return "python%s" % majmin
-	if not "python-native" in bb.data.getVar( "DEPENDS", d, 1 ).split():
-		raise "No Python in STAGING_INCDIR. Forgot to build python-native ?"
-	return "INVALID"
-
-PYTHON_DIR = "${@python_dir(d)}"
-
 PACKAGES = "${PN}-dev ${PN}-dbg ${PN}-doc ${PN}"
 
 FILES_${PN} = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
diff --git a/classes/python-dir.bbclass b/classes/python-dir.bbclass
new file mode 100644
index 0000000..d631a5c
--- /dev/null
+++ b/classes/python-dir.bbclass
@@ -0,0 +1,11 @@
+def python_dir(d):
+	import os, bb
+	staging_incdir = bb.data.getVar( "STAGING_INCDIR", d, 1 )
+	for majmin in "2.6 2.5 2.4 2.3".split():
+		if os.path.exists( "%s/python%s" % ( staging_incdir, majmin ) ): return "python%s" % majmin
+	if not "python-native" in bb.data.getVar( "DEPENDS", d, 1 ).split():
+		raise "No Python in STAGING_INCDIR. Forgot to build python-native ?"
+	return "INVALID"
+
+PYTHON_DIR = "${@python_dir(d)}"
+PYTHON_SITEPACKAGES_DIR = "${libdir}/${PYTHON_DIR}/site-packages"
-- 
1.5.6.5



