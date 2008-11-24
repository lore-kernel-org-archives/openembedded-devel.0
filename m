Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1L4aW5-0000kF-FP
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Nov 2008 13:26:13 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1L4aTK-0002fc-DO
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Nov 2008 12:23:23 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1L4aTK-000540-Al
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Nov 2008 12:23:22 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20081124114052.GX2475@buddha.tw.openmoko.com>
References: <20081124090648.GU2475@buddha.tw.openmoko.com>
	<1227522398.31396.4.camel@mill.internal.reciva.com>
	<20081124114052.GX2475@buddha.tw.openmoko.com>
Date: Mon, 24 Nov 2008 12:23:21 +0000
Message-Id: <1227529401.31396.26.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: What to do with obsolete kernel modules
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
X-List-Received-Date: Mon, 24 Nov 2008 12:26:13 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2008-11-24 at 19:40 +0800, John Lee wrote:
> but that will only happen if you changed from, say, 2.6.24 to 2.6.26.
> 
> if just the git rev changed such as
> a1e97c611253511ffc2d8c45e3e6d6894fa03fa3 to
> 6e2a723ef54ee2e739c34786981b2c508db803c1
> 
> then opkg wouldn't know about it.

This is a packaging problem.  If you want opkg to be able to
discriminate kernel versions at this level then you need to specify the
version in the Depends.  Like:

Depends: update-modules, kernel-2.6.24 (= 2:2.6.24+git75969+a1e97c611253511ffc2d8c45e3e6d6894fa03fa3-r1.01), kernel-module-x-tables

> my problem looks like this:
> 
> 
> root@om-gta02:~# opkg status kernel-module-xt-physdev
> Package: kernel-module-xt-physdev
> Version: 2:2.6.24+git75969+a1e97c611253511ffc2d8c45e3e6d6894fa03fa3-r1.01
> Depends: update-modules, kernel-2.6.24, kernel-module-x-tables
> Status: install ok installed
> Architecture: neo1973
> Installed-Time: 1226894980
> 
> root@om-gta02:~# opkg status kernel-module-xt-tcpudp
> Package: kernel-module-xt-tcpudp
> Version: 3:2.6.24+gitr1+6e2a723ef54ee2e739c34786981b2c508db803c1-r2
> Depends: update-modules, kernel-2.6.24, kernel-module-x-tables
> Status: install user installed
> Architecture: om-gta02

To be honest I am not exactly sure what you are trying to say here.  I
guess you want kernel-module-xt-physdev uninstalled in favour of
kernel-module-xt-tcpudp, right?

If this is happening because xt-tcpudp is now providing the
functionality that used to be in xt-physdev, and there is never any
reason why anybody would want to install xt-physdev anymore, you should
set kernel-module-xt-tcpudp to Replace: and Conflicts: with
kernel-module-xt-physdev.

If this is more of a distro policy decision, and you just want to switch
from xt-physdev to xt-tcpudp, you could put the Conflicts: in some
appropriate task package instead (presumably the one which used to
depend on kernel-module-xt-physdev and now depends on
kernel-module-xt-tcpudp).

Beyond that, though, it's hard to say much without knowing more of the
background to your issue.  Maybe you could explain what exactly you are
trying to achieve and how this situation came about.

p.




