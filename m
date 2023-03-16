Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E737C76195
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 15:14:58 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.14813.1678979694087447383
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Mar 2023 08:14:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kBZQ7ClN;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id s8so2536178lfr.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Mar 2023 08:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678979692;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KDy5pY9jhsWYdzwE0w53bw2I4nfr6JiyQ3xJtTX5tNU=;
        b=kBZQ7ClNJ1+poAjFm3nr3jpiNTi/JdRftwbf9E/e4kAzTVWmGsUGkN/NPpdQ4RC+ft
         MiZUQfaPK+VXYClRmNOryVLKHsj0QVuELd6ZCrMTpwjoxnuInEjBpUqgV6OVlhhTVo7u
         +2B0tUwefBCSahqtdz9JVaM0NTrnV71S7eUUgmujtrQJsoDtDwDpab+c16mYP8HZCNkk
         Kpgu5sjF0xV/cCoJ5SSs6tnm/xAynA37mamJpEwL6dZQUu4Fcs+MBp3gckb5vZ7rPpcZ
         IejY0XWDte3NdxR6pgysee62V6Puy+C+pASGGdLDGiC+6+yuZl+T6bdCnkOHF9x0ddw8
         sbBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678979692;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KDy5pY9jhsWYdzwE0w53bw2I4nfr6JiyQ3xJtTX5tNU=;
        b=j8NJG81a60OSeFUtMkxOoLR4kkQJQHQ5R4S8pDzjms5ay94T8dkSaHB9rCVioqOwiV
         e9LMhkS7P8blQNAeGzFm1ZS0K/f5bXJBQaj3we6h6SvLB0L36TpMj003QG+vu5Dm+Tgj
         EGVsrvyA58XQ10YjtaIOHXQWefiHmkT22KdAjwf6IwB10eg/oxkhKmnK/Wm0BcGGl1kZ
         Qc20Hv/xp7cKlJIH3eKwNzlR3kmJDr0uheymsaqMKjYtr4I5l+Kcvw+P+9jjdUjjyvzB
         2rpR0rBdeSOfar/BX6KXZ8OY8D5WoLWrwPQL/WLjFVi7+GIf+B9wbMPzsFp+t0wZ/UUU
         jdUw==
X-Gm-Message-State: AO0yUKW5+9pZ0jCWD9MS2PHn2pi9UsrkX5ZJKZf7M2QSAVGYz+PIg1Yd
	C0+DLFzNamhrGsLI/UmtGF2/eaQiXlWEGTMnpz4=
X-Google-Smtp-Source: AK7set+isYE+JC05NGqZ+wzpJ4+u9a5sJj3bX2gdROOQJPAVafBEnisZrdHGabRW3HjNH5QudbeDhr1pffswWg3+6cA=
X-Received: by 2002:a19:ee15:0:b0:4d5:ca32:7bc5 with SMTP id
 g21-20020a19ee15000000b004d5ca327bc5mr3318603lfb.12.1678979691798; Thu, 16
 Mar 2023 08:14:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230316122544.29943-1-frederic.martinsons@gmail.com> <CANx9H-AzujWhqSEg=C0VPmqzj6ArFUp0nwnCUd07r9x1RmxVHQ@mail.gmail.com>
In-Reply-To: <CANx9H-AzujWhqSEg=C0VPmqzj6ArFUp0nwnCUd07r9x1RmxVHQ@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Thu, 16 Mar 2023 16:14:39 +0100
Message-ID: <CA+cAkeqkVnTYpacMru5bt+=DhB50iHpC7J9fjfBwcnHAXDNhqw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pyruvate: Add crates checksum
 and use cargo-update-recipes-crates
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001d643e05f705ecde"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Mar 2023 15:14:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101579

--0000000000001d643e05f705ecde
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I could try that of course, will keep you posted soon about a new patch
version
that includes the git:// fetcher.

On Thu, 16 Mar 2023 at 16:00, Tim Orling <ticotimo@gmail.com> wrote:

