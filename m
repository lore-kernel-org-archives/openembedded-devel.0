Return-Path: <joe@deserted.net>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id A867E6BE71
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 13:13:46 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e53so911799eek.27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Sep 2013 06:13:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=70NCYK+yHhiWzp+K7ceo2dPiVmv7UPXIqRpplk1ApNI=;
	b=ROFpFMfimubEWNW/VIxlux4XjQKBiE7IdKsPZwtxzGkabxirc8prg6IZ8D95Tcjz6b
	MR5KeU98zepkxT2gYB5By93DVLGZDz9q65lN1eLCTuMcyxvKrRxPTWsPYtsn3Go59ZpY
	PJnVZQ8Ds73gHFam4l0N5tb04d2W/S/b8Yg9/qyry0SALwVAJ2mFqjP3s1Rsj840IabT
	XIpSqUcWjnlTQLQs3ROymKPPP4Yf/CUqTFBctfc9FJ16IE8bNOw1p89O9UlVAjapvMuR
	xM0C1JnYcISqqzrvwo4GhOGeMflyuJxEIRfkVYB/UGmTnmZYqpZQXk5KpmTDuFgxiJr/
	X1Mg==
X-Gm-Message-State: ALoCoQmP87fzL9gdLOOM+Bfvc+etq8Ay7mj1ODgjv0ExH0wXy+4fvl9nMYwWCacsClWtEYTLsXaZ
X-Received: by 10.15.36.9 with SMTP id h9mr13567161eev.30.1378386828197;
	Thu, 05 Sep 2013 06:13:48 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id i1sm48623274eeg.0.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 05 Sep 2013 06:13:47 -0700 (PDT)
Date: Thu, 5 Sep 2013 09:13:43 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130905131341.GJ5086@deserted.net>
References: <1378358657-12195-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1378358657-12195-1-git-send-email-raj.khem@gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][meta-networking][PATCH] atftp, libuio: Update the SRC_URI to match upstream sf.net change
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
X-List-Received-Date: Thu, 05 Sep 2013 13:13:47 -0000
X-Groupsio-MsgNum: 46100
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8tZVdKiiYitVG083"
Content-Disposition: inline

--8tZVdKiiYitVG083
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.

-J.

[[oe] [meta-oe][meta-networking][PATCH] atftp, libuio: Update the SRC_URI t=
o match upstream sf.net change] On 13.09.04 (Wed 22:24) Khem Raj wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-networking/recipes-daemons/atftp/atftp_git.bb | 2 +-
>  meta-oe/recipes-extended/libuio/libuio_0.2.1.bb    | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-networking/recipes-daemons/atftp/atftp_git.bb b/meta-ne=
tworking/recipes-daemons/atftp/atftp_git.bb
> index 0bef7a6..6156bb1 100644
> --- a/meta-networking/recipes-daemons/atftp/atftp_git.bb
> +++ b/meta-networking/recipes-daemons/atftp/atftp_git.bb
> @@ -8,7 +8,7 @@ PR =3D "r3"
> =20
>  SRCREV =3D "be3291a18c069ae23a124ffdc56d64a5ff0bbec7"
> =20
> -SRC_URI =3D "git://atftp.git.sourceforge.net/gitroot/atftp/atftp \
> +SRC_URI =3D "git://git.code.sf.net/p/atftp/code \
>             file://atftpd-0.7_circumvent_tftp_size_restrictions.patch \
>             file://atftpd-0.7_unprotected_assignments_crash.patch \
>             file://atftpd.init \
> diff --git a/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb b/meta-oe/re=
cipes-extended/libuio/libuio_0.2.1.bb
> index c16bbd3..48e2930 100644
> --- a/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
> +++ b/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
> @@ -3,11 +3,11 @@ SECTION =3D "base"
>  LICENSE =3D "GPL-2.0"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D393a5ca445f6965873eca0259a17f=
833"
> =20
> -SRC_URI =3D "git://libuio.git.sourceforge.net/gitroot/libuio/libuio"
> +SRC_URI =3D "git://git.code.sf.net/p/libuio/code"
> =20
>  inherit autotools
> =20
> -SRCREV =3D "e1e0e4fa28838b3115e215c9553905fe630ca145"
> +SRCREV =3D "ed4f07ea147ac403c28105ab44d01bbf524d36f9"
> =20
>  S =3D "${WORKDIR}/git"
> =20
--=20
-Joe MacDonald.
:wq

--8tZVdKiiYitVG083
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlIog4UACgkQwFvcllog0Xw2igCgh/i6fQQl45+MWEtWhhKj4BVk
UTkAoKhWRtUCiHimvKYq2xnptkEDaTdX
=YngK
-----END PGP SIGNATURE-----

--8tZVdKiiYitVG083--
