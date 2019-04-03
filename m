Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
	[209.85.167.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4B7067C68F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 08:32:12 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id a6so9493908oie.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2019 01:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hybP2nbYSRnzQ1FBt7nmPX/lGf83bwzim5etOuIiHKM=;
	b=JuIgtYI1O/jFS8wcHHCBfOjaWxNvNxQH4u39rM+gZPA0uGYapbWuBhUgQMHwI/pbeb
	D/7zLl6zouzNq9FTdTmUujNZZrgD2RsVpvaKnSnahcWAAYjzyl7rKwLnwgE+w/dQ5ImX
	IG6EmRxNR385g/ZhNlS1nXt0brW29o7mb4PC9T+gXlHXNBSNhzzzKL4AtdSoEfIllOMP
	b5NT55ZM1mB04+WgcumnjfXxdtG+rwPZ4B6UoATCN//1ObuDYVVl4uLpboWT37kH3hav
	f97gn2DfrP8bCuZxyVMgBDKeEH0XD7AI8Rrw0dFsbteszl0p6KTydsLrrDlggi53jhzI
	J8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hybP2nbYSRnzQ1FBt7nmPX/lGf83bwzim5etOuIiHKM=;
	b=f2bNFgke2zZNLerJapaVBYRHI23iLDx33/atQ9ZUOco1144oUKVe5bTjbonQqRvrrm
	wXIdqkkVuZ6s5Wrp/zUoEGAPOZCaMzX1+AXynLnSljafA2o/rPeHET1/WOdiuN96+iay
	WVr9K+kv+WvigZhAlbHT/D+HfjeoAXAjkSFeCICLWDQhd+R0s3isQx4Z13Dn5H6+nGW/
	Pwf+sgQ3orTSCZasPI1wgoOS5VA8a1/rFwm0JD4R3cwiWukhdGqXqxjE5Dx1zJ7levj/
	lqw4xGrYNxTTXgbRl2lQKcccWAmcWakbLdVj4N8FEpeWAVFUooMRoo5DGsP6W3cvT1R1
	4zlg==
X-Gm-Message-State: APjAAAXpp7eo8a22HnH1F1rNFe1fApOibCBFvsZRgVNb0kCiVnq54lMa
	VwMWisCIgjVttAsFe/8NpovVTiNYKMbYYJXcQCU=
X-Google-Smtp-Source: APXvYqy4GSUj3J01x/nCrAWBT2PTalF1TsRBeq+D2nBCnv/CSAgYR5liwFMKBr+0yg/VQhmf+eqs3u77vqEqxSJcYZM=
X-Received: by 2002:aca:e689:: with SMTP id d131mr913325oih.132.1554280333150; 
	Wed, 03 Apr 2019 01:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <1554300459-3158-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1554300459-3158-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 3 Apr 2019 10:32:01 +0200
Message-ID: <CANNYZj9CtQ9Ucm-rjxNBfH9oTCai+WeKCWNnszVrQoDiLN23rA@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][patch] dnf-plugin-tui: new recipe
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
X-List-Received-Date: Wed, 03 Apr 2019 08:32:12 -0000
Content-Type: text/plain; charset="UTF-8"

Apologies, but i have to say no to this patch.

1) Most people do not want dnf tooling in their SDKs. Your patches
include that unconditionally.
2) bbappends do not belong in meta-oe, as they modify behavior of
original recipes quietly when you enable that layer. You need to
modify the original recipes, and send patches for that.
3) The recipe for the tui plugin should not be nativesdk-specific. If
someone wants that on target, they should be able to.
4) You had previously submitted this to oe-core, it was discussed, and
the outcome was that it's better to add generic tooling support to
eSDK for the use case (customizing a rootfs). Meta-oe is not the right
place for a dnf/rpm-specific solution, especially if it's forced on
everyone.

I would suggest that you make your own layer for this (e.g.
meta-dnf-tui) and publish that in github next to the tui plugin.

Alex




