Received: from smtp191.dfw.emailsrvr.com ([67.192.241.191])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <davidp@matrixpd.com>) id 1Om5bm-0003vU-6z
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 15:57:08 +0200
Received: from relay19.relay.dfw.mlsrvr.com (localhost [127.0.0.1])
	by relay19.relay.dfw.mlsrvr.com (SMTP Server) with ESMTP id
	F3F982749C5C for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 09:50:15 -0400 (EDT)
Received: from smtp192.mex07a.mlsrvr.com (smtp192.mex07a.mlsrvr.com
	[67.192.133.192])
	by relay19.relay.dfw.mlsrvr.com (SMTP Server) with ESMTPS id
	EE6AE2749C58 for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 09:50:15 -0400 (EDT)
Received: from 34093-MBX-C14.mex07a.mlsrvr.com ([192.168.1.16]) by
	207041-HUB06.mex07a.mlsrvr.com ([192.168.1.201]) with mapi;
	Thu, 19 Aug 2010 08:50:13 -0500
From: David Peters <davidp@matrixpd.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 19 Aug 2010 08:50:10 -0500
Thread-Topic: configure error for xproto
Thread-Index: Acs/oZx2sADNG31sTjOLJD42DJhB8Q==
Message-ID: <A06367EE83B2214587BB5C9037AD244F1E35AB0561@34093-MBX-C14.mex07a.mlsrvr.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 67.192.241.191
X-SA-Exim-Mail-From: davidp@matrixpd.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: configure error for xproto
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
X-List-Received-Date: Thu, 19 Aug 2010 13:57:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I recently ran "sh oebb.sh update" and tried building packages for the am35=
17-evm board.  I'm now getting the following error.  Any ideas what is caus=
ing this?

.
.
.
614 configure:3097: checking whether the C compiler works
615 configure:3119: arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=
=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb=
 -isystem/home/dapeters/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sy=
sroots/armv7a-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations =
-frename-registers -fomit-frame-pointer -O2 -ggdb3 -isystem/home/dapeters/a=
ngstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-li=
nux-gnueabi/usr/include -L/home/dapeters/angstrom-setup-scripts/build/tmp-a=
ngstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib -Wl,-rpath-li=
nk,/home/dapeters/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots=
/armv7a-angstrom-linux-gnueabi/usr/lib -Wl,-O1 -Wl,--hash-style=3Dgnu conft=
est.c  >&5
616 Assembler messages:
617 Fatal error: Invalid -march=3D option: `armv7-a'
618 configure:3123: $? =3D 1
619 configure:3161: result: no
620 configure: failed program was:
621 | /* confdefs.h */
622 | #define PACKAGE_NAME "Xproto"
623 | #define PACKAGE_TARNAME "xproto"
624 | #define PACKAGE_VERSION "7.0.18"
625 | #define PACKAGE_STRING "Xproto 7.0.18"
626 | #define PACKAGE_BUGREPORT "https://bugs.freedesktop.org/enter_bug.cgi=
?product=3Dxorg"
627 | #define PACKAGE_URL ""
628 | #define PACKAGE "xproto"
629 | #define VERSION "7.0.18"
630 | /* end confdefs.h.  */
631 |
632 | int
633 | main ()
634 | {
635 |
636 |   ;
637 |   return 0;
638 | }
639 configure:3166: error: in `/home/dapeters/angstrom-setup-scripts/build/=
tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/xproto-1_7.0.18-r2.0=
/xp        roto-7.0.18':
640 configure:3170: error: C compiler cannot create executables
641 See `config.log' for more details.
.
.
.


