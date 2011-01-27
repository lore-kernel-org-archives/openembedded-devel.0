Received: from david.siemens.de ([192.35.17.14])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Fabrice.Aeschbacher@siemens.com>) id 1PiUsY-00006q-M1
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Jan 2011 17:39:26 +0100
Received: from mail3.siemens.de (localhost [127.0.0.1])
	by david.siemens.de (8.12.11.20060308/8.12.11) with ESMTP id
	p0RGFPWY005140 for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jan 2011 17:15:26 +0100
Received: from DEMCHP99ET0MSX.ww902.siemens.net
	(demchp99et0msx.ww902.siemens.net [139.25.131.181])
	by mail3.siemens.de (8.13.6/8.13.6) with ESMTP id p0RGFP25012497
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jan 2011 17:15:25 +0100
Received: from DEMCHP99E35MSX.ww902.siemens.net ([169.254.2.34]) by
	DEMCHP99ET0MSX.ww902.siemens.net ([139.25.131.181]) with mapi;
	Thu, 27 Jan 2011 17:15:24 +0100
From: "Aeschbacher, Fabrice" <Fabrice.Aeschbacher@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 27 Jan 2011 17:15:23 +0100
Thread-Topic: libpcre not compiling
Thread-Index: Acu+PWbuU8hOSn6TRWixZi8M46ugcA==
Message-ID: <09D9BE2AC4AA764DABAA8C91E48D819ED682EC06@DEMCHP99E35MSX.ww902.siemens.net>
Accept-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE
MIME-Version: 1.0
Subject: libpcre not compiling
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
X-List-Received-Date: Thu, 27 Jan 2011 16:39:27 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

[using released version 2010.12]

libpcre (7.6-r8) fails to compile :

...
| /bin/sh ./arm-angstrom-linux-gnueabi-libtool --tag=3DCXX   --mode=3Dlink =
arm-angstrom-linux-gnueabi-g++ -march=3Darmv5te -mtune=3Darm926ej-s -mthumb=
-interwork -mno-thumb  -isystem/srv/oe-2010/build/at91sam9g20ek/sysroots/ar=
mv5te-angstrom-linux-gnueabi/usr/include -O2 -fpermissive -fvisibility-inli=
nes-hidden -fvisibility-inlines-hidden -version-info 0:0:0 -Wl,-O1 -Wl,--ha=
sh-style=3Dgnu -o libpcrecpp.la -rpath /usr/lib pcrecpp.lo pcre_scanner.lo =
pcre_stringpiece.lo libpcre.la
| /bin/grep: /usr/lib/libstdc++.la: No such file or directory
| /srv/oe-2010/build/at91sam9g20ek/sysroots/x86_64-linux/usr/bin/sed: can't=
 read /usr/lib/libstdc++.la: No such file or directory
| arm-angstrom-linux-gnueabi-libtool: link: `/usr/lib/libstdc++.la' is not =
a valid libtool archive
| make[1]: *** [libpcrecpp.la] Error 1
| make[1]: Leaving directory `/srv/oe-2010/build/at91sam9g20ek/work/armv5te=
-angstrom-linux-gnueabi/libpcre-7.6-r8/pcre-7.6'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: package libpcre-7.6-r8: task do_compile: Failed
ERROR: Function 'do_compile' failed (see /srv/oe-2010/build/at91sam9g20ek/w=
ork/armv5te-angstrom-linux-gnueabi/libpcre-7.6-r8/temp/log.do_compile.1723 =
for further information)
ERROR: '/srv/oe-2010/org.openembedded/recipes/libpcre/libpcre_7.6.bb' faile=
d		=09


I would be thankful if someone could give me any hint how to solve this.

With kind regards,
Fabrice Aeschbacher=


