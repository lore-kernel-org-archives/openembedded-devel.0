Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id C62576FFD3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Mar 2016 10:32:48 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id p65so137750860wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Mar 2016 03:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=KS8DzDgUo2ECeX/wXxPeXz8sx1EpIlItONgwrqHBP64=;
	b=Hpt7Cj8tKRSmUsI40bmIc5FMM1A25ZXZEk6CnP8/AJ+nd+D2j9EXctP/auV25LLUAm
	DBJk40CcPoMLwRDKspAI9BsC4GcuMvrYVMHI5VOi2UBEgg+blsrXEAJdSp8YgG6m7tJf
	TvCmt/md1UjalCvk13hGyCAvFWOCVaapoRIdEiV4OgaCs0b6LWgO7j4HdI0UF5zFSy4P
	fs/a+czi+SnJ5ZYIP2/JXUT7XOKDqY0PMW/erkeHZKqvbPbCQTt+7m2h6dU/69Pw88z5
	I86/iJuKjF5MMDhfTjRfsS0dE5dvN+O5YlEuiExm1pN/YIuhydujBUMk/IMem2woQl+e
	YkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=KS8DzDgUo2ECeX/wXxPeXz8sx1EpIlItONgwrqHBP64=;
	b=N7DeTNB/Ba7vDK/VzxC15ENUsUJJ+jnwmx5DJA7uBFCEsLF6jYLU5eDOy2+3nVPlBL
	Hs9FGGKQMiA+fnHgca/8iSIGvvSTARL80vE5OQ0xkwNfLnpgyX13M0Lnn9gcBadwqvux
	qmf2msGJ/TwKsaCto04gzk2hambyBSeoo+Xs0pvmyORNMQIrZtCVlfRYtdKJ4GEjT3OW
	JEALYxC87WGHfDtr8P1OLSaPnkCQPVjAdzGqJ0F+dOchVncT8kavz+lDu6timLdB60HA
	byEg4TvE1y0OYFj3Dg0VDPeZj6AB9NEyFtspH1021yavj4V2e4PN9H9kIvmQD+8XIObr
	PlUQ==
X-Gm-Message-State: AD7BkJKO+a1JtVOxdE+HfoLNMKvj+cpwDnB1r4C5WGjQSM8kNTfb7Rb6uk/YLW+cKqDqTw==
X-Received: by 10.28.195.9 with SMTP id t9mr18982353wmf.0.1458037968806;
	Tue, 15 Mar 2016 03:32:48 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	x203sm20130523wmg.23.2016.03.15.03.32.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Mar 2016 03:32:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 15 Mar 2016 11:36:17 +0100
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Message-ID: <20160315103617.GA2551@jama>
References: <1457957618-32168-1-git-send-email-ricardo.ribalda@gmail.com>
	<1457957618-32168-2-git-send-email-ricardo.ribalda@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1457957618-32168-2-git-send-email-ricardo.ribalda@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2 2/4] opencv: Remove blacklist
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
X-List-Received-Date: Tue, 15 Mar 2016 10:32:49 -0000
X-Groupsio-MsgNum: 60519
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline

--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 14, 2016 at 01:13:36PM +0100, Ricardo Ribalda Delgado wrote:
> Version 3.0 builds fine with ffmpeg v3

No it doesn't, 3.1 might

http://errors.yoctoproject.org/Errors/Details/55791/

>=20
> [ 32%] Building CXX object
> modules/videoio/CMakeFiles/opencv_videoio.dir/src/cap_ffmpeg.cpp.o
> DEBUG: Shell function do_compile finished
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  meta-oe/recipes-support/opencv/opencv_3.0.bb | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/opencv/opencv_3.0.bb b/meta-oe/recip=
es-support/opencv/opencv_3.0.bb
> index f6c4ca8fac16..1a34efa7f01f 100644
> --- a/meta-oe/recipes-support/opencv/opencv_3.0.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_3.0.bb
> @@ -130,7 +130,4 @@ do_install_append() {
> =20
>      install -d ${D}${datadir}/OpenCV/samples/bin/
>      cp -f bin/*-tutorial-* bin/*-example-* ${D}${datadir}/OpenCV/samples=
/bin/
> -}
> -
> -# http://errors.yoctoproject.org/Errors/Details/40660/
> -PNBLACKLIST[opencv] ?=3D "Not compatible with currently used ffmpeg 3"
> +}
> \ No newline at end of file
> --=20
> 2.7.0
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbn5RgACgkQN1Ujt2V2gBzb/gCfdL10CDUYvJIJLtLPxUeUnwHW
usIAmQHKTkc676C8rjlfwJBIL4NFgyTQ
=rnF/
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
