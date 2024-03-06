Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC19AC54E49
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 01:53:15 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.1503.1709689995067267595
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 05 Mar 2024 17:53:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GzVVsvcf;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-33dcad9e3a2so3501726f8f.3
        for <Openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 17:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709689993; x=1710294793; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7qd2J9MF9Pi2nXG4lZeGnMzCkTvvriHL/OZL/gIRLE=;
        b=GzVVsvcfL/GClPMG5YwgekJsgs8XOd12WXRlC+Fr6eH2EnlAzFF86FqounzzTtPFUJ
         smyopFWrDjxyx/IIhW/RyA188uPv504afGP2/HjH32J3VE9iYyg0DNL9sU6UDoJo/L7g
         7CTdlz4T+BJIDCQ24MN4Ywrerq+cmpgFH7XZGGMP7ULHwkXsoHMUBL2a/ql8mQ2Rre5s
         6VhEkecZjcHx33jact5kYGN1Pe/T+/KLVxTVIIFUkalWDT6Hi0DzQte1BgBZiNCX6byK
         +W57ZiUmdlOzsJG5GfA3EaKzJhLzb+SNQgEuNrdA7BEZpQHzPxxJ6jlrsOJRAmPtCJOo
         8JRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709689993; x=1710294793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p7qd2J9MF9Pi2nXG4lZeGnMzCkTvvriHL/OZL/gIRLE=;
        b=qMcjzvvN7RI1FejmgxN3egRubfJK96sQocOAVUU9vCaMjaQC5QCNjQcs2ztJ0nzy8d
         Le2YGCgc3U3NRrm0nk8BkE/R/od2qlUg9y0+CGIZ+I2C+jNKIDzCNQ6N+LTDshxB0UFU
         +7kjpViJWyZMudQlNKaFnSJSviRPR78pdDoG3uNszRsRI/Y//be1FCnkeRZihPDiedH8
         XUhN1xJRxDC9GhS+Nr4abpLOiChw7OyTBFrLb7zgRvprJyzTMu1Cf/JyQxKKDRvGG7jj
         sLKl4fPJVZ8KjAYsBxIRj0E2/tUbCkhLpBQzhxRJi5CxbkycUVV0nWie2slM5zbMMvnG
         ZO0w==
X-Forwarded-Encrypted: i=1; AJvYcCVA3g6TmvuexFnODNIZRj40C1td2xifyRIebChnzqCVeCFw4ilYk/1ctOl/pnct2OpjI75ZXe8SRLIJZwF7xufsjJzU8oU1CFJ3pMlpyMxmrTkcSm45fl9R8A==
X-Gm-Message-State: AOJu0YxA72hcjYAyD5gQ9kMPJGSRNekDNozSCUPon/4R/yKiLGKxDDUy
	F+i1wpNxBoMCrCS5oidHNy7c7XXWp4pqqF4opQ6JSeZRrT54iuKuFGwvNymC/fiLs7XfkdFhQ+8
	SmZ2llcUzJLHz67nxnzPyd6JLqbg=
X-Google-Smtp-Source: AGHT+IHK5Id0C6tR0W1JqZDVi4oaDYWBJ35oNoNTbyVywigAEJdlmfiL5IoEesFfH3W44gF4IMRyeG3GV4X95qZGWEE=
X-Received: by 2002:adf:9cc7:0:b0:33d:aaba:aa66 with SMTP id
 h7-20020adf9cc7000000b0033daabaaa66mr11965725wre.65.1709689993244; Tue, 05
 Mar 2024 17:53:13 -0800 (PST)
MIME-Version: 1.0
References: <20240305212609.2054938-1-rs@ti.com> <CA+chaQdaNgrihtzBvoWvdkNTYq8QMhf4B9mcfX5UPyhFiuahiw@mail.gmail.com>
 <aaa031a7-b2c5-4df5-9217-254bd68973ce@ti.com>
In-Reply-To: <aaa031a7-b2c5-4df5-9217-254bd68973ce@ti.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 6 Mar 2024 02:52:57 +0100
Message-ID: <CA+chaQeRbTG8aw6Mp+qKjYsRoDAZ1hJH2jWw93mgjmrxkc3N+g@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 0/2] glmark2: fix an issue with eglconfig scoring
To: Randolph Sapp <rs@ti.com>
Cc: raj.khem@gmail.com, Openembedded-devel@lists.openembedded.org, 
	detheridge@ti.com, reatmon@ti.com, denys@konsulko.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 01:53:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109139

The QA check in oe-core would tell you that (as well as that the 'S'
in Status needs to be uppercase).

On Tue, Mar 5, 2024 at 10:47=E2=80=AFPM Randolph Sapp <rs@ti.com> wrote:
>
> On 3/5/24 15:42, Martin Jansa wrote:
> > Invalid format of Upstream-Status and please squash those 2 commits as
> > they don't make sense separately.
> >
> > On Tue, Mar 5, 2024 at 10:26=E2=80=AFPM Randolph Sapp via
> > lists.openembedded.org <rs=3Dti.com@lists.openembedded.org> wrote:
> >>
> >> From: Randolph Sapp <rs@ti.com>
> >>
> >> Backport a patch from the upstream glmark2 package to fix 2 primary is=
sues:
> >>
> >> 1. Configs with stencil components were ranked unnecessarily low.
> >> 2. If the target config was below 0 an optimal config may not be prope=
rly
> >> selected.
> >>
> >> Randolph Sapp (2):
> >>    glmark2: add upstream patch to not care about stencil config
> >>    glmark2: add the stencil config patch to the package
> >>
> >>   ...y-default-don-t-care-about-the-stenc.patch | 103 ++++++++++++++++=
++
> >>   .../recipes-benchmark/glmark2/glmark2_git.bb  |   1 +
> >>   2 files changed, 104 insertions(+)
> >>   create mode 100644 meta-oe/recipes-benchmark/glmark2/files/0003-GLVi=
sualConfig-By-default-don-t-care-about-the-stenc.patch
> >>
> >> --
> >> 2.44.0
>
> Roger. Would the correct status be:
>
>  > Upstream-Status: Backport [5f23d540342ba69e12afeb6a1ac4f6fd36747975]
>
> (Reading the docs I was not aware the brackets were supposed to be
> included...)

