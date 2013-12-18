Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id BB4DB60D5A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2013 15:57:56 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id h14so3602739eaj.21
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2013 07:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qrd1UCwrnMCDzrAtU+rrux7kSgRyyId+Y+ntvXltkWM=;
	b=BEp2OEo2RnVEXlzl8FBWhHdNus0H+Bb/ngqXPtC8mbDk/0qscteaXZMKtBDCT7JATy
	Khpa8Cu4F+Ssl3aSYIcLvPA8QIkEb9gPHRNCGB/wbqAaQ2PxCfW3rmWnSxW/PIyT+4rB
	t5/Lp5eNn991v123EYz0AjPb9SzEsPf3vwxBeoQ2pN7jo+uDYmSQFFVTJbw+9tX7eDNp
	+WknZWXNeaBpDSnSy/O6E5AfUBQsxPYCnRNo6REzwA4jz4kKnlpo2zuL5xLq6j8BikOD
	dDkdd1eoYB+qPDETWr93Ohtt3xBCRHuuL8QsNeZ6RPTFITTF8B9AR1BlSis4WNQiBXkM
	wEgw==
X-Received: by 10.15.75.68 with SMTP id k44mr29967282eey.57.1387382277042;
	Wed, 18 Dec 2013 07:57:57 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id l4sm1161198een.13.2013.12.18.07.57.53
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Dec 2013 07:57:54 -0800 (PST)
Date: Wed, 18 Dec 2013 16:58:21 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131218155821.GM3706@jama>
References: <1387377264-27790-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
In-Reply-To: <1387377264-27790-1-git-send-email-david.nystrom@enea.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: David =?iso-8859-1?Q?Nystr=F6m?= <david.nystrom@enea.com>
Subject: Re: [PATCH] [meta-oe] pcsc-lite: Fixed md5sum for tarball
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
X-List-Received-Date: Wed, 18 Dec 2013 15:57:58 -0000
X-Groupsio-MsgNum: 47496
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6o78gXsyQHm68LY/"
Content-Disposition: inline

--6o78gXsyQHm68LY/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2013 at 03:34:24PM +0100, David Nystr=F6m wrote:
> Signed-off-by: David Nystr=F6m <david.nystrom@enea.com>

Can you download old tarball from some mirror and describe content diff
in commit message?

If you fail to find tarball with old checksum I'll send it to you from
my world builds.

> ---
>  meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb b/meta-=
oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb
> index 266781a..7aae334 100644
> --- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb
> +++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da39d325b7d9cf2=
f07826a5154b16500c"
>  DEPENDS =3D "udev"
> =20
>  SRC_URI =3D "https://alioth.debian.org/frs/download.php/3757/pcsc-lite-$=
{PV}.tar.bz2"
> -SRC_URI[md5sum] =3D "3e4b777231d35ce35c15c0704f936eaa"
> -SRC_URI[sha256sum] =3D "1e44049168d1ce55fd56c175f61206955254df0f385455f2=
a20ec7e8a0e6a77a"
> +SRC_URI[md5sum] =3D "d41d8cd98f00b204e9800998ecf8427e"
> +SRC_URI[sha256sum] =3D "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934c=
a495991b7852b855"
> =20
>  PR =3D "r3"
> =20
> --=20
> 1.8.3.2
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6o78gXsyQHm68LY/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKxxh0ACgkQN1Ujt2V2gBwLbQCgssVulMEbAejLMFfDlUKFNLf9
G1gAn1W8NvIvIq4hMBrlTE0VOwKkMXFK
=uJlw
-----END PGP SIGNATURE-----

--6o78gXsyQHm68LY/--
