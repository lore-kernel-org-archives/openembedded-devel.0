Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78609C47074
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 01:09:43 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web10.19704.1704157777497094602
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jan 2024 17:09:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NgQIDSaQ;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2048e63dbd9so2765645fac.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jan 2024 17:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704157777; x=1704762577; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOycyI/lI1TOEkRJ5Kz2DtDkH/ni5QIkTKXfvG/4Ov0=;
        b=NgQIDSaQR67WPU7WGzFtROdJNmBzaiE/NmPB+l28g4utzvmve1Xvp959fB9Y5nY4Ql
         VyCHbdpR63r7m7cudMg9BundKreygkEwVUBoXclCkIADiiCfJKqQoJRixlBueGiLbcKT
         igW3UwEZ/9ZKsTLE1v2FasfTcKfhsWs5bKm7F4/VjKJT+h7NQwK+K+2wTlWpRWNbYpEr
         fc8BNYOPHD3ecb29Dl9NRZAhtKhVMrpEExIJWVuCSJ9UuNuWDAp8xdNUIJO3EdwUpRY1
         H6hYEnlAWbSEpMHhgqyDc9HxkRzBDhRNoV3lrEnaI9Cr3Sck+8bxAL+8ZrgNSEtawzPe
         Gffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704157777; x=1704762577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOycyI/lI1TOEkRJ5Kz2DtDkH/ni5QIkTKXfvG/4Ov0=;
        b=N9AXwmCxchHor7j+FrJLq7Pg2UJ5Agy2KlE1K+Pr6hPoBx6dmHwSQDcRxDOGIUv36I
         /JngwjA/7tD3qccKh2DNcJyLgr1q40LcX/yr9E/3lYjlCsVF6TfBePrnDWMGUaBK0s47
         pWq2GOy5LU7IaDdSu8cEC+p6n+m324LZhqOhikuRJisnBp+LMN+2kIl+ZU4pDSBTPgPL
         SFLX/Ob5kEADxmnRAf8mw39YLLlfOgVpc5Wij/Jf3zsyXo0jZYxSoLy9B7voTEBTEitv
         +Xlhv/Xna5XkryGuuvp7VIuNJBH0T7b1A7ZA0xJ8UTGk2vUDS6EXB+GSOUUTWpN3oj3X
         5BCA==
X-Gm-Message-State: AOJu0YxvNX1+1CVRVZvVLu3735uxswxJMuzLXEPjTOW8zdLW54Dg5PJl
	DY8Ofp7E6D210famBJsEsa5e4nCqVoe2K7BF5BE=
X-Google-Smtp-Source: AGHT+IH8cRZvpxmiqr5xM1bJbU6dvoIBOipRac+RRhQ+E6Nu5NFTrYPT9X4S9cze45o/Rh4+IwFM0Ik2S69BpWCZlQk=
X-Received: by 2002:a05:6871:8916:b0:204:37f1:8d9d with SMTP id
 ti22-20020a056871891600b0020437f18d9dmr13853314oab.91.1704157776524; Mon, 01
 Jan 2024 17:09:36 -0800 (PST)
MIME-Version: 1.0
References: <20231230171056.1297800-1-leon.anavi@konsulko.com>
 <CAMKF1spd5J8EKq3ey9duGEMNTbRADQ0CeNe3Ws50SnUBUsA7qQ@mail.gmail.com> <CALtQ3O2vwuXewMzFgh7++Ok6X4Jm2iPRMYom-Dg4N9K+Ptjj6g@mail.gmail.com>
In-Reply-To: <CALtQ3O2vwuXewMzFgh7++Ok6X4Jm2iPRMYom-Dg4N9K+Ptjj6g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Jan 2024 17:09:10 -0800
Message-ID: <CAMKF1spbgoShO2oQ7wrgNWWNR-7G0c1RrgqRavPAEdSmLdTy1g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] ssd1306_git.bb: Add ssd1306_linux
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 01:09:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107988

On Sun, Dec 31, 2023 at 11:53=E2=80=AFPM Leon Anavi <leon.anavi@konsulko.co=
m> wrote:
>
> Hi Khem,
>
> Happy New Year! Best wishes for 2024.

ty. same to you as well.

