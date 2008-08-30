Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rod@whitby.id.au>) id 1KZNDN-0005pJ-BE
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Aug 2008 11:57:53 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 5A6A515992D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Aug 2008 05:56:05 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Sat, 30 Aug 2008 05:56:05 -0400
X-Sasl-enc: mvbTfF8uDxI8NbZ7EQ6Q4j1yPyO38ZBzpbSD919XY0hY 1220090164
Received: from [192.168.1.11] (CPE-121-209-20-127.sa.bigpond.net.au
	[121.209.20.127])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 8DDD22327C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Aug 2008 05:56:04 -0400 (EDT)
Message-ID: <48B918C5.5080600@whitby.id.au>
Date: Sat, 30 Aug 2008 19:24:13 +0930
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.16 (Windows/20080708)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <48B90081.30105@whitby.id.au>
	<1220088972.9935.151.camel@lenovo.internal.reciva.com>
In-Reply-To: <1220088972.9935.151.camel@lenovo.internal.reciva.com>
Subject: Re: RFC: When PREFERRED_PROVIDER does not build, don't try	other alternatives by default
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
X-List-Received-Date: Sat, 30 Aug 2008 09:57:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Phil Blundell wrote:
> On Sat, 2008-08-30 at 17:40 +0930, Rod Whitby wrote:
>> Whenever I build virtual/kernel, and for some reason (perhaps a git
>> fetcher problem, or a patch doesn't apply cleanly) it doesn't build,
>> bitbake decides to then go and build every other kernel under the sun
>> trying to complete virtual/kernel.
> 
> It shouldn't be doing that in the first place.  If PREFERRED_PROVIDER is
> set and that package is considered statically buildable, bitbake will
> try to build it.  If PREFERRED_PROVIDER names a package which is
> statically unbuildable, bitbake will proceed as if that variable wasn't
> set at all and select one according to its other rules.  In either case,
> once it has made its determination, it will try to build that one
> package and no other.  If the selected package turns out to be
> dynamically unbuildable (which would include the reasons you mentioned
> above) then it will stop.
> 
> So, it sounds like the behaviour you are experiencing is a bug rather
> than a feature.

Ah, I forgot to say that the circumstances in which I see this are
probably coincident with when I invoke bitbake with -k.

-- Rod


