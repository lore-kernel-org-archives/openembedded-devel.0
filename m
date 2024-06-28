Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F31C3064D
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 15:48:06 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.20138.1719589684973154539
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jun 2024 08:48:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KImo0ulF;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-25d57957b37so448703fac.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 08:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719589684; x=1720194484; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+hmmpibgyEfd910yc7Pbu1Wt4HqEMPOSo+9G3UVnf+I=;
        b=KImo0ulFdR0tT2NwokAB5ylTjFn8MgZZUtwHipbW5kFkI8mxfKx2i5gZZPrTlY7d7x
         PAjwOtSHk4leVzSEuRE4TSCD6kLQ+aop506lTSexgNwKkelUfY7GczOmWN7ooT4xJju0
         OhcLghRLP6PLBKeB+IMY/KeW9MFjS9TOPF7CkWU3l5gFcUkbT/H+pP3wMm+NGMnNZ07u
         RVoBOVslRwDtjwRxEp5mpjpkdvlSf3PewECay74FUvPwQUfxq/mR9hScv4x1fO5YOk3R
         n+vqDNjdPx3FITP1dp5E3G3D+FWXQNrqVqsMXK4V66B6exEy3gjThJoz+ou0WmOMrvgM
         aOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719589684; x=1720194484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+hmmpibgyEfd910yc7Pbu1Wt4HqEMPOSo+9G3UVnf+I=;
        b=tXHh+DcO6nsUJ9/FgEWTzRMXnnvrmeWnAjX8GGhZHRn5Z9R5Hv88RGa8KnCWsLu34Z
         sdJi4yskzMyYdJ0nw4hLooso8bb4ehiN4eyy7XdyIhp18sk0WAjU1yserA2oZm2q7J8h
         dFCLcbIuFPe5zMKFut/oZsJxj9f/C83mRufdIbsp6bqy0jrVGU0cXpKb1t1MuETYZi0T
         lhx5MRmjxked1bbMtDm5WtsHmwNzCqQyWx+55zCLj/ARlLJZzsPRhdTmK+yaaBM9sLdY
         PwUvNskcdJwtvjliRPe/jqMlupG1J4YvIetllUXmEJGePAZFhY17MlxltC+5qt2M5G2B
         vG4Q==
X-Forwarded-Encrypted: i=1; AJvYcCX5e7t3wZKnjgzm32kVlqeQZXH7zXG9qVGKij85geaBrEgndgccIUiohfx64a7CQ/DIbBKT6sMZSlPMRz7pW+F6Pe13wypYn8vf4du9T+Wa6Ip2W/Syk0Jb1Q==
X-Gm-Message-State: AOJu0YzNhW++mVOxtidnsuOHYG6fUNMT3uaeO9kEZESw7H//flqopMwW
	hPKMR/FdcASi9frAOiRcliBPQP1nVmGs5X5vrd5+DT4ME5vIrMe7mhr3RwxAt3U+NgyneTt+51y
	/CaAKnBpJa4meA1SSHRnJ2KkVIPE=
X-Google-Smtp-Source: AGHT+IEBv6iSseJ1Azaaer7I063mQMmPoBCaK9YLXXpO7J/9rsNV1jX6dfYWfnJnpLD2pj+3mgXMUqIGobGzzuScJLE=
X-Received: by 2002:a05:6870:96a1:b0:259:5907:d714 with SMTP id
 586e51a60fabf-25d06e59001mr17613633fac.42.1719589684128; Fri, 28 Jun 2024
 08:48:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240627224112.198171-1-gudni.m.g@gmail.com> <CAJo0Az7dMaz-F9kKMb4Wdu6nhtAKS_-JXpex9AaNRG1TfsEnRA@mail.gmail.com>
