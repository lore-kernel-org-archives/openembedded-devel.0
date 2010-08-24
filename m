Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OnxFz-0007Wn-9t
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 19:26:05 +0200
Received: by yxk30 with SMTP id 30so2516143yxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Aug 2010 10:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=E+FwdnoN8J4wtZt1bbBSmO99nlFTvryJCi4ekqsIzgU=;
	b=qCGgPzdab+641/o1k9DDarE99cJGkH+lV1CiuCzLVgk9VHnDOPXUVcx8Vxn07OlJyI
	n54ScimTblUKI0v9yCNauFr8pqgaRJEzTYKc6d1tweI9w0WbkOhXKQWs+FcLBQW+7+V5
	xJHvbtzuP2QGmWXLxJo8zUoKOodYLJ18YYLVw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=BNDZs7c5K1u+UMdQgjVxLNUhnYdicVtlD6t3Tc31JvVp8qVsa1kpr+JLtiGEhsVqYV
	5U6qaArbkmFKYnStntwR3+2evNr+SRd15RIeRq949AJPj23Ux4S0agihhI6GtfPHGkPp
	eMe0Aip7cdjXjvP2/asJKh67hfMT7v8+qJkUw=
MIME-Version: 1.0
Received: by 10.151.106.3 with SMTP id i3mr7026636ybm.405.1282670721119; Tue,
	24 Aug 2010 10:25:21 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Tue, 24 Aug 2010 10:25:20 -0700 (PDT)
In-Reply-To: <1282645370-18251-1-git-send-email-noor_ahsan@mentor.com>
References: <1282645370-18251-1-git-send-email-noor_ahsan@mentor.com>
Date: Tue, 24 Aug 2010 19:25:20 +0200
Message-ID: <AANLkTi=tGdGRThHRtKPq8+Lz2a6VNfLhWcxCJSb+TF6q@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] uicmoc4-native: Convert to new style staging, Remove do_stage
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
X-List-Received-Date: Tue, 24 Aug 2010 17:26:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/24 Noor Ahsan <noor_ahsan@mentor.com>:
> * Convert do_stage to do_install in uicmoc4-native.inc
> * Replace ${STAGING_BINDIR} with ${D}{bindir} in inc file
> * Replace ${STAGING_DIR_NATIVE}/qt4/ with ${D}${datadir}/qt4/ in inc file=
 to install q3porting.xml in "share" directory
