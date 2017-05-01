Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id C8A077197E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 May 2017 21:38:06 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [178.209.48.103])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 0E6C25C1500;
	Mon,  1 May 2017 23:37:40 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 01 May 2017 14:37:44 -0700
From: Stefan Agner <stefan@agner.ch>
To: Joe MacDonald <Joe_MacDonald@mentor.com>
In-Reply-To: <20170501151800.GA22386@mentor.com>
References: <1493271021-15875-1-git-send-email-stefan@agner.ch>
	<CA+chaQcfurLMso=4B57=PwkP4=hSDd0FmDHWeZR2fADe8tC3cg@mail.gmail.com>
	<1ecbee2142b8a1dffc16834e0c4a0d24@agner.ch>
	<20170501151800.GA22386@mentor.com>
Message-ID: <8fe593023ab0ba46b283531a809a0f60@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.1.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1493674660; bh=aLA0M08+df7ZvAfL8a+MlO2HNWh0F+hnFXyJwn/+Kws=;
	h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
	b=RDCw4q8YdczgHfwKlYzM5UXuLjcBtKjWipKZQYVXwtKjTATSlnf9TgMKqtxC+bwlbEBduIHPUMaHZnHQU17kki6yzv3zbCn1TdEk21Qll97D4ifRYUgkAjmrmm0yq5q1Mn/vgXmYrOXk20KxAi1gUetyVhiauQP9GLnk4BbiJuQ=
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v3] wireguard: add WireGuard kernel module and tools
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
X-List-Received-Date: Mon, 01 May 2017 21:38:07 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2017-05-01 08:18, Joe MacDonald wrote:
> [Re: [oe] [meta-networking][PATCH v3] wireguard: add WireGuard kernel
> module and tools] On 17.04.28 (Fri 18:18) Stefan Agner wrote:
> 
>>
>>
>> Hm, I can not reproduce here. It looks like module has not been
>> included, the module make arguments are missing...
>>
>> Here it looks like this:
>>
>> NOTE: make -j 8
>> KERNEL_SRC=skins/larry/build/ags/oe-core/build/tmp-glibc/work-shared/qemux86-64/kernel-source
>> KERNELDIR=/build/ags/oe-core/build/tmp-glibc/work-shared/qemux86-64/kernel-source
>> KERNEL_PATH=/build/ags/oe-core/build/tmp-glibc/work-shared/qemux86-64/kernel-source
>> KERNEL_VERSION=4.10.5-yocto-standard CC=x86_64-oe-linux-gcc
>> -fuse-ld=bfd LD=x86_64-oe-linux-ld.bfd  AR=x86_64-oe-linux-ar
>> O=/build/ags/oe-core/build/tmp-glibc/work-shared/qemux86-64/kernel-build-artifacts
>> KBUILD_EXTRA_SYMBOLS= module
>>
>> Do you have an idea what is going on?
> 
> I don't off hand, but since I merged it, I'll try to investigate it.
> It's been somewhat complicated by the fact that this configuration
> builds for me but fails for the world builds as Martin notes.  But the
> configuration that last passed for the world builds failed to build for
> my ARM target builds during a do_install step because it was clearly
> trying to look at my host system.  For now I've just blacklisted the
> recipe in master.

Yeah it really seems that inherit module failed for some reason, which
avoids a whole bunch of make arguments to be missing. Quite likely that
in this case the build system starts to look at default paths.

But this recipe inherits module the same way as others do. It seems to
me if this recipe fails, then others such as netmap-modules should fail
too...

--
Stefan


