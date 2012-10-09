Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TLUpK-0006oz-5k
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2012 10:06:06 +0200
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id CF585D22BC;
	Tue,  9 Oct 2012 09:52:43 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Oct 2012 09:52:23 +0200
Message-Id: <1349769155-12643-3-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1349769155-12643-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1349769155-12643-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [PATCH 02/14] libdivecomputer: added missing AM_PROG_AR
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
X-List-Received-Date: Tue, 09 Oct 2012 08:06:06 -0000

Change is present upstream for long time. We should consider update of
recipe.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../libdivecomputer/files/fix-ar.patch               |   18 ++++++++++++++++++
 .../libdivecomputer/libdivecomputer_git.bb           |    5 ++++-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/libdivecomputer/files/fix-ar.patch

diff --git a/meta-oe/recipes-extended/libdivecomputer/files/fix-ar.patch b/meta-oe/recipes-extended/libdivecomputer/files/fix-ar.patch
new file mode 100644
index 0000000..cc3f5d4
--- /dev/null
+++ b/meta-oe/recipes-extended/libdivecomputer/files/fix-ar.patch
@@ -0,0 +1,18 @@
+---
+ configure.ac |    1 +
+ 1 file changed, 1 insertion(+)
+
+--- git.orig/configure.ac
++++ git/configure.ac
+@@ -24,10 +24,11 @@ LT_INIT([win32-dll])
+ LT_PROG_RC
+ 
+ # Checks for programs.
+ AC_PROG_CC
+ AC_PROG_CC_C99
++AM_PROG_AR
+ 
+ # Enable automake silent build rules.
+ m4_ifdef([AM_SILENT_RULES],[AM_SILENT_RULES([yes])])
+ 
+ # Checks for native Windows.
diff --git a/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb b/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
index ac609a9..1154dc0 100644
--- a/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
+++ b/meta-oe/recipes-extended/libdivecomputer/libdivecomputer_git.bb
@@ -9,8 +9,11 @@ DEPENDS = "libusb1"
 inherit autotools pkgconfig
 
 PV = "0.0.0"
+PR = "r1"
+
 SRCREV = "b7a6be15ca58cc8f89fbc8fa1a4c840e13d51092"
-SRC_URI = "git://libdivecomputer.git.sourceforge.net/gitroot/libdivecomputer/libdivecomputer"
+SRC_URI = "git://libdivecomputer.git.sourceforge.net/gitroot/libdivecomputer/libdivecomputer \
+file://fix-ar.patch"
 S = "${WORKDIR}/git"
 
 
-- 
1.7.10.4



