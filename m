Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3F28760103
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Apr 2017 07:29:22 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id o21so3546366wrb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Apr 2017 00:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wxskILCu48AqnhSC576JgffqvVf4PdHHFT7sw4vXIMo=;
	b=oxihWpPv3D1b78zh+ueLRzWWE/wj/22H8q7iFOnKgo5WLKK3a0OFW2IPiQktX+2QM2
	ySH+hvMqPuWZwF9vYjRgFJcvTXZ684+yafrZZbC3G22TExTJ0ZiwooctFjpkFdIyCOTZ
	jxLdddutnh3Neog0f2AQavNz3K+7GFmAB2lUrz08mkFGyZGrcAUa36LjQC900P2DYSb6
	+fDhZf7HgpA7Cvjh3LvhDTx5feYEftZYHly1Ksfpk1ugcMqH9PR1Bu+PJpLaPe+reUEq
	el/l+sAjcsbSGLuVROb0TYBke2BVAHT4P0/AMki95SYbQJr4igfzXRc3C62YTclhe8P1
	wWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wxskILCu48AqnhSC576JgffqvVf4PdHHFT7sw4vXIMo=;
	b=J9x3lkYN3Ie3+y2XbPPnpKPsb/DXEGuanxlzoDeYYOeF4ag937AvNRfD0KzYsVC29d
	O2SaEuC3V2BRTYE5PgIU/m1zXbvYqspOahGdL+fjimJQ53fSg35ljEWM0OL4+HOtvbl9
	6vof3wcEMJBFEexErY+1EDtGYfRTAizjC8DbZLnk7N3/QPcWMdnqMjXOLUKFpQmNlv+H
	FuWazQtuagsKCAIXplkY9HinBCd1BBXwHVwfIaIcuaDqRu2t9VxTpt/NLyk7vGTHIzQB
	ApBGXBsRWfBnRBAuqDyctxdjcJ5YxUoi7sN5VWf8i39Eo1QHLqGsT1H7bQQT3fQpzyl3
	Ay9A==
X-Gm-Message-State: AFeK/H1Bh4cy5fz/9GFC4avq6tVu/7i2mr/LquKtL13bPykfKhC16JA2C3Mg2H7Y+UbWGlml+QSmHHJj+uKttw==
X-Received: by 10.223.136.66 with SMTP id e2mr5214834wre.14.1491463763833;
	Thu, 06 Apr 2017 00:29:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Thu, 6 Apr 2017 00:29:23 -0700 (PDT)
In-Reply-To: <1491165189-7839-1-git-send-email-stefan@agner.ch>
References: <1491165189-7839-1-git-send-email-stefan@agner.ch>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 6 Apr 2017 09:29:23 +0200
Message-ID: <CA+chaQciaE02KqyA6LT6CmzBcqDuke+iL5ThpUdiCpY94T8B_A@mail.gmail.com>
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
X-List-Received-Date: Thu, 06 Apr 2017 07:29:23 -0000
Content-Type: text/plain; charset=UTF-8

TUNE_PKGARCH package cannot depend on MACHINE_ARCH module unless you remove
this dependency from sstate signature in layer.conf


Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signatures.20170405_114645.log/
    * ERROR: 3 issues were found in these recipes: wireguard-tools

    * ERROR: 1 errors found in signatures.qemux86.do_configure.sigdata.log
    * ERROR: 1 errors found in
signatures.qemux86.do_populate_sysroot.sigdata.log
    * ERROR: 1 errors found in
signatures.qemux86.do_package_write_ipk.sigdata.log

    * ERROR: wireguard-tools different signature for task
do_configure.sigdata between qemux86copy and qemux86
    * ERROR: 1 errors found in
/home/jenkins/oe/world/shr-core/tmp-glibc/sstate-diff/1491428805/signatures.qemux86.do_configure.sigdata.log
    * ERROR: wireguard-tools different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemux86
    * ERROR: 1 errors found in
/home/jenkins/oe/world/shr-core/tmp-glibc/sstate-diff/1491428805/signatures.qemux86.do_populate_sysroot.sigdata.log
    * ERROR: wireguard-tools different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemux86
    * ERROR: 1 errors found in
/home/jenkins/oe/world/shr-core/tmp-glibc/sstate-diff/1491428805/signatures.qemux86.do_package_write_ipk.sigdata.log
    * ERROR: 3 issues were found in these recipes: wireguard-tools


On Sun, Apr 2, 2017 at 10:33 PM, Stefan Agner <stefan@agner.ch> wrote:

> WireGuard is an extremely simple yet fast and modern VPN that utilizes
> state-of-the-art cryptography. It aims to be faster, simpler, leaner,
> and more useful than IPSec, while avoiding the massive headache.
>
> The recipes add the current experimental snapshot v0.0.20170324
> out-of-tree kernel module and tools. The kernel module has some kernel
> configuration dependencies such as some configuration part of
> features/netfilter/netfilter.scc, hence netfilter.scc should be part
> of KERNEL_EXTRA_FEATURES (which is the case by default).
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  .../wireguard/wireguard-module_0.0.20170324.bb     |  9 ++++++++
>  .../wireguard/wireguard-tools_0.0.20170324.bb      | 27
> ++++++++++++++++++++++
>  .../recipes-kernel/wireguard/wireguard.inc         | 18 +++++++++++++++
>  3 files changed, 54 insertions(+)
>  create mode 100644 meta-networking/recipes-kernel/wireguard/wireguard-
> module_0.0.20170324.bb
>  create mode 100644 meta-networking/recipes-kernel/wireguard/wireguard-
> tools_0.0.20170324.bb
>  create mode 100644 meta-networking/recipes-kernel/wireguard/wireguard.inc
>
> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-
> module_0.0.20170324.bb b/meta-networking/recipes-kernel/wireguard/
> wireguard-module_0.0.20170324.bb
> new file mode 100644
> index 0000000..aeb8269
> --- /dev/null
> +++ b/meta-networking/recipes-kernel/wireguard/wireguard-
> module_0.0.20170324.bb
> @@ -0,0 +1,9 @@
> +require wireguard.inc
> +
> +inherit module
> +
> +EXTRA_OEMAKE += "KERNELDIR=${STAGING_KERNEL_DIR}"
> +MAKE_TARGETS = "module"
> +MODULES_INSTALL_TARGET = "module-install"
> +
> +RRECOMMENDS_${PN} = "kernel-module-xt-hashlimit"
> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-
> tools_0.0.20170324.bb b/meta-networking/recipes-kernel/wireguard/
> wireguard-tools_0.0.20170324.bb
> new file mode 100644
> index 0000000..79d420f
> --- /dev/null
> +++ b/meta-networking/recipes-kernel/wireguard/wireguard-
> tools_0.0.20170324.bb
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
> index 0000000..cec7260
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
> +SRC_URI[md5sum] = "fead9ae2d7c6729e39f529913584494a"
> +SRC_URI[sha256sum] = "2ec08a5d74cb3a63576f06d3cae695
> b6b8995acd9665e2fa4da91927b467ca51"
> +
> +S = "${WORKDIR}/WireGuard-${PV}/src/"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

