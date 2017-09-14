Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1D70678363
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 13:43:17 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id k101so524775iod.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 06:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iRD5d/7hFGhDuztMyHz1/ew32KCzr9bv3Z9Wc29p7Jg=;
	b=w5GJNG8WxwouIne/59INdkCitcMfVXCl7y7Z7DQnyw8eBu68YvmNW9N1o7mUvV7WvL
	D7NBu6o9ndW34Utj9dVawknY+hbbp+o4I/BGwMLeXBxIeA6pwfq6q7pWCE7HRHe068Dg
	JuGxCHuTnk9SJnsdfIKLX+MLdEQMPRe99IIPdH6j1r2fyMatlMIiM886/2Oo7X5R67Jb
	AZhk03TKOnMLrEWO2hz44RzmkK/A5vIGCty0sW8AtASaA0u+rvpKkhwh21YJHhLKB5lE
	M4TrshfIRwZuEKiK1H4GMiGzOCxduOIawVtbzKYDXaw8lk1Ia+uO2DF7MazGvxirJA24
	G1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iRD5d/7hFGhDuztMyHz1/ew32KCzr9bv3Z9Wc29p7Jg=;
	b=kd3fsiYLPC12NP+5ksVrWgDMACJ28u/zrC1ERo5P79sC/HN2tRM0+N2ireJp/2J/62
	cGb7dTl75ouOZTUyhZbveTVsRbJFqXMJX8yS5A8b9kw1hmmkf9UQNnfXs6x+fMPBQPqa
	cbmqSOil84KWTWiV7wgd3c29vKPEtdieyKN0ziJE1FX2Q6GheoJeaqQlwvX3zgBAqaPP
	nFNlFP+qYXI53SzB8SwCwlPE8R21MQp8to0HKUw04s0g7L4H3FhmuF44Qe1BTXJ62kZ9
	Fw+FxRvfIN3mUUOCF030Wo5ai5W1QPqjJISUCOEOjBCGBHOXyeMS4CXIdpVCChPOazRa
	3C0A==
X-Gm-Message-State: AHPjjUjgeJpA8YqTf0M75u9tUy+Nh2cVm8P7Ik+xBVhOTenOj/QZJRTb
	rWPdZJg/6ob72/p6v7Eutzcg7jPtyzhYQWEomgX+WQ==
X-Google-Smtp-Source: AOwi7QAzp4njJIjhyqRLHWylW3w6Rq4MWbxJrHiwsGQUGtjkur19nEJ15Cpwyu1XPQ4ookJIPtYPnkEKbHVQHJMPeqA=
X-Received: by 10.107.135.72 with SMTP id j69mr2919995iod.210.1505396599113;
	Thu, 14 Sep 2017 06:43:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Thu, 14 Sep 2017 06:42:58 -0700 (PDT)
In-Reply-To: <CA+chaQdg=ty-=h4afPNoJ8KSK6yjxEzzrSOFTOFtQNtdqYEHwA@mail.gmail.com>
References: <20170913093821.12746-1-kai.kang@windriver.com>
	<CA+chaQfD6QeAiKWQo+u6i5xSQ-bAFvMVL9CMvuA4N6-4dj3pGQ@mail.gmail.com>
	<CAJTo0LYxnw1L2-HWwZq=Jqrjty8FvtLB-gjWsH8d3Ri7-H9Siw@mail.gmail.com>
	<CA+chaQdg=ty-=h4afPNoJ8KSK6yjxEzzrSOFTOFtQNtdqYEHwA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 14 Sep 2017 14:42:58 +0100
Message-ID: <CAJTo0La57nRi7hraiCbNqyKXA6t7vvRw6=YXprWV5usReHMB4g@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Thu, 14 Sep 2017 13:43:18 -0000
Content-Type: text/plain; charset="UTF-8"

On 14 September 2017 at 11:33, Martin Jansa <martin.jansa@gmail.com> wrote:

> LSB compliance isn't a goal of meta-oe as well, otherwise we'd need to
> add Qt4 to meta-oe too.
>

Touche.

It still needs to go somewhere though...

Ross

