Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QSX6x-0005VQ-28 for openembedded-devel@lists.openembedded.org;
	Fri, 03 Jun 2011 18:20:35 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QSX3j-0006AR-P9 for openembedded-devel@lists.openembedded.org;
	Fri, 03 Jun 2011 18:17:15 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Jun 2011 18:17:15 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Jun 2011 18:17:15 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 03 Jun 2011 18:17:01 +0200
Message-ID: <isb1dt$cop$1@dough.gmane.org>
References: <1307025867-12077-1-git-send-email-morphis@gravedo.de>	<20110602144829.GI3281@jama.jama.net>
	<4DE906D9.8000708@gravedo.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <4DE906D9.8000708@gravedo.de>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] minimal: add weak assigned DISTRO_FEED_CONFIGS variable
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
X-List-Received-Date: Fri, 03 Jun 2011 16:20:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03-06-11 18:07, Simon Busch wrote:
> On 02.06.2011 16:48, Martin Jansa wrote:
>> On Thu, Jun 02, 2011 at 04:44:27PM +0200, Simon Busch wrote:
>>> Some distros are based on the minimal distro but want to supply another feed configuration.
>>> As minimal uses DISTRO_EXTRA_RDEPENDS to pull distro-feed-configs into the builded image
>>> the new weak assigned variable DISTRO_FEED_CONFIGS makes it possible to specify another
>>> feed configuration.
>>
>> isn't
>> DISTRO_FEED_PREFIX
>> DISTRO_FEED_URI
>> in
>> recipes/meta/distro-feed-configs.bb
>> enought to modify default distro-feed-configs?
>>
>> and if not cannot we change distro-feed-configs.bb to allow such
>> modifications?
> 
> Maybe you are right and it is the better solution to stay with
> distro-feed-configs.bb as general solution. The details why I did an own
> feed configuration is I don't want all PACKAGE_EXTRA_ARCHS as additional
> feed configs. Why should a image which is flashed to a armv4 device pull
> the feed configs for a armv7a?
> 
> When I have a armv7a device it only needs to get the armv7 +
> MACHINE_ARCH + all feed configs from the remote host for an update and
> nothing more.
> 
> The best solution to archive this is as far as I see to make
> distro-feed-configs machine specific and don't add PACKAGE_EXTRA_ARCHS
> as feed configuration anymore. For poky-feed-config-opkg in oe-core it's
> already the case.

It's also the case for angstrom-feed-configs, which got used as template
for the distro-feed-configs recipe.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN6Qj9MkyGM64RGpERAn7nAKCJp18FRT3BK7dKsets7aTyBe5c0QCeOT88
oo1QgaUw8BQfYzfI+l/iNSY=
=D1oO
-----END PGP SIGNATURE-----



