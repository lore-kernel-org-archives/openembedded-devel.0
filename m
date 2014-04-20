Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3B35865D2C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 09:29:16 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id e49so2880806eek.31
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 02:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OdjxsBGtqvDO6qO5wqeDphdvUCz1QDvxfwuJmY3sxKk=;
	b=vkRg6ux2z5YQowplcNBUomEJRM5DadqxBMJ3uOcnSmqWdFKLXB293OmIQZwTJ3rzdf
	zvz1yK7DjhiKpRtWmg0DfqRKZ+mZf0HbDR7XB3AiqmRBiXND6dK6Bm7Z+Bb54vM6hIwC
	Lg0po/kpjo3ZlUshRt5u6oRHL93hZegBxnsPH7d+IZgm2N7i9c+WeJbLbkOEh+okut+O
	bkCKCGOK+puR8ckjWpJ1aEikuPiZY9mHpc1Yy7Y2/7O+TN38WIOtusd7AY5LdjM6Ox7w
	59DbbCEfHtzo/RT1mdFtx98KcRiIEoyAsO5rMSvu5awYQDzXd2JnLtoisxbtRlCb7YRo
	BCEQ==
X-Received: by 10.15.53.69 with SMTP id q45mr37262212eew.22.1397986157492;
	Sun, 20 Apr 2014 02:29:17 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m8sm93008103eeg.11.2014.04.20.02.29.16 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 02:29:16 -0700 (PDT)
Date: Sun, 20 Apr 2014 11:29:21 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420092921.GG2486@jama>
References: <1397095971-17039-1-git-send-email-trevor.woerner@linaro.org>
	<1397095971-17039-2-git-send-email-trevor.woerner@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1397095971-17039-2-git-send-email-trevor.woerner@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: patches@linaro.org
Subject: Re: [meta-gnome][PATCH] abiword: force build order
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
X-List-Received-Date: Sun, 20 Apr 2014 09:29:19 -0000
X-Groupsio-MsgNum: 49314
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LYDt+Tnt2WQ/hIRe"
Content-Disposition: inline

--LYDt+Tnt2WQ/hIRe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 09, 2014 at 10:12:51PM -0400, Trevor Woerner wrote:
> There is a race condition whereby "libgoffice.la" must be built (and exis=
t)
> before the rest of the code in "src" is built.

Merged, thanks

>=20
> Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
> ---
>  meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb b/meta-gno=
me/recipes-gnome/abiword/abiword_3.0.0.bb
> index 69d62ef..073622a 100644
> --- a/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb
> +++ b/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb
> @@ -50,6 +50,14 @@ do_configure() {
>      autotools_do_configure
>  }
> =20
> +do_compile() {
> +    cd ${S}/goffice-bits2
> +    make goffice-paths.h
> +    make libgoffice.la
> +    cd ${S}
> +    oe_runmake
> +}
> +
>  PACKAGES +=3D " ${PN}-clipart ${PN}-strings ${PN}-systemprofiles ${PN}-t=
emplates "
> =20
>  FILES_${PN} +=3D " \
> --=20
> 1.9.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LYDt+Tnt2WQ/hIRe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTk3EACgkQN1Ujt2V2gBxFvACfYeoWGFCmCzFfChLo+RhQmofX
XaEAnRkID5aCh4nTt+mII2qDYrYtIAN1
=EMel
-----END PGP SIGNATURE-----

--LYDt+Tnt2WQ/hIRe--
