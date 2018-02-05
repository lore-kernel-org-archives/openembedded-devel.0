Return-Path: <akuster808@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id C0BA4719A4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Feb 2018 19:42:57 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id v31so30860807wrc.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Feb 2018 11:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=vs8I/gwxYWPIu08bWHK+fap1i4jpz1HOuhf30Gc0zNY=;
	b=fkbapMCUs1J1KN5NbJJ63zGfT8X8pPSj/76oKNeOGqk0i7a4ysn+/UTbd/FyfnRoQR
	gGKmUT2ZfhNvxbUC1c4+Z0qnF7iasdvu23XK/TnZv7rlddcc5BaO6nVYg9eCsyD0R3EO
	UzFVbXmIs8NvwtKKiM6/EkvuiMm4sFo8HWzN06i/Wzv3sdV3s53QdkA9+B6lDOtc6qAz
	6F3OEFUgwv7NSCbB24MtewnQuBN1SPbHvSjDv9an6CD88OCFYBjmvZ7dQq+alwnF/Dl8
	AiNzu9Lcr1x2kaM10+iQPS00bGdr++52Y5ALnPy9yjwVOA0xDmzrnekuLEvYYPsKpYcJ
	+rrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=vs8I/gwxYWPIu08bWHK+fap1i4jpz1HOuhf30Gc0zNY=;
	b=ci+J90IttFhqkNihESbn19kje70NlnZrFtjf2Hsy2oQlL0GXOrN/NXXEnrMsJRdOkz
	6JizWe3fYgqmKYpEkyboLUOF/RbmoWLtCRACXSTQTo82Rzs2eLTbP/MjPG4neyJFwzE+
	6p9eaIPj/vCanRH/DMJHXZAGDCiZ0MsSDAoPIF0cOU1KDlfCALJ6ad4pQmW7hPnTmMrA
	wnegLPz/5CRKo7+XawJyt4k8BL5muhmG/zsL3eyGTlFTPIB/lPJiCQbdyOsG0vJpRS4l
	D3mh9LmDQCJ86dpFbg+xePRNl71QFSffmTwpqZPdLKj8HPYGW4mxYmY3uZIcSfd+eBHo
	iR4g==
X-Gm-Message-State: AKwxytcIAz0kdf1pSVtyTIxfhtqM89c3GSu2dtwQxzo02I/m1JisXIi3
	fHxX6+X78DLqHfAxjofr42vBgQ==
X-Google-Smtp-Source: AH8x224+mxpshe4KHR7ZiCwMu9Sc7uW9wsWsCY2sWXZ1A1VX7S9BrxwTMeOiKJHREQn3Dyrg/GXuEA==
X-Received: by 10.223.150.113 with SMTP id c46mr33299640wra.16.1517859777888; 
	Mon, 05 Feb 2018 11:42:57 -0800 (PST)
Received: from [10.5.7.147] ([223.196.115.131])
	by smtp.gmail.com with ESMTPSA id a6sm5501892wrh.49.2018.02.05.11.42.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Feb 2018 11:42:57 -0800 (PST)
To: Ruslan Bilovol <rbilovol@cisco.com>,
	openembedded-devel@lists.openembedded.org
References: <1517502858-19348-1-git-send-email-rbilovol@cisco.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <ea2ec4aa-19a5-709b-593a-90c88206b51c@gmail.com>
Date: Tue, 6 Feb 2018 01:12:51 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1517502858-19348-1-git-send-email-rbilovol@cisco.com>
Subject: Re: [meta-oe][PATCH v2] recipes-kernel: add kpatch dynamic kernel patching infrastructure
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
X-List-Received-Date: Mon, 05 Feb 2018 19:42:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 02/01/2018 10:04 PM, Ruslan Bilovol wrote:
> kpatch is a Linux dynamic kernel patching infrastructure
> which allows you to patch a running kernel without
> rebooting or restarting any processes
>
> Currently it is enabled and tested on x86-64 systems,
> although can be extended to PPC64 as well.
>
> Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>

I am seeing this error with qemux86 Machine.

