Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7632C7702B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 22:25:38 +0000 (UTC)
Received: by wicfv8 with SMTP id fv8so41376991wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 14:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JLvvjG96Uj/Xe9lHKopXT/LXcEH9aiDluJXhlGh8S+I=;
	b=moKe9A1HsgcjpeBoViT+DYQu8F+3q3qMJ37+A9eLOB88Xt0mEaVW87U8Q/zcbIsl91
	+9D3tcQHnI676QGx37zmYA0oRzttU3WWQGu7DBAkSkrG6q+jfsY3rBDZLNXrjpln14oq
	xh6SQyhWjOr8cSEQrNBS/pW6U6w8ZjAtNg/ehEjt6lfaBMH2mXi6YXbl053dsUixU+Dk
	z3qUBfTeSXgxG6nJVpTczUz3E8sqd9CBqdPKFZhpEK7N+VPJgjmc/0Q9KygXFZj2YEr/
	+WDmwm77QCKhu7jo8/gM77FjnXi+PGSRPK1GJE/NxMrlbY4C67S8L3tGKRpBh/sIDgbh
	DUzw==
X-Received: by 10.194.189.228 with SMTP id gl4mr4589249wjc.44.1446675938056;
	Wed, 04 Nov 2015 14:25:38 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	v191sm30877951wmd.24.2015.11.04.14.25.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Nov 2015 14:25:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 4 Nov 2015 23:25:47 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151104222547.GA2556@jama>
References: <1446652999-24545-1-git-send-email-funman@videolan.org>
	<1446652999-24545-3-git-send-email-funman@videolan.org>
MIME-Version: 1.0
In-Reply-To: <1446652999-24545-3-git-send-email-funman@videolan.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-multimedia][PATCH 3/3] VLC: drop gnome-vfs, it will be removed from upstream in VLC 3.0
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
X-List-Received-Date: Wed, 04 Nov 2015 22:25:46 -0000
X-Groupsio-MsgNum: 58299
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline

--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2015 at 05:03:19PM +0100, Rafa=EBl Carr=E9 wrote:
> ---

Is it still used in 2.2.1 version? we aren't using 3.0 yet:

=2E/meta-multimedia/recipes-multimedia/vlc/vlc_2.2.1.bb

>  meta-multimedia/recipes-multimedia/vlc/vlc.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multim=
edia/recipes-multimedia/vlc/vlc.inc
> index ad5c81d..dddbb5b 100644
> --- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
>  DEPENDS =3D "libfribidi libtool libgcrypt libgcrypt-native \
>     virtual/libsdl libsdl-image dbus dbus-glib libxml2 gnutls \
>     tremor faad2 ffmpeg flac libxpm libxinerama fluidsynth alsa-lib \
> -   libdvdcss libdvdread lua-native lua libidn gnome-vfs \
> +   libdvdcss libdvdread lua-native lua libidn \
>     libdc1394 libraw1394 avahi libjpeg-turbo xz libmodplug mpeg2dec \
>     libmtp libopus orc libsamplerate0 libusb1 schroedinger taglib \
>     tiff xcb-util-keysyms samba"
> --=20
> 2.5.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlY6hecACgkQN1Ujt2V2gBxK2ACfWL7ZSbMC2v59fuLxjDLWeO3Y
FJ0An2vAWhiB3SNVrQEPPm119fVfXaH1
=+L4x
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
