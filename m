Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF67C4167B
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 17:08:17 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.58821.1699031290999266493
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 10:08:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GtkBBLh2;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1ea48ef2cbfso1396485fac.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 10:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699031290; x=1699636090; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zm6ivgubMrTxqFw/H8531XHB54UgSrhEc43xcYb5RJs=;
        b=GtkBBLh2/vZHNaIysEAHSnkHRx97o/1Pn8Rz3YlPD/lE5zJ6B3kJL19QniRrVd9KSy
         cb+wGjR0xeEyRDG/u3+/XrGCEWIKtGMfQyZu6ZXZy2pLw+zmavcgbjgNJ9SIShoKlQDi
         2Ytz7IzxJ4GTHRJuwc49bGvKQTWhs0h6AAF4poEZrtNBGVC6sUyvKDhFJmeh4GfnVAld
         Q+9VvIc71W4fGwWq8f6AzncUNs7okdU8+RZJ4x7R+Fem2ZllT+hATjOUxwo0xBaZINZ8
         R4GHrLMog0mhMTkQgGJ6FR2EoY1qaLfYKn76De3z3Ntx5AshoFboJ0McoIAU/0XdKHDC
         pGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699031290; x=1699636090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zm6ivgubMrTxqFw/H8531XHB54UgSrhEc43xcYb5RJs=;
        b=hy6jf/PuAUQxOlo03/9ijBqZ+D0a4lsPGVKknV0KQTcdSkHWq3wfObU2xnyVcMNGw1
         L0gLCl3qhki+cnz2FYDg24O3lcSUcvvrlmftVcnYcu6kRXnivMBCpXzt3QfGz/dz5g79
         5axERqrKj4qKsrmfpaENWAWPCeVJi3Es1sWqyxJ5I816QLznyV4qzuRWMFDozIbEY+TS
         QE6D0fkEc36vto3CWa5BSbBg9FK4am6pypktPB6Gy7qvRqs/FUXWX3E5jm1kpi1piF6/
         TehDZrkot9rXZQEvIQqp4s7zjGKiT1SWUZfEfUEQRdsaWC+TQOv4Zgq8u+R4SdQggyMc
         7+NA==
X-Gm-Message-State: AOJu0YwkWW8PZzlpHCEPKUEvwdnMAxq7mm5SIIN0ocDr6pAOvu1yiFhz
	b1N5vL6CiQ9SItKCaoRbyPJ10gwo724cZhsHpS9s/Zd2jOc=
X-Google-Smtp-Source: AGHT+IFxgs+U3w2QKdm7FAQL0VSUQ18EZ91Tl0R53NAzGuAeEro4AtzuAimwp+6p72m/DnGXXJEb7PjqPgFI5ttBZoU=
X-Received: by 2002:a05:6870:9585:b0:1ea:746d:16f7 with SMTP id
 k5-20020a056870958500b001ea746d16f7mr24599351oao.6.1699031289934; Fri, 03 Nov
 2023 10:08:09 -0700 (PDT)
MIME-Version: 1.0
References: <20231103100246.3899364-1-jamin_lin@aspeedtech.com> <20231103100246.3899364-2-jamin_lin@aspeedtech.com>
In-Reply-To: <20231103100246.3899364-2-jamin_lin@aspeedtech.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Nov 2023 10:07:43 -0700
Message-ID: <CAMKF1sqiEcDb1XZ5ur_q211SKC95v+qSZA53Q9-0n0UGJ8rdmQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] ast2600:emmc: unsigned rot image align
 block size (512bytes)
To: jamin_lin@aspeedtech.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 17:08:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105871

we do not have this recipe in mets-oe. Did you intend to send this patch ?

