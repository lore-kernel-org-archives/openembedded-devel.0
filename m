Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 587DEC7115A
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 09:20:40 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.23284.1750584034218474494
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Jun 2025 02:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L2+kevtE;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: alperyasinak1@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b31d489a76dso2675123a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Jun 2025 02:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750584034; x=1751188834; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsyjM14ugqHaiVhzmVfBX6LozXtu7IolGfuZtABIkcE=;
        b=L2+kevtEFsiLBeYP7VccDTRciGJb6ihwMWEiMOcseqOCPG+aHs7R9Bykqeow9we+oI
         F+3VZKHqCRZR0I+vl+JTA79yM1+wy4XWBi5i9k/1+4aJRWT5B98tYi/AMPZuW931RP15
         orvFbM+qISkgGhfdAoytVtWBuTcpIH9WUkpQGaNmarqk8T9C4BEU1Jvv1HH9+ZMJBSS6
         dPw1neoD8b4oAxYL0kcz6vDhzvOJFZWxGmBByDBbXTuvJPon/r2BBysGVgWcc/9u+yAw
         loHWkmKbhvVpd9sT/sIWTtpZ3spEQ7xCbbVr6QxTovAA0CHF5J+769Ta70GWEqcWx7ex
         rYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750584034; x=1751188834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JsyjM14ugqHaiVhzmVfBX6LozXtu7IolGfuZtABIkcE=;
        b=J19DczMRQxplJILsUrQ7/zDv80xMHTmLMbju+c9LrAwASHtiQkMe9hzhKiy6QMC/Z1
         S3MfFboPF6HvxXhwNM+KA7SopSkf/pyS2m/pXPEsMrLQAbX/chWrRLAVjCsiLN5hE4yt
         IzSZA80u5rvOsCpBK9YzFyzj/LJweg94XZKSRbl6DamA2F3ZCHeGrLMQiT8rK408KMXc
         b2gu8wWJ6wkMZZ2Z5y9dxvfRJMmxgnYDaJUZZIo5hPIVj4nPXMHch5YMKQuEpNpLBh8z
         tTNPr1GQ6nAPTc1gbX2aSDRF806upiJr94MnR5Intc5nrk05fn/FGbOntvtVrzlUC8IE
         LZig==
X-Gm-Message-State: AOJu0YyQhsDS5HRRWGKdIC6aMgbCEMOKTiW2gx1xFPEY20UDWrPFQIg0
	T2nmvIEF5dD1eC8q2p7IVSd2GetHW+NvjvVn1v6mOAFQGhEs67/qTIui4fvi2prainchS63e7Cw
	v55F77KylQwjct3mAQFSGaNqFvbykpabwMU/lsZk=
X-Gm-Gg: ASbGncv7Z9lRgUxSAHF9d6YIeC0XMAGucXzKZ2TxOwieIX5mWWKSQ8/dxbKQ6Hym/z0
	lMp5cECo/atsLnsOWbQtmJKUwa048aDpzYjr97kEpEJqrcU49sZBKDTeN028ugwDn2PzVbOHFcq
	yZxjvNuimQ24dqQPGSOAEZ5rlPAPgauoDonB0NwRHaRAE=
X-Google-Smtp-Source: AGHT+IGPpLpVSbVTaL+YqwL+w3YVGm9BpBijnjgW7HTp9kWPAnjSji3OFI7pBEEzOCgNFaGwbk1rOQuUi3SD+jkE2Jo=
X-Received: by 2002:a17:90b:3905:b0:311:9c9a:58ca with SMTP id
 98e67ed59e1d1-3159d64287dmr14311006a91.8.1750584033469; Sun, 22 Jun 2025
 02:20:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250621111721.1857015-1-alperyasinak1@gmail.com> <CAMSfU+6SWhgHfMXAm3gfJf2=msp8H1CsZTLNXi+rq-b5kLp23g@mail.gmail.com>
