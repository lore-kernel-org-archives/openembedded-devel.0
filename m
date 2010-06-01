Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OJWSo-0002Vv-U0
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jun 2010 20:45:24 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OJWOh-0002BE-W1 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jun 2010 11:41:08 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 1 Jun 2010 11:41:07 -0700
Received: from [172.30.80.90] ([172.30.80.90]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 1 Jun 2010 12:41:04 -0600
Message-ID: <4C05543E.7010600@mentor.com>
Date: Tue, 01 Jun 2010 11:41:02 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1265832780-19939-7-git-send-email-rep.dot.nop@gmail.com>	<1265832780-19939-8-git-send-email-rep.dot.nop@gmail.com>	<1265832780-19939-9-git-send-email-rep.dot.nop@gmail.com>	<1265892781.3777.1050.camel@mill.internal.reciva.com>	<20100213125146.GJ10632@mx.loc>
	<20100213161449.GD30265@mx.loc>	<1267058975.18176.527.camel@trini-m4400>	<1267094388.4243.1.camel@rex>	<1267118467.18176.533.camel@trini-m4400>	<1267128981.4243.88.camel@rex>
	<20100528083734.GA20685@mx.loc>
In-Reply-To: <20100528083734.GA20685@mx.loc>
X-OriginalArrivalTime: 01 Jun 2010 18:41:04.0453 (UTC)
	FILETIME=[FD8B3F50:01CB01B9]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: BBCLASSEXTEND canadian?
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
X-List-Received-Date: Tue, 01 Jun 2010 18:45:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Bernhard Reutner-Fischer wrote:
> On Thu, Feb 25, 2010 at 08:16:21PM +0000, Richard Purdie wrote:
>> On Thu, 2010-02-25 at 10:21 -0700, Tom Rini wrote:
>>>> BBCLASSEXTEND covers -native and -nativesdk
>>> Is the -nativesdk part implicit in the anonfuncs in nativesdk.bbclass or
>>> just not merged yet?
>> It should be implicit in the anonfuncs. If that class differs to Poky,
>> the Poky changes should be merged though.
>>
>>>> The -cross, -crosssdk, -canadian-cross and other combinations usually
>>>> have too many differences to be worth the effort although it would be
>>>> possible to make them work.
>>> I'm not so sure about that, but we'll see.  I should have some form of
>>> canadian stuff working again shortly.
>> You're unsure it would be possible to make them work of that its not
>> worth the effort?
> 
> Tom?
> 
> Yesterday evening i was building a pristine master reference again and
> saw that mpfr et al are (still) pretty outdated.
> AFAIR i cannot mix BBCLASSEXTEND vs. old-fashioned recipes for one
> package (didn't try if that's still true) so i'm, again, running into
> the issue of what to do with older toolchains needing that canadian
> stuff. I'm not too jazzed about the idea to touch the old toolchains
> just because i want to have current gmp/mpc/mpfr/gcc (using CLASSEXTEND
> nativesdk). So, how to proceed?

So, where things stand right now (and have stood for a while) is that 
the existing canadian recipes simply don't work.  We've made them work 
internally, and then moved them up to using nativesdk/etc.  That's also 
been finished and the engineer in question is now working on making it 
work in OE.dev.  But for now, don't let the existing canadian stuff 
(which is broken) get in the way of fixing up other stuff.

-- 
Tom Rini
Mentor Graphics Corporation


