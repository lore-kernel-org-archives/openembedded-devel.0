Return-Path: <zangrc.fnst@cn.fujitsu.com>
X-Greylist: delayed 570 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 21 Feb 2020 08:45:09 UTC
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id CED9A61629
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 08:45:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,467,1574092800"; d="scan'208";a="83686039"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Feb 2020 16:35:46 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 8EE3050A997B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 16:26:04 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 21 Feb 2020 16:35:45 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 21 Feb 2020 16:35:47 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Feb 2020 16:37:34 +0800
Message-ID: <20200221083737.17042-3-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200221083737.17042-1-zangrc.fnst@cn.fujitsu.com>
References: <20200221083737.17042-1-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 8EE3050A997B.A9EF2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] openldap: upgrade 2.4.48 -> 2.4.49
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Feb 2020 08:45:10 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-License-Update: Copyright year updated to 2020.

-openldap/kill-icu.patch
Removed since this is included in 2.4.49.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../openldap/openldap/kill-icu.patch          | 30 -------------------
 ...{openldap_2.4.48.bb => openldap_2.4.49.bb} |  7 ++---
 2 files changed, 3 insertions(+), 34 deletions(-)
 delete mode 100644 meta-oe/recipes-support/openldap/openldap/kill-icu.patch
 rename meta-oe/recipes-support/openldap/{openldap_2.4.48.bb => openldap_2.4.49.bb} (97%)

diff --git a/meta-oe/recipes-support/openldap/openldap/kill-icu.patch b/meta-oe/recipes-support/openldap/openldap/kill-icu.patch
deleted file mode 100644
index 35e46465a..000000000
--- a/meta-oe/recipes-support/openldap/openldap/kill-icu.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
-
-slapd depends on ICU if it was built first.
-
-Upstream-Status: inappropiate [embedded specific]
----
- configure.in |    8 --------
- 1 file changed, 8 deletions(-)
-
---- openldap-2.4.23.orig/configure.in
-+++ openldap-2.4.23/configure.in
-@@ -2045,18 +2045,10 @@ if test $ol_enable_ndb != no ; then
- 		SLAPD_LIBS="$SLAPD_LIBS \$(SLAPD_NDB_LIBS)"
- 	fi
- fi
- 
- dnl ----------------------------------------------------------------
--dnl International Components for Unicode
--OL_ICU
--if test "$ol_icu" = no ; then
--	AC_MSG_WARN([ICU not available])
--else
--	ICU_LIBS="$ol_icu"
--fi
--dnl ----------------------------------------------------------------
- dnl
- dnl Check for Cyrus SASL
- dnl
- WITH_SASL=no
- ol_link_sasl=no
diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.48.bb b/meta-oe/recipes-support/openldap/openldap_2.4.49.bb
similarity index 97%
rename from meta-oe/recipes-support/openldap/openldap_2.4.48.bb
rename to meta-oe/recipes-support/openldap/openldap_2.4.49.bb
index ecc219d35..670c704e6 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.48.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.49.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://www.OpenLDAP.org/license.html"
 # basically BSD.  opensource.org does not record this license
 # at present (so it is apparently not OSI certified).
 LICENSE = "OpenLDAP"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=ad914c35f97b468f421f8ac0f3d821f4 \
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=5391b559d23a2237bdb21e7a62dae7c3 \
                     file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972 \
                     "
 SECTION = "libs"
@@ -16,7 +16,6 @@ LDAP_VER = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 
 SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/${BP}.tgz \
     file://openldap-m4-pthread.patch \
-    file://kill-icu.patch \
     file://openldap-2.4.28-gnutls-gcrypt.patch \
     file://use-urandom.patch \
     file://initscript \
@@ -26,8 +25,8 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://remove-user-host-pwd-from-version.patch \
 "
 
-SRC_URI[md5sum] = "0729a0711fe096831dedc159e0bbe73f"
-SRC_URI[sha256sum] = "d9523ffcab5cd14b709fcf3cb4d04e8bc76bb8970113255f372bc74954c6074d"
+SRC_URI[md5sum] = "2a47a6bb4319357ea7b032c45283e79e"
+SRC_URI[sha256sum] = "e3b117944b4180f23befe87d0dcf47f29de775befbc469dcf4ac3dab3311e56e"
 
 DEPENDS = "util-linux groff-native"
 
-- 
2.20.1