> 
> -J.
> 
>>
>> On 2017-04-28 05:24, Martin Jansa wrote:
>>
>> > This latest version (which was merged to master yesterday) fails to build:
>> >
>> > http://errors.yoctoproject.org/Errors/Details/141421/
>> >
>> > On Thu, Apr 27, 2017 at 7:30 AM, Stefan Agner <stefan@agner.ch> wrote:
>> >
>> >> WireGuard is an extremely simple yet fast and modern VPN that utilizes
>> >> state-of-the-art cryptography. It aims to be faster, simpler, leaner,
>> >> and more useful than IPSec, while avoiding the massive headache.
>> >>
>> >> The recipes add the current experimental snapshot v0.0.20170421
>> >> out-of-tree kernel module and tools. The kernel module has some kernel
>> >> configuration dependencies such as some configuration part of
>> >> features/netfilter/netfilter.scc, hence netfilter.scc should be part
>> >> of KERNEL_EXTRA_FEATURES (which is the case by default).
>> >>
>> >> Since wireguard-tools is TUNE_PKGARCH and depends on wireguard-module
>> >> which is MACHINE_ARCH (like all kernel modules) we need to add this
>> >> dependency to SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS.
>> >>
>> >> Signed-off-by: Stefan Agner <stefan@agner.ch>
>> >> ---
>> >> Changes since v2:
>> >> - Upgrade to v0.0.20170421
>> >> - Add comment about Linux kernel requirement
>> >>
>> >> Changes since v1:
>> >> - Upgrade to v0.0.20170409
>> >> - Add wireguard-tools -> wireguard-module dependency to
>> >> SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS.
>> >>
>> >> meta-networking/conf/layer.conf                    |  4 ++++
>> >> .../wireguard/wireguard-module_0.0.20170421.bb [1]     | 13 +++++++++++
>> >> .../wireguard/wireguard-tools_0.0.20170421.bb [2]      | 27 ++++++++++++++++++++++
>> >> .../recipes-kernel/wireguard/wireguard.inc         | 18 +++++++++++++++
>> >> 4 files changed, 62 insertions(+)
>> >> create mode 100644 meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170421.bb [1]
>> >> create mode 100644 meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170421.bb [2]
>> >> create mode 100644 meta-networking/recipes-kernel/wireguard/wireguard.inc
>> >>
>> >> diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
>> >> index 85ad93b..b5aa159 100644
>> >> --- a/meta-networking/conf/layer.conf
>> >> +++ b/meta-networking/conf/layer.conf
>> >> @@ -21,3 +21,7 @@ LICENSE_PATH += "${LAYERDIR}/licenses"
>> >>
>> >> # Override security flags
>> >> require conf/distro/include/meta_networking_security_flags.inc
>> >> +
>> >> +SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
>> >> +  wireguard-tools->wireguard-module \
>> >> +"
>> >> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170421.bb [1] b/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170421.bb [1]
>> >> new file mode 100644
>> >> index 0000000..cb21bda
>> >> --- /dev/null
>> >> +++ b/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170421.bb [1]
>> >> @@ -0,0 +1,13 @@
>> >> +require wireguard.inc
>> >> +
>> >> +inherit module
>> >> +
>> >> +# This module requires Linux 3.10 higher and several networking related
>> >> +# configuration options. For exact kernel requirements visit:
>> >> +# https://www.wireguard.io/install/#kernel-requirements [3]
>> >> +
>> >> +EXTRA_OEMAKE += "KERNELDIR=${STAGING_KERNEL_DIR}"
>> >> +MAKE_TARGETS = "module"
>> >> +MODULES_INSTALL_TARGET = "module-install"
>> >> +
>> >> +RRECOMMENDS_${PN} = "kernel-module-xt-hashlimit"
>> >> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170421.bb [2] b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170421.bb [2]
>> >> new file mode 100644
>> >> index 0000000..79d420f
>> >> --- /dev/null
>> >> +++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170421.bb [2]
>> >>
>> >> @@ -0,0 +1,27 @@
>> >> +require wireguard.inc
>> >> +
>> >> +inherit bash-completion systemd pkgconfig
>> >> +
>> >> +DEPENDS = "wireguard-module libmnl"
>> >> +
>> >> +do_compile_prepend () {
>> >> +    cd ${S}/tools
>> >> +}
>> >> +
>> >> +do_install () {
>> >> +    cd ${S}/tools
>> >> +    oe_runmake DESTDIR="${D}" PREFIX="${prefix}" SYSCONFDIR="${sysconfdir}" \
>> >> +        SYSTEMDUNITDIR="${systemd_unitdir}" \
>> >> +        WITH_SYSTEMDUNITS=${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'yes', '', d)} \
>> >> +        WITH_BASHCOMPLETION=yes \
>> >> +        WITH_WGQUICK=yes \
>> >> +        install
>> >> +}
>> >> +
>> >> +FILES_${PN} = " \
>> >> +    ${sysconfdir} \
>> >> +    ${systemd_unitdir} \
>> >> +    ${bindir} \
>> >> +"
>> >> +
>> >> +RDEPENDS_${PN} = "wireguard-module"
>> >> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard.inc b/meta-networking/recipes-kernel/wireguard/wireguard.inc
>> >> new file mode 100644 index 0000000..46a9971
>> >> --- /dev/null
>> >> +++ b/meta-networking/recipes-kernel/wireguard/wireguard.inc
>> >> @@ -0,0 +1,18 @@
>> >> +SUMMARY = "WireGuard is an extremely simple yet fast and modern VPN"
>> >> +DESCRIPTION="WireGuard is a secure network tunnel, operating at layer 3, \
>> >> +implemented as a kernel virtual network interface for Linux, which aims to \
>> >> +replace both IPsec for most use cases, as well as popular user space and/or \
>> >> +TLS-based solutions like OpenVPN, while being more secure, more performant, \
>> >> +and easier to use."
>> >> +SECTION = "networking"
>> >> +HOMEPAGE = "https://www.wireguard.io/"
>> >> +LICENSE = "GPLv2"
>> >> +
>> >> +LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>> >> +
>> >> +SRC_URI = "https://git.zx2c4.com/WireGuard/snapshot/WireGuard-${PV}.tar.xz [4]"
>> >> +
>> >> +SRC_URI[md5sum] = "8e559f4fd672b15c38a15eb4d88cc84d"
>> >> +SRC_URI[sha256sum] = "03c82af774224cd171d000ee4a519b5e474cc6842ac04967773cf77b26750000"
>> >>
>> >> +
>> >> +S = "${WORKDIR}/WireGuard-${PV}/src/"
>> >> --
>> >> 2.7.4
>>
>>
>>
>> Links:
>> ------
>> [1] http://wireguard-module_0.0.20170421.bb
>> [2] http://wireguard-tools_0.0.20170421.bb
>> [3] https://www.wireguard.io/install/#kernel-requirements
>> [4] https://git.zx2c4.com/WireGuard/snapshot/WireGuard-${PV}.tar.xz

