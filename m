Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC8BD116E2
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 20:18:50 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3255.1764361126954728777
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 12:18:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LDFOEtnW;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59581e32163so997391e87.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 12:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764361125; x=1764965925; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/+Rm645Q+dtzlPD+1rgSd3R3rrwAbXYGaysX2wyBM4=;
        b=LDFOEtnW/ynwH4jFAgbxAEYHBfSn2xZVfTBt1iMpy8W0UCNTOargFaoSe/0TOBiQb4
         oKjJ74YwBmRBHf8I5G2Qdr6GbIfxHRqEITRPUquEqLyxfacD1DCAXUqS/wx2KYEkG8/e
         RxuLiysdnYn2eOSWXSzT1ykQQQjA3ePVuoaxL4IgL4hF3R5Toh6g2O73XrEYu9NPSlAT
         xIOMN3tNkQnD+v0l4oQMvKCY5ymr0eOpPsdh2WMJEN0NM762/yoh6X4Z9oIuVfstWxGL
         F4XP75y+5NA5sZIskdE1VNXasyJ2KmizLFi8IdJJnPKpVfro5n8aAcvZud82ChKp1Wcj
         n+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764361125; x=1764965925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v/+Rm645Q+dtzlPD+1rgSd3R3rrwAbXYGaysX2wyBM4=;
        b=jdwDz8ZHrAqxQ8M4sfNVN1StL88zUHXZcR1AWRnYFIYwk6ph8UmOlsEfA/ZZSX1WP4
         LlrlOezvVXI8sK9Fshjodn4QndfMFHrDVVpfTfAcCSEENB/Iut/OLfYArRDsjgKpEGqg
         Zr98qmJu+t72NUe9QVsgybqP+IKJOhmJyIWL9w8mP0CS7KBsl13NF/KUtbZW6PRMAMHk
         xUK47Yb/MlgG/EbN/LGyMPnuzOooFw4RLspQare2ZY+3gQFNlEZKM1Zk9KcKlRHdl0MM
         W2T1mdzFakLQdqp0kbIk5VaZWnyAcKFCAYs1/KflDlxpPl6dtYF7Ucl3nQDWikCIm0Wn
         lHtA==
X-Forwarded-Encrypted: i=1; AJvYcCVs2ZT4Typ0iLV00TQMfhQTb4qPul8q4Jd0b50b/AHBBIyXM5ba+gKww+9yO1VBSpZ2SURdkldPFmSsAQ1eihwviMo=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxXOMVDFf5rUqBi2VIZYcrRb1/YA6c7bnHy2YFbCU0imvow6Lsy
	AJwHTxIihYo0v2Gg5MYLwdLggKhBDuc0Qx2ai2IKmCLsivN9ndp6Aq76o1PvCmXUi05ZmyhNDFc
	7V0h2xd0kK6S3sn+JYNRIFfkx84YLpK8=
X-Gm-Gg: ASbGncuMo9DAF74yX9pa5SLG9qZ0SpUMiwVDhkEJSaVXMQvrHrVBalyY9ZMTq1IOIZy
	9Uv9yA3zANhSe3hVkH4h0NTdXH8U94UKM2iCLYqIqVfWop8dyZQaCjc7fSfj1Z1f+uTjRfbGFL2
	HWp8k5vYIs3HwJiRz/irI8obmo03Ridj97PCW8rPIfvAtlZItTjlvSbmhOWMZfzheTiZugf2RYx
	a95RpHXsijU/4PgK9Bt7Cciltp0DEi1VCSsGMV1702+Ln52M6YfSb3BNQnKUmINb+g/Uf3mtA==
X-Google-Smtp-Source: AGHT+IH5rqg0rS3e/xCjP5fN/qr7T4+Gv2qSA3FjBzX9Y1G3chvsESbmhfxaQWRkPxWVvvFL11tMiMakkl/uIex5vdk=
X-Received: by 2002:a05:6512:ba7:b0:592:f330:221 with SMTP id
 2adb3069b0e04-596b4e4b875mr7012228e87.6.1764361124551; Fri, 28 Nov 2025
 12:18:44 -0800 (PST)
MIME-Version: 1.0
References: <20251128115800.2757259-1-jan.claussen10@web.de> <CAMKF1soRo6=R=mCu=tah=SvEECFxrwONKxPA3OzXCi9MQXcYsA@mail.gmail.com>
In-Reply-To: <CAMKF1soRo6=R=mCu=tah=SvEECFxrwONKxPA3OzXCi9MQXcYsA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 28 Nov 2025 21:18:30 +0100
X-Gm-Features: AWmQ_bn0IoqnufyfUysnrctWc91R_ga0kdXyWxO_vkotuqidb8O_zGn__XVVIM4
Message-ID: <CA+chaQcTCvLQjvfCVJGYgYPUMDK8rQGM_QOZQ+t=pv+jzkbW8w@mail.gmail.com>
Subject: Re: [oe] [meta-python][master][PATCH] python3-soundcard: Add recipe
To: raj.khem@gmail.com
Cc: jan.claussen10@web.de, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 20:18:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122132

And REQUIRED_DISTRO_FEATURES =3D "pulseaudio" probably doesn't do
anything without features_check inherit

On Fri, Nov 28, 2025 at 9:01=E2=80=AFPM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> results in
>
> ERROR: ParseError at /mnt/b/yoe/master/sources/meta-openembedded/meta-pyt=
hon/recipes-devtools/python/python3-soundcard_0.4.5.bb:13: Unparsed lines /=
mnt/b/yoe/master/sources/meta-openembedded/meta-python/recipes-devtools/pyt=
hon/python3-soundcard_0.4.5.bb: ['RDEPENDS:${PN} +=3D " ', '    libpulse ']
> ERROR: Parsing halted due to errors, see error messages above
>
>
> On Fri, Nov 28, 2025 at 3:58=E2=80=AFAM Jan Clau=C3=9Fen via lists.openem=
bedded.org <jan.claussen10=3Dweb.de@lists.openembedded.org> wrote:
>>
>> Signed-off-by: Jan Clau=C3=9Fen <jan.claussen10@web.de>
>> ---
>>  .../python/python3-soundcard_0.4.5.bb                | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>  create mode 100644 meta-python/recipes-devtools/python/python3-soundcar=
d_0.4.5.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-soundcard_0.4.5=
.bb b/meta-python/recipes-devtools/python/python3-soundcard_0.4.5.bb
>> new file mode 100644
>> index 0000000000..632b54eaef
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-soundcard_0.4.5.bb
>> @@ -0,0 +1,12 @@
>> +SUMMARY =3D "Python library for accessing soundcards"
>> +LICENSE =3D "BSD-3-Clause"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De39df1540c06c17ca310ce87c36b=
042c"
>> +
>> +SRC_URI[sha256sum] =3D "07272ba927e32cafdf634e4a1ca53b9a3218321a60c7d2e=
08f54b832a56946aa"
>> +
>> +inherit pypi setuptools3
>> +
>> +REQUIRED_DISTRO_FEATURES =3D "pulseaudio"
>> +
>> +RDEPENDS:${PN} +=3D " \
>> +    libpulse \
>> +    pulseaudio-server \
>> +    python3-cffi \
>> +    python3-numpy \
>> +"
>
>
>
>
>>
>> --
>> 2.52.0
>>
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122127): https://lists.openembedded.org/g/openembedde=
d-devel/message/122127
> Mute This Topic: https://lists.openembedded.org/mt/116512050/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

