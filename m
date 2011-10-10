Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1RDNbg-0007P0-Dv
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Oct 2011 23:41:56 +0200
Received: from gandalf.denix.org ([unknown] [71.191.138.237])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LSV009ARDBZKPD1@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	10 Oct 2011 16:36:04 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 475FD14AF5D; Mon,
	10 Oct 2011 17:35:59 -0400 (EDT)
Date: Mon, 10 Oct 2011 17:35:59 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20111010213559.GI3125@denix.org>
References: <4E936282.3030505@telia.com>
MIME-version: 1.0
In-reply-to: <4E936282.3030505@telia.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: psyco-dist not supported on 64 bit Linux
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
X-List-Received-Date: Mon, 10 Oct 2011 21:41:56 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Oct 10, 2011 at 11:24:18PM +0200, Ulf Samuelsson wrote:
> psyco-dist will not run on a 64 bit linux.
> The guys behind psyco-dist recommends the use of PyPy
>
> What is the recommendation for 64 bit linux?
>
> Just run without JIT?
> Don't run on a 64 bit linux?
> Anything else?

Yes, not supporting 64-bit hosts is one of the known limitations of psyco. 
Being stuck with Python 2.6 is another limitation.

But, latest bitbake appears to be quite fast even w/o using psyco these days. 
Especially with parallel parsing on multiple cores...

-- 
Denys


