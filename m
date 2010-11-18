Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PIsp9-0000wP-JS
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 01:58:06 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PIso3-0001mq-9r from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 16:56:55 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 17 Nov 2010 16:56:44 -0800
Received: from localhost.localdomain ([172.30.7.13]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 17 Nov 2010 17:56:44 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Nov 2010 17:56:40 -0700
Message-Id: <1290041800-30146-1-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 18 Nov 2010 00:56:44.0474 (UTC)
	FILETIME=[784141A0:01CB86BB]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] help2man: Add native recipe, drop check for being provided.
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
X-List-Received-Date: Thu, 18 Nov 2010 00:58:06 -0000

With a recent change to auto* to not build the man pages for
native recipes, we can make build progress without help2man
being there already.  This adds help2man to local.conf.sample
as an example of something that is assumed to be provided,
drops the sanity.bbclass check and adds a help2man-native recipe.
In order to catch the cases where help2man is likely to have been
an implicit requirement before we add it to the list that
autotools brings in.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 classes/autotools.bbclass           |    4 ++--
 classes/sanity.bbclass              |    2 +-
 conf/local.conf.sample              |    4 ++++
 recipes/help2man/help2man_1.37.1.bb |   21 +++++++++++++++++++++
 4 files changed, 28 insertions(+), 3 deletions(-)
 create mode 100644 recipes/help2man/help2man_1.37.1.bb

diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
index 2c27d0f..94dec13 100644
--- a/classes/autotools.bbclass
+++ b/classes/autotools.bbclass
@@ -8,9 +8,9 @@ def autotools_deps(d):
 	pn = bb.data.getVar('PN', d, 1)
 	deps = ''
 
-	if pn in ['autoconf-native', 'automake-native']:
+	if pn in ['autoconf-native', 'automake-native', 'help2man-native']:
 		return deps
-	deps += 'autoconf-native automake-native '
+	deps += 'autoconf-native automake-native help2man-native'
 
 	if not pn in ['libtool', 'libtool-native', 'libtool-cross']:
 		deps += 'libtool-native '
diff --git a/classes/sanity.bbclass b/classes/sanity.bbclass
index 575530a..1e6b170 100644
--- a/classes/sanity.bbclass
+++ b/classes/sanity.bbclass
@@ -84,7 +84,7 @@ def check_sanity(e):
 	if not check_app_exists('${BUILD_PREFIX}g++', e.data):
 		missing = missing + "C++ Compiler (${BUILD_PREFIX}g++),"
 
-	required_utilities = "patch help2man diffstat texi2html makeinfo cvs svn bzip2 tar gzip gawk md5sum chrpath"
+	required_utilities = "patch diffstat texi2html makeinfo cvs svn bzip2 tar gzip gawk md5sum chrpath"
 
 	# If we'll be running qemu, perform some sanity checks
 	if data.getVar('ENABLE_BINARY_LOCALE_GENERATION', e.data, True):
diff --git a/conf/local.conf.sample b/conf/local.conf.sample
index c53c037..1085163 100644
--- a/conf/local.conf.sample
+++ b/conf/local.conf.sample
@@ -30,6 +30,10 @@ BBFILES := "${@bb.fatal('Edit your conf/local.conf: BBFILES')}"
 # This is a regulary expression, so be sure to get your parenthesis balanced.
 BBMASK = ""
 
+# Comment this if your host distribution does not provide the
+# help2man tool.
+ASSUME_PROVIDED += "help2man-native"
+
 # Uncomment this if your host distribution has recent enough Linux
 # Kernel header files.  Utilities we use to generate certain types of
 # target filesystems need somewhat recent header files.
diff --git a/recipes/help2man/help2man_1.37.1.bb b/recipes/help2man/help2man_1.37.1.bb
new file mode 100644
index 0000000..3a47aa1
--- /dev/null
+++ b/recipes/help2man/help2man_1.37.1.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Program to create simple man pages"
+SECTION = "devel"
+LICENSE = "GPLv3"
+DEPENDS = "gettext-native perl-native liblocale-gettext-perl-native"
+DEPENDS_virtclass-native = ""
+RDEPENDS_pn-help2man = "gettext perl liblocale-gettext-perl"
+PR = "r0"
+
+SRC_URI = "${GNU_MIRROR}/help4man/help2man-${PV}.tar.gz"
+SRC_URI[md5sum] = "371b5cc74fe9c2ea3ee1ca23c19b19a8"
+SRC_URI[sha256sum] = "3b44a91ef8e722c570a2a2d0e3f1cd249aac25dd2b2692c7792d87b30ed61561"
+
+inherit autotools
+
+EXTRA_OECONF = "--disable-nls"
+
+BBCLASSEXTEND = "native"
+
+do_configure() {
+	oe_runconf
+}
-- 
1.7.0.4



