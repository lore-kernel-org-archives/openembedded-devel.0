Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OtRD6-0007ZH-Il
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 22:26:13 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OtRCP-0005r2-JT from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 13:24:53 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 8 Sep 2010 13:24:53 -0700
Received: from [172.30.80.172] ([172.30.80.172]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 8 Sep 2010 14:24:43 -0600
Message-ID: <4C87F105.2090607@mentor.com>
Date: Wed, 08 Sep 2010 13:24:37 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTineLTCDtymfwbaAJXcrz0vB=V4++=HOwEA7wQHU@mail.gmail.com>	<lybp88kr5j.fsf@ensc-virt.intern.sigma-chemnitz.de>	<4C87E05A.6050004@mentor.com>
	<ly39tkkn3g.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <ly39tkkn3g.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-OriginalArrivalTime: 08 Sep 2010 20:24:43.0564 (UTC)
	FILETIME=[DF5186C0:01CB4F93]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: libtermcap
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
X-List-Received-Date: Wed, 08 Sep 2010 20:26:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Enrico Scholz wrote:
> Tom Rini <tom_rini@mentor.com> writes:
> 
>>> I added 9e58422868a03eeafa72781477174850d1c5abe7 some hours ago so
>>> that '-ltermcap' should work again.  Patch does not break my builds
>>> but I do not know whether it unbreaks the problematic ones ;)
>>>
>>> Things are too different across the distributions (some have the
>>> ncurses-config binconfig tools, other the .pc files, some have
>>> libtinfo, some not) to find *the* correct solution.
>> Maybe I'm jumping in too late here.  Why is the correct solution not
>> "make our ncurses-native build and install what's required by other
>> recipes, fix broken recipes that look for the wrong thing" ?  
> 
> the "wrong" and "right" thing is difficultly to define for libtermcap.
> Generally, patches should be in a manner that they can be accepted by
> upstream.  That's not the case for 's!-ltermcap!-ltinfo!'

Now that you've added a libtermcap + deprecated warning, that problem 
should be solved, yes?  What I'm saying is that we build ncurses 5.7 for 
the host system.  What we build there is what other programs we build 
should be looking for and using.  If they're looking for something we 
don't provide, that's a problem we should fix.  It should not ever 
matter what the host distribution provides as using it is wrong unless 
ASSUME_PROVIDED is set and in that case, it's user be aware.

>> IMHO, if you ASSUME_PROVIDED and things break, thats not our problem,
>> its your problem (Doctor, it hurts when I do *this*.  Don't do *that*
>> !)
> 
> OE has still the ncurses-5.4 receipt which will break packages depending
> on hardcoded -ltinfo.

Which should probably get dropped once everything is happy with 5.7.

-- 
Tom Rini
Mentor Graphics Corporation


