Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id B06536CE8C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 12:45:12 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e52so4001335eek.30
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Oct 2013 05:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=T4PB1n3w8arw6eWmbwUY/laftrORLV48Va1wukv+T4E=;
	b=FMnoNWh6/1rhLjsrGEr4Ih9JM2FH03a8C8MfScE+TI70E2fUHXm5lY/vhLXxQxge0p
	xLr3y/EkeCEDfxIjjo8sXTQ2Cu1Kp6sIk3P7WmSvBM8OyzJrGWAQd9if0nbx8K+0xFIL
	roep8ZmwOuRG5PI1pakgki7XSuZgEgPRZP06IAb2GHEUCTEemTdVg+h5XrNC+n7DHoz3
	qJSUAbIBQc4OByRkpM/z/3JbZGKJ5cPFeR8S1qKYmG93IL0fOXhyCaBOmLQ67RzO6m3M
	UkohikBRKgts2BrSGfOi8f1HNGWPNEBM7q3i5N3tz1KSkWAdasFZQsKRvsCBz/ljkp/T
	nNuQ==
X-Received: by 10.14.1.132 with SMTP id 4mr1784740eed.84.1381236313870;
	Tue, 08 Oct 2013 05:45:13 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	j7sm75569618eeo.15.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 08 Oct 2013 05:45:13 -0700 (PDT)
Date: Tue, 8 Oct 2013 14:45:23 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131008124523.GA2872@jama>
References: <1381236055-734-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1381236055-734-1-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-qt5][PATCH] cinematicexperience: fix typo
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
X-List-Received-Date: Tue, 08 Oct 2013 12:45:14 -0000
X-Groupsio-MsgNum: 46546
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Content-Disposition: inline

--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 08, 2013 at 02:40:55PM +0200, Eric B=E9nard wrote:
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> ---
>  recipes-qt/examples/cinematicexperience_1.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/recipes-qt/examples/cinematicexperience_1.0.bb b/recipes-qt/=
examples/cinematicexperience_1.0.bb
> index 3fa6f06..9ee5532 100644
> --- a/recipes-qt/examples/cinematicexperience_1.0.bb
> +++ b/recipes-qt/examples/cinematicexperience_1.0.bb
> @@ -32,7 +32,7 @@ do_install() {
>      echo "#!/bin/sh" > ${D}${bindir}/Qt5_CinematicExperience
>      echo "export QML_IMPORT_PATH=3D${datadir}/${P}" >> ${D}${bindir}/Qt5=
_CinematicExperience
>      echo "export QML2_IMPORT_PATH=3D${datadir}/${P}" >> ${D}${bindir}/Qt=
5_CinematicExperience
> -    echo "${datadir}/${P}/Qt5_CinematicExperiencea \$* " >> ${D}${bindir=
}/Qt5_CinematicExperience
> +    echo "${datadir}/${P}/Qt5_CinematicExperience \$* " >> ${D}${bindir}=
/Qt5_CinematicExperience
>      chmod +x ${D}${bindir}/Qt5_CinematicExperience
>  }

Thanks, I'll squash this into cinematicexperience commit.

> =20
> --=20
> 1.8.4.rc3
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlJT/mMACgkQN1Ujt2V2gBxvjACgqwvOS+rbdVkxlr8Oj9KINEdp
WuIAnA9WAU+I4DqTdDkLkPEQGXnq6/bF
=HODs
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--
