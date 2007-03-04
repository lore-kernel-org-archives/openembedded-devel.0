Received: from [81.169.178.128] (helo=h6563.serverkompetenz.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <oe@hentges.net>) id 1HNs3c-00045b-NW
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Mar 2007 15:51:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by h6563.serverkompetenz.net (Postfix) with ESMTP id 688CA3081FB
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Mar 2007 15:51:15 +0100 (CET)
Received: from h6563.serverkompetenz.net ([127.0.0.1])
	by localhost (h6563 [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 03735-05 for <openembedded-devel@lists.openembedded.org>;
	Sun, 4 Mar 2007 15:51:12 +0100 (CET)
Received: from mhcln04.hentges.priv (xdsl-213-196-245-175.netcologne.de
	[213.196.245.175]) (using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by h6563.serverkompetenz.net (Postfix) with ESMTP id 26C4E3081E6
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Mar 2007 15:50:52 +0100 (CET)
From: Matthias Hentges <oe@hentges.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <45EAAE13.4070308@dominion.kabel.utwente.nl>
References: <45E77A73.5020800@protium.com>
	<45E7F2C4.9030300@dominion.kabel.utwente.nl>
	<1172949738.5942.57.camel@localhost.localdomain>
	<45EA86BE.2030002@dominion.kabel.utwente.nl>
	<1173005960.5832.17.camel@localhost.localdomain>
	<45EAAE13.4070308@dominion.kabel.utwente.nl>
Date: Sun, 04 Mar 2007 15:49:24 +0100
Message-Id: <1173019764.11398.143.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 
X-Virus-Scanned: by amavisd-new-20030616-p10 (Debian) at hentges.net
Subject: Re: [oe-commits] org.oe.dev rootfs_ipk: as per OE, policy:	remove feed management tools
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
X-List-Received-Date: Sun, 04 Mar 2007 14:51:29 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Sonntag, den 04.03.2007, 12:31 +0100 schrieb Koen Kooi:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Richard Purdie schreef:
> > On Sun, 2007-03-04 at 09:43 +0100, Koen Kooi wrote:
> 
> >> So it always required an extra command (either 'bitbake <foo>-image' or 'bitbake
> >> package-index'), since the index wasn't refreshed automagically after you built a package.
> > 
> > Nobody has a problem with that.
> 
> People did seem to have problems with that, citing 'needless post processing' when I said
> you need to run one (1) command to get a feed! But we'll from now on assume people have no
> problems with it.

I have no problem running package-index to re(!)-generate a feed. I've
been using package-index for exactly this purpose for a long time.

> > OE is not just about image generation!
> 
> I didn't say that, I meant that people wanting a Packages.* in deploy/ipk _most likely_
> have more packages there than <foo>-image will generate and hence move out of do_rootfs
> territory.

Indeed. As soon as we leave do_rootfs territory, we kinda sorta enter
feed-generation territory, do we not? What good is a truckload of
compiled stuff if you don't have a sane way of installing it.

> FWIW, image generation is ~5% of what I use OE for.
> 
> 
> > I accept there is a fine line between this and supporting feed
> > generation from OE. The thing is people have been happily using that
> > directory as a feed, not for users but for development work. I don't
> > think its fair to break that when we don't need to.
> 
> It didn't break, it _moved_, the subdirectories can still be used as development feeds.
> Instead of saying
> 
> echo 'src/gz devfeed http://buildbox/tmp/deploy/ipk' > /etc/ipkg/devfeed.conf
> 
> you will now say
> 
> echo 'src/gz devfeed1 http://buildbox/tmp/deploy/ipk/ppc603e' > /etc/ipkg/devfeed1.conf
> echo 'src/gz devfeed2 http://buildbox/tmp/deploy/ipk/efika' > /etc/ipkg/devfeed2.conf

Well, it's 3 feeds for slugos and openmo feed. Basically you get
ipk/ARCH, ipk/MACHINE, and ipk/all.

In addition you'll get a bogus empty x86 feed and an empty ipk/Packages
file....

> Right? Or did the cset *really* break that as people keep claiming?

The cset broke the long-used single feed that many of us were using for
years (!) for the sole benefit of the multi-machine guys. Without a way
to revert to the old way.

That's the whole point of this entire thread. I never had a problem with
the change, only the way it has been implemented.

> Assuming the above didn't break, what about this:
> 
> 'bitbake package-index' will generate a deploy/bogofeed, everything else stays as it is now.

My reverted cset did exactly the above, it didn't even so much as touch
your holy new ipk directory.



