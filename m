Return-Path: <bassem.boubaker@actia.fr>
X-Greylist: delayed 14522 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 12 Mar 2019 04:46:54 UTC
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
	(mail-eopbgr120084.outbound.protection.outlook.com [40.107.12.84])
	by mail.openembedded.org (Postfix) with ESMTP id 9F5BF7C672
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Mar 2019 04:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=actia.fr; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=GEVC9xkA3iCQxckZJZi1sGtsopUoplFvM0x0y+V+sig=;
	b=IP4r1www8VfbtfEprXn+9E387W6NYhvU7MHGemxs39rjYOU+wKovXFhYxtMs1FZMnbzft2VeSAChHYTSiT3nuxynwUt2BboCG7lU55/gHJUu/q3gOl9OVbr/a5pSs1uL7CFfOgFve2AvoWsQsk79QcsG2Lhnc/7S3XRL9mcGQ4A=
Received: from MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM (52.134.38.15) by
	MR2P264MB0500.FRAP264.PROD.OUTLOOK.COM (52.134.35.13) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1686.17; Mon, 11 Mar 2019 20:11:37 +0000
Received: from MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM
	([fe80::4124:2bff:600f:6fe2]) by MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM
	([fe80::4124:2bff:600f:6fe2%5]) with mapi id 15.20.1686.021;
	Mon, 11 Mar 2019 20:11:37 +0000
From: BOUBAKER Bassem <bassem.boubaker@actia.fr>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH v2] cpulimit: introduce support for this package
Thread-Index: AQHU2Eahj4ClB3IlBU+gojBElig/JA==
Date: Mon, 11 Mar 2019 20:11:36 +0000
Message-ID: <1552335085-13742-1-git-send-email-bassem.boubaker@actia.fr>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0096.eurprd07.prod.outlook.com
	(2603:10a6:6:2b::34) To MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM
	(2603:10a6:500:c::15)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bassem.boubaker@actia.fr; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [185.69.189.94]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc64af62-f2fb-44ea-eb00-08d6a65dc23c
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
	SRVR:MR2P264MB0500; 
x-ms-traffictypediagnostic: MR2P264MB0500:
x-ms-exchange-purlcount: 1
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; MR2P264MB0500;
	23:3VwBAzW1puFiKulBrn1OXnZNrGLwRvdAtsmvjHm?=
	=?iso-8859-1?Q?skUateU0qypqtvt0+YWazhwS4Jw8ZtqT9t9gwS+puftbg76uIBTsZAml/s?=
	=?iso-8859-1?Q?lvhJBrvJrj/HvJR1uYdC+3JdKpPmmg5ThEqUN81S1dji90AF44Vwu8Amyx?=
	=?iso-8859-1?Q?08V2zaWpUbYegtSJtAgzxMPvpQ8P6fhvmt7ZibawF3LdYb4KB6hX5XQjWD?=
	=?iso-8859-1?Q?0yGKd55nYYerD8TQeltloyRWABNZZpUTfFd0GY1Wse7+TmtiO2Quon2yuP?=
	=?iso-8859-1?Q?tWvqVUDbyW+Qa2KehjyryVIaX2sbaC47kNut0OW5Ap8bMeMmQgZ5Uh7yCX?=
	=?iso-8859-1?Q?Y3bDFX9CSUJzv2X4Ydkff7hyI3a9eq7cbObjuHH0tMKrOG6HVA8cNnDCDS?=
	=?iso-8859-1?Q?5XCGF+S9xRoz66Pfz474XdjBIq69XglL/Nrmg5oLy5g1kofLFd/xLP77qO?=
	=?iso-8859-1?Q?WEsq0qvGEJmGhryU68pfaERI2bJ+UeQ35crEjevYMi2Td7zVD/2KT4y92h?=
	=?iso-8859-1?Q?O1vAU9oMLHc9719mtNrPYC5phNWtI4T0BxjtimEoSgFBYirdfFzTEN17gX?=
	=?iso-8859-1?Q?NhMzaA5ziWKmkI6m1xhmcp3Lfkcw50VvEElGa7lFQqJC0sHa0X3oSWnjzB?=
	=?iso-8859-1?Q?GF8m6AxRadUfbdagOw3tunWIy97dMNRsQqhqiiU/ASkIR5sicxLOk+YN8T?=
	=?iso-8859-1?Q?YURyjl/zTRM2fk64c0FsPTpz2ITQ/k25wa3d5PlfEGNy4ueEvivFXGB1Fp?=
	=?iso-8859-1?Q?E2vn07emwY078hpdVVv9xaixt4yhHI4w+qc26GghLuVfSbFtpaT8EV8+u4?=
	=?iso-8859-1?Q?cECip9OYJ3kvaIilPVvNTfYuxONWS1J+TP5KQqD+IFNCbSp7fYgRbWmXsQ?=
	=?iso-8859-1?Q?rfP1p0NWi0SvV3VQOzPjXW9N4W8EHonKQB6JpHA9cUv3WvopGErJufMKZ0?=
	=?iso-8859-1?Q?UdruxoQJPIa1CmrICDCD3wIwPMIsCsTg4Hn1ko8wQrvZmhi+2Y25dLtgMs?=
	=?iso-8859-1?Q?EO9O5ER09tWDBV5KcsG4Sa6iwtoa7VjFzcEh0t9wAmOJTOyt0VvrUXniXh?=
	=?iso-8859-1?Q?71QBk5X3xZrwxOHlq+g05eCvcjnmVAZv7cT69XpIuDiJHuh897HXkGMxHK?=
	=?iso-8859-1?Q?qPOuW003XPMSvVP9/lv1pC2T1BvHTZtK9Vk1fDKke11fDCI1wMU8QBYxug?=
	=?iso-8859-1?Q?AqEyjT11mVtD4kfYAeRbkiYUu6oLA2/zmBzpgXYExoreuFfV5ybsFy3dyG?=
	=?iso-8859-1?Q?OzH16aQt7pn9yW7DdEmGlCIqV4wLXmwOKbYJd++zV4nUti1i9xkDNwi/NU?=
	=?iso-8859-1?Q?W2cQ3l63glwop1OLn2WBQg/?=
