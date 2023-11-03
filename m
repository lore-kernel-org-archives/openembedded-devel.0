Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD0EC4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 12:54:45 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.51118.1699016076082265093
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 05:54:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kKCtFTaY;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2c518a1d83fso27395521fa.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 05:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699016074; x=1699620874; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWCjwooPTaAH2YzNJepetZL0zyJjzdJRNuATFSabeQA=;
        b=kKCtFTaY0kwGLv5bQMRVOwTE0+Tnz29c/juSLQWWJ6zI/Z2gEhZPlS0PGcNX0szoGQ
         QC6R1QoSBKVVHxy+r+xlCqC1UH5W4CjGXiYQo/GwcVK3fpv9e7f0KCLBHnYefPSBbWBF
         rX29Rn4TBX2voLk63k4yez+Z2IWQ2cmD51+KEuOjsmskSskGoDiZVYsYUUeCtL6qnAO8
         w2W6k+8FPTgMGYVxFQGmpkBt04T/0SXqZWLmfXuutfblbldh07Xba6D7A2wYEOM9sKEe
         FNFYLODWfz52EQNKFwYJsbo16jpWoSwYQFm9jU7cbv/hjCtP89+BSEpJ6bPJ8jrCqVVQ
         MqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699016074; x=1699620874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uWCjwooPTaAH2YzNJepetZL0zyJjzdJRNuATFSabeQA=;
        b=cHsJLgHcg7gmixahrbuqNyEvD40UgOPdV9GzYFgPyWFt9oWUi7Gh6zZzGx63ZILy5M
         ek4EZygzU7/taj0JOdnyDiZ1Ov9r8FqzRR2n+etWpVcu1PNUwhGENIWzX26ZqyFhvJ5C
         z7A7z5CL1+5soK8vbAmU7WBLuNN3gNTYAAzZZrK6gRIFy4bcwd38IuNRkk+MSkbyH1Hy
         lBYHObEoKbMR7NpWaa9YY083bu5JT+W3o+mWAjwQZxU8RR66MLS3Te3NvD3LKQkP2XQC
         GyfXUpMGSg8NN1CXa+AFOL/AIJQ96P6/dpHIJPlTQrTiDwZ3VslLbNtFP6uH2FScDQ7T
         9dfw==
X-Gm-Message-State: AOJu0YxGw5g5S+mLadUfZLhhaEr2jm1j8xqYuUO3RZd7htmL9J6Cq5xg
	D/emh9h/XBs5XeHl48NvVXW0l8UKvhU2Jl4R30I=
X-Google-Smtp-Source: AGHT+IHxyMYyD2+3eVkvnQwJX7XLLFqPhHG5tD6Ud+8Sl2zF8Qp/D1JbDeM6Efa+KZ2xmQlclq2tFAe1+aP31lOBbCo=
X-Received: by 2002:a2e:8295:0:b0:2c5:1d95:f7a1 with SMTP id
 y21-20020a2e8295000000b002c51d95f7a1mr16843242ljg.27.1699016073918; Fri, 03
 Nov 2023 05:54:33 -0700 (PDT)
MIME-Version: 1.0
References: <9353bb8c5660859357ba062c7d5924051d249b83.camel@linuxfoundation.org>
In-Reply-To: <9353bb8c5660859357ba062c7d5924051d249b83.camel@linuxfoundation.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 3 Nov 2023 13:54:21 +0100
Message-ID: <CAApg2=TZPGqMxfvy__yN2EzfJen2RYq_KUa2ke2bH8Zv48x_JQ@mail.gmail.com>
Subject: Re: [oe] meta-openembedded CVEs, patch stats and AUH
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Armin Kuster <akuster808@gmail.com>, Marta Rybczynska <marta.rybczynska@syslinbit.com>, 
	Ross Burton <ross.burton@arm.com>, Yoann Congal <yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 12:54:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105856

On Thu, Nov 2, 2023 at 2:49=E2=80=AFPM Richard Purdie
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

This is a really nice work! For CVEs I was mostly aware of the situation, b=
ut
not for all layers. In short: from my first analysis quite many of the repo=
rted
issues are false postives related to NVD mismatches. Need curation and a
nice chat with NVD :)

I'm happy also to see the first AUH results.

To sum up, a nice advancement!

Kind regards,
Marta

