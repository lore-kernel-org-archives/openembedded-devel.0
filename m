Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 197A6C19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 06:30:37 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.5247.1741329030265650398
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Mar 2025 22:30:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MXesjPJt;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30bd21f887aso12200611fa.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Mar 2025 22:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741329028; x=1741933828; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uX995qavYYx9nGB7O7XmDkalxxydSgQWfQpuM5Fseag=;
        b=MXesjPJtE14h7J/upQ8cVNVCNghi6e1IQD7KyefOQkmPjNOVN+MM08BYf4ALVLKIge
         aLGaQhH9t/Ofk4n8L1Jn01U9uvJWNzMP0WPrrokKyxZYa2y25VuLN4Of/N2+uvhSs4be
         /nUqzDUirRfv3YoMymo7zHPG3mIMO8OlR03MlseUUMRHBuV4KGsUjQk1bCFI1w7gBxoZ
         TzBjIq5LT09qSuLnALprQ2kcUZLHbJ0mwWHLNCJmGdUp+8jjinquiYAkdpKZlXaa9fSS
         lH+QLg5IGSDKK3S3INfbZfBjaVk8oaMG6VvysSc5+WYvJXAX/DnYCFGQThOspfNCW60X
         HubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741329028; x=1741933828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uX995qavYYx9nGB7O7XmDkalxxydSgQWfQpuM5Fseag=;
        b=kjdfzdP5lMI2FIObnlbezKbx0Fx3pCLCelZQ5W4U/YoY4MfOYmiUeFzK5eJ5eQ03wE
         Ftod7wva/6x9njMI3NHqpSLG3rQcAGEqXbzjNMmAmgeyauTWA3sJ0BUy+AzFojr6JCrb
         9f9FUK2emdPWwZZCfHpGXLlZvOokGyNtgHks7EAEylYxs5Jdxeq+oPlnT3nAqBARP2c4
         ZI1V/gfx4v0c0kHiKEftLwru2ni8TZ+PVGEMw2onXQFj8I63zx830Y8fOrfihC7euFlp
         ERvhOuFezETPQFt8fnDFyLvhqT+yFm3u6DF7ZVOC49J37Thz8NGVGVhblAFSB3qoetF+
         vFWQ==
X-Gm-Message-State: AOJu0Yy0BWndSuZjOz1H8sG9AzyvzNR0sVJUpHT7Sqy/5E182yOA5r34
	oGwNWPmUOyzXKrtpe6sDdyJhC/NNmkAx9sM01HODoRUw53go6CZVwebkf/OK5DGbkxn+3M2BkLx
	alQR2s9yJE3qp0Om2V6KOYR9hciI=
X-Gm-Gg: ASbGncsPqC6vnjSvJdPvHrGR9vAQGO1NnWWUIE69zg9wpbA0RMsQATpCRRlCG3r/6uq
	XDQmsLAbnyEJ1X8ohiS+cmewRXzR00bHUmseh2bXm1LRcePzQ77galXeUkhwr71jJWZaRfKD786
	EfRQh2Eou6hunMCASJyt+jxbZnj04R
X-Google-Smtp-Source: AGHT+IGJh4uehBH+tUk3r3FYVJE8QfQb5Gf2gK3X+GuWqG5ZXnAmgik/fL/Mlc+Rkk8F4UIdYqJ6+8UmnwgXjB27SxY=
X-Received: by 2002:a05:6512:224f:b0:549:7c8f:8792 with SMTP id
 2adb3069b0e04-54990e676cfmr612301e87.29.1741329028032; Thu, 06 Mar 2025
 22:30:28 -0800 (PST)
MIME-Version: 1.0
References: <20250303191621.2421906-1-martin.jansa@gmail.com> <CAMKF1spURmMC9G5-3NwGrtsfoeE=HxbCN20G2-FPU+1xoPO80w@mail.gmail.com>
In-Reply-To: <CAMKF1spURmMC9G5-3NwGrtsfoeE=HxbCN20G2-FPU+1xoPO80w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 7 Mar 2025 07:30:17 +0100
X-Gm-Features: AQ5f1JogQjSKy1oCki3eqYBJQhaLF-vDpaXcLG3zrtbyV8LOAQNslZPzuXX8ksA
Message-ID: <CA+chaQek5-=Ob4AA5PMi9tD8KME9pRpfvNicf=BvWxTniUwWjg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] thin-provisioning-tools: use
 STAGING_LIBDIR_NATIVE variable for LIBCLANG_PATH
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Robert Yang <liezhi.yang@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 06:30:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115778

On Mon, Mar 3, 2025 at 8:27=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On Mon, Mar 3, 2025 at 11:16=E2=80=AFAM Martin Jansa via lists.openembedd=
ed.org <martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> * hardcoding:
>>   ${WORKDIR}/recipe-sysroot-native${libdir}
>>   is just wrong when there is a better variable
>>
>> * This path won't be correct for multilib builds where target ${libdir}
>>   might be e.g. /usr/lib32 while native libdir is /usr/lib.
>>
>> * use STAGING_LIBDIR_NATIVE variable which uses correct ${libdir_native}
>>
>> * fixes:
>>   error: failed to run custom build command for `devicemapper-sys v0.3.0=
`
>>
>>   Caused by:
>>     process didn't exit successfully: `lib32-thin-provisioning-tools/1.1=
.0/build/target/release/build/devicemapper-sys-88de590bc55acb43/build-scrip=
t-build` (exit status: 101)
>>     --- stderr
>>     thread 'main' panicked at lib32-thin-provisioning-tools/1.1.0/source=
s-unpack/cargo_home/bitbake/bindgen-0.69.4/lib.rs:622:31:
>>     Unable to find libclang: "couldn't find any valid shared libraries m=
atching: ['libclang.so', 'libclang-*.so', 'libclang.so.*', 'libclang-*.so.*=
'], set the `LIBCLANG_PATH` environment variable to a path where one of the=
se files can be found (invalid: [])"
>>
>> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
>> ---
>>  .../thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb    | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-pro=
visioning-tools/thin-provisioning-tools_1.1.0.bb b/meta-oe/dynamic-layers/c=
lang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_=
1.1.0.bb
>> index d0241c7016..1981a35934 100644
>> --- a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioni=
ng-tools/thin-provisioning-tools_1.1.0.bb
>> +++ b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioni=
ng-tools/thin-provisioning-tools_1.1.0.bb
>> @@ -20,7 +20,7 @@ inherit pkgconfig
>>
>>  DEPENDS +=3D "udev libdevmapper libdevmapper-native clang-native"
>>
>> -export LIBCLANG_PATH =3D "${WORKDIR}/recipe-sysroot-native${libdir}"
>> +export LIBCLANG_PATH =3D "${STAGING_LIBDIR_NATIVE}"
>
>
> Ah yes I had a hunch it will fail some usecases that=E2=80=99s for patch

Is there a reason why this change wasn't included in your master-next
branch yet?

Robert confirmed it in the other thread.

