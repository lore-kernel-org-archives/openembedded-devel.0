Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NV3Br-0000tf-0A for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 14:23:18 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NV39k-0007ZH-C9
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 14:21:04 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 14:21:04 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 14:21:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 13 Jan 2010 14:20:43 +0100
Message-ID: <hikhba$fcu$1@ger.gmane.org>
References: <alpine.LFD.2.00.1001130657110.487@localhost>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100112 Shredder/3.0.2pre
In-Reply-To: <alpine.LFD.2.00.1001130657110.487@localhost>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: dev branch, bitbake of "mplayer" fails
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
X-List-Received-Date: Wed, 13 Jan 2010 13:23:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 13-01-10 12:59, Robert P. J. Day wrote:
> 
>   i'm starting to think these build errors only ever happen to me.
> :-( once again, on fedora 12, dev branch:

You're the second person to run into a build failure, I'll look into it.

regards,

Koen


> ERROR: function do_compile failed
> ERROR: see log in
> /home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/mplayer-0.0+1.0rc2+svnr30247-r15/temp/log.do_compile.26510
> NOTE: Task failed:
> /home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/mplayer-0.0+1.0rc2+svnr30247-r15/temp/log.do_compile.26510
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of
> /home/rpjday/oe/openembedded/recipes/mplayer/mplayer_svn.bb do_compile
> failed
> 
>   log file:
> 
> NOTE: make
> ccache arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8
> -mfpu=neon -mfloat-abi=softfp -Wundef -Wdisabled-optimization
> -Wno-pointer-sign -Wdeclaration-after-statement -std=gnu99
> -isystem/home/rpjday/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include
> -fexpensive-optimizations  -ftree-vectorize -fomit-frame-pointer -O4
> -ffast-math
> -I/home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/mplayer-0.0+1.0rc2+svnr30247-r15/trunk/libdvdread4
> -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -I.
> -isystem/home/rpjday/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include
> -D_REENTRANT
> -I/home/rpjday/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/freetype2
> -I/home/rpjday/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include
> -I/home/rpjday/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/schroedinger-1.0
> -I/home/rpjday/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/liboil-0.3
> -isystem/home/rpjday/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include
> -c -o libmpcodecs/vf_fspp.o libmpcodecs/vf_fspp.c
> In file included from libmpcodecs/vf_fspp.c:50:
> ./libavutil/internal.h:266:6: warning: "HAVE_EXP2" is not defined
> ./libavutil/internal.h:273:6: warning: "HAVE_EXP2F" is not defined
> ./libavutil/internal.h:294:6: warning: "HAVE_LOG2F" is not defined
> In file included from libmpcodecs/vf_fspp.c:51:
> ./libavutil/internal.h:267: error: static declaration of 'exp2'
> follows non-static declaration
> ./libavutil/internal.h:274: error: static declaration of 'exp2f'
> follows non-static declaration
> ./libavutil/internal.h:295: error: static declaration of 'log2f'
> follows non-static declaration
> make: *** [libmpcodecs/vf_fspp.o] Error 1
> FATAL: oe_runmake failed
> 
> 
> rday
> --
> 
> ========================================================================
> Robert P. J. Day                               Waterloo, Ontario, CANADA
> 
>             Linux Consulting, Training and Kernel Pedantry.
> 
> Web page:                                          http://crashcourse.ca
> Twitter:                                       http://twitter.com/rpjday
> ========================================================================

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLTcirMkyGM64RGpERAjy6AKCNpo6j8xHKfOiTGGLASFjabsjwtQCfd+eK
8yGE8fGobR+YKqd9wz3OJsE=
=VrIl
-----END PGP SIGNATURE-----



