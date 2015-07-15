Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3AC7E607A5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jul 2015 09:06:42 +0000 (UTC)
Received: by widic2 with SMTP id ic2so57842091wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jul 2015 02:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zy4OsvSAgIfagz607EWcMPY5HrS9Zo9APiIqbTEFd9Q=;
	b=QAcUWJh1AzOlp+0Vt9fKAxxlO6WNtyGjdw/HV/Iu4XE94UpPUbUOIsSDSFj91NG5le
	yn+clKpcfAbBI7KLUp0f7pBalM7t9BHNri1BDA57jHbiMVVCJ3Fbm5s9L5ulhNQ4AvH9
	CccatMeOlD2zqumimT95fBW7saKPONTejxqd6V8ESzDV0X99LhrDJa9QC3zHXlnpCcnb
	HPiNghtI4GBagdtrKSUFD6KV74shp3XdAJJpX02lJrigLq8YcG8rZ8aqL+aAzxWGFXrt
	QaMGLo2nGQwrc/FpjKfL+l+TsvZ84NkH7NWPTAuQXno6Ow9uLCDgUS6SwUzxDf95JqF2
	mK1Q==
X-Received: by 10.194.108.5 with SMTP id hg5mr6547067wjb.25.1436951202531;
	Wed, 15 Jul 2015 02:06:42 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	di7sm8019510wib.23.2015.07.15.02.06.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jul 2015 02:06:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 15 Jul 2015 11:07:00 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150715090700.GB2163@jama>
References: <1434358336-34981-1-git-send-email-biannm@cn.fujitsu.com>
	<1434358336-34981-4-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1434358336-34981-4-git-send-email-biannm@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 3/7] ctdb: add new recipe
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
X-List-Received-Date: Wed, 15 Jul 2015 09:06:46 -0000
X-Groupsio-MsgNum: 56248
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xXmbgvnjoT4axfJE"
Content-Disposition: inline

--xXmbgvnjoT4axfJE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2015 at 04:52:12PM +0800, Bian Naimeng wrote:
> ctdb is required by samba4

it causes new QA warning, please fix it:
ctdb-2.5.1: /usr/bin/onnode_ctdb contained in package ctdb requires
/bin/bash, but no providers found in its RDEPENDS [file-rdeps]

ideally by removing bashisms and changing shebang

> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> ---
>  .../01-support-cross-compile-for-linux-os.patch    | 24 ++++++++++++
>  .../ctdb/02-link-rep_snprintf-for-ltdbtool.patch   | 16 ++++++++
>  meta-oe/recipes-support/ctdb/ctdb_2.5.1.bb         | 43 ++++++++++++++++=
++++++
>  3 files changed, 83 insertions(+)
>  create mode 100644 meta-oe/recipes-support/ctdb/ctdb/01-support-cross-co=
mpile-for-linux-os.patch
>  create mode 100644 meta-oe/recipes-support/ctdb/ctdb/02-link-rep_snprint=
f-for-ltdbtool.patch
>  create mode 100644 meta-oe/recipes-support/ctdb/ctdb_2.5.1.bb
>=20
> diff --git a/meta-oe/recipes-support/ctdb/ctdb/01-support-cross-compile-f=
or-linux-os.patch b/meta-oe/recipes-support/ctdb/ctdb/01-support-cross-comp=
ile-for-linux-os.patch
> new file mode 100644
> index 0000000..c9195b4
> --- /dev/null
> +++ b/meta-oe/recipes-support/ctdb/ctdb/01-support-cross-compile-for-linu=
x-os.patch
> @@ -0,0 +1,24 @@
> +support cross-compile for linux-os.
> +
> +Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> +
> +diff -Nurp ctdb-2.5.1.orig/configure ctdb-2.5.1/configure
> +--- ctdb-2.5.1.orig/configure	2015-05-07 16:24:28.545000238 +0900
> ++++ ctdb-2.5.1/configure	2015-05-07 16:28:20.894000244 +0900
> +@@ -10692,10 +10692,16 @@ if test x"$libreplace_cv_HAVE_GETADDRINF
> + 	# see bug 5910, use our replacements if we detect
> + 	# a broken system.
> + 	if test "$cross_compiling" =3D yes; then :
> ++		case "$target_os" in
> ++		*linux*)
> ++			;;
> ++		*)
> +   { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
> + $as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
> + as_fn_error $? "cannot run test program while cross compiling
> + See \`config.log' for more details" "$LINENO" 5; }
> ++			;;
> ++		esac
> + else
> +   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> + /* end confdefs.h.  */
> diff --git a/meta-oe/recipes-support/ctdb/ctdb/02-link-rep_snprintf-for-l=
tdbtool.patch b/meta-oe/recipes-support/ctdb/ctdb/02-link-rep_snprintf-for-=
ltdbtool.patch
> new file mode 100644
> index 0000000..1dd9b93
> --- /dev/null
> +++ b/meta-oe/recipes-support/ctdb/ctdb/02-link-rep_snprintf-for-ltdbtool=
=2Epatch
> @@ -0,0 +1,16 @@
> +link rep_snprintf from lib/replace/snprintf.o for ltdbtool
> +
> +Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> +
> +diff -Nurp ctdb-2.5.1.orig/Makefile.in ctdb-2.5.1/Makefile.in
> +--- ctdb-2.5.1.orig/Makefile.in	2015-05-07 16:43:39.276000236 +0900
> ++++ ctdb-2.5.1/Makefile.in	2015-05-07 16:44:09.627000237 +0900
> +@@ -170,7 +170,7 @@ bin/ctdb: $(CTDB_CLIENT_OBJ) tools/ctdb.
> + 	@echo Linking $@
> + 	$(WRAPPER) $(CC) $(CFLAGS) -o $@ tools/ctdb.o tools/ctdb_vacuum.o $(CT=
DB_CLIENT_OBJ) $(LIB_FLAGS)
> +=20
> +-bin/ltdbtool: tools/ltdbtool.o $(TDB_OBJ)
> ++bin/ltdbtool: tools/ltdbtool.o $(TDB_OBJ) lib/replace/snprintf.o
> + 	@echo Linking $@
> + 	$(WRAPPER) $(CC) $(CFLAGS) -o $@ $+ $(TDB_LIBS) $(LIB_FLAGS)
> +=20
> diff --git a/meta-oe/recipes-support/ctdb/ctdb_2.5.1.bb b/meta-oe/recipes=
-support/ctdb/ctdb_2.5.1.bb
> new file mode 100644
> index 0000000..25d5dc9
> --- /dev/null
> +++ b/meta-oe/recipes-support/ctdb/ctdb_2.5.1.bb
> @@ -0,0 +1,43 @@
> +DESCRIPTION =3D "CTDB is a cluster implementation of the TDB database \
> +used by Samba and other projects to store temporary data. If an \
> +application is already using TDB for temporary data it is very easy \
> +to convert that application to be cluster aware and use CTDB instead."
> +DESCRIPTION =3D "CTDB is a cluster implementation of the TDB database \
> +used by Samba and other projects to store temporary data. If an \
> +application is already using TDB for temporary data it is very easy \
> +to convert that application to be cluster aware and use CTDB instead."
> +HOMEPAGE =3D "https://ctdb.samba.org/"
> +LICENSE =3D "GPL-2.0+ & LGPL-3.0+ & GPL-3.0+"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504 \
> +                    file://${COREBASE}/meta/files/common-licenses/LGPL-3=
=2E0;md5=3Dbfccfe952269fff2b407dd11f2f3083b \
> +                    file://${COREBASE}/meta/files/common-licenses/GPL-2.=
0;md5=3D801f80980d171dd6425610833a22dbe6 \
> +                    "
> +
> +SRC_URI =3D "https://ftp.samba.org/pub/${PN}/${BP}.tar.gz \
> +           file://01-support-cross-compile-for-linux-os.patch \
> +           file://02-link-rep_snprintf-for-ltdbtool.patch \
> +          "
> +
> +SRC_URI[md5sum] =3D "d0cd91726ff4ca2229e1b21859c94717"
> +SRC_URI[sha256sum] =3D "d5bf3f674cae986bb6178b1db215a703ac94adc5f75fadfd=
cff63dcbb5e98ab5"
> +
> +inherit autotools-brokensep pkgconfig systemd
> +
> +PARALLEL_MAKE =3D ""
> +
> +DEPENDS +=3D "popt libtevent libtalloc"
> +
> +do_configure() {
> +    oe_runconf
> +}
> +
> +do_install_append() {
> +    install -d ${D}${systemd_unitdir}/system
> +    install -m 0644 ${S}/config/ctdb.service ${D}${systemd_unitdir}/syst=
em
> +    sed -i -e 's,/usr/sbin/,${sbindir}/,' ${D}${systemd_unitdir}/system/=
ctdb.service
> +}
> +
> +SYSTEMD_SERVICE_${PN} =3D "ctdb.service"
> +
> +FILES_${PN} +=3D "/run"
> --=20
> 1.8.4.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xXmbgvnjoT4axfJE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWmIrMACgkQN1Ujt2V2gBz+5gCfdfancx3b4O0bxOdmh0I+FbhE
KyMAnAu31JH5OetMOD+OWML/zpS39rH0
=bWGe
-----END PGP SIGNATURE-----

--xXmbgvnjoT4axfJE--
