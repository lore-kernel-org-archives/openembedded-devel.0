Return-Path: <akuster808@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id BEEA3786D3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 06:20:13 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id l17so9679414ioc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jan 2018 22:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=bG8KiiISCsb3qfIAjo5gw4qKTQDhP7A5wBC543iRC/U=;
	b=YLt1dLGxnSY3y4jL7umB1ekqMirXIPYYIPRe1zhdeiTCwgPoVifKvcqXygAVC3YOZf
	PtdwdmZenZ/dKfXqQY+UfadG3sTM5UFn0nKXyXf3NUXk7WE/8K7ws6WO1LS4bPD8J9jw
	wCEBbDTN5bq6wC+tHBrvFWSJqhlQR764Q2RD7SnHEWWA8aVxbjVswZ/fyLnhu01C04B0
	CRIcn76XGSy+7SzgwH8tOxEjiWmK+1jge3jhCG50/dFgBh8DH6UzFcU2NeOwGL/qAy61
	lx8+suO2MknLZTZiemaUvpEFXAHG1m6RaNwNjY6ACzop4uOO6BV+nDGYZq4+dToNOASt
	6nGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=bG8KiiISCsb3qfIAjo5gw4qKTQDhP7A5wBC543iRC/U=;
	b=Cw9K/AUXxN/hWpNHm8HdtLX94mm4Ws9wsuwB0mv01RSj8VOgSja1lUizFf3lgyLUon
	i0pI+wkd8XmjsWotsGuKan6oCL00QGkB9MhsPYEFNeMYb0ExQKNYRJvtIQLQwTWYM+G7
	9tYt115aIuXNnxG7t4dLU8O4fAZNjWofNEBzYzmM6fN8+Y82uaWSlxUSeC+B4K7n+a6R
	WYc/uv9V/5x0h0T0Ht4Rn+DLrke/veqif01b5RjnI3RRdGMbqBjX0hy7KF9aHtVE7NFf
	zYxFU5q2wJR/qZnmHllGEqd9zC/24sro1ZshQw685hk5BVHs2T53kpiosi20EoUg2nQ7
	P4tQ==
X-Gm-Message-State: AKGB3mJEG6N+Y+YPOkTSwPoajSeuFlPWDAeOGN+xWuNycQHsskWWTFpd
	P2B1CJGukBtxQjknEzg3Z1nIBA==
X-Google-Smtp-Source: ACJfBos3ZUbVvRjR92lxJxcHWL7Hj8eGqx1ZCkY9szdy+1ebK2gaL77V3o2VYGlk3DpyxQH5VzVkgQ==
X-Received: by 10.107.148.197 with SMTP id w188mr38186645iod.277.1516170014837;
	Tue, 16 Jan 2018 22:20:14 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:242f:c14a:feac:fa0c?
	([2601:202:4000:1184:242f:c14a:feac:fa0c])
	by smtp.gmail.com with ESMTPSA id s4sm2022126ita.12.2018.01.16.22.20.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Jan 2018 22:20:14 -0800 (PST)
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>,
	openembedded-devel@lists.openembedded.org
References: <20180112122942.22396-1-git@andred.net>
	<1515760402.28972.39.camel@andred.net>
From: akuster808 <akuster808@gmail.com>
Message-ID: <fcae9a6d-a41f-b22a-7d10-b84bf02bd056@gmail.com>
Date: Tue, 16 Jan 2018 22:20:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1515760402.28972.39.camel@andred.net>
Subject: Re: [meta-oe][PATCH 1/2] uthash: update to v2.0.2
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
X-List-Received-Date: Wed, 17 Jan 2018 06:20:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 01/12/2018 04:33 AM, André Draszik wrote:
> On Fri, 2018-01-12 at 12:29 +0000, André Draszik wrote:
> [...]
>> +HOMEPAGE = "https://troydhanson.github.io/uthash/"
>> +SECTION = "base"
>> +LICENSE = "BSD-1-Clause"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=5cc1f1e4c71f19f580458586756c02b4"
> Note that there is no common license file for BSD-1-Clause in OE-core, which
> causes this warning:
>
> WARNING: <image> do_rootfs: The license listed BSD-1-Clause was not in the licenses collected for recipe uthash
>
> Is this really the first recipe using BSD-1-Clause?

Does the standalone "BSD" license over Clause 1?

> Should a license file be added to OE-core, or is there a different approach
> taken normally?
>
>
> Cheers,
> Andre'
>


