Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1P1gKA-00069Y-JJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Oct 2010 16:11:12 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1P1gJm-0007Sy-Lm from Tom_Rini@mentor.com ;
	Fri, 01 Oct 2010 07:10:34 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Fri, 1 Oct 2010 07:10:34 -0700
Received: from localhost.localdomain ([172.30.80.12]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 1 Oct 2010 08:10:33 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Oct 2010 07:10:21 -0700
Message-Id: <1285942221-29511-1-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 01 Oct 2010 14:10:33.0485 (UTC)
	FILETIME=[698793D0:01CB6172]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] eglibc/glibc: Kill off (again) zoneinfo
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
X-List-Received-Date: Fri, 01 Oct 2010 14:11:12 -0000

We want to get zoneinfo from the tzdata package.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 classes/glibc-package.bbclass         |    2 +-
 recipes/eglibc/eglibc-package.bbclass |    2 +-
 recipes/eglibc/eglibc.inc             |    2 +-
 recipes/glibc/glibc-package.inc       |    1 +
 recipes/glibc/glibc.inc               |    2 +-
 5 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/classes/glibc-package.bbclass b/classes/glibc-package.bbclass
index 36424d5..239317f 100644
--- a/classes/glibc-package.bbclass
+++ b/classes/glibc-package.bbclass
@@ -21,7 +21,7 @@ libc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so ${ba
 # The problem is that if PN = "glibc", FILES_${PN} will overwrite FILES_glibc
 # Solution: Make them both the same thing, then it doesn't matter
 
-glibcfiles = "${libc_baselibs} ${libexecdir}/* ${datadir}/zoneinfo ${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig', '', d)}"
+glibcfiles = "${libc_baselibs} ${libexecdir}/* ${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig', '', d)}"
 glibcdbgfiles = "${bindir}/.debug ${sbindir}/.debug ${libdir}/.debug \
                   ${base_bindir}/.debug ${base_sbindir}/.debug ${base_libdir}/.debug \
                   ${libdir}/gconv/.debug ${libexecdir}/*/.debug"
diff --git a/recipes/eglibc/eglibc-package.bbclass b/recipes/eglibc/eglibc-package.bbclass
index 06d91be..5871be0 100644
--- a/recipes/eglibc/eglibc-package.bbclass
+++ b/recipes/eglibc/eglibc-package.bbclass
@@ -62,7 +62,7 @@ libc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so ${ba
 # The problem is that if PN = "glibc", FILES_${PN} will overwrite FILES_glibc
 # Solution: Make them both the same thing, then it doesn't matter
 
-eglibcfiles = "${libc_baselibs} ${libexecdir}/* ${datadir}/zoneinfo ${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig', '', d)}"
+eglibcfiles = "${libc_baselibs} ${libexecdir}/* ${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig', '', d)}"
 eglibcdbgfiles = "${bindir}/.debug ${sbindir}/.debug ${libdir}/.debug \
                   ${base_bindir}/.debug ${base_sbindir}/.debug ${base_libdir}/.debug \
                   ${libdir}/gconv/.debug ${libexecdir}/*/.debug"
diff --git a/recipes/eglibc/eglibc.inc b/recipes/eglibc/eglibc.inc
index 2e215c5..a68f343 100644
--- a/recipes/eglibc/eglibc.inc
+++ b/recipes/eglibc/eglibc.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.eglibc.org/home"
 SECTION = "libs"
 PRIORITY = "required"
 LICENSE = "LGPL"
-INC_PR = "r13"
+INC_PR = "r14"
 # nptl needs unwind support in gcc, which can't be built without glibc.
 DEPENDS = "virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers"
 #this leads to circular deps, so lets not add it yet
diff --git a/recipes/glibc/glibc-package.inc b/recipes/glibc/glibc-package.inc
index 2e9474d..0b263bb 100644
--- a/recipes/glibc/glibc-package.inc
+++ b/recipes/glibc/glibc-package.inc
@@ -60,6 +60,7 @@ do_install() {
 		mv ${WORKDIR}/SUPPORTED.tmp ${WORKDIR}/SUPPORTED
 	done
 	rm -f ${D}{sysconfdir}/rpc
+	rm -rf ${D}${datadir}/zoneinfo
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0644 ${S}/nscd/nscd.conf ${D}${sysconfdir}/
 	install ${S}/nscd/nscd.init ${D}${sysconfdir}/init.d/nscd
diff --git a/recipes/glibc/glibc.inc b/recipes/glibc/glibc.inc
index 643ebd3..f3c0c08 100644
--- a/recipes/glibc/glibc.inc
+++ b/recipes/glibc/glibc.inc
@@ -13,7 +13,7 @@ PROVIDES += "virtual/libintl virtual/libiconv"
 COMPATIBLE_TARGET_SYS ?= "(?!nios2)"
 
 # INC_PR for glibc.inc, glibc-initial.inc and glibc-stage.inc
-INC_PR = "r36"
+INC_PR = "r37"
 
 inherit autotools
 
-- 
1.6.3.3



