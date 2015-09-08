Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id C52F765CBF
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Sep 2015 15:09:56 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so124044756wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Sep 2015 08:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QS5xbUnatUcdnrG6YmKOC0pYu8aUUIBMDRREZnPwWQ0=;
	b=uSVQ7AI0BKNfr5AVAmrK/hz7GFGnzaFAiJHtxV/PE3x9YRFmabXTBaLw63htVV2iFM
	zph/uvDP68VCUsdOzZVXzzCIOuMBs+28Dp1hERtDsKqDetBuT/AuWAxjpUGP4cpNJdoi
	KwE+vLlQ69cyTPqO3tOfzafIUlru8hau0smMq3dah6nTlBHArfuvOyrd9vW85fvHc82m
	iBGKk3ijUaXebjP5OMQA7r5HUcpDkwGzBh9Q212KejK6uAvuaMZ2MmUUb8XAIQvsLnUG
	f/m3JC41CnwtjIlKM8aVSb1lXOmv4sjm5VO0+HNKerYjyel+hS1qHD0u1ap3qZLuR8LY
	wWVw==
X-Received: by 10.194.90.209 with SMTP id by17mr47606873wjb.138.1441724994317; 
	Tue, 08 Sep 2015 08:09:54 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	nb10sm5348572wic.11.2015.09.08.08.09.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Sep 2015 08:09:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 8 Sep 2015 17:10:40 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150908151040.GC2381@jama>
References: <1441521234-19902-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1441521234-19902-1-git-send-email-rongqing.li@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH] collectd: fix a floating dependence on openldap
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
X-List-Received-Date: Tue, 08 Sep 2015 15:09:58 -0000
X-Groupsio-MsgNum: 57253
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ghzN8eJ9Qlbqn3iT"
Content-Disposition: inline

--ghzN8eJ9Qlbqn3iT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 06, 2015 at 02:33:54PM +0800, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  meta-oe/recipes-extended/collectd/collectd_5.5.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb b/meta-o=
e/recipes-extended/collectd/collectd_5.5.0.bb
> index fd3b1ab..55d7b38 100644
> --- a/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
> +++ b/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
> @@ -45,6 +45,7 @@ PACKAGECONFIG[libvirt] =3D "--enable-libvirt,--disable-=
libvirt,libvirt"
>  PACKAGECONFIG[libesmtp] =3D "--with-libesmtp,--without-libesmtp,libesmtp"
>  PACKAGECONFIG[libmnl] =3D "--with-libmnl,--without-libmnl,libmnl"
>  PACKAGECONFIG[libatasmart] =3D "--with-libatasmart,--without-libatasmart=
,libatasmart"
> +PACKAGECONFIG[ldap] =3D "--enable-openldap --with-libldap,--disable-open=
ldap --without-libldap, openldap"

With this patch applied I've still seen:
collectd-5.5.0: collectd rdepends on openldap, but it isn't a build depende=
ncy? [build-deps]

so I haven't merged it from master-next, but lets see if it's shown in
next build (maybe qemuarm was executed before I've included this in
master-next).

> =20
>  EXTRA_OECONF =3D " \
>                  ${FPLAYOUT} \
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ghzN8eJ9Qlbqn3iT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXu+nAACgkQN1Ujt2V2gByrwACggTWYUqkQOWJHuO7q/3Vck9yT
vaUAn3HIFiBc7sTXJ2KBjIs7GKgSFmxM
=qhe0
-----END PGP SIGNATURE-----

--ghzN8eJ9Qlbqn3iT--
