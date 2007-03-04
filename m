Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HNmJm-0007WE-3f
	for openembedded-devel@openembedded.org; Sun, 04 Mar 2007 09:43:46 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l248hhLr011699 for <openembedded-devel@lists.openembedded.org>;
	Sun, 4 Mar 2007 09:43:43 +0100
Message-ID: <45EA86BE.2030002@dominion.kabel.utwente.nl>
Date: Sun, 04 Mar 2007 09:43:42 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
References: <45E77A73.5020800@protium.com>	<45E7F2C4.9030300@dominion.kabel.utwente.nl>
	<1172949738.5942.57.camel@localhost.localdomain>
In-Reply-To: <1172949738.5942.57.camel@localhost.localdomain>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
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
X-List-Received-Date: Sun, 04 Mar 2007 08:43:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> On Fri, 2007-03-02 at 10:47 +0100, Koen Kooi wrote:

>> Again: the ability to use deploy as a feed is still present, it only moved to subdirectories.
>
> Which changed a behaviour people were relying on.
>
> My view on this is currently that:
>
> * Being able to use tmp/deploy/ipk as a feed is a useful feature
> * we should continue to allow that (as developer use only, not for
> building real feeds off)

Sure, but people wanting that can do 'bitbake -b contrib/oe-ipkg-feed.bb'. Building a feed
not used for rootfs assembling during do_rootfs is plain wrong. Can we at least agree on
it being out of scope for do_rootfs?

> Since a number of people want the older single feed behaviour, I think
> we should have some way of allowing that.

'bitbake -b contrib/oe-ipkg-feed.bb' which is only a few chars more as 'bitbake
package-index'. Same amount of commands and 'post-processing'

> I understand why people want
> the split feed behaviour too and we should allow people to select that
> too. Which should be default I don't really care about.

People keep saying that do_rootfs should build a feed that can be used as a feed, but what
is the point in that? OE builds only stuff that's put in the images, so the feed would
almost be a 1:1 copy of the image you install on your device. If you start building more
packages and run do_rootfs again you're getting into the territory of what you called
"long standing distro feeds" and associated bugs.

Think about the situation for a moment:

* OE builds packages and puts those somewhere
* OE uses said packages to make a rootfs

As a side effect you get something you could use a feed after do_rootfs has run.
Or you ran manually ran 'bitbake package-index'.

So it always required an extra command (either 'bitbake <foo>-image' or 'bitbake
package-index'), since the index wasn't refreshed automagically after you built a package.

However, there is one thing that breaks, which is the upload scripts people were using. My
suggestion that scripts can be changed didn't go over to well, so I don't have a solution
for that.

I don't disagree with having a way in OE to generate a feed out of the contents in
deploy/, but given the problems raised OE should make clear you'll have no warranty and it
will eat your dog. What about having an OE way that creates 'deploy/bogofeed', in the
spirit of linux' bogomips?

regards,

Koen

PS: Now I think of it, not using TARGET_VENDOR breaks host = target situations....

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF6oa+MkyGM64RGpERAmotAJ0ZG5yAEwSgnHmnYSWo06gSPIUGIwCgmZWV
LgJLBfxNp9e1y6A1ipfti7M=
=D0Av
-----END PGP SIGNATURE-----


