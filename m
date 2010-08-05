Received: from smtp5-g21.free.fr ([212.27.42.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ydirson@free.fr>) id 1Oh7Lt-0002vu-UL
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 22:47:46 +0200
Received: from home.lan (unknown [81.57.214.146])
	by smtp5-g21.free.fr (Postfix) with ESMTP id 7B91DD48103
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Aug 2010 22:47:38 +0200 (CEST)
Received: from yann by home.lan with local (Exim 4.72)
	(envelope-from <ydirson@free.fr>) id 1Oh7RT-0002Cl-F8
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 22:53:31 +0200
Date: Thu, 5 Aug 2010 22:53:31 +0200
From: Yann Dirson <ydirson@free.fr>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100805205331.GA8461@home.lan>
References: <1280798728-13412-1-git-send-email-ydirson@altern.org>
	<20100803230120.GN4752@home.lan>
	<1280910705.4225.10.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1280910705.4225.10.camel@mattotaupa>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 212.27.42.5
X-SA-Exim-Mail-From: ydirson@free.fr
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] python-xdg: prevent infinite recursion in xdg.DesktopEntry.__cmp__().
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
X-List-Received-Date: Thu, 05 Aug 2010 20:47:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 04, 2010 at 10:31:45AM +0200, Paul Menzel wrote:
> Am Mittwoch, den 04.08.2010, 01:01 +0200 schrieb Yann Dirson:
> > Delete cmp method which has been dropped from later releases.
> 
> Yann, thank you for your patch.
> 
> I would prefer if you could move the recipe to 0.19 [1]. I did `git grep
> -i pyxdg` and found no traces that 0.15 is pinned anywhere.
> 
> Or is your patch for stable?

It is most surely useful for stable, but since I won't be able to
process 0.19 right now, it is probably good for dev as well.

Best regards,
-- 
Yann


