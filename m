Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2189E60034
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2015 13:44:02 +0000 (UTC)
Received: by wibdy8 with SMTP id dy8so90679830wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2015 06:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Q53Mi4K6v8CcohaP1QnWSCc5IECFlk9S+bDOj9OEVZE=;
	b=F3yyswFlZUkgWhlXPKT3xjlWjGvJMTszde1YkdEtsGtx8lWmLSIlTpLWhV+vYkmle5
	llvozvymeS9J+ER9oQZ9wOkVTIktOttoGoHjdys4Oj9vibfPNjbBRRaYbz5PlLhwuvfV
	g3FiQWN7mELZc4KSsqKxN4TMncwLIdYSdb1zx4Q3EVyRuCIn5FL00+fLOhxrvvlW4NK1
	qZUL6qAkxft7D08v8O5OKwevAexp+EH0gU8t2/NtV9Vvm/1gNQaJAbfZyt7PZgTiLmrx
	fgbNsNWbq9E8GrY4o1naTgN/QhCJMvqs0wZusGQpKTDXorO1TiaJ+Py56TMhqTbEC4Ts
	L/aA==
X-Received: by 10.180.75.103 with SMTP id b7mr7093972wiw.32.1426686243508;
	Wed, 18 Mar 2015 06:44:03 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	hn8sm3264541wib.18.2015.03.18.06.44.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Mar 2015 06:44:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 18 Mar 2015 14:44:09 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150318134409.GD4738@jama>
References: <1426647253-12404-1-git-send-email-sgw@linux.intel.com>
	<1426647253-12404-2-git-send-email-sgw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1426647253-12404-2-git-send-email-sgw@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 2/2] openflow: update libopenflow.m4 to use openssl instead of libssl
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
X-List-Received-Date: Wed, 18 Mar 2015 13:44:04 -0000
X-Groupsio-MsgNum: 54822
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cHMo6Wbp1wrKhbfi"
Content-Disposition: inline

--cHMo6Wbp1wrKhbfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2015 at 08:54:13PM -0600, Saul Wold wrote:
> openssl provides both the libssl and libcrypto APIs for linkage, the 1.0.=
2 of
> OpenSSL removed libcrypto from the libssl.pc

This should be already resolved by:
Joe MacDonald : openflow: add libcrypto to static openflow library
which was merged today.

>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  .../recipes-protocols/openflow/openflow.inc        |  4 ++-
>  .../openflow/use-openssl-instead-of-libssl.patch   | 34 ++++++++++++++++=
++++++
>  2 files changed, 37 insertions(+), 1 deletion(-)
>  create mode 100644 meta-networking/recipes-protocols/openflow/openflow/u=
se-openssl-instead-of-libssl.patch
>=20
> diff --git a/meta-networking/recipes-protocols/openflow/openflow.inc b/me=
ta-networking/recipes-protocols/openflow/openflow.inc
> index 1a226f8..7eca1d7 100644
> --- a/meta-networking/recipes-protocols/openflow/openflow.inc
> +++ b/meta-networking/recipes-protocols/openflow/openflow.inc
> @@ -11,7 +11,9 @@ LICENSE =3D "GPLv2"
> =20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De870c934e2c3d6ccf085fd7cf0a1e=
2e2"
> =20
> -SRC_URI =3D "git://gitosis.stanford.edu/openflow.git;protocol=3Dgit"
> +SRC_URI =3D "git://gitosis.stanford.edu/openflow.git;protocol=3Dgit \
> +           file://use-openssl-instead-of-libssl.patch \
> +          "
> =20
>  DEPENDS =3D "virtual/libc"
> =20
> diff --git a/meta-networking/recipes-protocols/openflow/openflow/use-open=
ssl-instead-of-libssl.patch b/meta-networking/recipes-protocols/openflow/op=
enflow/use-openssl-instead-of-libssl.patch
> new file mode 100644
> index 0000000..724855f
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/openflow/openflow/use-openssl-ins=
tead-of-libssl.patch
> @@ -0,0 +1,34 @@
> +OpenSSL 1.0.2 removed -lcrypto from the libssl.pc, but the openssl.pc
> +contains both. Since openflow uses both libcrypto and libssl API we
> +should use openssl.pc.
> +
> +Signed-off-by: Saul Wold <sgw@linux.intel.com>
> +
> +Upstream-Status: Inappropriate [upstream obsolete]
> +
> +Index: git/m4/libopenflow.m4
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/m4/libopenflow.m4
> ++++ git/m4/libopenflow.m4
> +@@ -65,7 +65,7 @@ AC_DEFUN([OFP_CHECK_OPENSSL],
> +   [AC_ARG_ENABLE(
> +      [ssl],
> +      [AC_HELP_STRING([--enable-ssl],=20
> +-                     [Enable ssl support (requires libssl)])],
> ++                     [Enable ssl support (requires libssl and libcrypto=
)])],
> +      [case "${enableval}" in
> +         (yes) ssl=3Dtrue ;;
> +         (no)  ssl=3Dfalse ;;
> +@@ -76,10 +76,10 @@ AC_DEFUN([OFP_CHECK_OPENSSL],
> +    if test "$ssl" =3D true; then
> +    dnl Make sure that pkg-config is installed.
> +    m4_pattern_forbid([PKG_CHECK_MODULES])
> +-   PKG_CHECK_MODULES([SSL], [libssl],=20
> ++   PKG_CHECK_MODULES([SSL], [openssl],=20
> +      [HAVE_OPENSSL=3Dyes],
> +      [HAVE_OPENSSL=3Dno
> +-      AC_MSG_WARN([Cannot find libssl:
> ++      AC_MSG_WARN([Cannot find OpenSSL Libraries:
> +=20
> +    $SSL_PKG_ERRORS
> +=20
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

--cHMo6Wbp1wrKhbfi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUJgSkACgkQN1Ujt2V2gBzG0wCfZpGS/3hxOcKMci85AyFPf2VB
ofcAoJGKpffk21A95UcqjwjVc8CCYiUb
=fqY1
-----END PGP SIGNATURE-----

--cHMo6Wbp1wrKhbfi--
