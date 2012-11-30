Received: from smtpauth13.prod.mesa1.secureserver.net ([64.202.165.37])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <pab@pabigot.com>) id 1TeWkF-0005Tp-EU
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Nov 2012 20:59:34 +0100
Received: (qmail 23876 invoked from network); 30 Nov 2012 19:38:33 -0000
Received: from unknown (66.41.60.82)
	by smtpauth13.prod.mesa1.secureserver.net (64.202.165.37) with ESMTP;
	30 Nov 2012 19:38:33 -0000
Message-ID: <50B90B37.5080505@pabigot.com>
Date: Fri, 30 Nov 2012 13:38:31 -0600
From: "Peter A. Bigot" <pab@pabigot.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@googlemail.com>
References: <CAPOJ94OVOe=fP-8cgCdDFGFEJskce4G=DMcTR6a-JDM9QHJg0w@mail.gmail.com>
	<CALbNGRRqj6NvBxqB+EGcLcFd9CcNKKnSNZmJHM8f=BA-biF3dg@mail.gmail.com>
	<CAPOJ94NZvsiBoMemWPFdBUQtqQzH2rrkq9eP5hQGpB8amY4U2g@mail.gmail.com>
	<CALbNGRSXeE0UvpsZqijRRg1nRW4XFe+52Zoz6kX6wX_QSuDM+Q@mail.gmail.com>
	<CALbNGRRBstvSuMr3jPaNvnggN+TdigApJ=EyxCWeHEdg4tdgbw@mail.gmail.com>
	<CALbNGRRdcaOXoXJcswP6PO7ivsmdCL0f6hEE86GDMnyx7+r=wA@mail.gmail.com>
	<CAPOJ94MSTcpaoTQBSqJNAs2T=oKm6WYqPFKMC=DrO7rgPO3Kxg@mail.gmail.com>
	<CALbNGRQmHqSOQ_LVdTy6uO+5LF4TnYQsnr=VjEcRkB7O9BrGpg@mail.gmail.com>
In-Reply-To: <CALbNGRQmHqSOQ_LVdTy6uO+5LF4TnYQsnr=VjEcRkB7O9BrGpg@mail.gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] gphoto2: fix gettext build error
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
X-List-Received-Date: Fri, 30 Nov 2012 19:59:34 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/30/2012 12:38 PM, Andreas Müller wrote:
> On Fri, Nov 30, 2012 at 7:22 PM, Peter Bigot <bigotp@acm.org> wrote:
>> On Fri, Nov 30, 2012 at 11:50 AM, Andreas Müller
>> <schnitzeltony@googlemail.com> wrote:
>>> On Fri, Nov 30, 2012 at 6:45 PM, Andreas Müller
>>> <schnitzeltony@googlemail.com> wrote:
>>>> On Fri, Nov 30, 2012 at 6:17 PM, Andreas Müller
>>>> <schnitzeltony@googlemail.com> wrote:
>>>>>> gettext 0.18.1 is installed both on the build machine, and as a native
>>>>>> package used when building under bitbake.  If it's at all relevant, I
>>>>>> have
>>>>>> LANG=en_US.UTF-8 in the environment in which bitbake is executed.
>>>>>>
>>>>>> Did you try a full reversion of 5febf70?  Can you tell why, in your
>>>>>> environment, autotools.bbclass replaces the Makefile.in.in for
>>>>>> libgphoto2?
>>>>>> It does not do this for me (otherwise I think Koen's patch that only
>>>>>> reverts
>>>>>> part of 5febf70 would not work).
>>>>>>
>>>>>> Peter
>>>>>>
>>>>> It should copy see autotools.bbclass line 195
>>>>>
>>>>> Andreas
>>>> Peter
>>>>
>>>> One stupid question: Are you working with oe-core master - because
>>>>
>>>> commit 841ea3c1c18e50e77fccbd5f44d6a79a50913b67
>>>> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>> Date:   Thu Oct 11 08:43:01 2012 +0000
>>>>
>>>> which started my gphoto2 trouble is not found in danny
>>
>> Yes, seems to be a danny/master inconsistency, resulting from oe-core
>> branching danny six weeks before meta-openembedded did, with my checkouts
>> happening between the two points.
>>
>>> So from what I can see now is that meta-oe's
>>>
>>> commit 92e3f684d14fd287194e78bc5e65f80504758b7d
>>> Author: Koen Kooi <koen@dominion.thruhere.net>
>>> Date:   Wed Nov 21 14:42:02 2012 +0000
>>>
>>>      gphoto2: fix gettext build error
>>>
>>>      Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>>
>>> should be merged to danny and reverted (with PRbump) in master.
>>
>> I think 5febf70 should be reverted (with PR bump) in danny, which is where
>> I'd started before I noticed 92e3f68 in patchwork.
> agreed
>
>> In any case 92e3f68 should be discarded since it leaves the removal of AM_PO_SUBDIRS() from
>> configure.ac in place with no motivation once the Makefile.in.in is no
>> longer overwritten.
> Isn't that exactly what the patch I sent does?

Probably.  Unfortunately I had put my subscription on hold six months 
ago and had problems re-enabling it last weekend so I missed seeing your 
patch; that's been fixed and my address updated.  I also hadn't bothered 
to pull recently, so didn't see that Koen's change had been applied.  
And so I added to the confusion; sorry about that.

>
>> If that seems plausible I'll prepare a patch.
> Appreciated - because if would do it would most likely cause further
> confusion :)
>
Actually, it'd probably lessen it, since I'm just a bit player in this 
theatre.  But I'll give it a go later this afternoon after I make 
progress on what I'm supposed to be working on....

Peter


