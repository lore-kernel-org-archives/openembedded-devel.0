Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MgfFX-0003uM-BF
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Aug 2009 15:42:47 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1Mgey2-0001a4-Cs
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Aug 2009 14:24:43 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1Mgey2-0007yO-7j
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Aug 2009 14:24:42 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1251372751.3420.30.camel@hammer.suse.cz>
References: <E1MgPr6-0006GQ-GT@melo.openembedded.org>
	<4A962EA9.8010908@xora.org.uk>
	<1251357326.4215.577.camel@lenovo.internal.reciva.com>
	<1251372751.3420.30.camel@hammer.suse.cz>
Date: Thu, 27 Aug 2009 14:24:38 +0100
Message-Id: <1251379478.27780.31.camel@mill.internal.reciva.com>
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
X-List-Received-Date: Thu, 27 Aug 2009 13:42:47 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-08-27 at 13:32 +0200, Stanislav Brabec wrote:
> By the way, what is the benefit of not using ldconfig? Strace shows 15
> extra failing library lookups for each library.

It depends on your DISTRO configuration really: some people will be
better off without it and some people won't.

If your library paths are set up right, the dynamic linker will find the
library in the first place it searches and hence there's no need for the
cache file.  In that situation, the extra time taken to stat and map the
cache is just a waste.  This is one of the reasons that the micro
distribution folds out /usr and installs all libraries into /lib.

Also, ldconfig itself is a large-ish binary, especially if it's
statically linked, and represents a waste of scarce flash space on small
systems.

Also also, keeping the cache up to date requires that you either have a
writeable rootfs or that you store the cache in RAM disk; in the latter
case you would need to generate it on every boot, which might be an
unwelcome slowdown.

On the other hand, if you find yourself obliged to spread the libraries
across many directories, and/or if you plan to use hwcap-based
searching, installing ldconfig might indeed be a net win.  If you're
seeing 15 path lookups for each library load then it sounds like your
system falls into this category.

p.




