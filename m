Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 255D2605BE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Apr 2017 12:24:16 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id z129so10630880wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Apr 2017 05:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PhxLikMOizxD597S0kLl1NAp1UgETbeumTj7GwzaiJQ=;
	b=Tlhawj4t25aY0hHDaUy/J9YaBpd1DQkjnDRV20u3Fl+H2MOLB7FJeouUAR37nnXEpT
	Nm1L8RSeLcjTcU6LDQypjxELCHLpIXd1lUO7JiWaqbtq4lvFSq4vc9EnHDJattwO6Whj
	aGXXlXNU5VQ9cJQSX7rF7LoeQcSO2xP2tvaPfhY1raXeKMYIRmy/uo+sxwCHk5H3rxLB
	vCgqjzRDrK1+OhsqUzscaWoq9fp1hBwkwAAK4PbS8ppWuK0Vrz9Y8IBCj88Se4AJb350
	pzwCiEtHbek7QC/TSVccTmYB393A3Qli5uDJNW2RiioeeOG4Lu9R+L6jX916z/F133Sk
	KsQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PhxLikMOizxD597S0kLl1NAp1UgETbeumTj7GwzaiJQ=;
	b=cfEAjeSjeJy5tWWH+HUM1w4j4YnL2DVTwJmEuOVYHs08ZLPsGpG+DBvZ9gkRB9Q/KY
	k/VGjri2zQ9Ls6lU14NGemFvsmY/eW/l94Y3r5LGacZLbwJx2AXOdKeTj35r7Wn6oNfK
	1qfPreHqlPctBa4CoPg4Fx8wV/m7pAIMHEYoPj5bFhosnRUNcpss6c+EFiBw5hcjeFza
	GTS+wSLhRP5m/9fuFUTYjN1xK3tlN468U1ub+XG30KvDrcSRCZnAJtkfp/xNZV8Ql7dV
	MDB93eBVQ/xdCBKZ/1XPXqCsggHJVIotlNnbhOw8O8g9KJ9wRFvec75RZHlxhShJXDH6
	Twyg==
X-Gm-Message-State: AN3rC/5eWx5caK1xv0fpKXs9HmWcd/Z6zDffAhbOiEe77t4PrfDZkQYe
	NkEyacw+VUDF/ffcXGxKBdIsGV+MTKm8
X-Received: by 10.80.149.203 with SMTP id x11mr8776100eda.181.1493382257745;
	Fri, 28 Apr 2017 05:24:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.148.54 with HTTP; Fri, 28 Apr 2017 05:24:17 -0700 (PDT)
In-Reply-To: <1493271021-15875-1-git-send-email-stefan@agner.ch>
References: <1493271021-15875-1-git-send-email-stefan@agner.ch>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 28 Apr 2017 14:24:17 +0200
Message-ID: <CA+chaQcfurLMso=4B57=PwkP4=hSDd0FmDHWeZR2fADe8tC3cg@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Fri, 28 Apr 2017 12:24:17 -0000
Content-Type: text/plain; charset=UTF-8

This latest version (which was merged to master yesterday) fails to build:

http://errors.yoctoproject.org/Errors/Details/141421/

On Thu, Apr 27, 2017 at 7:30 AM, Stefan Agner <stefan@agner.ch> wrote:

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
>  .../wireguard/wireguard-tools_0.0.20170421.bb      | 27
> ++++++++++++++++++++++
>  .../recipes-kernel/wireguard/wireguard.inc         | 18 +++++++++++++++
>  4 files changed, 62 insertions(+)
>  create mode 100644 meta-networking/recipes-kernel/wireguard/wireguard-
> module_0.0.20170421.bb
>  create mode 100644 meta-networking/recipes-kernel/wireguard/wireguard-
> tools_0.0.20170421.bb
>  create mode 100644 meta-networking/recipes-kernel/wireguard/wireguard.inc
>
> diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.
> conf
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
> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-
> module_0.0.20170421.bb b/meta-networking/recipes-kernel/wireguard/
> wireguard-module_0.0.20170421.bb
> new file mode 100644
> index 0000000..cb21bda
> --- /dev/null
> +++ b/meta-networking/recipes-kernel/wireguard/wireguard-
> module_0.0.20170421.bb
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
> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-
> tools_0.0.20170421.bb b/meta-networking/recipes-kernel/wireguard/
> wireguard-tools_0.0.20170421.bb
> new file mode 100644
> index 0000000..79d420f
> --- /dev/null
> +++ b/meta-networking/recipes-kernel/wireguard/wireguard-
> tools_0.0.20170421.bb
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
> +    oe_runmake DESTDIR="${D}" PREFIX="${prefix}"
> SYSCONFDIR="${sysconfdir}" \
> +        SYSTEMDUNITDIR="${systemd_unitdir}" \
> +        WITH_SYSTEMDUNITS=${@bb.utils.contains('DISTRO_FEATURES',
> 'systemd', 'yes', '', d)} \
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
> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard.inc
> b/meta-networking/recipes-kernel/wireguard/wireguard.inc
> new file mode 100644
> index 0000000..46a9971
> --- /dev/null
> +++ b/meta-networking/recipes-kernel/wireguard/wireguard.inc
> @@ -0,0 +1,18 @@
> +SUMMARY = "WireGuard is an extremely simple yet fast and modern VPN"
> +DESCRIPTION="WireGuard is a secure network tunnel, operating at layer 3, \
> +implemented as a kernel virtual network interface for Linux, which aims
> to \
> +replace both IPsec for most use cases, as well as popular user space
> and/or \
> +TLS-based solutions like OpenVPN, while being more secure, more
> performant, \
> +and easier to use."
> +SECTION = "networking"
> +HOMEPAGE = "https://www.wireguard.io/"
> +LICENSE = "GPLv2"
> +
> +LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a42
> 63"
> +
> +SRC_URI = "https://git.zx2c4.com/WireGuard/snapshot/WireGuard-$
> {PV}.tar.xz"
> +
> +SRC_URI[md5sum] = "8e559f4fd672b15c38a15eb4d88cc84d"
> +SRC_URI[sha256sum] = "03c82af774224cd171d000ee4a519b
> 5e474cc6842ac04967773cf77b26750000"
> +
> +S = "${WORKDIR}/WireGuard-${PV}/src/"
> --
> 2.7.4
>
>

