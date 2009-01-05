Received: from [68.230.241.42] (helo=fed1rmmtao104.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LJvbR-0007S4-Ah
	for openembedded-devel@openembedded.org; Mon, 05 Jan 2009 20:59:09 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao104.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090105195310.BLTD11567.fed1rmmtao104.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Mon, 5 Jan 2009 14:53:10 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo03.cox.net with bizsmtp
	id zvt91a00S1E665w04vt93x; Mon, 05 Jan 2009 14:53:10 -0500
X-Authority-Analysis: v=1.0 c=1 a=UA0Z595oU3QA:10 a=nvBvAxcGjs0A:10
	a=FUSSQTOzNKj30kxEUbMA:9 a=dRWOpBCxdy7pkX8NpjwA:7
	a=wfsk4nsy_4z5OmExjisZJ9I4oRUA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Mon, 5 Jan 2009 12:53:38 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090105195338.GS400@smtp.west.cox.net>
References: <1230827114.5320.42.camel@dax.rpnet.com>
	<20090101182526.GF7040@smtp.west.cox.net>
	<1230840687.5320.56.camel@dax.rpnet.com>
	<20090101220229.GH7040@smtp.west.cox.net>
	<1230858713.10424.4.camel@dax.rpnet.com>
	<20090102043755.GC400@smtp.west.cox.net>
	<d2b9ea600901050631h5eda6de5yee190bf0841e5b15@mail.gmail.com>
	<gjtg1m$rsd$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gjtg1m$rsd$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Native/Cross/SDK rethink (Was: Re: RFC: "Virtual" native	and sdk recipes)
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
X-List-Received-Date: Mon, 05 Jan 2009 19:59:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 05, 2009 at 06:29:24PM +0100, Koen Kooi wrote:
> On 05-01-09 15:31, Esben Haabendal wrote:
>> On Fri, Jan 2, 2009 at 5:37 AM, Tom Rini<trini@kernel.crashing.org>  wrote:
>>> On Fri, Jan 02, 2009 at 01:11:53AM +0000, Richard Purdie wrote:
>
>>>> This does reverse the logic that the current sdk class we use however
>>>> since MACHINE is now the machine we want to run the compiler on, not the
>>>> machine we want to compile for. It should be simple enough to add some
>>>> MACHINEs and version setups which correspond to a Linux 32 bit system, a
>>>> Linux 64 bit system and a windows system though. Assuming the choice of
>>>> TARGET for gcc-canadian is controlled by a variable like SDKTARGET, to
>>>> run the builds I'd want, I'd run:
>>>>
>>>> MACHINE=i686-generic   SDKTARGET=armv5te-generic bitbake gcc-canadian
>>>> MACHINE=x86-64-generic SDKTARGET=armv5te-generic bitbake gcc-canadian
>>>> MACHINE=winxp-generic  SDKTARGET=armv5te-generic bitbake gcc-canadian
>>> Or 'meta-toolchain-sbox' for an existing SDK type target.
>>
>> I'm sorry, but this seems like a dangerous way of starting confusion of terms.
>> MACHINE in how I see OE is really the _TARGET_, ie. the small device this all
>> is targeted at.
>
> MACHINE is where the generated stuff will _run_ on, so MACHINE=x86  
> SDKTARGET=armv5te would be more in line with what OE expects, but I  
> agree it can be confusing if you are thinking in autotools terms.

The real trick is the SDK is for a specific target machine.  Should
still be doable, just need to get some magic to deal with if SDKTARGET
being set, re-set MACHINE, except for some cases

-- 
Tom Rini


