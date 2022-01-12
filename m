Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB4EC433F5
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 20:51:27 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.3405.1642020687158146295
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 12:51:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mZZHah0r;
 spf=pass (domain: gmail.com, ip: 209.85.216.54,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id
 b1-20020a17090a990100b001b14bd47532so7358222pjp.0
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 12:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2yK5xbdAczSEVvZaKJk3DM7+ps+U2c+CNAGf/8pOyXs=;
        b=mZZHah0rRd7N+u3OLabRFXRcdI6KXwzILg9QSUCyRxRwdrY6MkvV6fDPqr2CF5jKaU
         bCFdBT+kfykCv8jKO7ALlRHR2mEcg8wJVFir8aJvqCUvBMdXJ36iTKLgf+8KtRFCHTJl
         CCVO7GHhVwo888TYVs4aOh5w7LiggfEBNL2nm+YhxFmE6cD5QFblVDwlm0POfYYcVhpl
         EDt+q2dZZy/HcTxRtAAPU1rMLES1dGAHBdpjsUkB2Vc05tmNxLF5xIfvgyy+Eri6LEvl
         Bx05rKy8dtNWMqpc1UsQ9JbkMcn0ojOXAnem83435NGJPjPvBiSyyLN9S1sQFL0LGRFR
         U3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2yK5xbdAczSEVvZaKJk3DM7+ps+U2c+CNAGf/8pOyXs=;
        b=dVb+jxXegu31e2e49S6cFRDwYUHCE/zfz9GAAcNbzb5X/UQAvvWAngOtq0TG2IMGpf
         ISDq27t4K7AR8d2ziBMzOycaG1YFMoa2NA9XsSKTwOLrVl6m3du8C0637jOBeZOBfhun
         jAGd+zNcwSGVgGtT6rn16a1txrzcdCbC3yzMAe4GBuPhmGetYXaxZLtQLR2fID7DIimp
         KkZJB2pjiYATrJ47vv+rt2EFXGfZYX2EngND23YcNYD1prppMcZt133VseXgH+9AC5lb
         AqeEpnvBbAY3nIF24V9zp9ZbXK2vn/7AKWaqVioVAoHtUPiLcjwpbdwDxxOQSo0qNs75
         YVTQ==
X-Gm-Message-State: AOAM531KzNm2ADFRW7dUmHI8LGMsFclqkXi82xQshl2fbODdDXZR1cz4
	vvy+pYHXBmOaeCd5JlxAOXcLvwW7kvGImRaYd8g=
X-Google-Smtp-Source: 
 ABdhPJw9ofUPTzWGn4nTj5qLZP8vdMqA/JcG8H1f2yguAfhKHz8mCx0IpxLN4Ky9YcWGrfzMxzBDGfva8o6heXUYEnc=
X-Received: by 2002:a63:7407:: with SMTP id p7mr1263083pgc.14.1642020686549;
 Wed, 12 Jan 2022 12:51:26 -0800 (PST)
MIME-Version: 1.0
References: <20220112195021.2968153-1-raj.khem@gmail.com>
In-Reply-To: <20220112195021.2968153-1-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 12 Jan 2022 21:51:15 +0100
Message-ID: 
 <CALbNGRQkj7LU8zb66qsAmmLhQ-s-3NbPEGy9=t1cAOtUCJiekQ@mail.gmail.com>
Subject: Re: [meta-xfce][PATCH] thunar: Depend on libxml-parser-perl-native
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jan 2022 20:51:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94798

On Wed, Jan 12, 2022 at 8:50 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Also use native perl instead of build host perl
>
> Fixes
> checking for XML::Parser... configure: error: XML::Parser perl module is required for intltool
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
had no time yet to look for this - sorry & thanks Khem

Cheers

Andreas