i586-oe-linux-gcc=C2=A0 -m32 -march=3Di586
--sysroot=3D/build/build_artifacts/master/tmp-glibc/work/i586-oe-linux/kp=
atch/0.5.0+gitAUTOINC+db6efbb8c7-r0/recipe-sysroot=C2=A0
-O2 -pipe -g -feliminate-unused-debug-types
-fdebug-prefix-map=3D/build/build_artifacts/master/tmp-glibc/work/i586-oe=
-linux/kpatch/0.5.0+gitAUTOINC+db6efbb8c7-r0=3D/usr/src/debug/kpatch/0.5.=
0+gitAUTOINC+db6efbb8c7-r0
-fdebug-prefix-map=3D/build/build_artifacts/master/tmp-glibc/work/i586-oe=
-linux/kpatch/0.5.0+gitAUTOINC+db6efbb8c7-r0/recipe-sysroot-native=3D
-fdebug-prefix-map=3D/build/build_artifacts/master/tmp-glibc/work/i586-oe=
-linux/kpatch/0.5.0+gitAUTOINC+db6efbb8c7-r0/recipe-sysroot=3D=C2=A0
-MMD -MP -I../kmod/patch -Iinsn -Wall -g -Werror=C2=A0=C2=A0 -c -o
create-diff-object.o create-diff-object.c
| In file included from kpatch-elf.h:25:0,
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from create-diff-object.c:53:
| create-diff-object.c: In function 'kpatch_bundle_symbols':
| log.h:11:14: error: format '%lu' expects argument of type 'long
unsigned int', but argument 8 has type 'Elf64_Addr {aka long long
unsigned int}' [-Werror=3Dformat=3D]
|=C2=A0=C2=A0 error(1, 0, "ERROR: %s: %s: %d: " format, childobj, __FUNCT=
ION__,
__LINE__, ##__VA_ARGS__)
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ^
| create-diff-object.c:163:5: note: in expansion of macro 'ERROR'
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ERROR("symbol %s at offset %lu within sec=
tion %s, expected 0",
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~
| create-diff-object.c:163:34: note: format string is defined here
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ERROR("symbol %s at offset %lu within sec=
tion %s, expected 0",
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ~~^
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %llu
| create-diff-object.c: In function 'kpatch_replace_sections_syms':
| create-diff-object.c:1142:5: error: implicit declaration of function
'rela_insn'; did you mean 'rela_equal'?
[-Werror=3Dimplicit-function-declaration]
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rela_insn(sec, rela, &insn);
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rela_equal
| cc1: all warnings being treated as errors
| <builtin>: recipe for target 'create-diff-object.o' failed
| make[1]: *** [create-diff-object.o] Error 1
| make[1]: Leaving directory
'/build/build_artifacts/master/tmp-glibc/work/i586-oe-linux/kpatch/0.5.0+=
gitAUTOINC+db6efbb8c7-r0/git/kpatch-build'
| Makefile:15: recipe for target 'build-kpatch-build' failed
| make: *** [build-kpatch-build] Error 2

> ---
>
> v2: no code changes, moved from oe-core to meta-oe
> v1: http://lists.openembedded.org/pipermail/openembedded-core/2018-Janu=
ary/146913.html
>
>  meta-oe/recipes-kernel/kpatch/kpatch.inc           |  49 ++++++++++
>  ...patch-build-add-cross-compilation-support.patch | 103 +++++++++++++=
++++++++
>  ...tch-build-allow-overriding-of-distro-name.patch |  62 +++++++++++++=

>  meta-oe/recipes-kernel/kpatch/kpatch_git.bb        |  11 +++
>  4 files changed, 225 insertions(+)
>  create mode 100644 meta-oe/recipes-kernel/kpatch/kpatch.inc
>  create mode 100644 meta-oe/recipes-kernel/kpatch/kpatch/0001-kpatch-bu=
ild-add-cross-compilation-support.patch
>  create mode 100644 meta-oe/recipes-kernel/kpatch/kpatch/0002-kpatch-bu=
ild-allow-overriding-of-distro-name.patch
>  create mode 100644 meta-oe/recipes-kernel/kpatch/kpatch_git.bb
>
> diff --git a/meta-oe/recipes-kernel/kpatch/kpatch.inc b/meta-oe/recipes=
-kernel/kpatch/kpatch.inc
> new file mode 100644
> index 0000000..b1e73e9
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/kpatch/kpatch.inc
> @@ -0,0 +1,49 @@
> +SUMMARY =3D "Linux dynamic kernel patching infrastructure"
> +DESCRIPTION =3D "kpatch is a Linux dynamic kernel patching infrastruct=
ure which allows you to patch a running kernel without rebooting or resta=
rting any processes."
> +LICENSE =3D "GPLv2 & LGPLv2"
> +DEPENDS =3D "elfutils bash"
> +
> +SRC_URI =3D "git://github.com/dynup/kpatch.git;protocol=3Dhttps \
> +	file://0001-kpatch-build-add-cross-compilation-support.patch \
> +	file://0002-kpatch-build-allow-overriding-of-distro-name.patch \
> +	"
> +
> +EXTRA_OEMAKE =3D " \
> +	PREFIX=3D${prefix} \
> +	BINDIR=3D${D}${bindir} \
> +	SBINDIR=3D${D}${sbindir} \
> +	LIBDIR=3D${D}${libdir} \
> +	MANDIR=3D${D}${mandir}/man1 \
> +	SYSTEMDDIR=3D${D}${systemd_system_unitdir} \
> +	DESTDIR=3D${D} \
> +	BUILDMOD=3Dno \
> +	CC=3D'${CC}' \
> +	"
> +
> +S =3D "${WORKDIR}/git"
> +
> +do_install () {
> +	oe_runmake install
> +}
> +
> +PACKAGES =3D+ "kpatch-build"
> +PROVIDES +=3D "kpatch-build"
> +
> +COMPATIBLE_HOST =3D "(x86_64).*-linux"
> +
> +RDEPENDS_${PN} =3D "bash binutils"
> +RDEPENDS_kpatch-build =3D "bash glibc-utils"
> +
> +FILES_${PN} =3D " \
> +	${sbindir}/kpatch \
> +	${systemd_system_unitdir}/kpatch.service \
> +	${mandir}/man1/kpatch.1.gz \
> +	"
> +FILES_kpatch-build =3D " \
> +	${bindir}/kpatch-build \
> +	${libexecdir}/* \
> +	${datadir}/kpatch \
> +	${mandir}/man1/kpatch-build.1.gz \
> +	"
> +
> +SYSTEMD_SERVICE_${PN} =3D "kpatch.service"
> diff --git a/meta-oe/recipes-kernel/kpatch/kpatch/0001-kpatch-build-add=
-cross-compilation-support.patch b/meta-oe/recipes-kernel/kpatch/kpatch/0=
001-kpatch-build-add-cross-compilation-support.patch
> new file mode 100644
> index 0000000..459fb21
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/kpatch/kpatch/0001-kpatch-build-add-cross-=
compilation-support.patch
> @@ -0,0 +1,103 @@
> +From a9a80a1f4df65892a0269295ce8a64b06f2ff61d Mon Sep 17 00:00:00 2001=

> +From: Ruslan Bilovol <rbilovol@cisco.com>
> +Date: Tue, 19 Dec 2017 15:59:04 +0200
> +Subject: [PATCH] kpatch-build: add cross-compilation support
> +
> +This patch introduces new option for kpatch-build
> +script "--cross-compile" which can be used for
> +specifying cross-complier prefix.
> +It allows to build live patches not only on
> +target system, but also on hosts for a target other
> +than the one on which the compiler is running
> +
> +Also removed quotes in exec lines, so it is
> +possible to pass multy-component strings like
> +"ccache x86_64-xelinux-linux-" as cross-compiler
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
> +---
> + kpatch-build/kpatch-build | 13 +++++++++++--
> + kpatch-build/kpatch-gcc   |  4 ++--
> + 2 files changed, 13 insertions(+), 4 deletions(-)
> +
> +diff --git a/kpatch-build/kpatch-build b/kpatch-build/kpatch-build
> +index 166ecbd..af24cc4 100755
> +--- a/kpatch-build/kpatch-build
> ++++ b/kpatch-build/kpatch-build
> +@@ -195,7 +195,7 @@ gcc_version_check() {
> + 	# gcc --version varies between distributions therefore extract versi=
on
> + 	# by compiling a test file and compare it to vmlinux's version.
> + 	echo 'void main(void) {}' > "$c"
> +-	out=3D"$(gcc -c -pg -ffunction-sections -o "$o" "$c" 2>&1)"
> ++	out=3D"$(${KPATCH_CROSS_COMPILE}gcc -c -pg -ffunction-sections -o "$=
o" "$c" 2>&1)"
> + 	gccver=3D"$(gcc_version_from_file "$o")"
> + 	kgccver=3D"$(gcc_version_from_file "$VMLINUX")"
> + 	rm -f "$c" "$o"
> +@@ -381,12 +381,14 @@ usage() {
> + 	echo "		-d, --debug        Enable 'xtrace' and keep scratch files" >=
&2
> + 	echo "		                   in <CACHEDIR>/tmp" >&2
> + 	echo "		                   (can be specified multiple times)" >&2
> ++	echo "		--cross-compile    Specify the prefix used for all executabl=
es" >&2
> ++	echo "		                   used during compilation" >&2
> + 	echo "		--skip-cleanup     Skip post-build cleanup" >&2
> + 	echo "		--skip-gcc-check   Skip gcc version matching check" >&2
> + 	echo "		                   (not recommended)" >&2
> + }
> +=20
> +-options=3D"$(getopt -o ha:r:s:c:v:j:t:n:o:d -l "help,archversion:,sou=
rcerpm:,sourcedir:,config:,vmlinux:,jobs:,target:,name:,output:,debug,ski=
p-gcc-check,skip-cleanup" -- "$@")" || die "getopt failed"
> ++options=3D"$(getopt -o ha:r:s:c:v:j:t:n:o:d -l "help,archversion:,sou=
rcerpm:,sourcedir:,config:,vmlinux:,jobs:,target:,name:,output:,debug,cro=
ss-compile:,skip-gcc-check,skip-cleanup" -- "$@")" || die "getopt failed"=

> +=20
> + eval set -- "$options"
> +=20
> +@@ -444,6 +446,10 @@ while [[ $# -gt 0 ]]; do
> + 			echo "DEBUG mode enabled"
> + 		fi
> + 		;;
> ++	--cross-compile)
> ++		KPATCH_CROSS_COMPILE=3D"$2"
> ++		shift
> ++		;;
> + 	--skip-cleanup)
> + 		echo "Skipping cleanup"
> + 		SKIPCLEANUP=3D1
> +@@ -691,6 +697,8 @@ if [[ $DEBUG -ge 4 ]]; then
> + 	export KPATCH_GCC_DEBUG=3D1
> + fi
> +=20
> ++export KPATCH_CROSS_COMPILE
> ++
> + echo "Building original kernel"
> + ./scripts/setlocalversion --save-scmversion || die
> + make mrproper 2>&1 | logger || die
> +@@ -840,6 +848,7 @@ cd "$TEMPDIR/patch" || die
> + KPATCH_BUILD=3D"$SRCDIR" KPATCH_NAME=3D"$MODNAME" \
> + KBUILD_EXTRA_SYMBOLS=3D"$KBUILD_EXTRA_SYMBOLS" \
> + KPATCH_LDFLAGS=3D"$KPATCH_LDFLAGS" \
> ++CROSS_COMPILE=3D"$KPATCH_CROSS_COMPILE" \
> + 	make 2>&1 | logger || die
> +=20
> + if ! "$KPATCH_MODULE"; then
> +diff --git a/kpatch-build/kpatch-gcc b/kpatch-build/kpatch-gcc
> +index 6ba133c..3937948 100755
> +--- a/kpatch-build/kpatch-gcc
> ++++ b/kpatch-build/kpatch-gcc
> +@@ -8,7 +8,7 @@ TOOLCHAINCMD=3D"$1"
> + shift
> +=20
> + if [[ -z "$KPATCH_GCC_TEMPDIR" ]]; then
> +-	exec "$TOOLCHAINCMD" "$@"
> ++	exec ${KPATCH_CROSS_COMPILE}${TOOLCHAINCMD} "$@"
> + fi
> +=20
> + declare -a args=3D("$@")
> +@@ -80,4 +80,4 @@ elif [[ "$TOOLCHAINCMD" =3D "ld" ]] ; then
> + 	done
> + fi
> +=20
> +-exec "$TOOLCHAINCMD" "${args[@]}"
> ++exec ${KPATCH_CROSS_COMPILE}${TOOLCHAINCMD} "${args[@]}"
> +--=20
> +1.9.1
> +
> diff --git a/meta-oe/recipes-kernel/kpatch/kpatch/0002-kpatch-build-all=
ow-overriding-of-distro-name.patch b/meta-oe/recipes-kernel/kpatch/kpatch=
/0002-kpatch-build-allow-overriding-of-distro-name.patch
> new file mode 100644
> index 0000000..a9d8a7f
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/kpatch/kpatch/0002-kpatch-build-allow-over=
riding-of-distro-name.patch
> @@ -0,0 +1,62 @@
> +From d418d716dae1e2a05131dfb42a19a4da2fc8a85d Mon Sep 17 00:00:00 2001=

> +From: Ruslan Bilovol <rbilovol@cisco.com>
> +Date: Tue, 2 Jan 2018 14:50:03 +0200
> +Subject: [PATCH] kpatch-build: allow overriding of distro name
> +
> +It is sometimes useful to have ability to override
> +distro name, for example during cross-compilation
> +build when livepatch modules will be ran on the
> +target which differs from host.
> +
> +This patch adds a new --distro option which
> +implements all needed functionality
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
> +---
> + kpatch-build/kpatch-build | 9 +++++++--
> + 1 file changed, 7 insertions(+), 2 deletions(-)
> +
> +diff --git a/kpatch-build/kpatch-build b/kpatch-build/kpatch-build
> +index af24cc4..4f9f78d 100755
> +--- a/kpatch-build/kpatch-build
> ++++ b/kpatch-build/kpatch-build
> +@@ -383,12 +383,13 @@ usage() {
> + 	echo "		                   (can be specified multiple times)" >&2
> + 	echo "		--cross-compile    Specify the prefix used for all executabl=
es" >&2
> + 	echo "		                   used during compilation" >&2
> ++	echo "		--distro           Override distro name" >&2
> + 	echo "		--skip-cleanup     Skip post-build cleanup" >&2
> + 	echo "		--skip-gcc-check   Skip gcc version matching check" >&2
> + 	echo "		                   (not recommended)" >&2
> + }
> +=20
> +-options=3D"$(getopt -o ha:r:s:c:v:j:t:n:o:d -l "help,archversion:,sou=
rcerpm:,sourcedir:,config:,vmlinux:,jobs:,target:,name:,output:,debug,cro=
ss-compile:,skip-gcc-check,skip-cleanup" -- "$@")" || die "getopt failed"=

> ++options=3D"$(getopt -o ha:r:s:c:v:j:t:n:o:d -l "help,archversion:,sou=
rcerpm:,sourcedir:,config:,vmlinux:,jobs:,target:,name:,output:,debug,cro=
ss-compile:,distro:,skip-gcc-check,skip-cleanup" -- "$@")" || die "getopt=
 failed"
> +=20
> + eval set -- "$options"
> +=20
> +@@ -450,6 +451,10 @@ while [[ $# -gt 0 ]]; do
> + 		KPATCH_CROSS_COMPILE=3D"$2"
> + 		shift
> + 		;;
> ++	--distro)
> ++		DISTRO=3D"$2"
> ++		shift
> ++		;;
> + 	--skip-cleanup)
> + 		echo "Skipping cleanup"
> + 		SKIPCLEANUP=3D1
> +@@ -526,7 +531,7 @@ fi
> + # Don't check external file.
> + # shellcheck disable=3DSC1091
> + source /etc/os-release
> +-DISTRO=3D"$ID"
> ++DISTRO=3D"${DISTRO:-${ID}}"
> + if [[ "$DISTRO" =3D fedora ]] || [[ "$DISTRO" =3D rhel ]] || [[ "$DIS=
TRO" =3D ol ]] || [[ "$DISTRO" =3D centos ]]; then
> + 	[[ -z "$VMLINUX" ]] && VMLINUX=3D"/usr/lib/debug/lib/modules/$ARCHVE=
RSION/vmlinux"
> + 	[[ -e "$VMLINUX" ]] || die "kernel-debuginfo-$ARCHVERSION not instal=
led"
> +--=20
> +1.9.1
> +
> diff --git a/meta-oe/recipes-kernel/kpatch/kpatch_git.bb b/meta-oe/reci=
pes-kernel/kpatch/kpatch_git.bb
> new file mode 100644
> index 0000000..e495e28
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/kpatch/kpatch_git.bb
> @@ -0,0 +1,11 @@
> +require kpatch.inc
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4=
a4263"
> +
> +SRCREV =3D "db6efbb8c7e90d2b761272cf563047119072768f"
> +
> +PV =3D "0.5.0+git${SRCPV}"
> +
> +S =3D "${WORKDIR}/git"
> +
> +BBCLASSEXTEND =3D "native nativesdk"



