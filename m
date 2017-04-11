Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 8F93C77D01
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Apr 2017 21:05:08 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [178.209.48.103])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 46E685C1B18;
	Tue, 11 Apr 2017 23:04:52 +0200 (CEST)
MIME-Version: 1.0
Date: Tue, 11 Apr 2017 14:04:55 -0700
From: Stefan Agner <stefan@agner.ch>
To: Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <CA+chaQciaE02KqyA6LT6CmzBcqDuke+iL5ThpUdiCpY94T8B_A@mail.gmail.com>
References: <1491165189-7839-1-git-send-email-stefan@agner.ch>
	<CA+chaQciaE02KqyA6LT6CmzBcqDuke+iL5ThpUdiCpY94T8B_A@mail.gmail.com>
Message-ID: <a50d975def43c43f49936d9638369585@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.1.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1491944692; bh=cqssgbHNoW0KqNd5hYJ98jwKlsWKstv80tPJRIm+pTY=;
	h=MIME-Version:Content-Type:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
	b=Qm8uzklsZhyyqr3KqpgujWGLi0QbgqVX/QTY9d1Mkv3A7Ar2xQg5c+v0ABZCRamtixpnLOyxCupqlZWfSREvZJhcdF0w/ma7686b4DCiHQbwWGufV+jvuvk7V98Z3J9lSZDHcbm3GCsZTnrR0/5/AMQ0nYDmBjE8fIAXo9ZZTDE=
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
X-List-Received-Date: Tue, 11 Apr 2017 21:05:10 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

 

Hi Martin, 

I tried to reproduce your findings, unfortunately building qemux86copy
fails for me with this: 

Parsing recipes: 100%
|######################################################################################################|
Time: 0:00:20
Parsing of 1865 .bb files complete (0 cached, 1865 parsed). 2607
targets, 168 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies 

Build Configuration:
BB_VERSION = "1.33.4"
BUILD_SYS = "x86_64-linux"
NATIVELSBSTRING = "ubuntu-16.04"
TARGET_SYS = "i586-oe-linux"
MACHINE = "qemux86copy"
DISTRO = "nodistro"
DISTRO_VERSION = "nodistro.0"
TUNE_FEATURES = "m32 i586"
TARGET_FPU = ""
meta = "master:210c518ba8f8d6ec6e9d34e0df8b963a3b2e0593"
meta-oe 
meta-python 
meta-networking = "master-next:c323b775e45e48c70ffe841a6b7addbd39183980"
meta-selftest = "master:210c518ba8f8d6ec6e9d34e0df8b963a3b2e0593" 

Initialising tasks: 100%
|###################################################################################################|
Time: 0:00:00
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
WARNING: linux-yocto-4.10.5+gitAUTOINC+01f18cba44_53be19cad6-r0
do_kernel_configcheck: [kernel config]: specified values did not make it
int
o the kernel's final configuration: 

---------- CONFIG_AEABI -----------------
Config: CONFIG_AEABI
From:
/build/ags/oe-core/build/tmp-glibc/work-shared/qemux86copy/kernel-source/.kernel-meta/configs/standard/arch/arm/arm.cfg
Requested value: CONFIG_AEABI=y
Actual value: 

.... 

| WRAP arch/x86/include/generated/asm/mm-arch-hooks.h
| WRAP arch/x86/include/generated/asm/early_ioremap.h
| WRAP arch/x86/include/generated/asm/mcs_spinlock.h
| CHK include/generated/uapi/linux/version.h
| UPD include/generated/uapi/linux/version.h
| CHK include/generated/utsrelease.h
| UPD include/generated/utsrelease.h
| HOSTCC scripts/kallsyms
| HOSTCC scripts/conmakehash
| HOSTCC scripts/recordmcount
| HOSTCC scripts/sortextable
| CC scripts/mod/empty.o
| HOSTCC scripts/mod/mk_elfconfig
|
/build/ags/oe-core/build/tmp-glibc/work-shared/qemux86copy/kernel-source/scripts/mod/empty.c:1:0:
error: code model 'kernel' not supported in the 32 bit mode
| /* empty file to figure out endianness / word size */
| 
|
/build/ags/oe-core/build/tmp-glibc/work-shared/qemux86copy/kernel-source/scripts/mod/empty.c:1:0:
sorry, unimplemented: 64-bit mode not compiled in
|
/build/ags/oe-core/build/tmp-glibc/work-shared/qemux86copy/kernel-source/scripts/Makefile.build:294:
recipe for target 'scripts/mod/empty.o' failed
| make[4]: *** [scripts/mod/empty.o] Error 1
| make[4]: *** Waiting for unfinished jobs....
|
/build/ags/oe-core/build/tmp-glibc/work-shared/qemux86copy/kernel-source/scripts/Makefile.build:553:
recipe for target 'scripts/mod' failed
| make[3]: *** [scripts/mod] Error 2
| make[3]: *** Waiting for unfinished jobs....
|
/build/ags/oe-core/build/tmp-glibc/work-shared/qemux86copy/kernel-source/Makefile:560:
recipe for target 'scripts' failed
| make[2]: *** [scripts] Error 2
| make[2]: *** Waiting for unfinished jobs....
| Makefile:150: recipe for target 'sub-make' failed
| make[1]: *** [sub-make] Error 2
| Makefile:24: recipe for target '__sub-make' failed
| make: *** [__sub-make] Error 2
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at
/build/ags/oe-core/build/tmp-glibc/work/qemux86copy-oe-linux/linux-yocto/4.10.5+gitAUTOINC+01f18cba44_53be19cad6-r0/temp/log.do_compile.29158)


