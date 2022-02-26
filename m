Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9365C433EF
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 19:43:21 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web09.2172.1645904600541330117
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Feb 2022 11:43:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XYrzR29l;
 spf=pass (domain: gmail.com, ip: 209.85.222.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id 185so7395128qkh.1
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Feb 2022 11:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E9GGkfbmNzPvvse82ECx2XgLQdPl0Gw30szH+FCm3Gw=;
        b=XYrzR29lkjR9mvSLC3B+uiAQS0s6rBWarh5pWK9KHSzGj14YEhqshkUf/xoWzS/AdP
         wztvUDKrSEzi2VCMEk/1nyE/ylqHJPTTCbfgYhHbONpyIVaUnd9/KmWpQcxB1FtGnNiz
         XHj0SnzrCj1WjZzy1/Qsk+C2D28DAXWE+PZyFCS8CH87fBY3AXDOUwB0h7+Rpuiz3ea7
         1RNlFrwpDYFm7FN25uxiud92rj9lyXFvVvwHov2VvQxJkajIp5mFdi6aUBoPxpELbatF
         xdoptLDyJIDKijnCC1Km9kxUVk5Biq9svY3M4wjrxgCRtHlAKdaswLlyPjXkzn6dGiZG
         c+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E9GGkfbmNzPvvse82ECx2XgLQdPl0Gw30szH+FCm3Gw=;
        b=QsKubO4jZtlHfAOmknpzmP0dHruE2wsaKkUcF3xTF25bduUW/23ttPuGijDToiiexO
         NPaPoyP1lpapBCNcU2x1bNY6ieD987dQw8uDP7z/Mm5eOWXswoJ3zmqaQ8OssX/2YPRO
         2o07lo+ucb5ZPK81UY+EdH16gr2wz1zPnK92WgulZRYpE2pdCCOtLMPSzqN4lsC5+Mdm
         +keij62U+UMR/0xQassTS86MriFyrBAyDAohi/rOpuJYYhjXVE1lNZGjdoYzJMO+5zW9
         eya5G8+/XvmBUmTGBiyYGZp5TFDet7iZGzttNbacYqb983DVFnMTLCZ+71yuOOxl76pJ
         TNIQ==
X-Gm-Message-State: AOAM531jmypYyVv0oMgXutIEWgjP2nMm/Gtp5FIZzvc3GPKYy3sRfpis
	LTYGSB/AtsAnuG285CxxBaOZ8A7iN1ObCKSuGRk=
X-Google-Smtp-Source: 
 ABdhPJzlW0w+ZOEv5oGJC3O5KnS7gm0GsjW1Ts5bK8VAK4GYFTZN0Ai8MkkJf1BO2J+j34OvpjIiL6KjKWBpoigvbjU=
X-Received: by 2002:a05:620a:1593:b0:60a:b223:893a with SMTP id
 d19-20020a05620a159300b0060ab223893amr8059527qkk.72.1645904599519; Sat, 26
 Feb 2022 11:43:19 -0800 (PST)
MIME-Version: 1.0
References: <50657f45-77cb-2368-35ec-7b4d260ba742@gmail.com>
In-Reply-To: <50657f45-77cb-2368-35ec-7b4d260ba742@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 26 Feb 2022 11:42:53 -0800
Message-ID: 
 <CAMKF1sphfyo0D2KQeY3DUNvHKH0-ifL_vkyOy5+NOEN3NPgC2w@mail.gmail.com>
Subject: Re: Hardknott merge request: Feb 26th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Feb 2022 19:43:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95552

applied thank you Armin.

On Sat, Feb 26, 2022 at 7:25 AM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit 23598caeafce0af0dde8d1339cf5edff021f6823:
>
>    python3-pillow: fix CVE-2022-22815, 22816, 22817 (2022-01-30 15:13:01
> -0800)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded hardknott-next
>
> for you to fetch changes up to 24f4e6e8d0556540e882e6f0933d1247f64d0666:
>
>    graphviz: native: create /usr/lib/graphviz/config6 in
> populate_sysroot (2022-02-23 15:39:12 -0800)
>
> ----------------------------------------------------------------
> Christian Eggers (2):
>        ebtables: remove perl from RDEPENDS
>        graphviz: native: create /usr/lib/graphviz/config6 in
> populate_sysroot
>
> Kai Kang (1):
>        openjpeg: fix CVE-2021-29338
>

