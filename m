Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1OgzkG-0001Vj-Ly
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 14:40:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o75CeESJ014590
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 5 Aug 2010 13:40:14 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08456-05 for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Aug 2010 13:40:10 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o75Ce9xs014572
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 5 Aug 2010 13:40:10 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTinDqkXzuPxytNCEq6xinJ1kct1cj5vU_kM=NZ=Z@mail.gmail.com>
References: <1278323612.30247.3579.camel@rex> <1281003567.16235.254.camel@rex>
	<AANLkTinDqkXzuPxytNCEq6xinJ1kct1cj5vU_kM=NZ=Z@mail.gmail.com>
Date: Thu, 05 Aug 2010 13:39:53 +0100
Message-ID: <1281011993.16235.284.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [Bitbake-dev] RFC: How to improve packaged-staging and setscene
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
X-List-Received-Date: Thu, 05 Aug 2010 12:40:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-08-05 at 13:12 +0200, Frans Meulenbroeks wrote:
> Sounds good to me. Not sure whether I have time to try it out on short
> term. Too much other things at hand.
> 
> One small concern:
> Would it in your proposal be possible to disable packaged staging?
> I think it would be nice if a user (in local.conf or so) could decide
> on whether he wants to spent build time and space on this.

Technically, disabling would be possible but you lose some important
benefits such as when enabled, cleaning a package will remove whatever
it put into staging.

One of our problems in OE is too many code paths. I'd like to see us try
and minimise that problem. Disk space is cheap and this code shouldn't
take much more time.

Once combined with checksums, it should actually save people large
amounts of time as needing to rebuild from scratch should be a think of
the patch (unless you make a change effecting everything in which case
you'd expect it).

Cheers,

Richard




