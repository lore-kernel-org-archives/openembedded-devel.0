Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id D9DA971B1D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Feb 2018 03:08:33 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id j19so399264pll.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Feb 2018 19:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=+G0auvfiHG9dtZlXAnHqFqjjurVJhkqM+j3TCrRQO4Q=;
	b=AT2HGEUxeuBXg5twVkcYF3EViwqXratoX1KedOSTuRnkBh6fQ6vnWdUdpOVrUzltp/
	bJOtUAb6U4Ort4ASpxaO8NEljB10DNPo5U2sz3I6Wn/X7tDE1k/kdfnaSJtCuSCpWX/F
	iKk6bWDZsLoUnifVKLWBvjUzM7nTQXKrjtk2WiE3vWhNB8hVuEfkDyn8kD0hYH8wi0fC
	M4PNeolrgqfzfndKu+D+JmT/hEvV/9LxZpbhZmMO6sebt1bioIZruin/IxckIGAz41QE
	9NmK58CQSFqrcVT6pOXINn8X7o41EwJlQbn0AcYvj9upbHIzkcYMoR0Yd3eMuKT25ylQ
	WWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=+G0auvfiHG9dtZlXAnHqFqjjurVJhkqM+j3TCrRQO4Q=;
	b=lOqOYleBhvhzUIr0dJXnmdkCiYKeLGegV48vmPvQZXKQwmzLPZX+qrgXAavOGYxniL
	Ssnxfb30SCo1kpBDWZWOHusLkfY1rnl3N45K2Sc5fLERq0+HufMFrmgAbFjL6pv6WLkh
	Qhq9M77jNJxHCxWNo2SjlFN5Hm7q5RAtnREVixzurYMdsXSFU6qRxRvJvxHT/5emMX6F
	VPspXICR0nSScnluBHR8XQbJMsfjTdCuUaOtAWgfUab50crBp7QeOkpMkgdcTHedjic8
	2wMTDzQZLK3h9/lCCWJ6Y8Bux2VWniSxdTc3c1/CcTHU8jgigu4tFqElmrkGcWtM8ltr
	rKIw==
X-Gm-Message-State: APf1xPCJFnkSunJcM0cRMG0jS9RyBnb9ovjQ0Rb3hofiSLGMz0tMAxTF
	jM12l1QYbd2uYaIm7AQkFdQVtg==
X-Google-Smtp-Source: AH8x2275RBHAw0TU+87Db5sAKpzwMUzNj6gtyblW6fQOtjIoAb7mfxF5qmvtWCrZvWsP8AN8fBg2kg==
X-Received: by 2002:a17:902:4083:: with SMTP id
	c3-v6mr924582pld.90.1517886514554; 
	Mon, 05 Feb 2018 19:08:34 -0800 (PST)
Received: from [10.5.7.147] ([223.196.115.131])
	by smtp.gmail.com with ESMTPSA id r13sm557369pgq.25.2018.02.05.19.08.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Feb 2018 19:08:33 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1517502858-19348-1-git-send-email-rbilovol@cisco.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <02d75f81-71b3-c745-50a7-c77c3e18e7d2@gmail.com>
Date: Tue, 6 Feb 2018 08:38:31 +0530
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
X-List-Received-Date: Tue, 06 Feb 2018 03:08:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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

My bad. Had my system mis configured.

