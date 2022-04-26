Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 945C5C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 06:19:11 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.3058.1650953946364770934
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 23:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p8RGsqow;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id q13so4498466qvk.3
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 23:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vC1XMH2albF64CuDVudFofJiNIR5SHx1qEcMjTTQNB0=;
        b=p8RGsqowJtcnJl4RO5e2BjiQGX0nPusf6bQT32V6Ec+mJqoPl7SoAwXeKCLUSStlYE
         HqfllTBZxEe5Z1+Wsn2lJwfalTH69Jg+T6440f3bsDrAm+cSDMnwS5YJGYE1zOlpM5qa
         iiRF2/w99wztzpra73cUSZYzJwbJp3Dc5e//K/JirCQ+I32DixxdljqgifPDhAaQtc50
         WrmyJIUrW+u4/FjZa3TtnrE2VXpoWI0v8gwWVg/Dv0jwHnyAwqClvv9TON6Xv0q/M1fZ
         vcLqyRsLh1apqJh4P1JUllmoO/Jl0SNvjIrcSrWiGSL95RD8sL6eoM6mLDghjbEjS4Sv
         JbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vC1XMH2albF64CuDVudFofJiNIR5SHx1qEcMjTTQNB0=;
        b=R9hRE0VRpw7y7Eem9CGGux14KpCZLUTNnoC9Lb5Q72GBM6L0+Zdo3M7iBcOTY47XNQ
         CcS1gsoAHsgpNrS59dXRU1qmg2S4oTQzSkxq7lvSNNiVs5iscLD9nF3luJqV+tGfUxJq
         4yuRKL9RYaBeJUFsBkxFDnItQBVVNT/u4SCPg1pcDif59dPqSCkn3cg+gnxQU8rXcdJj
         fMsGf0rdkXRQty2PXqR6Drpp6BaGnfC2s+ur5RNjD72UtWOIBgOQOBOoAJrNdOw8Ul0j
         q2+5Fc9Y7DHSXLuWGDa2mT+TIW7RMeOygZhUFADvq/VdXYwcm49zh+rQawofV2DxdU55
         rFFw==
X-Gm-Message-State: AOAM533NVNSQNtIyoYXpxqIshzbWlNhDZz9i8qo6qdDcGzR1mVGYAVaf
	3Dv8DZFCpUYsTNFMK1bT2pJc0AWfl8wQ/ph/Gkf7qP6CDm9tRw==
X-Google-Smtp-Source: 
 ABdhPJxRWo4E3SwwcoqkFM2YcjObnaQX4eySzzpSq2+5c5x3N9GG7XXj8RGEXC4brgauN0B6rdYG1QeRyjkFVa/RhiQ=
X-Received: by 2002:a05:6214:519b:b0:456:47e8:f04e with SMTP id
 kl27-20020a056214519b00b0045647e8f04emr362860qvb.110.1650953945385; Mon, 25
 Apr 2022 23:19:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220425063030.814264-1-yi.zhao@windriver.com>
In-Reply-To: <20220425063030.814264-1-yi.zhao@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Apr 2022 23:18:39 -0700
Message-ID: 
 <CAMKF1spsLvzBJQrvmVZX3ZKK9a8=-UpcVm54AEqM-PHRgqm-FA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] frr: add PACKAGECONFIG for fpm
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Apr 2022 06:19:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96792

I am seeing

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1681

This could be an intermittent failure due to build time race or
related to this change perhaps, I have seen this before too. Can you
look into it ?

On Sun, Apr 24, 2022 at 11:30 PM Yi Zhao <yi.zhao@windriver.com> wrote:
>
> The Forwarding Plane Manager support is optional, make it as
> PACKAGECONFIG.
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  meta-networking/recipes-protocols/frr/frr/frr.pam  | 2 +-
>  meta-networking/recipes-protocols/frr/frr_8.2.2.bb | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-networking/recipes-protocols/frr/frr/frr.pam b/meta-networking/recipes-protocols/frr/frr/frr.pam
> index 3541a975a..83c403c2b 100644
> --- a/meta-networking/recipes-protocols/frr/frr/frr.pam
> +++ b/meta-networking/recipes-protocols/frr/frr/frr.pam
> @@ -1,5 +1,5 @@
>  #
> -# The PAM configuration file for the quagga `vtysh' service
> +# The PAM configuration file for the frr `vtysh' service
>  #
>
>  # This allows root to change user infomation without being
> diff --git a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
> index 91e306f08..b6e180e2c 100644
> --- a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
> +++ b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
> @@ -36,6 +36,7 @@ RDEPENDS:${PN}:class-target = "iproute2 python3-core bash"
>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
>  PACKAGECONFIG:class-native = ""
>
> +PACKAGECONFIG[fpm] = "--enable-fpm,--disable-fpm"
>  PACKAGECONFIG[pam] = "--with-libpam,--without-libpam,libpam"
>  PACKAGECONFIG[grpc] = "--enable-grpc,--disable-grpc,grpc-native grpc"
>  PACKAGECONFIG[snmp] = "--enable-snmp,--disable-snmp,net-snmp"
> @@ -52,7 +53,6 @@ EXTRA_OECONF:class-target = "--sbindir=${libdir}/frr \
>                               --sysconfdir=${sysconfdir}/frr \
>                               --localstatedir=${localstatedir}/run/frr \
>                               --enable-vtysh \
> -                             --enable-fpm \
>                               --enable-multipath=64 \
>                               --enable-user=frr \
>                               --enable-group=frr \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96760): https://lists.openembedded.org/g/openembedded-devel/message/96760
> Mute This Topic: https://lists.openembedded.org/mt/90679546/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

