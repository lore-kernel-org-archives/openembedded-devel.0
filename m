Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id DCEBD7C377
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Oct 2019 15:59:13 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id y144so10379759qkb.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Oct 2019 08:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5lXnQPWQa1l67o74s216QEMPIdGylMYL321o4ZeXGRs=;
	b=O5pCdsfgwawrRNNPU2UWsNaj/1WtST48T+b59+ux7i29qo+Rd2J89ymTshu73gKAtN
	W+Rf/+uWYOdb6ATzFX24hizn0FBmFgYELmd2naVxlvsMVsRnCR6WhtVUIxpruHFMD07f
	csJk2bBdfHTr7cSO2XJTp7SxwcXAdffz8oKcg6t3DQJEZekiyY/pPo77nBt+G6a1psVM
	pITF6bNRDRcXBexBi8ngLp+8eFxWU5BUW3dYat1iKmBMjfBIh41EChE9zPGptBd9tmKZ
	iPvCgTZ1yYGjuoho3EXddhl/iI26VDLuMOUX1n7qSTTkHeYSKXbEb4icd5xInDDhR4ao
	PSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5lXnQPWQa1l67o74s216QEMPIdGylMYL321o4ZeXGRs=;
	b=INRiZY3dgKwW7D6zMFCTnNmBN7VAJUi8iOkEeLq4TrR8PZRoEVifkeUqY5xFBxLMMe
	gsyhdIh/MwTYmadHYIVvYNTZbl3Ifs/pdKCOF+cXavA/1fYmA/ZF+yE0Dgu0AUw1+DhT
	NYgiVmT+S4GFuRezx7xHbzeH4DVfAY02YLSn5YI6XqDLNrg2ygrxnlo7oueQxTN1HieZ
	uawOsiFiGPgIqlWcPgblA1NCs1lE8ssS//irlEFLYURcFyWqUcVdnHpdbgYA109sFA2D
	BYT0GuNq6xNbjFIYZedoW4a75EdmKtP892flaQfkeBFc94gZbeYDEFZZClQQElHURhN6
	yTjg==
X-Gm-Message-State: APjAAAUzsks5sIjWeUzZ5Y0T69DSxIB37yUXrz3HKX3OSBCV3kuiSPk3
	VW2TRslTUTx7dO+Ol/AYJh3o/R6vdsn0t6oJIOo=
X-Google-Smtp-Source: APXvYqxduv0i4GOVC5nZC1m1eg88ml5HDaL6KealGFZ2hUoha/RjW9bxXMeTcQdqg+w2OwSKUrWnAnG6EHK5STAOJYM=
X-Received: by 2002:a05:620a:653:: with SMTP id
	a19mr19660800qka.337.1570377554221; 
	Sun, 06 Oct 2019 08:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <20191005222126.38802-1-stefan@agner.ch>
In-Reply-To: <20191005222126.38802-1-stefan@agner.ch>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 6 Oct 2019 08:58:48 -0700
Message-ID: <CAMKF1sovSm9sQYOUW3LhFcf9E_2Xy00nraW=nbXZ7RkoqGSaVQ@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH] zram: properly implement systemd service
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
X-List-Received-Date: Sun, 06 Oct 2019 15:59:14 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Stefan

Thanks for the patch, it would be nicer if hardcoded paths were
inserted during do_install e.g. using ${libexecdir} instead of
/usr/libexec etc.

