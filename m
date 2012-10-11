Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TMEqu-0000Pa-OA; Thu, 11 Oct 2012 11:14:48 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so6985744wib.6
	for <multiple recipients>; Thu, 11 Oct 2012 02:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7IOxBqZx1oDZo66jqw0wVl/+LfyjqPHuqxmJaHb0k7U=;
	b=Qx9CeXcSMaelgK5cMKVRram5bO5+1KaZTB/139dLtdaFEDhfDHHA8u3yF60TLbuVGU
	QJCDNSk8l83ErIaLDoZuU6zU2+rYAuQWs7K68gzOMCi52VW0N1ctuU6Fs4CscWqmxwU6
	Qp9K3Gg8uoy1Z6eKTEaWwp8BlU4DswDNrtogn7G+LNibSq7Cs1rve44QfcJu3uVh0u6f
	3QaqFtH4GVmxcuKKGosmHF170ivddJqtuZ8txPbJKaKmXGotNmcQXPB8YqplEoq6Bvgs
	BaxMsyBaI14hA1vc7MRn6+eVRIK+BN7Q+GMa3prKMvMDIbBz4rD/bRAuE3Pkg0Ju//NR
	fhuQ==
Received: by 10.216.193.136 with SMTP id k8mr99704wen.188.1349946098601;
	Thu, 11 Oct 2012 02:01:38 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f1sm34366873wiy.2.2012.10.11.02.01.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 11 Oct 2012 02:01:37 -0700 (PDT)
Date: Thu, 11 Oct 2012 11:01:33 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121011090133.GA3589@jama.jama.net>
References: <20121010104253.EB7AB1034A@opal>
MIME-Version: 1.0
In-Reply-To: <20121010104253.EB7AB1034A@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Otavio Salvador : libav: Change the PACKAGES_DYNAMIC expression to be more restrict
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
X-List-Received-Date: Thu, 11 Oct 2012 09:14:48 -0000
X-Groupsio-MsgNum: 41054
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Content-Disposition: inline

--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 10, 2012 at 10:42:52AM +0000, git@git.openembedded.org wrote:
> Module: meta-openembedded.git
> Branch: master
> Commit: 97350f52280ea9b2f3d7b36ef248be5ba3e7c696
> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit=
;h=3D97350f52280ea9b2f3d7b36ef248be5ba3e7c696
>=20
> Author: Otavio Salvador <otavio@ossystems.com.br>
> Date:   Sat Oct  6 20:18:30 2012 +0000
>=20
> libav: Change the PACKAGES_DYNAMIC expression to be more restrict
>=20
> Using 'lib*' we end having problem with every other package that
> generate libraries dynamically thus we changed it to match the library
> prefixes.
>=20
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>=20
> ---
>=20
>  meta-oe/recipes-multimedia/libav/libav.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta-oe/recipes-multimedia/libav/libav.inc b/meta-oe/recipes=
-multimedia/libav/libav.inc
> index aa170c5..4a1716f 100644
> --- a/meta-oe/recipes-multimedia/libav/libav.inc
> +++ b/meta-oe/recipes-multimedia/libav/libav.inc
> @@ -119,4 +119,4 @@ python populate_packages_prepend() {
>                        allow_links=3DTrue)
>  }
> =20
> -PACKAGES_DYNAMIC =3D "lib*"
> +PACKAGES_DYNAMIC =3D "lib(av(codec|device|filter|format|util)|postproc)*"

Unfortunatelly this does not work, this regexp matches everything starting =
with 'lib',=20
so it's only a bit more strict then old version which matched everything st=
arting with 'li' :).

Please change it to:
PACKAGES_DYNAMIC =3D "^lib(av(codec|device|filter|format|util)|postproc)"
or
PACKAGES_DYNAMIC =3D "^lib(av(codec|device|filter|format|util)|postproc).*"

^ isn't used in any PACKAGES_DYNAMIC in oe-core, but it could make matching=
 faster
* is used wrong in all PACKAGES_DYNAMIC in oe-core (as in glob, but not reg=
exp), so all those last '-' are optional

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlB2iu0ACgkQN1Ujt2V2gBxfnACeJZ1rCmIC1gj+oJoH6bKXyYPp
6YwAni44uH30Guxhnj/oMe8QNoEvaJ6I
=EZpv
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--
