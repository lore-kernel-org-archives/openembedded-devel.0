Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4628C43334
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 07:29:29 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.9157.1654586965156994761
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jun 2022 00:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jW4dZyo5;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id i1so14113754plg.7
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jun 2022 00:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e+ZOTCvNCeruiqdrtrwI+g7XbwHzPoRLkHRN6H0qC50=;
        b=jW4dZyo5ApRSD5dItmlzi4dzKu2UnAAWLtRghYQ4zpSeuYQqpYAXkdmdmefkOmCmiK
         nlGxvXZRsFqXQObbET+5DKm18AnXWvUWz7Rkb4c7vgMrSKbF4bv0UL5zXQ8heTptcSca
         8LVp3NK5cfE3wS9gZ+TXJysMjKBLlLZ0RZAyzpe0+/1wB+ZZBiCTM+o/CW7haVUMtOq9
         0llBOErj3rBs8ELywAvgisWihtMV6Apee4b0G0y70zcQoIO57QWOyLg695Li2Dp6MnPl
         PuBhnaVQwwCd/uHbHowZVKz7FAnfQM1HBMQEDAeZhQc0s5vEat4hU5EiPCGVdOdRSynj
         2Sog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e+ZOTCvNCeruiqdrtrwI+g7XbwHzPoRLkHRN6H0qC50=;
        b=mtzI6Nigb8cTJGzIdyLXdWgNJXD0Nbl2V9UmDthH5TTTPkhSL+zc6jPcCvx1Id9Hy2
         bvfaA3P6/+r1CI1+GpSMiIuLrDmS/ZRAgv1QT8R1FHEEp1GteW8a5nkwr4mGuRxzBaqB
         VLldgz8OR/Ib9ny+HayUbECf0YHJBtKBbdoobpEp733ytRJxKBTyXh1OAKDX+iUnNfYY
         Yz/Jj4B0/nm+Q4I999X6CuU1AcMxN9uDuj+7aWpxxx95d7VJ1MZs2qPEGiuGYHZEIyhq
         SRmd5B7dpzw688ji6BUVEpmCWxd/yia2v4fwI0YUHrIDsGXpbmJRuVX6PVLOPwGQU/aB
         vIYg==
X-Gm-Message-State: AOAM531PKS2fwIIXYlo3hAEp720RxJZR6slSbmyKIvwQ/92xiSUOouci
	bHwRgfa4KDJTDj/EHbPsnb78PaLj/Wk2ZvkjAh4=
X-Google-Smtp-Source: 
 ABdhPJzGvatQSh3Ij5oTzi3TMuH+hbZmPyAluByavD505qWbyM7h4VCy8rsqPrDdmDrmxga3oglYqyhKVvF6HXGpbLs=
X-Received: by 2002:a17:90a:a085:b0:1e0:97ee:c263 with SMTP id
 r5-20020a17090aa08500b001e097eec263mr30906175pjp.110.1654586964632; Tue, 07
 Jun 2022 00:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220606220137.1887491-1-adrian.freihofer@siemens.com>
 <20220606220137.1887491-4-adrian.freihofer@siemens.com>
In-Reply-To: <20220606220137.1887491-4-adrian.freihofer@siemens.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 7 Jun 2022 09:29:13 +0200
Message-ID: 
 <CALbNGRSNqCmjmF-re3zeqfEh2gp-j41SGdxUfzKwiyqRC4HpMg@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 3/5] networkmanager: use nftables by
 default
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jun 2022 07:29:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97439

Hi Adrian,

just out of curiosity: Why do you suggest to prefer nftables over iptables?

Andreas

On Tue, Jun 7, 2022 at 12:01 AM Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
>
> From NEWS file of netowrkmanager 1.32:
>
> firewall: add nftables firewall backend for configuring IPv4 NAT with
> shared mode. Now two backends are supported, "iptables" and "nftables".
> The default gets detected based on whether /usr/sbin/nft or
> /usr/sbin/iptables is installed, with nftables preferred.
>
> With this change nftables is not the prefered backend also with OE. But
> it's still possible to set NETWORKMANAGER_FIREWALL_DEFAULT back to
> iptables.
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  .../networkmanager/networkmanager_1.36.2.bb                 | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
> index 9fc43dceb5..55eb3e7024 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
> @@ -42,6 +42,10 @@ NETWORKMANAGER_DNS_RC_MANAGER_DEFAULT ??= "auto"
>  # ['dhcpcanon', 'dhclient', 'dhcpcd', 'internal', 'nettools']
>  NETWORKMANAGER_DHCP_DEFAULT ??= "internal"
>
> +# The default gets detected based on whether /usr/sbin/nft or /usr/sbin/iptables is installed, with nftables preferred.
> +# ['', 'iptables', 'nftables']
> +NETWORKMANAGER_FIREWALL_DEFAULT ??= "nftables"
> +
>  EXTRA_OEMESON = "\
>      -Difcfg_rh=false \
>      -Dtests=yes \
> @@ -238,7 +242,7 @@ FILES:${PN}-daemon += " \
>      ${systemd_system_unitdir} \
>  "
>  RRECOMMENDS:${PN}-daemon += "\
> -    iptables \
> +    ${NETWORKMANAGER_FIREWALL_DEFAULT} \
>      ${@bb.utils.filter('PACKAGECONFIG', 'dnsmasq', d)} \
>  "
>  INITSCRIPT_NAME:${PN}-daemon = "network-manager"
> --
> 2.35.3
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97434): https://lists.openembedded.org/g/openembedded-devel/message/97434
> Mute This Topic: https://lists.openembedded.org/mt/91588569/3617609
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [schnitzeltony@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

