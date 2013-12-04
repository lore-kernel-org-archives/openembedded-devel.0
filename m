Return-Path: <joe@deserted.net>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7A3A36C737
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2013 13:49:45 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g15so10658278eak.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Dec 2013 05:49:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=lSXlSz+Qhlox3mPqkAYdTuNUW+tIapjD3eZkOnRHOoo=;
	b=KWWxIAQLp6MNfAsZ3DkUU/IgMjopTgBGSXaRZLjMiQwhrPGy6cXVHf7wYAVnjBzlfp
	NI3whhOUMOgwxjA6EErSoDANWvzO7hmh44crJx2irQBP1qEMn0euoG1tvlg4OcEYk2uw
	XC7+qZ3TCnio3f/gqcOfRq292/RjXBdZXzzGloCAi5UT2b0fSpetEOSlPzcxTlQuwXFk
	MC/uuEa+YGY28jvG/uCHnRgWgQnGH69+NgZwOT/pPg0vd374+REapmo131XcFC6n4qFh
	A5GH83qICwfnw1jrsnIMAj7YnY7VbBA7+KF5/f+boQwLZitPMYva/OJLedK+TkpOKqfo
	dLdg==
X-Gm-Message-State: ALoCoQmibrVLW3opbxpHrp0wcsIC6tIL2DxCWotulB4HKvno1gMH9XL5nORhRSX19aCEOD+1E1yY
X-Received: by 10.15.63.134 with SMTP id m6mr7599967eex.74.1386164984669;
	Wed, 04 Dec 2013 05:49:44 -0800 (PST)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id a45sm94439139eem.6.2013.12.04.05.49.42
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 04 Dec 2013 05:49:43 -0800 (PST)
Date: Wed, 4 Dec 2013 08:49:39 -0500
From: Joe MacDonald <joe@deserted.net>
To: jackie.huang@windriver.com, koen@dominion.thruhere.net
Message-ID: <20131204134937.GA5677@deserted.net>
References: <1386153235-16411-1-git-send-email-jackie.huang@windriver.com>
	<l7n0m9$4go$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <l7n0m9$4go$1@ger.gmane.org>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 1/2] inetutils: fix simple bb rule error
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
X-List-Received-Date: Wed, 04 Dec 2013 13:49:45 -0000
X-Groupsio-MsgNum: 47372
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline

--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH 1/2] inetutils: fix simple bb rule error]=
 On 13.12.04 (Wed 11:39) Koen Kooi wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> jackie.huang@windriver.com schreef op 04-12-13 11:33:
> > From: Jackie Huang <jackie.huang@windriver.com>
> >=20
> > Correct the usage of alternative link and target:
>=20
> Make the above the summary, 'fix simple bb rule error' is too vague when
> looking through the output of 'git log --oneline'

Agreed.  If there's no objection, I'll change this to:

inetutils: use new update-alternatives syntax

Though that does tend to render the rest of the commit log redundant.
:-)

-J.

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>=20
> iD8DBQFSnwZqMkyGM64RGpERAvn8AJwJgmIczTwCWNuTe6TdkiGUyl+kKgCdHrcA
> ub+FZU7aXb7K84C447kCCqk=3D
> =3D6wkg
> -----END PGP SIGNATURE-----
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
-Joe MacDonald.
:wq

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlKfMukACgkQwFvcllog0XyMLQCeLPlBx2HzHbv8DY9skMTkpMGi
weoAoIBahIptuyg7+pE8c9l15D126/Hb
=1lc4
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