In-Reply-To: <CAJo0Az7dMaz-F9kKMb4Wdu6nhtAKS_-JXpex9AaNRG1TfsEnRA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Jun 2024 08:47:37 -0700
Message-ID: <CAMKF1sqpPQAdq7FOratvtZoAGJwL0bo0L=nDHAh4YjSWw6Jg=Q@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-bleak: upgrade 0.21.1 -> 0.22.2
To: t.f.g.geelen@gmail.com
Cc: gudni.m.g@gmail.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 15:48:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111152

On Fri, Jun 28, 2024 at 6:45=E2=80=AFAM Tom Geelen via lists.openembedded.o=
rg
<t.f.g.geelen=3Dgmail.com@lists.openembedded.org> wrote:
>
> This breaks ptest unfortunately as the direct pypi fetch does not include=
 the tests. Only the direct github link as it was previously.
>

Thanks a lot for testing out using ptests. We have made ptests easy to
run with poky default config ( it needs ptest enabled in
DISTRO_FEATURES )
so doing a quick recipe based ptest image on qemux86-64 on local build
machine could be good to do for recipes which have the ptest support
enabled.

> On Fri, Jun 28, 2024 at 12:41=E2=80=AFAM Gu=C3=B0ni M=C3=A1r Gilbert via =
lists.openembedded.org <gudni.m.g=3Dgmail.com@lists.openembedded.org> wrote=
:
>>
>> Changes to the build:
>> - Drop python3-async-timeout which is only required for Python 3.10 and =
older.
>>
>> Changelogs:
>> * https://github.com/hbldh/bleak/releases/tag/v0.22.2
>> * https://github.com/hbldh/bleak/releases/tag/v0.22.1
>> * https://github.com/hbldh/bleak/releases/tag/v0.22.0
>>
>> Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudni.m.g@gmail.com>
>> ---
>>  .../{python3-bleak_0.21.1.bb =3D> python3-bleak_0.22.2.bb}  | 8 ++-----=
-
>>  1 file changed, 2 insertions(+), 6 deletions(-)
>>  rename meta-python/recipes-devtools/python/{python3-bleak_0.21.1.bb =3D=
> python3-bleak_0.22.2.bb} (74%)
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb=
 b/meta-python/recipes-devtools/python/python3-bleak_0.22.2.bb
>> similarity index 74%
>> rename from meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb
>> rename to meta-python/recipes-devtools/python/python3-bleak_0.22.2.bb
>> index 96f3fcbcf..36a823a9b 100644
>> --- a/meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb
>> +++ b/meta-python/recipes-devtools/python/python3-bleak_0.22.2.bb
>> @@ -3,13 +3,10 @@ HOMEPAGE =3D "https://github.com/hbldh/bleak"
>>  LICENSE =3D "MIT"
>>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbcbc2069a86cba1b5e47253679f6=
6ed7"
>>
>> -SRCREV =3D "054b092e19c7a45d5ea07d8948022f54117fe5e8"
>> -PYPI_SRC_URI =3D "git://github.com/hbldh/bleak.git;protocol=3Dhttps;bra=
nch=3Ddevelop"
>> +SRC_URI[sha256sum] =3D "09010c0f4bd843e7dcaa1652e1bfb2450ce690da08d4c61=
63f0723aaa986e9fe"
>>
>>  inherit pypi python_poetry_core ptest
>>
>> -S =3D "${WORKDIR}/git"
>> -
>>  SRC_URI +=3D " \
>>         file://run-ptest \
>>  "
>> @@ -26,8 +23,7 @@ do_install_ptest() {
>>  }
>>
>>  RDEPENDS:${PN} +=3D " \
>> -       python3-core (>3.7) \
>> -       python3-async-timeout \
>> +       python3-core (>3.8) \
>>         python3-dbus-fast \
>>         python3-xml \
>>  "
>> --
>> 2.34.1
>>
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111150): https://lists.openembedded.org/g/openembedde=
d-devel/message/111150
> Mute This Topic: https://lists.openembedded.org/mt/106918869/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

