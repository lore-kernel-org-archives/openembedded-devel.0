Return-Path: <joe@deserted.net>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 449F46B0F3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2013 20:54:38 +0000 (UTC)
Received: by mail-ie0-f169.google.com with SMTP id e14so12854777iej.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2013 12:54:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=SdgPoPdQdFLN7Eg072lzqOsQ905AYN7V0cgfk+CCif8=;
	b=jLycZ2t50OyjsSt1lXa+yohmK/lS7ZxH9DnFAFD+OyFeDU6+0SMgBkPYvyjFPTKEJw
	mpdtXBSQ9zmRHK2gW1MQcm7DvuF0MCIDHjYO3u/s2ZVgWplI7boecW+h4Uz3hc3hSvdv
	zt4tRMTA41t4ilRXzbJhJ3MCKwboVYV8x/kRn0qMaKwy1WQdvqN4Y7CN78X+3VglMiMy
	4/I+j9n0quW2ZalG757O9AtQ2c1Y2Xf0KTZmPNFW89s2Aoorf7EjYfbU6GEkVokyq38v
	hNP/rT2Bv/4+YprlXH4I8s4hjNqsTwLGPkXxjaFCYofVYNhX+WFN3OunKtPWvTA9Na6W
	Dv4w==
X-Gm-Message-State: ALoCoQl6z5GRar6TUiAGqWQHQ6YsB+pFVkBzjdMpSFBFOqDyQkNdTXKKZfAWwU93SE51k8/4opTA
X-Received: by 10.50.36.70 with SMTP id o6mr23125131igj.58.1385585677435;
	Wed, 27 Nov 2013 12:54:37 -0800 (PST)
Received: from deserted.net (198-84-238-35.cpe.teksavvy.com. [198.84.238.35])
	by mx.google.com with ESMTPSA id
	p14sm40302898igr.7.2013.11.27.12.54.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 27 Nov 2013 12:54:35 -0800 (PST)
Date: Wed, 27 Nov 2013 15:54:33 -0500
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131127205431.GC4355@deserted.net>
References: <1385541430-19861-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1385541430-19861-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH meta-networking] proftpd: move pidfile from /var/ to /var/run/
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
X-List-Received-Date: Wed, 27 Nov 2013 20:54:38 -0000
X-Groupsio-MsgNum: 47287
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CblX+4bnyfN0pR09"
Content-Disposition: inline

--CblX+4bnyfN0pR09
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [PATCH meta-networking] proftpd: move pidfile from /var/ to /var/run/=
] On 13.11.27 (Wed 16:37) rongqing.li@windriver.com wrote:

> From: Roy Li <rongqing.li@windriver.com>
>=20
> /var/run/ is more suitable to store pidfile for OE, and this fixes
> "/etc/init.d/proftpd stop" failure too, since this script assumes
> the pidfile is under /var/run
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  .../proftpd/files/move-pidfile-to-var-run.patch    |   39 ++++++++++++++=
++++++
>  .../recipes-daemons/proftpd/proftpd_1.3.4b.bb      |    1 +
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta-networking/recipes-daemons/proftpd/files/move-pi=
dfile-to-var-run.patch
>=20
> diff --git a/meta-networking/recipes-daemons/proftpd/files/move-pidfile-t=
o-var-run.patch b/meta-networking/recipes-daemons/proftpd/files/move-pidfil=
e-to-var-run.patch
> new file mode 100644
> index 0000000..953bbdd
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/proftpd/files/move-pidfile-to-var-r=
un.patch
> @@ -0,0 +1,39 @@
> +move pidfile to /var/run
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +Signed-off-by: Roy Li <rongqing.li@windriver.com>
> +---
> + configure    |    2 +-
> + configure.in |    2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure b/configure
> +index e6268f5..ebed38e 100755
> +--- a/configure
> ++++ b/configure
> +@@ -33587,7 +33587,7 @@ cat >>confdefs.h <<_ACEOF
> + _ACEOF
> +=20
> + cat >>confdefs.h <<_ACEOF
> +-#define PR_PID_FILE_PATH "`eval echo "${localstatedir}/proftpd.pid"`"
> ++#define PR_PID_FILE_PATH "`eval echo "${localstatedir}/run/proftpd.pid"=
`"
> + _ACEOF
> +=20
> +=20
> +diff --git a/configure.in b/configure.in
> +index df9186a..e2ae868 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -2790,7 +2790,7 @@ AC_DEFINE_UNQUOTED(PR_LOCALE_DIR, "`eval echo "${l=
ocale_dir}"`")
> +=20
> + AC_DEFINE_UNQUOTED(PR_RUN_DIR, "`eval echo "${localstatedir}"`")
> + AC_DEFINE_UNQUOTED(PR_CONFIG_FILE_PATH, "`eval echo "${sysconfdir}/prof=
tpd.conf"`")
> +-AC_DEFINE_UNQUOTED(PR_PID_FILE_PATH, "`eval echo "${localstatedir}/prof=
tpd.pid"`")
> ++AC_DEFINE_UNQUOTED(PR_PID_FILE_PATH, "`eval echo "${localstatedir}/run/=
proftpd.pid"`")
> +=20
> + prefix=3D"$pr_saved_prefix"
> + exec_prefix=3D"$pr_saved_exec_prefix"
> +--=20
> +1.7.10.4
> +
> diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb b/=
meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
> index 6571b9c..14d88cf 100644
> --- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
> +++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
> @@ -12,6 +12,7 @@ SRC_URI =3D "ftp://ftp.proftpd.org/distrib/source/${BPN=
}-${PV}.tar.gz \
>             file://contrib.patch \
>             file://proftpd-basic.init \
>             file://default \
> +           file://move-pidfile-to-var-run.patch \
>  "
> =20
>  SRC_URI[md5sum] =3D "0871e0b93c9c3c88ca950b6d9a04aed2"
--=20
-Joe MacDonald.
:wq

--CblX+4bnyfN0pR09
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlKWXAcACgkQwFvcllog0Xwy1gCeOuNLVLoIp4SPA8aXBGxNYGC9
SJQAn3x4nnyXKkS5mK7XpMtoEsI5jdBc
=7aq5
-----END PGP SIGNATURE-----

--CblX+4bnyfN0pR09--
