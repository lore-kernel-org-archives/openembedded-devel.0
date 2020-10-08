Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
 by mx.groups.io with SMTP id smtpd.web10.620.1602196279290071808
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Oct 2020 15:31:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JsWg4RbB;
 spf=pass (domain: gmail.com, ip: 209.85.167.196, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f196.google.com with SMTP id t77so8120911oie.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Oct 2020 15:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=UVmu/rLx4iiVjD0pnwg3B0J//9jjlLb+VnUGsmx9HTo=;
        b=JsWg4RbBQGyOjCOSG0fpQpfDfhuQiditC7jfXeS414z/NO1jZ4RAHM9Y6tWivTEj3k
         L/hfJitkD8GKHxeeUvO24aZixfLXO/dfMt0vbO+ZlrVWnrZclh9WeklT0I3c1wNytGoD
         /TIrwlxLOTIeqZkPZQT++o1g963v16ocz3SQ+LtQKfKgtbdKKbeDlsYhB1woT8u1A+X1
         YMmwDoQ7fI3t6GGqPcKaOXHs8i6qOCacfN2+CHdYtfEfUMxqUznfcQ4Vs31p3Ggh6Zxp
         XPu8cUqmCBdM3hEmxO4KN7p/sN+wrVwVEVBVzuMrnvP1aLlLYQEw9nvH8ezMVQ1JOO/w
         AUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=UVmu/rLx4iiVjD0pnwg3B0J//9jjlLb+VnUGsmx9HTo=;
        b=XIlteGDH9U9tnj9A+Mdz5jYPmev76+4PDjSGZVhEH13OdNLO1l1zTzj+mql5dBTAQi
         4aMrDvH+zbTeYja2jFPc95CcNcHETzYPgCcfJo5FinX/2e6Kn097C9eLHNoLTi6EU4DG
         R+oYtXr6VEMnOvc9TMEtQ33IX8MqDHf9Kn90X3cScEyvv9V2Walryy1UKK7NRlQCRjoo
         s+0SBDYPxLmwSUrfrdnupLEcb/VaO6kxD4c61l4XgjUNpsUQa63tmoeTDcIUTaDJyBC1
         DymCQV0LAAOVNVGFTAVAR7qGFy2rbyCfnK8K2abDfJIebux3Hm5+DAA/7wuFFvqm1rBb
         1tSQ==
X-Gm-Message-State: AOAM533Z58QNx71Wui5v/wxMR8BHqO/pP3eYLYeAUAG73agNo9as0gSx
	aMMAwMtzLkqbNQnqIZtbfmLszaEHCE8=
X-Google-Smtp-Source: ABdhPJxIX5+FJ0O2iLgClMDaHHM3jD2aSqQ8vkzxTfTAvL5GNtRjjzJ4AQnlka5gJ8ua7troHih1tA==
X-Received: by 2002:aca:4ad0:: with SMTP id x199mr627960oia.113.1602196278390;
        Thu, 08 Oct 2020 15:31:18 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:f1c6:e45a:6950:664b? ([2601:202:4180:a5c0:f1c6:e45a:6950:664b])
        by smtp.gmail.com with ESMTPSA id n1sm4923667otr.16.2020.10.08.15.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2020 15:31:17 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH] musl-nscd: add package
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20201008194259.19152-1-akuster808@gmail.com>
 <CAMKF1sruO3OfF15ZdsMs4TyON9_RedtN0-a8mCux7z1cPv8t+Q@mail.gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 xsFNBFnlUP4BEADpKf+FQdLykenQXKk8i6xJNxDow+ypFeVAy8iFJp7Dsev+BtwUFo8VG7hx
 Jmd71vHMw+coBetWC3lk+IKjX815Ox0puYXQVRRtI+yMCgd6ib3oGxoQ8tCMwhf9c9/aKjaz
 mP97lWgGHbiEVsDpjzmMZGlJ6pDVZzxykkJExKaosE46AcA8KvfhRQg5zRyYBtinzs8Zu8AP
 aquZVHNXxPwjKPaSEEYqQjFeiNgFTavV+AhM2dmPmGUWCX9RZisrqA4slGwEB0srMdFf12Zg
 mD35Y9jZ80qpu5LPtJCFcsaAlebqR+dg36pIpiRR+olhN1wmC6LYP1vw6uMEYBjkTa2Rnb6+
 C4FDzCJD4UCrUvLMNeTW810DY0bjMMj3SfmSGSfQUssaaaTXCVlLGuGxyCr/kza1rHaXMKum
 Ek4EFj1fyn7AfkSLEHfJfY4sO1tpgigvs4eD/4ZSQEXSu/TjVvyKx4EvUbhlGMRyH2CPwD/H
 7DFF8tcVtJvCwUUW+zKtjxjSSLrhniNMXAOQJZ6CdaqCe4OyJQT5aRdr+FWbBRjpaRCCf5nf
 dTc88NMU9PrBT3vu0QJ5WNPO6MJpnb+d8iMNLZAz8tv8JMm2l+sMcNKSJ6lhX8peoBsfMVqc
 FgiykEO0fUt7DCbUYR5tLjM/3E5tHvTjMooVJyOxoufVLYtTtQARAQABzSFha3VzdGVyODA4
 IDxha3VzdGVyODA4QGdtYWlsLmNvbT7CwX0EEwEIACcFAlnlUP4CGyMFCQlmAYAFCwkIBwIG
 FQgJCgsCBBYCAwECHgECF4AACgkQ7ou0mfRW5/kuhRAAlR2FTq5572jrX5nnPR7AqI2bvSVb
 vqGLlvv739WhghvagbC+tu05QguopAhWW1/DcHK2+QtfIoC9UZrSW4RaO0CCo5sPjqK7l1KT
 ngWX/rGjF6xTF2QN0U/btcpMyVN2CNtVLwsDF9e+GHKoUcnFkP+JP8vHGokN9k6E/c97hLaL
 IJPeKl8LZXc2Efk+MaW1NXkfDJdcp/p+voajbihSQO6OZ/o+x9d2I3ZybKfTZ71+ek5Hxzjz
 g6KkMOI7KJjlmBlrQFAtVbS+CFAKrwkYznE6ggkcmGv3N7DeUBTUR78hf+EZEAM+ajeLMtrG
 rXE00pIb+gLGYPZxba5pCdQ+qWUW38qi9UnIRPm6fq7Ypx1r6XwJvbgCOkhbxo3D4YUdyC0b
 FE9lgrg8htbc9in4j2+hVI6ALswNjLprzXdzdKrd+T3Egx36o3Z/qrYsW2o5/A5sVvvASVKi
 wRPuEKhEhfmiHUPLvuKqhMoymHaz3fg5D2Q8G0gSDkLgeEpAjiWqf4+AGLx+MSDai7DSOsmI
 t61kWxs7cFTB32UrB/TDoVNn3Fm88ZFQpA/bngikE9jgEm045mSY86fNlbFj2mcCd0Ha1i1n
 aYc97RpgfjNMWyHDVHOGrNg/hJjkGa5RsAXkfyBwltHRw0Hj4urUQ3rr8um8PLe43SezPwXA
 oRoyDxDOwU0EWeVQ/gEQALNHwj5VSPdnvXy1RXUuH+rclMx4x8zaqDyY0YqHfA7b/d8Y0VAt
 Y6YpzDeFTwD8A0Wfb7kZ2mlDIE6ODCB71uT/E3C6b+FiiN+lgzslznjUW+9l8ddDhRrC8HMG
 37vrXF5h++PTXUKEKUlkDib1w093tu3mlJXUvIAzl8CEHkptF6Br0L9XxFwuWoNUfjT9IorQ
 0SVIhvq5PhVAITXUD5fD7/N8B4TYegmHFRo1UaaKSnSHwlJJkzKpeWOH8QTYrP0RHxX86Obv
 IZuwbAo3F3oojcvLJt9NxWnbEmEALkleklLZnukgu7q5Wp1VDwhUbMFTLb6qmnBa/Xi30uOk
 0l1TMHDbeQswvQDOZBAMukSRqyBetKxQ3iTfZ/3z1ubQRcVDbVlMDScSHQq0LK3F9yMOMM/6
 0QPqJjl13xn/+Bn7WJiAIXXwzAV7uo6i0khFfjDtCDQ40aeffqOLxp1yMLkc3EKJGcQ5F6O2
 ycEf4QXCYUbMXjxB0EJB8y7z+xOi5Mmd/pPlVmZ2gQK84NAL90p7n7jRlyf3gOUY+JOl4c5e
 UFiIhOzmuqNrvPOiZ02GXh6SGUU5y7IgSoIKvXSFgHAn2OG/tcspBmkyv6IuNVpmbmEgYn4I
 Rnt40UXVQkxTh0dENFhk2cjunMYozV/OqYCgmZLFSeJd8kAo4yn+yOtNABEBAAHCwWUEGAEI
 AA8FAlnlUP4CGwwFCQlmAYAACgkQ7ou0mfRW5/nNcg//R63cbOS6zLtvdnPub3Ssp1Ft8Wmv
 mni+kccuNApuDV7d63QckYxjAfUv2zYMLpbh87gVbLyCq9ASn552EbfRhTvHdk44CgbHBVcI
 ZBEdZWgRR5ViJakQSYHpP2e5AGNFnx9gSIuRTaa5rvZM+4xeoZ2vJiq93TtaYPr7UFNfK+c4
 vv4C66lkt9l95/I10eSc3RqbOKZW47emlg4X3ygEoB9k2lPrpspyf6sUuSEi0WrlSxoLAr6p
 JG8rTUErYNeXe6JCdL31odDx1Dh5sdKIj2RicUYZNilxu9f1M7jZwf2ra1FGAlKj2ybqmgpZ
 EFteaiCinEYsvDyZyOiWHjAFI+RZIPQQL3AnVp4l7wYD3r9hnqYPww0slyMDcb9262RoFkHq
 dDwxPYarrNjWUpOzxB6bFxOgNRdCTgvQl8Ftk8a/yXB6vHeUSm1vPFCBxQPZytyfOLhEWm0J
 /mkVL0Z6iRK3p1LKnpLYCS4/esL2u7RrhPyCs2SsL58YcQF/g+PpeT9geZ+oyZ/4IQ+TWJoU
 PNHndk8VBTpzrmOaJxrebNL/W6C8JCmbLM11TAUMmHYi9JDytN8Au78hWpDbIdKwg1LeSxpw
 ZZD/OqOc0DBvHOpQhzkSrtR1lVlDV/+9E8J1T4uDhrGmZwYV+4xQetypHax8aAHisYbjXdVa
 8CS2NxU=
