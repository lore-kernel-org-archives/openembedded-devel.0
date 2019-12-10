Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
	[209.85.222.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9FC476C1F6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 23:41:49 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id d202so18111412qkb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 15:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=eGEEgQVNgXgg8AeiTiii2glnORQLSztTfdHcbk4QWfU=;
	b=aULka+gRfOTuJyouN9DR8Nzk3fs3yBj3hPLUrNP90g9u0M+lIt+gIGiZSoK3ZxeXRU
	RLu9FBMHi+WC1TJ5+1kxbeMd3PWC91cXPo7/i1LXMLimCqvKllUiwcUo4o4zcmDo9hEf
	si64/tpYuQC+0WtsiEl1uleBJXbVjtafyhZ+8HP+yjNdz22aAwYnJZsOn6SdxDnGMN8t
	p/BjqCEIRY2/MDRqt+9ZBgaQ8i8hTPwoCN7qEbwAb7yyxstCa0fesS8Oh0q0LfUdBRIr
	hjbzDwgFap1Hy8RH4vONSVYzycAN5tHwrBuIMozu2xooojLAVb1h19C2xNH66rxjbZtd
	07zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=eGEEgQVNgXgg8AeiTiii2glnORQLSztTfdHcbk4QWfU=;
	b=UnknXljw+jWa4uvw1TrzyKd9ZkqT1SEuz4Mxo4PioT2gYam6lxejPLWSkw0S/RPbZF
	eb5Ql/huMnsC7pejbR1xA8jyNGx7YrWv0oNSgC3nC8RmgFO4VGgANGokLaKSJj/hdJNY
	pcc7NybJP+xdwZdtGK3UC080xCHDsb4ppE308+W9D6hqVzGLrDa2cDspyiiBneBKQWoL
	8/H0tPJ7mS0IU1f4fE2Yq4EEXJ45AT+bdD3Ci/xPvjhnAV5sxZEVTsvDgifGBk3cbndY
	x8mNOpFdeOWXErCeLVwh3AbAAOBm5m9oBxxcepIhCQp6ofBnVUVG7G5BWW/3q1lt7n4C
	MJdA==
X-Gm-Message-State: APjAAAWa3+wC1i4ID2IJlvifsgvz7Dr9E1KQ9CXjjGIi6IEsZvYiyFd+
	MGIHeQaS9uvjuXDD8eQFSwZGN0FyrL6H2drZ0MM=
X-Google-Smtp-Source: APXvYqxIr25jN3KYLPmNBUI1d+E8ByiQ+eOxBpoK2v+R40/JlTr1340M1jtqwZZYYmoRG0avpjJTW3fqBQo/TFB9la0=
X-Received: by 2002:a37:de05:: with SMTP id h5mr337693qkj.474.1576021310139;
	Tue, 10 Dec 2019 15:41:50 -0800 (PST)
MIME-Version: 1.0
References: <20191209083612.23922-1-schnitzeltony@gmail.com>
	<20191209083612.23922-2-schnitzeltony@gmail.com>
	<CAMKF1so_FSMQ3xqvK95hFz6gP8MBwELM=eCg9WHgaLn_gd9eiQ@mail.gmail.com>
	<CALbNGRQhh2=8cE27=vxTVKsMNO5qUoNFWuQGFensm5NoRWTeoA@mail.gmail.com>
In-Reply-To: <CALbNGRQhh2=8cE27=vxTVKsMNO5qUoNFWuQGFensm5NoRWTeoA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Dec 2019 15:41:23 -0800
Message-ID: <CAMKF1sorUwwEtMRL++aWEfxNahr1Q46L9hv_XAxpR-=WdTCQNQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][v3 01/20] gjs: initial add 1.58.3
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
X-List-Received-Date: Tue, 10 Dec 2019 23:41:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2019 at 2:13 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Tue, Dec 10, 2019 at 8:59 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Mon, Dec 9, 2019 at 12:36 AM Andreas M=C3=BCller <schnitzeltony@gmai=
l.com> wrote:
> > >
> > > * it is a dependency for upcoming gnome shell
> > > * this is the latest stable version currently [1]
> > >
> > > [1] http://ftp.gnome.org/pub/gnome/sources/gjs/1.63/gjs-1.63.1.news
> > >
> >
> > Managed to crash qemu on mips, that said it might be fine to mark this
> > incompatible with mips
> > since there might be fewer users needing it on mips arch
>
> So upgrade to 1.58.3 did not solve (did not really expect it).
>
> Shall I disable both? As
>
> COMPATIBLE_HOST_mipsarchn32 =3D "null"
> COMPATIBLE_HOST_mipsarchn64 =3D "null"
>

you could do for all mips arches with

COMPATIBLE_HOST_mipsarch =3D "null"

I dont know how ppc/riscv will turn out but we can keep adding
more disabling code like this as we see it.

