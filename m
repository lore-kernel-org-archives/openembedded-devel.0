Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id F3D1B77CF8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 22:44:36 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id e199so16279153pfh.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 15:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=FTm4CGYjuGYq4JK/GnSt+uwwPxBlgxHHiYteOuY+Bkg=;
	b=Zgi7wPMcl/2EMCnmUY37Fml477IOM/RfWUEHtIQJX79LR0LUGgYWLstBEOiXzEHskc
	AgTKT+7cJ//Yk9IisRExzuGXuzyh1ZF39E3s6rNwP44eJW08WOZ+JygH2GCzUh6ZkvLy
	Yj37Ofenum5tct/O5/4WEn/GsVWJyt7CAHppvoogZJ86koZkazvdx68W82FLww76BHBm
	OfOkJnAK6l8xJXYLX1PiZWJTQ8HCaWIwAK+lFqHhqYWSs35vq9ZTtcaWO+W8Oq3OUOSq
	NCyUXQFMxYgtspPXQfrt9bwU5VOxPfDMtz04g/UY2dxkHTIQOHnkAEJhmbQJ/U/I3N8R
	apWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=FTm4CGYjuGYq4JK/GnSt+uwwPxBlgxHHiYteOuY+Bkg=;
	b=DV/aJwI6uConFM1hme9+os+72OdBFP7BMma60kBjbGcYFUsDWjXVVDXfton7mzxcfC
	noGAjYClEReQB40i4xIYKzYlmRx3yvQsXGJB1FEtJTJd6JSwbKeJBhju0dsrF7hJvE9q
	eC/qq2iuIN5UEPPvO2q1kAp0H7uBwN4qQbVcttj3Yp65DoTYH8f8ngy+oYdb0aO7a6bM
	XR3Bnr/coEgA2V+ScAqH1/+OXdO9SU9HRkYjq5gdECn44hjO8HVhmc8/88IJWfXQIwhE
	VtYzO8M1MSf9SCx3MMnpMgm4yuu+V4hilU5H3AxO0VsxWZamoOoague2gHLegnp7tP4p
	g1FQ==
X-Gm-Message-State: AIVw110zAzzNMPaZttbCX9R7bOtHDJAwe96nBv2qjfIaq1UOjaUHzILc
	WY2g6p70SuLENNYXTwc=
X-Received: by 10.99.137.66 with SMTP id v63mr16728926pgd.182.1499726677517;
	Mon, 10 Jul 2017 15:44:37 -0700 (PDT)
Received: from Khems-MacBook-Pro.local
	([2601:646:8882:b8c:352a:619c:ce9e:b9b7])
	by smtp.gmail.com with ESMTPSA id
	r207sm26298791pfr.106.2017.07.10.15.44.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Jul 2017 15:44:36 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>
References: <20170708131744.33927-1-raj.khem@gmail.com>
	<CA+chaQfBTpaih-w2eUoZJsnOyUc6FoM8EAJYYXxue+bSLAM93g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <aa9ed10b-1a98-c3c5-5ba2-f2166a0e6ea2@gmail.com>
Date: Mon, 10 Jul 2017 15:44:30 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:54.0)
	Gecko/20100101 Thunderbird/54.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQfBTpaih-w2eUoZJsnOyUc6FoM8EAJYYXxue+bSLAM93g@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/5] libdbus-c++: Fix build with gcc7 and unblacklist
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Jul 2017 22:44:37 -0000
X-Groupsio-MsgNum: 67547
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="FWn7NDnC4w5LgdsXBboFCsKR97ICQl2Et"

--FWn7NDnC4w5LgdsXBboFCsKR97ICQl2Et
Content-Type: multipart/mixed; boundary="83ITQ38QjhmhmOUdhuVTxxnxGbFjNOpgB";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <aa9ed10b-1a98-c3c5-5ba2-f2166a0e6ea2@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/5] libdbus-c++: Fix build with gcc7 and
 unblacklist
References: <20170708131744.33927-1-raj.khem@gmail.com>
 <CA+chaQfBTpaih-w2eUoZJsnOyUc6FoM8EAJYYXxue+bSLAM93g@mail.gmail.com>
In-Reply-To: <CA+chaQfBTpaih-w2eUoZJsnOyUc6FoM8EAJYYXxue+bSLAM93g@mail.gmail.com>

--83ITQ38QjhmhmOUdhuVTxxnxGbFjNOpgB
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 7/10/17 3:18 AM, Martin Jansa wrote:
> Unfortunately still fails:
> http://errors.yoctoproject.org/Errors/Details/147042/
>=20

hmmm, i dont see it locally, I do not use gold linker as default ld. It
looks like you do. Its most probably thats the difference. In anycase
adding -pthread to LDFLAGS should fix it. Let me try it out and update
the patch

