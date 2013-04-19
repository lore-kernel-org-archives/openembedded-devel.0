Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UT88p-000752-RT
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Apr 2013 12:02:12 +0200
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 6F407D2284
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Apr 2013 11:43:52 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Apr 2013 11:44:26 +0200
Message-Id: <1366364666-18938-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <51706174.6070407@linaro.org>
References: <51706174.6070407@linaro.org>
Subject: [meta-oe][PATCH] openldap: do not link to ICU
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
X-List-Received-Date: Fri, 19 Apr 2013 10:02:27 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../openldap/openldap-2.4.23/kill-icu.patch        | 30 ++++++++++++++++++++++
 .../recipes-support/openldap/openldap_2.4.23.bb    |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.23/kill-icu.patch

diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.23/kill-icu.patch b/meta-oe/recipes-support/openldap/openldap-2.4.23/kill-icu.patch
new file mode 100644
index 0000000..dcf5411
--- /dev/null
+++ b/meta-oe/recipes-support/openldap/openldap-2.4.23/kill-icu.patch
@@ -0,0 +1,30 @@
+From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
+
+slapd depends on ICU if it was built first.
+
+Upstream-status: inappropiate [embedded specific]
+---
+ configure.in |    8 --------
+ 1 file changed, 8 deletions(-)
+
+--- openldap-2.4.23.orig/configure.in
++++ openldap-2.4.23/configure.in
+@@ -2045,18 +2045,10 @@ if test $ol_enable_ndb != no ; then
+ 		SLAPD_LIBS="$SLAPD_LIBS \$(SLAPD_NDB_LIBS)"
+ 	fi
+ fi
+ 
+ dnl ----------------------------------------------------------------
+-dnl International Components for Unicode
+-OL_ICU
+-if test "$ol_icu" = no ; then
+-	AC_MSG_WARN([ICU not available])
+-else
+-	ICU_LIBS="$ol_icu"
+-fi
+-dnl ----------------------------------------------------------------
+ dnl
+ dnl Check for Cyrus SASL
+ dnl
+ WITH_SASL=no
+ ol_link_sasl=no
diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.23.bb b/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
index 1c6c32f..9a7c118 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
@@ -15,6 +15,7 @@ LDAP_VER = "${@'.'.join(d.getVar('PV',1).split('.')[0:2])}"
 
 SRC_URI = "ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/${P}.tgz"
 SRC_URI += "file://openldap-m4-pthread.patch"
+SRC_URI += "file://kill-icu.patch"
 SRC_URI += "file://initscript"
 SRC_URI[md5sum] = "90150b8c0d0192e10b30157e68844ddf"
 SRC_URI[sha256sum] = "5a5ede91d5e8ab3c7f637620aa29a3b96eb34318a8b26c8eef2d2c789fc055e3"
-- 
1.8.1.2



