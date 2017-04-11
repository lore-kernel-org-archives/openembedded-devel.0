Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id D2BFD77D00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Apr 2017 21:18:07 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id o81so2804527wmb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Apr 2017 14:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ADmPBjpoQLRl0iCv+lV3vfqpyhJeWvl1Acs7cSXjIvw=;
	b=a788uzzN1Xzr2o9PjhUxVqEvkO5y0w0LNUkea4bezeFDb3c91g1p9Zr0hXUOzSzqdT
	YO8hmQ1b3sE0LiIgUsjLaLgb2CT23I8ua1DWhrF5g0gjFghtIMcyX8r020ZDHwu7Sl8O
	XAQoSRqOiJOJ6PEQG7EV9oEWPnPBg89Aezyo14bldQ8UH9p1tmIKlp79R/7bOnFjeFDO
	DUW5IPascQqlfprHsPS1VmbqG4iVG/30Fc1LkpWhb0CmNOndEJ4gaViRA5qIjyydTm1G
	X4fn+44pQeEdu/aSrvtehvObbhbu5lGtgzLWQ3fcGa2v+Fe2ikGpvL3xOZ3zmRdWthr8
	Ch9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ADmPBjpoQLRl0iCv+lV3vfqpyhJeWvl1Acs7cSXjIvw=;
	b=gy+NopgvqIXehXTPhS0cjXsLPX8XaGZ3snpQNGTGFS2jxcR3qPTEdkgJ2jZwiFT8X3
	1mPAXQj91znIryKjcFlrpcRSO07GGUN0hmccuWQVDIA7cVGjpiAiYIU6H+OpreitVn52
	Z9SrmH8KHGAJLAZZrALMW+3UyPyrkPe/p8OC76FNYQILkggLDrHG3y7vQn9KIzGBVQWa
	lbxo2kAFZqlEWwJtBepZdElivxhFZevkRB+17ZbG8IeThoip9cVC7X0yo8FY92sHRnoG
	EngeqR1Ax/JKqW5qw1dDrRtewUVfgNl2tHUXfXkz+J7Edi9RzUMr/kC71GlxwdjeM3zq
	vr1w==
X-Gm-Message-State: AN3rC/7IrV2hJtN1W1MZMZXknOtxSl6j6nEo0YFxAr2t85aB6kajWkpC
	uRYbzMN+puzmkTi/M1X8jkG49I3H2g==
X-Received: by 10.28.153.140 with SMTP id b134mr16149064wme.124.1491945488438; 
	Tue, 11 Apr 2017 14:18:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.148.54 with HTTP; Tue, 11 Apr 2017 14:18:07 -0700 (PDT)
In-Reply-To: <a50d975def43c43f49936d9638369585@agner.ch>
References: <1491165189-7839-1-git-send-email-stefan@agner.ch>
	<CA+chaQciaE02KqyA6LT6CmzBcqDuke+iL5ThpUdiCpY94T8B_A@mail.gmail.com>
	<a50d975def43c43f49936d9638369585@agner.ch>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 11 Apr 2017 23:18:07 +0200
Message-ID: <CA+chaQfG1kKovNSDxTskkE4kJiqWbKQhpeM5NG2w0n9FfHiaWQ@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] wireguard: add WireGuard kernel module and tools
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
X-List-Received-Date: Tue, 11 Apr 2017 21:18:08 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

you don't need to build anything for qemux86copy just use
sstate-diff-machines.sh script from oe-core to compare sstate signatures.

You can see some SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS examples in:
http://git.openembedded.org/meta-openembedded/tree/meta-oe/conf/layer.conf
http://git.openembedded.org/openembedded-core/tree/meta/conf/layer.conf

I cannot check it now, but my guess is that ufw issue wasn't detected in my
jenkins jobs, because it has:

REQUIRED_DISTRO_FEATURES = "ipv6"


