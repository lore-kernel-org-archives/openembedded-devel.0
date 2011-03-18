Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q0hfe-0006UC-6N
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 22:57:22 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Q0hdw-0006a0-3l from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 14:55:36 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 18 Mar 2011 14:55:03 -0700
Received: from [172.30.80.15] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Fri, 18 Mar 2011 14:55:35 -0700
Message-ID: <4D83D4C4.5010806@mentor.com>
Date: Fri, 18 Mar 2011 14:55:16 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <6F3B187F-5497-4504-9EEB-99204CCC815B@vanille-media.de>	<AANLkTi=1fr0ZVD9WmsaBY_E3veZvdppTsJtVXY-1O88g@mail.gmail.com>
	<1300484141.3026.6.camel@lenovo.internal.reciva.com>
In-Reply-To: <1300484141.3026.6.camel@lenovo.internal.reciva.com>
X-OriginalArrivalTime: 18 Mar 2011 21:55:03.0677 (UTC)
	FILETIME=[22DB62D0:01CBE5B7]
Subject: Re: blacklist.bbclass
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
X-List-Received-Date: Fri, 18 Mar 2011 21:57:22 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/18/2011 02:35 PM, Phil Blundell wrote:
> On Fri, 2011-03-18 at 21:33 +0100, Frans Meulenbroeks wrote:
>> 2011/3/18 Dr. Michael Lauer<mickey@vanille-media.de>:
>>> Salut,
>>>
>>> the blacklisting of packages as found in angstrom.bbclass
>>> is pretty helpful and would be beneficial to all kinds
>>> of distribution configurations in OE. Would there be
>>> a strong objection of renaming this to blacklist.bbclass?
>>>
>>> Copying, of course, is also a possibility, but
>>> in my opinion it would only be the second best choice.
>>>
>>> Cheers,
>>>
>>> :M:
>>
>> If blacklisting a certain package for all distro's is there then still
>> a need to keep those blacklisted packages ????
>
> The class that Mickey is talking about is just the mechanism to allow
> blacklisting.  It doesn't actually contain a list of blacklisted
> packages; I think that typically goes in DISTRO.conf for distros that
> use it.
>
> However, if we do want to rename it to something more global (which I
> agree seems like a good idea) then the contents would need a bit of
> tweaking since both the variables that it looks at, and the messages
> that it outputs, make reference to Angstrom specifically.

I've had that locally for a long while now (BLACKLIST and just %s is 
unsupported because %s).  So I vote in favor of a generic list distros 
blacklist items class.

-- 
Tom Rini
Mentor Graphics Corporation


