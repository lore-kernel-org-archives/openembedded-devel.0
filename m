Return-Path: <B40290@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1lp0145.outbound.protection.outlook.com [207.46.163.145])
	by mail.openembedded.org (Postfix) with ESMTP id 97C936DEDA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 03:30:00 +0000 (UTC)
Received: from BY2PR03MB254.namprd03.prod.outlook.com (10.242.37.17) by
	BY2PR03MB396.namprd03.prod.outlook.com (10.141.141.26) with Microsoft
	SMTP Server (TLS) id 15.0.898.11; Wed, 26 Mar 2014 03:29:58 +0000
Received: from BY2PR03MB254.namprd03.prod.outlook.com ([169.254.16.84]) by
	BY2PR03MB254.namprd03.prod.outlook.com ([169.254.16.84]) with mapi id
	15.00.0898.005; Wed, 26 Mar 2014 03:29:58 +0000
From: "B40290@freescale.com" <B40290@freescale.com>
To: "B40290@freescale.com" <B40290@freescale.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-networking][PATCH ] sethdlc : add recipe
Thread-Index: AQHPRBA6TYwuPpLTF06VkmGtvYou75ryvwDQ
Date: Wed, 26 Mar 2014 03:29:57 +0000
Message-ID: <c62415cfcbda4716940f793bd5221452@BY2PR03MB254.namprd03.prod.outlook.com>
References: <1395301457-20665-1-git-send-email-b40290@freescale.com>
In-Reply-To: <1395301457-20665-1-git-send-email-b40290@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [123.151.195.49]
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009001)(6009001)(428001)(13464003)(164054003)(189002)(199002)(377454003)(93516002)(33646001)(98676001)(77096001)(575784001)(50986001)(86362001)(85306002)(49866001)(4396001)(2656002)(85852003)(74366001)(87936001)(80976001)(95416001)(83322001)(93136001)(81342001)(53806001)(87266001)(74316001)(94316002)(59766001)(77982001)(65816001)(74706001)(80022001)(66066001)(79102001)(20776003)(63696002)(95666003)(76482001)(19580395003)(54316002)(81542001)(97336001)(69226001)(56776001)(51856001)(81686001)(31966008)(97186001)(46102001)(74502001)(54356001)(15975445006)(92566001)(47976001)(83072002)(47736001)(94946001)(81816001)(90146001)(74876001)(19580405001)(76576001)(47446002)(74662001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR03MB396;
	H:BY2PR03MB254.namprd03.prod.outlook.com;
	FPR:B1CF5DF1.8F8B459.7DF19BAA.4C7FC372.2032F; MLV:sfv;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (: freescale.com does not designate permitted sender hosts)
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [meta-networking][PATCH ] sethdlc : add recipe
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
X-List-Received-Date: Wed, 26 Mar 2014 03:30:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Pings


Thanks,
chunrong

-----Original Message-----
From: b40290@freescale.com [mailto:b40290@freescale.com]=20
Sent: Thursday, March 20, 2014 3:44 PM
To: openembedded-devel@lists.openembedded.org
Cc: Liu Ting-B28495; Luo Zhenhua-B19537; Guo Chunrong-B40290
Subject: [meta-networking][PATCH ] sethdlc : add recipe

From: Chunrong Guo <B40290@freescale.com>

   * sethdlc: get/set Linux HDLC packet radio modem driver port information
   * sethdlc is  a  program designed to set and/or report the configuration
     information associated with a soundcard radio modem port. This informa=
tion
     includes  the  modem type, what I/O port, IRQ and DMA channel a partic=
ular
     modem port is using, and where to output a transmitter  keying (PTT) s=
ignal.

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 .../recipes-connectivity/sethdlc/sethdlc.bb        | 30 ++++++++++++++++++=
++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/sethdlc/sethdlc.bb

diff --git a/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb b/meta=
-networking/recipes-connectivity/sethdlc/sethdlc.bb
new file mode 100644
index 0000000..3a9692f
--- /dev/null
+++ b/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
@@ -0,0 +1,30 @@
+DESCRIPTION =3D "set Linux HDLC packet radio modem driver port information=
"
+HOMEPAGE =3D "https://www.kernel.org/pub/linux/utils/net/hdlc"
+LICENSE =3D "GPLv2 & GPLv2+ "
+LIC_FILES_CHKSUM =3D "file://Makefile;md5=3D19aada31930b2be84bf7138420d772=
63"
+
+
+SRC_URI =3D=20
+"https://www.kernel.org/pub/linux/utils/net/hdlc/${BPN}-1.18.tar.gz \ "
+SRC_URI[md5sum] =3D "9016878156a5eadb06c0bae71cc5c9ab"
+SRC_URI[sha256sum] =3D "21b1e2e1cb0e288b0ec8fcfd9fed449914e0f8e6fc273706bd=
5b3d4f6ab6b04e"
+
+
+S =3D "${WORKDIR}/${BPN}-1.18"
+
+DEPENDS=3D"virtual/kernel"
+
+EXTRA_OEMAKE=3D"CROSS_COMPILE=3D${TARGET_PREFIX} CC=3D'${CC} ${LDFLAGS}' \
+              KERNEL_DIR=3D${STAGING_KERNEL_DIR} "
+
+do_compile_prepend () {
+    oe_runmake clean
+}
+
+
+do_install() {
+    install -d ${D}/${bindir}
+    install sethdlc ${D}/${bindir}/
+}
+
+FILES_${PN} +=3D "${bindir}/sethdlc"
--
1.8.3.2



