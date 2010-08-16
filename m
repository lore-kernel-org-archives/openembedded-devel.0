Received: from ns0.zlo.nu ([85.17.141.90] helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcolz@zlo.nu>) id 1Okzf4-0005PI-CB
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 15:23:35 +0200
Received: by mzh.zlo.nu (Postfix, from userid 1000)
	id 9B100140CD; Mon, 16 Aug 2010 15:23:17 +0200 (CEST)
Date: Mon, 16 Aug 2010 15:23:17 +0200
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100816132317.GA7983@zlo.nu>
References: <AANLkTikW6GsKga3=6dWUcviDJqb8WqVqhSmBw6vACM3e@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTikW6GsKga3=6dWUcviDJqb8WqVqhSmBw6vACM3e@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 85.17.141.90
X-SA-Exim-Mail-From: marcolz@zlo.nu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: cleaning recipes
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
X-List-Received-Date: Mon, 16 Aug 2010 13:23:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 15, 2010 at 04:59:17PM +0200, Frans Meulenbroeks wrote:
> As some of you might have noticed I've been cleaning up our
> recipes.during the last week or so.
> As I had some time at hand this weekend, lots of cleaning has been done.
> I did my very best to stay within the guidelines of the TSC (as
> described in http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-May/020047.html),
> but it is quite possible that at some point I made a mistake or so.
> If so, let me know and I'll repair things and/or revert the commit. (I
> feel if you make a mess you should also clean it yourself).

Hmm, the "guidelines" do not mention anything about licenses. Thus the
only version you left of coreutils after
82dcd385984ba059b346a0e37fd3e14d536074ad is infected with GPLv3, while
the older (6.0) GPLv2 version works fine for us.  I do not know
whether other people mind about licenses, but we cannot use any GPLv3
software in our image, because of its viral nature.

Marc


