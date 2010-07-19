Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Oaz6X-0007rD-QN
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 00:46:36 +0200
Received: by iwn34 with SMTP id 34so5205064iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jul 2010 15:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=DQmcLCkMz01kIUTtDI+DPwv4j5/M2S4Mtj8UfijUiFU=;
	b=etB8Pkie9ctM5wnz6OnWYU2iYY7lQyjmKT2kezVticm0/2oLDqt6xp4SHDTzIzbmDK
	pmVYiIjt/L5lE3Unvqd8YLckfjR8Sx4iDLN2/cUHOeqNMlsNU7+pkHYWWRj2x/SNhqBl
	BJbkWRpPVRPey0EG4MAjyStneovIKAMvZiUNA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=a3/oBjYC5Mi2ZPKn/k4xDlWw0DcTESyRp1SIoSZ2ulWoindQEhS/zSp1n8857iW4m1
	exoIrqaHZIdrotPtcUDyioYbs99q6XI66PCcufXSTA7a4Jd1rnZzDDB0v76ErQ/TN8RN
	Vwxj3TctMsTbKyszrkfEhCN17cWGNnE5oi9W0=
Received: by 10.231.161.16 with SMTP id p16mr5954209ibx.61.1279579585572; Mon, 
	19 Jul 2010 15:46:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.35.8 with HTTP; Mon, 19 Jul 2010 15:46:05 -0700 (PDT)
In-Reply-To: <1279527535-11994-1-git-send-email-raj.khem@gmail.com>
References: <1279527535-11994-1-git-send-email-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Jul 2010 15:46:05 -0700
Message-ID: <AANLkTikmxYTbW7ZT5HoA8yyXfvaWbqu7ydQemXP8e4mm@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC][PATCH] distro: Move thumb into distro features
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
X-List-Received-Date: Mon, 19 Jul 2010 22:46:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 19, 2010 at 1:18 AM, Khem Raj <raj.khem@gmail.com> wrote:
> * Currenlty we define the thumb specific overrides in machine tune files
> =A0and as machine conf files are included before the distro conf files
> =A0the overrides dont get right values and set incorrectly.
>
> * This patch moves the tune-thumb.inc from machine/include into
> =A0distro/include and lets distro decide on thumb and thumb-interworking
> =A0features based on the machine selected. If a machine which does not
> =A0support thumb like all armv4 based machines is selected then distro
> =A0makes correct decision now to disable thumb and thumb-interworking
> =A0based upon the machine seletected.

I accidentally hit push button in wrong branch and this commit got pushed
I will revert it once I get home later today if someone gets bitten before
feel free to revert it.

