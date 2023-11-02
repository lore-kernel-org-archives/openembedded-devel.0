Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE25C4167B
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 17:51:50 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web11.38383.1698947500235947892
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Nov 2023 10:51:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WeqyxaIw;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3b2f2b9a176so772263b6e.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Nov 2023 10:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698947499; x=1699552299; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A0fG6Ii5zPXAEX8+TwClNR9Vn0C7VeNv7shBG/9kkis=;
        b=WeqyxaIwWd+65R+6GBfpaqeI4pFeELqXHVrPf/J6vKqslDllp0jSk2/b433q4NO3G6
         nmALzN0Azs4eGwBg365OHO49QNcI1CVD6O2n5JrjxeDneUEkJc88D+0iVND5CJxyjji4
         1bD6RBt56SjoHhrQexz2E+oXcO96lEt+PJ8n5GV278F9vM/OJwgoQh1caSyY7gyBP8fI
         BV2WiKuGJgNsSrlPF3v+LdTQ6O613gS0YO0TvHuWvUqp0CDWR860AVIscg7qnkv4fR/Z
         0Bu9huN054SjMU75xGnF8tCUiojcnyT9iU+3ETzXwU25UlI7m+4pJKCg11qwybQMthFn
         dSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698947499; x=1699552299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0fG6Ii5zPXAEX8+TwClNR9Vn0C7VeNv7shBG/9kkis=;
        b=lkd3ZIpPvRFJjADcOAXd6ym/+1nPolxdSAYiTFp2smeOXNQZfM7fzFyTIWOO9jZH0e
         +ixfy06BtksnUYFMLVgM5Q3IDGLKPql4KLmjedr64oh7adHsx/R4Ulc95YfGxvD7rTdF
         3S9rb2wtkYMT+SOIH/e4paegL1PMXuXX0Hg2ne8HILJePrbkMVdu9vvDhctCxUPer1gF
         q21NRBDoUPowrUNeUDC4iRHKH5qBbPbdKvoKde/TWsnyPtKO1H88VVo4UgEFG/tGRzmV
         YH8Z2rhGhuj79/sqg/6HBEPoz9Wqp6kHGccak+9OnrBiBom5OSEZW78aY7RdtaB7iW9E
         XHFw==
X-Gm-Message-State: AOJu0YznKoj7Cv/MaQfN4aNPuuH6SO0rjHxxrwXl0AMAsmhQJiB8xN07
	uZHXqbkyc9OOYKb4UDq1gbFdWmcQh1qkWFxWdCM=
X-Google-Smtp-Source: AGHT+IG5upN8LBdiRbDQS+/F6RAvI9E2Pe0RXSDyNJKykTvISaYV/iCDjsIgABlInH+pr/CBbsCYF/SCcJODwpV0zUg=
X-Received: by 2002:a05:6870:ad0c:b0:1e9:c252:4853 with SMTP id
 nt12-20020a056870ad0c00b001e9c2524853mr23779186oab.5.1698947499225; Thu, 02
 Nov 2023 10:51:39 -0700 (PDT)
MIME-Version: 1.0
References: <9353bb8c5660859357ba062c7d5924051d249b83.camel@linuxfoundation.org>
In-Reply-To: <9353bb8c5660859357ba062c7d5924051d249b83.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Nov 2023 10:51:13 -0700
Message-ID: <CAMKF1srDOiMrisZJwAm5=ft_pDzncXbaytJfqP4cMW17vv8r4w@mail.gmail.com>
Subject: Re: meta-openembedded CVEs, patch stats and AUH
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Armin Kuster <akuster808@gmail.com>, Marta Rybczynska <marta.rybczynska@syslinbit.com>, 
	Ross Burton <ross.burton@arm.com>, Yoann Congal <yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Nov 2023 17:51:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105844

Awesome work !

On Thu, Nov 2, 2023 at 6:49=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Patch Metrics and CVEs
> ----------------------
>
> I'm now pleased to say we have CVE and patch metrics being generated
> (Thanks Yoann and Ross):
>
> https://autobuilder.yocto.io/pub/non-release/patchmetrics-meta-oe/
>
> which for example generates this:
>
> https://autobuilder.yocto.io/pub/non-release/patchmetrics-meta-oe/cve-sta=
tus-master.txt
>
> (268 CVEs)
>
> This doesn't work for the LTS branches since the layer override being
> used to generate it on master won't work for kirkstone/dunfell.
>
> Those reports are generated live onto the site daily but aren't emailed
> anywhere at this time.
>
>
> Mirroring
> ---------
>
> I covered mirroring for meta-oe layers here:
>
> https://lists.openembedded.org/g/openembedded-devel/message/105754
>
> Basically it works but we need to decide whether we can fix the
> warnings to keep this enabled for dunfell/kirkstone.
>
>
> Reproducibility
> ---------------
>
> We can now test reproducibility for meta-oe on the autobuilder:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/155
>
> In order to make this useful we really need a list of known issues so
> that we can then exclude them and start showing regressions.
>
>
> AUH
> ---
>
> This is now working and generating updates. It takes a while to run and
> generates a lot of emails.
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/159/builds/8
> (18 hours so far)
>
> meta-oe summary:
> https://lists.yoctoproject.org/g/test-list/message/425
> TOTAL: attempted=3D206 succeeded=3D42(20.39%) failed=3D164(79.61%)
>
> meta-python summary:
> https://lists.yoctoproject.org/g/test-list/message/426
> TOTAL: attempted=3D92 succeeded=3D50(54.35%) failed=3D42(45.65%)
>
> meta-perl summary:
> https://lists.yoctoproject.org/g/test-list/message/434
> TOTAL: attempted=3D7 succeeded=3D5(71.43%) failed=3D2(28.57%)
>
> meta-networking summary:
> https://lists.yoctoproject.org/g/test-list/message/767
> TOTAL: attempted=3D43 succeeded=3D8(18.60%) failed=3D35(81.40%)
>
> so around ~350 emails of which ~105 were successful upgrades. I'm not
> sure whether we want to enable that to send to openembedded-devel?
> There are lot of failures and there are a lot of recipes where the
> upstream status couldn't be checked. Is anyone interested in working on
> improving things in either of those areas?
>
> There are also various backend improvements we'd love to make to the
> AUH code now we've seen how it works in practise in this role.
>
>
> Summary
> -------
>
> All things considered, this shows what our tooling is capable of and
> we've a good baseline. Whether/how we enable/use this going forward
> depends a lot on whether people are willing to step up and help
> maintain/process the results. It can't/won't be Khem/I trying to make
> and keep it all working so this is where we need help from the wider
> community.
>

