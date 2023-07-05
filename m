Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A077EB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 17:59:35 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web10.1935.1688579970363452012
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jul 2023 10:59:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=jGropcfv;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6b71eef1bc0so5367883a34.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Jul 2023 10:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688579969; x=1691171969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3zxDetCr+QsTm0Xf3+zJdAlNgb5uDr/uyIiEgwUH0I=;
        b=jGropcfv3eGLPRN2/OAp5DPKDeFLYx7eq1/wtVhkRJxN05W1/xykRo+XgR69GzixPC
         voGw1/O70TgWUHuTDSSX9cm9jrl0gRP9QTePOs+c1CVs9Vz1C40jX3Ke0oEthqoK6MNw
         Y+xDFjhGWusPLxxbbZVX8gcKHtHmhFKjnNANOiAj4GLOrpyNpZUWV4CRdJlHbu3om+h8
         VaDydbAD4M+TzXMSTen4AacU45aZev2+5ojSPHHGGANwQbYga3ZjQptZCliecbeno2gG
         AlGRdfdGX+LygwBkoV/4zs0bOxSI0tSjrhXpEgPambVUNpPuWkQZsMXtf6J05a1Fasgq
         cgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688579969; x=1691171969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d3zxDetCr+QsTm0Xf3+zJdAlNgb5uDr/uyIiEgwUH0I=;
        b=djaFqYLJ94coOlJ963ITm2BoP+5+rTtthlHmKOC21pBwY0dIxO/alD00XwDkpYwnma
         UbKKExU6L9y8Y79yK+C7wzBTZhJ463vw7iYPLj7nUC2xN3Gq8klxasWO/cLoCH2nJG7f
         9P6OdG7vUf+AJ9b8zbS1B6aj3HH496OQkNgJW5Nxlkq0srXBxkazAr3ugWy9IpiUCWN5
         srCXpFVTaxc3JYsx+VhUA18YDBy638FoHCajCaGP/axB+EL3zSTBPz8DN+btzBJNu5bK
         FIwJxwuRd3rr/0KcDK8H6YdgcbtPHzN3741dsIMkylM4fegUQxNRJEEjQRJDlvy+kOVy
         JgcA==
X-Gm-Message-State: ABy/qLZLi/FBw/495Clvx0//IHinEC+kb4pDT7l7Q+omhPvI5RXMCL+n
	ozxWUio002VxhHf9jZH2LpwxcV7jQOSZR5hqoUQ=
X-Google-Smtp-Source: APBJJlFjT6Yxf7d+k4JpdtMMlDzYs++J5pwTzq79C+duSAjvHPYRdSrEO0x4zE2TJilJPAqfUm4DneTzbEUq5nvmH2k=
X-Received: by 2002:a05:6870:56a0:b0:1b3:f010:87c2 with SMTP id
 p32-20020a05687056a000b001b3f01087c2mr2000322oao.30.1688579969523; Wed, 05
 Jul 2023 10:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230705172550.3371930-1-raj.khem@gmail.com> <CANPvuRmCb3i2Z6VWTt9pgwbhMYWa0Q+oRnMBUpuMe-66r67xNQ@mail.gmail.com>
In-Reply-To: <CANPvuRmCb3i2Z6VWTt9pgwbhMYWa0Q+oRnMBUpuMe-66r67xNQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Jul 2023 10:59:03 -0700
Message-ID: <CAMKF1spBbiqcoWnYw=3aWVfBrhR2a_7w4h2XMAz=qLMM7JW+uQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/4] python3-grpcio-tools: Upgrade to 1.56.0
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Jul 2023 17:59:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103677

On Wed, Jul 5, 2023 at 10:37=E2=80=AFAM Jose Quaresma <quaresma.jose@gmail.=
com> wrote:
>
> Hi Khem,
>
> Looks like the old version was not deleted.
>

good catch !
it got added to the other patch upgrading python3-grpcio

> Jose
>
> Khem Raj <raj.khem@gmail.com> escreveu no dia quarta, 5/07/2023 =C3=A0(s)=
 18:25:
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  ...f-Disable-musttail-attribute-on-mips.patch |  8 ++++----
>>  .../python/python3-grpcio-tools_1.56.0.bb     | 19 +++++++++++++++++++
>>  2 files changed, 23 insertions(+), 4 deletions(-)
>>  create mode 100644 meta-python/recipes-devtools/python/python3-grpcio-t=
ools_1.56.0.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools/00=
01-protobuf-Disable-musttail-attribute-on-mips.patch b/meta-python/recipes-=
devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribu=
te-on-mips.patch
>> index 8b13d7ae21..8c70b2b6a6 100644
>> --- a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-prot=
obuf-Disable-musttail-attribute-on-mips.patch
>> +++ b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-prot=
obuf-Disable-musttail-attribute-on-mips.patch
>> @@ -14,11 +14,11 @@ Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>>
>>  --- a/third_party/protobuf/src/google/protobuf/port_def.inc
>>  +++ b/third_party/protobuf/src/google/protobuf/port_def.inc
>> -@@ -255,6 +255,7 @@
>> +@@ -338,6 +338,7 @@ static_assert(PROTOBUF_ABSL_MIN(20230125
>>   #error PROTOBUF_TAILCALL was previously defined
>>   #endif
>> - #if __has_cpp_attribute(clang::musttail) && !defined(__arm__) && \
>> + #if __has_cpp_attribute(clang::musttail) && !defined(__arm__) &&      =
\
>>  +    !defined(__mips__) &&                                        \
>> -     !defined(_ARCH_PPC) && !defined(__wasm__) &&                 \
>> -     !(defined(_MSC_VER) && defined(_M_IX86)) &&                  \
>> +     !defined(_ARCH_PPC) && !defined(__wasm__) &&                      =
\
>> +     !(defined(_MSC_VER) && defined(_M_IX86)) && !defined(__i386__) && =
\
>>       !(defined(__NDK_MAJOR__) && __NDK_MAJOR <=3D 24)
>> diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.=
56.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.56.0.b=
b
>> new file mode 100644
>> index 0000000000..eb1994d7ce
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.56.0.bb
>> @@ -0,0 +1,19 @@
>> +DESCRIPTION =3D "Google gRPC tools"
>> +HOMEPAGE =3D "http://www.grpc.io/"
>> +SECTION =3D "devel/python"
>> +
>> +LICENSE =3D "Apache-2.0"
>> +LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D8;endline=3D8;md5=3D7=
145f7cdd263359b62d342a02f005515"
>> +
>> +inherit pypi setuptools3
>> +
>> +DEPENDS +=3D "${PYTHON_PN}-grpcio"
>> +
>> +SRC_URI +=3D "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.=
patch \
>> +            file://0001-protobuf-Disable-musttail-attribute-on-mips.pat=
ch \
>> +            "
>> +SRC_URI[sha256sum] =3D "39f5877cea514b3da9f2683dfb3ffb45ef47b05f4ff39c2=
87d7d61c5057f48b8"
>> +
>> +RDEPENDS:${PN} =3D "${PYTHON_PN}-grpcio"
>> +
>> +BBCLASSEXTEND =3D "native nativesdk"
>> --
>> 2.41.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#103668): https://lists.openembedded.org/g/openembedd=
ed-devel/message/103668
>> Mute This Topic: https://lists.openembedded.org/mt/99969391/5052612
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
quaresma.jose@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma

