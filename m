Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC9DEB64D8
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 16:04:43 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.2626.1687363480919075048
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jun 2023 09:04:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=nTkj/MeY;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-55e299e1d02so3479902eaf.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jun 2023 09:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687363480; x=1689955480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpGF9Eq74Xo/CGzkmVwenNhX6FHuKjpftvcdQt1+Ja8=;
        b=nTkj/MeY81d+kpISnlW1tX8IGvweNzGFya4t8wqpm75HWhfNiYlUl/6KvfaGp+kqd/
         qKMkZScglV5sLiBJvFMlqqZ61vqA3fnZ4/bEEi+rFwzNlAphPAkdooLk1fFbHh+LDUI0
         hVKSY5b/+XT4GC5AaFUM6AIrTu5TXsDQkDJ4vlLZ/v9N6P837EuEbOYKucEfhNHjxgo8
         Hgy2HJnn8baQmQeDDeQJbH7z2b4P30vToJv8QWXCCMWjx6VIZHw6xoy3yBEqSeZiahhc
         CYoGUBKzC4K/uIeQ78yf8391Vsc7EM7ocTI/OjVssR/ULujZvY6FcgiW8qe+uBEp1Ffd
         D9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687363480; x=1689955480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qpGF9Eq74Xo/CGzkmVwenNhX6FHuKjpftvcdQt1+Ja8=;
        b=ZTWXNbLXWa/Q9hO5iqs77zkDFhO1y7JvvR2W6kkrOCjNe+gUJ4ARU3+XmsyuxiznCh
         SLb4M4CwwT5viC+ZeC9hUSGFcXVPNmJ7aqskgYyRT5RwZyXgOgC0YAa09LCRYVjPqxkI
         PKnSGHli1VN2UBbZhk5s61uxlQl9DO6TquvVlNPsSi7PtIGyhvZlRgVdasTEZ54nC9NZ
         25YZ2bnNmV1Ze+3NKbeWp6156G6WcZG9Adgk4hBmzSMkLvPivWM7IGiiG0towHG9kBNi
         hY31Hzwi8HwYM54AkTkCwOqTYg8FD9drEYWG+6WRUANPKuzRX2oaqCboquTjyEGHepA9
         lG4w==
X-Gm-Message-State: AC+VfDx4pZaZHso4M52dtC7R0y8d3GdyzozNmYsPU9PQRza5AGV3m55J
	6X1N7BfqebhKcM2LolAoN+5TtyWohlLkGRYnZ3E=
X-Google-Smtp-Source: ACHHUZ7iAH6V4iNx0nv2PzRB2a2L5f46b30IvCFRG9eWsRKfRBQhuIiF/ugWc4QMoktn4LYPm7Z/gBiwwzbj/DPM8Ro=
X-Received: by 2002:a05:6820:614:b0:55e:5c65:c6cd with SMTP id
 e20-20020a056820061400b0055e5c65c6cdmr8295420oow.6.1687363480030; Wed, 21 Jun
 2023 09:04:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230621143552.4140867-1-raj.khem@gmail.com> <CA+chaQenARDweHmhx8EZztpDfhBfJPPNMDXtFaEhDh-Jo2Akbg@mail.gmail.com>
In-Reply-To: <CA+chaQenARDweHmhx8EZztpDfhBfJPPNMDXtFaEhDh-Jo2Akbg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 Jun 2023 09:04:13 -0700
Message-ID: <CAMKF1srO_BbuW82vvK=u-DQx3NgUyC67ndfZmjcjxvUWHSVnUA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] postfix: Fix Upstream-Status keyword
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jun 2023 16:04:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103477

yeah send a v2

On Wed, Jun 21, 2023 at 8:52=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> On Wed, Jun 21, 2023 at 4:35=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../recipes-daemons/postfix/files/0001-Fix-makedefs.patch      | 2 +-
>>  ...-Change-fixed-postconf-to-a-variable-for-cross-compil.patch | 3 +--
>>  2 files changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-networking/recipes-daemons/postfix/files/0001-Fix-make=
defs.patch b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedef=
s.patch
>> index aa93083802..bacfdb5e67 100644
>> --- a/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.pa=
tch
>> +++ b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.pa=
tch
>> @@ -11,7 +11,7 @@ for Linux2 and Linux3 systems.
>>    native build, search host library path for nsl and resolv library
>>    which comes from libc
>>
>> -Upstreamstatus: Inappropriate [embedded specific]
>> +Upstream-Status: Inappropriate [embedded specific]
>>
>>  Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
>>  ---
>
>
> Thanks Khem!
>
> Sorry I should have spotted these when sending my Pending additions (the =
regex in scripts/contrib/patchreview.py isn't wide enough to catch "Upstrea=
mstatus" as well.
>
> In this 0001-Fix-makedefs.patch there is also "Upstream-Status: Pending" =
added by my change, if you can drop it here (or let me know if you want v2 =
of my change with these 2 fixed).
>
> Cheers,
>
>> diff --git a/meta-networking/recipes-daemons/postfix/files/0002-Change-f=
ixed-postconf-to-a-variable-for-cross-compil.patch b/meta-networking/recipe=
s-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-=
compil.patch
>> index 6eee817716..8420b496a3 100644
>> --- a/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-po=
stconf-to-a-variable-for-cross-compil.patch
>> +++ b/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-po=
stconf-to-a-variable-for-cross-compil.patch
>> @@ -3,11 +3,10 @@ From: Li xin <lixin.fnst@cn.fujitsu.com>
>>  Date: Fri, 19 Jun 2015 17:14:58 +0900
>>  Subject: [PATCH] Change fixed postconf to a variable for cross-compilin=
g
>>
>> -Upstreamstatus: Inappropriate [embedded specific]
>> +Upstream-Status: Inappropriate [embedded specific]
>>
>>  Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
>>  ---
>> -Upstream-Status: Pending
>>
>>   Makefile.in     |  2 +-
>>   postfix-install | 18 ++++++++++--------
>> --
>> 2.41.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#103474): https://lists.openembedded.org/g/openembedd=
ed-devel/message/103474
>> Mute This Topic: https://lists.openembedded.org/mt/99677348/3617156
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
Martin.Jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

