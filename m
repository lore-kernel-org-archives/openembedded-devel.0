Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web08.23028.1617399506528668816
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Apr 2021 14:38:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UmzDSIDJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so3105914pjv.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Apr 2021 14:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Qgln0aWTWrNzqfL8ZU+vgXWfiXjqSKtwQg0JATjeYp8=;
        b=UmzDSIDJsFXy8geM+4f3AqvFnCfRf7x+YGVc1fCUdZ2hZHasP+1SDXg5PV8j7jJK2n
         rs8L7O8hPhE8xZI/xFNyd2gOWLsm/sDUk/LdQ6nd4303T7TnSNKhPO1v7XiPnCbpaeYm
         hEFptcvelQY6qFnlbM7GOUN0XR5ZJXuQl/jnhDUIyx+cBTnN1ZTufazm5CW2IIrNd1De
         knVhbOZkqPLN4fPWA1RKo3ydFLnrw0oXH+VakdbITV0zl4nUj9x0vaPtCJzAMT8m0hL7
         UjFDB/44xMf+IQ7l7LhtzFe4bxFo6CD384lMlF3SpcssJc0DuEQGhLqhwljgRF5Zsagf
         yDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=Qgln0aWTWrNzqfL8ZU+vgXWfiXjqSKtwQg0JATjeYp8=;
        b=Qvy5GxraLcYk2LqcP4GhrMOtoYGTM0OeIrXquDoCkWZyK5jyPm84khnrIJXjMZt7Uz
         vHvt3qPSHHEEZoiiL1eJekyQfcI7HYI37Mfb6Q/VwmiMrpLJ5PF9Ni2iifMmi7Bu95A+
         YvxFgqAooIvofb/237k2IEKJyjnQHnwmu9vPJPFjOoo7tbjTeAe1tx00f7HBT6tEK4C7
         j61kqPPxYDGM9p8+8C0ih5af3EPZMkTMg71hp7BEdqashg05YNSFnOPoozhJGfm/jLas
         Q4+ZqDAUPxcCiuu/+GAmripgWkjvH6g+7Jx2Ox0al29AdCMkMzC/gLS1MuJCxIp/hyJC
         2NiQ==
X-Gm-Message-State: AOAM532VCjT6OuFdYh+D805FPEYRPr/01hSumJOwj1g+OAS1BRp2r0++
	9FdZ4XSpPOBBY6/V1Z6QwCMrOiy696k=
X-Google-Smtp-Source: ABdhPJxAB4UXLeFjfPvQH/7FSclIjsTzeDSonIzd7Gi8wnsLRVYkNvz77n17e2vrGoUMnLJU6mnGHA==
X-Received: by 2002:a17:902:107:b029:e8:c368:542 with SMTP id 7-20020a1709020107b02900e8c3680542mr3898501plb.7.1617399505054;
        Fri, 02 Apr 2021 14:38:25 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:7050:b686:e2e6:21d4? ([2601:202:4180:a5c0:7050:b686:e2e6:21d4])
        by smtp.gmail.com with ESMTPSA id g28sm9011445pfr.120.2021.04.02.14.38.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Apr 2021 14:38:24 -0700 (PDT)
Subject: Re: [oe] [gatesgarth 14/14] python2-target-recipes-blacklist.inc: add and .inc file with conditional blacklist of target python2 recipes
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <cover.1617328609.git.akuster808@gmail.com>
 <9336643e0270a851b2d5653bbc6570eac13da9e7.1617328609.git.akuster808@gmail.com>
 <CA+chaQcXL=CtcfZH3X0L2Jn2KSYNTh7oLrafO8NbPD-kUzLoOg@mail.gmail.com>
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
Message-ID: <07e1c8d5-4d5e-4c4f-be1e-bf4bb7f28949@gmail.com>
Date: Fri, 2 Apr 2021 14:38:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQcXL=CtcfZH3X0L2Jn2KSYNTh7oLrafO8NbPD-kUzLoOg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 4/1/21 11:52 PM, Martin Jansa wrote:
> This was for meta-python2 and it's already merged there.  Please don't
> add it to meta-oe.
you got it,

