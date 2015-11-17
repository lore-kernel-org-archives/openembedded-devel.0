Return-Path: <picmaster@mail.bg>
Received: from mx1.mail.bg (mx1.mail.bg [193.201.172.117])
	by mail.openembedded.org (Postfix) with ESMTP id EF0176010B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Nov 2015 13:19:25 +0000 (UTC)
Received: from [192.168.43.108] (85-118-68-49.mtel.net [85.118.68.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.mail.bg (Postfix) with ESMTPSA id EFFF1600A01B;
	Tue, 17 Nov 2015 14:32:13 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mail.bg; s=default;
	t=1447763534; bh=PVX2XJlK+DCB7AWyi7e+7haa+FFLjUfesnCx+zl8WTE=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=buFyr4DhZM7XKessxgstzS9JzNaJvLj7bH3fe7nHiwA3bWxQ4m2nQO6QYYPHkjKm4
	5WWylk+jJJhPOcoQwSUO9HDrT5JDrJDfBHQudgvpofbjZCGxGVNRH3qAE00uw0zz94
	jf692fn3C/VDYRUbPMvBZiwM25RYW3tcZMRziG0g=
Message-ID: <564B1E4C.2090409@mail.bg>
Date: Tue, 17 Nov 2015 14:32:12 +0200
From: Nikolay Dimitrov <picmaster@mail.bg>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Andre McCurdy <armccurdy@gmail.com>
References: <1447217296-7145-1-git-send-email-armccurdy@gmail.com>	<1447217296-7145-2-git-send-email-armccurdy@gmail.com>	<56473F66.3020501@mail.bg>
	<CAJ86T=X43k=FjHDh288yX4n8z0yDZnmXwvQpFiNiSqO7oYR5tg@mail.gmail.com>
In-Reply-To: <CAJ86T=X43k=FjHDh288yX4n8z0yDZnmXwvQpFiNiSqO7oYR5tg@mail.gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-browser][PATCH 2/2] chromium: use PARALLEL_MAKE to control build parallelism
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
X-List-Received-Date: Tue, 17 Nov 2015 13:19:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andre,

On 11/16/2015 08:15 PM, Andre McCurdy wrote:
> Hi Nikolay,
>
> On Sat, Nov 14, 2015 at 6:04 AM, Nikolay Dimitrov <picmaster@mail.bg> wrote:
>> Hi Andre,
>>
>> On 11/11/2015 06:48 AM, Andre McCurdy wrote:
>>>
>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>> ---
>>>    recipes-browser/chromium/chromium_40.0.2214.91.bb | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/recipes-browser/chromium/chromium_40.0.2214.91.bb
>>> b/recipes-browser/chromium/chromium_40.0.2214.91.bb
>>> index a9635cd..f20610c 100644
>>> --- a/recipes-browser/chromium/chromium_40.0.2214.91.bb
>>> +++ b/recipes-browser/chromium/chromium_40.0.2214.91.bb
>>> @@ -196,7 +196,7 @@ do_configure_append() {
>>>
>>>    do_compile() {
>>>            # build with ninja
>>> -        ninja -C ${S}/out/${CHROMIUM_BUILD_TYPE} -j${BB_NUMBER_THREADS}
>>> chrome chrome_sandbox
>>> +        ninja -C ${S}/out/${CHROMIUM_BUILD_TYPE} ${PARALLEL_MAKE} chrome
>>> chrome_sandbox
>>>    }
>>
>>
>> Can you please share the chromium build times on your build-box with
>> and without this patch? I'm just curious how well this worked for you.
>
> By default BB_NUMBER_THREADS and PARALLEL_MAKE are both derived from
> the number of logical CPU cores (as detected by oe.utils.cpu_count()),
> so the patch should not have any effect on build times.
>
> The patch is about correctness - it's not really right to use
> BB_NUMBER_THREADS for anything other than setting the maximum number
> of BitBake threads.

Ahh, I see. Thanks.

Regards,
Nikolay

