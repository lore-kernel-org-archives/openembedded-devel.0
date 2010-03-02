Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NmHzQ-0004hC-Gx
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 03:37:44 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NmHwf-0006jV-LY from Tom_Rini@mentor.com ;
	Mon, 01 Mar 2010 18:34:49 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 1 Mar 2010 18:34:49 -0800
Received: from 172.30.80.137 ([172.30.80.137]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Tue,  2 Mar 2010 02:34:36 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	01 Mar 2010 19:34:35 -0700
From: Tom Rini <tom_rini@mentor.com>
To: oe-devel <openembedded-devel@lists.openembedded.org>
Organization: Mentor Graphics Corporation
Date: Mon, 01 Mar 2010 19:34:35 -0700
Message-ID: <1267497275.4739.292.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 02 Mar 2010 02:34:49.0302 (UTC)
	FILETIME=[EE11FF60:01CAB9B0]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=AWL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Add eglibc-pic, resync eglibc-dev with glibc
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
X-List-Received-Date: Tue, 02 Mar 2010 02:37:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

eglibc-package.bbclass: Add eglibc-pic, resync eglibc-dev with glibc

Resync what goes into eglibc-dev based on what we have in glibc-dev.
This includes zoneinfo and picking up the reset of the static libraries
(many are missed otherwise and static linking in SDKs fails).  We add in
a eglibc-pic package to catch all of the pic stuff (some of which would
otherwise be caught in -dev).

Will bump PRs when I push this.

Signed-off-by: Tom Rini <tom_rini@mentor.com>

diff --git a/recipes/eglibc/eglibc-package.bbclass
b/recipes/eglibc/eglibc-package.bbclass
index 3c33f93..9c660b4 100644
--- a/recipes/eglibc/eglibc-package.bbclass
+++ b/recipes/eglibc/eglibc-package.bbclass
@@ -29,11 +29,12 @@ BINARY_LOCALE_ARCHES ?=3D "arm.* i[3-6]86 x86_64
powerpc"
 # Set this to zero if you don't want ldconfig in the output package
 USE_LDCONFIG ?=3D "1"
=20
-PACKAGES =3D "eglibc-dbg eglibc catchsegv sln nscd ldd localedef
eglibc-utils eglibc-dev eglibc-doc eglibc-locale libsegfault
eglibc-extra-nss eglibc-thread-db eglibc-pcprofile"
+PACKAGES =3D "eglibc-dbg eglibc catchsegv sln nscd ldd localedef
eglibc-utils eglibc-pic eglibc-dev eglibc-doc eglibc-locale libcidn
libmemusage libsegfault eglibc-extra-nss eglibc-thread-db
eglibc-pcprofile"
 PACKAGES_DYNAMIC =3D "glibc-gconv-* glibc-charmap-* glibc-localedata-*
glibc-binary-localedata-* eglibc-gconv-* eglibc-charmap-*
eglibc-localedata-* eglibc-binary-localedata-* locale-base-*"
=20
 RPROVIDES_eglibc =3D "glibc"
 RPROVIDES_eglibc-utils =3D "glibc-utils"
+RPROVIDES_eglibc-pic =3D "glibc-pic"
 RPROVIDES_eglibc-dev =3D "glibc-dev"
 RPROVIDES_eglibc-doc =3D "glibc-doc"
 RPROVIDES_eglibc-locale =3D "glibc-locale"
@@ -43,12 +44,16 @@ RPROVIDES_eglibc-pcprofile =3D "glibc-pcprofile"
 RPROVIDES_eglibc-dbg =3D "glibc-dbg"
 libc_baselibs =3D "${base_libdir}/libcrypt*.so.*
${base_libdir}/libcrypt-*.so ${base_libdir}/libc*.so.*
${base_libdir}/libc*.so ${base_libdir}/libm*.so.*
${base_libdir}/libm-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so
${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so
${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so
${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so
${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so
${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so
${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so
${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so
${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so
${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so
${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so
${base_libdir}/libBrokenLocale*.so.*
${base_libdir}/libBrokenLocale-*.so"
=20
-FILES_${PN} =3D "${libc_baselibs} ${libexecdir}/*
${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig', '',
d)}"
+FILES_${PN} =3D "${libc_baselibs} ${libexecdir}/* ${datadir}/zoneinfo
${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig', '',
d)}"
 FILES_ldd =3D "${bindir}/ldd"
 FILES_libsegfault =3D "${base_libdir}/libSegFault*"
+FILES_libcidn =3D "${base_libdir}/libcidn*.so"
+FILES_libmemusage =3D "${base_libdir}/libmemusage.so"
 FILES_eglibc-extra-nss =3D "${base_libdir}/libnss*"
 FILES_sln =3D "/sbin/sln"
-FILES_eglibc-dev_append =3D " ${libdir}/*.o ${bindir}/rpcgen
${libdir}/libc_nonshared.a ${libdir}/libpthread_nonshared.a"
+FILES_eglibc-pic =3D "${libdir}/*_pic.a ${libdir}/*_pic.map
${libdir}/libc_pic/"
+FILES_eglibc-dev_append +=3D "${bindir}/rpcgen ${libdir}/*.a \
+	${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal"
 FILES_nscd =3D "${sbindir}/nscd*"
 FILES_eglibc-utils =3D "${bindir}/* ${sbindir}/*"
 FILES_eglibc-gconv =3D "${libdir}/gconv/*"
@@ -95,7 +100,6 @@ do_install() {
 		mv ${WORKDIR}/SUPPORTED.tmp ${WORKDIR}/SUPPORTED
 	done
 	rm -f ${D}/etc/rpc
-	rm -rf ${D}${datadir}/zoneinfo
 	rm -rf ${D}${libexecdir}/getconf
 }
=20


--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


