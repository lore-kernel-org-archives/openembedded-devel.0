Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id EA4466E73C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 18:02:09 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id e49so5205528eek.28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 10:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pLO0Nvp7eBmcJGEgWyMqMbVsFNgwwbhNgwLR7L98x7U=;
	b=QM4aSdv9rtPt52rTtdRu8QKtXeObG9NJR15UiANHZcVhJbGuIp29DEYRhnkLWosgDR
	Fgr2aQsk6Zke3d6uY61/iIg06U1petUFj93z6i4J7uVqRlEpRan+jiz2gVduVMTj5ILI
	3DfHkTU55QVM1BwTf4tqrXRp7kAd53qvYX9Dq/StIEph9rg73SWi5yiQjimVnu7YxRPB
	nxmVVP9Zhu24DeNdwPKkyIUaN/hVJ9zrn3cOtv0crYta8sxvD3Dqdc05iEE+d/fCuzhE
	TqQUQ6y3aPbH6IZZ4/ZzGIjxNzdTxWSNtIVZcmVvZetiZUoyOcGCdYL9Vc5lcrJx5U+b
	Fv1g==
X-Received: by 10.15.68.129 with SMTP id w1mr2989693eex.26.1390413730186;
	Wed, 22 Jan 2014 10:02:10 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id k41sm29829458eey.0.2014.01.22.10.02.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Jan 2014 10:02:09 -0800 (PST)
Date: Wed, 22 Jan 2014 19:02:08 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140122180208.GW4100@jama>
References: <1387232705-18081-1-git-send-email-eu@felipetonello.com>
	<52E00310.4000808@felipetonello.com>
MIME-Version: 1.0
In-Reply-To: <52E00310.4000808@felipetonello.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [PATCH v2] packagekit: Updated to 0.8.13
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
X-List-Received-Date: Wed, 22 Jan 2014 18:02:10 -0000
X-Groupsio-MsgNum: 47889
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/Y6L//1es8ezVqBy"
Content-Disposition: inline

--/Y6L//1es8ezVqBy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2014 at 09:42:40AM -0800, Felipe Ferreri Tonello wrote:
> On 12/16/2013 02:25 PM, Felipe F. Tonello wrote:
> > From: "Felipe F. Tonello" <eu@felipetonello.com>
> >
> > Packagekit will compile support for all backend supported by OE-core. I=
mages
> > that want to install packagekit should specify its correct backend depe=
ndency
> > as well.
> >
> > Ex.: install the following packages to an image that uses rpm:
> >   * packagekit
> >   * packagekit-backend-smart
> >
> > Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
> > ---
> >   ...deprecated-glib-functions-and-use-the-new.patch | 166 --------
> >   .../packagekit/packagekit-0.5.6/configurefix.patch |  13 -
> >   .../packagekit/packagekit-0.5.6/opkgfixes.patch    | 422 ------------=
---------
> >   .../packagekit/packagekit_0.5.6.bb                 |  62 ---
> >   .../packagekit/packagekit_0.8.13.bb                |  64 ++++
> >   5 files changed, 64 insertions(+), 663 deletions(-)
> >   delete mode 100644 meta-oe/recipes-devtools/packagekit/packagekit-0.5=
=2E6/0001-Don-t-call-deprecated-glib-functions-and-use-the-new.patch
> >   delete mode 100644 meta-oe/recipes-devtools/packagekit/packagekit-0.5=
=2E6/configurefix.patch
> >   delete mode 100644 meta-oe/recipes-devtools/packagekit/packagekit-0.5=
=2E6/opkgfixes.patch
> >   delete mode 100644 meta-oe/recipes-devtools/packagekit/packagekit_0.5=
=2E6.bb
> >   create mode 100644 meta-oe/recipes-devtools/packagekit/packagekit_0.8=
=2E13.bb
> >
>=20

Looks good to me, I'm just waiting for Koen's ACK as he had some
comments before.

> Any updates on this?
>=20
> Felipe
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/Y6L//1es8ezVqBy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLgB6AACgkQN1Ujt2V2gBzrigCgsj65xAXJQPMazoIm8SCpVaoz
hxIAn1qF7yztWnTjWHFpuPKMMiZpa213
=DGeq
-----END PGP SIGNATURE-----

--/Y6L//1es8ezVqBy--
