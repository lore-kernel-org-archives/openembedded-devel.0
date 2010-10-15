Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P6bb2-0004qX-FG
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 06:08:45 +0200
Received: by gxk19 with SMTP id 19so162105gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 21:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=3TvF3n1Qcgs5R8JjD3L9+PBIR8+ygaXQAH8IZ84EqAg=;
	b=PWztB03IVH4Q2/8AWlC61Ets+syMFk0Ig5+3lZSP+Q7J624jy7JLmscw/Cfnr5JS0F
	mlTiDI5YOCRgOhUunygPCB74bBVCww8dp/+xK+b5odhBKQw9CyGt7dIwaRQlCPP3fV6N
	49AKZqpUDlsvYHMuKSi4xDUQH5VRxqCCr2aec=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=J/9YszoZPAd4GB+JDdgVsTmU7U+6A9x+PYWlsMFU+7TBbA6SIyunP1qEB5tvbccQra
	V6sOqFzciGRNdfSCgVoXmKefcN5tl6GBQSVGgxpVgGMBPJECcEDCjHew+BIbCmUr+QtX
	oxDOWHb3xjbTUbbjRvursDuUp13sVk4l3+XoM=
Received: by 10.90.49.3 with SMTP id w3mr5316063agw.127.1287115693770; Thu, 14
	Oct 2010 21:08:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.86.6 with HTTP; Thu, 14 Oct 2010 21:07:53 -0700 (PDT)
In-Reply-To: <1287113787-21268-1-git-send-email-kergoth@gmail.com>
References: <1287113787-21268-1-git-send-email-kergoth@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Oct 2010 21:07:53 -0700
Message-ID: <AANLkTimjtmWvRCypjwRfyFc7VnaJUL4R_0miq3aC3MRW@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL, BAYES_00, SPF_PASS,
	URI_HEX autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] Reverse the order of OVERRIDES
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
X-List-Received-Date: Fri, 15 Oct 2010 04:08:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 14, 2010 at 8:36 PM, Chris Larson <kergoth@gmail.com> wrote:
> From: Chris Larson <chris_larson@mentor.com>
>
> Given the current implementation of OVERRIDES in bitbake, the variable is
> expected to contain elements in the order least specific to most specific=
,
> however, our current usage of it does not match that. =C2=A0As one exampl=
e, "local"
> is supposed to always be the most specific override, yet currently it's t=
he
> least specific. =C2=A0As another example, currently the target architectu=
re is seen
> as more specific than the machine, which is also clearly wrong.
>
> It becomes clear that a reversal of the current value will bring us to a =
more
> sane behavior, and avoids the need for the dual overrides hack mentioned =
in
> the comments, so clean those up as well.
>
> This also introduces a MACHINE_OVERRIDES variable as a generic mechanism =
to
> inject overrides elements which are more specific than the distro but les=
s
> specific than the machine, which is where things like MACHINE_CLASS or
> SOC_FAMILY or the like would go. =C2=A0This variable is *space* separated=
, to make
> it easier and more convenient to assemble the variable incrementally, and=
 it's
> then translated to : separated when used in OVERRIDES.
>
> Signed-off-by: Chris Larson <chris_larson@mentor.com>

both things look nice to me. We might need to document MACHINE_OVERRIDES th=
ough.

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0conf/bitbake.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 17 +++-----------=
---
> =C2=A0conf/distro/include/arm-thumb.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A06 +++---
> =C2=A0conf/distro/micro.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A06 +++---
> =C2=A0conf/distro/minimal.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A05 +++--
> =C2=A0conf/distro/shr.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A05 +++--
> =C2=A0conf/machine/fsg3be.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0conf/machine/kixrp435.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0conf/machine/nslu2be.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A0conf/machine/nslu2le.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A0recipes/binutils/binutils_csl-arm-20050416.bb | =C2=A0 =C2=A02 +-
> =C2=A0recipes/binutils/binutils_csl-arm-20050603.bb | =C2=A0 =C2=A02 +-
> =C2=A0recipes/eglibc/eglibc-package.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 =C2=A02 +-
> =C2=A0recipes/glibc/glibc-package.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A0recipes/prelink/prelink_20061027.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A02 +-
> =C2=A0recipes/prelink/prelink_20071009.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A02 +-
> =C2=A0recipes/prelink/prelink_20090925.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A02 +-
> =C2=A016 files changed, 26 insertions(+), 35 deletions(-)
>
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index 494e14e..c2359dc 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -675,20 +675,9 @@ BUILDCFG_NEEDEDVARS ?=3D "TARGET_ARCH TARGET_OS"
>
> =C2=A0# Overrides are processed left to right, so the ones that are named=
 later take precedence.
