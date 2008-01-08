Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JCCWH-00029I-Gr
	for openembedded-devel@openembedded.org; Tue, 08 Jan 2008 12:21:21 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m08BEMW8023721
	for <openembedded-devel@openembedded.org>; Tue, 8 Jan 2008 11:14:22 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23370-08 for <openembedded-devel@openembedded.org>;
	Tue,  8 Jan 2008 11:14:19 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m08BEH0C023715
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Tue, 8 Jan 2008 11:14:17 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <582475286.20080107235236@vanille-media.de>
References: <1068494393.20080104031751@gmail.com>
	<1199663243.4658.71.camel@localhost.localdomain>
	<116173998.20080107221856@gmail.com>
	<1199738665.4680.66.camel@localhost.localdomain>
	<1199742459.4680.69.camel@localhost.localdomain>
	<582475286.20080107235236@vanille-media.de>
Date: Tue, 08 Jan 2008 11:14:16 +0000
Message-Id: <1199790856.4659.9.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Metadata Q/A (was: Another weird case of PACKAGES_DYNAMIC	and task deps, it seems)
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
X-List-Received-Date: Tue, 08 Jan 2008 11:21:22 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2008-01-07 at 23:52 +0100, Michael 'Mickey' Lauer wrote:
> Richard Purdie wrote:
> > On Mon, 2008-01-07 at 20:44 +0000, Richard Purdie wrote:
> >> My money is on:
> >> 
> >> DEPENDS_collie += "bc-native"
> >> 
> >> in linux-rp.inc. Try removing that...
> 
> > Confirmed and fixed in 00610b176af0e4f4563f78fb71dc1219c777d13e.
> 
> > Let me stress once again, += and overrides do not do what you expect. It
> > adds "bc_native" to the variable named "DEPENDS_collie", not "DEPENDS".
> 
> > DEPENDS_append_collie = " bc-native" 
> 
> > is a very different thing and corrects this problem...
> 
> Can we
> 
> a) forbid variable assignment to foo_bar in general (when bar is not
> in {append, prepend, <override>} ?

Like SRC_URI = "" ?

We have a lot of variables with _ in the names since it generally looks
better than SRC-URI. I think we do need a policy on this though since it
will:

a) Bite us at some point
b) It slows bitbake down (although I've never confirmed that)

I actually have a idea rolling around the back of my head here. All our
overrides are lowercase (I think). A lot of our variable names are upper
case. I'm wondering if we'd get a speedup from allowing only lowercase
overrides since bitbake could tell from inspection that "URI" would
never be an override.

This lets us keep the large number of uppercase variables with _ in the
name and we can conceivably rename the lowercase ones since there are a
lot less of them.

> b) have an extra Q/A class that scans the metadata for those kinds of
> problems?

If and only if we have some rules that tell us what the valid cases are.
We'd probably need an exhaustive list of permitted overrides too.

Cheers,

Richard





