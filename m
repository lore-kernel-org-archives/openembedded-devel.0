Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f195.google.com (mail-wi0-f195.google.com
	[209.85.212.195])
	by mail.openembedded.org (Postfix) with ESMTP id C131276DEB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Sep 2015 06:25:27 +0000 (UTC)
Received: by wicuu12 with SMTP id uu12so1095824wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Sep 2015 23:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NqE3UiXWZqv7Y+ty0+QsmJgViycC+DZZtON/WFKEsT0=;
	b=hiPWOiEfrkxkMfEE2glfTtF2q3/a9hFyh+R1YffJuRGJELSBunXh8x1KXxCrtjQ/EI
	N74PYjKN1jkpzNtVCSNkSHg70bmLJ0+4IEx1Z5rj10rguIR+Zl9JQX6wymNfSO+KBF0W
	dXSqrexoMDYR1AEQWc7qW9rc9GYaOoXthkq7ieoOEiGpkvGGJnEIANUm9hv0nY20l91E
	Vc+xQTpE3dK4JuH0tQH/ifP/UduScYIC6/n0UsG5J6bS4ZDAeZFqoz8GWyXQ85Lg+Bl9
	KzR4txH1syaxYNW5otmo00/OOTgIfGcrUU3pvH1AbeogoWmRlFvTvLScqIy1So38o4Pr
	b8pA==
X-Received: by 10.180.87.198 with SMTP id ba6mr1338173wib.39.1443162327079;
	Thu, 24 Sep 2015 23:25:27 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ub7sm1590670wib.17.2015.09.24.23.25.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Sep 2015 23:25:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 25 Sep 2015 08:25:47 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150925062547.GB2397@jama>
References: <5603FD45.5030308@topic.nl>
	<CALbNGRTopGO_K0BqpLaq27EeKhaC63QiE7Yo079PqOP5tQrSXA@mail.gmail.com>
	<CALbNGRR9eL001Y7UByvKuoeQuOr=93OHX_WxjD2NHO5WKNmg-w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRR9eL001Y7UByvKuoeQuOr=93OHX_WxjD2NHO5WKNmg-w@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: "libgudev" fails to build with current master
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Sep 2015 06:25:28 -0000
X-Groupsio-MsgNum: 57545
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QKdGvSO+nmPlgiQ/"
Content-Disposition: inline

--QKdGvSO+nmPlgiQ/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2015 at 01:22:37AM +0200, Andreas M=FCller wrote:
> On Thu, Sep 24, 2015 at 6:45 PM, Andreas M=FCller
> <schnitzeltony@googlemail.com> wrote:
> > On Thu, Sep 24, 2015 at 3:40 PM, Mike Looijmans <mike.looijmans@topic.n=
l> wrote:
> >> | checking for LIBUDEV... no
> >> | configure: error: Package requirements (libudev >=3D 199) were not m=
et:
> >> |
> >> | Requested 'libudev >=3D 199' but version of libudev is 182
> >> |
> >> ...
> >>
> >> ERROR: Task 5548
> >> (/.../meta-oe/meta-oe/recipes-gnome/libgudev/libgudev_230.bb, do_confi=
gure)
> >> failed with exit code '1'
> >>
> > Which init system are you using - I guess not systemd
> >
> Let's assume it is not systemd. Could you try attached  0001.. for
> oe-core and 0002.. foe meta-oe and give feedback. I tested these for
> systemd distro without new issues.
>=20
> Andreas

> From 384c763f66d5f49b967253e8e5d272822552a524 Mon Sep 17 00:00:00 2001
> From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlema=
il.com>
> Date: Fri, 25 Sep 2015 01:04:31 +0200
> Subject: [PATCH] udev: add PROVIDES =3D "libgudev"
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>=20
> With the last update of systemd libgudev was splitted out of systemd. To =
make
> packages depending on libgudev happy, a recipe building libgudev was crea=
ted in
> meta-oe and the dependencies were modified from udev to libgudev.
>=20
> This works fine for distros using systemd as init system, but distros not=
 using
> build udev which provides libgudev.
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  meta/recipes-core/udev/udev.inc | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/ude=
v.inc
> index a00dad5..c378ae3 100644
> --- a/meta/recipes-core/udev/udev.inc
> +++ b/meta/recipes-core/udev/udev.inc
> @@ -15,6 +15,8 @@ LDFLAGS +=3D "-lrt"
>  DEPENDS =3D "glib-2.0 libusb usbutils pciutils glib-2.0-native gperf-nat=
ive libxslt-native util-linux"
>  RPROVIDES_${PN} =3D "hotplug"
> =20
> +PROVIDES =3D "libgudev"
> +
>  SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.t=
ar.gz \
>             file://0001-Fixing-keyboard_force_release.sh-shell-script-pat=
h.patch \
>             file://avoid-mouse-autosuspend.patch \
> --=20
> 2.1.0
>=20

> From e83235a777880c343fce9f286f50678b237620dd Mon Sep 17 00:00:00 2001
> From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlema=
il.com>
> Date: Fri, 25 Sep 2015 01:17:01 +0200
> Subject: [PATCH] libgudev: skip recipe for distros not using systemd as i=
nit
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>=20
> for those systems udev provides libgudev
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  meta-oe/recipes-gnome/libgudev/libgudev_230.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/meta-oe/recipes-gnome/libgudev/libgudev_230.bb b/meta-oe/rec=
ipes-gnome/libgudev/libgudev_230.bb
> index 39fc1c4..9e457d2 100644
> --- a/meta-oe/recipes-gnome/libgudev/libgudev_230.bb
> +++ b/meta-oe/recipes-gnome/libgudev/libgudev_230.bb
> @@ -11,3 +11,9 @@ LICENSE =3D "LGPLv2.1"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
> =20
>  inherit gnomebase
> +
> +# in non systemd distros udev builds libgudev
> +python () {
> +    if not bb.utils.contains ('DISTRO_FEATURES', 'systemd', True, False,=
 d):
> +        raise bb.parse.SkipPackage("'systemd' not in DISTRO_FEATURES")
> +}

Cannot we use REQUIRED_DISTRO_FEATURES + inherit distro_features_check
for this one?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QKdGvSO+nmPlgiQ/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYE6OoACgkQN1Ujt2V2gBx76wCgluhUboaGpYFQmj3ynP+IqalZ
qvAAniAqoUwMlWnpimKMh3fbmQ9Yj7Pb
=z6+o
-----END PGP SIGNATURE-----

--QKdGvSO+nmPlgiQ/--
