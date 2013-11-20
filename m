Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8ADEC6D959
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2013 16:36:29 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id b47so2387565eek.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2013 08:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZOiyGlaxzqnwIyS/NbV+TVRojyki5w1OOZ22arbUznI=;
	b=aSrDmC3nYwhLpN1m0mnnDNlMxrS5f0Y5eApxHoEQ8OjD9RDufllZzODXxiMc0sQR6m
	VrFCi7GydWn2Lkkaeo3j60asHD+rG7s2/Hfqf+rBkwwRx17Ul5oSW8gXOa9xOGGadqlV
	Nt1j6rD1TZnUF8GdhyCJZdPKl7WMvRIOgZN5y6ot2AwWLomz7p1j7pGwPzRQaqRZizWB
	6G9ypvVe21K/EDmk9d9v4gp0QX5fwMHdj5IHG4/gN+XvMxb25CtlOqyWo608uS+OPowP
	a8fGWGVB2OZfcyCQ6brU/pdaGohV8uz246Ca2Ocy+rA0ehpw9l3FI4pvEADxRAx9FfGc
	K4lg==
X-Received: by 10.15.100.198 with SMTP id bn46mr2037824eeb.11.1384965390318;
	Wed, 20 Nov 2013 08:36:30 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id o1sm4373260eea.10.2013.11.20.08.36.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Nov 2013 08:36:29 -0800 (PST)
Date: Wed, 20 Nov 2013 17:36:32 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131120163632.GQ3708@jama>
References: <1384888434-21526-1-git-send-email-daniel.mcdougall@liftoffsoftware.com>
MIME-Version: 1.0
In-Reply-To: <1384888434-21526-1-git-send-email-daniel.mcdougall@liftoffsoftware.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH] python-pip: Fixed description in .bb file
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
X-List-Received-Date: Wed, 20 Nov 2013 16:36:30 -0000
X-Groupsio-MsgNum: 47209
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JQ29orswtRjjfiJM"
Content-Disposition: inline

--JQ29orswtRjjfiJM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2013 at 07:13:54PM +0000, Dan McDougall wrote:
> The DESCRIPTION was the same as the Tornado package which is incorrect.
>=20
> Signed-off-by: Dan McDougall <daniel.mcdougall@liftoffsoftware.com>
> ---
>  meta-oe/recipes-devtools/python/python-pip_1.3.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb b/meta-o=
e/recipes-devtools/python/python-pip_1.3.1.bb
> index 7ab3bd8..76b8c67 100644
> --- a/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb
> +++ b/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb
> @@ -1,4 +1,4 @@
> -DESCRIPTION =3D "Tornado is an open source version of the scalable, non-=
blocking web server and tools that power FriendFeed."
> +DESCRIPTION =3D "A tool for installing and managing Python packages."
>  LICENSE =3D "MIT & GPL"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dcd00425a3465a0e4c81929b94=
241d3de"

Can you rebase on current master?

My repo shows correct SUMMARY since it was added by koen:

meta-oe/recipes-devtools/python/python-pip_1.3.1.bb
SUMMARY =3D "PIP is a tool for installing and managing Python packages."

OE @ ~/meta-openembedded $ git log --pretty=3Dfuller meta-oe/recipes-devtoo=
ls/python/python-pip_1.3.1.bb
commit 5cf24c4e8d2ae69f99f3a562708734167b3ceb2a
Author:     Koen Kooi <koen@dominion.thruhere.net>
AuthorDate: Mon Oct 14 13:20:39 2013 +0000
Commit:     Martin Jansa <Martin.Jansa@gmail.com>
CommitDate: Tue Oct 15 13:36:59 2013 +0200

    python-pip: add 1.3.1
   =20
    Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>


> =20
> --=20
> 1.8.1.2
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JQ29orswtRjjfiJM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKM5RAACgkQN1Ujt2V2gBzLSQCeIoh6rrj1E1AcVynG/VbWW5B4
6CAAnjFjzFLNt9D32/yMTM0skVksB6fG
=O3id
-----END PGP SIGNATURE-----

--JQ29orswtRjjfiJM--
