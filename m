Received: from [202.4.237.240] (helo=kirsty.vergenet.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raster@vergenet.net>) id 1KwWbg-0006pf-Ma
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 Nov 2008 07:38:41 +0100
Received: by kirsty.vergenet.net (Postfix, from userid 1001)
	id B47F4240A0; Sun,  2 Nov 2008 17:37:25 +1100 (EST)
Date: Sun, 2 Nov 2008 17:37:17 +1100
From: Carsten Haitzler (The Rasterman) <raster@rasterman.com>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20081102173717.6d8c3d11.raster@rasterman.com>
In-Reply-To: <20081102045109.GA19437@denix.org>
References: <20081031110045.7EF89189333@amethyst.openembedded.net>
	<20081031233753.43f5f09d.raster@rasterman.com>
	<gef9q7$o65$1@ger.gmane.org>
	<20081101085334.8afcd730.raster@rasterman.com>
	<geh3kt$bp7$1@ger.gmane.org> <1225539496.4090.6.camel@utx.utx.cz>
	<20081102100819.ebdb2ce9.raster@rasterman.com>
	<20081102045109.GA19437@denix.org>
Organization: You expect me to be organized?
X-Mailer: Sylpheed 2.4.8 (GTK+ 2.12.9; i486-pc-linux-gnu)
X-Pants: on
X-Cluestick: Get jiggy with it!
Mime-Version: 1.0
Subject: Re: [oe-commits] Koen Kooi : initscripts: only run ldconfig on boot when ld.so. conf is present
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
X-List-Received-Date: Sun, 02 Nov 2008 06:38:41 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 02 Nov 2008 00:51:09 -0400 Denys Dmytriyenko <denis@denix.org> babbled:

> On Sun, Nov 02, 2008 at 10:08:19AM +1100, Carsten Haitzler wrote:
> > at some point when oe was building images, it was unable to run ldconfig
> > using qemu natively within the rootfs before converting to a file system
> > image (ext2, jffs2, or tar etc.) and thus as a workaround to not being able
> > to do this, it was run on boot to populate ld.so.cache. it's possible to do
> > this now via qemu before packaging up the rootfs.
> > 
> > ooh wait. i found out...
> > 
> > /var/run/ld.so.cache... it's in /var/run ... which is /var/volatile - which
> > is ramfs. which means it's not persistent. this... is a problem. well a
> > problem for systems that can do persistent storage and modify the fs
> > runtime (and keep the changes - ie anything using jffs2).
> > 
> > perhaps.. this is what needs changing - distros that have non-writable
> > rootfs's use ldconfig on boot (makes sense now) and those with, do it at
> > image creating time with qemu (and henceforth let the package manager
> > handle it).
> 
> I personally wouldn't want to rely on qemu for this. I'm trying to avoid it 
> for my setups so I wouldn't need to deal with its weirdness and support my 
> developers. And currently I only had to disable locales generation to achive 
> that peace of mind...

ld.so.cache doesn't NEED to be generated before packing the image together - it
works quite happily without it... :) so same would apply here.


-- 
------------- Codito, ergo sum - "I code, therefore I am" --------------
The Rasterman (Carsten Haitzler)    raster@rasterman.com