What is going on here? Somehow OE tries to configure the kernel for
arm?! The qemux86 machine built just fine, not sure what difference
causes this error when building the qemux86copy machine. 

Sorry, I did do not understand how I can "remove this dependency from
sstate signature in layer.conf", do you have any hints how to do this? 

Also, meta-networking/recipes-connectivity/ufw/ufw_0.33.bb seems to me
to do pretty much the same as I do, shouldn't have that the same issue? 

Best regards, 

Stefan 

On 2017-04-06 00:29, Martin Jansa wrote: 

> TUNE_PKGARCH package cannot depend on MACHINE_ARCH module unless you remove this dependency from sstate signature in layer.conf 
> 
> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signatures.20170405_114645.log/
> * ERROR: 3 issues were found in these recipes: wireguard-tools
> 
> * ERROR: 1 errors found in signatures.qemux86.do_configure.sigdata.log
> * ERROR: 1 errors found in signatures.qemux86.do_populate_sysroot.sigdata.log
> * ERROR: 1 errors found in signatures.qemux86.do_package_write_ipk.sigdata.log
> 
> * ERROR: wireguard-tools different signature for task do_configure.sigdata between qemux86copy and qemux86
> * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-diff/1491428805/signatures.qemux86.do_configure.sigdata.log
> * ERROR: wireguard-tools different signature for task do_populate_sysroot.sigdata between qemux86copy and qemux86
> * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-diff/1491428805/signatures.qemux86.do_populate_sysroot.sigdata.log
> * ERROR: wireguard-tools different signature for task do_package_write_ipk.sigdata between qemux86copy and qemux86
> * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-diff/1491428805/signatures.qemux86.do_package_write_ipk.sigdata.log
> * ERROR: 3 issues were found in these recipes: wireguard-tools
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
>> .../wireguard/wireguard-module_0.0.20170324.bb [1]     |  9 ++++++++
>> .../wireguard/wireguard-tools_0.0.20170324.bb [2]      | 27 ++++++++++++++++++++++
>> .../recipes-kernel/wireguard/wireguard.inc         | 18 +++++++++++++++
>> 3 files changed, 54 insertions(+)
>> create mode 100644 meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170324.bb [1]
>> create mode 100644 meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170324.bb [2]
>> create mode 100644 meta-networking/recipes-kernel/wireguard/wireguard.inc
>> 
>> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170324.bb [1] b/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170324.bb [1]
>> new file mode 100644
>> index 0000000..aeb8269
>> --- /dev/null
>> +++ b/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170324.bb [1]
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
>> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170324.bb [2] b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170324.bb [2]
>> new file mode 100644
>> index 0000000..79d420f
>> --- /dev/null
>> +++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170324.bb [2]
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
>> +    oe_runmake DESTDIR="${D}" PREFIX="${prefix}" SYSCONFDIR="${sysconfdir}" \
>> +        SYSTEMDUNITDIR="${systemd_unitdir}" \
>> +        WITH_SYSTEMDUNITS=${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'yes', '', d)} \
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
>> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard.inc b/meta-networking/recipes-kernel/wireguard/wireguard.inc
>> new file mode 100644
>> index 0000000..cec7260
>> --- /dev/null
>> +++ b/meta-networking/recipes-kernel/wireguard/wireguard.inc
>> @@ -0,0 +1,18 @@
>> +SUMMARY = "WireGuard is an extremely simple yet fast and modern VPN"
>> +DESCRIPTION="WireGuard is a secure network tunnel, operating at layer 3, \
>> +implemented as a kernel virtual network interface for Linux, which aims to \
>> +replace both IPsec for most use cases, as well as popular user space and/or \
>> +TLS-based solutions like OpenVPN, while being more secure, more performant, \
>> +and easier to use."
>> +SECTION = "networking"
>> +HOMEPAGE = "https://www.wireguard.io/"
>> +LICENSE = "GPLv2"
>> +
>> +LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>> +
>> +SRC_URI = "https://git.zx2c4.com/WireGuard/snapshot/WireGuard-${PV}.tar.xz [3]"
>> +
>> +SRC_URI[md5sum] = "fead9ae2d7c6729e39f529913584494a"
>> +SRC_URI[sha256sum] = "2ec08a5d74cb3a63576f06d3cae695b6b8995acd9665e2fa4da91927b467ca51"
>> +
>> +S = "${WORKDIR}/WireGuard-${PV}/src/"
>> --
>> 2.7.4
>> 
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel [4]

  

Links:
------
[1] http://wireguard-module_0.0.20170324.bb
[2] http://wireguard-tools_0.0.20170324.bb
[3] https://git.zx2c4.com/WireGuard/snapshot/WireGuard-${PV}.tar.xz
[4] http://lists.openembedded.org/mailman/listinfo/openembedded-devel

