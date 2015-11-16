Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2AA5E6E268
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2015 18:15:20 +0000 (UTC)
Received: by wmww144 with SMTP id w144so131355539wmw.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2015 10:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=enO2KRHhs2KiicZmD2YAfTlut3I+xlJa9pXwsEcgwRg=;
	b=lKKPdI0wtJK3Tsgr2dqJgvHPPYAwI5ZEIthZzaREb2RIvkBOt9sHUmSsyyDo9aQYqt
	uGgL1xD92Zq+0bXAPobhgDlxawlkDza3hKyk4wgdGmo1SbXxTlgJuhz8gYOrQNaKxkp5
	bJvpEw2RhAwXym0zMC84vIj2t+h5wM6pkvRB4rGF+lGNIXTzjsJfw6uziwfH/cihdUUI
	mkCb3JiPn/WjxrMZ3J2pGbbiStz4z3oly8h2/zs71bM0qbR2rY01VgWlgtiueM9DM2CD
	Dt0jrB6DtMydiR6o3FXL4NasKDxYKZ1rxZFfWehHaph4CmEL7oDP3Ok/I1xdvdOsWQr2
	eCtQ==
MIME-Version: 1.0
X-Received: by 10.194.90.169 with SMTP id bx9mr38088018wjb.1.1447697720161;
	Mon, 16 Nov 2015 10:15:20 -0800 (PST)
Received: by 10.194.140.38 with HTTP; Mon, 16 Nov 2015 10:15:20 -0800 (PST)
In-Reply-To: <56473F66.3020501@mail.bg>
References: <1447217296-7145-1-git-send-email-armccurdy@gmail.com>
	<1447217296-7145-2-git-send-email-armccurdy@gmail.com>
	<56473F66.3020501@mail.bg>
Date: Mon, 16 Nov 2015 10:15:20 -0800
Message-ID: <CAJ86T=X43k=FjHDh288yX4n8z0yDZnmXwvQpFiNiSqO7oYR5tg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Nikolay Dimitrov <picmaster@mail.bg>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-browser][PATCH 2/2] chromium: use PARALLEL_MAKE to control build parallelism
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Nov 2015 18:15:21 -0000
Content-Type: text/plain; charset=UTF-8

Hi Nikolay,

On Sat, Nov 14, 2015 at 6:04 AM, Nikolay Dimitrov <picmaster@mail.bg> wrote:
> Hi Andre,
>
> On 11/11/2015 06:48 AM, Andre McCurdy wrote:
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>   recipes-browser/chromium/chromium_40.0.2214.91.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-browser/chromium/chromium_40.0.2214.91.bb
>> b/recipes-browser/chromium/chromium_40.0.2214.91.bb
>> index a9635cd..f20610c 100644
>> --- a/recipes-browser/chromium/chromium_40.0.2214.91.bb
>> +++ b/recipes-browser/chromium/chromium_40.0.2214.91.bb
>> @@ -196,7 +196,7 @@ do_configure_append() {
>>
>>   do_compile() {
>>           # build with ninja
>> -        ninja -C ${S}/out/${CHROMIUM_BUILD_TYPE} -j${BB_NUMBER_THREADS}
>> chrome chrome_sandbox
>> +        ninja -C ${S}/out/${CHROMIUM_BUILD_TYPE} ${PARALLEL_MAKE} chrome
>> chrome_sandbox
>>   }
>
>
> Can you please share the chromium build times on your build-box with
> and without this patch? I'm just curious how well this worked for you.

By default BB_NUMBER_THREADS and PARALLEL_MAKE are both derived from
the number of logical CPU cores (as detected by oe.utils.cpu_count()),
so the patch should not have any effect on build times.

The patch is about correctness - it's not really right to use
BB_NUMBER_THREADS for anything other than setting the maximum number
of BitBake threads.

> Thanks and regards,
> Nikolay

