Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 540FCFA373D
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 00:50:47 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.4250.1667177442542546184
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Oct 2022 17:50:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hBYWSHFu;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-13bd19c3b68so12060416fac.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Oct 2022 17:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SUUiCyPeiEMgvSbuOYqzZaGdeiofxnD/hQtqbyL/U2Y=;
        b=hBYWSHFuXRiCtNeZEpaYT681Tw1362k16csrTLMA2umf+kHa+39wH+QAG3LYUGZrAO
         ncbBnlbbZnvnC4kv/PsZxE0ssM7F8PIUSatffVP7ZoTCfRKF4KFKLRd7RM8NXPkFk+jF
         nBu5RFQ+EiG7rKPmf8PJhIjUwsyNlziNZVJLqkechOeEPNInPGVa9ZstIQ7q/mpZ7Z/a
         rNTRrHJNrR1GLYuaOLqT8bI2dBbNsdDZK9EOvUID9LMdGu67dLBx3+smag/hEUVLKHyI
         f3cBerkj4Ks5YroO1BfXxs9R4hxvCSyJ47VsWYTELybxWZEl8uQliaCwFpKVgUIwxzud
         whOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SUUiCyPeiEMgvSbuOYqzZaGdeiofxnD/hQtqbyL/U2Y=;
        b=mDczFiHHeKV25GOpcM2MDcnvzU0P5oblaXZHlJ2iqGSolgig9tyEFelrxCwcoP9PLh
         yaIEJrGtfQNNpj+f+CAIMRX9fPMpYhqTIz4Z+eAaHTju0WQPPAmT4hh5d1sUMc6U0nx0
         5aMY23iN6i6Sk5sykVc07pJsi8KVaSWz/u2H8V3pyjuL6o3hSSUwWIaU467umGBNGFpa
         cDIpXVV1/JfPzycFARtdI8s8jKRMB/Bj6qFgtkDMGS0V7CfgCLaCN6GH3fUfwSm7uVeG
         86ACq/zMEzoN4NL0m5pBkPuV3P0u+cAdJ50ZT1wIaHcMz0PX//i3n/19jRjz7sBJV7Y1
         DVGQ==
X-Gm-Message-State: ACrzQf2g3WeXINk5Fpr/ANsXnY5dhiAv03DJOoyH4SFmVaICBxIn0twm
	inzK0vdGCBL+1Of3v2H6nKf1sgVnEU2R1Ea0+gE=
X-Google-Smtp-Source: AMsMyM6/7zg5ivIxKwQCc5fMW2tp4/s5vB6vg+rK6Y7s5m3Lp6hMoqJktWS9HWObjpUY3+JtXTc98b50GkLhIspYvLw=
X-Received: by 2002:a05:6870:80cd:b0:13b:9ee7:34cc with SMTP id
 r13-20020a05687080cd00b0013b9ee734ccmr15229021oab.55.1667177441637; Sun, 30
 Oct 2022 17:50:41 -0700 (PDT)
MIME-Version: 1.0
References: <ba7c7560-4a2d-717d-1c1e-644dd04ccea5@gmail.com>
In-Reply-To: <ba7c7560-4a2d-717d-1c1e-644dd04ccea5@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 30 Oct 2022 17:50:15 -0700
Message-ID: <CAMKF1srrR3xpWW2o8uV2YFuN_bOJdJh8f+LSkFHvaCC-uazNug@mail.gmail.com>
Subject: Re: dunfell merge request: Oct 30th
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 00:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99355

merged thanks Armin.

On Sun, Oct 30, 2022 at 11:50 AM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit 6792ebdd966aa0fb662989529193a0940fbfee00:
>
>    c-ares: upgrade 1.17.2 -> 1.18.1 (2022-09-11 13:49:52 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to 7203130ed8b58c0df75cb72222ac2bcf546bce44:
>
>    [dunfell] wireguard: Upgrade to 1.0.20220627 (module) and
> 1.0.20210914 (tools) (2022-10-30 14:47:43 -0400)
>
> ----------------------------------------------------------------
> Colin Finck (1):
>        [dunfell] wireguard: Upgrade to 1.0.20220627 (module) and
> 1.0.20210914 (tools)
>
> Hitendra Prajapati (2):
>        postgresql: CVE-2022-1552 Autovacuum, REINDEX, and others omit
> "security restricted operation" sandbox
>        dnsmasq: CVE-2022-0934 Heap use after free in dhcp6_no_relay
>
> Mathieu Dubois-Briand (1):
>        networkmanager: Update to 1.22.16
>
>   .../{networkmanager_1.22.10.bb => networkmanager_1.22.16.bb} |   3 +-
>   ...0001-compat-SYM_FUNC_-START-END-were-backported-to-5.4.patch | 29 -
>   ...1-compat-icmp_ndo_send-functions-were-backported-exten.patch | 32 -
>   .../recipes-kernel/wireguard/wireguard-module_1.0.20200401.bb   | 30 -
>   .../recipes-kernel/wireguard/wireguard-module_1.0.20220627.bb   | 23 +
>   ...rd-tools_1.0.20200319.bb => wireguard-tools_1.0.20210914.bb} |   4 +-
>   .../recipes-support/dnsmasq/dnsmasq/CVE-2022-0934.patch         | 188
> ++++++
>   meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb         | 1 +
>   meta-oe/recipes-dbs/postgresql/files/CVE-2022-1552.patch        | 947
> ++++++++++++++++++++++++++++
>   meta-oe/recipes-dbs/postgresql/postgresql_12.9.bb               | 1 +
>   10 files changed, 1164 insertions(+), 94 deletions(-)
>   rename
> meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.22.10.bb
> => networkmanager_1.22.16.bb} (98%)
>   delete mode 100644
> meta-networking/recipes-kernel/wireguard/files/0001-compat-SYM_FUNC_-START-END-were-backported-to-5.4.patch
>   delete mode 100644
> meta-networking/recipes-kernel/wireguard/files/0001-compat-icmp_ndo_send-functions-were-backported-exten.patch
>   delete mode 100644
> meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200401.bb
>   create mode 100644
> meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20220627.bb
>   rename
> meta-networking/recipes-kernel/wireguard/{wireguard-tools_1.0.20200319.bb
> => wireguard-tools_1.0.20210914.bb} (84%)
>   create mode 100644
> meta-networking/recipes-support/dnsmasq/dnsmasq/CVE-2022-0934.patch
>   create mode 100644
> meta-oe/recipes-dbs/postgresql/files/CVE-2022-1552.patch

