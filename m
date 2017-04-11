Return-Path: <andrey.konovalov@linaro.org>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id A855A77CFB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Apr 2017 19:42:04 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id t144so3840732lff.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Apr 2017 12:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:cc:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=AIyFb940kFjrLBywSOKebtewVDQ4+XNC6D1BrOYzcGY=;
	b=fHX9ChoSdt5zE2W1/3FCAqY4tX5loF8fJ6+goLTQPC7K+RpRsAHpxtc+eFc0hxjKFc
	OJMJO3ebgsLWyiHEYI+NCccehyndlNiMA0vqnZCpaJBiDCl34vRVNNECpbwTAVniOiVe
	5ekJlSfTDboPAmR4zDQGuhUE7wmpKOtHrv5P0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:cc:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=AIyFb940kFjrLBywSOKebtewVDQ4+XNC6D1BrOYzcGY=;
	b=tLQ3Sqxpg3VaHXBhFSsAYw/vBBzsQMgtTMd2b+VdKOMTHoQGxXnFtn9TBad6175ImW
	nelOYu4zUdf1OTt31nkQJF9bEdy5hEVPtT/zai3wWHhhDB+lCeYZdgC1EGsTs3uScCy2
	4BxCqhBPzBBWCEzAmgk/eQPZyn0Nr48BR2KaX3zbQ0tUKlt0gH6DN59AQaf2l2c8/HDX
	U1HXEnKJrHgo5c6J6KnqH8XSvGhSRum9tOpl0VgZpGZbYkyKe40rVIFGEmNmyWqwOWsH
	xti9Azad4LtZcTLlwmAELpT6AJk/vvbqemdY1kLciSMY4kFlIObWna/OY4jSGN5etSD0
	wCdg==
X-Gm-Message-State: AFeK/H0tFGFeNKuEHOESvxkayCub/4hrOObxWa+0WDV5+ADn0GrpVP51baBaD56oHSutNXRm
X-Received: by 10.25.102.2 with SMTP id a2mr17160303lfc.3.1491939725062;
	Tue, 11 Apr 2017 12:42:05 -0700 (PDT)
Received: from [192.168.11.27] (mail.dev.rtsoft.ru. [213.79.90.226])
	by smtp.googlemail.com with ESMTPSA id
	h18sm3713106ljh.5.2017.04.11.12.42.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Apr 2017 12:42:04 -0700 (PDT)
To: Andre McCurdy <armccurdy@gmail.com>
References: <1491590447-19476-1-git-send-email-andrey.konovalov@linaro.org>
	<CAJ86T=US2yATN4uK55O2vjoY-aJvU6Q-mJrkDuGOPEwsueHYug@mail.gmail.com>
	<58ECD3E2.1090601@linaro.org>
	<CAJ86T=WWRhgpONcfvJRGSyARzFS4pkmWrnx2BenOZKasv9Y7MQ@mail.gmail.com>
From: Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <58ED318B.6090702@linaro.org>
Date: Tue, 11 Apr 2017 22:42:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WWRhgpONcfvJRGSyARzFS4pkmWrnx2BenOZKasv9Y7MQ@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser] [PATCH] chromium: fix null pointer dereference in V8 with gcc-6
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
X-List-Received-Date: Tue, 11 Apr 2017 19:42:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2017 09:51 PM, Andre McCurdy wrote:
> On Tue, Apr 11, 2017 at 6:02 AM, Andrey Konovalov
> <andrey.konovalov@linaro.org> wrote:
>> On 04/11/2017 03:40 AM, Andre McCurdy wrote:
>>>
>>> On Fri, Apr 7, 2017 at 11:40 AM, Andrey Konovalov
>>> <andrey.konovalov@linaro.org> wrote:
<snip>
>>>> -GYP_DEFINES += "${ARMFPABI}
>>>> release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot=''"
>>>> +GYP_DEFINES += " ${ARMFPABI}
>>>> release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot='' \
>>>> +       ${@bb.utils.contains("AVAILTUNES", "mips", "",
>>>> "release_extra_cflags='-fno-delete-null-pointer-checks'", d)}"
>>>
>>>
>>> What's the significance of skipping the workaround if AVAILTUNES
>>> contains "mips" ?
>>
>>
>> This change (to add '-fno-delete-null-pointer-checks' to gcc flags) was
>> initially merged into chromium directly,
>> but soon reverted as it broke mips somehow:
>> https://bugs.chromium.org/p/v8/issues/detail?id=3782#c10
>
> OK, thanks. Note that building for MIPS isn't currently supported at
> all according to the COMPATIBLE_MACHINE definitions at the top of the
> recipe.

Indeed.
So my check for "mips" in AVAILTUNES is a NOP until someone enables building for MIPS.
Thanks for pointing that out!

