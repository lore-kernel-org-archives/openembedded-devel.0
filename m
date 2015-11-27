Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id CE7A860132
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Nov 2015 08:28:27 +0000 (UTC)
Received: by wmec201 with SMTP id c201so48667050wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Nov 2015 00:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0l4mRpNJ1Cv8vBIKUpBQjsgbjvwSs4gWF48fP77+hxk=;
	b=RxXvibyeWMm7ajyctA9lxDYW3aFblstHgTHlFXDxFkDHbYoKjQZ5Ac5Jj7XYhG/JbA
	88hDKFm9ojNS2NWZzrGW14BWDeWXBpjlImFltSselwMKotRT6Omku4imNSvmhZLR2Zbn
	k7C67Ioh/Ejko+pSxXGJbuf7ARFXSs0FruKEvxizcTx/Av8J9hVWEARTl8OaRx5AIjI1
	gy77+NOUVacKCfOrd6YpbCMVgjEdTYdraFVTdmJoaAQq7BSnUxtdxJIfQAoixgTQ9D8f
	RoGRChTkhUH3qwPrv4byGz544OVm4GI+SoENogXEoStrHgtAzGVf8IqeMjnVSQRK/cly
	8aLQ==
X-Received: by 10.194.62.14 with SMTP id u14mr50523059wjr.24.1448612907668;
	Fri, 27 Nov 2015 00:28:27 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	l20sm6345317wmd.20.2015.11.27.00.28.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Nov 2015 00:28:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 27 Nov 2015 09:29:02 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151127082902.GX17303@jama>
References: <1448604209-8638-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1448604209-8638-1-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-networking][PATCH v2] wireshark: update to version 2.0.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Nov 2015 08:28:29 -0000
X-Groupsio-MsgNum: 58835
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9Wosya/OiUJZ+2ov"
Content-Disposition: inline

--9Wosya/OiUJZ+2ov
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2015 at 10:03:29PM -0800, Armin Kuster wrote:
> updated comments:
>=20
> QT is the new default GUI for the binary 'wireshark'. This mode is curren=
tly disabled in the build.  We build with GTK as the default gui so the res=
ulting binary is now wireshark-gtk.
>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../wireshark/{wireshark_1.12.8.bb =3D> wireshark_2.0.0.bb}         | 8 =
++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta-networking/recipes-support/wireshark/{wireshark_1.12.8.bb =
=3D> wireshark_2.0.0.bb} (93%)
>=20
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.8.b=
b b/meta-networking/recipes-support/wireshark/wireshark_2.0.0.bb
> similarity index 93%
> rename from meta-networking/recipes-support/wireshark/wireshark_1.12.8.bb
> rename to meta-networking/recipes-support/wireshark/wireshark_2.0.0.bb
> index eee9f30..011c6e1 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_1.12.8.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_2.0.0.bb
> @@ -8,10 +8,8 @@ DEPENDS =3D "perl-native pcre expat glib-2.0 sbc"
> =20
>  SRC_URI =3D "https://2.na.dl.wireshark.org/src/${BP}.tar.bz2"
> =20
> -PE =3D "1"

You cannot drop PE as said in previous review.

> -
> -SRC_URI[md5sum] =3D "988a4595a4a87dafb3c4870ea40e89b5"
> -SRC_URI[sha256sum] =3D "357e0a4e49525d80cdc740bb16539fcdb526ad38cc2ed6ca=
bedafc9bdee5c7e7"
> +SRC_URI[md5sum] =3D "5909af2a09a9a3023ba61bc62e787ad2"
> +SRC_URI[sha256sum] =3D "90026c761a85701d7783c7e2eaa4c1de247dfbadbd53221d=
f355f121e42691dd"
> =20
>  inherit autotools pkgconfig
> =20
> @@ -55,3 +53,5 @@ do_configure_prepend() {
> =20
>  ALLOW_EMPTY_${PN} =3D "1"
>  INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> +
> +FILES_${PN} +=3D "${datadir}*"
> --=20
> 2.3.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9Wosya/OiUJZ+2ov
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZYFE4ACgkQN1Ujt2V2gBxBcwCZAc4pILqrabCu8ndh9LWt0JKE
sXYAn0Jn/SpmhRCGr2osN9V3QXlk+Jk6
=GuZF
-----END PGP SIGNATURE-----

--9Wosya/OiUJZ+2ov--
