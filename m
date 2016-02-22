Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id C5ED3770E3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 21:38:02 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id g62so183416610wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=kghzhA3aapYPL9P59R4BcmhyG7aPsv/yA2zaZTLMEGs=;
	b=qYGgjwPBXrzAR8YPzwH3QXEqVpt9kOohMrtTZf6gcgkys+XlAAmyGDEAwN3Jhx5Ink
	uHC1AhxsWDznnixn/VxodjhJJrkbyijro1xiZg44uJwe2B2lfzQpBERJqg/T6MTX1XKV
	GXSk6lZsVtygdmD9Hvm+0dfuDIJwApAo+19OsnohA/6op/o8cZsii1/JbxRrPIymGW9B
	6G10ttTnrvkKmVBbGozsCgAdXsdw1NBiP4COA6ZYdKAPo2/tpkxx8DtoMlQ2KRYsSdDB
	hpaAiaFI6aLYt/We5Ij6nIuWUlAD58SRJqblhQSNMXmiqV649RnR1+VUcYwakGloAUP4
	RhlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=kghzhA3aapYPL9P59R4BcmhyG7aPsv/yA2zaZTLMEGs=;
	b=cXGlFdaB7xPb+VLPEfgf6icAEbPWJnWmm20snaKClunkzXcwz92UIVJUXxXoe8RvfV
	eCS82/4vGl8clbFntyOPJpztNlgP+XzdOSIh1r1fy3beEreOm4a1acRkpZJPq34afScu
	tyRRYBFj8E7Suxp0SXWQmPL/Jgs481XelULxiYB6q88MNC/y5mNstTVX3uj0V204dMkB
	UIa5/lFk1iFN7EtulwsLbvQWd+PT6Ku1hc6pX9lmBRbfjhqvwhym7DtqFmJq+hTYiGGr
	lpfjVeMhmbPsftINhpKTRTgnWh+rRMtXpUQKMp26JQGrzjQDhkBDO2fECNFiatMRks2e
	kLlw==
X-Gm-Message-State: AG10YOR0g0Ri9bya9hx6BE2CLvJm3wCcumH9DWgKC1sEjnhWHzGYKZAOgqIuFhisLsvpD3oMA4jDlGM2vkGt5w==
MIME-Version: 1.0
X-Received: by 10.194.242.202 with SMTP id ws10mr12211369wjc.3.1456177082768; 
	Mon, 22 Feb 2016 13:38:02 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Mon, 22 Feb 2016 13:38:02 -0800 (PST)
In-Reply-To: <56CB035F.9060008@mlbassoc.com>
References: <56CAE338.7040002@mlbassoc.com>
	<CA+chaQfxh9R_EN8XSsrPGCv4OsQ31jSTV+EYsFHqJ=thipjAKQ@mail.gmail.com>
	<56CAE68F.4000102@mlbassoc.com> <56CAFFD2.6090304@siemens.com>
	<56CB035F.9060008@mlbassoc.com>
Date: Mon, 22 Feb 2016 13:38:02 -0800
Message-ID: <CAJ86T=UXH9RNtdYGEirNwmFH8__F-SN4ztdQtZhR-9UOXZkYOw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-browser] ARM support in Chromium
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
X-List-Received-Date: Mon, 22 Feb 2016 21:38:03 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 22, 2016 at 4:47 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2016-02-22 13:32, Pascal Bach wrote:
>>
>> Am 22.02.2016 um 11:44 schrieb Gary Thomas:
>>>
>>> On 2016-02-22 11:32, Martin Jansa wrote:
>>>>
>>>> Yes it can, because cortex-a7 is armv7a.
>>>
>>> My build failed listing the board as not compatible
>>>    ERROR: Nothing PROVIDES 'chromium'
>>>    ERROR: chromium was skipped: incompatible with machine teton-p0381
>>> (not in COMPATIBLE_MACHINE)
>>
>>
>> I think it might be worth to have a look at your MACHINEOVERRIDES
>> variable.
>> bitbake -e should be of assistance here.
>>
>
> Good pointer - the ARM architecture is being set to armv7ve, not armv7a
>
> This was changed (by Martin Jansa) in Poky commit
> c6a19917ec5350cdfc4053d14462609782613bbc
>
> I suppose a patch to the chromium recipe to allow armv7ve is in order.

Yes. Maybe update the cef3 recipe too, since it will have the same issue.

>>>> On Mon, Feb 22, 2016 at 11:30 AM, Gary Thomas <gary@mlbassoc.com> wrote:
>>>>
>>>>> A recent change to the chromium recipe restricts it to only
>>>>> armv6 and armv7a.  I've built (and successfully run) previous
>>>>> versions of chromium on my LS102x board which is cortexa7hf.
>>>>> It's not clear to me what arm revision that works out to be
>>>>> (where does one look for this info?) but I'd like to see if
>>>>> chromium can still be used on my board?
>>>>>
>>>>> Thanks for any pointers
>>>
>>>
>>
>
>
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

