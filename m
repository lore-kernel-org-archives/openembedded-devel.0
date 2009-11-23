Received: from emailgateway.hillcrestlabs.com ([12.173.51.132])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Chris.Conroy@hillcrestlabs.com>) id 1NCdjO-0008Dk-Rs
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 19:33:49 +0100
X-AuditID: 0a1e000a-b7b8cae000000d7b-82-4b0ad5313d65
From: Chris Conroy <Chris.Conroy@hillcrestlabs.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4B0AC426.3030505@2net.co.uk>
References: <1258901140-30575-1-git-send-email-bernhard.kaindl@gmx.net>
	<1258990008.8426.29.camel@conroy-linux> <4B0AC426.3030505@2net.co.uk>
Date: Mon, 23 Nov 2009 13:31:48 -0500
Message-Id: <1259001108.19077.4.camel@conroy-linux>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-Brightmail-Tracker: AAAAAA==
X-SA-Exim-Connect-IP: 12.173.51.132
X-SA-Exim-Mail-From: Chris.Conroy@hillcrestlabs.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] external-toolchain: Really accept toolchains built by meta-toolchain.bb
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
X-List-Received-Date: Mon, 23 Nov 2009 18:33:50 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-11-23 at 17:19 +0000, Chris Simmonds wrote:
> meta-toolchain does generate environment-setup and so far as I am aware 
> it works fine as a stand-alone toolchain. Is there some reason why I 
> should not be using it as such?
> 
> Chris S.

It's fine as just a standalone toolchain. It's just not a "Build
Platform." Meaning, you can't just source it and get all the other
things that OE gives you. This is perhaps too obvious to even warrant
mentioning.

I misinterpreted the original patch since I was comparing against my
local tree, where we've modified to check for environment-setup rather
than package-status (simply as a sanity check for the setting of
${prefix}, so you can safely disregard my previous posting.

--Chris



