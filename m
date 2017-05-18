Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id A87697807E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 May 2017 18:27:08 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [178.209.48.103])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 45DE65C1C68;
	Thu, 18 May 2017 20:26:17 +0200 (CEST)
MIME-Version: 1.0
Date: Thu, 18 May 2017 11:26:26 -0700
From: Stefan Agner <stefan@agner.ch>
To: Joe MacDonald <Joe_MacDonald@mentor.com>
In-Reply-To: <20170518181923.GC32192@mentor.com>
References: <1493271021-15875-1-git-send-email-stefan@agner.ch>
	<e9f275c5-533f-2066-e773-eecc1a89cb46@windriver.com>
	<d04b319717d0ce642f47a4c2a75b1dc5@agner.ch>
	<20170518181923.GC32192@mentor.com>
Message-ID: <4873b0143f076a00d4a1f4455e06c308@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.2.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1495131977; bh=amTcOfzlesv+QAwk9EVACf2StewkxRg2Z6fB8wE2jTk=;
	h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
	b=S+jC1p8M4dVswFlVRQgnCH7SgPO0M2wiv5CMVEfunBmHqOgcCE8CW0Wuf3rIC92nBSC/PXtvH2H5a15fReeiQPX5Y3H9TJLp+uU1FV3shrKpIxED3mDDpuhyz2Ed0CfHDTD5s/C1oCBVhE1t16moeE0Zf5siKPBIYNZvrCjtEiQ=
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 18 May 2017 18:27:10 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2017-05-18 11:19, Joe MacDonald wrote:
> [Re: [oe] [meta-networking][PATCH v3] wireguard: add WireGuard kernel
> module and tools] On 17.05.18 (Thu 10:55) Stefan Agner wrote:
> 
>> On 2017-05-18 00:29, Robert Yang wrote:
>> > Hi Stefan,
>> >
>> > On 04/27/2017 01:30 PM, Stefan Agner wrote:
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
>> >>   SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS.
>> >>
>> >>  meta-networking/conf/layer.conf                    |  4 ++++
>> >>  .../wireguard/wireguard-module_0.0.20170421.bb     | 13 +++++++++++
>> >>  .../wireguard/wireguard-tools_0.0.20170421.bb      | 27 ++++++++++++++++++++++
>> >>  .../recipes-kernel/wireguard/wireguard.inc         | 18 +++++++++++++++
>> >>  4 files changed, 62 insertions(+)
>> >>  create mode 100644 meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170421.bb
>> >>  create mode 100644 meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170421.bb
>> >>  create mode 100644 meta-networking/recipes-kernel/wireguard/wireguard.inc
>> >>
>> >> diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
>> >> index 85ad93b..b5aa159 100644
>> >> --- a/meta-networking/conf/layer.conf
>> >> +++ b/meta-networking/conf/layer.conf
>> >> @@ -21,3 +21,7 @@ LICENSE_PATH += "${LAYERDIR}/licenses"
>> >>
>> >>  # Override security flags
>> >>  require conf/distro/include/meta_networking_security_flags.inc
>> >> +
>> >> +SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
>> >> +  wireguard-tools->wireguard-module \
>> >> +"
>> >> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170421.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170421.bb
>> >> new file mode 100644
>> >> index 0000000..cb21bda
>> >> --- /dev/null
>> >> +++ b/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170421.bb
>> >> @@ -0,0 +1,13 @@
>> >> +require wireguard.inc
>> >> +
>> >> +inherit module
>> >> +
>> >> +# This module requires Linux 3.10 higher and several networking related
>> >> +# configuration options. For exact kernel requirements visit:
>> >> +# https://www.wireguard.io/install/#kernel-requirements
>> >> +
>> >> +EXTRA_OEMAKE += "KERNELDIR=${STAGING_KERNEL_DIR}"
>> >> +MAKE_TARGETS = "module"
>> >> +MODULES_INSTALL_TARGET = "module-install"
>> >> +
>> >> +RRECOMMENDS_${PN} = "kernel-module-xt-hashlimit"
>> >> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170421.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170421.bb
>> >> new file mode 100644
>> >> index 0000000..79d420f
>> >> --- /dev/null
>> >> +++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170421.bb
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
>> >> new file mode 100644
>> >> index 0000000..46a9971
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
>> >> +SRC_URI = "https://git.zx2c4.com/WireGuard/snapshot/WireGuard-${PV}.tar.xz"
>> >
>> > This SRC_URI is gone, maybe it's just a temp location ?
>>
>> Hm, yeah Jason released a new snapshot, 0.0.20170517. He seems not to
>> keep the old snapshots around, I guess he wants to avoid having stale
>> versions floating around.
>>
>> Either we keep bumping the version everytime a new snapshot is available
>> or we should just switch to git for OE, what do you think?
> 
> I think that given he's not just removing old tarballs from an FTP
> server somewhere but removing tags from the git history, it'd be best to
> go with a git recipe with a fixed SRCREV.

According to the snapshot announcement the new snapshot made breaking
changes to the protocol. It might be the reason they removed the old
snapshots, I am not sure how that has been handled in the past...

I guess the snapshots are slightly better tested and have a somewhat
more consistent state than git, so I would have preferred snapshots...

Just sent out a patch to move to the latest snapshot, lets see how
things move from this point, if the snapshots disappear I can switch to
git, does that sound ok?

--
Stefan

> 
> -J.
> 
>>
>> --
>> Stefan
>>
>> >
>> > // Robert
>> >
>> >> +
>> >> +SRC_URI[md5sum] = "8e559f4fd672b15c38a15eb4d88cc84d"
>> >> +SRC_URI[sha256sum] = "03c82af774224cd171d000ee4a519b5e474cc6842ac04967773cf77b26750000"
>> >> +
>> >> +S = "${WORKDIR}/WireGuard-${PV}/src/"
>> >>