>
>
> On Thu, Mar 16, 2023 at 5:25=E2=80=AFAM Frederic Martinsons <
> frederic.martinsons@gmail.com> wrote:
>
>> From: Frederic Martinsons <frederic.martinsons@gmail.com>
>>
>> This is related to checksum verification introduction in bitbake
>> crate fetcher:
>>
>> https://patchwork.yoctoproject.org/project/bitbake/patch/20230315131513.=
50635-1-frederic.martinsons@gmail.com/
>>
>> Thank you for modernizing the recipe. It is appreciated.
>
>
>> Moreover, the Cargo.lock file that is needed to update these
>> checksum is not present in pypi repo but is inside the git repo.
>> So install the Cargo.lock by ourself, the file was downloaded
>> at https://gitlab.com/tschorr/pyruvate/-/tree/1.1.2
>>
>>
> We could also switch to the git:// fetcher, which might make it easier to
> upgrade in the future.
>
>
>> Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
>> ---
>>  .../python/python3-pyruvate-crates.inc        | 184 ++++
>>  .../python/python3-pyruvate/Cargo.lock        | 841 ++++++++++++++++++
>>  .../python/python3-pyruvate_1.1.2.bb          | 105 +--
>>  3 files changed, 1036 insertions(+), 94 deletions(-)
>>  create mode 100644
>> meta-python/recipes-devtools/python/python3-pyruvate-crates.inc
>>  create mode 100644
>> meta-python/recipes-devtools/python/python3-pyruvate/Cargo.lock
>>
>> diff --git
>> a/meta-python/recipes-devtools/python/python3-pyruvate-crates.inc
>> b/meta-python/recipes-devtools/python/python3-pyruvate-crates.inc
>> new file mode 100644
>> index 000000000..52fb9d457
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-pyruvate-crates.inc
>> @@ -0,0 +1,184 @@
>> +# Autogenerated with 'bitbake -c update_crates python3-pyruvate'
>> +
>> +# from Cargo.lock
>> +SRC_URI +=3D " \
>> +    crate://crates.io/aho-corasick/0.7.18 \
>> +    crate://crates.io/atty/0.2.14 \
>> +    crate://crates.io/autocfg/1.0.1 \
>> +    crate://crates.io/bitflags/1.3.2 \
>> +    crate://crates.io/block-buffer/0.9.0 \
>> +    crate://crates.io/cc/1.0.72 \
>> +    crate://crates.io/cfg-if/1.0.0 \
>> +    crate://crates.io/chrono/0.4.19 \
>> +    crate://crates.io/cpufeatures/0.2.1 \
>> +    crate://crates.io/cpython/0.7.0 \
>> +    crate://crates.io/crossbeam/0.8.1 \
>> +    crate://crates.io/crossbeam-channel/0.5.2 \
>> +    crate://crates.io/crossbeam-deque/0.8.1 \
>> +    crate://crates.io/crossbeam-epoch/0.9.6 \
>> +    crate://crates.io/crossbeam-queue/0.3.3 \
>> +    crate://crates.io/crossbeam-utils/0.8.6 \
>> +    crate://crates.io/crypto-mac/0.11.1 \
>> +    crate://crates.io/ctrlc/3.2.1 \
>> +    crate://crates.io/digest/0.9.0 \
>> +    crate://crates.io/encoding/0.2.33 \
>> +    crate://crates.io/encoding-index-japanese/1.20141219.5 \
>> +    crate://crates.io/encoding-index-korean/1.20141219.5 \
>> +    crate://crates.io/encoding-index-simpchinese/1.20141219.5 \
>> +    crate://crates.io/encoding-index-singlebyte/1.20141219.5 \
>> +    crate://crates.io/encoding-index-tradchinese/1.20141219.5 \
>> +    crate://crates.io/encoding_index_tests/0.1.4 \
>> +    crate://crates.io/env_logger/0.9.0 \
>> +    crate://crates.io/errno/0.2.8 \
>> +    crate://crates.io/errno-dragonfly/0.1.2 \
>> +    crate://crates.io/fastrand/1.6.0 \
>> +    crate://crates.io/generic-array/0.14.5 \
>> +    crate://crates.io/getrandom/0.2.3 \
>> +    crate://crates.io/hermit-abi/0.1.19 \
>> +    crate://crates.io/hmac/0.11.0 \
>> +    crate://crates.io/httparse/1.5.1 \
>> +    crate://crates.io/humantime/2.1.0 \
>> +    crate://crates.io/instant/0.1.12 \
>> +    crate://crates.io/lazy_static/1.4.0 \
>> +    crate://crates.io/libc/0.2.112 \
>> +    crate://crates.io/libsystemd/0.4.1 \
>> +    crate://crates.io/log/0.4.14 \
>> +    crate://crates.io/memchr/2.4.1 \
>> +    crate://crates.io/memoffset/0.6.5 \
>> +    crate://crates.io/mio/0.8.0 \
>> +    crate://crates.io/miow/0.3.7 \
>> +    crate://crates.io/nix/0.23.1 \
>> +    crate://crates.io/ntapi/0.3.6 \
>> +    crate://crates.io/num-integer/0.1.44 \
>> +    crate://crates.io/num-traits/0.2.14 \
>> +    crate://crates.io/num_cpus/1.13.1 \
>> +    crate://crates.io/once_cell/1.9.0 \
>> +    crate://crates.io/opaque-debug/0.3.0 \
>> +    crate://crates.io/paste/1.0.6 \
>> +    crate://crates.io/ppv-lite86/0.2.16 \
>> +    crate://crates.io/proc-macro2/1.0.36 \
>> +    crate://crates.io/python3-sys/0.7.0 \
>> +    crate://crates.io/quote/1.0.14 \
>> +    crate://crates.io/rand/0.8.4 \
>> +    crate://crates.io/rand_chacha/0.3.1 \
>> +    crate://crates.io/rand_core/0.6.3 \
>> +    crate://crates.io/rand_hc/0.3.1 \
>> +    crate://crates.io/redox_syscall/0.2.10 \
>> +    crate://crates.io/regex/1.5.4 \
>> +    crate://crates.io/regex-syntax/0.6.25 \
>> +    crate://crates.io/remove_dir_all/0.5.3 \
>> +    crate://crates.io/scopeguard/1.1.0 \
>> +    crate://crates.io/serde/1.0.133 \
>> +    crate://crates.io/serde_derive/1.0.133 \
>> +    crate://crates.io/sha2/0.9.9 \
>> +    crate://crates.io/simplelog/0.11.1 \
>> +    crate://crates.io/spmc/0.3.0 \
>> +    crate://crates.io/subtle/2.4.1 \
>> +    crate://crates.io/syn/1.0.85 \
>> +    crate://crates.io/tempfile/3.3.0 \
>> +    crate://crates.io/termcolor/1.1.2 \
>> +    crate://crates.io/thiserror/1.0.30 \
>> +    crate://crates.io/thiserror-impl/1.0.30 \
>> +    crate://crates.io/threadpool/1.8.1 \
>> +    crate://crates.io/time/0.1.44 \
>> +    crate://crates.io/typenum/1.15.0 \
>> +    crate://crates.io/unicode-xid/0.2.2 \
>> +    crate://crates.io/urlencoding/2.1.0 \
>> +    crate://crates.io/uuid/0.8.2 \
>> +    crate://crates.io/version_check/0.9.4 \
>> +    crate://crates.io/wasi/0.10.0+wasi-snapshot-preview1 \
>> +    crate://crates.io/winapi/0.3.9 \
>> +    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
>> +    crate://crates.io/winapi-util/0.1.5 \
>> +    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
>> +"
>> +
>> +SRC_URI[aho-corasick.sha256sum] =3D
>> "1e37cfd5e7657ada45f742d6e99ca5788580b5c529dc78faf11ece6dc702656f"
>> +SRC_URI[atty.sha256sum] =3D
>> "d9b39be18770d11421cdb1b9947a45dd3f37e93092cbf377614828a319d5fee8"
>> +SRC_URI[autocfg.sha256sum] =3D
>> "cdb031dd78e28731d87d56cc8ffef4a8f36ca26c38fe2de700543e627f8a464a"
>> +SRC_URI[bitflags.sha256sum] =3D
>> "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
>> +SRC_URI[block-buffer.sha256sum] =3D
>> "4152116fd6e9dadb291ae18fc1ec3575ed6d84c29642d97890f4b4a3417297e4"
>> +SRC_URI[cc.sha256sum] =3D
>> "22a9137b95ea06864e018375b72adfb7db6e6f68cfc8df5a04d00288050485ee"
>> +SRC_URI[cfg-if.sha256sum] =3D
>> "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
>> +SRC_URI[chrono.sha256sum] =3D
>> "670ad68c9088c2a963aaa298cb369688cf3f9465ce5e2d4ca10e6e0098a1ce73"
>> +SRC_URI[cpufeatures.sha256sum] =3D
>> "95059428f66df56b63431fdb4e1947ed2190586af5c5a8a8b71122bdf5a7f469"
>> +SRC_URI[cpython.sha256sum] =3D
>> "b7d46ba8ace7f3a1d204ac5060a706d0a68de6b42eafb6a586cc08bebcffe664"
>> +SRC_URI[crossbeam.sha256sum] =3D
>> "4ae5588f6b3c3cb05239e90bd110f257254aecd01e4635400391aeae07497845"
>> +SRC_URI[crossbeam-channel.sha256sum] =3D
>> "e54ea8bc3fb1ee042f5aace6e3c6e025d3874866da222930f70ce62aceba0bfa"
>> +SRC_URI[crossbeam-deque.sha256sum] =3D
>> "6455c0ca19f0d2fbf751b908d5c55c1f5cbc65e03c4225427254b46890bdde1e"
>> +SRC_URI[crossbeam-epoch.sha256sum] =3D
>> "97242a70df9b89a65d0b6df3c4bf5b9ce03c5b7309019777fbde37e7537f8762"
>> +SRC_URI[crossbeam-queue.sha256sum] =3D
>> "b979d76c9fcb84dffc80a73f7290da0f83e4c95773494674cb44b76d13a7a110"
>> +SRC_URI[crossbeam-utils.sha256sum] =3D
>> "cfcae03edb34f947e64acdb1c33ec169824e20657e9ecb61cef6c8c74dcb8120"
>> +SRC_URI[crypto-mac.sha256sum] =3D
>> "b1d1a86f49236c215f271d40892d5fc950490551400b02ef360692c29815c714"
>> +SRC_URI[ctrlc.sha256sum] =3D
>> "a19c6cedffdc8c03a3346d723eb20bd85a13362bb96dc2ac000842c6381ec7bf"
>> +SRC_URI[digest.sha256sum] =3D
>> "d3dd60d1080a57a05ab032377049e0591415d2b31afd7028356dbf3cc6dcb066"
>> +SRC_URI[encoding.sha256sum] =3D
>> "6b0d943856b990d12d3b55b359144ff341533e516d94098b1d3fc1ac666d36ec"
>> +SRC_URI[encoding-index-japanese.sha256sum] =3D
>> "04e8b2ff42e9a05335dbf8b5c6f7567e5591d0d916ccef4e0b1710d32a0d0c91"
>> +SRC_URI[encoding-index-korean.sha256sum] =3D
>> "4dc33fb8e6bcba213fe2f14275f0963fd16f0a02c878e3095ecfdf5bee529d81"
>> +SRC_URI[encoding-index-simpchinese.sha256sum] =3D
>> "d87a7194909b9118fc707194baa434a4e3b0fb6a5a757c73c3adb07aa25031f7"
>> +SRC_URI[encoding-index-singlebyte.sha256sum] =3D
>> "3351d5acffb224af9ca265f435b859c7c01537c0849754d3db3fdf2bfe2ae84a"
>> +SRC_URI[encoding-index-tradchinese.sha256sum] =3D
>> "fd0e20d5688ce3cab59eb3ef3a2083a5c77bf496cb798dc6fcdb75f323890c18"
>> +SRC_URI[encoding_index_tests.sha256sum] =3D
>> "a246d82be1c9d791c5dfde9a2bd045fc3cbba3fa2b11ad558f27d01712f00569"
>> +SRC_URI[env_logger.sha256sum] =3D
>> "0b2cf0344971ee6c64c31be0d530793fba457d322dfec2810c453d0ef228f9c3"
>> +SRC_URI[errno.sha256sum] =3D
>> "f639046355ee4f37944e44f60642c6f3a7efa3cf6b78c78a0d989a8ce6c396a1"
>> +SRC_URI[errno-dragonfly.sha256sum] =3D
>> "aa68f1b12764fab894d2755d2518754e71b4fd80ecfb822714a1206c2aab39bf"
>> +SRC_URI[fastrand.sha256sum] =3D
>> "779d043b6a0b90cc4c0ed7ee380a6504394cee7efd7db050e3774eee387324b2"
>> +SRC_URI[generic-array.sha256sum] =3D
>> "fd48d33ec7f05fbfa152300fdad764757cbded343c1aa1cff2fbaf4134851803"
>> +SRC_URI[getrandom.sha256sum] =3D
>> "7fcd999463524c52659517fe2cea98493cfe485d10565e7b0fb07dbba7ad2753"
>> +SRC_URI[hermit-abi.sha256sum] =3D
>> "62b467343b94ba476dcb2500d242dadbb39557df889310ac77c5d99100aaac33"
>> +SRC_URI[hmac.sha256sum] =3D
>> "2a2a2320eb7ec0ebe8da8f744d7812d9fc4cb4d09344ac01898dbcb6a20ae69b"
>> +SRC_URI[httparse.sha256sum] =3D
>> "acd94fdbe1d4ff688b67b04eee2e17bd50995534a61539e45adfefb45e5e5503"
>> +SRC_URI[humantime.sha256sum] =3D
>> "9a3a5bfb195931eeb336b2a7b4d761daec841b97f947d34394601737a7bba5e4"
>> +SRC_URI[instant.sha256sum] =3D
>> "7a5bbe824c507c5da5956355e86a746d82e0e1464f65d862cc5e71da70e94b2c"
>> +SRC_URI[lazy_static.sha256sum] =3D
>> "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646"
>> +SRC_URI[libc.sha256sum] =3D
>> "1b03d17f364a3a042d5e5d46b053bbbf82c92c9430c592dd4c064dc6ee997125"
>> +SRC_URI[libsystemd.sha256sum] =3D
>> "6f4f0b5b062ba67aa075e331de778082c09e66b5ef32970ea5a1e9c37c9555d1"
>> +SRC_URI[log.sha256sum] =3D
>> "51b9bbe6c47d51fc3e1a9b945965946b4c44142ab8792c50835a980d362c2710"
>> +SRC_URI[memchr.sha256sum] =3D
>> "308cc39be01b73d0d18f82a0e7b2a3df85245f84af96fdddc5d202d27e47b86a"
>> +SRC_URI[memoffset.sha256sum] =3D
>> "5aa361d4faea93603064a027415f07bd8e1d5c88c9fbf68bf56a285428fd79ce"
>> +SRC_URI[mio.sha256sum] =3D
>> "ba272f85fa0b41fc91872be579b3bbe0f56b792aa361a380eb669469f68dafb2"
>> +SRC_URI[miow.sha256sum] =3D
>> "b9f1c5b025cda876f66ef43a113f91ebc9f4ccef34843000e0adf6ebbab84e21"
>> +SRC_URI[nix.sha256sum] =3D
>> "9f866317acbd3a240710c63f065ffb1e4fd466259045ccb504130b7f668f35c6"
>> +SRC_URI[ntapi.sha256sum] =3D
>> "3f6bb902e437b6d86e03cce10a7e2af662292c5dfef23b65899ea3ac9354ad44"
>> +SRC_URI[num-integer.sha256sum] =3D
>> "d2cc698a63b549a70bc047073d2949cce27cd1c7b0a4a862d08a8031bc2801db"
>> +SRC_URI[num-traits.sha256sum] =3D
>> "9a64b1ec5cda2586e284722486d802acf1f7dbdc623e2bfc57e65ca1cd099290"
>> +SRC_URI[num_cpus.sha256sum] =3D
>> "19e64526ebdee182341572e50e9ad03965aa510cd94427a4549448f285e957a1"
>> +SRC_URI[once_cell.sha256sum] =3D
>> "da32515d9f6e6e489d7bc9d84c71b060db7247dc035bbe44eac88cf87486d8d5"
>> +SRC_URI[opaque-debug.sha256sum] =3D
>> "624a8340c38c1b80fd549087862da4ba43e08858af025b236e509b6649fc13d5"
>> +SRC_URI[paste.sha256sum] =3D
>> "0744126afe1a6dd7f394cb50a716dbe086cb06e255e53d8d0185d82828358fb5"
>> +SRC_URI[ppv-lite86.sha256sum] =3D
>> "eb9f9e6e233e5c4a35559a617bf40a4ec447db2e84c20b55a6f83167b7e57872"
>> +SRC_URI[proc-macro2.sha256sum] =3D
>> "c7342d5883fbccae1cc37a2353b09c87c9b0f3afd73f5fb9bba687a1f733b029"
>> +SRC_URI[python3-sys.sha256sum] =3D
>> "b18b32e64c103d5045f44644d7ddddd65336f7a0521f6fde673240a9ecceb77e"
>> +SRC_URI[quote.sha256sum] =3D
>> "47aa80447ce4daf1717500037052af176af5d38cc3e571d9ec1c7353fc10c87d"
>> +SRC_URI[rand.sha256sum] =3D
>> "2e7573632e6454cf6b99d7aac4ccca54be06da05aca2ef7423d22d27d4d4bcd8"
>> +SRC_URI[rand_chacha.sha256sum] =3D
>> "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
>> +SRC_URI[rand_core.sha256sum] =3D
>> "d34f1408f55294453790c48b2f1ebbb1c5b4b7563eb1f418bcfcfdbb06ebb4e7"
>> +SRC_URI[rand_hc.sha256sum] =3D
>> "d51e9f596de227fda2ea6c84607f5558e196eeaf43c986b724ba4fb8fdf497e7"
>> +SRC_URI[redox_syscall.sha256sum] =3D
>> "8383f39639269cde97d255a32bdb68c047337295414940c68bdd30c2e13203ff"
>> +SRC_URI[regex.sha256sum] =3D
>> "d07a8629359eb56f1e2fb1652bb04212c072a87ba68546a04065d525673ac461"
>> +SRC_URI[regex-syntax.sha256sum] =3D
>> "f497285884f3fcff424ffc933e56d7cbca511def0c9831a7f9b5f6153e3cc89b"
>> +SRC_URI[remove_dir_all.sha256sum] =3D
>> "3acd125665422973a33ac9d3dd2df85edad0f4ae9b00dafb1a05e43a9f5ef8e7"
>> +SRC_URI[scopeguard.sha256sum] =3D
>> "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd"
>> +SRC_URI[serde.sha256sum] =3D
>> "97565067517b60e2d1ea8b268e59ce036de907ac523ad83a0475da04e818989a"
>> +SRC_URI[serde_derive.sha256sum] =3D
>> "ed201699328568d8d08208fdd080e3ff594e6c422e438b6705905da01005d537"
>> +SRC_URI[sha2.sha256sum] =3D
>> "4d58a1e1bf39749807d89cf2d98ac2dfa0ff1cb3faa38fbb64dd88ac8013d800"
>> +SRC_URI[simplelog.sha256sum] =3D
>> "ecabc0118918611790b8615670ab79296272cbe09496b6884b02b1e929c20886"
>> +SRC_URI[spmc.sha256sum] =3D
>> "02a8428da277a8e3a15271d79943e80ccc2ef254e78813a166a08d65e4c3ece5"
>> +SRC_URI[subtle.sha256sum] =3D
>> "6bdef32e8150c2a081110b42772ffe7d7c9032b606bc226c8260fd97e0976601"
>> +SRC_URI[syn.sha256sum] =3D
>> "a684ac3dcd8913827e18cd09a68384ee66c1de24157e3c556c9ab16d85695fb7"
>> +SRC_URI[tempfile.sha256sum] =3D
>> "5cdb1ef4eaeeaddc8fbd371e5017057064af0911902ef36b39801f67cc6d79e4"
>> +SRC_URI[termcolor.sha256sum] =3D
>> "2dfed899f0eb03f32ee8c6a0aabdb8a7949659e3466561fc0adf54e26d88c5f4"
>> +SRC_URI[thiserror.sha256sum] =3D
>> "854babe52e4df1653706b98fcfc05843010039b406875930a70e4d9644e5c417"
>> +SRC_URI[thiserror-impl.sha256sum] =3D
>> "aa32fd3f627f367fe16f893e2597ae3c05020f8bba2666a4e6ea73d377e5714b"
>> +SRC_URI[threadpool.sha256sum] =3D
>> "d050e60b33d41c19108b32cea32164033a9013fe3b46cbd4457559bfbf77afaa"
>> +SRC_URI[time.sha256sum] =3D
>> "6db9e6914ab8b1ae1c260a4ae7a49b6c5611b40328a735b21862567685e73255"
>> +SRC_URI[typenum.sha256sum] =3D
>> "dcf81ac59edc17cc8697ff311e8f5ef2d99fcbd9817b34cec66f90b6c3dfd987"
>> +SRC_URI[unicode-xid.sha256sum] =3D
>> "8ccb82d61f80a663efe1f787a51b16b5a51e3314d6ac365b08639f52387b33f3"
>> +SRC_URI[urlencoding.sha256sum] =3D
>> "68b90931029ab9b034b300b797048cf23723400aa757e8a2bfb9d748102f9821"
>> +SRC_URI[uuid.sha256sum] =3D
>> "bc5cf98d8186244414c848017f0e2676b3fcb46807f6668a97dfe67359a3c4b7"
>> +SRC_URI[version_check.sha256sum] =3D
>> "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
>> +SRC_URI[wasi.sha256sum] =3D
>> "1a143597ca7c7793eff794def352d41792a93c481eb1042423ff7ff72ba2c31f"
>> +SRC_URI[winapi.sha256sum] =3D
>> "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
>> +SRC_URI[winapi-i686-pc-windows-gnu.sha256sum] =3D
>> "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
>> +SRC_URI[winapi-util.sha256sum] =3D
>> "70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e3ce5de178"
>> +SRC_URI[winapi-x86_64-pc-windows-gnu.sha256sum] =3D
>> "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
>> diff --git
>> a/meta-python/recipes-devtools/python/python3-pyruvate/Cargo.lock
>> b/meta-python/recipes-devtools/python/python3-pyruvate/Cargo.lock
>> new file mode 100644
>> index 000000000..82631c744
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-pyruvate/Cargo.lock
>> @@ -0,0 +1,841 @@
>> +# This file is automatically @generated by Cargo.
>> +# It is not intended for manual editing.
>> +version =3D 3
>> +
>> +[[package]]
>> +name =3D "aho-corasick"
>> +version =3D "0.7.18"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "1e37cfd5e7657ada45f742d6e99ca5788580b5c529dc78faf11ece6dc702656f"
>> +dependencies =3D [
>> + "memchr",
>> +]
>> +
>> +[[package]]
>> +name =3D "atty"
>> +version =3D "0.2.14"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "d9b39be18770d11421cdb1b9947a45dd3f37e93092cbf377614828a319d5fee8"
>> +dependencies =3D [
>> + "hermit-abi",
>> + "libc",
>> + "winapi",
>> +]
>> +
>> +[[package]]
>> +name =3D "autocfg"
>> +version =3D "1.0.1"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "cdb031dd78e28731d87d56cc8ffef4a8f36ca26c38fe2de700543e627f8a464a"
>> +
>> +[[package]]
>> +name =3D "bitflags"
>> +version =3D "1.3.2"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
>> +
>> +[[package]]
>> +name =3D "block-buffer"
>> +version =3D "0.9.0"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "4152116fd6e9dadb291ae18fc1ec3575ed6d84c29642d97890f4b4a3417297e4"
>> +dependencies =3D [
>> + "generic-array",
>> +]
>> +
>> +[[package]]
>> +name =3D "cc"
>> +version =3D "1.0.72"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "22a9137b95ea06864e018375b72adfb7db6e6f68cfc8df5a04d00288050485ee"
>> +
>> +[[package]]
>> +name =3D "cfg-if"
>> +version =3D "1.0.0"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
>> +
>> +[[package]]
>> +name =3D "chrono"
>> +version =3D "0.4.19"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "670ad68c9088c2a963aaa298cb369688cf3f9465ce5e2d4ca10e6e0098a1ce73"
>> +dependencies =3D [
>> + "libc",
>> + "num-integer",
>> + "num-traits",
>> + "time",
>> + "winapi",
>> +]
>> +
>> +[[package]]
>> +name =3D "cpufeatures"
>> +version =3D "0.2.1"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "95059428f66df56b63431fdb4e1947ed2190586af5c5a8a8b71122bdf5a7f469"
>> +dependencies =3D [
>> + "libc",
>> +]
>> +
>> +[[package]]
>> +name =3D "cpython"
>> +version =3D "0.7.0"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "b7d46ba8ace7f3a1d204ac5060a706d0a68de6b42eafb6a586cc08bebcffe664"
>> +dependencies =3D [
>> + "libc",
>> + "num-traits",
>> + "paste",
>> + "python3-sys",
>> +]
>> +
>> +[[package]]
>> +name =3D "crossbeam"
>> +version =3D "0.8.1"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "4ae5588f6b3c3cb05239e90bd110f257254aecd01e4635400391aeae07497845"
>> +dependencies =3D [
>> + "cfg-if",
>> + "crossbeam-channel",
>> + "crossbeam-deque",
>> + "crossbeam-epoch",
>> + "crossbeam-queue",
>> + "crossbeam-utils",
>> +]
>> +
>> +[[package]]
>> +name =3D "crossbeam-channel"
>> +version =3D "0.5.2"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "e54ea8bc3fb1ee042f5aace6e3c6e025d3874866da222930f70ce62aceba0bfa"
>> +dependencies =3D [
>> + "cfg-if",
>> + "crossbeam-utils",
>> +]
>> +
>> +[[package]]
>> +name =3D "crossbeam-deque"
>> +version =3D "0.8.1"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "6455c0ca19f0d2fbf751b908d5c55c1f5cbc65e03c4225427254b46890bdde1e"
>> +dependencies =3D [
>> + "cfg-if",
>> + "crossbeam-epoch",
>> + "crossbeam-utils",
>> +]
>> +
>> +[[package]]
>> +name =3D "crossbeam-epoch"
>> +version =3D "0.9.6"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "97242a70df9b89a65d0b6df3c4bf5b9ce03c5b7309019777fbde37e7537f8762"
>> +dependencies =3D [
>> + "cfg-if",
>> + "crossbeam-utils",
>> + "lazy_static",
>> + "memoffset",
>> + "scopeguard",
>> +]
>> +
>> +[[package]]
>> +name =3D "crossbeam-queue"
>> +version =3D "0.3.3"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "b979d76c9fcb84dffc80a73f7290da0f83e4c95773494674cb44b76d13a7a110"
>> +dependencies =3D [
>> + "cfg-if",
>> + "crossbeam-utils",
>> +]
>> +
>> +[[package]]
>> +name =3D "crossbeam-utils"
>> +version =3D "0.8.6"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "cfcae03edb34f947e64acdb1c33ec169824e20657e9ecb61cef6c8c74dcb8120"
>> +dependencies =3D [
>> + "cfg-if",
>> + "lazy_static",
>> +]
>> +
>> +[[package]]
>> +name =3D "crypto-mac"
>> +version =3D "0.11.1"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "b1d1a86f49236c215f271d40892d5fc950490551400b02ef360692c29815c714"
>> +dependencies =3D [
>> + "generic-array",
>> + "subtle",
>> +]
>> +
>> +[[package]]
>> +name =3D "ctrlc"
>> +version =3D "3.2.1"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "a19c6cedffdc8c03a3346d723eb20bd85a13362bb96dc2ac000842c6381ec7bf"
>> +dependencies =3D [
>> + "nix",
>> + "winapi",
>> +]
>> +
>> +[[package]]
>> +name =3D "digest"
>> +version =3D "0.9.0"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "d3dd60d1080a57a05ab032377049e0591415d2b31afd7028356dbf3cc6dcb066"
>> +dependencies =3D [
>> + "generic-array",
>> +]
>> +
>> +[[package]]
>> +name =3D "encoding"
>> +version =3D "0.2.33"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "6b0d943856b990d12d3b55b359144ff341533e516d94098b1d3fc1ac666d36ec"
>> +dependencies =3D [
>> + "encoding-index-japanese",
>> + "encoding-index-korean",
>> + "encoding-index-simpchinese",
>> + "encoding-index-singlebyte",
>> + "encoding-index-tradchinese",
>> +]
>> +
>> +[[package]]
>> +name =3D "encoding-index-japanese"
>> +version =3D "1.20141219.5"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "04e8b2ff42e9a05335dbf8b5c6f7567e5591d0d916ccef4e0b1710d32a0d0c91"
>> +dependencies =3D [
>> + "encoding_index_tests",
>> +]
>> +
>> +[[package]]
>> +name =3D "encoding-index-korean"
>> +version =3D "1.20141219.5"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "4dc33fb8e6bcba213fe2f14275f0963fd16f0a02c878e3095ecfdf5bee529d81"
>> +dependencies =3D [
>> + "encoding_index_tests",
>> +]
>> +
>> +[[package]]
>> +name =3D "encoding-index-simpchinese"
>> +version =3D "1.20141219.5"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "d87a7194909b9118fc707194baa434a4e3b0fb6a5a757c73c3adb07aa25031f7"
>> +dependencies =3D [
>> + "encoding_index_tests",
>> +]
>> +
>> +[[package]]
>> +name =3D "encoding-index-singlebyte"
>> +version =3D "1.20141219.5"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "3351d5acffb224af9ca265f435b859c7c01537c0849754d3db3fdf2bfe2ae84a"
>> +dependencies =3D [
>> + "encoding_index_tests",
>> +]
>> +
>> +[[package]]
>> +name =3D "encoding-index-tradchinese"
>> +version =3D "1.20141219.5"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "fd0e20d5688ce3cab59eb3ef3a2083a5c77bf496cb798dc6fcdb75f323890c18"
>> +dependencies =3D [
>> + "encoding_index_tests",
>> +]
>> +
>> +[[package]]
>> +name =3D "encoding_index_tests"
>> +version =3D "0.1.4"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "a246d82be1c9d791c5dfde9a2bd045fc3cbba3fa2b11ad558f27d01712f00569"
>> +
>> +[[package]]
>> +name =3D "env_logger"
>> +version =3D "0.9.0"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "0b2cf0344971ee6c64c31be0d530793fba457d322dfec2810c453d0ef228f9c3"
>> +dependencies =3D [
>> + "atty",
>> + "humantime",
>> + "log",
>> + "regex",
>> + "termcolor",
>> +]
>> +
>> +[[package]]
>> +name =3D "errno"
>> +version =3D "0.2.8"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "f639046355ee4f37944e44f60642c6f3a7efa3cf6b78c78a0d989a8ce6c396a1"
>> +dependencies =3D [
>> + "errno-dragonfly",
>> + "libc",
>> + "winapi",
>> +]
>> +
>> +[[package]]
>> +name =3D "errno-dragonfly"
>> +version =3D "0.1.2"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "aa68f1b12764fab894d2755d2518754e71b4fd80ecfb822714a1206c2aab39bf"
>> +dependencies =3D [
>> + "cc",
>> + "libc",
>> +]
>> +
>> +[[package]]
>> +name =3D "fastrand"
>> +version =3D "1.6.0"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "779d043b6a0b90cc4c0ed7ee380a6504394cee7efd7db050e3774eee387324b2"
>> +dependencies =3D [
>> + "instant",
>> +]
>> +
>> +[[package]]
>> +name =3D "generic-array"
>> +version =3D "0.14.5"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "fd48d33ec7f05fbfa152300fdad764757cbded343c1aa1cff2fbaf4134851803"
>> +dependencies =3D [
>> + "typenum",
>> + "version_check",
>> +]
>> +
>> +[[package]]
>> +name =3D "getrandom"
>> +version =3D "0.2.3"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "7fcd999463524c52659517fe2cea98493cfe485d10565e7b0fb07dbba7ad2753"
>> +dependencies =3D [
>> + "cfg-if",
>> + "libc",
>> + "wasi",
>> +]
>> +
>> +[[package]]
>> +name =3D "hermit-abi"
>> +version =3D "0.1.19"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "62b467343b94ba476dcb2500d242dadbb39557df889310ac77c5d99100aaac33"
>> +dependencies =3D [
>> + "libc",
>> +]
>> +
>> +[[package]]
>> +name =3D "hmac"
>> +version =3D "0.11.0"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "2a2a2320eb7ec0ebe8da8f744d7812d9fc4cb4d09344ac01898dbcb6a20ae69b"
>> +dependencies =3D [
>> + "crypto-mac",
>> + "digest",
>> +]
>> +
>> +[[package]]
>> +name =3D "httparse"
>> +version =3D "1.5.1"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "acd94fdbe1d4ff688b67b04eee2e17bd50995534a61539e45adfefb45e5e5503"
>> +
>> +[[package]]
>> +name =3D "humantime"
>> +version =3D "2.1.0"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "9a3a5bfb195931eeb336b2a7b4d761daec841b97f947d34394601737a7bba5e4"
>> +
>> +[[package]]
>> +name =3D "instant"
>> +version =3D "0.1.12"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "7a5bbe824c507c5da5956355e86a746d82e0e1464f65d862cc5e71da70e94b2c"
>> +dependencies =3D [
>> + "cfg-if",
>> +]
>> +
>> +[[package]]
>> +name =3D "lazy_static"
>> +version =3D "1.4.0"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646"
>> +
>> +[[package]]
>> +name =3D "libc"
>> +version =3D "0.2.112"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "1b03d17f364a3a042d5e5d46b053bbbf82c92c9430c592dd4c064dc6ee997125"
>> +
>> +[[package]]
>> +name =3D "libsystemd"
>> +version =3D "0.4.1"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "6f4f0b5b062ba67aa075e331de778082c09e66b5ef32970ea5a1e9c37c9555d1"
>> +dependencies =3D [
>> + "hmac",
>> + "libc",
>> + "log",
>> + "nix",
>> + "once_cell",
>> + "serde",
>> + "sha2",
>> + "thiserror",
>> + "uuid",
>> +]
>> +
>> +[[package]]
>> +name =3D "log"
>> +version =3D "0.4.14"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "51b9bbe6c47d51fc3e1a9b945965946b4c44142ab8792c50835a980d362c2710"
>> +dependencies =3D [
>> + "cfg-if",
>> +]
>> +
>> +[[package]]
>> +name =3D "memchr"
>> +version =3D "2.4.1"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "308cc39be01b73d0d18f82a0e7b2a3df85245f84af96fdddc5d202d27e47b86a"
>> +
>> +[[package]]
>> +name =3D "memoffset"
>> +version =3D "0.6.5"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "5aa361d4faea93603064a027415f07bd8e1d5c88c9fbf68bf56a285428fd79ce"
>> +dependencies =3D [
>> + "autocfg",
>> +]
>> +
>> +[[package]]
>> +name =3D "mio"
>> +version =3D "0.8.0"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "ba272f85fa0b41fc91872be579b3bbe0f56b792aa361a380eb669469f68dafb2"
>> +dependencies =3D [
>> + "libc",
>> + "log",
>> + "miow",
>> + "ntapi",
>> + "winapi",
>> +]
>> +
>> +[[package]]
>> +name =3D "miow"
>> +version =3D "0.3.7"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "b9f1c5b025cda876f66ef43a113f91ebc9f4ccef34843000e0adf6ebbab84e21"
>> +dependencies =3D [
>> + "winapi",
>> +]
>> +
>> +[[package]]
>> +name =3D "nix"
>> +version =3D "0.23.1"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "9f866317acbd3a240710c63f065ffb1e4fd466259045ccb504130b7f668f35c6"
>> +dependencies =3D [
>> + "bitflags",
>> + "cc",
>> + "cfg-if",
>> + "libc",
>> + "memoffset",
>> +]
>> +
>> +[[package]]
>> +name =3D "ntapi"
>> +version =3D "0.3.6"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "3f6bb902e437b6d86e03cce10a7e2af662292c5dfef23b65899ea3ac9354ad44"
>> +dependencies =3D [
>> + "winapi",
>> +]
>> +
>> +[[package]]
>> +name =3D "num-integer"
>> +version =3D "0.1.44"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "d2cc698a63b549a70bc047073d2949cce27cd1c7b0a4a862d08a8031bc2801db"
>> +dependencies =3D [
>> + "autocfg",
>> + "num-traits",
>> +]
>> +
>> +[[package]]
>> +name =3D "num-traits"
>> +version =3D "0.2.14"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "9a64b1ec5cda2586e284722486d802acf1f7dbdc623e2bfc57e65ca1cd099290"
>> +dependencies =3D [
>> + "autocfg",
>> +]
>> +
>> +[[package]]
>> +name =3D "num_cpus"
>> +version =3D "1.13.1"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "19e64526ebdee182341572e50e9ad03965aa510cd94427a4549448f285e957a1"
>> +dependencies =3D [
>> + "hermit-abi",
>> + "libc",
>> +]
>> +
>> +[[package]]
>> +name =3D "once_cell"
>> +version =3D "1.9.0"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "da32515d9f6e6e489d7bc9d84c71b060db7247dc035bbe44eac88cf87486d8d5"
>> +
>> +[[package]]
>> +name =3D "opaque-debug"
>> +version =3D "0.3.0"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "624a8340c38c1b80fd549087862da4ba43e08858af025b236e509b6649fc13d5"
>> +
>> +[[package]]
>> +name =3D "paste"
>> +version =3D "1.0.6"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "0744126afe1a6dd7f394cb50a716dbe086cb06e255e53d8d0185d82828358fb5"
>> +
>> +[[package]]
>> +name =3D "ppv-lite86"
>> +version =3D "0.2.16"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "eb9f9e6e233e5c4a35559a617bf40a4ec447db2e84c20b55a6f83167b7e57872"
>> +
>> +[[package]]
>> +name =3D "proc-macro2"
>> +version =3D "1.0.36"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "c7342d5883fbccae1cc37a2353b09c87c9b0f3afd73f5fb9bba687a1f733b029"
>> +dependencies =3D [
>> + "unicode-xid",
>> +]
>> +
>> +[[package]]
>> +name =3D "pyruvate"
>> +version =3D "1.1.2"
>> +dependencies =3D [
>> + "cfg-if",
>> + "cpython",
>> + "crossbeam",
>> + "crossbeam-channel",
>> + "ctrlc",
>> + "encoding",
>> + "env_logger",
>> + "errno",
>> + "httparse",
>> + "libc",
>> + "libsystemd",
>> + "log",
>> + "mio",
>> + "nix",
>> + "python3-sys",
>> + "rand",
>> + "simplelog",
>> + "spmc",
>> + "tempfile",
>> + "threadpool",
>> + "urlencoding",
>> +]
>> +
>> +[[package]]
>> +name =3D "python3-sys"
>> +version =3D "0.7.0"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "b18b32e64c103d5045f44644d7ddddd65336f7a0521f6fde673240a9ecceb77e"
>> +dependencies =3D [
>> + "libc",
>> + "regex",
>> +]
>> +
>> +[[package]]
>> +name =3D "quote"
>> +version =3D "1.0.14"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "47aa80447ce4daf1717500037052af176af5d38cc3e571d9ec1c7353fc10c87d"
>> +dependencies =3D [
>> + "proc-macro2",
>> +]
>> +
>> +[[package]]
>> +name =3D "rand"
>> +version =3D "0.8.4"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "2e7573632e6454cf6b99d7aac4ccca54be06da05aca2ef7423d22d27d4d4bcd8"
>> +dependencies =3D [
>> + "libc",
>> + "rand_chacha",
>> + "rand_core",
>> + "rand_hc",
>> +]
>> +
>> +[[package]]
>> +name =3D "rand_chacha"
>> +version =3D "0.3.1"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
>> +dependencies =3D [
>> + "ppv-lite86",
>> + "rand_core",
>> +]
>> +
>> +[[package]]
>> +name =3D "rand_core"
>> +version =3D "0.6.3"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "d34f1408f55294453790c48b2f1ebbb1c5b4b7563eb1f418bcfcfdbb06ebb4e7"
>> +dependencies =3D [
>> + "getrandom",
>> +]
>> +
>> +[[package]]
>> +name =3D "rand_hc"
>> +version =3D "0.3.1"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "d51e9f596de227fda2ea6c84607f5558e196eeaf43c986b724ba4fb8fdf497e7"
>> +dependencies =3D [
>> + "rand_core",
>> +]
>> +
>> +[[package]]
>> +name =3D "redox_syscall"
>> +version =3D "0.2.10"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "8383f39639269cde97d255a32bdb68c047337295414940c68bdd30c2e13203ff"
>> +dependencies =3D [
>> + "bitflags",
>> +]
>> +
>> +[[package]]
>> +name =3D "regex"
>> +version =3D "1.5.4"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "d07a8629359eb56f1e2fb1652bb04212c072a87ba68546a04065d525673ac461"
>> +dependencies =3D [
>> + "aho-corasick",
>> + "memchr",
>> + "regex-syntax",
>> +]
>> +
>> +[[package]]
>> +name =3D "regex-syntax"
>> +version =3D "0.6.25"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "f497285884f3fcff424ffc933e56d7cbca511def0c9831a7f9b5f6153e3cc89b"
>> +
>> +[[package]]
>> +name =3D "remove_dir_all"
>> +version =3D "0.5.3"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "3acd125665422973a33ac9d3dd2df85edad0f4ae9b00dafb1a05e43a9f5ef8e7"
>> +dependencies =3D [
>> + "winapi",
>> +]
>> +
>> +[[package]]
>> +name =3D "scopeguard"
>> +version =3D "1.1.0"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd"
>> +
>> +[[package]]
>> +name =3D "serde"
>> +version =3D "1.0.133"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "97565067517b60e2d1ea8b268e59ce036de907ac523ad83a0475da04e818989a"
>> +dependencies =3D [
>> + "serde_derive",
>> +]
>> +
>> +[[package]]
>> +name =3D "serde_derive"
>> +version =3D "1.0.133"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "ed201699328568d8d08208fdd080e3ff594e6c422e438b6705905da01005d537"
>> +dependencies =3D [
>> + "proc-macro2",
>> + "quote",
>> + "syn",
>> +]
>> +
>> +[[package]]
>> +name =3D "sha2"
>> +version =3D "0.9.9"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "4d58a1e1bf39749807d89cf2d98ac2dfa0ff1cb3faa38fbb64dd88ac8013d800"
>> +dependencies =3D [
>> + "block-buffer",
>> + "cfg-if",
>> + "cpufeatures",
>> + "digest",
>> + "opaque-debug",
>> +]
>> +
>> +[[package]]
>> +name =3D "simplelog"
>> +version =3D "0.11.1"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "ecabc0118918611790b8615670ab79296272cbe09496b6884b02b1e929c20886"
>> +dependencies =3D [
>> + "chrono",
>> + "log",
>> + "termcolor",
>> +]
>> +
>> +[[package]]
>> +name =3D "spmc"
>> +version =3D "0.3.0"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "02a8428da277a8e3a15271d79943e80ccc2ef254e78813a166a08d65e4c3ece5"
>> +
>> +[[package]]
>> +name =3D "subtle"
>> +version =3D "2.4.1"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "6bdef32e8150c2a081110b42772ffe7d7c9032b606bc226c8260fd97e0976601"
>> +
>> +[[package]]
>> +name =3D "syn"
>> +version =3D "1.0.85"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "a684ac3dcd8913827e18cd09a68384ee66c1de24157e3c556c9ab16d85695fb7"
>> +dependencies =3D [
>> + "proc-macro2",
>> + "quote",
>> + "unicode-xid",
>> +]
>> +
>> +[[package]]
>> +name =3D "tempfile"
>> +version =3D "3.3.0"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "5cdb1ef4eaeeaddc8fbd371e5017057064af0911902ef36b39801f67cc6d79e4"
>> +dependencies =3D [
>> + "cfg-if",
>> + "fastrand",
>> + "libc",
>> + "redox_syscall",
>> + "remove_dir_all",
>> + "winapi",
>> +]
>> +
>> +[[package]]
>> +name =3D "termcolor"
>> +version =3D "1.1.2"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "2dfed899f0eb03f32ee8c6a0aabdb8a7949659e3466561fc0adf54e26d88c5f4"
>> +dependencies =3D [
>> + "winapi-util",
>> +]
>> +
>> +[[package]]
>> +name =3D "thiserror"
>> +version =3D "1.0.30"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "854babe52e4df1653706b98fcfc05843010039b406875930a70e4d9644e5c417"
>> +dependencies =3D [
>> + "thiserror-impl",
>> +]
>> +
>> +[[package]]
>> +name =3D "thiserror-impl"
>> +version =3D "1.0.30"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "aa32fd3f627f367fe16f893e2597ae3c05020f8bba2666a4e6ea73d377e5714b"
>> +dependencies =3D [
>> + "proc-macro2",
>> + "quote",
>> + "syn",
>> +]
>> +
>> +[[package]]
>> +name =3D "threadpool"
>> +version =3D "1.8.1"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "d050e60b33d41c19108b32cea32164033a9013fe3b46cbd4457559bfbf77afaa"
>> +dependencies =3D [
>> + "num_cpus",
>> +]
>> +
>> +[[package]]
>> +name =3D "time"
>> +version =3D "0.1.44"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "6db9e6914ab8b1ae1c260a4ae7a49b6c5611b40328a735b21862567685e73255"
>> +dependencies =3D [
>> + "libc",
>> + "wasi",
>> + "winapi",
>> +]
>> +
>> +[[package]]
>> +name =3D "typenum"
>> +version =3D "1.15.0"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "dcf81ac59edc17cc8697ff311e8f5ef2d99fcbd9817b34cec66f90b6c3dfd987"
>> +
>> +[[package]]
>> +name =3D "unicode-xid"
>> +version =3D "0.2.2"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "8ccb82d61f80a663efe1f787a51b16b5a51e3314d6ac365b08639f52387b33f3"
>> +
>> +[[package]]
>> +name =3D "urlencoding"
>> +version =3D "2.1.0"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "68b90931029ab9b034b300b797048cf23723400aa757e8a2bfb9d748102f9821"
>> +
>> +[[package]]
>> +name =3D "uuid"
>> +version =3D "0.8.2"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "bc5cf98d8186244414c848017f0e2676b3fcb46807f6668a97dfe67359a3c4b7"
>> +dependencies =3D [
>> + "serde",
>> +]
>> +
>> +[[package]]
>> +name =3D "version_check"
>> +version =3D "0.9.4"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
>> +
>> +[[package]]
>> +name =3D "wasi"
>> +version =3D "0.10.0+wasi-snapshot-preview1"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "1a143597ca7c7793eff794def352d41792a93c481eb1042423ff7ff72ba2c31f"
>> +
>> +[[package]]
>> +name =3D "winapi"
>> +version =3D "0.3.9"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
>> +dependencies =3D [
>> + "winapi-i686-pc-windows-gnu",
>> + "winapi-x86_64-pc-windows-gnu",
>> +]
>> +
>> +[[package]]
>> +name =3D "winapi-i686-pc-windows-gnu"
>> +version =3D "0.4.0"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
>> +
>> +[[package]]
>> +name =3D "winapi-util"
>> +version =3D "0.1.5"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e3ce5de178"
>> +dependencies =3D [
>> + "winapi",
>> +]
>> +
>> +[[package]]
>> +name =3D "winapi-x86_64-pc-windows-gnu"
>> +version =3D "0.4.0"
>> +source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +checksum =3D
>> "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-pyruvate_1.1.2.bb b/meta-python/recipes-devtools/python/
>> python3-pyruvate_1.1.2.bb
>> index 1f1c186d3..296f4fdb8 100644
>> --- a/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
>> +++ b/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
>> @@ -12,7 +12,7 @@ SRC_URI[sha256sum] =3D
>> "10befedd97e73fc18b902d02aa3b24e8978aa162242c1b664849c886c0
>>
>>  S =3D "${WORKDIR}/pyruvate-${PV}"
>>
>> -inherit pypi python_setuptools3_rust
>> +inherit pypi python_setuptools3_rust cargo-update-recipe-crates
>>
>>  PIP_INSTALL_DIST_PATH =3D "${S}/dist"
>>
>> @@ -24,102 +24,19 @@ RUSTFLAGS:append:mipsel =3D " --cfg
>> crossbeam_no_atomic_64"
>>  RUSTFLAGS:append:powerpc =3D " --cfg crossbeam_no_atomic_64"
>>  RUSTFLAGS:append:riscv32 =3D " --cfg crossbeam_no_atomic_64"
>>
>> -SRC_URI +=3D " \
>> -    crate://crates.io/aho-corasick/0.7.18 \
>> -    crate://crates.io/atty/0.2.14 \
>> -    crate://crates.io/autocfg/1.0.1 \
>> -    crate://crates.io/bitflags/1.3.2 \
>> -    crate://crates.io/block-buffer/0.9.0 \
>> -    crate://crates.io/cc/1.0.72 \
>> -    crate://crates.io/cfg-if/1.0.0 \
>> -    crate://crates.io/chrono/0.4.19 \
>> -    crate://crates.io/cpufeatures/0.2.1 \
>> -    crate://crates.io/cpython/0.7.0 \
>> -    crate://crates.io/crossbeam-channel/0.5.2 \
>> -    crate://crates.io/crossbeam-deque/0.8.1 \
>> -    crate://crates.io/crossbeam-epoch/0.9.6 \
>> -    crate://crates.io/crossbeam-queue/0.3.3 \
>> -    crate://crates.io/crossbeam-utils/0.8.6 \
>> -    crate://crates.io/crossbeam/0.8.1 \
>> -    crate://crates.io/crypto-mac/0.11.1 \
>> -    crate://crates.io/ctrlc/3.2.1 \
>> -    crate://crates.io/digest/0.9.0 \
>> -    crate://crates.io/encoding-index-japanese/1.20141219.5 \
>> -    crate://crates.io/encoding-index-korean/1.20141219.5 \
>> -    crate://crates.io/encoding-index-simpchinese/1.20141219.5 \
>> -    crate://crates.io/encoding-index-singlebyte/1.20141219.5 \
>> -    crate://crates.io/encoding-index-tradchinese/1.20141219.5 \
>> -    crate://crates.io/encoding/0.2.33 \
>> -    crate://crates.io/encoding_index_tests/0.1.4 \
>> -    crate://crates.io/env_logger/0.9.0 \
>> -    crate://crates.io/errno-dragonfly/0.1.2 \
>> -    crate://crates.io/errno/0.2.8 \
>> -    crate://crates.io/fastrand/1.6.0 \
>> -    crate://crates.io/generic-array/0.14.5 \
>> -    crate://crates.io/getrandom/0.2.3 \
>> -    crate://crates.io/hermit-abi/0.1.19 \
>> -    crate://crates.io/hmac/0.11.0 \
>> -    crate://crates.io/httparse/1.5.1 \
>> -    crate://crates.io/humantime/2.1.0 \
>> -    crate://crates.io/instant/0.1.12 \
>> -    crate://crates.io/lazy_static/1.4.0 \
>> -    crate://crates.io/libc/0.2.120 \
>> -    crate://crates.io/libsystemd/0.4.1 \
>> -    crate://crates.io/log/0.4.14 \
>> -    crate://crates.io/memchr/2.4.1 \
>> -    crate://crates.io/memoffset/0.6.5 \
>> -    crate://crates.io/mio/0.8.0 \
>> -    crate://crates.io/miow/0.3.7 \
>> -    crate://crates.io/nix/0.23.1 \
>> -    crate://crates.io/ntapi/0.3.6 \
>> -    crate://crates.io/num-integer/0.1.44 \
>> -    crate://crates.io/num-traits/0.2.14 \
>> -    crate://crates.io/num_cpus/1.13.1 \
>> -    crate://crates.io/once_cell/1.9.0 \
>> -    crate://crates.io/opaque-debug/0.3.0 \
>> -    crate://crates.io/paste/1.0.6 \
>> -    crate://crates.io/ppv-lite86/0.2.16 \
>> -    crate://crates.io/proc-macro2/1.0.36 \
>> -    crate://crates.io/python3-sys/0.7.0 \
>> -    crate://crates.io/quote/1.0.14 \
>> -    crate://crates.io/rand/0.8.4 \
>> -    crate://crates.io/rand_chacha/0.3.1 \
>> -    crate://crates.io/rand_core/0.6.3 \
>> -    crate://crates.io/rand_hc/0.3.1 \
>> -    crate://crates.io/redox_syscall/0.2.10 \
>> -    crate://crates.io/regex-syntax/0.6.25 \
>> -    crate://crates.io/regex/1.5.4 \
>> -    crate://crates.io/remove_dir_all/0.5.3 \
>> -    crate://crates.io/scopeguard/1.1.0 \
>> -    crate://crates.io/serde/1.0.133 \
>> -    crate://crates.io/serde_derive/1.0.133 \
>> -    crate://crates.io/sha2/0.9.9 \
>> -    crate://crates.io/simplelog/0.11.1 \
>> -    crate://crates.io/spmc/0.3.0 \
>> -    crate://crates.io/subtle/2.4.1 \
>> -    crate://crates.io/syn/1.0.85 \
>> -    crate://crates.io/tempfile/3.3.0 \
>> -    crate://crates.io/termcolor/1.1.2 \
>> -    crate://crates.io/thiserror-impl/1.0.30 \
>> -    crate://crates.io/thiserror/1.0.30 \
>> -    crate://crates.io/threadpool/1.8.1 \
>> -    crate://crates.io/time/0.1.44 \
>> -    crate://crates.io/typenum/1.15.0 \
>> -    crate://crates.io/unicode-xid/0.2.2 \
>> -    crate://crates.io/urlencoding/2.1.0 \
>> -    crate://crates.io/uuid/0.8.2 \
>> -    crate://crates.io/version_check/0.9.4 \
>> -    crate://crates.io/wasi/0.10.0+wasi-snapshot-preview1 \
>> -    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
>> -    crate://crates.io/winapi-util/0.1.5 \
>> -    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
>> -    crate://crates.io/winapi/0.3.9 \
>> -"
>> +require ${BPN}-crates.inc
>> +
>>  SRC_URI +=3D "\
>> -
>> file://0001-linux.rs-Define-consts-for-rv32-architecture.patch;patchdir=
=3D../cargo_home/bitbake/nix-0.23.1/
>> \
>> -            "
>> +
>> file://0001-linux.rs-Define-consts-for-rv32-architecture.patch;patchdir=
=3D../cargo_home/bitbake/nix-0.23.1/
>> \
>> +    file://Cargo.lock \
>> +"
>>  SRC_URI:append:mips =3D "
>> file://0001-check-for-mips-targets-for-stat.st_dev-definitions.patch;pat=
chdir=3D../cargo_home/bitbake/libsystemd-0.4.1/"
>>
>> +do_update_crates:prepend() {
>> +    # The Cargo.lock file is not present in the current version
>> downloaded frop pypi
>> +    install -m 0644 ${WORKDIR}/Cargo.lock ${S}/Cargo.lock
>> +}
>> +
>>  # The following configs & dependencies are from setuptools
>> extras_require.
>>  # These dependencies are optional, hence can be controlled via
>> PACKAGECONFIG.
>>  # The upstream names may not correspond exactly to bitbake package name=
s.
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#101575):
>> https://lists.openembedded.org/g/openembedded-devel/message/101575
>> Mute This Topic: https://lists.openembedded.org/mt/97649026/924729
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> ticotimo@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--0000000000001d643e05f705ecde
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I could try that of course, will keep you posted soon abou=
t a new patch version<div>that includes the git:// fetcher.</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 16=
 Mar 2023 at 16:00, Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com">ti=