>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0conf/distro/angstrom-2008.1.conf =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A01 +
> =A0conf/distro/gmustix.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +
> =A0conf/distro/include/arm-thumb.inc =A0 =A0 =A0 =A0 =A0 | =A0 32 +++++++=
++++++++++++++++++++
> =A0conf/distro/kaeilos-2010.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A01 +
> =A0conf/distro/kaeilos.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A01 +
> =A0conf/distro/micro.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A01 +
> =A0conf/distro/minimal.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A03 +-
> =A0conf/distro/shr.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A01 +
> =A0conf/distro/slugos.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A02 +
> =A0conf/machine/include/ixp4xx.inc =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A01 -
> =A0conf/machine/include/tune-arm1136-novfp.inc | =A0 =A03 --
> =A0conf/machine/include/tune-arm1136jf-s.inc =A0 | =A0 =A03 --
> =A0conf/machine/include/tune-arm1176jzf-s.inc =A0| =A0 =A03 --
> =A0conf/machine/include/tune-arm920t.inc =A0 =A0 =A0 | =A0 =A04 ---
> =A0conf/machine/include/tune-arm926ejs.inc =A0 =A0 | =A0 =A03 --
> =A0conf/machine/include/tune-arm9tdmi.inc =A0 =A0 =A0| =A0 =A04 ---
> =A0conf/machine/include/tune-armv7.inc =A0 =A0 =A0 =A0 | =A0 =A04 ---
> =A0conf/machine/include/tune-ep9312.inc =A0 =A0 =A0 =A0| =A0 =A03 --
> =A0conf/machine/include/tune-thumb.inc =A0 =A0 =A0 =A0 | =A0 32 ---------=
------------------
> =A0conf/machine/include/tune-xscale.inc =A0 =A0 =A0 =A0| =A0 =A04 ---
> =A0conf/machine/palmz31.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A03 --
> =A0conf/machine/palmz72.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A03 --
> =A022 files changed, 43 insertions(+), 71 deletions(-)
> =A0create mode 100644 conf/distro/include/arm-thumb.inc
> =A0delete mode 100644 conf/machine/include/tune-thumb.inc
>
> diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008=
.1.conf
> index 7c70c84..84e8096 100644
> --- a/conf/distro/angstrom-2008.1.conf
> +++ b/conf/distro/angstrom-2008.1.conf
> @@ -136,6 +136,7 @@ PREFERRED_VERSION_binutils-cross-sdk_avr32 =3D "2.17"
>
> =A0# Toolchain virtuals:
> =A0require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
> +require conf/distro/include/arm-thumb.inc
>
> =A0PREFERRED_PROVIDER_dbus-glib =A0 =A0 =A0 =A0 =A0 =A0 =3D "dbus-glib"
> =A0PREFERRED_PROVIDER_hotplug =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D "udev"
> diff --git a/conf/distro/gmustix.conf b/conf/distro/gmustix.conf
> index 17f8056..5dd519d 100644
> --- a/conf/distro/gmustix.conf
> +++ b/conf/distro/gmustix.conf
> @@ -5,6 +5,8 @@
> =A0INHERIT +=3D "package_tar package_ipk"
> =A0LIBC =3D "uclibc"
> =A0require conf/distro/include/${LIBC}.inc
> +require conf/distro/include/arm-thumb.inc
> +
> =A0TARGET_OS =3D "linux-uclibc"
> =A0TARGET_FPU =3D "soft"
> =A0IMAGE_FSTYPES =3D "jffs2"
> diff --git a/conf/distro/include/arm-thumb.inc b/conf/distro/include/arm-=
thumb.inc
> new file mode 100644
> index 0000000..cd88bb4
> --- /dev/null
> +++ b/conf/distro/include/arm-thumb.inc
> @@ -0,0 +1,32 @@
> +#tune file for thumb instructions
> +
> +ARM_INSTRUCTION_SET ?=3D "arm"
> +# "arm" "thumb"
> +# =A0 =A0The instruction set the compiler should use when generating app=
lication
> +# =A0 =A0code. =A0The kernel is always compiled with arm code at present=
. =A0arm code
> +# =A0 =A0is the original 32 bit ARM instruction set, thumb code is the 1=
6 bit
> +# =A0 =A0encoded RISC sub-set. =A0Thumb code is smaller (maybe 70% of th=
e ARM size)
> +# =A0 =A0but requires more instructions (140% for 70% smaller code) so m=
ay be
> +# =A0 =A0slower.
> +
> +THUMB_INTERWORK ?=3D "no"
> +# "yes" "no"
> +# =A0 =A0Whether to compile with code to allow interworking between the =
two
> +# =A0 =A0instruction sets. =A0This allows thumb code to be executed on a=
 primarily
