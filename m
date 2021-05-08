Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.7987.1620489545083914269
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 May 2021 08:59:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XbwsGZ7D;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id w9so6323313qvi.13
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 May 2021 08:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QskYF91bqc45WseZi6AhfEvTxSnL7to8nwX597OJzos=;
        b=XbwsGZ7DEiweL4yw6if9eUMdwpYSRL8uSHZuk6apOTDh3mcidniN7HXXqBN89bJXiZ
         M7UdJYeSU5+UXGkNVARDOlW95TVvitdcZSfvPi5n5yvjwc5vr/Sm8brJ0KJFcdyivKjh
         03brMiE+O/3zpNCx23xWZVXJGUMmQDyHWnQE5QRpYFt119WXA9Lyn2L9XFqpBAybfW7S
         2GAje/WteqDCLK7ilmUthWwi7tmTCoDhg+5BbcfzEVOm2rBSHt8YxQjpURuAg8Ld0DhU
         JkBSdms4S4NhRhEi64i+ShsgwdImQVaQYE0r1i+cb84KKCs+n+CWUWRFgW3jkRkgJYxX
         Leeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QskYF91bqc45WseZi6AhfEvTxSnL7to8nwX597OJzos=;
        b=dWqKfSFi5YolYItKFXioerKUZSNevI28+tdfaeEo+LhKMrWO4JcyUszmJruRI2pEnx
         oLnZKliZHipYle4iM7hSyvqkRtLgLjf0IUSsQ1GLmhbJgXJ5jjBHTBe4gFourMn7dqUS
         H10FyEQIa3xofLFKEehjqA1xsv94u9LV1Qtil5cT1LxKIJu11tGWWOFRTE02tE7Afvhi
         2Ii0OwvOUxS372b4cSNt8zCUcdWOXBVyNJDJVCe2v4PAGZgAmLYp5zPqyQTD7yxhLNgu
         uN7HtljnpQ/R/debkV/wdMcPLm5TNw2T2hF7jbFoYDmzWe+oR4wdS/4aa8D3FeGDnkrZ
         GEzQ==
X-Gm-Message-State: AOAM533bTd84HZH7olMUHqOIo90VNzKwr+XJ4FSaJGpDwPzXj5tsBzHD
	eek9YYUKAehb0XZZ42G4Bm4lj5SR0KDMUPVk1uw=
X-Google-Smtp-Source: ABdhPJyYPigUZu3NffAQXJk9S+7aqTb049sDhyEn26zAtXv9KHQc3sYiUCXDmyGa6/Tog3RmJ98gwLBG8B6U2V/+4B8=
X-Received: by 2002:a05:6214:a62:: with SMTP id ef2mr15588456qvb.31.1620489544285;
 Sat, 08 May 2021 08:59:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210508054942.1527640-1-raj.khem@gmail.com> <CA+chaQeBTJCYy3igBjD_Zf_+xKGVoNcnqnC7dU7oQEpCP0fJTQ@mail.gmail.com>
In-Reply-To: <CA+chaQeBTJCYy3igBjD_Zf_+xKGVoNcnqnC7dU7oQEpCP0fJTQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 8 May 2021 08:58:36 -0700
Message-ID: <CAMKF1sojOZmK4z9-wC3Hb91HanFA1sQCgyTBWS3tMYQzzARWGw@mail.gmail.com>
Subject: Re: [meta-python][PATCH] python3-m2crypto: Pass correct ABI defines to swig
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 8, 2021 at 1:26 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Thanks, this works in my setup (qemuarm64 + oe-core default) as well.
>
> Can you drop most of do_configure_prepend with this? (Also small typo in =
commit message 'currenrly' and 'wtong')
>

Right. I sent a v2, please check that out.

> On Sat, May 8, 2021 at 7:49 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> This ensures that WORDSIZE is as per the target, currenrly this does not
>> get it right for cross compiling, and OE uses multilib headers by
>> default which means if WORDSIZE is wrong it will go on to include wtong
>> headers due to these artificial stubs
>>
>> Fixes
>> swig -python -py3 -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2c=
rypto/0.37.1-r0/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../lib/aa=
rch64-oe-linux/gcc/aarch64-oe-linux/11.1.0/include -ITOPDIR/tmp-glibc/work/=
cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot-native/usr/bin=
/aarch64-oe-linux/../../lib/aarch64-oe-linux/gcc/aarch64-oe-linux/11.1.0/in=
clude-fixed -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.3=
7.1-r0/recipe-sysroot/usr/lib/aarch64-oe-linux/11.1.0/include -ITOPDIR/tmp-=
glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot/usr=
/include -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1=
-r0/recipe-sysroot/usr/include -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/p=
ython3-m2crypto/0.37.1-r0/recipe-sysroot/usr/include/python3.9 -I/usr/inclu=
de/openssl -includeall -modern -builtin -outdir TOPDIR/tmp-glibc/work/corte=
xa57-oe-linux/python3-m2crypto/0.37.1-r0/M2Crypto-0.37.1/M2Crypto -o SWIG/_=
m2crypto_wrap.c SWIG/_m2crypto.i
>>   TOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/re=
cipe-sysroot/usr/include/openssl/opensslconf.h:23: Error: Unable to find 'o=
penssl/opensslconf-32.h'
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Cc: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>  .../recipes-devtools/python/python3-m2crypto_0.37.1.bb        | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1=
.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
>> index 896d9d2cc4..305987d4f0 100644
>> --- a/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
>> +++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
>> @@ -33,7 +33,9 @@ DISTUTILS_INSTALL_ARGS +=3D "build_ext --openssl=3D${S=
TAGING_EXECPREFIXDIR}"
>>
>>  SWIG_FEATURES_x86 =3D "-D__i386__"
>>  SWIG_FEATURES_x32 =3D "-D__ILP32__"
>> -SWIG_FEATURES ?=3D "-D__${HOST_ARCH}__"
>> +
>> +SWIG_FEATURES ?=3D "-D__${HOST_ARCH}__ ${@['-D__ILP32__','-D__LP64__'][=
d.getVar('SITEINFO_BITS') !=3D '32']}"
>> +
>>  export SWIG_FEATURES
>>
>>  # Get around a problem with swig, but only if the
>> --
>> 2.31.1
>>