> =C2=A0# You generally want them to go from least to most specific.
> -#
> -# This means that an envionment variable named '<foo>_arm' overrides an
> -# environment variable '<foo>' (when ${TARGET_ARCH} is arm).
> -# an environment variable '<foo>_ramses' overrides '<foo>' but doesn't o=
verride
> -# '<foo>_arm' when ${MACHINE} is 'ramses'.
> -# If you use combination ie '<foo>_arm_ramses', then '<foo>_arm_ramses' =
will override
> -# '<foo>_arm' and then '<foo>' will be overriden with that value from '<=
foo>_arm'.
> -# And finally '<foo>_local' overrides anything, but with lowest priority=
.
> -#
> -# This works for =C2=A0functions as well, they are really just environme=
nt variables.
> -# Default OVERRIDES to make compilation fail fast in case of build syste=
m misconfiguration.
> -OVERRIDES =3D "local:${MACHINE}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:bu=
ild-${BUILD_OS}:fail-fast:pn-${PN}"
> -# Alternative OVERRIDES definition without "fail fast", usually only for=
 native building and Scratchbox toolchains.
> -#OVERRIDES =3D "local:${MACHINE}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:b=
uild-${BUILD_OS}:pn-${PN}"
> +MACHINE_OVERRIDES ?=3D ""
> +OVERRIDES =3D "pn-${PN}:fail-fast:build-${BUILD_OS}:${TARGET_ARCH}:${TAR=
GET_OS}:\
> +${DISTRO}:${@':'.join(d.getVar('MACHINE_OVERRIDES', True).split())}:${MA=
CHINE}:local"
>
> =C2=A0##################################################################
> =C2=A0# Include the rest of the config files.
> diff --git a/conf/distro/include/arm-thumb.inc b/conf/distro/include/arm-=
thumb.inc
> index 36edd4f..75ed978 100644
> --- a/conf/distro/include/arm-thumb.inc
> +++ b/conf/distro/include/arm-thumb.inc
> @@ -16,9 +16,9 @@ THUMB_INTERWORK ?=3D "no"
> =C2=A0# =C2=A0 =C2=A0arm system and vice versa. =C2=A0It is strongly reco=
mmended that DISTROs not
> =C2=A0# =C2=A0 =C2=A0turn this off - the actual cost is very small.
>
> -OVERRIDE_THUMB =3D "${@['', ':thumb'][bb.data.getVar('ARM_INSTRUCTION_SE=
T', d, 1) =3D=3D 'thumb']}"
> -OVERRIDE_INTERWORK =3D "${@['', ':thumb-interwork'][bb.data.getVar('THUM=
B_INTERWORK', d, 1) =3D=3D 'yes']}"
> -OVERRIDES_append_arm =3D. "${OVERRIDE_THUMB}${OVERRIDE_INTERWORK}"
> +OVERRIDE_THUMB =3D "${@['', 'thumb:'][bb.data.getVar('ARM_INSTRUCTION_SE=
T', d, 1) =3D=3D 'thumb']}"
> +OVERRIDE_INTERWORK =3D "${@['', 'thumb-interwork:'][bb.data.getVar('THUM=
B_INTERWORK', d, 1) =3D=3D 'yes']}"
> +OVERRIDES_prepend_arm =3D. "${OVERRIDE_THUMB}${OVERRIDE_INTERWORK}"
>
> =C2=A0# =C2=A0 =C2=A0Compiler and linker options for application code and=
 kernel code. =C2=A0These
