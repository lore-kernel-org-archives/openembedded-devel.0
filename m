Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1O5Pxc-0000JV-PH
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Apr 2010 22:58:54 +0200
Received: from gandalf.denix.org ([unknown] [71.251.58.177])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L1C00DT9KR4WLP8@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	23 Apr 2010 15:54:45 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id DEDF814AF60; Fri,
	23 Apr 2010 16:54:39 -0400 (EDT)
Date: Fri, 23 Apr 2010 16:54:39 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100423205439.GC27322@denix.org>
References: <1271852471-16659-1-git-send-email-koen.kooi@gmail.com>
	<hqrv2b$a7u$1@dough.gmane.org> <1272046053.3865.425.camel@trini-m4400>
	<20100423182217.GB27322@denix.org> <hqsprc$no6$1@dough.gmane.org>
	<1272048959.3865.478.camel@trini-m4400> <hqt003$fvd$1@dough.gmane.org>
MIME-version: 1.0
In-reply-to: <hqt003$fvd$1@dough.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.19
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC][PATCH] meta-toolchain: use MULTIMACH_TARGET_SYS	instead of TARGET_SYS
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
X-List-Received-Date: Fri, 23 Apr 2010 20:58:55 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Apr 23, 2010 at 10:29:54PM +0200, Koen Kooi wrote:
> >> Yes, that needs to be done, as well as seperating the cross tools in
> >> case different archs need different versions (as is the case with
> >> angstrom, v5te and v7a need different binutils). This change largely to
> >> to cosmetically highlight that the toolchain is not really "universal"
> >> (yet).
> > 
> > And we can talk about if "universal" is really a good goal either.
> 
> I don't think we can make it "universal" without sacrificing key benefits.
> 
> > Taking a bit of a guess in the dark, an SDK with support for all the fun
> > stuff found on Beagleboard might not be done easily with also having
> > support for all the fun stuff found on some other ref board too.
> 
> The immediate problem I'm trying to address now is that having both an
> armv5te and armv7a toolchain installed is breaking horribly. Ideally
> they would coexist peacefully, but I don't know if we can manage that,
> without impacting the ease of use.

I know it's not what you are looking for, but easier workaround would be to 
install different toolchains in different paths... :)

-- 
Denys


