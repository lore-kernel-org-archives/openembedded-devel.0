Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id E37BA74AE1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Sep 2018 14:31:38 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id g53-v6so5238758qtg.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Sep 2018 07:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YW0KpaO3Oo9sVqABF6wpChwNvVRdOlVgdXFzr7MrpQo=;
	b=sqohEW95vpmxHfJr9ZwJmaMIJEWaHIm80gtiNBZq9/HpNf20WEhqx4Y+jVxhQY4dK5
	H1NAclg086UIsmCx7eKvJfDCZMnLxdGv65QDVwlOTghlu3AZIVCevAYwQNIVvnl64F4c
	4bRkgiY3EUshHsWBb3AJWr0kNGOdf/vP6k2hcBXIuMD8ay1R36FLrTx76bAynajwc5hT
	DDHAxpgvOwWPBnw7iiNe+jF7WGwEkEfN/6AzAk9h1ZLAUnrXVjYo9AtiqdDDA7iwt+CG
	OzSY996xqFGrtDIvOzOfMSqEtWe+kxgr0VMQw0Gbh4kRYcJMFG+TKhpbwEjctWUmRlgB
	7JAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YW0KpaO3Oo9sVqABF6wpChwNvVRdOlVgdXFzr7MrpQo=;
	b=m24doGrB6iVcHUGczuyOZfiMWwxOFWhYkP6teXeWkMVyQG4HNV6fiEwq6Ir2Lq5JBm
	Qn5k7azA6hAq1er6YHlM86DjGp/kerEV28wCn652G0VuMUelw7nPTuni9Udw73jJN5+7
	T/joUZSeBqxa4VPIVKia8LCvZdskdljED7SY5rlenHwroaXFMoGsT9MdRfjLfsz1FKsi
	zf229t32bznj5HyFGnUJreC3G3JqCqwK5+T/Hm08wkexQoT/evau53tt/o7K58pVz8NH
	bqNsago0wlKXNNFbmHwzM34n1FCTdKgNM7KO+GGFQu5qJavW2YEjU+aVB3acEPbS10E6
	H3Dw==
X-Gm-Message-State: APzg51CiF/JKe3AyWSSYF+vuygGuq2HZ0nBkQo+t6M9KpB+RDsCnTMsL
	KvUnTQdPkQaXJ3ExmQrhUmei7VGin39P1joSrbv82Ms7
X-Google-Smtp-Source: ANB0VdajDVw7HYNCRuftzJZfexsuGGePYaJyrwOlToEYIBMD4eugrlZAANs1T5IOTjYANDh59Q0iO5Q6jn2msyy/BYY=
X-Received: by 2002:a0c:f208:: with SMTP id
	h8-v6mr24751729qvk.55.1537367499524; 
	Wed, 19 Sep 2018 07:31:39 -0700 (PDT)
MIME-Version: 1.0
References: <87sh25viuj.fsf@rkubodac-desk.ger.corp.intel.com>
In-Reply-To: <87sh25viuj.fsf@rkubodac-desk.ger.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Sep 2018 07:31:13 -0700
Message-ID: <CAMKF1sp=RqqJy4RJLLn0+POqGfw7GOZqb7Fvn_NKktfnZWnXPw@mail.gmail.com>
To: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] nodejs: no internationalization support
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
X-List-Received-Date: Wed, 19 Sep 2018 14:31:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 19, 2018 at 4:17 AM Raphael Kubo da Costa
<raphael.kubo.da.costa@intel.com> wrote:
>
> I originally filed
> https://github.com/openembedded/meta-openembedded/issues/93 about this
> but was told it's probably better to discuss it on the list.
>
> The nodejs recipe currently builds node with --without-intl. That means
> there's no internationalization support. One of the consequences of that
> is is that the inspector module is not built at all.
>

right, it is there for size reasons. ICU is kind of large and since
debugger uses it, when we disable ICU debugger is disabled too.

I think we could make it a packageconfig and enable/disable debugger
support that way if you care to send a patch, I can look into
integrating it.

> Recent (at least M71 onwards) Chromium releases need the inspector
> module as part of the build, so I wonder if the recipe can start
> depending on ICU and pass --with-intl=system-icu to configure.py.
>
> Using --with-intl=system-icu might require checking if the ICU version
> provided in a branch matches the one Node expects; in the worst case, I
> guess --with-intl=small-icu should work).
>
> Is there any specific reason why --without-intl is being passed in the
> first place?

