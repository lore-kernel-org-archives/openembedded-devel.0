Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 46D337F2E9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 14:16:10 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id i30so2136784pfk.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 07:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=JlKddbYWN8VqLlV8BNjyZYm7cfMeGeLUR7ibms9VYBM=;
	b=GLsZuvfkVgbwyN1HKBoU8aFxDCZtikJVstA1ZHLBujCbzQlVHh9sKrP81TnGJAz315
	4hGT4/IELZ8d1NWtaeVpGuTs75VaamaOYR24hBLaJ8qD7R2MnrKDy0PQ7dAYsXJsZ34v
	ZDNyoYotFaseUi1HbuTP3jcVkMS5UjLc/dULthlHBFNscMqahn47UWK/AWXvJoqMBn3m
	lM8YNVTcEfEkDy/jpMlK0ivEGQs9cF1DOlbdlk+EeSrAvkIUMo4ppTF1w68qhf6GohAh
	Q7RTLUCLlkk5f52NN4MDU1rCnCKdiAEGaRCjBCpdN8EPETD0Ro0os1RlUMIQ1u0gefGs
	5MyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=JlKddbYWN8VqLlV8BNjyZYm7cfMeGeLUR7ibms9VYBM=;
	b=StEYVk6I9loukWiSKQRK8e4vROlm3Pjca+lDY63pKogwN1U03wYfupUEmoK1x1hCIm
	N009fyhjukiZ4Eb1sg9/uWv0ZAF4HTeUXY7jOM6oBp3Ul0LRBAyQre4QH4+wxuG34jLU
	nkUVtv/ROrcVxxleNnnb9vHDvYrVrY+rmPElhDNFnS2dl21FJ9iiNYP7D+egTQlWrTSH
	ZPSYlG0X6Ij2uAd9sOk2a2XRmXLMT+MbN2Qnbk8ij3Qnus9uRXlvq5lJ893wBK6IIlpK
	PGvhOZ89RlHAmEv62CywENZp5RP1BOVrVF7O82dE5TvV2LHie0EztBwF3aIHpKC6EXDT
	Unhw==
X-Gm-Message-State: APjAAAVBxpuzeKylqtf4m1xhH6XN4HF0QNHR2STAdnh1WJdHe9jA7zpB
	wWGvN7Zw0bke4f7QTFSSYAfAu4k8
X-Google-Smtp-Source: APXvYqx1WJNem3H4ZZosAr9gH6Exa9GsXUPjAfAfGwjneEydAx7qa1CI6oOGmMW/EUwek7xIeKlnZg==
X-Received: by 2002:a17:90a:22c9:: with SMTP id
	s67mr10047213pjc.22.1567088170900; 
	Thu, 29 Aug 2019 07:16:10 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:e5a5:4b94:b3b5:f092?
	([2601:202:4180:c33:e5a5:4b94:b3b5:f092])
	by smtp.gmail.com with ESMTPSA id
	b14sm3128839pfo.15.2019.08.29.07.16.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Aug 2019 07:16:10 -0700 (PDT)
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	Adrian Bunk <bunk@stusta.de>
References: <20190817081339.22253-1-schnitzeltony@gmail.com>
	<20190817111825.GA2828@localhost>
	<CALbNGRSBQv22cpj+T+KBS-1oOhpUomXBN78FHhFw52=pGEOp9A@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <efd5c05c-1275-8077-84e1-f17fff05f8f6@gmail.com>
Date: Thu, 29 Aug 2019 07:16:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRSBQv22cpj+T+KBS-1oOhpUomXBN78FHhFw52=pGEOp9A@mail.gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [warrior][PATCH 0/4] vlc adjustments
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
X-List-Received-Date: Thu, 29 Aug 2019 14:16:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 8/28/19 3:56 PM, Andreas Müller wrote:
> On Sat, Aug 17, 2019 at 1:18 PM Adrian Bunk <bunk@stusta.de> wrote:
>> On Sat, Aug 17, 2019 at 10:13:35AM +0200, Andreas Müller wrote:
>>> Some cherry-picks for vlc
>>> ...
>>> 2.- 4. Are good enhancements. It is upon warrior maintainers if they are
>>>    important enough to make it into stable branch.
>>>
>>> Adrian Bunk (3):
>>>   vlc: Remove workaround and patches for problems fixed upstream
>>>   vlc: notify switched to GTK+3 some time ago
>>>   vlc: Remove the obsolete dependency on dbus-glib
>>> ...
>> The notify change is an actual bugfix that should be added to warrior.
>>
>> The other two changes are cleanup patches with no (intentional) changes
>> in the build result, I would recommend against backporting them since
>> there are no benfits compared to the small regression risk.
>>
>> cu
>> Adrian
>>
> Ping

in stable/warrior-nmut for testing.


