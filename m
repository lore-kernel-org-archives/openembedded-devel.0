Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C03C433EF
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 12:07:17 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.42812.1635768437393811158
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 05:07:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bCvrOp1o;
 spf=pass (domain: gmail.com, ip: 209.85.216.41,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id
 x1-20020a17090a530100b001a1efa4ebe6so11154139pjh.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 05:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hwTA12Q0T5OzA83jgHhnfjWCJHjxHGspB+1xA/3SGeo=;
        b=bCvrOp1oAbHcNp/4jNfPROm6XLFF95yBf1I+uRG97C5J6+uDiJyDqUWvB3g8no6WbK
         oSl8pN/6zbCwQHeqlfTSy5IErRyyUexo4XCBBm4bNV78rqcX1sIqZsbo/xEd/KLcHm4I
         RMOnmXlfG+ZIlt8LApJWW8GU9ht6F3i+0GzvSAg67geSdsObl6VW3bRMAH2txbogXZeo
         U/K7iRNBRBOqY71kJHVpWvl8yMo1q5HZi7tB2wpHRGPCFDbzR6tg60N1fkwHMLdlbi9g
         DbwK/EZHnw20UMf/aPpgpdXhvOfn77lkdMCRngAaInx1VrE+SOaPdReBaUmMOEAHtgpd
         Lw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hwTA12Q0T5OzA83jgHhnfjWCJHjxHGspB+1xA/3SGeo=;
        b=qAU4Mty/dqzFF1Ve4Tw6eoW8VzuF093ewrDdfCPPQQnBobmNZbaecn8MyKxG2qSTbF
         3xnqBisD9FdXMWa+/Dr2cjJK8qzj1M9PyhSX/rrbVEW3ETw6feIURtm6s4qqeMQcD6yu
         ik175YnjHDYkf/Z65roQTH/u/V6BeoGjQV3ZRsYSwW1Gt6flmtnd5WncxfVH8qsD8Bmn
         ZJuzlHNv2jb3jmpyFxqDfdbS6t29DZMkc8Ddhq27ahCIUm0vBu5yF6tRTCrBfTFOpiax
         9d1LbZ9U9/kNj12OQ0mWBLTbet1XPO+z6YAbQ0uJGoBC0buU4VVAllHrQDVSQ3my8iEg
         eilg==
X-Gm-Message-State: AOAM530dVQXbHW94SqPyXwqzRGHrqa+I0R5KfUdYz1MwPu2lmfaW4aa8
	GizjiMuH46aDz3jxl+yCmBte+HVAEuM41gV1L78=
X-Google-Smtp-Source: 
 ABdhPJwopw0NBcggvUefqMJPhIBrLtc8oZD7Z3o7DWsQRsY7m4iHCipqnSlVPbVvz1lGghojllE6Qde+UB+vVPZcQ/4=
X-Received: by 2002:a17:90b:4c0d:: with SMTP id
 na13mr29295140pjb.232.1635768436939;
 Mon, 01 Nov 2021 05:07:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211101114934.3646836-1-schnitzeltony@gmail.com>
 <20211101114934.3646836-12-schnitzeltony@gmail.com>
 <CANNYZj940v8Kruz72p2oM64A8aqwZGmZ=WBKj9Df6M_i0opG8g@mail.gmail.com>
In-Reply-To: 
 <CANNYZj940v8Kruz72p2oM64A8aqwZGmZ=WBKj9Df6M_i0opG8g@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 1 Nov 2021 13:07:04 +0100
Message-ID: 
 <CALbNGRRy3RtxQ7SnoGZKQRe8BPTVkQDDe_ForqkZz_VFObQxtQ@mail.gmail.com>
Subject: Re: [oe] [meta-gnome++][PATCH 11/31] gtk4: initial add 4.4.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Nov 2021 12:07:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93739

On Mon, Nov 1, 2021 at 12:51 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Can you please name this one simply 'gtk'? There's no reason to append 4 in there.
>
> Alex
>
Did this to make the difference clear and to be prepared once they
invent gtk5. What do others think?

Andreas

