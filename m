Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 145E86F19F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2014 10:35:56 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so125193eek.19
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2014 02:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Mosyslvgy486tOmo3ILtWJk91wlytg3ZSMTzK/GKftU=;
	b=c3ywTvj4ERiN+ANFQMt1mor3qyFHzaVQsnSykvMbTa4Sw4vsqcEPdEEiu6/pMWfmmW
	il0bTjI8JQuMjnxAr86aJaPZ+5SYBo3b2m+muW//09UUolTwyjNhl/Qnq0AzVyO5Llzs
	Fcs/Ge/BH8uRiFTJiCM6oGoCKSxqwHQVQEaFGUsEgF5rTLc3sTG+l18Okg3TdRSRrwH8
	gZY1Knpu/Rt8f/FTHzHgokp95jBBjYGKVrpD3Wrq2tzVDFBFVy2fRDLcXLhPqJonpuQG
	bV4Z+0o6aBgnu9Ye52zR4ncNdmYHrnqsG2mRd3VJ1FrKIfeqKEsu6ElKAPKoCzOKWnU7
	HvRQ==
X-Received: by 10.14.194.2 with SMTP id l2mr39696893een.39.1392806157366;
	Wed, 19 Feb 2014 02:35:57 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m1sm81400561een.7.2014.02.19.02.35.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Feb 2014 02:35:55 -0800 (PST)
Date: Wed, 19 Feb 2014 11:36:29 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140219103629.GB3854@jama>
References: <1392384763-2300-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<8672BB614B4CCA40A6B3BDD6FD82050B575425A8@COSNADEXC13.usr.ingenico.loc>
MIME-Version: 1.0
In-Reply-To: <8672BB614B4CCA40A6B3BDD6FD82050B575425A8@COSNADEXC13.usr.ingenico.loc>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [PATCH] bash-completion: fix 'files already exist' WARNING message
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
X-List-Received-Date: Wed, 19 Feb 2014 10:35:58 -0000
X-Groupsio-MsgNum: 48223
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z6Eq5LdranGa6ru8"
Content-Disposition: inline

--z6Eq5LdranGa6ru8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2014 at 10:29:32AM +0000, Matthieu CRAPET wrote:
> Oops forgot Signed-off line, should I repost it ?

I'll add it for you.

>=20
> -----Message d'origine-----
> De=A0: openembedded-devel-bounces@lists.openembedded.org [mailto:openembe=
dded-devel-bounces@lists.openembedded.org] De la part de Matthieu Crapet
> Envoy=E9=A0: vendredi 14 f=E9vrier 2014 14:33
> =C0=A0: openembedded-devel@lists.openembedded.org
> Objet=A0: [oe] [PATCH] bash-completion: fix 'files already exist' WARNING=
 message
>=20
> Some bash completion commands are already provided by util-linux recipe.
> Also disable parallel build because "symlinks" rule is buggy (see complet=
ions/Makefile.am).
> ---
>  meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb | 10 ++++=
++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/meta-oe/recipes-support/bash-completion/bash-completion_2.0.=
bb b/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb
> index 411b9b7..014d122 100644
> --- a/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb
> +++ b/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb
> @@ -5,6 +5,8 @@ BUGTRACKER =3D "https://alioth.debian.org/projects/bash-c=
ompletion/"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
> =20
> +PR =3D "r1"
> +
>  SECTION =3D "console/utils"
> =20
>  SRC_URI=3D"http://bash-completion.alioth.debian.org/files/${BPN}-${PV}.t=
ar.bz2"
> @@ -12,11 +14,19 @@ SRC_URI=3D"http://bash-completion.alioth.debian.org/f=
iles/${BPN}-${PV}.tar.bz2"
>  SRC_URI[md5sum] =3D "0d903f398be8c8f24bc5ffa6f86127f8"
>  SRC_URI[sha256sum] =3D "e5a490a4301dfb228361bdca2ffca597958e47dd6056005e=
f9393a5852af5804"
> =20
> +PARALLEL_MAKE =3D ""
> +
>  inherit allarch autotools
> =20
>  do_install_append() {
>  	install -d ${D}${sysconfdir}/bash_completion.d/
>  	echo '. ${datadir}/${BPN}/bash_completion' >${D}${sysconfdir}/bash_comp=
letion
> +
> +	# Delete files already provided by util-linux
> +	local i
> +	for i in cal dmesg hwclock ionice look renice rtcwake; do
> +		rm ${D}${datadir}/${BPN}/completions/$i
> +	done
>  }
> =20
>  RDEPENDS_${PN} =3D "bash"
> --=20
> 1.8.5.4
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--z6Eq5LdranGa6ru8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMEiS0ACgkQN1Ujt2V2gBwPHwCfdqbnf3MHGZjPyN+3U1ZmUvqD
ZjkAmweqVuui4B3dtKQf7KfqVC+tYPJu
=H7gV
-----END PGP SIGNATURE-----

--z6Eq5LdranGa6ru8--
