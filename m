Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D343CAC59F
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 02:49:48 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.4847.1758163784019703720
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 19:49:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QqE2wTLP;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-71d603a9cfaso4197547b3.1
        for <Openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 19:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758163783; x=1758768583; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKPjOMKLshiDkM2s+tEb444lg7m8yXDAURKNlS9cvyg=;
        b=QqE2wTLPKOXR4Q3K1+NCsxYO5z9Rnngtn/mOUwQmfJd4DC8ujhvbu/AN3HY5Ml9CHF
         mna8fUlP47dL6txnvZCso8X/Hv1rMG5mLFrQprO52YU8IrXtOrqkUNCDbCmFBQ4/WFGR
         Vbdign5bgjme/L5I3pkXlcS1zCG8R05SiBo+tDflrJFgtso7fxKSoU+ZQHfQ0tzunNM6
         rE0MX0HqZ6O0eTnLi5sVCUpZCZ7r9sgdOJgsTO9GokSnXWWhfXm93ZMh2ZCFo4f+uBHY
         WMfbnDZaySEl0UzVeWldp/5p7CbqNqJ7/bTpIJjGXQSCN1eIhOHZ9VNl04JAACvfNH4X
         Cp6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758163783; x=1758768583;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKPjOMKLshiDkM2s+tEb444lg7m8yXDAURKNlS9cvyg=;
        b=wBdSOSJrGzZQ3RCAIFJsT7aj+7Z/FR7nkWbXjWXUrigRM1VbGJdawVeeZ4AShXLf3h
         puCSV5jgQW6IK49XFuKMgTyRn3vi/SPcAJEeXMCowdxyXy1hvGUi/9CmANRk+J5uIl00
         1cVvbm33KUumPHJ5EwYV9yAw5M5XeqwUGSP3zyPwOuypTrbq0dFVo7zdJg34ykseewT0
         tQqEBTcm7CJly5ONcpUAKfLrSGKRIYDJCgjcR3/N99spJNnrgaMBVYk1DBxwTUrNJSKm
         X6mscjuQ7Wh4Pv0ewKS6Ha0wiFDgaxUlNgxlpJgU7t5LuVic/hXlr8QrG+UW3XJFcPhk
         Yclw==
X-Gm-Message-State: AOJu0Yxw6KgoUwfAcwlKf3gZwDxzPi5fbG3bNLY3bMUNraYJTTIbtBCz
	CsKUtgAlt9fsp1Tcd2hb9KYG5rzWiuaLqJD4l6xx1P4lfw9K8OIXPsSAbOVWQoI2QFVuWTK7qqN
	ysalYgtRgV5ezvakHgqPATmtCIxJdAlwVX9ZHPJA=
X-Gm-Gg: ASbGncvZYbEFjEVPDjnnSiaGc/QvgWpnQh5fjbz+XwYUTFHqoFLOQ94G7wzkCzyzRaq
	BSWTdKgj0ajr6bKpnsx818us1CFFp4teqjyGRHxuFIPzZwdRFuMdfX+A6OK93S9o8/t1ZmxS/FI
	FeT4bW8ac9n3aCeXr/kV1uhNvOb86F5CrpyslwyL/QSlKYPHJVWqkfvOYSOgpOcFrALXM5EtlQ0
	T4ctQ/r9IknRT/j65qO51KctITzw7q3GrrJ1rMlQwvDzodACQzahcPISFE9nZkO2gf0juFMmCJ+
	wj2uxJRkAs/HcURFCzIaTo+KU2MXHmBNr8WcTJIR+1I=
X-Google-Smtp-Source: AGHT+IFwVmzGZ7xSdw/PUr2AqWv6lJq/N+IE5EpINJ4Xr/QHzMPgMoLfTT3nwwen0MN86FEo7sUNsQlJwSRtFVgUscA=
X-Received: by 2002:a05:690c:4a03:b0:732:39a:8218 with SMTP id
 00721157ae682-73890da82bdmr39343927b3.20.1758163782637; Wed, 17 Sep 2025
 19:49:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sqhzO979KgHE9BEfbw5xe7NH0GKZji9VHOAy6pn+E9NDQ@mail.gmail.com>
 <CAMKF1srN7LZORRCgvMP6e9Z-h6twprwBHw1h7oxRfYEBPXresw@mail.gmail.com>
In-Reply-To: <CAMKF1srN7LZORRCgvMP6e9Z-h6twprwBHw1h7oxRfYEBPXresw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Sep 2025 19:49:16 -0700
X-Gm-Features: AS18NWAmkijUU1DMB6ObaGRibX1eO6Ejm-akhbI-bH6J-n15GSq50K2vdn02B4E
Message-ID: <CAMKF1spy0PQ3Zpjm9YS-1beTO+Rp2ss7wjQL3+JqGGopvd2z=g@mail.gmail.com>
Subject: Re: Stable branch maintainership
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 02:49:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119502

Hi all,

We have pushed the first batch of updates for
scarthgap/kirkstone/walnascar overseen by our new release maintainers.
I do realize that we might have missed some patches
during this transition. Please bring any pending patches to the
maintainers attention. We will be working on refining the patch
testing, CI, and automation for release branches
going forward.

Thank you
-Khem

On Thu, Sep 11, 2025 at 11:54=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
> Hello All,
>
> Thanks for considering this and responding to the call.
>
> Anuj and Gyrogy have offered to help in maintaining the stable
> branches and Ankur Tyagi has also offered to help with the stable
> branch workflow. I will work with all of them in dividing
> Thanks for signing up for this work. For now, Anuj will be maintaining
> scarthgap LTS release, Gyorgy will maintain Kirkstone LTS and
> Walnascar releases. We will work towards infra and process next.
>
> Thanks
> -Khem
>
> On Mon, Sep 8, 2025 at 2:47=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
> >
> > Dear Community members,
> >
> > Armin has been doing awesome work in maintaining stable release for
> > meta-openembedded layers for many releases, however his situation has
> > changed such that he is not able to continue the meta-oe stable
> > maintenance.
> >
> > We have three branches in maintenance, kirstone, scarthgap and
> > walnascar at the moment and
> > a backlog has been piling up. Several members have raised concerns on
> > mailing lists on pending
> > updates for the stable branches
> >
> > I would love to have someone step up to help with the stable
> > maintainers role. Which would
> > be looking for stable branch patches on mailing lists and reviewing
> > them and creating a staging
> > branch ( like contrib/stable/kirkstone-nut etc ), testing and
> > preparing final pull.
> >
> > Armin used his own machines to run the CI, we now do have a machine
> > available for OE CI
> > which we should be able to use for the CI loops for these branches if n=
eeded.
> >
> > Looking forward to hearing from you
> >
> > Thank you
> > -Khem

