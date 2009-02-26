Received: from [216.145.245.197] (helo=mx01.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LcmqY-0001Nz-7m
	for openembedded-devel@openembedded.org; Thu, 26 Feb 2009 21:29:12 +0100
Received: from [209.242.7.188] (helo=[192.168.231.111])
	by mx01.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LcmnF-0005XU-Kd
	for openembedded-devel@openembedded.org; Thu, 26 Feb 2009 14:25:18 -0600
Message-ID: <49A6FAA6.2010104@dls.net>
Date: Thu, 26 Feb 2009 14:25:10 -0600
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.19) Gecko/20081209 Thunderbird/2.0.0.19 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <go4amc$h30$1@ger.gmane.org>
	<go6ah4$cud$1@ger.gmane.org>	<49A6BFA5.4070405@xora.org.uk>
	<565965130902261031h3d21c452w51b8d1217cebde54@mail.gmail.com>
In-Reply-To: <565965130902261031h3d21c452w51b8d1217cebde54@mail.gmail.com>
Subject: Re: [RFC] update opkg* SRCREV to 201
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
X-List-Received-Date: Thu, 26 Feb 2009 20:29:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I'm glad to hear that there's work on some of these issues, as outlined
below!
-Mike

Tick wrote:
> Hi,
>    Koen and Graeme Thanks.
>    To my understanding, the fix from R197 to R201 are some easy defect fixing.
> Fixing some typos, memory leak, and giving initial value some variable.
> There were no big change in these versions.
> Therefore I didn't bump up versions here.
>    There are still some issues in my mind and I am still finding large
> chunk of time to deal with them.
>    1. the algorithm calculate the dependency is not very efficient.
> (Much faster than R180 now, but I know it can be faster) Because of
> there were some duplicated code and ill structured code from ipkg, I
> need to refactorying them first before changing the algorithm.
>    2. memory leak problem, ipkg were designed for running once and
> exit, and therefore there were many place are not took carefully.
> Thomas and I already fixed a lot, but not all of them. Most of the
> largest memory leaks were fixed, however there were still some small
> leaks need to be find out. Especially libopkg is used as library, this
> should be take care well. (If anyone find a leak, please report or
> help. thanks)
>    3. memory hungry issue, opkg will eat a large amount of memory if
> you have many packages metadata. This may cause problem, however there
> is dilemma. Storing metadata will make opkg faster, but may cause very
> limited device run out of memory. Saving memory will cause cpu busying
> malloc and free all the time, and it will be very slow. Though the
> algorithm now seems to be okay, for device having so many packages
> should be powerful enough. XD I am considering adding a flag decide
> which policy (fast or save memory) to use while building opkg.
>    4. buffer over issue, some of the code did not check the boundary
> well. Actually R197 is fixing an buffer overflow issue, in which not
> be found for a long long time until it cause problem (on x86_64 arch
> only). >_<
> Many code needs to be reviewed/tested again and again to make sure the
> quality is good enough, and it's need your reports, help and patches.
>   If I break anything, I am sorry.  And please mail to
> opkg-devel@googlegroups.com poking me, creating a ticket with
> backtrace and some analysis to
> http://code.google.com/p/opkg/issues/list  is good, sending a patch is
> even welcome.  When I realize if it cause serious problem to you, I
> will try to fix it asap.  I will be glad if every opkg user does not
> aware it's existence, except the developers.
> Thank a lot.
> 
> Cheers,
> Tick
> 
> 
> 2009/2/27 Graeme Gregory <dp@xora.org.uk>:
>> Koen Kooi wrote:
>>> On 25-02-09 21:46, Koen Kooi wrote:
>>>> Hi,
>>>>
>>>> I was getting seriously annoyed with the useless error codes opkg was
>>>> giving me and Tick pointed me to:
>>>>
>>>> http://code.google.com/p/opkg/issues/detail?id=6&can=1
>>>>
>>>> We're at 197 now in OE (with r201 applied as patch). I'd like to get
>>>> r199 and r200 in as well, and since I'm lazy I though we'd get r198 in
>>>> as well, which means instead of adding a few patches I can just bump up
>>>> SRCREV to 201.
>>>>
>>>> What do you think?
>>> Noone is thinking anything?
>>>
>> Sorry been AFK, my opinion of these things is always no-one will test
>> until stuff is committed anyway. So you might as well go ahead! Without
>> the bug reports tick won't be able to improve opkg.
>>
>> Graeme (XorA)
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 


