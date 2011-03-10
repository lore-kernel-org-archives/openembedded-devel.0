Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koansoftware@gmail.com>) id 1PxhjI-0002CQ-DZ
	for Openembedded-devel@lists.openembedded.org;
	Thu, 10 Mar 2011 16:25:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id C3A842C810
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2011 15:21:10 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SLxOiwMC1VIa
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2011 15:21:06 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id 1E7FA2C7D7
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2011 15:21:05 +0000 (UTC)
Message-ID: <4D78ECBF.7010907@gmail.com>
Date: Thu, 10 Mar 2011 16:22:39 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini
User-Agent: Thunderbird 2.0.0.24 (X11/20101027)
MIME-Version: 1.0
To: Openembedded-devel@lists.openembedded.org
Subject: help2man fails due to configure: error: perl module Locale::gettext required
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
X-List-Received-Date: Thu, 10 Mar 2011 15:25:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello
I am building Angstrom on a Debian Lenny machine the latest OE main tree
but I am facing to the following error.
How can I solve it?
Any hint would be appreciated.
TIA


$ bitbake meta-toolchain


Build Configuration:
BB_VERSION        =3D "1.10.2"
METADATA_BRANCH   =3D "master"
METADATA_REVISION =3D "40a8506"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "ronetix-pm9263"
DISTRO            =3D "angstrom"
DISTRO_VERSION    =3D "2010.7-test-20110310"
TARGET_FPU        =3D "soft"

WARNING: oestats: exception <class 'urllib2.HTTPError'>, value HTTP
Error 404: Not Found
WARNING: oestats: error starting build, disabling stats
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
...
NOTE: Running task 273 of 1027 (ID: 541,
/home/koan/devel/openembedded/recipes/gcc/gcc-cross-sdk_4.3.3.bb,
do_setscene)
ERROR: TaskFailed event exception, aborting
ERROR: Build of
virtual:native:/home/koan/devel/openembedded/recipes/help2man/help2man_1.=
38.2.bb
do_configure failed
NOTE: package gcc-cross-sdk-4.3.3-r23.4: task do_setscene: Started
NOTE: package gcc-cross-sdk-4.3.3-r23.4: task do_setscene: Succeeded
ERROR: Task 320
(virtual:native:/home/koan/devel/openembedded/recipes/help2man/help2man_1=
.38.2.bb,
do_configure) failed with 256
ERROR: Function do_configure failed
NOTE: Task failed: ('function do_configure failed',
'/home/koan/devel/build/angstrom/tmp/work/x86_64-linux/help2man-native-1.=
38.2-r2/temp/log.do_configure.9893')
ERROR: Logfile of failure stored in:
/home/koan/devel/build/angstrom/tmp/work/x86_64-linux/help2man-native-1.3=
8.2-r2/temp/log.do_configure.9893
Log data follows:
| configure: WARNING: unrecognized options: --enable-largefile,
--enable-ipv6
| checking for perl... perl
| checking for module Locale::gettext... no
| checking for msgfmt... /usr/bin/msgfmt
| checking for x86_64-linux-gcc... gcc
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... no
| checking for suffix of object files... o
| checking whether we are using the GNU C compiler... yes
| checking whether gcc accepts -g... yes
| checking for gcc option to accept ISO C89... none needed
| checking for library containing dlsym... -ldl
| checking for library containing bindtextdomain... none required
| configure: error: perl module Locale::gettext required
| ERROR: Function do_configure failed
NOTE: package help2man-native-1.38.2-r2: task do_configure: Failed
ERROR: TaskFailed event exception, aborting
NOTE: Running task 274 of 1027 (ID: 539,
/home/koan/devel/openembedded/recipes/gcc/gcc-cross-sdk_4.3.3.bb, do_fetc=
h)
ERROR: Build of
virtual:native:/home/koan/devel/openembedded/recipes/help2man/help2man_1.=
38.2.bb
do_configure failed
ERROR: Task 320
(virtual:native:/home/koan/devel/openembedded/recipes/help2man/help2man_1=
.38.2.bb,
do_configure) failed with 256
NOTE: package gcc-cross-sdk-4.3.3-r23.4: task do_fetch: Started
Waiting for 1 active tasks to finish:
1: gcc-cross-sdk-4.3.3-r23.4 do_fetch (pid 10169)
ERROR:
'virtual:native:/home/koan/devel/openembedded/recipes/help2man/help2man_1=
.38.2.bb'
failed
NOTE: package gcc-cross-sdk-4.3.3-r23.4: task do_fetch: Succeeded
ERROR:
'virtual:native:/home/koan/devel/openembedded/recipes/help2man/help2man_1=
.38.2.bb'
failed
ERROR:
'virtual:native:/home/koan/devel/openembedded/recipes/help2man/help2man_1=
.38.2.bb'
failed



Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
--
Marco Cavallini | KOAN sas | Bergamo - Italia