On Wed, 3 Apr 2019 at 07:08, Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com> wrote:
>
> A new recipe for dnf-plugin called tui.
> This plugin can work in nativesdk environment, and provide some additional functions:
>  1. Add new command dnf tui --init to make dnf to work on host
>  2. Text-based user interface for dnf.
>  3. Manage SPDX files
>  4. Manage SRPM files
>  5. Add installation samples for dnf
>
> More details, please reference to https://github.com/ubinux/dnf-plugin-tui/tree/master.
>
> In addition, modify some nativesdk recipes to include dnf-plugin-tui in meta-toolchain.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../recipes-core/meta/meta-environment.bbappend    |  3 +++
>  .../nativesdk-packagegroup-sdk-host.bbappend       |  2 ++
>  .../recipes-devtools/dnf-plugin-tui/dnf_%.bbappend | 29 ++++++++++++++++++++++
>  .../dnf-plugin-tui/nativesdk-dnf-plugin-tui.bb     | 29 ++++++++++++++++++++++
>  4 files changed, 63 insertions(+)
>  create mode 100644 meta-oe/recipes-core/meta/meta-environment.bbappend
>  create mode 100644 meta-oe/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bbappend
>  create mode 100644 meta-oe/recipes-devtools/dnf-plugin-tui/dnf_%.bbappend
>  create mode 100644 meta-oe/recipes-devtools/dnf-plugin-tui/nativesdk-dnf-plugin-tui.bb
>
> diff --git a/meta-oe/recipes-core/meta/meta-environment.bbappend b/meta-oe/recipes-core/meta/meta-environment.bbappend
> new file mode 100644
> index 0000000..2ac268f
> --- /dev/null
> +++ b/meta-oe/recipes-core/meta/meta-environment.bbappend
> @@ -0,0 +1,3 @@
> +create_sdk_files_append() {
> +    echo 'export MACHINE_ARCH=${MACHINE_ARCH}' >> $script
> +}
> diff --git a/meta-oe/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bbappend b/meta-oe/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bbappend
> new file mode 100644
> index 0000000..9f85825
> --- /dev/null
> +++ b/meta-oe/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bbappend
> @@ -0,0 +1,2 @@
> +RDEPENDS_${PN}_append = " nativesdk-dnf-plugin-tui \
> +                          nativesdk-createrepo-c"
> diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf_%.bbappend b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf_%.bbappend
> new file mode 100644
> index 0000000..ce683e4
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf_%.bbappend
> @@ -0,0 +1,29 @@
> +RDEPENDS_${PN}_class-nativesdk += " \
> +  python3-core \
> +  python3-codecs \
> +  python3-netclient \
> +  python3-email \
> +  python3-threading \
> +  python3-distutils \
> +  python3-logging \
> +  python3-fcntl \
> +  librepo \
> +  python3-shell \
> +  libcomps \
> +  libdnf \
> +  python3-sqlite3 \
> +  python3-compression \
> +  python3-rpm \
> +  python3-iniparse \
> +  python3-json \
> +  python3-curses \
> +  python3-misc \
> +  python3-gpg \
> +  libnewt-python \
> +  "
> +
> +do_install_append_class-nativesdk() {
> +        create_wrapper ${D}/${bindir}/dnf \
> +                RPM_CONFIGDIR=${SDKPATHNATIVE}${libdir_nativesdk}/rpm \
> +                RPM_NO_CHROOT_FOR_SCRIPTS=1
> +}
> diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/nativesdk-dnf-plugin-tui.bb b/meta-oe/recipes-devtools/dnf-plugin-tui/nativesdk-dnf-plugin-tui.bb
> new file mode 100644
> index 0000000..4fbbac8
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/dnf-plugin-tui/nativesdk-dnf-plugin-tui.bb
> @@ -0,0 +1,29 @@
> +SUMMARY = "A text-based user interface plugin for dnf, used in toolchian environment"
> +LICENSE = "GPLv2"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +SRC_URI = "git://github.com/ubinux/dnf-plugin-tui.git;branch=master "
> +
> +SRCREV = "a743116fa78a20f9828533c1de79ad8e4ab2d16c"
> +
> +inherit nativesdk distutils3-base
> +
> +S = "${WORKDIR}/git"
> +
> +RDEPENDS_${PN} += " \
> +  nativesdk-dnf \
> +  nativesdk-libnewt-python \
> +  "
> +
> +do_install_append() {
> +        install -d ${D}${datadir}/dnf
> +        install -m 0755 ${S}/samples/* ${D}${datadir}/dnf
> +        install -d ${D}${PYTHON_SITEPACKAGES_DIR}/dnf-plugins/mkimg
> +        install -m 0755 ${S}/dnf-plugins/mkimg/* ${D}${PYTHON_SITEPACKAGES_DIR}/dnf-plugins/mkimg
> +        for file in $(ls ${S}/dnf-plugins/ | grep -v mkimg); do
> +            install -m 0755 ${S}/dnf-plugins/$file ${D}${PYTHON_SITEPACKAGES_DIR}/dnf-plugins
> +        done
> +}
> +
> +FILES_${PN} += "${datadir}/dnf"
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

