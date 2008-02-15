Received: from [216.145.245.200] (helo=mx04.dls.net)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mwester@dls.net>) id 1JQ4Hs-0002ZX-Hq
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Feb 2008 18:23:51 +0100
Received: from gw.mwester.net ([209.242.5.110] helo=[192.168.1.111])
	by mx04.dls.net with esmtpa (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1JQ4Ha-0002Qg-Uo
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Feb 2008 11:23:30 -0600
Message-ID: <47B5CA89.6000805@dls.net>
Date: Fri, 15 Feb 2008 11:23:21 -0600
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1JPfb1-0006hO-Ll@linuxtogo.org>	<74d0deb30802140817g153c4fe3if16cd9eabe67c9f3@mail.gmail.com>	<200802151245.30040.mickey@vanille-media.de>	<fp48t2$i8$1@ger.gmane.org>	<47B5A9A4.3040400@dls.net>
	<fp4dk4$kgh$1@ger.gmane.org>
	<1203093711.8636.72.camel@dax.rpnet.com>
In-Reply-To: <1203093711.8636.72.camel@dax.rpnet.com>
X-SA-Exim-Connect-IP: 216.145.245.200
X-SA-Exim-Mail-From: mwester@dls.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RFD: is bitbake 1.8.10 minimum supported standard?	(was: [oe-commits] org.oe.dev anki: fix parse error)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Feb 2008 17:23:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> On Fri, 2008-02-15 at 17:11 +0100, Rolf Leggewie wrote:
>   
>> Mike (mwester) wrote:
>>     
>>> Requiring a bitbake upgrade to accommodate a 
>>> single-line in a single recipe that can easily be expressed in a fashion 
>>> compatible with the existing bitbake versions installed, well that just 
>>> seem to fly in the face of that earlier discussion.
>>>       
>> Well, seen from that angle that seems to hold.  But that was not my
>> angle and I hope I was not being mistaken in this regard.
>>
>> IIRC bitbake 1.8.10 has quite many bug fixes as well (RP?).  So, that is
>> more what I was getting at.  AFAIK, .dev and bitbake were meant to be
>> closely coupled.  IOW, don't run bleeding edge .dev with an old bitbake
>> and expect things to work.
>>
>> I am open to extend the time until 1.8.8 is officially dead for .dev
>> What do others think about this question of timing?
>>     
>
> Yes, 1.8.10 has lots of other fixes and improvements and I'd like to
> see .dev switch to it at some point. Once we do that there are some
> simplifications of code in OE.dev that can be made too.
>
> I appreciate the bitbake 1.8.6 -> 1.8.8 change was bumpy due to sqlite
> but 1.8.8 -> 1.8.10 should just be a drop in replacement so I don't see
> any reason not to...
>
> Cheers,
>
> Richard
>
>   
Ok, ok -- let's not get too far off the point here.

I'm not saying that we shouldn't upgrade bitbake.  I'm just observing 
that a one-line change to a recipe has broken the build environment for 
many people, without any notice in advance that they should have 
upgraded bitbake.  My point is that if we want to be "friendly" to those 
environments that are looking for controlled and stable environments, we 
can't be checking in recipes that break the build for everyone, and then 
just say that the fix is for everyone to go upgrade bitbake.

It may be really, really really easy to upgrade to 1.8.10 -- and I'll do 
that sometime.  But until I get the time to create a reference build 
with my current bitbake version, clone that environment and create a 
reference build with 1.8.10 and compare the two -- well, until then I'm 
going to continue deleting the recipe that's forcing this change on me 
at this inopportune time.  THAT, my friends, is real life -- few other 
than hobbyists can just upgrade the core build engine at the drop of a 
hat because somebody checked in a new file (unrelated to what I might be 
using).

Regards,
Mike (aka "way-behind-the-times-Mike")



