Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8694A731CF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 May 2016 17:11:48 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id g17so4684019wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 May 2016 10:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=dbwFaqSA67Z7qcP75c6ON5NBfLGDu5ywvgKNUa6cfMM=;
	b=UUP+HJvqSYTkC7shW37yLJLAHDqHdZ1QtPqlZIJyR4v8muL8MQSPTrnO/b/oa9tVrd
	w5MJlI0A/SXsYeywfHL5+ge3bPcCVuDbsmuT9SuKMtTOdrjM0cxzbnLA53hd7wzTYmDR
	NR/HADUP8RIwoy1wyaLnsR3hiLRg1cdCqMAICwzKTAA98VUAtpDx5c54F96Ery+zi0NO
	Duirf/C7W4NZB5dre4u7/VRHE1R/dtyyh/3h8l3S08nCVcVqjFlcnaHjo3LtCSf6CqQE
	7AImSQSk0fn4EHqWfct7Tg3ESUbXyJfZ6CWNL4P4TufBmzsCkejQu8RWSh8mQKGlliV3
	REJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=dbwFaqSA67Z7qcP75c6ON5NBfLGDu5ywvgKNUa6cfMM=;
	b=MIS65g5meA5PE3kOAS9eN+zOyFhHU5o9zjCw0PRj+lsKzPNVsbn/odHcvPZ/ChH+Zi
	eKHDH9a6BMnHbJq89HxqCPG9vI30OLxQ8hpJsyb7IZ+23Ei/O/zMEaRNruTvXlLivwc1
	ij81AOYJRQKu9QZjWiDUDYhVqxatFKwmDsCtMstg04Aj88LxnVcGMrwYf3TnAzX+z+P1
	44/QGDc0d6+76XI+V8DUZ+VkvhVOQjfOxv+2L8MfzKwWF65sR9cmwZEdZiJzJ+QGD6/p
	ZijWK3cD1ouJwqdxAz/95718Rcu2pE5sbAMVIeDQ6frDp4XHPJik3oNf4wCGKro5crVN
	OsgQ==
X-Gm-Message-State: AOPr4FW79YxJuZRHQrSQXHZTgv+/68KnRiyT0cJdJZ0Ht9tlci/EyFpc82yjaXMzq9ik1w==
X-Received: by 10.194.81.106 with SMTP id z10mr15343373wjx.163.1462468308354; 
	Thu, 05 May 2016 10:11:48 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	c16sm4105535wme.16.2016.05.05.10.11.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 May 2016 10:11:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 5 May 2016 19:13:10 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160505171310.GB23370@jama>
References: <1462465350-33532-1-git-send-email-noor_ahsan@mentor.com>
MIME-Version: 1.0
In-Reply-To: <1462465350-33532-1-git-send-email-noor_ahsan@mentor.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Subject: Re: [PATCH] Fix "failed sanity test tmpdir" for libnice and update PNBLACKLIST.
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
X-List-Received-Date: Thu, 05 May 2016 17:11:49 -0000
X-Groupsio-MsgNum: 61340
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MfFXiAuoTsnnDAfZ"
Content-Disposition: inline

--MfFXiAuoTsnnDAfZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 05, 2016 at 09:22:30PM +0500, Noor, Ahsan wrote:
> From: Noor Ahsan <noor_ahsan@mentor.com>
>=20
> * Update do_compile_append where it was updating *.pc from ${S} and
>   removing staging dir folder. Now we have seperate build folder
>   where packages got build. We have to search pc in ${B} not in ${S}.
>   After updating the tmp dir pathc is removed from nice.pc file.

typo pathc

> * Remove PNBLACKLIST for libnice and farsight recipes.
>=20
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> ---
>  meta-oe/recipes-support/farsight/farsight2_0.0.22.bb | 1 -
>  meta-oe/recipes-support/farsight/libnice_0.0.13.bb   | 3 +--
>  2 files changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb b/meta-=
oe/recipes-support/farsight/farsight2_0.0.22.bb
> index ffb222b..beb6108 100644
> --- a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
> +++ b/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
> @@ -29,4 +29,3 @@ FILES_${PN}-dbg +=3D "${libdir}/*/.debug"
>  SRC_URI[md5sum] =3D "e1f540cf3ebab06c3d7db1f46b44ac88"
>  SRC_URI[sha256sum] =3D "3ae59aa61a8071c9fad111e5fd606aabc27961eb4192f872=
9987a27dae6b3974"
> =20
> -PNBLACKLIST[farsight2] ?=3D "Depends on broken libnice"
> diff --git a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb b/meta-oe=
/recipes-support/farsight/libnice_0.0.13.bb
> index a9081dc..3d99622 100644
> --- a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
> +++ b/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
> @@ -28,7 +28,7 @@ do_configure_prepend() {
>  }
> =20
>  do_compile_append() {
> -    for i in $(find ${S} -name "*.pc") ; do
> +    for i in $(find ${B} -name "*.pc") ; do
>          sed -i -e s:${STAGING_DIR_TARGET}::g \
>                 -e s:/${TARGET_SYS}::g \
>                    $i
> @@ -39,4 +39,3 @@ do_compile_append() {
>  SRC_URI[md5sum] =3D "e5b9f799a57cb939ea2658ec35253ab9"
>  SRC_URI[sha256sum] =3D "d8dd260c486a470a6052a5323920878a084e44a19df09b15=
728b85c9e3d6edf0"
> =20
> -PNBLACKLIST[libnice] ?=3D "BROKEN: QA Issue: nice.pc failed sanity test =
(tmpdir)"
> --=20
> 2.8.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MfFXiAuoTsnnDAfZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcrfyUACgkQN1Ujt2V2gBykpACeKZl6iGmbX2cUlYqR6gbtrXTC
C7wAn1Uu67x87LIOn5oMA+eNUBMjwSBM
=2QGe
-----END PGP SIGNATURE-----

--MfFXiAuoTsnnDAfZ--
