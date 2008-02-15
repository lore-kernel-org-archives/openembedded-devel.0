Received: from [216.145.245.199] (helo=mx03.dls.net)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mwester@dls.net>) id 1JQ263-00035x-8e
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Feb 2008 16:03:29 +0100
Received: from gw.mwester.net ([209.242.5.110] helo=[192.168.1.111])
	by mx03.dls.net with esmtpa (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1JQ25k-0007Zq-69
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Feb 2008 09:03:08 -0600
Message-ID: <47B5A9A4.3040400@dls.net>
Date: Fri, 15 Feb 2008 09:03:00 -0600
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1JPfb1-0006hO-Ll@linuxtogo.org>	<74d0deb30802140817g153c4fe3if16cd9eabe67c9f3@mail.gmail.com>	<200802151245.30040.mickey@vanille-media.de>
	<fp48t2$i8$1@ger.gmane.org>
In-Reply-To: <fp48t2$i8$1@ger.gmane.org>
X-SA-Exim-Connect-IP: 216.145.245.199
X-SA-Exim-Mail-From: mwester@dls.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] org.oe.dev anki: fix parse error
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
X-List-Received-Date: Fri, 15 Feb 2008 15:03:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Rolf Leggewie wrote:
> Michael 'Mickey' Lauer wrote:
>   
>> export PV is valid syntax, but needs bitbake >= 1.8.8.
>>
>> If you think it's too early to depend on this, then you can substitute with
>>
>> export PV := "${PV}"
>>     
>
> I think depending on 1.8.10 is fine and indeed, this might be a good
> test to make sure everybody updates ;-)
>
>   

I recall a series of discussions some months ago regarding the topic of 
making OE an easier tool for other distro developers, companies, or 
individuals to use.  Requiring a bitbake upgrade to accommodate a 
single-line in a single recipe that can easily be expressed in a fashion 
compatible with the existing bitbake versions installed, well that just 
seem to fly in the face of that earlier discussion.

Here's one vote for against forcing a complete bitbake upgrade on other 
communities:
-1 from me!

> Thanks for clarifying why some people saw this while most did not.
>
>   

Mike (mwester)


