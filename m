Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81BDCEE3F01
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 05:13:49 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.14523.1694754820394247600
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Sep 2023 22:13:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BosdR5sZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1d66bf632bdso17427fac.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Sep 2023 22:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694754819; x=1695359619; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xy0CE/VH69z1yuiA6HOhyc9zyIWtCrqdkHegZAgoxXM=;
        b=BosdR5sZTSMTH2latQxTEuU8GJjZ6B3ZZ4pCxhcAlLcT77eZ7lFwAaev6baw/qLEe6
         tL3VLlCqJ66lYOSKy5TwezQO0Buu3Sn4bWiik8BIkA3tBOgm3/bj72ROMWXPOI0Xvv2W
         toLi6T/z9Nf3Qg+XmFgjCoq8ey29+GxmGp2qDwADSbdixm08c6svsxOD7wsjCW4y1xvI
         +lrUnjySYkQ+JuAHlI2nq1eAzRB8hwQk+QwC2ktRBmLUO5hrgaeTV5KFkzG2Jyf6IOek
         AR5pj/UGNdj1uR1d3PPVb88dGhKdq+ytkgGCYmhDy3Xg+VQEYR+qdGBFSnj+lkLNI27A
         WXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694754819; x=1695359619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xy0CE/VH69z1yuiA6HOhyc9zyIWtCrqdkHegZAgoxXM=;
        b=C6COeDIPe/w1lzXsqk0v1WsaQsjM/Y+p3ob6qv9z0sNsT/9h2ZovDE0wJoca8W+LG/
         FERklsOf9ABfoyiaZrOkzw3i49CTzzJsqFh/WYWpyri7bTAI2rQzxH9npP8X4Pi2dkff
         rBBQVOqOo0cxnkI9wCEc3XijouW2/V+6iaSWBQq6uCbROTj0s0bQOSSKNceuV9lmFcK8
         JghEWasRYHs4CsVFYy5PJpLdXVINYA3NIZ6UmJRzqvuABEDkFbT6Q2ZC+I1asHlB50mK
         7laVBqwb8G/0IBhOEmMgcoJx26zy53qkxvqO3HqjjXViLpzzPdFJRTyCVLWIABnDsYP0
         bETA==
X-Gm-Message-State: AOJu0Yz7FKXosPiTmtrQ6lLFpKtX+BW0HqKpcr+ywb0/45m+3dtFttXA
	GYJMr0deLkzJeVIlbhfg+aDb0XrRB6i+8o8hWpI=
X-Google-Smtp-Source: AGHT+IG4FrPvf2gNVlQoTmOOjHMOP47hbtGFguxGvdrtMJ3UEYE5zZpR90fVX1NZKE0u+u9vjo9JLEyY4ltESnNZ2QQ=
X-Received: by 2002:a05:6870:2188:b0:1c8:bfd1:ecc0 with SMTP id
 l8-20020a056870218800b001c8bfd1ecc0mr623421oae.0.1694754819469; Thu, 14 Sep
 2023 22:13:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230914154206.2143189-1-f_l_k@t-online.de> <CAMKF1srwzjtOq1vxfhMcEsb1YQmFbMbRidfcYT=tW6CRYck6hg@mail.gmail.com>
 <4RHZ0S.429LO849YY5W1@t-online.de> <CAMKF1spKNX7YOrEbApJLi2KxD0hCKRJrMwAo3LYTer4G5ouh6A@mail.gmail.com>
 <4GG01S.WYK7K8R9MZ9J2@t-online.de>
In-Reply-To: <4GG01S.WYK7K8R9MZ9J2@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Sep 2023 22:13:13 -0700
Message-ID: <CAMKF1spq1_BROMyovgFJAh4RhvfyY7-YmpbnTsVf4PcEzPOh6g@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] libdca: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Sep 2023 05:13:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104884

On Thu, Sep 14, 2023 at 9:57=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> After further testing I found out that gstreamer can also support dts if =
you use the gstreamer-libav plugin, since ffmpeg has dcadec code built in. =
Less lightweight than building the gstreamer-plugin-dts with libdca, but mo=
re feature complete. So in the meantime there is no real reason to use libd=
ca anymore. I'll send an updated patch if you still want to add it, but pro=
bably this recipe can just be left out.

I will leave it out for now. One less recipe to maintain

>
> On Thu, Sep 14 2023 at 09:56:53 AM -07:00:00, Khem Raj <raj.khem@gmail.co=
m> wrote:
>
> On Thu, Sep 14, 2023 at 9:28=E2=80=AFAM Markus Volk <f_l_k@t-online.de> w=
rote:
>
> On Thu, Sep 14 2023 at 09:14:26 AM -07:00:00, Khem Raj <raj.khem@gmail.co=
m> wrote: if we change it into $(LN_S)f libdca.a "$(DESTDIR)$(libdir)/libdt=
s.a" Then it becomes relative and can be submitted upstream as well. This c=
hange has already been requested some years ago: https://code.videolan.org/=
videolan/libdca/-/issues/3 Anyway, the static lib isn't built by default so=
 this would add a broken symlink to the package I guess ?
>
> That would be a separate problem and the target creating this symlink sho=
uld depend on static lib generation target. but as such, It would be good t=
o use the upstream proposed revert.

