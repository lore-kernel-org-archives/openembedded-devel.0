Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8CA7C00140
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 19:41:15 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web12.1529.1660333269268746834
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Aug 2022 12:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ffz8ShJA;
 spf=pass (domain: gmail.com, ip: 209.85.219.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 21so2994268ybf.4
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Aug 2022 12:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=TTFYOZLLyejclAhj72Bz7Gq/zUpAycCb5wjm3W1GyME=;
        b=ffz8ShJAjvifqUVTwN/HP+BDJys1zBsuoFLjfcWVpkn3joBEjUjvDsGuZOhwoS/ufJ
         tBT+bm8U6EeIGL76IJxYdU9hLksr2BxG1vgFO+mk+RZq/70cv4RNunn14hSsMhQwns+2
         yE0bGmiFct/fOZF2xSFbGiHhVHdXMb7lBkzH5QKSJD0WMZ1rACNFavgnLNQPk/LvnhAD
         AYwsOm59lj0A+5eJ8bH7UjsFvHqYLT2IA+MN7AFaKl5l68LvjpviIJhqkabpdSsECxfR
         LAw8ZARTWphm0N9MHkcs+xufpxHS8sDpCfBTjnjnDGvxEDkjJCIoFWMR6wszxHmnOT5P
         JusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=TTFYOZLLyejclAhj72Bz7Gq/zUpAycCb5wjm3W1GyME=;
        b=uhSA0xJk6EcZWY4yGj0LXpFe7L0FzzXhSKkxX3jJ1a6hGsU2VjWdAgGSgAVCOXU9E/
         M7hh8+0kJlh39iw+zyYf5vXp11tgFXpVy8bMpl2unnkS7CAKICjasKyzulv3pdJhC661
         F7vxlfTlA4nwxO3EGaZja+1DWU/SWQwTD3U2RoNoYy1heaRNV8bt6WMBHWKvElcxNBMF
         n3I5ruskLyNj5SCN5XGoz07BK17ibSu7oQWbQ8DRN0Ok0XF9TfSQnx1BFInShFlPISlI
         1buCa9URUlLLIg4nwdKjZuTsydMbpCsgoEhhKEPaC119BqYJl9czDyoAytfuEudyoEz0
         wiww==
X-Gm-Message-State: ACgBeo3TsywbVGDBYzCIJZiEtW76chqtgeDSnegIQR74KbS0SBujmout
	pw21WPXMFdIWhi32JcyGcfJEwpr1MIbDGDoiZbo=
X-Google-Smtp-Source: 
 AA6agR401Uq12NVT9IUgm1yLLHR4sJjEh8TbhBvPlWUV4Y6khQN3T7mPFfK/W6Z8/Xq63nKcdY7pv+fDRgFbtJyvqF4=
X-Received: by 2002:a25:248:0:b0:683:bc08:fde5 with SMTP id
 69-20020a250248000000b00683bc08fde5mr2427141ybc.428.1660333268337; Fri, 12
 Aug 2022 12:41:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220516165245.2569767-1-sean.anderson@seco.com>
 <15c593a2-a823-9e3a-f9f3-2f4e11ac4854@seco.com>
In-Reply-To: <15c593a2-a823-9e3a-f9f3-2f4e11ac4854@seco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Aug 2022 12:40:41 -0700
Message-ID: 
 <CAMKF1sr+mwiDj5gPFX6Z+KPYinkLEaYE-hD17hZjWJmw27QzQw@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v2 1/2] image_types_sparse: Pad source image to
 block size
To: Sean Anderson <sean.anderson@seco.com>
Cc: openembedded-devel@lists.openembedded.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Joshua Watt <JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Aug 2022 19:41:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98218

On Fri, Aug 5, 2022 at 2:50 PM Sean Anderson <sean.anderson@seco.com> wrote:
>
> On 5/16/22 12:52 PM, Sean Anderson wrote:
> > If the source image's size is not aligned to the sparse image's block
> > size, then conversion will fail with
> >
> > img2simg: libsparse/sparse.cpp:133: int write_all_blocks(sparse_file*, output_file*): Assertion `pad >= 0' failed.
> >
> > This is a bug in img2simg, but an easy way to work around it is to pad
> > the source image ourselves. The default block size of 4096 matches
> > img2simg's default block size.
> >
> > Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> > ---
> >
> > Changes in v2:
> > - New
> >
> >  meta-oe/classes/image_types_sparse.bbclass | 17 +++++++++++++----
> >  1 file changed, 13 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta-oe/classes/image_types_sparse.bbclass b/meta-oe/classes/image_types_sparse.bbclass
> > index 4263593a8d..58221888ed 100644
> > --- a/meta-oe/classes/image_types_sparse.bbclass
> > +++ b/meta-oe/classes/image_types_sparse.bbclass
> > @@ -1,8 +1,17 @@
> >  inherit image_types
> >
> > +# This sets the granularity of the sparse image conversion. Chunk sizes will be
> > +# specified in units of this value. Setting this value smaller than the
> > +# underlying image's block size will not result in any further space saving.
> > +# However, there is no loss in correctness if this value is larger or smaller
> > +# than optimal. This value should be a power of two.
> > +SPARSE_BLOCK_SIZE ??= "4096"
> > +
> > +convert_sparse() {
> > +    truncate --no-create --size=%${SPARSE_BLOCK_SIZE} "$1"
> > +    img2simg "$1" "$1.sparse" ${SPARSE_BLOCK_SIZE}
> > +}
> > +
> >  CONVERSIONTYPES += "sparse"
> > -CONVERSION_CMD:sparse = " \
> > -    img2simg "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}" \
> > -             "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sparse" \
> > -"
> > +CONVERSION_CMD:sparse = "convert_sparse '${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}'"
> >  CONVERSION_DEPENDS_sparse = "android-tools-native"
> >
>
> ping?

Thanks for reminder, Can you rebase it on latest master-next and resend please ?

