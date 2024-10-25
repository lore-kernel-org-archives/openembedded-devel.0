Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2EDED1039E
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 15:59:28 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web11.15485.1729871968133161073
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Oct 2024 08:59:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=daER6rxy;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5ebc05007daso1254798eaf.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Oct 2024 08:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729871967; x=1730476767; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8+Rdhe/RUYTYNrjUpG1pdX2orh1w2D4iwv8sVmo1BM=;
        b=daER6rxyOdoQvvfJqJeebgaVx+i26soORQh59SakgQHICwWNM3sLmxyMIUXXLC+el5
         QVAWbMLUo+blLzbUqugTkmT7+UEPYrOvTFc7NyYrsIL7JkYXNBGjojwFNolS+Zxb6Pc0
         EOQtld8DY8lJauC1p7nVyioNQ92HPwGlCEq6GDO7M5uLBoVTUlIKhZE5SOnVHrisN+85
         R7hSRUg+Care2bL2oYCJ5UaP33ZJj3po9TipTu3YmDfnWP019SWudr8s1KSIhyzQQgrR
         oAp86gpfZlNNOKW2lo1uLGm0wDG8cD2E/1HwLSKR4gSXabQ+jUCuLfcrZp/noh5I/6ND
         /d1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729871967; x=1730476767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G8+Rdhe/RUYTYNrjUpG1pdX2orh1w2D4iwv8sVmo1BM=;
        b=kkcT1tQTI5n8aav9B7rjcd8seseZrY2Qz/h+MbVsrZczzLXG+W7eqB5MfufPb3mThV
         BaxJD0ZP9dX6cgeEN2iKHIs1CpXwprKZ6Kw5Bja/GPbO9C9Xmq7PK2i8XUC95Hfz/KnR
         Qs9J/0OA6DKnJJRhtRth7gjcJKIwQv/JCS3n8EAkXUYVOFfjL9z9ZmrnfSiXj8yCc1a8
         KCM3DBPE5WI9pd6TB+nsbkovz9uKmX1O28PYIqcrMxR1V1cyqjo+FQ/jSfcFQ+g7fKz4
         FSm9WgJJWMxZSXQM9gEwsCsKL5MTWKCEFwTiMyKuRwF6GD5z8ZLtPY3r2X0Uy6m9xl77
         V9/g==
X-Forwarded-Encrypted: i=1; AJvYcCXIfpz5eR9mq0YhKzJdr0CXVkrLDMc3Z5dx8R1CWSR6RopBwachL6We1A0bvSJAyivAIWAkMDQJ3dpXW4SvhsKK2p0=@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywgl//uIwso1PlXaB919Z4UYnkEcF8A1VR6bfE4WW/9GYIYfzPB
	pimxo4pLY+HhtcgQj1VqcGOP+0ZPg3PbDVrbrFO6FA6+1VXugygSM8OWZtnqOB6+32cASsfnc5W
	aQBIjAmvlbpiyMMpqtX/D1/qfDJI9cT3N
X-Google-Smtp-Source: AGHT+IFFh9/0l8hdYcnWkFYx6jE2Vx11cX2bAK8j3gM8IcwyGeySa2jKb/nok53aJZsV20h6sGjgePZ8YIW9sedBslg=
X-Received: by 2002:a05:6820:825:b0:5e5:b652:9d14 with SMTP id
 006d021491bc7-5ebee4adea3mr8671167eaf.1.1729871967293; Fri, 25 Oct 2024
 08:59:27 -0700 (PDT)
MIME-Version: 1.0
References: <20241024065109.74010-1-chanh@os.amperecomputing.com>
 <38e5da48-fc0e-4685-b615-992a1f78dd45@amperemail.onmicrosoft.com>
 <CAMKF1sprL34koHC73Y9ji5ZTP2J+2W+TLDmoKjRzUR9vcudDjg@mail.gmail.com>
 <4f094abd-bd57-41b3-b4a4-e42180b45dc5@amperemail.onmicrosoft.com>
 <2b431a79-3d7f-4b55-8238-21072edbaf20@amperemail.onmicrosoft.com>
 <CAMKF1soGa9mqLAxC2+4s+L8iEdgdpp57asn7Y5ULusrucR9sSA@mail.gmail.com> <b1b309ce-2417-47b0-86e1-7d2761fbb68b@amperemail.onmicrosoft.com>
In-Reply-To: <b1b309ce-2417-47b0-86e1-7d2761fbb68b@amperemail.onmicrosoft.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Oct 2024 08:59:00 -0700
Message-ID: <CAMKF1soHqez_xfoWwmvqtwRKh9_4wBaMzbvuXY+MmXMbNEZZsA@mail.gmail.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Oct 2024 15:59:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113228

