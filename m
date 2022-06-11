Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 788BBC43334
	for <webhook@archiver.kernel.org>; Sat, 11 Jun 2022 11:47:01 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.4823.1654948020147561518
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Jun 2022 04:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ckl+rc1d;
 spf=pass (domain: gmail.com, ip: 209.85.210.181,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id 187so1666013pfu.9
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Jun 2022 04:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5qqjZqjdrWa9Rlc6j7EQHFl8QzIefpqaMXeVS15t0gg=;
        b=ckl+rc1dFRZC0lyg5FLXnvdSQCma2gsZ3lNrW5JajladlJAMyYuMDB8Po2D+4gqJY3
         +D1A5wX3sKeJWVIWuZUg/eIS5eM9AZbXtGB3Zscgwrf8yWw5M0YuzW+kfMexJWIANgRp
         iheIg+M1Rfdjd6iyNl3pBrghZ20MJ8GVgViGfBLFNsy4xtDV8eGlFoYliKWEBtbDBWPs
         KA7PX5177LFyLC6mzJuRuQfhaiV2iT9GPxpbuCn1bGk2NS+vWuyPCFXUJYyWwXsam5P0
         PvQj0i3istCkrrgXxye4l0ZT1kyj+Uxrd0c3Okc+rzrIilJdMTBwQ8obmfoEKNgfSkl2
         1bRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5qqjZqjdrWa9Rlc6j7EQHFl8QzIefpqaMXeVS15t0gg=;
        b=7Svh2H79blQ7iC8qwdvwGYWzCJ32heIOZaPiIzmosCpiEx8McKMt/hKympvjz3m6fM
         aDnXbseKWuR0pla57Ic7TQfFVskkNuBKttwOK4/4eMWC444ZBdsoqKGtxrbGNoFN44Fw
         IrwoTZeoO32D9pspouC0ckl7QoLFpQZUAuepf1UT0vxOTThyQL3SH7GyaDhDe112FPlz
         B3BNFm3eWegBEfmbrbud/Nog92iuYOtydOVjVm16lKCQlFqFixSvWZkVW59I+9EXj3ri
         8mksipmKNNM9K3J1WY1TiC3R3PgeT5JnxPDde/LSnjglDT2GjR5ESN5O74nQDurtfP8w
         4K+g==
X-Gm-Message-State: AOAM531+2IXtFNpvZHvDEJ5p0MBUwktUnBod/UDzs6G1ncBJPD/rROdB
	Q13nzLUlf9IW2mMYKZNXcb0lwoxQQoucN/6wTq4=
X-Google-Smtp-Source: 
 ABdhPJy3qFjMdAPWwk85agMmMqW47re7eWWkRijjWsb78N4AMq2On61tbct24Ikys1EnUo1PiekkWIM6pSAcqN2nIHo=
X-Received: by 2002:a05:6a00:124d:b0:51b:f2ac:ef8a with SMTP id
 u13-20020a056a00124d00b0051bf2acef8amr39190713pfi.72.1654948019589; Sat, 11
 Jun 2022 04:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220606220137.1887491-1-adrian.freihofer@siemens.com>
 <20220606220137.1887491-4-adrian.freihofer@siemens.com>
 <CALbNGRSNqCmjmF-re3zeqfEh2gp-j41SGdxUfzKwiyqRC4HpMg@mail.gmail.com>
 <07e40f6161b803aaf0f4ea86b1beca3f6674fe52.camel@gmail.com>
In-Reply-To: <07e40f6161b803aaf0f4ea86b1beca3f6674fe52.camel@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 11 Jun 2022 13:46:46 +0200
Message-ID: 
 <CALbNGRTst1D69rzPtOLUz1b9VUsvgZefgrB0Sibgv36B9qt1Cg@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 3/5] networkmanager: use nftables by
 default
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Jun 2022 11:47:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97471

On Tue, Jun 7, 2022 at 7:26 PM Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
>
> Hi Andreas
>
> Good question. I changed it back and forth before I sent it to the
> mailing list. I finally changed it to the NetworkManager defaults (they
> changed it a few versions ago). I think it can easily be changed back.
> And after the LTS release, it's a good time to point out that nftables
> should be considered for future builds.
>
> But there is no strong argument for it. I'm also fine to put it on
> iptables.
>
> Maybe a distro feature to set a preference for iptables or nftables
> would also be useful. There are now various packages that support both
> configurably.
>
Thanks for detailed backgrounds and i am fine in following their
suggestion and in case of issues it is simple to undo.

Cheers,

Andreas

