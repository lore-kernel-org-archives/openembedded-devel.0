Received: from mail-we0-f171.google.com ([74.125.82.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U2flv-00085V-2N
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Feb 2013 11:29:04 +0100
Received: by mail-we0-f171.google.com with SMTP id u54so5695517wey.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Feb 2013 02:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Tbn8Q1sI4bjUeE/mtKLNDbusBbxWMMVKM5xH9uU3E/Y=;
	b=PWDWby+yo8Cx+OBVaki7z20lvRlg9bvzqEZZdXijm/hMHMP2Q/KJk9KGyoUnWBbseD
	CRa+VxQD5ATzDUTPpA6LVypEM9P3fwm8HllBXst2KZ6fNJkVhEiJxyfjB/lC5SJU0IXB
	spcTUwHHxpAeFF+A3qSFb3TXVzQo19cIpB84/LuGd0b4ImWyze1n21aH3HSy2qVa9F3x
	zMhUcMErL1wiyoeJ5C6PDfeKnxh3jznKW9F5HxK97QTH4VQQnx1rNoKMSvSuK5xl/3fS
	taUeQsV3l9ASmvLNebjOYKZeRAXTXZlM5oiSB2PWEwvGe5df1nmz31LDKG6FzqMiBL6+
	n8rQ==
X-Received: by 10.180.100.163 with SMTP id ez3mr15745551wib.32.1360059193493; 
	Tue, 05 Feb 2013 02:13:13 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id q13sm4169449wie.0.2013.02.05.02.13.12
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 02:13:12 -0800 (PST)
Date: Tue, 5 Feb 2013 11:13:12 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130205101312.GG3271@jama>
References: <1359998364-9245-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1359998364-9245-1-git-send-email-otavio@ossystems.com.br>
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
X-List-Received-Date: Tue, 05 Feb 2013 10:29:05 -0000
X-Groupsio-MsgNum: 42993
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BI5RvnYi6R4T2M87"
Content-Disposition: inline

--BI5RvnYi6R4T2M87
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 04, 2013 at 03:19:24PM -0200, Otavio Salvador wrote:
> This allows for applications to resolv wins without the winbindd and
> sambad.

Is this for master?

2013-02-05 11:09:04 URL:http://patchwork.openembedded.org/patch/44029/mbox/=
 [2894] -> "pw-am-44029.patch" [1]
Applying: samba: Split libnss-winbind package
error: patch failed: meta-oe/recipes-connectivity/samba/samba-basic.inc:36
error: meta-oe/recipes-connectivity/samba/samba-basic.inc: patch does not a=
pply
Patch failed at 0001 samba: Split libnss-winbind package
The copy of the patch that failed is found in:
   /OE/meta-openembedded/.git/rebase-apply/patch
When you have resolved this problem, run "git am --resolved".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

Looks almost the same as:
http://lists.linuxtogo.org/pipermail/openembedded-devel/2013-January/043763=
=2Ehtml


>=20
> Change-Id: Iaa86154a59e758b37f28796963e6550ed2d30464
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta-oe/recipes-connectivity/samba/samba-basic.inc |    7 ++++---
>  meta-oe/recipes-connectivity/samba/samba.inc       |    2 +-
>  2 files changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-oe/recipes-connectivity/samba/samba-basic.inc b/meta-oe=
/recipes-connectivity/samba/samba-basic.inc
> index 0b24879..d6d8d12 100644
> --- a/meta-oe/recipes-connectivity/samba/samba-basic.inc
> +++ b/meta-oe/recipes-connectivity/samba/samba-basic.inc
> @@ -9,7 +9,7 @@ EXTRA_OECONF +=3D "\
>          --without-ldap \
>          --without-krb5"
> =20
> -PACKAGES =3D+ "libwbclient libwinbind libwinbind-dbg winbind winbind-dbg=
 libnetapi libtdb libsmbsharemodes libsmbclient libsmbclient-dev cifs cifs-=
doc swat"
> +PACKAGES =3D+ "libwbclient libwinbind libwinbind-dbg libnss-winbind winb=
ind winbind-dbg libnetapi libtdb libsmbsharemodes libsmbclient libsmbclient=
-dev cifs cifs-doc swat"
> =20
>  FILES_winbind-dbg =3D "${libdir}/idmap/.debug/*.so \
>                       ${libdir}/security/.debug/pam_winbind.so \
> @@ -36,13 +36,14 @@ FILES_cifs =3D "${base_sbindir}/mount.cifs ${base_sbi=
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
> index a86c8be..3ee43ad 100644
> --- a/meta-oe/recipes-connectivity/samba/samba.inc
> +++ b/meta-oe/recipes-connectivity/samba/samba.inc
> @@ -96,7 +96,7 @@ do_install_append() {
> =20
> =20
> =20
> -pkg_postinst_winbind () {
> +pkg_postinst_libnss-winbind () {
>      # add wins to the list of resolvers
>      ns=3D$D${sysconfdir}/nsswitch.conf
>      if ! grep "hosts:.*wins" $ns > /dev/null; then
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

--BI5RvnYi6R4T2M87
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEQ2zgACgkQN1Ujt2V2gBz3+ACgqOUD+tkwgXvsF2sVUUcPpgvk
uvYAn3GXmBXGcWB8zpwGguFqWcCTBMdH
=P0Bu
-----END PGP SIGNATURE-----

--BI5RvnYi6R4T2M87--
