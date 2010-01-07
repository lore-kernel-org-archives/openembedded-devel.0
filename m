Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NSxyW-00040e-3k
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jan 2010 20:24:55 +0100
Received: from 89-168-180-155.dynamic.dsl.as9105.com ([89.168.180.155]
	helo=[192.168.2.155])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NSxwV-0002T8-PX
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jan 2010 19:22:47 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hi5b61$f7h$1@ger.gmane.org>
References: <hi5b61$f7h$1@ger.gmane.org>
Date: Thu, 07 Jan 2010 19:22:44 +0000
Message-ID: <1262892164.2553.230.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: RFC: Bump default version for gtk+ to 2.18.3
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
X-List-Received-Date: Thu, 07 Jan 2010 19:24:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-01-07 at 20:03 +0100, Rolf Leggewie wrote:
> as evidenced by http://tinderbox.openembedded.org/packages/407335/ the
> current default gtkmm (2.18.1) does not compile with the current default
> gtk+ (2.14.2).  My suggestion is to remove DEFAULT_PREFERENCE -1 from
> the 2.18.3 recipe and make it the new OE default.

Assuming that 2.18.3 compiles and doesn't have any glaring defects then
that sounds like a fine plan.  DEFAULT_PREFERENCE is, frankly, rather
too blunt an instrument to be of much use nowadays: any DISTROs that
particularly wish to use 2.14.2 should be (and probably are) setting it
as their PREFERRED_VERSION.

All too often we end up with new versions being stuck in at
DEFAULT_PREFERENCE -1 simply because the person updating the recipe
didn't want to take the responsibility for testing it.  This is
something of an unsatisfactory situation and maybe one that the TSC
could address in due course with some kind of policy formulation.

p.




