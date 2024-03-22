Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D1E7C47DD9
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 02:20:47 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web10.3923.1711074047167442758
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Mar 2024 19:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y46qzfuT;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5a51c063f99so59219eaf.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Mar 2024 19:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711074046; x=1711678846; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8UzmFFD/8o0VLZXENI/ZfVjKiSGMU51+UFe4pxnlhbk=;
        b=Y46qzfuTmR4EE/moSjXqIEecSjRSCfTSdJrsS5Z+trjLHQnXZSkkaCq5iz/feEOHO4
         EFJhQnl1V8eaocuEGp48p1AhUYRMlHFU4tOkFE3jb6G3IwDHXYmNAOCSEB0hR81p+R2j
         JDqhdWmSzg4G9IKZKb6pUIeGqfxfuRhwIEoqbLYJGVGDJNGBk0lMpffM0R7z2EV3+pMf
         lS0Ma+Emeut97aMaiWyySYUJBxwoeZftBkj4fotP3wp9WCnTexQNmxGvyuXTbZitII12
         a4ig1UGl/VNQzOqqOMxfzTHXf89mC2e9Fh0LAiMv6Cm5EIt7C1aWqXLQP5p5Dzru0AeE
         1mlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711074046; x=1711678846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8UzmFFD/8o0VLZXENI/ZfVjKiSGMU51+UFe4pxnlhbk=;
        b=ctWvsPaLRCTr/DYXLXVqsWweVsi7kq2aBuZ0m193kckqnE4uV9acbTaPbzfU/j569q
         KDlpGUO8Z5NxS8MLMlKes9fjYIQkBorpDeWW0ekjPN9P6eLNL3fWdszoEmPvHhNHR/Gh
         4LIDDZQDTDl1XRK3oWknGgvmM16IjeCUluo26D5pkXSo0nv9L1uwqzZOrapOiwpvuW/S
         iuP6XerBdDujRa1SoXuQH4Ll9tU7xkg4dRgvyQshm+ygFoQiEuWX/XKprX3/KKEDVfwp
         hAd/ZoHEKH70ofb5ceEeo9PPfwrPmmvzxDUBtNfX9b3SzOb+0Bw8e1M/wSKV0GZgyoU1
         Ja1w==
X-Forwarded-Encrypted: i=1; AJvYcCXA8D0iyOB6mSxE7RA2Jpu5OYCNncohDcj+7nARYHB4QlT+toqlZJptl9wzG7hNhU0gFFNfLGveMkU3sUVBW3tGL+qTUk6NwX59Sfw43uVYeKJ5L0JrFghsZw==
X-Gm-Message-State: AOJu0Yx1iGGz1JyzINBm5oIVzWnztwfBaGrCDRYCf4+2D2rFLTQtFsRv
	gS/qATxqhmk68jRfew4wkkqD/883qIHxIkbxauAznn8vTUUvAdjGBbFgyZCXxiRGDJiJG+jJLZp
	Ul2ZadGIvdtR1M/5S6TuZMnXcZn0=
X-Google-Smtp-Source: AGHT+IGMJ/bN+VJtKPvTNvx2QJZ62cKDJNXrCk94/52wdT6BZoGTtu/iPslMnyFmAgjEn5x11udd7IxMyIgzhRWF1ww=
X-Received: by 2002:a05:6870:b613:b0:229:cea1:243e with SMTP id
 cm19-20020a056870b61300b00229cea1243emr1104707oab.0.1711074046275; Thu, 21
 Mar 2024 19:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240130103458.819774-1-martin.jansa@gmail.com>
 <0b85cf93-421b-4c5c-ae46-515ebdb5cc38@gmail.com> <CA+chaQcHdgbVOORRdeErRXT2FM+7QcOidaHEanskrqrocFN7xg@mail.gmail.com>
 <32b9a223-6f69-4ddc-98b3-e5a94d70080b@windriver.com>
In-Reply-To: <32b9a223-6f69-4ddc-98b3-e5a94d70080b@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Mar 2024 19:20:18 -0700
Message-ID: <CAMKF1sqXSN=LAtTCvbUn+8vav=GeFn2jB841UgGd_NNhuHwtQg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] redis: restore Upstream-Status ->
 LICENSE change for 7.4 and later !
To: randy.macleod@windriver.com
Cc: martin.jansa@gmail.com, openembedded-devel@lists.openembedded.org, 
	wangmy@fujitsu.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Mar 2024 02:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109508

On Thu, Mar 21, 2024 at 5:55=E2=80=AFPM Randy MacLeod via
lists.openembedded.org
<randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>
> Would the new license scheme described here:
>
> https://redis.com/blog/redis-adopts-dual-source-available-licensing/
>
> prevent us from accepting the 7.4 release? I suspect it should but I need=
 more time to
> read the new terms.
>

Good point. I saw the announcement today as well. I think we need to
certainly change to
use new license, if we can distribute it or not, perhaps it needs some
closer look.

> ../Randy
>
>
> On 2024-01-30 1:23 p.m., Martin Jansa via lists.openembedded.org wrote:
>
> On Tue, Jan 30, 2024 at 6:28=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
>>
>> On 1/30/24 2:34 AM, Martin Jansa wrote:
>> > * accidentally dropped in:
>> >    https://git.openembedded.org/meta-openembedded/commit/?id=3De91fa66=
8ed1dd4a3f6b06bcb099f70dbdd2a50b4
>> > ---
>> >   .../lua-update-Makefile-to-use-environment-build-setting.patch  | 2 =
++
>> >   1 file changed, 2 insertions(+)
>> >
>> > diff --git a/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Mak=
efile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/red=
is/redis-7.2.4/lua-update-Makefile-to-use-environment-build-setting.patch
>> > index b562e2522c..48a8bb5b4b 100644
>> > --- a/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-t=
o-use-environment-build-setting.patch
>> > +++ b/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-t=
o-use-environment-build-setting.patch
>> > @@ -16,6 +16,8 @@ updated to work wtih 6.2.1
>> >   Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
>> >
>> >   ---
>> > +Upstream-Status: Pending
>>
>> I think it might be better to move it above the scissor to avoid getting
>> lost in next devtool based upgrade.
>
>
> As you wish, resent all 3 as v2 with it moved.
>
> FWIW: in https://github.com/webosose/meta-webosose/commit/2c78e37ad9ceb9e=
236c03b44cca5b38e9d9eb2fc I've moved all Upstream-Statuses in LGE layers be=
llow, because too often developers applied them with Upstream-Status into t=
he component source git repo where it doesn't belong and then it was alread=
y too late to remove it there (while with Upstream-Status lost in rebase/de=
vtool there is still time to get warning from QA check and once this check =
is enabled by default in all the builds it will prevent people overlooking =
this by accident).
>
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109507): https://lists.openembedded.org/g/openembedde=
d-devel/message/109507
> Mute This Topic: https://lists.openembedded.org/mt/105077570/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

