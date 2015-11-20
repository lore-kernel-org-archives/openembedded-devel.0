Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 30FFF60112
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 09:40:59 +0000 (UTC)
Received: by wmec201 with SMTP id c201so13459115wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 01:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=oLbcbNyFmB7cuGRGzQ2xxbmK4hFiO7APa3+0x4S2/OA=;
	b=TrqKEvPjc9DKRBuCcNchNrLggfhtcW7F5zQmHskp0AyCDPJnYzAPgEjySWqbR1jmM/
	+RcQ7uWHHvJrZPBqc3julACCyWlJnbWJu+LE7W9IuwRmIXZu3+fwdHBlYBSkCvKQ7eB8
	V3D1ygYHamPLTkhl2znXt9cqw38WtcyGRAyWzivc6GpvWa6NsvcRcE2msp1qY/ywa5mx
	kdheYp9ljEfxqZFN0auYUX0mfyKb8m8YnNJJX+lBvSlYrMYhfhgWSYQP92Q4ZfERh9AD
	f3uYUz9AfOiRAeb09fW8d//3ZJSrjq+SHDdhmPmVhiWkz0eq4Q2LBlKN8yHfdsoZAo2H
	npLA==
X-Received: by 10.194.87.39 with SMTP id u7mr13571002wjz.11.1448012459695;
	Fri, 20 Nov 2015 01:40:59 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	t194sm1907063wmt.11.2015.11.20.01.40.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Nov 2015 01:40:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 20 Nov 2015 10:41:22 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151120094122.GB2241@jama>
References: <cover.1448011904.git.liezhi.yang@windriver.com>
	<f6e6fa4fab723c1abbaac3d7db659e5913e099b3.1448011904.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <f6e6fa4fab723c1abbaac3d7db659e5913e099b3.1448011904.git.liezhi.yang@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH 1/8] netmap-modules: fix for --no-drivers
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
X-List-Received-Date: Fri, 20 Nov 2015 09:41:04 -0000
X-Groupsio-MsgNum: 58750
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wzJLGUyc3ArbnUjN"
Content-Disposition: inline

--wzJLGUyc3ArbnUjN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2015 at 01:32:40AM -0800, Robert Yang wrote:
> Issue: LIN8-1697
>=20
> The --no-drivers=3Dvirtio_net.c overrided --no-drivers=3Dixgbe, then erro=
rs:
> git/LINUX/ixgbe_netmap_linux.h:52:2: error: #error "unsupported ixgbe dri=
ver version"
>  #error "unsupported ixgbe driver version"
>   ^

There is better fix for this on ML already.

>=20
> (LOCAL REV: NOT UPSTREAM) -- Jackie will will merge into his
> netmap-modules work and send.

Next time don't include this.

>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../recipes-kernel/netmap/netmap-modules_git.bb    |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb =
b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> index 6365fee..628c870 100644
> --- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> +++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> @@ -15,7 +15,7 @@ EXTRA_OECONF =3D "--kernel-dir=3D${STAGING_KERNEL_BUILD=
DIR} \
>                  --driver-suffix=3D"-netmap" \
>                  "
> =20
> -EXTRA_OECONF +=3D "--no-drivers=3Dixgbe --no-drivers=3Dvirtio_net.c"
> +EXTRA_OECONF +=3D "--no-drivers=3Dixgbe,virtio_net.c"
> =20
>  LDFLAGS :=3D "${@'${LDFLAGS}'.replace('-Wl,-O1', '')}"
>  LDFLAGS :=3D "${@'${LDFLAGS}'.replace('-Wl,--as-needed', '')}"
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wzJLGUyc3ArbnUjN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZO6sEACgkQN1Ujt2V2gByj6wCfezrOgEB+w3w7ZgkqYSC6ZBQ8
lHkAoLdYtGV7fSgrzby11kb2rsr19Ku+
=8szN
-----END PGP SIGNATURE-----

--wzJLGUyc3ArbnUjN--