On Fri, Nov 3, 2023 at 3:03=E2=80=AFAM Jamin Lin via lists.openembedded.org
<jamin_lin=3Daspeedtech.com@lists.openembedded.org> wrote:
>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Change-Id: I9b82f11cdf3e8524b99f8dfe6a102fedf2b87e5f
> ---
>  .../recipes-aspeed/images/aspeed-image-gen-secureboot.bb  | 8 ++++++++
>  .../recipes-aspeed/images/aspeed-image-emmcboot.bb        | 5 +++++
>  2 files changed, 13 insertions(+)
>
> diff --git a/meta-aspeed-sdk/meta-ast2600-sdk/recipes-aspeed/images/aspee=
d-image-gen-secureboot.bb b/meta-aspeed-sdk/meta-ast2600-sdk/recipes-aspeed=
/images/aspeed-image-gen-secureboot.bb
> index 7a6ae1fa0b..f0d046ae58 100644
> --- a/meta-aspeed-sdk/meta-ast2600-sdk/recipes-aspeed/images/aspeed-image=
-gen-secureboot.bb
> +++ b/meta-aspeed-sdk/meta-ast2600-sdk/recipes-aspeed/images/aspeed-image=
-gen-secureboot.bb
> @@ -193,6 +193,12 @@ make_recovery_image() {
>      python3 ${STAGING_BINDIR_NATIVE}/gen_uart_booting_image.py ${S}/${GE=
N_IMAGE_MODE}/${SPL_IMAGE_NAME} ${S}/${GEN_IMAGE_MODE}/recovery_${SPL_IMAGE=
_NAME}
>  }
>
> +make_emmc_unsigned_rot_image() {
> +    if [ -f ${S}/${GEN_IMAGE_MODE}/${SPL_IMAGE_NAME}.unsigned ]; then
> +        python3 ${STAGING_BINDIR_NATIVE}/gen_emmc_boot_image.py ${S}/${G=
EN_IMAGE_MODE}/${SPL_IMAGE_NAME}.unsigned ${S}/${GEN_IMAGE_MODE}/emmc_${SPL=
_IMAGE_NAME}.unsigned
> +    fi
> +}
> +
>  make_boot_partition_ext4() {
>      # Generate a compressed ext4 filesystem with the fitImage file in it=
 to be
>      # flashed to the user data area at boot partition of the eMMC
> @@ -617,6 +623,8 @@ python do_deploy() {
>          bb.build.exec_func("make_recovery_image", d)
>
>          if aspeed_boot_emmc =3D=3D "yes":
> +            print("Make emmc unsigned rot image")
> +            bb.build.exec_func("make_emmc_unsigned_rot_image", d)
>              print("Deploy mmc image...")
>              deploy_mmc_image(d)
>          else:
> diff --git a/meta-aspeed-sdk/recipes-aspeed/images/aspeed-image-emmcboot.=
bb b/meta-aspeed-sdk/recipes-aspeed/images/aspeed-image-emmcboot.bb
> index 4faf0d032c..9eb91e8b00 100644
> --- a/meta-aspeed-sdk/recipes-aspeed/images/aspeed-image-emmcboot.bb
> +++ b/meta-aspeed-sdk/recipes-aspeed/images/aspeed-image-emmcboot.bb
> @@ -61,6 +61,11 @@ do_mk_emmc_boot_image_g6() {
>          install -m 0644 ${SOURCE_IMAGE_DIR}/${ASPEED_EMMC_IMAGE_UBOOT_SP=
L_IMAGE}.${UBOOT_SUFFIX} ${OUTPUT_IMAGE_DIR}
>      else
>          install -m 0644 ${DEPLOY_DIR_IMAGE}/${ASPEED_IMAGE_UBOOT_SPL_IMA=
GE}.${UBOOT_SUFFIX} ${SOURCE_IMAGE_DIR}/${ASPEED_EMMC_IMAGE_UBOOT_SPL_IMAGE=
}.${UBOOT_SUFFIX}
> +        if [ -f ${DEPLOY_DIR_IMAGE}/${ASPEED_IMAGE_UBOOT_SPL_IMAGE}.${UB=
OOT_SUFFIX}.unsigned ]; then
> +            install -m 0644 ${DEPLOY_DIR_IMAGE}/${ASPEED_IMAGE_UBOOT_SPL=
_IMAGE}.${UBOOT_SUFFIX}.unsigned ${SOURCE_IMAGE_DIR}
> +            python3 ${STAGING_BINDIR_NATIVE}/gen_emmc_boot_image.py ${SO=
URCE_IMAGE_DIR}/${ASPEED_IMAGE_UBOOT_SPL_IMAGE}.${UBOOT_SUFFIX}.unsigned ${=
SOURCE_IMAGE_DIR}/${ASPEED_EMMC_IMAGE_UBOOT_SPL_IMAGE}.${UBOOT_SUFFIX}.unsi=
gned
> +            install -m 0644 ${SOURCE_IMAGE_DIR}/${ASPEED_EMMC_IMAGE_UBOO=
T_SPL_IMAGE}.${UBOOT_SUFFIX}.unsigned ${OUTPUT_IMAGE_DIR}
> +        fi
>      fi
>  }
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105853): https://lists.openembedded.org/g/openembedde=
d-devel/message/105853
> Mute This Topic: https://lists.openembedded.org/mt/102360863/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

