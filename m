Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 31E2276294
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 06:33:15 +0000 (UTC)
Received: by iofh3 with SMTP id h3so25492569iof.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 22:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=ZBP+eKJHXtCDT9rwMjPpNvOMXY3qlECFS/joy+EVEA8=;
	b=pxuor1gfeR1QU0oCedzlHapQysG1q4l2o1hNYNVYio7wbNuhkj3Q+B96oJRqkiTMQy
	cyZnPxcjXsaQoGEweXrpUu4WJlbAXL1scNfRC4DVmM4XR20xUWsNpJZLT2t/LlN3+sB6
	+C7G5YR5Jfv6VIpQsfKsobn0I4RTQDavIjoOGh50qqYg8GD2foIalyAmb4Mjy8Z22ZWv
	z67RebI3mkLlZMTcweUA80quAtY9LQpO3sT7IF89wRC1x4H+DrkKDdpOZ2DxGXF5Iev/
	6IgA0UBYWavt45ltB8T/IUqAfGLl/FC3JoNXFhVt8/SCRa4+Vj3E4GbMOJM6Cs2RUWgq
	1Cag==
X-Received: by 10.107.9.152 with SMTP id 24mr7516406ioj.112.1447223595917;
	Tue, 10 Nov 2015 22:33:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.12.205 with HTTP; Tue, 10 Nov 2015 22:32:46 -0800 (PST)
In-Reply-To: <CAAzKXngADOxQ-rOfF1DBSNqhV-GUPookXZjLkTZ=CgOf4ks7Eg@mail.gmail.com>
References: <1447217296-7145-1-git-send-email-armccurdy@gmail.com>
	<CAAzKXngADOxQ-rOfF1DBSNqhV-GUPookXZjLkTZ=CgOf4ks7Eg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Nov 2015 22:32:46 -0800
Message-ID: <CAMKF1srehw6-jLL53xwckqGqWVobbKAHQcewQYXg3g0Qi=je_g@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH 1/2] cef3: use PARALLEL_MAKE to control build parallelism
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
X-List-Received-Date: Wed, 11 Nov 2015 06:33:16 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 10, 2015 at 9:48 PM, Zoltan Kuscsik
<zoltan.kuscsik@linaro.org> wrote:
> Hi,
>
> isn't ninja picking up the number of cores separately? I'm not sure why
> this is needed.
>

thats another issue. This one atleast improves the current usage a nit.

>
> Z
>
> On 11 November 2015 at 05:48, Andre McCurdy <armccurdy@gmail.com> wrote:
>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  recipes-browser/chromium/cef3_280796.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-browser/chromium/cef3_280796.bb
>> b/recipes-browser/chromium/cef3_280796.bb
>> index d827b8e..6872e5b 100644
>> --- a/recipes-browser/chromium/cef3_280796.bb
>> +++ b/recipes-browser/chromium/cef3_280796.bb
>> @@ -60,5 +60,5 @@ do_qa_configure() {
>>  }
>>
>>  do_compile() {
>> -    ninja -C out/${CHROMIUM_BUILD_TYPE} -j${BB_NUMBER_THREADS} cefsimple
>> +    ninja -C out/${CHROMIUM_BUILD_TYPE} ${PARALLEL_MAKE} cefsimple
>>  }
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>
>
> --
> Zoltan Kuscsik
>
> Senior Software Developer, Linaro Digital Home Group
> email: zoltan.kuscsik@linaro.org
> IRC: zoli_ on irc.linaro.org
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

