Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 337916C9FD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Sep 2013 21:16:52 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id d41so516299eek.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Sep 2013 14:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xw2e7T+L2IUMcdnO1Y8pBYxduzaGhaZT9X+US56N34M=;
	b=awf5WDMtQKfC24wZ0omWuTq1fLCMkPRrU5J49iNK/vY4EvXyW8Dl6xQv9pqWhjflp4
	OO1pTw9XpwUWDdeTIT5l74bgd6NKXsQn37EPUe5Eerz4lZB/0nxiN+GJ918tDwiJdtAf
	5RSDVucptCqWSyNPdF4Tzh9vOjIyG8SClpVPThf7ZO6MFqPKMdCLotrzHG4cSWGS5vEG
	JKUkVM8m6+GzEPLL+mGjtgraoim/nH/byCmfMvhZ8eIxBRaVD6NKJIxKMX/yf1bmEysa
	bSjJ8o0MbOu57oUqWVc9AAWFPBzfbio4DSWJcLsajNB6NDeNUi93Rvi4iKM2kU/UHiqO
	ma0g==
X-Received: by 10.15.36.9 with SMTP id h9mr13639937eev.30.1379711813113;
	Fri, 20 Sep 2013 14:16:53 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	i1sm22273092eeg.0.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 20 Sep 2013 14:16:52 -0700 (PDT)
Date: Fri, 20 Sep 2013 23:18:31 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130920211831.GK18414@jama>
References: <1379509584-16503-1-git-send-email-s.stirtzel@googlemail.com>
	<1379509584-16503-2-git-send-email-s.stirtzel@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1379509584-16503-2-git-send-email-s.stirtzel@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 2/3] utouch-frame: Add initial recipe
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
X-List-Received-Date: Fri, 20 Sep 2013 21:16:52 -0000
X-Groupsio-MsgNum: 46269
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="M0YLxmUXciMpOLPE"
Content-Disposition: inline

--M0YLxmUXciMpOLPE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2013 at 03:06:23PM +0200, Samuel Stirtzel wrote:
> used by utouch-mtview, a visual multitouch test application for X
>=20
> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
> ---
>  meta-oe/recipes-support/utouch/utouch-frame_git.bb |   15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta-oe/recipes-support/utouch/utouch-frame_git.bb
>=20
> diff --git a/meta-oe/recipes-support/utouch/utouch-frame_git.bb b/meta-oe=
/recipes-support/utouch/utouch-frame_git.bb
> new file mode 100644
> index 0000000..83a4e25
> --- /dev/null
> +++ b/meta-oe/recipes-support/utouch/utouch-frame_git.bb
> @@ -0,0 +1,15 @@
> +SUMMARY =3D "Touch Frame Library"
> +DESCRIPTION =3D "The frame library and tools are used to handle touch fr=
ames, i.e., collections of tracked contacts. Bindings for mtdev and XI2.1."
> +HOMEPAGE =3D "http://bitmath.org/code/evemu/"
> +
> +LICENSE =3D "GPLv3"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2f31b266d3440dd7ee50f92cf67d8=
e6c"
> +
> +inherit autotools
> +
> +SRC_URI =3D "git://bitmath.org/git/frame.git;protocol=3Dhttp"
> +SRCREV =3D "95363d5a1f7394d71144bf3b408ef4e6db4350fc"
> +
> +PV =3D "1.1.2+git${SRCPV}"
> +
> +S =3D "${WORKDIR}/git/"

Missing dependency on utouch-evemu

| configure:12204: error: Package requirements (utouch-evemu >=3D 1.0.5) we=
re not met:
| No package 'utouch-evemu' found


> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--M0YLxmUXciMpOLPE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlI8u6cACgkQN1Ujt2V2gBzBMACgqvxdVVXPcm0Ngqe8om9NE5Fp
wqAAn234z3oJ+1AO13v6RZtc/PRqaY3D
=xC7K
-----END PGP SIGNATURE-----

--M0YLxmUXciMpOLPE--
