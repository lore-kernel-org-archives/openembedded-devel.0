Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <amy.fong@windriver.com>) id 1U6Qjw-0003SF-Lb
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Feb 2013 20:14:39 +0100
Received: from yow-afong-lx2.ottawa.windriver.com (yow-afong-lx2.wrs.com
	[128.224.146.164])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1FIwRCc003837
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Fri, 15 Feb 2013 10:58:27 -0800 (PST)
Received: from afong by yow-afong-lx2.ottawa.windriver.com with local (Exim
	4.80) (envelope-from <amy.fong@windriver.com>)
	id 1U6QUM-0000ED-U7; Fri, 15 Feb 2013 13:58:26 -0500
Date: Fri, 15 Feb 2013 13:58:26 -0500
From: Amy Fong <amy.fong@windriver.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130215185826.GA873@windriver.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH][meta-webserver] apache2 multilib issues
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
X-List-Received-Date: Fri, 15 Feb 2013 19:14:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

apache2: multilib issues
    
Building a multilib version of apache2 results in many packages
being installed but not packaged, resulting in apache2 being
unable to run.
    
We fix this by modifying the FILES*${PN} to specify BPN instead of PN
where required. (Also make he required change for CONFFILES_${PN})
    
Signed-off-by: Amy Fong <amy.fong@windriver.com>
--
 apache2_2.4.2.bb |   26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/recipes-httpd/apache2/apache2_2.4.2.bb b/recipes-httpd/apache2/apache2_2.4.2.bb
index af8c4ca..1ed189b 100644
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
@@ -105,40 +105,40 @@ LEAD_SONAME = "libapr-1.so.0"
 
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
 


