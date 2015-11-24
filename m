Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id D87FF6011C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2015 15:27:30 +0000 (UTC)
Received: by wmuu63 with SMTP id u63so101312492wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2015 07:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Fmmr7gecAgnIcFchSN/ySb2fXvqnr8z9Y5TsXePMWYg=;
	b=awE4P8+BipEnRh50exKnAfoEtWskAnQXn9NVUNIneXkv6tJwFYW1Kcbu3lLLYhc2JA
	4/oe6a/KWfr6ewezFlp4+k1sQZsq26I2DlEYtXoznrTSAtA+vG/YbG9VY03oaCE0slKR
	pXT0HNJHXMVMCMrsa0Ah1ytY2FtTIEvXW4Z3MQgegFM095eBGeJ9enMuhtE1xfjw6wEs
	GwpkN3q1MCoWgI9VQCmLs92gh6Z35udTLPckV0v28hHCTkkpAP/f4JaJzNugj9EGATJK
	9Ddg/++qMZEjugRNK60cUTtpASkhg7libG7VPK60Uo4C96vpJrwhdo8AWVlamGK2fIz1
	3D9A==
X-Received: by 10.194.235.230 with SMTP id up6mr43760242wjc.178.1448378850980; 
	Tue, 24 Nov 2015 07:27:30 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	q6sm18734825wjx.28.2015.11.24.07.27.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Nov 2015 07:27:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 24 Nov 2015 16:28:02 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151124152802.GG17303@jama>
References: <1448378045-23497-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1448378045-23497-1-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-networking][PATCH] wireshark: update to version 2.0.0
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
X-List-Received-Date: Tue, 24 Nov 2015 15:27:31 -0000
X-Groupsio-MsgNum: 58805
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EdRE1UL8d3mMOE6m"
Content-Disposition: inline

--EdRE1UL8d3mMOE6m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2015 at 07:14:05AM -0800, Armin Kuster wrote:
> the default gui is now QT so wireshark built with gtk
> is wireshark-gtk.

But QT is explicitly disabled, right? Maybe worth mentioning in commit
message.

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

You cannot drop PE without the overall version going backwards.

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

You don't need the trailing * unless it installs some files in something
like /usr/sharefoo

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

--EdRE1UL8d3mMOE6m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZUggIACgkQN1Ujt2V2gByHugCfSH28sxcFZL56iLlDJYQbV8Du
eIYAn0TYJSt7prpSDp768iTCdPwUE7xM
=/QXz
-----END PGP SIGNATURE-----

--EdRE1UL8d3mMOE6m--
