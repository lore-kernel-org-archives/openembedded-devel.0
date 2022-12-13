Return-Path: <roger@norberthealth.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30910C4332F
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 08:45:16 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.68911.1670921110711550119
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Dec 2022 00:45:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@norberthealth-com.20210112.gappssmtp.com header.s=20210112 header.b=W4etov+X;
 spf=pass (domain: norberthealth.com, ip: 209.85.216.54, mailfrom: roger@norberthealth.com)
Received: by mail-pj1-f54.google.com with SMTP id t11-20020a17090a024b00b0021932afece4so2782142pje.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Dec 2022 00:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=norberthealth-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e8VFT5F1O/oVQ8WHOdgit1NXoiSwmc54TNeSwkeLGmw=;
        b=W4etov+XTkMENgxxWBRzKWu0iaRWf8SGFNnFdsK72BUCNae4xhnoHy00qL95LBQAPK
         Ywmmh4WcHL9VO8t2sC4loHYeGW8Oavjq48Imf+5Ja3nNf3n8n2XlsfPJOf+ycq9kfoku
         iMo+Xmm4NcnhY6Miu8x1XQofFTMOZ/A//D9360uDATqDXTMrYJEez4xoOjU/3deGhdB6
         KlSI8rt9beFR9uVN1o2F5B8u9g8bKzkmtngWsyLuegvedQqnsY04ABxwgRdgZV+Jc6RJ
         AMHuwTsOZVE1jWiemK6NzN5WBwOrcu38VBqnnmVKjmBWfwOff4x6Ek4B86aZz1OHtCIq
         8VHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e8VFT5F1O/oVQ8WHOdgit1NXoiSwmc54TNeSwkeLGmw=;
        b=wUdxsUm6ImDIgdTUmQ6h7o0kstm8iDvOPbrhb/ADm4ZLmBZz9ZenmPdXoFypwJZRYJ
         GX8oNsTRZC/dy/HHS1g7hVVrggkTVBdKEx0cmH6TS/am88/Ur/RayA7TzdLEqIaornJl
         +o9UZc3trRJMYWoGqVSrqJ/Dvb2yptgzqMC76S5aDkTwXFW4xl/Bp3XSK+r5MfzwligF
         0dlb7z8An4nxXlaJMrnmWYNrKhqLF4dXQBgyqEmfoRbDKVuTm8GrVFyzBjhy8AbIZqEC
         ddb6F5hGMkQ/M1gvYtheJwwwljgEWXXmum++4HNMUGuKpVR7+/fcNNy7DQdPZyJEIZdN
         v7EQ==
X-Gm-Message-State: ANoB5pnCDuTDRo7kETMBmyFbkdgJT/9oPOpAaiPnZzMyYAy8sAsGcd0L
	gpWlam2GvwJs229EPU5cOc9dzKd4vqHRYeqOTTfsXw==
X-Google-Smtp-Source: AA0mqf6uk/WePvQAzmkYf2hT748n4VBYNl7UqWjcOmXT+CHiAA+23bjV7gDCtaoxDTyNmejTQfSKnhNF+cZIa8jEGNk=
X-Received: by 2002:a17:90a:9914:b0:216:c8ab:3f5b with SMTP id
 b20-20020a17090a991400b00216c8ab3f5bmr246304pjp.157.1670921110039; Tue, 13
 Dec 2022 00:45:10 -0800 (PST)
MIME-Version: 1.0
References: <20221212175836.13560-1-roger@norberthealth.com> <CAOMZO5Bgh1EdWQF3PMQ4Twh4KC9C5E+MKRPDKzjHT_fe4Aq_cA@mail.gmail.com>
In-Reply-To: <CAOMZO5Bgh1EdWQF3PMQ4Twh4KC9C5E+MKRPDKzjHT_fe4Aq_cA@mail.gmail.com>
From: Roger Knecht <roger@norberthealth.com>
Date: Tue, 13 Dec 2022 09:44:58 +0100
Message-ID: <CAO_iFwpQ=a7R3fUTMMPsiYgM=HZT93xfS+h5u7tFxst8sJ4hRA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-rapidjson: add recipe
To: Fabio Estevam <festevam@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, Tim Orling <TicoTimo@gmail.com>, 
	Derek Straka <derek@asterius.io>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Dec 2022 08:45:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100069

Hi Fabio,

Thanks for the review.

That's a good point. I overlooked that the python module is building
the rapidjson library from the submodule.
I will remove the submodule and try to make the build work with the
rapidjson library from meta-oe.
This way the python3-rapidjson has only an MIT license and the rest of
files are handled by the rapidjson recipe.

Roger

On Mon, Dec 12, 2022 at 11:39 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> On Mon, Dec 12, 2022 at 2:59 PM Roger Knecht <roger@norberthealth.com> wrote:
> >
> > Add a recipe for the python bindings of the rapidjson library.
> >
> > Signed-off-by: Roger Knecht <roger@norberthealth.com>
> > ---
> >  .../python/python3-rapidjson_1.9.bb             | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >  create mode 100644 meta-python/recipes-devtools/python/python3-rapidjson_1.9.bb
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-rapidjson_1.9.bb b/meta-python/recipes-devtools/python/python3-rapidjson_1.9.bb
> > new file mode 100644
> > index 000000000..ebf053396
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-rapidjson_1.9.bb
> > @@ -0,0 +1,17 @@
> > +SUMMARY = "Python wrapper around rapidjson"
> > +HOMEPAGE = "https://github.com/python-rapidjson/python-rapidjson"
> > +
> > +LICENSE = "MIT"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=4daf3929156304df67003c33274a98bd"
>
> It looks like the license information is not complete, this project
> uses rapidjson as a submodule,
> which has the following licensing information:
>
> https://github.com/Tencent/rapidjson/blob/232389d4f1012dddec4ef84861face2d2ba85709/license.txt

