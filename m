Received: from [206.46.173.9] (helo=vms173009pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LiIMv-00017l-Co
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Mar 2009 02:08:53 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KGH002K71U4Q8R6@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	13 Mar 2009 20:08:28 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 436896B83A8; Fri,
	13 Mar 2009 21:08:27 -0400 (EDT)
Date: Fri, 13 Mar 2009 21:08:27 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090314010827.GA29178@denix.org>
References: <20090115061418.GA13352@denix.org> <gkmmn6$pmf$1@ger.gmane.org>
	<20090115074118.GC7020@gmail.com> <gkn5jf$7gl$1@ger.gmane.org>
	<19c1b8a90901151053n5402dcbdle52c090fe5c94c71@mail.gmail.com>
	<gko0tu$hel$1@ger.gmane.org>
MIME-version: 1.0
In-reply-to: <gko0tu$hel$1@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [RFC] Fix udev pulling in libvolume-id-dev
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
X-List-Received-Date: Sat, 14 Mar 2009 01:08:53 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jan 15, 2009 at 07:57:02PM +0100, Koen Kooi wrote:
> On 15-01-09 19:53, Khem Raj wrote:
>> On Thu, Jan 15, 2009 at 3:10 AM, Koen Kooi<k.kooi@student.utwente.nl>  
>> wrote:
>>> On 15-01-09 08:41, Khem Raj wrote:
>>>> On (15/01/09 07:56), Koen Kooi wrote:
>>>>> On 15-01-09 07:14, Denys Dmytriyenko wrote:
>>>>>
>>>>>> libvolume-id-dev does not provide the actual .so library, but it
>>>>>> contains a
>>>>>> symlink in /usr/lib, which points to /lib/libvolume.so.0 (the host 
>>>>>> one!)
>>>>>> instead of ../../lib/ one...
>>>>> That's the intended behaviours, since installing the packages will have
>>>>> it point to ${libdir}/libvolume.so.0 on your device. I'm not sure if we
>>>>> want to patch every package to use relative symlinks.
>>>> We would use -dev packages on staged area normally to compile other apps
>>>> depending on a given packge if we do not fix the symlink I think it will
>>>> try to link to wrong library.
>>> We don't use the -dev packages to populate staging :) I keep trying to
>>> convince Richard that we should use them, but he keeps coming up with 
>>> good
>>> reasons not to do so :)
>>
>> Hmm then why do we generate them ?. We do not need these packages on
>> target unless we switch to
>> native development on target.
>
> SDks and as you say native development (which is getting quite popular with 
> the beagleboard folks).

Ok, I'm bringing up this old topic, because as was correctly stated, SKDs use 
-dev packages and if we don't fix the symlink pointing to /lib/libvolume.so.0, 
it breaks those SDKs. There is also another side-effect - libvolume-id-dev.ipk 
misses the automatic dependency on libvolume-id0.ipk so the SDK cannot just 
refer to the -dev package and expect the actual library to be installed. In 
that case only the broken link gets installed...

So, if nobody objects, I'm going to apply my first patch from this thread 
against the udev recipe, fixing .so symlink to be relative.

-- 
Denys


