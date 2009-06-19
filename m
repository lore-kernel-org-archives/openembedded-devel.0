Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MHYoJ-0004bn-GC
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Jun 2009 09:46:55 +0200
Received: from 88-109-80-94.dynamic.dsl.as9105.com ([88.109.80.94]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MHYe2-0003JD-8H
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Jun 2009 08:36:18 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090617214104.GC21132@denix.org>
References: <20090617042909.GA21132@denix.org>
	<1245224450.29153.99.camel@lenovo.internal.reciva.com>
	<20090617214104.GC21132@denix.org>
Date: Fri, 19 Jun 2009 08:36:17 +0100
Message-Id: <1245396977.29153.192.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: update-rc.d: don't add runtime dependency if not	doing	online package management; only add it to ${PN} in any case.
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
X-List-Received-Date: Fri, 19 Jun 2009 07:46:55 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-06-17 at 17:41 -0400, Denys Dmytriyenko wrote:
> Any ideas why RDEPENDS_{PN} in "udev" recipe works, but RDEPENDS_udev doesn't? 
> It only happens with inherit update-rc.d.bbclass, which also changes 
> RDEPENDS_{PN}... I have the same issue with my own recipes, which I need to 
> fix similarly.

It's a side effect of the way that overrides work in bitbake.  What
happens is that you start with:

RDEPENDS_udev = "something"
# RDEPENDS_${PN} is not set
RDEPENDS_${PN}_append = "foo"

First, bitbake processes the _append, which causes a new variable
RDEPENDS_${PN} to be created.  (It doesn't append to RDEPENDS_udev
because, at this stage, that is a different variable name.)  So now you
have:

RDEPENDS_udev = "something"
RDEPENDS_${PN} = "foo"

Finally. bitbake expands the expressions on the left-hand side.  At this
point the latter variable's name is transformed into RDEPENDS_udev and
hence it will overwrite the former one.  Which variable "wins" in this
case is a little bit unpredictable although I think that, with the
current bitbake, a variable whose name goes through more transforming
steps is likely to defeat one whose name is simpler.

The practical effect of this is that, in almost all circumstances, you
should set and refer to RDEPENDS_${PN}, RDEPENDS_${PN}-dev and so on,
rather than pre-expanding those values by hand.

p.



