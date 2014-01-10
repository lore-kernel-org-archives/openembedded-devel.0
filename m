Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2718F6B5B0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jan 2014 15:28:08 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id t10so286054eei.35
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jan 2014 07:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3IK/u0vB8Dci19mw8XGpWkHdZUT1pQjR57J+DTAVxrk=;
	b=lQmRcWXIhWie1arbsqm4llX9vaXudCPjTHEbYyBr/g4ghd2WlzkN88vsDjTLAbSDln
	/cq1gFlO6fq8FHwO87LTAVyNsH/GpQ5ijbvg6+TcJTKkItzbaAINborhY1N9bxVEoine
	jmtox2rWsQ9DGOztof9J3LKTw4OlhN5kSCgK1SHPvr9m3ViKLjxR2AolRad4uhOkPm7p
	4PwsjuKBSK8WAUyk49FrPDwC9WMDQx13cPhh6jIeA2AaP6W/HJTAqPjwJyQoxIV0X6M6
	TgkS1hIrbidEGS1MB/mwAAv0pnS8Si0f52RWmV+43vzcIrTHol47rD/3nMS21HmCxKmP
	0qRg==
X-Received: by 10.14.179.130 with SMTP id h2mr10774887eem.34.1389367688877;
	Fri, 10 Jan 2014 07:28:08 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 7sm15373403eee.12.2014.01.10.07.28.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Jan 2014 07:28:08 -0800 (PST)
Date: Fri, 10 Jan 2014 16:28:20 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140110152820.GU3709@jama>
References: <1389289978-29274-1-git-send-email-gjohnson@agleader.com>
	<EF93C63B81FE3D4F81C98317512457471295D9D459@agmail-mb1>
MIME-Version: 1.0
In-Reply-To: <EF93C63B81FE3D4F81C98317512457471295D9D459@agmail-mb1>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-qt5][PATCH] nativesdk-qtbase_5.1.1.bb: Add path to qtbase patches.
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
X-List-Received-Date: Fri, 10 Jan 2014 15:28:09 -0000
X-Groupsio-MsgNum: 47685
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="w0UR4PnfivBOHDek"
Content-Disposition: inline

--w0UR4PnfivBOHDek
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 09, 2014 at 11:56:56AM -0600, Gabe Johnson wrote:
> The package would not build because the patches could not be found.

Missing SOB line.

> ---
>  recipes-qt/qt5/nativesdk-qtbase_5.1.1.bb |    2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/recipes-qt/qt5/nativesdk-qtbase_5.1.1.bb b/recipes-qt/qt5/na=
tivesdk-qtbase_5.1.1.bb
> index 8fd161a..6e4f488 100644
> --- a/recipes-qt/qt5/nativesdk-qtbase_5.1.1.bb
> +++ b/recipes-qt/qt5/nativesdk-qtbase_5.1.1.bb
> @@ -1,5 +1,7 @@
>  require qt5-${PV}.inc
>  require ${PN}.inc
>=20
> +FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/qtbase-${PV}:"
> +
>  SRC_URI[md5sum] =3D "955d1e4da875f3872ef3208f21a757dd"
>  SRC_URI[sha256sum] =3D "d4620e0b1aff6d2b6f4d8066e6f8258e012a8b5507af7c03=
b661029a1ffa75c9"
> --
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--w0UR4PnfivBOHDek
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLQEZQACgkQN1Ujt2V2gBx6FgCfUG76ZYq+DkOISbkfBiP32Xd5
/84AnjAdXbY55pqX7xgqmzqykkZ8Z0PD
=ufoM
-----END PGP SIGNATURE-----

--w0UR4PnfivBOHDek--
