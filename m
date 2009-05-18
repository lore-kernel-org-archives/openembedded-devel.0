Received: from [85.37.17.113] (helo=smtp-out113.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1M6AAG-0003Ts-7M
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 23:14:28 +0200
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out113.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 18 May 2009 23:07:08 +0200
Received: from FBCMCL01B03.fbc.local ([192.168.69.84]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 18 May 2009 23:06:45 +0200
Received: from [192.168.1.107] ([79.54.10.109]) by FBCMCL01B03.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Mon, 18 May 2009 23:06:45 +0200
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1242654089.9080.111.camel@mill.internal.reciva.com>
References: <20090517212442.6E35A1893E6@amethyst.openembedded.net>
	<4A115165.9070300@kernelconcepts.de>
	<200905181716.24601.khimov@altell.ru>
	<1242654089.9080.111.camel@mill.internal.reciva.com>
Date: Mon, 18 May 2009 23:08:36 +0200
Message-Id: <1242680916.9986.10.camel@port4>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.4 
X-OriginalArrivalTime: 18 May 2009 21:06:45.0614 (UTC)
	FILETIME=[8D1F50E0:01C9D7FC]
Subject: Re: [oe-commits] Roman I Khimov : (e)glibc-package: fix	kernel version passed to qemu
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
X-List-Received-Date: Mon, 18 May 2009 21:14:28 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-05-18 at 14:41 +0100, Phil Blundell wrote:
> n targets where OLDEST_KERNEL isn't set (and hence
> defaults to 2.4.0) but you need a kernel newer than 2.4.0 for correct
> operation.  Presumably all ARM EABI targets fall into that latter
> category, since the TLS syscalls weren't in 2.4.x, and there might be
> some others where glibc's default setting for --enable-kernel is
> something newer than 2.4.0.
> 
> All in all I'd be happier with this change if it enforced a minimum
> kernel version of 2.6.16 (i.e. what it used to be) so that there is no
> possibility of versions going backwards for any target.
> 
> Incidentally, if there is a default value for OLDEST_KERNEL in
> bitbake.conf then checking the retrieved value against None seems
> fairly
> futile since that will never be true.
> 
> p.
> 
I don't mind if the default is 2.6.16 but is there a howto for someone
that has a 2.4(.19-rmk7) kernel ?
Denis.



