Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2989571036
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Sep 2014 06:19:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8S6JClu009315
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 27 Sep 2014 23:19:12 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.18]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0174.001;
	Sat, 27 Sep 2014 23:19:12 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"paul.eggleton@linux.intel.com" <paul.eggleton@linux.intel.com>,
	"Yang, Liezhi" <Liezhi.Yang@windriver.com>
Thread-Topic: [oe] [meta-oe][PATCH] mariadb: drop the anonymous function and
	use	proper install layout
Thread-Index: AQHP2uMDsOuTq73eG02C9LHHFmw7a5wWEgRw
Date: Sun, 28 Sep 2014 06:19:11 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AABD50C6FD@ALA-MBB.corp.ad.wrs.com>
References: <1411884590-22155-1-git-send-email-jackie.huang@windriver.com>
In-Reply-To: <1411884590-22155-1-git-send-email-jackie.huang@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.134]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] mariadb: drop the anonymous function and use	proper install layout
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
X-List-Received-Date: Sun, 28 Sep 2014 06:19:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of jackie.huang@windriver.com
> Sent: Sunday, September 28, 2014 2:10 PM
> To: openembedded-devel@lists.openembedded.org; paul.eggleton@linux.intel.=
com; Yang, Liezhi
> Subject: [oe] [meta-oe][PATCH] mariadb: drop the anonymous function and u=
se proper install layout
>=20
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> The anonymous function redefined bindir to bindir_noprefix (and others), =
which broke the sstate
> between build dirs.
>=20
> The redefined *_noprefix was to used to pass to the INSTALL_* variables t=
o change the layout as we
> want, but in fact we can do this in other ways instead of the pain one:
>=20
> 1) Change the default layout and a little adjustment.
> There are 4 install layout: STANDALONE(default), RPM, DEB and SVR4.
> And RPM is the one close to what we are using.
>=20
> 2) Don't use prefix and pass full patches to INSTALL_*.

Sorry, one typo here: s/patches/paths/

I will send v2 for this.

Thanks,
Jackie

> The mariadb's cmake define some of the INSTALL_* relative to CMAKE_INSTAL=
L_PREFIX, So we can
> use empty CMAKE_INSTALL_PREFIX, then we can pass our full paths to INSTAL=
L_* directly.
>=20
> This patch set the default layout to RPM and pass paths only for:
> - INSTALL_DOCDIR: no prefix prepending, so ${datadir} works.
> - INSTALL_LIBDIR/INSTALL_PLUGINDIR: use ${baselib}.
>=20
> The mysql-test is moved from /usr to /usr/share which is more reasonable,=
 fix the FILES inclusion
> accordingly.
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta-oe/recipes-support/mysql/mariadb_5.5.39.inc | 27 +++++-------------=
------
>  1 file changed, 5 insertions(+), 22 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc b/meta-oe/r=
ecipes-
> support/mysql/mariadb_5.5.39.inc
> index 9cc2cc9..4460df9 100644
> --- a/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc
> +++ b/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc
> @@ -35,19 +35,6 @@ SYSTEMD_AUTO_ENABLE_mariadb-server =3D "disable"
>=20
>  EXTRA_OEMAKE =3D "'GEN_LEX_HASH=3D${STAGING_BINDIR_NATIVE}/gen_lex_hash'=
"
>=20
> -python __anonymous() {
> -    # This is a pain but it's the only way to pass these in since
> -    # MariaDB's cmake scripts insist on prepending the prefix to the
> -    # specified values for INSTALL_*
> -    localdata =3D d.createCopy()
> -    localdata.setVar('prefix', '')
> -    localdata.setVar('exec_prefix', '')
> -    d.setVar('bindir_noprefix', localdata.getVar('bindir', True).lstrip(=
'/'))
> -    d.setVar('sbindir_noprefix', localdata.getVar('sbindir', True).lstri=
p('/'))
> -    d.setVar('datadir_noprefix', localdata.getVar('datadir', True).lstri=
p('/'))
> -    d.setVar('libdir_noprefix', localdata.getVar('libdir', True).lstrip(=
'/'))
> -}
> -
>  PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam=
', '', d)}"
>  PACKAGECONFIG_class-native =3D ""
>  PACKAGECONFIG[pam] =3D ",-DWITHOUT_AUTH_PAM=3DTRUE,libpam"
> @@ -64,15 +51,11 @@ EXTRA_OECMAKE =3D "-DWITH_EMBEDDED_SERVER=3DON \
>                   -DNROFF=3DFALSE \
>                   -DENABLE_DTRACE=3DFALSE \
>                   -DWITH_PIC=3DON \
> -                 -DINSTALL_DOCDIR:PATH=3D${datadir_noprefix}/doc/${BPN} =
\
> -                 -DINSTALL_BINDIR:PATH=3D${bindir_noprefix} \
> -                 -DINSTALL_SBINDIR:PATH=3D${sbindir_noprefix} \
> -                 -DINSTALL_SCRIPTDIR:PATH=3D${bindir_noprefix} \
> -                 -DINSTALL_LIBDIR:PATH=3D${libdir_noprefix} \
> -                 -DINSTALL_PLUGINDIR:PATH=3D${libdir_noprefix}/plugin \
> +                 -DINSTALL_LAYOUT=3DRPM \
> +                 -DINSTALL_DOCDIR:PATH=3D${datadir}/doc/${BPN} \
> +                 -DINSTALL_LIBDIR:PATH=3D${baselib} \
> +                 -DINSTALL_PLUGINDIR:PATH=3D${baselib}/plugin \
>                   -DINSTALL_SYSCONFDIR:PATH=3D${sysconfdir} \
> -                 -DINSTALL_MYSQLSHAREDIR:PATH=3D${datadir_noprefix}/mysq=
l \
> -                 -DINSTALL_SUPPORTFILESDIR:PATH=3D${datadir_noprefix}/my=
sql-support-files \
>                   -DMYSQL_DATADIR:PATH=3D/var/mysql \
>                   -DCAT_EXECUTABLE=3D`which cat` \
>                   -DCMAKE_AR:FILEPATH=3D${AR}"
> @@ -177,7 +160,7 @@ FILES_libmysqlclient-dev =3D " \  FILES_libmysqlclien=
t-staticdev =3D "\
>      ${libdir}/*.a"
>  FILES_libmysqlclient-dbg =3D "${libdir}/plugin/.debug/ \
> -    /usr/mysql-test/lib/My/SafeProcess/.debug/my_safe_process"
> +    ${datadir}/mysql-test/lib/My/SafeProcess/.debug/my_safe_process"
>=20
>  # Avoid warnings about ha_xtradb.so.0.0.0 and ha_innodb_plugin.so.0.0.0 =
 # which are intentionally
> non-PIC on 32-bit x86 (see e.g.
> --
> 2.0.0
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

