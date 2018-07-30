Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3E75F78CD1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2018 18:24:25 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id n11-v6so401444wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2018 11:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=flZwbKNSgLPlosprPgK3fmV/Ozh2Tvh8zP6uJR4nFGY=;
	b=p/IIgD54N7u+1nYVvCjtsYqW2nf++zyUc+a/8ijXmkwzhk+2YkZRHx1KzbSiMZWiq0
	k5QXWFj5dO603hNKX4Rxiy9lJBLNSscAc/mXpt6aKkLrMbej3KXCiXKDh4lQ28LQr+dG
	8F08CndVgxk0wHo2lxJITLqHj7mtrcCH3PV0gTCMYPal1Az/O/8sxVDJpOR2twa31Xbj
	BlPqnVUuNuKdum/Brn7q9fswMvCRqnWtN9TQeo/vpiutS+MMXGDPX30jYPTSxbzG1vnv
	shgu2YeX6BdJTaJWG4vw3ZYwQQ0osNYNDCMB6GfQSSbgmMIYp75KfrRnGYkuDR54PAph
	c3eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=flZwbKNSgLPlosprPgK3fmV/Ozh2Tvh8zP6uJR4nFGY=;
	b=fiOUmFpVI/eGmrfLdNZucZ9TxxS7k0Fck3nqAQZywLABsuELW+L0P7OX2oEB6kwXfs
	f+AppELgC+2brNBbOIWfHyMRHm0dCpHIsyi2OM/M0z0WKHVTSA34ja9OkSqTzahUvW+W
	8baHhvHWQaiWklNebf0FRV4ek1iab4K3ezZQSkJLkgjlIRcgbzhvi+sbRuRQuUqUBmPk
	WyGww5AahSf82/QGEdv7WSiuDT0D3S9pugQp1YFzbl/IrltT+lmpEttz69A5lnbRoQk+
	3O5o90g1spYJo93/vLk45emKI/s69drrzQHTXY94OZ5Upxipq57YJxn0DcEjiuMGwomw
	NgCQ==
X-Gm-Message-State: AOUpUlHbDpQ3gCDmurXcMrqEJfspAb255ovu/kMpXauRbt6Jfp3CnPCu
	Wy7MFp2yF/M1C9Hp5ZqYLzQ=
X-Google-Smtp-Source: AAOMgpecRTX3T8/ppD9bnPGc13lUbcAWh48QSNIZVXIef1xudw2T03Ny8F23VuaMoR4Hj3W8KkW0zA==
X-Received: by 2002:a1c:9c56:: with SMTP id
	f83-v6mr222719wme.135.1532975066725; 
	Mon, 30 Jul 2018 11:24:26 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	a6-v6sm288913wmf.22.2018.07.30.11.24.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 30 Jul 2018 11:24:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 30 Jul 2018 20:24:29 +0200
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <20180730182429.GB1361@jama>
References: <20180730161223.9299-1-oleksandr.kravchuk@pelagicore.com>
	<20180730162307.GA1361@jama>
	<518c2a4d-a677-3ad2-e50c-c4332f873ab2@sashko.rv.ua>
MIME-Version: 1.0
In-Reply-To: <518c2a4d-a677-3ad2-e50c-c4332f873ab2@sashko.rv.ua>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org,
	Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Subject: Re: [meta-oe][PATCH] Revert "glibmm: Upgrade to 2.56.0"
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
X-List-Received-Date: Mon, 30 Jul 2018 18:24:26 -0000
X-Groupsio-MsgNum: 73653
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZfOjI3PrQbgiZnxM"
Content-Disposition: inline

--ZfOjI3PrQbgiZnxM
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 30, 2018 at 07:39:46PM +0200, Oleksandr Kravchuk wrote:
> On 30/07/18 18:23, Martin Jansa wrote:
> > On Mon, Jul 30, 2018 at 06:12:23PM +0200, Oleksandr Kravchuk wrote:
> >> sumo branch of poky contains glib v2.54 which makes compilation of this
> >> package fail due to nonexistent functions in the library used by the
> >> C++ bindings.
> > This explanation doesn't make any sense to me.
> >
> > With sumo branch of poky use sumo branch of meta-oe which still has
> > 2.54.1 version.
>=20
> Martin -
>=20
> I appreciate fast response, but your feedback is very ambiguous and=20
> therefore not helpful: which part of my explanation need to be improved?=
=20
> One needs to know if explanation has to be extended or changed=20
> completely. You simply repeated statement from my commit message and=20
> presented it as something opposite of what I've said. This is what truly=
=20
> doesn't make any sense.
>=20
> Let me try to explain it differently: poky has glib version 2.54 in its=
=20
> 'sumo' branch; corresponding branch (sumo) of meta-openembeded has C++=20
> binding for glib version 2.56, which has C++ function wrappers for=20
> functions implemented in glib 2.56, which obviously won't compile, since=
=20
> we have glib and headers for it of version 2.54.

