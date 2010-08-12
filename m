Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Ojd1h-0001nv-LI
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Aug 2010 21:01:19 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Ojd1L-0003Jl-Cn from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Aug 2010 12:00:55 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 12 Aug 2010 12:00:55 -0700
Received: from [172.30.80.91] ([172.30.80.91]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 12 Aug 2010 13:00:53 -0600
Message-ID: <4C6444DF.40206@mentor.com>
Date: Thu, 12 Aug 2010 12:00:47 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C4F6F91.8000902@mentor.com>
	<4C50507C.5050906@mentor.com>	<4C642B76.6090402@mentor.com>
	<201008122129.08412.roman@khimov.ru>
In-Reply-To: <201008122129.08412.roman@khimov.ru>
X-OriginalArrivalTime: 12 Aug 2010 19:00:53.0821 (UTC)
	FILETIME=[B03466D0:01CB3A50]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Disable packaged-staging for perl-native
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
X-List-Received-Date: Thu, 12 Aug 2010 19:01:19 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Roman I Khimov wrote:
> В сообщении от Четверг 12 августа 2010 21:12:22 автор Tom Rini написал:
>> Tom Rini wrote:
>>> Roman I Khimov wrote:
>>>> В сообщении от Среда 28 июля 2010 03:45:21 автор Tom Rini написал:
>>>>> I'd like to disable packaged-staging for perl-native.  The problem here
>>>>> comes from a number of things that happen.  Some of these can only
>>>>> happen in combination with packaged-staging but others I believe could
>>>>> happen today.  The problem itself is that if we have perl-native
>>>>> available from packaged-staging it can suddenly exist very early.  What
>>>>> this means in practical terms is that now we're trying to generate say
>>>>> pod2man.pl from pod2man.pl.in and @perl@ is expanded to something
>>>>> beyond the "#!" mechanic length limit and recipes start failing to
>>>>> build (fixable by changing pod2man.pl.in to use /usr/bin/env perl (and
>>>>> if it had a -w changing to Use warnings: or whatever the perl is)).
>>>> So the problem really is that we have perl in
>>>> /very-very-long-path/perl? IMO /usr/bin/env change would be better in
>>>> that case.
>>> The most common case is that one, yes.  I'm open to suggestions on
>>> catching and fixing these problems ahead of time but the issue is we're
>>> talking about for example wget which has no dependency on perl-native.
>> As I go over the list of stuff to get a "1.0" of relocatable packaged
>> staging done, ping?  Blacklist perl-native for now or someone suggest
>> how to catch and fixup all the cases to be /usr/bin/env perl ?  iirc
>> just setting ac_cv...="/usr/bin/env perl" won't do it since we end up
>> trying to invoke /usr/bin/env perl -w sometimes and that's an error.
> 
> Well, IMO, blacklisting just doesn't fix the problem here if the problem is 
> /long/long/long/path/to/perl. Because whether from packaged staging or from 
> really built perl-native the perl will be there anyway and so is the chance of 
> breakage.

Yes, it's a very broken thing Today.  It's just rarely if ever hit 
today.  But with packaged staging it happens a lot, especially when you 
have a lot of threads.

> Maybe some automatic
> 
> $ sed -ri "s,#!.\s*${STAGING_NATIVE_BINDIR}/perl,#!/usr/bin/env perl,"
> 
> somewhere (and probably something more hacky to only catch the first line)?

And it also needs to either change perl -w to Use::Warnings or so, or 
just drop that out.  And hope that everything that might use it is a 
foo.pl.in.  If it is, we could add a mangle_perl hook before 
do_configure after do_patch, inside of autotools.bbclass (or just make 
it happen in there?).

-- 
Tom Rini
Mentor Graphics Corporation