> +# =A0 =A0arm system and vice versa. =A0It is strongly recommended that D=
ISTROs not
> +# =A0 =A0turn this off - the actual cost is very small.
> +
> +OVERRIDE_THUMB =3D "${@['', ':thumb'][bb.data.getVar('ARM_INSTRUCTION_SE=
T', d, 1) =3D=3D 'thumb']}"
> +OVERRIDE_INTERWORK =3D "${@['', ':thumb-interwork'][bb.data.getVar('THUM=
B_INTERWORK', d, 1) =3D=3D 'yes']}"
> +OVERRIDES .=3D "${OVERRIDE_THUMB}${OVERRIDE_INTERWORK}"
> +
> +# =A0 =A0Compiler and linker options for application code and kernel cod=
e. =A0These
> +# =A0 =A0options ensure that the compiler has the correct settings for t=
he selected
> +# =A0 =A0instruction set and interworking.
> +ARM_INTERWORK_M_OPT =3D "${@['-mno-thumb-interwork', '-mthumb-interwork'=
][bb.data.getVar('THUMB_INTERWORK', d, 1) =3D=3D 'yes']}"
> +ARM_THUMB_M_OPT =3D "${@['-mno-thumb', '-mthumb'][bb.data.getVar('ARM_IN=
STRUCTION_SET', d, 1) =3D=3D 'thumb']}"
> +
> +#
> +TARGET_CC_ARCH +=3D =A0"${ARM_INTERWORK_M_OPT} ${ARM_THUMB_M_OPT}"
> +TARGET_CC_KERNEL_ARCH =A0+=3D "-mno-thumb-interwork -mno-thumb"
> +
> diff --git a/conf/distro/kaeilos-2010.conf b/conf/distro/kaeilos-2010.con=
f
> index 4bb637c..ba37445 100644
> --- a/conf/distro/kaeilos-2010.conf
> +++ b/conf/distro/kaeilos-2010.conf
> @@ -96,6 +96,7 @@ PREFERRED_VERSION_gcc-cross-intermediate ?=3D "${KAEILO=
S_GCC_VERSION}"
>
> =A0PREFERRED_ARM_INSTRUCTION_SET ?=3D "thumb"
> =A0require conf/distro/include/sane-toolchain.inc
> +require conf/distro/include/arm-thumb.inc
>
> =A0PREFERRED_PROVIDER_dbus-glib =A0 =A0 =A0 =A0 =A0 =A0 =3D "dbus-glib"
> =A0PREFERRED_PROVIDER_hotplug =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D "udev"
> diff --git a/conf/distro/kaeilos.conf b/conf/distro/kaeilos.conf
> index eb12d2e..b141280 100644
> --- a/conf/distro/kaeilos.conf
> +++ b/conf/distro/kaeilos.conf
> @@ -124,6 +124,7 @@ PREFERRED_VERSION_binutils-cross-sdk_avr32 =3D "2.17"
>
> =A0# Toolchain virtuals:
> =A0require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
> +require conf/distro/include/arm-thumb.inc
>
> =A0PREFERRED_PROVIDER_dbus-glib =A0 =A0 =A0 =A0 =A0 =A0 =3D "dbus-glib"
> =A0PREFERRED_PROVIDER_hotplug =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D "udev"
> diff --git a/conf/distro/micro.conf b/conf/distro/micro.conf
> index 9885425..fc50391 100644
> --- a/conf/distro/micro.conf
> +++ b/conf/distro/micro.conf
> @@ -66,6 +66,7 @@ PREFERRED_VERSION_glibc =A0 =A0 =A0 =A0 =A0 =A0 ?=3D "2=
.10.1"
> =A0PREFERRED_VERSION_glibc-initial =A0 =A0 ?=3D "2.10.1"
> =A0PREFERRED_ARM_INSTRUCTION_SET ?=3D "thumb"
> =A0require conf/distro/include/sane-toolchain.inc
> +require conf/distro/include/arm-thumb.inc
>
> =A0######################################################################=
#######
> =A0# OVERRIDES adjusted from bitbake.conf to feature the MACHINE_CLASS
> diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
> index e400c14..9a08130 100644
> --- a/conf/distro/minimal.conf
> +++ b/conf/distro/minimal.conf
> @@ -16,7 +16,7 @@ DISTRO_VERSION =3D "dev-snapshot-${SRCDATE}"
> =A0DISTRO_TYPE ?=3D "debug"
>
> =A0# Ensure some form of release config, so error out if someone thinks h=
e knows better
> -DISTRO_CHECK :=3D "${@bb.data.getVar('DISTRO_VERSION',d,1) or bb.fatal('=
Remove this line or set a dummy DISTRO_VERSION")
> +DISTRO_CHECK :=3D "${@bb.data.getVar('DISTRO_VERSION',d,1) or bb.fatal('=
Remove this line or set a dummy DISTRO_VERSION')}"
>
> =A0######################################################################=
#######
> =A0# FEATURE SELECTION
> @@ -86,6 +86,7 @@ MACHINE_KERNEL_VERSION =3D "2.6"
> =A0######################################################################=
#######
> =A0LIBC ?=3D "eglibc"
> =A0require conf/distro/include/sane-toolchain.inc
> +require conf/distro/include/arm-thumb.inc
>
> =A0######################################################################=
#######
> =A0# PREFERRED VERSIONS
> diff --git a/conf/distro/shr.conf b/conf/distro/shr.conf
> index f0167da..9fd156f 100644
> --- a/conf/distro/shr.conf
> +++ b/conf/distro/shr.conf
> @@ -159,6 +159,7 @@ PREFERRED_VERSION_eglibc =A0 =A0 =A0 =A0 =A0 =A0 ?=3D=
 "2.12"
