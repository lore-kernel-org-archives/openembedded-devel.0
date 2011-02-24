Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PsdxF-0003FT-UM
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Feb 2011 17:22:14 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Psdvx-0001Rr-1p from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Feb 2011 08:20:53 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 24 Feb 2011 08:20:52 -0800
Received: from [172.30.80.151] ([172.30.80.151]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 24 Feb 2011 09:20:51 -0700
Message-ID: <4D668554.4050307@mentor.com>
Date: Thu, 24 Feb 2011 09:20:36 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1298490534.26736.52.camel@rex>
	<AANLkTim-WprzRfvaYnFMjoR4=19hj96qp3NioMjY0Axi@mail.gmail.com>
In-Reply-To: <AANLkTim-WprzRfvaYnFMjoR4=19hj96qp3NioMjY0Axi@mail.gmail.com>
X-OriginalArrivalTime: 24 Feb 2011 16:20:51.0794 (UTC)
	FILETIME=[CDEA5B20:01CBD43E]
Subject: Re: OE TSC Meeting 2011/02/21 Minutes
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
X-List-Received-Date: Thu, 24 Feb 2011 16:22:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/24/2011 01:20 AM, Frans Meulenbroeks wrote:
> Dear Richard,
>
> Thanks for the minutes.
>
> Below are a few suggestions/questions.
>
> 2011/2/23 Richard Purdie<richard.purdie@linuxfoundation.org>:
> [...]
>>
>> It was agreed to use a pull model for oecore with RP taking the top of
>> the pull tree role. For meta-oe, there was a lot of argument for
>> starting to use a pull model there too in an effort to also improve
>> quality, but, the TSC recognised this might be the cause of friction. It
>> was agreed to trial this for meta-oe whilst it becomes established and
>> to actively solicit member feedback on how this works out. It should be
>> stressed this is just a trial at this point.
>
> This raises a few questions and remarks:
> - I think we should try to come to some guidelines/suggestions/help on
> how to handle this from a developer viewpoint.
> This might e.g. be some additions to the git phrasebook, but I can
> imagine we also want to do (or refer to) some starter docs on how to
> set up a git, and some tips and tricks on how to work with it in a way
> that is convenient for the puller. E.g. "how to be a good oe-core git
> provider".
> (btw I am quite a n00b when it comes to git, so I am definitely not
> volunteering to write this section as i do not feel capable to do so).
> - What about reviews? OE now has an ack/nack review policy (at least
> for toolchain related parts)
> - who will take the pull master role for meta-oe
> - what about patches submitted to the mailing list? Do we expect the
> pull master to pick them up?  Or will the yocto people deal with
> mailed patches (for oe-core that is)?
> Or another scenario?

Not clear in the summary but from the logs is that we want to, as part 
of making this be transparent, publish guidelines for how this will 
work, based on what poky is doing now.  The high level plan is to follow 
the contrib tree model that poky has which means sending pull requests 
(which in turn also post the patches to the ML for review).

For changes that don't have a tree to pull from, someone with write 
access would need to pick them up.

-- 
Tom Rini
Mentor Graphics Corporation


