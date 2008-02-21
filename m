Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JS8YV-0006DV-8G
	for openembedded-devel@openembedded.org; Thu, 21 Feb 2008 11:21:43 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1LALR33002243
	for <openembedded-devel@openembedded.org>; Thu, 21 Feb 2008 10:21:27 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01988-08 for <openembedded-devel@openembedded.org>;
	Thu, 21 Feb 2008 10:21:22 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1LALGZ9002236
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Thu, 21 Feb 2008 10:21:17 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Thu, 21 Feb 2008 10:21:16 +0000
Message-Id: <1203589276.9329.6.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: RFC: Library file extensions
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Feb 2008 10:21:50 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

As some may have gathered I made some experiments with using Poky to
cross compile things to run on the iPodTouch which is arm-apple-darwin.
THe good news is they were successful however Darwin creates some
interesting challenges for OE, one of them is the dynamic libraries
being called *.dylib, not *.so.

I've had the following patch in Poky to assist with this problem. It
would need to be rolled out over all .bb files with custom FILES
eventually but it has the advantage that can happen over time so the
question is more whether this is a good idea and whether the approach is
acceptable?

We would probably hit the same issue with windows .dll files and this
solution would solve that too.

Comments welcome...

Cheers,

Richard

#
# old_revision [5fb8cfe19138b98226fe92044d302c9379dad84d]
#
# patch "conf/bitbake.conf"
#  from [a605bd5d4d48054b72d21c74a922a9a0a2d12a76]
#    to [1655c26111af10134f07eafd1e29ef00d8cd8f5f]
#
============================================================
--- conf/bitbake.conf	a605bd5d4d48054b72d21c74a922a9a0a2d12a76
+++ conf/bitbake.conf	1655c26111af10134f07eafd1e29ef00d8cd8f5f
@@ -157,12 +157,17 @@ MULTI_PROVIDER_WHITELIST = "virtual/libi
 
 MULTI_PROVIDER_WHITELIST = "virtual/libintl"
 
+SOLIBS = ".so.*"
+SOLIBS_darwin = ".*.dylib"
+SOLIBSDEV = ".so"
+SOLIBSDEV_darwin = ".dylib"
+
 PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-dev ${PN}-locale"
 FILES = ""
 
-FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
+FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS} \
             ${sysconfdir} ${sharedstatedir} ${localstatedir} \
-            ${base_bindir}/* ${base_sbindir}/* ${base_libdir}/*.so* ${datadir}/${PN} ${libdir}/${PN}/* \
+            ${base_bindir}/* ${base_sbindir}/* ${base_libdir}/${SOLIBS} ${datadir}/${PN} ${libdir}/${PN}/* \
             ${datadir}/pixmaps ${datadir}/applications \
             ${datadir}/idl ${datadir}/omf ${datadir}/sounds \
             ${libdir}/bonobo/servers"
@@ -171,7 +176,7 @@ SECTION_${PN}-doc = "doc"
             ${datadir}/gnome/help"
 SECTION_${PN}-doc = "doc"
 
-FILES_${PN}-dev = "${includedir} ${libdir}/lib*.so ${libdir}/*.la \
+FILES_${PN}-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la \
                 ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig \
                 ${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal"
 SECTION_${PN}-dev = "devel"



