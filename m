Received: from emailgateway.hillcrestlabs.com ([12.173.51.132])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Chris.Conroy@hillcrestlabs.com>) id 1Nd6hj-0006aq-DT
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Feb 2010 19:45:32 +0100
X-AuditID: 0a1e000a-b7bfcae000000dfe-50-4b6b15328bb7
From: Chris Conroy <Chris.Conroy@hillcrestlabs.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100204172234.GA5641@denix.org>
References: <1265247822-20734-1-git-send-email-denis@denix.org>
	<1265302671.25338.57.camel@conroy-linux>
	<20100204172234.GA5641@denix.org>
Date: Thu, 04 Feb 2010 13:42:50 -0500
Message-Id: <1265308970.13632.6.camel@conroy-linux>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-Brightmail-Tracker: AAAAAA==
X-SA-Exim-Connect-IP: 12.173.51.132
X-SA-Exim-Mail-From: Chris.Conroy@hillcrestlabs.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC][PATCH] meta-toolchain: make SDK relocatable by	using $SDK_PATH var in env setup script
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
X-List-Received-Date: Thu, 04 Feb 2010 18:45:33 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2010-02-04 at 12:22 -0500, Denys Dmytriyenko wrote:
> First of all, they are the same. Check conf/bitbake.conf:
> 
> SDKPATH = "${SDK_PATH}"
> 
> Second, ask RP why he introduced SDKPATH, when we had SDK_PATH for years (my 
> guess - that's what is used in Poky, so makes porting changes easier):
Fair enough, but saying 'ask RP' doesn't justify away the fact that
having these two variables is confusing. If they really are the same,
then one should be removed. If one shouldn't be removed, then there is
some difference that should probably be documented. It's just a matter
of consistency/readability.

> 7c2bd627 (Richard Purdie  2009-11-12 11:51:18 +0000 342) SDKPATH = "${SDK_PATH}"
> 
> > renamed since having them both will be a source of confusion.
> > 
> > It should probably be ${SDK_PATH} instead of $SDK_PATH in your changes.
> 
> You missed the whole point of the patch. It really should be $SDK_PATH
My bad there. I got hung up on the SDK_PATH/SDKPATH thing.

> 
> > Does this really make the SDK relocatable? I thought there were still
> > major issues with relocating GCC.
> 
> GCC built from OE may still have relocation problems - haven't checked lately.
> But it doesn't mean that's the only use case scenario... There is also 
> external toolchain option, as well as building SDK without the toolchain.
> Both of those cases were tested with the above change for several months now.
> 