thanks,
armin
>
> On Fri, Apr 2, 2021 at 3:59 AM akuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     From: Martin Jansa <Martin.Jansa@gmail.com
>     <mailto:Martin.Jansa@gmail.com>>
>
>     * similarly like in hardknott branch where the PNBLACKLIST is added in
>       the recipes, for gatesgarth and dunfell branches I make it more
>       optional by using separate .inc file the distributions can decide to
>       include on their own (e.g. when they need python-native from
>     here but
>       want to prevent someone accidentally depending on some target
>     recipes
>       ending with python2 in their images).
>
>       commit 10c65fc18998d302f34634ffceaf31ab335056dd
>       Author: Martin Jansa <Martin.Jansa@gmail.com
>     <mailto:Martin.Jansa@gmail.com>>
>       Date:   Fri Mar 12 15:44:52 2021 +0100
>
>         recipes: add conditional PNBLACKLIST in all recipes except
>     python-native
>
>         * python-native is an exception because there is still e.g.
>     chromium depending
>           on _native_ python and a lot of people use it in some form, once
>           https://bugs.chromium.org/p/chromium/issues/detail?id=942720
>           is resolved in stable chromium release the same will be set
>     in python-native
>
>         * https://www.python.org/doc/sunset-python-2/
>         * https://python3statement.org/
>
>     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com
>     <mailto:Martin.Jansa@gmail.com>>
>     Signed-off-by: Armin Kuster <akuster808@gmail.com
>     <mailto:akuster808@gmail.com>>
>     ---
>      .../python2-target-recipes-blacklist.inc      | 312
>     ++++++++++++++++++
>      1 file changed, 312 insertions(+)
>      create mode 100644
>     conf/distro/include/python2-target-recipes-blacklist.inc
>
>     diff --git
>     a/conf/distro/include/python2-target-recipes-blacklist.inc
>     b/conf/distro/include/python2-target-recipes-blacklist.inc
>     new file mode 100644
>     index 00000000000..37eb49c5d91
>     --- /dev/null
>     +++ b/conf/distro/include/python2-target-recipes-blacklist.inc
>     @@ -0,0 +1,312 @@
>     +PNBLACKLIST[dnssec-conf] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[gateone] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[gyp-py2] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[meta-python2-image-base.bb
>     <http://meta-python2-image-base.bb>] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[meta-python2-image.bb <http://meta-python2-image.bb>]
>     ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes',
>     '', 'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[meta-python2-ptest-image.bb
>     <http://meta-python2-ptest-image.bb>] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[packagegroup-meta-python2.bb
>     <http://packagegroup-meta-python2.bb>] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-alembic] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-amqp] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-anyjson] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-appdirs] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-asn1crypto] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-astroid] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-atomicwrites] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-attr] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-attrs] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-automat] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-aws-iot-device-sdk-python] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-babel] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-backports-abc] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-backports-functools-lru-cache] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-backports-init] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-backports-ssl] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-bcrypt] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-beautifulsoup4] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-behave] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-bitarray] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-blinker] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-booleanpy] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-cachetools] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-can] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-certifi] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-cffi] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-chardet] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-cheetah] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-click] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-cmd2] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-coloredlogs] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-configargparse] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-configparser] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-constantly] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-contextlib2] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-cpuset] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-crcmod] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-cryptography] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-cryptography-vectors] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-cson] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-cython] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-daemon] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-daemonize] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-dateutil] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-dbus] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-dbusmock] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-decorator] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-deprecated] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-distutils-extra] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-django] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-djangorestframework] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-django-south] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-dnspython] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-docker] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-docker-pycreds] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-docutils] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-dominate] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-editor] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-engineio] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-enum34] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-epydoc] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-evdev] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-feedformatter] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-feedparser] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-flask] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-flask-babel] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-flask-bcrypt] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-flask-bootstrap] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-flask-login] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-flask-mail] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-flask-migrate] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-flask-nav] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-flask-navigation] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-flask-pymongo] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-flask-restful] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-flask-script] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-flask-sijax] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-flask-socketio] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-flask-sqlalchemy] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-flask-uploads] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-flask-user] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-flask-wtf] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-flask-xstatic] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-funcsigs] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-functools32] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-future] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-futures] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-gdata] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-gevent] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-greenlet] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-grpcio] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-grpcio-tools] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-gsocketpool] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-h2] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-hpack] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-html5lib] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-humanfriendly] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-humanize] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-hyperframe] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-hyperlink] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-hypothesis] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-idna] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-imaging] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-importlib-metadata] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-incremental] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-inflection] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-intervals] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-ipaddress] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-ipy] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-iso8601] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-isodate] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-isort] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-itsdangerous] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-javaobj-py3] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-jinja2] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-jsmin] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-jsonpatch] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-jsonpointer] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-jsonref] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-jsonschema] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-kombu] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-lazy-object-proxy] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-ldap] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-license-expression] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-linecache2] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-lockfile] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-lrparsing] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-lxml] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-m2crypto] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-mako] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-markupsafe] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-mccabe] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-mock] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-monotonic] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-more-itertools] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-mprpc] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-msgpack] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-ndg-httpsclient] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-netaddr] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-netifaces] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-networkmanager] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-networkx] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-numeric] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-packaging] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-paho-mqtt] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pam] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pamela] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-parse] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-parse-type] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-passlib] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-paste] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pathlib2] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pbr] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pep8] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-periphery] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pexpect] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pika] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pint] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pip] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pluggy] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-ply] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pretend] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-prettytable] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-priority] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-progress] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-prompt-toolkit] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-protobuf] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-psutil] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-ptyprocess] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-py] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pyalsaaudio] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pyasn1] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pyasn1-modules] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pybind11] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pybluez] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pycodestyle] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pyconnman] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pycparser] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pycrypto] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pycryptodomex] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pycurl] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pydbus] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pyelftools] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pyephem] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pyexpect] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pyfirmata] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pyflakes] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pyflame] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pygobject] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pygpgme] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pyhamcrest] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pyiface] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pyinotify] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pyjks] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pyjwt] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pylint] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pymisp] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pymongo] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pymysql] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pynetlinux] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pyopenssl] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pyparsing] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pyparted] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pyperclip] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pyperf] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pyrex] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pyrex-native] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pyro4] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pyroute2] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pyrsistent] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pyrtm] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pyserial] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pysmi] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pysnmp] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pysocks] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pysqlite] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pystache] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pytest] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pytest-helpers-namespace] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pytest-runner] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pytest-tempdir] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pytoml] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pytun] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pytz] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pyudev] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pyusb] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pywbem] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pyyaml] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-pyzmq] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-rdflib] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-redis] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-requests] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-requests-oauthlib] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-rfc3339-validator] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-rfc3986-validator] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-rfc3987] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-robotframework] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-robotframework-seriallibrary] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-scandir] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-scrypt] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-sdnotify] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-selectors34] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-semver] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-serpent] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-setuptools] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-setuptools-scm] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-sh] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-sijax] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-simplejson] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-singledispatch] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-six] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-slip-dbus] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-smbus] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-snakefood] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-snimpy] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-socketio] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-soupsieve] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-sparts] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-speaklater] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-sqlalchemy] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-sqlparse] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-statistics] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-stevedore] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-strict-rfc3339] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-subprocess32] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-systemd] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-thrift] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-toml] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-tornado] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-tornado-redis] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-tqdm] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-traceback2] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-twisted] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-twitter] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-twofish] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-txws] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-typing] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-tzlocal] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-ujson] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-unidiff] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-urllib3] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-vcversioner] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-versiontools] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-vine] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-visitor] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-vobject] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-waitress] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-wcwidth] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-webcolors] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-webdav] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-webencodings] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-websocket-client] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-werkzeug] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-which] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-whoosh] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-wrapt] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-wtforms] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-xlrd] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-xstatic] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-xstatic-font-awesome] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-yappi] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-zipp] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[python-zopeinterface] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     +PNBLACKLIST[telepathy-python] ?=
>     "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '',
>     'python2 is out of support for long time, read
>     https://www.python.org/doc/sunset-python-2/
>     https://python3statement.org/ and if you really have to
>     temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to
>     "yes"', d)}"
>     -- 
>     2.17.1
>
>
>     
>

