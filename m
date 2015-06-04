Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 12BA3736BA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2015 06:00:21 +0000 (UTC)
Received: by qgf75 with SMTP id 75so12458015qgf.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2015 23:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=KbCDJ99E96jsVfa8DEjMTTVZw1QV59qO4JhYVhlmmaI=;
	b=TSvcJiGOWQ0nKj1PlADMv8X6vUBLtVRsqVYlWa5a0HDx+j1SXVfRkSTT+xecbI4LO6
	xTpYaBbuRbBPM7RpaTRSEJd7UND3wFMH2fLx9gSHRKSnPSoQ0kHEbYKXCXIIwAc5A5dX
	GbnDxXEJ0K2MQJxW76A2krW9F4Ddgsh6bQrJx5uYa+xKvLb+2QhhvkQb6ouMELNhQSrd
	4s9VriueR+vvGCmYKgDGJc1POh9bwziBP43Xtodg/2NTySZ61/pAKXDG6mV/oH4nkQh4
	Ub3+FV7zrS3AbfJGV+gt2QhsJoKAzTAp/odNC5HVA5xHczKkZV97qTkjcBJO32IHwLJP
	h4/w==
X-Received: by 10.140.22.147 with SMTP id 19mr40001894qgn.52.1433397622647;
	Wed, 03 Jun 2015 23:00:22 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:243b:97d2:82f:b7e8?
	([2601:9:3580:84c:243b:97d2:82f:b7e8])
	by mx.google.com with ESMTPSA id w67sm1836464qgw.41.2015.06.03.23.00.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 03 Jun 2015 23:00:21 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1433387867-7893-1-git-send-email-armccurdy@gmail.com>
Date: Wed, 3 Jun 2015 23:00:20 -0700
Message-Id: <525EED4B-EA8D-4BA9-B9CF-DBCF3694B905@gmail.com>
References: <1433387867-7893-1-git-send-email-armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2098)
Subject: Re: [meta-qt5][PATCH] qtwebengine: duplicate i586 over-ride for i686
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
X-List-Received-Date: Thu, 04 Jun 2015 06:00:23 -0000
X-Groupsio-MsgNum: 55761
Content-Type: multipart/signed;
	boundary="Apple-Mail=_328418D2-A9DE-40A4-9EB0-74CECD502CFA";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_328418D2-A9DE-40A4-9EB0-74CECD502CFA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jun 3, 2015, at 8:17 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>=20
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
> recipes-qt/qt5/qtwebengine_git.bb | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/recipes-qt/qt5/qtwebengine_git.bb =
b/recipes-qt/qt5/qtwebengine_git.bb
> index df82dd8..682e8de 100644
> --- a/recipes-qt/qt5/qtwebengine_git.bb
> +++ b/recipes-qt/qt5/qtwebengine_git.bb
> @@ -16,6 +16,7 @@ DEPENDS +=3D " \
>=20
> COMPATIBLE_MACHINE =3D "(-)"
> COMPATIBLE_MACHINE_i586 =3D "(.*)"
> +COMPATIBLE_MACHINE_i686 =3D "(.*)=E2=80=9D

same as other patches it can consolidate the overrides for x86

> COMPATIBLE_MACHINE_x86-64 =3D "(.*)"
> COMPATIBLE_MACHINE_armv6 =3D "(.*)"
> COMPATIBLE_MACHINE_armv7a =3D "(.*)"
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_328418D2-A9DE-40A4-9EB0-74CECD502CFA
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVv6XQACgkQuwUzVZGdMxRPqQCcDHMz712y/hHfgHXAEdWL89iD
m3AAnjs8y68UA1wNRbZAd7/FT7Otl5KN
=ig1y
-----END PGP SIGNATURE-----

--Apple-Mail=_328418D2-A9DE-40A4-9EB0-74CECD502CFA--
