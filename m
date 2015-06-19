Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id BA2B673772
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jun 2015 15:56:13 +0000 (UTC)
Received: by wgbhy7 with SMTP id hy7so93230511wgb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jun 2015 08:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Q+i0CRGh/uz7KRI0p0nnRcItKCVmeqaljXHsnvBUofM=;
	b=rTjPpvTYYN76kDy+n9MUrUr37hftceSeJpHluaz5ra+41eoXPQNom5p09srQFj3Mls
	QfqosrBCpfjz9zhyX7pOMYJ+r418DrhjUIJ4rqP3iNEua/N8BRvnt+OO15cN1jrX+fcO
	sLyi+T5ZFQ5Xert9c3xrKlmHV0sZkdZWLnyLObt58aR6aTMGFI4funJSlNYWcCdXJX0d
	GRFLzDRdGTB/GXFu4YDODRKGKDZNbCZbv6JGi9W9WvKwRciQ0nS/EovSFVBq6WlFYzw/
	yCXBMdWFigmL21NofgiAb21Gd/SeBaekff0semiXmJ2LViwYw1O8l1AM70nbUCqXoR2h
	KjTQ==
X-Received: by 10.194.76.237 with SMTP id n13mr26264222wjw.111.1434729373917; 
	Fri, 19 Jun 2015 08:56:13 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id p2sm1692452wix.11.2015.06.19.08.56.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Jun 2015 08:56:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 19 Jun 2015 17:56:37 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150619155637.GA2398@jama>
References: <1434527353-47017-1-git-send-email-biannm@cn.fujitsu.com>
	<1434527353-47017-4-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1434527353-47017-4-git-send-email-biannm@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH v2 3/7] libldb: add new recipe
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
X-List-Received-Date: Fri, 19 Jun 2015 15:56:14 -0000
X-Groupsio-MsgNum: 55973
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline

--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2015 at 03:49:09PM +0800, Bian Naimeng wrote:
> libldb is required by samba4
>=20
> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> ---
>  .../do-not-import-target-module-in-configure.patch | 32 +++++++++++++++
>  meta-oe/recipes-support/libldb/libldb_1.1.17.bb    | 45 ++++++++++++++++=
++++++
>  2 files changed, 77 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libldb/libldb/do-not-import-t=
arget-module-in-configure.patch
>  create mode 100644 meta-oe/recipes-support/libldb/libldb_1.1.17.bb

Fails to build in bitbake world:

| Checking for system tdb >=3D 1.2.13                                      =
           : yes
| ERROR: Python module pytdb of version 1.2.13 not found, and bundling disa=
bled
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at /home/jenkin=
s/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/libldb/1.1.17-r0/temp/=
log.do_configure.22697)
NOTE: recipe libldb-1.1.17-r0: task do_configure: Failed
ERROR: Task 25505 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-o=
e/recipes-support/libldb/libldb_1.1.17.bb, do_configure) failed with exit c=
ode '1'

