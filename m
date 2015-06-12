Return-Path: <bigeasy@linutronix.de>
Received: from Galois.linutronix.de (www.linutronix.de [62.245.132.108])
	by mail.openembedded.org (Postfix) with ESMTP id 68E5E60962
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jun 2015 18:51:16 +0000 (UTC)
Received: from bigeasy by Galois.linutronix.de with local (Exim 4.80)
	(envelope-from <bigeasy@linutronix.de>) id 1Z3U2v-0001dT-I5
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Jun 2015 20:51:17 +0200
Date: Fri, 12 Jun 2015 20:51:17 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150612185117.GA5348@linutronix.de>
MIME-Version: 1.0
X-Key-Id: 2A8CF5D1
X-Key-Fingerprint: 6425 4695 FFF0 AA44 66CC  19E6 7B96 E816 2A8C F5D1
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [meta-java] Trying to build icedtea7 fails currently
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Jun 2015 18:51:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

building icedtea7-native fails currently if the host runs linux v4.0+.
Duh. I tried to add a patch to "openjdk-7-release-03b147.inc" but it
didn't get applied=E2=80=A6

Upstream fixed it
  https://bugs.openjdk.java.net/browse/JDK-8074312
  https://bugs.openjdk.java.net/secure/attachment/25832/JDK-8074312-hotspot=
=2Epatch

I workaround it with linux64 --uname-2.6. It helped but failed later
with various errors such as:
| collect2: error: ld returned 1 exit status
| /home/angstrom-distribution/build/tmp-angstrom_v2014_12-glibc/work/x86_64=
-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot/ jdk/mak=
e/common/internal/NativeCompileRules.gmk:74: recipe for target '/home/angst=
rom-distribution/build/tmp-angstrom_v2014_12-glibc/work/x8 6_64-linux/icedt=
ea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk.build-boot/tmp/sun/sun.aw=
t/headless/obj64/awt_Font.o' failed
| make[6]: *** [/home/angstrom-distribution/build/tmp-angstrom_v2014_12-gli=
bc/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build /openjd=
k.build-boot/tmp/sun/sun.awt/headless/obj64/awt_Font.o] Error 1
| make[6]: *** Waiting for unfinished jobs....
| jdk/make/sun/headless/../../../src/solaris/native/sun/awt/fontpath.c:910:=
 undefined reference to `FcFontSetDestroy'
| /home/angstrom-distribution/build/tmp-angstrom_v2014_12-glibc/work/x86_64=
-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot/ jdk/mak=
e/sun/headless/../../../src/solaris/native/sun/awt/fontpath.c:878: undefine=
d reference to `FcPatternDestroy'
| /tmp/cczs6cdu.o: In function `Java_sun_font_FontConfigManager_getFontConf=
igVersion':
| /home/angstrom-distribution/build/tmp-angstrom_v2014_12-glibc/work/x86_64=
-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot/ jdk/mak=
e/sun/headless/../../../src/solaris/native/sun/awt/fontpath.c:740: undefine=
d reference to `FcGetVersion'
| collect2: error: ld returned 1 exit status

Does someone have an idea?

Sebastian

