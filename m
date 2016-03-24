Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 38F19605BB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2016 14:17:15 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l68so12741622wml.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2016 07:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=fY+ZcVzI6CUGUWadhVoIITpg6f2Bt+yc/fB/EGD77cE=;
	b=VvA0CflVJQh/XNaXmoIGjB/W+zJrc+kPkzZb1Gsck3a/qg0+VW/aEbbOxg+y7bMxGI
	8H0qY6VSQiVxW6hHlhejjCxRCproOaciR24UiOmG9Qpt0v+eePjtxApRRmFroFCIvW4M
	DrnhbvqZwVlkoHIGPeIkHm2TI204UzLb8BZSkOQgPgGl/J2dJ1WSNY+IyS0yhumJbBcI
	ekIneLWAd2rRhhqS33LUv626gUVWbmQSCDiqC+UnCSiNxLYnnfqUgpJO6Gcq7BHqqAdy
	nj8UuxovwS4p5ZyAaNmYCVn/NO2psDy/dWHYic640QqSdVoEQfZHFY4TcfHClxjmRrtL
	Qkeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=fY+ZcVzI6CUGUWadhVoIITpg6f2Bt+yc/fB/EGD77cE=;
	b=EvHLU9QUq5ZkgVmeTmhD06HpXKk5YwBJ3aiPw5/WOSW50hBCyWsCESpFfIRezp90op
	N0GE7QJfMdHP1/7k3on7Y6WLKQobiWaeRM5sGNbOvtWPjM1VOsaVRgaLTvVpv/2oLzHv
	2WfupN9mS2TwAEKXhXX6JKeHH11Rd/5b3SaItxh0xN71sCP5aaxLRAWJKzf5yFHapSdT
	66phwi+Z7a1FPou1SkUUxHy0Fmgyx+dncZ6yapJLgYRh9N0r44aPMjIa/TibvylzYCOd
	67O0DBIChgAOVEJgBvx2KJ561jxCY62I25oyHfGWCOzjOBjHpOxoEUthufklxumtODu+
	xUgg==
X-Gm-Message-State: AD7BkJKVk7HihA67vD86G/1iAT9+6rtk4DaX4ousU2G5cc3QPhsAkLpIGLphvsKtPmcOGg==
X-Received: by 10.194.185.237 with SMTP id ff13mr10969881wjc.129.1458829036440;
	Thu, 24 Mar 2016 07:17:16 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	w15sm27183966wmd.10.2016.03.24.07.17.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Mar 2016 07:17:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 24 Mar 2016 15:21:54 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160324142154.GB2518@jama>
References: <1458318648-6295-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1458318648-6295-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH][meta-oe 1/2] samba: include auth_unix only with pam in PACKAGECONFIG
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
X-List-Received-Date: Thu, 24 Mar 2016 14:17:16 -0000
X-Groupsio-MsgNum: 60655
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b5gNqxB1S1yM7hjW"
Content-Disposition: inline

--b5gNqxB1S1yM7hjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 18, 2016 at 05:30:47PM +0100, Martin Jansa wrote:
> * fixes:
>   WARN: samba: samba rdepends on libpam, but it isn't a build dependency?
>   reported by test-dependencies
> * log.do_package shows:
>   DEBUG: samba: Dependency libpam.so.0 requires package libpam (used by f=
iles: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnuea=
bi/samba/4.1.12-r0/packages-split/samba/usr/lib/samba/libauth4.so)
> * source4/auth/ntlm/wscript_build shows pam dependency:
>   bld.SAMBA_MODULE('auth4_unix',
>         source=3D'auth_unix.c',
>         subsystem=3D'auth4',
>         init_function=3D'auth4_unix_init',
>         deps=3D'pam PAM_ERRORS LIBTSOCKET'
>         )

This still isn't enough to get rid of pam autodependency. I've tried to
patch wscript files a bit to respect pam everywhere, but now it fails to
build, I'm willing to give-up on this one, I don't even use samba
anywhere FFS, I should do something more interesting with my limited
time.

http://git.openembedded.org/meta-openembedded-contrib/commit/?h=3Djansa/mas=
ter-next-unresolved-review&id=3Db838ec649c8f88e40ac7799bb19421c6f02a54ec

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-networking/recipes-connectivity/samba/samba_4.1.12.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb b=
/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
> index ff58dae..e9e2724 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
> @@ -82,7 +82,7 @@ SRC_URI +=3D "${@bb.utils.contains('PACKAGECONFIG', 'sa=
sl', '', 'file://21-avoid-s
> =20
>  SAMBA4_IDMAP_MODULES=3D"idmap_ad,idmap_rid,idmap_adex,idmap_hash,idmap_t=
db2"
>  SAMBA4_PDB_MODULES=3D"pdb_tdbsam,${@bb.utils.contains('PACKAGECONFIG', '=
ldap', 'pdb_ldap,', '', d)}pdb_ads,pdb_smbpasswd,pdb_wbc_sam,pdb_samba4"
> -SAMBA4_AUTH_MODULES=3D"auth_unix,auth_wbc,auth_server,auth_netlogond,aut=
h_script,auth_samba4"
> +SAMBA4_AUTH_MODULES=3D"${@bb.utils.contains('PACKAGECONFIG', 'pam', 'aut=
h_unix,', '', d)}auth_wbc,auth_server,auth_netlogond,auth_script,auth_samba=
4"
>  SAMBA4_MODULES=3D"${SAMBA4_IDMAP_MODULES},${SAMBA4_PDB_MODULES},${SAMBA4=
_AUTH_MODULES}"
> =20
>  SAMBA4_LIBS=3D"heimdal,!zlib,!popt,!talloc,!pytalloc,!pytalloc-util,!tev=
ent,!pytevent,!tdb,!pytdb,!ldb,!pyldb"
> --=20
> 2.7.3
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--b5gNqxB1S1yM7hjW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbz+AEACgkQN1Ujt2V2gBz/OQCguMl9HI5jnzDDkO5XNbNm1fOZ
j1cAn3k/UDfDY5kCz2x1TOJ/Id0Hq9N5
=KJjS
-----END PGP SIGNATURE-----

--b5gNqxB1S1yM7hjW--
