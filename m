Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1Shzzx-0004OG-K0
	for Openembedded-devel@lists.openembedded.org;
	Fri, 22 Jun 2012 11:17:49 +0200
Received: from puchatek.dom (87-206-60-144.dynamic.chello.pl [87.206.60.144])
	(using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 93AB9D232B;
	Fri, 22 Jun 2012 11:07:05 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: Openembedded-devel@lists.openembedded.org
Date: Fri, 22 Jun 2012 11:07:00 +0200
Message-Id: <1340356020-11900-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] mysql: start at runlevel 5 not S
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
X-List-Received-Date: Fri, 22 Jun 2012 09:17:49 -0000

Without that change target system had to be restarted to get MySQL
running or it had to be run by hand. Reason was simple: mysql init
script was starting before S99configure when package was not yet
configured.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta-oe/recipes-support/mysql/mysql5_5.1.40.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc b/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc
index 9699dec..5a8e32a 100644
--- a/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc
+++ b/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=477ab0a4c8ca64b482b3f2a365d0fdfa"
 
 DEPENDS = "ncurses"
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "http://downloads.mysql.com/archives/mysql-5.1/mysql-${PV}.tar.gz \
            file://configure.in.patch \
@@ -26,7 +26,7 @@ inherit autotools binconfig update-rc.d
 
 INITSCRIPT_PACKAGES = "${PN}-server"
 INITSCRIPT_NAME = "mysqld"
-INITSCRIPT_PARAMS = "start 45 S . stop 45 0 6 1 ."
+INITSCRIPT_PARAMS = "start 45 5 . stop 45 0 6 1 ."
 
 export ac_cv_path_PS="/bin/ps"
 export ac_cv_FIND_PROC="/bin/ps p \$\$PID | grep -v grep | grep mysqld > /dev/null"
-- 
1.7.10.4



