Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 893D077E51
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Jun 2017 07:23:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v567NbXB030749
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 6 Jun 2017 00:23:37 -0700
Received: from [128.224.162.189] (128.224.162.189) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Tue, 6 Jun 2017 00:23:36 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1495619834-254038-1-git-send-email-wenlin.kang@windriver.com>
From: Wenlin Kang <wenlin.kang@windriver.com>
Message-ID: <2a6e0aa9-e459-e77a-cbd7-1ed5c75a6b2b@windriver.com>
Date: Tue, 6 Jun 2017 15:23:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <1495619834-254038-1-git-send-email-wenlin.kang@windriver.com>
X-Originating-IP: [128.224.162.189]
Subject: Re: [meta-oe][PATCH] net-snmp: supported cross compile for the perl embedded and perl modules
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
X-List-Received-Date: Tue, 06 Jun 2017 07:23:37 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2017年05月24日 17:57, Wenlin Kang wrote:
> The patch solves two issues:
> 1. Supported cross compile for the perl embedded and perl modules.
> 2. Solved runtime depend issue.
>
> Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> ---
>   ...igure-fix-check-for-enable-perl-cc-checks.patch |  31 ++++
>   .../0002-configure-fix-a-cc-check-issue.patch      |  30 ++++
>   ...NGES-BUG-2712-Fix-Perl-module-compilation.patch | 186 +++++++++++++++++++++
>   .../0004-configure-fix-incorrect-variable.patch    |  30 ++++
>   .../recipes-protocols/net-snmp/net-snmp_5.7.3.bb   |  55 +++++-
>   5 files changed, 327 insertions(+), 5 deletions(-)
>   create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-configure-fix-check-for-enable-perl-cc-checks.patch
>   create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0002-configure-fix-a-cc-check-issue.patch
>   create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0003-CHANGES-BUG-2712-Fix-Perl-module-compilation.patch
>   create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0004-configure-fix-incorrect-variable.patch
>
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-configure-fix-check-for-enable-perl-cc-checks.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-configure-fix-check-for-enable-perl-cc-checks.patch
> new file mode 100644
> index 0000000..b87e9ee
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-configure-fix-check-for-enable-perl-cc-checks.patch
> @@ -0,0 +1,31 @@
> +From c6304a3e4b8441ff0a6464c0f1f6c5229092fa32 Mon Sep 17 00:00:00 2001
> +From: Niels Baggesen <nba@users.sourceforge.net>
> +Date: Wed, 24 May 2017 16:40:03 +0800
> +Subject: [PATCH 1/4] configure: fix check for --enable-perl-cc-checks
> +
> +This patch comes from git://git.code.sf.net/p/net-snmp/code,
> +the commit is 8f431d410b803603dc809d82e0893509615d9a11.
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> +---
> + configure.d/config_project_perl_python | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.d/config_project_perl_python b/configure.d/config_project_perl_python
> +index 23f8c7e..475c843 100644
> +--- a/configure.d/config_project_perl_python
> ++++ b/configure.d/config_project_perl_python
> +@@ -84,7 +84,7 @@ if test "x$install_perl" != "xno" ; then
> +
> +     #       What compiler was used to build the perl binary?
> +     #
> +-    if test "xenable_perl_cc_checks" != "xno" ; then
> ++    if test "x$enable_perl_cc_checks" != "xno" ; then
> +         AC_MSG_CHECKING([for Perl cc])
> +         changequote(, )
> +         PERLCC=`$myperl -V:cc | $myperl -n -e 'print if (s/^\s*cc=.([-=\w\s\/]+).;\s*/$1/);'`
> +--
> +1.9.1
> +
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-configure-fix-a-cc-check-issue.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-configure-fix-a-cc-check-issue.patch
> new file mode 100644
> index 0000000..999976d
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-configure-fix-a-cc-check-issue.patch
> @@ -0,0 +1,30 @@
> +From 94e7e4969bc84c945dfea12d67a1e10f61973948 Mon Sep 17 00:00:00 2001
> +From: Wenlin Kang <wenlin.kang@windriver.com>
> +Date: Wed, 24 May 2017 16:45:34 +0800
> +Subject: [PATCH 2/4] configure: fix a cc check issue.
> +
> +When has "." in cc value, the expression
> +$myperl -V:cc | $myperl -n -e 'print if (s/^\s*cc=.([-=\w\s\/]+).;\s*/$1/);'
> +can't get corretly the cc's value.
> +
> +Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> +---
> + configure.d/config_project_perl_python | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.d/config_project_perl_python b/configure.d/config_project_perl_python
> +index 475c843..22d2ad3 100644
> +--- a/configure.d/config_project_perl_python
> ++++ b/configure.d/config_project_perl_python
> +@@ -87,7 +87,7 @@ if test "x$install_perl" != "xno" ; then
> +     if test "x$enable_perl_cc_checks" != "xno" ; then
> +         AC_MSG_CHECKING([for Perl cc])
> +         changequote(, )
> +-        PERLCC=`$myperl -V:cc | $myperl -n -e 'print if (s/^\s*cc=.([-=\w\s\/]+).;\s*/$1/);'`
> ++        PERLCC=`$myperl -V:cc | $myperl -n -e 'print if (s/^\s*cc=.([-=\.\w\s\/]+).;\s*/$1/);'`
> +         changequote([, ])
> +         if test "x$PERLCC" != "x" ; then
> +             AC_MSG_RESULT([$PERLCC])
> +--
> +1.9.1
> +
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0003-CHANGES-BUG-2712-Fix-Perl-module-compilation.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0003-CHANGES-BUG-2712-Fix-Perl-module-compilation.patch
> new file mode 100644
> index 0000000..7951234
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0003-CHANGES-BUG-2712-Fix-Perl-module-compilation.patch
> @@ -0,0 +1,186 @@
> +From e57fc809ad6ae522670f3dc157aadde20d968ca7 Mon Sep 17 00:00:00 2001
> +From: Bart Van Assche <bvanassche@acm.org>
> +Date: Wed, 24 May 2017 17:05:03 +0800
> +Subject: [PATCH 3/4] CHANGES: BUG: 2712: Fix Perl module compilation
> +
> +Avoid that building the Net-SNMP Perl modules fails as follows:
> +
> +ERROR from evaluation of /sources/net-snmp-5.7.3/perl/ASN/Makefile.PL: Bizarre \ copy of HASH in list assignment at /usr/lib/perl5/site_perl/5.24.0/Carp.pm line\ 229.
> +
> +See also https://sourceforge.net/p/net-snmp/bugs/2712/.
> +
> +This patch comes from git://git.code.sf.net/p/net-snmp/code,
> +the commit is 4e793461e96a2b4fd81142ab312d074d5c8841fa.
> +
> +Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> +---
> + perl/ASN/Makefile.PL                 | 4 +---
> + perl/Makefile.PL                     | 4 +---
> + perl/OID/Makefile.PL                 | 5 +----
> + perl/SNMP/Makefile.PL                | 5 +----
> + perl/TrapReceiver/Makefile.PL        | 5 +----
> + perl/agent/Makefile.PL               | 5 +----
> + perl/agent/Support/Makefile.PL       | 5 +----
> + perl/agent/default_store/Makefile.PL | 5 +----
> + perl/default_store/Makefile.PL       | 5 +----
> + 9 files changed, 9 insertions(+), 34 deletions(-)
> +
> +diff --git a/perl/ASN/Makefile.PL b/perl/ASN/Makefile.PL
> +index 4576781..c33d8ba 100644
> +--- a/perl/ASN/Makefile.PL
> ++++ b/perl/ASN/Makefile.PL
> +@@ -7,9 +7,7 @@ my $lib_version;
> + # See lib/ExtUtils/MakeMaker.pm for details of how to influence
> + # the contents of the Makefile that is written.
> +
> +-%MakeParams = InitMakeParams();
> +-
> +-WriteMakefile(%MakeParams);
> ++WriteMakefile(InitMakeParams());
> +
> + Check_Version();
> +
> +diff --git a/perl/Makefile.PL b/perl/Makefile.PL
> +index 31fdc40..48aba2a 100644
> +--- a/perl/Makefile.PL
> ++++ b/perl/Makefile.PL
> +@@ -3,9 +3,7 @@ use Config;
> + use Getopt::Long;
> + require 5;
> +
> +-%MakeParams = InitMakeParams();
> +-
> +-WriteMakefile(%MakeParams);
> ++WriteMakefile(InitMakeParams());
> +
> + sub InitMakeParams {
> +     $nsconfig="net-snmp-config"; # in path by default
> +diff --git a/perl/OID/Makefile.PL b/perl/OID/Makefile.PL
> +index 6bb1616..2589985 100644
> +--- a/perl/OID/Makefile.PL
> ++++ b/perl/OID/Makefile.PL
> +@@ -6,11 +6,8 @@ require 5;
> + use Config;
> + use Getopt::Long;
> + my $lib_version;
> +-my %MakeParams = ();
> +
> +-%MakeParams = InitMakeParams();
> +-
> +-WriteMakefile(%MakeParams);
> ++WriteMakefile(InitMakeParams());
> +
> + Check_Version();
> +
> +diff --git a/perl/SNMP/Makefile.PL b/perl/SNMP/Makefile.PL
> +index e617cb7..8aab9a9 100644
> +--- a/perl/SNMP/Makefile.PL
> ++++ b/perl/SNMP/Makefile.PL
> +@@ -3,15 +3,12 @@ require 5;
> + use Config;
> + use Getopt::Long;
> + my $lib_version;
> +-my %MakeParams = ();
> + my $opts;
> +
> + # See lib/ExtUtils/MakeMaker.pm for details of how to influence
> + # the contents of the Makefile that is written.
> +
> +-%MakeParams = InitMakeParams();
> +-
> +-WriteMakefile(%MakeParams);
> ++WriteMakefile(InitMakeParams());
> +
> + Check_Version();
> +
> +diff --git a/perl/TrapReceiver/Makefile.PL b/perl/TrapReceiver/Makefile.PL
> +index 874ee21..7e9e58e 100644
> +--- a/perl/TrapReceiver/Makefile.PL
> ++++ b/perl/TrapReceiver/Makefile.PL
> +@@ -3,11 +3,8 @@ require 5;
> + use Config;
> + use Getopt::Long;
> + my $lib_version;
> +-my %MakeParams = ();
> +
> +-%MakeParams = InitMakeParams();
> +-
> +-WriteMakefile(%MakeParams);
> ++WriteMakefile(InitMakeParams());
> +
> + Check_Version();
> +
> +diff --git a/perl/agent/Makefile.PL b/perl/agent/Makefile.PL
> +index 4f7bee3..003c0d1 100644
> +--- a/perl/agent/Makefile.PL
> ++++ b/perl/agent/Makefile.PL
> +@@ -3,11 +3,8 @@ require 5;
> + use Config;
> + use Getopt::Long;
> + my $lib_version;
> +-my %MakeParams = ();
> +
> +-%MakeParams = InitMakeParams();
> +-
> +-WriteMakefile(%MakeParams);
> ++WriteMakefile(InitMakeParams());
> +
> + Check_Version();
> +
> +diff --git a/perl/agent/Support/Makefile.PL b/perl/agent/Support/Makefile.PL
> +index 48815b6..2325e10 100644
> +--- a/perl/agent/Support/Makefile.PL
> ++++ b/perl/agent/Support/Makefile.PL
> +@@ -3,14 +3,11 @@ require 5;
> + use Config;
> + use Getopt::Long;
> + my $lib_version;
> +-my %MakeParams = ();
> +
> + # See lib/ExtUtils/MakeMaker.pm for details of how to influence
> + # the contents of the Makefile that is written.
> +
> +-%MakeParams = InitMakeParams();
> +-
> +-WriteMakefile(%MakeParams);
> ++WriteMakefile(InitMakeParams());
> +
> + Check_Version();
> +
> +diff --git a/perl/agent/default_store/Makefile.PL b/perl/agent/default_store/Makefile.PL
> +index ed6483a..31cfbee 100644
> +--- a/perl/agent/default_store/Makefile.PL
> ++++ b/perl/agent/default_store/Makefile.PL
> +@@ -3,11 +3,8 @@ require 5;
> + use Config;
> + use Getopt::Long;
> + my $lib_version;
> +-my %MakeParams = ();
> +
> +-%MakeParams = InitMakeParams();
> +-
> +-WriteMakefile(%MakeParams);
> ++WriteMakefile(InitMakeParams());
> +
> + Check_Version();
> +
> +diff --git a/perl/default_store/Makefile.PL b/perl/default_store/Makefile.PL
> +index 7c671b8..01c8dd0 100644
> +--- a/perl/default_store/Makefile.PL
> ++++ b/perl/default_store/Makefile.PL
> +@@ -3,11 +3,8 @@ require 5;
> + use Config;
> + use Getopt::Long;
> + my $lib_version;
> +-my %MakeParams = ();
> +
> +-%MakeParams = InitMakeParams();
> +-
> +-WriteMakefile(%MakeParams);
> ++WriteMakefile(InitMakeParams());
> +
> +
> + sub InitMakeParams {
> +--
> +1.9.1
> +
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0004-configure-fix-incorrect-variable.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0004-configure-fix-incorrect-variable.patch
> new file mode 100644
> index 0000000..2b03f9e
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0004-configure-fix-incorrect-variable.patch
> @@ -0,0 +1,30 @@
> +From 4ad98ef125eb4e7d7a1a93146042002f78254d36 Mon Sep 17 00:00:00 2001
> +From: Wenlin Kang <wenlin.kang@windriver.com>
> +Date: Wed, 24 May 2017 17:10:20 +0800
> +Subject: [PATCH 4/4] configure: fix incorrect variable
> +
> +For cross compile platform, this variable will not be correct, so fix it.
> +
> +Upstream-Status: Inappropriate [cross compile specific]
> +
> +Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> +---
> + Makefile.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile.in b/Makefile.in
> +index cfcdf73..164df05 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -171,7 +171,7 @@ OTHERCLEANTODOS=perlclean @PYTHONCLEANTARGS@ cleanfeatures perlcleanfeatures pyt
> + #
> + # override LD_RUN_PATH to avoid dependencies on the build directory
> + perlmodules: perlmakefiles subdirs
> +-	@(cd perl ; $(MAKE) LD_RUN_PATH="$(libdir):`$(PERL) -e 'use Config; print qq($$Config{archlibexp}/CORE);'`") ; \
> ++	@(cd perl ; $(MAKE) LD_RUN_PATH="$(libdir):`$(PERL) -e 'use Config; print qq($$Config{installprivlib}/CORE);'`") ; \
> +         if test $$? != 0 ; then \
> +            exit 1 ; \
> +         fi
> +--
> +1.9.1
> +
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> index b60a246..2d6887e 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> @@ -26,11 +26,15 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.zip \
>              file://0001-get_pid_from_inode-Include-limit.h.patch \
>              file://0001-BUG-a2584-Fix-snmptrap-to-use-clientaddr-from-snmp.c.patch \
>              file://0001-snmplib-UDPIPv6-transport-Add-a-missing-return-state.patch \
> +           file://0001-configure-fix-check-for-enable-perl-cc-checks.patch \
> +           file://0002-configure-fix-a-cc-check-issue.patch \
> +           file://0003-CHANGES-BUG-2712-Fix-Perl-module-compilation.patch \
> +           file://0004-configure-fix-incorrect-variable.patch \
>              "
>   SRC_URI[md5sum] = "9f682bd70c717efdd9f15b686d07baee"
>   SRC_URI[sha256sum] = "e8dfc79b6539b71a6ff335746ce63d2da2239062ad41872fff4354cafed07a3e"
>   
> -inherit autotools update-rc.d siteinfo systemd pkgconfig
> +inherit autotools-brokensep update-rc.d siteinfo systemd pkgconfig perlnative
>   
>   EXTRA_OEMAKE = "INSTALL_PREFIX=${D} OTHERLDFLAGS='${LDFLAGS}' HOST_CPPFLAGS='${BUILD_CPPFLAGS}'"
>   
> @@ -46,8 +50,10 @@ PACKAGECONFIG[libnl] = "--with-nl, --without-nl, libnl"
>   PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
>   PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,,"
>   
> -EXTRA_OECONF = "--disable-embedded-perl \
> -                --with-perl-modules=no \
> +PACKAGECONFIG[perl] = "--enable-embedded-perl --with-perl-modules=yes, --disable-embedded-perl --with-perl-modules=no,\
> +                       perl, perl perl-lib"
> +
> +EXTRA_OECONF = "--enable-shared \
>                   --disable-manuals \
>                   --with-defaults \
>                   --with-install-prefix=${D} \
> @@ -63,12 +69,38 @@ CACHED_CONFIGUREVARS = " \
>       ac_cv_ETC_MNTTAB=/etc/mtab \
>       lt_cv_shlibpath_overrides_runpath=yes \
>   "
> +export PERLPROG="${bindir}/env perl"
> +PERLPROG_append = "${@bb.utils.contains('PACKAGECONFIG', 'perl', ' -I${WORKDIR}', '', d)}"
> +
> +HAS_PERL = "${@bb.utils.contains('PACKAGECONFIG', 'perl', '1', '0', d)}"
>   
>   do_configure_prepend() {
> -    export PERLPROG="${bindir}/env perl"
>       sed -i -e "s|I/usr/include|I${STAGING_INCDIR}|g" \
>           "${S}"/configure \
>           "${S}"/configure.d/config_os_libs2
> +
> +    if [ "${HAS_PERL}" = "1" ]; then
> +        # this may need to be changed when package perl has any change.
> +        cp -f ${STAGING_DIR_TARGET}/usr/lib*/perl/*/Config.pm ${WORKDIR}/
> +        cp -f ${STAGING_DIR_TARGET}/usr/lib*/perl/*/Config_heavy.pl ${WORKDIR}/
> +        sed -e "s@libpth => '/usr/lib.*@libpth => '${STAGING_DIR_TARGET}/${libdir} ${STAGING_DIR_TARGET}/${base_libdir}',@g" \
> +            -e "s@privlibexp => '/usr@privlibexp => '${STAGING_DIR_TARGET}/usr@g" \
> +            -e "s@scriptdir => '/usr@scriptdir => '${STAGING_DIR_TARGET}/usr@g" \
> +            -e "s@sitearchexp => '/usr@sitearchexp => '${STAGING_DIR_TARGET}/usr@g" \
> +            -e "s@sitelibexp => '/usr@sitearchexp => '${STAGING_DIR_TARGET}/usr@g" \
> +            -e "s@vendorarchexp => '/usr@vendorarchexp => '${STAGING_DIR_TARGET}/usr@g" \
> +            -e "s@vendorlibexp => '/usr@vendorlibexp => '${STAGING_DIR_TARGET}/usr@g" \
> +            -i ${WORKDIR}/Config.pm
> +    fi
> +
> +}
> +
> +do_configure_append() {
> +    if [ "${HAS_PERL}" = "1" ]; then
> +        sed -e "s@^NSC_INCLUDEDIR=.*@NSC_INCLUDEDIR=${STAGING_DIR_TARGET}\$\{includedir\}@g" \
> +            -e "s@^NSC_LIBDIR=-L.*@NSC_LIBDIR=-L${STAGING_DIR_TARGET}\$\{libdir\}@g" \
> +            -i ${B}/net-snmp-config
> +    fi
>   }
>   
>   do_install_append() {
> @@ -84,6 +116,12 @@ do_install_append() {
>           -i ${D}${bindir}/net-snmp-create-v3-user
>       sed    -e "s@^NSC_SRCDIR=.*@NSC_SRCDIR=.@g" \
>           -i ${D}${bindir}/net-snmp-config
> +
> +    if [ "${HAS_PERL}" = "1" ]; then
> +        sed -e "s@^NSC_INCLUDEDIR=.*@NSC_INCLUDEDIR=\$\{includedir\}@g" \
> +            -e "s@^NSC_LIBDIR=-L.*@NSC_LIBDIR=-L\$\{libdir\}@g" \
> +            -i ${D}${bindir}/net-snmp-config
> +    fi
>   }
>   
>   do_install_ptest() {
> @@ -122,9 +160,14 @@ net_snmp_sysroot_preprocess () {
>   
>   PACKAGES += "${PN}-libs ${PN}-mibs ${PN}-server ${PN}-client ${PN}-server-snmpd ${PN}-server-snmptrapd"
>   
> +# perl module
> +PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'perl', '${PN}-perl-modules', '', d)}"
> +
>   ALLOW_EMPTY_${PN} = "1"
>   ALLOW_EMPTY_${PN}-server = "1"
>   
> +FILES_${PN}-perl-modules = "${libdir}/perl/*"
> +
>   FILES_${PN}-libs = "${libdir}/lib*${SOLIBS}"
>   FILES_${PN}-mibs = "${datadir}/snmp/mibs"
>   FILES_${PN}-server-snmpd = "${sbindir}/snmpd \
> @@ -158,11 +201,13 @@ SYSTEMD_PACKAGES = "${PN}-server-snmpd \
>   SYSTEMD_SERVICE_${PN}-server-snmpd = "snmpd.service"
>   SYSTEMD_SERVICE_${PN}-server-snmptrapd =  "snmptrapd.service"
>   
> +RDEPENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'perl', 'net-snmp-perl-modules', '', d)}"
>   RDEPENDS_${PN} += "net-snmp-client"
>   RDEPENDS_${PN}-server-snmpd += "net-snmp-mibs"
>   RDEPENDS_${PN}-server-snmptrapd += "net-snmp-server-snmpd"
>   RDEPENDS_${PN}-server += "net-snmp-server-snmpd net-snmp-server-snmptrapd"
> -RDEPENDS_${PN}-client += "net-snmp-mibs"
> +RDEPENDS_${PN}-client += "net-snmp-mibs net-snmp-libs"
> +RDEPENDS_${PN}-libs += "libpci"
>   RDEPENDS_${PN}-ptest += "perl \
>                            perl-module-test \
>                            perl-module-file-basename \


ping ......


-- 
Thanks,
Wenlin Kang


