Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1QSWxr-0005Ka-1e
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Jun 2011 18:11:11 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 60884799012; Fri,  3 Jun 2011 18:08:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=6.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from [192.168.1.37] (p5B3E652D.dip.t-dialin.net [91.62.101.45])
	by gravedo.de (Postfix) with ESMTPSA id 24641798D74
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jun 2011 18:07:57 +0200 (CEST)
Message-ID: <4DE906D9.8000708@gravedo.de>
Date: Fri, 03 Jun 2011 18:07:53 +0200
From: Simon Busch <morphis@gravedo.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110422 Lightning/1.0b2 Shredder/3.1.11pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1307025867-12077-1-git-send-email-morphis@gravedo.de>
	<20110602144829.GI3281@jama.jama.net>
In-Reply-To: <20110602144829.GI3281@jama.jama.net>
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
X-List-Received-Date: Fri, 03 Jun 2011 16:11:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 02.06.2011 16:48, Martin Jansa wrote:
> On Thu, Jun 02, 2011 at 04:44:27PM +0200, Simon Busch wrote:
>> Some distros are based on the minimal distro but want to supply another feed configuration.
>> As minimal uses DISTRO_EXTRA_RDEPENDS to pull distro-feed-configs into the builded image
>> the new weak assigned variable DISTRO_FEED_CONFIGS makes it possible to specify another
>> feed configuration.
> 
> isn't
> DISTRO_FEED_PREFIX
> DISTRO_FEED_URI
> in
> recipes/meta/distro-feed-configs.bb
> enought to modify default distro-feed-configs?
> 
> and if not cannot we change distro-feed-configs.bb to allow such
> modifications?

Maybe you are right and it is the better solution to stay with
distro-feed-configs.bb as general solution. The details why I did an own
feed configuration is I don't want all PACKAGE_EXTRA_ARCHS as additional
feed configs. Why should a image which is flashed to a armv4 device pull
the feed configs for a armv7a?

When I have a armv7a device it only needs to get the armv7 +
MACHINE_ARCH + all feed configs from the remote host for an update and
nothing more.

The best solution to archive this is as far as I see to make
distro-feed-configs machine specific and don't add PACKAGE_EXTRA_ARCHS
as feed configuration anymore. For poky-feed-config-opkg in oe-core it's
already the case.

regards,
Simon