> =A0PREFERRED_VERSION_eglibc-initial =A0 =A0 ?=3D "2.12"
> =A0PREFERRED_GCC_VERSION =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0?=3D "4.5"
> =A0require conf/distro/include/sane-toolchain.inc
> +require conf/distro/include/arm-thumb.inc
>
> =A0# Set some java bits
> =A0require conf/distro/include/sane-toolchain-java.inc
> diff --git a/conf/distro/slugos.conf b/conf/distro/slugos.conf
> index 5a2f0dc..5f9c06c 100644
> --- a/conf/distro/slugos.conf
> +++ b/conf/distro/slugos.conf
> @@ -22,3 +22,5 @@ require conf/distro/include/slugos.inc
> =A0# Can be either glibc or eglibc (or perhaps even uclibc)
> =A0LIBC ?=3D "eglibc"
> =A0require conf/distro/include/${LIBC}.inc
> +require conf/distro/include/arm-thumb.inc
> +
> diff --git a/conf/machine/include/ixp4xx.inc b/conf/machine/include/ixp4x=
x.inc
> index 192cbb1..cf7f0dd 100644
> --- a/conf/machine/include/ixp4xx.inc
> +++ b/conf/machine/include/ixp4xx.inc
> @@ -22,7 +22,6 @@ IMAGE_FSTYPES ?=3D "jffs2 tar.gz"
> =A0EXTRA_IMAGECMD_jffs2 =3D "--pad --eraseblock=3D0x20000 -n"
>
> =A0require conf/machine/include/tune-xscale.inc
> -require conf/machine/include/tune-thumb.inc
>
> =A0#---------------------------------------------------------------------=
----------
> =A0# Board defaults
> diff --git a/conf/machine/include/tune-arm1136-novfp.inc b/conf/machine/i=
nclude/tune-arm1136-novfp.inc
> index e1f7945..58134b7 100644
> --- a/conf/machine/include/tune-arm1136-novfp.inc
> +++ b/conf/machine/include/tune-arm1136-novfp.inc
> @@ -5,6 +5,3 @@ TARGET_CC_ARCH =3D "-march=3Darmv6j -mtune=3Darm1136jf-s"
> =A0FEED_ARCH =3D "armv6-novfp"
> =A0BASE_PACKAGE_ARCH =3D "armv6-novfp"
> =A0PACKAGE_EXTRA_ARCHS +=3D "armv4 armv4t armv5te armv6-novfp"
> -
> -# Include tune file for thumb support, it defaults to off so DISTROs can=
 turn it on if they wish
