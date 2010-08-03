Received: from smtp5-g21.free.fr ([212.27.42.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ydirson@free.fr>) id 1OgQE1-0003Wc-N6
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 00:45:08 +0200
Received: from home.lan (unknown [81.57.214.146])
	by smtp5-g21.free.fr (Postfix) with ESMTP id 20187D48079;
	Wed,  4 Aug 2010 00:44:34 +0200 (CEST)
Received: from yann by home.lan with local (Exim 4.72)
	(envelope-from <ydirson@free.fr>)
	id 1OgQJf-0006PW-MI; Wed, 04 Aug 2010 00:50:35 +0200
Date: Wed, 4 Aug 2010 00:50:35 +0200
From: ydirson@free.fr
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100803225035.GI4752@home.lan>
MIME-Version: 1.0
In-Reply-To: <1280792514-24843-3-git-send-email-ydirson@altern.org>
X-Mailer: git-send-email 1.7.1
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 212.27.42.5
X-SA-Exim-Mail-From: ydirson@free.fr
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/3] git: activate gitk.
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
X-List-Received-Date: Tue, 03 Aug 2010 22:45:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

It does not work perfectly (complains about possible problems in the tcl
package), and buttons are huge, but it allows to browse history.

git-gui OTOH does not start at all, it only complains that tk is not
correctly installed, so it is commented out.

Signed-off-by: Yann Dirson <ydirson@altern.org>
---
 recipes/git/git-native_1.7.0.2.bb |    1 +
 recipes/git/git.inc               |    2 --
 recipes/git/git_1.7.0.2.bb        |   22 ++++++++++++++++++++--
 3 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/recipes/git/git-native_1.7.0.2.bb b/recipes/git/git-native_1.7.0.2.bb
index b55070a..7daee84 100644
--- a/recipes/git/git-native_1.7.0.2.bb
+++ b/recipes/git/git-native_1.7.0.2.bb
@@ -6,3 +6,4 @@ SRC_URI[src.md5sum] = "76518fa774b36de81d160b85fa4f19c1"
 SRC_URI[src.sha256sum] = "5601df7fc282fdd66de196b282694eb77dcfc50438f01587de144b3ead1a6b2f"
 
 EXTRA_OECONF_append = " --without-python"
+EXTRA_OEMAKE = "NO_TCLTK=1"
diff --git a/recipes/git/git.inc b/recipes/git/git.inc
index 8275adb..bbbd7e9 100644
--- a/recipes/git/git.inc
+++ b/recipes/git/git.inc
@@ -8,8 +8,6 @@ S = "${WORKDIR}/git-${PV}"
 
 inherit autotools
 
-EXTRA_OEMAKE = "NO_TCLTK=1"
-
 do_install () {
 	oe_runmake install DESTDIR="${D}" bindir=${bindir} \
 		template_dir=${datadir}/git-core/templates \
diff --git a/recipes/git/git_1.7.0.2.bb b/recipes/git/git_1.7.0.2.bb
index 4973f05..4221a2f 100644
--- a/recipes/git/git_1.7.0.2.bb
+++ b/recipes/git/git_1.7.0.2.bb
@@ -8,13 +8,13 @@ SRC_URI += "file://git-less-hardlinks.diff"
 EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes"
 
 
-DEPENDS = "openssl curl zlib expat"
+DEPENDS = "openssl curl zlib expat tcl-native"
 RDEPENDS_${PN} = "findutils sed"
 
 # Dropbear ssh needs a wrapper script, so install openssh-ssh to make it work out of the box
 RRECOMMENDS_${PN} = "openssh-ssh"
 
-PR = "r6.2"
+PR = "r6.3"
 
 do_install_append() {
 	# Fix broken hardlinks
@@ -72,3 +72,21 @@ FILES_${PN}-large += " \
 #	/usr/libexec/git-core/git-remote-http \
 #"
 RDEPENDS_${PN}-large = "${PN}"
+
+# git-tk package with gitk and git-gui
+PACKAGES += "${PN}-tk"
+RDEPENDS_${PN}-tk = "${PN} tk tcl"
+EXTRA_OEMAKE = "TCL_PATH=${STAGING_BINDIR_CROSS}/tclsh"
+FILES_${PN}-tk = " \
+	/usr/bin/gitk \
+	/usr/share/gitk \
+"
+# git gui does not start at all at this time
+#FILES_${PN}-tk += " \
+#	/usr/libexec/git-core/git-gui \
+#	/usr/libexec/git-core/git-gui--askpass \
+#	/usr/share/git-gui \
+#"
+#PACKAGES += "${PN}-tk-locale"
+#PACKAGES_DYNAMIC = "${PN}-tk-locale-*"
+#FILES_${PN}-tk-locale = "${datadir}/git-gui/lib/msgs"
-- 
1.7.1




