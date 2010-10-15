Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1P6mkO-0001aS-UR
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 18:03:12 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id o9FG2dVX015239
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Oct 2010 11:02:39 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id o9FG2dfs011365
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Oct 2010 11:02:39 -0500 (CDT)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o9FG2ds8010538
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Oct 2010 11:02:39 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee73.ent.ti.com
	([157.170.170.88]) with mapi; Fri, 15 Oct 2010 11:02:39 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Oct 2010 11:02:37 -0500
Thread-Topic: [oe] [PATCH (v2)] Reverse the order of OVERRIDES
Thread-Index: Actsf5tKJ6MtKWY6TtOae+cKyaOPLgAArCpA
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310FFAC19@dlee06.ent.ti.com>
References: <1287113787-21268-1-git-send-email-kergoth@gmail.com>
	<1287157281-31597-1-git-send-email-kergoth@gmail.com>
In-Reply-To: <1287157281-31597-1-git-send-email-kergoth@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 198.47.26.152
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL, BAYES_00, SPF_PASS,
	URI_HEX autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH (v2)] Reverse the order of OVERRIDES
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
X-List-Received-Date: Fri, 15 Oct 2010 16:03:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Chris Larson
> Sent: Friday, October 15, 2010 10:41 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [PATCH (v2)] Reverse the order of OVERRIDES
>
> From: Chris Larson <chris_larson@mentor.com>
>
> Given the current implementation of OVERRIDES in bitbake, the variable is
> expected to contain elements in the order least specific to most specific=
,
> however, our current usage of it does not match that.  As one example,
> "local"
> is supposed to always be the most specific override, yet currently it's
> the
> least specific.  As another example, currently the target architecture is
> seen
> as more specific than the machine, which is also clearly wrong.
>
> Big thanks to Chase Maupin for investigating and identifying this long
> standing issue.
>
> It becomes clear that a reversal of the current value will bring us to a
> more
> sane behavior, and avoids the need for the dual overrides hack mentioned
> in
> the comments, so this implements this reversal, and drops the unnecessary
> and
> confusing comments.
>
> This also introduces a MACHINE_OVERRIDES variable as a generic mechanism
> to
> inject overrides elements which are more specific than the distro but les=
s
> specific than the machine, which is where things like MACHINE_CLASS or
> SOC_FAMILY or the like would go.  This variable is *space* separated, to
> make
> it easier and more convenient to assemble the variable incrementally.
>
> Reported-by: Chase Maupin <chase.maupin@ti.com>
> Signed-off-by: Chris Larson <chris_larson@mentor.com>


Acked-by: Chase Maupin <chase.maupin@ti.com>