Message-ID: <bd70ed1a-14a3-9443-7adc-c71c839f7ebc@gmail.com>
Date: Thu, 8 Oct 2020 15:31:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sruO3OfF15ZdsMs4TyON9_RedtN0-a8mCux7z1cPv8t+Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 10/8/20 1:20 PM, Khem Raj wrote:
> On Thu, Oct 8, 2020 at 12:43 PM akuster <akuster808@gmail.com> wrote:
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  .../recipes-devtools/musl/musl-nscd_git.bb    | 37 +++++++++++++++++++
>>  1 file changed, 37 insertions(+)
>>  create mode 100644 meta-oe/recipes-devtools/musl/musl-nscd_git.bb
>>
>> diff --git a/meta-oe/recipes-devtools/musl/musl-nscd_git.bb b/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
>> new file mode 100644
>> index 0000000000..50df6706fc
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
>> @@ -0,0 +1,37 @@
>> +# Copyright (C) 2020 Armin Kuster <akuster808@gmail.com>
>> +# Released under the MIT license (see COPYING.MIT for the terms)
>> +
>> +DESCRIPTION = "Musl-nscd is an implementation of the NSCD protocol, suitable for use with musl and with standard NSS modules"
>> +HOMEPAGE = "https://github.com/pikhq/musl-nscd"
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=9bf479a145bcaff8489e743da58afeee"
>> +SECTION = "utils"
>> +
>> +PV = "1.0.2"
>> +
>> +CFLAGS += "-fcommon"
>> +
>> +SRCREV = "8f278675e1b6a3a02c8ee1b8ca000f80570dc5d6"
>> +SRC_URI = "git://github.com/pikhq/musl-nscd"
>> +
>> +UPSTREAM_CHECK_COMMITS = "1"
>> +
>> +inherit autotools-brokensep
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +do_configure () {
>> +    ${S}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
>> +}
>> +
>> +do_compile () {
>> +    oe_runmake
>> +}
>> +
>> +do_install () {
>> +    make DESTDIR=${D} install
>> +}
>> +
>> +INSANE_SKIP_${PN} = "already-stripped"
> If you remove
>
> LDFLAGS = -s
> from config.mak.dist then you won't need to skip this error.

Sure, but I like skipping. its faster than walking.

Ill send V2.

-armin
>
>> +
>> +COMPATIBLE_HOST = ".*-musl.*"
>> --
>> 2.17.1
>>
>>
>> 
>>

