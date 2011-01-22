Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pgi1a-0001TM-Pc
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 19:17:23 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Pgi0s-00049g-8A from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 10:16:38 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sat, 22 Jan 2011 10:16:37 -0800
Received: from [172.30.80.40] ([172.30.80.40]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 22 Jan 2011 11:16:36 -0700
Message-ID: <4D3B1F00.4040109@mentor.com>
Date: Sat, 22 Jan 2011 11:16:32 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295027350.14388.6527.camel@rex>	<AANLkTi=QXykmerKTJJgCNDbqSE18_3Jhqj1utKmf1Ynw@mail.gmail.com>	<4D353F81.50301@xora.org.uk>	<AANLkTi=WOr_395Tya3GOhyLpg1oj9stLxSWdgo--uAhz@mail.gmail.com>	<4D35C5C3.60205@mentor.com>
	<ih4s84$gbj$1@dough.gmane.org>	<4D35FC8B.1090404@mentor.com>
	<ih52qr$l1v$1@dough.gmane.org>	<AANLkTi=A2kgqgkhfw4p_Og8k9y1MBMrZLDvgwuq5Mxfj@mail.gmail.com>
	<AANLkTimHg3tkDnm93ycBGokAOsWomT6n+bfTduYPA=G+@mail.gmail.com>
In-Reply-To: <AANLkTimHg3tkDnm93ycBGokAOsWomT6n+bfTduYPA=G+@mail.gmail.com>
X-OriginalArrivalTime: 22 Jan 2011 18:16:37.0020 (UTC)
	FILETIME=[81F5FDC0:01CBBA60]
Subject: Re: Yocto Project and OE - Where now?
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
X-List-Received-Date: Sat, 22 Jan 2011 18:17:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/19/2011 02:25 AM, Frans Meulenbroeks wrote:
> 2011/1/19 Frans Meulenbroeks<fransmeulenbroeks@gmail.com>:
>> 2011/1/18 Koen Kooi<k.kooi@student.utwente.nl>:
>>   if we make the delta between the 3 be just
>>>> the SRC_URI + checksums?
>>>
>>> Something like:
>>>
>>> * keep gplv2 around if upstream switched to gplv3 at some point
>>
>> agree; as said before suggest to reflect the switch in the name of the recipe.
>>
>>> * allow old stable, stable and dev (e.g. glib 2.24, 2.26 and 2.27+git)
>>
>> I'd say retire old stable after a while (e.g. after stable is there
>> for half a year, unless of course there are compelling reasons to keep
>> it).
>> Wrt dev: if we want to go to a maintainers model similar to u-boot and
>> linux, I would expect this to live in a separate branch or layer.
>> Once proven stable the maintainers pulls it into the core archive.
>>
>>> * allow active contributers some leeway to test multiple subreleases
>>> (e.g. busybox 1.18.[0-99]
>>
>> Again here, I feel it is much better to put it into a different branch
>> or layer, and once stable it is pulled into the mainline.
>> Again similar to what Linus and Wolfgang do.
>>
>>> * The maintainer can have as many versions as he wants to.
>>
>> my preference: not in the main layer.
>>
>>> * toolchain is exempt from all that since having 20 binutils versions is
>>> sometimes needed when building for 20 different archs[1].
>>
>> Fully agree.
>>>
>>> But I seriously think we are overengineering this. We should have people
>>> actually working on oe-core and meta-oe reach a consensus when
>>> encountering problems.
>>
>> I beg to disagree on this.
>> We have a unique opportunity at hand to improve, so it seems wise to
>> raise the bar quality wise.
>>
>> E.g. wrt what Richard wrote in the start post
>>
>> [quote]
>> * Creation of a subset of metadata that has a consistent high quality
>>   standard:
>>    - removal of legacy components (pkgconfig hacks, libtool hacks,
>>      legacy staging, unneeded compiler arguments)
>>    - consistent metadata layout, spacing, use of variables
>>    - migration away from outdated practises (e.g. use BBCLASSEXTEND)
>> [/quote]
>>
>> I feel when migrating recipes we should also assure that they adhere
>> to a certain quality standard. That would need us to define a minimal
>> standard though.
>> Currently I feel we are just moving recipes, only fixing what is
>> really needed to get things running (like removing legacy staging)
>> whereas we could do much better.
>> There are currently some things in OE that could use some improvement
>> and we should take the opportunity to improve.l

Here's what I worry about.  It shouldn't take an overly active 
maintainer for most recipes.  Sure, some programs (and of course the 
toolchain) require some care and knowledge.  But lots of things don't. 
I fear we're trying to get to the point where if someone is going to 
submit a recipe for some program they need to sign up to make sure it's 
always pointing to the most up to date upstream and other mandates.  One 
of the strengths of OE today is that it's not overly burdensome to 
submit changes back and have them accepted.

>>
>> And yes, I have no problem in spending time to improve things, but if
>> there is no consensus on where we should go this is not going to be
>> effective (and actually makes it harder to improve quality wise).
>> To take the bikeshed analogy up again. It does not really help if
>> everyone start to paint in his own favourite color (unless maybe if
>> you are still stuck in the flower power era).
>>
>> Frans
>>
> I know it is fairly schizofrenic to reply on ones own post, but I just
> peeked into the meta-oe layer and found an excellent case on what we
> should try to avoid when bringing over recipes from oe to meta-oe.
> path: root/recipes-graphics/directfb
> Mode	Name	Size	
> d---------	++dfb	48	logplain
> -rw-r--r--	++dfb_1.0.0.bb	588	logplain
> d---------	directfb-1.2.8	50	logplain
> d---------	directfb-1.4.6	41	logplain
> -rw-r--r--	directfb-examples_1.0.0.bb	406	logplain
> -rw-r--r--	directfb-examples_1.2.0.bb	409	logplain
> -rw-r--r--	directfb.inc	2038	logplain
> -rw-r--r--	directfb_1.4.6.bb	615	logplain
> d---------	files	415	logplain
> d---------	fusionsound-1.1.0+git20070709	54	logplain
> -rw-r--r--	fusionsound_1.1.0+git20070709.bb	1479	logplain
> -rw-r--r--	lite_0.9.26+cvs20070207.bb	1140	logplain
>
> Why is there a directfb-examples_1.0.0.bb? In OE no-one is pinning
> this version, and given the fact that these are examples there is
> probably little reason to keep it.

They are example programs for directfb which also means they are handy 
demo programs for "hey, is directfb working on my platform and looking 
right".

> Something similar for directfb-1.2.8. Maybe I overlooked things but I
> could not find a the user of this dir. I guess it could be gone.

I suppose it could be updated to 1.2.10, yes.  And directfb is enough by 
itself, although it would be nice if we went and took a stab at making 
it an option to use rather than X, when possible again.

> If we want to improve on quality it is probably not a bad idea to at
> least have a checklist with improvement actions that should be done
> when migrating recipes (e.g. remove stale patches, unused&  unpinned
> older versions etc etc). I know it takes time, but it can also
> increase the overall quality. Let's take that opportunity.

OK, but what's wrong in this directory?  It's on known to work for 
someone versions, I don't see legacy staging and iirc the pkg-config 
changes aren't hacks but fixing upstream.

-- 
Tom Rini
Mentor Graphics Corporation


