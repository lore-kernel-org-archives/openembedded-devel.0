Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AD5BCE8E8B
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 15:22:28 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web10.17229.1729783347278886160
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 08:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XBzYBbo0;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5ebc0dbc566so574194eaf.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 08:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729783346; x=1730388146; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PMGTy7rl2VuoLUuUepkQNvQT4nYBwMmPBGX9TeojDLo=;
        b=XBzYBbo0lj9OsK/+IdkCQsVA/qO5xuEEItK6Jo9KKv4nzZIIofSCnwMH4zVHwblypS
         /vILIetqq6phsKwstndg8YmL9E9eavn0rigloay35Ktmg5uN4nRzqfTdvl1dWNlpfV8i
         1Q6MWNnM40ohmfd+WAUz7SSVrJOfzoKkMr5OJoKF4kggz8+ao95PmlowIBUwpeGYTXvD
         arm3WrrRltYbf0IH6CoW8YX4rwjL1nv8f/csPOgiBSC33sa6bYUoQbU+vTf01aur2cjZ
         +ALLVtlJj7TmcQtf7WLKec7E/OOxF+lCPjKpSRmp7rQvo1zN2SbMnBTl8RnMJM7kEWg8
         kyDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729783346; x=1730388146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PMGTy7rl2VuoLUuUepkQNvQT4nYBwMmPBGX9TeojDLo=;
        b=JyceuH8ift+JsZC0uo+XDt+l/WXak1qrimxyx6SHS8pvEqgZ/iA5d33D84vWQejY/T
         dpDbWaKJLEQsCIfCSBRteUmWbfQhfFtcShWfU04Qd7Ryju2b8+C0PB1DveLpmcBfJWVx
         KXB2NLx2gfYSIA/0h21eGUabdLfSRQCgDl18Ql4rxmcfjqiGFw5seSfOsEQWp3ZG8RgV
         nl73D2SCJbrc8DkYjicGKzO2JHQBKNwfHd4x4MrVM6lBIDC8XI18WWpgjHFV1zYRiAoX
         FLu2lSxTGgqMd9in2Ff/SBI1E2YIH5Cgan0GJxms9JJ76cNLMLZGRmSwsVVTPavtouqk
         iCxA==
X-Forwarded-Encrypted: i=1; AJvYcCWkh+DRpLHK9oiGZVEBJ61J3a9+VMEur2sa++rx/7s6Lqv942Q3qCWtBwaUQwVOoF/egjDX94JBExfxHaXhLHZZlXg=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy3J9mQ2ZoyEVtdTPMoJoIXf2qn/XGsBUNAkGnDolufXERDExNN
	62Ln9/PHf7c7t9/jrIKZIZq54/m2IRvvHnuRQFChKim+RabC6RecWpBzmdqWAUytd7J8zxXbfCA
	wqSruxyOsbKViQOOKBddSLa2vju4=
X-Google-Smtp-Source: AGHT+IGLCi/S9kcHNJ0/R+qNTym4qMAq86mZWVAIVExkaCmRaenIqxh6lXb+pxXIdnxnLyABbG1J0tbguQn2CtsQTlY=
X-Received: by 2002:a05:6820:1c85:b0:5eb:827b:9bbf with SMTP id
 006d021491bc7-5ec057e80f2mr1785241eaf.7.1729783346508; Thu, 24 Oct 2024
 08:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <20241024065109.74010-1-chanh@os.amperecomputing.com>
 <38e5da48-fc0e-4685-b615-992a1f78dd45@amperemail.onmicrosoft.com>
 <CAMKF1sprL34koHC73Y9ji5ZTP2J+2W+TLDmoKjRzUR9vcudDjg@mail.gmail.com>
 <4f094abd-bd57-41b3-b4a4-e42180b45dc5@amperemail.onmicrosoft.com> <2b431a79-3d7f-4b55-8238-21072edbaf20@amperemail.onmicrosoft.com>