and nodistro config probably doesn't have ipv6 in DISTRO_FEATURES.


On Tue, Apr 11, 2017 at 11:04 PM, Stefan Agner <stefan@agner.ch> wrote:

> Hi Martin,
>
>
>
> I tried to reproduce your findings, unfortunately building qemux86copy
> fails for me with this:
>
> Parsing recipes: 100% |#############################
> #########################################################################|
> Time: 0:00:20
> Parsing of 1865 .bb files complete (0 cached, 1865 parsed). 2607 targets,
> 168 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION = "1.33.4"
> BUILD_SYS = "x86_64-linux"
> NATIVELSBSTRING = "ubuntu-16.04"
> TARGET_SYS = "i586-oe-linux"
> MACHINE = "qemux86copy"
> DISTRO = "nodistro"
> DISTRO_VERSION = "nodistro.0"
> TUNE_FEATURES = "m32 i586"
> TARGET_FPU = ""
> meta = "master:210c518ba8f8d6ec6e9d34e0df8b963a3b2e0593"
> meta-oe
> meta-python
> meta-networking = "master-next:c323b775e45e48c70ffe841a6b7addbd39183980"
> meta-selftest = "master:210c518ba8f8d6ec6e9d34e0df8b963a3b2e0593"
>
> Initialising tasks: 100% |#############################
> ######################################################################|
> Time: 0:00:00
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> WARNING: linux-yocto-4.10.5+gitAUTOINC+01f18cba44_53be19cad6-r0
> do_kernel_configcheck: [kernel config]: specified values did not make it int
> o the kernel's final configuration:
>
> ---------- CONFIG_AEABI -----------------
> Config: CONFIG_AEABI
> From: /build/ags/oe-core/build/tmp-glibc/work-shared/qemux86copy/
> kernel-source/.kernel-meta/configs/standard/arch/arm/arm.cfg
> Requested value: CONFIG_AEABI=y
> Actual value:
>
>
>
> ....
>
> | WRAP arch/x86/include/generated/asm/mm-arch-hooks.h
> | WRAP arch/x86/include/generated/asm/early_ioremap.h
> | WRAP arch/x86/include/generated/asm/mcs_spinlock.h
> | CHK include/generated/uapi/linux/version.h
> | UPD include/generated/uapi/linux/version.h
> | CHK include/generated/utsrelease.h
> | UPD include/generated/utsrelease.h
> | HOSTCC scripts/kallsyms
> | HOSTCC scripts/conmakehash
> | HOSTCC scripts/recordmcount
> | HOSTCC scripts/sortextable
> | CC scripts/mod/empty.o
> | HOSTCC scripts/mod/mk_elfconfig
> | /build/ags/oe-core/build/tmp-glibc/work-shared/qemux86copy/
> kernel-source/scripts/mod/empty.c:1:0: error: code model 'kernel' not
> supported in the 32 bit mode
> | /* empty file to figure out endianness / word size */
> |
> | /build/ags/oe-core/build/tmp-glibc/work-shared/qemux86copy/
> kernel-source/scripts/mod/empty.c:1:0: sorry, unimplemented: 64-bit mode
> not compiled in
> | /build/ags/oe-core/build/tmp-glibc/work-shared/qemux86copy/
> kernel-source/scripts/Makefile.build:294: recipe for target
> 'scripts/mod/empty.o' failed
> | make[4]: *** [scripts/mod/empty.o] Error 1
> | make[4]: *** Waiting for unfinished jobs....
> | /build/ags/oe-core/build/tmp-glibc/work-shared/qemux86copy/
> kernel-source/scripts/Makefile.build:553: recipe for target 'scripts/mod'
> failed
> | make[3]: *** [scripts/mod] Error 2
> | make[3]: *** Waiting for unfinished jobs....
> | /build/ags/oe-core/build/tmp-glibc/work-shared/qemux86copy/kernel-source/Makefile:560:
> recipe for target 'scripts' failed
> | make[2]: *** [scripts] Error 2
> | make[2]: *** Waiting for unfinished jobs....
> | Makefile:150: recipe for target 'sub-make' failed
> | make[1]: *** [sub-make] Error 2
> | Makefile:24: recipe for target '__sub-make' failed
> | make: *** [__sub-make] Error 2
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at
> /build/ags/oe-core/build/tmp-glibc/work/qemux86copy-oe-
> linux/linux-yocto/4.10.5+gitAUTOINC+01f18cba44_53be19cad6-r0/temp/log.do_
> compile.29158)
>
>
>
> What is going on here? Somehow OE tries to configure the kernel for arm?!
> The qemux86 machine built just fine, not sure what difference causes this
> error when building the qemux86copy machine.
>
>
>
> Sorry, I did do not understand how I can "remove this dependency from
> sstate signature in layer.conf", do you have any hints how to do this?
>
> Also, meta-networking/recipes-connectivity/ufw/ufw_0.33.bb seems to me to
> do pretty much the same as I do, shouldn't have that the same issue?
>
>
>
> Best regards,
>
> Stefan
>
>
>
>
>
>
>
> On 2017-04-06 00:29, Martin Jansa wrote:
>
> TUNE_PKGARCH package cannot depend on MACHINE_ARCH module unless you
> remove this dependency from sstate signature in layer.conf
>
>
>
> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signatures.20170405_114645.log/
>     * ERROR: 3 issues were found in these recipes: wireguard-tools
>
>     * ERROR: 1 errors found in signatures.qemux86.do_configure.sigdata.log
>     * ERROR: 1 errors found in signatures.qemux86.do_populate_sysroot.sigdata.log
>     * ERROR: 1 errors found in signatures.qemux86.do_package_write_ipk.sigdata.log
>
>     * ERROR: wireguard-tools different signature for task do_configure.sigdata between qemux86copy and qemux86
>     * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-diff/1491428805/signatures.qemux86.do_configure.sigdata.log
>     * ERROR: wireguard-tools different signature for task do_populate_sysroot.sigdata between qemux86copy and qemux86
>     * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-diff/1491428805/signatures.qemux86.do_populate_sysroot.sigdata.log
>     * ERROR: wireguard-tools different signature for task do_package_write_ipk.sigdata between qemux86copy and qemux86
>     * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-diff/1491428805/signatures.qemux86.do_package_write_ipk.sigdata.log
>     * ERROR: 3 issues were found in these recipes: wireguard-tools
>
>
> On Sun, Apr 2, 2017 at 10:33 PM, Stefan Agner <stefan@agner.ch> wrote:
>
>> WireGuard is an extremely simple yet fast and modern VPN that utilizes
>> state-of-the-art cryptography. It aims to be faster, simpler, leaner,
>> and more useful than IPSec, while avoiding the massive headache.
>>
>> The recipes add the current experimental snapshot v0.0.20170324
>> out-of-tree kernel module and tools. The kernel module has some kernel
>> configuration dependencies such as some configuration part of
>> features/netfilter/netfilter.scc, hence netfilter.scc should be part
>> of KERNEL_EXTRA_FEATURES (which is the case by default).
>>
>> Signed-off-by: Stefan Agner <stefan@agner.ch>
>> ---
>>  .../wireguard/wireguard-module_0.0.20170324.bb     |  9 ++++++++
>>  .../wireguard/wireguard-tools_0.0.20170324.bb      | 27
>> ++++++++++++++++++++++
>>  .../recipes-kernel/wireguard/wireguard.inc         | 18 +++++++++++++++
>>  3 files changed, 54 insertions(+)
>>  create mode 100644 meta-networking/recipes-kernel/wireguard/
>> wireguard-module_0.0.20170324.bb
>>  create mode 100644 meta-networking/recipes-kernel/wireguard/
>> wireguard-tools_0.0.20170324.bb
>>  create mode 100644 meta-networking/recipes-kernel
>> /wireguard/wireguard.inc
>>
>> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_
>> 0.0.20170324.bb b/meta-networking/recipes-kernel/wireguard/
>> wireguard-module_0.0.20170324.bb
>> new file mode 100644
>> index 0000000..aeb8269
>> --- /dev/null
>> +++ b/meta-networking/recipes-kernel/wireguard/wireguard-module_
>> 0.0.20170324.bb
>> @@ -0,0 +1,9 @@
>> +require wireguard.inc
>> +
>> +inherit module
>> +
>> +EXTRA_OEMAKE += "KERNELDIR=${STAGING_KERNEL_DIR}"
>> +MAKE_TARGETS = "module"
>> +MODULES_INSTALL_TARGET = "module-install"
>> +
>> +RRECOMMENDS_${PN} = "kernel-module-xt-hashlimit"
>> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_
>> 0.0.20170324.bb b/meta-networking/recipes-kernel/wireguard/
>> wireguard-tools_0.0.20170324.bb
>> new file mode 100644
>> index 0000000..79d420f
>> --- /dev/null
>> +++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_
>> 0.0.20170324.bb
>> @@ -0,0 +1,27 @@
>> +require wireguard.inc
>> +
>> +inherit bash-completion systemd pkgconfig
>> +
>> +DEPENDS = "wireguard-module libmnl"
>> +
>> +do_compile_prepend () {
>> +    cd ${S}/tools
>> +}
>> +
>> +do_install () {
>> +    cd ${S}/tools
>> +    oe_runmake DESTDIR="${D}" PREFIX="${prefix}"
>> SYSCONFDIR="${sysconfdir}" \
>> +        SYSTEMDUNITDIR="${systemd_unitdir}" \
>> +        WITH_SYSTEMDUNITS=${@bb.utils.contains('DISTRO_FEATURES',
>> 'systemd', 'yes', '', d)} \
>> +        WITH_BASHCOMPLETION=yes \
>> +        WITH_WGQUICK=yes \
>> +        install
>> +}
>> +
>> +FILES_${PN} = " \
>> +    ${sysconfdir} \
>> +    ${systemd_unitdir} \
>> +    ${bindir} \
>> +"
>> +
>> +RDEPENDS_${PN} = "wireguard-module"
>> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard.inc
>> b/meta-networking/recipes-kernel/wireguard/wireguard.inc
>> new file mode 100644
>> index 0000000..cec7260
>> --- /dev/null
>> +++ b/meta-networking/recipes-kernel/wireguard/wireguard.inc
>> @@ -0,0 +1,18 @@
>> +SUMMARY = "WireGuard is an extremely simple yet fast and modern VPN"
>> +DESCRIPTION="WireGuard is a secure network tunnel, operating at layer 3,
>> \
>> +implemented as a kernel virtual network interface for Linux, which aims
>> to \
>> +replace both IPsec for most use cases, as well as popular user space
>> and/or \
>> +TLS-based solutions like OpenVPN, while being more secure, more
>> performant, \
>> +and easier to use."
>> +SECTION = "networking"
>> +HOMEPAGE = "https://www.wireguard.io/"
>> +LICENSE = "GPLv2"
>> +
>> +LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4
>> d69f5fce4486a80fdaf4a4263"
>> +
>> +SRC_URI = "https://git.zx2c4.com/WireGuard/snapshot/WireGuard-${PV}.
>> tar.xz"
>> +
>> +SRC_URI[md5sum] = "fead9ae2d7c6729e39f529913584494a"
>> +SRC_URI[sha256sum] = "2ec08a5d74cb3a63576f06d3cae69
>> 5b6b8995acd9665e2fa4da91927b467ca51"
>> +
>> +S = "${WORKDIR}/WireGuard-${PV}/src/"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>
>

