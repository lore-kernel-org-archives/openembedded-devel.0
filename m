Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IVZvH-0000jg-Nz
	for openembedded-devel@openembedded.org; Wed, 12 Sep 2007 23:38:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8CLZn4O025301
	for <openembedded-devel@openembedded.org>;
	Wed, 12 Sep 2007 22:35:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25082-04 for <openembedded-devel@openembedded.org>;
	Wed, 12 Sep 2007 22:35:31 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8CLZRUv025282
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Wed, 12 Sep 2007 22:35:27 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <c384c5ea0709120446p69d21876x5c2c63995222819@mail.gmail.com>
References: <c384c5ea0709111614m20b079f8l4939336884b844b6@mail.gmail.com>
	<HOECLKEKOHLAMMGDLLBHAENPMDAA.skoroneos@digital-opsis.com>
	<c384c5ea0709120446p69d21876x5c2c63995222819@mail.gmail.com>
Date: Wed, 12 Sep 2007 22:35:26 +0100
Message-Id: <1189632926.6480.108.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: USE flags - why they won't work for OE
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
X-List-Received-Date: Wed, 12 Sep 2007 21:39:00 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2007-09-12 at 13:46 +0200, Leon Woestenberg wrote:
> On 9/12/07, Stelios Koroneos <skoroneos@digital-opsis.com> wrote:
> That's exactly why I think the configuration namespace should not be
> performed in the package naming.
> 
> Although it might work for only a limited number of configuration
> items (no X, not GTK, no sound, ...) it quickly becomes hairy.
> 
> However, we could start this way, and tidy later.
> 
> It seems to be the way of least resistance at this point.
> 
> I will commit whatever I think is useful to others. I am sure at some
> point someone will stand up and disagree with me then :-)

Please don't start adding every possible variant of configure options as
things will quickly get insane. I think this is only going to be needed
in a handful of places as in most cases its possible to use a common set
of options. If I'm wrong about that we need to rethink.

On that note if anyone wants to start adding secondary (or more)
versions of a package in this manner please discuss it on this list
first.

Thanks,

Richard



