Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TzmMF-0002pI-RP
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jan 2013 11:54:37 +0100
Received: by mail-wg0-f44.google.com with SMTP id dr12so963216wgb.23
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2013 02:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=oChQm0D6BnLX1Fje1YjQdXirUXdo65mDsQundVwWkxw=;
	b=lMXGKCXFQdiyuyfsOg1TlZprb7FDC/ERV5efF8jF/n9VjZBT0ASG3SSLBpFmYWeUVf
	4mfqpy/i94p8f0rCBP/6E1HkGaCJNBCoekk0ClqKdxL25UqaremqmoAaPBTeC3sDCKJa
	bzLdDmdt91zOlscuWqoqp47bPF6v/KIJVCviAMm32d+kOkorPO8dqyvjn7vX3j4qGs9K
	CbpY+CHy3LiPxbpmI8OZFEFM44yH2qEpWqvQkb/PPFxphER0xHdV3Q86iracUSOiDgK3
	cDN1Q2RjG+cpKEhBQm1PWuJjxpZrx4HUz6I4qeIDqTuox7e+eEWY8FJnpmI6z49PPiMc
	73+w==
X-Received: by 10.194.172.197 with SMTP id be5mr20274553wjc.20.1359369537887; 
	Mon, 28 Jan 2013 02:38:57 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id s10sm12739868wiw.4.2013.01.28.02.38.56
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 02:38:57 -0800 (PST)
Date: Mon, 28 Jan 2013 11:39:00 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130128103900.GR16904@jama.palm1.palmone.com>
References: <1358953883-23851-1-git-send-email-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1358953883-23851-1-git-send-email-marcin.juszkiewicz@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] libc-client: create empty libc-client package to satisfy deps of -dev one
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
X-List-Received-Date: Mon, 28 Jan 2013 10:54:39 -0000
X-Groupsio-MsgNum: 42876
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5xr6Gr0irOxp3+3c"
Content-Disposition: inline

--5xr6Gr0irOxp3+3c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 23, 2013 at 04:11:23PM +0100, Marcin Juszkiewicz wrote:
> Collected errors:
>  * satisfy_dependencies_for: Cannot satisfy the following dependencies fo=
r packagegroup-core-standalone-hhvm-sdk-target:
>  *      libc-client (=3D 2007e-r1) *
>=20
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  meta-oe/recipes-devtools/libc-client/libc-client_2007e.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-oe/recipes-devtools/libc-client/libc-client_2007e.bb b/=
meta-oe/recipes-devtools/libc-client/libc-client_2007e.bb
> index 9faa2f8..1ecbe68 100644
> --- a/meta-oe/recipes-devtools/libc-client/libc-client_2007e.bb
> +++ b/meta-oe/recipes-devtools/libc-client/libc-client_2007e.bb
> @@ -32,3 +32,4 @@ do_install() {
>          install c-client/c-client.a ${D}${libdir}/libc-client.a
>  }
> =20
> +ALLOW_EMPTY_${PN} =3D "1"

Applied, thanks.

> --=20
> 1.8.0
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5xr6Gr0irOxp3+3c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEGVUQACgkQN1Ujt2V2gBxZUQCfaCzjsfSt++Guof0630haawEH
McMAoKxeW5//Pc+N7k2QUHWM/Zi1zypI
=EWte
-----END PGP SIGNATURE-----

--5xr6Gr0irOxp3+3c--
