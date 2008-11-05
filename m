Received: from [206.46.252.46] (helo=vms046pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Kxm7W-0005Qt-4e
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Nov 2008 18:24:42 +0100
Received: from gandalf.denix.org ([71.255.226.167])
	by vms046.mailsrvcs.net (Sun Java System Messaging Server 6.2-6.01
	(built Apr
	3 2006)) with ESMTPA id <0K9V00JBDEY6T9V0@vms046.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	05 Nov 2008 11:22:55 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id DD2F16B83B5; Wed,
	05 Nov 2008 12:22:53 -0500 (EST)
Date: Wed, 05 Nov 2008 12:22:53 -0500
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <69E6C70090A0A14498CC98FAE5E06B6E3CF4EF@hiob.intern.dresearch.de>
To: openembedded-devel@lists.openembedded.org
Message-id: <20081105172253.GA24399@denix.org>
MIME-version: 1.0
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF4EF@hiob.intern.dresearch.de>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: install gcc at target machine?
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
X-List-Received-Date: Wed, 05 Nov 2008 17:24:42 -0000
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: quoted-printable
Content-disposition: inline

On Wed, Nov 05, 2008 at 04:37:51PM +0100, Sledz, Steffen wrote:
> I want to install some development tools (e.g. gcc) on the target machine=
=2E When i just add gcc to IMAGE_INSTALL a few binaries are added to the ta=
rget rootfs, e.g. /usr/bin/arm-angstrom-linux-uclibcgnueabi-gcc. But there =
is nothing like /usr/bin/gcc (no link or binary). And when i try to compile=
 something with this compiler it does not find other needed binaries.  :(
>=20
> # /usr/bin/arm-angstrom-linux-uclibcgnueabi-gcc -v -o hello hello.c
> Using built-in specs.
> Target: arm-angstrom-linux-uclibcgnueabi
> Configured with: /home/sledz/oe/tmp/work/armv5te-angstrom-linux-uclibcgnu=
eabi/gcc-4.2.4-r3/gcc-4.2.4/configure --build=3Di686-linux --host=3Darm-ang=
strom-linux-uclibcgnueabi --target=3Darm-angstrom-linux-uclibcgnueabi --pre=
fix=3D/usr --exec_prefix=3D/usr --bindir=3D/usr/bin --sbindir=3D/usr/sbin -=
-libexecdir=3D/usr/libexec --datadir=3D/usr/share --sysconfdir=3D/etc --sha=
redstatedir=3D/usr/com --localstatedir=3D/var --libdir=3D/usr/lib --include=
dir=3D/usr/include --oldincludedir=3D/usr/include --infodir=3D/usr/share/in=
fo --mandir=3D/usr/share/man --enable-clocale=3Dgeneric --with-gnu-ld --ena=
ble-shared --enable-target-optspace --enable-languages=3Dc,c++ --enable-thr=
eads=3Dposix --enable-multilib --enable-c99 --enable-long-long --enable-sym=
vers=3Dgnu --enable-libstdcxx-pch --program-prefix=3Darm-angstrom-linux-ucl=
ibcgnueabi- --enable-libssp --disable-bootstrap --enable-libgomp --disable-=
libmudflap --with-float=3Dsoft --with-local-prefix=3D/usr/local --with-gxx-=
include-dir=3D/usr/include/c++/4.2.4 --disable-__cxa_atexit --disable-nls
> Thread model: posix
> gcc version 4.2.4
>  cc1 -quiet -v hello.c -quiet -dumpbase hello.c -mfloat-abi=3Dsoft -auxba=
se hello -version -o /tmp/ccHH8Yat.s
> arm-angstrom-linux-uclibcgnueabi-gcc: error trying to exec 'cc1': execvp:=
 No such file or directory
>=20
> Is this a bug or a misconfiguration of mine?

Try task-native-sdk

--=20
Denys