> -require conf/machine/include/tune-thumb.inc
> diff --git a/conf/machine/include/tune-arm1136jf-s.inc b/conf/machine/inc=
lude/tune-arm1136jf-s.inc
> index c532b9c..2944cc7 100644
> --- a/conf/machine/include/tune-arm1136jf-s.inc
> +++ b/conf/machine/include/tune-arm1136jf-s.inc
> @@ -2,6 +2,3 @@ TARGET_CC_ARCH =3D "-march=3Darmv6j -mtune=3Darm1136jf-s =
-mfpu=3Dvfp -mfloat-abi=3Dsoftfp"
> =A0FEED_ARCH =3D "armv6"
> =A0BASE_PACKAGE_ARCH =3D "armv6"
> =A0PACKAGE_EXTRA_ARCHS +=3D "armv4 armv4t armv5te armv6"
> -
> -# Include tune file for thumb support, it defaults to off so DISTROs can=
 turn it on if they wish
> -require conf/machine/include/tune-thumb.inc
> diff --git a/conf/machine/include/tune-arm1176jzf-s.inc b/conf/machine/in=
clude/tune-arm1176jzf-s.inc
> index b7c5291..ee2884b 100644
> --- a/conf/machine/include/tune-arm1176jzf-s.inc
> +++ b/conf/machine/include/tune-arm1176jzf-s.inc
> @@ -2,6 +2,3 @@ TARGET_CC_ARCH =3D "-march=3Darmv6j -mtune=3Darm1176jzf-s=
 -mfpu=3Dvfp -mfloat-abi=3Dsoftfp
> =A0FEED_ARCH =3D "armv6"
> =A0BASE_PACKAGE_ARCH =3D "armv6"
> =A0PACKAGE_EXTRA_ARCHS +=3D "armv4 armv4t armv5te armv6"
> -
> -# Include tune file for thumb support, it defaults to off so DISTROs can=
 turn it on if they wish
> -require conf/machine/include/tune-thumb.inc
> diff --git a/conf/machine/include/tune-arm920t.inc b/conf/machine/include=
/tune-arm920t.inc
> index 5a373e9..fee5c58 100644
> --- a/conf/machine/include/tune-arm920t.inc
> +++ b/conf/machine/include/tune-arm920t.inc
> @@ -2,7 +2,3 @@ FEED_ARCH =3D "armv4t"
> =A0BASE_PACKAGE_ARCH =3D "armv4t"
> =A0TARGET_CC_ARCH =3D "-march=3Darmv4t -mtune=3Darm920t"
> =A0PACKAGE_EXTRA_ARCHS +=3D "armv4 armv4t"
> -
> -# Include tune file for thumb support, it defaults to off so DISTROs can=
 turn it on if they wish
> -require conf/machine/include/tune-thumb.inc
> -
> diff --git a/conf/machine/include/tune-arm926ejs.inc b/conf/machine/inclu=
de/tune-arm926ejs.inc
> index f6f5064..f41e460 100644
> --- a/conf/machine/include/tune-arm926ejs.inc
> +++ b/conf/machine/include/tune-arm926ejs.inc
> @@ -5,6 +5,3 @@ PACKAGE_EXTRA_ARCHS +=3D "armv4 armv4t armv5te"
> =A0# For gcc 4.x you need:
> =A0TARGET_CC_ARCH =3D "-march=3Darmv5te -mtune=3Darm926ej-s"
> =A0BASE_PACKAGE_ARCH =3D "armv5te"
> -
> -# Include tune file for thumb support, it defaults to off so DISTROs can=
 turn it on if they wish
> -require conf/machine/include/tune-thumb.inc
> diff --git a/conf/machine/include/tune-arm9tdmi.inc b/conf/machine/includ=
e/tune-arm9tdmi.inc
> index a11ee38..d788b53 100644
> --- a/conf/machine/include/tune-arm9tdmi.inc
> +++ b/conf/machine/include/tune-arm9tdmi.inc
> @@ -2,7 +2,3 @@ FEED_ARCH =3D "armv4t"
> =A0BASE_PACKAGE_ARCH =3D "armv4t"
> =A0PACKAGE_EXTRA_ARCHS +=3D "armv4 armv4t"
> =A0TARGET_CC_ARCH =3D "-mcpu=3Darm9tdmi -mtune=3Darm9tdmi"
> -
> -# Include tune file for thumb support, it defaults to off so DISTROs can=
 turn it on if they wish
