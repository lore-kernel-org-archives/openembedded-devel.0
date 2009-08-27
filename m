Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MgfxJ-0003Gj-3K
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Aug 2009 16:28:01 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1Mgffp-0003gS-Ab
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Aug 2009 15:09:57 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1Mgffp-0008KP-3d
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Aug 2009 15:09:57 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1251381366.25803.12.camel@hammer.suse.cz>
References: <E1MgPr6-0006GQ-GT@melo.openembedded.org>
	<4A962EA9.8010908@xora.org.uk>
	<1251357326.4215.577.camel@lenovo.internal.reciva.com>
	<1251372751.3420.30.camel@hammer.suse.cz>
	<1251379478.27780.31.camel@mill.internal.reciva.com>
	<1251381366.25803.12.camel@hammer.suse.cz>
Date: Thu, 27 Aug 2009 15:09:53 +0100
Message-Id: <1251382193.27780.49.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
Subject: Re: [oe-commits] Stanislav Brabec : glibc: Install	ld.so.conf, so ldconfig does not complain .
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
X-List-Received-Date: Thu, 27 Aug 2009 14:28:01 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-08-27 at 15:56 +0200, Stanislav Brabec wrote:
> Phil Blundell wrote:
> > On the other hand, if you find yourself obliged to spread the libraries
> > across many directories, and/or if you plan to use hwcap-based
> > searching, installing ldconfig might indeed be a net win.  If you're
> > seeing 15 path lookups for each library load then it sounds like your
> > system falls into this category.
> 
> No, it is not my case. My image is just a plain angstrom-2008.1. These
> 15 directories don't exist. With ld.so.cache I don't see these lookups.
> 
> access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
> open("/var/run/ld.so.cache", O_RDONLY)  = -1 ENOENT (No such file or directory)
> open("/lib/tls/v5l/fast-mult/half/libm.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
> stat64("/lib/tls/v5l/fast-mult/half", 0xbedce3f0) = -1 ENOENT (No such file or directory)

Right, so it appears that your distro is indeed using hwcap-based
library searches; as I said above, this is one of the situations where
ldconfig is a benefit.

p.