> * Bump INC_PR to "r2" in inc file
> * Remove some tabs with spaces in inc file
> * Remove do_stage from uicmoc4-native_4.4.3.bb
> * Bump PR to ${INC_PR}.1
> * Set NATIVE_INSTALL_WORKS =3D "1"
>
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> ---
> =A0recipes/uicmoc/uicmoc4-native.inc =A0 =A0 =A0| =A0 26 +++++++++++++---=
----------
> =A0recipes/uicmoc/uicmoc4-native_4.4.3.bb | =A0 17 +++--------------
> =A02 files changed, 16 insertions(+), 27 deletions(-)
>
> diff --git a/recipes/uicmoc/uicmoc4-native.inc b/recipes/uicmoc/uicmoc4-n=
ative.inc
> index ea6a469..2991c71 100644
> --- a/recipes/uicmoc/uicmoc4-native.inc
> +++ b/recipes/uicmoc/uicmoc4-native.inc
> @@ -4,7 +4,7 @@ SECTION =3D "libs"
> =A0HOMEPAGE =3D "http://www.trolltech.com"
> =A0PRIORITY =3D "optional"
> =A0LICENSE =3D "GPL"
> -INC_PR =3D "r1"
> +INC_PR =3D "r2"
>
> =A0SRC_URI =3D "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opens=
ource-src-${PV}.tar.bz2 \
> =A0 =A0 =A0 =A0 =A0 =A0file://configure-fix.patch"
> @@ -59,19 +59,19 @@ do_compile() {
> =A0 =A0 for i in ${TOBUILD2};
> =A0 =A0 do
> =A0 =A0 =A0 =A0 cd ${S}/$i && \
> - =A0 =A0 =A0 ${S}/bin/qmake -spec ${S}/mkspecs/linux-g++ =A0&& \
> - =A0 =A0 =A0 oe_runmake CC=3D"${CC}" CXX=3D"${CXX}"
> + =A0 =A0 =A0 =A0${S}/bin/qmake -spec ${S}/mkspecs/linux-g++ =A0&& \
> + =A0 =A0 =A0 =A0oe_runmake CC=3D"${CC}" CXX=3D"${CXX}"
> =A0 =A0 done
> =A0}
>
> -do_stage() {
> - =A0 =A0 =A0 install -d ${STAGING_BINDIR}/
> - =A0 =A0install -m 0755 bin/moc ${STAGING_BINDIR}/moc4
> - =A0 =A0install -m 0755 bin/uic ${STAGING_BINDIR}/uic4
> - =A0 =A0install -m 0755 bin/uic3 ${STAGING_BINDIR}/uic34
> - =A0 =A0install -m 0755 bin/rcc ${STAGING_BINDIR}/rcc4
> - =A0 =A0install -m 0755 bin/lrelease ${STAGING_BINDIR}/lrelease4
> - =A0 =A0install -m 0755 bin/lupdate ${STAGING_BINDIR}/lupdate4
> - =A0 =A0install -d ${STAGING_DIR_NATIVE}/qt4/
> - =A0 =A0install -m 0644 tools/porting/src/q3porting.xml ${STAGING_DIR_NA=
TIVE}/qt4/
> +do_install() {
> + =A0 =A0install -d ${D}${bindir}/
> + =A0 =A0install -m 0755 bin/moc ${D}${bindir}/moc4
> + =A0 =A0install -m 0755 bin/uic ${D}${bindir}/uic4
> + =A0 =A0install -m 0755 bin/uic3 ${D}${bindir}/uic34
> + =A0 =A0install -m 0755 bin/rcc ${D}${bindir}/rcc4
> + =A0 =A0install -m 0755 bin/lrelease ${D}${bindir}/lrelease4
> + =A0 =A0install -m 0755 bin/lupdate ${D}${bindir}/lupdate4
> + =A0 =A0install -d ${D}${datadir}/qt4/
> + =A0 =A0install -m 0644 tools/porting/src/q3porting.xml ${D}${datadir}/q=
t4/
> =A0}
> diff --git a/recipes/uicmoc/uicmoc4-native_4.4.3.bb b/recipes/uicmoc/uicm=
oc4-native_4.4.3.bb
> index 0ef53e1..fa98e25 100644
> --- a/recipes/uicmoc/uicmoc4-native_4.4.3.bb
> +++ b/recipes/uicmoc/uicmoc4-native_4.4.3.bb
> @@ -1,20 +1,9 @@
> -PR =3D ${INC_PR}.0
> +PR =3D ${INC_PR}.1
> =A0require uicmoc4-native.inc
>
> =A0inherit native
>
> -do_stage() {
> - =A0 =A0install -d ${STAGING_BINDIR}/
> - =A0 =A0install -m 0755 bin/moc ${STAGING_BINDIR}/moc4
> - =A0 =A0install -m 0755 bin/uic ${STAGING_BINDIR}/uic4
> - =A0 =A0install -m 0755 bin/uic3 ${STAGING_BINDIR}/uic34
> - =A0 =A0install -m 0755 bin/rcc ${STAGING_BINDIR}/rcc4
> - =A0 =A0install -m 0755 bin/lrelease ${STAGING_BINDIR}/lrelease4
> - =A0 =A0install -m 0755 bin/lupdate ${STAGING_BINDIR}/lupdate4
> - =A0 =A0install -d ${STAGING_DIR_NATIVE}/qt4/
> - =A0 =A0install -m 0644 tools/porting/src/q3porting.xml ${STAGING_DIR_NA=
TIVE}/qt4/
> -}
> -
> -
> =A0SRC_URI[md5sum] =3D "9a639aec44a1e4c70040117183d247a3"
> =A0SRC_URI[sha256sum] =3D "05d06b93f95092f1318634fca24f0c2d0a1252c9f1dc2f=
bb427b07e8ecbb4f39"
> +
> +NATIVE_INSTALL_WORKS =3D "1"
> --
> 1.6.3.3
>
Tried to compile this, and it failed:

| g++  -c -isystem/home/frans/oe/tmp_angstrom/sysroots/i686-linux/usr/inclu=
de
-O2 -g -fno-exceptions -O2 -fvisibility=3Dhidden
-fvisibility-inlines-hidden -Wall -W -D_REENTRANT
-DQT_BUILD_NETWORK_LIB -DQT_NO_USING_NAMESPACE -DQT_NO_CAST_TO_ASCII
-DQT_ASCII_CAST_WARNINGS -DQT3_SUPPORT -DQT_MOC_COMPAT -DQT_NO_DEBUG
-DQT_CORE_LIB -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE
-I../../mkspecs/qws/linux-x86-g++ -I. -I../../include/QtCore
-I../../include/QtCore -I../../include -I../../include/QtNetwork
-I.rcc/release-static-emb-x86 -Ikernel -I/usr/include
-I.moc/release-static-emb-x86 -I.uic/release-static-emb-x86 -o
.obj/release-static-emb-x86/qsslcipher.o ssl/qsslcipher.cpp
| In file included from ssl/qsslcertificate.cpp:116:
| ssl/qsslsocket_openssl_symbols_p.h:264: error: variable or field
'q_sk_free' declared void
| ssl/qsslsocket_openssl_symbols_p.h:264: error: 'STACK' was not
declared in this scope
| ssl/qsslsocket_openssl_symbols_p.h:264: error: 'a' was not declared
in this scope
| ssl/qsslsocket_openssl_symbols_p.h:265: error: 'STACK' was not
declared in this scope
| ssl/qsslsocket_openssl_symbols_p.h:265: error: 'a' was not declared
in this scope
| ssl/qsslsocket_openssl_symbols_p.h:266: error: 'STACK' was not
declared in this scope
| ssl/qsslsocket_openssl_symbols_p.h:266: error: 'a' was not declared
in this scope
| ssl/qsslsocket_openssl_symbols_p.h:266: error: expected
primary-expression before 'int'
| ssl/qsslsocket_openssl_symbols_p.h:266: error: initializer
expression list treated as compound expression
| g++  -c -isystem/home/frans/oe/tmp_angstrom/sysroots/i686-linux/usr/inclu=
de
-O2 -g -fno-exceptions -O2 -fvisibility=3Dhidden
-fvisibility-inlines-hidden -Wall -W -D_REENTRANT
-DQT_BUILD_NETWORK_LIB -DQT_NO_USING_NAMESPACE -DQT_NO_CAST_TO_ASCII
-DQT_ASCII_CAST_WARNINGS -DQT3_SUPPORT -DQT_MOC_COMPAT -DQT_NO_DEBUG
-DQT_CORE_LIB -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE
-I../../mkspecs/qws/linux-x86-g++ -I. -I../../include/QtCore
-I../../include/QtCore -I../../include -I../../include/QtNetwork
-I.rcc/release-static-emb-x86 -Ikernel -I/usr/include
-I.moc/release-static-emb-x86 -I.uic/release-static-emb-x86 -o
.obj/release-static-emb-x86/qsslerror.o ssl/qsslerror.cpp
| ssl/qsslcertificate.cpp: In member function
'QMultiMap<QSsl::AlternateNameEntryType, QString>
QSslCertificate::alternateSubjectNames() const':
| ssl/qsslcertificate.cpp:372: error: 'STACK' was not declared in this scop=
e
| ssl/qsslcertificate.cpp:372: error: 'altNames' was not declared in this s=
cope
| ssl/qsslcertificate.cpp:372: error: expected primary-expression
before ')' token
| ssl/qsslcertificate.cpp:372: error: expected ';' before 'q_X509_get_ext_d=
2i'
| ssl/qsslcertificate.cpp:393: error: 'q_sk_free' was not declared in this =
scope
| make: *** [.obj/release-static-emb-x86/qsslcertificate.o] Error 1

Apparently this is an issue of qt and
| make: *** Waiting for unfinished jobs....
| FATAL: oe_runmake failed
| ERROR: Function do_compile failed

Apparently this is a known issue with QT4.5 (and maybe later) and openssl
uicmoc4 uses qt 4.4.3 and apparently has the same issue.
I think we should move to a newer version of QT for this recipe, but I
have too little QT knowledge to fix this.
Also please someone advise if this patch can still be pushed. The
patch itself is ok, but the result is not building (as is the current
recipe).

Frans