- armin
> ---
>
> v2: no code changes, moved from oe-core to meta-oe
> v1: http://lists.openembedded.org/pipermail/openembedded-core/2018-January/146913.html
>
>  meta-oe/recipes-kernel/kpatch/kpatch.inc           |  49 ++++++++++
>  ...patch-build-add-cross-compilation-support.patch | 103 +++++++++++++++++++++
>  ...tch-build-allow-overriding-of-distro-name.patch |  62 +++++++++++++
>  meta-oe/recipes-kernel/kpatch/kpatch_git.bb        |  11 +++
>  4 files changed, 225 insertions(+)
>  create mode 100644 meta-oe/recipes-kernel/kpatch/kpatch.inc
>  create mode 100644 meta-oe/recipes-kernel/kpatch/kpatch/0001-kpatch-build-add-cross-compilation-support.patch
>  create mode 100644 meta-oe/recipes-kernel/kpatch/kpatch/0002-kpatch-build-allow-overriding-of-distro-name.patch
>  create mode 100644 meta-oe/recipes-kernel/kpatch/kpatch_git.bb
>
> diff --git a/meta-oe/recipes-kernel/kpatch/kpatch.inc b/meta-oe/recipes-kernel/kpatch/kpatch.inc
> new file mode 100644
> index 0000000..b1e73e9
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/kpatch/kpatch.inc
> @@ -0,0 +1,49 @@
> +SUMMARY = "Linux dynamic kernel patching infrastructure"
> +DESCRIPTION = "kpatch is a Linux dynamic kernel patching infrastructure which allows you to patch a running kernel without rebooting or restarting any processes."
> +LICENSE = "GPLv2 & LGPLv2"
> +DEPENDS = "elfutils bash"
> +
> +SRC_URI = "git://github.com/dynup/kpatch.git;protocol=https \
> +	file://0001-kpatch-build-add-cross-compilation-support.patch \
> +	file://0002-kpatch-build-allow-overriding-of-distro-name.patch \
> +	"
> +
> +EXTRA_OEMAKE = " \
> +	PREFIX=${prefix} \
> +	BINDIR=${D}${bindir} \
> +	SBINDIR=${D}${sbindir} \
> +	LIBDIR=${D}${libdir} \
> +	MANDIR=${D}${mandir}/man1 \
> +	SYSTEMDDIR=${D}${systemd_system_unitdir} \
> +	DESTDIR=${D} \
> +	BUILDMOD=no \
> +	CC='${CC}' \
> +	"
> +
> +S = "${WORKDIR}/git"
> +
> +do_install () {
> +	oe_runmake install
> +}
> +
> +PACKAGES =+ "kpatch-build"
> +PROVIDES += "kpatch-build"
> +
> +COMPATIBLE_HOST = "(x86_64).*-linux"
> +
> +RDEPENDS_${PN} = "bash binutils"
> +RDEPENDS_kpatch-build = "bash glibc-utils"
> +
> +FILES_${PN} = " \
> +	${sbindir}/kpatch \
> +	${systemd_system_unitdir}/kpatch.service \
> +	${mandir}/man1/kpatch.1.gz \
> +	"
> +FILES_kpatch-build = " \
> +	${bindir}/kpatch-build \
> +	${libexecdir}/* \
> +	${datadir}/kpatch \
> +	${mandir}/man1/kpatch-build.1.gz \
> +	"
> +
> +SYSTEMD_SERVICE_${PN} = "kpatch.service"
> diff --git a/meta-oe/recipes-kernel/kpatch/kpatch/0001-kpatch-build-add-cross-compilation-support.patch b/meta-oe/recipes-kernel/kpatch/kpatch/0001-kpatch-build-add-cross-compilation-support.patch
> new file mode 100644
> index 0000000..459fb21
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/kpatch/kpatch/0001-kpatch-build-add-cross-compilation-support.patch
> @@ -0,0 +1,103 @@
> +From a9a80a1f4df65892a0269295ce8a64b06f2ff61d Mon Sep 17 00:00:00 2001
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
> + 	# gcc --version varies between distributions therefore extract version
> + 	# by compiling a test file and compare it to vmlinux's version.
> + 	echo 'void main(void) {}' > "$c"
> +-	out="$(gcc -c -pg -ffunction-sections -o "$o" "$c" 2>&1)"
> ++	out="$(${KPATCH_CROSS_COMPILE}gcc -c -pg -ffunction-sections -o "$o" "$c" 2>&1)"
> + 	gccver="$(gcc_version_from_file "$o")"
> + 	kgccver="$(gcc_version_from_file "$VMLINUX")"
> + 	rm -f "$c" "$o"
> +@@ -381,12 +381,14 @@ usage() {
> + 	echo "		-d, --debug        Enable 'xtrace' and keep scratch files" >&2
> + 	echo "		                   in <CACHEDIR>/tmp" >&2
> + 	echo "		                   (can be specified multiple times)" >&2
> ++	echo "		--cross-compile    Specify the prefix used for all executables" >&2
> ++	echo "		                   used during compilation" >&2
> + 	echo "		--skip-cleanup     Skip post-build cleanup" >&2
> + 	echo "		--skip-gcc-check   Skip gcc version matching check" >&2
> + 	echo "		                   (not recommended)" >&2
> + }
> + 
> +-options="$(getopt -o ha:r:s:c:v:j:t:n:o:d -l "help,archversion:,sourcerpm:,sourcedir:,config:,vmlinux:,jobs:,target:,name:,output:,debug,skip-gcc-check,skip-cleanup" -- "$@")" || die "getopt failed"
> ++options="$(getopt -o ha:r:s:c:v:j:t:n:o:d -l "help,archversion:,sourcerpm:,sourcedir:,config:,vmlinux:,jobs:,target:,name:,output:,debug,cross-compile:,skip-gcc-check,skip-cleanup" -- "$@")" || die "getopt failed"
> + 
> + eval set -- "$options"
> + 
> +@@ -444,6 +446,10 @@ while [[ $# -gt 0 ]]; do
> + 			echo "DEBUG mode enabled"
> + 		fi
> + 		;;
> ++	--cross-compile)
> ++		KPATCH_CROSS_COMPILE="$2"
> ++		shift
> ++		;;
> + 	--skip-cleanup)
> + 		echo "Skipping cleanup"
> + 		SKIPCLEANUP=1
> +@@ -691,6 +697,8 @@ if [[ $DEBUG -ge 4 ]]; then
> + 	export KPATCH_GCC_DEBUG=1
> + fi
> + 
> ++export KPATCH_CROSS_COMPILE
> ++
> + echo "Building original kernel"
> + ./scripts/setlocalversion --save-scmversion || die
> + make mrproper 2>&1 | logger || die
> +@@ -840,6 +848,7 @@ cd "$TEMPDIR/patch" || die
> + KPATCH_BUILD="$SRCDIR" KPATCH_NAME="$MODNAME" \
> + KBUILD_EXTRA_SYMBOLS="$KBUILD_EXTRA_SYMBOLS" \
> + KPATCH_LDFLAGS="$KPATCH_LDFLAGS" \
> ++CROSS_COMPILE="$KPATCH_CROSS_COMPILE" \
> + 	make 2>&1 | logger || die
> + 
> + if ! "$KPATCH_MODULE"; then
> +diff --git a/kpatch-build/kpatch-gcc b/kpatch-build/kpatch-gcc
> +index 6ba133c..3937948 100755
> +--- a/kpatch-build/kpatch-gcc
> ++++ b/kpatch-build/kpatch-gcc
> +@@ -8,7 +8,7 @@ TOOLCHAINCMD="$1"
> + shift
> + 
> + if [[ -z "$KPATCH_GCC_TEMPDIR" ]]; then
> +-	exec "$TOOLCHAINCMD" "$@"
> ++	exec ${KPATCH_CROSS_COMPILE}${TOOLCHAINCMD} "$@"
> + fi
> + 
> + declare -a args=("$@")
> +@@ -80,4 +80,4 @@ elif [[ "$TOOLCHAINCMD" = "ld" ]] ; then
> + 	done
> + fi
> + 
> +-exec "$TOOLCHAINCMD" "${args[@]}"
> ++exec ${KPATCH_CROSS_COMPILE}${TOOLCHAINCMD} "${args[@]}"
> +-- 
> +1.9.1
> +
> diff --git a/meta-oe/recipes-kernel/kpatch/kpatch/0002-kpatch-build-allow-overriding-of-distro-name.patch b/meta-oe/recipes-kernel/kpatch/kpatch/0002-kpatch-build-allow-overriding-of-distro-name.patch
> new file mode 100644
> index 0000000..a9d8a7f
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/kpatch/kpatch/0002-kpatch-build-allow-overriding-of-distro-name.patch
> @@ -0,0 +1,62 @@
> +From d418d716dae1e2a05131dfb42a19a4da2fc8a85d Mon Sep 17 00:00:00 2001
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
> + 	echo "		--cross-compile    Specify the prefix used for all executables" >&2
> + 	echo "		                   used during compilation" >&2
> ++	echo "		--distro           Override distro name" >&2
> + 	echo "		--skip-cleanup     Skip post-build cleanup" >&2
> + 	echo "		--skip-gcc-check   Skip gcc version matching check" >&2
> + 	echo "		                   (not recommended)" >&2
> + }
> + 
> +-options="$(getopt -o ha:r:s:c:v:j:t:n:o:d -l "help,archversion:,sourcerpm:,sourcedir:,config:,vmlinux:,jobs:,target:,name:,output:,debug,cross-compile:,skip-gcc-check,skip-cleanup" -- "$@")" || die "getopt failed"
> ++options="$(getopt -o ha:r:s:c:v:j:t:n:o:d -l "help,archversion:,sourcerpm:,sourcedir:,config:,vmlinux:,jobs:,target:,name:,output:,debug,cross-compile:,distro:,skip-gcc-check,skip-cleanup" -- "$@")" || die "getopt failed"
> + 
> + eval set -- "$options"
> + 
> +@@ -450,6 +451,10 @@ while [[ $# -gt 0 ]]; do
> + 		KPATCH_CROSS_COMPILE="$2"
> + 		shift
> + 		;;
> ++	--distro)
> ++		DISTRO="$2"
> ++		shift
> ++		;;
> + 	--skip-cleanup)
> + 		echo "Skipping cleanup"
> + 		SKIPCLEANUP=1
> +@@ -526,7 +531,7 @@ fi
> + # Don't check external file.
> + # shellcheck disable=SC1091
> + source /etc/os-release
> +-DISTRO="$ID"
> ++DISTRO="${DISTRO:-${ID}}"
> + if [[ "$DISTRO" = fedora ]] || [[ "$DISTRO" = rhel ]] || [[ "$DISTRO" = ol ]] || [[ "$DISTRO" = centos ]]; then
> + 	[[ -z "$VMLINUX" ]] && VMLINUX="/usr/lib/debug/lib/modules/$ARCHVERSION/vmlinux"
> + 	[[ -e "$VMLINUX" ]] || die "kernel-debuginfo-$ARCHVERSION not installed"
> +-- 
> +1.9.1
> +
> diff --git a/meta-oe/recipes-kernel/kpatch/kpatch_git.bb b/meta-oe/recipes-kernel/kpatch/kpatch_git.bb
> new file mode 100644
> index 0000000..e495e28
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/kpatch/kpatch_git.bb
> @@ -0,0 +1,11 @@
> +require kpatch.inc
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +SRCREV = "db6efbb8c7e90d2b761272cf563047119072768f"
> +
> +PV = "0.5.0+git${SRCPV}"
> +
> +S = "${WORKDIR}/git"
> +
> +BBCLASSEXTEND = "native nativesdk"


