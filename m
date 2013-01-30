Received: from mail-da0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U0XLs-0002YK-J4
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jan 2013 14:05:25 +0100
Received: by mail-da0-f51.google.com with SMTP id i30so756115dad.38
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2013 04:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=JuPzSqPPxlE57vc797cljaT29qw8dylPC1Ha/MVIYyA=;
	b=qLvJDwNESDNgjUSIdZhWvaWEREFnLBLhd05DI1Z231oJlW85pt27YOdLLSpWAqsztA
	ikOaCYieecwMcfnbns4MmQOdhI5QzyoRWKghHKUNWAycBkaSGKGzQbKsXTnEbDMk0sBZ
	WuJYXmf1Sq8VH4coV5Rg4DRcS+WemcuBnqtBK7e0jrGVsUv9IbFsGc6pbXt2cpmC4Gyp
	UQKYb7mc70BsrluM3ICCkePfEnw30Pz2FEEFFOOOBmZJskjg/klzgCxkPu81rbcIcjJs
	iBoS8LbyV/UL577P2UE4yfo7xg7HDjbzh6RYxbYsO8NgVSRLyRluwkx7mT9sKXi8BXeO
	cATA==
X-Received: by 10.68.222.196 with SMTP id qo4mr11978395pbc.140.1359550178646; 
	Wed, 30 Jan 2013 04:49:38 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id rk6sm1536010pbc.20.2013.01.30.04.49.35
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 30 Jan 2013 04:49:37 -0800 (PST)
Date: Wed, 30 Jan 2013 13:49:34 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130130124934.GX16904@jama.palm1.palmone.com>
References: <1359478838-321-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1359478838-321-1-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH] samba: Split libnss-winbind package
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
X-List-Received-Date: Wed, 30 Jan 2013 13:05:25 -0000
X-Groupsio-MsgNum: 42925
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/jamoCVtoCI0aYZY"
Content-Disposition: inline

--/jamoCVtoCI0aYZY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 29, 2013 at 03:00:38PM -0200, Otavio Salvador wrote:
> This allows for applications to resolv wins without the winbindd and
> sambad.
>=20

Please send patches for master (and tested in master), not danny

patching file meta-oe/recipes-connectivity/samba/samba-basic.inc
Hunk #1 FAILED at 9.
Hunk #2 FAILED at 35.
2 out of 2 hunks FAILED -- saving rejects to file
meta-oe/recipes-connectivity/samba/samba-basic.inc.rej
patching file meta-oe/recipes-connectivity/samba/samba.inc
Hunk #1 succeeded at 96 (offset 4 lines).
patching file meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
Hunk #1 FAILED at 3.
1 out of 1 hunk FAILED -- saving rejects to file
meta-oe/recipes-connectivity/samba/samba_3.6.8.bb.rej

Cheers,

> Change-Id: Iaa86154a59e758b37f28796963e6550ed2d30464
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta-oe/recipes-connectivity/samba/samba-basic.inc |    7 ++++---
>  meta-oe/recipes-connectivity/samba/samba.inc       |    2 +-
>  meta-oe/recipes-connectivity/samba/samba_3.6.8.bb  |    2 +-
>  3 files changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta-oe/recipes-connectivity/samba/samba-basic.inc b/meta-oe=
/recipes-connectivity/samba/samba-basic.inc
> index 5d816f9..efdda1a 100644
> --- a/meta-oe/recipes-connectivity/samba/samba-basic.inc
> +++ b/meta-oe/recipes-connectivity/samba/samba-basic.inc
> @@ -9,7 +9,7 @@ EXTRA_OECONF +=3D "\
>          --without-ldap \
>          --without-krb5"
> =20
> -PACKAGES =3D+ "winbind winbind-dbg libnetapi libtdb libsmbsharemodes lib=
smbclient libsmbclient-dev cifs cifs-doc swat"
> +PACKAGES =3D+ "winbind winbind-dbg libnss-winbind libnetapi libtdb libsm=
bsharemodes libsmbclient libsmbclient-dev cifs cifs-doc swat"
> =20
>  FILES_winbind-dbg =3D "${libdir}/idmap/.debug/*.so \
>                       ${libdir}/security/.debug/pam_winbind.so \
> @@ -35,13 +35,14 @@ FILES_cifs =3D "${base_sbindir}/mount.cifs ${base_sbi=
ndir}/umount.cifs"
>  FILES_cifs-doc =3D "${mandir}/man8/mount.cifs.8 ${mandir}/man8/umount.ci=
fs.8"
>  FILES_libsmbclient =3D "${libdir}/libsmbclient.so.*"
>  FILES_libsmbclient-dev =3D "${libdir}/libsmbclient.so ${includedir}"
> +FILES_libnss-winbind =3D "${libdir}/libnss_*${SOLIBS} \
> +                        ${libdir}/nss_info"
> +
>  FILES_winbind =3D "${sysconfdir}/init.d/winbind \
> -                 ${libdir}/libnss_*${SOLIBS} \
>                   ${sbindir}/winbindd \
>                   ${bindir}/wbinfo \
>                   ${bindir}/ntlm_auth \
>                   ${libdir}/idmap/*.so \
> -                 ${libdir}/nss_info \
>                   ${libdir}/pdb \
>                   ${libdir}/gpext \
>                   ${libdir}/perfcount \
> diff --git a/meta-oe/recipes-connectivity/samba/samba.inc b/meta-oe/recip=
es-connectivity/samba/samba.inc
> index faa2be0..4727c48 100644
> --- a/meta-oe/recipes-connectivity/samba/samba.inc
> +++ b/meta-oe/recipes-connectivity/samba/samba.inc
> @@ -92,7 +92,7 @@ do_install_append() {
> =20
> =20
> =20
> -pkg_postinst_winbind () {
> +pkg_postinst_libnss-winbind () {
>      # add wins to the list of resolvers
>      ns=3D$D${sysconfdir}/nsswitch.conf
>      if ! grep "hosts:.*wins" $ns > /dev/null; then
> diff --git a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb b/meta-oe/=
recipes-connectivity/samba/samba_3.6.8.bb
> index 7c54dae..7985199 100644
> --- a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
> +++ b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
> @@ -3,7 +3,7 @@ require samba-basic.inc
>  LICENSE =3D "GPLv3"
>  LIC_FILES_CHKSUM =3D "file://../COPYING;md5=3Dd32239bcb673463ab874e80d47=
fae504"
> =20
> -PR =3D "r2"
> +PR =3D "r3"
> =20
>  SRC_URI +=3D "\
>      file://config-h.patch \
> --=20
> 1.7.2.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/jamoCVtoCI0aYZY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEJFt4ACgkQN1Ujt2V2gBzrDQCgp0btSQ7HwJs4QQI+kPqlS7AV
CnMAnRmJVY22t0rUVsWcq4RWANKrbsAa
=tDZP
-----END PGP SIGNATURE-----

--/jamoCVtoCI0aYZY--
