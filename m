Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Ph5Tj-0003M0-Os
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Jan 2011 20:19:59 +0100
Received: by bwz10 with SMTP id 10so3199430bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Jan 2011 11:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:in-reply-to:references:x-user-agent
	:mime-version:content-type:content-transfer-encoding:subject:from
	:date:to:message-id;
	bh=h0pdudBjIhZSzpkkXmVfie12I7UtA9bQafM4PzgWiqY=;
	b=lfWuv2CjIXcv8L4STcqfSYTnWDyJQkIE4K6gSqHBtXbyoOZHaKpTvapSQ/MxDNgp0J
	BqmCPEXvV2g3b/8+6VKiLoYFP7/wlB8cxvRzRHekUc1jK4gI8gjvWyvOlqmBY4PERK3Y
	FNoB730WKygo/dxFIjrwp6I4x5vQaNWv/UOSA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=in-reply-to:references:x-user-agent:mime-version:content-type
	:content-transfer-encoding:subject:from:date:to:message-id;
	b=TF5J4qlyj4Oz7TxfHsAHnIu5xc7EkmMor2IAy/aB7Z8CsGhiCRWbRZcxgcKfIbhPvw
	BXsa5hO4DnqJGm8Lyai/ZNlYTSKV+PQ3t8jJKIXVEOaJsExRGtm1vtcGXoREwYGwG9SO
	dvQoPGY1JPvtCJICvuBo8zTEFzjOEdhf/qqHY=
Received: by 10.204.70.136 with SMTP id d8mr2788868bkj.96.1295810353124;
	Sun, 23 Jan 2011 11:19:13 -0800 (PST)
Received: from [10.145.86.130] (212095007080.public.telering.at [212.95.7.80])
	by mx.google.com with ESMTPS id
	f20sm5671399bkf.16.2011.01.23.11.19.11
	(version=SSLv3 cipher=RC4-MD5); Sun, 23 Jan 2011 11:19:12 -0800 (PST)
In-Reply-To: <4D3C4B0B.3080108@mentor.com>
References: <AANLkTinz+p5J6K+XhohJJ=q7dD3X1kVGZDNA-4qOOH2W@mail.gmail.com>
	<AANLkTimSeB5GqQSyMtskAm_3O9h-MWfCJJz+FAFnnkB8@mail.gmail.com>
	<AANLkTin27ikNKV4v3D+e+cu_=SHv7Vv+0ef-z61irn60@mail.gmail.com>
	<AANLkTimOGhiwA+szLoWVzAUP2AUX1YVBcOnMLg3YSWdM@mail.gmail.com>
	<4D3C4B0B.3080108@mentor.com>
X-User-Agent: K-9 Mail for Android
MIME-Version: 1.0
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Sun, 23 Jan 2011 19:49:23 +0100
To: openembedded-devel@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <469a0aaf-2b6c-4151-a6e6-547b2093c851@email.android.com>
Subject: Re: Recipes with fetch failures:
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 23 Jan 2011 19:19:59 -0000
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

"Tom Rini" <tom_rini@mentor.com> wrote:

>On 01/22/2011 01:17 PM, Khem Raj wrote:
>> On Sat, Jan 22, 2011 at 12:07 PM, Otavio Salvador
>> <otavio@ossystems.com.br>  wrote:
>>> On Sat, Jan 22, 2011 at 17:46, Khem Raj<raj.khem@gmail.com>  wrote:
>>>> On Sat, Jan 22, 2011 at 10:06 AM, Otavio Salvador
>>>>>   
>cvs://anoncvs:anoncvs@anoncvs.handhelds.org/cvs;module=ipkg-utils
>>>>>
>>>>
>>>> yeah hh.org is gone. So you need to rely on mirrors to get the
>tarballs
>>>> add
>>>>
>>>> SOURCE_MIRROR_URL ?= "http://sources.openembedded.org/"
>>>>
>>>> to your local.conf and probably you also need to inherit
>own_mirrors
>>>
>>> I think the recipe should be change to use this in this case. I know
>I
>>> can use mirrors but the recipe ought to use a fetchable reference
>IMO.
>>>
>>
>> we are still hopeful of getting the cvs repos. But yes it wont hurt
>if
>> the SRC_URIs pointed
>> to source mirrors for now
>
>If a rather critical part of how we do things was apparently dead 
>software and just went away, perhaps we really really need to 
>investigate using something else or taking up the project and hosting
>it 
>$wherever ?
>
>-- 
>Tom Rini
>Mentor Graphics Corporation
>
>_______________________________________________
>Openembedded-devel mailing list
>Openembedded-devel@lists.openembedded.org
>http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

... or remove any notion of ipkg and use .opk


