Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NmHzR-0004hD-1d
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 03:37:45 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NmHwf-0006ja-SO from Tom_Rini@mentor.com ;
	Mon, 01 Mar 2010 18:34:49 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 1 Mar 2010 18:34:49 -0800
Received: from 172.30.80.137 ([172.30.80.137]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Tue,  2 Mar 2010 02:34:38 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	01 Mar 2010 19:34:37 -0700
From: Tom Rini <tom_rini@mentor.com>
To: oe-devel <openembedded-devel@lists.openembedded.org>
Organization: Mentor Graphics Corporation
Date: Mon, 01 Mar 2010 19:34:37 -0700
Message-ID: <1267497277.4739.293.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 02 Mar 2010 02:34:49.0521 (UTC)
	FILETIME=[EE336A10:01CAB9B0]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=AWL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Add glibc-pic package
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
X-List-Received-Date: Tue, 02 Mar 2010 02:37:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

glibc-package.bbclass:  Add glibc-pic package

By default, in our glibc builds we don't have these libraries.  They may
however come from various binary toolchains, or custom source builds.

Signed-off-by: Tom Rini <tom_rini@mentor.com>

diff --git a/classes/glibc-package.bbclass
b/classes/glibc-package.bbclass
index 413ed14..af75bb5 100644
--- a/classes/glibc-package.bbclass
+++ b/classes/glibc-package.bbclass
@@ -9,7 +9,7 @@
=20
 GLIBC_INTERNAL_USE_BINARY_LOCALE ?=3D "ondevice"
=20
-PACKAGES =3D "glibc-dbg glibc catchsegv sln nscd ldd localedef
glibc-utils glibc-dev glibc-static glibc-doc glibc-locale libcidn
libmemusage libsegfault glibc-extra-nss glibc-thread-db glibc-pcprofile"
+PACKAGES =3D "glibc-dbg glibc catchsegv sln nscd ldd localedef
glibc-utils glibc-pic glibc-dev glibc-static glibc-doc glibc-locale
libcidn libmemusage libsegfault glibc-extra-nss glibc-thread-db
glibc-pcprofile"
 PACKAGES_DYNAMIC =3D "glibc-gconv-* glibc-charmap-* glibc-localedata-*
locale-base-* glibc-binary-localedata-*"
=20
 INSANE_SKIP_glibc-dbg =3D True
@@ -23,6 +23,7 @@ glibcfiles =3D "${libc_baselibs} ${libexecdir}/*
${datadir}/zoneinfo ${@base_condi
 glibcdbgfiles =3D "${bindir}/.debug ${sbindir}/.debug ${libdir}/.debug \
                   ${base_bindir}/.debug ${base_sbindir}/.debug
${base_libdir}/.debug \
                   ${libdir}/gconv/.debug ${libexecdir}/*/.debug"
+glibcpicfiles =3D "${libdir}/*_pic.a ${libdir}/*_pic.map
${libdir}/libc_pic/"
 glibcdevfiles =3D "${bindir}/rpcgen ${includedir} ${libdir}/lib*
${SOLIBSDEV} ${libdir}/*.la \
                 ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig
${libdir}/*nonshared.a \
                 ${base_libdir}/*.a ${base_libdir}/*.o
${datadir}/aclocal"
@@ -35,6 +36,8 @@ FILES_libcidn =3D "${base_libdir}/libcidn*.so"
 FILES_libmemusage =3D "${base_libdir}/libmemusage.so"
 FILES_glibc-extra-nss =3D "${base_libdir}/libnss*"
 FILES_sln =3D "${base_sbindir}/sln"
+FILES_glibc-pic =3D "${glibcpicfiles}"
+FILES_${PN}-pic =3D "${glibcpicfiles}"
 FILES_glibc-dev =3D "${glibcdevfiles}"
 FILES_${PN}-dev =3D "${glibcdevfiles}"
 FILES_glibc-dbg =3D "${glibcdbgfiles}"


--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


