Return-Path: <martin.jansa@gmail.com>
Received: from mail-yb0-f178.google.com (mail-yb0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8233C77D9F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jun 2017 12:47:07 +0000 (UTC)
Received: by mail-yb0-f178.google.com with SMTP id e201so23669599ybb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jun 2017 05:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Fx4r4UrqZpUAAXyoIrrx+ADClJXryYWS3vaU8M0060w=;
	b=eeejD1GQYW1SF3UVj7lFbLT/xH0Bjc7lWVEyHG1xtswrFi77LIJp3eQrZKkj3UYBDg
	scUAQPeLcH93Avf04z8MN1l5qloSlECNpU/z9GHJtLXCAHeTwkWlRL8hsDuwaV1Vgz8M
	fBnDX2HtoIGgTT9gArPXVFhmg6PTDnkH79sRAO7RL84hpvPXGioOWSq1mFdAY6Fy2tei
	O4CNwKqpIrjQeFGiq8nT8RO+bvOQpOFQULkl5Cssidt8SR9tawB/u6E0KaXL91fstupu
	cXYQUKVgcEUFCVYdwFVsd2cBpfpdnMht4BiUzIkX0NIc9HUynGUl+koPqPRCBHSY1iII
	eHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Fx4r4UrqZpUAAXyoIrrx+ADClJXryYWS3vaU8M0060w=;
	b=Kz1ylrmADviUhBLrFwFbjGX+C43N4qRHPPUG91mYN7Rd5jAAz+u9wSlsOdBsgR5xuo
	ekapWw1U0yH2KQjGT9h6GIfFlCbVbt2fA6fZaNpd3yKIbkrQHRWHe4fk5CzNTJ+5s62W
	6mNFbCnSOdGxZhij03x5JL639Jy/IhuB5mJ2KlYjIX5rbAAHlLg/auyWefzNvDOndgMJ
	SZD8PYN2zrxJHmYDgvcSs4/8+F3YOTOoh/7SW8mIDEeQk8evJvO44d/J28nl7/+V5zEV
	60NfKAxi6e03JCN0TUgJHyxKmxNptc8/2uO59tLC+M8Nn4yIsG7BX1tfjifxUKk1H/4a
	M8Vw==
X-Gm-Message-State: AKS2vOzPbq7S3CEyjuk3FBGgO6dOi+397IbSMm5SENsse5n6j8dcu8Lu
	CQOaDDLogYQo8HR+acN+SJn9ULlBnQ==
X-Received: by 10.37.178.4 with SMTP id i4mr1036101ybj.147.1497876428710; Mon,
	19 Jun 2017 05:47:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.15.10 with HTTP; Mon, 19 Jun 2017 05:47:08 -0700 (PDT)
In-Reply-To: <21a26e8d-f5d4-21d9-7a50-01933937842d@linux.intel.com>
References: <20170616123014.2958-1-alexander.kanavin@linux.intel.com>
	<CA+chaQcdyHhKcoVu2_+Ei2bxfoL49c9ip7wxTegs2e8GKeopag@mail.gmail.com>
	<0ec7000d-a9fd-6eb2-a237-5d7b9895c885@linux.intel.com>
	<7b85a271-c47f-d31b-c3af-34fedd988974@windriver.com>
	<21a26e8d-f5d4-21d9-7a50-01933937842d@linux.intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 19 Jun 2017 14:47:08 +0200
Message-ID: <CA+chaQc21q-Zg7anAtU=1_XCU3WuEwPWZvhWXNNYkFpBqkVCsw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] bdwgc: add a recipe from oe-core
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
X-List-Received-Date: Mon, 19 Jun 2017 12:47:07 -0000
Content-Type: text/plain; charset="UTF-8"

Yes, send v2.

On Mon, Jun 19, 2017 at 1:53 PM, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 06/16/2017 07:34 PM, Randy MacLeod wrote:
>
> Is it just because of zile? +Randy who upgraded zile.
>>>>
>>>
>>> Yes, it's because of that. I checked latest upstream of zile, and it
>>> still seems to require it.
>>>
>>> Do you want me to resend the patch?
>>>
>>
>> Given that Martin said:
>>   "Please explain in commit message."
>> yes, you should send a V2 patch.
>>
>
> I'm already seeing the patch in master-next though. So still not sure -
> would really prefer to get a first hand answer.
>
>
> Alex
>
>