x-microsoft-antispam-prvs: <MR2P264MB05009B334FC5E383743926E79C480@MR2P264MB0500.FRAP264.PROD.OUTLOOK.COM>
x-forefront-prvs: 09730BD177
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(346002)(136003)(376002)(396003)(39850400004)(366004)(189003)(199004)(8676002)(6436002)(6306002)(6116002)(6512007)(81166006)(53936002)(53386004)(86362001)(68736007)(316002)(186003)(478600001)(107886003)(5640700003)(305945005)(25786009)(5660300002)(3846002)(6916009)(81156014)(4326008)(97736004)(99286004)(7736002)(6486002)(36756003)(66066001)(105586002)(106356001)(8936002)(2351001)(26005)(102836004)(6506007)(52116002)(386003)(50226002)(2501003)(71200400001)(71190400001)(14444005)(256004)(14454004)(2616005)(476003)(2906002)(486006)(74482002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MR2P264MB0500;
	H:MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: actia.fr does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7gc958kslgMHPlgdjdFVCJNIgDAiUi279MhwGy13ioE4ZF/jth6AyAkM4BUXEMHuWz/9pr4vB9eok1UYWu6yOHGYg6ntny9/EA/veIwk6FLlqoYS/OMfTLNX1/7XDCAZlVPwr4vCYnMTyPtVqkjbUM3mfpyGpbPl0b2jyT5WjC/IAykoi788OMXwmakOIIci/pWAp+NbaH1tyQ0d+Xcl4aPPNM4XWYgPKkbJMaXj4vKKeLMEH+VXn9OTOfxyMXYsjin+yZDrUUne1FEOTq0yLGeqAWGkHLnlo55+/Mga6u/xGwkBdQ5p5YZVQ16Hntek24AT72hDWdm06/aypT0o7cza+EuWtQadq5DlvXmbLBBstsh2JSG+27zFT5VtfS8x5Rqc1oLAXQAPB3mb9doidRJMb75I0os+9220FkH4/zs=
MIME-Version: 1.0
X-OriginatorOrg: actia.fr
X-MS-Exchange-CrossTenant-Network-Message-Id: dc64af62-f2fb-44ea-eb00-08d6a65dc23c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2019 20:11:37.5660 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 86314f06-03e8-4460-82f3-a44f992a19c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0500
Subject: [meta-oe][PATCH v2] cpulimit: introduce support for this package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Mar 2019 04:46:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

* Now, cpulimit recipe is put under recipes-support. Binary will be install=
ed by the recipe under /usr/sbin

         # cpulimit -h
         Usage: cpulimit [OPTIONS...] TARGET
                 OPTIONS
                 -l, --limit=3DN          percentage of cpu allowed from 0 =
to 100 (required)
                 -v, --verbose          show control statistics
                 -z, --lazy             exit if there is no target process,=
 or if it dies
                 -i, --include-children limit also the children processes
                 -h, --help             display this help and exit
                 TARGET must be exactly one of these:
                 -p, --pid=3DN            pid of the process (implies -z)
                 -e, --exe=3DFILE         name of the executable program fi=
le or path name
                 COMMAND [ARGS]         run this command and limit it (impl=
ies -z)

                 Report bugs to <marlonx80@hotmail.com>.

Signed-off-by: Bassem Boubaker <bassem.boubaker@actia.fr>
---
 meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb

diff --git a/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb b/meta-oe/rec=
ipes-support/cpulimit/cpulimit_0.2.bb
new file mode 100644
index 0000000..8eaa928
--- /dev/null
+++ b/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
@@ -0,0 +1,19 @@
+SUMMARY =3D "cpulimit is a tool which limits the CPU usage of a process"
+HOMEPAGE =3D "http://cpulimit.sourceforge.net"
+LICENSE =3D "GPLv2"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86c1c0d961a437e529db93aa3bb32dc=
4"
+SRCREV ?=3D "f4d2682804931e7aea02a869137344bb5452a3cd"
+
+SRC_URI =3D "git://git@github.com/opsengine/cpulimit.git;protocol=3Dhttps"
+
+S =3D "${WORKDIR}/git"
+
+do_compile() {
+    oe_runmake all
+}
+do_install() {
+    install -d ${D}${sbindir}
+    install -m 0755 ${B}/src/${PN} ${D}${sbindir}/
+}
+
+CFLAGS +=3D "${LDFLAGS}"
\ No newline at end of file
--=20
2.7.4


