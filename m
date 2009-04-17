Received: from [212.27.42.2] (helo=smtp2-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1LucJs-0006Hb-0V
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Apr 2009 02:52:42 +0200
Received: from smtp2-g21.free.fr (localhost [127.0.0.1])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 049D94B0049
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Apr 2009 02:48:41 +0200 (CEST)
Received: from sharky.jerryweb.org (mna75-4-81-56-56-40.fbx.proxad.net
	[81.56.56.40])
	by smtp2-g21.free.fr (Postfix) with ESMTP id E07CF4B0028
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Apr 2009 02:48:38 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by sharky.jerryweb.org (Postfix) with ESMTP id EAF23184023
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Apr 2009 02:48:39 +0200 (CEST)
Message-ID: <49E7D1E7.9080604@bolloretelecom.eu>
Date: Fri, 17 Apr 2009 02:48:39 +0200
From: =?ISO-8859-1?Q?Jeremy_Lain=E9?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.8.1.19) Gecko/20090103 Lightning/0.8 Thunderbird/2.0.0.19
	Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 212.27.42.2
X-SA-Exim-Mail-From: jeremy.laine@bolloretelecom.eu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_NEUTRAL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] bitbake.conf: pick up correct shared libraries on darwin
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
X-List-Received-Date: Fri, 17 Apr 2009 00:52:42 -0000
Content-Type: multipart/mixed; boundary="------------020706010303070400010300"

--------------020706010303070400010300
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

The attached patch does the following:
* define SOLIBS and SOLIBSDEV for darwin9 (identical to darwin8)
* make use of SOLIBS and SOLIBSDEV to populate FILE_* instead of hardcode=
d .so.* and .so

--=20
Jeremy LAINE
Bollor=E9 telecom | 11bis, rue Scribe | F-75009 Paris

--------------020706010303070400010300
Content-Type: text/x-patch;
 name="solibs.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="solibs.patch"

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index f31e56d..e5073a1 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -199,19 +199,21 @@ MULTI_PROVIDER_WHITELIST = "virtual/libintl"
 SOLIBS = ".so.*"
 SOLIBS_darwin = ".*.dylib"
 SOLIBS_darwin8 = ".*.dylib"
+SOLIBS_darwin9 = ".*.dylib"
 
 SOLIBSDEV = ".so"
 SOLIBSDEV_darwin = ".dylib"
 SOLIBSDEV_darwin8 = ".dylib"
+SOLIBSDEV_darwin9 = ".dylib"
 
 PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-dev ${PN}-locale"
 #enable this when bitbake is upgraded to cope with ++ values in the field
 PACKAGES_DYNAMIC = "${PN}-locale-*"
 FILES = ""
 
-FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
+FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS} \
             ${sysconfdir} ${sharedstatedir} ${localstatedir} \
-            ${base_bindir}/* ${base_sbindir}/* ${base_libdir}/*.so* ${datadir}/${PN} ${libdir}/${PN}/* \
+            ${base_bindir}/* ${base_sbindir}/* ${base_libdir}/*${SOLIBS} ${datadir}/${PN} ${libdir}/${PN}/* \
             ${datadir}/pixmaps ${datadir}/applications \
             ${datadir}/idl ${datadir}/omf ${datadir}/sounds \
             ${libdir}/bonobo/servers"
@@ -220,7 +222,7 @@ FILES_${PN}-doc = "${docdir} ${mandir} ${infodir} ${datadir}/gtk-doc \
             ${datadir}/gnome/help"
 SECTION_${PN}-doc = "doc"
 
-FILES_${PN}-dev = "${includedir} ${libdir}/lib*.so ${libdir}/*.la \
+FILES_${PN}-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la \
                 ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig \
                 ${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal"
 SECTION_${PN}-dev = "devel"

--------------020706010303070400010300--
