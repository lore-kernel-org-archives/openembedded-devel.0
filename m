Received: from mail.asoft.ru ([91.205.86.207])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mad_soft@inbox.ru>) id 1OMFqp-0002CN-Kr
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 09:37:29 +0200
Received: from lighthouse.office.asoft.ru (office.asoft.ru [62.205.175.245])
	(authenticated bits=0)
	by mail.asoft.ru (8.14.3/8.14.3) with ESMTP id o597X3bV007448
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 9 Jun 2010 11:33:06 +0400
From: Dmitry Artamonow <mad_soft@inbox.ru>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Jun 2010 11:33:00 +0400
Message-Id: <1276068782-23257-2-git-send-email-mad_soft@inbox.ru>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1276068782-23257-1-git-send-email-mad_soft@inbox.ru>
References: <1276068782-23257-1-git-send-email-mad_soft@inbox.ru>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.2.3
	(mail.asoft.ru [91.205.86.207]);
	Wed, 09 Jun 2010 11:33:06 +0400 (MSD)
X-SA-Exim-Connect-IP: 91.205.86.207
X-SA-Exim-Mail-From: mad_soft@inbox.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/3] openjpeg-1.3: new recipe
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
X-List-Received-Date: Wed, 09 Jun 2010 07:37:29 -0000

The OpenJPEG library is an open-source JPEG 2000 codec written
in C language.

Signed-off-by: Dmitry Artamonow <mad_soft@inbox.ru>
---
 recipes/jpeg/openjpeg-1.3/fix_installdir.patch |   19 +++++++++++++++++++
 recipes/jpeg/openjpeg_1.3.bb                   |   24 ++++++++++++++++++++++++
 2 files changed, 43 insertions(+), 0 deletions(-)
 create mode 100644 recipes/jpeg/openjpeg-1.3/fix_installdir.patch
 create mode 100644 recipes/jpeg/openjpeg_1.3.bb

diff --git a/recipes/jpeg/openjpeg-1.3/fix_installdir.patch b/recipes/jpeg/openjpeg-1.3/fix_installdir.patch
new file mode 100644
index 0000000..f04a81e
--- /dev/null
+++ b/recipes/jpeg/openjpeg-1.3/fix_installdir.patch
@@ -0,0 +1,19 @@
+* status: pending
+* origin:
+  http://groups.google.com/group/openjpeg/browse_thread/thread/4cd7b53fbaab2822
+* comment: slightly modified patch by Patrick Reynolds, borrowed from
+  the thread above. Seems that it's not in upstream yet.
+  Had to modify header location from /usr/include/openjpeg/openjpeg.h to
+  /usr/include/openjpeg.h , as it's the only one header file anyway and
+  most of its users expect #include <openjpeg.h> to work.
+
+Index: libopenjpeg/CMakeLists.txt
+===================================================================
+--- a/libopenjpeg/CMakeLists.txt	(revision 541)
++++ b/libopenjpeg/CMakeLists.txt	(working copy)
+@@ -41,4 +41,4 @@
+ 
+ # Install includes files
+ INSTALL(FILES openjpeg.h
+-	DESTINATION ${INCLUDE_INSTALL_DIR}/openjpeg)
++	DESTINATION include)
diff --git a/recipes/jpeg/openjpeg_1.3.bb b/recipes/jpeg/openjpeg_1.3.bb
new file mode 100644
index 0000000..857c3dd
--- /dev/null
+++ b/recipes/jpeg/openjpeg_1.3.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "Open-source JPEG 2000 codec written in C language"
+HOMEPAGE = "http://www.openjpeg.org"
+SECTION = "libs"
+LICENSE = "BSD"
+PR = "r0"
+
+SRC_URI = "http://openjpeg.googlecode.com/files/openjpeg_v1_3.tar.gz \
+           file://fix_installdir.patch"
+
+S = "${WORKDIR}/OpenJPEG_v1_3"
+
+inherit cmake
+
+EXTRA_OECMAKE="-DBUILD_SHARED_LIBS:BOOL=ON"
+
+do_stage() {
+        autotools_stage_all
+}
+
+PACKAGES =+ "openjpeg-tools "
+FILES_openjpeg-tools = "${bindir}/*"
+
+SRC_URI[md5sum] = "f9a3ccfa91ac34b589e9bf7577ce8ff9"
+SRC_URI[sha256sum] = "3bca2e1e040f9dcbbcb1e0627f17a76eeb95e153bf663d082070c044a21202bd"
-- 
1.7.1



