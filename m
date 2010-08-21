Received: from szluug.org
	([85.17.92.45] helo=americium.stoicheia.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <soltys@szluug.org>) id 1OmlQQ-0006tQ-Pj
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Aug 2010 12:35:59 +0200
Received: from localhost.localdomain (soltys.soad.pl [83.168.118.74])
	by americium.stoicheia.net (Postfix) with ESMTPSA id 612FB69638;
	Sat, 21 Aug 2010 12:26:48 +0200 (CEST)
From: Krzysztof Koroscik <soltys@szluug.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Aug 2010 12:26:49 +0200
Message-Id: <1282386409-25842-1-git-send-email-soltys@szluug.org>
X-Mailer: git-send-email 1.6.4
X-SA-Exim-Connect-IP: 85.17.92.45
X-SA-Exim-Mail-From: soltys@szluug.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] shr: add shr-mirrors.bbclass and make use of it
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
X-List-Received-Date: Sat, 21 Aug 2010 10:35:59 -0000

Signed-off-by: Krzysztof Koroscik <soltys@szluug.org>
---
 classes/shr-mirrors.bbclass |   13 +++++++++++++
 conf/distro/shr.conf        |    5 ++++-
 2 files changed, 17 insertions(+), 1 deletions(-)
 create mode 100644 classes/shr-mirrors.bbclass

diff --git a/classes/shr-mirrors.bbclass b/classes/shr-mirrors.bbclass
new file mode 100644
index 0000000..92a41ad
--- /dev/null
+++ b/classes/shr-mirrors.bbclass
@@ -0,0 +1,13 @@
+PREMIRRORS_append () {
+cvs://.*/.* http://build.shr-project.org/sources/
+svn://.*/.* http://build.shr-project.org/sources/
+git://.*/.* http://build.shr-project.org/sources/
+hg://.*/.* http://build.shr-project.org/sources/
+bzr://.*/.* http://build.shr-project.org/sources/
+}
+
+MIRRORS_append () {
+ftp://.*/.*	http://build.shr-project.org/sources/
+https?$://.*/.*	http://build.shr-project.org/sources/
+}
+
diff --git a/conf/distro/shr.conf b/conf/distro/shr.conf
index e2a8d23..f7f4cf4 100644
--- a/conf/distro/shr.conf
+++ b/conf/distro/shr.conf
@@ -82,7 +82,10 @@ ANGSTROM_BLACKLIST_pn-linux-davinci = "strange kernel, spank maintainer"
 
 CVS_TARBALL_STASH += "http://build.shr-project.org/sources/"
 
-PREMIRRORS = "(ftp|https?)$://.*/.* http://build.shr-project.org/sources/"
+#The shr-mirrors.bbclass repleaces this
+#PREMIRRORS = "(ftp|https?)$://.*/.* http://build.shr-project.org/sources/"
+INHERIT += "shr-mirrors" 
+
 
 DISTRO_FEED_PREFIX ?= "shr-dev"
 DISTRO_FEED_URI ?= "http://build.shr-project.org/shr-testing/ipk"
-- 
1.6.4



