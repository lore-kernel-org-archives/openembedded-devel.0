Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TLdmw-0000XW-JX
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2012 19:40:14 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so4839602wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2012 10:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SQHKdVN4i/AOZT/SsT/jtGnZMfCuwrs5sVIdx10/VUU=;
	b=yLdsR0IFwikPTvvgn8KyxrmdUcIqP0PLJUCyxDVRflI9eQVphYA4tG12TGDkP2r5pA
	506uCORnVuKeJrczwIvYgZjIKOEcJGNSjC5BNogvXd1HTUb3EUD7Tkx6q0k/FjnJHb07
	5NZNU0Ma5G/HrJFTddHlHr/EtFjPA59RKAu1qMU8XlAul+VWgGXit+hRw8kbITgkyPbS
	penL6LHT5C+tdEP3vCCao1tDOFC6XdXLgg2c3opxlCAJn5zKWLhKWUSenwncK/Z7peXk
	yJE3I1DjYc3DG/hvIpqUCyqHdVD0PMeMFWEjtTwB+I/rqPfgnCqsuvJ/sbyK7X3b6Rb4
	mE5w==
Received: by 10.216.136.157 with SMTP id w29mr12242482wei.148.1349803626773;
	Tue, 09 Oct 2012 10:27:06 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b3sm25818374wie.0.2012.10.09.10.27.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Oct 2012 10:27:05 -0700 (PDT)
Date: Tue, 9 Oct 2012 19:27:18 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121009172718.GE4715@jama.jama.net>
References: <1349784265-25901-1-git-send-email-mertsas@cisco.com>
MIME-Version: 1.0
In-Reply-To: <1349784265-25901-1-git-send-email-mertsas@cisco.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] libftdi: Change to use GPLv2 intead of GPLv2-REL
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Oct 2012 17:40:14 -0000
X-Groupsio-MsgNum: 41030
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="84ND8YJRMFlzkrP4"
Content-Disposition: inline

--84ND8YJRMFlzkrP4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 09, 2012 at 02:04:25PM +0200, Martin Ertsaas wrote:
> According to http://www.intra2net.com/en/developer/libftdi/, libftdi itse=
lf is licensed under LGPLv2,
> with some parts (eeprom programmer) is licensed under GPLv2. There doesn'=
t seem to be any part licensed
> under a GPLv2-REL variation of GPLv2, and so we should use GPLv2 instead =
of GPLv2-REL.

Is it REL or RLE? Your subject and body says REL while LICENSE says RLE.

Cheers,
=20
> Signed-off-by: Martin Ertsaas <mertsas@cisco.com>
> ---
>  meta-oe/recipes-support/libftdi/libftdi_0.19.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/libftdi/libftdi_0.19.bb b/meta-oe/re=
cipes-support/libftdi/libftdi_0.19.bb
> index 2dba3f4..0842aaf 100644
> --- a/meta-oe/recipes-support/libftdi/libftdi_0.19.bb
> +++ b/meta-oe/recipes-support/libftdi/libftdi_0.19.bb
> @@ -4,7 +4,7 @@ including the popular bitbang mode."
>  HOMEPAGE =3D "http://www.intra2net.com/en/developer/libftdi/"
>  SECTION =3D "libs"
> =20
> -LICENSE =3D "LGPLv2.1 GPLv2-RLE"
> +LICENSE =3D "LGPLv2.1 GPLv2"
>  LIC_FILES_CHKSUM=3D "file://COPYING.GPL;md5=3D751419260aa954499f7abaabaa=
882bbe \
>                     file://COPYING.LIB;md5=3Ddb979804f025cf55aabec7129cb6=
71ed \
>                    "
> --=20
> 1.7.8.6
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--84ND8YJRMFlzkrP4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlB0XnYACgkQN1Ujt2V2gBz+RQCfeyBeb8vqMjI47lcWug7XsTIO
wTAAoJXFkdXeiwsPm9mtZBxqlSAlrH7v
=sTBB
-----END PGP SIGNATURE-----

--84ND8YJRMFlzkrP4--
