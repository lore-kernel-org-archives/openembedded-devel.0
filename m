Received: from mail-da0-f41.google.com ([209.85.210.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFk0G-0006Hb-Fk
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 12:38:05 +0100
Received: by mail-da0-f41.google.com with SMTP id j17so375435dan.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 04:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=Gwvkp5CUbZpUl7qE1jdRHLtmIn/y30GXKMh8IGE2l3M=;
	b=banDcb3YBiQ1tkFdXl6F1Hq3nKxvT0YfxJ7Z7yXHmn7CgTwwoZukAyq42S5rexgH+J
	08amS/VnBxVHr2PUubXMYRMnK1ppU9l5dzT6pCu6kQXmszdSQb9C1FLWOZsofra7Rz5A
	8Enck2fYY2xPHZnxk0ZzS6Fb5pqOYCUNELKpw2ZNXQB3e2YGcIu4rXIk1sIHmFIWXgig
	/ZUzZgdFjX35JP1i28/b6wfMcVeZRtM9wgopXIKFQXS6T8jl8WiJPVf5ocHb4YxHpVfg
	2DKwuA8F0l5AizVzqhKugEFXrCYUyHt2kuLGzphbFI9Yk1PryMCMMnRz5pb4oYWwxmff
	lCag==
X-Received: by 10.68.65.226 with SMTP id a2mr6206537pbt.92.1363173670837;
	Wed, 13 Mar 2013 04:21:10 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id xr3sm29157547pbc.46.2013.03.13.04.21.08
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 04:21:09 -0700 (PDT)
Date: Wed, 13 Mar 2013 12:21:01 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130313112101.GD3260@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [meta-networking] xl2tpd: does not work with new kernel headers
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
X-List-Received-Date: Wed, 13 Mar 2013 11:38:07 -0000
X-Groupsio-MsgNum: 43515
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a2FkP9tdjPU2nyhF"
Content-Disposition: inline

--a2FkP9tdjPU2nyhF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

xl2tpd is now failing, probably because of kernel headers upgrade

| arm-oe-linux-gnueabi-gcc  -march=3Darmv5te  -marm -mthumb-interwork   --s=
ysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qe=
muarm -O2 -pipe -g -feliminate-unused-debug-types -DLINUX -DDEBUG_PPPD -DTR=
UST_PPPD_TO_DIE -O2 -DSANITY -DLINUX -I/home/jenkins/oe/shr-core-branches/s=
hr-core/tmp-eglibc/sysroots/qemuarm/usr/src/kernel/include/ -DUSE_KERNEL -D=
IP_ALLOCATION -o avpsend.o -c avpsend.c
| In file included from /home/jenkins/oe/shr-core-branches/shr-core/tmp-egl=
ibc/sysroots/qemuarm/usr/src/kernel/include/linux/kernel.h:6:0,
|                  from /home/jenkins/oe/shr-core-branches/shr-core/tmp-egl=
ibc/sysroots/qemuarm/usr/src/kernel/include/linux/skbuff.h:17,
|                  from /home/jenkins/oe/shr-core-branches/shr-core/tmp-egl=
ibc/sysroots/qemuarm/usr/src/kernel/include/linux/if_ether.h:23,
|                  from l2tp.h:240,
|                  from pty.c:28:
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/u=
sr/src/kernel/include/linux/linkage.h:5:25: fatal error: asm/linkage.h: No =
such file or directory
| compilation terminated.
| In file included from /home/jenkins/oe/shr-core-branches/shr-core/tmp-egl=
ibc/sysroots/qemuarm/usr/src/kernel/include/linux/kernel.h:6:0,
|                  from /home/jenkins/oe/shr-core-branches/shr-core/tmp-egl=
ibc/sysroots/qemuarm/usr/src/kernel/include/linux/skbuff.h:17,
|                  from /home/jenkins/oe/shr-core-branches/shr-core/tmp-egl=
ibc/sysroots/qemuarm/usr/src/kernel/include/linux/if_ether.h:23,
|                  from l2tp.h:240,
|                  from control.c:23:
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/u=
sr/src/kernel/include/linux/linkage.h:5:25: fatal error: asm/linkage.h: No =
such file or directory
| compilation terminated.
| make: *** [control.o] Error 1
| make: *** Waiting for unfinished jobs....
| In file included from /home/jenkins/oe/shr-core-branches/shr-core/tmp-egl=
ibc/sysroots/qemuarm/usr/src/kernel/include/linux/kernel.h:6:0,
|                  from /home/jenkins/oe/shr-core-branches/shr-core/tmp-egl=
ibc/sysroots/qemuarm/usr/src/kernel/include/linux/skbuff.h:17,
|                  from /home/jenkins/oe/shr-core-branches/shr-core/tmp-egl=
ibc/sysroots/qemuarm/usr/src/kernel/include/linux/if_ether.h:23,
|                  from l2tp.h:240,
|                  from misc.c:30:
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/u=
sr/src/kernel/include/linux/linkage.h:5:25: fatal error: asm/linkage.h: No =
such file or directory
| compilation terminated.
| make: *** [misc.o] Error 1
| make: *** [pty.o] Error 1
| In file included from /home/jenkins/oe/shr-core-branches/shr-core/tmp-egl=
ibc/sysroots/qemuarm/usr/src/kernel/include/linux/kernel.h:6:0,
|                  from /home/jenkins/oe/shr-core-branches/shr-core/tmp-egl=
ibc/sysroots/qemuarm/usr/src/kernel/include/linux/skbuff.h:17,
|                  from /home/jenkins/oe/shr-core-branches/shr-core/tmp-egl=
ibc/sysroots/qemuarm/usr/src/kernel/include/linux/if_ether.h:23,
|                  from l2tp.h:240,
|                  from xl2tpd.c:53:
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/u=
sr/src/kernel/include/linux/linkage.h:5:25: fatal error: asm/linkage.h: No =
such file or directory
| compilation terminated.
| make: *** [xl2tpd.o] Error 1
| In file included from /home/jenkins/oe/shr-core-branches/shr-core/tmp-egl=
ibc/sysroots/qemuarm/usr/src/kernel/include/linux/kernel.h:6:0,
|                  from /home/jenkins/oe/shr-core-branches/shr-core/tmp-egl=
ibc/sysroots/qemuarm/usr/src/kernel/include/linux/skbuff.h:17,
|                  from /home/jenkins/oe/shr-core-branches/shr-core/tmp-egl=
ibc/sysroots/qemuarm/usr/src/kernel/include/linux/if_ether.h:23,
|                  from l2tp.h:240,
|                  from avp.c:19:
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/u=
sr/src/kernel/include/linux/linkage.h:5:25: fatal error: asm/linkage.h: No =
such file or directory
| compilation terminated.
| In file included from /home/jenkins/oe/shr-core-branches/shr-core/tmp-egl=
ibc/sysroots/qemuarm/usr/src/kernel/include/linux/kernel.h:6:0,
|                  from /home/jenkins/oe/shr-core-branches/shr-core/tmp-egl=
ibc/sysroots/qemuarm/usr/src/kernel/include/linux/skbuff.h:17,
|                  from /home/jenkins/oe/shr-core-branches/shr-core/tmp-egl=
ibc/sysroots/qemuarm/usr/src/kernel/include/linux/if_ether.h:23,
|                  from l2tp.h:240,
|                  from call.c:27:
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/u=
sr/src/kernel/include/linux/linkage.h:5:25: fatal error: asm/linkage.h: No =
such file or directory
| compilation terminated.
| make: *** [avp.o] Error 1
| make: *** [call.o] Error 1
| In file included from /home/jenkins/oe/shr-core-branches/shr-core/tmp-egl=
ibc/sysroots/qemuarm/usr/src/kernel/include/linux/kernel.h:6:0,
|                  from /home/jenkins/oe/shr-core-branches/shr-core/tmp-egl=
ibc/sysroots/qemuarm/usr/src/kernel/include/linux/skbuff.h:17,
|                  from /home/jenkins/oe/shr-core-branches/shr-core/tmp-egl=
ibc/sysroots/qemuarm/usr/src/kernel/include/linux/if_ether.h:23,
|                  from l2tp.h:240,
|                  from avpsend.c:19:
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/u=
sr/src/kernel/include/linux/linkage.h:5:25: fatal error: asm/linkage.h: No =
such file or directory
| compilation terminated.
| make: *** [avpsend.o] Error 1
| In file included from /home/jenkins/oe/shr-core-branches/shr-core/tmp-egl=
ibc/sysroots/qemuarm/usr/src/kernel/include/linux/kernel.h:6:0,
|                  from /home/jenkins/oe/shr-core-branches/shr-core/tmp-egl=
ibc/sysroots/qemuarm/usr/src/kernel/include/linux/skbuff.h:17,
|                  from /home/jenkins/oe/shr-core-branches/shr-core/tmp-egl=
ibc/sysroots/qemuarm/usr/src/kernel/include/linux/if_ether.h:23,
|                  from l2tp.h:240,
|                  from network.c:28:
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/u=
sr/src/kernel/include/linux/linkage.h:5:25: fatal error: asm/linkage.h: No =
such file or directory
| compilation terminated.
| make: *** [network.o] Error 1
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (see /home/jenkins/oe/shr-core-branche=
s/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/xl2tpd/1.3.1-r0.0/temp/=
log.do_compile.28615 for further information)
NOTE: recipe xl2tpd-1.3.1-r0.0: task do_compile: Failed
ERROR: Task 3045 (/home/jenkins/oe/shr-core-branches/shr-core/meta-openembe=
dded/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.1.bb, do_compile) =
failed with exit code '1'

Whole log:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30312_110444.log
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--a2FkP9tdjPU2nyhF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFAYR0ACgkQN1Ujt2V2gBybQwCeKbE5n0sxH/BAQkRJi1CIOB3k
g30AoKUR4+vdiUvn6qpkHS8QuN9CPxSU
=rQ6E
-----END PGP SIGNATURE-----

--a2FkP9tdjPU2nyhF--
