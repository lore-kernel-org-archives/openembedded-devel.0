Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C674CC43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 11:00:00 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.23514.1656586791298744087
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 03:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MRri/Kgf;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id cu16so29102140qvb.7
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 03:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+YnvmOZAueX/iVj4VRVj6RygcpK3IuNEls3VpMh1/sg=;
        b=MRri/KgfS4w7LXrxUJHKWK9g654NzxoWLL28zI3325LRx9KJnY+YSr1R+khXdNrKIl
         FgV0s3W7pHYJ3kGHQTt+hbAY6H3HZWfhukQQ/xX8vZ4hF+9Z2pWH4/qb2V0y9mmMTtYV
         XkiW0BaY+l6HT0x3waWzzEbZWSH0XgOyvLKdcddwESckpaMYxeXZ5cRX/c9vZ9DZY+Av
         4POvhCaKxL+/RmiVEBgQXGdDTkWTdr/Re764/ncOKUgmURUbpa15vkc6NFrHVlkV8ffG
         P8YYgOJmVyUTJie0kDa+VJxA/Mg8tt2/vwzDPzkr+shuEEh/Us4pN3+BkhkaBkywCJf8
         +iog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+YnvmOZAueX/iVj4VRVj6RygcpK3IuNEls3VpMh1/sg=;
        b=pqQNajQvJ5QBRIFSW273it74eP1PIlRdEFsFWfToP3N+eDaDcxBv6ovz7kZ5YfGs5q
         622oRdPbQQcdXJ/ivlKdZEmZwP13DtLp1a2I0X8nGdWUZRsUD5A/BvePo+/iLZ5nz3AA
         KtpZiYYFP2XQTInb+a0vygFujrT0Kt1ciOupbQ9H0m7O/76gWHr2kugfHyyKRabvVy4T
         RLDzDF12lJ9fEHGI5OwaMDNIMczCJCLcM6DEynEanNdG6Jfwr7MTkOd9ak7ZMoNQ7lfG
         AC7vGVL40dXBoOsYgC52+B4HL0FczBi1B9bDYybkHCNWmNWu0W/lvb5bWrIM/87pJBSk
         DO3g==
X-Gm-Message-State: AJIora8ou8f4m6rwDpXcMS/nVb9UoFCf4A4gF+RRKf7mHUHRm9LybwBv
	EcUMef64t5k5JkrJaGSJej6nfn9Pbu3NWQuJ4b8=
X-Google-Smtp-Source: 
 AGRyM1sKf7pXkfvX7JHdJXt+ky/TwfmS3ZfrPo2nI13+HnCZ6OJoDFWFVQma4roIKx4l1fmObqAsSLJYX6h1YhiO2E4=
X-Received: by 2002:a05:622a:13ce:b0:31a:b4ce:1679 with SMTP id
 p14-20020a05622a13ce00b0031ab4ce1679mr6745289qtk.330.1656586790356; Thu, 30
 Jun 2022 03:59:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220608163628.5745-1-potin.lai.pt@gmail.com>
In-Reply-To: <20220608163628.5745-1-potin.lai.pt@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 30 Jun 2022 06:59:24 -0400
Message-ID: 
 <CAMKF1sqpcSuHwd5tPz6R=WQ=Yo=yZneTCYSk9LQhq98kBgQPDg@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v3 1/1] mdio-tools: add recipes
To: Potin Lai <potin.lai.pt@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Patrick Williams <patrick@stwcx.xyz>,
	Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jun 2022 11:00:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97637

This fails to build on master with latest linux-yocto for kernel.

https://errors.yoctoproject.org/Errors/Details/659130/

On Wed, Jun 8, 2022 at 12:39 PM Potin Lai <potin.lai.pt@gmail.com> wrote:
>
> From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
>
> Self-description from the README: mdio-tools is a low-level debug tool
> for communicating with devices attached to an MDIO bus.
>
> Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> ---
>
> LINK: [v2] https://lore.kernel.org/all/20220201142608.186135-1-enguerrand.de-ribaucourt@savoirfairelinux.com/
> LINK: [v1] https://lore.kernel.org/all/20220107150722.2221609-1-enguerrand.de-ribaucourt@savoirfairelinux.com/
>
> change v2 --> v3:
> * update version to 1.1.1
>
> change v1 --> v2:
> * moved in recipes-support
> * removed version in mdio-tools_1.0.1.inc filename
>
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
> index 000000000..a37500d93
> --- /dev/null
> +++ b/meta-networking/recipes-support/mdio-tools/mdio-tools.inc
> @@ -0,0 +1,9 @@
> +DESCRIPTION = "A low-level debug tool for communicating with devices attached to an MDIO bus"
> +SECTION = "networking"
> +HOMEPAGE = "https://github.com/wkz/mdio-tools"
> +LICENSE = "GPLv2"
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
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97444): https://lists.openembedded.org/g/openembedded-devel/message/97444
> Mute This Topic: https://lists.openembedded.org/mt/91627189/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

