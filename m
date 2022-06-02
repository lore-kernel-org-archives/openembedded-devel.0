Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B06C43334
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 15:38:53 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web09.621.1654184329106044398
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Jun 2022 08:38:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bQwQdo2s;
 spf=pass (domain: gmail.com, ip: 209.85.222.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id o68so3888077qkf.13
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Jun 2022 08:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NyRgSdBP2okXw+l9JDVU+EArdqA11jmOc2XDLNEc8so=;
        b=bQwQdo2sXRqOvTbbP54ZaxUhV1Uk4ouRf4Z7tF/knYv78X6uRWauztW+PF/qzEy+hL
         LybSAUGBavFNsBnPBeGzz1CvL+sXRacMLZfGgaP5gq26zA8WQM8fq5UBSOuPBOt/SRUq
         EbGqr1mJOwr0uv1KKgbVlV8nXzseFxm7T/uJlROUAclrE78A0r2nPJyXf3tmm7YGPNgr
         OrW4vHe0FJesbgU5qNvk8wDemYuvnFBU8BJw6kDbLuiwxtL4YMuwzr5MLyxS652H/tyc
         DpeJjZJ39kdcDThT8AAMQwkOCI8PQm6QGb4vSWMQ/3oV4l+gVGyANn9nPgosLHIcdJ72
         dXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NyRgSdBP2okXw+l9JDVU+EArdqA11jmOc2XDLNEc8so=;
        b=Uk0wkXnmcqS65ZYV3cY7UoEtQpIiSy4beQrgCOkbtG+CE0UPWfpHvBut+b8WKsulPG
         D9nkqdJZQolJKapba3s2fqSg2DJ/wnGjyTnr1KtAWZtXsO9fyZSYbK1W0uPkyyuwU+oW
         ghDZQNTdFRXWKJWnHrvvu38f2bBQFw3hheTVS6kWBED+wj8aI8hdf/KUMxeRHqc9aVM2
         /wwRzJ4ZgxXClrFzbecTlMZ2uInlP89cOVA2NLox2Ai/h8WnUltC9kglcAsOf8H2MzMb
         NX/BHT5xP18P5iPf2FCS5qdd/Gdp+th2Ef1reE+zhOdkvCw1hABGvNTO++RVxdaElI3z
         hfnQ==
X-Gm-Message-State: AOAM530K0objREmmwnLLkIzkL330nBpAkzPksk87QdGNbL1t531JhMI7
	5BUXzRnAyvTxLd5NcBQgR20C0HPMV/SWgXKP4cAn3g3GhTM=
X-Google-Smtp-Source: 
 ABdhPJwXRidzEenvLzn8n6JotCtWmzqo/LVYluP9qKTGlhMVTa5xFzS66C3mLarqf20RYFZu0lDTc9vsHObGhvz1d8Y=
X-Received: by 2002:a05:620a:1712:b0:6a3:abba:697a with SMTP id
 az18-20020a05620a171200b006a3abba697amr3602059qkb.149.1654184328145; Thu, 02
 Jun 2022 08:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <01L6.1654160344794307311.ZD0a@lists.openembedded.org>
In-Reply-To: <01L6.1654160344794307311.ZD0a@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Jun 2022 08:38:21 -0700
Message-ID: 
 <CAMKF1so0tV7REqwOWgZvvFA304RM8VBfnV_34VkB7FpRK-uDgQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking] Incorrect src branch for http-parser
To: =?UTF-8?Q?Aur=C3=A9lien_Bertron?= <aurelienbertron@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Jun 2022 15:38:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97386

Please send a patch to update it to use main for branchname.

On Thu, Jun 2, 2022 at 1:59 AM Aur=C3=A9lien Bertron
<aurelienbertron@gmail.com> wrote:
>
> Hello,
>
> I am experiencing a bug on kirkstone branch: the http-parser recipe fetch=
es its sources from github.com/nodejs/http-parser repo :
>
> SRC_URI =3D "git://github.com/nodejs/http-parser.git;branch=3Dmaster;prot=
ocol=3Dhttps"
> SRCREV =3D "2343fd6b5214b2ded2cdcf76de2bf60903bb90cd"
>
> Problem: the branch is set to master but it does not exist on
> upstream repo, the default branch is main. This makes the fetch step
> to fail.
>
> A possible workaround is to extend the recipe to change the SRC_URI.
>
> Aur=C3=A9lien.
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97382): https://lists.openembedded.org/g/openembedded=
-devel/message/97382
> Mute This Topic: https://lists.openembedded.org/mt/91495759/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

