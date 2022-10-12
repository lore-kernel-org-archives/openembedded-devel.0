Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07FAEC433FE
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 22:30:48 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web08.951.1665613844103673211
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Oct 2022 15:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TR8X9jWN;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id j188so13597866oih.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Oct 2022 15:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qmqm+8BtHPyfIqxhF7koalICUdBg0sl63/JcvFUbMmk=;
        b=TR8X9jWNmzMjy34ciMNg205mWZB9JbOtrGXHBDL2Qop9//HEf5TsBCFJ1xbQfvE+rO
         8sosE+xjJI2RrS7sL0iNHmn96Ysq1hiK07fY9UrAOR0vGSIC915o4lf3JMNp9h2T7Js+
         5b0B14dRy4hMv6iv05tQorKf6O3Hqv56QMnBEe+z0YGvbeUm/4+makj51Qc7aBoiAjUw
         VZcdQIl+rS0cYBf3C9TDn3UE4NbyXubkVi+kGJoGbVxJ+l1YhT+98u6Hp+3b8h9FgzOM
         D1QdCcH4sbW2aH4ASI0nSxdBZd2EmwfebgVZ4HlL4eZmVWhM/hvF4IL81AbJijo/vzg5
         o5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qmqm+8BtHPyfIqxhF7koalICUdBg0sl63/JcvFUbMmk=;
        b=ul1Eo9nK+Gj02LjopqZfO+dcWSctLJoIWQAHs/9jc0POcn5DGX7bwTM0Tzgl8UtzQL
         iyZrgDiBXYnDJmaXCO5dCfiLyYAbY/7qB+2IFq6mwVqbUcs6PHf0OiIdoX9R6Dz9BsOq
         ZpfzwooiDNvIPccLbGg+qp9YcVg04Q6oLbbZhp9uDc04Y9xChcKOagIVr4vYlBZdt1/H
         mm5knRPqbaW1qJykav5RC7EG0FY98Vi9PUAiEoQdbMJBZp5+ycM2P//zt/vyF2ooSQmM
         8kisZMKsmiIR5ghM5RPKpQuDOOU6WEgzROkTVMFId/oZ5jI+464M1Cv7k38M0cFjBWwV
         L0mQ==
X-Gm-Message-State: ACrzQf2SsXU3F5TV0F2RIMxwXRFPE/UzE9fhhqfnnIdqUf2ePgFgcmI5
	rj+2cETBvpoB0BtudkVmR8OeJastATtJkQqtH9nqQABuQ9asWw==
X-Google-Smtp-Source: AMsMyM7LKuXzbxXgpPcsiTF9+vNLKHurEf2J8UGEfzDaV7kLUZ9qw0QLNL3yrsFbcd+w88runy5nZkb+Jp0oXBNsMzI=
X-Received: by 2002:a05:6808:1910:b0:354:c2b:67e4 with SMTP id
 bf16-20020a056808191000b003540c2b67e4mr3230692oib.55.1665613843328; Wed, 12
 Oct 2022 15:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <MW4PR11MB582294CA64F65F30BD08496984229@MW4PR11MB5822.namprd11.prod.outlook.com>
In-Reply-To: <MW4PR11MB582294CA64F65F30BD08496984229@MW4PR11MB5822.namprd11.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Oct 2022 15:30:17 -0700
Message-ID: <CAMKF1srMzGA-y8+6mdV1gtYWfsJYvafhKkwvUu_HN-M=NwBfAA@mail.gmail.com>
Subject: Re: [oe] Security Advisory - yasm - CVE-2021-33461
To: "Polampalli, Archana" <archana.polampalli@windriver.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Oct 2022 22:30:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99152

On Wed, Oct 12, 2022 at 10:24 AM Polampalli, Archana
<archana.polampalli@windriver.com> wrote:
>
> HI,
>
> Could you please confirm is there any security fix providing for CVE-2021-33461.

seems to be open https://github.com/yasm/yasm/issues/161

>
>
> Regards,
> Archana
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99147): https://lists.openembedded.org/g/openembedded-devel/message/99147
> Mute This Topic: https://lists.openembedded.org/mt/94286070/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

