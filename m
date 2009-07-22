Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1MTi2i-0004zR-1D
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Jul 2009 22:04:00 +0200
Received: from p5b034fcb.dip.t-dialin.net ([91.3.79.203] helo=dodger)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1MThok-0000Xp-Au by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jul 2009 21:49:49 +0200
Received: from stefan by dodger with local (Exim 4.69)
	(envelope-from <stefan@dodger.lab.datenfreihafen.org>)
	id 1MThqc-0003AO-Bm for openembedded-devel@lists.openembedded.org;
	Wed, 22 Jul 2009 21:51:30 +0200
Date: Wed, 22 Jul 2009 21:51:30 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090722195130.GE5337@dodger.lab.datenfreihafen.org>
MIME-Version: 1.0
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Subject: [RFC] fakeroot: Add 1.12.4 as 1.12.1 is now longer available on debian mirrors.
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
X-List-Received-Date: Wed, 22 Jul 2009 20:04:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

Fakeroot 1.12.1 fetch fails as the debian mirrors now longer carry that file.
1.12.4 is still available, use this.

Comments? Fine to commit?

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 392ec50..90bae07 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -5938,6 +5938,10 @@ sha256=6810168a3f2e20103d936513bce225dfcdda4bf1ae5f9f8042af47025c097cef
 md5=87970d6784f536cde84f9bcbaaa52720
 sha256=6810168a3f2e20103d936513bce225dfcdda4bf1ae5f9f8042af47025c097cef
 
+[ftp://ftp.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.12.4.tar.gz]
+md5=aaefede2405a40c87438e7e833d69b70
+sha256=dbcab1f495b857e67feff882e018ca59958b8d189ff1f76684d28e35463ec29d
+
 [http://openzaurus.org/mirror/fakeroot_1.2.13.tar.gz]
 md5=cf25d5d4c943ebf2293fe6f23ecba0fd
 sha256=6f51ebdf0e18bea58d18f79e8ffebb797fe57bdf44b96dff9d84b70467af7841
diff --git a/recipes/fakeroot/fakeroot-native_1.12.4.bb b/recipes/fakeroot/fakeroot-native_1.12.4.bb
new file mode 100644
index 0000000..5215dc8
--- /dev/null
+++ b/recipes/fakeroot/fakeroot-native_1.12.4.bb
@@ -0,0 +1,20 @@
+require fakeroot_${PV}.bb
+
+SRC_URI += "file://fix-prefix.patch;patch=1"
+S = "${WORKDIR}/fakeroot-${PV}"
+
+inherit native
+
+EXTRA_OECONF = "--program-prefix="
+
+# Compatability for the rare systems not using or having SYSV
+python () {
+    if bb.data.getVar('HOST_NONSYSV', d, True) and bb.data.getVar('HOST_NONSYSV', d, True) != '0':
+        bb.data.setVar('EXTRA_OECONF', ' --with-ipc=tcp --program-prefix= ', d)
+}
+
+do_stage_append () {
+    oe_libinstall -so libfakeroot ${STAGING_LIBDIR}/libfakeroot/
+}
+
+RDEPENDS = "util-linux-native"
diff --git a/recipes/fakeroot/fakeroot_1.12.4.bb b/recipes/fakeroot/fakeroot_1.12.4.bb
new file mode 100644
index 0000000..4b61f25
--- /dev/null
+++ b/recipes/fakeroot/fakeroot_1.12.4.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Gives a fake root environment"
+HOMEPAGE = "http://fakeroot.alioth.debian.org"
+SECTION = "base"
+LICENSE = "GPL"
+
+SRC_URI = "\
+  ${DEBIAN_MIRROR}/main/f/fakeroot/fakeroot_${PV}.tar.gz \
+  file://configure-libtool.patch;patch=1 \
+"
+	    
+inherit autotools
+
+do_stage() {
+        install -d ${STAGING_INCDIR}/fakeroot
+        install -m 644 *.h ${STAGING_INCDIR}/fakeroot
+        autotools_stage_all
+}
+
+# fakeroot needs getopt which is provided by the util-linux package
+RDEPENDS = "util-linux"
+

regards
Stefan Schmidt


