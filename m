Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5CC4C433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 22:04:33 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.787.1646172272775258224
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 14:04:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ee5OWDij;
 spf=pass (domain: gmail.com, ip: 209.85.216.46,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id cx5so81836pjb.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 14:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Mx+uhB2vOUUrpsweeJK+Wi9N+b4muE5CRTaSz/D2a7E=;
        b=ee5OWDijAYQuMK8eRFSdzODQik2xmR0JJgovvx3ysidyPB6azaPEGri1lz5SFoyMWz
         6mNCKa48SPQMlJUMlqaJe5CvxsEQCuWBNdci/55n4EBOXGfGeJHpGZTRj9WjWxmFURUu
         2a1CxrXGXNJo1gomCXKrptlu9+XMAVELLxq1h6GKlgt1w1GjaAy3ihvtBd+l9w+brnzJ
         EPWA93WmVlrmzP4Ss++fX3EvLJ3jOdqeVmjeVSyVQuDLuqa5AnF2HQ43XUbtMspTjip7
         LGl8toApu5HzJV991h4jvg9j2nh0xatI9+ubyhGwdxyaxXWBmdAlroxqsZrkECvBc79e
         Ntnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Mx+uhB2vOUUrpsweeJK+Wi9N+b4muE5CRTaSz/D2a7E=;
        b=e94aaki8jf8viFSi23zuQ/NMMG6gDnYdI7ZloF7fOTgE1+Tl3Il3TH6dQH26ECTvKo
         AdUDGoVMkfjQFiYgNTP512kLxoTK3TysZsuHFV2XkcoLy7Vr9DcZ44SgmDQ28W0p3eWE
         iGHCeT7TOcLWLj4WjwsuMMaA/Plc+cGIba7yvpJj/hgt4jA+4IfoJzjbbel0Aoxuluez
         zWb5dgULxfmdN6esnzoV1rjiQEy8Wn8bGNoSPgwePbpfOS/cD9kJAoKPq1vJ7L4C0afV
         AfUrTCrrlTPm3Mme2xGYi7r/XDgjC7/czNqvvn42Ep5f7R0EEulUAqtcs6p9cimJNhmt
         24Ag==
X-Gm-Message-State: AOAM530LqRdkbEg8zbD66VpV/EUDVx3ixunMfdsDIhmXLfOuJKyRl1hj
	UiBrJ2O8lDcWa42XFjE+RYISdrbe4LjTwOrSUgk=
X-Google-Smtp-Source: 
 ABdhPJxHdl3xYa+xzpvS0UyiLt17h5VImVuplJA7ejcENZdahoussu+1L/IjAqMyyDZNR7mXi+Us8MsBJhxGZQHHSBw=
X-Received: by 2002:a17:902:f787:b0:14f:43ba:55fc with SMTP id
 q7-20020a170902f78700b0014f43ba55fcmr27481571pln.3.1646172272312; Tue, 01 Mar
 2022 14:04:32 -0800 (PST)
MIME-Version: 1.0
References: <20220301161346.700028-1-adrian.freihofer@siemens.com>
 <CALbNGRSuvB0i-T9-_8m6Cpw698ssHEK0QSbOQs5VuP97tyvN2g@mail.gmail.com>
 <a0727acf73bdddcb6d8c04d1d7e078d278f657d6.camel@gmail.com>
In-Reply-To: <a0727acf73bdddcb6d8c04d1d7e078d278f657d6.camel@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 1 Mar 2022 23:04:21 +0100
Message-ID: 
 <CALbNGRRNUWRx7V8ygEecRkUwrYGsV5ZLGq2tAjZbhKC0N1S6Cg@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 1/2] networkmanager: switch to meson
 and git
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 22:04:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95659

On Tue, Mar 1, 2022 at 9:22 PM Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
>
> On Tue, 2022-03-01 at 19:40 +0100, Andreas M=C3=BCller wrote:
> > On Tue, Mar 1, 2022 at 5:13 PM Adrian Freihofer
> > <adrian.freihofer@gmail.com> wrote:
> > >
> > > - Switch to meson build-system
> > > - Switch to git download (was not really possible with autotools)
> > Why switch to git?
>
> It is more convenient when working on NetworkManager code or quickly
> testing an untagged commit or picking a few commits for testing
> purposes. I don't see any advantages in using tar over git. So let me
> ask the question the other way around: Why not use git?
It just gets more effort on maintainers and I think git should not be
made standard for no other reason than making life easier of one user
- no blocker - just my opinion

Andreas
>
> Regards,
> Adrian
>
> > Cheers
> >
> > Andreas
>
>

