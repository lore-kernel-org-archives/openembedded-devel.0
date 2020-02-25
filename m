Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 99E36616C9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 15:57:10 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id g6so5655282plp.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 07:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=WbCW+XXb1O2BCiBKFdShPiuNyEfZfVyqdwzr3iz1u34=;
	b=id5ABzEiab55M4hj3wLXhwAXh9gw1lJs0kjSXQmWr2zayg4GuayhSoKPQJW2RQJ22H
	ItmGsVKJuZrG0Oe6adyEYTDuG614sF2/4S8lwToIJ6pmPRT63pzV5IbuJX/t5C2pI8/L
	AhxpUBYPQepot043kaFXA9Ax6Pd7gas54EwPZSkta+cF+fXTyD+9nMj5QgAUcuUCbhti
	70uVNEDGr4ndYQy7cVjwQ4bpTZC63C7bouiuQORv3KXDe7YyEC2ABwox0qVkfXzwvnYG
	x+5ecDgLpySTU8IIoZRuEn9VSwwQO2kLRV37tKr2FZwUqcsTQkm0N8lnWkcQq3JIEv4s
	JdoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=WbCW+XXb1O2BCiBKFdShPiuNyEfZfVyqdwzr3iz1u34=;
	b=hcpa0HPbcGn8ehYkepm6of0BxPsN0jmpKqfBjFv28e0CP6LP7/6GT9F/jTzhAnCs+g
	CZYWt8KADO0Ly6X9u4L+HqzKSKljuqR40G5iVQlua9k1/tkX0YaoJ7Pphes6wEp02mBi
	y5DiMDok/oEYVA8/oA3KrnTM6LP8ECCbctkiea4F/g/l0cMVpxuzQ0SsSAlAmwVL7Geq
	dowa6B0OFXHuI6voppY2StPErTtyDFib+6z0m1zcRTjAuu+YFse8OS87uxTZ9aXhJYqr
	rCIUjRxaqYXVStMJCD7yIiv9lE9QY7xoFHd1/ucB5iwEN8mblvVO9e06BgpWfwpFmnYV
	vl5g==
X-Gm-Message-State: APjAAAVVv8Gsh2ACZHo3S5nCYdl+GkOuc5IsCzD/bNl22ziKH19+Cv2X
	eqRdlPxEUruoNbcLgoUxxnLkBu88e9w=
X-Google-Smtp-Source: APXvYqwerajl9zr0Ib8OHdctGn3SvB+OdUmxqykpXK3O3KfIVvA1odAPg+6cfy28ib97IP76Up9P4A==
X-Received: by 2002:a17:90a:d783:: with SMTP id z3mr5745468pju.3.1582646231369;
	Tue, 25 Feb 2020 07:57:11 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:a81f:d24b:3e8b:cce0?
	([2601:646:9200:4e0:a81f:d24b:3e8b:cce0])
	by smtp.gmail.com with ESMTPSA id
	s130sm18637254pfc.62.2020.02.25.07.57.09
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 25 Feb 2020 07:57:10 -0800 (PST)
To: Leo Yan <leo.yan@linaro.org>
References: <20200225063711.4848-1-leo.yan@linaro.org>
	<263955b2-9b82-f24c-172c-0761d86a1391@gmail.com>
	<20200225073129.GA1169@leoy-ThinkPad-X240s>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <8e32456d-c86d-3e87-9588-d8dc075ce061@gmail.com>
Date: Tue, 25 Feb 2020 07:57:09 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200225073129.GA1169@leoy-ThinkPad-X240s>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3] luajit: Upgrade to 2.1.0-beta3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Feb 2020 15:57:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 2/24/20 11:38 PM, Leo Yan wrote:
> Hi Khem,
> 
> On Mon, Feb 24, 2020 at 10:41:04PM -0800, Khem Raj wrote:
>>
>>
>> On 2/24/20 10:37 PM, Leo Yan wrote:
>>> Since luajit 2.1.0-beta3 can support architecture aarch64 and the old
>>> misses to support aarch64, the patch upgrades to luajit 2.1.0-beta3.
>>>
>>> Signed-off-by: Leo Yan <leo.yan@linaro.org>
>>> ---
>>>    .../luajit/luajit/clang.patch                 | 19 -------------------
>>
>>
>> why is this patch dropped ? it building with clang handled differently now ?
>> if so please add a line or two in commit msg
> 
> To be honest, I don't know how to hit the condition for
> '#elif !LJ_TARGET_PS3', and since considering Clang has upgraded to new
> version (9.0.1), this is another reason I dropped this patch.
> 