> ---
>  conf/bitbake.conf                             |   17 ++-----------
>  conf/distro/include/arm-thumb.inc             |    6 ++--
>  conf/distro/micro.conf                        |    6 ++--
>  conf/distro/minimal.conf                      |    5 ++-
>  conf/distro/shr.conf                          |    5 ++-
>  conf/machine/fsg3be.conf                      |    2 +-
>  conf/machine/kixrp435.conf                    |    2 +-
>  conf/machine/nslu2be.conf                     |    2 +-
>  conf/machine/nslu2le.conf                     |    2 +-
>  docs/usermanual/chapters/common_use_cases.xml |   31 +++++++++++++++++++=
-
> ----
>  recipes/binutils/binutils_csl-arm-20050416.bb |    2 +-
>  recipes/binutils/binutils_csl-arm-20050603.bb |    2 +-
>  recipes/eglibc/eglibc-package.bbclass         |    2 +-
>  recipes/glibc/glibc-package.inc               |    2 +-
>  recipes/prelink/prelink_20061027.bb           |    2 +-
>  recipes/prelink/prelink_20071009.bb           |    2 +-
>  recipes/prelink/prelink_20090925.bb           |    2 +-
>  17 files changed, 50 insertions(+), 42 deletions(-)
>
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index a5d6a1a..30dcd3e 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -675,20 +675,9 @@ BUILDCFG_NEEDEDVARS ?=3D "TARGET_ARCH TARGET_OS"
>
>  # Overrides are processed left to right, so the ones that are named late=
r
> take precedence.
>  # You generally want them to go from least to most specific.
> -#
> -# This means that an envionment variable named '<foo>_arm' overrides an
> -# environment variable '<foo>' (when ${TARGET_ARCH} is arm).
> -# an environment variable '<foo>_ramses' overrides '<foo>' but doesn't
> override
> -# '<foo>_arm' when ${MACHINE} is 'ramses'.
> -# If you use combination ie '<foo>_arm_ramses', then '<foo>_arm_ramses'
> will override
> -# '<foo>_arm' and then '<foo>' will be overriden with that value from
> '<foo>_arm'.
> -# And finally '<foo>_local' overrides anything, but with lowest priority=
.
> -#
> -# This works for  functions as well, they are really just environment
> variables.
> -# Default OVERRIDES to make compilation fail fast in case of build syste=
m
> misconfiguration.
> -OVERRIDES =3D
> "local:${MACHINE}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:build-
> ${BUILD_OS}:fail-fast:pn-${PN}"
> -# Alternative OVERRIDES definition without "fail fast", usually only for
> native building and Scratchbox toolchains.
> -#OVERRIDES =3D
> "local:${MACHINE}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:build-
> ${BUILD_OS}:pn-${PN}"
> +MACHINE_OVERRIDES ?=3D ""
> +OVERRIDES =3D "pn-${PN}:fail-fast:build-
> ${BUILD_OS}:${TARGET_ARCH}:${TARGET_OS}:\
> +${DISTRO}:${@':'.join(d.getVar('MACHINE_OVERRIDES',
> True).split())}:${MACHINE}:local"
>
>  ##################################################################
>  # Include the rest of the config files.
> diff --git a/conf/distro/include/arm-thumb.inc b/conf/distro/include/arm-
> thumb.inc
> index 36edd4f..75ed978 100644
> --- a/conf/distro/include/arm-thumb.inc
> +++ b/conf/distro/include/arm-thumb.inc
> @@ -16,9 +16,9 @@ THUMB_INTERWORK ?=3D "no"
>  #    arm system and vice versa.  It is strongly recommended that DISTROs
> not
>  #    turn this off - the actual cost is very small.
>
> -OVERRIDE_THUMB =3D "${@['', ':thumb'][bb.data.getVar('ARM_INSTRUCTION_SE=
T',
> d, 1) =3D=3D 'thumb']}"
> -OVERRIDE_INTERWORK =3D "${@['', ':thumb-
> interwork'][bb.data.getVar('THUMB_INTERWORK', d, 1) =3D=3D 'yes']}"
> -OVERRIDES_append_arm =3D. "${OVERRIDE_THUMB}${OVERRIDE_INTERWORK}"
> +OVERRIDE_THUMB =3D "${@['', 'thumb:'][bb.data.getVar('ARM_INSTRUCTION_SE=
T',
> d, 1) =3D=3D 'thumb']}"
> +OVERRIDE_INTERWORK =3D "${@['', 'thumb-
> interwork:'][bb.data.getVar('THUMB_INTERWORK', d, 1) =3D=3D 'yes']}"
> +OVERRIDES_prepend_arm =3D. "${OVERRIDE_THUMB}${OVERRIDE_INTERWORK}"
>
>  #    Compiler and linker options for application code and kernel code.
> These
>  #    options ensure that the compiler has the correct settings for the
> selected
> diff --git a/conf/distro/micro.conf b/conf/distro/micro.conf
> index 6d396b3..19b5e62 100644
> --- a/conf/distro/micro.conf
> +++ b/conf/distro/micro.conf
> @@ -69,10 +69,10 @@ require conf/distro/include/sane-toolchain.inc
>  require conf/distro/include/arm-thumb.inc
>
>
> #########################################################################=
#
> ###
> -# OVERRIDES adjusted from bitbake.conf to feature the MACHINE_CLASS
> +# Ensure MACHINE_CLASS is in OVERRIDES
>
> #########################################################################=
#
> ###
> -OVERRIDES =3D "local:${MACHINE}:${MACHINE_CLASS}:${DISTRO}:${TARGET_OS}:=
\
> -${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
> +MACHINE_CLASS ?=3D ""
> +MACHINE_OVERRIDES +=3D "${MACHINE_CLASS}"
>
>
> #########################################################################=
#
> ###
>  # PREFERRED VERSIONS
> diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
> index 376ffde..0d32cfe 100644
> --- a/conf/distro/minimal.conf
> +++ b/conf/distro/minimal.conf
> @@ -81,9 +81,10 @@ KERNEL =3D "kernel26"
>  MACHINE_KERNEL_VERSION =3D "2.6"
>
>
> #########################################################################=
#
> ###
> -# OVERWRITES adjusted from bitbake.conf to feature the MACHINE_CLASS
> +# Ensure MACHINE_CLASS is in OVERRIDES
>
> #########################################################################=
#
> ###
> -OVERRIDES =3D
> "local:${MACHINE}:${MACHINE_CLASS}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:=
b
> uild-${BUILD_OS}:fail-fast:pn-${PN}"
> +MACHINE_CLASS ?=3D ""
> +MACHINE_OVERRIDES +=3D "${MACHINE_CLASS}"
>
>
> #########################################################################=
#
> ###
>  # TOOLCHAIN
> diff --git a/conf/distro/shr.conf b/conf/distro/shr.conf
> index ade8cba..74e3fe9 100644
> --- a/conf/distro/shr.conf
> +++ b/conf/distro/shr.conf
> @@ -151,9 +151,10 @@ KERNEL =3D "kernel26"
>  MACHINE_KERNEL_VERSION =3D "2.6"
>
>
> #########################################################################=
#
> ###
> -# OVERWRITES adjusted from bitbake.conf to feature the MACHINE_CLASS
> +# Ensure MACHINE_CLASS is in OVERRIDES
>
> #########################################################################=
#
> ###
> -OVERRIDES =3D
> "local:${MACHINE}:${MACHINE_CLASS}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:=
b
> uild-${BUILD_OS}:fail-fast:pn-${PN}"
> +MACHINE_CLASS ?=3D ""
> +MACHINE_OVERRIDES +=3D "${MACHINE_CLASS}"
>
>
> #########################################################################=
#
> ###
>  # TOOLCHAIN
> diff --git a/conf/machine/fsg3be.conf b/conf/machine/fsg3be.conf
> index a2ca95b..c5ddc25 100644
> --- a/conf/machine/fsg3be.conf
> +++ b/conf/machine/fsg3be.conf
> @@ -8,7 +8,7 @@ PACKAGE_EXTRA_ARCHS =3D "ixp4xxbe"
>
>  MACHINE_ARCH =3D "ixp4xxbe"
>
> -OVERRIDES =3D
> "local:${MACHINE}:ixp4xxbe:ixp4xx:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:b=
u
> ild-${BUILD_OS}:fail-fast:pn-${PN}"
> +MACHINE_OVERRIDES +=3D "ixp4xx ixp4xxbe"
>
>  # Match the vendor's latest kernel
>  PREFERRED_PROVIDER_virtual/kernel ?=3D "fsg3-kernel"
> diff --git a/conf/machine/kixrp435.conf b/conf/machine/kixrp435.conf
> index 8259127..ba8216d 100644
> --- a/conf/machine/kixrp435.conf
> +++ b/conf/machine/kixrp435.conf
> @@ -7,7 +7,7 @@ TARGET_ARCH =3D "arm"
>  # Note: armv4 armv4t armv5te will be added by tune-xscale.inc
> automatically.
>  PACKAGE_EXTRA_ARCHS =3D "armv5e ixp4xxle"
>
> -OVERRIDES =3D
> "local:${MACHINE}:nslu2:ixp4xx:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:buil=
d
> -${BUILD_OS}:fail-fast:pn-${PN}"
> +MACHINE_OVERRIDES +=3D "ixp4xx nslu2"
>
>  PREFERRED_PROVIDER_virtual/kernel =3D "linux"
>  PREFERRED_VERSION_linux =3D "2.6.30"
> diff --git a/conf/machine/nslu2be.conf b/conf/machine/nslu2be.conf
> index 9bc92f1..69d12a7 100644
> --- a/conf/machine/nslu2be.conf
> +++ b/conf/machine/nslu2be.conf
> @@ -7,7 +7,7 @@ TARGET_ARCH =3D "armeb"
>  # Note: armv4b armv4tb armv5teb will be added by tune-xscale.inc
> automatically.
>  PACKAGE_EXTRA_ARCHS =3D "armv5eb ixp4xxbe"
>
> -OVERRIDES =3D
> "local:${MACHINE}:nslu2:ixp4xx:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:buil=
d
> -${BUILD_OS}:fail-fast:pn-${PN}"
> +MACHINE_OVERRIDES +=3D "ixp4xx nslu2"
>
>  ROOT_FLASH_SIZE ?=3D "6"
>
> diff --git a/conf/machine/nslu2le.conf b/conf/machine/nslu2le.conf
> index 62e47cb..5cd8a77 100644
> --- a/conf/machine/nslu2le.conf
> +++ b/conf/machine/nslu2le.conf
> @@ -7,7 +7,7 @@ TARGET_ARCH =3D "arm"
>  # Note: armv4 armv4t armv5te will be added by tune-xscale.inc
> automatically.
>  PACKAGE_EXTRA_ARCHS =3D "armv5e ixp4xxle"
>
> -OVERRIDES =3D
> "local:${MACHINE}:nslu2:ixp4xx:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:buil=
d
> -${BUILD_OS}:fail-fast:pn-${PN}"
> +MACHINE_OVERRIDES +=3D "ixp4xx nslu2"
>
>  ROOT_FLASH_SIZE ?=3D "6"
>
> diff --git a/docs/usermanual/chapters/common_use_cases.xml
> b/docs/usermanual/chapters/common_use_cases.xml
> index 8202dda..2114047 100644
> --- a/docs/usermanual/chapters/common_use_cases.xml
> +++ b/docs/usermanual/chapters/common_use_cases.xml
> @@ -7,8 +7,8 @@
>
>      <para>Creating a new distribution is not complicated, however we urg=
e
> you
>      to try existing distributions first, because it's also very easy to
> do
> -    wrong. The config needs to be created in
> $OEBASE/openembedded/conf/distro
> -    directory. So what has to be inside?
> +    wrong. The config needs to be created in
> $OEBASE/openembedded/conf/distro
> +    directory. So what has to be inside?
>        <itemizedlist>
>          <listitem>
>            <para><command>DISTRO_VERSION</command> so users will know
> which
> @@ -72,8 +72,8 @@ SRCDATE =3D "20061014"
>    <section id=3D"commonuse_new_machine">
>      <title>Adding a new Machine</title>
>
> -    <para>To be able to build for a device OpenEmbedded has to know abou=
t
> it,
> -    so a machine config file needs to be written. All of the machine
> +    <para>To be able to build for a device OpenEmbedded has to know abou=
t
> it,
> +    so a machine config file needs to be written. All of the machine
>      configs are stored in $OEBASE/openembedded/conf/machine/
> directory.</para>
>
>      <para>As usual some variables are required: <itemizedlist>
> @@ -97,6 +97,23 @@ SRCDATE =3D "20061014"
>      <para>There are also some optional variables that can be defined:
>      <itemizedlist>
>      <listitem>
> +      <para>
> +        <command>MACHINE_OVERRIDES</command> lists additional items to
> add to
> +        the <command>OVERRIDES</command> variable, between the
> +        <command>DISTRO</command> and the <command>MACHINE</command>.
> This is
> +        utilized to add overrides which are less specific than the
> machine,
> +        but are nonetheless related to it, allowing us to define
> variables a
> +        certain way for a group of machines, rather than for each
> individual
> +        one.  As an example, this variable may be used by the
> distribution to
> +        add <command>SOC_FAMILY</command> or
> <command>MACHINE_CLASS</command>.
> +      </para>
> +      <para>
> +        Note that this variable is space separated, and should always be
> +        manipulated with +=3D, to ensure it's built up incrementally, an=
d
> no
> +        additions are lost.
> +      </para>
> +    </listitem>
> +    <listitem>
>            <para><command>SOC_FAMILY</command> describes a family of
> processors
>              that all share common features such as kernel versions,
>              bootloaders, etc.  This is used to allow overrides for a
> whole
> @@ -105,7 +122,7 @@ SRCDATE =3D "20061014"
>              or local setting.
>            </para>
>            <para>
> -            NOTE: SOC_FAMILY is different than MACHINE_CLASS in that
> +            NOTE: SOC_FAMILY is different than MACHINE_CLASS in that
>              MACHINE_CLASS is intended to specify a grouping of devices
>              that may have different processors but share common features=
.
>              For example all OMAP3 devices can be described using the
> SOC_FAMILY
> @@ -139,7 +156,7 @@ SRCDATE =3D "20061014"
>              <listitem><para>for cvs: add 'PV =3D "1.1+cvs${SRCREV}"' to
> your bb file.</para></listitem>
>            </itemizedlist>
>          Accompany either with an entry to conf/distro/include/sane-
> srcrevs.inc for a revision that you know
> -        builds successfully.  It is also common to define the stable
> SRCREV
> +        builds successfully.  It is also common to define the stable
> SRCREV
>          for your package directly in the package recipe.
>          </para>
>          <para>
> @@ -276,7 +293,7 @@ RDEPENDS_${PN} +=3D "\
>              <title>Putting it together</title>
>              <para>In the previous two sections we have prepared the host
> and
>              target side. One thing that is missing is combining the two
> newly
> -            created tasks and actually creating the SDK. This is what we
> are
> +            created tasks and actually creating the SDK. This is what we
> are
>              going to do now.</para>
>
>              <para>Create <filename>meta-toolchain-YOU.bb</filename> in
> the
> diff --git a/recipes/binutils/binutils_csl-arm-20050416.bb
> b/recipes/binutils/binutils_csl-arm-20050416.bb
> index ad45438..71803d1 100644
> --- a/recipes/binutils/binutils_csl-arm-20050416.bb
> +++ b/recipes/binutils/binutils_csl-arm-20050416.bb
> @@ -7,7 +7,7 @@ LICENSE =3D "GPL"
>  FILESDIR =3D "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/binutils-c=
vs"
>  PV =3D "2.15.99+csl-arm+cvs20050416"
>  PR =3D "r3"
> -OVERRIDES_append =3D ":${TARGET_ARCH}-${TARGET_OS}"
> +OVERRIDES_prepend =3D "${TARGET_ARCH}-${TARGET_OS}:"
>  DEFAULT_PREFERENCE =3D "-1"
>  DEFAULT_PREFERENCE_arm-linux =3D "-1"
>  DEFAULT_PREFERENCE_arm-linuxeabi =3D "-1"
> diff --git a/recipes/binutils/binutils_csl-arm-20050603.bb
> b/recipes/binutils/binutils_csl-arm-20050603.bb
> index 595cb98..50e8677 100644
> --- a/recipes/binutils/binutils_csl-arm-20050603.bb
> +++ b/recipes/binutils/binutils_csl-arm-20050603.bb
> @@ -7,7 +7,7 @@ LICENSE =3D "GPL"
>  FILESDIR =3D "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/binutils-c=
vs"
>  PV =3D "2.15.99+csl-arm+cvs20050603"
>  PR =3D "r3"
> -OVERRIDES_append =3D ":${TARGET_ARCH}-${TARGET_OS}"
> +OVERRIDES_prepend =3D "${TARGET_ARCH}-${TARGET_OS}:"
>  DEFAULT_PREFERENCE =3D "-1"
>  #DEFAULT_PREFERENCE_arm-linux =3D "1"
>  #DEFAULT_PREFERENCE_arm-linuxeabi =3D "1"
> diff --git a/recipes/eglibc/eglibc-package.bbclass
> b/recipes/eglibc/eglibc-package.bbclass
> index dbca1ab..c802bd5 100644
> --- a/recipes/eglibc/eglibc-package.bbclass
> +++ b/recipes/eglibc/eglibc-package.bbclass
> @@ -116,7 +116,7 @@ def get_eglibc_fpu_setting(bb, d):
>  EXTRA_OECONF +=3D "${@get_eglibc_fpu_setting(bb, d)}"
>  EXTRA_OEMAKE +=3D "rootsbindir=3D${base_sbindir}"
>
> -OVERRIDES_append =3D ":${TARGET_ARCH}-${TARGET_OS}"
> +OVERRIDES_prepend =3D "${TARGET_ARCH}-${TARGET_OS}:"
>
>  do_configure_prepend() {
>          sed -e "s#@BASH@#/bin/sh#" -i ${S}/elf/ldd.bash.in
> diff --git a/recipes/glibc/glibc-package.inc b/recipes/glibc/glibc-
> package.inc
> index 0b263bb..8cd8564 100644
> --- a/recipes/glibc/glibc-package.inc
> +++ b/recipes/glibc/glibc-package.inc
> @@ -44,7 +44,7 @@ def get_glibc_fpu_setting(bb, d):
>  EXTRA_OECONF +=3D "${@get_glibc_fpu_setting(bb, d)}"
>  EXTRA_OEMAKE +=3D "rootsbindir=3D${base_sbindir}"
>
> -OVERRIDES_append =3D ":${TARGET_ARCH}-${TARGET_OS}"
> +OVERRIDES_prepend =3D "${TARGET_ARCH}-${TARGET_OS}:"
>
>  do_install() {
>       oe_runmake install_root=3D${D} install
> diff --git a/recipes/prelink/prelink_20061027.bb
> b/recipes/prelink/prelink_20061027.bb
> index ad2faf5..552117b 100644
> --- a/recipes/prelink/prelink_20061027.bb
> +++ b/recipes/prelink/prelink_20061027.bb
> @@ -12,7 +12,7 @@ SRC_URI =3D
> "${DEBIAN_MIRROR}/main/p/prelink/prelink_0.0.${PV}.orig.tar.gz \
>             file://prelink.default"
>
>  TARGET_OS_ORIG :=3D "${TARGET_OS}"
> -OVERRIDES_append =3D ":${TARGET_OS_ORIG}"
> +OVERRIDES_prepend =3D "${TARGET_OS_ORIG}:"
>  SRC_URI_append_linux-gnueabi =3D " file://arm_eabi.patch"
>
>  S =3D "${WORKDIR}/prelink-0.0.${PV}"
> diff --git a/recipes/prelink/prelink_20071009.bb
> b/recipes/prelink/prelink_20071009.bb
> index faf930c..e2ab3fb 100644
> --- a/recipes/prelink/prelink_20071009.bb
> +++ b/recipes/prelink/prelink_20071009.bb
> @@ -12,7 +12,7 @@ SRC_URI =3D
> "${DEBIAN_MIRROR}/main/p/prelink/prelink_0.0.${PV}.orig.tar.gz \
>             file://prelink.default"
>
>  TARGET_OS_ORIG :=3D "${TARGET_OS}"
> -OVERRIDES_append =3D ":${TARGET_OS_ORIG}"
> +OVERRIDES_prepend =3D "${TARGET_OS_ORIG}:"
>  SRC_URI_append_linux-gnueabi =3D " file://arm_eabi.patch"
>
>  S =3D "${WORKDIR}/prelink-0.0.${PV}"
> diff --git a/recipes/prelink/prelink_20090925.bb
> b/recipes/prelink/prelink_20090925.bb
> index 4c83402..5b247b6 100644
> --- a/recipes/prelink/prelink_20090925.bb
> +++ b/recipes/prelink/prelink_20090925.bb
> @@ -12,7 +12,7 @@ SRC_URI =3D
> "${DEBIAN_MIRROR}/main/p/prelink/prelink_0.0.${PV}.orig.tar.gz \
>             file://prelink.default"
>
>  #TARGET_OS_ORIG :=3D "${TARGET_OS}"
> -#OVERRIDES_append =3D ":${TARGET_OS_ORIG}"
> +#OVERRIDES_prepend =3D "${TARGET_OS_ORIG}:"
>  #SRC_URI_append_linux-gnueabi =3D " file://arm_eabi.patch"
>
>  S =3D "${WORKDIR}/prelink-0.0.${PV}"
> --
> 1.7.2.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


