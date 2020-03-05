Return-Path: <scott.branden@broadcom.com>
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id C9C88611CC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2020 01:33:52 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id o2so1776705pjp.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Mar 2020 17:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=ium6dU3NcLHrKgxEMXwbFI/ZmmZROjy2Xd6PC4qInaE=;
	b=OyC8bpNfN+a2a12HRtgyWVHTh0BwcVHHgFNo8T3tQC+w3dJuzJ/nY9Rlfrmlj3D+vl
	jbkchgogrPDtIGtezW9zp9Mcmn13/VqtIWPB7j5tlSsW72DFrCyZamxbHuAbEefNpj4S
	z/8jEfLgnGFOmz4iTBHlukIGsci3/NLg8RiPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=ium6dU3NcLHrKgxEMXwbFI/ZmmZROjy2Xd6PC4qInaE=;
	b=VW6D1WLFPanYeHgXVzJNjtiU7uJKooYbBbpwVjPKzI/6LMz5cLXXOcDUcqWInXJfhO
	ny7WPd1RLbp27MUYBCm3+FNaoaoSz44HWqDQw6ZS0Aacl5CdRrwhouKvtVE5bKG0Patw
	VtRFHIxY5xH51Nl+KT25arQOJflHhUyO0R0FlKR/uAbCyu2TqJ92U3p7PaJTuNQo/BTd
	gDJQRZ8gnsmuaxfusHwnpYeaEdkP/gkuamvbG1Zi8H1qbm0o5b/quZAwW50se23FkAUo
	g86EV7rh7KOag63dfRvBx31VyExq8CSGVA1lxV7QQuNkz5KSfLMdxCHgmEvt5n0jq7UN
	bSSg==
X-Gm-Message-State: ANhLgQ0CD1fHQPxr7Q+Y5njTbyUYNUzatkhjOo1Vc2ESOqrpjFZrfsD9
	neDKdGiEzaqqehW5xfMXZ/s7/ZNDP12AOzAnjkvzB1W8IsE5RdnSL5jsXpsr1rcEsqjgF5N+WfG
	H8Q+OlTXYtdCEVP3KA9Q050dO7HgDASnezL3xwCcqYID0Zmi6nhoMJNTHxWhu7yYWhZIdCfKiGq
	D1kOmQiIn+KaMdaz+kTC5ON08kPxPu
X-Google-Smtp-Source: ADFU+vuEKFLnfozi40BF01ARxatfA7O6o9M6BOT1/7JZIZ/pXae3XKsNqJ0TJRpkhOB0XGWM+Th05A==
X-Received: by 2002:a17:902:7d8b:: with SMTP id
	a11mr5189626plm.99.1583372033182; 
	Wed, 04 Mar 2020 17:33:53 -0800 (PST)
Received: from [10.136.13.65] ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id b3sm3875873pjo.30.2020.03.04.17.33.52
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 04 Mar 2020 17:33:52 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>
References: <20200215005402.18661-1-scott.branden@broadcom.com>
	<CAMKF1srJLkYmt=uH7QWDW_-TpeS0FcrVjU3f1Ec_+1_rc4vtwA@mail.gmail.com>
	<CAMKF1sr92Rmpv_ix7zLSLsm_XrZD2CjdaPNn+Pcbp4A2kLS0wg@mail.gmail.com>
From: Scott Branden <scott.branden@broadcom.com>
Message-ID: <65fc29ea-ef37-9b1e-5dd3-316379f0b7eb@broadcom.com>
Date: Wed, 4 Mar 2020 17:33:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sr92Rmpv_ix7zLSLsm_XrZD2CjdaPNn+Pcbp4A2kLS0wg@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH v2] x265: add x265 recipe
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
X-List-Received-Date: Thu, 05 Mar 2020 01:33:52 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Khem,

On 2020-03-03 11:33 p.m., Khem Raj wrote:
> On Tue, Mar 3, 2020 at 10:42 PM Khem Raj <raj.khem@gmail.com> wrote:
>> Hi Scott
>>
>> I am getting a textrel issue reported on musl builds see
>> https://errors.yoctoproject.org/Errors/Details/393681/
>>
>> this recipe is already applied but would be good to root cause this issue
>> and find appropriate fix
>>
>> https://errors.yoctoproject.org/Errors/Details/393681/
> disabling asm helps on 32bit x86
>
> EXTRA_OECMAKE_append_i686 = " -DENABLE_ASSEMBLY=OFF"
>
> can you test this fix and see if this will be ok ?
I'm sorry, I am unable to test this week.
I am ok with you pushing this for 32bit x86 now though - we only test on 
64bit.
>
>> On Fri, Feb 14, 2020 at 4:54 PM Scott Branden via Openembedded-devel
>> <openembedded-devel@lists.openembedded.org> wrote:
>>> Add x265 recipe for latest tag of Release_3.2 branch (3.2.1).
>>>
>>> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
>>> ---
>>>   .../recipes-multimedia/x265/x265_3.2.1.bb     | 22 +++++++++++++++++++
>>>   1 file changed, 22 insertions(+)
>>>   create mode 100644 meta-openembedded/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
>>>
>>> diff --git a/meta-openembedded/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb b/meta-openembedded/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
>>> new file mode 100644
>>> index 0000000000..21ae596e05
>>> --- /dev/null
>>> +++ b/meta-openembedded/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
>>> @@ -0,0 +1,22 @@
>>> +SUMMARY = "H.265/HEVC video encoder"
>>> +DESCRIPTION = "A free software library and application for encoding video streams into the H.265/HEVC format."
>>> +HOMEPAGE = "http://www.videolan.org/developers/x265.html"
>>> +
>>> +LICENSE = "GPLv2"
>>> +LICENSE_FLAGS = "commercial"
>>> +LIC_FILES_CHKSUM = "file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091"
>>> +
>>> +DEPENDS = "nasm-native gnutls zlib libpcre"
>>> +
>>> +SRC_URI = "http://ftp.videolan.org/pub/videolan/x265/x265_${PV}.tar.gz"
>>> +
>>> +S = "${WORKDIR}/x265_${PV}/source"
>>> +
>>> +SRC_URI[md5sum] = "94808045a34d88a857e5eaf3f68f4bca"
>>> +SRC_URI[sha256sum] = "fb9badcf92364fd3567f8b5aa0e5e952aeea7a39a2b864387cec31e3b58cbbcc"
>>> +
>>> +inherit lib_package pkgconfig cmake
>>> +
>>> +AS[unexport] = "1"
>>> +
>>> +COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
>>> --
>>> 2.17.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


