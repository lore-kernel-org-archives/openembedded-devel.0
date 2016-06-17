Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5C18F7665F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jun 2016 04:17:26 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id ts6so4941016pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jun 2016 21:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=JWPbfLWfR5Sy26LPyzwqxGIq5sz2RK3cPvL7HBYr4eA=;
	b=WcTSEIx65PcKHSaBTyuihsTv+eMN9syj73rxdeCsJDI7XXHRfTLvwVuA9EIkqD0Znz
	0Dk47ApcgTjOM9NkIJjkI5zEIBZEGpW8HSf04KdWC2uxJ/LOZ6WNcYoCF2JEKs50QSiO
	JuBJ3y+VZCTDyBOC3o3ntPOntrnnTzLqaOWkI7KB6x917ohfrrGXf7q0xnZWU21WSGye
	f0jvDD18BxSeq68Eg0Zcuj+/QpbIVRtpPZpl9g4Ea78wZ0mCcbhrjrm4HMcam+GVBF3i
	msqdywEsy7IRoip1PihPiu5/JzQ2Wqknbs0+bvexRIl2/eromQXLaLPKzEnS6C4kabFf
	E6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=JWPbfLWfR5Sy26LPyzwqxGIq5sz2RK3cPvL7HBYr4eA=;
	b=U1J+fEVx1NM8hyA3L9+f6H2m0fUwat+VHaG8O1BqTUVg2gD7/pLnsTutj+Rd2xJyC/
	Q3KsPMHOpn7ICF4fZpsmmGIRAmih/A9m01c5KpGszTcEd8QVvBAZlveBStRo47ijZEhq
	FA4mvHLkkZdzTYwSRPtSzroglJNRRR6JH9xcC7LAQLFNO/M5lISNwWBU7XvDE5WYKRe+
	M6BJ0xWyYW8CKEjJkz1xtPEqlNES4oheebtb9n24ymLdE6YwXW5RYAP9JNDJ1cPiz7jq
	aii7NVywxj/buzdiyWxSg7J42SdbMErVMbVWgi1r3hMdKr4k5aX6h77nm4b644EiTNU8
	MyFw==
X-Gm-Message-State: ALyK8tKcr2ZCYYJhxqV4axxpouZiX8imoIyqt4WbKKByG4T8+gqJUGofAk9YNt6ALnEe7Q==
X-Received: by 10.66.135.40 with SMTP id pp8mr4612pab.113.1466137047323;
	Thu, 16 Jun 2016 21:17:27 -0700 (PDT)
Received: from [192.168.0.6] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	j5sm23521535pfj.71.2016.06.16.21.17.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Jun 2016 21:17:26 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1465435705-3794-1-git-send-email-derek@asterius.io>
Date: Thu, 16 Jun 2016 21:17:14 -0700
Message-Id: <E49AE6D7-2850-4C61-B163-F39F26CF732A@gmail.com>
References: <1465435705-3794-1-git-send-email-derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Cc: Derek Straka <derek@asterius.io>
Subject: Re: [meta-oe][PATCH] geis: add CFLAG to ignore misleading indentations
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
X-List-Received-Date: Fri, 17 Jun 2016 04:17:27 -0000
X-Groupsio-MsgNum: 61862
Content-Type: multipart/signed;
	boundary="Apple-Mail=_BBC1FF5E-98CE-48C5-8E4C-AED1BD7B9FA3";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_BBC1FF5E-98CE-48C5-8E4C-AED1BD7B9FA3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jun 8, 2016, at 6:28 PM, Derek Straka <derek@asterius.io> wrote:
>=20
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
> meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb | 2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git =
a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb =
b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
> index bc88143..9b087a8 100644
> --- a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
> +++ b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
> @@ -24,6 +24,8 @@ SRC_URI[md5sum] =3D =
"2ff9d76a3ea5794516bb02c9d1924faf"
> SRC_URI[sha256sum] =3D =
"8a60f5683852094038904e690d23cc5a90a980fc52da67f0f28890baa25c70eb"
>=20
> EXTRA_OECONF =3D "--disable-integration-tests"
> +TARGET_CFLAGS +=3D "-Wno-error=3Dmisleading-indentation=E2=80=9D

why not fix the code

> +

>=20
> FILES_${PN}-bin =3D "${bindir}"
> RDEPENDS_${PN}-bin =3D " \
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_BBC1FF5E-98CE-48C5-8E4C-AED1BD7B9FA3
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAldjedQACgkQuwUzVZGdMxTAyQCfY8NIX0Q4Oasyd2RyUazLoE8s
rd0AoIxOe/VbdGtBgWsd+rSW4bH7B65Z
=SH3K
-----END PGP SIGNATURE-----

--Apple-Mail=_BBC1FF5E-98CE-48C5-8E4C-AED1BD7B9FA3--
