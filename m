Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B276CC2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 07:08:24 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web10.5217.1747811297880298611
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 00:08:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CqRKes7j;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6065251725bso4437581eaf.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 00:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747811297; x=1748416097; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gW8cSe0efA155pweRliZd6rf3bzGFLA19wVt5tExhHk=;
        b=CqRKes7jcYknVl8imdUmD2v1Q83AQHb+2ZONeQ3MZHItT4G7nEf1IE7QsgU6hBbRo3
         jcPu+jcncmCo+G1b1003CYLFg3xwRXkY2+eRc4u8qumPm3TYMoZfurUVO9tyZYbb0/lz
         qnTl5FRCOGsB8QZ8Rbg6RQfMKHXgTtCeIK8YKg8mO+Elb7mhUSHv9+qhrm8w26FHLGwV
         EDE5bY8KOv7k1KXHHZ80EsxFvp03nbBL8TehLG3sdSfbZL9/wR+d7NAxkdbIQpTTmSfR
         P1qgMhV2Mmd7Uuf7XhcXcfUI34BuoLdKSjEDRrg+zcw0ouQsRIwYd8IyMouwgOiq/7Hm
         YacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747811297; x=1748416097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gW8cSe0efA155pweRliZd6rf3bzGFLA19wVt5tExhHk=;
        b=nlWJda0Sr5s7A+GKlQbkri90v7+FcOlgdNxZaxeScLfps5dRPI/wov4LAAKsMC8hev
         leMBBZR5dSGOi6uxrZK+aE455t+L0rn45hSvZknFrUbWUPgCfeKzrLlnZI+VAQM/q96N
         4xDywYB62R4EH6eUPoxN07OzlbpmaPoB1iJ8ePeZDW3SR12UCfGxQu4w/LFYHeFueAKw
         3hJr2OZ/9IxyxyKFSEYz0HXHaE9+RamnaWcA6iOoj/tdtvq+PxyocbgiIxsZGkndn6xi
         ZdpDt3a0nt/+TNhK4iEv06KwLIu3ntSTESQUqsfkq0vMCqcunlUfUn4kKtQsINV/svEj
         JZKg==
X-Gm-Message-State: AOJu0YwtcS0Gk0GF/sf1KH7lJ2UeU4W5RFYjrehBcyRpN9c3JRc+XmsW
	f9tY4y1uMlxwBtJep4fBQZt0rzXl3XtV/duoFh4bzXVfXL1bCtSvO5e4Pk97/jVTutxlititNs/
	nVch2gjywjxiA47P34FEr//9fheuYid8=
X-Gm-Gg: ASbGncuBAGE9h/uFWnf/5khqc4coPHsN9J2a7+ZLRKFe976vQ6mUsHOTjY2rp3hRb6E
	j5PB+COimU/k8XvAKncWEanaUC3cxS2wq286Il3VgHu+vBspE/OgVOjDvj89VWD2EFpf9+o6x1U
	BYbxTh8nZJQPTwYdxZjqKOhGVPbJhWzJQ=
X-Google-Smtp-Source: AGHT+IGDig9qXvnnn0Y6cpEEGme4PxK6wJYObNikgsrqxiQEUP1AktryzB5xxcKdSybFmiQnXQkeJK3cR1d3jk71spo=
X-Received: by 2002:a05:6871:210b:b0:2d5:230f:b352 with SMTP id
 586e51a60fabf-2e3c1ec0e14mr11825131fac.27.1747811296995; Wed, 21 May 2025
 00:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250507125553.1421417-1-vanusuri@mvista.com> <CANQUz18fGcRtcSHYQo1p0JtaD_4me8Ryqr_8rOLRQHHFxGnd4A@mail.gmail.com>
In-Reply-To: <CANQUz18fGcRtcSHYQo1p0JtaD_4me8Ryqr_8rOLRQHHFxGnd4A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 May 2025 00:07:51 -0700
X-Gm-Features: AX0GCFve0WAnTj1amyAkIj9ZFBszD3pV32o_b7AS7wkvcM5DByrk0dlLjSu-siM
Message-ID: <CAMKF1sqKfyAOMHG_25QQip2b_zWvwYOwtyp=516Rdi7aeQyiPw@mail.gmail.com>
Subject: Re: [oe][meta-networking][scarthgap][PATCH] proftpd: Fix CVE-2024-57392
To: Vijay Anusuri <vanusuri@mvista.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Armin Kuster <akuster808@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 07:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117525

