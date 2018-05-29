Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id DD1EC60777
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 16:40:34 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id k86-v6so11964667qkh.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 09:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=neHFGu0HIvzIEUEVwLT+NBBA3e4wWMGo7HXpfDssAEc=;
	b=fy2jO8y6mChu8ipqpmpdyUykdPG52AK4QiRDhH/+2R8BBdSjET8tbbJPXn/uLS/lxP
	WyPGEMivYy853QrQmFuGzmOITLwwkK3p3puogyAXN/CbzICZY7E5HOCNgpZi82plzOn5
	n2UXWWibanOj40aKxd5Rv3HaG/rZfHZeelF2TQt+sVnzUW8AiblOKN7ZZpN/9o/mmdAd
	CfQ+qfXSdknyurG4LEMKHEvMYMnpAv64K/A4V8Ck3JrSZ19OkeIcIQdoI/VAFzoQbX9c
	ptNncgkVluZuCBigsWIu8YZIhI0Qd57tZTCvpz89vHzRp9Oz132oNPEm5IaVCp0I4raR
	DrBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=neHFGu0HIvzIEUEVwLT+NBBA3e4wWMGo7HXpfDssAEc=;
	b=h8WdLPA9ClQvKnifYDSgyu0hfZKjp+4PBXT8At7ARiaBI2mv4H/gYdASLU26/xrPLa
	LWF+t1bLMfktKw3spQfk2apRr2QL4ZWdJaRCgvAGZHf+ZYkCEchfjYNkRzZPndTpQGQL
	vy44BadbsQZ+XWBzJIRxxSMZfY20XB5Ok2Rxm+C1LfZyOWsv3kj6OkD227Yt47wBF6i2
	CzfZ7uWVocAmn9xImtgRuNFFyYN7Y+8vkrzaPrDszJ1wM81h6qLqKyEF1+jIRfc/fVTp
	jDw+kozKS/bSVGn2xG8zpqZzlxuiDAS+HHbWDqAlWd4QSTebDqsLy5/rtnSFs5xZR7HF
	sj4Q==
X-Gm-Message-State: ALKqPwcmLdOTJBSVv473AVixYjwbs3pibWdyvM0exOvcVUx3ztVhV8/W
	keNXiXCOx3AfOUYLyJs8pGujE6jfJuDrZMI/eHE=
X-Google-Smtp-Source: ADUXVKJOinm1DAXNXCOatbsjZMKa03mP22XEw0hmvM/1Icg3c+LwBNhpnLMXrZK8dZCw8hf2PhX0akh0dr7NojqXdmo=
X-Received: by 2002:a37:3889:: with SMTP id
	f131-v6mr15035562qka.12.1527612035288; 
	Tue, 29 May 2018 09:40:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:9a0f:0:0:0:0:0 with HTTP; Tue, 29 May 2018 09:40:04
	-0700 (PDT)
In-Reply-To: <1527600941-1521-1-git-send-email-krzk@kernel.org>
References: <1527600941-1521-1-git-send-email-krzk@kernel.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 May 2018 09:40:04 -0700
Message-ID: <CAMKF1sqPhonFVTVhMtmbpiGhySrbYkPjERcoOWWAeroxSaRvcg@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] broadcom-bt-firmware: Add new recipe for Broadcom Bluetooth firmwares
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
X-List-Received-Date: Tue, 29 May 2018 16:40:35 -0000
Content-Type: text/plain; charset="UTF-8"

Previous version is now upstreamed. Please send the delta rebased on
top of the prior version in a v3

