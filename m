Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eivind@kvedalen.name>) id 1RSIaQ-0005Sg-M3
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Nov 2011 02:22:20 +0100
Received: from homiemail-a74.g.dreamhost.com (caiajhbdcbbj.dreamhost.com
	[208.97.132.119])
	by hapkido.dreamhost.com (Postfix) with ESMTP id 60D041F7BC6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Nov 2011 16:49:40 -0800 (PST)
Received: from homiemail-a74.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a74.g.dreamhost.com (Postfix) with ESMTP id 51DCB67C06D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Nov 2011 16:49:38 -0800 (PST)
Received: from webmail.infeline.org (ahfbbjcaiaae.dreamhost.com [75.119.208.4])
	(Authenticated sender: eivindkv@infeline.org)
	by homiemail-a74.g.dreamhost.com (Postfix) with ESMTPA id 41CC367C014
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Nov 2011 16:49:38 -0800 (PST)
Received: from 84.215.121.103 (proxying for 84.215.121.103)
	(SquirrelMail authenticated user eivindkv@infeline.org)
	by webmail.infeline.org with HTTP; Mon, 21 Nov 2011 01:49:38 +0100
Message-ID: <5ac3cb61232802d3227a23847a5f0e06.squirrel@webmail.infeline.org>
Date: Mon, 21 Nov 2011 01:49:38 +0100
From: "Eivind Kvedalen" <eivind@kvedalen.name>
To: openembedded-devel@lists.openembedded.org
User-Agent: SquirrelMail/1.4.21
MIME-Version: 1.0
Subject: gupnp fails to compile
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
X-List-Received-Date: Mon, 21 Nov 2011 01:22:20 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

