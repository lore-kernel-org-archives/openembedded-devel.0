Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43FDFC27C53
	for <webhook@archiver.kernel.org>; Sat, 22 Jun 2024 04:40:05 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web10.91598.1719031196834059394
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jun 2024 21:39:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZVbY+3dF;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-254aec5a084so1435140fac.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Jun 2024 21:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719031196; x=1719635996; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OKY3xYukqxcCq9zl6cj8wklJny4mtTLBLEzSP1nwLUI=;
        b=ZVbY+3dF+XNKkrEr5pzZjmIbqIkeMHdlhrc+wIvB0xqcB/vRY4Lt4Jl/oECZiayut/
         VeFt2V/Yfj9XRvEuOIvzivbFppDpQXnLVHYWSIFy6aL6WBzTCylgJm87SZpcOgvjARvo
         r6slZt3MBwpZh+HS9xMS2aY3VxRH+RapOnq2fZRCdBKPQaSDtjtx6KeKZpGSCBeP9x9z
         X9BQO8jENYs/sa+FuVyceB3+c0ipU+XxmSvJtDOeLWOrCYne5E1XpYqpoHnYpA7UkHZb
         WVYYoCIZnUskrwhy2UTNelb2c3cgmVVT+gN93L6IWSmn3oh8/ZGYSR9sA6ny7xPGd0gu
         Bf7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719031196; x=1719635996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OKY3xYukqxcCq9zl6cj8wklJny4mtTLBLEzSP1nwLUI=;
        b=kHHEz2T+J2qP4BbXZ+0ogg01S2JSgiPL3N1+NKEJ0r2F7kIxrsTk/G6SfMo6qFwwTG
         mV5jYGsR9iW53Nhdygd9zpEFHpWN/dDxGg573H5EBQYhJ2cjdIm1/HPDB8kj6jNJaufg
         fTd8KnhyZDN70Ww7oMGPpOBe+hahtcMuART3VxxqY+XaJgzToYX7rgZ7UrVLVmvAv39+
         R6NlcrKCBwgP5TUxNKh3Pt3pv2TWuN+zBpS6nXFqQOmIXLz10eFNt80OXRdUUGFEVbNk
         yjEXI5jO6eh8sNLJwG2r70qmNpC+eMzZ8y1gSfuUlkkUb3Uj8OVsGvLN4opBOJhOSnUU
         NewA==
X-Forwarded-Encrypted: i=1; AJvYcCVM401vJkXBEnuHy0hQnEEGfx87cynWenYWU9AAHCMzBfO6d8qdq9RLHQNI4gt64VRN/sF8EImEuOcgrErn3EXCUfV+b15/x/G9q4fNkwcmYHjbvlmp0uP5KQ==
X-Gm-Message-State: AOJu0YwMoUU1r1pnpGYI4z1vkpQ6o1RNJ4RjpDUC6PZRi0tnoYEz0/tJ
	qIt/AMIIdsPg5uF58iltnD+w2qbman+6emrsJWhR1gC4NPlVbXQFFgapMaeKfX9m8ErYRa+zAEL
	wYnGDqUHtlN9wpsg1gGBdvvuYWYs=
X-Google-Smtp-Source: AGHT+IHRkV6U5cmxrVw0CdlVcZt5py01GoiHD0FXp6Pk8r/N6PPb1EgNqKVoUDOowZ49Ufh3LEaKpGtrxeQJfnEFjIg=
X-Received: by 2002:a05:6870:611e:b0:24c:ac7e:8a56 with SMTP id
 586e51a60fabf-25c94d72256mr10349825fac.57.1719031195926; Fri, 21 Jun 2024
 21:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240619122019.529213-1-leon.anavi@konsulko.com>
 <20240619122019.529213-2-leon.anavi@konsulko.com> <CANx9H-CtguyHBiOX8TF-gk81FGx6-Ja_SbAC0kfhKOQR2Curcw@mail.gmail.com>
In-Reply-To: <CANx9H-CtguyHBiOX8TF-gk81FGx6-Ja_SbAC0kfhKOQR2Curcw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Jun 2024 21:39:29 -0700
Message-ID: <CAMKF1so0KzW17+ek=PhGgOoUpFVK1O8S5CZY7QFBR8UiO7Z8+Q@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/3] python3-tornado: Upgrade 6.4 -> 6.4.1
To: ticotimo@gmail.com
Cc: leon.anavi@konsulko.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Jun 2024 04:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110993

On Wed, Jun 19, 2024 at 3:15=E2=80=AFPM Tim Orling via lists.openembedded.o=
rg
<ticotimo=3Dgmail.com@lists.openembedded.org> wrote:
>
> We should update to =E2=80=9Cinherit python_setuptools_build_meta=E2=80=
=9D per
> https://github.com/tornadoweb/tornado/blob/2a0e1d13b5222dca4388c0ec8a4bb7=
4ea6fa4af2/pyproject.toml#L3
>

https://github.com/tornadoweb/tornado/commit/e71fb6e616e08838df55dddb494c96=
a80454f812

added the needed support for wheels, I think a followup to do this
would be just fine

>
> On Wed, Jun 19, 2024 at 5:20=E2=80=AFAM Leon Anavi via lists.openembedded=
.org <leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:
>>
>> Upgrade to version 6.4.1:
>>
>> - Parsing of the Transfer-Encoding header is now stricter.
>> - Handling of whitespace in headers now matches the RFC more
>>   closely. Only space and tab characters are treated as whitespace
>>   and stripped from the beginning and end of header values.
>> - tornado.curl_httpclient now prohibits carriage return and
>>   linefeed headers in HTTP headers.
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> ---
>>  .../python/{python3-tornado_6.4.bb =3D> python3-tornado_6.4.1.bb} | 2 +=
-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>  rename meta-python/recipes-devtools/python/{python3-tornado_6.4.bb =3D>=
 python3-tornado_6.4.1.bb} (93%)
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.4.bb =
b/meta-python/recipes-devtools/python/python3-tornado_6.4.1.bb
>> similarity index 93%
>> rename from meta-python/recipes-devtools/python/python3-tornado_6.4.bb
>> rename to meta-python/recipes-devtools/python/python3-tornado_6.4.1.bb
>> index b01c1cec2..30b50f24f 100644
>> --- a/meta-python/recipes-devtools/python/python3-tornado_6.4.bb
>> +++ b/meta-python/recipes-devtools/python/python3-tornado_6.4.1.bb
>> @@ -6,7 +6,7 @@ HOMEPAGE =3D "http://www.tornadoweb.org/en/stable/"
>>  LICENSE =3D "Apache-2.0"
>>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6=
bd57"
>>
>> -SRC_URI[sha256sum] =3D "72291fa6e6bc84e626589f1c29d90a5a6d593ef5ae68052=
ee2ef000dfd273dee"
>> +SRC_URI[sha256sum] =3D "92d3ab53183d8c50f8204a51e6f91d18a15d5ef261e84d4=
52800d4ff6fc504e9"
>>
>>  inherit pypi setuptools3
>>
>> --
>> 2.39.2
>>
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110968): https://lists.openembedded.org/g/openembedde=
d-devel/message/110968
> Mute This Topic: https://lists.openembedded.org/mt/106759044/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

