Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web11.737.1587776710449484108
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Apr 2020 18:05:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NN4cvDFt;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id a32so4598514pje.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2020 18:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:references:from:autocrypt:organization:subject:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=CjWOoFcj1WHuhl7isOqJiHGenVC2h8CwRPL/AIEZxQw=;
        b=NN4cvDFtmiW6vg7YeE4NM0EsZzRihp04pAivIb/zfPxdSdc1p9u+2yrMBJcYBMnncr
         1iyQCGO1xsYVgIIHeDjQOwpwJPx3rlAHMkov6FKUv2/R9JLAmQfSLLk9/rc/xL8DRVH6
         t440XLnsEWpy9Zvhj9UjVTg2QVsjf7g5ixEK+ybeiVsx6n2rUxdAzVNmGY//4kOwW5S8
         Q7qTbZvbBh5V6xWRgUbg1+/nVwvvghNAQSNMInsiV75g1g7L8Q608HfTcivJs6qO23i1
         V6LYgAHPR5RHw2jcwQ8cIsyjyh+uhRKFSS2EntHvWWJpSODqjwdw1eAbcwZgTrjn7hDt
         h+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:references:from:autocrypt:organization
         :subject:message-id:date:user-agent:mime-version:in-reply-to;
        bh=CjWOoFcj1WHuhl7isOqJiHGenVC2h8CwRPL/AIEZxQw=;
        b=pY3fywi0WjHX3GQpZkPCuPDvmV2yd49U+ebNlQ7DJJin4Pe4BLJCSgADh3kBOTP+Wm
         /cUSIkzOcLjf7Vr0SjxU+eP7OsaYmhNLLu1Dek/hPXYpBpGHtm5Ix9hfpJ3O2tOSB1xe
         VtclaxdSJgquALDpy1ZpmGuyuHpCx2G9nW5vwWmRXm+UlzwwkfZXv212amOrRdLb9HmO
         F1Q/ELRrcoUqaxvpmM0iJ8juUnHQFfoR1F+TM1ZCyZ37s/VYJz/UYXkGclnkzpMM+M8R
         75bR2gyT0qCRf3TKzeybZQT8dhYLo8G+K2km42yQCYB+iqFNgvSy9wYi5Xqg7Ye81PoR
         8wIg==
X-Gm-Message-State: AGi0PuaVMdxLXAvmtPB7Uilylc9XURoGJOTP7lk1V4kpkuZaMtN+/mXK
	VQiygUa1wIKhMyTft5ykH9iPsp9gud0=
X-Google-Smtp-Source: APiQypIcKRn/hlxKtVY4jLem/ZNWVJWpq9YMMwkE0RHrM/d7JRYuPuwvchNjXFoXrEFUY1/H4CUKdA==
X-Received: by 2002:a17:902:b598:: with SMTP id a24mr12016919pls.63.1587776709424;
        Fri, 24 Apr 2020 18:05:09 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::ac76? ([2601:646:9200:4e0::ac76])
        by smtp.gmail.com with ESMTPSA id b8sm6686945pft.11.2020.04.24.18.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2020 18:05:08 -0700 (PDT)
To: Alistair <alistair@alistair23.me>,
 openembedded-devel@lists.openembedded.org
References: <20200424063130.386675-1-alistair@alistair23.me>
 <CAMKF1srb+fSYRjhBjmA+dH7HN_M+rckXJj+f5y0T8JPn4fQ1hQ@mail.gmail.com>
 <ee033791-f139-45a9-b8b4-4cbd68962744@www.fastmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Organization: HIMVIS LLC
Subject: Re: [oe] [PATCH] libgit2: Update to v1.0.0
Message-ID: <620ca6fb-ba03-0e57-aa7b-6d25e490a616@gmail.com>
Date: Fri, 24 Apr 2020 18:04:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <ee033791-f139-45a9-b8b4-4cbd68962744@www.fastmail.com>
X-Groupsio-MsgNum: 84074
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="v9NFLZnYOWQcT2KVoM8nqu6SkNxKajgUB"

--v9NFLZnYOWQcT2KVoM8nqu6SkNxKajgUB
Content-Type: multipart/mixed; boundary="Khggb85rkYN0OrGa9Cx55zDnO67sACr4D";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Alistair <alistair@alistair23.me>,
 openembedded-devel@lists.openembedded.org
Message-ID: <620ca6fb-ba03-0e57-aa7b-6d25e490a616@gmail.com>
Subject: Re: [oe] [PATCH] libgit2: Update to v1.0.0
References: <20200424063130.386675-1-alistair@alistair23.me>
 <CAMKF1srb+fSYRjhBjmA+dH7HN_M+rckXJj+f5y0T8JPn4fQ1hQ@mail.gmail.com>
 <ee033791-f139-45a9-b8b4-4cbd68962744@www.fastmail.com>