cotimo@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 16, 2023=
 at 5:25=E2=80=AFAM Frederic Martinsons &lt;<a href=3D"mailto:frederic.mart=
insons@gmail.com" target=3D"_blank">frederic.martinsons@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Fred=
eric Martinsons &lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=
=3D"_blank">frederic.martinsons@gmail.com</a>&gt;<br>
<br>
This is related to checksum verification introduction in bitbake<br>
crate fetcher:<br>
<a href=3D"https://patchwork.yoctoproject.org/project/bitbake/patch/2023031=
5131513.50635-1-frederic.martinsons@gmail.com/" rel=3D"noreferrer" target=
=3D"_blank">https://patchwork.yoctoproject.org/project/bitbake/patch/202303=
15131513.50635-1-frederic.martinsons@gmail.com/</a><br>
<br></blockquote><div>Thank you for modernizing the recipe. It is appreciat=
ed.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
Moreover, the Cargo.lock file that is needed to update these<br>
checksum is not present in pypi repo but is inside the git repo.<br>
So install the Cargo.lock by ourself, the file was downloaded<br>
at <a href=3D"https://gitlab.com/tschorr/pyruvate/-/tree/1.1.2" rel=3D"nore=
ferrer" target=3D"_blank">https://gitlab.com/tschorr/pyruvate/-/tree/1.1.2<=
/a><br>
<br></blockquote><div><br></div><div>We could also switch to the git:// fet=
cher, which might make it easier to upgrade in the future.</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Frederic Martinsons &lt;<a href=3D"mailto:frederic.martinson=
s@gmail.com" target=3D"_blank">frederic.martinsons@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../python/python3-pyruvate-crates.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
84 ++++<br>
=C2=A0.../python/python3-pyruvate/Cargo.lock=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 8=
41 ++++++++++++++++++<br>
=C2=A0.../python/<a href=3D"http://python3-pyruvate_1.1.2.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-pyruvate_1.1.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 105 +--<br>
=C2=A03 files changed, 1036 insertions(+), 94 deletions(-)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pyruva=
te-crates.inc<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pyruva=
te/Cargo.lock<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-pyruvate-crates.in=
c b/meta-python/recipes-devtools/python/python3-pyruvate-crates.inc<br>
new file mode 100644<br>
index 000000000..52fb9d457<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-pyruvate-crates.inc<br>
@@ -0,0 +1,184 @@<br>
+# Autogenerated with &#39;bitbake -c update_crates python3-pyruvate&#39;<b=
r>
+<br>
+# from Cargo.lock<br>
+SRC_URI +=3D &quot; \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/aho-corasick/0.7.18" rel=
=3D"noreferrer" target=3D"_blank">crates.io/aho-corasick/0.7.18</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/atty/0.2.14" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/atty/0.2.14</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/autocfg/1.0.1" rel=3D"no=
referrer" target=3D"_blank">crates.io/autocfg/1.0.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bitflags/1.3.2" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/bitflags/1.3.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/block-buffer/0.9.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/block-buffer/0.9.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cc/1.0.72" rel=3D"norefe=
rrer" target=3D"_blank">crates.io/cc/1.0.72</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cfg-if/1.0.0" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/cfg-if/1.0.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/chrono/0.4.19" rel=3D"no=
referrer" target=3D"_blank">crates.io/chrono/0.4.19</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cpufeatures/0.2.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/cpufeatures/0.2.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cpython/0.7.0" rel=3D"no=
referrer" target=3D"_blank">crates.io/cpython/0.7.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam/0.8.1" rel=3D"=
noreferrer" target=3D"_blank">crates.io/crossbeam/0.8.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-channel/0.5.2"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-channel/0.5.2</a>=
 \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-deque/0.8.1" r=
