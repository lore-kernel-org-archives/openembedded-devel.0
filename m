Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61324C369D1
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 16:44:20 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web10.29496.1745772233278774776
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Apr 2025 09:43:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H/or8a8Q;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: schonm@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-72c14138668so1076217a34.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 09:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745772232; x=1746377032; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVk/FeIZXatU84jRvjvJ64i1dEomDrdcxTX4cYa+VDk=;
        b=H/or8a8Q6ipHuM7g5SKslt7jKQHayZ5CxxBGVTQPV1pNP4Crr/ru7IKCljJMDfMTX+
         cz16fvUwiYfpIpVKEPFRc22kWJVD3n9aZ3/BtjiT4FUBiAECv0FYz+381HV7mnw0eDvA
         xLVp/su6HZtvgAOBtkWYM5lPkVwaDQTmgHjBanYBnslQCSMUhIreBmvl9GLASXJmfged
         3Ibjaq0LDNxf8qpALpGiNs962eMe+n95cGhvuXcgLxl+VXICtrzXp+qs0fgrlBSDEPra
         RsfQDOJYETrDDXUW4fJor8PGA6H9h2DLureLG2nSfacVcD3PZh0KdQcEIH/CmhErLoe/
         VNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745772232; x=1746377032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FVk/FeIZXatU84jRvjvJ64i1dEomDrdcxTX4cYa+VDk=;
        b=cluQUw4UcJJ8YiIAxSAW72Ib5QiI1xWSWPX76Bt9QmKTGJEWQvecYMj3SjsQ7ecNxV
         NzO4CGTaAsw/2XzG7Q6DeEiQO8PfNgWERFJBOHKrNb69T0JCJliaCFLVDCVxuvNIsUVd
         WoPAyuzwAKHppldshZxEdCPyHHTtQRwse5H+7nMsavTs02HZCbv+IzoA2HJlh+TakUUh
         CEKQuKNSgXjYzfo+uAgeSmdXkB8cTRIMAhh2sn4Vn1wJbJ6p/MzDP/pA2cmuQlkT4qKM
         hL+ur0j+72HOMd2F5Cf8dU1UgiFwfY4V0T5Eh2rJpUra7VQfsXzX9RIKZ+7xz/GS/HJZ
         kwPg==
X-Gm-Message-State: AOJu0Ywg7Yh2xKPOz9cCZKzahe7mTEjQbi8OCn7Lotx7hYQlTivqAvy+
	OQfBFEbpr4qGGtL23mKIdQggCHMNZfZXj+LS2leId3dbwWmhR7xfG2y8N2iul+V8j/2lGhXOZRo
	zafXkz4zNyQzqKQyi82dljOVNRG0=
X-Gm-Gg: ASbGnct+LW2r5xixUdDCMayVGeyQYk2yFieHISWiypgUFxqHFdlHaFuXG9HTbJzRLwI
	cFEBgAGpk/GNFLl+qsbgt8nGuet6NtAtPq4pQd4PCRlaQFHJDKmHD+B9JsnbIjZxV6RHKkAHRoz
	QgsPtlnninTSCwKXUUBvjmN3hU58nP3w==
X-Google-Smtp-Source: AGHT+IFNUrmo6vVQzuxDxztsi4RN5jQSt1dc9Na5OZzz6IM0cZYIXxsuqnS0S+ac9Ald4SAcoR3i0NqGiFg9ka+sCgU=
X-Received: by 2002:a05:6870:4595:b0:29e:503a:7ea3 with SMTP id
 586e51a60fabf-2d9be8f1b56mr2902113fac.36.1745772232091; Sun, 27 Apr 2025
 09:43:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250427163710.14826-1-schonm@gmail.com> <CAMKF1so_ceGimH+ySHK4QQamSFdVTGgH7mvgo=yo3RK49-WX0g@mail.gmail.com>
In-Reply-To: <CAMKF1so_ceGimH+ySHK4QQamSFdVTGgH7mvgo=yo3RK49-WX0g@mail.gmail.com>
From: "J. S." <schonm@gmail.com>
Date: Sun, 27 Apr 2025 12:43:41 -0400
X-Gm-Features: ATxdqUFqOkU7StvndqQPmccPrIgN-kzFOuf6vfuo8XGauCUvT5RPyrTA5BuGnZc
Message-ID: <CABTo8gBOgNioAAK6fG=TomMdkOJeY2JSz2tNBWusA1BWOdO12Q@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] pgpool2: upgrade 4.5.1 -> 4.5.2
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 16:44:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117171

Stay with c17 for the time being.

On Sun, Apr 27, 2025 at 12:40=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
> Does this fix build with gcc15 as well or do we still need to stick to c1=
7
>
> On Sun, Apr 27, 2025 at 9:37=E2=80=AFAM J. S. via lists.openembedded.org =
<schonm=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> Fixes for memory leaks, uninitialized memory, segmentation faults and ot=
her fixes.
>>
>> Changelog: https://www.pgpool.net/docs/latest/en/html/release-4-5-2.html
>>
>> Signed-off-by: Jason Schonberg <schonm@gmail.com>
>> ---
>>  .../pgpool2/{pgpool2_4.5.1.bb =3D> pgpool2_4.5.2.bb}              | 2 +=
-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>  rename meta-networking/recipes-support/pgpool2/{pgpool2_4.5.1.bb =3D> p=
gpool2_4.5.2.bb} (95%)
>>
>> diff --git a/meta-networking/recipes-support/pgpool2/pgpool2_4.5.1.bb b/=
meta-networking/recipes-support/pgpool2/pgpool2_4.5.2.bb
>> similarity index 95%
>> rename from meta-networking/recipes-support/pgpool2/pgpool2_4.5.1.bb
>> rename to meta-networking/recipes-support/pgpool2/pgpool2_4.5.2.bb
>> index a2f7665df1..d3dadfc6d0 100644
>> --- a/meta-networking/recipes-support/pgpool2/pgpool2_4.5.1.bb
>> +++ b/meta-networking/recipes-support/pgpool2/pgpool2_4.5.2.bb
>> @@ -16,7 +16,7 @@ SRC_URI =3D "http://www.pgpool.net/mediawiki/images/pg=
pool-II-${PV}.tar.gz \
>>            file://pgpool.sysconfig \
>>            file://pgpool.service \
>>             "
>> -SRC_URI[sha256sum] =3D "8e14b0558a15dae8767c8e1acee3f2f6c7c08ebfffda66a=
359367eaaa56c3936"
>> +SRC_URI[sha256sum] =3D "480ac23f01cd7d6c856b29386bf17a848712fb4b4057d4c=
8abd5c8bf819bdf06"
>>
>>  S =3D "${WORKDIR}/pgpool-II-${PV}"
>>
>> --
>> 2.43.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#117169): https://lists.openembedded.org/g/openembedd=
ed-devel/message/117169
>> Mute This Topic: https://lists.openembedded.org/mt/112485538/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

