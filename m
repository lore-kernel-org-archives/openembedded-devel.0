Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HNowF-0005Yo-Sr
	for openembedded-devel@openembedded.org; Sun, 04 Mar 2007 12:31:40 +0100
Received: from [172.20.0.21] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l24BVWox019982 for <openembedded-devel@openembedded.org>;
	Sun, 4 Mar 2007 12:31:33 +0100
Message-ID: <45EAAE13.4070308@dominion.kabel.utwente.nl>
Date: Sun, 04 Mar 2007 12:31:31 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <45E77A73.5020800@protium.com>	<45E7F2C4.9030300@dominion.kabel.utwente.nl>	<1172949738.5942.57.camel@localhost.localdomain>	<45EA86BE.2030002@dominion.kabel.utwente.nl>
	<1173005960.5832.17.camel@localhost.localdomain>
In-Reply-To: <1173005960.5832.17.camel@localhost.localdomain>
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
X-List-Received-Date: Sun, 04 Mar 2007 11:31:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> On Sun, 2007-03-04 at 09:43 +0100, Koen Kooi wrote:

>> So it always required an extra command (either 'bitbake <foo>-image' or 'bitbake
>> package-index'), since the index wasn't refreshed automagically after you built a package.
> 
> Nobody has a problem with that.

People did seem to have problems with that, citing 'needless post processing' when I said
you need to run one (1) command to get a feed! But we'll from now on assume people have no
problems with it.

> OE is not just about image generation!

I didn't say that, I meant that people wanting a Packages.* in deploy/ipk _most likely_
have more packages there than <foo>-image will generate and hence move out of do_rootfs
territory.
FWIW, image generation is ~5% of what I use OE for.


> I accept there is a fine line between this and supporting feed
> generation from OE. The thing is people have been happily using that
> directory as a feed, not for users but for development work. I don't
> think its fair to break that when we don't need to.

It didn't break, it _moved_, the subdirectories can still be used as development feeds.
Instead of saying

echo 'src/gz devfeed http://buildbox/tmp/deploy/ipk' > /etc/ipkg/devfeed.conf

you will now say

echo 'src/gz devfeed1 http://buildbox/tmp/deploy/ipk/ppc603e' > /etc/ipkg/devfeed1.conf
echo 'src/gz devfeed2 http://buildbox/tmp/deploy/ipk/efika' > /etc/ipkg/devfeed2.conf

Right? Or did the cset *really* break that as people keep claiming?

Assuming the above didn't break, what about this:

'bitbake package-index' will generate a deploy/bogofeed, everything else stays as it is now.


regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF6q4TMkyGM64RGpERAgN/AJ9fb59es7p6p+rJ4Uhwsn+2QUJ6QwCePf/f
Sk9wVjfSY4bvmVEs0jfAeOo=
=wBAr
-----END PGP SIGNATURE-----


