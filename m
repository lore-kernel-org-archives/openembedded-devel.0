Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TLUpJ-0006oy-Je
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2012 10:06:05 +0200
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 5B492D22BB;
	Tue,  9 Oct 2012 09:52:43 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Oct 2012 09:52:22 +0200
Message-Id: <1349769155-12643-2-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1349769155-12643-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1349769155-12643-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [PATCH 01/14] soft66: added missing AM_PROG_AR
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
X-List-Received-Date: Tue, 09 Oct 2012 08:06:05 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta-oe/recipes-connectivity/soft66/files/fix-ar.patch |   13 +++++++++++++
 meta-oe/recipes-connectivity/soft66/soft66_git.bb      |    4 +++-
 2 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/soft66/files/fix-ar.patch

diff --git a/meta-oe/recipes-connectivity/soft66/files/fix-ar.patch b/meta-oe/recipes-connectivity/soft66/files/fix-ar.patch
new file mode 100644
index 0000000..bf1ffdf
--- /dev/null
+++ b/meta-oe/recipes-connectivity/soft66/files/fix-ar.patch
@@ -0,0 +1,13 @@
+---
+ configure.ac |    1 +
+ 1 file changed, 1 insertion(+)
+
+--- git.orig/configure.ac
++++ git/configure.ac
+@@ -7,5 +7,6 @@ AC_PROG_CC
+ AC_CONFIG_HEADERS([config.h])
+ AC_CONFIG_FILES([Makefile lib/Makefile tools/Makefile])
+ PKG_CHECK_MODULES([FTDI], [libftdi >= 0.13])
+ AC_OUTPUT
+ AM_PROG_CC_C_O
++AM_PROG_AR
diff --git a/meta-oe/recipes-connectivity/soft66/soft66_git.bb b/meta-oe/recipes-connectivity/soft66/soft66_git.bb
index c38ac15..a574c3c 100644
--- a/meta-oe/recipes-connectivity/soft66/soft66_git.bb
+++ b/meta-oe/recipes-connectivity/soft66/soft66_git.bb
@@ -6,9 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
 DEPENDS = "libftdi"
 
 PV = "0.1.3+gitr${SRCPV}"
+PR = "r1"
 
 SRCREV = "a1dab25e73896c90c98227ac8055f227b830d512"
-SRC_URI = "git://home.horsten.com/soft66;protocol=git"
+SRC_URI = "git://home.horsten.com/soft66;protocol=git \
+file://fix-ar.patch"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.10.4



