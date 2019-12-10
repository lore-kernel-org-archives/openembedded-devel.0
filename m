Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
	[209.85.166.42])
	by mail.openembedded.org (Postfix) with ESMTP id 148727FC09
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 22:13:28 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id a22so5558210ios.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 14:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=wWZTLMNutBA9+ZbUWEV9wiKZNE3E2KRb+OC8ELmLH/w=;
	b=mZBf+zWQoFFLN6sC5du5uRIotC74rbt2fKbCps8gbL9kxuHTD9exOZ+Hf3Jaw8q1xQ
	x2mMmGDgWLhKVdDYX6hb/0O7Jvt3Hex9w12LLjWZvIyrYdp9bO6rS7M1Zk4iMZ+aocnU
	WgtPOiiLzv15J9MdZxliNDqSsfOYJsOple8EkAq2Bn1OuGY03YFKNX+ZhVQXWnO7E5+R
	ujI6xpTQ50yYA2iAdzhZeBzOK77goQqLBENHMWq+vpjpH5LIcZVfCJOFHOiMDgHaL1Z/
	kFGPRaHB1amrCIsVJPw6UzO4kxkol1sAVZ0SDvpjickTUgAz3abItYOdp1SqDmsRieb3
	qrQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=wWZTLMNutBA9+ZbUWEV9wiKZNE3E2KRb+OC8ELmLH/w=;
	b=N3Yy5AbhmilENjWhE8d3RynGVF0ZuKwhAYk/kFg3LjAXdt0p1ExP6qbVI87owInhma
	LLfULFvblgmvTO82bhw33zp/f2g+F1izyvwxhG6v5Ltq0Otc+PZRDlOw4efshlU41AI2
	u8SPHU2U44r1EInHp/6SAjCLABA9Iz7wXEVq2SUOEznG/WU0b4LDV2zFCKq9ATgNsL+9
	/k6S3KvPbi/Zf8pBSpJqnYYaYReueVOsjC1jzuYqLYSDW54/ccWhQsQbtWE5M1vxc4a4
	bb+5XOAXX+LcF/3JQAHcRAS/CirDcSU4JDOV0z8vupL2WsvW3BMcawZgNXH/IoqJwLXI
	1cPA==
X-Gm-Message-State: APjAAAVfj2FMQkr+fu+I0KwTYjY9JNorA3eTIDE2WqPl/WikumTZwYJT
	qdg0TCp05I7C8I5QbHyqapnSPAqnxDF0dJWXGUI=
X-Google-Smtp-Source: APXvYqwa0QvqMN1uu8SxTTXlLaz+MYk68ktJVu/rr3wJ7+fYiQzvYbF5+JoTOul2Ck6UEua9bG4WreaNRY94kUfhouA=
X-Received: by 2002:a05:6638:151:: with SMTP id
	y17mr40268jao.124.1576016009893; 
	Tue, 10 Dec 2019 14:13:29 -0800 (PST)
MIME-Version: 1.0
References: <20191209083612.23922-1-schnitzeltony@gmail.com>
	<20191209083612.23922-2-schnitzeltony@gmail.com>
	<CAMKF1so_FSMQ3xqvK95hFz6gP8MBwELM=eCg9WHgaLn_gd9eiQ@mail.gmail.com>
In-Reply-To: <CAMKF1so_FSMQ3xqvK95hFz6gP8MBwELM=eCg9WHgaLn_gd9eiQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 10 Dec 2019 23:13:18 +0100
Message-ID: <CALbNGRQhh2=8cE27=vxTVKsMNO5qUoNFWuQGFensm5NoRWTeoA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Tue, 10 Dec 2019 22:13:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2019 at 8:59 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Dec 9, 2019 at 12:36 AM Andreas M=C3=BCller <schnitzeltony@gmail.=
com> wrote:
> >
> > * it is a dependency for upcoming gnome shell
> > * this is the latest stable version currently [1]
> >
> > [1] http://ftp.gnome.org/pub/gnome/sources/gjs/1.63/gjs-1.63.1.news
> >
>
> Managed to crash qemu on mips, that said it might be fine to mark this
> incompatible with mips
> since there might be fewer users needing it on mips arch

So upgrade to 1.58.3 did not solve (did not really expect it).

Shall I disable both? As

COMPATIBLE_HOST_mipsarchn32 =3D "null"
COMPATIBLE_HOST_mipsarchn64 =3D "null"

Andreas

