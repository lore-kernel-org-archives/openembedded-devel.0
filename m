Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D820C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 20:04:03 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.97931.1738613035076328890
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Feb 2025 12:03:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZELSqjjI;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-724d1724657so2885469a34.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Feb 2025 12:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738613034; x=1739217834; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/G/Oap2Mu0SqS8BGEKbckkGDSeh61AzC7iRKrNFw2c=;
        b=ZELSqjjIUe9e3JhUtZX/jSxoLPCjlyMjDUdUKwjfsyjhoBYjPvDv89M4nXICX9EhAM
         wOyfMNGRj8aCq065cK+eIhSxkX2WiW7P6GW2xe4t+RObrCKdk95VEj4boaLpqtCTmqnE
         /9mWbmkUcIVPLGH9gLsVN7D5i/65NCDnAS1h8mQXrKoOGBm5aHhMIKfawoEtOwfPhSmb
         99OAUQ/YSxTdND8HMIOMaVq283SxiyrXMF6RtkqrKXaJZshq7QxK6StLHXg9KlDhr+bn
         +cEum4bstkpf/P/XNsGYcOVsQsPsiGoNIuFlRpGwT55j95z4WQgdMIWRMkNMkMtTj1DS
         EGAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738613034; x=1739217834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/G/Oap2Mu0SqS8BGEKbckkGDSeh61AzC7iRKrNFw2c=;
        b=o4RxpKDE+5s5a96tTxwST3fdsN5sfqzFewDNZimdWhI+vreGKtPwoPYlxpkq0aPoJm
         YWt0wTQo3iG79EgaYwhJ7DXouWcdbhLnmpYUKnqCfi8CBSlpI4CNa3x6lhI3/YO2LEIm
         ykcruwcRkBw1rEy8DBiDh71r5A/OwHQaCu4pFPJ+4A9dIaQ0jQegJ3siILQCriGzuk5r
         LQFbUjG+wyjBc7XXoHX9JTO+Bwt2jrYN99yVhHY8TNcwC5H61ITUSjOgjxX4Sz7yZyCw
         3LSPsSG4vCp8pPHHeKVZiQYXrO9xvJUjdT5I4uerjERHP/xCHBzQfa6oYvwYsH30OLl1
         LhRg==
X-Forwarded-Encrypted: i=1; AJvYcCWN3vQeN0kpbFemc+p2/LWJxhNtQwMN9vGtJVDBSYD9KiNSLtB7yuGFQ0+ngxiQrLWq0XC4FTR+gAUTXrjYoSbCIAY=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxn1haLUYIO2+2OHLC6OHIgsr92x8T5RAzvx3Hgu39vKOO1+WTb
	YqZKdcwBTe/B+w+QmulWZjbubfrG+s35mfeOUQtP+jfO9yYtyKKk1nwjx43T8qjYCYyl9ecI8l9
	YzMTjZGd+XT9+DGWTDhK2SpwGv6o=
X-Gm-Gg: ASbGncveYuR4vErlI34D0nA7wGZOy9psLG0/cNV4tj/s2oiDqC0IEORUolJFZHb9dW9
	spLJ/+Yg++7yHfHH3mqnBuMTTG0CNYDiLWJHFQ5SZOVGTqxZKYVcUqBnJv1SfPxNmXfVp/9ytBX
	YsDAmjuBQqEscefbUE8vUITRPKyQ==
X-Google-Smtp-Source: AGHT+IH1frMcP3+XBNl02UYDrH6GiSJ+B09Jxqn+j5Di6Q3q/h5gWPX4r0uxQ0xNI7HIJtZpptW2EbWO7yW5GAUxp50=
X-Received: by 2002:a05:6870:7008:b0:29d:c62b:1794 with SMTP id
 586e51a60fabf-2b3e7567323mr453147fac.12.1738613034193; Mon, 03 Feb 2025
 12:03:54 -0800 (PST)
MIME-Version: 1.0
References: <20250202213910.284312-1-peter.marko@siemens.com>
 <20250203182210.574300-1-peter.marko@siemens.com> <20250203182210.574300-7-peter.marko@siemens.com>
 <CANx9H-Bu6-zUepwWm7jrT8-ZTbbufYPuNhtGbLj8JbmR15H9EQ@mail.gmail.com> <AS1PR10MB5697D0F2BD4A033596477F26FDF52@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697D0F2BD4A033596477F26FDF52@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Feb 2025 12:03:28 -0800
X-Gm-Features: AWEUYZk-VeeoqhidVmgWl-JwlU2uNKYnRB2M10-jpR1_yZqovSIi1O9SNHtvsuU
Message-ID: <CAMKF1srKZ3ewb0LGXBc2YjdrKp+YowUMzZEURUHOq=0Ay1jo-w@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v2 7/9] python3-protobuf: add MIT to license
To: peter.marko@siemens.com
Cc: Tim Orling <ticotimo@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Feb 2025 20:04:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115257

On Mon, Feb 3, 2025 at 11:59=E2=80=AFAM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> I have explicitly added comment to the recipe to keep the reference to MI=
T license.
>

That is good.

> And as the commit message explains, license file is not distributed in py=
thon module, so there is nothing to link to.
>

I think we can add the header of utf8_range/utf8_range.c to
LIC_FILES_CHKSUM trimming the content to checksum just the header
as Tim said, will make it more robust for future changes.

>
>
> Peter
>
>
>
> From: Tim Orling <ticotimo@gmail.com>
> Sent: Monday, February 3, 2025 20:47
> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Cc: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-python][PATCH v2 7/9] python3-protobuf: add MIT t=
o license
>
>
>
>
>
>
>
> On Mon, Feb 3, 2025 at 10:23=E2=80=AFAM Peter Marko via lists.openembedde=
d.org <peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> utf_range is MIT licensed.
> Although the LICENSE file is not distributed in python protobuf,
> this can be read in c++ protobuf recipe where all files are present.
>
>
>
> Shouldn=E2=80=99t we include a beginline/end line clause for at least one=
 source file? Otherwise only this commit log explains why MIT is present. W=
e want traceability fir our future forgetful selves.
>
>
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../recipes-devtools/python/python3-protobuf_4.25.3.bb        | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.=
bb b/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
> index b92f91b714..fb95340f7b 100644
> --- a/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
> @@ -1,8 +1,8 @@
>  DESCRIPTION =3D "Protocol Buffers"
>  HOMEPAGE =3D "https://developers.google.com/protocol-buffers/"
>  SECTION =3D "devel/python"
> -
> -LICENSE =3D "BSD-3-Clause"
> +# MIT license is from utf8_range
> +LICENSE =3D "BSD-3-Clause & MIT"
>  LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D8;endline=3D8;md5=3D53=
dbfa56f61b90215a9f8f0d527c043d"
>
>  inherit pypi setuptools3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115256): https://lists.openembedded.org/g/openembedde=
d-devel/message/115256
> Mute This Topic: https://lists.openembedded.org/mt/110976773/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

