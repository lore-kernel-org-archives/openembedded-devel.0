Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A69C5479D
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 18:25:02 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.32201.1673461499078047301
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Jan 2023 10:24:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F8pmmulz;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id r205so13414232oib.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 10:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/b0uVFSh+a1QHi4o1LHOb5sqJdkk1M3+gwRsjA05faQ=;
        b=F8pmmulz++iR2MszJ2lRYX0HC59EEFAXpTlXS7S10sHiqsBrrzjAZE6vPs9k++Q/U9
         xRVGyL7lU9/FxuSK5wifRK2cZQKbYasPhtdv9879ovbzEv5pnM/CFtaZS/TgCIIIWtS3
         oHIhp4aKZO4Tm+740aCxT1nVNrzpBNq9E+PGrlx3a7Hxjx/93AJUkMgijbMMBH5ZdSVO
         7XOTD42QgrJqyslJZYyO72XEdaG+Z0A3wOmUCgsmCsDqWhmwSKS/Tg+dpFYa3eZh7iS5
         sQgvb1inCuthLSrX0Zg5wAC7lTP1UEXGTgi62SltGX88lD2+1gRXDJ+yuIvubm8Moq/B
         yvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/b0uVFSh+a1QHi4o1LHOb5sqJdkk1M3+gwRsjA05faQ=;
        b=eq4xqyp/pXTpZqcM7Xd5SaSAThR1zej5CVLUlXf0RoFX9BeGmi78enmL8lRKku+/2d
         y0vVtqEbVM3Pc8HDMZlN8M+AeGESIHTwrpJ0bG5l1L+cg35cEn4Ss/1vYSO1uOdoau10
         +uHu23LbYRZgGDycKlB3FP2vZKMak+Q0bvCf0zHS7IFNaUzFuK55SMajGN2dwAW8vg2l
         XXFIxQ8o8BTNnX+iovaogqlRPauwykuQOrWdvIkh/tciHhdjNTR7XLjPZ/sdyZ49G8Uk
         MGUwliTVK0oZAe/LakbbRf2YnCErKjnkSaPDpoWyHZskG1S1AcV9urf3za+adfvSXkXX
         9Rcg==
X-Gm-Message-State: AFqh2koNW+cAIU+3Ul0neH/rqMBd7xLuMbgpTlYym04r9ddxPxcIJAxK
	53ZAkuQLRo+OTc1tB92jqV4+AYNLdGqxDMVfNSA=
X-Google-Smtp-Source: AMrXdXtyhxevdn0oKwBzD8qNfyS/tyyUxWLtVrCgudJgwF2MBIHQD3j2nq4ihGIuB1L4NMPingLKo+ulnTCw61iYQ+s=
X-Received: by 2002:aca:3855:0:b0:35c:53a9:5513 with SMTP id
 f82-20020aca3855000000b0035c53a95513mr4496540oia.262.1673461498292; Wed, 11
 Jan 2023 10:24:58 -0800 (PST)
MIME-Version: 1.0
References: <ec4b606e-aa99-edab-0303-2525dee8339a@gmail.com>
In-Reply-To: <ec4b606e-aa99-edab-0303-2525dee8339a@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Jan 2023 10:24:32 -0800
Message-ID: <CAMKF1spve5=4_+Xb0CzUJH-ZoGVned2QQ5Ocafs+TEOqJMRQDA@mail.gmail.com>
Subject: Re: kirkstone merge request: Jan 11th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 18:25:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100557

merged thanks Armin

On Wed, Jan 11, 2023 at 9:16 AM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit a9c25bef8882a69fd35ea7dbac3d978ce440fe06:
>
>    mariadb: Upgrade to 10.7.7 (2023-01-04 11:46:45 -0500)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to 1f31570d0795da90083d1dbf28127c90908e30ee:
>
>    multipath-tools: fix QA "dev-so" regression (2023-01-10 09:26:26 -0500)
>
> ----------------------------------------------------------------
> S. Lockwood-Childs (1):
>        multipath-tools: fix QA "dev-so" regression
>
>   meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>

