Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TbUW5-0001pH-LK
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2012 12:00:21 +0100
Received: from puchatek.dom (unknown [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 4A817D224F;
	Thu, 22 Nov 2012 11:46:19 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Nov 2012 11:45:55 +0100
Message-Id: <1353581155-2455-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <[B[B[Bk8iauv$8f3$1@ger.gmane.org>
References: <[B[B[Bk8iauv$8f3$1@ger.gmane.org>
Subject: [meta-oe][PATCH] mysql: make it work after $libexec change - LP: #1068759
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
X-List-Received-Date: Thu, 22 Nov 2012 11:00:21 -0000

Mysql start scripts assumed that mysqld is in /usr/libexec/ directory.
It was true until 406bd38b4232f9f399ef5ffe0b4fac72ed605a23 landed in
OE-Core.

This changeset fixes mysqld start and initial databases population
scripts.

More: https://bugs.launchpad.net/linaro-oe/+bug/1068759

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta-oe/recipes-support/mysql/mysql5_5.1.40.inc | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc b/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc
index 3867a12..af0ddbb 100644
--- a/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc
+++ b/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=477ab0a4c8ca64b482b3f2a365d0fdfa"
 
 DEPENDS = "ncurses"
-PR = "r10"
+PR = "r11"
 
 SRC_URI = "http://downloads.mysql.com/archives/mysql-5.1/mysql-${PV}.tar.gz \
            file://configure.in.patch \
@@ -13,7 +13,7 @@ SRC_URI = "http://downloads.mysql.com/archives/mysql-5.1/mysql-${PV}.tar.gz \
            file://misc.m4.patch \
            file://Makefile.am.patch \
            file://fix_host_path.patch \
-	   file://configure-ps-cache-check.patch \
+           file://configure-ps-cache-check.patch \
            file://fix-abi-check-gcc45.patch \
            file://my.cnf \
            file://mysqld.sh"
@@ -36,6 +36,12 @@ EXTRA_OECONF = " --with-atomic-ops=up --with-embedded-server --prefix=/usr --sys
 
 do_configure_append() {
      sed -i /comp_err/d ${S}/sql/share/Makefile
+
+     # handle distros with different values of ${libexecdir}
+     libexecdir2=`echo ${libexecdir} | sed -e 's+/usr/++g'`
+     sed -i -e "s:/libexec:/$libexecdir2:g" ${S}/scripts/mysql_install_db.sh
+     sed -i -e "s:mysqld libexec:mysqld $libexecdir2:g" ${S}/scripts/mysql_install_db.sh
+     sed -i -e "s:/libexec:/$libexecdir2:g" ${S}/scripts/mysqld_safe.sh
 }
 
 SYSROOT_PREPROCESS_FUNCS += "mysql5_sysroot_preprocess"
-- 
1.8.0



