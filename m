Received: from smtprelay-h22.telenor.se ([195.54.99.197])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf_samuelsson@telia.com>) id 1RUNTX-0007pC-FR
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Nov 2011 19:59:47 +0100
Received: from ipb3.telenor.se (ipb3.telenor.se [195.54.127.166])
	by smtprelay-h22.telenor.se (Postfix) with ESMTP id 7E525EABA3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Nov 2011 19:53:08 +0100 (CET)
X-SENDER-IP: [83.227.56.19]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ArEbAPs00U5T4zgTPGdsb2JhbAAMOIlKoU4BAQEBN4IkAQEBAQIBOEAGCwsYCRYPCQMCAQIBDyIUEwYCAQEVh2y1V4dNgxUElEqKVoc2
X-IronPort-AV: E=Sophos;i="4.69,576,1315173600"; 
   d="scan'208";a="3409692"
Received: from c-1338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.244]) ([83.227.56.19])
	by ipb3.telenor.se with ESMTP; 26 Nov 2011 19:53:07 +0100
Message-ID: <4ED13592.3060506@telia.com>
Date: Sat, 26 Nov 2011 19:53:06 +0100
From: Ulf Samuelsson <ulf_samuelsson@telia.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110922 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>	<CAMKF1sr6mM0_iYu_1vfEGbUYNqaj2hK2vpdsHqCTkoSdrHyJOA@mail.gmail.com>	<CACW_hTYcHF6RXuW3prEO2cR+UYCFFvdtoH1d6DetY-6pCmT6qA@mail.gmail.com>	<CAMKF1srRnHd4C7XsEdZ80HcKuc7ioLC_+2J4NO3=bChoCw2k-Q@mail.gmail.com>	<4ECD76E2.3040001@opendreambox.org>	<ED3E0BCACD909541BA94A34C4A164D4C401A0AC7@post.tritech.se>	<0C757E680E33864AB113392C7E83F910BE5242@GSX300A.mxchg.m.corp>	<CAP9ODKrviqf=GN12Y6OKE0ajsG7v+fFWnWDHp=K1-YFzvQi-pA@mail.gmail.com>	<1322134409.3391.21.camel@mattotaupa>	<CAP9ODKrKN3m_V09j6+C1dL9P8yHtuck4P5jcdKv4Ua=mrP1E=Q@mail.gmail.com>	<jalvr1$3bl$1@dough.gmane.org>	<CAFU7RzM5-VAbs2-5qR-D6eo5+LsVQc+e3rGK6zZ5NvviSvUWig@mail.gmail.com>	<CACW_hTY9ybnax9xHb1KV4Y25J3nNRkQqCs=TqUivcBcYOT7BkA@mail.gmail.com>	<CA+M6bXkjViAHc6ADH+vyvikeOaLa1+V1uCX6S=d75Z18Z2oj8w@mail.gmail.com>	<4ED0C603.9020900@telia.com>
	<CA+M6bXmsbDoFS_8etRA+RYqkP7b0x8t998Tcmn9KyKhAbEP2ew@mail.gmail.com>
In-Reply-To: <CA+M6bXmsbDoFS_8etRA+RYqkP7b0x8t998Tcmn9KyKhAbEP2ew@mail.gmail.com>
Subject: Re: Plans for OE classic future
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
X-List-Received-Date: Sat, 26 Nov 2011 18:59:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-11-26 16:20, Tom Rini wrote:
> On Sat, Nov 26, 2011 at 3:57 AM, Ulf Samuelsson
> <ulf_samuelsson@telia.com>  wrote:
>> On 2011-11-25 23:04, Tom Rini wrote:
>>> On Fri, Nov 25, 2011 at 12:31 AM, Frans Meulenbroeks
>>> <fransmeulenbroeks@gmail.com>    wrote:
>>>
>>>> After all, isn't one of the purposes of OE to promote information
>>>> sharing,
>>>> cooperation and the use of openembedded technology (and not make things
>>>> harder).
>>> One of the points of making master read-only would be to ensure that
>>> changes aren't lost.
>>>
>>> Perhaps the transition needs to be:
>>> - master is as it is today
>>> - master becomes oe-core backport || master-only bugfixes only
>>> - master becomes read only.
>>>
>>> And we go from the first step to the second step sometime sooner
>>> rather than later.  The top of my head date would be before the
>>> paid-developers go on end of year breaks to try and make sure all the
>>> hobbyist folks start their hacking with oe-core+etc rather than master
>>> and risk getting caught later.  I'm open to arguments on why that's
>>> exactly backwards...
>>>
>> Won't it be a problem for existing projects, if you cannot add fixes to cope
>> with new host OS versions.
>>
>> At the moment, openembedded-classic does not build properly with Ubuntu
>> 11.10 .
> Won't what be a problem?  Either oe-core+meta-oe+etc fails on 11.10
> (so, fix it there first then backport changes) or it's fine and you
> can either find the relevant changes there and move them or it's a
> oe.dev-only bug and just needs to be fixed, under my proposal (until
> we reach the point where everyone is OK calling it r/o).

Making it R/O.
/Ulf


> And part of this is to say that yes, existing projects external to
> oe.dev need to move to oe-core(+meta-oe+whatever else) (where layers
> should be making their life easier or again, there's problems we're
> unaware of and need to be made aware of) or explain why they can't
> ever move (and are forking the project?).
>


-- 
Best Regards
Ulf Samuelsson



