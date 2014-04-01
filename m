Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4BF526B7D2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 11:39:34 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w61so6194425wes.29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 04:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2DPnostRju/jnE/5mTo2SjdY1fKzwulrbStyUEzSrN0=;
	b=sj3HuTGW30DfTufHhznzwwNQcdDLSZMsHG1AERsG1SxlH9z7Wjl43OHcnRZ4BVosmD
	4sNRyE4FKfgjQtIhlLY1T8vxr8ovEXg0l7XKmt2wNkeJJJywQjo5Dk/K9wUV/7hH4CJ4
	+lwyTEE15aPgJqnybBwyh2stUMwqsj0iK/I/8x7JHRbqzzxkDr/emC+93XpKGpFnKhKc
	Jn0vJZLhqiJ++woRS7x+2s0/i9D7DPGumEJx3Ng5Y3UgNYxHNAXFdjv38EjhjSomHiTE
	aVbfEJfSy35QpQVNmL8c9DemwiYQeuyJajcEDKI14GmHaSP8sJVUEZJQw53x6rJ9A0Zh
	JrjA==
X-Received: by 10.194.109.227 with SMTP id hv3mr22108380wjb.10.1396352375451; 
	Tue, 01 Apr 2014 04:39:35 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x45sm39988904eef.15.2014.04.01.04.39.33 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 04:39:33 -0700 (PDT)
Date: Tue, 1 Apr 2014 13:39:33 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Message-ID: <20140401113933.GL2425@jama>
References: <1396323568-18135-1-git-send-email-trevor.woerner@linaro.org>
	<1396323568-18135-5-git-send-email-trevor.woerner@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1396323568-18135-5-git-send-email-trevor.woerner@linaro.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-devel@lists.openembedded.org, patches@linaro.org
Subject: Re: [meta-oe][PATCH 4/4] gtkmathview: run through oe-stylize.py
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
X-List-Received-Date: Tue, 01 Apr 2014 11:39:40 -0000
X-Groupsio-MsgNum: 48947
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+2GlJm56SCtLHYlr"
Content-Disposition: inline

--+2GlJm56SCtLHYlr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2014 at 11:39:28PM -0400, Trevor Woerner wrote:
> Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
> ---
>  meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb b/m=
eta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
> index bc4b4cb..e743f87 100644
> --- a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
> +++ b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
> @@ -2,11 +2,9 @@ SUMMARY =3D "GtkMathView is a C++ rendering engine for M=
athML documents"
>  DESCRIPTION =3D "GtkMathView reads MathML documents by means of a fronte=
nd and \
>          renders MathML documents through a backend"

This last one doesn't apply (there is no DESCRIPTION in recipe we
currently have) did you forget to include one patch in series or did
I/patchwork missed it?

>  HOMEPAGE =3D "http://helm.cs.unibo.it/mml-widget/"
> -DEPENDS =3D "t1lib gtk+ popt libxslt libxml2"
> -
>  LICENSE =3D "LGPLv3"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6a6a8e020838b23406c81b19c1d46=
df6"
> -
> +DEPENDS =3D "t1lib gtk+ popt libxslt libxml2"
>  PR =3D "r3"
> =20
>  SRC_URI =3D "http://helm.cs.unibo.it/mml-widget/sources/${P}.tar.gz \
> --=20
> 1.9.0
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+2GlJm56SCtLHYlr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlM6pXUACgkQN1Ujt2V2gBwydwCfehaaQV1F9qdnW+r27bqbzu3m
1dQAoKYXHsG8/s0S/4CPOVyyMX97YowA
=amAe
-----END PGP SIGNATURE-----

--+2GlJm56SCtLHYlr--
