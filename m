Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OX9Hk-00031x-LG
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Jul 2010 10:50:28 +0200
Received: by iwn34 with SMTP id 34so1944441iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Jul 2010 01:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=VNmH85FS47gUDFWuStRCZUHELPf5o6i+S6LYBhNUjro=;
	b=dQElXLYsvxHkCUia/vBF+yJdjvNlGN+W+Znt/RKnpc6xHjdJvFwYe9CoDjPJpfDTVB
	WH32deLQE0C/QGInNFIY8XKjIHlmTF12pKvJGRaivU7ze4o2S6HcNtr9405+3ljRrl9y
	j4jcfzY7nZuyrPSh7vD8oVSSP0EgJPy9Hjmng=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=Rx05RGDjkWHzr2OMgy+FO73506rCe4WeR96Jmyr4c80hoj2v/SYnpHAnALGpixc08R
	Iwk0pxmZYPd95NmHy3JIn3gvH8gGGTfPFlrQcNJlPfTcPGzpmSjmOMJ8Ej68IL1Cr8/1
	6DcuZFMDhv8GzCxrYUT9MA9jgnU5XoqB2l6WU=
Received: by 10.231.167.80 with SMTP id p16mr8504540iby.94.1278615791268; Thu, 
	08 Jul 2010 12:03:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Thu, 8 Jul 2010 12:02:51 -0700 (PDT)
In-Reply-To: <1278444743-4924-4-git-send-email-rep.dot.nop@gmail.com>
References: <1278444743-4924-1-git-send-email-rep.dot.nop@gmail.com> 
	<1278444743-4924-4-git-send-email-rep.dot.nop@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Jul 2010 12:02:51 -0700
Message-ID: <AANLkTimnWBxCFMLlns8Q8LJ-3BvpWqqTNkqZ8ZlWbQdo@mail.gmail.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][v3 3/4] uClibc: redo configuration
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
X-List-Received-Date: Fri, 09 Jul 2010 08:50:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 6, 2010 at 12:32 PM, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ---
> =A0conf/distro/include/sane-toolchain-uclibc.inc | =A0 =A07 +
> =A0conf/distro/include/sane-toolchain.inc =A0 =A0 =A0 =A0| =A0 =A03 +-
> =A0conf/distro/include/uclibc.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A08 +
> =A0recipes/uclibc/bfin-uclibc_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +=
-
> =A0recipes/uclibc/uclibc-config.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0111 +=
++++++++++
> =A0recipes/uclibc/uclibc-initial_0.9.30.2.bb =A0 =A0 | =A0 12 +-
> =A0recipes/uclibc/uclibc-initial_0.9.30.bb =A0 =A0 =A0 | =A0 =A05 +-
> =A0recipes/uclibc/uclibc-initial_git.bb =A0 =A0 =A0 =A0 =A0| =A0 =A06 +-
> =A0recipes/uclibc/uclibc-old.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0186=
 +++++++++++++++++++
> =A0recipes/uclibc/uclibc.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0247 ++++++++++++-------------
> =A0recipes/uclibc/uclibc_0.9.28.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A02=
 +-
> =A0recipes/uclibc/uclibc_0.9.29.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A02=
 +-
> =A0recipes/uclibc/uclibc_0.9.30.1.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +=
-
> =A0recipes/uclibc/uclibc_0.9.30.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A02=
 +-
> =A0recipes/uclibc/uclibc_git.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A01 -
> =A015 files changed, 447 insertions(+), 149 deletions(-)
> =A0create mode 100644 recipes/uclibc/uclibc-config.inc
> =A0create mode 100644 recipes/uclibc/uclibc-old.inc
>
> diff --git a/conf/distro/include/sane-toolchain-uclibc.inc b/conf/distro/=
include/sane-toolchain-uclibc.inc
> index 314340a..9f515a0 100644
> --- a/conf/distro/include/sane-toolchain-uclibc.inc
> +++ b/conf/distro/include/sane-toolchain-uclibc.inc
> @@ -14,6 +14,13 @@ USE_NLS ?=3D "no"
> =A0USE_NLS_glib-2.0-native =3D "yes"
> =A0USE_NLS_gcc-cross =3D "no"
>
> +PREFERRED_VERSION_uclibc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0?=3D "${=
PREFERRED_UCLIBC_VERSION}"
> +PREFERRED_VERSION_uclibc-initial =A0 =A0 =A0 =A0 =A0 =A0?=3D "${PREFERRE=
D_UCLIBC_VERSION}"
> +PREFERRED_VERSION_uclibc-cross =A0 =A0 =A0 =A0 =A0 =A0 =A0?=3D "${PREFER=
RED_UCLIBC_VERSION}"
> +PREFERRED_VERSION_uclibc-cross-sdk =A0 =A0 =A0 =A0 =A0?=3D "${PREFERRED_=
UCLIBC_VERSION}"
> +PREFERRED_VERSION_uclibc-cross-initial =A0 =A0 =A0?=3D "${PREFERRED_UCLI=
BC_VERSION}"
> +PREFERRED_VERSION_uclibc-cross-intermediate ?=3D "${PREFERRED_UCLIBC_VER=
SION}"
> +
> =A0#mess with compiler flags to use -Os instead of -O2
> =A0#Please see http://free-electrons.com/doc/embedded_linux_optimizations=
/img47.html for some more info
> =A0FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer =
-frename-registers -Os"
> diff --git a/conf/distro/include/sane-toolchain.inc b/conf/distro/include=
/sane-toolchain.inc
> index 1b77f75..f7df850 100644
> --- a/conf/distro/include/sane-toolchain.inc
> +++ b/conf/distro/include/sane-toolchain.inc
> @@ -13,8 +13,7 @@ PREFERRED_VERSION_glibc =A0 =A0 =A0 =A0 =A0 =A0 ?=3D "2=
.10.1"
> =A0PREFERRED_VERSION_glibc-initial =A0 =A0 ?=3D "2.10.1"
> =A0PREFERRED_VERSION_eglibc =A0 =A0 =A0 =A0 =A0 =A0 ?=3D "2.11"
> =A0PREFERRED_VERSION_eglibc-initial =A0 =A0 ?=3D "2.11"
> -PREFERRED_VERSION_uclibc =A0 =A0 =A0 =A0 =A0 =A0?=3D "0.9.30.1"
> -PREFERRED_VERSION_uclibc-initial =A0 =A0?=3D "0.9.30.1"
> +PREFERRED_UCLIBC_VERSION =A0 =A0 =A0 =A0 =A0 =A0?=3D "0.9.30.1"
>
> =A0# Some systems need a special gcc version
> =A0PREFERRED_GCC_VERSION_486sx =A0 =A0 =A0 =A0 =A0?=3D "4.3.2"
> diff --git a/conf/distro/include/uclibc.inc b/conf/distro/include/uclibc.=
inc
> index ee18fc8..b40fbf5 100644
> --- a/conf/distro/include/uclibc.inc
> +++ b/conf/distro/include/uclibc.inc
> @@ -9,3 +9,11 @@ PREFERRED_PROVIDER_virtual/libintl_avr32 =3D "proxy-libi=
ntl"
> =A0PREFERRED_PROVIDER_virtual/libc =3D "uclibc"
> =A0PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial =3D "uclibc-in=
itial"
> =A0PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc =3D "uclibc"
> +
> +# libc settings
> +DISTRO_FEATURES +=3D "${@['', ' nls'][bb.data.getVar('ENABLE_BINARY_LOCA=
LE_GENERATION', d, 1) =3D=3D '1']}"
> +MACHINE_FEATURES +=3D "${@['', ' bx'][bb.data.getVar('ARM_INSTRUCTION_SE=
T', d, 1) =3D=3D 'thumb']}"
> +# FIXME: We enable IPv4 per default to avoid alot of breakage.
> +# FIXME: Figure out an acceptable way to negotiate either
> +# FIXME: desired features or hard requirements, either top-down or botto=
m-up.
> +DISTRO_FEATURES +=3D " ipv4"
> diff --git a/recipes/uclibc/bfin-uclibc_svn.bb b/recipes/uclibc/bfin-ucli=
bc_svn.bb
> index e8cb63e..2757fc2 100644
> --- a/recipes/uclibc/bfin-uclibc_svn.bb
> +++ b/recipes/uclibc/bfin-uclibc_svn.bb
> @@ -9,7 +9,7 @@
> =A0UCLIBC_BASE ?=3D "0.9.29"
> =A0PV =3D "${UCLIBC_BASE}+svnr${SRCPV}"
>
> -require uclibc.inc
> +require uclibc-old.inc
> =A0PR =3D "${INC_PR}.0"
> =A0SRCREV =3D "1857"
> =A0PROVIDES_append_bfin =3D " virtual/${TARGET_PREFIX}libc-for-gcc "
> diff --git a/recipes/uclibc/uclibc-config.inc b/recipes/uclibc/uclibc-con=
fig.inc
> new file mode 100644
> index 0000000..82dfcfe
> --- /dev/null
> +++ b/recipes/uclibc/uclibc-config.inc
> @@ -0,0 +1,111 @@
> +#
> +# Set the ARCH environment variable for uClibc compilation.
> +# Return value must match one of the architectures known to uClibc:
> +# libc/sysdeps/*/*
> +#
> +
> +valid_archs =3D "\
> +alpha \
> +arm \
> +avr32 \
> +bfin \
> +cris \
> +e1 \
> +frv \
> +h8300 \
> +hppa \
> +i386 \
> +i960 \
> +ia64 \
> +m68k \
> +microblaze \
> +mips \
> +nios \
> +nios2 \
> +powerpc \
> +sh \
> +sh64 \
> +sparc \
> +v850 \
> +vax \
> +x86_64 \
> +xtensa \
> +"
> +def map_uclibc_arch(a, d):
> + =A0 =A0 =A0 """Return the uClibc architecture for the given TARGET_ARCH=
."""
> + =A0 =A0 =A0 import re
> +
> + =A0 =A0 =A0 valid_archs =3D bb.data.getVar('valid_archs', d, 1).split()
> +
> + =A0 =A0 =A0 if =A0 re.match('^(arm|sa110).*', a): =A0 =A0 return 'arm'
> + =A0 =A0 =A0 elif re.match('^(i.86|athlon)$', a): =A0 =A0return 'i386'
> + =A0 =A0 =A0 elif re.match('^mips.*', a): =A0 =A0 =A0 =A0 =A0 =A0return =
'mips'
> + =A0 =A0 =A0 elif re.match('^parisc.*', a): =A0 =A0 =A0 =A0 =A0return 'h=
ppa'
> + =A0 =A0 =A0 elif re.match('^ppc.*', a): =A0 =A0 =A0 =A0 =A0 =A0 return =
'powerpc'
> + =A0 =A0 =A0 elif re.match('^s390.*', a): =A0 =A0 =A0 =A0 =A0 =A0return =
's390'
> + =A0 =A0 =A0 elif re.match('^sh.*', a): =A0 =A0 =A0 =A0 =A0 =A0 =A0retur=
n 'sh'
> + =A0 =A0 =A0 elif re.match('^(sun|sparc).*', a): =A0 =A0 return 'sparc'
> + =A0 =A0 =A0 elif re.match('^xtensa.*', a): =A0 =A0 =A0 =A0 =A0return 'x=
tensa'
> + =A0 =A0 =A0 =A0elif a in valid_archs: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 r=
eturn a
> + =A0 =A0 =A0 else:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 bb.error("cannot map '%s' to a uClibc archi=
tecture" % a)
> +
> +export UCLIBC_ARCH =3D "${@map_uclibc_arch(bb.data.getVar('TARGET_ARCH',=
 d, 1), d)}"
