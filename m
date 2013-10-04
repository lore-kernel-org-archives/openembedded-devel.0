Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 51FD160FA6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2013 14:18:07 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id o10so1859831eaj.27
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Oct 2013 07:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TiAi4hqNPOdOQBabU8BadOGosNwsQRNT5ViW8HXFhWI=;
	b=JP+ZdgCrHAHrYYBR+ChM4TlIusSvf/eLIC7zFsYLUrI4HoStf99A9Wec4QSJmqRKee
	q8Ba7kOzSTF79pErZP20lOhT6LK5MCxPtE3igdOXKA3+mP5hiRTZjBegg+tLM6uSv7SR
	K7ftXxsG09xOPzINXaWb12iJ/XUrnAaxAZowDqmuszt4lN0WimssyDLqVFuFBlPuOYIx
	rUIzSl5nXFmcQAknXhzgEAVGksKTXLRAGDu2fcRjQO1kkKmo9H9OQpPDHlyTP3WbeohI
	NV4OmAqigJgE1IBN/fsf8ukxnh+bJEJ0k2jUjD7POQ976Z1HhnzNUbvjzgiZIowX0yck
	/log==
X-Received: by 10.14.48.14 with SMTP id u14mr2839895eeb.74.1380896288850;
	Fri, 04 Oct 2013 07:18:08 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	x47sm28547982eea.16.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 04 Oct 2013 07:18:08 -0700 (PDT)
Date: Fri, 4 Oct 2013 16:18:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131004141815.GH6240@jama>
References: <1379760101-13380-1-git-send-email-schnitzeltony@googlemail.com>
	<1379760101-13380-8-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1379760101-13380-8-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe/meta-xfce 07/10] xfce4-settings: add PACKAGECONFIG for sound-settings
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
X-List-Received-Date: Fri, 04 Oct 2013 14:18:08 -0000
X-Groupsio-MsgNum: 46444
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CNfT9TXqV7nd4cfk"
Content-Disposition: inline

--CNfT9TXqV7nd4cfk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 21, 2013 at 12:41:38PM +0200, Andreas M=FCller wrote:
> defaults based upon DISTRO_FEATURES for alsa and pulseaudio
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb =
b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
> index 4b75dd7..227858a 100644
> --- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
> +++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
> @@ -23,9 +23,13 @@ PV =3D "4.10.0+git${SRCPV}"
>  =20
>  EXTRA_OECONF +=3D "--enable-maintainer-mode --disable-debug"

Last xfce4-settings change caused PV going backwards:
xfce4-settings-4.10.0+gitAUTOINC+b7a0e1fd77: Package version for package
xfce4-settings-locale-si went backwards which would break package feeds
=66rom (0:4.11.0-r0.55 to 0:4.10.0+git0+b7a0e1fd77-r0.2)

commit 23f020f742aea622e5dd7aef81eb59c99f8ef000
Author: Andreas M<C3><BC>ller <schnitzeltony@googlemail.com>
Date:   Mon Sep 16 09:04:15 2013 +0000

    xfce4-settings: move to schnitzeltony's git repo to get new datetime
setter
   =20
Is this git version really older tna old release we had?

Sorry that I haven't reported it on the commit which caused it :).

> =20
> -PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES','systemd','datet=
ime-setter','',d)}"
> +PACKAGECONFIG ??=3D " \
> +    ${@base_contains('DISTRO_FEATURES','systemd','datetime-setter','',d)=
} \
> +    ${@base_contains('DISTRO_FEATURES','alsa','sound-setter', base_conta=
ins('DISTRO_FEATURES','pulseaudio','sound-setter','',d),d)} \
> +"
>  PACKAGECONFIG[datetime-setter] =3D "--enable-datetime-settings, --disabl=
e-datetime-settings,, tzdata"
>  PACKAGECONFIG[notify] =3D "--enable-libnotify,--disable-libnotify,libnot=
ify"
> +PACKAGECONFIG[sound-setter] =3D "--enable-sound-settings, --disable-soun=
d-settings, libcanberra, libcanberra-gtk2 sound-theme-freedesktop"
> =20
>  do_configure_prepend() {
>      NOCONFIGURE=3Dyes ./autogen.sh
> @@ -43,3 +47,5 @@ do_install_prepend() {
>  }
> =20
>  RRECOMMENDS_${PN} +=3D "gnome-icon-theme"
> +RRECOMMENDS_${PN} +=3D "${@base_contains('DISTRO_FEATURES','alsa','libca=
nberra-alsa','',d)}"
> +RRECOMMENDS_${PN} +=3D "${@base_contains('DISTRO_FEATURES','pulseaudio',=
'libcanberra-pulse','',d)}"
> --=20
> 1.8.3.1
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--CNfT9TXqV7nd4cfk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlJOzicACgkQN1Ujt2V2gBzeqQCeNoFtO2Xn/SVrv4WpSzxlSHtD
PKMAnia+30JI8hfNbdvBCouOsXLzsmhj
=v1Uj
-----END PGP SIGNATURE-----

--CNfT9TXqV7nd4cfk--
