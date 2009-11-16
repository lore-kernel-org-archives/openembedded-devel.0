Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NA01i-0000dt-Ev
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 12:45:49 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nAGBfFQ6013490 for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2009 11:41:15 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mhLnP9UT+WP3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2009 11:41:15 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nAGBfCgV013475
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2009 11:41:14 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hdrb9v$1dp$1@ger.gmane.org>
References: <20091115163618.GA3317@jama> <hdr31n$8b0$1@ger.gmane.org>
	<1258364356.5799.94.camel@dax.rpnet.com> <hdra17$t4d$1@ger.gmane.org>
	<1258368570.5799.99.camel@dax.rpnet.com> <hdrb9v$1dp$1@ger.gmane.org>
Date: Mon, 16 Nov 2009 11:39:51 +0000
Message-Id: <1258371591.5799.112.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SRCPV migration
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
X-List-Received-Date: Mon, 16 Nov 2009 11:45:49 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-11-16 at 11:59 +0100, Koen Kooi wrote:
> On 16-11-09 11:49, Richard Purdie wrote:
> > On Mon, 2009-11-16 at 11:37 +0100, Koen Kooi wrote:
> >> So basically every recipe that is using SRCPV in PV or PR is unsuitable
> >> to be put in online feeds. That should be enough to stop the SRCPV merge
> >> into .dev.
> >
> > How is this different to the current situation though?
> 
> In the current situation (actually, last weeks situation) SRCPV was 
> never used.
> 
> > If SRCREV is locked down you will get 1 as the local build revision back
> > and it will not change and will be the same for everyone.
> 
> > If its not locked down, all bets are off but they always have been - no
> > change.
> 
> Ah, that was the bit of info I was missing. But if SRCREV is locked down 
> (as it should!) what's the point of putting SRCPV in PV or PR? It seems 
> to make things worse if you update a locked SRCREV, since SRCPV will 
> remain '1'.

How does Angstrom currently solve this problem? You bump the SRCREV and
override PV manually?

Angstrom would probably need a policy of wiping out the persistent data
DB so it didn't auto increase and then the situation doesn't change (for
Angstrom).

The benefit of this change is that local builds start automatically
working for people with fixed or floating SRCREV (and allows easily
switching between them) and people generating feeds from a single build
machine also benefit.

What we really need is a way to force the "local" build revisions for
the likes of Angstrom, I'll keep that in mind for the next bitbake
release...

Cheers,

Richard




