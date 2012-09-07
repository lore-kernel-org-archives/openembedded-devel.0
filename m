Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T9vBX-0006d0-Gc; Fri, 07 Sep 2012 11:49:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q879aj4a027627;
	Fri, 7 Sep 2012 10:36:45 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25844-09; Fri,  7 Sep 2012 10:36:40 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q879acSK027620
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 7 Sep 2012 10:36:39 +0100
Message-ID: <1347010598.7493.42.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 07 Sep 2012 10:36:38 +0100
In-Reply-To: <20120906233803.GC3487@jama.jama.net>
References: <20120906231235.2BFB3103D3@opal>
	<20120906233803.GC3487@jama.jama.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [OE-core] [oe-commits] Richard Purdie : gcc-cross-initial: Reinstate limits.h generation fix
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
X-List-Received-Date: Fri, 07 Sep 2012 09:49:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-09-07 at 01:38 +0200, Martin Jansa wrote:
> On Thu, Sep 06, 2012 at 11:12:35PM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: 71854f5c8c6850ed37777cad21acc92fdbea32fc
> > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcomm=
it;h=3D71854f5c8c6850ed37777cad21acc92fdbea32fc
> >=20
> > Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Date:   Thu Sep  6 16:50:10 2012 +0100
> >=20
> > gcc-cross-initial: Reinstate limits.h generation fix
> >=20
> > The removal of gcc-cross-intermediate inadvertently reintroduced a
> > problem with the limits.h file being incorrectly/inconsistently
> > generated.
> >=20
> > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3Db0faebd1f07e1616=
004bd19664395932e7c2c48f
> > reverted part of:
> > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3Dc8815d2f21849deb=
9359706f54dc71490773415e
> >=20
> > This reintroduces the protected sysroot ensuring the limits.h file is
> > always correctly generated. To reproduce the bug, build gcc-cross, then
> > rebuild gcc-cross-initial and it will reference the limits.h file from
> > gcc-cross in the sysroot.
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> Not sure if PR bump would help for gcc-cross-initial, but now incremental=
=20
> build fails with:=20
>=20
> | Configuring in arm-oe-linux-gnueabi/libgcc
> | configure: loading cache ./config.cache
> | configure: error: `CC' has changed since the previous run:
> | configure:   former value:  ` /OE/build/tmp-eglibc/work/armv7a-vfp-neon=
-oe-linux-gnueabi/gcc-cross-initial-4.7.1.0+git1+d07e24f4ab59f264d68d218387=
95349faab5dede-r11/gcc-4_7-branch/build.x86_64-linux.arm-oe-linux-gnueabi/.=
/gcc/xgcc -B/OE/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/gcc-=
cross-initial-4.7.1.0+git1+d07e24f4ab59f264d68d21838795349faab5dede-r11/gcc=
-4_7-branch/build.x86_64-linux.arm-oe-linux-gnueabi/./gcc/ -march=3Darmv7-a=
 -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneo=
n -mtune=3Dcortex-a8 -isystem/OE/build/tmp-eglibc/sysroots/tuna/usr/include=
 -B/OE/build/tmp-eglibc/sysroots/x86_64-linux/usr/arm-oe-linux-gnueabi/bin/=
 -B/OE/build/tmp-eglibc/sysroots/x86_64-linux/usr/arm-oe-linux-gnueabi/lib/=
 -isystem /OE/build/tmp-eglibc/sysroots/x86_64-linux/usr/arm-oe-linux-gnuea=
bi/include -isystem /OE/build/tmp-eglibc/sysroots/x86_64-linux/usr/arm-oe-l=
inux-gnueabi/sys-include --sysroot=3D/OE/build/tmp-eglibc/sysroots/tuna  '
> | configure:   current value: ` /OE/build/tmp-eglibc/work/armv7a-vfp-neon=
-oe-linux-gnueabi/gcc-cross-initial-4.7.1.0+git1+d07e24f4ab59f264d68d218387=
95349faab5dede-r11/gcc-4_7-branch/build.x86_64-linux.arm-oe-linux-gnueabi/.=
/gcc/xgcc -B/OE/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/gcc-=
cross-initial-4.7.1.0+git1+d07e24f4ab59f264d68d21838795349faab5dede-r11/gcc=
-4_7-branch/build.x86_64-linux.arm-oe-linux-gnueabi/./gcc/ -march=3Darmv7-a=
 -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneo=
n -mtune=3Dcortex-a8 -isystem/OE/build/tmp-eglibc/sysroots/tuna/usr/include=
 -B/OE/build/tmp-eglibc/sysroots/x86_64-linux/usr/arm-oe-linux-gnueabi/bin/=
 -B/OE/build/tmp-eglibc/sysroots/x86_64-linux/usr/arm-oe-linux-gnueabi/lib/=
 -isystem /OE/build/tmp-eglibc/sysroots/x86_64-linux/usr/arm-oe-linux-gnuea=
bi/include -isystem /OE/build/tmp-eglibc/sysroots/x86_64-linux/usr/arm-oe-l=
inux-gnueabi/sys-include --sysroot=3D/OE/build/tmp-eglibc/work/armv7a-vfp-n=
eon-oe-linux-gnueabi/gcc-cross-initial-4.7.1.0+git1+d07e24f4ab59f264d68d218=
38795349faab5dede-r11/gcc-4_7-branch/build.x86_64-linux.arm-oe-linux-gnueab=
i/tmpsysroot  '
> | configure: error: in `/OE/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linu=
x-gnueabi/gcc-cross-initial-4.7.1.0+git1+d07e24f4ab59f264d68d21838795349faa=
b5dede-r11/gcc-4_7-branch/build.x86_64-linux.arm-oe-linux-gnueabi/arm-oe-li=
nux-gnueabi/libgcc':
> | configure: error: changes in the environment can compromise the build
> | configure: error: run `make distclean' and/or `rm ./config.cache' and s=
tart over
> | make: *** [configure-target-libgcc] Error 1
> | ERROR: oe_runmake failed

It shouldn't do this and there are open bugs about it :/ PR would
probably work around it but we really need to fix the underlying
problem.

Cheers,

Richard



