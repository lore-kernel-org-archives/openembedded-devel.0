Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Nexna-0006Uh-Nw
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 22:39:13 +0100
Received: from gandalf.denix.org ([unknown] [71.251.51.225])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KXL00FZ2G0LXTP8@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	09 Feb 2010 15:36:26 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3550614AF60; Tue,
	09 Feb 2010 16:36:21 -0500 (EST)
Date: Tue, 09 Feb 2010 16:36:21 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100209213621.GE20644@denix.org>
References: <1265738131.3731.27.camel@gnutoo-desktop>
MIME-version: 1.0
In-reply-to: <1265738131.3731.27.camel@gnutoo-desktop>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.17
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: gdb sdk
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
X-List-Received-Date: Tue, 09 Feb 2010 21:39:14 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Feb 09, 2010 at 06:55:31PM +0100, GNUtoo wrote:
> hi,in the gdb series here's the sdk:
> 
> ldd .../oetmp/work/i686-armv6-novfp-sdk-oe-linux-gnueabi/gdb-cross-sdk-7.0-r0/image/
> usr/local/shr/arm/bin/arm-oe-linux-gnueabi-gdb
> 	linux-gate.so.1 =>  (0xb80df000)
> 	libncurses.so.5
> => /home/embedded/oetmp_shr-merge_htcdream/staging/i686-linux/usr/lib/libncurses.so.5 (0xb8099000)
> 	libz.so.1
> => /home/embedded/oetmp_shr-merge_htcdream/staging/i686-linux/usr/lib/libz.so.1 (0xb8085000)
> 	libm.so.6 => /lib/libm.so.6 (0xb802c000)
> 	libpython2.6.so.1.0
> => /home/embedded/oetmp_shr-merge_htcdream/staging/i686-linux/usr/lib/libpython2.6.so.1.0 (0xb7eb8000)
> 	libexpat.so.0
> => /home/embedded/oetmp_shr-merge_htcdream/staging/i686-linux/usr/lib/libexpat.so.0 (0xb7e92000)
> 	libc.so.6 => /lib/libc.so.6 (0xb7d58000)
> 	/lib/ld-linux.so.2 (0xb80e0000)
> 	libpthread.so.0 => /lib/libpthread.so.0 (0xb7d40000)
> 	libdl.so.2 => /lib/libdl.so.2 (0xb7d3c000)
> 	libutil.so.1 => /lib/libutil.so.1 (0xb7d38000)
> 
> Note the libexpat...
> I've libexpat.so.1 in all my systems.
> 
> Moreover bitbaking gdb-cross-sdk produced some ipk...and no tarball...

SDK tarball is produced by meta-toolchain/meta-toolchain-* recipes.

-- 
Denys


