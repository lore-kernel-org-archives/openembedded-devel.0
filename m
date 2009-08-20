Received: from [209.85.219.221] (helo=mail-ew0-f221.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1Me4We-00013X-6X
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 12:05:44 +0200
Received: by ewy21 with SMTP id 21so4900155ewy.21
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2009 02:48:26 -0700 (PDT)
Received: by 10.210.141.9 with SMTP id o9mr6800073ebd.59.1250761705991;
	Thu, 20 Aug 2009 02:48:25 -0700 (PDT)
Received: from ?192.168.1.10? (94-193-242-65.zone7.bethere.co.uk
	[94.193.242.65])
	by mx.google.com with ESMTPS id 10sm1320967eyz.51.2009.08.20.02.48.25
	(version=SSLv3 cipher=RC4-MD5); Thu, 20 Aug 2009 02:48:25 -0700 (PDT)
Message-ID: <4A8D1BD8.1020704@xora.org.uk>
Date: Thu, 20 Aug 2009 10:48:08 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Thunderbird 2.0.0.22 (Windows/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20090820032802.GA32010@denix.org>	<200908200752.58210.holger+oe@freyther.de>	<20090820071052.GA459@denix.org>
	<h6j1rj$nvf$1@ger.gmane.org> <20090820090136.GD459@denix.org>
In-Reply-To: <20090820090136.GD459@denix.org>
Subject: Re: Use AUTOREV and have revision/commit number in package	name?
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
X-List-Received-Date: Thu, 20 Aug 2009 10:05:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Denys Dmytriyenko wrote:
> On Thu, Aug 20, 2009 at 10:34:58AM +0200, Koen Kooi wrote:
>   
>> On 20-08-09 09:10, Denys Dmytriyenko wrote:
>>     
>>> On Thu, Aug 20, 2009 at 07:52:58AM +0200, Holger Hans Peter Freyther 
>>> wrote:
>>>       
>>>> On Thursday 20 August 2009 05:28:02 Denys Dmytriyenko wrote:
>>>>         
>>>>> Now, when SRCREV = "${AUTOREV}", AUTOREV gets resolved into a Python
>>>>> function, which does the magic of fetching the latest snapshot from a
>>>>> repository. But now if PV contains references to SRCREV, it breaks
>>>>> (undesrandably), since SRCREV gets resolved in do_fetch and PV needs to 
>>>>> be
>>>>> resolved early on.
>>>>>
>>>>> Are there any standard ways to work around this limitation?
>>>>>           
>>>> Check the mailinglist archives... Openmoko has deployed a solution that 
>>>> has
>>>> fixed that about 1 1/2 years ago.
>>>>
>>>> Short answer:
>>>> 	- Do not put SRCREV into PV, e.g. create a new var called SRCPV
>>>> 	- Populate SRCPV with something based on the SRCREV..
>>>>         
>>> Ah, thanks! I was able to find your RFC message from last year on the 
>>> Openmoko
>>> mailing list:
>>> http://markmail.org/message/v3s32gmxxqcaxpph
>>>
>>> I'll give it a try. Thanks.
>>>
>>> To be clear - it's not used in OE. While there is a single 
>>> python-phoneutils
>>> recipe, which references SRCPV, it is not being set anywhere, 
>>> apparently...
>>>       
>> Take a look at 
>> http://cgit.openembedded.org/cgit.cgi/openembedded/log/?h=xora/angstrom-srcpv 
>> :)
>>     
>
> Thanks! More specifically:
>
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?h=xora/angstrom-srcpv&id=453a13c7a68087895f4048410aba1a519ec99897
>
> Any ETA for the merge back to .dev? :)
>
>   
Not yet, I am running out of time to actually work on it, I suspect that 
monster commit is the wrong way to do it anyway.

Probably merge bitbake.conf changes. Then merge by package-name as the 
SRCPV packages should always be versioned to be the same or an upgrade 
to the old PV.

Graeme



