Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24EF8C27C44
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 19:13:43 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.258.1717096421222163855
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 May 2024 12:13:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LDwnsYfK;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3c9d70d93dbso800556b6e.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 12:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717096420; x=1717701220; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IR0o+KR70u3MzAgoybIbtK+mmM/VSuBXrfpk3Mtkab4=;
        b=LDwnsYfKHyueGaq/Q+mas4YHtvM7RPbWOeMYEYpC1wshboB0mnA1CjoQ6k68Ti6xY8
         UyFA8/qY0sBlV5qiVayY+HVEJVOH6mjY2dGiN8pIJNq1ns/lmqGnE/iFETfTFmsyQxYT
         zpjSgqLtEp7HlREppr8Vrily72PuPfDOz+34XdWM8VJjWP/cUodXYAm1PBG0seSRH3B5
         OpaeKKiQrSufoJIU8MUKdta3LwUEvwjQG8yPM/dHvhkEhRrM2ffXsq08Ee9lLsLUALgg
         JsULKV4SDXqW9k8C2s1UV0x1JvjzxPcvBM7MZoWKN4mXdqF8bF4qa/XNrASjjeYxtOSQ
         8rrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717096420; x=1717701220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IR0o+KR70u3MzAgoybIbtK+mmM/VSuBXrfpk3Mtkab4=;
        b=dlz/oZiwbUcgwtElhzG7ABbGIqvfjPPdu2G4wD1ZO9Ok4nZE7eh9+e7yIXF/obziv5
         cFRsDxS6bpXlOvE5I01qEUK1TtSrRUDpWQMCI4zJa1wnOKlmKT3BQunjsr3jUZcUYWS7
         JhG+kmMnOlX4nMCW8UZyqoE17HW+Rvt6u8KeMwn66odoyiOqkJ2VDL2zC4j+k35hxgIZ
         z1gMfGCOYjJhf0aONyaWob8uckRSWwp22ybNQOB2N2fqQU54OySEcsC3TVge4LnYcxPW
         ALCzwoMAwNpDZsO0RnaDhFRc2x8ZTknOfi6WkWq7lSAl7qFDBdMqkHgpSobALowcdfYW
         Q3ew==
X-Gm-Message-State: AOJu0YwPQ5lLsP3y0wq9K//O6eXAsCTFIT5Wb9iKluyr5H88F/+QaRXu
	/X4PaZMAz2KoD5qgAPMSF3cF2kREW7I17SRRXl0OVFP3En6j+nPB+suM3WMYYL9EX5TLIUX1zFg
	WgQt+B68bS5lKcpCXI/+vO5FPpl4=
X-Google-Smtp-Source: AGHT+IF7D0p0oGyx3Xh+SGDjgZ1criBKu3OGfvpYaG2KaiQTiUeut84Ql+0+g/0+CstC45UPzenjhV4lpc+gCCUc8/Y=
X-Received: by 2002:a05:6808:8e2:b0:3c9:bcf1:96a8 with SMTP id
 5614622812f47-3d1dcd0c162mr3025577b6e.39.1717096420300; Thu, 30 May 2024
 12:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240529010328.2079536-1-raj.khem@gmail.com> <CAFMvBt3FTDitezHMgmM4MydPmmbSZa5_gjox4DdqOW7Dxk2waQ@mail.gmail.com>
In-Reply-To: <CAFMvBt3FTDitezHMgmM4MydPmmbSZa5_gjox4DdqOW7Dxk2waQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 30 May 2024 12:13:13 -0700
Message-ID: <CAMKF1srOFq7D5DzG+Q9Xja62LVbLbnhykwEbf8Raxzwje3yBJw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] catch2: Upgrade to 3.x release series
To: "Theodore A. Roth" <troth@openavr.org>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 19:13:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110643

On Thu, May 30, 2024 at 12:05=E2=80=AFPM Theodore A. Roth <troth@openavr.or=
g> wrote:
>
> FYI: Updating catch2 to v3 breaks the ptest build for libgpiod-1.6.4.
>
> I needed to disable ptests to get it to work for our builds.
> The real fix would be to port the libgpiod-1.6.4 code to catch2 v3, but w=
e want to migrate to libgpiod-2.x soon anyways.
>

Yes, I see it break ptest builds as well that's why I have withheld it for =
now.

> Just giving folks using libgpiod-1.6.4 a heads up on what I found.

Thanks

>
> Ted Roth
>
> On Tue, May 28, 2024 at 7:03=E2=80=AFPM Khem Raj via lists.openembedded.o=
rg <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> It supports C++20 better and newer compilers e.g. clang19
>> works better with 3.x series.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../catch2/{catch2_2.13.10.bb =3D> catch2_3.6.0.bb}             | 4 ++-=
-
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>  rename meta-oe/recipes-test/catch2/{catch2_2.13.10.bb =3D> catch2_3.6.0=
.bb} (87%)
>>
>> diff --git a/meta-oe/recipes-test/catch2/catch2_2.13.10.bb b/meta-oe/rec=
ipes-test/catch2/catch2_3.6.0.bb
>> similarity index 87%
>> rename from meta-oe/recipes-test/catch2/catch2_2.13.10.bb
>> rename to meta-oe/recipes-test/catch2/catch2_3.6.0.bb
>> index f8080c8f97..52045bd144 100644
>> --- a/meta-oe/recipes-test/catch2/catch2_2.13.10.bb
>> +++ b/meta-oe/recipes-test/catch2/catch2_3.6.0.bb
>> @@ -4,8 +4,8 @@ HOMEPAGE =3D "https://github.com/catchorg/Catch2"
>>  LICENSE =3D "BSL-1.0"
>>  LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3De4224ccaecb14d942c71d31b=
ef20d78c"
>>
>> -SRC_URI =3D "git://github.com/catchorg/Catch2.git;branch=3Dv2.x;protoco=
l=3Dhttps"
>> -SRCREV =3D "182c910b4b63ff587a3440e08f84f70497e49a81"
>> +SRC_URI =3D "git://github.com/catchorg/Catch2.git;branch=3Ddevel;protoc=
ol=3Dhttps"
>> +SRCREV =3D "4e8d92bf02f7d1c8006a0e7a5ecabd8e62d98502"
>>
>>  S =3D "${WORKDIR}/git"
>>
>> --
>> 2.45.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#110598): https://lists.openembedded.org/g/openembedd=
ed-devel/message/110598
>> Mute This Topic: https://lists.openembedded.org/mt/106361394/3617677
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
troth@openavr.org]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