el=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-deque/0.8.1</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-epoch/0.9.6" r=
el=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-epoch/0.9.6</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-queue/0.3.3" r=
el=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-queue/0.3.3</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-utils/0.8.6" r=
el=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-utils/0.8.6</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crypto-mac/0.11.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/crypto-mac/0.11.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ctrlc/3.2.1" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/ctrlc/3.2.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/digest/0.9.0" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/digest/0.9.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/encoding/0.2.33" rel=3D"=
noreferrer" target=3D"_blank">crates.io/encoding/0.2.33</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/encoding-index-japanese/=
1.20141219.5" rel=3D"noreferrer" target=3D"_blank">crates.io/encoding-index=
-japanese/1.20141219.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/encoding-index-korean/1.=
20141219.5" rel=3D"noreferrer" target=3D"_blank">crates.io/encoding-index-k=
orean/1.20141219.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/encoding-index-simpchine=
se/1.20141219.5" rel=3D"noreferrer" target=3D"_blank">crates.io/encoding-in=
dex-simpchinese/1.20141219.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/encoding-index-singlebyt=
e/1.20141219.5" rel=3D"noreferrer" target=3D"_blank">crates.io/encoding-ind=
ex-singlebyte/1.20141219.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/encoding-index-tradchine=
se/1.20141219.5" rel=3D"noreferrer" target=3D"_blank">crates.io/encoding-in=
dex-tradchinese/1.20141219.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/encoding_index_tests/0.1=
.4" rel=3D"noreferrer" target=3D"_blank">crates.io/encoding_index_tests/0.1=
.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/env_logger/0.9.0" rel=3D=
"noreferrer" target=3D"_blank">crates.io/env_logger/0.9.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/errno/0.2.8" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/errno/0.2.8</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/errno-dragonfly/0.1.2" r=
el=3D"noreferrer" target=3D"_blank">crates.io/errno-dragonfly/0.1.2</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/fastrand/1.6.0" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/fastrand/1.6.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/generic-array/0.14.5" re=
l=3D"noreferrer" target=3D"_blank">crates.io/generic-array/0.14.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/getrandom/0.2.3" rel=3D"=
noreferrer" target=3D"_blank">crates.io/getrandom/0.2.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/hermit-abi/0.1.19" rel=
=3D"noreferrer" target=3D"_blank">crates.io/hermit-abi/0.1.19</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/hmac/0.11.0" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/hmac/0.11.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/httparse/1.5.1" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/httparse/1.5.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/humantime/2.1.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/humantime/2.1.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/instant/0.1.12" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/instant/0.1.12</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lazy_static/1.4.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/lazy_static/1.4.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libc/0.2.112" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/libc/0.2.112</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libsystemd/0.4.1" rel=3D=
"noreferrer" target=3D"_blank">crates.io/libsystemd/0.4.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/log/0.4.14" rel=3D"noref=
errer" target=3D"_blank">crates.io/log/0.4.14</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memchr/2.4.1" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/memchr/2.4.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memoffset/0.6.5" rel=3D"=
noreferrer" target=3D"_blank">crates.io/memoffset/0.6.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/mio/0.8.0" rel=3D"norefe=
rrer" target=3D"_blank">crates.io/mio/0.8.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/miow/0.3.7" rel=3D"noref=
errer" target=3D"_blank">crates.io/miow/0.3.7</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/nix/0.23.1" rel=3D"noref=
errer" target=3D"_blank">crates.io/nix/0.23.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ntapi/0.3.6" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/ntapi/0.3.6</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/num-integer/0.1.44" rel=
=3D"noreferrer" target=3D"_blank">crates.io/num-integer/0.1.44</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/num-traits/0.2.14" rel=
=3D"noreferrer" target=3D"_blank">crates.io/num-traits/0.2.14</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/num_cpus/1.13.1" rel=3D"=
noreferrer" target=3D"_blank">crates.io/num_cpus/1.13.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/once_cell/1.9.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/once_cell/1.9.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/opaque-debug/0.3.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/opaque-debug/0.3.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/paste/1.0.6" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/paste/1.0.6</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ppv-lite86/0.2.16" rel=
=3D"noreferrer" target=3D"_blank">crates.io/ppv-lite86/0.2.16</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro2/1.0.36" rel=
=3D"noreferrer" target=3D"_blank">crates.io/proc-macro2/1.0.36</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/python3-sys/0.7.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/python3-sys/0.7.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quote/1.0.14" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/quote/1.0.14</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand/0.8.4" rel=3D"noref=
errer" target=3D"_blank">crates.io/rand/0.8.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_chacha/0.3.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/rand_chacha/0.3.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_core/0.6.3" rel=3D"=
noreferrer" target=3D"_blank">crates.io/rand_core/0.6.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_hc/0.3.1" rel=3D"no=
referrer" target=3D"_blank">crates.io/rand_hc/0.3.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/redox_syscall/0.2.10" re=
l=3D"noreferrer" target=3D"_blank">crates.io/redox_syscall/0.2.10</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/regex/1.5.4" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/regex/1.5.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/regex-syntax/0.6.25" rel=
=3D"noreferrer" target=3D"_blank">crates.io/regex-syntax/0.6.25</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/remove_dir_all/0.5.3" re=
l=3D"noreferrer" target=3D"_blank">crates.io/remove_dir_all/0.5.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/scopeguard/1.1.0" rel=3D=
"noreferrer" target=3D"_blank">crates.io/scopeguard/1.1.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde/1.0.133" rel=3D"no=
referrer" target=3D"_blank">crates.io/serde/1.0.133</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde_derive/1.0.133" re=
l=3D"noreferrer" target=3D"_blank">crates.io/serde_derive/1.0.133</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/sha2/0.9.9" rel=3D"noref=
errer" target=3D"_blank">crates.io/sha2/0.9.9</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/simplelog/0.11.1" rel=3D=
"noreferrer" target=3D"_blank">crates.io/simplelog/0.11.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/spmc/0.3.0" rel=3D"noref=
errer" target=3D"_blank">crates.io/spmc/0.3.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/subtle/2.4.1" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/subtle/2.4.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/1.0.85" rel=3D"noref=
errer" target=3D"_blank">crates.io/syn/1.0.85</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/tempfile/3.3.0" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/tempfile/3.3.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/termcolor/1.1.2" rel=3D"=
noreferrer" target=3D"_blank">crates.io/termcolor/1.1.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/thiserror/1.0.30" rel=3D=
"noreferrer" target=3D"_blank">crates.io/thiserror/1.0.30</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/thiserror-impl/1.0.30" r=
el=3D"noreferrer" target=3D"_blank">crates.io/thiserror-impl/1.0.30</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/threadpool/1.8.1" rel=3D=
"noreferrer" target=3D"_blank">crates.io/threadpool/1.8.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/time/0.1.44" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/time/0.1.44</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/typenum/1.15.0" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/typenum/1.15.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-xid/0.2.2" rel=
=3D"noreferrer" target=3D"_blank">crates.io/unicode-xid/0.2.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/urlencoding/2.1.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/urlencoding/2.1.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/uuid/0.8.2" rel=3D"noref=
errer" target=3D"_blank">crates.io/uuid/0.8.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/version_check/0.9.4" rel=
=3D"noreferrer" target=3D"_blank">crates.io/version_check/0.9.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasi/0.10.0+wasi-snapsho=
t-preview1" rel=3D"noreferrer" target=3D"_blank">crates.io/wasi/0.10.0+wasi=
-snapshot-preview1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi/0.3.9" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/winapi/0.3.9</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi-i686-pc-windows-g=
nu/0.4.0" rel=3D"noreferrer" target=3D"_blank">crates.io/winapi-i686-pc-win=
dows-gnu/0.4.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi-util/0.1.5" rel=
=3D"noreferrer" target=3D"_blank">crates.io/winapi-util/0.1.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi-x86_64-pc-windows=
-gnu/0.4.0" rel=3D"noreferrer" target=3D"_blank">crates.io/winapi-x86_64-pc=
-windows-gnu/0.4.0</a> \<br>
+&quot;<br>
+<br>
+SRC_URI[aho-corasick.sha256sum] =3D &quot;1e37cfd5e7657ada45f742d6e99ca578=
8580b5c529dc78faf11ece6dc702656f&quot;<br>
+SRC_URI[atty.sha256sum] =3D &quot;d9b39be18770d11421cdb1b9947a45dd3f37e930=
92cbf377614828a319d5fee8&quot;<br>
+SRC_URI[autocfg.sha256sum] =3D &quot;cdb031dd78e28731d87d56cc8ffef4a8f36ca=
26c38fe2de700543e627f8a464a&quot;<br>
+SRC_URI[bitflags.sha256sum] =3D &quot;bef38d45163c2f1dde094a7dfd33ccf595c9=
2905c8f8f4fdc18d06fb1037718a&quot;<br>
+SRC_URI[block-buffer.sha256sum] =3D &quot;4152116fd6e9dadb291ae18fc1ec3575=
ed6d84c29642d97890f4b4a3417297e4&quot;<br>
+SRC_URI[cc.sha256sum] =3D &quot;22a9137b95ea06864e018375b72adfb7db6e6f68cf=
c8df5a04d00288050485ee&quot;<br>
+SRC_URI[cfg-if.sha256sum] =3D &quot;baf1de4339761588bc0619e3cbc0120ee582eb=
b74b53b4efbf79117bd2da40fd&quot;<br>
+SRC_URI[chrono.sha256sum] =3D &quot;670ad68c9088c2a963aaa298cb369688cf3f94=
65ce5e2d4ca10e6e0098a1ce73&quot;<br>
+SRC_URI[cpufeatures.sha256sum] =3D &quot;95059428f66df56b63431fdb4e1947ed2=
190586af5c5a8a8b71122bdf5a7f469&quot;<br>
+SRC_URI[cpython.sha256sum] =3D &quot;b7d46ba8ace7f3a1d204ac5060a706d0a68de=
6b42eafb6a586cc08bebcffe664&quot;<br>
+SRC_URI[crossbeam.sha256sum] =3D &quot;4ae5588f6b3c3cb05239e90bd110f257254=
aecd01e4635400391aeae07497845&quot;<br>
+SRC_URI[crossbeam-channel.sha256sum] =3D &quot;e54ea8bc3fb1ee042f5aace6e3c=
6e025d3874866da222930f70ce62aceba0bfa&quot;<br>
+SRC_URI[crossbeam-deque.sha256sum] =3D &quot;6455c0ca19f0d2fbf751b908d5c55=
c1f5cbc65e03c4225427254b46890bdde1e&quot;<br>
+SRC_URI[crossbeam-epoch.sha256sum] =3D &quot;97242a70df9b89a65d0b6df3c4bf5=
b9ce03c5b7309019777fbde37e7537f8762&quot;<br>
+SRC_URI[crossbeam-queue.sha256sum] =3D &quot;b979d76c9fcb84dffc80a73f7290d=
a0f83e4c95773494674cb44b76d13a7a110&quot;<br>
+SRC_URI[crossbeam-utils.sha256sum] =3D &quot;cfcae03edb34f947e64acdb1c33ec=
169824e20657e9ecb61cef6c8c74dcb8120&quot;<br>
+SRC_URI[crypto-mac.sha256sum] =3D &quot;b1d1a86f49236c215f271d40892d5fc950=
490551400b02ef360692c29815c714&quot;<br>
+SRC_URI[ctrlc.sha256sum] =3D &quot;a19c6cedffdc8c03a3346d723eb20bd85a13362=
bb96dc2ac000842c6381ec7bf&quot;<br>
+SRC_URI[digest.sha256sum] =3D &quot;d3dd60d1080a57a05ab032377049e0591415d2=
b31afd7028356dbf3cc6dcb066&quot;<br>
+SRC_URI[encoding.sha256sum] =3D &quot;6b0d943856b990d12d3b55b359144ff34153=
3e516d94098b1d3fc1ac666d36ec&quot;<br>
+SRC_URI[encoding-index-japanese.sha256sum] =3D &quot;04e8b2ff42e9a05335dbf=
8b5c6f7567e5591d0d916ccef4e0b1710d32a0d0c91&quot;<br>
+SRC_URI[encoding-index-korean.sha256sum] =3D &quot;4dc33fb8e6bcba213fe2f14=
275f0963fd16f0a02c878e3095ecfdf5bee529d81&quot;<br>
+SRC_URI[encoding-index-simpchinese.sha256sum] =3D &quot;d87a7194909b9118fc=
707194baa434a4e3b0fb6a5a757c73c3adb07aa25031f7&quot;<br>
+SRC_URI[encoding-index-singlebyte.sha256sum] =3D &quot;3351d5acffb224af9ca=
265f435b859c7c01537c0849754d3db3fdf2bfe2ae84a&quot;<br>
+SRC_URI[encoding-index-tradchinese.sha256sum] =3D &quot;fd0e20d5688ce3cab5=
9eb3ef3a2083a5c77bf496cb798dc6fcdb75f323890c18&quot;<br>
+SRC_URI[encoding_index_tests.sha256sum] =3D &quot;a246d82be1c9d791c5dfde9a=
2bd045fc3cbba3fa2b11ad558f27d01712f00569&quot;<br>
+SRC_URI[env_logger.sha256sum] =3D &quot;0b2cf0344971ee6c64c31be0d530793fba=
457d322dfec2810c453d0ef228f9c3&quot;<br>
+SRC_URI[errno.sha256sum] =3D &quot;f639046355ee4f37944e44f60642c6f3a7efa3c=
f6b78c78a0d989a8ce6c396a1&quot;<br>
+SRC_URI[errno-dragonfly.sha256sum] =3D &quot;aa68f1b12764fab894d2755d25187=
54e71b4fd80ecfb822714a1206c2aab39bf&quot;<br>
+SRC_URI[fastrand.sha256sum] =3D &quot;779d043b6a0b90cc4c0ed7ee380a6504394c=
ee7efd7db050e3774eee387324b2&quot;<br>
+SRC_URI[generic-array.sha256sum] =3D &quot;fd48d33ec7f05fbfa152300fdad7647=
57cbded343c1aa1cff2fbaf4134851803&quot;<br>
+SRC_URI[getrandom.sha256sum] =3D &quot;7fcd999463524c52659517fe2cea98493cf=
e485d10565e7b0fb07dbba7ad2753&quot;<br>
+SRC_URI[hermit-abi.sha256sum] =3D &quot;62b467343b94ba476dcb2500d242dadbb3=
9557df889310ac77c5d99100aaac33&quot;<br>
+SRC_URI[hmac.sha256sum] =3D &quot;2a2a2320eb7ec0ebe8da8f744d7812d9fc4cb4d0=
9344ac01898dbcb6a20ae69b&quot;<br>
+SRC_URI[httparse.sha256sum] =3D &quot;acd94fdbe1d4ff688b67b04eee2e17bd5099=
5534a61539e45adfefb45e5e5503&quot;<br>
+SRC_URI[humantime.sha256sum] =3D &quot;9a3a5bfb195931eeb336b2a7b4d761daec8=
41b97f947d34394601737a7bba5e4&quot;<br>
+SRC_URI[instant.sha256sum] =3D &quot;7a5bbe824c507c5da5956355e86a746d82e0e=
1464f65d862cc5e71da70e94b2c&quot;<br>
+SRC_URI[lazy_static.sha256sum] =3D &quot;e2abad23fbc42b3700f2f279844dc832a=
db2b2eb069b2df918f455c4e18cc646&quot;<br>
+SRC_URI[libc.sha256sum] =3D &quot;1b03d17f364a3a042d5e5d46b053bbbf82c92c94=
30c592dd4c064dc6ee997125&quot;<br>
+SRC_URI[libsystemd.sha256sum] =3D &quot;6f4f0b5b062ba67aa075e331de778082c0=
9e66b5ef32970ea5a1e9c37c9555d1&quot;<br>
+SRC_URI[log.sha256sum] =3D &quot;51b9bbe6c47d51fc3e1a9b945965946b4c44142ab=
8792c50835a980d362c2710&quot;<br>
+SRC_URI[memchr.sha256sum] =3D &quot;308cc39be01b73d0d18f82a0e7b2a3df85245f=
84af96fdddc5d202d27e47b86a&quot;<br>
+SRC_URI[memoffset.sha256sum] =3D &quot;5aa361d4faea93603064a027415f07bd8e1=
d5c88c9fbf68bf56a285428fd79ce&quot;<br>
+SRC_URI[mio.sha256sum] =3D &quot;ba272f85fa0b41fc91872be579b3bbe0f56b792aa=
361a380eb669469f68dafb2&quot;<br>
+SRC_URI[miow.sha256sum] =3D &quot;b9f1c5b025cda876f66ef43a113f91ebc9f4ccef=
34843000e0adf6ebbab84e21&quot;<br>
+SRC_URI[nix.sha256sum] =3D &quot;9f866317acbd3a240710c63f065ffb1e4fd466259=
045ccb504130b7f668f35c6&quot;<br>
+SRC_URI[ntapi.sha256sum] =3D &quot;3f6bb902e437b6d86e03cce10a7e2af662292c5=
dfef23b65899ea3ac9354ad44&quot;<br>
+SRC_URI[num-integer.sha256sum] =3D &quot;d2cc698a63b549a70bc047073d2949cce=
27cd1c7b0a4a862d08a8031bc2801db&quot;<br>
+SRC_URI[num-traits.sha256sum] =3D &quot;9a64b1ec5cda2586e284722486d802acf1=
f7dbdc623e2bfc57e65ca1cd099290&quot;<br>
+SRC_URI[num_cpus.sha256sum] =3D &quot;19e64526ebdee182341572e50e9ad03965aa=
510cd94427a4549448f285e957a1&quot;<br>
+SRC_URI[once_cell.sha256sum] =3D &quot;da32515d9f6e6e489d7bc9d84c71b060db7=
247dc035bbe44eac88cf87486d8d5&quot;<br>
+SRC_URI[opaque-debug.sha256sum] =3D &quot;624a8340c38c1b80fd549087862da4ba=
43e08858af025b236e509b6649fc13d5&quot;<br>
+SRC_URI[paste.sha256sum] =3D &quot;0744126afe1a6dd7f394cb50a716dbe086cb06e=
255e53d8d0185d82828358fb5&quot;<br>
+SRC_URI[ppv-lite86.sha256sum] =3D &quot;eb9f9e6e233e5c4a35559a617bf40a4ec4=
47db2e84c20b55a6f83167b7e57872&quot;<br>
+SRC_URI[proc-macro2.sha256sum] =3D &quot;c7342d5883fbccae1cc37a2353b09c87c=
9b0f3afd73f5fb9bba687a1f733b029&quot;<br>
+SRC_URI[python3-sys.sha256sum] =3D &quot;b18b32e64c103d5045f44644d7ddddd65=
336f7a0521f6fde673240a9ecceb77e&quot;<br>
+SRC_URI[quote.sha256sum] =3D &quot;47aa80447ce4daf1717500037052af176af5d38=
cc3e571d9ec1c7353fc10c87d&quot;<br>
+SRC_URI[rand.sha256sum] =3D &quot;2e7573632e6454cf6b99d7aac4ccca54be06da05=
aca2ef7423d22d27d4d4bcd8&quot;<br>
+SRC_URI[rand_chacha.sha256sum] =3D &quot;e6c10a63a0fa32252be49d21e7709d4d4=
baf8d231c2dbce1eaa8141b9b127d88&quot;<br>
+SRC_URI[rand_core.sha256sum] =3D &quot;d34f1408f55294453790c48b2f1ebbb1c5b=
4b7563eb1f418bcfcfdbb06ebb4e7&quot;<br>
+SRC_URI[rand_hc.sha256sum] =3D &quot;d51e9f596de227fda2ea6c84607f5558e196e=
eaf43c986b724ba4fb8fdf497e7&quot;<br>
+SRC_URI[redox_syscall.sha256sum] =3D &quot;8383f39639269cde97d255a32bdb68c=
047337295414940c68bdd30c2e13203ff&quot;<br>
+SRC_URI[regex.sha256sum] =3D &quot;d07a8629359eb56f1e2fb1652bb04212c072a87=
ba68546a04065d525673ac461&quot;<br>
+SRC_URI[regex-syntax.sha256sum] =3D &quot;f497285884f3fcff424ffc933e56d7cb=
ca511def0c9831a7f9b5f6153e3cc89b&quot;<br>
+SRC_URI[remove_dir_all.sha256sum] =3D &quot;3acd125665422973a33ac9d3dd2df8=
5edad0f4ae9b00dafb1a05e43a9f5ef8e7&quot;<br>
+SRC_URI[scopeguard.sha256sum] =3D &quot;d29ab0c6d3fc0ee92fe66e2d99f700eab1=
7a8d57d1c1d3b748380fb20baa78cd&quot;<br>
+SRC_URI[serde.sha256sum] =3D &quot;97565067517b60e2d1ea8b268e59ce036de907a=
c523ad83a0475da04e818989a&quot;<br>
+SRC_URI[serde_derive.sha256sum] =3D &quot;ed201699328568d8d08208fdd080e3ff=
594e6c422e438b6705905da01005d537&quot;<br>
+SRC_URI[sha2.sha256sum] =3D &quot;4d58a1e1bf39749807d89cf2d98ac2dfa0ff1cb3=
faa38fbb64dd88ac8013d800&quot;<br>
+SRC_URI[simplelog.sha256sum] =3D &quot;ecabc0118918611790b8615670ab7929627=
2cbe09496b6884b02b1e929c20886&quot;<br>
+SRC_URI[spmc.sha256sum] =3D &quot;02a8428da277a8e3a15271d79943e80ccc2ef254=
e78813a166a08d65e4c3ece5&quot;<br>
+SRC_URI[subtle.sha256sum] =3D &quot;6bdef32e8150c2a081110b42772ffe7d7c9032=
b606bc226c8260fd97e0976601&quot;<br>
+SRC_URI[syn.sha256sum] =3D &quot;a684ac3dcd8913827e18cd09a68384ee66c1de241=
57e3c556c9ab16d85695fb7&quot;<br>
+SRC_URI[tempfile.sha256sum] =3D &quot;5cdb1ef4eaeeaddc8fbd371e5017057064af=
0911902ef36b39801f67cc6d79e4&quot;<br>
+SRC_URI[termcolor.sha256sum] =3D &quot;2dfed899f0eb03f32ee8c6a0aabdb8a7949=
659e3466561fc0adf54e26d88c5f4&quot;<br>
+SRC_URI[thiserror.sha256sum] =3D &quot;854babe52e4df1653706b98fcfc05843010=
039b406875930a70e4d9644e5c417&quot;<br>
+SRC_URI[thiserror-impl.sha256sum] =3D &quot;aa32fd3f627f367fe16f893e2597ae=
3c05020f8bba2666a4e6ea73d377e5714b&quot;<br>
+SRC_URI[threadpool.sha256sum] =3D &quot;d050e60b33d41c19108b32cea32164033a=
9013fe3b46cbd4457559bfbf77afaa&quot;<br>
+SRC_URI[time.sha256sum] =3D &quot;6db9e6914ab8b1ae1c260a4ae7a49b6c5611b403=
28a735b21862567685e73255&quot;<br>
+SRC_URI[typenum.sha256sum] =3D &quot;dcf81ac59edc17cc8697ff311e8f5ef2d99fc=
bd9817b34cec66f90b6c3dfd987&quot;<br>
+SRC_URI[unicode-xid.sha256sum] =3D &quot;8ccb82d61f80a663efe1f787a51b16b5a=
51e3314d6ac365b08639f52387b33f3&quot;<br>
+SRC_URI[urlencoding.sha256sum] =3D &quot;68b90931029ab9b034b300b797048cf23=
723400aa757e8a2bfb9d748102f9821&quot;<br>
+SRC_URI[uuid.sha256sum] =3D &quot;bc5cf98d8186244414c848017f0e2676b3fcb468=
07f6668a97dfe67359a3c4b7&quot;<br>
+SRC_URI[version_check.sha256sum] =3D &quot;49874b5167b65d7193b8aba1567f5c7=
d93d001cafc34600cee003eda787e483f&quot;<br>
+SRC_URI[wasi.sha256sum] =3D &quot;1a143597ca7c7793eff794def352d41792a93c48=
1eb1042423ff7ff72ba2c31f&quot;<br>
+SRC_URI[winapi.sha256sum] =3D &quot;5c839a674fcd7a98952e593242ea400abe9399=
2746761e38641405d28b00f419&quot;<br>
+SRC_URI[winapi-i686-pc-windows-gnu.sha256sum] =3D &quot;ac3b87c63620426dd9=
b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6&quot;<br>
+SRC_URI[winapi-util.sha256sum] =3D &quot;70ec6ce85bb158151cae5e5c87f95a8e9=
7d2c0c4b001223f33a334e3ce5de178&quot;<br>
+SRC_URI[winapi-x86_64-pc-windows-gnu.sha256sum] =3D &quot;712e227841d057c1=
ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f&quot;<br>
diff --git a/meta-python/recipes-devtools/python/python3-pyruvate/Cargo.loc=
k b/meta-python/recipes-devtools/python/python3-pyruvate/Cargo.lock<br>
new file mode 100644<br>
index 000000000..82631c744<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-pyruvate/Cargo.lock<br>
@@ -0,0 +1,841 @@<br>
+# This file is automatically @generated by Cargo.<br>
+# It is not intended for manual editing.<br>
+version =3D 3<br>
+<br>
+[[package]]<br>
+name =3D &quot;aho-corasick&quot;<br>
+version =3D &quot;0.7.18&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;1e37cfd5e7657ada45f742d6e99ca5788580b5c529dc78faf11ece6=
dc702656f&quot;<br>
+dependencies =3D [<br>
+ &quot;memchr&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;atty&quot;<br>
+version =3D &quot;0.2.14&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;d9b39be18770d11421cdb1b9947a45dd3f37e93092cbf377614828a=
319d5fee8&quot;<br>
+dependencies =3D [<br>
+ &quot;hermit-abi&quot;,<br>
+ &quot;libc&quot;,<br>
+ &quot;winapi&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;autocfg&quot;<br>
+version =3D &quot;1.0.1&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;cdb031dd78e28731d87d56cc8ffef4a8f36ca26c38fe2de700543e6=
27f8a464a&quot;<br>
+<br>
+[[package]]<br>
+name =3D &quot;bitflags&quot;<br>
+version =3D &quot;1.3.2&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06f=
b1037718a&quot;<br>
+<br>
+[[package]]<br>
+name =3D &quot;block-buffer&quot;<br>
+version =3D &quot;0.9.0&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;4152116fd6e9dadb291ae18fc1ec3575ed6d84c29642d97890f4b4a=
3417297e4&quot;<br>
+dependencies =3D [<br>
+ &quot;generic-array&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;cc&quot;<br>
+version =3D &quot;1.0.72&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;22a9137b95ea06864e018375b72adfb7db6e6f68cfc8df5a04d0028=
8050485ee&quot;<br>
+<br>
+[[package]]<br>
+name =3D &quot;cfg-if&quot;<br>
+version =3D &quot;1.0.0&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117=
bd2da40fd&quot;<br>
+<br>
+[[package]]<br>
+name =3D &quot;chrono&quot;<br>
+version =3D &quot;0.4.19&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;670ad68c9088c2a963aaa298cb369688cf3f9465ce5e2d4ca10e6e0=
098a1ce73&quot;<br>
+dependencies =3D [<br>
+ &quot;libc&quot;,<br>
+ &quot;num-integer&quot;,<br>
+ &quot;num-traits&quot;,<br>
+ &quot;time&quot;,<br>
+ &quot;winapi&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;cpufeatures&quot;<br>
+version =3D &quot;0.2.1&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;95059428f66df56b63431fdb4e1947ed2190586af5c5a8a8b71122b=
df5a7f469&quot;<br>
+dependencies =3D [<br>
+ &quot;libc&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;cpython&quot;<br>
+version =3D &quot;0.7.0&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;b7d46ba8ace7f3a1d204ac5060a706d0a68de6b42eafb6a586cc08b=
ebcffe664&quot;<br>
+dependencies =3D [<br>
+ &quot;libc&quot;,<br>
+ &quot;num-traits&quot;,<br>
+ &quot;paste&quot;,<br>
+ &quot;python3-sys&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;crossbeam&quot;<br>
+version =3D &quot;0.8.1&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;4ae5588f6b3c3cb05239e90bd110f257254aecd01e4635400391aea=
e07497845&quot;<br>
+dependencies =3D [<br>
+ &quot;cfg-if&quot;,<br>
+ &quot;crossbeam-channel&quot;,<br>
+ &quot;crossbeam-deque&quot;,<br>
+ &quot;crossbeam-epoch&quot;,<br>
+ &quot;crossbeam-queue&quot;,<br>
+ &quot;crossbeam-utils&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;crossbeam-channel&quot;<br>
+version =3D &quot;0.5.2&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;e54ea8bc3fb1ee042f5aace6e3c6e025d3874866da222930f70ce62=
aceba0bfa&quot;<br>
+dependencies =3D [<br>
+ &quot;cfg-if&quot;,<br>
+ &quot;crossbeam-utils&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;crossbeam-deque&quot;<br>
+version =3D &quot;0.8.1&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;6455c0ca19f0d2fbf751b908d5c55c1f5cbc65e03c4225427254b46=
890bdde1e&quot;<br>
+dependencies =3D [<br>
+ &quot;cfg-if&quot;,<br>
+ &quot;crossbeam-epoch&quot;,<br>
+ &quot;crossbeam-utils&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;crossbeam-epoch&quot;<br>
+version =3D &quot;0.9.6&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;97242a70df9b89a65d0b6df3c4bf5b9ce03c5b7309019777fbde37e=
7537f8762&quot;<br>
+dependencies =3D [<br>
+ &quot;cfg-if&quot;,<br>
+ &quot;crossbeam-utils&quot;,<br>
+ &quot;lazy_static&quot;,<br>
+ &quot;memoffset&quot;,<br>
+ &quot;scopeguard&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;crossbeam-queue&quot;<br>
+version =3D &quot;0.3.3&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;b979d76c9fcb84dffc80a73f7290da0f83e4c95773494674cb44b76=
d13a7a110&quot;<br>
+dependencies =3D [<br>
+ &quot;cfg-if&quot;,<br>
+ &quot;crossbeam-utils&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;crossbeam-utils&quot;<br>
+version =3D &quot;0.8.6&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;cfcae03edb34f947e64acdb1c33ec169824e20657e9ecb61cef6c8c=
74dcb8120&quot;<br>
+dependencies =3D [<br>
+ &quot;cfg-if&quot;,<br>
+ &quot;lazy_static&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;crypto-mac&quot;<br>
+version =3D &quot;0.11.1&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;b1d1a86f49236c215f271d40892d5fc950490551400b02ef360692c=
29815c714&quot;<br>
+dependencies =3D [<br>
+ &quot;generic-array&quot;,<br>
+ &quot;subtle&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;ctrlc&quot;<br>
+version =3D &quot;3.2.1&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;a19c6cedffdc8c03a3346d723eb20bd85a13362bb96dc2ac000842c=
6381ec7bf&quot;<br>
+dependencies =3D [<br>
+ &quot;nix&quot;,<br>
+ &quot;winapi&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;digest&quot;<br>
+version =3D &quot;0.9.0&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;d3dd60d1080a57a05ab032377049e0591415d2b31afd7028356dbf3=
cc6dcb066&quot;<br>
+dependencies =3D [<br>
+ &quot;generic-array&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;encoding&quot;<br>
+version =3D &quot;0.2.33&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;6b0d943856b990d12d3b55b359144ff341533e516d94098b1d3fc1a=
c666d36ec&quot;<br>
+dependencies =3D [<br>
+ &quot;encoding-index-japanese&quot;,<br>
+ &quot;encoding-index-korean&quot;,<br>
+ &quot;encoding-index-simpchinese&quot;,<br>
+ &quot;encoding-index-singlebyte&quot;,<br>
+ &quot;encoding-index-tradchinese&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;encoding-index-japanese&quot;<br>
+version =3D &quot;1.20141219.5&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;04e8b2ff42e9a05335dbf8b5c6f7567e5591d0d916ccef4e0b1710d=
32a0d0c91&quot;<br>
+dependencies =3D [<br>
+ &quot;encoding_index_tests&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;encoding-index-korean&quot;<br>
+version =3D &quot;1.20141219.5&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;4dc33fb8e6bcba213fe2f14275f0963fd16f0a02c878e3095ecfdf5=
bee529d81&quot;<br>
+dependencies =3D [<br>
+ &quot;encoding_index_tests&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;encoding-index-simpchinese&quot;<br>
+version =3D &quot;1.20141219.5&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;d87a7194909b9118fc707194baa434a4e3b0fb6a5a757c73c3adb07=
aa25031f7&quot;<br>
+dependencies =3D [<br>
+ &quot;encoding_index_tests&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;encoding-index-singlebyte&quot;<br>
+version =3D &quot;1.20141219.5&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;3351d5acffb224af9ca265f435b859c7c01537c0849754d3db3fdf2=
bfe2ae84a&quot;<br>
+dependencies =3D [<br>
+ &quot;encoding_index_tests&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;encoding-index-tradchinese&quot;<br>
+version =3D &quot;1.20141219.5&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;fd0e20d5688ce3cab59eb3ef3a2083a5c77bf496cb798dc6fcdb75f=
323890c18&quot;<br>
+dependencies =3D [<br>
+ &quot;encoding_index_tests&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;encoding_index_tests&quot;<br>
+version =3D &quot;0.1.4&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;a246d82be1c9d791c5dfde9a2bd045fc3cbba3fa2b11ad558f27d01=
712f00569&quot;<br>
+<br>
+[[package]]<br>
+name =3D &quot;env_logger&quot;<br>
+version =3D &quot;0.9.0&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;0b2cf0344971ee6c64c31be0d530793fba457d322dfec2810c453d0=
ef228f9c3&quot;<br>
+dependencies =3D [<br>
+ &quot;atty&quot;,<br>
+ &quot;humantime&quot;,<br>
+ &quot;log&quot;,<br>
+ &quot;regex&quot;,<br>
+ &quot;termcolor&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;errno&quot;<br>
+version =3D &quot;0.2.8&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;f639046355ee4f37944e44f60642c6f3a7efa3cf6b78c78a0d989a8=
ce6c396a1&quot;<br>
+dependencies =3D [<br>
+ &quot;errno-dragonfly&quot;,<br>
+ &quot;libc&quot;,<br>
+ &quot;winapi&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;errno-dragonfly&quot;<br>
+version =3D &quot;0.1.2&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;aa68f1b12764fab894d2755d2518754e71b4fd80ecfb822714a1206=
c2aab39bf&quot;<br>
+dependencies =3D [<br>
+ &quot;cc&quot;,<br>
+ &quot;libc&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;fastrand&quot;<br>
+version =3D &quot;1.6.0&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;779d043b6a0b90cc4c0ed7ee380a6504394cee7efd7db050e3774ee=
e387324b2&quot;<br>
+dependencies =3D [<br>
+ &quot;instant&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;generic-array&quot;<br>
+version =3D &quot;0.14.5&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;fd48d33ec7f05fbfa152300fdad764757cbded343c1aa1cff2fbaf4=
134851803&quot;<br>
+dependencies =3D [<br>
+ &quot;typenum&quot;,<br>
+ &quot;version_check&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;getrandom&quot;<br>
+version =3D &quot;0.2.3&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;7fcd999463524c52659517fe2cea98493cfe485d10565e7b0fb07db=
ba7ad2753&quot;<br>
+dependencies =3D [<br>
+ &quot;cfg-if&quot;,<br>
+ &quot;libc&quot;,<br>
+ &quot;wasi&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;hermit-abi&quot;<br>
+version =3D &quot;0.1.19&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;62b467343b94ba476dcb2500d242dadbb39557df889310ac77c5d99=
100aaac33&quot;<br>
+dependencies =3D [<br>
+ &quot;libc&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;hmac&quot;<br>
+version =3D &quot;0.11.0&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;2a2a2320eb7ec0ebe8da8f744d7812d9fc4cb4d09344ac01898dbcb=
6a20ae69b&quot;<br>
+dependencies =3D [<br>
+ &quot;crypto-mac&quot;,<br>
+ &quot;digest&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;httparse&quot;<br>
+version =3D &quot;1.5.1&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;acd94fdbe1d4ff688b67b04eee2e17bd50995534a61539e45adfefb=
45e5e5503&quot;<br>
+<br>
+[[package]]<br>
+name =3D &quot;humantime&quot;<br>
+version =3D &quot;2.1.0&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;9a3a5bfb195931eeb336b2a7b4d761daec841b97f947d3439460173=
7a7bba5e4&quot;<br>
+<br>
+[[package]]<br>
+name =3D &quot;instant&quot;<br>
+version =3D &quot;0.1.12&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;7a5bbe824c507c5da5956355e86a746d82e0e1464f65d862cc5e71d=
a70e94b2c&quot;<br>
+dependencies =3D [<br>
+ &quot;cfg-if&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;lazy_static&quot;<br>
+version =3D &quot;1.4.0&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c=
4e18cc646&quot;<br>
+<br>
+[[package]]<br>
+name =3D &quot;libc&quot;<br>
+version =3D &quot;0.2.112&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;1b03d17f364a3a042d5e5d46b053bbbf82c92c9430c592dd4c064dc=
6ee997125&quot;<br>
+<br>
+[[package]]<br>
+name =3D &quot;libsystemd&quot;<br>
+version =3D &quot;0.4.1&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;6f4f0b5b062ba67aa075e331de778082c09e66b5ef32970ea5a1e9c=
37c9555d1&quot;<br>
+dependencies =3D [<br>
+ &quot;hmac&quot;,<br>
+ &quot;libc&quot;,<br>
+ &quot;log&quot;,<br>
+ &quot;nix&quot;,<br>
+ &quot;once_cell&quot;,<br>
+ &quot;serde&quot;,<br>
+ &quot;sha2&quot;,<br>
+ &quot;thiserror&quot;,<br>
+ &quot;uuid&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;log&quot;<br>
+version =3D &quot;0.4.14&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;51b9bbe6c47d51fc3e1a9b945965946b4c44142ab8792c50835a980=
d362c2710&quot;<br>
+dependencies =3D [<br>
+ &quot;cfg-if&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;memchr&quot;<br>
+version =3D &quot;2.4.1&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;308cc39be01b73d0d18f82a0e7b2a3df85245f84af96fdddc5d202d=
27e47b86a&quot;<br>
+<br>
+[[package]]<br>
+name =3D &quot;memoffset&quot;<br>
+version =3D &quot;0.6.5&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;5aa361d4faea93603064a027415f07bd8e1d5c88c9fbf68bf56a285=
428fd79ce&quot;<br>
+dependencies =3D [<br>
+ &quot;autocfg&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;mio&quot;<br>
+version =3D &quot;0.8.0&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;ba272f85fa0b41fc91872be579b3bbe0f56b792aa361a380eb66946=
9f68dafb2&quot;<br>
+dependencies =3D [<br>
+ &quot;libc&quot;,<br>
+ &quot;log&quot;,<br>
+ &quot;miow&quot;,<br>
+ &quot;ntapi&quot;,<br>
+ &quot;winapi&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;miow&quot;<br>
+version =3D &quot;0.3.7&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;b9f1c5b025cda876f66ef43a113f91ebc9f4ccef34843000e0adf6e=
bbab84e21&quot;<br>
+dependencies =3D [<br>
+ &quot;winapi&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;nix&quot;<br>
+version =3D &quot;0.23.1&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;9f866317acbd3a240710c63f065ffb1e4fd466259045ccb504130b7=
f668f35c6&quot;<br>
+dependencies =3D [<br>
+ &quot;bitflags&quot;,<br>
+ &quot;cc&quot;,<br>
+ &quot;cfg-if&quot;,<br>
+ &quot;libc&quot;,<br>
+ &quot;memoffset&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;ntapi&quot;<br>
+version =3D &quot;0.3.6&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;3f6bb902e437b6d86e03cce10a7e2af662292c5dfef23b65899ea3a=
c9354ad44&quot;<br>
+dependencies =3D [<br>
+ &quot;winapi&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;num-integer&quot;<br>
+version =3D &quot;0.1.44&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;d2cc698a63b549a70bc047073d2949cce27cd1c7b0a4a862d08a803=
1bc2801db&quot;<br>
+dependencies =3D [<br>
+ &quot;autocfg&quot;,<br>
+ &quot;num-traits&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;num-traits&quot;<br>
+version =3D &quot;0.2.14&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;9a64b1ec5cda2586e284722486d802acf1f7dbdc623e2bfc57e65ca=
1cd099290&quot;<br>
+dependencies =3D [<br>
+ &quot;autocfg&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;num_cpus&quot;<br>
+version =3D &quot;1.13.1&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;19e64526ebdee182341572e50e9ad03965aa510cd94427a4549448f=
285e957a1&quot;<br>
+dependencies =3D [<br>
+ &quot;hermit-abi&quot;,<br>
+ &quot;libc&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;once_cell&quot;<br>
+version =3D &quot;1.9.0&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;da32515d9f6e6e489d7bc9d84c71b060db7247dc035bbe44eac88cf=
87486d8d5&quot;<br>
+<br>
+[[package]]<br>
+name =3D &quot;opaque-debug&quot;<br>
+version =3D &quot;0.3.0&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;624a8340c38c1b80fd549087862da4ba43e08858af025b236e509b6=
649fc13d5&quot;<br>
+<br>
+[[package]]<br>
+name =3D &quot;paste&quot;<br>
+version =3D &quot;1.0.6&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;0744126afe1a6dd7f394cb50a716dbe086cb06e255e53d8d0185d82=
828358fb5&quot;<br>
+<br>
+[[package]]<br>
+name =3D &quot;ppv-lite86&quot;<br>
+version =3D &quot;0.2.16&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;eb9f9e6e233e5c4a35559a617bf40a4ec447db2e84c20b55a6f8316=
7b7e57872&quot;<br>
+<br>
+[[package]]<br>
+name =3D &quot;proc-macro2&quot;<br>
+version =3D &quot;1.0.36&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;c7342d5883fbccae1cc37a2353b09c87c9b0f3afd73f5fb9bba687a=
1f733b029&quot;<br>
+dependencies =3D [<br>
+ &quot;unicode-xid&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;pyruvate&quot;<br>
+version =3D &quot;1.1.2&quot;<br>
+dependencies =3D [<br>
+ &quot;cfg-if&quot;,<br>
+ &quot;cpython&quot;,<br>
+ &quot;crossbeam&quot;,<br>
+ &quot;crossbeam-channel&quot;,<br>
+ &quot;ctrlc&quot;,<br>
+ &quot;encoding&quot;,<br>
+ &quot;env_logger&quot;,<br>
+ &quot;errno&quot;,<br>
+ &quot;httparse&quot;,<br>
+ &quot;libc&quot;,<br>
+ &quot;libsystemd&quot;,<br>
+ &quot;log&quot;,<br>
+ &quot;mio&quot;,<br>
+ &quot;nix&quot;,<br>
+ &quot;python3-sys&quot;,<br>
+ &quot;rand&quot;,<br>
+ &quot;simplelog&quot;,<br>
+ &quot;spmc&quot;,<br>
+ &quot;tempfile&quot;,<br>
+ &quot;threadpool&quot;,<br>
+ &quot;urlencoding&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;python3-sys&quot;<br>
+version =3D &quot;0.7.0&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;b18b32e64c103d5045f44644d7ddddd65336f7a0521f6fde673240a=
9ecceb77e&quot;<br>
+dependencies =3D [<br>
+ &quot;libc&quot;,<br>
+ &quot;regex&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;quote&quot;<br>
+version =3D &quot;1.0.14&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;47aa80447ce4daf1717500037052af176af5d38cc3e571d9ec1c735=
3fc10c87d&quot;<br>
+dependencies =3D [<br>
+ &quot;proc-macro2&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;rand&quot;<br>
+version =3D &quot;0.8.4&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;2e7573632e6454cf6b99d7aac4ccca54be06da05aca2ef7423d22d2=
7d4d4bcd8&quot;<br>
+dependencies =3D [<br>
+ &quot;libc&quot;,<br>
+ &quot;rand_chacha&quot;,<br>
+ &quot;rand_core&quot;,<br>
+ &quot;rand_hc&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;rand_chacha&quot;<br>
+version =3D &quot;0.3.1&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141=
b9b127d88&quot;<br>
+dependencies =3D [<br>
+ &quot;ppv-lite86&quot;,<br>
+ &quot;rand_core&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;rand_core&quot;<br>
+version =3D &quot;0.6.3&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;d34f1408f55294453790c48b2f1ebbb1c5b4b7563eb1f418bcfcfdb=
b06ebb4e7&quot;<br>
+dependencies =3D [<br>
+ &quot;getrandom&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;rand_hc&quot;<br>
+version =3D &quot;0.3.1&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;d51e9f596de227fda2ea6c84607f5558e196eeaf43c986b724ba4fb=
8fdf497e7&quot;<br>
+dependencies =3D [<br>
+ &quot;rand_core&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;redox_syscall&quot;<br>
+version =3D &quot;0.2.10&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;8383f39639269cde97d255a32bdb68c047337295414940c68bdd30c=
2e13203ff&quot;<br>
+dependencies =3D [<br>
+ &quot;bitflags&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;regex&quot;<br>
+version =3D &quot;1.5.4&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;d07a8629359eb56f1e2fb1652bb04212c072a87ba68546a04065d52=
5673ac461&quot;<br>
+dependencies =3D [<br>
+ &quot;aho-corasick&quot;,<br>
+ &quot;memchr&quot;,<br>
+ &quot;regex-syntax&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;regex-syntax&quot;<br>
+version =3D &quot;0.6.25&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;f497285884f3fcff424ffc933e56d7cbca511def0c9831a7f9b5f61=
53e3cc89b&quot;<br>
+<br>
+[[package]]<br>
+name =3D &quot;remove_dir_all&quot;<br>
+version =3D &quot;0.5.3&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;3acd125665422973a33ac9d3dd2df85edad0f4ae9b00dafb1a05e43=
a9f5ef8e7&quot;<br>
+dependencies =3D [<br>
+ &quot;winapi&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;scopeguard&quot;<br>
+version =3D &quot;1.1.0&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb=
20baa78cd&quot;<br>
+<br>
+[[package]]<br>
+name =3D &quot;serde&quot;<br>
+version =3D &quot;1.0.133&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;97565067517b60e2d1ea8b268e59ce036de907ac523ad83a0475da0=
4e818989a&quot;<br>
+dependencies =3D [<br>
+ &quot;serde_derive&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;serde_derive&quot;<br>
+version =3D &quot;1.0.133&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;ed201699328568d8d08208fdd080e3ff594e6c422e438b6705905da=
01005d537&quot;<br>
+dependencies =3D [<br>
+ &quot;proc-macro2&quot;,<br>
+ &quot;quote&quot;,<br>
+ &quot;syn&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;sha2&quot;<br>
+version =3D &quot;0.9.9&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;4d58a1e1bf39749807d89cf2d98ac2dfa0ff1cb3faa38fbb64dd88a=
c8013d800&quot;<br>
+dependencies =3D [<br>
+ &quot;block-buffer&quot;,<br>
+ &quot;cfg-if&quot;,<br>
+ &quot;cpufeatures&quot;,<br>
+ &quot;digest&quot;,<br>
+ &quot;opaque-debug&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;simplelog&quot;<br>
+version =3D &quot;0.11.1&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;ecabc0118918611790b8615670ab79296272cbe09496b6884b02b1e=
929c20886&quot;<br>
+dependencies =3D [<br>
+ &quot;chrono&quot;,<br>
+ &quot;log&quot;,<br>
+ &quot;termcolor&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;spmc&quot;<br>
+version =3D &quot;0.3.0&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;02a8428da277a8e3a15271d79943e80ccc2ef254e78813a166a08d6=
5e4c3ece5&quot;<br>
+<br>
+[[package]]<br>
+name =3D &quot;subtle&quot;<br>
+version =3D &quot;2.4.1&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;6bdef32e8150c2a081110b42772ffe7d7c9032b606bc226c8260fd9=
7e0976601&quot;<br>
+<br>
+[[package]]<br>
+name =3D &quot;syn&quot;<br>
+version =3D &quot;1.0.85&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;a684ac3dcd8913827e18cd09a68384ee66c1de24157e3c556c9ab16=
d85695fb7&quot;<br>
+dependencies =3D [<br>
+ &quot;proc-macro2&quot;,<br>
+ &quot;quote&quot;,<br>
+ &quot;unicode-xid&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;tempfile&quot;<br>
+version =3D &quot;3.3.0&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;5cdb1ef4eaeeaddc8fbd371e5017057064af0911902ef36b39801f6=
7cc6d79e4&quot;<br>
+dependencies =3D [<br>
+ &quot;cfg-if&quot;,<br>
+ &quot;fastrand&quot;,<br>
+ &quot;libc&quot;,<br>
+ &quot;redox_syscall&quot;,<br>
+ &quot;remove_dir_all&quot;,<br>
+ &quot;winapi&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;termcolor&quot;<br>
+version =3D &quot;1.1.2&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;2dfed899f0eb03f32ee8c6a0aabdb8a7949659e3466561fc0adf54e=
26d88c5f4&quot;<br>
+dependencies =3D [<br>
+ &quot;winapi-util&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;thiserror&quot;<br>
+version =3D &quot;1.0.30&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;854babe52e4df1653706b98fcfc05843010039b406875930a70e4d9=
644e5c417&quot;<br>
+dependencies =3D [<br>
+ &quot;thiserror-impl&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;thiserror-impl&quot;<br>
+version =3D &quot;1.0.30&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;aa32fd3f627f367fe16f893e2597ae3c05020f8bba2666a4e6ea73d=
377e5714b&quot;<br>
+dependencies =3D [<br>
+ &quot;proc-macro2&quot;,<br>
+ &quot;quote&quot;,<br>
+ &quot;syn&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;threadpool&quot;<br>
+version =3D &quot;1.8.1&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;d050e60b33d41c19108b32cea32164033a9013fe3b46cbd4457559b=
fbf77afaa&quot;<br>
+dependencies =3D [<br>
+ &quot;num_cpus&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;time&quot;<br>
+version =3D &quot;0.1.44&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;6db9e6914ab8b1ae1c260a4ae7a49b6c5611b40328a735b21862567=
685e73255&quot;<br>
+dependencies =3D [<br>
+ &quot;libc&quot;,<br>
+ &quot;wasi&quot;,<br>
+ &quot;winapi&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;typenum&quot;<br>
+version =3D &quot;1.15.0&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;dcf81ac59edc17cc8697ff311e8f5ef2d99fcbd9817b34cec66f90b=
6c3dfd987&quot;<br>
+<br>
+[[package]]<br>
+name =3D &quot;unicode-xid&quot;<br>
+version =3D &quot;0.2.2&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;8ccb82d61f80a663efe1f787a51b16b5a51e3314d6ac365b08639f5=
2387b33f3&quot;<br>
+<br>
+[[package]]<br>
+name =3D &quot;urlencoding&quot;<br>
+version =3D &quot;2.1.0&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;68b90931029ab9b034b300b797048cf23723400aa757e8a2bfb9d74=
8102f9821&quot;<br>
+<br>
+[[package]]<br>
+name =3D &quot;uuid&quot;<br>
+version =3D &quot;0.8.2&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;bc5cf98d8186244414c848017f0e2676b3fcb46807f6668a97dfe67=
359a3c4b7&quot;<br>
+dependencies =3D [<br>
+ &quot;serde&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;version_check&quot;<br>
+version =3D &quot;0.9.4&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003ed=
a787e483f&quot;<br>
+<br>
+[[package]]<br>
+name =3D &quot;wasi&quot;<br>
+version =3D &quot;0.10.0+wasi-snapshot-preview1&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;1a143597ca7c7793eff794def352d41792a93c481eb1042423ff7ff=
72ba2c31f&quot;<br>
+<br>
+[[package]]<br>
+name =3D &quot;winapi&quot;<br>
+version =3D &quot;0.3.9&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;5c839a674fcd7a98952e593242ea400abe93992746761e38641405d=
28b00f419&quot;<br>
+dependencies =3D [<br>
+ &quot;winapi-i686-pc-windows-gnu&quot;,<br>
+ &quot;winapi-x86_64-pc-windows-gnu&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;winapi-i686-pc-windows-gnu&quot;<br>
+version =3D &quot;0.4.0&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb=
6ab51b7b6&quot;<br>
+<br>
+[[package]]<br>
+name =3D &quot;winapi-util&quot;<br>
+version =3D &quot;0.1.5&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e=
3ce5de178&quot;<br>
+dependencies =3D [<br>
+ &quot;winapi&quot;,<br>
+]<br>
+<br>
+[[package]]<br>
+name =3D &quot;winapi-x86_64-pc-windows-gnu&quot;<br>
+version =3D &quot;0.4.0&quot;<br>
+source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.i=
o-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/=
crates.io-index</a>&quot;<br>
+checksum =3D &quot;712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cf=
c1931183f&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pyruvate_1.1.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyruvate_1.=
1.2.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pyruvate_1.1.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyruvate_1.=
1.2.bb</a><br>
index 1f1c186d3..296f4fdb8 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pyruvat=
e_1.1.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyruvate_1.1.2.bb<=
/a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pyruvat=
e_1.1.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyruvate_1.1.2.bb<=
/a><br>
@@ -12,7 +12,7 @@ SRC_URI[sha256sum] =3D &quot;10befedd97e73fc18b902d02aa3b=
24e8978aa162242c1b664849c886c0<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/pyruvate-${PV}&quot;<br>
<br>
-inherit pypi python_setuptools3_rust<br>
+inherit pypi python_setuptools3_rust cargo-update-recipe-crates<br>
<br>
=C2=A0PIP_INSTALL_DIST_PATH =3D &quot;${S}/dist&quot;<br>
<br>
@@ -24,102 +24,19 @@ RUSTFLAGS:append:mipsel =3D &quot; --cfg crossbeam_no_=
atomic_64&quot;<br>
=C2=A0RUSTFLAGS:append:powerpc =3D &quot; --cfg crossbeam_no_atomic_64&quot=
;<br>
=C2=A0RUSTFLAGS:append:riscv32 =3D &quot; --cfg crossbeam_no_atomic_64&quot=
;<br>
<br>
-SRC_URI +=3D &quot; \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/aho-corasick/0.7.18" rel=
=3D"noreferrer" target=3D"_blank">crates.io/aho-corasick/0.7.18</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/atty/0.2.14" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/atty/0.2.14</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/autocfg/1.0.1" rel=3D"no=
referrer" target=3D"_blank">crates.io/autocfg/1.0.1</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bitflags/1.3.2" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/bitflags/1.3.2</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/block-buffer/0.9.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/block-buffer/0.9.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cc/1.0.72" rel=3D"norefe=
rrer" target=3D"_blank">crates.io/cc/1.0.72</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cfg-if/1.0.0" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/cfg-if/1.0.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/chrono/0.4.19" rel=3D"no=
referrer" target=3D"_blank">crates.io/chrono/0.4.19</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cpufeatures/0.2.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/cpufeatures/0.2.1</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cpython/0.7.0" rel=3D"no=
referrer" target=3D"_blank">crates.io/cpython/0.7.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-channel/0.5.2"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-channel/0.5.2</a>=
 \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-deque/0.8.1" r=
el=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-deque/0.8.1</a> \<b=
r>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-epoch/0.9.6" r=
el=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-epoch/0.9.6</a> \<b=
r>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-queue/0.3.3" r=
el=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-queue/0.3.3</a> \<b=
r>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-utils/0.8.6" r=
el=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-utils/0.8.6</a> \<b=
r>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam/0.8.1" rel=3D"=
noreferrer" target=3D"_blank">crates.io/crossbeam/0.8.1</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crypto-mac/0.11.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/crypto-mac/0.11.1</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ctrlc/3.2.1" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/ctrlc/3.2.1</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/digest/0.9.0" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/digest/0.9.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/encoding-index-japanese/=
1.20141219.5" rel=3D"noreferrer" target=3D"_blank">crates.io/encoding-index=
-japanese/1.20141219.5</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/encoding-index-korean/1.=
20141219.5" rel=3D"noreferrer" target=3D"_blank">crates.io/encoding-index-k=
orean/1.20141219.5</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/encoding-index-simpchine=
se/1.20141219.5" rel=3D"noreferrer" target=3D"_blank">crates.io/encoding-in=
dex-simpchinese/1.20141219.5</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/encoding-index-singlebyt=
e/1.20141219.5" rel=3D"noreferrer" target=3D"_blank">crates.io/encoding-ind=
ex-singlebyte/1.20141219.5</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/encoding-index-tradchine=
se/1.20141219.5" rel=3D"noreferrer" target=3D"_blank">crates.io/encoding-in=
dex-tradchinese/1.20141219.5</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/encoding/0.2.33" rel=3D"=
noreferrer" target=3D"_blank">crates.io/encoding/0.2.33</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/encoding_index_tests/0.1=
.4" rel=3D"noreferrer" target=3D"_blank">crates.io/encoding_index_tests/0.1=
.4</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/env_logger/0.9.0" rel=3D=
"noreferrer" target=3D"_blank">crates.io/env_logger/0.9.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/errno-dragonfly/0.1.2" r=
el=3D"noreferrer" target=3D"_blank">crates.io/errno-dragonfly/0.1.2</a> \<b=
r>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/errno/0.2.8" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/errno/0.2.8</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/fastrand/1.6.0" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/fastrand/1.6.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/generic-array/0.14.5" re=
l=3D"noreferrer" target=3D"_blank">crates.io/generic-array/0.14.5</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/getrandom/0.2.3" rel=3D"=
noreferrer" target=3D"_blank">crates.io/getrandom/0.2.3</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/hermit-abi/0.1.19" rel=
=3D"noreferrer" target=3D"_blank">crates.io/hermit-abi/0.1.19</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/hmac/0.11.0" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/hmac/0.11.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/httparse/1.5.1" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/httparse/1.5.1</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/humantime/2.1.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/humantime/2.1.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/instant/0.1.12" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/instant/0.1.12</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lazy_static/1.4.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/lazy_static/1.4.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libc/0.2.120" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/libc/0.2.120</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libsystemd/0.4.1" rel=3D=
"noreferrer" target=3D"_blank">crates.io/libsystemd/0.4.1</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/log/0.4.14" rel=3D"noref=
errer" target=3D"_blank">crates.io/log/0.4.14</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memchr/2.4.1" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/memchr/2.4.1</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memoffset/0.6.5" rel=3D"=
noreferrer" target=3D"_blank">crates.io/memoffset/0.6.5</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/mio/0.8.0" rel=3D"norefe=
rrer" target=3D"_blank">crates.io/mio/0.8.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/miow/0.3.7" rel=3D"noref=
errer" target=3D"_blank">crates.io/miow/0.3.7</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/nix/0.23.1" rel=3D"noref=
errer" target=3D"_blank">crates.io/nix/0.23.1</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ntapi/0.3.6" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/ntapi/0.3.6</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/num-integer/0.1.44" rel=
=3D"noreferrer" target=3D"_blank">crates.io/num-integer/0.1.44</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/num-traits/0.2.14" rel=
=3D"noreferrer" target=3D"_blank">crates.io/num-traits/0.2.14</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/num_cpus/1.13.1" rel=3D"=
noreferrer" target=3D"_blank">crates.io/num_cpus/1.13.1</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/once_cell/1.9.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/once_cell/1.9.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/opaque-debug/0.3.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/opaque-debug/0.3.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/paste/1.0.6" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/paste/1.0.6</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ppv-lite86/0.2.16" rel=
=3D"noreferrer" target=3D"_blank">crates.io/ppv-lite86/0.2.16</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro2/1.0.36" rel=
=3D"noreferrer" target=3D"_blank">crates.io/proc-macro2/1.0.36</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/python3-sys/0.7.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/python3-sys/0.7.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quote/1.0.14" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/quote/1.0.14</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand/0.8.4" rel=3D"noref=
errer" target=3D"_blank">crates.io/rand/0.8.4</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_chacha/0.3.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/rand_chacha/0.3.1</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_core/0.6.3" rel=3D"=
noreferrer" target=3D"_blank">crates.io/rand_core/0.6.3</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_hc/0.3.1" rel=3D"no=
referrer" target=3D"_blank">crates.io/rand_hc/0.3.1</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/redox_syscall/0.2.10" re=
l=3D"noreferrer" target=3D"_blank">crates.io/redox_syscall/0.2.10</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/regex-syntax/0.6.25" rel=
=3D"noreferrer" target=3D"_blank">crates.io/regex-syntax/0.6.25</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/regex/1.5.4" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/regex/1.5.4</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/remove_dir_all/0.5.3" re=
l=3D"noreferrer" target=3D"_blank">crates.io/remove_dir_all/0.5.3</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/scopeguard/1.1.0" rel=3D=
"noreferrer" target=3D"_blank">crates.io/scopeguard/1.1.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde/1.0.133" rel=3D"no=
referrer" target=3D"_blank">crates.io/serde/1.0.133</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde_derive/1.0.133" re=
l=3D"noreferrer" target=3D"_blank">crates.io/serde_derive/1.0.133</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/sha2/0.9.9" rel=3D"noref=
errer" target=3D"_blank">crates.io/sha2/0.9.9</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/simplelog/0.11.1" rel=3D=
"noreferrer" target=3D"_blank">crates.io/simplelog/0.11.1</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/spmc/0.3.0" rel=3D"noref=
errer" target=3D"_blank">crates.io/spmc/0.3.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/subtle/2.4.1" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/subtle/2.4.1</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/1.0.85" rel=3D"noref=
errer" target=3D"_blank">crates.io/syn/1.0.85</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/tempfile/3.3.0" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/tempfile/3.3.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/termcolor/1.1.2" rel=3D"=
noreferrer" target=3D"_blank">crates.io/termcolor/1.1.2</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/thiserror-impl/1.0.30" r=
el=3D"noreferrer" target=3D"_blank">crates.io/thiserror-impl/1.0.30</a> \<b=
r>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/thiserror/1.0.30" rel=3D=
"noreferrer" target=3D"_blank">crates.io/thiserror/1.0.30</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/threadpool/1.8.1" rel=3D=
"noreferrer" target=3D"_blank">crates.io/threadpool/1.8.1</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/time/0.1.44" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/time/0.1.44</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/typenum/1.15.0" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/typenum/1.15.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-xid/0.2.2" rel=
=3D"noreferrer" target=3D"_blank">crates.io/unicode-xid/0.2.2</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/urlencoding/2.1.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/urlencoding/2.1.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/uuid/0.8.2" rel=3D"noref=
errer" target=3D"_blank">crates.io/uuid/0.8.2</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/version_check/0.9.4" rel=
=3D"noreferrer" target=3D"_blank">crates.io/version_check/0.9.4</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasi/0.10.0+wasi-snapsho=
t-preview1" rel=3D"noreferrer" target=3D"_blank">crates.io/wasi/0.10.0+wasi=
-snapshot-preview1</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi-i686-pc-windows-g=
nu/0.4.0" rel=3D"noreferrer" target=3D"_blank">crates.io/winapi-i686-pc-win=
dows-gnu/0.4.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi-util/0.1.5" rel=
=3D"noreferrer" target=3D"_blank">crates.io/winapi-util/0.1.5</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi-x86_64-pc-windows=
-gnu/0.4.0" rel=3D"noreferrer" target=3D"_blank">crates.io/winapi-x86_64-pc=
-windows-gnu/0.4.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi/0.3.9" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/winapi/0.3.9</a> \<br>
-&quot;<br>
+require ${BPN}-crates.inc<br>
+<br>
=C2=A0SRC_URI +=3D &quot;\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-linux.rs-Define-cons=
ts-for-rv32-architecture.patch;patchdir=3D../cargo_home/bitbake/nix-0.23.1/=
 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+=C2=A0 =C2=A0 file://0001-linux.rs-Define-consts-for-rv32-architecture.pat=
ch;patchdir=3D../cargo_home/bitbake/nix-0.23.1/ \<br>
+=C2=A0 =C2=A0 file://Cargo.lock \<br>
+&quot;<br>
=C2=A0SRC_URI:append:mips =3D &quot; file://0001-check-for-mips-targets-for=
-stat.st_dev-definitions.patch;patchdir=3D../cargo_home/bitbake/libsystemd-=
0.4.1/&quot;<br>
<br>
+do_update_crates:prepend() {<br>
+=C2=A0 =C2=A0 # The Cargo.lock file is not present in the current version =
downloaded frop pypi<br>
+=C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/Cargo.lock ${S}/Cargo.lock<br>
+}<br>
+<br>
=C2=A0# The following configs &amp; dependencies are from setuptools extras=
_require.<br>
=C2=A0# These dependencies are optional, hence can be controlled via PACKAG=
ECONFIG.<br>
=C2=A0# The upstream names may not correspond exactly to bitbake package na=
mes.<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#101575): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/101575" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/101575</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97649026/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
97649026/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>
</blockquote></div>

--0000000000001d643e05f705ecde--

