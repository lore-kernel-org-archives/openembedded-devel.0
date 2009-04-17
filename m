Received: from [212.27.42.1] (helo=smtp1-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1LucoG-0003ea-Mo
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Apr 2009 03:24:07 +0200
Received: from smtp1-g21.free.fr (localhost [127.0.0.1])
	by smtp1-g21.free.fr (Postfix) with ESMTP id 8C508940048
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Apr 2009 03:20:05 +0200 (CEST)
Received: from sharky.jerryweb.org (mna75-4-81-56-56-40.fbx.proxad.net
	[81.56.56.40])
	by smtp1-g21.free.fr (Postfix) with ESMTP id 79F5A940034
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Apr 2009 03:20:03 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by sharky.jerryweb.org (Postfix) with ESMTP id B48A6184023
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Apr 2009 03:20:04 +0200 (CEST)
Message-ID: <49E7D944.2080201@bolloretelecom.eu>
Date: Fri, 17 Apr 2009 03:20:04 +0200
From: =?ISO-8859-1?Q?Jeremy_Lain=E9?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.8.1.19) Gecko/20090103 Lightning/0.8 Thunderbird/2.0.0.19
	Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49E7D1E7.9080604@bolloretelecom.eu>
In-Reply-To: <49E7D1E7.9080604@bolloretelecom.eu>
X-SA-Exim-Connect-IP: 212.27.42.1
X-SA-Exim-Mail-From: jeremy.laine@bolloretelecom.eu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_NEUTRAL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] bitbake.conf: pick up correct shared libraries on darwin
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
X-List-Received-Date: Fri, 17 Apr 2009 01:24:07 -0000
Content-Type: multipart/mixed; boundary="------------060406070901020005040402"

--------------060406070901020005040402
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Attached is a similar patch for lib_package.bbclass.

Note: was /lib purposefully hard-coded? I changed it to ${base_libdir} wh=
ich seemed more
correct. Comments?

Cheers,
--=20
Jeremy LAINE
Bollor=E9 telecom | 11bis, rue Scribe | F-75009 Paris

--------------060406070901020005040402
Content-Type: text/x-patch;
 name="lib_package.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="lib_package.patch"

diff --git a/classes/lib_package.bbclass b/classes/lib_package.bbclass
index 9a48408..03ba9d0 100644
--- a/classes/lib_package.bbclass
+++ b/classes/lib_package.bbclass
@@ -1,9 +1,9 @@
 PACKAGES += "${PN}-bin"
 
-FILES_${PN} = "${libexecdir} ${libdir}/lib*.so.* \
+FILES_${PN} = "${libexecdir} ${libdir}/lib*${SOLIBS} \
 	    ${sysconfdir} ${sharedstatedir} ${localstatedir} \
-	    /lib/*.so* ${datadir}/${PN} ${libdir}/${PN}"
-FILES_${PN}-dev = "${includedir} ${libdir}/lib*.so ${libdir}/*.la \
+	    ${base_libdir}/*${SOLIBS} ${datadir}/${PN} ${libdir}/${PN}"
+FILES_${PN}-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la \
 		${libdir}/*.a ${libdir}/pkgconfig /lib/*.a /lib/*.o \
 		${datadir}/aclocal ${bindir}/*-config"
 FILES_${PN}-bin = "${bindir}/* ${sbindir}/* /bin/* /sbin/*"

--------------060406070901020005040402--
