Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CCDED597A3
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 20:25:30 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.96528.1731443120415803376
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Nov 2024 12:25:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iyuOM5fw;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539e4b7409fso39336e87.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Nov 2024 12:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731443118; x=1732047918; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iDLogxVDYol4hVpAwUyctSf1beatDbw+B9sfyAhGvBk=;
        b=iyuOM5fwK4s+jOifMzXr6C0iMDwrRaaTNxprM6S24C1qdTd3EtEY1DoPLXHFJgm+Q6
         iEOX+50JgOd0vjsIRhz4skR9ZfpFRuKU60H4MgIqNj4Am40W63oNzb3oMfUDg19WNeLw
         YLBO2WSKo6Ixho4kZBxgYgROf83q6UOB3eUhmE50zftUQrbFb5/UlhvTmM0Ev3NzcrDe
         2YMFFsbVR8zpeMR7VJwSRhVBETcADqtVsnu+Onk2hkZN/wXq9k0jBdsrX7Fq/EVQeeDs
         9PVpBUv/ObpCrQ2JVK8y1vC3UAWwz9GtxL3kYO1R3OeAvGWX9nWp/pGyArKby4ynvBUU
         S+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731443118; x=1732047918;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iDLogxVDYol4hVpAwUyctSf1beatDbw+B9sfyAhGvBk=;
        b=eS1kQVfVYVHrmcL0OZFaQnu7xhqxX18XUBFoXz7Ie9usRP0DCat5t9ZXF4rcumJ7u/
         GdqofW4jrlRBG05wdnlf/uAobTbcqkY1wtlE0tujo1bPVO1sYE21bEIuxolBPxRoNOKT
         D86dyHtFFco74Zp7v1oLNqU8zo/348lPiHXO89V7Zj3FFF1186ZI/33E05RVO+JLeR2H
         Cm8T3tiP8Ty1pIeBddoF4biStZLHezg21hjZWVwC+ZqjWIC4NVIkFT+7IZO01SOOw2rU
         OLEf6PtbL8btAoRDOD7QY92Uxr6CATY0IUnYIWIIkbnhtQRT5xezCvZHhKDfPjKw29Bu
         tJoQ==
X-Gm-Message-State: AOJu0YzSpMbPArXshQoDnVvocILeiwfFUrU6LPimfNT4pI8R1B56YP4+
	y6bqTC3Ne8YNpX+Z9pj8fcl0FinUXCfpI5gMaARob7sIjvi0kmtIeUISioHORRqvPypZ87Q4Jnn
	5H0J+YFo5tosLrkW+4UCZW1R2Am0mz3dH
X-Google-Smtp-Source: AGHT+IH28YkmgZLbF4U+AVGnwh3k+WIgEBJGm/o/qMzqSRSu8mM/1J04xQi7GHzwxVvbn/EnOY/rsHgoryRytZq7r44=
X-Received: by 2002:a05:6512:2256:b0:539:e88f:2396 with SMTP id
 2adb3069b0e04-53d86723da4mr6110477e87.24.1731443118177; Tue, 12 Nov 2024
 12:25:18 -0800 (PST)
MIME-Version: 1.0
References: <20241112174555.1525173-1-ross.burton@arm.com> <20241112174555.1525173-2-ross.burton@arm.com>
In-Reply-To: <20241112174555.1525173-2-ross.burton@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 12 Nov 2024 21:25:07 +0100
Message-ID: <CANNYZj_Ezei_RLRBXPtxoJ1pCkzW8PVnAKUYQSDUr30925eiNw@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/2] tk: tk 8 needs tcl 8
To: ross.burton@arm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Nov 2024 20:25:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113799

Khem has a patch in master-next that covers this and more:
https://git.openembedded.org/meta-openembedded/commit/?h=master-next&id=0449563c4088b6a0754daec9f0eb6da3929d2234
should be merged ASAP rather.

Alex

On Tue, 12 Nov 2024 at 18:46, Ross Burton via lists.openembedded.org
<ross.burton=arm.com@lists.openembedded.org> wrote:
>
> oe-core now has Tcl 9, so Tk 8 needs to depend on tcl8 until we've
> upgraded tk to v9.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb b/meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb
> index 1438a05625..ddd7043c0a 100644
> --- a/meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb
> +++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb
> @@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://license.terms;md5=c88f99decec11afa967ad33d314f87fe \
>      file://xlib/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
>  "
>
> -DEPENDS = "tcl virtual/libx11 libxt"
> +DEPENDS = "tcl8 virtual/libx11 libxt"
>
>  SRC_URI = "\
>      ${SOURCEFORGE_MIRROR}/tcl/${BPN}${PV}-src.tar.gz \
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113798): https://lists.openembedded.org/g/openembedded-devel/message/113798
> Mute This Topic: https://lists.openembedded.org/mt/109539529/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

