Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f175.google.com (mail-yk0-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7405E60030
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jun 2014 13:59:55 +0000 (UTC)
Received: by mail-yk0-f175.google.com with SMTP id 9so2871390ykp.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jun 2014 06:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=c9AhFVlJMeU7SZ9pAg00jH6nASP4viI+P3cIgL7/+kg=;
	b=D4WW8eECaN5GALiT1avej3LnSuJmCiMGxhxgQhgJziYARjGBMe3++QO1ugJoPrFf0a
	1bizkYYxM2ANF/29kKYIVumnJB93koxLVp2kgXUL1SMn9wz7jq/ojDgIAMXycPX3pCaw
	gtkqhMvSsL/HDwwBSppKUOwNSKJXPKPMHzvotmccMAZJ01VtyzoNGpODTTrT9hwYW/l+
	nD74OwwMLX7nVnIDpDCgsKDWpWVjg1G5qwYZwAg7yeRVnliNplO9KeDoXqjpFbHeSUz5
	nnGVM1YvqZcwv71wZSe4oePuPog29M1FrlTMUmXL1u+EA5htdxdWbNw+6oz7+Y24jo5u
	Eceg==
MIME-Version: 1.0
X-Received: by 10.236.207.225 with SMTP id n61mr3349087yho.148.1403877596941; 
	Fri, 27 Jun 2014 06:59:56 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.233.65 with HTTP; Fri, 27 Jun 2014 06:59:56 -0700 (PDT)
In-Reply-To: <B01FEAA5-E6AF-40A3-9C03-A1F204451E86@dominion.thruhere.net>
References: <Lauren.Post@freescale.com>
	<1403793465-6376-1-git-send-email-lauren.post@freescale.com>
	<lojdi3$8mu$1@ger.gmane.org>
	<CAP9ODKrjhhBwm2Uuwg9j5RQ9e7NdX7TvOTrCG7mjWkWjA77Hiw@mail.gmail.com>
	<B01FEAA5-E6AF-40A3-9C03-A1F204451E86@dominion.thruhere.net>
Date: Fri, 27 Jun 2014 10:59:56 -0300
X-Google-Sender-Auth: CIz_sZ1VCuSi3ahq6I3L9sfNgs4
Message-ID: <CAP9ODKqpYJh8wYfxPbcjTEpJN9sSyK0DdyOyw-zt7fMxPgoXoA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] cpuburn-neon: Upgrade to 2014066 version to fix build break
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
X-List-Received-Date: Fri, 27 Jun 2014 13:59:57 -0000
Content-Type: text/plain; charset=UTF-8

Hello Koen,

On Fri, Jun 27, 2014 at 10:40 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 27 jun. 2014, om 15:09 heeft Otavio Salvador <otavio@ossystems.com.br> het volgende geschreven:
>
>> Hello Koen,
>>
>> On Fri, Jun 27, 2014 at 6:29 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>> Lauren Post schreef op 26-06-14 16:37:
>>>> Replace SRC_URI with new location, md5sum and new name since previous
>>>> download will not work.  Without this fix cpuburn-neon has a broken
>>>> build.
>>>
>>> Why not make the recipe clone the git repo?
>>
>> I pondered about this when looking at the issue with Lauren. The
>> recipe was like this before and this build break is causing issues for
>> several people using meta-fsl-demos as we include it in our test
>> images.
>>
>> The long term solution should be to rework it (also because it has
>> extra tests and those are not being included) but I think this fix is
>> urgent and known to work for now.
>
> It's still the wrong way to fix it, rework it to use git://, this will break again when the repo gets updated.
>
>> This fix needs to be backported to old branches as well as current
>> recipe fails to fetch.
>
> if you're going to backport it make sure it's the right fix.

Instead we can use, for now, the below URL so it stays working even if
it is updated.

https://raw.githubusercontent.com/ssvb/cpuburn-arm/dd5c5ba58d2b0b23cfab4a286f9d3f5510000f20/cpuburn-a8.S

Fine for this fix? I will update it to use the clone and also include
the extra tests (for A8, A9 and A7 plus the JPEG ones) soon.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

