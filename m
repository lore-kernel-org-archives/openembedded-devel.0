Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4FAFA71F23
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Dec 2014 10:31:43 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id h11so1178924wiw.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Dec 2014 02:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1d91bM8ujR7Rfy+7oXl3iI5X0uHBu3Mw/+0rYUrqzII=;
	b=gDbZWo15mBGWT9749qc/6Z2R48VItLTUHNaLSl08yRZeQ9tqPDpPvXmNG32hPDCodI
	YvpL1jWVBa+9HbWQ8S2ZKe5t37m1+H0TNPZtW9bzxhzpNS+MiE1pCbtwspQBj225g480
	l/PQg3YyQWQF8etMqxT0WxSuz1MiPbiq3LAnZpOCoqFbk2+NnhMkWmB3USRhnMqxCpV5
	dzHcxOpZIe9fxuig9VNEJnC1F+jfeF7rW0lolbQU4yqDJ8+i/KR2i6ms2btjWqGogUGn
	u0YktJpDuCCGoCkz76nZEt2YgmGasZQDFxW6I8rTffzVl85Tngc2KhYUa9pKHNaKb0xe
	9FFw==
X-Received: by 10.194.90.10 with SMTP id bs10mr3685876wjb.43.1418121103996;
	Tue, 09 Dec 2014 02:31:43 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	j2sm1148884wjs.28.2014.12.09.02.31.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Dec 2014 02:31:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 9 Dec 2014 11:31:44 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141209103144.GI2470@jama>
References: <1405491841-24744-1-git-send-email-ting.liu@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1405491841-24744-1-git-send-email-ting.liu@freescale.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: yocto@mindchasers.com
Subject: Re: [meta-oe][PATCH 0/3] libhugetlbfs and luajit update
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
X-List-Received-Date: Tue, 09 Dec 2014 10:31:44 -0000
X-Groupsio-MsgNum: 53236
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ijf6z65S790CMqo8"
Content-Disposition: inline

--ijf6z65S790CMqo8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2014 at 02:23:58PM +0800, ting.liu@freescale.com wrote:
> From: Ting Liu <b28495@freescale.com>
>=20
> Since there are several libhugetlbfs patches to be applied, generate
> the patches based on meta-openembedded-contrib (jansa/master branch):

Fails to build for qemux86, check the logs from last world build.

> commit 76afdeedacf4497893359c5e9cb335ada6729e12
> Author: Martin Jansa <Martin.Jansa@gmail.com>
> Date:   Wed Jun 25 20:30:44 2014 +0200
>=20
>     python-cython: Add git version
>=20
> Ting Liu (3):
>   libhugetlbfs: use ARCH ppc/ppc64 for powerpc/powerpc64
>   libhugetlbfs: not build obj32 for powerpc64
>   luajit: replace MACHINEOVERRIDES fslmachine with qoriq-ppc
>=20
>  .../libhugetlbfs/libhugetlbfs_git.bb               |    6 +++++-
>  meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb    |    2 +-
>  2 files changed, 6 insertions(+), 2 deletions(-)
>=20
> --=20
> 1.7.3.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ijf6z65S790CMqo8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSGz5AACgkQN1Ujt2V2gBzgzwCfWP33IO6sw+DSGUIN07LUkQI4
dqcAn2UW7e593wtm1f1Xg/Qd4e0IyUh5
=+NyA
-----END PGP SIGNATURE-----

--ijf6z65S790CMqo8--
