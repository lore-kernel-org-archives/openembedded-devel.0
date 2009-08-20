Received: from [209.85.219.221] (helo=mail-ew0-f221.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1Me3yj-0008LA-Ns
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 11:30:46 +0200
Received: by ewy21 with SMTP id 21so4879293ewy.21
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2009 02:13:23 -0700 (PDT)
Received: by 10.211.178.14 with SMTP id f14mr6883601ebp.10.1250759603696;
	Thu, 20 Aug 2009 02:13:23 -0700 (PDT)
Received: from ?192.168.1.10? (94-193-242-65.zone7.bethere.co.uk
	[94.193.242.65])
	by mx.google.com with ESMTPS id 10sm2030981eyd.54.2009.08.20.02.13.22
	(version=SSLv3 cipher=RC4-MD5); Thu, 20 Aug 2009 02:13:23 -0700 (PDT)
Message-ID: <4A8D13A1.1060007@xora.org.uk>
Date: Thu, 20 Aug 2009 10:13:05 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Thunderbird 2.0.0.22 (Windows/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20090820032802.GA32010@denix.org>
	<200908200752.58210.holger+oe@freyther.de>
In-Reply-To: <200908200752.58210.holger+oe@freyther.de>
Subject: Re: Use AUTOREV and have revision/commit number in package name?
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
X-List-Received-Date: Thu, 20 Aug 2009 09:31:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Holger Hans Peter Freyther wrote:
> On Thursday 20 August 2009 05:28:02 Denys Dmytriyenko wrote:
>   
>> All,
>>
>> I've been playing with AUTOREV for some time now and also asked this
>> question before on the IRC, but so far there seems to be no easy solution
>> to the problem in subject.
>>
>> Usually, when a package is built from an SCM repository, SRCREV is set to a
>> specific commit#/tag etc. And SRCREV is also usually referenced from PV
>> (like PV = "X.Y.Z-scmr${SRCREV}") to have the revision/commit number in the
>> package name, to easily track different builds.
>>
>> Now, when SRCREV = "${AUTOREV}", AUTOREV gets resolved into a Python
>> function, which does the magic of fetching the latest snapshot from a
>> repository. But now if PV contains references to SRCREV, it breaks
>> (undesrandably), since SRCREV gets resolved in do_fetch and PV needs to be
>> resolved early on.
>>
>> Are there any standard ways to work around this limitation?
>>     
>
> Check the mailinglist archives... Openmoko has deployed a solution that has 
> fixed that about 1 1/2 years ago.
>
> Short answer:
> 	- Do not put SRCREV into PV, e.g. create a new var called SRCPV
> 	- Populate SRCPV with something based on the SRCREV..
>
>
>   
Holger, I have been trying to maintain a branch with your SRCPV work in 
it, xora/angstrom-srcpv in git. Unfortuneately as I only get to do it in 
spare time I never seem to be able to quite keep up with OE mainline.

But it would be good to start merging this into mainline, probably 
package by package.

Graeme