>
> On Sat, Dec 30, 2023, 19:39 Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On Sat, Dec 30, 2023 at 9:11=E2=80=AFAM Leon Anavi <leon.anavi@konsulko.=
com> wrote:
>>>
>>> Add ssd1306_linux, a simple OLED I2C SSD1306 Linux driver based on
>>> the i2c library libi2c from i2c-tools. Example usage for a
>>> compatible display with resolution 128x64 pixels:
>>>
>>> ssd1306_bin -n 1 -I 128x64
>>> ssd1306_bin -n 1 -c
>>> ssd1306_bin -n 1 -r 0
>>> ssd1306_bin -n 1 -x 1 -y 1
>>> ssd1306_bin -n 1 -l "Hello World"
>>>
>>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>>> ---
>>>  .../ssd1306/0001-Use-include-filename.patch   | 49 +++++++++++++++++++
>>>  .../recipes-devtools/ssd1306/ssd1306_git.bb   | 25 ++++++++++
>>>  2 files changed, 74 insertions(+)
>>>  create mode 100644 meta-oe/recipes-devtools/ssd1306/ssd1306/0001-Use-i=
nclude-filename.patch
>>>  create mode 100644 meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
>>>
>>> diff --git a/meta-oe/recipes-devtools/ssd1306/ssd1306/0001-Use-include-=
filename.patch b/meta-oe/recipes-devtools/ssd1306/ssd1306/0001-Use-include-=
filename.patch
>>> new file mode 100644
>>> index 000000000..9ec682c7b
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-devtools/ssd1306/ssd1306/0001-Use-include-filenam=
e.patch
>>> @@ -0,0 +1,49 @@
>>> +From cb32ebbb1efb3202808809861ec3cbd811c55bd2 Mon Sep 17 00:00:00 2001
>>> +From: Leon Anavi <leon.anavi@konsulko.com>
>>> +Date: Sat, 30 Dec 2023 13:23:31 +0000
>>> +Subject: [PATCH] Use include "filename"
>>> +
>>> +Use include "filename" to include programmer-defined header files
>>> +from the same directory as the file containing the directive.
>>> +
>>> +Upstream-Status: Pending
>>
>>
>> I think it=E2=80=99s a good patch to submit upstream perhaps do that as =
well while you are at it
>
>
> Yes, I have already opened a GitHub pull request to upstream this fix:
> https://github.com/armlabs/ssd1306_linux/pull/4
>
> Should I make any changes to the ssd1306 recipe to be accepted to meta-oe=
?

Yes, update the patch status to reflect this info and send a v2.

>
> Best regards, Leon
>
>>>
>>> +
>>> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>>> +---
>>> + main.c    | 2 +-
>>> + ssd1306.c | 6 +++---
>>> + 2 files changed, 4 insertions(+), 4 deletions(-)
>>> +
>>> +diff --git a/main.c b/main.c
>>> +index c1ffc2f..18e2b84 100644
>>> +--- a/main.c
>>> ++++ b/main.c
>>> +@@ -6,7 +6,7 @@
>>> + #include <string.h>
>>> + #include <fcntl.h>
>>> + #include <sys/ioctl.h>
>>> +-#include <ssd1306.h>
>>> ++#include "ssd1306.h"
>>> +
>>> + void print_help()
>>> + {
>>> +diff --git a/ssd1306.c b/ssd1306.c
>>> +index a03674a..2e6ba97 100644
>>> +--- a/ssd1306.c
>>> ++++ b/ssd1306.c
>>> +@@ -8,9 +8,9 @@
>>> + #include <string.h>
>>> + #include <fcntl.h>
>>> + #include <sys/ioctl.h>
>>> +-#include <linux_i2c.h>
>>> +-#include <ssd1306.h>
>>> +-#include <font.h>
>>> ++#include "linux_i2c.h"
>>> ++#include "ssd1306.h"
>>> ++#include "font.h"
>>> +
>>> + const char init_oled_type_file[] =3D "/tmp/.ssd1306_oled_type";
>>> +
>>> +--
>>> +2.39.2
>>> +
>>> diff --git a/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb b/meta-oe/=
recipes-devtools/ssd1306/ssd1306_git.bb
>>> new file mode 100644
>>> index 000000000..5adfd3ed6
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
>>> @@ -0,0 +1,25 @@
>>> +SUMMARY=3D"SSD1306 OLED I2C drive"
>>> +DESCRIPTION =3D "SSD1306 OLED I2C driver working in Linux"
>>> +HOMEPAGE =3D "https://github.com/armlabs/ssd1306_linux"
>>> +SECTION =3D "console/utils"
>>> +LICENSE =3D "MIT"
>>> +
>>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7b694e603a996c3bfdc6093ed1f=
70c8f"
>>> +
>>> +SRC_URI =3D " \
>>> +    git://github.com/armlabs/ssd1306_linux.git;protocol=3Dhttps;branch=
=3Dmaster \
>>> +    file://0001-Use-include-filename.patch \
>>> +"
>>> +SRCREV =3D "7375f1088732d243f7167c9a17725f1a860da587"
>>> +
>>> +S =3D "${WORKDIR}/git"
>>> +
>>> +# coreutils provides fmt which is used in the Makefile
>>> +DEPENDS =3D "i2c-tools coreutils-native"
>>> +
>>> +EXTRA_OEMAKE =3D "CC=3D'${CC}' CFLAGS=3D'${CFLAGS}' LDFLAGS=3D'${LDFLA=
GS}'"
>>> +
>>> +do_install() {
>>> +    install -d ${D}${bindir}
>>> +    install -m 0755 ${B}/ssd1306_bin ${D}${bindir}
>>> +}
>>> --
>>> 2.39.2
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#107908): https://lists.openembedded.org/g/openembed=
ded-devel/message/107908
>>> Mute This Topic: https://lists.openembedded.org/mt/103434392/1997914
>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>

