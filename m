Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OUS82-0004v0-PP
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 00:21:08 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OUS3Q-0001pS-Au from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 15:16:20 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 1 Jul 2010 15:16:19 -0700
Received: from [172.30.80.201] ([172.30.80.201]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 1 Jul 2010 16:16:19 -0600
Message-ID: <4C2D13AE.9030903@mentor.com>
Date: Thu, 01 Jul 2010 15:16:14 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20100701172428.3b2ac88e@xora-desktop.xora.org.uk>
	<i0iv84$7qt$1@dough.gmane.org>
In-Reply-To: <i0iv84$7qt$1@dough.gmane.org>
X-OriginalArrivalTime: 01 Jul 2010 22:16:19.0195 (UTC)
	FILETIME=[07B8FCB0:01CB196B]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: USE flags mumbling
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
X-List-Received-Date: Thu, 01 Jul 2010 22:21:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 01-07-10 18:24, Graeme Gregory wrote:
>> We already have BBCLASSEXTENDS which modifies ${PN} of a package and
>> can use overrides to change behaviors of recipes.
>>
>> Maybe USE flags could be implemented in a similar fashing.
>>
>> DISTRO_USE = "nossl nox11"
>>
>> EXTRA_OECONF_append_use-nossl = "--disable-ssl"
>>
>> ${PN} of the recipe becomes XXXX-nossl
>>
>> Thoughts?
> 
> Just that USE flags shouldn't be used if seperate recipes can solve it
> as well.

If I may, I'd like to articulate what I believe to be the technical 
argument behind this statement.

One of the issues with some form of USE flags, and I believe this is one 
of the big ones for Angstrom as well as any other public feed publishing 
distribution is that having a single recipe that does different things 
based on variables makes maintaining their feed (and allowing users to 
publish their own compatible feeds) a nightmare.

This is because there isn't any form of use flag checking (a simple case 
of 1:1 or the more complex case of flagA needs flagB and flagC doesn't 
care about flagD -> flagZ).

-- 
Tom Rini
Mentor Graphics Corporation


