Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id AFF1C766B2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 07:22:32 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so42708620wmv.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 23:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=yNDjK6C2KvALvkpohrsIz5fqfwt0geMhBOJ4Kh0zhbU=;
	b=gku/kRrmmgATHK7Z6OUKNKa6UWnjBbn33rWOOKsXBYEvqyiaN+kUFisTV30ZgT70QE
	5U1PfhzNANYP9AzXYNnSte8cp/EJcB62lFYkl/bABL12OIShLwWM8aDY4GZpvaYLGOUO
	wz6DCoXSe8HGUq+6sSd1ZI3HYIznOI250WpgfiB+cK/zysAYdt1aZGWh8Ipi6kwXrejW
	6z0jRUY+fOzkI/O3fhzhuz+fcBHJ+O3ARByZn5MmROssidtSOGmgaVBwRGBsYo2u5jxn
	QuGpKXWj849urARE/aaxBNEcaQ+Wnv5Ryw50rkmRMmeSnUZ26KnGrx13nXyUny95vBXp
	/0/A==
MIME-Version: 1.0
X-Received: by 10.194.90.169 with SMTP id bx9mr3759446wjb.1.1447226552131;
	Tue, 10 Nov 2015 23:22:32 -0800 (PST)
Received: by 10.194.140.38 with HTTP; Tue, 10 Nov 2015 23:22:32 -0800 (PST)
In-Reply-To: <CAAzKXngADOxQ-rOfF1DBSNqhV-GUPookXZjLkTZ=CgOf4ks7Eg@mail.gmail.com>
References: <1447217296-7145-1-git-send-email-armccurdy@gmail.com>
	<CAAzKXngADOxQ-rOfF1DBSNqhV-GUPookXZjLkTZ=CgOf4ks7Eg@mail.gmail.com>
Date: Tue, 10 Nov 2015 23:22:32 -0800
Message-ID: <CAJ86T=X_4vtGKXxW5y8e3zS-tv9fAnnmsOPFFuOrZp8wHdJMCA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Wed, 11 Nov 2015 07:22:39 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 10, 2015 at 9:48 PM, Zoltan Kuscsik
<zoltan.kuscsik@linaro.org> wrote:
> Hi,
>
> isn't ninja picking up the number of cores separately? I'm not sure why
> this is needed.

Without any -j option, ninja will default to "-j (logical_cores + 2)".

The PARALLEL_MAKE value configured in OE isn't just about maximising
parallelism though (although that's it's common usage), it's also
useful to limit parallelism and reduce the load on the CPU. If
PARALLEL_MAKE isn't passed to ninja builds then they will always fully
load the CPU.

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

