Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D749C4332F
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 16:04:41 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web12.9015.1666109079152604498
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Oct 2022 09:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ji2cqfLy;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-132fb4fd495so17308112fac.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 09:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tLgi/VfQL4MQESPzf1drshUzDgPFDHTaWFrG9RE8BLg=;
        b=Ji2cqfLyStREbR35eKW1aDC2jMQVKP8r+PMAqh73aHxlcyKcBs1e9xmyX8p8scEQ1x
         tp0s0WuJqcf/UVwZCsnu+hG2Io6LaaOGJ6RCGbikvLy/VaRvKSxPLVO1cUZFv9AvBuFk
         MjzR//4HCzYCrWpkPfwXLzwQ0R3eu84dJ55h8dvG3UBwhkocKez2ZVZ/lZIEPGbZJHLH
         FKkOXgltSzArfJO8HfG1h9bst3Kw8K1bkzixKE1gCkGmxde6HDoZdK3Z13n6+Yrax4Hy
         jjEmhEdeMJCdwWEC+GPe5mJi4ry3f1hBLPE/RWOE2V0L9Uo5j4SSyYkmH2p6Dztdel14
         BlLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tLgi/VfQL4MQESPzf1drshUzDgPFDHTaWFrG9RE8BLg=;
        b=YwQWDd5iybLew8FluaeCG9dS2t12Snp0VcygWg0KaojkCsO7uf8f7Ab5mQ1cGu+uUx
         xzMfYE3HWmF1Aer8DyVEXpTPhSsoy0OJd4EyXDfDsa33Qoz0CjfXG0taYC7r/+TOqaR7
         glD2p0HbaKlZ5MoknSP4z1qWnExmPQtNLBCW72hPKzVklCEV/CEpfEubdcyO54bVS3fQ
         2O3Pe7arS3MO2MrR9xckqCp4HhtzrF8WC9gp/qE4Cqz/1XErkeTnP5HR5Vw6NqbV9bDR
         9bPK/LH6gmODR4srtF80iGSBcJcz4VcxRGKlCPrNc81mpr3HdMHMRP+cbnsYkcI2pGcf
         dFbA==
X-Gm-Message-State: ACrzQf2AQd6GzpOCWcWaxh6ZwtEfw6FSft4Tb9A1wNrTN1SJ2t1v+2IH
	o3WyM17LwSrUMo2iyx2KQIsjt6bYb9Wx++Z2QEk=
X-Google-Smtp-Source: AMsMyM68ZWkLmqN+qv/PGtCNPY/sGWyYRAtoRqepgfuknZq7hJCc2VqwXsAnHYfKLJ0VL1N/LDg5gXhDrwUXLgcMcdI=
X-Received: by 2002:a05:6870:b00b:b0:127:2d3d:3c16 with SMTP id
 y11-20020a056870b00b00b001272d3d3c16mr17987860oae.262.1666109078403; Tue, 18
 Oct 2022 09:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <20221017061859.2168842-1-sebastian.suesens@baslerweb.com> <21639.1666082906059966118@lists.openembedded.org>
In-Reply-To: <21639.1666082906059966118@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Oct 2022 09:04:12 -0700
Message-ID: <CAMKF1sr6i2EZnm5X60C-CA-0hLc0rrK9ZmCB0Bp9hLF3=e3tpg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] double-conversion: added double-conversion lib
To: Sebastian Suesens <sebastian.suesens@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 16:04:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99240

On Tue, Oct 18, 2022 at 1:48 AM Sebastian Suesens
<sebastian.suesens@gmail.com> wrote:
>
> Hello,
>
> I sent this patch to clarify, if it is possible to include the double-conversation lib to meta-oe.
>

Its staged in master-next

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99239): https://lists.openembedded.org/g/openembedded-devel/message/99239
> Mute This Topic: https://lists.openembedded.org/mt/94378967/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