> Andreas
>
> >
> > https://errors.yoctoproject.org/Errors/Details/296905/
> >
> > > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > > ---
> > >  .../gjs/gjs/0001-Disable-tests-on-host.patch  | 33 +++++++++++++++++
> > >  meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb    | 37 +++++++++++++++++=
++
> > >  2 files changed, 70 insertions(+)
> > >  create mode 100644 meta-gnome/recipes-gnome/gjs/gjs/0001-Disable-tes=
ts-on-host.patch
> > >  create mode 100644 meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb
> > >
> > > diff --git a/meta-gnome/recipes-gnome/gjs/gjs/0001-Disable-tests-on-h=
ost.patch b/meta-gnome/recipes-gnome/gjs/gjs/0001-Disable-tests-on-host.pat=
ch
> > > new file mode 100644
> > > index 000000000..0953214fb
> > > --- /dev/null
> > > +++ b/meta-gnome/recipes-gnome/gjs/gjs/0001-Disable-tests-on-host.pat=
ch
> > > @@ -0,0 +1,33 @@
> > > +From 95379de2132786f855e8caec1fd5869225774d02 Mon Sep 17 00:00:00 20=
01
> > > +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gma=
il.com>
> > > +Date: Sat, 18 May 2019 01:14:07 +0200
> > > +Subject: [PATCH] Disable tests on host
> > > +MIME-Version: 1.0
> > > +Content-Type: text/plain; charset=3DUTF-8
> > > +Content-Transfer-Encoding: 8bit
> > > +
> > > +Upstream-Status: Inappropriate [OE-specific]
> > > +
> > > +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > > +---
> > > + configure.ac | 4 +---
> > > + 1 file changed, 1 insertion(+), 3 deletions(-)
> > > +
> > > +diff --git a/configure.ac b/configure.ac
> > > +index fa4e136..056e96e 100644
> > > +--- a/configure.ac
> > > ++++ b/configure.ac
> > > +@@ -335,9 +335,7 @@ AS_IF([test "x$with_dbus_tests" !=3D "xno"], [
> > > + ])
> > > + AM_CONDITIONAL([DBUS_TESTS], [test "x$with_dbus_tests" !=3D "xno"])
> > > +
> > > +-AC_MSG_CHECKING([for a suitable UTF-8 locale to run the tests in])
> > > +-TESTS_LOCALE=3D$($srcdir/build/choose-tests-locale.sh)
> > > +-AC_MSG_RESULT([$TESTS_LOCALE])
> > > ++TESTS_LOCALE=3DC
> > > + AC_SUBST([TESTS_LOCALE])
> > > +
> > > + AC_SUBST([gjsjsdir], [\${datadir}/gjs-1.0])
> > > +--
> > > +2.20.1
> > > +
> > > diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb b/meta-gnome/=
recipes-gnome/gjs/gjs_1.58.3.bb
> > > new file mode 100644
> > > index 000000000..ddd5196b2
> > > --- /dev/null
> > > +++ b/meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb
> > > @@ -0,0 +1,37 @@
> > > +SUMMARY =3D "Javascript bindings for GNOME"
> > > +LICENSE =3D "MIT & LGPLv2+"
> > > +LIC_FILES_CHKSUM =3D " \
> > > +    file://COPYING;md5=3Dbeb29cf17fabe736f0639b09ee6e76fa \
> > > +    file://COPYING.LGPL;md5=3D3bf50002aefd002f49e7bb854063f7e7 \
> > > +"
> > > +
> > > +GNOMEBASEBUILDCLASS =3D "autotools"
> > > +
> > > +DEPENDS =3D "mozjs gtk+3"
> > > +
> > > +inherit gnomebase gsettings gobject-introspection vala gettext featu=
res_check upstream-version-is-even
> > > +
> > > +SRC_URI[archive.md5sum] =3D "bce6dea9a6583a8b3c6af5854df76aaf"
> > > +SRC_URI[archive.sha256sum] =3D "ca9fcd47b95ab0fc445301b2595e51fcea24=
d6f3cd87c190fe07006146d773ae"
> > > +SRC_URI +=3D "file://0001-Disable-tests-on-host.patch"
> > > +
> > > +# gobject-introspection is mandatory and cannot be configured
> > > +REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
> > > +UNKNOWN_CONFIGURE_WHITELIST_append =3D " --enable-introspection --di=
sable-introspection"
> > > +
> > > +EXTRA_OECONF =3D " \
> > > +    --without-dbus-tests \
> > > +    --disable-installed-tests \
> > > +"
> > > +
> > > +do_configure_prepend() {
> > > +    # make configure find gobject-introspection test code. Although =
we set
> > > +    # --disable-installed-tests gjs builds them
> > > +    sed -i 's|:$GI_DATADIR|:${STAGING_DIR_NATIVE}$GI_DATADIR|g' ${S}=
/configure.ac
> > > +}
> > > +
> > > +FILES_${PN} +=3D "${datadir}/gjs-1.0/lsan"
> > > +
> > > +PACKAGES =3D+ "${PN}-valgrind"
> > > +FILES_${PN}-valgrind =3D "${datadir}/gjs-1.0/valgrind"
> > > +RSEPENDS_${PN}-valgrind +=3D "valgrind"
> > > --
> > > 2.21.0
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

