Return-Path: <modsystems@prodigy.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B523EC4332F
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 16:06:57 +0000 (UTC)
Subject: build error for icedtea7-native, not finding build/linux-amd64/gensrc 
To: openembedded-devel@lists.openembedded.org
From: modsystems@prodigy.net
X-Originating-Location: Inglewood, California, US (23.119.142.91)
X-Originating-Platform: Linux Firefox 107
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 08 Dec 2022 08:06:56 -0800
Message-ID: <z22U.1670515616656619837.NEet@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="XgZT1kVVeGX65wDQ0gr8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Dec 2022 16:06:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99997

--XgZT1kVVeGX65wDQ0gr8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello

build error for icedtea7-native, not finding build/linux-amd64/gensrc

make[6]: *** [../../../common/Library.gmk:225: /home/amodster/Yocto/poky-rp=
i3/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/bui=
ld/openjdk.build-boot/lib/amd64/libj2pcsc.so] Error 1
make[6]: Leaving directory '/home/amodster/Yocto/poky-rpi3/build/tmp/work/x=
86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot/jdk=
/make/sun/security/smartcardio'

More info when running make from command line
~/Yocto/poky-rpi3/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/ic=
edtea-2.1.3/build/openjdk-boot/jdk/make/sun/security/smartcardio$ make
# Java sources to be compiled: (listed in file ../../../../build/linux-amd6=
4/tmp/sun/sun.security.smartcardio/j2pcsc/.classes.list)
../../../../src/share/classes/sun/security/smartcardio/CardImpl.java
../../../../src/share/classes/sun/security/smartcardio/ChannelImpl.java
../../../../src/share/classes/sun/security/smartcardio/PCSCException.java
../../../../src/share/classes/sun/security/smartcardio/PCSC.java
../../../../src/share/classes/sun/security/smartcardio/PCSCTerminals.java
../../../../src/share/classes/sun/security/smartcardio/SunPCSC.java
../../../../src/share/classes/sun/security/smartcardio/TerminalImpl.java
../../../../src/solaris/classes/sun/security/smartcardio/PlatformPCSC.java
# Running javac:
-sourcepath ../../../../build/linux-amd64/gensrc:../../../../src/solaris/cl=
asses:../../../../src/share/classes -bootclasspath ../../../../build/linux-=
amd64/classes: -d ../../../../build/linux-amd64/classes @../../../../build/=
linux-amd64/tmp/sun/sun.security.smartcardio/j2pcsc/.classes.list
/bin/sh: 7: -sourcepath: not found
make: *** [../../../../make/common/Rules.gmk:236: .compile.classlist] Error=
 127

I am checking if these exist
-sourcepath ../../../../build/linux-amd64/gensrc:../../../../src/solaris/cl=
asses:../../../../src/share/classes
ls ../../../../build/linux-amd64/gensrc ---this is not there---
ls ../../../../src/solaris/classes
ls ../../../../src/share/classes

Host: Ubuntu 22.04
Target: RPi3B+
Build System: Yocto / bitbake

--XgZT1kVVeGX65wDQ0gr8
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello<br /><br />build error for icedtea7-native, not finding build/linux-a=
md64/gensrc<br /><br />make[6]: *** [../../../common/Library.gmk:225: /home=
/amodster/Yocto/poky-rpi3/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3=
-r1.0/icedtea-2.1.3/build/openjdk.build-boot/lib/amd64/libj2pcsc.so] Error =
1<br />make[6]: Leaving directory '/home/amodster/Yocto/poky-rpi3/build/tmp=
/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-b=
oot/jdk/make/sun/security/smartcardio'<br /><br />More info when running ma=
ke from command line<br />~/Yocto/poky-rpi3/build/tmp/work/x86_64-linux/ice=
dtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot/jdk/make/sun/secur=
ity/smartcardio$ make<br /># Java sources to be compiled: (listed in file .=
./../../../build/linux-amd64/tmp/sun/sun.security.smartcardio/j2pcsc/.class=
es.list)<br />../../../../src/share/classes/sun/security/smartcardio/CardIm=
pl.java<br />../../../../src/share/classes/sun/security/smartcardio/Channel=
Impl.java<br />../../../../src/share/classes/sun/security/smartcardio/PCSCE=
xception.java<br />../../../../src/share/classes/sun/security/smartcardio/P=
CSC.java<br />../../../../src/share/classes/sun/security/smartcardio/PCSCTe=
rminals.java<br />../../../../src/share/classes/sun/security/smartcardio/Su=
nPCSC.java<br />../../../../src/share/classes/sun/security/smartcardio/Term=
inalImpl.java<br />../../../../src/solaris/classes/sun/security/smartcardio=
/PlatformPCSC.java<br /># Running javac:<br />-sourcepath ../../../../build=
/linux-amd64/gensrc:../../../../src/solaris/classes:../../../../src/share/c=
lasses -bootclasspath ../../../../build/linux-amd64/classes: -d ../../../..=
/build/linux-amd64/classes @../../../../build/linux-amd64/tmp/sun/sun.secur=
ity.smartcardio/j2pcsc/.classes.list<br />/bin/sh: 7: -sourcepath: not foun=
d<br />make: *** [../../../../make/common/Rules.gmk:236: .compile.classlist=
] Error 127<br /><br />I am checking if these exist<br />-sourcepath ../../=
../../build/linux-amd64/gensrc:../../../../src/solaris/classes:../../../../=
src/share/classes<br />ls ../../../../build/linux-amd64/gensrc ---this is n=
ot there---<br />ls ../../../../src/solaris/classes<br />ls ../../../../src=
/share/classes<br /><br />Host: Ubuntu 22.04<br />Target: RPi3B+<br />Build=
 System: Yocto / bitbake<br />

--XgZT1kVVeGX65wDQ0gr8--