In-Reply-To: <2b431a79-3d7f-4b55-8238-21072edbaf20@amperemail.onmicrosoft.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Oct 2024 08:22:00 -0700
Message-ID: <CAMKF1soGa9mqLAxC2+4s+L8iEdgdpp57asn7Y5ULusrucR9sSA@mail.gmail.com>
Subject: Re: [meta-networking][PATCH] mctp: Fix CI build error with musl+clang
To: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
Cc: Chanh Nguyen <chanh@os.amperecomputing.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	openembedded-devel@lists.openembedded.org, 
	Thang Nguyen <thang@os.amperecomputing.com>, Thu Nguyen <tbnguyen@amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 15:22:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113175

On Thu, Oct 24, 2024 at 7:57=E2=80=AFAM Chanh Nguyen
<chanh@amperemail.onmicrosoft.com> wrote:
>
>
>
> On 24/10/2024 21:46, Chanh Nguyen wrote:
> >
> >
> > On 24/10/2024 19:18, Khem Raj wrote:
> >> Please test it and wait it to merge before sending pull request here,
> >> feature branches are temporary and usually not something we use in OE
> >>
> >
> > Yes Khem, it is only temporary for CI build checking.
> >
> > Can you please help run CI build? If any other errors, we'll fix.
> >
> > Thanks,
> > Chanh
> >
> I and Jeremy used the musl compiler (https://musl.cc/), and it compiled
> the MCTP successfully. It seems the error just happens with your CI run,
> and we haven't known to run the CI to check.
>

As I mentioned before, the combination is clang19 + musl, musl.cc is
gcc+musl only so
you won't see clang specific issues with it.
That's fine if you can say [RFT] in the subject line to convey the intentio=
n.

> >> On Wed, Oct 23, 2024 at 11:52=E2=80=AFPM Chanh Nguyen
> >> <chanh@amperemail.onmicrosoft.com> wrote:
> >>>
> >>> Hi Khem,
> >>>
> >>> This is only a temporary patch. It helps check CI build errors on the
> >>> MCTP repo. Please help run the CI build; if any error you can show he=
re,
> >>> then Jeremy will update the mctp repo to fix errors.
> >>>
> >>> Please don't merge this patch. When the CI builds completely without =
any
> >>> errors, I will push a new patch with the latest version on the MCTP
> >>> repo.
> >>>
> >>> Thanks,
> >>>
> >>> Chanh
> >>>
> >>> On 24/10/2024 13:51, Chanh Nguyen wrote:
> >>>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
> >>>> ---
> >>>>    meta-networking/recipes-support/mctp/mctp_2.0.bb | 4 ++--
> >>>>    1 file changed, 2 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/meta-networking/recipes-support/mctp/mctp_2.0.bb b/
> >>>> meta-networking/recipes-support/mctp/mctp_2.0.bb
> >>>> index c6aa7c104..793afe755 100644
> >>>> --- a/meta-networking/recipes-support/mctp/mctp_2.0.bb
> >>>> +++ b/meta-networking/recipes-support/mctp/mctp_2.0.bb
> >>>> @@ -5,9 +5,9 @@ LICENSE =3D "GPL-2.0-only"
> >>>>
> >>>>    LIC_FILES_CHKSUM =3D "file://
> >>>> LICENSE;md5=3D4cc91856b08b094b4f406a29dc61db21"
> >>>>
> >>>> -SRCREV =3D "f110926b082731b25720b444378ad55d7a9d451d"
> >>>> +SRCREV =3D "089dc53fa7387cca517cd713061c323ca06fb6dd"
> >>>>
> >>>> -SRC_URI =3D "git://github.com/CodeConstruct/
> >>>> mctp;branch=3Dmain;protocol=3Dhttps"
> >>>> +SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Ddev/cross=
-
> >>>> fixes;protocol=3Dhttps"
> >>>>
> >>>>    S =3D "${WORKDIR}/git"
> >>>>
> >>>
> >
>

