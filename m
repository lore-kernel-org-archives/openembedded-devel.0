Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5D57172F6A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 21:14:00 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r18so125wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 13:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=vqj04BVyxnUAgsvT8QDm0lIjaa3IucSp0WdbTUqza5E=;
	b=cc4o1xqeKZLSWBzcQr/I4JK2HLU4o8bLqNpKm3fp3tMLuX8xj3XZ37LKndRk9pXIud
	NVDozniZwtu/MqbxphhP5yGwzU5kLZgrHDxaGCnGTwsaVuU/RU/1uc8Bb8kqJ05bxGkz
	vGa/5bIPNRQ7f/6g5+8KGnCptEPblKDwj3w0VYVhYy7Bj7F67kFukoO314kXxWkgyty4
	P3VjiR+0OjvbM/HOzu05EtcubtFY6Sjkjhc+SOpcea1jGn+3hsw3wGVMAoukXddnqG+I
	9XYik406dctL165fBFld1QM2hj0OCrfyGZ/SKn5DyJIKb9ka1RyDaQ+kKk6ZW9AFCT/l
	4biA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=vqj04BVyxnUAgsvT8QDm0lIjaa3IucSp0WdbTUqza5E=;
	b=rdNVp41mbBn5jJko9DfMg+cB6qebf3pY/Gk/zcOfnglHR4rtbOuSMiL+bktMG+g/Cy
	DbSqvsQ/RhBMVnYlojER+/sUHPSZay+5BEjwbRSj9LiYxbkq+yGWJ8pOjply+tS7azfS
	NSTdTq/1zYDsrGMuhVaRrZwNdAdbzlGvwqvNwRiV8n5fE+EeFRWbyOTaqCfok8qZdn4N
	e+FS/0+Rum6avLQsJo+YAUQZWCr/hZ4q7PL8kiGs3ROvvgUjzQIV4WJg+VJJrCco2QLS
	oR6ZN9g9vjxk9/vH/Zhef4XFmOQgoQoeolVcr4Ngg2L0l5zJyjf+5WvwbqB6hq3CI6xv
	SfFw==
X-Gm-Message-State: AMke39knp8gp6HKEsFoYu/O+lQKp93s4ZgNeRabGYvq3Fb4RQ0eS7M/U1ZJ0AEYxoI9wpQ==
X-Received: by 10.28.96.130 with SMTP id u124mr7256483wmb.81.1487884442050;
	Thu, 23 Feb 2017 13:14:02 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 36sm7586789wrz.8.2017.02.23.13.14.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 23 Feb 2017 13:14:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 23 Feb 2017 22:14:02 +0100
To: Amarnath Valluri <amarnath.valluri@intel.com>
Message-ID: <20170223211402.GB3038@jama>
References: <1487840743-23198-1-git-send-email-amarnath.valluri@intel.com>
	<1487840743-23198-9-git-send-email-amarnath.valluri@intel.com>
MIME-Version: 1.0
In-Reply-To: <1487840743-23198-9-git-send-email-amarnath.valluri@intel.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 8/9] multipath-tools: Replace 'lib' with ${nonarch_base_libdir} for placing udev rules.
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
X-List-Received-Date: Thu, 23 Feb 2017 21:14:01 -0000
X-Groupsio-MsgNum: 65528
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mojUlQ0s9EVzWg2t"
Content-Disposition: inline

--mojUlQ0s9EVzWg2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2017 at 11:05:42AM +0200, Amarnath Valluri wrote:
> Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
> ---
>  meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb | 7 ++++-=
--
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.=
bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
> index effd92e..0cc53fb 100644
> --- a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
> +++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
> @@ -40,7 +40,7 @@ ARM_INSTRUCTION_SET_armv5 =3D "arm"
>  EXTRA_OEMAKE =3D 'MULTIPATH_VERSION=3D${PV} DESTDIR=3D${D} syslibdir=3D$=
{base_libdir} \
>                  OPTFLAGS=3D"${CFLAGS}" \
>                  LIB=3D${base_libdir} libdir=3D${base_libdir}/multipath \
> -                unitdir=3D/lib/systemd/system \
> +                unitdir/=3D${systemd_system_unitdir} \

is the / before =3D intentional?

Also causes:
multipath-tools-0.6.4+git922421cf79: multipath-tools: Files/directories wer=
e installed but not shipped in any package:
  /usr/lib/systemd
  /usr/lib/systemd/system
  /usr/lib/systemd/system/multipathd.service
  /usr/lib/systemd/system/multipathd.socket
Please set FILES such that these items are packaged. Alternatively if they =
are unneeded, avoid installing them or delete them within do_install.
multipath-tools: 4 installed and not shipped files. [installed-vs-shipped]
multipath-tools-0.6.4+git922421cf79: /etc/init.d/multipathd contained in pa=
ckage multipath-tools requires /bin/bash, but no providers found in RDEPEND=
S_multipath-tools? [file-rdeps]

>                  ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "SYST=
EMD=3D216", "", d)} \
>                 '
> =20
> @@ -59,11 +59,12 @@ FILES_${PN}-dbg +=3D "${base_libdir}/multipath/.debug"
>  # systemd and udev stuff always goes under /lib!
>  #
>  FILES_${PN} +=3D "${base_libdir}/multipath \
> -                /lib/systemd"
> +                ${systemd_system_unitdir} \
> +		"
> =20
>  PACKAGES =3D+ "kpartx"
>  FILES_kpartx =3D "${base_sbindir}/kpartx \
> -                /usr/lib/udev/kpartx_id \
> +                ${nonarch_libdir}/udev/kpartx_id \
>                 "
> =20
>  RDEPENDS_${PN} +=3D "kpartx"
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mojUlQ0s9EVzWg2t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWK9QmQAKCRA3VSO3ZXaA
HKK+AJ9EWrnlTy2uFf+JKU0Tf/1kxwGZ8ACfd8Ib/tr2NUYjo3OnBnIj2vnc6EE=
=ZCox
-----END PGP SIGNATURE-----

--mojUlQ0s9EVzWg2t--
