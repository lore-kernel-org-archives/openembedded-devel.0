Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id B053C7970A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2018 01:00:44 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id g13-v6so13317162qki.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Sep 2018 18:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=x28S/vH5YPc5v622PK9Rflr70vyn27mRNzNGjXRnEEc=;
	b=B1kzBIFuxRf8upEeOiw2StH/SULxovR+FA78RI0V75NT64plilkdtRHnjTVAW+4pZU
	1F/byihGsMHy5/AIOY2BWklY91mGYXzrtCkOTc9ydVp8kNlitF6aAnoyBYDrvLkq6cjo
	L1FKvZPsE2zEgJcXcbTJtoZDXZjiZ4T+xYSZIkvSL1UHnioU4hfiHONtGTTFNwp/T0BQ
	wgFE2c366tFlCoKJ3THFzxqUsvgKSfi5RMFVtESLPnba1ffKUZrRJqwUs5K9MDGhOqZb
	SLMbhfHECT+Cdk+Xdyo0r7LOut57iXhDwl9rnDkyN4Vso/jOKsJPTtMG61FaySIKkpH0
	5qPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=x28S/vH5YPc5v622PK9Rflr70vyn27mRNzNGjXRnEEc=;
	b=HVoqDENIn4f+nt0VCXvvZTjc0k/lb49vX5cQetVFcswWzZzQp57HCUFUbXmTkVW1ex
	JPjytyK+uxMOqQHoScEKQ+XMtzaiNcgg365y27YCuOIkxgmD70+YaltbxFpPUJWVTtUa
	owhUQLpWDc5Mf3AGfC7gtADrXUJTvRvZqkBPxysH0WPFdJ8rYr4DVD9coOj7jzXAzcck
	ZTM6OqHo0/vWMbx4P5DkXDy1HuWPwd5yLN5hDfh2Lwr8J/uHPYXvkaPfy+NP1+PW3Q8w
	QVIb+bTOjxFrHAu/z5/QGqWO2+XYs+n7TMeBNoymD/A6DoXqPF++RKPtcklDD7/gMc+t
	8T8Q==
X-Gm-Message-State: APzg51DhRAvBkhQykqP+UQS4d5jo/bYe4nCohUu7CVqHmXAGKGNt3IqU
	1N36yk4caFM+9XmpK9YwJ4dBe7+fPx8Oh66bX6wi7w==
X-Google-Smtp-Source: ANB0VdY8gy7iAmOSJZ69x7gUoDBlJf//3lOfFEkWiGHDbgY9kvNr5MhT61xPZZQ052OL/KJ5VJIbyMtorcDH1MJ4gUg=
X-Received: by 2002:a37:2e03:: with SMTP id
	u3-v6mr13211643qkh.223.1536541245301; 
	Sun, 09 Sep 2018 18:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <20180906172210.42551-1-raj.khem@gmail.com>
	<20180906172210.42551-10-raj.khem@gmail.com>
	<1730710.uE1zf6BjpF@localhost.localdomain>
In-Reply-To: <1730710.uE1zf6BjpF@localhost.localdomain>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 9 Sep 2018 18:00:34 -0700
Message-ID: <CAMKF1sp+dwQAx7DbV=oSTPJxOsLM1gASe97efqETcVdOHwNs_A@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 10/17] mosquitto: Make enabling systemd also enable build dep on systemd
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
X-List-Received-Date: Mon, 10 Sep 2018 01:00:45 -0000
Content-Type: text/plain; charset="UTF-8"

No, it's fine.

On Sun, Sep 9, 2018 at 4:51 PM Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> On Friday, 7 September 2018 5:22:03 AM NZST Khem Raj wrote:
> > systemd support in mqtt needs system developement headers and libs
> installed
> > in recipe sysroot
>
> True - sorry about that. I could have reissued the update patch though - I
> see
> it's not in master-next, should I do that?
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>
>
>

