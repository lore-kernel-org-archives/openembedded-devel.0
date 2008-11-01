Received: from [202.4.237.240] (helo=kirsty.vergenet.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raster@vergenet.net>) id 1KwPbo-0007zr-V9
	for openembedded-devel@openembedded.org; Sun, 02 Nov 2008 00:10:22 +0100
Received: by kirsty.vergenet.net (Postfix, from userid 1001)
	id 7DF9324128; Sun,  2 Nov 2008 10:09:07 +1100 (EST)
Date: Sun, 2 Nov 2008 10:08:19 +1100
From: Carsten Haitzler (The Rasterman) <raster@rasterman.com>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20081102100819.ebdb2ce9.raster@rasterman.com>
In-Reply-To: <1225539496.4090.6.camel@utx.utx.cz>
References: <20081031110045.7EF89189333@amethyst.openembedded.net>
	<20081031233753.43f5f09d.raster@rasterman.com>
	<gef9q7$o65$1@ger.gmane.org>
	<20081101085334.8afcd730.raster@rasterman.com>
	<geh3kt$bp7$1@ger.gmane.org> <1225539496.4090.6.camel@utx.utx.cz>
Organization: You expect me to be organized?
X-Mailer: Sylpheed 2.4.8 (GTK+ 2.12.9; i486-pc-linux-gnu)
X-Pants: on
X-Cluestick: Get jiggy with it!
Mime-Version: 1.0
Cc: openembedded-devel@openembedded.org
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
X-List-Received-Date: Sat, 01 Nov 2008 23:10:23 -0000
X-List-Received-Date: Sat, 01 Nov 2008 23:10:23 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 01 Nov 2008 12:38:16 +0100 Stanislav Brabec <utx@penguin.cz> babbled:

> Koen Kooi wrote:
> 
> > I don't have a strong opinion on that :) People more knowledgable about 
> > ldconfig should chip in on this topic.
> 
> And what about something like:
> if ..../ld.so.cache -ot /usr/lib -o /etc/ld.so.cache -ot /lib ; then
>     /sbin/ldconfig
> fi

you'd need to include all dirs in ld.so.conf in addition... also doesn't cover
me overwriting existing .so's in the lib dir with new ones. :)

really - if you install a lib from source or some tarball - run ldconfig. it's
been this way since the dawn of time. if you don't know this then the only sure
way to "fix" this to work is to reboot which is incredibly stupid. :) imho
running it on boot at all is just a silly idea full-stop. it should be run
immediately post-install/upgrade etc. of any shared lib(s) and they will
immediately be usable. a reboot is a horrible way to trigger that. :)

> Call ldconfig only if ld.so cache is outdated. Fast for users of package
> managers, working for others, fast in subsequent reboots.
> 
> I guess that all package managers use method "fill new file in target
> directory, then replace existing", so timestamp of library directory is
> updated on any change.

yes. as do most source installs using "install" (unlink old file, write new).
BUT if you are using a package manager.. it runs ldconfig for you.. and not on
boot - after install! if it doesn't - it is a fundamentally broken package
manager. source installs do not. as do simple untars of binaries. but if you
are doing this i'd expect you to have enough clue to run ldconfig - and not
just "reboot" to fix it :)

basically - i am trying to dig for a "sane justification" for putting ldconfig
in on boot. the only one i can think of is:

at some point when oe was building images, it was unable to run ldconfig using
qemu natively within the rootfs before converting to a file system image (ext2,
jffs2, or tar etc.) and thus as a workaround to not being able to do this, it
was run on boot to populate ld.so.cache. it's possible to do this now via qemu
before packaging up the rootfs.

ooh wait. i found out...

/var/run/ld.so.cache... it's in /var/run ... which is /var/volatile - which is
ramfs. which means it's not persistent. this... is a problem. well a problem
for systems that can do persistent storage and modify the fs runtime (and keep
the changes - ie anything using jffs2).

perhaps.. this is what needs changing - distros that have non-writable rootfs's
use ldconfig on boot (makes sense now) and those with, do it at image creating
time with qemu (and henceforth let the package manager handle it).

> Note that /etc/ld.so.conf contain also /usr/local/lib (not exists by
> default, but defined by FHS) and /usr/X11R6/lib (obsolete).
> 
> 
> ________________________________________________________________________
> Stanislav Brabec
> http://www.penguin.cz/~utx/zaurus
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 


-- 
------------- Codito, ergo sum - "I code, therefore I am" --------------
The Rasterman (Carsten Haitzler)    raster@rasterman.com



