Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.11192.1622221060986680601
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 May 2021 09:57:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OGyTw/Rk;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id c10so3151733qtx.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 May 2021 09:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=E/+oIGcSoNsYQcMcuFhg6d+oPPhFEFVbeQbPeOkpua4=;
        b=OGyTw/Rk7MHVqb1Nc9jflTcmae9oF3vbguOYcopcQ09/WHRrYb+s9M8XurZO0JnjFJ
         on024M7nhlONJ8+SQy9JD/PLwLrehWq0t4XVZGXgbvALstGSM/ek4vbTybW9dmZWnLbI
         APKv5RgJIAxRk4+HSchhp4y2NTifZsJ+wbvxW/haUjryyLyZkCSxVvLIg75qS12IFFid
         vfQDTuIfP4/yzRxjv0LcWCO8VcGbzzZK7Wj56JsyBiLY7BLJoZuWN26gfd7HrMWzM/8G
         M2rxsQFb11xKd5vUnxGRdpSeHxGK18SbxkwerlUjAO5GJy3ML5aS+TnvsDZWt20bVjTQ
         6w1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=E/+oIGcSoNsYQcMcuFhg6d+oPPhFEFVbeQbPeOkpua4=;
        b=lDLl/n8xU5O3tmlwr0omPbWpOOq/Mg1yarLeRh4F70gXJdANeEES3qDHBQ1SqOwFsP
         ca/zDjJMjYqFtG/B22xuBFFFtPiV0t7dNhJzx2+5g4XwG7Le/QEMXC+h+aH8RjNL1l4n
         B1G60PIvCjpqdojWsvRVY3PuTcDmgdNxyNlcanNBOK3iJLG2yjPg2RD+8gYn1t4xw3av
         O3UC2av9h51cJbyOAHxNO8j1zxl74DS2BGTN0mUKqhXjT0EMa+XUZ4VECF2KFeyWtlzP
         AB1J/IQtszDAUYFSjw4T0OZJ5jK1r76Bibld0mORsS7lVYff0R1ODxWwaeGFKqoSEem3
         tTDg==
X-Gm-Message-State: AOAM533BV6RkWWJCYCX+7AMZynkdjrgLCGOaqlWu+kMUHp/a6k8n3RmY
	bI92D3Tri05loJpZBSYNo2GZLTu59/KkOjNxwgY21obf4UA=
X-Google-Smtp-Source: ABdhPJw7dwD9SnoqdZuNLHV+WeGNpO1/9MqaPb1i+zNufE+84ycxqUIEr8rPttN5AuaNBwDfWSz/sr554jIiWGqe6b4=
X-Received: by 2002:ac8:44b1:: with SMTP id a17mr4289948qto.369.1622221059928;
 Fri, 28 May 2021 09:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <1a68d742-389c-b39a-e97f-ff8a29d930f3@pr.hu>
In-Reply-To: <1a68d742-389c-b39a-e97f-ff8a29d930f3@pr.hu>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 28 May 2021 09:57:14 -0700
Message-ID: <CAMKF1son+KURN=TYRfGzrnOu_FJ46OhswNyz-2Z6XxreqYFbRw@mail.gmail.com>
Subject: Re: [oe] ovmf-native build error with GCC 11 host compiler
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

we should disable werror on this recipe

On Mon, May 10, 2021 at 10:52 AM Zoltan Boszormenyi via
lists.openembedded.org <zboszor=3Dpr.hu@lists.openembedded.org> wrote:
>
> Hi,
>
> it's a genuine build error with Hardknott on Fedora 34:
>
> brotli/c/dec/decode.c:2033:41: error: argument 2 of type =E2=80=98const =
uint8_t *=E2=80=99 {aka =E2=80=98const
> unsigned char *=E2=80=99} declared as a pointer [-Werror=3Dvla-parameter=
]
>   2033 |     size_t encoded_size, const uint8_t* encoded_buffer, size_t*=
 decoded_size,
>        |                          ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
> In file included from brotli/c/dec/decode.c:7:
> ./brotli/c/include/brotli/decode.h:204:19: note: previously declared as =
a variable length
> array =E2=80=98const uint8_t[*decoded_size]=E2=80=99 {aka =E2=80=98const=
 unsigned char[*decoded_size]=E2=80=99}
>    204 |     const uint8_t encoded_buffer[BROTLI_ARRAY_PARAM(encoded_siz=
e)],
>        |     ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
> brotli/c/dec/decode.c:2034:14: error: argument 4 of type =E2=80=98uint8_=
t *=E2=80=99 {aka =E2=80=98unsigned char
> *=E2=80=99} declared as a pointer [-Werror=3Dvla-parameter]
>   2034 |     uint8_t* decoded_buffer) {
>        |     ~~~~~~~~~^~~~~~~~~~~~~~
> In file included from brotli/c/dec/decode.c:7:
> ./brotli/c/include/brotli/decode.h:206:13: note: previously declared as =
a variable length
> array =E2=80=98uint8_t[encoded_size]=E2=80=99 {aka =E2=80=98unsigned cha=
r[encoded_size]=E2=80=99}
>    206 |     uint8_t decoded_buffer[BROTLI_ARRAY_PARAM(*decoded_size)]);
>        |     ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
>
> Comparing GCC 10 and 11, -Wvla-parameter is new in GCC 11 and
> it's part of to -Wall.
>
> Best regards,
> Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
>
>=20
>
