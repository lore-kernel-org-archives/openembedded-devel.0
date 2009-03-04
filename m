Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1LetaM-0005ZE-CH
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:04:45 +0100
Received: (qmail 26887 invoked by uid 813007); 4 Mar 2009 15:53:49 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:53:49 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetPi-0001Db-0Y; Wed, 04 Mar 2009 16:53:42 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:52:36 +0100
Message-Id: <1236182004-4523-22-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Richard Purdie <richard@openedhand.com>
Subject: [PATCH 21/70] yum-native: Add extract-postinst.awk script for use during rootfs generation (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 16:05:01 -0000

From: Richard Purdie <richard@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5133 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 packages/yum/yum-native/extract-postinst.awk |   11 +++++++++++
 packages/yum/yum-native_3.2.18.bb            |    8 +++++++-
 2 files changed, 18 insertions(+), 1 deletions(-)
 create mode 100644 packages/yum/yum-native/extract-postinst.awk

diff --git a/packages/yum/yum-native/extract-postinst.awk b/packages/yum/yum-native/extract-postinst.awk
new file mode 100644
index 0000000..8f2836b
--- /dev/null
+++ b/packages/yum/yum-native/extract-postinst.awk
@@ -0,0 +1,11 @@
+/Name:.*/ {
+  package = substr($0, 7)
+  next
+}
+/postinstall.*scriptlet .*/ {
+  next
+}
+{
+  print $0 >> ENVIRON["D"] "/etc/rpm-postinsts/" package ".sh"
+}
+    
diff --git a/packages/yum/yum-native_3.2.18.bb b/packages/yum/yum-native_3.2.18.bb
index d90f158..76e92b3 100644
--- a/packages/yum/yum-native_3.2.18.bb
+++ b/packages/yum/yum-native_3.2.18.bb
@@ -2,7 +2,8 @@ HOMEPAGE = "http://linux.duke.edu/projects/yum/"
 
 SRC_URI = "http://linux.duke.edu/projects/yum/download/3.2/yum-${PV}.tar.gz \
            file://hacks.patch;patch=1 \
-           file://paths.patch;patch=1"
+           file://paths.patch;patch=1 \
+	   file://extract-postinst.awk"
 PR = "r4"
 
 DEPENDS = "rpm-native python-native python-iniparse-native python-urlgrabber-native yum-metadata-parser-native libxml2-native"
@@ -15,3 +16,8 @@ do_compile_append () {
 	sed -e 's#!/usr/bin/python#!${bindir}/python#' -e 's#/usr/share#${datadir}#' -i ${S}/bin/yum.py
 	sed -e 's#!/usr/bin/python#!${bindir}/python#' -e 's#/usr/share#${datadir}#' -i ${S}/bin/yum-updatesd.py
 }
+
+do_install_append () {
+	install -d ${STAGING_BINDIR}/
+	install ${WORKDIR}/extract-postinst.awk ${STAGING_BINDIR}/
+}
-- 
1.6.1.3





