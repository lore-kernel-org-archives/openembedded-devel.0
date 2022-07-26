Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8DEBC00140
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 17:34:34 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web08.9834.1658856870279061215
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 10:34:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XmUUrMmA;
 spf=pass (domain: gmail.com, ip: 209.85.222.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id c3so11522920qko.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 10:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ua2hkHX++OPlH5sir+cLg63R/LJbyI5+gCmnilA1IDg=;
        b=XmUUrMmAl3Biw2Fy77xMdwPe6fEo0j6ErmxvG24sMzahC2hwfRq4uQAbkYHAcpZK3v
         cKhOvI//MMaN8xreM5bouArP7oTcftwmUds3ULCaRGPwcquvefTEM5H7wg2xVHCGIZfL
         Go3V3V71qULJG05xK6rhSiskq/NruUbz+aROQBsztLv9sDVALkGIFFJD6lX2Z6jW8H1v
         B8hBmVmu+E9Sctm3gPFz4AqucoxY/CMvSXnzCWM/kgUHQJG4EdhsE8ibaXqDDLz4EjfJ
         kI/WvZUDyhOKp68HCcsz4LFB8xiH8pA8MRa97sJ/Oc5wG8w4YmTREvxH2WAAFte0jv5D
         nzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ua2hkHX++OPlH5sir+cLg63R/LJbyI5+gCmnilA1IDg=;
        b=SuChfj8ca+9vFssaMe2bHhpuHEue/j9qZ2LlnUWvqjLm+0k/inWkIMYF+hVwZXK9vN
         qEBxNsk8S4HpMQ2Fo8To86ogQu+6DVS7DQHdPVc1bUwaXV08XxzVMi88wa4HDomnOyCT
         0CizuMeiIo86bJa+nAYwm+oZbLy9tgqVzsh3ZE8sPD+k0lZl4+47ONH9H14ikzW1sluy
         XODEK2XwCtI9IuuabEc4ovFo9cD0ryBO9AohhkDwc4RR6SfonIsJlvVHIl6LLAdmnein
         ck5toXcvj8g98G3+MdhuabBwk4IYo9TP+nL4hskxWkWXWYIlcANDjfn2WLc5e7dQCTwl
         TSww==
X-Gm-Message-State: AJIora+iND5HVpxPoOaYM/5nrPiDwWCvASyvYGu9RklKo2gjhv4qGqC0
	Ne0QtyMI6lvCGIDB0H6AUWU+/lDyUvg9I2sJiDg=
X-Google-Smtp-Source: 
 AGRyM1t9R/mTKQNJ+9LrtzOyNWiHxoZlmun8se5Ah/g4ggpv44tQ3K4/8cckph483HbQEIMl4ESv0NMCFlrznMl06i0=
X-Received: by 2002:a05:620a:2449:b0:6b5:f01e:d6cb with SMTP id
 h9-20020a05620a244900b006b5f01ed6cbmr14063511qkn.463.1658856869249; Tue, 26
 Jul 2022 10:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <1658554568-9257-1-git-send-email-wangmy@fujitsu.com>
 <1658554568-9257-4-git-send-email-wangmy@fujitsu.com>
 <cb4a9e15-3339-f708-8f24-c41e68869ace@gmail.com>
In-Reply-To: <cb4a9e15-3339-f708-8f24-c41e68869ace@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Jul 2022 13:34:03 -0400
Message-ID: 
 <CAMKF1spHVoxOTDPvmiqazeit_imoN=dtWxonGaNM8peFry6qDA@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] googlebenchmark: upgrade 1.6.1 -> 1.6.2
To: Armin Kuster <akuster808@gmail.com>
Cc: wangmy <wangmy@fujitsu.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Jul 2022 17:34:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97997

On Tue, Jul 26, 2022 at 9:51 AM Armin Kuster <akuster808@gmail.com> wrote:
>
>
>
> On 7/22/22 22:36, wangmy wrote:
> > License-Update:
> > Update LICENSE file to clearly state which file needs BSD 3
> > Only benchmark/config/generate_export_header.bzl depends on BSD 3-Clause License:
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >   .../{googlebenchmark_1.6.1.bb => googlebenchmark_1.6.2.bb}    | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >   rename meta-oe/recipes-support/googlebenchmark/{googlebenchmark_1.6.1.bb => googlebenchmark_1.6.2.bb} (76%)
> >
> > diff --git a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.6.1.bb b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.6.2.bb
> > similarity index 76%
> > rename from meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.6.1.bb
> > rename to meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.6.2.bb
> > index b44d3bee27..11f09c6fd6 100644
> > --- a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.6.1.bb
> > +++ b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.6.2.bb
> > @@ -2,10 +2,10 @@ DESCRIPTION = "A microbenchmark support library"
> >   HOMEPAGE = "https://github.com/google/benchmark"
> >   SECTION = "libs"
> >   LICENSE = "Apache-2.0"
>
> Shouldn't the LICENSE be updated to include BSD then?

https://github.com/google/benchmark/commit/7b3ac075177212dd75476253d72db992513e8024#diff-ab12a56312a7be78ce82f6dcbd37978a5ffbc5abc61e9183639d613689766e6f

seems to have removed need for BSD-3-Clause

> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=0f6f3bbd074b822ddbb3b4d0e7f8d652"
> >
> >   SRC_URI = "git://github.com/google/benchmark.git;protocol=https;branch=main"
> > -SRCREV = "0d98dba29d66e93259db7daa53a9327df767a415"
> > +SRCREV = "d845b7b3a27d54ad96280a29d61fa8988d4fddcf"
> >
> >   S = "${WORKDIR}/git"
> >
> >
> >
> >
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97990): https://lists.openembedded.org/g/openembedded-devel/message/97990
> Mute This Topic: https://lists.openembedded.org/mt/92620754/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