> -require conf/machine/include/tune-thumb.inc
> -
> diff --git a/conf/machine/include/tune-armv7.inc b/conf/machine/include/t=
une-armv7.inc
> index 05ec3da..379a3eb 100644
> --- a/conf/machine/include/tune-armv7.inc
> +++ b/conf/machine/include/tune-armv7.inc
> @@ -5,7 +5,3 @@ TARGET_CC_ARCH =3D "-march=3Darmv7 -mfpu=3Dvfp -mfloat-ab=
i=3Dsoftfp"
> =A0FEED_ARCH =3D "armv7"
> =A0PACKAGE_EXTRA_ARCHS +=3D "armv4 armv4t armv5te armv6 armv7"
> =A0BASE_PACKAGE_ARCH =3D "armv7"
> -
> -# Include tune file for thumb support, it defaults to off so DISTROs can=
 turn it on if they wish
> -require conf/machine/include/tune-thumb.inc
> -
> diff --git a/conf/machine/include/tune-ep9312.inc b/conf/machine/include/=
tune-ep9312.inc
> index c8770e0..7458281 100644
> --- a/conf/machine/include/tune-ep9312.inc
> +++ b/conf/machine/include/tune-ep9312.inc
> @@ -5,9 +5,6 @@ PACKAGE_EXTRA_ARCHS +=3D "armv4t ep9312"
> =A0BASE_PACKAGE_ARCH =3D "ep9312"
> =A0FEED_ARCH =3D "ep9312"
>
> -# Include tune file for thumb support, it defaults to off so DISTROs can=
 turn it on if they wish
> -require conf/machine/include/tune-thumb.inc
> -
> =A0FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer =
-frename-registers -O -fno-signed-zeros"
> =A0DEBUG_OPTIMIZATION =3D "-O -fno-omit-frame-pointer -g"
> =A0SELECTED_OPTIMIZATION =3D "${@bb.data.getVar(['FULL_OPTIMIZATION', 'DE=
BUG_OPTIMIZATION'][bb.data.getVar('DEBUG_BUILD', d, 1) =3D=3D '1'], d, 1)}"
> diff --git a/conf/machine/include/tune-thumb.inc b/conf/machine/include/t=
une-thumb.inc
> deleted file mode 100644
> index cd88bb4..0000000
> --- a/conf/machine/include/tune-thumb.inc
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -#tune file for thumb instructions
> -
> -ARM_INSTRUCTION_SET ?=3D "arm"
> -# "arm" "thumb"
> -# =A0 =A0The instruction set the compiler should use when generating app=
lication
> -# =A0 =A0code. =A0The kernel is always compiled with arm code at present=
. =A0arm code
> -# =A0 =A0is the original 32 bit ARM instruction set, thumb code is the 1=
6 bit
> -# =A0 =A0encoded RISC sub-set. =A0Thumb code is smaller (maybe 70% of th=
e ARM size)
> -# =A0 =A0but requires more instructions (140% for 70% smaller code) so m=
ay be
> -# =A0 =A0slower.
> -
> -THUMB_INTERWORK ?=3D "no"
> -# "yes" "no"
> -# =A0 =A0Whether to compile with code to allow interworking between the =
two
> -# =A0 =A0instruction sets. =A0This allows thumb code to be executed on a=
 primarily