> diff --git a/meta-oe/recipes-support/libldb/libldb/do-not-import-target-m=
odule-in-configure.patch b/meta-oe/recipes-support/libldb/libldb/do-not-imp=
ort-target-module-in-configure.patch
> new file mode 100644
> index 0000000..b4d522a
> --- /dev/null
> +++ b/meta-oe/recipes-support/libldb/libldb/do-not-import-target-module-i=
n-configure.patch
> @@ -0,0 +1,32 @@
> +Some module can be loaded while cross compile, we jst check whether the =
module exist
> +
> +Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> +
> +--- ldb-1.1.17.orig/buildtools/wafsamba/samba_bundled.py	2014-05-05 17:0=
0:41.000000000 +0900
> ++++ ldb-1.1.17/buildtools/wafsamba/samba_bundled.py	2015-06-15 10:09:50.=
210000217 +0900
> +@@ -1,7 +1,7 @@
> + # functions to support bundled libraries
> +=20
> + from Configure import conf
> +-import sys, Logs
> ++import sys, Logs, imp
> + from samba_utils import *
> +=20
> + def PRIVATE_NAME(bld, name, private_extension, private_library):
> +@@ -222,6 +222,16 @@ def CHECK_BUNDLED_SYSTEM_PYTHON(conf, li
> +         m =3D __import__(modulename)
> +     except ImportError:
> +         found =3D False
> ++
> ++        build_arch =3D os.environ["BUILD_ARCH"]
> ++        host_arch =3D os.environ["HOST_ARCH"]
> ++        if build_arch !=3D host_arch:
> ++            # Some modules maybe can not be imported while cross compile
> ++            # We just check whether the module exist
> ++            stuff =3D imp.find_module(modulename, [os.environ["PYTHONPA=
TH"]])
> ++            if stuff !=3D None:
> ++                Logs.warn('Cross module[%s] has been found, but can not=
 be loaded.' % (stuff[1]))
> ++                found =3D True
> +     else:
> +         try:
> +             version =3D m.__version__
> diff --git a/meta-oe/recipes-support/libldb/libldb_1.1.17.bb b/meta-oe/re=
cipes-support/libldb/libldb_1.1.17.bb
> new file mode 100644
> index 0000000..17607f7
> --- /dev/null
> +++ b/meta-oe/recipes-support/libldb/libldb_1.1.17.bb
> @@ -0,0 +1,45 @@
> +SUMMARY =3D "Hierarchical, reference counted memory pool system with des=
tructors"
> +HOMEPAGE =3D "http://ldb.samba.org"
> +SECTION =3D "libs"
> +LICENSE =3D "LGPL-3.0+ & LGPL-2.1+ & GPL-3.0+"
> +
> +DEPENDS +=3D "libtdb talloc libtevent libtdb"
> +RDEPENDS_${PN} +=3D "libtevent popt libtalloc"
> +RDEPENDS_pyldb +=3D "python libtdb libtalloc"
> +
> +SRC_URI =3D "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
> +           file://do-not-import-target-module-in-configure.patch"
> +
> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/LGPL=
-3.0;md5=3Dbfccfe952269fff2b407dd11f2f3083b \
> +                    file://${COREBASE}/meta/files/common-licenses/LGPL-2=
=2E1;md5=3D1a6d268fd218675ffea8be556788b780 \
> +                    file://${COREBASE}/meta/files/common-licenses/GPL-3.=
0;md5=3Dc79ff39f19dfec6d293b95dea7b07891"
> +
> +SRC_URI[md5sum] =3D "7c2ab4e3f2a4186493aa06eabbc61cc0"
> +SRC_URI[sha256sum] =3D "b9a312aad19e9463716d257d8f2529fd7fc1a5ef24f6dcdc=
0c4a1930d7bdb6e6"
> +
> +inherit waf-samba
> +
> +S =3D "${WORKDIR}/ldb-${PV}"
> +
> +EXTRA_OECONF +=3D "--disable-rpath \
> +                 --disable-rpath-install \
> +                 --bundled-libraries=3DNONE \
> +                 --builtin-libraries=3Dreplace \
> +                 --with-modulesdir=3D${libdir}/ldb/modules \
> +                 --with-privatelibdir=3D${libdir}/ldb \
> +                 --with-libiconv=3D${STAGING_DIR_HOST}${prefix}\
> +                "
> +
> +PACKAGES +=3D "pyldb pyldb-dbg pyldb-dev"
> +
> +FILES_${PN} +=3D "${libdir}/ldb/*"
> +FILES_${PN}-dbg +=3D "${libdir}/ldb/.debug/* \
> +                    ${libdir}/ldb/modules/ldb/.debug/*"
> +
> +FILES_pyldb =3D "${libdir}/python${PYTHON_BASEVERSION}/site-packages/* \
> +               ${libdir}/libpyldb-util.so.1 \
> +               ${libdir}/libpyldb-util.so.1.1.17 \
> +              "
> +FILES_pyldb-dbg =3D "${libdir}/python${PYTHON_BASEVERSION}/site-packages=
/.debug \
> +                   ${libdir}/.debug/libpyldb-util.so.1.1.17"
> +FILES_pyldb-dev =3D "${libdir}/libpyldb-util.so"
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

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWEO7QACgkQN1Ujt2V2gByH2QCgnoyvur+Dw45c8C3wJVJUvb67
MrsAnAy8n2BzbRMwJAkRsV4Lx4dBj0L3
=tRVP
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--