On Tue, May 29, 2018 at 6:35 AM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Several Broadcom Bluetooth USB dongles require firmware to be loaded.
> This recipe provides the firmware for BCM20702, BCM20703, BCM43142,
> BCM4335, BCM4350, BCM4356 and BCM4371 based devices.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> ---
>
> Changes since v1:
> 1. Rebase on sumo
>
> The patch is also available here:
> https://github.com/krzk/meta-openembedded/commits/broadcom-bt-v2
> ---
>  .../broadcom-bt-firmware_git.bb                    | 76 ++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_git.bb
>
> diff --git a/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_git.bb b/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_git.bb
> new file mode 100644
> index 000000000000..8c474ecdc472
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_git.bb
> @@ -0,0 +1,76 @@
> +# Copyright (C) 2018 Krzysztof Kozlowski <krzk@kernel.org>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +SUMMARY = "Broadcom Bluetooth firmware files"
> +DESCRIPTION = "Firmware for Broadcom Bluetooth devices. Note that in case of BT+WiFi devices, separate WiFi firmware might be needed."
> +HOMEPAGE = "https://github.com/winterheart/broadcom-bt-firmware"
> +
> +LICENSE = "Firmware-Broadcom-WIDCOMM"
> +NO_GENERIC_LICENSE[Firmware-Broadcom-WIDCOMM] = "LICENSE.broadcom_bcm20702"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE.broadcom_bcm20702;md5=c0d5ea0502b00df74173d0f8a48b619d"
> +SRC_URI = "git://github.com/winterheart/broadcom-bt-firmware.git"
> +SRCREV = "c0bd928b8ae5754b6077c99afe6ef5c949a58f32"
> +PE = "1"
> +PV = "0.0+git${SRCPV}"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit allarch
> +
> +CLEANBROKEN = "1"
> +
> +do_compile() {
> +    :
> +}
> +
> +do_install() {
> +    install -d ${D}${nonarch_base_libdir}/firmware/brcm/
> +    cp brcm/*.hcd ${D}${nonarch_base_libdir}/firmware/brcm/
> +
> +    # For license package:
> +    install -m 0644 LICENSE.broadcom_bcm20702 ${D}${nonarch_base_libdir}/firmware/brcm/
> +
> +    # For main package:
> +    install -m 0644 DEVICES.md ${D}${nonarch_base_libdir}/firmware/brcm/
> +}
> +
> +PACKAGES =+ " \
> +    ${PN}-bcm20702a1 \
> +    ${PN}-bcm20702b0 \
> +    ${PN}-bcm20703a1 \
> +    ${PN}-bcm43142a0 \
> +    ${PN}-bcm4335c0 \
> +    ${PN}-bcm4350c5 \
> +    ${PN}-bcm4356a2 \
> +    ${PN}-bcm4371c2 \
> +    ${PN}-license \
> +"
> +
> +RDEPENDS_${PN}-bcm20702a1 = "${PN}-license"
> +RDEPENDS_${PN}-bcm20702b0 = "${PN}-license"
> +RDEPENDS_${PN}-bcm20703a1 = "${PN}-license"
> +RDEPENDS_${PN}-bcm43142a0 = "${PN}-license"
> +RDEPENDS_${PN}-bcm4335c0 = "${PN}-license"
> +RDEPENDS_${PN}-bcm4350c5 = "${PN}-license"
> +RDEPENDS_${PN}-bcm4356a2 = "${PN}-license"
> +RDEPENDS_${PN}-bcm4371c2 = "${PN}-license"
> +
> +FILES_${PN}-bcm20702a1 = "${nonarch_base_libdir}/firmware/brcm/BCM20702A1*hcd"
> +FILES_${PN}-bcm20702b0 = "${nonarch_base_libdir}/firmware/brcm/BCM20702B0*hcd"
> +FILES_${PN}-bcm20703a1 = "${nonarch_base_libdir}/firmware/brcm/BCM20703A1*hcd"
> +FILES_${PN}-bcm43142a0 = "${nonarch_base_libdir}/firmware/brcm/BCM43142A0*hcd"
> +FILES_${PN}-bcm4335c0 = "${nonarch_base_libdir}/firmware/brcm/BCM4335C0*hcd"
> +FILES_${PN}-bcm4350c5 = "${nonarch_base_libdir}/firmware/brcm/BCM4350C5*hcd"
> +FILES_${PN}-bcm4356a2 = "${nonarch_base_libdir}/firmware/brcm/BCM4356A2*hcd"
> +FILES_${PN}-bcm4371c2 = "${nonarch_base_libdir}/firmware/brcm/BCM4371C2*hcd"
> +FILES_${PN}-license += "${nonarch_base_libdir}/firmware/brcm/LICENSE.broadcom_bcm20702"
> +
> +FILES_${PN} += "${nonarch_base_libdir}/firmware/brcm/*"
> +RDEPENDS_${PN} += "${PN}-license"
> +
> +# Make broadcom-bt-firmware depend on all of the split-out packages.
> +python populate_packages_prepend () {
> +    firmware_pkgs = oe.utils.packages_filter_out_system(d)
> +    d.appendVar('RDEPENDS_broadcom-bt-firmware', ' ' + ' '.join(firmware_pkgs))
> +}
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

