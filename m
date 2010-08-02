Received: from ns0.zlo.nu ([85.17.141.90] helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcolz@zlo.nu>) id 1OfvkE-0007GG-5s
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Aug 2010 16:12:09 +0200
Received: by mzh.zlo.nu (Postfix, from userid 1000)
	id 433AB1413C; Mon,  2 Aug 2010 16:11:12 +0200 (CEST)
Date: Mon, 2 Aug 2010 16:11:12 +0200
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100802141112.GA28268@zlo.nu>
References: <1280415061-28353-1-git-send-email-chase.maupin@ti.com>
	<20100729205504.GE29814@mx.loc> <i2tsjb$o2v$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <i2tsjb$o2v$1@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 85.17.141.90
X-SA-Exim-Mail-From: marcolz@zlo.nu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/1] distribute_license: added class to copy license files
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
X-List-Received-Date: Mon, 02 Aug 2010 14:12:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 30, 2010 at 08:48:11AM +0200, Koen Kooi wrote:
> > hush: set: -f: invalid option
> 
> I don't think we realistically support something different than bash.
> Having said that, adding hashisms is bad, do you have a suggestion for a
> more portable approach?

I've been building with dash as /bin/sh with no problems for almost 2
years now. Not many gtk packages though. Anyway, I do not see any reason
to introduce bashisms, but if you do not know how to do it "properly" in
a portable way, you can always specificaly run bash to run certain
scripts, as adding bash to OE's prerequisites is less intrusive than
requiring /bin/sh to be bash.

Marc