On Sat, Oct 5, 2019 at 3:21 PM Stefan Agner <stefan@agner.ch> wrote:
>
> From: Stefan Agner <stefan.agner@toradex.com>
>
> The systemd service points ot a script which is not installed by
> zram or any of its dependencies. It seems that the service got
> migrated without the necessary script.
>
> The sysvinit script seems rather dated and initializes multiple
> zram instances to support multiprocessor systems. This is no
> longer necessary with modern implementations as newer kernel
> version support multiple streams by default.
>
> Create a modern implementation based on Fedoras zram package.
> Make use of systemd swap unit files instead of enabling swap
> directly.
>
> This removes the need for util-linux-swaponoff (since swap is
> now handled by systemd, which presumably depends on swaponoff).
> However, it adds the dependency to util-linux for zramctl.
>
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> ---
>  .../recipes-extended/zram/zram/dev-zram0.swap | 10 ++++
>  .../zram/zram/zram-swap-deinit                | 19 +++++++
>  .../recipes-extended/zram/zram/zram-swap-init | 26 ++++++++++
>  .../zram/zram/zram-swap.service               | 10 ++++
>  .../recipes-extended/zram/zram/zram.service   | 12 -----
>  meta-oe/recipes-extended/zram/zram/zramstop   |  5 ++
>  meta-oe/recipes-extended/zram/zram_0.1.bb     | 33 -------------
>  meta-oe/recipes-extended/zram/zram_0.2.bb     | 49 +++++++++++++++++++
>  8 files changed, 119 insertions(+), 45 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/zram/zram/dev-zram0.swap
>  create mode 100755 meta-oe/recipes-extended/zram/zram/zram-swap-deinit
>  create mode 100755 meta-oe/recipes-extended/zram/zram/zram-swap-init
>  create mode 100644 meta-oe/recipes-extended/zram/zram/zram-swap.service
>  delete mode 100644 meta-oe/recipes-extended/zram/zram/zram.service
>  create mode 100644 meta-oe/recipes-extended/zram/zram/zramstop
>  delete mode 100644 meta-oe/recipes-extended/zram/zram_0.1.bb
>  create mode 100644 meta-oe/recipes-extended/zram/zram_0.2.bb
>
> diff --git a/meta-oe/recipes-extended/zram/zram/dev-zram0.swap b/meta-oe/recipes-extended/zram/zram/dev-zram0.swap
> new file mode 100644
> index 000000000..05eae7eed
> --- /dev/null
> +++ b/meta-oe/recipes-extended/zram/zram/dev-zram0.swap
> @@ -0,0 +1,10 @@
> +[Unit]
> +Description=Enable compressed swap in memory using zram
> +Requires=zram-swap.service
> +After=zram-swap.service
> +
> +[Swap]
> +What=/dev/zram0
> +
> +[Install]
> +WantedBy=swap.target
> diff --git a/meta-oe/recipes-extended/zram/zram/zram-swap-deinit b/meta-oe/recipes-extended/zram/zram/zram-swap-deinit
> new file mode 100755
> index 000000000..46248c401
> --- /dev/null
> +++ b/meta-oe/recipes-extended/zram/zram/zram-swap-deinit
> @@ -0,0 +1,19 @@
> +#!/bin/sh
> +set -e
> +
> +device=$1
> +if [ "$device" = "" ]; then
> +    echo "Usage: zram-swap-deinit <device>"
> +    exit 1
> +fi
> +
> +sysblockdev=/sys/block/$(basename $device)
> +if [ ! -d $sysblockdev ]; then
> +    echo "Block device not found in sysfs"
> +    exit 1
> +fi
> +
> +# zramctl -r is not suitable as it also removes the actual device. Recreating
> +# it is non-trivial, especially if not /dev/zram0 is used...
> +echo 1 > ${sysblockdev}/reset
> +
> diff --git a/meta-oe/recipes-extended/zram/zram/zram-swap-init b/meta-oe/recipes-extended/zram/zram/zram-swap-init
> new file mode 100755
> index 000000000..0643dbca2
> --- /dev/null
> +++ b/meta-oe/recipes-extended/zram/zram/zram-swap-init
> @@ -0,0 +1,26 @@
> +#!/bin/sh
> +set -e
> +
> +device=$1
> +if [ "$device" = "" ]; then
> +    echo "Usage: zram-swap-init <device>"
> +    exit 1
> +fi
> +
> +# Allocate zram to be size of actual system memory
> +# Note: zram is only allocated when used. When swapped pages compress with a
> +# a 2:1 ratio zram will require 50% of system memory (while allowing to use
> +# 150% memory).
> +ZRAM_SIZE_PERCENT=100
> +ZRAM_ALGORITHM=lz4
> +
> +[ -f /etc/default/zram ] && ./etc/default/zram || true
> +
> +memtotal=$(grep MemTotal /proc/meminfo | awk ' { print $2 } ')
> +memzram=$(($memtotal*${ZRAM_SIZE_PERCENT}/100))
> +
> +# Try loading zram module
> +modprobe -q zram || true
> +
> +zramctl -a ${ZRAM_ALGORITHM} -s ${memzram}KB $device
> +mkswap -L "zram-swap" $device
> diff --git a/meta-oe/recipes-extended/zram/zram/zram-swap.service b/meta-oe/recipes-extended/zram/zram/zram-swap.service
> new file mode 100644
> index 000000000..7bb9e0a45
> --- /dev/null
> +++ b/meta-oe/recipes-extended/zram/zram/zram-swap.service
> @@ -0,0 +1,10 @@
> +[Unit]
> +Description=Create compressed swap in memory using zram
> +DefaultDependencies=no
> +
> +[Service]
> +Type=oneshot
> +RemainAfterExit=yes
> +TimeoutStartSec=30sec
> +ExecStart=/usr/libexec/zram-swap-init /dev/zram0
> +ExecStop=/usr/libexec/zram-swap-deinit /dev/zram0
> diff --git a/meta-oe/recipes-extended/zram/zram/zram.service b/meta-oe/recipes-extended/zram/zram/zram.service
> deleted file mode 100644
> index 4a19367d9..000000000
> --- a/meta-oe/recipes-extended/zram/zram/zram.service
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -[Unit]
> -Description=Enable zram compressed in-memory swap.
> -After=multi-user.target
> -
> -[Service]
> -RemainAfterExit=yes
> -ExecStart=/usr/bin/zram-load.sh --load
> -ExecStop=/usr/bin/zram-load.sh --unload
> -Type=oneshot
> -
> -[Install]
> -WantedBy=multi-user.target
> diff --git a/meta-oe/recipes-extended/zram/zram/zramstop b/meta-oe/recipes-extended/zram/zram/zramstop
> new file mode 100644
> index 000000000..07777978e
> --- /dev/null
> +++ b/meta-oe/recipes-extended/zram/zram/zramstop
> @@ -0,0 +1,5 @@
> +#!/bin/sh
> +
> +for i in $(grep '^/dev/zram' /proc/swaps | awk '{ print $1 }'); do
> +       swapoff "$i" && zramctl --reset "$i"
> +done
> diff --git a/meta-oe/recipes-extended/zram/zram_0.1.bb b/meta-oe/recipes-extended/zram/zram_0.1.bb
> deleted file mode 100644
> index dfd75e71c..000000000
> --- a/meta-oe/recipes-extended/zram/zram_0.1.bb
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -SUMMARY = "Linux zram compressed in-memory swap"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> -
> -inherit update-rc.d systemd
> -
> -RDEPENDS_${PN} = "util-linux-swaponoff kmod"
> -RRECOMMENDS_${PN} = "kernel-module-zram"
> -
> -PR = "r3"
> -
> -SRC_URI = " \
> -           file://init \
> -           file://zram.service \
> -"
> -
> -do_install () {
> -    # Sysvinit
> -    install -d ${D}${sysconfdir}/init.d
> -    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/zram
> -
> -    install -d ${D}${systemd_unitdir}/system
> -    install -m 0644 ${WORKDIR}/zram.service ${D}${systemd_unitdir}/system
> -}
> -
> -FILES_${PN} = "${sysconfdir}"
> -INITSCRIPT_NAME = "zram"
> -INITSCRIPT_PARAMS = "start 05 2 3 4 5 . stop 22 0 1 6 ."
> -
> -RPROVIDES_${PN} += "${PN}-systemd"
> -RREPLACES_${PN} += "${PN}-systemd"
> -RCONFLICTS_${PN} += "${PN}-systemd"
> -SYSTEMD_SERVICE_${PN} = "zram.service"
> diff --git a/meta-oe/recipes-extended/zram/zram_0.2.bb b/meta-oe/recipes-extended/zram/zram_0.2.bb
> new file mode 100644
> index 000000000..ca3b3b0c1
> --- /dev/null
> +++ b/meta-oe/recipes-extended/zram/zram_0.2.bb
> @@ -0,0 +1,49 @@
> +SUMMARY = "Linux zram compressed in-memory swap"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +
> +inherit update-rc.d systemd
> +
> +RDEPENDS_${PN} = "kmod \
> +    ${@bb.utils.contains('DISTRO_FEATURES','systemd','util-linux','util-linux-swaponoff',d)}"
> +RRECOMMENDS_${PN} = "kernel-module-zram"
> +
> +PR = "r3"
> +
> +SRC_URI = " \
> +           file://init \
> +           file://zram-swap-init \
> +           file://zram-swap-deinit \
> +           file://zram-swap.service \
> +           file://dev-zram0.swap \
> +"
> +
> +do_install () {
> +    # Install systemd related configuration file
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
> +        install -d ${D}${sysconfdir}/init.d
> +        install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/zram
> +    fi
> +
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
> +        install -d ${D}${libexecdir}
> +        install -m 0755 ${WORKDIR}/zram-swap-init ${D}${libexecdir}
> +        install -m 0755 ${WORKDIR}/zram-swap-deinit ${D}${libexecdir}
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m 0644 ${WORKDIR}/zram-swap.service ${D}${systemd_unitdir}/system
> +        install -m 0644 ${WORKDIR}/dev-zram0.swap ${D}${systemd_unitdir}/system
> +    fi
> +}
> +
> +FILES_${PN} = " \
> +    ${sysconfdir} \
> +    ${systemd_unitdir} \
> +    ${libexecdir} \
> +"
> +INITSCRIPT_NAME = "zram"
> +INITSCRIPT_PARAMS = "start 05 2 3 4 5 . stop 22 0 1 6 ."
> +
> +RPROVIDES_${PN} += "${PN}-systemd"
> +RREPLACES_${PN} += "${PN}-systemd"
> +RCONFLICTS_${PN} += "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} = "dev-zram0.swap"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