On Tue, May 20, 2025 at 11:39=E2=80=AFPM Vijay Anusuri <vanusuri@mvista.com=
> wrote:
>
> Hi Team,
>
> Any update on this ?
>

Always check armin's stable/<branch>-nut  e.g.-
https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/scar=
thgap-nut
I dont see this patch there yet for scarthgap-nut, so perhaps Armin
will add it soon.

> Thanks & Regards,
> Vijay
>
> On Wed, May 7, 2025 at 6:26=E2=80=AFPM <vanusuri@mvista.com> wrote:
>>
>> From: Vijay Anusuri <vanusuri@mvista.com>
>>
>> Upstream-Status: Backport from https://github.com/proftpd/proftpd/commit=
/981a37916fdb7b73435c6d5cdb01428b2269427d
>>
>> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> ---
>>  .../proftpd/files/CVE-2024-57392.patch        | 42 +++++++++++++++++++
>>  .../recipes-daemons/proftpd/proftpd_1.3.7c.bb |  1 +
>>  2 files changed, 43 insertions(+)
>>  create mode 100644 meta-networking/recipes-daemons/proftpd/files/CVE-20=
24-57392.patch
>>
>> diff --git a/meta-networking/recipes-daemons/proftpd/files/CVE-2024-5739=
2.patch b/meta-networking/recipes-daemons/proftpd/files/CVE-2024-57392.patc=
h
>> new file mode 100644
>> index 0000000000..0b50175a55
>> --- /dev/null
>> +++ b/meta-networking/recipes-daemons/proftpd/files/CVE-2024-57392.patch
>> @@ -0,0 +1,42 @@
>> +From 981a37916fdb7b73435c6d5cdb01428b2269427d Mon Sep 17 00:00:00 2001
>> +From: TJ Saunders <tj@castaglia.org>
>> +Date: Sun, 9 Feb 2025 12:14:25 -0800
>> +Subject: [PATCH] Issue #1866: Some of the fuzzing tests submitted in th=
e
>> + advisory ran into existing null pointer dereferences (not buffer overf=
lows);
>> + let's correct them. (#1867)
>> +
>> +Upstream-Status: Backport [https://github.com/proftpd/proftpd/commit/98=
1a37916fdb7b73435c6d5cdb01428b2269427d]
>> +CVE: CVE-2024-57392
>> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> +---
>> + modules/mod_ls.c | 7 +++++--
>> + 1 file changed, 5 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/modules/mod_ls.c b/modules/mod_ls.c
>> +index 45a3187bd..f7abfe540 100644
>> +--- a/modules/mod_ls.c
>> ++++ b/modules/mod_ls.c
>> +@@ -349,7 +349,8 @@ static int sendline(int flags, char *fmt, ...) {
>> +           errno !=3D 0) {
>> +         int xerrno =3D errno;
>> +
>> +-        if (session.d !=3D NULL) {
>> ++        if (session.d !=3D NULL &&
>> ++          session.d->outstrm !=3D NULL) {
>> +           xerrno =3D PR_NETIO_ERRNO(session.d->outstrm);
>> +         }
>> +
>> +@@ -1039,7 +1040,9 @@ static int outputfiles(cmd_rec *cmd) {
>> +     return res;
>> +   }
>> +
>> +-  tail->down =3D NULL;
>> ++  if (tail !=3D NULL) {
>> ++    tail->down =3D NULL;
>> ++  }
>> +   tail =3D NULL;
>> +   colwidth =3D (colwidth | 7) + 1;
>> +   if (opt_l || !opt_C) {
>> +--
>> +2.25.1
>> +
>> diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb b=
/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
>> index ecd2777247..b45cb6aaec 100644
>> --- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
>> +++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
>> @@ -15,6 +15,7 @@ SRC_URI =3D "git://github.com/proftpd/proftpd.git;bran=
ch=3D${BRANCH};protocol=3Dhttps
>>             file://contrib.patch  \
>>             file://build_fixup.patch \
>>             file://proftpd.service \
>> +           file://CVE-2024-57392.patch \
>>             "
>>
>>  S =3D "${WORKDIR}/git"
>> --
>> 2.25.1
>>

