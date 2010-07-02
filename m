Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1OUdYJ-0004Hc-Mp
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 12:33:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o62ASEQY032694
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 2 Jul 2010 11:28:14 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32657-01 for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jul 2010 11:28:10 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o62AS8CQ032688
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 2 Jul 2010 11:28:09 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <i0k2cb$tkr$1@dough.gmane.org>
References: <20100701172428.3b2ac88e@xora-desktop.xora.org.uk>
	<i0iv84$7qt$1@dough.gmane.org> <4C2D13AE.9030903@mentor.com>
	<i0k2cb$tkr$1@dough.gmane.org>
Date: Fri, 02 Jul 2010 11:28:06 +0100
Message-ID: <1278066486.30247.517.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
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
X-List-Received-Date: Fri, 02 Jul 2010 10:33:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-07-02 at 08:52 +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 02-07-10 00:16, Tom Rini wrote:
> > Koen Kooi wrote:
> >> -----BEGIN PGP SIGNED MESSAGE-----
> >> Hash: SHA1
> >>
> >> On 01-07-10 18:24, Graeme Gregory wrote:
> >>> We already have BBCLASSEXTENDS which modifies ${PN} of a package and
> >>> can use overrides to change behaviors of recipes.
> >>>
> >>> Maybe USE flags could be implemented in a similar fashing.
> >>>
> >>> DISTRO_USE = "nossl nox11"
> >>>
> >>> EXTRA_OECONF_append_use-nossl = "--disable-ssl"
> >>>
> >>> ${PN} of the recipe becomes XXXX-nossl
> >>>
> >>> Thoughts?
> >>
> >> Just that USE flags shouldn't be used if seperate recipes can solve it
> >> as well.
> > 
> > If I may, I'd like to articulate what I believe to be the technical
> > argument behind this statement.
> > 
> > One of the issues with some form of USE flags, and I believe this is one
> > of the big ones for Angstrom as well as any other public feed publishing
> > distribution is that having a single recipe that does different things
> > based on variables makes maintaining their feed (and allowing users to
> > publish their own compatible feeds) a nightmare.
> 
> That's not what I'm getting at. If 2 *packages* can safely co-exist in
> the feeds *and* and image can choose which it wants to install USE flags
> artificially limit the choice.
> Example: opkg, nopkg-nopgp
> 
> This extends to things like "shadow or tinylogin?" as well.

Graeme suggested something like BBCLASSEXTEND for USE flags. I've also
wondered about it.

Any "USE" case contains at least three pieces of information:

a) Which configure flag we're playing with
b) What DEPENDS needs to change
c) Some kind of associated name for the flag

Creating an example, lets have a case where we have "ssl, x11, dbus,
bluez and wifi" as features. This example isn't so crazy as once we open
the box, someone will want every combination of every possible option.

With 5 options there are 32 different possible variants.

Now I realise not all combinations of "USE" cases work together or
actually make sense. Do we list the combinations that are allowed? or
disallowed?

By the time you delve into adding some complex configuration system to
merge together all this data, I'd suggest it makes a lot more sense to
have setups like opkg where we have a simple .inc file which does:

require foo_${PV}.bb

DEPENDS += "xyz"
EXTRA_OECONF = "--with-xyz"

and the addition of a -= operator in bitbake could be very useful.

BBCLASSEXTEND grew out of the shear number of recipes that followed a
form of just inheriting native. I'd suggest that if we need an extension
to bitbake in the future we can add one but lets make it work without
that, at least at first and see what makes sense.

I'd suggest that adding 32 different variants of a package just dilutes
our testing further and will become an unmaintainable nightmare so any
system which limits the number of variants to those we actually need is
desirable.

This whole discussion also doesn't get to how to select which
combination you actually want to use in an image. If you pull in
something with ssl enabled, you probably want to change to the ssl
versions of all the other packages with that option for example. This
implies that the package manager needs to be taught something about
this.

So that covers generating all the multiple outputs of USE cases. What
about users wishing to modify a given recipes flags without changing its
name? This is its own can of worms.

I'd point out you can already do fun things like:

EXTRA_OECONF_append_pn-opkg = " --without-ssl"

from your distro.conf or local.conf.

I don't really have a conclusion. In some cases providing multiple
variants makes sense. In others its just impractical and being able to
change the flags of packages does make sense for some people's usecases.
Regardless of what we do, it needs a lot of thought and planning going
into it and I don't think anyone has followed through the implications
to the level of detail required :/. It is a case where forward planning
would help a lot.

Cheers,

Richard




