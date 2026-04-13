Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8307BF3ED78
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 06:15:19 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.266009.1776060917972654690
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Apr 2026 23:15:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=htcss/C2;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a2beae348eso4348931e87.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Apr 2026 23:15:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776060916; cv=none;
        d=google.com; s=arc-20240605;
        b=ljeKszqiLmDZLUe2U5cvaEeAlXsHUFvvpgJ416PB7rK6sDQOjWYrfDaA9TDHm50Zby
         C9k+WSapuD4WKUqBIhkFlPOJTQKQkkhiwwjB/l+I28+3B2SFbmLZTt0j0vc8uPSk4yGS
         CzDCq0c/Whqv4imNCBNHzYmSvS88mloA59/X+JocqSr/F4pyP6q3DdBiB/kRrbcu0ViN
         t+xmSZUHCmGi0HDxNKzyjkuANFzamUI7BM2nryAP6HZdATLomvRJcfigm1Tb/t7+g5UG
         k/auoU7C6343hrr8EkH8I9oeL2138Y9RqReNAOIgHIKiPfZX058pDx7zY8IpTA3HXPe/
         5vxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=coejLT/gBUhKmMi8JkR9WhupEZQeTNcPSTfP+9MU95c=;
        fh=Lx/5zH2vfgWxKPqZrZelzmVXG4iYeydXryuErSvJ0KA=;
        b=N7ylvJqCahW+buo+E5Kfbm9iUsunQo+FNL8+buaYh1qZj9OFVwie0572+qN1H958wI
         MGzy1iDvnnDzDu5LHZ5wPzB1isIK6/IQs541teCX8cCVxB9iDzFL8/QPlWRsaVJ/0HHN
         +8zwKnsnMzcwrT4k3383GaYNsdSUbikvvJp29GjiWXFPprUjcObJvXq/POIEC0seYJCN
         TNiC0EnxqDRn1+vC2mUQEqcb54zm/imL6nW+/vn9URATPEK4Nm7CN7XUV1lWVJfn7OzY
         G7G2A3OtM13J66ogOM6zNK+6MsSKEtvjH/FLFoM7ZFpmYMf3TnH7PFyXmL6UzoTo88El
         Uo+w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776060916; x=1776665716; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=coejLT/gBUhKmMi8JkR9WhupEZQeTNcPSTfP+9MU95c=;
        b=htcss/C2IYftUD2WL1N6VcITz98FiikC8xfKEJqFWUKoR0/Gd1Mb8ogyH8YwvUFpFD
         O539kECGudts/tRGct0CfvWHyQw9AMgGh7l+D/zkFOspjj6hiVSJrwTHUxiugVrRdoza
         PNwJGGlfzdu8cVS3YFHmRXEEF/d2EycQ1ep+GX3LVnuDcAYKQYjW4RJ5iOw4DwLO0kxe
         BSnIYoLEfNfxMxoHAc2VrohoEtyZnURFv88L9hm90dg426I8505i5caKG1MGi4evfNRo
         iShK+xFBmle1KjZW+rWuzMV1VQQbMtN7KPfAXXBYgd5QOeOva1qLIJ2CKpNleZ8gizD1
         /1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776060916; x=1776665716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=coejLT/gBUhKmMi8JkR9WhupEZQeTNcPSTfP+9MU95c=;
        b=mVs/KL/ZM9GMBF/d9F8Wm9FSDz0+n29clwuSyGR5/ZeFTs0Xyz0hJTrViRhv1Jxb/u
         6PzyGS7uATqSQ8t2PVrK5UBCvWpgi3B8/j7LcIyQUbKic7o2dBBZfYMVMnafIghi4VI/
         FYKxk7hSZKdieA5POtWVo1u+fYfaiBHuZmk6pVBKZupGgYYq0E8B9bCmBXN3/HzoAUhe
         E4Pei7KjP95oB6QWbIlz0Ui3Rkojb8c9iQabSKAsNPYlMAYrVKaDuu+F/hccOFwAfXKc
         YzINy4YL4K+6ZlOsCTajewzYMWUHWq3hMGAkz06szUT/YH6BPUlFCEtjnxcwf8VbKZWh
         Hqkg==
X-Forwarded-Encrypted: i=1; AFNElJ+fhCRq6pUyUCCbeHtPKuem9w0T/+I14lUGxhCb0OFAvG4fB13Bkn5RC0SynjlFs9yYautantdRvhmmYnZGU4NWD7Q=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw8Rv2L7C2TxX4V4z1BfGIHp67X5Foyruv6OkAAkBGCc3R6xFrs
	rt2LQGJcMe+k/ENml7IYgii2eHx+qr6nctQbwU9PoQn5E6dvcck/ORRKlZDK4FRTwgoj/0hCnXo
	yH/i+li6menGfIQRFpGxvVCFKM0mVo+g=
