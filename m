Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 5EEC37707F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 04:05:23 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so49621054pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 20:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=AdJEpi0hJ+iX/f4XRuDzxExO2D62NIC0TSU3JlDPWMk=;
	b=ids5NPz68Ha917mSIhKjS4+QtY+qiCUhZRdhs9A+nvtOkB4ODSAhu0mr2nDyqOBj4m
	lsgO/Ip8fwzF4t73k38y56eQy19GItk36qn0hJzf2UychIajdQbQBd08qp4e824mfCkE
	kn+5yVAm6wb+Jj1lRtPm143M86/+rLajm19HeEJ+hNffeyhjY5TPBr9WJB6kfcbCpNMR
	mSC/1dNCqZSbAScnz3hED5XhgDRSdedIPqHt9rs64fjQ4cZzpeI+4fXr1UtRssfgeFPn
	IB+H5+04IeepY8f/G3ZKk7YFgXG48Gp5HbxdMXXQrOZXls04GOhtRa4KggPX1YSkOJvu
	wBtQ==
X-Received: by 10.66.191.68 with SMTP id gw4mr6804422pac.42.1446696323464;
	Wed, 04 Nov 2015 20:05:23 -0800 (PST)
Received: from ?IPv6:2601:646:8601:4580:441f:6745:6fd9:23af?
	([2601:646:8601:4580:441f:6745:6fd9:23af])
	by smtp.gmail.com with ESMTPSA id
	bh1sm4884364pbc.26.2015.11.04.20.05.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 04 Nov 2015 20:05:22 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3106\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1446695721-21521-1-git-send-email-danismostlikely@gmail.com>
Date: Wed, 4 Nov 2015 20:05:22 -0800
Message-Id: <D1A3A172-D87B-4999-A6A6-41E66F2E28A4@gmail.com>
References: <1446695721-21521-1-git-send-email-danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3106)
Subject: Re: [meta-oe][PATCH] tmux: update to 2.1
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
X-List-Received-Date: Thu, 05 Nov 2015 04:05:27 -0000
X-Groupsio-MsgNum: 58328
Content-Type: multipart/signed;
	boundary="Apple-Mail=_81CB66C7-F1F7-4F6A-A1BF-A3F4DEA3FF09";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_81CB66C7-F1F7-4F6A-A1BF-A3F4DEA3FF09
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Nov 4, 2015, at 7:55 PM, Dan McGregor <danismostlikely@gmail.com> =
wrote:
>=20
> From: Dan McGregor <dan.mcgregor@usask.ca>
>=20
> tmux 1.6 is three years old. Update to latest.
>=20
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
> meta-oe/recipes-extended/tmux/tmux_1.6.bb | 18 ------------------
> meta-oe/recipes-extended/tmux/tmux_2.1.bb | 17 +++++++++++++++++

this is ok but use git format-parch -M so it can detect renames. Its =
easy to review.

> 2 files changed, 17 insertions(+), 18 deletions(-)
> delete mode 100644 meta-oe/recipes-extended/tmux/tmux_1.6.bb
> create mode 100644 meta-oe/recipes-extended/tmux/tmux_2.1.bb
>=20
> diff --git a/meta-oe/recipes-extended/tmux/tmux_1.6.bb =
b/meta-oe/recipes-extended/tmux/tmux_1.6.bb
> deleted file mode 100644
> index b4294d7..0000000
> --- a/meta-oe/recipes-extended/tmux/tmux_1.6.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -SUMMARY =3D "Terminal multiplexer"
> -HOMEPAGE =3D "http://tmux.sourceforge.net"
> -SECTION =3D "console/utils"
> -
> -LICENSE =3D "ISC"
> -LIC_FILES_CHKSUM =3D =
"file://tmux.c;beginline=3D3;endline=3D17;md5=3D8685b4455330a940fab1ff451a=
a941a0"
> -
> -DEPENDS =3D "ncurses libevent"
> -
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/tmux/${BP}.tar.gz"
> -SRC_URI[md5sum] =3D "3e37db24aa596bf108a0442a81c845b3"
> -SRC_URI[sha256sum] =3D =
"faee08ba1bd8c22537cd5b7458881d1bdb4985df88ed6bc5967c56881a7efbd6"
> -
> -inherit autotools pkgconfig
> -
> -do_configure_prepend () {
> -    sed -i -e 's:-I/usr/local/include::' ${S}/Makefile.am || bb_fatal =
"sed failed"
> -}
> diff --git a/meta-oe/recipes-extended/tmux/tmux_2.1.bb =
b/meta-oe/recipes-extended/tmux/tmux_2.1.bb
> new file mode 100644
> index 0000000..6e2c88d
> --- /dev/null
> +++ b/meta-oe/recipes-extended/tmux/tmux_2.1.bb
> @@ -0,0 +1,17 @@
> +SUMMARY =3D "Terminal multiplexer"
> +HOMEPAGE =3D "http://tmux.sourceforge.net"
> +SECTION =3D "console/utils"
> +
> +LICENSE =3D "ISC"
> +LIC_FILES_CHKSUM =3D =
"file://tmux.c;beginline=3D3;endline=3D17;md5=3D8685b4455330a940fab1ff451a=
a941a0"
> +
> +DEPENDS =3D "ncurses libevent"
> +
> +
> +SRC_URI =3D "git://github.com/tmux/tmux.git;branch=3Dmaster"
> +SRCREV ?=3D =E2=80=9C310f0a960ca64fa3809545badc629c0c166c6cd2=E2=80=9D

is it as point release for 2.1 ? if not then may be SRCPV should be =
appended to PV

> +

> +S =3D "${WORKDIR}/git"
> +B =3D "${WORKDIR}/build"
> +
> +inherit autotools pkgconfig
> --
> 2.6.2.11.gb05c2f9
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_81CB66C7-F1F7-4F6A-A1BF-A3F4DEA3FF09
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlY61YIACgkQuwUzVZGdMxQORACeMmcbSpM2k9itQFM+qTgZ3kZi
oA8AniIyPkFEZ5QGd+m5gWzdfpoyZSsn
=5nkv
-----END PGP SIGNATURE-----

--Apple-Mail=_81CB66C7-F1F7-4F6A-A1BF-A3F4DEA3FF09--
