Received: from [212.227.126.174] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <robert@linuxdevelopment.de>) id 1IiO27-0002wj-DU
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Oct 2007 07:34:59 +0200
Received: from [10.0.0.200] (M8286.m.pppool.de [89.49.130.134])
	by mrelayeu.kundenserver.de (node=mrelayeu0) with ESMTP (Nemesis)
	id 0MKwh2-1IiNYf1RVP-0000ri; Thu, 18 Oct 2007 07:04:34 +0200
Message-ID: <4716E960.5070800@linuxdevelopment.de>
Date: Thu, 18 Oct 2007 07:04:32 +0200
From: =?ISO-8859-15?Q?Robert_W=F6rle?= <robert@linuxdevelopment.de>
User-Agent: Thunderbird 2.0.0.6 (X11/20070801)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.3
X-Provags-ID: V01U2FsdGVkX1/+STBD41suAVU529QrNuha/1am03Gv9oowsGo
	dlVph8PBmQ1hDu2fap8gfClGBPj+ec3O27HkJU9X3zV97P5XfR
	05pTYxle87e9ZfweMpw4QDYUGfI9uR4tkcRb7M0RYI=
Subject: building qemu on x86_64 host for a ixp4xx target
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Oct 2007 05:34:59 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Dear List

I am failing to get qemu-native build on my x86_64 host for a arm ixp4xx
target.
Building qemu-native for a i686 target worked fine.

it fails like this:
make -C i386-linux-user all
| make[1]: Entering directory
`/home/bob/oe/ixp425/tmp/work/x86_64-linux/qemu-native-0.9.0+cvs20070613-r5/qemu/i386-linux-user'
| make[1]: Nothing to be done for `all'.
| make[1]: Leaving directory
`/home/bob/oe/ixp425/tmp/work/x86_64-linux/qemu-native-0.9.0+cvs20070613-r5/qemu/i386-linux-user'
| make -C arm-linux-user all
| make[1]: Entering directory
`/home/bob/oe/ixp425/tmp/work/x86_64-linux/qemu-native-0.9.0+cvs20070613-r5/qemu/arm-linux-user'
| make[1]: Nothing to be done for `all'.
| make[1]: Leaving directory
`/home/bob/oe/ixp425/tmp/work/x86_64-linux/qemu-native-0.9.0+cvs20070613-r5/qemu/arm-linux-user'
| make -C armeb-linux-user all
| make[1]: Entering directory
`/home/bob/oe/ixp425/tmp/work/x86_64-linux/qemu-native-0.9.0+cvs20070613-r5/qemu/armeb-linux-user'
| make[1]: Nothing to be done for `all'.
| make[1]: Leaving directory
`/home/bob/oe/ixp425/tmp/work/x86_64-linux/qemu-native-0.9.0+cvs20070613-r5/qemu/armeb-linux-user'
| make -C sparc-linux-user all
| make[1]: Entering directory
`/home/bob/oe/ixp425/tmp/work/x86_64-linux/qemu-native-0.9.0+cvs20070613-r5/qemu/sparc-linux-user'
| gcc -isystem/home/bob/oe/ixp425/tmp/staging/x86_64-linux/include -Os
-Wall -O2 -g -fno-strict-aliasing -I. -I..
-I/home/bob/oe/ixp425/tmp/work/x86_64-linux/qemu-native-0.9.0+cvs20070613-r5/qemu/target-sparc
-I/home/bob/oe/ixp425/tmp/work/x86_64-linux/qemu-native-0.9.0+cvs20070613-r5/qemu
-I/home/bob/oe/ixp425/tmp/work/x86_64-linux/qemu-native-0.9.0+cvs20070613-r5/qemu/linux-user
-I/home/bob/oe/ixp425/tmp/work/x86_64-linux/qemu-native-0.9.0+cvs20070613-r5/qemu/linux-user/sparc
-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
-I/home/bob/oe/ixp425/tmp/work/x86_64-linux/qemu-native-0.9.0+cvs20070613-r5/qemu/fpu
-I/home/bob/oe/ixp425/tmp/work/x86_64-linux/qemu-native-0.9.0+cvs20070613-r5/qemu/slirp
   -c -o translate-op.o
/home/bob/oe/ixp425/tmp/work/x86_64-linux/qemu-native-0.9.0+cvs20070613-r5/qemu/translate-op.c
|
/home/bob/oe/ixp425/tmp/work/x86_64-linux/qemu-native-0.9.0+cvs20070613-r5/qemu/translate-op.c:
In function 'dyngen_code':
|
/home/bob/oe/ixp425/tmp/work/x86_64-linux/qemu-native-0.9.0+cvs20070613-r5/qemu/translate-op.c:37:
error: expected declaration or statement at end of input
|
/home/bob/oe/ixp425/tmp/work/x86_64-linux/qemu-native-0.9.0+cvs20070613-r5/qemu/translate-op.c:37:
error: expected declaration or statement at end of input
|
/home/bob/oe/ixp425/tmp/work/x86_64-linux/qemu-native-0.9.0+cvs20070613-r5/qemu/translate-op.c:37:
error: expected declaration or statement at end of input
| make[1]: *** [translate-op.o] Error 1
| make[1]: Leaving directory
`/home/bob/oe/ixp425/tmp/work/x86_64-linux/qemu-native-0.9.0+cvs20070613-r5/qemu/sparc-linux-user'
| make: *** [subdir-sparc-linux-user] Error 2
| + die 'oe_runmake failed'
| + oefatal 'oe_runmake failed'
| + echo FATAL: 'oe_runmake failed'
| FATAL: oe_runmake failed
| + exit 1
NOTE: Task failed:
/home/bob/oe/ixp425/tmp/work/x86_64-linux/qemu-native-0.9.0+cvs20070613-r5/temp/log.do_compile.16092
NOTE: package qemu-native-0.9.0+cvs20070613-r5: task do_compile: failed
ERROR: TaskFailed event exception, aborting


should i hack-fix the translate-op.c:37 ??? or is there a cleaner way to
help here ?

Regards rob_w


