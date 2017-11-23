Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id EA14B786EE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Nov 2017 12:06:44 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id b189so16370630wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Nov 2017 04:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xhltdSCTyPnyusTBvrIOcEVmh7/w7Isq7I5zQVQ7dAw=;
	b=hj3sqShxKy5RcuJR25W6fW+t2m2e6Bjl7y5xZcSaSEOO+wIEWI+hGnUmOQTZ+06S3o
	FUIt3ZSCL5KhQ6uuPxUq0g9Pc50ZiOuAP0Yc2dSNAJ2Do0AVqkjn6s2HIKwUbHV3seII
	4ZvTulBW1yL05m9BqcCw62Idgv6KskuVgKUVHWCRjnUZjk30+YV095Yi7Ak8xHr4Q6HS
	2+HML7TfWv02j2LhvPFk+dHF4xkA3A7ZD3gIJIOzVESMaiOIsYBeL+BirGEFiton0aAx
	UvAvxWRDL44F48xiV79Z1nNNVx61W+AkrCbEL6CnOqeqv1asW+zm/taoi5xbUFDbDtP5
	q+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xhltdSCTyPnyusTBvrIOcEVmh7/w7Isq7I5zQVQ7dAw=;
	b=HdG9Vpxl4WQvifr8SpXTg09RkoVx3FatltY85y89KUCAdbl5O5wYMqBaFmngflw7Om
	wSCzL68m6Qc9JZfIItiE/U9b6oyiuPKA6Nm9ZF7Z34Iq6sQBuOmzE/GUETjulodNm37d
	klpkUyUlXbYXi2q1lDd6mSnL7sQJEd0kLVrqI0yx3FVavf09W36te2Zd+VA2YbIpp4nU
	2d3TUEAzscOclVq5+IgBTdzntbO30oNJzttgQYg360a5pRaE7mDR9zEqf4Uay6wtDLAC
	BKcnb82uH2eVqjiUCzA+8KQvEvd4i4p3m/yMCqyy9ll4vFUm3xSTW/6Ebm3wnnkVBGC9
	gWDQ==
X-Gm-Message-State: AJaThX4dil+OQu0XumjB2SpjwmjzGuVl6iIx2zDBNVUV45ZTbnPJMxir
	F3HlSkwZNCm22yBmFhOkUAL6TF8suStm7BIvnR3jbw==
X-Google-Smtp-Source: AGs4zMacyJ3EarTZQXBELRkwUfFYA8lWGWJxUAaawrGNZyKnwTBI8GBLCzqjoESv80YLjDILI8kk0QJB2E6acpgiLTA=
X-Received: by 10.28.14.195 with SMTP id 186mr6665511wmo.56.1511438805697;
	Thu, 23 Nov 2017 04:06:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.122.19 with HTTP; Thu, 23 Nov 2017 04:06:45 -0800 (PST)
In-Reply-To: <ecdbb200-afed-2a2d-f390-3de7d4122721@linux.intel.com>
References: <20171122163030.10224-1-alexander.kanavin@linux.intel.com>
	<20171122174718.GA4166@jama>
	<ecdbb200-afed-2a2d-f390-3de7d4122721@linux.intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 23 Nov 2017 13:06:45 +0100
Message-ID: <CA+chaQf6LKVf5vRBSAmUxue2wb253o2bHs5XjN2CoL2t0Ox4MQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] neon: add the recipe from oe-core
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
X-List-Received-Date: Thu, 23 Nov 2017 12:06:45 -0000
Content-Type: text/plain; charset="UTF-8"

https://www.openembedded.org/wiki/Styleguide#Format_Guidelines

On Thu, Nov 23, 2017 at 10:46 AM, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 11/22/2017 07:47 PM, Martin Jansa wrote:
>
>> +do_compile_append() {
>>> +       oe_runmake -C test
>>>
>>
>> Use 4 spaces for indentation instead of tabs.
>>
>
> Please explain why.
>
> Alex
>