> On Sat, Jul 8, 2017 at 3:17 PM, Khem Raj <raj.khem@gmail.com
> <mailto:raj.khem@gmail.com>> wrote:
>=20
>     Signed-off-by: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.=
com>>
>     ---
>      .../0001-pipe.c-Use-a-string-instead-of-char.patch | 27
>     ++++++++++++++++++++++
>      meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb <http://0.9.0.bb>  =
=20
>      | 20 ++++++++--------
>      2 files changed, 36 insertions(+), 11 deletions(-)
>      create mode 100644
>     meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0001-pipe.c-Use-a-strin=
g-instead-of-char.patch
>=20
>     diff --git
>     a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0001-pipe.c-Use-a-str=
ing-instead-of-char.patch
>     b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0001-pipe.c-Use-a-str=
ing-instead-of-char.patch
>     new file mode 100644
>     index 000000000..6883f9a0b
>     --- /dev/null
>     +++
>     b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0001-pipe.c-Use-a-str=
ing-instead-of-char.patch
>     @@ -0,0 +1,27 @@
>     +From 6bcb58bd69c38b9200e8ec6c382247167571189d Mon Sep 17 00:00:00 =
2001
>     +From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>     +Date: Sat, 1 Jul 2017 16:44:15 -0700
>     +Subject: [PATCH] pipe.c: Use a string instead of char
>     +
>     +Fixes
>     +error: invalid conversion from 'char' to 'const void*' [-fpermissi=
ve]
>     +
>     +Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     +---
>     + src/pipe.cpp | 2 +-
>     + 1 file changed, 1 insertion(+), 1 deletion(-)
>     +
>     +diff --git a/src/pipe.cpp b/src/pipe.cpp
>     +index 45c2ba6..1303c2d 100644
>     +--- a/src/pipe.cpp
>     ++++ b/src/pipe.cpp
>     +@@ -83,5 +83,5 @@ ssize_t Pipe::read(void *buffer, unsigned int
>     &nbytes)
>     + void Pipe::signal()
>     + {
>     +   // TODO: ignoring return of read/write generates warning; maybe=

>     relevant for eventloop work...
>     +-  ::write(_fd_write, '\0', 1);
>     ++  ::write(_fd_write, "", 1);
>     + }
>     +--
>     +2.13.2
>     +
>     diff --git a/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb
>     <http://0.9.0.bb> b/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb
>     <http://0.9.0.bb>
>     index 4412716a6..4cc133301 100644
>     --- a/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb <http://0.9.0.=
bb>
>     +++ b/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb <http://0.9.0.=
bb>
>     @@ -6,15 +6,15 @@ LICENSE =3D "LGPLv2.1"
>      LIC_FILES_CHKSUM =3D
>     "file://COPYING;md5=3Dfbc093901857fcd118f065f900982c24"
>      DEPENDS =3D "dbus expat glib-2.0 libpcre"
>=20
>     -SRC_URI =3D "\
>     -  =20
>     ${SOURCEFORGE_MIRROR}/project/dbus-cplusplus/dbus-c++/${PV}/${BP}.t=
ar.gz
>     \
>     -    file://fix-missing-unistd.h-include.patch \
>     -    file://remove-CXX_FOR_BUILD-stuff.patch \
>     -  =20
>     file://0001-src-eventloop.cpp-use-portable-method-for-initializi.pa=
tch \
>     -  =20
>     file://0002-tools-generate_proxy.cpp-avoid-possibly-undefined-ui.pa=
tch \
>     -  =20
>     file://0003-Fixed-undefined-ssize_t-for-clang-3.8.0-on-FreeBSD.patc=
h \
>     -    file://0004-use-POSIX-poll.h-instead-of-sys-poll.h.patch \
>     -"
>     +SRC_URI =3D
>     "${SOURCEFORGE_MIRROR}/project/dbus-cplusplus/dbus-c++/${PV}/${BP}.=
tar.gz
>     \
>     +           file://fix-missing-unistd.h-include.patch \
>     +           file://remove-CXX_FOR_BUILD-stuff.patch \
>     +        =20
>      file://0001-src-eventloop.cpp-use-portable-method-for-initializi.p=
atch
>     \
>     +        =20
>      file://0002-tools-generate_proxy.cpp-avoid-possibly-undefined-ui.p=
atch
>     \
>     +        =20
>      file://0003-Fixed-undefined-ssize_t-for-clang-3.8.0-on-FreeBSD.pat=
ch \
>     +           file://0004-use-POSIX-poll.h-instead-of-sys-poll.h.patc=
h \
>     +           file://0001-pipe.c-Use-a-string-instead-of-char.patch \=

>     +           "
>      SRC_URI[md5sum] =3D "e752116f523fa88ef041e63d3dee4de2"
>      SRC_URI[sha256sum] =3D
>     "bc11ac297b3cb010be904c72789695543ee3fdf3d75cdc8225fd371385af4e61"
>=20
>     @@ -27,5 +27,3 @@ PACKAGE_BEFORE_PN =3D "${PN}-tools"
>      FILES_${PN}-tools =3D "${bindir}"
>=20
>      BBCLASSEXTEND =3D "native"
>     -
>     -PNBLACKLIST[libdbus-c++] ?=3D "Fails to build with RSS
>     http://errors.yoctoproject.org/Errors/Details/130644/
>     <http://errors.yoctoproject.org/Errors/Details/130644/> - the recip=
e
>     will be removed on 2017-09-01 unless the issue is fixed"
>     --
>     2.13.2
>=20
>     --
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>=

>=20
>=20


--83ITQ38QjhmhmOUdhuVTxxnxGbFjNOpgB--

--FWn7NDnC4w5LgdsXBboFCsKR97ICQl2Et
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAllkA1MACgkQuwUzVZGdMxSFLgCgg9tC/jgiGN/ZU4vf7xXtIwFu
ehAAn3iXldQ2EL8kAszKgGfDbBbDTb9q
=i6Vu
-----END PGP SIGNATURE-----

--FWn7NDnC4w5LgdsXBboFCsKR97ICQl2Et--
