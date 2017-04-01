Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id E15E177D1C
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Apr 2017 15:21:04 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id x124so3981005wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Apr 2017 08:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GfcHQ6poeL1QmB/6OuM2d/+uREmraAhDz8vOrfJnJZM=;
	b=YW4d2tIglQ6pFj1QUCGBcJkiwaoopwgsNKVyYU2s3V81Wplea4JieK/Bu1sXXTa1Cj
	I7K0YjplvGG9025YiodnyyG0RUEjo6LneiLzvLkyHbAohSvdfBo8hNe1YhIwW65x/XYs
	XRYldsk0QkCcK+aqih+kWvxJT3pfqokSR8CHZpu/EYEc5LaBRnvDj1lT6mfHa7/uLVMI
	ofma5EpXWKuFYalc+HDgCCCu9vJpqTO+4zBdXCZxFgKwABTqGAnyv4Cs+/6tCZK5h4HP
	Kdk7GofnCVpwP8l5LMFz1HOtsauYg9bG1QlXNSJZ5gG8BzhH3gt9KdaJwmGarv5mYmiA
	EOSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GfcHQ6poeL1QmB/6OuM2d/+uREmraAhDz8vOrfJnJZM=;
	b=thwMCuAmk4ilnY5gJJ3cOiYjL51NdWu7/3m+smFWTU2Jqp5jaZ2n8oXPv4/lJE3n1e
	uJyA6wG1INeSSGL7AdE6Xid3QAgAIoOU58NcjZL5DylFVsZgDOx8KKSrluM9cT1ebmwm
	fBQYmUcwzwSD2C/SkZC2lsxVKS+MeRulGUvpUukADlVp2Dx1wWou3UL54KFj1aGJ3YMV
	Mp3qlvWsg1TQgDNghy4O/q9/QdTS2uiH8eaCyUObA5yKOkhmFf6JFsElXTiQPtSwmAED
	/kX0H7tBfpPYad1V3QTUvf8E2VjuDDsZ9ddK0+GlYq1KEl5grugeA6hH4N9fv/dbnbiJ
	OJYg==
X-Gm-Message-State: AFeK/H1R2d1tFcQjyQca6hqftVnSiMQ3N2lIrhupdnNP+I17pUmT3ljxExw8tzL1FyUXFiuy0Pfu+7pktsBa4Q==
X-Received: by 10.28.125.14 with SMTP id y14mr2719312wmc.101.1491060065155;
	Sat, 01 Apr 2017 08:21:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Sat, 1 Apr 2017 08:20:34 -0700 (PDT)
In-Reply-To: <7019a8d36ba240d7969035c877f3171e@XBOX02.axis.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
	<20170331164247.5052-6-raj.khem@gmail.com>
	<7019a8d36ba240d7969035c877f3171e@XBOX02.axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 1 Apr 2017 08:20:34 -0700
Message-ID: <CAMKF1sqnLFBQW+TBmjv=bcVC3WEowLj0LfYPFM3pHmn9cL98Vg@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 06/43] lvm2: Fix patch errors found with musl
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
X-List-Received-Date: Sat, 01 Apr 2017 15:21:05 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 31, 2017 at 8:50 PM, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>> Khem Raj
>> Sent: den 31 mars 2017 18:42
>> To: openembedded-devel@lists.openembedded.org
>> Subject: [oe] [meta-oe][PATCH 06/43] lvm2: Fix patch errors found with
>> musl
>>
>> The patches had syntax errors which are only
>> visible when using musl libs
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../lvm2/0001-implement-libc-specific-reopen_stream.patch  | 14 +++++++-------
>>  .../lvm2/0002-Guard-use-of-mallinfo-with-__GLIBC__.patch   | 14 +++++++-------
>>  2 files changed, 14 insertions(+), 14 deletions(-)
>>
>> diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-implement-libc-specific-reopen_stream.patch b/meta-oe/recipes-support/lvm2/lvm2/0001-implement-libc-specific-reopen_stream.patch
>> index f09fd76b3..b6a7f1a92 100644
>> --- a/meta-oe/recipes-support/lvm2/lvm2/0001-implement-libc-specific-reopen_stream.patch
>> +++ b/meta-oe/recipes-support/lvm2/lvm2/0001-implement-libc-specific-reopen_stream.patch
>> @@ -1,7 +1,7 @@
>> -From ede7976da9431573b0104dbcfe91a32c02dbea13 Mon Sep 17 00:00:00 2001
>> +From e3103459416616d3b8508e7176e897b0ae6c90f2 Mon Sep 17 00:00:00 2001
>>  From: Dengke Du <dengke.du@windriver.com>
>>  Date: Tue, 25 Oct 2016 11:49:40 +0000
>> -Subject: [PATCH 1/4] implement libc specific reopen_stream
>> +Subject: [PATCH] implement libc specific reopen_stream
>>
>>  musl defines stdin/stdio/stderr as constant types which means
>>  we can not assign to them as we are doing here but works ok with glibc
>> @@ -13,15 +13,15 @@ http://git.alpinelinux.org/cgit/aports/tree/main/lvm2/fix-stdio-usage.patch
>>
>>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>  Signed-off-by: Dengke Du <dengke.du@windriver.com>
>> ----
>> -Upstream-Status: Pending
>> +
>> +%% original patch: 0001-implement-libc-specific-reopen_stream.patch
>
> This chunk does not look as it was intended...
>

