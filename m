Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OMMhb-0006CQ-VX
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 16:56:27 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OMMdM-0001uT-8m from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 07:52:00 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 9 Jun 2010 07:51:59 -0700
Received: from [172.30.80.221] ([172.30.80.221]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 9 Jun 2010 08:51:58 -0600
Message-ID: <4C0FAA8B.4@mentor.com>
Date: Wed, 09 Jun 2010 07:51:55 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C0D498A.4030709@mentor.com>	<AANLkTilJrzCr73GBdsGFgxQl4Gn7FAGj3Aytx1IrzYpS@mail.gmail.com>	<4C0E5585.8010907@mentor.com>
	<AANLkTilQAiax3HXMMKA6yfaM60nQi_0LWzLR-vtW81_4@mail.gmail.com>
In-Reply-To: <AANLkTilQAiax3HXMMKA6yfaM60nQi_0LWzLR-vtW81_4@mail.gmail.com>
X-OriginalArrivalTime: 09 Jun 2010 14:51:58.0832 (UTC)
	FILETIME=[4FD1EF00:01CB07E3]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH, RFC] Add linux-libc-headers-native, make it default 	dep for native
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
X-List-Received-Date: Wed, 09 Jun 2010 14:56:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks wrote:
> 2010/6/8 Tom Rini <tom_rini@mentor.com>:
>> Frans Meulenbroeks wrote:
>>> 2010/6/7 Tom Rini <tom_rini@mentor.com>:
>>>> On some host distributions the provided linux kernel headers are too old
>>>> to compile utilities we need[1].  Given that we need these utilities to
>>>> run things on the target the best solution is to provide
>>>> linux-libc-headers-native.  Rather than get things into an inconsistent
>>>> state, we make linux-libc-headers-native be a default dependency.
>>>>
>>>> [1]: A prime example of this would be mtd-utils-native and UBI
>>> I'd say this is heading in the totally wrong direction.
>>>
>>> Target code should not depend on host headers.
>>> And if you need the target headers, you should depend on and use
>>> linux-libc-headers.
>>>
>>> I guess mtd-utils-native is used to make an mtd image for the target
>>> and as such I would expect it to use the target headers.
>>>
>>> What would be the difference between linux-libc-headers and
>>> linux-libc-headers-native in the first place?
>>> (and if there is a difference, I think a better package name would be
>>> linux-libc-headers-cross).
>> As Khem said, you're thinking in the wrong direction here.  Target stuff
>> which needs the headers get the headers via linux-libc-headers.  The problem
>> is runs on the host tools that generate things for the target.
> 
> I understand what you are saying (I think :-) )
> For me ubi stuff (and mkfs.jffs2) in mtd-utils-native are tools which
> generate code (in this case an image) for the target. That is why I
> assumed them to require target headers (but see below).
> 
> (offtopic observation: mtd-utils-native delivers also a lot of stuff
> that is not really interesting for native (flash-erase, nandwrite,
> ...)
> 
> 
>>> Btw if say mtd-utils-native needs kernel headers to access host
>>> functionality using headers for a different kernel version seems to be
>>> a no-no either.
>> mtd-utils is depending on OK to be exported by the kernel information to
>> know how to make a UBI image.  And again, for the target this just works.
> 
> What do you mean with OK?

As in headers which are clean and allowed to be used by userspace.

> Actually I guess it is also unclear to me what version of
> linux-libc-headers you want to install and I feel if they are from a
> different version than the native version, the native code should
> *not* depend on it, as it might give rise to wrong assumptions.

It is up to the distribution to pick this version, just like it is for 
the target.

> And if we are only talking about a missing data structure or define or
> so, it might be possible to add a patch to mtd-utils-native to fix
> that. (can't judge that as I am lacking info on what part of
> linux-libc-headers would be needed).

No, it's a massive headache.  We went that route first.

> 
> If the stuff needed is there to miss
> 
>>> PS: which distributions/distribution versions/kernel versions do have
>>> this problem?
>>> Ubuntu 8.04 (which has a 2.6.24 kernel) does not seem to exhibit this
>>> problem).
>> RHEL4.
> 
> Ouch. That brings up another question.
> RHEL4 is 2.6.9 iirc. I can imagine ubi tools and 2.6.9 do not go
> together too well.

Nope, it works great.  We aren't trying to use these UBI images on 
RHEL4, we're using them on target hardware that's running a kernel with 
UBI support.

> Do we want to do something as drastic as linux-libc-headers-native to
> support a fairly outdated kernel/distro.
> I have some doubts here.(btw RHEL4 is already on minimal support and
> is EOL feb 29, 2012).(http://www.redhat.com/security/updates/errata/)

Yes, it's not EOL for another year and a half plus which means quite a 
lot of people are going to be using it for another year and a half plus. 
  I also really don't see this as drastic.  The only reason it's more 
than a one-liner is that once you have this, other -native recipes that 
are in do_compile can get mad about header versions changing under them 
(or being installed at just the wrong point in a compile, and other fun 
races).

> I guess this could also be solved locally. E.g. making a RHEL4
> specific recipe to install the headers, or to have copies of the
> needed headers in some place and add them to the inc search path
> Guess this: http://wiki.openembedded.net/index.php/OEandYourDistro#CentOS_4.4_.2F_Red_Hat_Enterprise_Linux_4
> could be extended with some extra instructions.

IMHO, that seems rather drastic.  If we don't want to cleanly / fully 
support RHEL4, I can just stop posting these kind of things.  It's not 
my favorite build host either :)

-- 
Tom Rini
Mentor Graphics Corporation