> +
> +def map_uclibc_abi(o, d):
> + =A0 =A0 =A0 """Return the uClibc ABI for the given TARGET_OS."""
> + =A0 =A0 =A0 import re
> +
> + =A0 =A0 =A0 arch =3D bb.data.getVar('TARGET_ARCH', d, 1)
> + =A0 =A0 =A0 if =A0 map_uclibc_arch(bb.data.getVar('TARGET_ARCH', d, 1),=
 d) =3D=3D "arm":
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if re.match('.*eabi$', o): return 'ARM_EABI=
'
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0return 'ARM_OABI'
> + =A0 =A0 =A0 # FIXME: This is inaccurate! Handle o32, n32, n64
> + =A0 =A0 =A0 elif re.match('^mips.*64$', arch): =A0return 'MIPS_N64_ABI'
> + =A0 =A0 =A0 elif re.match('^mips.*', arch): =A0 =A0return 'MIPS_O32_ABI=
'
> + =A0 =A0 =A0 return ""
> +
> +export UCLIBC_ABI =3D "${@map_uclibc_abi(bb.data.getVar('TARGET_OS', d, =
1), d)}"
> +
> +def map_uclibc_endian(a, d):
> + =A0 =A0 =A0 """Return the uClibc endianess for the given TARGET_ARCH.""=
"
> + =A0 =A0 =A0 import re
> +
> + =A0 =A0 =A0 # Always BE
> + =A0 =A0 =A0 if re.match('^(avr32|e1|frv|(parisc|hppa)|m68k|microblaze|p=
owerpc.*|(sparc|sun).*)$', a):
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 'BIG'
> + =A0 =A0 =A0 # Possibly BE
> + =A0 =A0 =A0 elif re.match('^((arm|sa110|arm.*eb)|h8300.*eb|(parisc|hppa=
).*eb|mips|sh.*eb|xtensa.*eb)$', a):
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 'BIG'
> + =A0 =A0 =A0 return 'LITTLE'
> +
> +export UCLIBC_ENDIAN =3D "${@map_uclibc_endian(bb.data.getVar('TARGET_AR=
CH', d, 1), d)}"
> +
> +# internal helper
> +def uclibc_cfg(feature, features, tokens, cnf, rem):
> + =A0 =A0 =A0 if type(tokens) =3D=3D type(""):
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tokens =3D [tokens]
> + =A0 =A0 =A0 rem.extend(['/^[# ]*' + token + '[ =3D]/d' for token in tok=
ens])
> + =A0 =A0 =A0 if type(features) =3D=3D type([]) and feature in features:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cnf.extend([token + '=3Dy' for token in tok=
ens])
> + =A0 =A0 =A0 else:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cnf.extend(['# ' + token + ' is not set' fo=
r token in tokens])
> +# Map distro and machine features to config settings
> +def features_to_uclibc_settings(d):
> + =A0 =A0 =A0 cnf, rem =3D ([], [])
> + =A0 =A0 =A0 distro_features =3D bb.data.getVar('DISTRO_FEATURES', d).sp=
lit()
> + =A0 =A0 =A0 machine_features =3D bb.data.getVar('MACHINE_FEATURES', d).=
split()
> + =A0 =A0 =A0 uclibc_cfg('ipv4', =A0 =A0 =A0distro_features, 'UCLIBC_HAS_=
IPV4', cnf, rem)
> + =A0 =A0 =A0 uclibc_cfg('ipv6', =A0 =A0 =A0distro_features, 'UCLIBC_HAS_=
IPV6', cnf, rem)
> + =A0 =A0 =A0 uclibc_cfg('largefile', distro_features, 'UCLIBC_HAS_LFS', =
cnf, rem)
> + =A0 =A0 =A0 uclibc_cfg('nls', =A0 =A0 =A0 distro_features, 'UCLIBC_HAS_=
LOCALE', cnf, rem)
> + =A0 =A0 =A0 uclibc_cfg('bx', =A0 =A0 =A0 =A0machine_features,'USE_BX', =
cnf, rem)



I would have a feature called 'nobx' because most of the machines
we support actively in OE has BX. With current state this needs to
be added to MACHINE features for almost all arm machines. We can instead
have nobx and keep USE_BX enabled and only disable it if nobx appears
in machine_features. Otherwise I have tested the patches myself
and they seems to work well.

I will push them once we have the bx turned into nobx

I think you do not have a function to disable already enabled feature.

> + =A0 =A0 =A0 return "\n".join(cnf), "\n".join(rem)
> +# X, Y =3D ${@features_to_uclibc_settings(d)}
> +# unfortunately doesn't seem to work with bitbake, workaround:
> +def features_to_uclibc_conf(d):
> + =A0 =A0 =A0 cnf, rem =3D features_to_uclibc_settings(d)
> + =A0 =A0 =A0 return cnf
> +def features_to_uclibc_del(d):
> + =A0 =A0 =A0 cnf, rem =3D features_to_uclibc_settings(d)
> + =A0 =A0 =A0 return rem
> diff --git a/recipes/uclibc/uclibc-initial_0.9.30.2.bb b/recipes/uclibc/u=
clibc-initial_0.9.30.2.bb
> index a9fa146..d00cb38 100644
> --- a/recipes/uclibc/uclibc-initial_0.9.30.2.bb
> +++ b/recipes/uclibc/uclibc-initial_0.9.30.2.bb
> @@ -7,19 +7,15 @@ PACKAGES =3D ""
>
> =A0do_install() {
> =A0 =A0 =A0 =A0# Install initial headers into the cross dir
> - =A0 =A0 =A0 make V=3D1 CC=3D"${CC}" PREFIX=3D${D} DEVEL_PREFIX=3D${pref=
ix}/ RUNTIME_PREFIX=3D/ \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install_headers
> + =A0 =A0 =A0 make PREFIX=3D${D} install_headers
> =A0 =A0 =A0 =A0#ln -sf include ${CROSS_DIR}/${TARGET_SYS}/sys-include
>
> - =A0 =A0 =A0 # This conflicts with the c++ version of this header
> - =A0 =A0 =A0 rm -f ${D}${includedir}/bits/atomicity.h
> - =A0 =A0 =A0 install -d ${D}${libdir}/
> - =A0 =A0 =A0 install -m 644 lib/crt[1in].o ${D}${libdir}/
> - =A0 =A0 =A0 install -m 644 lib/libc.so ${D}${libdir}/
> + =A0 =A0 =A0 install -d ${D}${layout_libdir}/
> + =A0 =A0 =A0 install -m 644 lib/crt[1in].o lib/libc.so ${D}${layout_libd=
ir}/
> =A0}
>
> =A0do_compile () {
> - =A0 =A0 =A0 make V=3D1 CC=3D"${CC}" PREFIX=3D${D} DEVEL_PREFIX=3D${pref=
ix}/ RUNTIME_PREFIX=3D/ \
> + =A0 =A0 =A0 make PREFIX=3D${D} \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0lib/crt1.o lib/crti.o lib/crtn.o
> =A0 =A0 =A0 =A0${CC} -nostdlib -nostartfiles -shared -x c /dev/null \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-o lib/libc.so
> diff --git a/recipes/uclibc/uclibc-initial_0.9.30.bb b/recipes/uclibc/ucl=
ibc-initial_0.9.30.bb
> index 84c35c8..9391a8c 100644
> --- a/recipes/uclibc/uclibc-initial_0.9.30.bb
> +++ b/recipes/uclibc/uclibc-initial_0.9.30.bb
> @@ -12,11 +12,8 @@ do_install() {
>
> =A0 =A0 =A0 =A0#ln -sf include ${CROSS_DIR}/${TARGET_SYS}/sys-include
>
> - =A0 =A0 =A0 # This conflicts with the c++ version of this header
> - =A0 =A0 =A0 rm -f ${D}${includedir}/bits/atomicity.h
> =A0 =A0 =A0 =A0install -d ${D}${libdir}/
> - =A0 =A0 =A0 install -m 644 lib/crt[1in].o ${D}${libdir}/
> - =A0 =A0 =A0 install -m 644 lib/libc.so ${D}${libdir}/
> + =A0 =A0 =A0 install -m 644 lib/crt[1in].o lib/libc.so ${D}${libdir}/
> =A0}
>
> =A0do_compile () {
> diff --git a/recipes/uclibc/uclibc-initial_git.bb b/recipes/uclibc/uclibc=
-initial_git.bb
> index 8c582e0..dd69dc0 100644
> --- a/recipes/uclibc/uclibc-initial_git.bb
> +++ b/recipes/uclibc/uclibc-initial_git.bb
> @@ -7,19 +7,17 @@ PACKAGES =3D ""
>
> =A0do_install() {
> =A0 =A0 =A0 =A0# Install initial headers into the cross dir
> - =A0 =A0 =A0 make V=3D1 CC=3D"${CC}" PREFIX=3D${D} DEVEL_PREFIX=3D${pref=
ix}/ RUNTIME_PREFIX=3D/ \
> + =A0 =A0 =A0 make PREFIX=3D${D} DEVEL_PREFIX=3D${prefix}/ RUNTIME_PREFIX=
=3D/ \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0install_headers
> =A0 =A0 =A0 =A0#ln -sf include ${CROSS_DIR}/${TARGET_SYS}/sys-include
>
> - =A0 =A0 =A0 # This conflicts with the c++ version of this header
> - =A0 =A0 =A0 rm -f ${D}${includedir}/bits/atomicity.h
> =A0 =A0 =A0 =A0install -d ${D}${libdir}/
> =A0 =A0 =A0 =A0install -m 644 lib/crt[1in].o ${D}${libdir}/
> =A0 =A0 =A0 =A0install -m 755 lib/lib[cm].so ${D}${libdir}/
> =A0}
>
> =A0do_compile () {
> - =A0 =A0 =A0 make V=3D1 CC=3D"${CC}" PREFIX=3D${D} DEVEL_PREFIX=3D${pref=
ix}/ RUNTIME_PREFIX=3D/ \
> + =A0 =A0 =A0 make PREFIX=3D${D} DEVEL_PREFIX=3D${prefix}/ RUNTIME_PREFIX=
=3D/ \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0lib/crt1.o lib/crti.o lib/crtn.o
> =A0 =A0 =A0 =A0${CC} -nostdlib -nostartfiles -shared -x c /dev/null \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-o lib/libc.so
> diff --git a/recipes/uclibc/uclibc-old.inc b/recipes/uclibc/uclibc-old.in=
c
> new file mode 100644
> index 0000000..7198c44
> --- /dev/null
> +++ b/recipes/uclibc/uclibc-old.inc
> @@ -0,0 +1,186 @@
> +DESCRIPTION =3D "C library for embedded systems"
> +LICENSE =3D "LGPL"
> +SECTION =3D "libs"
> +PRIORITY =3D "required"
> +INC_PR =3D "r35"
> +#
> +# For now, we will skip building of a gcc package if it is a uclibc one
> +# and our build is not a uclibc one, and we skip a glibc one if our buil=
d
> +# is a uclibc build.
> +#
> +# See the note in gcc/gcc_3.4.0.oe
> +#
> +
> +python __anonymous () {
> + =A0 =A0import bb, re
> + =A0 =A0uc_os =3D (re.match('.*uclibc*', bb.data.getVar('TARGET_OS', d, =
1)) !=3D None)
> + =A0 =A0if not uc_os:
> + =A0 =A0 =A0 =A0raise bb.parse.SkipPackage("incompatible with target %s"=
 %
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bb.=
data.getVar('TARGET_OS', d, 1))
> +}
> +
> +PROVIDES +=3D "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
> +PROVIDES +=3D "${@['virtual/libiconv', ''][bb.data.getVar('USE_NLS', d, =
1) !=3D 'yes']}"
> +DEPENDS =3D "virtual/${TARGET_PREFIX}binutils \
> + =A0 =A0 =A0 =A0 =A0virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-=
headers ncurses-native pax-utils-native"
> +RDEPENDS_${PN}-dev =3D "linux-libc-headers-dev"
> +
> +# Blackfin needs a wrapper around ld
> +#DEPENDS_append_bfin =3D " elf2flt "
> +
> +INHIBIT_DEFAULT_DEPS =3D "1"
> +PARALLEL_MAKE =3D ""
> +
> +PACKAGES =3D+ "ldd uclibc-utils-dbg uclibc-utils uclibc-gconv uclibc-thr=
ead-db"
> +
> +LEAD_SONAME =3D "libc.so"
> +
> +# The last line (gdb and lib1) is for uclinux-uclibc builds
> +uclibc_baselibs =3D "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcry=
pt-*.so \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${base_libdir}/libintl*.so.* ${base_=
libdir}/libintl-*.so \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${base_libdir}/libnsl*.so.* ${base_l=
ibdir}/libnsl-*.so \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${base_libdir}/libresolv*.so.* ${bas=
e_libdir}/libresolv-*.so \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${base_libdir}/ld*.so.* ${base_libd=
ir}/ld-*.so \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${base_libdir}/libc*.so.* ${base_lib=
dir}/libuClibc-*.so \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${base_libdir}/libdl*.so.* ${base_l=
ibdir}/libdl-*.so \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${base_libdir}/libm*.so.* ${base_lib=
dir}/libm-*.so \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${base_libdir}/libutil*.so.* ${base=
_libdir}/libutil-*.so \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${base_libdir}/libpthread*.so.* ${ba=
se_libdir}/libpthread-*.so \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${base_libdir}/librt*.so.* ${base_l=
ibdir}/librt-*.so \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${libdir}/libc.gdb ${libdir}/libc $=
{base_libdir}/lib1.so \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "
> +FILES_${PN} =3D "${sysconfdir} ${uclibc_baselibs} /sbin/ldconfig \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0${libexecdir} ${datadir}/zoneinfo ${libdir}/=
locale"
> +FILES_ldd =3D "${bindir}/ldd"
> +FILES_uclibc-dev_append =3D " ${libdir}/*.o ${libdir}/*_nonshared.a"
> +FILES_uclibc-utils =3D "${bindir} ${sbindir}"
> +FILES_uclibc-utils-dbg +=3D "${bindir}/.debug ${sbindir}/.debug"
> +FILES_uclibc-gconv =3D "${libdir}/gconv"
> +FILES_uclibc-thread-db =3D "/lib/libthread_db*"
> +RPROVIDES_uclibc-dev +=3D "libc-dev virtual-libc-dev"
> +
> +#
> +# This locale file gets copied into uClibc-${PV}/extra/locale/ prior to
> +# build, it does not need to be unpacked, but we can't inhibit the unpac=
king
> +# in the current build system.
> +#
> +UCLIBC_LOCALE_FILE =3D "uClibc-locale-030818.tgz"
> +UCLIBC_LOCALE_FILE_arm =3D "uClibc-locale-030818.arm.tgz"
> +UCLIBC_LOCALE_URI =3D "http://www.uclibc.org/downloads/${UCLIBC_LOCALE_F=
ILE}"
> +UCLIBC_LOCALE_URI_arm =3D "http://wiki.openembedded.net/dl/uclibc-locale=
/${UCLIBC_LOCALE_FILE}"
> +
> +SRC_URI =3D "${@['${UCLIBC_LOCALE_URI}', ''][bb.data.getVar('USE_NLS', d=
, 1) !=3D 'yes']} \
> + =A0 =A0 =A0 =A0 =A0file://uClibc.config \
> + =A0 =A0 =A0 =A0 =A0 http://www.uclibc.org/downloads/uClibc-${PV}.tar.bz=
2;name=3DuClibc-${PV} \
> + =A0 =A0 =A0 =A0 =A0"
> +
> +# do_stage barfs on a CC with whitepspace, therefore put the 'HOST_CC_AR=
CH' in
> +# the CFLAGS (for when building the utils).
> +OEMAKE_NO_CC =3D "'STRIPTOOL=3Dtrue' 'LD=3D${LD}' \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 'LOCALE_DATA_FILENAME=3D${UCLIBC_LOCALE_FIL=
E}'"
> +EXTRA_OEMAKE =3D "${OEMAKE_NO_CC} 'CC=3D${CC}' \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 'HOSTCFLAGS=3D-I${STAGING_INCDIR_NATIVE}' \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ARCH=3D`grep TARGET_ARCH ${S}/.config|sed -=
e 's/TARGET_ARCH=3D//g'`"
> +EXTRA_OEMAKE_task_do_package =3D "${OEMAKE_NO_CC}"
> +
> +KERNEL_SOURCE =3D "${STAGING_INCDIR}"
> +KERNEL_HEADERS =3D "${STAGING_INCDIR}"
> +
> +# Lets munge this via siteinfo.bbclass as well:
> +# ARCH_BIG_ENDIAN=3Dy
> +# ARCH_WANTS_BIG_ENDIAN=3Dy
> +# ARCH_WANTS_LITTLE_ENDIAN is not set
> +
> +# How to enable verbose logs:
> +#export VERBOSE=3D"1"
> +
> +configmangle =3D 's,^KERNEL_SOURCE=3D.*,KERNEL_SOURCE=3D"${KERNEL_SOURCE=
}",g; \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s,^KERNEL_HEADERS=3D.*,KERNEL_HEADERS=3D"${=
KERNEL_HEADERS}",g; \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s,^RUNTIME_PREFIX=3D.*,RUNTIME_PREFIX=3D"/"=
,g; \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s,^DEVEL_PREFIX=3D.*,DEVEL_PREFIX=3D"/${pre=
fix}",g; \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s,^SHARED_LIB_LOADER_PATH=3D.*,SHARED_LIB_L=
OADER_PATH=3D"/lib",; \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s,^SHARED_LIB_LOADER_PREFIX=3D.*,SHARED_LIB=
_LOADER_PREFIX=3D"/lib",; \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=3Dy=
,g; \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${@["","s,.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_=
LOCALE=3Dy,;"][bb.data.getVar("USE_NLS", d, 1) =3D=3D "yes"]} \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${@["","s,.*LDSO_GNU_HASH_SUPPORT.*,# LDSO_=
GNU_HASH_SUPPORT is not set,;"][bb.data.getVar("TARGET_ARCH", d, 1) in ['mi=
ps', 'mipsel', 'avr32']]} \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 '
> +
> +CFLAGS :=3D "${@oe_filter_out('-I\S+', '${CFLAGS}', d)}"
> +
> +python () {
> + =A0 =A0 =A0 if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 bb.data.setVar('configmangle_append', ' s,^=
HAS_FPU=3Dy,# HAS_FPU is not set,;', d)
> +}
> +
> +uclibcbuild_do_patch() {
> + =A0 =A0 =A0 ln -sf ${STAGING_INCDIR}/linux ${S}/include/linux
> + =A0 =A0 =A0 ln -sf ${STAGING_INCDIR}/asm ${S}/include/asm
> +
> + =A0 =A0 =A0 ${@['cp %s/%s extra/locale' % (bb.data.getVar('DL_DIR', d, =
1) or '', bb.data.getVar('UCLIBC_LOCALE_FILE', d, 1) or ''), ''][bb.data.ge=
tVar('USE_NLS', d, 1) !=3D 'yes']}
> +}
> +
> +python do_patch () {
> + =A0 =A0 =A0 bb.build.exec_func('base_do_patch', d)
> + =A0 =A0 =A0 bb.build.exec_func('uclibcbuild_do_patch', d)
> +}
> +
> +do_configure() {
> + =A0 =A0 =A0 rm -f ${S}/.config
> +
> + =A0 =A0 =A0 # For uClibc 0.9.29, OpenEmbedded splits the uClibc.config =
in two parts:
> + =A0 =A0 =A0 # uClibc.machine and uClibc.distro. So, if they exist use t=
hem, otherwise
> + =A0 =A0 =A0 # use a uClibc.config
> + =A0 =A0 =A0 if [ -f ${WORKDIR}/uClibc.machine -a -f ${WORKDIR}/uClibc.d=
istro ]; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "### uClibc.machine ###" >${S}/merged.=
config
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cat ${WORKDIR}/uClibc.machine >>${S}/merged=
.config
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "### uClibc.distro ###" >>${S}/merged.=
config
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cat ${WORKDIR}/uClibc.distro >>${S}/merged.=
config
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "### uClibc.config ###" >${S}/merged.c=
onfig
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cat ${WORKDIR}/uClibc.config >>${S}/merged.=
config
> + =A0 =A0 =A0 fi
> + =A0 =A0 =A0 cp ${S}/merged.config ${S}/.config
> +
> + =A0 =A0 =A0 # Mangle the resulting .config depending on OE variables
> + =A0 =A0 =A0 perl -i -p -e 's,^CROSS=3D.*,TARGET_ARCH=3D${TARGET_ARCH}\n=
CROSS=3D${TARGET_PREFIX},g' ${S}/Rules.mak
> + =A0 =A0 =A0 sed -i -e s:'$(CROSS)strip':true: ${S}/Rules.mak
> + =A0 =A0 =A0 perl -i -p -e '${configmangle}' ${S}/.config
> +
> + =A0 =A0 =A0 sed -i -e '/CONFIG_ARM_EABI/d' ${S}/.config
> +
> + =A0 =A0 =A0 if [ `echo ${TARGET_ARCH} | grep -e '^arm'` ]; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if [ `echo ${TARGET_OS} | grep -e 'eabi$'` =
]; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "CONFI=
G_ARM_EABI=3Dy" =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0>> ${S}/.config
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "# CONFIG_ARM_EABI is =
not set" =A0 =A0 >> ${S}/.config
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fi
> + =A0 =A0 =A0 fi
> + =A0 =A0 =A0 yes '' | oe_runmake oldconfig
> +}
> +
> +do_install() {
> + =A0 =A0 =A0 oe_runmake PREFIX=3D${D} DEVEL_PREFIX=3D${prefix}/ RUNTIME_=
PREFIX=3D/ \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install_dev install_runtime
> +
> + =A0 =A0 =A0 # Need to overwrite the version from -initial
> + =A0 =A0 =A0 #if [ ! -e ${D}${libdir}/libc.so ]; then
> + =A0 =A0 =A0 # =A0 =A0 =A0 ln -s ../../lib/libc.so.0 ${D}${libdir}/libc.=
so
> + =A0 =A0 =A0 #fi
> +
> + =A0 =A0 =A0 # We don't really need this in ${includedir}
> + =A0 =A0 =A0 rm -f ${D}${prefix}/include/.cvsignore
> +
> + =A0 =A0 =A0 # This conflicts with the c++ version of this header
> + =A0 =A0 =A0 rm -f ${D}${prefix}/include/bits/atomicity.h
> +
> + =A0 =A0 =A0 =A0oe_runmake "SSP_ALL_CFLAGS=3D${TARGET_LINK_HASH_STYLE}" =
utils
> + =A0 =A0 =A0 =A0oe_runmake STRIPTOOL=3Dtrue PREFIX=3D${D} DEVEL_PREFIX=
=3D${prefix}/ RUNTIME_PREFIX=3D/ \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0install_utils
> +
> + =A0 =A0 =A0 # oe_runstrip needs +x on files
> + =A0 =A0 =A0 chmod +x ${D}/${base_libdir}/*
> +}
> +
> +get_monotonic_srcrev () {
> + =A0 =A0 =A0 (cd ${S}; eval `git rev-list HEAD|wc -l`)
> +}
> diff --git a/recipes/uclibc/uclibc.inc b/recipes/uclibc/uclibc.inc
> index 4686d34..b925386 100644
> --- a/recipes/uclibc/uclibc.inc
> +++ b/recipes/uclibc/uclibc.inc
> @@ -3,6 +3,7 @@ LICENSE =3D "LGPL"
> =A0SECTION =3D "libs"
> =A0PRIORITY =3D "required"
> =A0INC_PR =3D "r34"
> +require uclibc-config.inc
> =A0#
> =A0# For now, we will skip building of a gcc package if it is a uclibc on=
e
> =A0# and our build is not a uclibc one, and we skip a glibc one if our bu=
ild
> @@ -20,172 +21,168 @@ python __anonymous () {
> =A0}
>
> =A0PROVIDES +=3D "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
> -PROVIDES +=3D "${@['virtual/libiconv', ''][bb.data.getVar('USE_NLS', d, =
1) !=3D 'yes']}"
> =A0DEPENDS =3D "virtual/${TARGET_PREFIX}binutils \
> - =A0 =A0 =A0 =A0 =A0virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-=
headers ncurses-native pax-utils-native"
> + =A0 =A0 =A0 =A0 =A0 virtual/${TARGET_PREFIX}gcc-intermediate \
> + =A0 =A0 =A0 =A0 =A0 linux-libc-headers ncurses-native"
> =A0RDEPENDS_${PN}-dev =3D "linux-libc-headers-dev"
>
> -# Blackfin needs a wrapper around ld
> -#DEPENDS_append_bfin =3D " elf2flt "
> -
> =A0INHIBIT_DEFAULT_DEPS =3D "1"
> -PARALLEL_MAKE =3D ""
>
> =A0PACKAGES =3D+ "ldd uclibc-utils-dbg uclibc-utils uclibc-gconv uclibc-t=
hread-db"
>
> =A0LEAD_SONAME =3D "libc.so"
>
> -# The last line (gdb and lib1) is for uclinux-uclibc builds
> +# The last line (gdb and lib1) is for uclinux-uclibc builds
> =A0uclibc_baselibs =3D "${base_libdir}/libcrypt*.so.* ${base_libdir}/libc=
rypt-*.so \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${base_libdir}/libintl*.so.* ${base_=
libdir}/libintl-*.so \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${base_libdir}/libnsl*.so.* ${base_l=
ibdir}/libnsl-*.so \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${base_libdir}/libresolv*.so.* ${bas=
e_libdir}/libresolv-*.so \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${base_libdir}/libintl*.so.* ${base=
_libdir}/libintl-*.so \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${base_libdir}/libnsl*.so.* ${base_=
libdir}/libnsl-*.so \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${base_libdir}/libresolv*.so.* ${ba=
se_libdir}/libresolv-*.so \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${base_libdir}/ld*.so.* ${base_lib=
dir}/ld-*.so \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${base_libdir}/libc*.so.* ${base_lib=
dir}/libuClibc-*.so \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${base_libdir}/libc*.so.* ${base_li=
bdir}/libuClibc-*.so \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${base_libdir}/libdl*.so.* ${base_=
libdir}/libdl-*.so \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${base_libdir}/libm*.so.* ${base_lib=
dir}/libm-*.so \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${base_libdir}/libm*.so.* ${base_li=
bdir}/libm-*.so \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${base_libdir}/libutil*.so.* ${bas=
e_libdir}/libutil-*.so \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${base_libdir}/libpthread*.so.* ${ba=
se_libdir}/libpthread-*.so \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${base_libdir}/libpthread*.so.* ${b=
ase_libdir}/libpthread-*.so \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${base_libdir}/librt*.so.* ${base_=
libdir}/librt-*.so \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${libdir}/libc.gdb ${libdir}/libc =
${base_libdir}/lib1.so \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"
> =A0FILES_${PN} =3D "${sysconfdir} ${uclibc_baselibs} /sbin/ldconfig \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0${libexecdir} ${datadir}/zoneinfo ${libdir}/=
locale"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${libexecdir} ${datadir}/zoneinfo ${libdir}=
/locale"
> =A0FILES_ldd =3D "${bindir}/ldd"
> -FILES_uclibc-dev_append =3D " ${libdir}/*.o ${libdir}/*_nonshared.a"
> +FILES_uclibc-dev_append =3D "\
> + =A0 =A0 =A0 =A0${libdir}/lib*.so \
> + =A0 =A0 =A0 =A0${libdir}/*_nonshared.a \
> + =A0 =A0 =A0 =A0${libdir}/[S]*crt[1in].o \
> + =A0 =A0 =A0 =A0${libdir}/lib*.a \
> + =A0 =A0 =A0 =A0${includedir}/*.h ${includedir}/*/*.h \
> + =A0 =A0 =A0 "
> =A0FILES_uclibc-utils =3D "${bindir} ${sbindir}"
> =A0FILES_uclibc-utils-dbg +=3D "${bindir}/.debug ${sbindir}/.debug"
> =A0FILES_uclibc-gconv =3D "${libdir}/gconv"
> =A0FILES_uclibc-thread-db =3D "/lib/libthread_db*"
> =A0RPROVIDES_uclibc-dev +=3D "libc-dev virtual-libc-dev"
>
> -#
> -# This locale file gets copied into uClibc-${PV}/extra/locale/ prior to
> -# build, it does not need to be unpacked, but we can't inhibit the unpac=
king
> -# in the current build system.
> -#
> -UCLIBC_LOCALE_FILE =3D "uClibc-locale-030818.tgz"
> -UCLIBC_LOCALE_FILE_arm =3D "uClibc-locale-030818.arm.tgz"
> -UCLIBC_LOCALE_URI =3D "http://www.uclibc.org/downloads/${UCLIBC_LOCALE_F=
ILE};name=3Dlocale"
> -UCLIBC_LOCALE_URI_arm =3D "http://wiki.openembedded.net/dl/uclibc-locale=
/${UCLIBC_LOCALE_FILE};name=3Dlocalearm"
> -
> -SRC_URI[locale.md5sum] =3D "d75b2239b4e27c3c9cbed1c8f6eabba6"
> -SRC_URI[locale.sha256sum] =3D "c4362be318a38f18d98dccf462d22d95bab92f055=
48bb93f65298fe9afaebd57"
> -SRC_URI[localearm.md5sum] =3D "fc0b6113f2b333564d3558e241059db8"
> -SRC_URI[localearm.sha256sum] =3D "6765f08499079207ba8c4da999d602ca75c384=
ff5812aa973f27b6a501b3438e"
> -
> -SRC_URI =3D "${@['${UCLIBC_LOCALE_URI}', ''][bb.data.getVar('USE_NLS', d=
, 1) !=3D 'yes']} \
> - =A0 =A0 =A0 =A0 =A0file://uClibc.config \
> - =A0 =A0 =A0 =A0 =A0 http://www.uclibc.org/downloads/uClibc-${PV}.tar.bz=
2;name=3DuClibc-${PV} \
> - =A0 =A0 =A0 =A0 =A0"
> -
> -# do_stage barfs on a CC with whitepspace, therefore put the 'HOST_CC_AR=
CH' in
> -# the CFLAGS (for when building the utils).
> -OEMAKE_NO_CC =3D "'STRIPTOOL=3Dtrue' 'LD=3D${LD}' \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 'LOCALE_DATA_FILENAME=3D${UCLIBC_LOCALE_FIL=
E}'"
> -EXTRA_OEMAKE =3D "${OEMAKE_NO_CC} 'CC=3D${CC}' \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 'HOSTCFLAGS=3D-I${STAGING_INCDIR_NATIVE}' \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ARCH=3D`grep TARGET_ARCH ${S}/.config|sed -=
e 's/TARGET_ARCH=3D//g'`"
> +SRC_URI =3D "\
> + =A0 =A0 =A0 =A0file://uClibc.config \
> + =A0 =A0 =A0 =A0http://www.uclibc.org/downloads/uClibc-${PV}.tar.bz2;nam=
e=3DuClibc-${PV} \
> + =A0 =A0 =A0 =A0"
> +
> +# do_stage barfs on a CC with whitespace, therefore put the 'HOST_CC_ARC=
H' in
> +# the CFLAGS (when building the utils).
> +OEMAKE_NO_CC =3D "'STRIPTOOL=3Dtrue' 'LD=3D${LD}'"
> +EXTRA_OEMAKE =3D "${OEMAKE_NO_CC} \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0'HOSTCC=3D${BUILD_CC}' \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0'HOST_CFLAGS=3D${BUILD_CFLAGS}' \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0'CC=3D${CC}' \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ARCH=3D${UCLIBC_ARCH}"
> +
> =A0EXTRA_OEMAKE_task_do_package =3D "${OEMAKE_NO_CC}"
>
> -KERNEL_SOURCE =3D "${STAGING_INCDIR}"
> -KERNEL_HEADERS =3D "${STAGING_INCDIR}"
> -
> -# Lets munge this via siteinfo.bbclass as well:
> -# ARCH_BIG_ENDIAN=3Dy
> -# ARCH_WANTS_BIG_ENDIAN=3Dy
> -# ARCH_WANTS_LITTLE_ENDIAN is not set
> -
> -# How to enable verbose logs:
> -#export VERBOSE=3D"1"
> -
> -configmangle =3D 's,^KERNEL_SOURCE=3D.*,KERNEL_SOURCE=3D"${KERNEL_SOURCE=
}",g; \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s,^KERNEL_HEADERS=3D.*,KERNEL_HEADERS=3D"${=
KERNEL_HEADERS}",g; \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s,^RUNTIME_PREFIX=3D.*,RUNTIME_PREFIX=3D"/"=
,g; \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s,^DEVEL_PREFIX=3D.*,DEVEL_PREFIX=3D"/${pre=
fix}",g; \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s,^SHARED_LIB_LOADER_PATH=3D.*,SHARED_LIB_L=
OADER_PATH=3D"/lib",; \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s,^SHARED_LIB_LOADER_PREFIX=3D.*,SHARED_LIB=
_LOADER_PREFIX=3D"/lib",; \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=3Dy=
,g; \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${@["","s,.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_=
LOCALE=3Dy,;"][bb.data.getVar("USE_NLS", d, 1) =3D=3D "yes"]} \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${@["","s,.*LDSO_GNU_HASH_SUPPORT.*,# LDSO_=
GNU_HASH_SUPPORT is not set,;"][bb.data.getVar("TARGET_ARCH", d, 1) in ['mi=
ps', 'mipsel', 'avr32']]} \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 '
> +# enable verbose output:
> +export V=3D"1"
>
> -CFLAGS :=3D "${@oe_filter_out('-I\S+', '${CFLAGS}', d)}"
> +UCLIBC_EXTRA_CFLAGS =A0:=3D "${@oe_filter_out('(-I\S+|-i\S+)', '${CFLAGS=
}', d)}"
> +UCLIBC_EXTRA_LDFLAGS :=3D "${@oe_filter_out('(-L\S+|-l\S+)', '${LDFLAGS}=
', d)}"
> +do_compile_prepend () {
> + =A0unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> +}
>
> +configmangle =3D '/^KERNEL_HEADERS/d; \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/^RUNTIME_PREFIX/d; \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/^DEVEL_PREFIX/d; \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/^SHARED_LIB_LOADER_PREFIX/d; \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/^UCLIBC_EXTRA_CFLAGS/d; \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0s,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=
=3Dy,g; \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${@["","s,.*UCLIBC_HAS_LOCALE.*,UCLIBC_H=
AS_LOCALE=3Dy,;"][bb.data.getVar("USE_NLS", d, 1) =3D=3D "yes"]} \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${@["","s,.*LDSO_GNU_HASH_SUPPORT.*,# LD=
SO_GNU_HASH_SUPPORT is not set,;"][bb.data.getVar("TARGET_ARCH", d, 1) in [=
'mips', 'mipsel', 'avr32']]} \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/^CROSS/d; \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/^TARGET_ARCH=3D/d; \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/^TARGET_/s,^\([^=3D]*\).*,# \1 is not s=
et,g; \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0s,^DOSTRIP.*,# DOSTRIP is not set,g; \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/_[EO]*ABI/d; \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/HAS_FPU/d; \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 '
> +OE_FEATURES :=3D "${@features_to_uclibc_conf(d)}"
> +OE_DEL =A0 =A0 =A0:=3D "${@features_to_uclibc_del(d)}"
> =A0python () {
> - =A0 =A0 =A0 if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 bb.data.setVar('configmangle_append', ' s,^=
HAS_FPU=3Dy,# HAS_FPU is not set,;', d)
> + =A0if "${OE_DEL}":
> + =A0 =A0bb.data.setVar('configmangle_append', "${OE_DEL}" + "\n", d)
> + =A0if "${OE_FEATURES}":
> + =A0 =A0bb.data.setVar('configmangle_append',
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "/^### DISTRO FEATURES$/a\\\n%s\n\n=
" %
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ("\\n".join((bb.data.expand("${OE_F=
EATURES}", d).split("\n")))),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 d)
> + =A0bb.data.setVar('configmangle_append',
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "/^### CROSS$/a\\\n%s\n" %
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0("\\n".join(["CROSS_COMPILER_PREFIX=
=3D\"${TARGET_PREFIX}\"",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"UCLIBC_EXTRA_CFLAGS=3D\=
"${UCLIBC_EXTRA_CFLAGS}\"",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "KERNEL_HEADERS=3D\"${S=
TAGING_INCDIR}\"",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "RUNTIME_PREFIX=3D\"/\"=
",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "DEVEL_PREFIX=3D\"/${pr=
efix}\"",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "SHARED_LIB_LOADER_PREF=
IX=3D\"/lib\"",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0])
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 d)
> + =A0bb.data.setVar('configmangle_append',
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "/^### TGT$/a\\\nTARGET_ARCH=3D\"%s\"\\=
nTARGET_%s=3Dy\n" %
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0("${UCLIBC_ARCH}", "${UC=
LIBC_ARCH}"),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 d)
> + =A0bb.data.setVar('configmangle_append',
> + =A0 =A0"/^### FPU$/a\\\n%s\n\n" % (["UCLIBC_HAS_FPU=3Dy","# UCLIBC_HAS_=
FPU is not set"][bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]]), d)
> + =A0if "${UCLIBC_ENDIAN}":
> + =A0 =A0bb.data.setVar('configmangle_append',
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "/^### ABI$/a\\\nARCH_%s_ENDIAN=3Dy=
\n\n" % ("${UCLIBC_ENDIAN}"),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 d)
> + =A0if "${UCLIBC_ABI}":
> + =A0 =A0bb.data.setVar('configmangle_append',
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "/^### ABI$/a\\\nCONFIG_%s=3Dy\n\n"=
 % ("${UCLIBC_ABI}"),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 d)
> =A0}
>
> =A0uclibcbuild_do_patch() {
> - =A0 =A0 =A0 ln -sf ${STAGING_INCDIR}/linux ${S}/include/linux
> - =A0 =A0 =A0 ln -sf ${STAGING_INCDIR}/asm ${S}/include/asm
> -
> - =A0 =A0 =A0 ${@['cp %s/%s extra/locale' % (bb.data.getVar('DL_DIR', d, =
1) or '', bb.data.getVar('UCLIBC_LOCALE_FILE', d, 1) or ''), ''][bb.data.ge=
tVar('USE_NLS', d, 1) !=3D 'yes']}
> + =A0 =A0 =A0 =A0ln -sf ${STAGING_INCDIR}/linux ${S}/include/linux
> + =A0 =A0 =A0 =A0ln -sf ${STAGING_INCDIR}/asm ${S}/include/asm
> =A0}
>
> =A0python do_patch () {
> - =A0 =A0 =A0 bb.build.exec_func('base_do_patch', d)
> - =A0 =A0 =A0 bb.build.exec_func('uclibcbuild_do_patch', d)
> + =A0 =A0 =A0 =A0bb.build.exec_func('base_do_patch', d)
> + =A0 =A0 =A0 =A0bb.build.exec_func('uclibcbuild_do_patch', d)
> =A0}
>
> =A0do_configure() {
> - =A0 =A0 =A0 rm -f ${S}/.config
> -
> - =A0 =A0 =A0 # For uClibc 0.9.29, OpenEmbedded splits the uClibc.config =
in two parts:
> - =A0 =A0 =A0 # uClibc.machine and uClibc.distro. So, if they exist use t=
hem, otherwise
> - =A0 =A0 =A0 # use a uClibc.config
> - =A0 =A0 =A0 if [ -f ${WORKDIR}/uClibc.machine -a -f ${WORKDIR}/uClibc.d=
istro ]; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "### uClibc.machine ###" >${S}/merged.=
config
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 cat ${WORKDIR}/uClibc.machine >>${S}/merged=
.config
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "### uClibc.distro ###" >>${S}/merged.=
config
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 cat ${WORKDIR}/uClibc.distro >>${S}/merged.=
config
> - =A0 =A0 =A0 else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "### uClibc.config ###" >${S}/merged.c=
onfig
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 cat ${WORKDIR}/uClibc.config >>${S}/merged.=
config
> - =A0 =A0 =A0 fi
> - =A0 =A0 =A0 cp ${S}/merged.config ${S}/.config
> -
> - =A0 =A0 =A0 # Mangle the resulting .config depending on OE variables
> - =A0 =A0 =A0 perl -i -p -e 's,^CROSS=3D.*,TARGET_ARCH=3D${TARGET_ARCH}\n=
CROSS=3D${TARGET_PREFIX},g' ${S}/Rules.mak
> - =A0 =A0 =A0 sed -i -e s:'$(CROSS)strip':true: ${S}/Rules.mak
> - =A0 =A0 =A0 perl -i -p -e '${configmangle}' ${S}/.config
> -
> - =A0 =A0 =A0 sed -i -e '/CONFIG_ARM_EABI/d' ${S}/.config
> -
> - =A0 =A0 =A0 if [ `echo ${TARGET_ARCH} | grep -e '^arm'` ]; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if [ `echo ${TARGET_OS} | grep -e 'eabi$'` =
]; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "CONFI=
G_ARM_EABI=3Dy" =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0>> ${S}/.config
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "# CONFIG_ARM_EABI is =
not set" =A0 =A0 >> ${S}/.config
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 fi
> - =A0 =A0 =A0 fi
> - =A0 =A0 =A0 yes '' | oe_runmake oldconfig
> + =A0 =A0 =A0 =A0rm -f ${S}/.config
> +
> + =A0 =A0 =A0 =A0# OpenEmbedded splits the uClibc.config in two parts:
> + =A0 =A0 =A0 =A0# uClibc.machine, uClibc.distro
> + =A0 =A0 =A0 =A0# So, if they exist use them, otherwise use a uClibc.con=
fig
> + =A0 =A0 =A0 =A0if [ -f ${WORKDIR}/uClibc.machine -a -f ${WORKDIR}/uClib=
c.distro ]; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo "### uClibc.machine ###" >${S}/merg=
ed.config
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cat ${WORKDIR}/uClibc.machine >>${S}/mer=
ged.config
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo "### uClibc.distro ###" >>${S}/merg=
ed.config
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cat ${WORKDIR}/uClibc.distro >>${S}/merg=
ed.config
> + =A0 =A0 =A0 =A0else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo "### uClibc.config ###" >${S}/merge=
d.config
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cat ${WORKDIR}/uClibc.config >>${S}/merg=
ed.config
> + =A0 =A0 =A0 =A0fi
> + =A0 =A0 =A0 =A0echo "### CROSS" >>${S}/merged.config
> + =A0 =A0 =A0 =A0echo "### TGT" >>${S}/merged.config
> + =A0 =A0 =A0 =A0echo "### MMU" >>${S}/merged.config
> + =A0 =A0 =A0 =A0echo "### FPU" >>${S}/merged.config
> + =A0 =A0 =A0 =A0echo "### ABI" >>${S}/merged.config
> + =A0 =A0 =A0 =A0echo "### DISTRO FEATURES" >>${S}/merged.config
> + =A0 =A0 =A0 =A0cp ${S}/merged.config ${S}/.config
> +
> + =A0 =A0 =A0 =A0# Mangle the resulting .config depending on OE variables
> + =A0 =A0 =A0 =A0sed -i -e '${configmangle}' ${S}/.config
> +
> + =A0 =A0 =A0 =A0oe_runmake oldconfig
> =A0}
>
> =A0do_install() {
> - =A0 =A0 =A0 oe_runmake PREFIX=3D${D} DEVEL_PREFIX=3D${prefix}/ RUNTIME_=
PREFIX=3D/ \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install_dev install_runtime
> -
> - =A0 =A0 =A0 # Need to overwrite the version from -initial
> - =A0 =A0 =A0 #if [ ! -e ${D}${libdir}/libc.so ]; then
> - =A0 =A0 =A0 # =A0 =A0 =A0 ln -s ../../lib/libc.so.0 ${D}${libdir}/libc.=
so
> - =A0 =A0 =A0 #fi
> -
> - =A0 =A0 =A0 # We don't really need this in ${includedir}
> - =A0 =A0 =A0 rm -f ${D}${prefix}/include/.cvsignore
> -
> - =A0 =A0 =A0 # This conflicts with the c++ version of this header
> - =A0 =A0 =A0 rm -f ${D}${prefix}/include/bits/atomicity.h
> -
> - =A0 =A0 =A0 =A0oe_runmake "SSP_ALL_CFLAGS=3D${TARGET_LINK_HASH_STYLE}" =
utils
> - =A0 =A0 =A0 =A0oe_runmake STRIPTOOL=3Dtrue PREFIX=3D${D} DEVEL_PREFIX=
=3D${prefix}/ RUNTIME_PREFIX=3D/ \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0install_utils
> -
> - =A0 =A0 =A0 # oe_runstrip needs +x on files
> - =A0 =A0 =A0 chmod +x ${D}/${base_libdir}/*
> + =A0 =A0 =A0 =A0oe_runmake PREFIX=3D${D} install
> + =A0 =A0 =A0 =A0oe_runmake PREFIX=3D${D} install_utils
> =A0}
>
> =A0get_monotonic_srcrev () {
> - =A0 =A0 =A0 (cd ${S}; eval `git rev-list HEAD|wc -l`)
> + =A0 =A0 =A0 =A0(cd ${S}; eval `git rev-list HEAD|wc -l`)
> =A0}
> diff --git a/recipes/uclibc/uclibc_0.9.28.bb b/recipes/uclibc/uclibc_0.9.=
28.bb
> index a43d5ed..7da53f9 100644
> --- a/recipes/uclibc/uclibc_0.9.28.bb
> +++ b/recipes/uclibc/uclibc_0.9.28.bb
> @@ -1,4 +1,4 @@
> -require uclibc.inc
> +require uclibc-old.inc
> =A0PR =3D "${INC_PR}.0"
>
> =A0# This is the correct KERNEL_SOURCE location, if the uClibc
> diff --git a/recipes/uclibc/uclibc_0.9.29.bb b/recipes/uclibc/uclibc_0.9.=
29.bb
> index b83cd2e..829777b 100644
> --- a/recipes/uclibc/uclibc_0.9.29.bb
> +++ b/recipes/uclibc/uclibc_0.9.29.bb
> @@ -8,7 +8,7 @@
> =A0#
> =A0UCLIBC_BASE ?=3D "0.9.29"
>
> -require uclibc.inc
> +require uclibc-old.inc
> =A0PR =3D "${INC_PR}.0"
>
> =A0PROVIDES +=3D "virtual/${TARGET_PREFIX}libc-for-gcc"
> diff --git a/recipes/uclibc/uclibc_0.9.30.1.bb b/recipes/uclibc/uclibc_0.=
9.30.1.bb
> index ea69249..d3d5c58 100644
> --- a/recipes/uclibc/uclibc_0.9.30.1.bb
> +++ b/recipes/uclibc/uclibc_0.9.30.1.bb
> @@ -8,7 +8,7 @@
> =A0#
> =A0UCLIBC_BASE ?=3D "0.9.30.1"
>
> -require uclibc.inc
> +require uclibc-old.inc
> =A0PR =3D "${INC_PR}.4"
>
> =A0PROVIDES +=3D "virtual/${TARGET_PREFIX}libc-for-gcc"
> diff --git a/recipes/uclibc/uclibc_0.9.30.bb b/recipes/uclibc/uclibc_0.9.=
30.bb
> index 5d267b5..36e9de3 100644
> --- a/recipes/uclibc/uclibc_0.9.30.bb
> +++ b/recipes/uclibc/uclibc_0.9.30.bb
> @@ -8,7 +8,7 @@
> =A0#
> =A0UCLIBC_BASE ?=3D "0.9.30"
>
> -require uclibc.inc
> +require uclibc-old.inc
> =A0PR =3D "${INC_PR}.1"
>
> =A0PROVIDES +=3D "virtual/${TARGET_PREFIX}libc-for-gcc"
> diff --git a/recipes/uclibc/uclibc_git.bb b/recipes/uclibc/uclibc_git.bb
> index bbff94d..f026ae9 100644
> --- a/recipes/uclibc/uclibc_git.bb
> +++ b/recipes/uclibc/uclibc_git.bb
> @@ -26,7 +26,6 @@ FILESPATHPKG =3D. "uclibc-git:uclibc-${UCLIBC_BASE}:"
> =A0KERNEL_SOURCE =3D "${CROSS_DIR}/${TARGET_SYS}"
>
> =A0SRC_URI =3D "git://uclibc.org/uClibc.git;branch=3Dmaster;protocol=3Dgi=
t \
> - =A0 =A0 =A0 ${@['${UCLIBC_LOCALE_URI}', ''][bb.data.getVar('USE_NLS', d=
, 1) !=3D 'yes']} \
> =A0 =A0 =A0 =A0file://uClibc.config \
> =A0 =A0 =A0 =A0file://uClibc.machine \
> =A0 =A0 =A0 =A0file://uClibc.distro \
> --
> 1.7.1
>
>