In-Reply-To: <CAMSfU+6SWhgHfMXAm3gfJf2=msp8H1CsZTLNXi+rq-b5kLp23g@mail.gmail.com>
From: Alper Ak <alperyasinak1@gmail.com>
Date: Sun, 22 Jun 2025 12:20:22 +0300
X-Gm-Features: AX0GCFsBxOFDDjaLyuPHJyD9Q46CAw3Pzl4Q-1KRyruGDlKhVXvHKDXghSqgLmw
Message-ID: <CAGpma=6eZ7FUonsg-hLxFsk__hC7iAX6jRz+HX_0TxXNbv2yTQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] autossh: Replace WORKDIR with
 UNPACKDIR to prevent compile error
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Jun 2025 09:20:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118019

Oops, I overlooked that. Thanks for letting me know!

Yoann Congal <yoann.congal@smile.fr>, 21 Haz 2025 Cmt, 16:07 tarihinde
=C5=9Funu yazd=C4=B1:
>
>
>
> Le sam. 21 juin 2025 =C3=A0 13:17, Alper Ak via lists.openembedded.org <a=
lperyasinak1=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :
>>
>> Issue was related to latest UNPACKDIR changes -> https://git.openembedde=
d.org/openembedded-core/commit/?id=3D46480a5e66747a673041fe4452a0ab14a1736d=
5e
>>
>> ERROR: autossh-1.4g-r0 do_compile: Execution of '/srv/pokybuild/yocto-wo=
rker/meta-oe/build/build/tmp/work/core2-64-poky-linux/autossh/1.4g/temp/run=
.do_compile.2252' failed with exit code 1
>>
>> Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
>> ---
>>  .../recipes-connectivity/autossh/autossh_1.4g.bb   | 14 +++++++-------
>>  1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/meta-networking/recipes-connectivity/autossh/autossh_1.4g.b=
b b/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb
>> index 4613ac61f1..2bc302081e 100644
>> --- a/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb
>> +++ b/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb
>> @@ -11,19 +11,19 @@ SRC_URI[sha256sum] =3D "5fc3cee3361ca1615af862364c48=
0593171d0c54ec156de79fc421e31a
>>
>>  RDEPENDS:${PN} =3D "ssh"
>>
>> -CFLAGS:prepend =3D "-I${WORKDIR}/build "
>> +CFLAGS:prepend =3D "-I${B} "
>>
>>  inherit autotools
>>
>>  EXTRA_OECONF =3D "--with-ssh=3D/usr/bin/ssh"
>>
>>  do_compile:append() {
>> -        cp ${WORKDIR}/autossh-${PV}/CHANGES ${WORKDIR}/build
>> -        cp ${WORKDIR}/autossh-${PV}/README ${WORKDIR}/build
>> -        cp ${WORKDIR}/autossh-${PV}/autossh.host ${WORKDIR}/build
>> -        cp ${WORKDIR}/autossh-${PV}/rscreen ${WORKDIR}/build
>> -        cp ${WORKDIR}/autossh-${PV}/autossh.1 ${WORKDIR}/build
>> -        cp ${WORKDIR}/autossh-${PV}/autossh.spec ${WORKDIR}/build
>> +        cp ${UNPACKDIR}/autossh-${PV}/CHANGES ${B}/
>> +        cp ${UNPACKDIR}/autossh-${PV}/README ${B}/
>> +        cp ${UNPACKDIR}/autossh-${PV}/autossh.host ${B}/
>> +        cp ${UNPACKDIR}/autossh-${PV}/rscreen ${B}/
>> +        cp ${UNPACKDIR}/autossh-${PV}/autossh.1 ${B}/
>> +        cp ${UNPACKDIR}/autossh-${PV}/autossh.spec ${B}/
>
>
> Hello,
>
> Can those "${UNPACKDIR}/autossh-${PV}/" be replaced by ${S} while you're =
changing these lines? (Sounds better to me)
>
> Thanks!
>
>
>>
>>  }
>>
>>  do_install:append() {
>> --
>> 2.43.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#118002): https://lists.openembedded.org/g/openembedd=
ed-devel/message/118002
>> Mute This Topic: https://lists.openembedded.org/mt/113756056/4316185
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
yoann.congal@smile.fr]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
>
> --
> Yoann Congal
> Smile ECS

