Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SHdXa-0007a2-DK
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Apr 2012 18:03:34 +0200
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M29009WXTHKX1C0@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	10 Apr 2012 10:53:44 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0272220210; Tue,
	10 Apr 2012 11:53:43 -0400 (EDT)
Date: Tue, 10 Apr 2012 11:53:43 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20120410155343.GH10246@denix.org>
References: <4F80ACD6.8080901@gmail.com> <20120410064131.GA3583@jama.jama.net>
MIME-version: 1.0
In-reply-to: <20120410064131.GA3583@jama.jama.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: meta-linaro and toolchain-layer
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
X-List-Received-Date: Tue, 10 Apr 2012 16:03:34 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 10, 2012 at 08:41:31AM +0200, Martin Jansa wrote:
> On Sat, Apr 07, 2012 at 02:08:38PM -0700, Khem Raj wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> > 
> > Hi,
> > 
> > Ken Werner @ Linaro has created a meta-linaro layer. I have created a
> > github repo of same here https://github.com/kraj/meta-linaro
> > 
> > Moving forward soon gcc 4.7 will land in OE-Core and 4.6 will be
> > more or less retired. In natural progression it would move to
> > toolchain-layer if there are consumers of it.
> > 
> > linaro is also working on gcc-4.7 improvements in  same manner as
> > 4.6  and there could be more tools e.g. gdb binutils etc. that could
> > be useful for armv7+ from that layer.
> > 
> > I would like to propose few things we could do.
> > 
> > Use gcc-4.6 from meta-linaro and retire it from toolchain-layer
> > which means toolchain layer only has gcc-4.5 and eventually
> > This also means that we don't move gcc-4.6 into toolchain-layer
> > when its relegated from OE-Core
> 
> I haven't tried gcc-4.7 on my armv4t machines yet, because I fear
> similar issues like with binutils gold (which are still not resolved),
> because nobody uses armv4t much nowadays :/.
> 
> The same I fear from 4.6 from meta-linaro, but maybe they will be
> responsive as you were, when I reported issues on armv4t with some new
> patch added by linaro..
> 
> So using meta-linaro for gcc-4.6 and gcc-4.7 is fine, but please keep
> current "snapshot" of gcc-4.6 (oe-core+toolchain-layer patches)
> somewhere as safe version before meta-linaro 4.6 is well tested on all
> devices.

FWIW, Linaro only cares about actively supporting Cortex-A8 and up (armv7). 
While they promise to not break any older archs intentionally, they are not 
even testing them regularly. But if something gets accidentally broken, they 
will probably accept the fix...

-- 
Denys


