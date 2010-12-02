Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PO3nF-0007g0-4p
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Dec 2010 08:41:29 +0100
Received: by ywp4 with SMTP id 4so256068ywp.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 23:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=hqO3LyMsr18Zq1MbcsTcUxfX77fFnTwHeZI7533EMx8=;
	b=mGkNRgFzE6ii6d6lUxaOBQ8QfRX2IpOhu/8CkPu/J40Sqzwiwmczmkqrw2WQQHZaPD
	fkas2ASFShxR9x7QJCjyCYASS7fOdtviII2P4Sg9M7bYtA2KDMI/LIIval5b93/qNMWT
	AU2OzD28OeAFCfUEMTczNGEdZmZIo6+XwQ7fM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=Z8IURjy6QePQDpLwUozHD3x5LpL1cT/idey6w9Q09WrLx2g4BhwBjpRDbjoZlI7TxS
	rtoMLJubqrPBrtySJyyT3PF0bWNuBlLxyfJKN3XqYUQqBhUhANqXuhHudtxjJbQ1yQ4n
	hOlYy1HfWgR4YVavPpNqC4RodFO+0NZWi+McY=
Received: by 10.90.9.22 with SMTP id 22mr775219agi.102.1291275606091; Wed, 01
	Dec 2010 23:40:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Wed, 1 Dec 2010 23:39:45 -0800 (PST)
In-Reply-To: <AANLkTi=4piRxXUC6GcBPg_pTsGjrbMC6sxEnUoVPJAy5@mail.gmail.com>
References: <AANLkTi=yLLv7wx_M6fBkZV7+_RJaTqmDRbY995-xpb2P@mail.gmail.com>
	<20101201104723.GA20482@excalibur.local>
	<AANLkTi=4piRxXUC6GcBPg_pTsGjrbMC6sxEnUoVPJAy5@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Dec 2010 23:39:45 -0800
Message-ID: <AANLkTik2tNWSDTHi+z1M88dzGRjgYOh99yN_SKe9vwWP@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: release-2010: when & what to do
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
X-List-Received-Date: Thu, 02 Dec 2010 07:41:29 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 1, 2010 at 5:33 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/12/1 Stefan Schmidt <stefan@datenfreihafen.org>:
>> Hello.
>>
>> On Wed, 2010-12-01 at 10:06, Frans Meulenbroeks wrote:
>>>
>>> I wanted to raise the issue of when to do the release. I seem to
>>> recall dec 1 was coined in the past (which is today in most of the
>>> timezones at the time of writing).
>>
>> Thats correct.
>>

I planned it for this coming friday. There still are some patches
for micro that needs to go in.

>>> It seems to me that we still some areas needing attention (uclibc, the
>>> multiple provides for a few packages and probably some more things).
>>> What about if we try to get these resolved this week, plan an
>>> additional testing session over the weekend and decide early next week
>>> on how to proceed?
>>
>> Doe we already have patches for the issues? If not I think delaying the release
>> for issues we don't even have fixes for is not a good idea. If we have fixes
>> delaying some days for more testing would be ok imho.
>>
>> We need to keep in mind that none of our releases will be without issues.
>> Striving for perfection is good but we should not start to delay releases just
>> in the hope more time will fix more issues. That just does not work.
>>
>> Our next release would be targetted for 1th March. That means three months time
>> to fix the issues with uclibc and getting it in good shape in master.
>>
>> So my opinion would be in short: Get in all fixes that we have today, test and
>> release on friday. That would only make a two day slip and still a pretty solid
>> release. The last word on this should be by Khem I think as he has the release
>> manager hat on this time.
>>
>> regards
>> Stefan Schmidt
>>
> I'm fine to make it Khems' call when to do the release
> Wrt the uclibc/binutils: there is a patch, so Id' say go for bumping
> versions. That at least gives a better baseline.
>
> Wrt the multiple DEPENDS issue:
> It is not too difficult to fix these. E.g. for mysql nuke the old
> version, for modutils decide which package delivers depmod. (modutils
> or modutils-cross) and for bluez retire bluez-libs_3* (or maybe pin
> bluez-libs_4* in distros that do not pin bluez)
> But of course this does carry some political implications.
>
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


