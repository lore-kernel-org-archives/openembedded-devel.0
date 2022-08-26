Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40814ECAAA3
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 06:21:24 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web12.33833.1661494874933859933
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 23:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EEJpS7Ci;
 spf=pass (domain: gmail.com, ip: 209.85.128.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-32a09b909f6so13329607b3.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 23:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=o+BYa/2enQor/lDTAj477ZIZSOAHH8X6CzjDGKEHnvU=;
        b=EEJpS7CiekZ+Y7Hac3+Rw3bmdadmagTmDHhIiky7YUs/WbdTIait354lS/4qaR7Mfy
         64Vxc/ENkUJzQUMTPOiF3AA+Fk+SgFbBX0m2XgKYdkt0gMzVGsQDCifJKW7XJL7RmBby
         5l6apWrJLFZ9Pz8UBWPFY2YhmiBovjykcND+rTRkbWQnv/FgaBzzAXLCfXlpwvOr/k2O
         c+Vb5ujXLbRsVsFTYtVEkJePGe7FWIXFjc4GgAhxL7Yu06HYsWlzA4IHik0cgvcFfJnn
         xjisXzQITaclBQr/9R3UMe1O5mw7t+BWp4G4xKJWzwUdWvmSPqCIATXrdswJQqiUyu+f
         XNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=o+BYa/2enQor/lDTAj477ZIZSOAHH8X6CzjDGKEHnvU=;
        b=oQG2pdb6jPJF5sq0if18tZbjNrAGe5UI7MwE6pmpeI29jUoPlS8YlE5BJ3gJojb1Jh
         JbA/2vC4l/PsVFckWCDUMStfi5mGOPh1yIjHJh5GioREKBIXdPyURZwg6ztqbSEol+Uq
         vZBJQD/W9JyNtKwKXxGjaLQpFx/pQxZg+cCQdEJGW3MnEJifeGq0KgGM/w1slBJJLmwf
         W+zZsHfDIBj6NJow6UlqTCogyOLxmzDq5j/mCzL72rnp0E9nNfebtbzpWce6c81ML0Bi
         6EkkD7/92Z4DBgjgNmbuSdyVMosLOuvEWQdne0nrcgF3i8QtRa3+mnP++H6syUhOewrA
         0NiA==
X-Gm-Message-State: ACgBeo0zwiH+bsm+V/1Mq/SS5iplrasG2ZUGI5ncX+TGKbJi7V0XYLRs
	jRwcBehoHs5538WiYlMfpJKlLic6SdrjrhiAbq7INFRf6ig=
X-Google-Smtp-Source: 
 AA6agR5jNUy/JyVEKTLUxA3aAFqhnRopDG4zg1GHlXUYn5ji8Qo7npsGP21FUqDBbkFV6ttnoF/eHrqvySiyKuQ0VHc=
X-Received: by 2002:a25:db42:0:b0:695:8d22:3a8e with SMTP id
 g63-20020a25db42000000b006958d223a8emr6097528ybf.428.1661494874063; Thu, 25
 Aug 2022 23:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220826014318.182478-1-potin.lai.pt@gmail.com>
In-Reply-To: <20220826014318.182478-1-potin.lai.pt@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 25 Aug 2022 23:20:48 -0700
Message-ID: 
 <CAMKF1sobkUObF7vRenqbLU2-WcO_bsje18_ubxNna4un0HcYig@mail.gmail.com>
Subject: Re: [oe] [meta-networking][RESEND PATCH v4 1/1] mdio-tools: add
 recipes
To: Potin Lai <potin.lai.pt@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	Patrick Williams <patrick@stwcx.xyz>, Potin Lai <potin.lai@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 06:21:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98475

this recipe is now in master already, please check w.r.t. this version
and if any changes are pending send an incremental patch.

On Thu, Aug 25, 2022 at 7:22 PM Potin Lai <potin.lai.pt@gmail.com> wrote:
>
> From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
>
> Self-description from the README: mdio-tools is a low-level debug tool
> for communicating with devices attached to an MDIO bus.
>
> Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> ---
> LINK: [v3] https://lore.kernel.org/all/20220608163628.5745-1-potin.lai.pt@gmail.com/
> LINK: [v2] https://lore.kernel.org/all/20220201142608.186135-1-enguerrand.de-ribaucourt@savoirfairelinux.com/
> LINK: [v1] https://lore.kernel.org/all/20220107150722.2221609-1-enguerrand.de-ribaucourt@savoirfairelinux.com/
>
> change v3 --> v4:
> * update license to follow SPDX format
> * mdio configs update and merged in yocto-kernel-cache
>   LINK: https://git.yoctoproject.org/yocto-kernel-cache/commit/?h=yocto-5.15&id=0d58e2d6a7824df62129af91bbe9fadfdb5f9dce
>   tested on yocto-kernel-cache commit: f7f709bf874f85baff9f2fb0ac0341c08399b144
>
> change v1 --> v2:
> change v2 --> v3:
> * update version to 1.1.1
>
> change v1 --> v2:
> * moved in recipes-support
> * removed version in mdio-tools_1.0.1.inc filename
> ---
>  .../recipes-support/mdio-tools/mdio-netlink_git.bb  | 13 +++++++++++++
>  .../recipes-support/mdio-tools/mdio-tools.inc       |  9 +++++++++
>  .../recipes-support/mdio-tools/mdio-tools_git.bb    |  9 +++++++++
>  3 files changed, 31 insertions(+)
>  create mode 100644 meta-networking/recipes-support/mdio-tools/mdio-netlink_git.bb
>  create mode 100644 meta-networking/recipes-support/mdio-tools/mdio-tools.inc
>  create mode 100644 meta-networking/recipes-support/mdio-tools/mdio-tools_git.bb
>
> diff --git a/meta-networking/recipes-support/mdio-tools/mdio-netlink_git.bb b/meta-networking/recipes-support/mdio-tools/mdio-netlink_git.bb
> new file mode 100644
> index 000000000..b50d33f90
> --- /dev/null
> +++ b/meta-networking/recipes-support/mdio-tools/mdio-netlink_git.bb
> @@ -0,0 +1,13 @@
> +require mdio-tools.inc
> +
> +DEPENDS += "virtual/kernel libmnl"
> +# This module requires Linux 5.6 higher
> +
> +S = "${WORKDIR}/git/kernel"
> +
> +inherit module
> +
> +EXTRA_OEMAKE = "KDIR=${STAGING_KERNEL_DIR}"
> +MODULES_INSTALL_TARGET = "install"
> +
> +RPROVIDES:${PN} += "kernel-module-mdio-netlink"
> diff --git a/meta-networking/recipes-support/mdio-tools/mdio-tools.inc b/meta-networking/recipes-support/mdio-tools/mdio-tools.inc
> new file mode 100644
> index 000000000..a8a435fad
> --- /dev/null
> +++ b/meta-networking/recipes-support/mdio-tools/mdio-tools.inc
> @@ -0,0 +1,9 @@
> +DESCRIPTION = "A low-level debug tool for communicating with devices attached to an MDIO bus"
> +SECTION = "networking"
> +HOMEPAGE = "https://github.com/wkz/mdio-tools"
> +LICENSE = "GPL-2.0-or-later"
> +LIC_FILES_CHKSUM = "file://${WORKDIR}/git/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +SRC_URI = "git://github.com/wkz/mdio-tools.git;protocol=https;branch=master"
> +SRCREV = "07cbff2d5e2de05037e5e7edd5044d678394c8d1"
> +PV = "1.1.1"
> diff --git a/meta-networking/recipes-support/mdio-tools/mdio-tools_git.bb b/meta-networking/recipes-support/mdio-tools/mdio-tools_git.bb
> new file mode 100644
> index 000000000..cd4df3da0
> --- /dev/null
> +++ b/meta-networking/recipes-support/mdio-tools/mdio-tools_git.bb
> @@ -0,0 +1,9 @@
> +require mdio-tools.inc
> +
> +DEPENDS += "libmnl"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit pkgconfig autotools
> +
> +RDEPENDS:${PN} = "kernel-module-mdio-netlink"
> --
> 2.31.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98449): https://lists.openembedded.org/g/openembedded-devel/message/98449
> Mute This Topic: https://lists.openembedded.org/mt/93262641/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

