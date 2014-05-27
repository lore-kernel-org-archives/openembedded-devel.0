Return-Path: <martin.jansa@gmail.com>
Received: from mail-pa0-f53.google.com (unknown [209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 11F456FA53
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 09:18:08 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id kp14so8836124pab.40
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 02:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=YLpB/TjUV7Jdw5kE9iAaTEo0cHsIcajjDekGag188uI=;
	b=xrzmiPID5XJbztPN5bcjtKwgzhzSbamWao4ivgjeYadLbZXUfKeAetdDMSAdUkIcnL
	W6jYNLao+oiuUGzYdem7BXXQf8kZv6vwcixD9XaW/kR28091DRWKB5CtwNRoYJnkqyOu
	mInWCOJ09RDNtqTDjK1FR+LERZlU6zg4vMJcZwOGlX9OaKTxi5uWmQwec+kdMfmAQOGb
	Ff8W2VRIIrJEMqIXchy0/ZDVZtIaKNps0Q2egAbYD60cz+rCXxjlW930iFhY8dhpr8ih
	s90eecRo7GbbYymf+TN3J/hjhAflntGVehZDzlq/fhX2c+ytfVXyltVmjuQ0SH2d0LuL
	iiEQ==
X-Received: by 10.68.110.129 with SMTP id ia1mr35218570pbb.158.1401182289902; 
	Tue, 27 May 2014 02:18:09 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	yv7sm70659537pac.33.2014.05.27.02.18.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 May 2014 02:18:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 27 May 2014 11:18:13 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140527091813.GA2426@jama>
References: <1401132459-26526-1-git-send-email-ashcharles@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1401132459-26526-1-git-send-email-ashcharles@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] eject: link po subdirectory for out-of-tree build
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
X-List-Received-Date: Tue, 27 May 2014 09:18:14 -0000
X-Groupsio-MsgNum: 50065
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline

--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2014 at 12:27:39PM -0700, Ash Charles wrote:
> The po subdirectory is not copied over to the build directory of
> found on the VPATH for an out-of-tree build so we symlink it over.
>=20
> Signed-off-by: Ash Charles <ashcharles@gmail.com>
> ---
>  meta-oe/recipes-support/eject/eject_2.1.5.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/eject/eject_2.1.5.bb b/meta-oe/recip=
es-support/eject/eject_2.1.5.bb
> index c47c653..5c9c749 100644
> --- a/meta-oe/recipes-support/eject/eject_2.1.5.bb
> +++ b/meta-oe/recipes-support/eject/eject_2.1.5.bb
> @@ -14,7 +14,9 @@ SRC_URI[sha256sum] =3D "ef9f7906484cfde4ba223b2682a3705=
8f9a3c7d3bb1adda7a34a67402e
> =20
>  S =3D "${WORKDIR}/${BPN}"
> =20
> -PR =3D "r1"

This will make version going backwards and we don't want that, you can
drop PR only when incrementing PV or PE.

> +do_compile_prepend() {
> +    ln -s ${S}/po po
> +}
> =20
>  ALTERNATIVE_${PN} =3D "volname eject"
>  ALTERNATIVE_LINK_NAME[volname] =3D "${bindir}/volname"
> --=20
> 1.8.3.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlOEWFUACgkQN1Ujt2V2gBxASwCfcgF9gwIUpOE3v2/9QlJk6ykH
hm0AnjfqkbSLrK1uHcGYb5mIYshUn2sP
=tlNt
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
