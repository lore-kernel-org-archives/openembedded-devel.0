Received: from [206.46.252.42] (helo=vms042pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1KwVtJ-0000wz-08
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 Nov 2008 06:52:49 +0100
Received: from gandalf.denix.org ([71.255.247.239])
	by vms042.mailsrvcs.net (Sun Java System Messaging Server 6.2-6.01
	(built Apr
	3 2006)) with ESMTPA id <0K9O000C8W5ACA42@vms042.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sat,
	01 Nov 2008 23:51:11 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 04C506B83A8; Sun,
	02 Nov 2008 00:51:10 -0400 (EDT)
Date: Sun, 02 Nov 2008 00:51:09 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <20081102100819.ebdb2ce9.raster@rasterman.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <20081102045109.GA19437@denix.org>
MIME-version: 1.0
References: <20081031110045.7EF89189333@amethyst.openembedded.net>
	<20081031233753.43f5f09d.raster@rasterman.com>
	<gef9q7$o65$1@ger.gmane.org>
	<20081101085334.8afcd730.raster@rasterman.com>
	<geh3kt$bp7$1@ger.gmane.org> <1225539496.4090.6.camel@utx.utx.cz>
	<20081102100819.ebdb2ce9.raster@rasterman.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [oe-commits] Koen Kooi : initscripts: only run ldconfig	on boot when ld.so. conf is present
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
X-List-Received-Date: Sun, 02 Nov 2008 05:52:49 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, Nov 02, 2008 at 10:08:19AM +1100, Carsten Haitzler wrote:
> at some point when oe was building images, it was unable to run ldconfig using
> qemu natively within the rootfs before converting to a file system image (ext2,
> jffs2, or tar etc.) and thus as a workaround to not being able to do this, it
> was run on boot to populate ld.so.cache. it's possible to do this now via qemu
> before packaging up the rootfs.
> 
> ooh wait. i found out...
> 
> /var/run/ld.so.cache... it's in /var/run ... which is /var/volatile - which is
> ramfs. which means it's not persistent. this... is a problem. well a problem
> for systems that can do persistent storage and modify the fs runtime (and keep
> the changes - ie anything using jffs2).
> 
> perhaps.. this is what needs changing - distros that have non-writable rootfs's
> use ldconfig on boot (makes sense now) and those with, do it at image creating
> time with qemu (and henceforth let the package manager handle it).

I personally wouldn't want to rely on qemu for this. I'm trying to avoid it 
for my setups so I wouldn't need to deal with its weirdness and support my 
developers. And currently I only had to disable locales generation to achive 
that peace of mind...

-- 
Denys