Yeah, devtool creation and I did git format-patch since I was squashing.

>>  ---
>>   lib/log/log.c      | 6 ++++++
>>   tools/lvmcmdline.c | 6 +++---
>>   2 files changed, 9 insertions(+), 3 deletions(-)
>>
>>  diff --git a/lib/log/log.c b/lib/log/log.c
>> -index c933154..638839d 100644
>> +index c933154..3581084 100644
>>  --- a/lib/log/log.c
>>  +++ b/lib/log/log.c
>>  @@ -161,6 +161,7 @@ static void _check_and_replace_standard_log_streams(FILE *old_stream, FILE *new_
>> @@ -38,7 +38,7 @@ index c933154..638839d 100644
>>   }
>>  +#else
>>  +{
>> -+    return (freopen(NULL, mode, *stream) != NULL)
>> ++    return (freopen(NULL, mode, *stream) != NULL);
>>  +}
>>  +#endif
>>
>> @@ -76,5 +76,5 @@ index 9a4deb7..f1f18e6 100644
>>                      strerror(errno));
>>               return 0;
>>  --
>> -2.9.3
>> +2.12.0
>>
>> diff --git a/meta-oe/recipes-support/lvm2/lvm2/0002-Guard-use-of-mallinfo-with-__GLIBC__.patch b/meta-oe/recipes-support/lvm2/lvm2/0002-Guard-use-of-mallinfo-with-__GLIBC__.patch
>> index 5baafab3e..ef385099f 100644
>> --- a/meta-oe/recipes-support/lvm2/lvm2/0002-Guard-use-of-mallinfo-with-__GLIBC__.patch
>> +++ b/meta-oe/recipes-support/lvm2/lvm2/0002-Guard-use-of-mallinfo-with-__GLIBC__.patch
>> @@ -1,20 +1,20 @@
>> -From 8706a6d33753d8b2cf5bb2a12bd6880b371ce337 Mon Sep 17 00:00:00 2001
>> +From 3ae9c0b607ec33fb07f32a41e9d28cc9068dd39a Mon Sep 17 00:00:00 2001
>>  From: Dengke Du <dengke.du@windriver.com>
>>  Date: Tue, 25 Oct 2016 11:52:44 +0000
>> -Subject: [PATCH 2/4] Guard use of mallinfo() with __GLIBC__
>> +Subject: [PATCH] Guard use of mallinfo() with __GLIBC__
>>
>>  This API is glibc-only
>>
>>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>  Signed-off-by: Dengke Du <dengke.du@windriver.com>
>> ----
>> -Upstream-Status: Pending
>> +
>> +%% original patch: 0002-Guard-use-of-mallinfo-with-__GLIBC__.patch
>
> Same here.
>
>>  ---
>>   lib/mm/memlock.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>>  diff --git a/lib/mm/memlock.c b/lib/mm/memlock.c
>> -index da90144..c1bf8fb 100644
>> +index da90144..f34f890 100644
>>  --- a/lib/mm/memlock.c
>>  +++ b/lib/mm/memlock.c
>>  @@ -150,7 +150,7 @@ static void _touch_memory(void *mem, size_t size)
>> @@ -22,10 +22,10 @@ index da90144..c1bf8fb 100644
>>   static void _allocate_memory(void)
>>   {
>>  -#ifndef VALGRIND_POOL
>> -+#ifndef VALGRIND_POOL && defined(__GLIBC__)
>> ++#if !defined(VALGRIND_POOL) && defined(__GLIBC__)
>>       void *stack_mem;
>>       struct rlimit limit;
>>       int i, area = 0, missing = _size_malloc_tmp, max_areas = 32, hblks;
>>  --
>> -2.9.3
>> +2.12.0
>>
>> --
>> 2.12.1
>
> //Peter
>

