Received: from mailrelay3.sunrise.ch ([194.158.229.31]
	helo=smtp-be-01.be08.sunrise.ch)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dv@vollmann.ch>) id 1OVQMZ-0005EL-5I
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Jul 2010 16:40:09 +0200
Received: from [192.168.26.14] (212-98-43-140.static.adslpremium.ch
	[212.98.43.140])
	by smtp-be-01.be08.sunrise.ch (8.13.1/8.12.10) with ESMTP id
	o64Dw3q1016554; Sun, 4 Jul 2010 15:58:04 +0200
Message-ID: <4C3093B0.5090603@vollmann.ch>
Date: Sun, 04 Jul 2010 15:59:12 +0200
From: Detlef Vollmann <dv@vollmann.ch>
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTilva4t_1fBYfzHthbUInh43adY9VYbU9EjgZL7V@mail.gmail.com>
	<1278021694.30247.438.camel@rex>
In-Reply-To: <1278021694.30247.438.camel@rex>
X-SA-Exim-Connect-IP: 194.158.229.31
X-SA-Exim-Mail-From: dv@vollmann.ch
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
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
X-List-Received-Date: Sun, 04 Jul 2010 14:40:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/02/10 00:01, Richard Purdie wrote:
> On Thu, 2010-07-01 at 00:14 -0700, Khem Raj wrote:
>> I would like to propose to remove building multilib with gcc recipes.
>> It creates problems
>> and we do not package correct bits on some platforms. As we tend to
>> build toolchains keeping in mind the machine it is targetting I think
>> multilib is not that significant
>>
>> Concerns ? comments?
> 
> I'm backing this. Currently multilib is broken and for a good
> implementation we really needs a ground up proposal for how to handle it
> well. I'm starting to look into the problem FWIW so I'd appreciate being
> in the loop in any discussions.
I've run into multilib issues as well, but could always solve it on a
case by case base (e.g. on powerpc).  But I agree it's currently a mess.
But what you need to keep in mind if you actually drop multilib support
is that you need to rename the prefix for the SDK toolchains.
It would be bad if PowerPC 32-bit and 64-bit toolchains were both named
powerpc-angstrom-linux-

   Detlef



