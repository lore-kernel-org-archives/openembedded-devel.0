Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4FBFF719B8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 03:09:25 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id n14so21165396pfh.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Oct 2017 20:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Fy7n32fnS9uDJh2ymB31xDlB/BXqIOmfdyAK9fnGpzk=;
	b=O2/NiiN1G99bUejH4J4skN977VyJMlMfshXfBKznQe+tUHX8aZkjVsogHNa4zhYlPI
	6tlGkz4VxfLTMJsMOC8sntUSt561UWYW5vPCGawlJtvrdXmfhv3Km9beLzjgTTu9DjwM
	0eb8rB2RYEtDEdyl3d0WkwOw/dCwOyjkpyDUOVqLNGQTTieseGWMClM5kkC1WuhkM5m8
	WFnCU3wZHL5OiMYr1gdH/j9N6AfmxM1mA1sMfjfTBOmMlLgt5M5l5/oGewIoVB8n6zF2
	ukVuUeWTdtYIHS6lXuC3sQiCdm2XOSbc6uJBfJJTgLxRcokLj57Bu2DQnMMW5sXyz5fn
	NwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Fy7n32fnS9uDJh2ymB31xDlB/BXqIOmfdyAK9fnGpzk=;
	b=IOYB7pj/AVyDcrRgcr5AD5o4inDG06JWZy+DulU1AODOTUkY985+YzltynW6h0Vsb9
	ZSZGKZ3K/uhetLd5ZXiYeNiDMwuCbKPCKmQrjAaJbe1DXDk9da6c5tGGUW0ho5zyy4AI
	SFf4NzpYW9gGL3PW5EyaZ6p4fJpG1OaCu3bJucqf+fBOUbRFMsoJFkbqYfe5IFsjQEee
	/JPVVKZetSB1fDXDTkp5ZQDkz3Ozu8iyLu1M2YFZoIXULicw4H+p9vQDO/g9eEOFVTlP
	pN+re/xG7LHhQXD3s0M5kf8Lb0VHpTQUJAar9IbbcRPAaA+DABLubb2KuJAVKvR/JRob
	2DuA==
X-Gm-Message-State: AMCzsaWq3xLm24DFYgOkkOeUIWkou6ZmOKP6tG1CCRFcfcBH1SWukdGY
	e7X354RuA4/UNtKVZttqEBuckLFn8Gl4gkpWWKk=
X-Google-Smtp-Source: ABhQp+RQ/sdtZkzW0lZXZM9aUhpb/30kX2ApxjnagSunIzg+rBFgI24C7F1PezN53GMEA6g//3oiYVj3hbUOqOMwHRw=
X-Received: by 10.84.177.36 with SMTP id w33mr338908plb.215.1508900966578;
	Tue, 24 Oct 2017 20:09:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Tue, 24 Oct 2017 20:08:56 -0700 (PDT)
In-Reply-To: <CABR-LLcV-gfq4Vix_FDaf4xrybW9MXP0mJecGnOUau8rpvFSLg@mail.gmail.com>
References: <CABR-LLfMQQQvADAH6Z__-L+Pw0BEGnwn+-_E_C36XUwV+X9_8A@mail.gmail.com>
	<CAMKF1soLSiKO1kxSr0nt8HkYjzn_PpJdLmfRRWp6U6szML-YnA@mail.gmail.com>
	<CABR-LLfXBspMaoGXaJnT2iE=zAdyfMWE=zctbzarzfJbXFS1kg@mail.gmail.com>
	<CAJ86T=U9L2-+xZ_1_8u3NJjHsWgh=Xhs4wGun06AizHyPThMuw@mail.gmail.com>
	<CABR-LLcV-gfq4Vix_FDaf4xrybW9MXP0mJecGnOUau8rpvFSLg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Oct 2017 20:08:56 -0700
Message-ID: <CAMKF1soK2Ecm9j=i12JfhVkv=eB7t_ft3Qffpn8pKQUKXMp3oQ@mail.gmail.com>
To: Wangchong Zhou <fffonion@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-webserver] [PATCH] fix nginx with large files support
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
X-List-Received-Date: Wed, 25 Oct 2017 03:09:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 24, 2017 at 8:06 PM, Wangchong Zhou <fffonion@gmail.com> wrote:
>
> On Tue, Oct 24, 2017 at 11:01 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>>
>> Note that disabling the largefile distro feature isn't supported in
>> oe-core any more (the conditional tests have been removed, so all
>> recipes in oe-core build with LFS enabled even if you disable the
>> largefile distro feature).
>>
>>
>> http://git.openembedded.org/openembedded-core/commit/?id=a75ccaea77c8aad8d46e87e8ed4af2e2e0ad5327
>>
>> It's perhaps not the right approach to be adding new conditional tests
>> now in meta-oe.
>
>
> So guess we are safe to hardcode off_t to be 8?
>
>> On Tue, Oct 24, 2017 at 10:55 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> I was looking for something like
>>>
>>>
>>> --with-off-t=${@bb.utils.contains('DISTRO_FEATURES','largefile','8','${PTRSIZE}',d)};
>
>
> I tried this but bb reports a bad substitution error (from bash I think).
> Not sure if I missed anything.

escape $ with \

