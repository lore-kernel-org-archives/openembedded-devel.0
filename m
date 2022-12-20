Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C774C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 05:59:21 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web11.44333.1671515954995611675
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Dec 2022 21:59:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ze31auc7;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id p17-20020a9d6951000000b00678306ceb94so1994066oto.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 21:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M25zzHvqcqbO20kidDuX1WcXe1eIJhMJFCKHCXyM5sE=;
        b=Ze31auc7RUhm9Ae8CJvSs05YULzvaNT8hXfZKWyhtysZ+8xMtNkSLncWEmYAoJLeKp
         XKHbe5e+u/4VbXVUQlJZ4zk6a50wX9nM59BxdHlni7Aemcc+1kDuJ13A25U7UeB7jbaF
         XWCnx27K3jBgqk3OF62FywLWeRloPiyUfi7iY0xTKhTSjlZS3px0byJOCR2XdAqmp2o3
         yqWgzu44cQ/IGCfHU/LycwjKq6cqEiKm51yxyOSeagrFfwb/ruczuTeg/Mr6v3AxR7oV
         3R0i1gOQQ9GL25HL4GyweeDJSpA4VBmeIhrYxzKvOUTs0sFPUkj+8UkmLOOD23U1JlER
         aMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M25zzHvqcqbO20kidDuX1WcXe1eIJhMJFCKHCXyM5sE=;
        b=rAUyzMsUOvpA5MVAFVnhbOM1q9FiuKXFe2QD1L6aeYyYSZbBsi6C0AaxHoUt+tEGWB
         oagv+rrqST0b7CSvLpfOy4EoL31/2UOqPm1zdJyepSsDAnFgnCcnnVvIg+EJe+OtrGUa
         IJgOSV3NY7hvjdEJFi9ViMkqSoDLiEEQNUIFxans1VmeDV139OASnsvwSBFfEDkvTIZm
         qwnFuI7s0DCMKAm9j2lScwvt5kHTFZX6i6bNY2xx+PwUICQpsTsVO1VnALfDaawMpY3x
         fU3hNKVVBePYChz2oLxiUV1yyGbEVIsOZ7oktR1bwCXK/1uHOvfdkerXuN1/tCAb0b2x
         3x7w==
X-Gm-Message-State: ANoB5pmbii+7uHCKC0MGYjSJ0I7usDEAZehl0vW0NUet+pgCTowPdFS2
	/rH87vKwHJytRdkTMq1pg/3FWeOD2JjaVVMUMFo=
X-Google-Smtp-Source: AA0mqf40LJgQlEx97ufhn8bqUFS9iY0uGtMk6bP/z0k0ODLIHBjP1sPU6n7rXLqJw44cUyCFLiR7gxN1lhSA+vfZ170=
X-Received: by 2002:a9d:68d1:0:b0:670:9d62:667f with SMTP id
 i17-20020a9d68d1000000b006709d62667fmr1864802oto.111.1671515954181; Mon, 19
 Dec 2022 21:59:14 -0800 (PST)
MIME-Version: 1.0
References: <20221219131041.452949-1-f_l_k@t-online.de> <20221219131041.452949-6-f_l_k@t-online.de>
 <CAMKF1sq4hns=rdZSKpXFocsXOGOaN9MShn151gsrbi8ZfLE58w@mail.gmail.com>
 <XGL5NR.LHXCDF0LKTW71@t-online.de> <CAMKF1sqt0WtWzAaPJx==4tncojJTD3Xz-+-+QeT+65_AzFPWew@mail.gmail.com>
 <EGN5NR.S2RXE6GG096C@t-online.de>
In-Reply-To: <EGN5NR.S2RXE6GG096C@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Dec 2022 21:59:03 -0800
Message-ID: <CAMKF1sobV4=iST7kgKS7yujmt+C3SK-1mS8gKsKT75Cqn0xVyQ@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 06/10] xdg-desktop-portal: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000af7b1205f03c2210"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 05:59:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100121

--000000000000af7b1205f03c2210
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 19, 2022 at 12:26 PM Markus Volk <f_l_k@t-online.de> wrote:

> Am Mo, 19. Dez 2022 um 12:15:26 -0800 schrieb Khem Raj <raj.khem@gmail.com
> >:
>
> Well I see python3-dbusmock is in core layer, it should be simple to
> bbclassextend it to provide native variant as well. What objections did you
> see ?
>
>
> I see no objections besides that i already sent that patch and it was
> rejected in oe-core. The need for dbusmock was disabled in
> evolution-data-server back then by not building the tests.
> Now for xdg-desktop-portal we cant disable the build of tests. There's
> only an option to not install them. I'll try to send this native expand to
> oe-core again.
>
Maybe resend it again now ?

--000000000000af7b1205f03c2210
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Dec 19, 2022 at 12:26 PM Markus Volk &lt;<a href=3D=
"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-w=
idth:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204=
,204,204)"><div id=3D"m_-6984805810014619938geary-body" dir=3D"auto">Am Mo,=
 19. Dez 2022 um 12:15:26 -0800 schrieb Khem Raj &lt;<a href=3D"mailto:raj.=
khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;:<br><blockquot=
e type=3D"cite"><div style=3D"white-space:break-spaces">Well I see python3-=
dbusmock is in core layer, it should be simple to
bbclassextend it to provide native variant as well. What objections
did you see ?</div></blockquote><div><br></div><div>I see no objections bes=
ides that i already sent that patch and it was rejected in oe-core. The nee=
d for dbusmock was disabled in evolution-data-server back then by not build=
ing the tests.</div><div>Now for xdg-desktop-portal we cant disable the bui=
ld of tests. There&#39;s only an option to not install them. I&#39;ll try t=
o send this native expand to oe-core again.</div></div></blockquote></div><=
/div><div dir=3D"auto">Maybe resend it again now ?</div><div dir=3D"auto"><=
br></div>

--000000000000af7b1205f03c2210--

