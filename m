Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id E10057D274
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2019 03:07:21 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id l21so2890890pgm.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Jul 2019 20:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=QGQRmdCd6oAqsInBlUo+vs6V6qNI72hfcm0PsC+upTQ=;
	b=oQ9mAv5SV8MPR1YfTlO7yaZJdvgsaVf/+Tju1fsE7GC8KoWxVXsPQqen8by0Na/vJV
	a0Jk0ywrKLO7jK+812w4k3quXwv5yA3ztXvfibSxV5srAH86vTBh1LD6buoTkU7nXoTv
	5BOLd9/xeCCmsnUKm1otQ3qan2bkEAYL8hFFsD7cFUgWGOTWEv3sEUewAIPlat+bLoF8
	dNj5yMpDODppwXx79Qhj/gI2QOwONGbiTmD0GufEoLsnNPgkevKR8vsjb1d5oo1UUu57
	Spe+LHyo4ky134DFkNfBE7LCxtgR7d3vhALRlhVnOqKpxgavV7BPKhKr9Pj9TVKSmIAn
	MzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=QGQRmdCd6oAqsInBlUo+vs6V6qNI72hfcm0PsC+upTQ=;
	b=HabIojyvjfc7/HZuU5MoZfRNMSd3uDrQoBawo2Pazi29UEdZk6/YJF3BfomWY5H4a3
	8r/rqraG//5+P0V81KiJeX3WfoDbFrpd3ofsZCw8RqRYfPeX3b3kgmx6p1DmU6iAK252
	v4BaYFuxtcAltzkTyfwHCYnbt0d5zMeHLXiB3b69bkI+g1pt+4hpT7WTXzU7mqA4ND0A
	sT4SPB2iBQm2MYKI4M9cEE87Z5CdxV/onPA0d9fFTzy0l2zJ0it3ewOgioJcJgH9tycE
	PGBmEvYNGVGqat27bY/u1Qd5tZwDmUbuBbNvAuhmMRXgyKx9lp2Q/OmGeL1S8g0gaJUW
	mEhQ==
X-Gm-Message-State: APjAAAUMkrnnicqt7pAkDrjQihD0xtDCVteqoHSdEk09av1fDtsJ1DcQ
	jsAzSt6Gt1py+ZzGqkreeANLHb8LPpI=
X-Google-Smtp-Source: APXvYqypEHK7m/9+0zBitbbHDNmBcjn4OSTBnrhGj/wwdGaWc9BYbUNzuimWDR3csqr2arCpLYXMTg==
X-Received: by 2002:a63:2606:: with SMTP id m6mr20519737pgm.436.1562555242815; 
	Sun, 07 Jul 2019 20:07:22 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:c2e:f46a:e59c:dae7?
	([2601:202:4180:c33:c2e:f46a:e59c:dae7])
	by smtp.gmail.com with ESMTPSA id
	f64sm19263054pfa.115.2019.07.07.20.07.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Jul 2019 20:07:22 -0700 (PDT)
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
	openembedded-devel@lists.openembedded.org
References: <20190708005345.6211-1-open.source@oleksandr-kravchuk.com>
	<02e59b59-5d3c-0c7e-6259-0caebbbf6e6c@gmail.com>
	<94fab41a-9fb7-e3c1-40ba-537c41f059e6@oleksandr-kravchuk.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <8e8ac976-f584-6541-b9e8-750e109f8f95@gmail.com>
Date: Sun, 7 Jul 2019 20:07:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <94fab41a-9fb7-e3c1-40ba-537c41f059e6@oleksandr-kravchuk.com>
Subject: Re: [PATCH][meta-networking] ipvsadm: update to 1.30
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
X-List-Received-Date: Mon, 08 Jul 2019 03:07:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 7/7/19 7:47 PM, Oleksandr Kravchuk wrote:
> On 08/07/2019 04:44, akuster808 wrote:
>> On 7/7/19 5:53 PM, Oleksandr Kravchuk wrote:
>>> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>>> ---
>>>  .../ipvsadm/{ipvsadm_1.29.bb => ipvsadm_1.30.bb}            | 6 +++---
>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>>  rename meta-networking/recipes-support/ipvsadm/{ipvsadm_1.29.bb => ipvsadm_1.30.bb} (90%)
>>>
>>> diff --git a/meta-networking/recipes-support/ipvsadm/ipvsadm_1.29.bb b/meta-networking/recipes-support/ipvsadm/ipvsadm_1.30.bb
>>> similarity index 90%
>>> rename from meta-networking/recipes-support/ipvsadm/ipvsadm_1.29.bb
>>> rename to meta-networking/recipes-support/ipvsadm/ipvsadm_1.30.bb
>>> index 4f3c16dc3..22cb88ac1 100644
>>> --- a/meta-networking/recipes-support/ipvsadm/ipvsadm_1.29.bb
>>> +++ b/meta-networking/recipes-support/ipvsadm/ipvsadm_1.30.bb
>>> @@ -16,14 +16,14 @@ LIC_FILES_CHKSUM = "file://README;beginline=40;endline=56;md5=b4e40069f15598d0e3
>>>  
>>>  DEPENDS += "libnl popt"
>>>  
>>> -SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/utils/kernel/ipvsadm/${BP}.tar.gz \
>>> +SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/utils/kernel/ipvsadm/${BP}.tar.xz \
>> Is the src uri dropping gz files?
>>
>> - armin
> No, it is not. xz is almost always smaller, so I thought it's better to
> use it. Any reasons I shouldn't?
nope. just wasn't mentioned.

Thanks,
Armin
>>>          file://0001-Modify-the-Makefile-for-cross-compile.patch \
>>>          file://0003-ipvsadm-remove-dependency-on-bash.patch \
>>>          file://makefile-add-ldflags.patch \
>>>  "
>>>  
>>> -SRC_URI[md5sum] = "88b35030b4766b3e44ad15aacdef65c4"
>>> -SRC_URI[sha256sum] = "297f5cd459c3eef81ed0ca32e53bf320ed6b132fe7ed6ea5e44aa6b1fbd2a7de"
>>> +SRC_URI[md5sum] = "97f11b6af1920fde5a9d9eac0d7f9e50"
>>> +SRC_URI[sha256sum] = "95573d70df473c9f63fc4ac496c044c69e3a6de7ccac119922210c0b44cd7a0c"
>>>  
>>>  UPSTREAM_CHECK_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/ipvsadm"
>>>  