On Fri, Oct 25, 2024 at 8:49=E2=80=AFAM Chanh Nguyen
<chanh@amperemail.onmicrosoft.com> wrote:
>
>
>
> On 24/10/2024 22:22, Khem Raj wrote:
> > On Thu, Oct 24, 2024 at 7:57=E2=80=AFAM Chanh Nguyen
> > <chanh@amperemail.onmicrosoft.com> wrote:
> >>
> >>
> >>
> >> On 24/10/2024 21:46, Chanh Nguyen wrote:
> >>>
> >>>
> >>> On 24/10/2024 19:18, Khem Raj wrote:
> >>>> Please test it and wait it to merge before sending pull request here=
,
> >>>> feature branches are temporary and usually not something we use in O=
E
> >>>>
> >>>
> >>> Yes Khem, it is only temporary for CI build checking.
> >>>
> >>> Can you please help run CI build? If any other errors, we'll fix.
> >>>
> >>> Thanks,
> >>> Chanh
> >>>
> >> I and Jeremy used the musl compiler (https://musl.cc/), and it compile=
d
> >> the MCTP successfully. It seems the error just happens with your CI ru=
n,
> >> and we haven't known to run the CI to check.
> >>
> >
> > As I mentioned before, the combination is clang19 + musl, musl.cc is
> > gcc+musl only so
> > you won't see clang specific issues with it.
> > That's fine if you can say [RFT] in the subject line to convey the inte=
ntion.
> >
>
> Thank Khem for your instruction about subject patch!
>
> Should I resend this patch with new subject ? It will be
> [RFT][meta-networking][PATCH] mctp: Fix CI build error with musl+clang

Not this time, since I have staged it for testing and it seems to work
for musl+clang case
AFAICT so please send the final patch with version bump to include the
fixes that
Jeremy is pushing into component repo

>
> >>>> On Wed, Oct 23, 2024 at 11:52=E2=80=AFPM Chanh Nguyen
> >>>> <chanh@amperemail.onmicrosoft.com> wrote:
> >>>>>
> >>>>> Hi Khem,
> >>>>>
> >>>>> This is only a temporary patch. It helps check CI build errors on t=
he
> >>>>> MCTP repo. Please help run the CI build; if any error you can show =
here,
> >>>>> then Jeremy will update the mctp repo to fix errors.
> >>>>>
> >>>>> Please don't merge this patch. When the CI builds completely withou=
t any
> >>>>> errors, I will push a new patch with the latest version on the MCTP
> >>>>> repo.
> >>>>>
> >>>>> Thanks,
> >>>>>
> >>>>> Chanh
> >>>>>
> >>>>> On 24/10/2024 13:51, Chanh Nguyen wrote:
> >>>>>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
> >>>>>> ---
> >>>>>>     meta-networking/recipes-support/mctp/mctp_2.0.bb | 4 ++--
> >>>>>>     1 file changed, 2 insertions(+), 2 deletions(-)
> >>>>>>
> >>>>>> diff --git a/meta-networking/recipes-support/mctp/mctp_2.0.bb b/
> >>>>>> meta-networking/recipes-support/mctp/mctp_2.0.bb
> >>>>>> index c6aa7c104..793afe755 100644
> >>>>>> --- a/meta-networking/recipes-support/mctp/mctp_2.0.bb
> >>>>>> +++ b/meta-networking/recipes-support/mctp/mctp_2.0.bb
> >>>>>> @@ -5,9 +5,9 @@ LICENSE =3D "GPL-2.0-only"
> >>>>>>
> >>>>>>     LIC_FILES_CHKSUM =3D "file://
> >>>>>> LICENSE;md5=3D4cc91856b08b094b4f406a29dc61db21"
> >>>>>>
> >>>>>> -SRCREV =3D "f110926b082731b25720b444378ad55d7a9d451d"
> >>>>>> +SRCREV =3D "089dc53fa7387cca517cd713061c323ca06fb6dd"
> >>>>>>
> >>>>>> -SRC_URI =3D "git://github.com/CodeConstruct/
> >>>>>> mctp;branch=3Dmain;protocol=3Dhttps"
> >>>>>> +SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Ddev/cro=
ss-
> >>>>>> fixes;protocol=3Dhttps"
> >>>>>>
> >>>>>>     S =3D "${WORKDIR}/git"
> >>>>>>
> >>>>>
> >>>
> >>
>

