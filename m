Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Ot29B-0001Cn-B6
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 19:39:54 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Ot28S-0007YP-CM from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 10:39:08 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 7 Sep 2010 10:39:08 -0700
Received: from [172.30.80.172] ([172.30.80.172]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 7 Sep 2010 11:39:07 -0600
Message-ID: <4C8678B7.8010002@mentor.com>
Date: Tue, 07 Sep 2010 10:39:03 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTinU39HjKWb9=VMiSa=R2YA_9BxPDctiW1ire48C@mail.gmail.com>	<AANLkTikk1sce-dOHW_uVOO3m+XPx1ZjapvcNAAHiXwnS@mail.gmail.com>	<AANLkTikkJod_2MTGN4B+8Q4wS74v9Z=nEBqrucUrcYjv@mail.gmail.com>	<AANLkTikZuBMiU2H8m3M97xFwcQE2GCdQ_2Q=TSM4b23-@mail.gmail.com>	<AANLkTi=eX15FWkO+Fux8UpNv9tXkTVtkYrd=t3c_==2k@mail.gmail.com>	<4C86593A.7000006@mentor.com>
	<AANLkTi=AL6HCYtK7CuCwzeTo7WW2QvfT8p9s8R73gVsO@mail.gmail.com>
In-Reply-To: <AANLkTi=AL6HCYtK7CuCwzeTo7WW2QvfT8p9s8R73gVsO@mail.gmail.com>
X-OriginalArrivalTime: 07 Sep 2010 17:39:07.0193 (UTC)
	FILETIME=[925DE290:01CB4EB3]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Perl modules I can not get to build, libdbd-sqlite-perl libversion-perl
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
X-List-Received-Date: Tue, 07 Sep 2010 17:39:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

J. L. wrote:
> On Tue, Sep 7, 2010 at 8:24 AM, Tom Rini <tom_rini@mentor.com> wrote:
>> Graham Gower wrote:
>>> On 3 September 2010 09:13, J. L. <vwyodapink@gmail.com> wrote:
>> [snip]
>>>> and the other is honestly above me at the moment as I do not grasp
>>>> using devshell yet and how to work with in there, let alone properly
>>>> lay out a program recipe and then patch it to work properly. Once I
>>>> grasp things more I hope to be a help and not such a hindrance, I
>>>> welcome any tips links or anything to point to how to fix either and I
>>>> will try more on more with those pointers and if successful post the
>>>> results and maybe a patch or post the failure.
>>> Read the OE manual. Read the Bitbake manual. Read .bb files. Read
>>> .conf files. Read .bbclass files. Read Bitbake sources. Send patches.
>>> Add time. Repeat. == expert!
>> I'd just like to add in that while it's great (really, I mean it), you're
>> reporting problems, if you can reproduce them in vanilla OE with something
>> like MACHINE=qemuarm and DISTRO=angstrom-2008.1 (or DISTRO=minimal) or
>> similar, that will help rule out a lot of concern on our part and give a
>> testcase we can all easily try out.
> 
> OK thanks Tom I will try and read more on how to do that. Have not
> done anything with qemu yet. But what I get now and correct if I am
> wrong by OE vanilla you mean fresh directly off the dev branch no
> other sub tree correct? then modify my .conf to to the settings you
> listed above? If I am way off dont worry about taking the time to

Correct.

> explain in detail I will just read about it. I feel I have become an
> annoyance on the boards from my lacking knowledge. Would showing the
> recipe I build for my gumstix help? Its now building but not with
> everything I want and some programs are broken, but its very close the
> closest I have gotten so far. Any who thanks for replying and giving
> me more info on how to help you guys help me. I do appreciate
> everyones help and input a bunch.

We're happy to have a problem report, really.  It's just that since yes, 
you're working with more than just the vanilla tree we want to be 
certain that the problem is in the vanilla tree and not a conflict in 
having additional overlays and such available.

-- 
Tom Rini
Mentor Graphics Corporation


