Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DCC2CFD313
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 13:09:48 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16362.1763989784506513518
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Nov 2025 05:09:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JzP9HyKy;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso41598055e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Nov 2025 05:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763989779; x=1764594579; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NLOJFtVvF9irHYWFiKsSxpS4KgmbLBF/X7LAbWz8Hto=;
        b=JzP9HyKy03nDY/oz/Od67nWPoMiBQXKRAUc0CB4tuWEG2OgKtDCUqfFE2660AbS7L8
         iUkhw9LW9L4bwC+iFISA+smal9lAgoyQEv3aLijjlnyvQVhz8eNmHpLAExbsh3vIe11N
         RYPR4+QuulozTc6oW5IeK+Asuy19gQVcBkI3NVKLwZSLHKG6GNnUjC+fEsIUq0TYpV5P
         hCHkJXSiguaAuvDii/KgP8Hdvx4gg6N63vNVhs3Rb+PuDH3L3CyphlrCxDg/kK3W9hPL
         GWm+MVL+m2/TLVXUdl93Bxd6wAnPkyl23+bGIL/1S2BnC9OKhvR96/xws57+EiNYfS19
         iMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763989779; x=1764594579;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NLOJFtVvF9irHYWFiKsSxpS4KgmbLBF/X7LAbWz8Hto=;
        b=kV5Tr76LwQ4YRcqaH43RSpJx+rYHz2AY6rs5sAlmGwbSf3h9848dxBDz224tzkWCwy
         /mZXYkgXpl2BlAWdE6qVydaIe70uhQbzSbt4YydiRinnVWmyw05KQtBCQi5oN0JKmrqM
         R3pcwctO35IGDkdDpDBmTxuuYkp8BNgtou3CF3FYDKNcfCjm71u0J1FSQkoiPhN54bf+
         hQxY8rIAoU7kcFy3KDJ2jkFNGEKV0xLPY5KsAAbnJ24bfuyoE24LtQC66lTZkshqdfDK
         8TWJlgmdah41cBfp17wvKFZIc7u7H7UflfYPjU/kvbeIT3Y+EUjJN4W9ai257SfCJgHB
         zMfA==
X-Gm-Message-State: AOJu0Yyj8k+6/wBTVacuhFYg7jO5XX0rhVdLL71QuHvPWRf8ktYAJKrH
	rjVEo/9sbqFxV8XHygYx1ZPICIVh8D6gkO4CDEb7jcW1JbZVNK/d/pUthAbrbN/R
X-Gm-Gg: ASbGnct8Bhq1ZEl1S1HvlZw/WUIae3emPgADEX31g8NFZfGtNKr3oBCQM4capifeSQP
	XmXqu+pz+qXm9mxe/M2OM07Ib9mf00HPsbvoBSbnG5blZjCQpTPlD8ibWtS0XHUzbQGDfVi1rYC
	mA3LfWzqa73FlybfgeJhPh5+djbbkLCUR7/HTeZ6q63e2wpZaDEyRK9R/POwBnCIJ9mUyCU5ce3
	Dc64qAGJ7kuTbQk2xIvhrwMEE+J3rHey6PfKHahHIRENYEpYkSxUEwKjSGOTcsHp8ChIXZpsxrs
	l4OxesgCO6jWcwRweJ5Z3K/w0lXLrqGxKrpbafFCuMR8NnyFeUJm9XCtWe4uQajPyUNWgSLT2Q0
	Vr6M81yaS38mZ4kftr6Xg3eovMAjX1heKCblK6iV+qXRZpD+S/eRChx3SptfKLxOnNeHIbf1TvV
	KARhM1JT/K9BZkA7BIu6I=
X-Google-Smtp-Source: AGHT+IEc0FCuNXl30SReZO3mUs4S1xu6SMDCFe2YUufdog5ksvdbPVyoGIyyJ6gZfT5Fs1nOI5GBIg==
X-Received: by 2002:a05:600c:3b09:b0:471:13fa:1b84 with SMTP id 5b1f17b1804b1-477c0185bc8mr140721295e9.12.1763989778885;
        Mon, 24 Nov 2025 05:09:38 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9de4631sm149826195e9.7.2025.11.24.05.09.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 05:09:38 -0800 (PST)
Message-ID: <c3163020-30df-49fe-b0ef-0492c6babe39@gmail.com>
Date: Mon, 24 Nov 2025 14:09:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] CVE report - whinlatter - 2025-11-24
To: openembedded-devel@lists.openembedded.org
References: <187AF2C630F5DA19.66502@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <187AF2C630F5DA19.66502@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Nov 2025 13:09:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122013

On 11/24/25 13:58, Gyorgy Sarvari via lists.openembedded.org wrote:
> List of all open CVEs (76, out of which new this week: 29):
>
>

Hi all,

I would like to add a couple of random notes to this week's reports.

1. Whinlatter is now part of this report. The base for new/removed
comparison for the first report is the last week's result from master
branch.

2. There are some new CVEs which were missing in previous reports. This
is because until now I ran the checks with vanilla config, but these
reports were generated with a config that had more features added to
cover more recipes. And it has highlighted an issue with the CVE checks
with universe builds - if a recipe is excluded from building due to a
missing feature for example, that is excluded from CVE checks also.
Technically it makes sense, though I still find it somewhat unexpected.
Will try to spend some time on looking into bitbake about this, because
it makes it harder to get a fuller picture.

3. When I started sending these reports, I mentioned that I plan send
them till the end of November as an experiment. The end of November is
here - anybody has anything against getting these reports in the future?
Personally I think that they are useful even with their limitations, but
I might be biased, since I started it to scratch my own itch. If no one
will speak up, will keep sending them.

Let me know if you have any questions or comments, either on this ML or
in private message.

Thank you,
Gyorgy