>
> https://errors.yoctoproject.org/Errors/Details/296905/
>
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> >  .../gjs/gjs/0001-Disable-tests-on-host.patch  | 33 +++++++++++++++++
> >  meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb    | 37 +++++++++++++++++++
> >  2 files changed, 70 insertions(+)
> >  create mode 100644 meta-gnome/recipes-gnome/gjs/gjs/0001-Disable-tests=
-on-host.patch
> >  create mode 100644 meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb
> >
> > diff --git a/meta-gnome/recipes-gnome/gjs/gjs/0001-Disable-tests-on-hos=
t.patch b/meta-gnome/recipes-gnome/gjs/gjs/0001-Disable-tests-on-host.patch
> > new file mode 100644
> > index 000000000..0953214fb
> > --- /dev/null
> > +++ b/meta-gnome/recipes-gnome/gjs/gjs/0001-Disable-tests-on-host.patch
> > @@ -0,0 +1,33 @@
> > +From 95379de2132786f855e8caec1fd5869225774d02 Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail=
.com>
> > +Date: Sat, 18 May 2019 01:14:07 +0200
> > +Subject: [PATCH] Disable tests on host
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +Upstream-Status: Inappropriate [OE-specific]
> > +
> > +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > +---
> > + configure.ac | 4 +---
> > + 1 file changed, 1 insertion(+), 3 deletions(-)
> > +
> > +diff --git a/configure.ac b/configure.ac
> > +index fa4e136..056e96e 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -335,9 +335,7 @@ AS_IF([test "x$with_dbus_tests" !=3D "xno"], [
> > + ])
> > + AM_CONDITIONAL([DBUS_TESTS], [test "x$with_dbus_tests" !=3D "xno"])
> > +
> > +-AC_MSG_CHECKING([for a suitable UTF-8 locale to run the tests in])
> > +-TESTS_LOCALE=3D$($srcdir/build/choose-tests-locale.sh)
> > +-AC_MSG_RESULT([$TESTS_LOCALE])
> > ++TESTS_LOCALE=3DC
> > + AC_SUBST([TESTS_LOCALE])
> > +
> > + AC_SUBST([gjsjsdir], [\${datadir}/gjs-1.0])
> > +--
> > +2.20.1
> > +
> > diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb b/meta-gnome/re=
cipes-gnome/gjs/gjs_1.58.3.bb
> > new file mode 100644
> > index 000000000..ddd5196b2
> > --- /dev/null
> > +++ b/meta-gnome/recipes-gnome/gjs/gjs_1.58.3.bb
> > @@ -0,0 +1,37 @@
> > +SUMMARY =3D "Javascript bindings for GNOME"
> > +LICENSE =3D "MIT & LGPLv2+"
> > +LIC_FILES_CHKSUM =3D " \
> > +    file://COPYING;md5=3Dbeb29cf17fabe736f0639b09ee6e76fa \
> > +    file://COPYING.LGPL;md5=3D3bf50002aefd002f49e7bb854063f7e7 \
> > +"
> > +
> > +GNOMEBASEBUILDCLASS =3D "autotools"
> > +
> > +DEPENDS =3D "mozjs gtk+3"
> > +
> > +inherit gnomebase gsettings gobject-introspection vala gettext feature=
s_check upstream-version-is-even
> > +
> > +SRC_URI[archive.md5sum] =3D "bce6dea9a6583a8b3c6af5854df76aaf"
> > +SRC_URI[archive.sha256sum] =3D "ca9fcd47b95ab0fc445301b2595e51fcea24d6=
f3cd87c190fe07006146d773ae"
> > +SRC_URI +=3D "file://0001-Disable-tests-on-host.patch"
> > +
> > +# gobject-introspection is mandatory and cannot be configured
> > +REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
> > +UNKNOWN_CONFIGURE_WHITELIST_append =3D " --enable-introspection --disa=
ble-introspection"
> > +
> > +EXTRA_OECONF =3D " \
> > +    --without-dbus-tests \
> > +    --disable-installed-tests \
> > +"
> > +
> > +do_configure_prepend() {
> > +    # make configure find gobject-introspection test code. Although we=
 set
> > +    # --disable-installed-tests gjs builds them
> > +    sed -i 's|:$GI_DATADIR|:${STAGING_DIR_NATIVE}$GI_DATADIR|g' ${S}/c=
onfigure.ac
> > +}
> > +
> > +FILES_${PN} +=3D "${datadir}/gjs-1.0/lsan"
> > +
> > +PACKAGES =3D+ "${PN}-valgrind"
> > +FILES_${PN}-valgrind =3D "${datadir}/gjs-1.0/valgrind"
> > +RSEPENDS_${PN}-valgrind +=3D "valgrind"
> > --
> > 2.21.0
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