you could easily excercise the need for it, by adding meta-clang and setting

TOOLCHAIN_pn-luajit = "clang" (in local.conf)
bitbake luajit

> But I cannot give out any concrete reason, will keep this patch.
> 
> Thanks,
> Leo
> 
>>>    .../luajit/{luajit_2.0.5.bb => luajit_git.bb} | 14 ++++++--------
>>>    2 files changed, 6 insertions(+), 27 deletions(-)
>>>    delete mode 100644 meta-oe/recipes-devtools/luajit/luajit/clang.patch
>>>    rename meta-oe/recipes-devtools/luajit/{luajit_2.0.5.bb => luajit_git.bb} (89%)
>>>
>>> diff --git a/meta-oe/recipes-devtools/luajit/luajit/clang.patch b/meta-oe/recipes-devtools/luajit/luajit/clang.patch
>>> deleted file mode 100644
>>> index c39ef6fd4..000000000
>>> --- a/meta-oe/recipes-devtools/luajit/luajit/clang.patch
>>> +++ /dev/null
>>> @@ -1,19 +0,0 @@
>>> -clang pretends to be gcc 4.2.0 which is a big lie when it comes
>>> -to features, its same as latest gcc
>>> -
>>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> -Upstream-Status: Pending
>>> -
>>> -Index: LuaJIT-2.0.5/src/lj_arch.h
>>> -===================================================================
>>> ---- LuaJIT-2.0.5.orig/src/lj_arch.h
>>> -+++ LuaJIT-2.0.5/src/lj_arch.h
>>> -@@ -313,7 +313,7 @@
>>> - #error "Need at least GCC 4.2 or newer"
>>> - #endif
>>> - #elif !LJ_TARGET_PS3
>>> --#if (__GNUC__ < 4) || ((__GNUC__ == 4) && __GNUC_MINOR__ < 3)
>>> -+#if (__GNUC__ < 4) || ((__GNUC__ == 4) && __GNUC_MINOR__ < 3) && !defined(__clang__)
>>> - #error "Need at least GCC 4.3 or newer"
>>> - #endif
>>> - #endif
>>> diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb b/meta-oe/recipes-devtools/luajit/luajit_git.bb
>>> similarity index 89%
>>> rename from meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
>>> rename to meta-oe/recipes-devtools/luajit/luajit_git.bb
>>> index 93128dda8..da798328e 100644
>>> --- a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
>>> +++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
>>> @@ -1,14 +1,13 @@
>>>    SUMMARY = "Just-In-Time Compiler for Lua"
>>>    LICENSE = "MIT"
>>> -LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=10a96c93403affcc34765f4c2612bc22"
>>> +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d739bb9250a55c124a545b588fd76771"
>>>    HOMEPAGE = "http://luajit.org"
>>> -PV .= "+git${SRCPV}"
>>> -SRCREV = "02b521981a1ab919ff2cd4d9bcaee80baf77dce2"
>>> -SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http \
>>> +PV = "2.0.5+2.1.0-beta3"
>>> +SRCREV = "0ad60ccbc3768fa8e3e726858adf261950edbc22"
>>> +SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http;branch=v2.1 \
>>>               file://0001-Do-not-strip-automatically-this-leaves-the-stripping.patch \
>>> -           file://clang.patch \
>>> -"
>>> +           "
>>>    S = "${WORKDIR}/git"
>>> @@ -90,8 +89,7 @@ FILES_${PN}-dev += "${libdir}/libluajit-5.1.a \
>>>    "
>>>    FILES_luajit-common = "${datadir}/${BPN}-${PV}"
>>> -# Aarch64/mips64/ppc/ppc64/riscv64 is not supported in this release
>>> -COMPATIBLE_HOST_aarch64 = "null"
>>> +# mips64/ppc/ppc64/riscv64 is not supported in this release
>>>    COMPATIBLE_HOST_mipsarchn32 = "null"
>>>    COMPATIBLE_HOST_mipsarchn64 = "null"
>>>    COMPATIBLE_HOST_powerpc = "null"
>>>

