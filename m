Return-Path: <joe@deserted.net>
Received: from mail-qe0-f42.google.com (mail-qe0-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id BFAFE6BBD8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Sep 2013 21:14:37 +0000 (UTC)
Received: by mail-qe0-f42.google.com with SMTP id 1so391195qec.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Sep 2013 14:14:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=wr+0ULcRvX78f3Xnp4K7hPWg7DtEq7T8WjbBBm5BSAw=;
	b=TO4jDjhMaFT3ebs6xDWy1PPN2X5UV6nbcLNMXy9z4OiLJrvDYmJMGBgygVvTPZ6QTb
	VWkY2rqrOWqoWCKIF0wQpZU1kScW+8QdhfpQBwQbmFLag/3hpS8pFfL9KWhktiCuB1p0
	kHkyos3DETxlUradyuVlbp1Frzn55AR1xvNDTxZDzY2MlgHCFLHu5EeEg+K6S0+wj609
	jvtTynGpA95y0p6B5jz4igYCwGd3vpAnXLcQ7Yx3OLUov2udVMtZ+TFlN88JWJD1scS1
	FV//DZ+BZFWDULzIPVey67myRBiiyCoi3NT9oe90IwT4RsB7XasyHyPpzF/9BrDfqWAO
	ldag==
X-Gm-Message-State: ALoCoQk5yLzJBdJRB7yxHITaHnIqD102pK7qKDg+6t/lPHFmLkDFzBJCRYD6S+hvr5HFgAkHEfzZ
X-Received: by 10.49.105.230 with SMTP id gp6mr5702803qeb.71.1378329278628;
	Wed, 04 Sep 2013 14:14:38 -0700 (PDT)
Received: from deserted.net (198-84-238-35.cpe.teksavvy.com. [198.84.238.35])
	by mx.google.com with ESMTPSA id
	s9sm40001041qev.6.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 04 Sep 2013 14:14:37 -0700 (PDT)
Date: Wed, 4 Sep 2013 17:14:16 -0400
From: Joe MacDonald <joe@deserted.net>
To: Laszlo Papp <lpapp@kde.org>
Message-ID: <20130904211411.GR3761@deserted.net>
References: <1378110051-8976-1-git-send-email-lpapp@kde.org>
MIME-Version: 1.0
In-Reply-To: <1378110051-8976-1-git-send-email-lpapp@kde.org>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] openflow: Add latest from git
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
X-List-Received-Date: Wed, 04 Sep 2013 21:14:38 -0000
X-Groupsio-MsgNum: 46070
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xMJbWctQEcNQiBqK"
Content-Disposition: inline

--xMJbWctQEcNQiBqK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Actually, after all of that, I do have a couple of additional requests
(beyond just the tweak to the commit log).

   Explicitly cc:ing Bruce here since I'm intentionally not adding
   meta-virt@.  I've gotten bounced from it in the past as I'm not a
   subscriber and it's subscriber-only.

[[oe] [meta-networking][PATCH] openflow: Add latest from git] On 13.09.02 (=
Mon 09:20) Laszlo Papp wrote:

> 1) The version in meta-virtualization is quite old. It is basically from =
2009,
> and a lot of things has changed since then.
>=20
> 2) More importantly, this software is more like for networking rather than
> virtualization, so I think it was misplaced.

SOB please?

> ---
>  .../recipes-support/openflow/openflow_1.0.bb       | 32 ++++++++++++++++=
++++++

Is this actually based on an OpenFlow 1.0 release, or has it always been
1.0+git?  I don't have a copy of meta-virt around to check myself.  If
there was a real 1.0 recipe around, can we keep it as is and make this
openflow_git.bb, more in line with the other +git... recipes?

>  1 file changed, 32 insertions(+)
>  create mode 100644 meta-networking/recipes-support/openflow/openflow_1.0=
=2Ebb
>=20
> diff --git a/meta-networking/recipes-support/openflow/openflow_1.0.bb b/m=
eta-networking/recipes-support/openflow/openflow_1.0.bb
> new file mode 100644
> index 0000000..eb7770e
> --- /dev/null
> +++ b/meta-networking/recipes-support/openflow/openflow_1.0.bb
> @@ -0,0 +1,32 @@
> +SUMMARY =3D "OpenFlow"
> +DESCRIPTION =3D "Open standard that enables researchers to run experimen=
tal protocols in the campus networks"
> +HOMEPAGE =3D "http://www.openflow.org"
> +SECTION =3D "networking"
> +LICENSE =3D "GPLv2"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De870c934e2c3d6ccf085fd7cf0a1e=
2e2"
> +
> +SRCREV =3D "c84f33f09d5dbcfc9b489f64cb30475bf36f653a"
> +PV =3D "1.0+git${SRCPV}"
> +SRC_URI =3D "git://gitosis.stanford.edu/openflow.git;protocol=3Dgit"
> +
> +DEPENDS =3D "virtual/libc"
> +
> +EXTRA_OECONF +=3D "KARCH=3D${TARGET_ARCH}"
> +
> +PACKAGECONFIG ??=3D "libssl"
> +PACKAGECONFIG[libssl] =3D "--enable-ssl,--disable-ssl, openssl, libssl"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools
> +
> +do_configure() {
> +    ./boot.sh
> +    oe_runconf
> +}
> +
> +do_install_append() {
> +	# Remove /var/run as it is created on startup
> +    rm -rf ${D}${localstatedir}/run
> +}

And while we're in the neighbourhood, can we also clean up the
inconsistent spacing?

Thanks.

--=20
-Joe MacDonald.
:wq

--xMJbWctQEcNQiBqK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlInoqMACgkQwFvcllog0XyowwCgp7gBdzCVJEZOFZcxdny0Dqb/
QUMAoJyWImBB8EE1YnD3e50wyoWEo2pB
=OH5k
-----END PGP SIGNATURE-----

--xMJbWctQEcNQiBqK--
