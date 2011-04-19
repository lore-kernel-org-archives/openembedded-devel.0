Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <patda293@student.liu.se>) id 1QCKPs-0006Xi-4Y
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 01:33:08 +0200
Received: by ewy5 with SMTP id 5so60387ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2011 16:30:46 -0700 (PDT)
Received: by 10.213.33.83 with SMTP id g19mr35055ebd.17.1303255845980;
	Tue, 19 Apr 2011 16:30:45 -0700 (PDT)
Received: from risca-hp.localnet (h241n2-n-a31.ias.bredband.telia.com
	[217.208.43.241])
	by mx.google.com with ESMTPS id x54sm257113eeh.5.2011.04.19.16.30.44
	(version=SSLv3 cipher=OTHER); Tue, 19 Apr 2011 16:30:45 -0700 (PDT)
From: "Patrik =?iso-8859-1?q?Dahlstr=F6m?= (student)" <patda293@student.liu.se>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Apr 2011 01:30:49 +0200
User-Agent: KMail/1.13.6 (Linux/2.6.37-sabayon; KDE/4.6.2; x86_64; ; )
MIME-Version: 1.0
Message-Id: <201104200130.49444.patda293@student.liu.se>
Subject: libnl1-1.1-r5 static libs leads to syntax errors in nmap-3.81
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
X-List-Received-Date: Tue, 19 Apr 2011 23:33:08 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

If libnl1-1.1-r5 is built with only static libs, the configure script of=20
nmap-3.81 will fail to find a usable pcap and fall back on its own=20
implementation (libpcap-possiblymodified). The configure script of that=20
implementation suffers from syntax errors that I never managed to fix.
Here is a excerpt from config.log of nmap-3.81:

=2E..
configure:4570: arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dco=
rtex-a8=20
=2Dmfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --
sysroot=3D/home/bitbake/build/tmp_beagleboard/sysroots/armv7a-angstrom-linu=
x-
gnueabi -o conftest -fexpensive-optimizations -fomit-frame-pointer -frename-
registers -O2 -ggdb2 -Drecvfrom6_t=3Dsocklen_t -
L/home/bitbake/build/tmp_beagleboard/sysroots/armv7a-angstrom-linux-
gnueabi/usr/lib/../lib -Wl,-O1 -Wl,--hash-style=3Dgnu conftest.c -lpcap  -l=
m =20
>&5
/home/bitbake/build/tmp_beagleboard/sysroots/x86_64-
linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-
angstrom-linux-gnueabi/bin/ld: warning: libnl.so.1, needed by=20
/home/bitbake/build/tmp_beagleboard/sysroots/armv7a-angstrom-linux-
gnueabi/usr/lib/../lib/libpcap.so, not found (try using -rpath or -rpath-li=
nk)
=2E..

If I removed build.only.static.lib.patch from the libnl1-1.1 recipe, the=20
missing libnl.so.1.1 shared lib would be built and installed and successive=
ly=20
nmap-3.81 would build and install fine.

=2D-=20
MvH / with best regards
Patrik Dahlstr=F6m

"Every animal, except man, knows that the fundamental meaning of life is to=
=20
enjoy it" --Samuel Butler

()  ascii ribbon campaign - against html e-mail=20
/\  www.asciiribbon.org   - against proprietary attachments


