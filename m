Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Randy.MacLeod@windriver.com>) id 1UBYIg-0007B3-DN
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Mar 2013 23:19:38 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r21KHU2A023530
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 1 Mar 2013 12:17:30 -0800 (PST)
Received: from fidler.corp.ad.wrs.com (128.224.147.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.328.9; Fri, 1 Mar 2013 12:17:30 -0800
From: <randy.macleod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Mar 2013 15:17:29 -0500
Message-ID: <1362169049-1689-1-git-send-email-randy.macleod@windriver.com>
X-Mailer: git-send-email 1.8.1
MIME-Version: 1.0
Subject: [PATCH] apr: add libtool to SSTATE_SCAN_FILES
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
X-List-Received-Date: Fri, 01 Mar 2013 22:19:39 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The hardcoded paths in libtool will cause apache2 compile fail at
link stage when the package apr is installed from sstate cache, so
add libtool to SSTATE_SCAN_FILES.

[ CQID: WIND00405372 ]

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-support/apr/apr_1.4.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/apr/apr_1.4.6.bb b/meta/recipes-support/apr/apr_1.4.6.bb
index b7220e0..77dffee 100644
--- a/meta/recipes-support/apr/apr_1.4.6.bb
+++ b/meta/recipes-support/apr/apr_1.4.6.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0c35ff3c4c83b89d2f076e315caac28b \
 
 BBCLASSEXTEND = "native"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://configure_fixes.patch \
@@ -43,7 +43,7 @@ do_install_append() {
 	cp ${S}/${HOST_SYS}-libtool ${D}${datadir}/build-1/libtool
 }
 
-SSTATE_SCAN_FILES += "apr_rules.mk"
+SSTATE_SCAN_FILES += "apr_rules.mk libtool"
 
 SYSROOT_PREPROCESS_FUNCS += "apr_sysroot_preprocess"
 
-- 
1.8.1