This isn't true, meta-openembedded sumo has 2.54.1 version not 2.56 as
you said. Also the subject of your e-mail doesn't have [sumo] in it, so
even if you were right, then it would look like you're trying to get it
reverted in master branch (where it doesn't make any sense) not in sumo
branch.

> If my English is still too poor for you, I propose you checking out sumo=
=20
> branches of poky and open-embedded and trying to build 'glibmm' package.

If you git skills aren't good enough to see what's in sumo branch, then
you can see it here:=20
http://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-core/gli=
b-2.0?h=3Dsumo

Not even in sumo-next branch:
http://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-core/gli=
b-2.0?h=3Dsumo-next

> SPOILER: result is going to be the following:

Only for people who are mixing incompatible branches..

>=20
> | ../../../glibmm-2.56.0/gio/giomm/application.cc: In member function=20
> 'void Gio::Application::set_option_context_parameter_string(const=20
> Glib::ustring&)':
> | ../../../glibmm-2.56.0/gio/giomm/application.cc:1169:3: error:=20
> 'g_application_set_option_context_parameter_string' was not declared in=
=20
> this scope
> |=A0=A0=A0 g_application_set_option_context_parameter_string(gobj(),=20
> parameter_string.empty() ? nullptr : parameter_string.c_str());
> |=A0=A0=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> | ../../../glibmm-2.56.0/gio/giomm/application.cc:1169:3: note:=20
> suggested alternative: 'set_option_context_parameter_string'
> |=A0=A0=A0 g_application_set_option_context_parameter_string(gobj(),=20
> parameter_string.empty() ? nullptr : parameter_string.c_str());
> |=A0=A0=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> |=A0=A0=A0 set_option_context_parameter_string
> | ../../../glibmm-2.56.0/gio/giomm/application.cc: In member function=20
> 'void Gio::Application::set_option_context_summary(const Glib::ustring&)':
> | ../../../glibmm-2.56.0/gio/giomm/application.cc:1174:3: error:=20
> 'g_application_set_option_context_summary' was not declared in this scope
> |=A0=A0=A0 g_application_set_option_context_summary(gobj(), summary.empty=
() ?=20
> nullptr : summary.c_str());
> |=A0=A0=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> | ../../../glibmm-2.56.0/gio/giomm/application.cc:1174:3: note:=20
> suggested alternative: 'set_option_context_summary'
> |=A0=A0=A0 g_application_set_option_context_summary(gobj(), summary.empty=
() ?=20
> nullptr : summary.c_str());
> |=A0=A0=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> |=A0=A0=A0 set_option_context_summary
> | ../../../glibmm-2.56.0/gio/giomm/application.cc: In member function=20
> 'void Gio::Application::set_option_context_description(const=20
> Glib::ustring&)':
> | ../../../glibmm-2.56.0/gio/giomm/application.cc:1179:3: error:=20
> 'g_application_set_option_context_description' was not declared in this=
=20
> scope
> |=A0=A0=A0 g_application_set_option_context_description(gobj(),=20
> description.empty() ? nullptr : description.c_str());
> |=A0=A0=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> | ../../../glibmm-2.56.0/gio/giomm/application.cc:1179:3: note:=20
> suggested alternative: 'set_option_context_description'
> |=A0=A0=A0 g_application_set_option_context_description(gobj(),=20
> description.empty() ? nullptr : description.c_str());
> |=A0=A0=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> |=A0=A0=A0 set_option_context_description
>=20
>=20
> Let us check the first function=20
> (https://developer.gnome.org/gio/stable/GApplication.html#g-application-s=
et-option-context-parameter-string)=20
> and find out that it was introduced in 2.56.
>=20
> >
> >> This reverts commit acfba081bbe49fd9dccbf12be6535d5342c6d747.
> >> ---
> >>   .../0001-Glib-Threads-Private-Fix-gobj.patch  | 40 +++++++++++++++++=
++
> >>   .../{glibmm_2.56.0.bb =3D> glibmm_2.54.1.bb}    |  5 ++-
> >>   2 files changed, 43 insertions(+), 2 deletions(-)
> >>   create mode 100644 meta-oe/recipes-core/glib-2.0/glibmm/0001-Glib-Th=
reads-Private-Fix-gobj.patch
> >>   rename meta-oe/recipes-core/glib-2.0/{glibmm_2.56.0.bb =3D> glibmm_2=
=2E54.1.bb} (86%)
> >>
> >> diff --git a/meta-oe/recipes-core/glib-2.0/glibmm/0001-Glib-Threads-Pr=
ivate-Fix-gobj.patch b/meta-oe/recipes-core/glib-2.0/glibmm/0001-Glib-Threa=
ds-Private-Fix-gobj.patch
> >> new file mode 100644
> >> index 000000000..7899022f1
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-core/glib-2.0/glibmm/0001-Glib-Threads-Private-F=
ix-gobj.patch
> >> @@ -0,0 +1,40 @@
> >> +From 838fe84c2ddcc9af51c34f751defbf3dd0ba8a06 Mon Sep 17 00:00:00 2001
> >> +From: Kjell Ahlstedt <kjellahlstedt@gmail.com>
> >> +Date: Wed, 20 Dec 2017 20:00:32 +0100
> >> +Subject: [PATCH] Glib::Threads::Private: Fix gobj()
> >> +
> >> +Bug 791711
> >> +
> >> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> +---
> >> +Upstream-Status: Backport [https://github.com/GNOME/glibmm/commit/37d=
57ae9572b7d74aa385a30313eceae7f2d3fce]
> >> + glib/glibmm/threads.h | 2 +-
> >> + glib/src/threads.hg   | 2 +-
> >> + 2 files changed, 2 insertions(+), 2 deletions(-)
> >> +
> >> +diff --git a/glib/glibmm/threads.h b/glib/glibmm/threads.h
> >> +index f7e2b82a..2c0cbe8c 100644
> >> +--- a/glib/glibmm/threads.h
> >> ++++ b/glib/glibmm/threads.h
> >> +@@ -657,7 +657,7 @@ public:
> >> +    */
> >> +   inline void replace(T* data);
> >> +
> >> +-  GPrivate* gobj() { return gobject_; }
> >> ++  GPrivate* gobj() { return &gobject_; }
> >> +
> >> + private:
> >> +   GPrivate gobject_;
> >> +diff --git a/glib/src/threads.hg b/glib/src/threads.hg
> >> +index 86d7a17b..c82a6130 100644
> >> +--- a/glib/src/threads.hg
> >> ++++ b/glib/src/threads.hg
> >> +@@ -628,7 +628,7 @@ public:
> >> +    */
> >> +   inline void replace(T* data);
> >> +
> >> +-  GPrivate* gobj() { return gobject_; }
> >> ++  GPrivate* gobj() { return &gobject_; }
> >> +
> >> + private:
> >> +   GPrivate gobject_;
> >> diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.56.0.bb b/meta-oe/=
recipes-core/glib-2.0/glibmm_2.54.1.bb
> >> similarity index 86%
> >> rename from meta-oe/recipes-core/glib-2.0/glibmm_2.56.0.bb
> >> rename to meta-oe/recipes-core/glib-2.0/glibmm_2.54.1.bb
> >> index 2f048d2f6..4706432ab 100644
> >> --- a/meta-oe/recipes-core/glib-2.0/glibmm_2.56.0.bb
> >> +++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.54.1.bb
> >> @@ -13,9 +13,10 @@ SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d=
=2EgetVar('PV').split('.')[1]}"
> >>   SRC_URI =3D " \
> >>       ftp://ftp.gnome.org/pub/GNOME/sources/glibmm/${SHRT_VER}/glibmm-=
${PV}.tar.xz \
> >>       file://remove-examples.patch \
> >> +    file://0001-Glib-Threads-Private-Fix-gobj.patch \
> >>   "
> >> -SRC_URI[md5sum] =3D "5aa7a60084fe3e01d746c96f4a115302"
> >> -SRC_URI[sha256sum] =3D "6e74fcba0d245451c58fc8a196e9d103789bc510e1eee=
1a9b1e816c5209e79a9"
> >> +SRC_URI[md5sum] =3D "dee5ebe309f5976c3dacfcf5c43a062b"
> >> +SRC_URI[sha256sum] =3D "7cc28c732b04d70ed34f0c923543129083cfb90580ea4=
a2b4be5b38802bf6a4a"
> >>  =20
> >>   do_install_append() {
> >>       install -d ${D}${datadir}/glibmm-2.4
> >> --=20
> >> 2.17.1
> >>
> >> --=20
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZfOjI3PrQbgiZnxM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW19X3AAKCRA3VSO3ZXaA
HLTaAKCxB3UNGoYqv4BnZllt7O0uDRpnWQCgtwWTJzleX0VxHkrLz+CU23hCWik=
=SLQq
-----END PGP SIGNATURE-----

--ZfOjI3PrQbgiZnxM--
