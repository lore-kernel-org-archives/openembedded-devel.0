Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id C8E71783D6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 13:27:29 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id w94so8330388ioi.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 06:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/zLN2asSSvsXcvK26lxRIUUmASO73tRM6wcj4pvWUPU=;
	b=mwgIIZfoZBEMxjfTabOAw/glfH91s2cFl+en/67ED9rTOB95RZOVlOLGUd5GcB5e5c
	fseLdzqmQPB+l9k4UJdUZfDE+qQ69x4PflQym+WAXZDglPJxLS0uTbBxFAZiQI1lXolZ
	EUc6FyVNAPm71r82yG1RnJrkdeghQ0rw+RLkFehXyUgKsKsvZ9V/KOnWzk75rUJxr+Wb
	q31oiVPOKNHgrM674JW2hZlOMKqbJoXzRVYFh6QlH2Yg9oKymENRM5bTneeNGDdD9SyU
	QrS2bONvXqLd+SqwFr7UOgysYmezCIDUfItK5DFmw8ex1WNDb+I3C1eS52JC81VmT/c9
	CisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/zLN2asSSvsXcvK26lxRIUUmASO73tRM6wcj4pvWUPU=;
	b=VI0zauCbj0pqpwyslP3ydb4bjpPKG834yeQKa6qBzc6QPLRtpGUjjhLEs3OSuWVg2W
	CKq22UEjApdxzmfTiXhm3OnPQi1CHXoBFsICDmJQq7bHl4vTK0w5zignhQyl20xaUh8L
	GRKOQtddYKghmcfghXITa6tptDnt98b/qBawgvP3L81gsmVP/kMqpumr27biSBJrfdMT
	/YMzQoUiohmTx+xg+jE6oVckJVy+o72p63/IOOMfBVLtX+MY2xGDzzheR+Wm4TVyGB3R
	R0ULCxiwvXu1lwXqMzAwffrijqRjtohnHtLGFwPZlc2ivbwYfgfGSQpGILqi16aC9A3+
	v/7w==
X-Gm-Message-State: AHPjjUjH6c8rIuzy/b0quk+cb6ZLd7LMfp0v8zOZ0MD+I7WhDVYuk3X5
	x6c6WmQ6GwjwHz0fTdp9RI5oDTEEH7qc87o3jeF2Pg==
X-Google-Smtp-Source: AOwi7QBaqynUnWr6S8QSZaZB0PEJfRKHxenRAK8QmrrUe9ELIrMF7zt9agrTBILLRcm1DciHo1+L1tfTyV7Iz0osX7c=
X-Received: by 10.107.135.72 with SMTP id j69mr8461409iod.210.1505482050456;
	Fri, 15 Sep 2017 06:27:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Fri, 15 Sep 2017 06:27:09 -0700 (PDT)
In-Reply-To: <CA+chaQf1ZsbpeVeW_p+Qm--GueHsQNbijbRYFrWPNhVVGHQW_A@mail.gmail.com>
References: <20170913093821.12746-1-kai.kang@windriver.com>
	<CA+chaQfD6QeAiKWQo+u6i5xSQ-bAFvMVL9CMvuA4N6-4dj3pGQ@mail.gmail.com>
	<CAJTo0LYxnw1L2-HWwZq=Jqrjty8FvtLB-gjWsH8d3Ri7-H9Siw@mail.gmail.com>
	<CA+chaQdg=ty-=h4afPNoJ8KSK6yjxEzzrSOFTOFtQNtdqYEHwA@mail.gmail.com>
	<CAJTo0La57nRi7hraiCbNqyKXA6t7vvRw6=YXprWV5usReHMB4g@mail.gmail.com>
	<a28c31a6-0635-6e7a-414c-beeef338ba45@linux.intel.com>
	<CAJTo0LbR-ks7hgfg8L2cLXoThLZxa_PAY28ci-gt5XZtn29AOg@mail.gmail.com>
	<CA+chaQdS4NPaF=cqUGR12+Bxt1L2wzThxYZCQFEvK-DxrZ6Dww@mail.gmail.com>
	<CAMKF1srUN0TGPCdYRKuxKhBGDnPNVr3r35=Xb5UoJYuksQSfHA@mail.gmail.com>
	<CALbNGRQdYe0RVE3wT2i6btqCMtHaWzcyyGz+PLYG614-zCb6sw@mail.gmail.com>
	<CA+chaQf1ZsbpeVeW_p+Qm--GueHsQNbijbRYFrWPNhVVGHQW_A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 15 Sep 2017 14:27:09 +0100
Message-ID: <CAJTo0La3Q5MFeo1H-At-wJkXT1KMzRRR=oeSfpGmrriq4Ssdyw@mail.gmail.com>
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
X-List-Received-Date: Fri, 15 Sep 2017 13:27:29 -0000
Content-Type: text/plain; charset="UTF-8"

On 15 September 2017 at 11:03, Martin Jansa <martin.jansa@gmail.com> wrote:

> Hi,
>
> most of our prebuilt binaries (built outside OE, sometimes by other
> companies) are built against libpng12.
>
> Not because they must be, just because libpng12 was there when they started
> building them and nobody revisited that since then. Now I'm trying to get
> all those prebuilt binaries to be rebuilt against libpng 1.6 before we
> upgrade to Yocto 2.4. If I don't get them soon enough I'll need to keep
> libpng12 in one of our internal layer for a bit longer.
>
> So I agree it's outdated waste of time, but unfortunately still mis-used by
> some people.
>

That sounds like a great rationale to keep libpng12 in meta-oe.

Ross

