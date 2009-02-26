Received: from [216.145.245.197] (helo=mx01.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1Lcmrg-0001Nz-4c
	for openembedded-devel@openembedded.org; Thu, 26 Feb 2009 21:29:53 +0100
Received: from [209.242.7.188] (helo=[192.168.231.111])
	by mx01.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1Lclbw-0000Ex-0D
	for openembedded-devel@openembedded.org; Thu, 26 Feb 2009 13:09:32 -0600
Message-ID: <49A6E8E3.6090007@dls.net>
Date: Thu, 26 Feb 2009 13:09:23 -0600
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.19) Gecko/20081209 Thunderbird/2.0.0.19 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <go4amc$h30$1@ger.gmane.org> <go6ah4$cud$1@ger.gmane.org>
	<49A6B938.3040201@balister.org>
In-Reply-To: <49A6B938.3040201@balister.org>
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
X-List-Received-Date: Thu, 26 Feb 2009 20:29:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Philip Balister wrote:
> Koen Kooi wrote:
>> On 25-02-09 21:46, Koen Kooi wrote:
>>> Hi,
>>>
>>> I was getting seriously annoyed with the useless error codes opkg was
>>> giving me and Tick pointed me to:
>>>
>>> http://code.google.com/p/opkg/issues/detail?id=6&can=1
>>>
>>> We're at 197 now in OE (with r201 applied as patch). I'd like to get
>>> r199 and r200 in as well, and since I'm lazy I though we'd get r198 in
>>> as well, which means instead of adding a few patches I can just bump up
>>> SRCREV to 201.
>>>
>>> What do you think?
>>
>> Noone is thinking anything?
> 
> Well, it looks ok to me, but I am not a follower of opkg.
> 
> Hearing no positive comments, does anyone object to pushing this,
> knowing that if Koen is wrong about this working, it messes up our builds?

[I have failed -- I had intended to remain silent on the topic of opkg ;-) ]

I use PREFERRED_VERSION, for a reason -- opkg has numerous issues, few
of which seem to be well-understood much less being worked on, and it
seems that small-memory devices trigger these issues more so than the
larger more common systems.

I will be back-porting these patches for the opkg-nogpg-nocurl recipe,
regardless.

If folks would rather not have the ever-growing set of opkg-nogpg-nocurl
patches clutter up the opkg recipe directory, feel free to instruct me
to move that all to a different directory.

-Mike (mwester)