> -# =A0 =A0arm system and vice versa. =A0It is strongly recommended that D=
ISTROs not
> -# =A0 =A0turn this off - the actual cost is very small.
> -
> -OVERRIDE_THUMB =3D "${@['', ':thumb'][bb.data.getVar('ARM_INSTRUCTION_SE=
T', d, 1) =3D=3D 'thumb']}"
> -OVERRIDE_INTERWORK =3D "${@['', ':thumb-interwork'][bb.data.getVar('THUM=
B_INTERWORK', d, 1) =3D=3D 'yes']}"
> -OVERRIDES .=3D "${OVERRIDE_THUMB}${OVERRIDE_INTERWORK}"
> -
> -# =A0 =A0Compiler and linker options for application code and kernel cod=
e. =A0These
> -# =A0 =A0options ensure that the compiler has the correct settings for t=
he selected
> -# =A0 =A0instruction set and interworking.
> -ARM_INTERWORK_M_OPT =3D "${@['-mno-thumb-interwork', '-mthumb-interwork'=
][bb.data.getVar('THUMB_INTERWORK', d, 1) =3D=3D 'yes']}"
> -ARM_THUMB_M_OPT =3D "${@['-mno-thumb', '-mthumb'][bb.data.getVar('ARM_IN=
STRUCTION_SET', d, 1) =3D=3D 'thumb']}"
> -
> -#
> -TARGET_CC_ARCH +=3D =A0"${ARM_INTERWORK_M_OPT} ${ARM_THUMB_M_OPT}"
> -TARGET_CC_KERNEL_ARCH =A0+=3D "-mno-thumb-interwork -mno-thumb"
> -
> diff --git a/conf/machine/include/tune-xscale.inc b/conf/machine/include/=
tune-xscale.inc
> index 3a6bd0e..f0f58bc 100644
> --- a/conf/machine/include/tune-xscale.inc
> +++ b/conf/machine/include/tune-xscale.inc
> @@ -7,7 +7,3 @@ TARGET_CC_ARCH =3D "-march=3Darmv5te -mtune=3Dxscale"
> =A0TARGET_CC_KERNEL_ARCH =3D "-march=3Darmv5te -mtune=3Dxscale"
> =A0PACKAGE_EXTRA_ARCHS +=3D "${@['armv4b armv4tb armv5teb', 'armv4 armv4t=
 armv5te'][ bb.data.getVar('TARGET_ARCH', d, 1) =3D=3D 'arm']}"
> =A0BASE_PACKAGE_ARCH =3D "${@['armv5teb', 'armv5te'][bb.data.getVar('TARG=
ET_ARCH', d, 1) =3D=3D 'arm']}"
> -
> -# Include tune file for thumb support, it defaults to off so DISTROs can=
 turn it on if they wish
> -require conf/machine/include/tune-thumb.inc
> -
> diff --git a/conf/machine/palmz31.conf b/conf/machine/palmz31.conf
> index 0332952..9fb5f7e 100644
> --- a/conf/machine/palmz31.conf
> +++ b/conf/machine/palmz31.conf
> @@ -11,9 +11,6 @@ MACHINE_DISPLAY_HEIGHT_PIXELS =3D "160"
>
> =A0SERIAL_CONSOLE =3D "115200 ttyS0"
>
> -# Use tune-xscale per default. Machine independent feeds should be built=
 with tune-strongarm.
> -require conf/machine/include/tune-thumb.inc
> -
> =A0MACHINE_EXTRA_RRECOMMENDS +=3D "kernel-module-i2c-pxa \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 kernel-module-i2c=
-algo-pxa \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 kernel-module-i2c=
-dev \
> diff --git a/conf/machine/palmz72.conf b/conf/machine/palmz72.conf
> index 502c11a..9766434 100644
> --- a/conf/machine/palmz72.conf
> +++ b/conf/machine/palmz72.conf
> @@ -11,9 +11,6 @@ MACHINE_DISPLAY_HEIGHT_PIXELS =3D "320"
>
> =A0SERIAL_CONSOLE =3D "115200 ttyS0"
>
> -# Use tune-xscale per default. Machine independent feeds should be built=
 with tune-strongarm.
> -require conf/machine/include/tune-thumb.inc
> -
> =A0MACHINE_EXTRA_RRECOMMENDS +=3D "kernel-module-i2c-pxa \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 kernel-module-i2c=
-algo-pxa \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 kernel-module-i2c=
-dev \
> --
> 1.7.0.4
>
>


