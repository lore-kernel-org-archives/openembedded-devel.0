Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1TxNkx-0000Ab-No
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jan 2013 21:14:12 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0LJweHq024176
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jan 2013 11:58:40 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Mon, 21 Jan 2013 11:58:39 -0800
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id D1F6F7FD0	for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jan 2013 14:56:48 -0500 (EST)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 228AA20B49; Mon,
	21 Jan 2013 14:58:39 -0500 (EST)
Date: Mon, 21 Jan 2013 14:58:39 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130121195838.GA10801@windriver.com>
References: <20130118171332.GA12933@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20130118171332.GA12933@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking] [PATCH] autofs: fails to compile with openldap disabled
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
X-List-Received-Date: Mon, 21 Jan 2013 20:14:16 -0000
X-Groupsio-MsgNum: 42778
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline

--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Amy,

[[oe] [meta-networking] [PATCH] autofs: fails to compile with openldap disa=
bled] On 13.01.18 (Fri 12:13) Amy Fong wrote:

> commit 09947d772a36e4d2c2dc48356281bd3ce0a04b0c
> Author: Amy Fong <amy.fong@windriver.com>
> Date:   Fri Jan 18 11:10:35 2013 -0500
>=20
>     autofs: fails to compile with openldap disabled
>    =20
>     As of 5.0.6, it appears that changes were introduced so that
>     if you compile with openldap disabled and openldap headers are not
>     available, then autofs fails to build.
>    =20
>     Since autofs no longer depends on openldap, remove the dependency
>    =20
>     Signed-off-by: Amy Fong <amy.fong@windriver.com>
>=20
> diff --git a/recipes-daemons/autofs/autofs-5.0.7/fix_disable_ldap.patch b=
/recipes-daemons/autofs/autofs-5.0.7/fix_disable_ldap.patch
> new file mode 100644
> index 0000000..b62f955
> --- /dev/null
> +++ b/recipes-daemons/autofs/autofs-5.0.7/fix_disable_ldap.patch
> @@ -0,0 +1,40 @@
> +autofs: fails to compile with openldap disabled
> +
> +As of 5.0.6, it appears that changes were introduced so that=20
> +if you compile with openldap disabled and openldap headers are not
> +available, then autofs fails to build.
> +
> +Signed-off-by: Amy Fong <amy.fong@windriver.com>

Did you say you'd already sent this upstream?  I can put in an
upstream-status myself, but I'm not sure what it is right now.  :-)

Alternatively, a new version with the upstream-status is good too.

-J.

> +--
> + lookup_ldap.h |    4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +---
> + include/lookup_ldap.h |    4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +--- a/include/lookup_ldap.h
> ++++ b/include/lookup_ldap.h
> +@@ -1,7 +1,9 @@
> + #ifndef LOOKUP_LDAP_H
> + #define LOOKUP_LDAP_H
> +=20
> ++#ifdef WITH_LDAP
> + #include <ldap.h>
> ++#endif
> +=20
> + #ifdef WITH_SASL
> + #include <openssl/ssl.h>
> +@@ -109,10 +111,12 @@
> +=20
> + #define LDAP_AUTH_USESIMPLE	0x0008
> +=20
> ++#ifdef WITH_LDAP
> + /* lookup_ldap.c */
> + LDAP *init_ldap_connection(unsigned logopt, const char *uri, struct loo=
kup_context *ctxt);
> + int unbind_ldap_connection(unsigned logopt, LDAP *ldap, struct lookup_c=
ontext *ctxt);
> + int authtype_requires_creds(const char *authtype);
> ++#endif
> +=20
> + #ifdef WITH_SASL
> + /* cyrus-sasl.c */
> diff --git a/recipes-daemons/autofs/autofs_5.0.7.bb b/recipes-daemons/aut=
ofs/autofs_5.0.7.bb
> index c1b0b46..a6683ff 100644
> --- a/recipes-daemons/autofs/autofs_5.0.7.bb
> +++ b/recipes-daemons/autofs/autofs_5.0.7.bb
> @@ -3,7 +3,9 @@ SECTION =3D "base"
>  LICENSE =3D "GPL-2.0"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317=
bb3"
> =20
> -DEPENDS +=3D "openldap libtirpc flex-native bison-native"
> +PR =3D "r1"
> +
> +DEPENDS +=3D "libtirpc flex-native bison-native"
> =20
>  inherit autotools systemd
> =20
> @@ -30,6 +32,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/daemons/autofs/v=
5/autofs-${PV}.tar.bz2 \
>             file://cross.patch \
>             file://libtirpc.patch \
>             file://libtirpc-name-clash-backout.patch \
> +           file://fix_disable_ldap.patch \
>            "
> =20
>  SRC_URI[md5sum] =3D "bc46838dece83c02d800ff144ed9f431"
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
-Joe MacDonald.
:wq

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlD9ne4ACgkQPN8S4W6ZZnegnQCffPKKHcF73Q+MRkipTeEmBsDn
w7EAnRW/+XQDE2yyROz1Z+P/oRPjQJ4V
=BgMp
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
