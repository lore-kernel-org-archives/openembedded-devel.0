Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 32B4B76FDE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Sep 2015 06:18:05 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so98400320wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 23:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GjrcDwZDAZY64s4MhWLbUiqIbnn3K94Mf/oMXXjy2d4=;
	b=qIPQ7Red18ON2nFkrh3U6gzp/Og/36QBbZ8SdZXK0VlZlnFuPtH+JIs2J/yYqPZC9C
	39pLiJznCQjYeKUAOAWBWMNjg+ITLY+sO0iZbvbWA9xdeYK/TwIqec8kxdafnjVAPvHc
	jZNaeAEpSpTZwf9CQNJFqZyB8mbfO/4aKVQIqPsZ0chqG1W8CroRqFiv5QLTj0HBvBVU
	8gGIY6cS40EopXx3BhnZPPFjTJGewqK746hdZxRQTP6eeSIZLI0WBKVNXvwFPq4J4ZWh
	T8AsYCdjBnJuE3mu5YJiNm3BrbFVzSQUvKJ1chL1GC+1WiezsseO8qj+U5rjtx1lra2/
	l9dg==
X-Received: by 10.194.117.164 with SMTP id kf4mr40103597wjb.9.1443075485751;
	Wed, 23 Sep 2015 23:18:05 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ex17sm3775347wid.23.2015.09.23.23.18.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Sep 2015 23:18:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 24 Sep 2015 08:18:20 +0200
To: Daniel Ache <daniel.k.ache@gmail.com>
Message-ID: <20150924061820.GC2404@jama>
References: <CAP8S4ik4+rWgJL-4RFj8c-bfW6XohBr+QokXFj6k52SYGMHuHQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP8S4ik4+rWgJL-4RFj8c-bfW6XohBr+QokXFj6k52SYGMHuHQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: meta-qt5 bluetooth not working within qtconnectivity
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
X-List-Received-Date: Thu, 24 Sep 2015 06:18:06 -0000
X-Groupsio-MsgNum: 57533
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oJ71EGRlYNjSvfq7"
Content-Disposition: inline

--oJ71EGRlYNjSvfq7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2015 at 08:05:58AM +0200, Daniel Ache wrote:
> Dear Martin,

Hi,

please use ML openembedded-devel@lists.openembedded.org for generic
questions like this.

>=20
> We are not so used to Yocto, so we had to patch meta-qt5 (
> qtconnectivity_git.bb and qtsystems_git.bb) to compile bluetooth. bluez4 =
is
> a used package within our recipe but bluetooth is not included without th=
is
> patch :-(
>=20
> Is "OE_BLUEZ_ENABLED" needed somehow? Or is this historical stuff?

Yes, it's still needed, but don't set it directly add "bluez4" to
PACKAGECONFIG variable in your DISTRO config.

> How can I change our recipes to compile with bluetooth and without patchi=
ng
> meta-qt5?

Use .bbappend or PACKAGECONFIG_append_pn-qtconnectivity.

Did you test it with bluez5 or only with bluez4? I didn't check if 5.5
version supports both now.

Regards,

> Attached out patch file, so you can see what we did.
>=20
> greetings from Germany
> Daniel

> From eb16df8826aeca2eab878695e8d2645a191e717c Mon Sep 17 00:00:00 2001
> From: Daniel Ache <d.ache@oculus.de>
> Date: Wed, 23 Sep 2015 16:23:25 +0200
> Subject: [PATCH 1/1] =3D?UTF-8?q?OE=3D5FBLUEZ=3D5FENABLED=3D20entfernt.=
=3D20Da=3D20wir?=3D
>  =3D?UTF-8?q?=3D20(Christian=3D20Wa=3DC3=3D9Fmuth=3D20und=3D20ich)=3D20es=
=3D20nicht=3D20gescha?=3D
>  =3D?UTF-8?q?fft=3D20haben,=3D20QtConnectivity=3D20so=3D20mit=3D20bluez=
=3D20support=3D20zu?=3D
>  =3D?UTF-8?q?=3D20erstellen.=3D20Vermutlich=3D20ist=3D20OE=3D5FBLUEZ=3D5F=
ENABLED=3D20eh=3D20?=3D
>  =3D?UTF-8?q?ein=3D20Relikt=3D20aus=3D20vergangenen=3D20Tagen=3D20und=3D2=
0so=3D20nicht=3D20m?=3D
>  =3D?UTF-8?q?ehr=3D20n=3DC3=3DB6tig.?=3D
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>=20
> ---
>  recipes-qt/qt5/qtconnectivity_git.bb | 8 --------
>  recipes-qt/qt5/qtsystems_git.bb      | 9 ---------
>  2 files changed, 17 deletions(-)
>=20
> diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconn=
ectivity_git.bb
> index 4781be1..c6e56ed 100644
> --- a/recipes-qt/qt5/qtconnectivity_git.bb
> +++ b/recipes-qt/qt5/qtconnectivity_git.bb
> @@ -12,13 +12,5 @@ LIC_FILES_CHKSUM =3D " \
> =20
>  DEPENDS +=3D "qtbase qtdeclarative"
> =20
> -PACKAGECONFIG ??=3D ""
> -PACKAGECONFIG[bluez4] =3D "OE_BLUEZ_ENABLED,,bluez4"
> -
> -do_configure_prepend() {
> -    export QMAKE_CACHE_EVAL=3D"CONFIG+=3D${EXTRA_OECONF}"
> -    # disable bluez test if it isn't enabled by PACKAGECONFIG
> -    sed -i 's/^qtCompileTest(bluez)/OE_BLUEZ_ENABLED:qtCompileTest(bluez=
)/g' ${S}/qtconnectivity.pro
> -}
> =20
>  SRCREV =3D "e4a5dc7dbe62c32032e5e683ac1fdb57663a14b3"
> diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_g=
it.bb
> index 781cd38..47ec34d 100644
> --- a/recipes-qt/qt5/qtsystems_git.bb
> +++ b/recipes-qt/qt5/qtsystems_git.bb
> @@ -11,15 +11,6 @@ LIC_FILES_CHKSUM =3D " \
> =20
>  DEPENDS +=3D "qtbase qtdeclarative udev gconf"
> =20
> -PACKAGECONFIG ??=3D ""
> -PACKAGECONFIG[bluez4] =3D "OE_BLUEZ_ENABLED,,bluez4"
> -
> -do_configure_prepend() {
> -    export QMAKE_CACHE_EVAL=3D"CONFIG+=3D${EXTRA_OECONF}"
> -    # disable bluez test if it isn't enabled by PACKAGECONFIG
> -    sed -i 's/^    qtCompileTest(bluez)/    OE_BLUEZ_ENABLED:qtCompileTe=
st(bluez)/g' ${S}/qtsystems.pro
> -}
> -
>  do_install_append() {
>      # Remove example.pro file as it is useless
>      rm -f ${D}${OE_QMAKE_PATH_EXAMPLES}/examples.pro=09
> --=20
> 1.9.1
>=20


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oJ71EGRlYNjSvfq7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYDlasACgkQN1Ujt2V2gBxpWACfQ39S+3/GAc+7vMBjN/b3NDkZ
S6gAoI/nDcl7gHGlp+iWI0DcaXDLtEZs
=l14N
-----END PGP SIGNATURE-----

--oJ71EGRlYNjSvfq7--
