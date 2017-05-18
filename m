Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1A47571AFC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 May 2017 07:29:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v4I7Tj2l032675
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 18 May 2017 00:29:46 -0700
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 18 May 2017 00:29:45 -0700
To: Stefan Agner <stefan@agner.ch>, <martin.jansa@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
References: <1493271021-15875-1-git-send-email-stefan@agner.ch>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <e9f275c5-533f-2066-e773-eecc1a89cb46@windriver.com>
Date: Thu, 18 May 2017 15:29:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1493271021-15875-1-git-send-email-stefan@agner.ch>
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
X-List-Received-Date: Thu, 18 May 2017 07:29:52 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefan,

On 04/27/2017 01:30 PM, Stefan Agner wrote:
> WireGuard is an extremely simple yet fast and modern VPN that utilizes
> state-of-the-art cryptography. It aims to be faster, simpler, leaner,
> and more useful than IPSec, while avoiding the massive headache.
>
> The recipes add the current experimental snapshot v0.0.20170421
> out-of-tree kernel module and tools. The kernel module has some kernel
> configuration dependencies such as some configuration part of
> features/netfilter/netfilter.scc, hence netfilter.scc should be part
> of KERNEL_EXTRA_FEATURES (which is the case by default).
>
> Since wireguard-tools is TUNE_PKGARCH and depends on wireguard-module
> which is MACHINE_ARCH (like all kernel modules) we need to add this
> dependency to SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS.
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
> Changes since v2:
> - Upgrade to v0.0.20170421
> - Add comment about Linux kernel requirement
>
> Changes since v1:
> - Upgrade to v0.0.20170409
> - Add wireguard-tools -> wireguard-module dependency to
>   SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS.
>
>  meta-networking/conf/layer.conf                    |  4 ++++
>  .../wireguard/wireguard-module_0.0.20170421.bb     | 13 +++++++++++
>  .../wireguard/wireguard-tools_0.0.20170421.bb      | 27 ++++++++++++++++++++++
>  .../recipes-kernel/wireguard/wireguard.inc         | 18 +++++++++++++++
>  4 files changed, 62 insertions(+)
>  create mode 100644 meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170421.bb
>  create mode 100644 meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170421.bb
>  create mode 100644 meta-networking/recipes-kernel/wireguard/wireguard.inc
>
> diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
> index 85ad93b..b5aa159 100644
> --- a/meta-networking/conf/layer.conf
> +++ b/meta-networking/conf/layer.conf
> @@ -21,3 +21,7 @@ LICENSE_PATH += "${LAYERDIR}/licenses"
>
>  # Override security flags
>  require conf/distro/include/meta_networking_security_flags.inc
> +
> +SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
> +  wireguard-tools->wireguard-module \
> +"
> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170421.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170421.bb
> new file mode 100644
> index 0000000..cb21bda
> --- /dev/null
> +++ b/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170421.bb
> @@ -0,0 +1,13 @@
> +require wireguard.inc
> +
> +inherit module
> +
> +# This module requires Linux 3.10 higher and several networking related
> +# configuration options. For exact kernel requirements visit:
> +# https://www.wireguard.io/install/#kernel-requirements
> +
> +EXTRA_OEMAKE += "KERNELDIR=${STAGING_KERNEL_DIR}"
> +MAKE_TARGETS = "module"
> +MODULES_INSTALL_TARGET = "module-install"
> +
> +RRECOMMENDS_${PN} = "kernel-module-xt-hashlimit"
> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170421.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170421.bb
> new file mode 100644
> index 0000000..79d420f
> --- /dev/null
> +++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170421.bb
> @@ -0,0 +1,27 @@
> +require wireguard.inc
> +
> +inherit bash-completion systemd pkgconfig
> +
> +DEPENDS = "wireguard-module libmnl"
> +
> +do_compile_prepend () {
> +    cd ${S}/tools
> +}
> +
> +do_install () {
> +    cd ${S}/tools
> +    oe_runmake DESTDIR="${D}" PREFIX="${prefix}" SYSCONFDIR="${sysconfdir}" \
> +        SYSTEMDUNITDIR="${systemd_unitdir}" \
> +        WITH_SYSTEMDUNITS=${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'yes', '', d)} \
> +        WITH_BASHCOMPLETION=yes \
> +        WITH_WGQUICK=yes \
> +        install
> +}
> +
> +FILES_${PN} = " \
> +    ${sysconfdir} \
> +    ${systemd_unitdir} \
> +    ${bindir} \
> +"
> +
> +RDEPENDS_${PN} = "wireguard-module"
> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard.inc b/meta-networking/recipes-kernel/wireguard/wireguard.inc
> new file mode 100644
> index 0000000..46a9971
> --- /dev/null
> +++ b/meta-networking/recipes-kernel/wireguard/wireguard.inc
> @@ -0,0 +1,18 @@
> +SUMMARY = "WireGuard is an extremely simple yet fast and modern VPN"
> +DESCRIPTION="WireGuard is a secure network tunnel, operating at layer 3, \
> +implemented as a kernel virtual network interface for Linux, which aims to \
> +replace both IPsec for most use cases, as well as popular user space and/or \
> +TLS-based solutions like OpenVPN, while being more secure, more performant, \
> +and easier to use."
> +SECTION = "networking"
> +HOMEPAGE = "https://www.wireguard.io/"
> +LICENSE = "GPLv2"
> +
> +LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +SRC_URI = "https://git.zx2c4.com/WireGuard/snapshot/WireGuard-${PV}.tar.xz"

This SRC_URI is gone, maybe it's just a temp location ?

// Robert

> +
> +SRC_URI[md5sum] = "8e559f4fd672b15c38a15eb4d88cc84d"
> +SRC_URI[sha256sum] = "03c82af774224cd171d000ee4a519b5e474cc6842ac04967773cf77b26750000"
> +
> +S = "${WORKDIR}/WireGuard-${PV}/src/"
>

