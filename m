Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NGfTR-00006M-S7 for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 22:14:00 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NGfRq-0001jC-VT
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 22:12:18 +0100
Received: from 167.225.107.17 ([167.225.107.17])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Dec 2009 22:12:13 +0100
Received: from jerm7861 by 167.225.107.17 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Dec 2009 22:12:13 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Jeremy Williams <jerm7861@yahoo.com>
Date: Fri, 4 Dec 2009 21:11:50 +0000 (UTC)
Message-ID: <loom.20091204T221141-753@post.gmane.org>
References: <loom.20091204T213241-372@post.gmane.org>
	<19c1b8a90912041257g4324f59bq2d6d4db5176effbe@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 167.225.107.17 (Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.5) Gecko/20091105 Fedora/3.5.5-1.fc11 Firefox/3.5.5)
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Questions about gcc target packages
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
X-List-Received-Date: Fri, 04 Dec 2009 21:14:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Khem Raj <raj.khem <at> gmail.com> writes:

> 
> Due to multilib and nof happens to be first. I think we should patch
> gcc to not generate
> nof version if not asked for.
> 
I am not a gcc expert by any stretch of the imagination but if your target has
hard-float support, wouldn't one prefer that over software emulation?

Why not switch the if/else check around to first check for the non nof library
first?

-jeremy






