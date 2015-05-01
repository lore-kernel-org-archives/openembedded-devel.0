Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2F1E373E1E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 May 2015 15:48:24 +0000 (UTC)
Received: by iget9 with SMTP id t9so30035479ige.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 May 2015 08:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=cmob+1SoHkh84m73zIjR7nnO2h9QLeYp2A3vCXerR7s=;
	b=0ibga9+75Wqe8+oyl6jR1qHV0lNL0uspglCZc5+tt2qfUEf3AUAAXXff4H3NTniUt/
	RbFdPneusBDPJjNDUct3o/BPJufpo2rbK2Ru5msAnhwCl49UNqc10W16IF3kDwmtqvwR
	1Yk8Vkb6SvixsrjDSW9IOhGglw+YeG6tIpxS0M+QSMHOPO8v5UrqucdD3nlICHNXpYUq
	MfCnTegVNlXckJyakhRS81rnuONRR0cxTybcgww5En+2A+mbRDCicaQxUrNikcp49NLP
	ciWT71buJs5k0QGwYbG9a45vO28g3jjTShafo5Xu7umDqIjg92U3+ctkoC1W8FBoaHji
	Q8oA==
X-Received: by 10.107.30.10 with SMTP id e10mr13182614ioe.72.1430495305956;
	Fri, 01 May 2015 08:48:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.230.178 with HTTP; Fri, 1 May 2015 08:47:55 -0700 (PDT)
In-Reply-To: <CAMKF1spGC+4unddLJeqCuynaBeP7h62raW2RN==EeNu=SzeYfA@mail.gmail.com>
References: <1430153054-1252-1-git-send-email-raj.khem@gmail.com>
	<CAJ86T=Witf+y68y_r-HtcR5FZvHGMOzOrxOYzWhLPFQd9zbdMg@mail.gmail.com>
	<DCD4D1D9-2F13-449B-9A49-43E95C4255C5@gmail.com>
	<CAP9ODKrGu5sJo9WO--7U511hOeOJKcK-W8e8vE1K2RiFkJ2fvQ@mail.gmail.com>
	<5541157E.2080807@pseudoterminal.org>
	<CAMKF1spGC+4unddLJeqCuynaBeP7h62raW2RN==EeNu=SzeYfA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 May 2015 08:47:55 -0700
Message-ID: <CAMKF1sqNa832Bjw9fQkO=G1Xqyqc7X7uZMhyBG6xG0RquqA+UA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: pnandyala <Pavan.Nandyala@lnttechservices.com>,
	Zoltan Kuscsik <zoltan.kuscsik@linaro.org>,
	knagabhirava <kalyankumar.nagabhirava@lnttechservices.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-browser][PATCH 1/2 V4] cef3: Add recipe for Chromium Embedded Framework
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
X-List-Received-Date: Fri, 01 May 2015 15:48:25 -0000
Content-Type: text/plain; charset=UTF-8

ping. Can this now be merged ?

On Wed, Apr 29, 2015 at 10:54 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Apr 29, 2015 10:37 AM, "Carlos Rafael Giani" <dv@pseudoterminal.org>
> wrote:
>>
>> The latest one (V8) seems good to me. I was initially skeptical about the
>> heavy chromium.inc refactoring, but these days we don't have multiple
>> chromium versions in meta-browser, so it is okay.
>> The shared object versioning bandaid wasn't done by me, I modified other
>> parts, but I agree with the patch. The way it is done now is cleaner.
>> Have you come across a case where there were codec package conflicts?
>>
>
> Not yet but this makes it future proof. Since I know there are packages with
> same .so
>>
>>
>> Am 2015-04-27 um 23:40 schrieb Otavio Salvador:
>>>
>>> On Mon, Apr 27, 2015 at 6:37 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>>>
>>>>> On Apr 27, 2015, at 1:33 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>>>>
>>>>> Looks like some regressions may have crept back relative previous
>>>>> versions of the patch?
>>>>>
>>>>>   - dubious indent in do_install()
>>>>>   - .pak files being installed as executables
>>>>>   - dev-so INSANE_SKIP shouldn't be requied
>>>>>
>>>> Thanks for bringing it up. I will send a followup to fix it
>>>> incrementally.
>>>
>>> Please wait for Carlos comments and send a new pathc revision. This is
>>> not yet merged so fixes are still possible.
>>>
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

