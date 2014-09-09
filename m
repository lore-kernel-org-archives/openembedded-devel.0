Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E7B0A713C3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Sep 2014 16:28:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s89GS1QM005029
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 9 Sep 2014 09:28:01 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 9 Sep 2014 09:28:01 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 9 Sep 2014 09:27:53 -0700
Message-ID: <014012e5633794a3674cf0c145a40ecd51e40590.1410279874.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1410279874.git.liezhi.yang@windriver.com>
References: <cover.1410279874.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 09/14] apache2: split apache2-scripts subpkg
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Sep 2014 16:28:02 -0000
Content-Type: text/plain

Split apache2-scripts subpkg to put the perl script dbmmanage, so that
apache2 doesn't have to RDEPEND on perl.

Add another perl script apxs to apache2-dev pkg as Olof Johansson
suggested.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-httpd/apache2/apache2_2.4.10.bb        |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.10.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.10.bb
index 0356029..573cd6f 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.10.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.10.bb
@@ -112,7 +112,7 @@ INITSCRIPT_NAME = "apache2"
 INITSCRIPT_PARAMS = "defaults 91 20"
 LEAD_SONAME = "libapr-1.so.0"
 
-PACKAGES = "${PN}-doc ${PN}-dev ${PN}-dbg ${PN}"
+PACKAGES = "${PN}-scripts ${PN}-doc ${PN}-dev ${PN}-dbg ${PN}"
 
 CONFFILES_${PN} = "${sysconfdir}/${BPN}/httpd.conf \
                    ${sysconfdir}/${BPN}/magic \
@@ -129,11 +129,16 @@ FILES_${PN}-dev = "${datadir}/${BPN}/build \
                    ${libdir}/apr*.exp \
                    ${includedir}/${BPN} \
                    ${libdir}/*.la \
-                   ${libdir}/*.a"
+                   ${libdir}/*.a \
+                   ${bindir}/apxs \
+                "
+
 
 # manual to manual
 FILES_${PN}-doc += " ${datadir}/${BPN}/manual"
 
+FILES_${PN}-scripts += "${bindir}/dbmmanage"
+
 #
 # override this too - here is the default, less datadir
 #
@@ -150,3 +155,4 @@ FILES_${PN} += "${libdir}/lib*.so ${libdir}/pkgconfig/*"
 FILES_${PN}-dbg += "${libdir}/${BPN}/modules/.debug"
 
 RDEPENDS_${PN} += "openssl libgcc"
+RDEPENDS_${PN}-scripts += "perl ${PN}"
-- 
1.7.9.5