In-Reply-To: <ee033791-f139-45a9-b8b4-4cbd68962744@www.fastmail.com>

--Khggb85rkYN0OrGa9Cx55zDnO67sACr4D
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 4/24/20 5:39 PM, Alistair wrote:
> On Fri, Apr 24, 2020, at 2:16 PM, Khem Raj wrote:
>> This update has some issues
>>
>> Fails on qemux86/clang
>> https://errors.yoctoproject.org/Errors/Details/407382/
>=20
> I tried to reproduce this with:
>=20
> MACHINE=3Dqemux86 TOOLCHAIN=3D"clang"  bitbake libgit2

I think you need meta-clang in layer mix. and then set TOOLCHAIN =3D
"clang" in local.conf, I will try to see as well, it seems its finding a
library in native sysroot :( which should otherwise be in target sysroot

and the reason is that its happily adding libraries in linker cmdline.
So something is in CMakefile which is not differentiating native sysroot
from target sysroot.

-Wl,-rpath,TOPDIR/build/tmp/work/core2-32-yoe-linux/libgit2/1.0.0-r0/recip=
e-sysroot-native/usr/lib
...

TOPDIR/build/tmp/work/core2-32-yoe-linux/libgit2/1.0.0-r0/recipe-sysroot-n=
ative/usr/lib/libpcre.so
 TOPDIR/build/tmp/work/core2-32-yoe-linux/libgit2/1.0.0-r0/recipe-sysroot-=
native/usr/lib/libpcreposix.so

...


core2-32-yoe-linux/libgit2/1.0.0-r0/recipe-sysroot-native/usr/lib/libpcre.=
so:
error adding symbols: file in wrong format

>=20
> but it build for me. What am I missing?
>=20
>>
>> for glibc/musl there is another failure which is caused by this
>>
>> https://errors.yoctoproject.org/Errors/Details/407386/
>=20
> I have a patch for this. I'll send it out with v2.
>=20

OK

> Alistair
>=20
>>
>> On Thu, Apr 23, 2020 at 11:31 PM Alistair <alistair@alistair23.me> wrot=
e:
>>>
>>> Signed-off-by: Alistair Francis <alistair@alistair23.me>
>>> ---
>>> .../libgit2/{libgit2_0.28.4.bb =3D> libgit2_1.0.0.bb} | 6 +++---
>>> 1 file changed, 3 insertions(+), 3 deletions(-)
>>> rename meta-oe/recipes-support/libgit2/{libgit2_0.28.4.bb =3D> libgit2=
_1.0.0.bb} (64%)
>>>
>>> diff --git a/meta-oe/recipes-support/libgit2/libgit2_0.28.4.bb b/meta-=
oe/recipes-support/libgit2/libgit2_1.0.0.bb
>>> similarity index 64%
>>> rename from meta-oe/recipes-support/libgit2/libgit2_0.28.4.bb
>>> rename to meta-oe/recipes-support/libgit2/libgit2_1.0.0.bb
>>> index 9b9c19104..fd26a0fe9 100644
>>> --- a/meta-oe/recipes-support/libgit2/libgit2_0.28.4.bb
>>> +++ b/meta-oe/recipes-support/libgit2/libgit2_1.0.0.bb
>>> @@ -1,12 +1,12 @@
>>> SUMMARY =3D "the Git linkable library"
>>> HOMEPAGE =3D "http://libgit2.github.com/"
>>> LICENSE =3D "GPL-2.0-with-GCC-exception & MIT"
>>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3f2cd5d3cccd71d62066ba6196=
14592b"
>>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5b002a195fb7ea2d8d583f07ea=
ff3a8e"
>>>
>>> DEPENDS =3D "curl openssl zlib libssh2 libgcrypt"
>>>
>>> -SRC_URI =3D "git://github.com/libgit2/libgit2.git;branch=3Dmaint/v0.2=
8"
>>> -SRCREV =3D "106a5f27586504ea371528191f0ea3aac2ad432b"
>>> +SRC_URI =3D "git://github.com/libgit2/libgit2.git;branch=3Dmaint/v1.0=
"
>>> +SRCREV =3D "7d3c7057f0e774aecd6fc4ef8333e69e5c4873e0"
>>>
>>> S =3D "${WORKDIR}/git"
>>>
>>> --
>>> 2.26.0
>>>
>>>
>>
>>
>>
>>
>>=20


--Khggb85rkYN0OrGa9Cx55zDnO67sACr4D--

--v9NFLZnYOWQcT2KVoM8nqu6SkNxKajgUB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCXqOMvgAKCRC7BTNVkZ0z
FOwiAJ40BKpynoCp1cbjTe3vjnAbyCxuVACggqIy2su6rmDfmYkjH6TwW6AI5zY=
=pX3u
-----END PGP SIGNATURE-----

--v9NFLZnYOWQcT2KVoM8nqu6SkNxKajgUB--
