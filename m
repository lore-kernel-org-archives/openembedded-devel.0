Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>)
	id 1Kq571-0007yi-88; Wed, 15 Oct 2008 14:04:24 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1Kq51r-0001sx-JQ; Wed, 15 Oct 2008 12:59:03 +0100
Received: from mill.internal.reciva.com ([192.168.106.87])
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>)
	id 1Kq51o-0003oh-E2; Wed, 15 Oct 2008 12:59:00 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1224070299.5189.62.camel@ted>
References: <200810151022.38477.zecke@selfish.org>
	<c384c5ea0810150343i1ad5429aubf37b9bdef2165a6@mail.gmail.com>
	<gd4j24$lq3$1@ger.gmane.org>  <1224070299.5189.62.camel@ted>
Date: Wed, 15 Oct 2008 12:58:59 +0100
Message-Id: <1224071940.30790.45.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC] Enable --hash-style=both for all recent gcc4 targets
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
X-List-Received-Date: Wed, 15 Oct 2008 12:04:24 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2008-10-15 at 12:31 +0100, Richard Purdie wrote:
> I think what Leon is referring to is where different hardware
> capabilities are checked. In Poky I ended up disabling this as at least
> on ARM there were an insane number of different combinations of paths
> being checked for. The patch I added to disable it was:

Right, the default set of hwcaps is probably a bit more inclusive than
most folks want.  I don't think this issue is specific to ARM though
it's possible that arm does have it worse than some other
architectures.  

As with so many things it is basically a DISTRO decision which hwcaps to
include in the list for ld.so.  I suppose the ideal thing would be to
have a variable LD_SO_CONSIDER_HWCAPS or some such, which could be set
by DISTRO.conf to specify which ones should be included.  For the
majority of single-target-platform DISTROs the answer is obviously going
to be none.

Another similar issue for embedded-type DISTROs to consider is
minimising the length of the linker search path by, for example,
eliminating /usr/lib in favour of putting everything in /lib.  (The same
goes for /usr/bin and /bin, of course.)  And of course, not putting
anything in /etc/ld.so.conf unless it's necessary: my openmoko install
seems to have /usr/X11R6/lib and /usr/local/lib listed in that file even
though neither directory actually exists in the filesystem, which will
be causing another 2*N useless path lookups for every library.

Plus of course, PACKAGE_SNAP_LIB_SYMLINKS will eliminate another source
of indirection and hence another dentry name lookup.

p.




