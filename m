Return-Path: <B40290@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2lp0203.outbound.protection.outlook.com [207.46.163.203])
	by mail.openembedded.org (Postfix) with ESMTP id 74177607FE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 03:21:19 +0000 (UTC)
Received: from BY2PR03MB254.namprd03.prod.outlook.com (10.242.37.17) by
	BY2PR03MB394.namprd03.prod.outlook.com (10.141.141.13) with Microsoft
	SMTP Server (TLS) id 15.0.921.12; Wed, 23 Apr 2014 03:21:13 +0000
Received: from BY2PR03MB254.namprd03.prod.outlook.com ([169.254.16.59]) by
	BY2PR03MB254.namprd03.prod.outlook.com ([169.254.16.59]) with mapi id
	15.00.0921.000; Wed, 23 Apr 2014 03:21:12 +0000
From: "B40290@freescale.com" <B40290@freescale.com>
To: "B40290@freescale.com" <B40290@freescale.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-networking][PATCH ] sethdlc: don't search host
	directories for header files
Thread-Index: AQHPWe7z2BZn4he5e02U7PjPd4/Xb5sekicQ
Date: Wed, 23 Apr 2014 03:21:11 +0000
Message-ID: <e3335e4355fc4394b8f955272edc19f0@BY2PR03MB254.namprd03.prod.outlook.com>
References: <1397706091-8116-1-git-send-email-b40290@freescale.com>
In-Reply-To: <1397706091-8116-1-git-send-email-b40290@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [123.151.195.49]
x-forefront-prvs: 01901B3451
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009001)(6009001)(428001)(377454003)(199002)(13464003)(189002)(164054003)(33646001)(19580395003)(79102001)(74662001)(20776003)(74502001)(76576001)(4396001)(83322001)(19580405001)(81342001)(66066001)(80022001)(74316001)(81542001)(86362001)(575784001)(87936001)(76176999)(99286001)(77982001)(85852003)(99396002)(83072002)(54356999)(2656002)(80976001)(92566001)(31966008)(76482001)(15975445006)(50986999)(46102001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR03MB394;
	H:BY2PR03MB254.namprd03.prod.outlook.com;
	FPR:B1CF7DF5.C8E0B459.71D397A0.4CCB47C2.203B3; MLV:sfv;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (: freescale.com does not designate permitted sender hosts)
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [meta-networking][PATCH ] sethdlc: don't search host directories for header files
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
X-List-Received-Date: Wed, 23 Apr 2014 03:21:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Pings

Thanks,
chunrong

-----Original Message-----
From: b40290@freescale.com [mailto:b40290@freescale.com]=20
Sent: Thursday, April 17, 2014 11:42 AM
To: openembedded-devel@lists.openembedded.org
Cc: Liu Ting-B28495; Luo Zhenhua-B19537; Guo Chunrong-B40290
Subject: [meta-networking][PATCH ] sethdlc: don't search host directories f=
or header files

From: Chunrong Guo <B40290@freescale.com>

    *The build process hard-codes searches of various directories
     in /usr/src/linux/include when looking for header files,
     delete this to avoid host contamination

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 .../sethdlc/files/fix-includedir.patch                    | 15 +++++++++++=
++++
 meta-networking/recipes-connectivity/sethdlc/sethdlc.bb   | 11 +++--------
 2 files changed, 18 insertions(+), 8 deletions(-)  create mode 100644 meta=
-networking/recipes-connectivity/sethdlc/files/fix-includedir.patch

diff --git a/meta-networking/recipes-connectivity/sethdlc/files/fix-include=
dir.patch b/meta-networking/recipes-connectivity/sethdlc/files/fix-included=
ir.patch
new file mode 100644
index 0000000..49d6d42
--- /dev/null
+++ b/meta-networking/recipes-connectivity/sethdlc/files/fix-includedir.
+++ patch
@@ -0,0 +1,15 @@
+--- a/Makefileold	2014-04-16 22:05:58.070199084 -0500
++++ b/Makefile	2014-04-16 22:06:27.153074058 -0500
+@@ -1,11 +1,10 @@
+ CC =3D gcc
+ CFLAGS =3D -O2 -Wall -W -Wno-long-long -pipe -INCLUDES =3D=20
+-I/usr/src/linux/include -I/usr/src/linux-2.6/include
+=20
+ all:		sethdlc
+=20
+ sethdlc:	sethdlc.c
+-		$(CC) $(CFLAGS) $(INCLUDES) -o $@ $<
++		$(CC) $(CFLAGS)  -o $@ $<
+=20
+ install:
+ 		install -C -p -s sethdlc /usr/local/sbin/
diff --git a/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb b/meta=
-networking/recipes-connectivity/sethdlc/sethdlc.bb
index 3a9692f..3459a36 100644
--- a/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
+++ b/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
@@ -1,27 +1,22 @@
 DESCRIPTION =3D "set Linux HDLC packet radio modem driver port information=
"
 HOMEPAGE =3D "https://www.kernel.org/pub/linux/utils/net/hdlc"
 LICENSE =3D "GPLv2 & GPLv2+ "
-LIC_FILES_CHKSUM =3D "file://Makefile;md5=3D19aada31930b2be84bf7138420d772=
63"
-
+LIC_FILES_CHKSUM =3D "file://sethdlc.c;beginline=3D1;endline=3D10;md5=3D90=
f936879e9f8b755a138aeb348782eb"
=20
 SRC_URI =3D "https://www.kernel.org/pub/linux/utils/net/hdlc/${BPN}-1.18.t=
ar.gz \
+           file://fix-includedir.patch \
 "
 SRC_URI[md5sum] =3D "9016878156a5eadb06c0bae71cc5c9ab"
 SRC_URI[sha256sum] =3D "21b1e2e1cb0e288b0ec8fcfd9fed449914e0f8e6fc273706bd=
5b3d4f6ab6b04e"
=20
-
 S =3D "${WORKDIR}/${BPN}-1.18"
=20
-DEPENDS=3D"virtual/kernel"
-
-EXTRA_OEMAKE=3D"CROSS_COMPILE=3D${TARGET_PREFIX} CC=3D'${CC} ${LDFLAGS}' \
-              KERNEL_DIR=3D${STAGING_KERNEL_DIR} "
+EXTRA_OEMAKE=3D"CROSS_COMPILE=3D${TARGET_PREFIX} CC=3D'${CC} ${LDFLAGS}'"=
=20
=20
 do_compile_prepend () {
     oe_runmake clean
 }
=20
-
 do_install() {
     install -d ${D}/${bindir}
     install sethdlc ${D}/${bindir}/
--
1.8.3.2



