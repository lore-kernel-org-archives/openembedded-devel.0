Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Song.Li@windriver.com>) id 1UEIhk-0006X4-Nx
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Mar 2013 13:16:49 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r298TLiY007079
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 9 Mar 2013 00:29:21 -0800 (PST)
Received: from pek-usp-6.corp.ad.wrs.com (128.224.163.68) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Sat, 9 Mar 2013 00:29:21 -0800
From: <Song.Li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>,
	<paul.eggleton@linux.intel.com>
Date: Sat, 9 Mar 2013 16:26:12 +0800
Message-ID: <1362817572-14365-1-git-send-email-Song.Li@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com, Pradeep.Tumati@windriver.com
Subject: [meta-webserver][PATCH] apache2:fix PN to BPN to avoid do_package warning
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
X-List-Received-Date: Sat, 09 Mar 2013 12:16:51 -0000
Content-Type: text/plain

From: Song.Li <Song.Li@windriver.com>

Some files weren't shipped in package when do
a multilib build.This is caused by PN various.
change them to BPN.

Signed-off-by: Song.Li <Song.Li@windriver.com>
---
 recipes-httpd/apache2/apache2_2.4.2.bb |   27 +++++++++++++--------------
 1 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/recipes-httpd/apache2/apache2_2.4.2.bb b/recipes-httpd/apache2/apache2_2.4.2.bb
index af8c4ca..af285d6 100644
--- a/recipes-httpd/apache2/apache2_2.4.2.bb
+++ b/recipes-httpd/apache2/apache2_2.4.2.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://httpd.apache.org/"
 DEPENDS = "libtool-native apache2-native openssl expat pcre apr apr-util"
 SECTION = "net"
 LICENSE = "Apache-2.0"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
            file://server-makefile.patch \
@@ -105,40 +105,39 @@ LEAD_SONAME = "libapr-1.so.0"
 
 PACKAGES = "${PN}-doc ${PN}-dev ${PN}-dbg ${PN}"
 
-CONFFILES_${PN} = "${sysconfdir}/${PN}/httpd.conf \
-		   ${sysconfdir}/${PN}/magic \
-		   ${sysconfdir}/${PN}/mime.types \
-		   ${sysconfdir}/init.d/${PN} "
+CONFFILES_${PN} = "${sysconfdir}/${BPN}/httpd.conf \
+		   ${sysconfdir}/${BPN}/magic \
+		   ${sysconfdir}/${BPN}/mime.types \
+		   ${sysconfdir}/init.d/${BPN} "
 
 # we override here rather than append so that .so links are
 # included in the runtime package rather than here (-dev)
 # and to get build, icons, error into the -dev package
-FILES_${PN}-dev = "${datadir}/${PN}/build \
-		${datadir}/${PN}/icons \
-		${datadir}/${PN}/error \
+FILES_${PN}-dev = "${datadir}/${BPN}/build \
+		${datadir}/${BPN}/icons \
+		${datadir}/${BPN}/error \
 		${bindir}/apr-config ${bindir}/apu-config \
 		${libdir}/apr*.exp \
-		${includedir}/${PN} \
+		${includedir}/${BPN} \
 		${libdir}/*.la \
 		${libdir}/*.a"
 
 # manual to manual
-FILES_${PN}-doc += " ${datadir}/${PN}/manual"
+FILES_${PN}-doc += " ${datadir}/${BPN}/manual"
 
 #
 # override this too - here is the default, less datadir
 #
 FILES_${PN} =  "${bindir} ${sbindir} ${libexecdir} ${libdir}/lib*.so.* ${sysconfdir} \
 		${sharedstatedir} ${localstatedir} /bin /sbin /lib/*.so* \
-		${libdir}/${PN}"
+		${libdir}/${BPN}"
 
 # we want htdocs and cgi-bin to go with the binary
-FILES_${PN} += "${datadir}/${PN}/htdocs ${datadir}/${PN}/cgi-bin"
+FILES_${PN} += "${datadir}/${BPN}/htdocs ${datadir}/${BPN}/cgi-bin"
 
 #make sure the lone .so links also get wrapped in the base package
 FILES_${PN} += "${libdir}/lib*.so ${libdir}/pkgconfig/*"
 
-FILES_${PN}-dbg += "${libdir}/${PN}/modules/.debug"
+FILES_${PN}-dbg += "${libdir}/${BPN}/modules/.debug"
 
 RDEPENDS_${PN} += "openssl libgcc"
-
-- 
1.7.1



