Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 53E327997A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2018 19:46:33 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id y25-v6so5127972wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2018 12:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=O/vLB0gP1OYLHlbC/biZfkNNDIsUsLQbeuu72j+2xpA=;
	b=uXm+SOJV0FgMe1TEJnmDkbD2QnaXs2DiJA3dcHJg18k3wk5e5fxvAfaAbCYAuN3/OG
	SFrq45u9oNkbpNVI374RYUeP2i+zI5bh/bmW0ZpnwbcIQ2rxc5ZbTBuAWrknbFdtt5l3
	jQ34gGLhIUUT0JV9ar4vfWDux20DUcksmWa5fcbtxLPfY2jtBlUS5QawrQcicBkV5cpR
	DBW7CzCXldEB1T4I3G7SM/7vn5ufMaPjCzXWOoTajBxR7GjkqYaLIR+g9qJk6zfp3CG6
	WKvf3OyNHff/91Su1ctD8vrQKrK4MEErj2cY1WyBJqPs/dllFwHoYEgeGls3BVDNNhE8
	TSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=O/vLB0gP1OYLHlbC/biZfkNNDIsUsLQbeuu72j+2xpA=;
	b=CWl7WGCKtwEkNHK3HekqpYqhlzyzvs5y1JcF3Wi/IvWL4la1LHd3OQc23F+w+c7i0Y
	+VAf5TOLO9LAQqtzbCppXBYiR6RHnsrjbITp9q0s6CeOtPatWp2gZ9j4avtBOg+fG0lN
	dOM2zMUE0f1yAgb0t+t7j3ai0TjJ6c1/v1RF9E4vjOfjo8+wz3tOVjaJLOKl/ZO/lO9/
	CSXXF7S6V06L5WyhzINhSch/Q5C8njKF7yZkY8aLMSaORWQDLY6R+1tzrWCJnrRh5QHO
	LF5kIXd0arvWhL+/gvC1ZXWIJUjMcW5y8k80KIy74zBqS7wKOrEVCtFZIgfqc0XfhxeT
	UViw==
X-Gm-Message-State: ABuFfogCjTLXHWTGIGZPskvOFgqL5vtEbf3ICylhrEB6E7Nvi3SNuHVf
	bAX+odY/efdU0fo3sVTiCh4=
X-Google-Smtp-Source: ACcGV61urnPedRJ/Coy4s87v+OmiiM1GFWzjKcY9alU5XBnBqssFFa29MGO9RtXB0r0/LE9QzFTdQw==
X-Received: by 2002:a1c:1608:: with SMTP id 8-v6mr5176150wmw.12.1538250393965; 
	Sat, 29 Sep 2018 12:46:33 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	z89-v6sm19416903wrb.3.2018.09.29.12.46.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 29 Sep 2018 12:46:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 29 Sep 2018 21:46:35 +0200
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20180929194635.GC1449@jama>
References: <20180929193105.25864-1-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20180929193105.25864-1-akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-multimedia][PATCH] mpd: fix yocto-check-layer issue with mulitmedia
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
X-List-Received-Date: Sat, 29 Sep 2018 19:46:33 -0000
X-Groupsio-MsgNum: 74794
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gr/z0/N6AeWAPJVB"
Content-Disposition: inline

--gr/z0/N6AeWAPJVB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 29, 2018 at 12:31:05PM -0700, Armin Kuster wrote:
> ERROR: Nothing PROVIDES 'faad2' (but /home/akuster/oss/maint/meta-openemb=
edded/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb DEPENDS on =
or otherwise requires it)
>=20
> enable aac only if LICENSE_FLAGS is commercial
>=20
> [v2]
> fix typo in commit message
> rebase on latest master

This belongs to cover later or under ---.

>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb b/=
meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
> index 9123673fb..f91ce4d62 100644
> --- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
> +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
> @@ -26,7 +26,8 @@ S =3D "${WORKDIR}/git"
>  EXTRA_OECONF =3D "enable_bzip2=3Dyes"
>  EXTRA_OECONF +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-=
-with-systemdsystemunitdir=3D${systemd_unitdir}/system/', '--without-system=
dsystemunitdir', d)}"
> =20
> -PACKAGECONFIG ??=3D "aac alsa ao bzip2 daemon ffmpeg fifo flac fluidsynt=
h iso9660 jack libsamplerate libwrap httpd mms mpg123 modplug sndfile upnp =
openal opus oss recorder vorbis wavpack zlib"
> +PACKAGECONFIG ??=3D "alsa ao bzip2 ffmpeg flac fluidsynth iso9660 jack l=
ibsamplerate mms mpg123 modplug sndfile upnp openal opus vorbis wavpack zli=
b"
> +PACKAGECONFIG +=3D "${@bb.utils.contains('LICENSE_FLAGS', 'commercial', =
'aac', '', d)}"

This removes much more than just aac now.

Why did you remove daemon, fifo, libwrap, httpd, oss, recorder, vorbis?

> =20
>  PACKAGECONFIG[aac] =3D "--enable-aac,--disable-aac,faad2"
>  PACKAGECONFIG[alsa] =3D "--enable-alsa,--disable-alsa,alsa-lib"
> --=20
> 2.17.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gr/z0/N6AeWAPJVB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW6/WmgAKCRA3VSO3ZXaA
HPNIAJ9LQVYOwqJfCSB9x+8f7NUFIQysxACfbbbWai+5o4SLMV1+IGxG+ZoXNj8=
=zgwt
-----END PGP SIGNATURE-----

--gr/z0/N6AeWAPJVB--
