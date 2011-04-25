Received: from mx02.stofanet.dk ([212.10.10.12])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <sgh@sgh.dk>)
	id 1QENMs-0004Su-QL for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 17:06:31 +0200
Received: from 5634f1b4.rev.stofanet.dk ([86.52.241.180] helo=asrock)
	by mx02.stofanet.dk (envelope-from <sgh@sgh.dk>)
	with esmtp id 1QENKW-0004uB-1P
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 17:04:04 +0200
Received: from phoenix.localnet (unknown [192.168.0.226])
	by asrock (Postfix) with ESMTPS id 042848049D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2011 17:04:04 +0200 (CEST)
From: =?iso-8859-1?q?S=F8ren_Holm?= <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Apr 2011 17:04:03 +0200
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic; KDE/4.6.2; i686; ; )
MIME-Version: 1.0
Message-Id: <201104251704.03324.sgh@sgh.dk>
Subject: python-scons-native fails building
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
X-List-Received-Date: Mon, 25 Apr 2011 15:06:31 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi

It seems like python-scons-native does not correctly depend on python-nativ=
e.

After doing "rm -rf tmp" I have tried building python-scons-native (bitbake=
 python-scons-native), but it gives me this :

ERROR: Function 'do_compile' failed (see /home/sgh/oe-new-oe/build-vmc16/tm=
p/work/x86_64-linux/python-scons-native-1.3.0-r1/temp/log.do_compile.26596 =
for further information)
ERROR: Logfile of failure stored in: /home/sgh/oe-new-oe/build-vmc16/tmp/wo=
rk/x86_64-linux/python-scons-native-1.3.0-r1/temp/log.do_compile.26596
Log data follows:
| ERROR: Function 'do_compile' failed (see /home/sgh/oe-new-oe/build-vmc16/=
tmp/work/x86_64-linux/python-scons-native-1.3.0-r1/temp/log.do_compile.2659=
6 for further information)
| + cd /home/sgh/oe-new-oe/build-vmc16/tmp/work/x86_64-linux/python-scons-n=
ative-1.3.0-r1/scons-1.3.0
| + do_compile
| + distutils_do_compile
| + STAGING_INCDIR=3D/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/x86_64-li=
nux/usr/include
| + STAGING_LIBDIR=3D/home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/x86_64-li=
nux/usr/lib
| + BUILD_SYS=3Dx86_64-linux
| + HOST_SYS=3Dx86_64-linux
| + /home/sgh/oe-new-oe/build-vmc16/tmp/sysroots/x86_64-linux/usr/bin/pytho=
n setup.py build
| /home/sgh/oe-new-oe/build-vmc16/tmp/work/x86_64-linux/python-scons-native=
=2D1.3.0-r1/temp/run.do_compile.26596: line 94: /home/sgh/oe-new-oe/build-v=
mc16/tmp/sysroots/x86_64-linux/usr/bin/python: No such file or directory
| + oefatal 'python setup.py build_ext execution failed.'
| + echo FATAL: 'python setup.py build_ext execution failed.'

The weird thing is that " bitbake -e -b recipes/python/python-scons-native_=
1.2.0.bb | grep DEPENDS=3D" gives me this :
  DEPENDS=3D"linux-libc-headers-native python-native"

So python-native should be build, but it isn't. Building python-native prio=
r to python-scons-native works fine.

So it boils down to

## python-scons-native does not build
$ rm -rf tmp
$ bitbake python-scons-native


## python-scons-native builds fine
$ rm -rf tmp
$ bitbake python-native
$ bitbake python-scons-native

Any hints on what might be wrong.

=2D-
S=F8ren Holm


