Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F699C433EF
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 23:57:54 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web08.17.1643414273146665198
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 15:57:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=yevwJlsf;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.52,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qv1-f52.google.com with SMTP id d8so7391929qvv.2
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 15:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=T52ukAVbnpxgh/LR3kCMKhyKLedLLsHKZz5wggb/naA=;
        b=yevwJlsf3sXYe381TzFixoKlmy6if+Ud5l9l3n9BV2vcAQknkpheT8+Jt/xpiI7tMO
         ryS6gLwUk2H/V7eeJVDzg5Ld6+sHA0930xLPsyfmhZesFpPm55SM55Iqf1GUA28/Iic8
         OEavT1InGuixm5OkhIEMnppSFZFIvpTcyprCFC4JW5vESokgb0n6qe9geUhtX/Dvda0s
         AL7JFk5u29tOQxHV13LoXnWzCUaFNh9EMrJK+LBF/GnPxOhlvBZoVKmaWJh+H0gxodDq
         pGBL0xXwlW6Au2Tq2xQYm9Yo8aoQ9YIBZjnx2zrFK6XqqiRdghgh12LFM8DEqoyE68QM
         L1Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=T52ukAVbnpxgh/LR3kCMKhyKLedLLsHKZz5wggb/naA=;
        b=a+A1XY5fjA1eWGVzogJnuBiyU/R1/EHVVksUexlwnWwx6PiLdUelKM281/7TbYivJj
         xrEGsfckdugdaCzhZnZJ9fsaoKhCUznU6dKmrnVg/2XEEj/58bj5rbOJs86z6piI9PId
         j+egh6RRG1T63X+zm+ll3kWOHVuBwwJF9DS/EnOv7Qn6sbngYpj/MxNtqPoX/1XzEVRB
         MRB06p3X47OJ6IoJ5bzcnuYV0yad1hvlY+lGhCYHYZlrIAbznRb1jrUOYvD3VUTpt0AA
         RNzVYVJgbVouEetCbwnAPI3TIHUUFn9Rj0YawGFPB4Fapy8SoYtZntO4RBDOlnrBhHSH
         NIxw==
X-Gm-Message-State: AOAM530YeEEQyVBqqYRuMwpkzD2EZWQ2EOTxnsN3aCX/4Rd7ZsBJbFTj
	I8SgzBzR3R73vDSDtirKixyU75gGEDF8idkx
X-Google-Smtp-Source: 
 ABdhPJzgyniZE2cNTEeyBOb9zVaWuB+jnps6tbvie3d1RD4e/I+d0o6SlErQq0OZrpCHXNQ8EhIwxw==
X-Received: by 2002:a05:6214:1d22:: with SMTP id
 f2mr9962749qvd.70.1643414271814;
        Fri, 28 Jan 2022 15:57:51 -0800 (PST)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com.
 [209.85.160.181])
        by smtp.gmail.com with ESMTPSA id
 v14sm4032059qkl.128.2022.01.28.15.57.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jan 2022 15:57:51 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f181.google.com with SMTP id y17so6591865qtx.9
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 15:57:51 -0800 (PST)
X-Received: by 2002:ac8:5e08:: with SMTP id h8mr8207301qtx.82.1643414270851;
 Fri, 28 Jan 2022 15:57:50 -0800 (PST)
MIME-Version: 1.0
References: <20220128195459.216370-1-festevam@gmail.com>
In-Reply-To: <20220128195459.216370-1-festevam@gmail.com>
Date: Fri, 28 Jan 2022 20:57:39 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKo=OPqMvbuP1p6zJSPFObxskdaBPjVW8M2LKLQ3rzwHgg@mail.gmail.com>
Message-ID: 
 <CAP9ODKo=OPqMvbuP1p6zJSPFObxskdaBPjVW8M2LKLQ3rzwHgg@mail.gmail.com>
Subject: Re: [PATCH v4 meta-oe] rtc-tools: Add a recipe
To: Fabio Estevam <festevam@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Heiko Schocher <hs@denx.de>,
	Alexandre BELLONI <alexandre.belloni@bootlin.com>,
 Khem Raj <raj.khem@gmail.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jan 2022 23:57:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95164

Em sex., 28 de jan. de 2022 =C3=A0s 16:54, Fabio Estevam
<festevam@gmail.com> escreveu:
>
> From: Fabio Estevam <festevam@denx.de>
>
> rtc-tools is a useful utility developed by Alexandre Belloni
> for testing RTC kernel drivers, such as y2038 support.
>
> Based on the initial recipe from Heiko Schocher <hs@denx.de>.
>
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

