Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id E2881783D3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 10:33:27 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id v203so671389vkv.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 03:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xtSpU5Z2QCgE5aFK0KgNiMPQlmhCQKXVt15gOsaLzNs=;
	b=NsSfYQMb7F6wltN9yAXZwT5tgIQ+sI+AkY3fNmaLBp0FULd6JAzfcosRNTe+QM8JEE
	mJjJchqMpk9blEEIkEIVgMC8i2JQAZFYW4NUAhYqLlnn0hN1ugq3F4bz9c9WVMJ5sRcv
	he2yUMs6phTfo2CaPsm8K+eBhVyH4YZCsC4amnrE5j1rlFo9a3EkabqLbDY4s/pRR6Cy
	rIK4xPJw4L2lPxeBSyuwkFmnQbmeJHF8VCUN3UIZMlI83E2jEA+qWO0a8ydmEqwRxm5R
	SyGlauxYYRxYaVgGCSFuF2UcQ8S7/D/4YhQCzsYmPoSLnKrV99mWAVQy6hyW21myvMlH
	TUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xtSpU5Z2QCgE5aFK0KgNiMPQlmhCQKXVt15gOsaLzNs=;
	b=VQNSA8RFQLCBJMq6KLlcrfa49EHl/8lFMTPmosFDmonlKaPB6GBEgllMhNHzKExaBl
	pQodC6HkAaPB4nJIm+rE2nUNSzs7svSRTcGrAG7J3J4A8l2wjleQtZf9o1mFIN+RVkCE
	HDf7LGaXuQd8eN5qQaej2UOUDCocZGJVTIndPZ1OR7GGvgd3SzgEGQM40F4PlXTeW1o9
	RGfRZkjOnrDJwfgwVlA3uc1atTxthPI8Z5G+PzxxNKrlfPoq7ODPyqAJrZGi/kW+YXqC
	rPEeLxS6zG4CjtKoE/Dt7RyMbCQgT463dzj1J3iVFg4NI9/QavnU9H8q3vOwpM30b1Y1
	Vf4Q==
X-Gm-Message-State: AHPjjUjt6hN64ZjPYa+Qj6Z2XpP8FSAsdmH0K5kNYP9K+RuozASqrs/w
	iuZMnNUE7qjsiIseW4aK9SndxPvALb9hX/YWLUA=
X-Google-Smtp-Source: AOwi7QBpfLhWoMbF3rBP1UXq9wUCDLMDrJ/0SUfar9U5Y24iNDAuNOOHRFQwUzUWIe65GEKIW0OrvgMl+Q37kYswRlQ=
X-Received: by 10.31.231.1 with SMTP id e1mr15807831vkh.90.1505385208980; Thu,
	14 Sep 2017 03:33:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.130 with HTTP; Thu, 14 Sep 2017 03:33:28 -0700 (PDT)
In-Reply-To: <CAJTo0LYxnw1L2-HWwZq=Jqrjty8FvtLB-gjWsH8d3Ri7-H9Siw@mail.gmail.com>
References: <20170913093821.12746-1-kai.kang@windriver.com>
	<CA+chaQfD6QeAiKWQo+u6i5xSQ-bAFvMVL9CMvuA4N6-4dj3pGQ@mail.gmail.com>
	<CAJTo0LYxnw1L2-HWwZq=Jqrjty8FvtLB-gjWsH8d3Ri7-H9Siw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 14 Sep 2017 12:33:28 +0200
Message-ID: <CA+chaQdg=ty-=h4afPNoJ8KSK6yjxEzzrSOFTOFtQNtdqYEHwA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libpng12: add it back from oe-core
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
X-List-Received-Date: Thu, 14 Sep 2017 10:33:28 -0000
Content-Type: text/plain; charset="UTF-8"

LSB compliance isn't a goal of meta-oe as well, otherwise we'd need to add
Qt4 to meta-oe too.

On Thu, Sep 14, 2017 at 12:25 PM, Burton, Ross <ross.burton@intel.com>
wrote:

> On 13 September 2017 at 10:54, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>> All other LSB related recipes are in oe-core, why should libpng12 be
>> different and live in meta-oe?
>
>
> Mainly because LSB compliance isn't a goal of oe-core, otherwise we'd need
> to add Qt4 to oe-core too.
>
> meta-oe seems like a perfectly acceptable place for this.
>
> Ross
>