> =C2=A0# =C2=A0 =C2=A0options ensure that the compiler has the correct set=
tings for the selected
> diff --git a/conf/distro/micro.conf b/conf/distro/micro.conf
> index 6d396b3..19b5e62 100644
> --- a/conf/distro/micro.conf
> +++ b/conf/distro/micro.conf
> @@ -69,10 +69,10 @@ require conf/distro/include/sane-toolchain.inc
> =C2=A0require conf/distro/include/arm-thumb.inc
>
> =C2=A0###################################################################=
##########
> -# OVERRIDES adjusted from bitbake.conf to feature the MACHINE_CLASS
> +# Ensure MACHINE_CLASS is in OVERRIDES
> =C2=A0###################################################################=
##########
> -OVERRIDES =3D "local:${MACHINE}:${MACHINE_CLASS}:${DISTRO}:${TARGET_OS}:=
\
> -${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
> +MACHINE_CLASS ?=3D ""
> +MACHINE_OVERRIDES +=3D "${MACHINE_CLASS}"
>
> =C2=A0###################################################################=
##########
> =C2=A0# PREFERRED VERSIONS
> diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
> index 376ffde..0d32cfe 100644
> --- a/conf/distro/minimal.conf
> +++ b/conf/distro/minimal.conf
> @@ -81,9 +81,10 @@ KERNEL =3D "kernel26"
> =C2=A0MACHINE_KERNEL_VERSION =3D "2.6"
>
> =C2=A0###################################################################=
##########
> -# OVERWRITES adjusted from bitbake.conf to feature the MACHINE_CLASS
> +# Ensure MACHINE_CLASS is in OVERRIDES
> =C2=A0###################################################################=
##########
> -OVERRIDES =3D "local:${MACHINE}:${MACHINE_CLASS}:${DISTRO}:${TARGET_OS}:=
${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
> +MACHINE_CLASS ?=3D ""
> +MACHINE_OVERRIDES +=3D "${MACHINE_CLASS}"
>
> =C2=A0###################################################################=
##########
> =C2=A0# TOOLCHAIN
> diff --git a/conf/distro/shr.conf b/conf/distro/shr.conf
> index ade8cba..74e3fe9 100644
> --- a/conf/distro/shr.conf
> +++ b/conf/distro/shr.conf
> @@ -151,9 +151,10 @@ KERNEL =3D "kernel26"
> =C2=A0MACHINE_KERNEL_VERSION =3D "2.6"
>
> =C2=A0###################################################################=
##########
> -# OVERWRITES adjusted from bitbake.conf to feature the MACHINE_CLASS
> +# Ensure MACHINE_CLASS is in OVERRIDES
> =C2=A0###################################################################=
##########
> -OVERRIDES =3D "local:${MACHINE}:${MACHINE_CLASS}:${DISTRO}:${TARGET_OS}:=
${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
> +MACHINE_CLASS ?=3D ""
> +MACHINE_OVERRIDES +=3D "${MACHINE_CLASS}"
>
> =C2=A0###################################################################=
##########
> =C2=A0# TOOLCHAIN
> diff --git a/conf/machine/fsg3be.conf b/conf/machine/fsg3be.conf
> index a2ca95b..c5ddc25 100644
> --- a/conf/machine/fsg3be.conf
> +++ b/conf/machine/fsg3be.conf
> @@ -8,7 +8,7 @@ PACKAGE_EXTRA_ARCHS =3D "ixp4xxbe"
>
> =C2=A0MACHINE_ARCH =3D "ixp4xxbe"
>
> -OVERRIDES =3D "local:${MACHINE}:ixp4xxbe:ixp4xx:${DISTRO}:${TARGET_OS}:$=
{TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
> +MACHINE_OVERRIDES +=3D "ixp4xx ixp4xxbe"
>
> =C2=A0# Match the vendor's latest kernel
> =C2=A0PREFERRED_PROVIDER_virtual/kernel ?=3D "fsg3-kernel"
> diff --git a/conf/machine/kixrp435.conf b/conf/machine/kixrp435.conf
> index 8259127..b4a2fa6 100644
> --- a/conf/machine/kixrp435.conf
> +++ b/conf/machine/kixrp435.conf
> @@ -7,7 +7,7 @@ TARGET_ARCH =3D "arm"
> =C2=A0# Note: armv4 armv4t armv5te will be added by tune-xscale.inc autom=
atically.
> =C2=A0PACKAGE_EXTRA_ARCHS =3D "armv5e ixp4xxle"
>
> -OVERRIDES =3D "local:${MACHINE}:nslu2:ixp4xx:${DISTRO}:${TARGET_OS}:${TA=
RGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
> +MACHINE_OVERRIDES +=3D "nslu2 ixp4xx"
>
> =C2=A0PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> =C2=A0PREFERRED_VERSION_linux =3D "2.6.30"
> diff --git a/conf/machine/nslu2be.conf b/conf/machine/nslu2be.conf
> index 9bc92f1..88e6ed2 100644
> --- a/conf/machine/nslu2be.conf
> +++ b/conf/machine/nslu2be.conf
> @@ -7,7 +7,7 @@ TARGET_ARCH =3D "armeb"
> =C2=A0# Note: armv4b armv4tb armv5teb will be added by tune-xscale.inc au=
tomatically.
> =C2=A0PACKAGE_EXTRA_ARCHS =3D "armv5eb ixp4xxbe"
>
> -OVERRIDES =3D "local:${MACHINE}:nslu2:ixp4xx:${DISTRO}:${TARGET_OS}:${TA=
RGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
> +MACHINE_OVERRIDES +=3D "nslu2 ixp4xx"
>
> =C2=A0ROOT_FLASH_SIZE ?=3D "6"
>
> diff --git a/conf/machine/nslu2le.conf b/conf/machine/nslu2le.conf
> index 62e47cb..edd0d94 100644
> --- a/conf/machine/nslu2le.conf
> +++ b/conf/machine/nslu2le.conf
> @@ -7,7 +7,7 @@ TARGET_ARCH =3D "arm"
> =C2=A0# Note: armv4 armv4t armv5te will be added by tune-xscale.inc autom=
atically.
> =C2=A0PACKAGE_EXTRA_ARCHS =3D "armv5e ixp4xxle"
>
> -OVERRIDES =3D "local:${MACHINE}:nslu2:ixp4xx:${DISTRO}:${TARGET_OS}:${TA=
RGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
> +MACHINE_OVERRIDES +=3D "nslu2 ixp4xx"
>
> =C2=A0ROOT_FLASH_SIZE ?=3D "6"
>
> diff --git a/recipes/binutils/binutils_csl-arm-20050416.bb b/recipes/binu=
tils/binutils_csl-arm-20050416.bb
> index ad45438..71803d1 100644
> --- a/recipes/binutils/binutils_csl-arm-20050416.bb
> +++ b/recipes/binutils/binutils_csl-arm-20050416.bb
> @@ -7,7 +7,7 @@ LICENSE =3D "GPL"
> =C2=A0FILESDIR =3D "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/binut=
ils-cvs"
> =C2=A0PV =3D "2.15.99+csl-arm+cvs20050416"
> =C2=A0PR =3D "r3"
> -OVERRIDES_append =3D ":${TARGET_ARCH}-${TARGET_OS}"
> +OVERRIDES_prepend =3D "${TARGET_ARCH}-${TARGET_OS}:"
> =C2=A0DEFAULT_PREFERENCE =3D "-1"
> =C2=A0DEFAULT_PREFERENCE_arm-linux =3D "-1"
> =C2=A0DEFAULT_PREFERENCE_arm-linuxeabi =3D "-1"
> diff --git a/recipes/binutils/binutils_csl-arm-20050603.bb b/recipes/binu=
tils/binutils_csl-arm-20050603.bb
> index 595cb98..50e8677 100644
> --- a/recipes/binutils/binutils_csl-arm-20050603.bb
> +++ b/recipes/binutils/binutils_csl-arm-20050603.bb
> @@ -7,7 +7,7 @@ LICENSE =3D "GPL"
> =C2=A0FILESDIR =3D "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/binut=
ils-cvs"
> =C2=A0PV =3D "2.15.99+csl-arm+cvs20050603"
> =C2=A0PR =3D "r3"
> -OVERRIDES_append =3D ":${TARGET_ARCH}-${TARGET_OS}"
> +OVERRIDES_prepend =3D "${TARGET_ARCH}-${TARGET_OS}:"
> =C2=A0DEFAULT_PREFERENCE =3D "-1"
> =C2=A0#DEFAULT_PREFERENCE_arm-linux =3D "1"
> =C2=A0#DEFAULT_PREFERENCE_arm-linuxeabi =3D "1"
> diff --git a/recipes/eglibc/eglibc-package.bbclass b/recipes/eglibc/eglib=
c-package.bbclass
> index dbca1ab..c802bd5 100644
> --- a/recipes/eglibc/eglibc-package.bbclass
> +++ b/recipes/eglibc/eglibc-package.bbclass
> @@ -116,7 +116,7 @@ def get_eglibc_fpu_setting(bb, d):
> =C2=A0EXTRA_OECONF +=3D "${@get_eglibc_fpu_setting(bb, d)}"
> =C2=A0EXTRA_OEMAKE +=3D "rootsbindir=3D${base_sbindir}"
>
> -OVERRIDES_append =3D ":${TARGET_ARCH}-${TARGET_OS}"
> +OVERRIDES_prepend =3D "${TARGET_ARCH}-${TARGET_OS}:"
>
> =C2=A0do_configure_prepend() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -e "s#@BASH@#/bin/sh#" -i ${S}/elf/ldd.ba=
sh.in
> diff --git a/recipes/glibc/glibc-package.inc b/recipes/glibc/glibc-packag=
e.inc
> index 0b263bb..8cd8564 100644
> --- a/recipes/glibc/glibc-package.inc
> +++ b/recipes/glibc/glibc-package.inc
> @@ -44,7 +44,7 @@ def get_glibc_fpu_setting(bb, d):
> =C2=A0EXTRA_OECONF +=3D "${@get_glibc_fpu_setting(bb, d)}"
> =C2=A0EXTRA_OEMAKE +=3D "rootsbindir=3D${base_sbindir}"
>
> -OVERRIDES_append =3D ":${TARGET_ARCH}-${TARGET_OS}"
> +OVERRIDES_prepend =3D "${TARGET_ARCH}-${TARGET_OS}:"
>
> =C2=A0do_install() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake install_root=3D${D} install
> diff --git a/recipes/prelink/prelink_20061027.bb b/recipes/prelink/prelin=
k_20061027.bb
> index ad2faf5..552117b 100644
> --- a/recipes/prelink/prelink_20061027.bb
> +++ b/recipes/prelink/prelink_20061027.bb
> @@ -12,7 +12,7 @@ SRC_URI =3D "${DEBIAN_MIRROR}/main/p/prelink/prelink_0.=
0.${PV}.orig.tar.gz \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://prelink.default"
>
> =C2=A0TARGET_OS_ORIG :=3D "${TARGET_OS}"
> -OVERRIDES_append =3D ":${TARGET_OS_ORIG}"
> +OVERRIDES_prepend =3D "${TARGET_OS_ORIG}:"
> =C2=A0SRC_URI_append_linux-gnueabi =3D " file://arm_eabi.patch"
>
> =C2=A0S =3D "${WORKDIR}/prelink-0.0.${PV}"
> diff --git a/recipes/prelink/prelink_20071009.bb b/recipes/prelink/prelin=
k_20071009.bb
> index faf930c..e2ab3fb 100644
> --- a/recipes/prelink/prelink_20071009.bb
> +++ b/recipes/prelink/prelink_20071009.bb
> @@ -12,7 +12,7 @@ SRC_URI =3D "${DEBIAN_MIRROR}/main/p/prelink/prelink_0.=
0.${PV}.orig.tar.gz \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://prelink.default"
>
> =C2=A0TARGET_OS_ORIG :=3D "${TARGET_OS}"
> -OVERRIDES_append =3D ":${TARGET_OS_ORIG}"
> +OVERRIDES_prepend =3D "${TARGET_OS_ORIG}:"
> =C2=A0SRC_URI_append_linux-gnueabi =3D " file://arm_eabi.patch"
>
> =C2=A0S =3D "${WORKDIR}/prelink-0.0.${PV}"
> diff --git a/recipes/prelink/prelink_20090925.bb b/recipes/prelink/prelin=
k_20090925.bb
> index 4c83402..5b247b6 100644
> --- a/recipes/prelink/prelink_20090925.bb
> +++ b/recipes/prelink/prelink_20090925.bb
> @@ -12,7 +12,7 @@ SRC_URI =3D "${DEBIAN_MIRROR}/main/p/prelink/prelink_0.=
0.${PV}.orig.tar.gz \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://prelink.default"
>
> =C2=A0#TARGET_OS_ORIG :=3D "${TARGET_OS}"
> -#OVERRIDES_append =3D ":${TARGET_OS_ORIG}"
> +#OVERRIDES_prepend =3D "${TARGET_OS_ORIG}:"
> =C2=A0#SRC_URI_append_linux-gnueabi =3D " file://arm_eabi.patch"
>
> =C2=A0S =3D "${WORKDIR}/prelink-0.0.${PV}"
> --
> 1.7.2.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


