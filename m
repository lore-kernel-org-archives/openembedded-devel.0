Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id EC2527F300
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Aug 2019 14:43:34 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id c3so18490498pfa.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Aug 2019 07:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=fLb8LToaZe5RnmaOnbZx7uowh44Ue1/WHOPIRCmpM9I=;
	b=VJM2LluvwM5Zr5j0B6P+hr4IeWN//Wq/zyq3+MbIOxv+LMMglWhCvtu0A5nUG7/ZMH
	U3adbvlEFmiJFLDSiLjnqbgHiMUMDhxxnTFL7hyK0VJxVh0f3cUAnv/TecNARJGeXQPi
	Ei9xyekPHFdGfJjngT/MJmflMNBVv1hVj0w4ik+M+E6ScYFo66ifkwdsRJ3TRC80qNUX
	lNDBvpHSnnh8Nq029GhCg1q13cvC03OQ/Tad79LtRB/mgyolLRwP+MXtYtFP/9ws/Fz8
	eJNTMIEA3FK+ivwEIKCi09thn+ME3wv8bFw6Qzum6nD49Ro3yuMxsEr8VNXITp4JRzXp
	0nRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=fLb8LToaZe5RnmaOnbZx7uowh44Ue1/WHOPIRCmpM9I=;
	b=F+YPXMcAQ/EB6LVktna3LIS1iStKznnwvq6YNRgrAjkRPplTCBUqFj+F1jRsYHeyYG
	J4oykDTArFqvAq1LyaTJT9M1uCw2oahP+Onm2elYDAPxEi72qqXmKAatyEC+0eYLLHJJ
	FX7qPuP4k9XtvcgC+rI/0U7w2Ftq9ZNxrnReXfvT5nx1Lihein0Ms6awq9G7dFT8GlrU
	njvA4Ir1ShLmCBlKkE2TVZtLON3x2shSHwatrkvxzEbVkZGBCUzv9LDHDP+dZYiWXIjR
	r6f8Tmjxr0xN6SlS7C3edSXiMhwGP8w6l6qk2wuqMc8TvSGJ+5WNosBBUGdQWmhG+NpM
	zPSg==
X-Gm-Message-State: APjAAAXgqpS59PLKm5w5cPLyelnDIPgKUV8upWGmMrT0uQemKJr7CyJ9
	Y2o3AWYwr3CWNzlMXFtLxbdykvwa
X-Google-Smtp-Source: APXvYqxW+O1n4dUROsXwwCSehAjeSVBesulHE/NmdezjwEM5MbR8zOBmKTuQ+850qE2kkFfBFM8YJg==
X-Received: by 2002:a62:1ac9:: with SMTP id a192mr3966287pfa.260.1565102615849;
	Tue, 06 Aug 2019 07:43:35 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:b1d3:f235:39b7:d104?
	([2601:202:4180:c33:b1d3:f235:39b7:d104])
	by smtp.gmail.com with ESMTPSA id
	i124sm162557192pfe.61.2019.08.06.07.43.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Aug 2019 07:43:35 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>, Khem Raj <raj.khem@gmail.com>
References: <20190805182453.30420-1-bunk@stusta.de>
	<CAMKF1sqH_1E-2KpyMBYs3r3iSdmjKBv9dM=yT9PP+t0DOqos1Q@mail.gmail.com>
	<20190806064312.GA12298@localhost>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <ce6dc916-68a8-377b-4fdb-4ee4d2ed8744@gmail.com>
Date: Tue, 6 Aug 2019 07:43:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190806064312.GA12298@localhost>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] wireshark: Use an upstream URL that stays valid longer
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
X-List-Received-Date: Tue, 06 Aug 2019 14:43:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 8/5/19 11:43 PM, Adrian Bunk wrote:
> On Mon, Aug 05, 2019 at 12:13:14PM -0700, Khem Raj wrote:
>> On Mon, Aug 5, 2019 at 11:25 AM Adrian Bunk <bunk@stusta.de> wrote:
>>> Signed-off-by: Adrian Bunk <bunk@stusta.de>
>>> ---
>>>  meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb b/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb
>>> index d442925ee..efcd5e42e 100644
>>> --- a/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb
>>> +++ b/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb
>>> @@ -8,7 +8,7 @@ DEPENDS = "pcre expat glib-2.0 glib-2.0-native libgcrypt libgpg-error libxml2 bi
>>>
>>>  DEPENDS_append_class-target = " wireshark-native chrpath-replacement-native "
>>>
>>> -SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz"
>>> +SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz"
>> perhaps use BP instead of wireshark-${PV}. Can you make that change as
>> well while you are here.
> I was aiming at a minimal change, since backporting to warrior is
> where it is urgently needed (can't build wireshark there right now).

Would defining a MIRROR help ?  IIRC a new release of wireshark may not
always be in the "all-versions".

- armin
>
> cu
> Adrian
>