When trying to build gupnp, it fails with the output below. It seems to b=
e
related to differing libtool versions (version 2.2.6b mentioned below is
what is installed on my build computer; maybe it gets mixed up with the
one built by oe?) Any ideas on how to fix this?

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 1653 of 2496 (ID: 10,
/home/jobb/oe/openembedded/recipes/upnp/gupnp_0.13.4.bb, do_setscene)
NOTE: package gupnp-0.13.4-r1: task do_setscene: Started
NOTE: package gupnp-0.13.4-r1: task do_setscene: Succeeded
NOTE: Running task 2481 of 2496 (ID: 8,
/home/jobb/oe/openembedded/recipes/upnp/gupnp_0.13.4.bb, do_fetch)
NOTE: package gupnp-0.13.4-r1: task do_fetch: Started
NOTE: package gupnp-0.13.4-r1: task do_fetch: Succeeded
NOTE: Running task 2483 of 2496 (ID: 15,
/home/jobb/oe/openembedded/recipes/upnp/gupnp_0.13.4.bb,
do_distribute_sources)
NOTE: Running task 2482 of 2496 (ID: 0,
/home/jobb/oe/openembedded/recipes/upnp/gupnp_0.13.4.bb, do_unpack)
NOTE: package gupnp-0.13.4-r1: task do_distribute_sources: Started
NOTE: package gupnp-0.13.4-r1: task do_distribute_sources: Succeeded
NOTE: package gupnp-0.13.4-r1: task do_unpack: Started
NOTE: Unpacking ../sources/gupnp-0.13.4.tar.gz to
tmp/work/armv7a-angstrom-linux-gnueabi/gupnp-0.13.4-r1/
NOTE: package gupnp-0.13.4-r1: task do_unpack: Succeeded
NOTE: Running task 2484 of 2496 (ID: 1,
/home/jobb/oe/openembedded/recipes/upnp/gupnp_0.13.4.bb, do_patch)
NOTE: package gupnp-0.13.4-r1: task do_patch: Started
NOTE: package gupnp-0.13.4-r1: task do_patch: Succeeded
NOTE: Running task 2485 of 2496 (ID: 11,
/home/jobb/oe/openembedded/recipes/upnp/gupnp_0.13.4.bb, do_configure)
NOTE: package gupnp-0.13.4-r1: task do_configure: Started
NOTE: package gupnp-0.13.4-r1: task do_configure: Succeeded
NOTE: Running task 2486 of 2496 (ID: 12,
/home/jobb/oe/openembedded/recipes/upnp/gupnp_0.13.4.bb, do_qa_configure)
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/jobb/oe/openembedded/recipes/upnp/gupnp_0.13.4.bb
do_compile failed
NOTE: package gupnp-0.13.4-r1: task do_qa_configure: Started
NOTE: package gupnp-0.13.4-r1: task do_qa_configure: Succeeded
NOTE: Running task 2487 of 2496 (ID: 13,
/home/jobb/oe/openembedded/recipes/upnp/gupnp_0.13.4.bb, do_compile)
ERROR: Task 13 (/home/jobb/oe/openembedded/recipes/upnp/gupnp_0.13.4.bb,
do_compile) failed with 256
ERROR: '/home/jobb/oe/openembedded/recipes/upnp/gupnp_0.13.4.bb' failed
NOTE: package gupnp-0.13.4-r1: task do_compile: Started
ERROR: Function do_compile failed
NOTE: Task failed: ('function do_compile failed',
'/home/jobb/oe/tmp/work/armv7a-angstrom-linux-gnueabi/gupnp-0.13.4-r1/tem=
p/log.do_compile.16556')
ERROR: Logfile of failure stored in:
/home/jobb/oe/tmp/work/armv7a-angstrom-linux-gnueabi/gupnp-0.13.4-r1/temp=
/log.do_compile.16556
Log data follows:
| NOTE: make -j 4
| make  all-recursive
| make[1]: Entering directory
`/home/jobb/oe/tmp/work/armv7a-angstrom-linux-gnueabi/gupnp-0.13.4-r1/gup=
np-0.13.4'
| Making all in libgupnp
| make[2]: Entering directory
`/home/jobb/oe/tmp/work/armv7a-angstrom-linux-gnueabi/gupnp-0.13.4-r1/gup=
np-0.13.4/libgupnp'
| make  all-am
| make[3]: Entering directory
`/home/jobb/oe/tmp/work/armv7a-angstrom-linux-gnueabi/gupnp-0.13.4-r1/gup=
np-0.13.4/libgupnp'
|   CC     http-headers.lo
|   CC     gupnp-context.lo
|   CC     gupnp-context-manager.lo
|   CC     gupnp-unix-context-manager.lo
| libtool: Version mismatch error.  This is libtool 2.4, but the
| libtool: definition of this LT_INIT comes from libtool 2.2.6b.
| libtool: You should recreate aclocal.m4 with macros from libtool 2.4
| libtool: and run autoconf again.
| make[3]: *** [http-headers.lo] Error 63
| make[3]: *** Waiting for unfinished jobs....
| libtool: Version mismatch error.  This is libtool 2.4, but the
| libtool: definition of this LT_INIT comes from libtool 2.2.6b.
| libtool: You should recreate aclocal.m4 with macros from libtool 2.4
| libtool: and run autoconf again.
| make[3]: *** [gupnp-context.lo] Error 63
| libtool: Version mismatch error.  This is libtool 2.4, but the
| libtool: definition of this LT_INIT comes from libtool 2.2.6b.
| libtool: You should recreate aclocal.m4 with macros from libtool 2.4
| libtool: and run autoconf again.
| make[3]: *** [gupnp-context-manager.lo] Error 63
| libtool: Version mismatch error.  This is libtool 2.4, but the
| libtool: definition of this LT_INIT comes from libtool 2.2.6b.
| libtool: You should recreate aclocal.m4 with macros from libtool 2.4
| libtool: and run autoconf again.
| make[3]: *** [gupnp-unix-context-manager.lo] Error 63
| make[3]: Leaving directory
`/home/jobb/oe/tmp/work/armv7a-angstrom-linux-gnueabi/gupnp-0.13.4-r1/gup=
np-0.13.4/libgupnp'
| make[2]: *** [all] Error 2
| make[2]: Leaving directory
`/home/jobb/oe/tmp/work/armv7a-angstrom-linux-gnueabi/gupnp-0.13.4-r1/gup=
np-0.13.4/libgupnp'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory
`/home/jobb/oe/tmp/work/armv7a-angstrom-linux-gnueabi/gupnp-0.13.4-r1/gup=
np-0.13.4'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
| ERROR: Function do_compile failed
NOTE: package gupnp-0.13.4-r1: task do_compile: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/jobb/oe/openembedded/recipes/upnp/gupnp_0.13.4.bb
do_compile failed
ERROR: Task 13 (/home/jobb/oe/openembedded/recipes/upnp/gupnp_0.13.4.bb,
do_compile) failed with 256
ERROR: '/home/jobb/oe/openembedded/recipes/upnp/gupnp_0.13.4.bb' failed
ERROR: '/home/jobb/oe/openembedded/recipes/upnp/gupnp_0.13.4.bb' failed

Build Configuration:
BB_VERSION        =3D "1.10.2"
METADATA_BRANCH   =3D "master"
METADATA_REVISION =3D "be7fc55"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "beagleboard"
DISTRO            =3D "angstrom"
DISTRO_VERSION    =3D "v2011.11"
TARGET_FPU        =3D "hard"

--=20
Eivind




