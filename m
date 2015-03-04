Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5CBC37378D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2015 17:08:55 +0000 (UTC)
Received: by wiwh11 with SMTP id h11so32470443wiw.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Mar 2015 09:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ii53jxUoZt0UAxRvBy3tFmfoa+9smaaqyQk3vdtjy4c=;
	b=HclI37TOiqygFaNOkU3i9c8arrzeRRVdwhtueNjAJ+UgHkKcQOeebg1c8w0aFq8cge
	wKEvIsAGm9bbjzSw61Iz2MLTA/H/xGIEuD60usIBQZDcqGu1waYLLsf8ezRZIOxwnMka
	NIMgWqX5xCtU57KmGCBD/DT37l2x+cMDdOrxCCcwsnuSN5Iww/yOwg1oHLsoMfDuZgS+
	VdTb+crjmfwWgEFW7JOGz6h1sfQ3p4sJfVO+JA2Qa1oC9yWrB+MWr8BXbd7WJGjCTQDz
	QjQSNJ4zGAi9Phvqg1YNN2Rg7r6r0rhEDGsVHGxNlmk52Hb7+ELKYh39BeOvIstBLlgy
	IkMw==
X-Received: by 10.180.35.33 with SMTP id e1mr56462074wij.49.1425488936048;
	Wed, 04 Mar 2015 09:08:56 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	t9sm26010410wia.15.2015.03.04.09.08.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Mar 2015 09:08:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 4 Mar 2015 18:08:59 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150304170859.GJ2337@jama>
References: <1425487808-22201-1-git-send-email-eduardo@monkey.io>
MIME-Version: 1.0
In-Reply-To: <1425487808-22201-1-git-send-email-eduardo@monkey.io>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-webserver][PATCH] Monkey: new v1.5.6 release.
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
X-List-Received-Date: Wed, 04 Mar 2015 17:08:58 -0000
X-Groupsio-MsgNum: 54623
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Tu8ztk+XgTAiG9Id"
Content-Disposition: inline

--Tu8ztk+XgTAiG9Id
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 04, 2015 at 10:50:08AM -0600, Eduardo Silva wrote:
> This patch add the new Monkey HTTP Server v1.5.6.
>=20
> For more details about software changes please visit:
>=20
>     http://monkey-project.com/Announcements/v1.5.6
>=20
> =3D=3D=3D Build Tests =3D=3D
>=20
>  This version have been tested on Yocto/Daisy based on RPM.

Please test it with master branch as well.

>  monkey-yocto/5aee7684cd66f78fb51f78138603a4dde4ef2484
>=20
> Signed-off-by: Eduardo Silva <eduardo@monkey.io>
> ---
>  .../recipes-httpd/monkey/{monkey_1.5.4.bb =3D> monkey_1.5.6.bb}       | =
6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-webserver/recipes-httpd/monkey/{monkey_1.5.4.bb =3D> monkey_=
1.5.6.bb} (93%)
>=20
> diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.4.bb b/meta-w=
ebserver/recipes-httpd/monkey/monkey_1.5.6.bb
> similarity index 93%
> rename from meta-webserver/recipes-httpd/monkey/monkey_1.5.4.bb
> rename to meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb
> index a4963af..d7330a1 100644
> --- a/meta-webserver/recipes-httpd/monkey/monkey_1.5.4.bb
> +++ b/meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb
> @@ -11,8 +11,8 @@ SRC_URI =3D "http://monkey-project.com/releases/1.5/mon=
key-${PV}.tar.gz \
>             file://monkey.service \
>             file://monkey.init"
> =20
> -SRC_URI[md5sum] =3D "b794724ac38cfedee2a5d27c175bc87e"
> -SRC_URI[sha256sum] =3D "662bbafc614d32f645059e6e00258fed640665594f5b7f11=
cf4c4763cf09ddcf"
> +SRC_URI[md5sum] =3D "9699e4c9ea6ce6b989907c252ae80254"
> +SRC_URI[sha256sum] =3D "7c3d845306aa74ee6effd7ab6169d16ac4e6450e564954d0=
d0baa2d1e9be1a22"
> =20
>  EXTRA_OECONF =3D "--plugdir=3D${libdir}/monkey/ \
>                  --logdir=3D${localstatedir}/log/monkey/ \
> @@ -21,7 +21,7 @@ EXTRA_OECONF =3D "--plugdir=3D${libdir}/monkey/ \
>                  --datadir=3D${localstatedir}/www/monkey/ \
>                  --sysconfdir=3D${sysconfdir}/monkey/ \
>                  --enable-plugins=3D* \
> -                --disable-plugins=3Dpolarssl \
> +                --disable-plugins=3Dmbedtls \
>                  --debug \
>                  --malloc-libc"
> =20
> --=20
> 2.1.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Tu8ztk+XgTAiG9Id
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlT3PCsACgkQN1Ujt2V2gByg2wCfVtZ4HfadIdEdnLHVr+jafklg
0CQAoIRQRt7+y9mq3pMxVvKxWRPmPbM8
=7h2z
-----END PGP SIGNATURE-----

--Tu8ztk+XgTAiG9Id--
