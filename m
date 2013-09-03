Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 184866BD11
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 17:53:21 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id n15so3171153ead.30
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Sep 2013 10:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JmDoXvUMGl3aQtaYgWzPMKgq21o8YWlwoOHyFKAgtI8=;
	b=i/3w6SNVjwrSmeKRqhCdlaOWNq/5bT7FtkwIp+HhcvzfxzZbkV69pgSUNM49JO8Jzq
	72Yg6a8TeN3l2XyjYklVpcz1SWXcSun83UwvxsCIgyzjqKD4C+luGU2Uk+IB0hFEHq35
	ws9iRMezu9G8jBmDInTDhvFyFo7J2q/45Yo1diyao150a96v4uV+B2vyNqluvUhOd5Lt
	j2VnIoiWRmYZ9M7+4aMAzG/R4wEd5loLJVWQwbrRqppXZyumMGYUFHOLtT61onsgwb48
	8L4Eu81wSiWNPD52qRUyX2KodKOYZJHkqCi780oeQEvk+r3Q6ch2xwYWkg3ytPSsyGuW
	VT+w==
X-Received: by 10.14.115.133 with SMTP id e5mr48385544eeh.27.1378230802317;
	Tue, 03 Sep 2013 10:53:22 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bn13sm33366426eeb.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 03 Sep 2013 10:53:22 -0700 (PDT)
Date: Tue, 3 Sep 2013 19:54:40 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
Message-ID: <20130903175440.GB3553@jama>
References: <1377513195-21664-1-git-send-email-fathi.boudra@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1377513195-21664-1-git-send-email-fathi.boudra@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: koen@dominion.thruhere.net, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 0/3] ACPICA updates
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
X-List-Received-Date: Tue, 03 Sep 2013 17:53:22 -0000
X-Groupsio-MsgNum: 46045
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1LKvkjL3sHcu1TtY"
Content-Disposition: inline

--1LKvkjL3sHcu1TtY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2013 at 01:33:12PM +0300, Fathi Boudra wrote:
> Fathi Boudra (3):
>   acpica: fix parallel build
>   acpica: fix recipe to be OE compliant with spacing
>   acpica: bump to version 20130823

All 3 applied, thanks!

>=20
>  meta-oe/recipes-extended/acpica/acpica_20130626.bb | 37 ----------
>  meta-oe/recipes-extended/acpica/acpica_20130823.bb | 37 ++++++++++
>  .../acpica/files/fix-parallel-build.patch          | 80 ++++++++++++++++=
++++++
>  3 files changed, 117 insertions(+), 37 deletions(-)
>  delete mode 100644 meta-oe/recipes-extended/acpica/acpica_20130626.bb
>  create mode 100644 meta-oe/recipes-extended/acpica/acpica_20130823.bb
>  create mode 100644 meta-oe/recipes-extended/acpica/files/fix-parallel-bu=
ild.patch
>=20
> --=20
> 1.8.1.2
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1LKvkjL3sHcu1TtY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlImImAACgkQN1Ujt2V2gBwlIACglYSoU8n9MIn2GwDRm/TDH2ss
mS8AniCcywoDQeIsI7vS/Nn939nY0que
=Z6o5
-----END PGP SIGNATURE-----

--1LKvkjL3sHcu1TtY--
