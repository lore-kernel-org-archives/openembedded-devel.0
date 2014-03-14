Return-Path: <joe@deserted.net>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 98E586F787
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 14:30:31 +0000 (UTC)
Received: by mail-ie0-f182.google.com with SMTP id y20so2630869ier.27
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 07:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=AHjkJLl3puy1NP+2CLgZezp+M1XgHUkFP6Og47ZnSs0=;
	b=CmICjVaTSZ/Cl0ttdy7mS9J3/dcIvG7hwVnQUTM15OVJuqqVf4ZQlzNkfM9YoZeCIP
	KW9UxDFD6ghJtFq7NJRWGXKiDB6msVi4UGG/C8zs4IJkZdVbp/xsHRC5B/xj9v6Gy+mI
	w8kq235FvlLSkKhCI74r0MZ5s89+ovoRc/XpOkNaD96vECpP0tyG3VVMXzumXY8/bxOW
	e5q0Cok+zv0uVSNW3/z4nn4tM9fobRLTCcRM0WsN1tHgUs+5mB3Ne7nPmQVPypMaNHei
	dTXcBMWaBLLgMEUaZp9ZBA5LW75GmeIxJViAz+FbTdRK0eKncm59YXCO5lTXtklvncC1
	XX7A==
X-Gm-Message-State: ALoCoQnqlkx6UTowGZMcz3fUxhBc7comRhds6M9cZLdJ31S52v8p2WbzvTjS0wKGhmIWe+TjXAdj
X-Received: by 10.50.82.73 with SMTP id g9mr3472169igy.0.1394807432476;
	Fri, 14 Mar 2014 07:30:32 -0700 (PDT)
Received: from deserted.net (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id
	f1sm19820108igy.2.2014.03.14.07.30.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 14 Mar 2014 07:30:31 -0700 (PDT)
Date: Fri, 14 Mar 2014 10:30:29 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140314143028.GC8326@deserted.net>
References: <cover.1394785570.git.hongxu.jia@windriver.com>
	<b7b3910fc03d9f0fac1e6363eb6b0db24d50a635.1394785570.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <b7b3910fc03d9f0fac1e6363eb6b0db24d50a635.1394785570.git.hongxu.jia@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [PATCH 1/1] netcf: fix offline rebuilding failed
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
X-List-Received-Date: Fri, 14 Mar 2014 14:30:31 -0000
X-Groupsio-MsgNum: 48669
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JgQwtEuHJzHdouWu"
Content-Disposition: inline

--JgQwtEuHJzHdouWu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [PATCH 1/1] netcf: fix offline rebuilding failed] On 14.03.14 (Fri 16=
:36) Hongxu Jia wrote:

> The netcf downloaded gnulib source to ${S} at the configure time,
> while the network disconnected, if sstate cache was cleaned, the
> netcf rebuilding failed.
>=20
> Added a new recipe named 'gnulib' to download gnulib source to
> ${GITDIR} and populate it to the staging data dir.
>=20
> So netcf could specify this local directory where gnulib sources
> reside to save the bandwidth downloading.
>=20
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../recipes-support/netcf/gnulib_git.bb            | 35 ++++++++++++++++=
++++++
>  meta-networking/recipes-support/netcf/netcf_git.bb |  5 ++--
>  2 files changed, 38 insertions(+), 2 deletions(-)
>  create mode 100644 meta-networking/recipes-support/netcf/gnulib_git.bb
>=20
> diff --git a/meta-networking/recipes-support/netcf/gnulib_git.bb b/meta-n=
etworking/recipes-support/netcf/gnulib_git.bb
> new file mode 100644
> index 0000000..730f5cd
> --- /dev/null
> +++ b/meta-networking/recipes-support/netcf/gnulib_git.bb
> @@ -0,0 +1,35 @@
> +SUMMARY =3D "The GNU portability library"
> +DESCRIPTION =3D "A collection of software subroutines which are designed=
 to \
> +be usable on many operating systems. The goal of the project \
> +is to make it easy for free software authors to make their \
> +software run on many operating systems. Since source is designed \
> +to be copied from gnulib, it is not a library per-se, as much \
> +as a collection of portable idioms to be used in other projects."
> +
> +HOMEPAGE =3D "http://www.gnu.org/software/gnulib/"
> +SECTION =3D "libs"
> +LICENSE =3D "LGPLv2+"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De4cf3810f33a067ea7ccd2cd889fe=
d21"
> +SRCREV =3D "24379a9217fa4bd62685795aaaa010fd90ced9e3"
> +SRC_URI =3D "git://git.sv.gnu.org/gnulib;protocol=3Dgit \
> +"
> +S =3D "${WORKDIR}/git"
> +
> +# Git clone a copy of gnulib source to the staging data dir
> +sysroot_stage_all () {
> +    [ -d ${STAGING_DATADIR}/gnulib/ ] && rm -rf ${STAGING_DATADIR}/gnuli=
b/
> +    cd ${S}
> +    git checkout master
> +    git clone ${S} ${STAGING_DATADIR}/gnulib
> +}
> +
> +do_patch[noexec] =3D "1"
> +do_configure[noexec] =3D "1"
> +do_compile[noexec] =3D "1"
> +do_install[noexec] =3D "1"
> +do_package[noexec] =3D "1"
> +do_packagedata[noexec] =3D "1"
> +do_package_write_ipk[noexec] =3D "1"
> +do_package_write_deb[noexec] =3D "1"
> +do_package_write_rpm[noexec] =3D "1"
> diff --git a/meta-networking/recipes-support/netcf/netcf_git.bb b/meta-ne=
tworking/recipes-support/netcf/netcf_git.bb
> index 93f8c70..6c36ce8 100644
> --- a/meta-networking/recipes-support/netcf/netcf_git.bb
> +++ b/meta-networking/recipes-support/netcf/netcf_git.bb
> @@ -12,7 +12,7 @@ PV =3D "0.2.3+git${SRCPV}"
>  SRC_URI =3D "git://git.fedorahosted.org/netcf.git;protocol=3Dgit \
>  "
> =20
> -DEPENDS +=3D "augeas libnl libxslt libxml2"
> +DEPENDS +=3D "augeas libnl libxslt libxml2 gnulib"
> =20
>  S =3D "${WORKDIR}/git"
> =20
> @@ -21,6 +21,7 @@ inherit gettext autotools
>  EXTRA_OECONF_append_class-target =3D " --with-driver=3Dredhat"
>  do_configure_prepend() {
>  	cd ${S}
> -	./bootstrap
> +	rm -f .gitmodules
> +	./bootstrap --gnulib-srcdir=3D${STAGING_DATADIR}/gnulib
>  }
> =20
> --=20
> 1.8.1.2
>=20
--=20
-Joe MacDonald.
:wq

--JgQwtEuHJzHdouWu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlMjEoQACgkQwFvcllog0XyV+QCgs5ooryhGyRKu5UXohnPrrrk7
emgAn3yChWsGfeM7eQ/2u2bIuMLdsA90
=BGe3
-----END PGP SIGNATURE-----

--JgQwtEuHJzHdouWu--
