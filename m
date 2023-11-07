Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3AB2C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 10:00:22 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.7172.1699351217923468990
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Nov 2023 02:00:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a1Ama1C/;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2c518a1d83fso72150751fa.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 02:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699351216; x=1699956016; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sm4p/UNGPjBP91chJuk2IUo99vfpv92tbqMenUIl9W4=;
        b=a1Ama1C/e9kJYmg8TZSESqi4m3wQ5rVvf64+Z3OVgLopwsr/y06J2hIF4wJ/MfTNGh
         ef/8sfJ2gX9ee8dnLg1beGj4g+L2NINgpMjbStogCBf94wG5dhq+GiVQ6h1mX+J+VQ9x
         WJtGwND2ZNey71ExvsThRJSJHoPSd+8G1HksoNUYVuG/bBH9ZWS1WNdHZoBfRKHmyX9d
         h7hJ5CGpIpOzJPAHvMKG4dzz49ITsODotOrIr/sS/4OCZHaoQkF7k1pwYfK91wIsX9ez
         UNtzKNK2eNmgcV3t6M+ujqRFBY6Cw82VmkdnyR9q4gT2nQBf3F1WHjNrJUHripVgfl7U
         K6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699351216; x=1699956016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sm4p/UNGPjBP91chJuk2IUo99vfpv92tbqMenUIl9W4=;
        b=LsqUcg9G2Ih7mUtr0dE9G6jvHkXwBdbXfi14YFYDLqFGO1Ukbl39lpHUusnnEEaV20
         TfvgryUd4iy+jxzaxO92wfermDReW3zP9zDv90hHFCSF1TYaikUwdcyFx4/mz0BLiZE6
         JIVoyK8Wn4iiSngfrDcTQlD4vE1zSUr9agGX+juO2IOdBXF02oYOjxlLoHVT86NNDw7X
         fKlJMk2ogNe8UrsSUcKRrWYe4yEUFub5jmoSmaJ4ETkhyQRGNuLsQqDiEiv2Z6EgAE9k
         T05MIfS2Oq4Fb5zz6Jnlz3xH20JrvLw5WzBuxD2+1LlHRAztbMRpAs8Fnd5HcZ7gEDGg
         CXVQ==
X-Gm-Message-State: AOJu0YyAD8RnUjPA9m0ONQeun1RF+Gvcl2l0UhEustfbKYM05p1sRm8b
	HW1y5ObwrKJYTYL950rf5xT1JjcpOHAicKoJu/s=
X-Google-Smtp-Source: AGHT+IFNo8KPhbDaoKrM2AgPi6mpiapSHaPMv1wu7U2364p3ANFbsWzzICCXxPKfKph3hVTIR987JZYDXVTTDFsRnUA=
X-Received: by 2002:a05:651c:2117:b0:2c6:f625:cc61 with SMTP id
 a23-20020a05651c211700b002c6f625cc61mr14261375ljq.31.1699351215726; Tue, 07
 Nov 2023 02:00:15 -0800 (PST)
MIME-Version: 1.0
References: <0101018b96bed4bc-d43306c3-deb1-4fad-8737-e15d03ce0f3c-000000@us-west-2.amazonses.com>
 <CAFMvBt09Z7EUh1kRUggWdQ9_HJfMzZdP1qynNrN+Mg3ESseNRA@mail.gmail.com> <CAMKF1so-CM2VWTEU65rt7ZYifjLVwW5Stw=b11VwAO1mY_wUqw@mail.gmail.com>
In-Reply-To: <CAMKF1so-CM2VWTEU65rt7ZYifjLVwW5Stw=b11VwAO1mY_wUqw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 7 Nov 2023 11:00:04 +0100
Message-ID: <CANNYZj9V+EwdhL6Lz89yLzL2FYW9W0rWUb266usn1ovEneEQgw@mail.gmail.com>
Subject: Re: [oe] [AUH] modemmanager: upgrading to 1.23.1 SUCCEEDED
To: Khem Raj <raj.khem@gmail.com>, Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "Theodore A. Roth" <troth@openavr.org>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 10:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106443

Yes, please do exercise caution and don't push AUH updates blindly,
especially when the new version looks iffy, or goes from even to odd
in the middle component. A lot of recipes in meta-oe seem to have
broken version checks - there's a whole arsenal of tweaks in form of
UPSTREAM_CHECK_* settings that I regularly use in oe-core to get a
perfect report from 'devtool check-upgrade-status'.

Alex

On Tue, 7 Nov 2023 at 05:08, Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On Mon, Nov 6, 2023 at 7:58=E2=80=AFPM Theodore A. Roth <troth@openavr.or=
g> wrote:
>>
>> On Fri, Nov 3, 2023 at 1:53=E2=80=AFPM Auto Upgrade Helper <auh@yoctopro=
ject.org> wrote:
>> >
>> > Hello,
>> >
>> > this email is a notification from the Auto Upgrade Helper
>> > that the automatic attempt to upgrade the recipe *modemmanager* to *1.=
23.1* has Succeeded.
>> >
>> > Next steps:
>> >     - apply the patch: git am 0001-modemmanager-upgrade-1.22.0-1.23.1.=
patch
>> >     - check the changes to upstream patches and summarize them in the =
commit message,
>> >     - compile an image that contains the package
>> >     - perform some basic sanity tests
>> >     - amend the patch and sign it off: git commit -s --reset-author --=
amend
>> >     - send it to the appropriate mailing list
>> >
>> > Alternatively, if you believe the recipe should not be upgraded at thi=
s time,
>> > you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
>> > automatic upgrades would no longer be attempted.
>> >
>> > Please review the attached files for further information and build/upd=
ate failures.
>> > Any problem please file a bug at https://bugzilla.yoctoproject.org/ent=
er_bug.cgi?product=3DAutomated%20Update%20Handler
>> >
>> > Regards,
>> > The Upgrade Helper
>> >
>> > -- >8 --
>> > From ad32b52fe87e6edc3885802cbb85b8524e4c156a Mon Sep 17 00:00:00 2001
>> > From: Upgrade Helper <auh@yoctoproject.org>
>> > Date: Fri, 3 Nov 2023 16:08:56 +0000
>> > Subject: [PATCH] modemmanager: upgrade 1.22.0 -> 1.23.1
>>
>> Why is modemmanager getting updated to 1.23.1? That is not an official
>> release, but is a
>> development release as far as I can tell. The tag in git is '1.23.1-dev'=
.
>>
>> The latest release is 1.22.0 (announced on Oct 11 on the ModemManager
>> mailing list).
>
>
> Hmm I think we need to fix the trigger then to only consider even release=
s
>>
>>
>>
>> Ted Roth
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106419): https://lists.openembedded.org/g/openembedde=
d-devel/message/106419
> Mute This Topic: https://lists.openembedded.org/mt/102372092/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
lex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

