Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rod@whitby.id.au>) id 1KZLbJ-0001sK-8G
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Aug 2008 10:14:29 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 7CFD5153304
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Aug 2008 04:12:41 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Sat, 30 Aug 2008 04:12:41 -0400
X-Sasl-enc: xJCOtHpdjmXE4/YKrUqi/DnC2tHH5CZqmJFqk9NCZzPQ 1220083960
Received: from [192.168.1.11] (unknown [121.209.20.127])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 9AAC92A0BE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Aug 2008 04:12:40 -0400 (EDT)
Message-ID: <48B90081.30105@whitby.id.au>
Date: Sat, 30 Aug 2008 17:40:41 +0930
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.16 (Windows/20080708)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
X-Enigmail-Version: 0.95.7
Subject: RFC: When PREFERRED_PROVIDER does not build, don't try other alternatives by default
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
X-List-Received-Date: Sat, 30 Aug 2008 08:14:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Whenever I build virtual/kernel, and for some reason (perhaps a git
fetcher problem, or a patch doesn't apply cleanly) it doesn't build,
bitbake decides to then go and build every other kernel under the sun
trying to complete virtual/kernel.

This is undesirable to the extreme, but I realise that there might have
in the history of OE been a good reason for that behaviour.

My proposal is that bitbake is changed so that if PREFERRED_PROVIDER is
defined, then bitbake does *not* try other providers.  Only if
PREFERRED_PROVIDER is *not* defined should bitbake ever try more than
one package.

Objections?

Here is the IRC log of the discussion with RP about this issue:

<rwhitby> RP: a question for you
<rwhitby> when using virtual/kernel, and your PREFERRED kernel fails to
build, why does bitbake then go and build every other kernel under the sun?
<rwhitby> (and is there a way to stop that happening)
<RP> rwhitby: That is the traditional bitbake behaviour
<RP> rwhitby: I don't actually agree with it but changing it would
breakbacwards compatibilty
<RP> I guess it was once a feature but its turned out no to be so useful
<RP> We should make that behaviour configurable. It only happens with
the -k option anyway
<rwhitby> RP: what was the use case in which it was useful, when
PREFERRED_PROVIDER was defined?
<RP> rwhitby: The idea was it would allow builds to complete rather than
fail
<rwhitby> I can understand it if PREFERRED_PROVIDER is not defined, but
cannot think of a good reason why bitbake should go against explicit
directions for a PREFERRED_PROVIDER
<RP> rwhitby: It comes does to the variable name - "PREFERRED"
<RP> Would it be useful to change the design, I say yes
<RP> but there is history there and as the maintainer I need to be
careful with this
<rwhitby> understood
<rwhitby> can we make it configurable and configure to not do it by
default ?
<RP> We can make it configurable
<RP> I would want to see a discussion about defaults
<RP> Feel free to start that on the bitbake+OE list
<RP> I'm actually in favour of changing it
<RP> but it must be discussed
<rwhitby> nod

-- Rod