X-Gm-Gg: AeBDiesBv9kuhiVCKdcngjGf3uoO6kPjcWAppgFko9XvkJRPSUyIJCmXpoZHFvlE7Lz
	aRMX2EqI1GWpYfDI6XYmiIkBjyU8QvJ6Znau4bQ6xpNPZ6n6rJpA8nVdq3pslVa1NzfzFT8f3E6
	2FdMs2JY9Ttb4FXtOhh1uzqCjxP3U+ktaQDRUNsECpejSU0AIKMxzWGy1hrj6F1R7PHDZsfc5c4
	Pqkuiv1gpycy9rPa37xEfNUCOQ7oexKD/eWJwwl3mmo6ikPyVqIwwqIs4TwcQzjGPKAJplAsFmS
	7UFovgzP1ek8NIBapjhvEXOWVT/4KCzku7GmP50e/GkMb68k9KbUc2dyPLwHBhBXCg==
X-Received: by 2002:ac2:554b:0:b0:5a3:fd71:2778 with SMTP id
 2adb3069b0e04-5a3fd712815mr446058e87.37.1776060915435; Sun, 12 Apr 2026
 23:15:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260413024804.1678-1-wangmy@fujitsu.com> <CA+chaQcEYDO5-jNRVZajTm2mvbnkbParUAXndNGFn-PE72-+OQ@mail.gmail.com>
 <CAMKF1soGuWJji_72+O=7gF7Bg2n+2O4+cXnRB+r6-i6wDxguhw@mail.gmail.com>
In-Reply-To: <CAMKF1soGuWJji_72+O=7gF7Bg2n+2O4+cXnRB+r6-i6wDxguhw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 13 Apr 2026 08:15:03 +0200
X-Gm-Features: AQROBzA0-rF5QD2iRx2_Jj6f9C7uxUVUGQt0VIbmCpgdux8TpyaxSKsWFV6QrUE
Message-ID: <CA+chaQeczqty-QeThizmr8+uLvoQkfaJOpsPZ1CnSWyZwtpz7w@mail.gmail.com>
Subject: Re: [oe] [meta-networking] [PATCH] dovecot: rename downloaded file name
To: Khem Raj <raj.khem@gmail.com>
Cc: wangmy@fujitsu.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 06:15:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126271

On Mon, Apr 13, 2026 at 7:56=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
>
>
> On Sun, Apr 12, 2026 at 10:44=E2=80=AFPM Martin Jansa via lists.openembed=
ded.org <martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> On Mon, Apr 13, 2026 at 4:48=E2=80=AFAM wangmy via lists.openembedded.or=
g
>> <wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>> >
>> > From: Wang Mingyu <wangmy@fujitsu.com>
>> >
>> > Add downloadfilename to SRC_URI to ensure the downloaded file has
>> > a consistent local name, avoiding potential future filename conflicts.
>> >
>> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>> > ---
>> >  meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb =
b/meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb
>> > index a6b78ea781..9b3666863c 100644
>> > --- a/meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb
>> > +++ b/meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb
>> > @@ -9,7 +9,7 @@ SECTION =3D "mail"
>> >  LICENSE =3D "LGPL-2.1-only & MIT & Unicode-3.0 & BSD-3-Clause & PD"
>> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcb805cc6bdb95ba8fc2398a55f=
d50877"
>> >
>> > -SRC_URI =3D "https://dovecot.org/releases/2.4/dovecot-${PV}.tar.gz \
>> > +SRC_URI =3D "https://dovecot.org/releases/2.4/dovecot-${PV}.tar.gz;do=
wnloadfilename=3D${BP}.tar.gz \
>>
>> dovecot-${PV}.tar.gz is ${BP}.tar.gz, isn't it?
>>
>> To avoid the issue with modified tarball I was assuming something like:
>>
>> # 2.4.3 tarball was recreated, see
>> # https://dovecot.org/mailman3/archives/list/dovecot-news@dovecot.org/th=
read/V37BEIZTNQODMWIHMTQK5DSOM5RDJ7NF/
>> SRC_URI =3D "https://dovecot.org/releases/2.4/${BP}.tar.gz;downloadfilen=
ame=3D${BP}-recreated.tar.gz
>> \
>
>
> I think the problem is that we might have to  purge the old tarball since=
 upstream has regenerated it with same name+version

That's why I've asked Wagmy to add downloadfilename so that it uses
different filename then the original tarball with not matching
checksum. Then we don't need to manually purge anything, even allows
to re-build the older metadata still using the old checksum, right?

Cheers,

>>
>>
>>
>> >             file://0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK=
-state.patch \
>> >             file://dovecot.service \
>> >             file://dovecot.socket \
>> > --
>> > 2.43.0
>> >
>> >
>> >
>> >
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#126269): https://lists.openembedded.org/g/openembedd=
ed-devel/message/126269
>> Mute This Topic: https://lists.openembedded.org/mt/118798933/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

