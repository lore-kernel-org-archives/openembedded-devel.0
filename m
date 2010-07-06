Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OWB0Z-0007dC-3x
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Jul 2010 18:28:32 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OWAvr-0006El-BR from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Jul 2010 09:23:39 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 6 Jul 2010 09:23:39 -0700
Received: from [172.30.80.199] ([172.30.80.199]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 6 Jul 2010 10:23:37 -0600
Message-ID: <4C335887.60306@mentor.com>
Date: Tue, 06 Jul 2010 09:23:35 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTilva4t_1fBYfzHthbUInh43adY9VYbU9EjgZL7V@mail.gmail.com>	<1278021694.30247.438.camel@rex>
	<4C3093B0.5090603@vollmann.ch>
In-Reply-To: <4C3093B0.5090603@vollmann.ch>
X-OriginalArrivalTime: 06 Jul 2010 16:23:38.0108 (UTC)
	FILETIME=[96CC1BC0:01CB1D27]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC} Disable multilib in gcc recipes
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
X-List-Received-Date: Tue, 06 Jul 2010 16:28:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Detlef Vollmann wrote:
> On 07/02/10 00:01, Richard Purdie wrote:
>> On Thu, 2010-07-01 at 00:14 -0700, Khem Raj wrote:
>>> I would like to propose to remove building multilib with gcc recipes.
>>> It creates problems
>>> and we do not package correct bits on some platforms. As we tend to
>>> build toolchains keeping in mind the machine it is targetting I think
>>> multilib is not that significant
>>>
>>> Concerns ? comments?
>>
>> I'm backing this. Currently multilib is broken and for a good
>> implementation we really needs a ground up proposal for how to handle it
>> well. I'm starting to look into the problem FWIW so I'd appreciate being
>> in the loop in any discussions.
> I've run into multilib issues as well, but could always solve it on a
> case by case base (e.g. on powerpc).  But I agree it's currently a mess.
> But what you need to keep in mind if you actually drop multilib support
> is that you need to rename the prefix for the SDK toolchains.
> It would be bad if PowerPC 32-bit and 64-bit toolchains were both named
> powerpc-angstrom-linux-

Keep in mind that what's being suggested isn't dropping multilib support 
but being clear that it's not something that works right today while we 
re-evaluate doing it properly.  As you note, yes, the SDK case needs 
some thought today as the default paths conflict very easily (and can 
just as easily be worked around, stick FEED_ARCH or similar in there).

-- 
Tom Rini
Mentor Graphics Corporation


