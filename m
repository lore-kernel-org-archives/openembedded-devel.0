Return-Path: <martin.jansa@gmail.com>
Received: from mail-ve0-f177.google.com (unknown [209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8E0AE6B15C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 14:21:00 +0000 (UTC)
Received: by mail-ve0-f177.google.com with SMTP id db11so10634237veb.22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 07:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=n1RYq4IS0P91kGg3iKLkhwUfNFA04h0Q7gxuc3ajaYc=;
	b=bnnbJMpyKkN/DecxQSELiPuZxQUbMwQYWiQPyqPwBPwQx6bFzZvtRnnHixYueXTeE5
	qjkBCDiFNEIdNVaCVdwvW8sZok3MaNshpsMjusMknliQ7bzTO6p00XTP7xTbr8/8Z4Dq
	T0CESaCwjJ7uWv7Cr430E/a3iO2YVfpHkDhj2GUPjPLUQHF5KPeXFI5vV1weuGfXxO25
	cRr0UO5ItTaS5K2kCQN+FIbszKuO/59L1vuav2Y/JmqZLEDupq6/QiOgqZJsHi6ALn3f
	tLbpkTUth+sp20inx4tMpbTr9y6I5W64OAgLraPYNKCCm1GZitB9WM2yY1Q1ydWr/rFZ
	eYbQ==
X-Received: by 10.52.166.18 with SMTP id zc18mr1033630vdb.65.1401200461473;
	Tue, 27 May 2014 07:21:01 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	v5sm26594556vdx.13.2014.05.27.07.20.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 May 2014 07:21:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 27 May 2014 16:21:06 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140527142106.GB2426@jama>
References: <1401196396-2009-1-git-send-email-maxim.uvarov@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1401196396-2009-1-git-send-email-maxim.uvarov@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] daq fix compilation
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
X-List-Received-Date: Tue, 27 May 2014 14:21:04 -0000
X-Groupsio-MsgNum: 50072
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zx4FCpZtqtKETZ7O"
Content-Disposition: inline

--zx4FCpZtqtKETZ7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2014 at 05:13:16PM +0400, Maxim Uvarov wrote:
> preset paths to remove that error:
> /meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
> ./config.log:cc1: warning: include location "/usr/local/include" is unsaf=
e for cross-compilation [-Wpoison-system-directories]
>=20
> Also this patch add required libdnet dependency.
>=20
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> ---
>  meta-oe/recipes-connectivity/daq/daq_2.0.2.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb b/meta-oe/reci=
pes-connectivity/daq/daq_2.0.2.bb
> index 4e85194..dcf38fc 100644
> --- a/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
> +++ b/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df9ce51a65dd738=
dc1ae631d8b21c40e0"
> =20
>  PARALLEL_MAKE =3D ""
> =20
> -DEPENDS =3D "libpcap libpcre"
> +DEPENDS =3D "libpcap libpcre libdnet"
> =20
>  SRC_URI =3D "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
>              file://disable-run-test-program-while-cross-compiling.patch "
> @@ -15,6 +15,9 @@ SRC_URI =3D "http://fossies.org/linux/misc/daq-${PV}.ta=
r.gz \
>  # daq/daq/latest lost dependency on  libdnet libmnl libnetfilter-queue l=
ibnfnetlink
>  EXTRA_OECONF +=3D "--disable-nfq-module --disable-ipq-module"
> =20
> +# never look to /usr/local lib while cross compiling
> +EXTRA_OECONF +=3D "--includedir=3D/usr/include --with-libpcap-includes=
=3D/usr/lib --with-dnet-includes=3D/usr/lib"

Does it look into /usr on host now?

>  SRC_URI[md5sum] =3D "865bf9b750a2a2ca632591a3c70b0ea0"
>  SRC_URI[sha256sum] =3D "d65d1e67c4994e02c3142c49a648642e780b7e3d942b4a51=
f605309beac269a8"
> =20
> --=20
> 1.8.5.1.163.gd7aced9
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zx4FCpZtqtKETZ7O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlOEn1IACgkQN1Ujt2V2gBzzBwCgtsTv7pwvvbu11KD54lB2q5zN
y7AAniGtXGDjdc87JA7hSxz4ruTpM8NN
=pCbx
-----END PGP SIGNATURE-----

--zx4FCpZtqtKETZ7O--
