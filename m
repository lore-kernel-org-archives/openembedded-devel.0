Return-Path: <prvs=95684d004=Alistair.Francis@wdc.com>
X-Greylist: delayed 426 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 01 Mar 2019 20:50:57 UTC
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail.openembedded.org (Postfix) with ESMTP id 690EA7CDC1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Mar 2019 20:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1551473459; x=1583009459;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=52ryXveBkG2lB4fsyx8t8FfEoCFvcKZ7LsNcFnfoMMw=;
	b=YSZQKBZcheaKafNoWDbwqr1RBCCzcBYmWuVyPsZ778HEXs6faOfnRX2C
	p753l76AcEXeEGVz2TkothaRie3TnlWJQdty4IPQbvG0ucwYP+4ROekfK
	pW/Bdr/+JkimNsWhMp21Md1ijwDwWzs1xrzl/9Wjaa9Q6AkGhCCoD087X
	80lGMWEWawy88XDlkdjB9ldrGeUIDp7UoHL1sINyCNURiBon7wM73FjHA
	q39evcnsMjJhYyhgXWSQdRuQTeJm8PWdps+wJpsIWDc8Onafg44RAxT4V
	QhLT/mcor665Jr8dKfUUOYvN+OwNSFjHNvElur73nhKwrznph/uuFLYDC g==;
X-IronPort-AV: E=Sophos;i="5.58,429,1544457600"; d="scan'208";a="107499825"
Received: from mail-dm3nam03lp2058.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.58])
	by ob1.hgst.iphmx.com with ESMTP; 02 Mar 2019 04:43:52 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=g4K8xQF4M9yoBLoG2FbBMjGSpRIxDKQV7e6L0gaV16Q=;
	b=RQc4mqbzRg6WJ54qtdKTSaX+VBiiXW1BVAThCBWad8lTUYQ7zHwVxFW0//CgYXzZxYXxveqYnfiPzuZCK1q22QYRU4yN7rf1sXeA7O/PoYnzuW1/Oi2fPBiKWgU4oHtoOCNd96LCKqhzmYstLHPamA0QcD+TVwHN6UMviZOwo8Y=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB1022.namprd04.prod.outlook.com (10.174.250.17) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1665.16; Fri, 1 Mar 2019 20:43:50 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::f55c:272b:6401:1b8c]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::f55c:272b:6401:1b8c%10]) with mapi id 15.20.1643.022;
	Fri, 1 Mar 2019 20:43:50 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [PATCH v2 1/2] license: Add licenses required for Mimic
Thread-Index: AQHU0G95AKw5EcDpYU+dNZiB5W1JtA==
Date: Fri, 1 Mar 2019 20:43:50 +0000
Message-ID: <20190301204310.8500-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: BYAPR02CA0011.namprd02.prod.outlook.com
	(2603:10b6:a02:ee::24) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.45.64]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f844ac0-4fae-4ae4-313e-08d69e869bfc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB1022; 
x-ms-traffictypediagnostic: MWHPR04MB1022:
x-ms-exchange-purlcount: 3
wdcipoutbound: EOP-TRUE
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; MWHPR04MB1022;
	23:M54d6I9F+1e/w23UxLoYIhd5HkLXNBUNjBRRDAo?=
	=?iso-8859-1?Q?hd0/8X7VG7zCcDVQLcXM2HqijM9CMrgI0aMxkFQUkj36wPdyxUGbZyqJ1H?=
	=?iso-8859-1?Q?FNET/SGsBzvK50XFv2LtoiCuapDGeOAq3Bnb3UNR6e9Hnr6j+GwYMSro87?=
	=?iso-8859-1?Q?A/cIjYfh1vf7nF9pprRCqSa4+B0gAHAqe31ypqC/FptvVW2XirNieFc/ON?=
	=?iso-8859-1?Q?Yp1iWUEkPURuCawOCpAKd1vNanGWxZG+uI3gG916oR0xmWTDJMNzp/zqqt?=
	=?iso-8859-1?Q?xNs0AFikrsgwFRhfva3FN1Re918d+Ym1PthewoHRH96Gql1wECy7g9jTB4?=
	=?iso-8859-1?Q?GqhZZAf2fBMgpXX6GEuwrBj4XV2e9QWIc+bAZ5eY+W65+PGkkSs4F2kqkU?=
	=?iso-8859-1?Q?I+6i9fMbUdpjdIwUmLnuY3JhTmWVtkconDFxLBqEqQDKOxXa4WsfYvx12H?=
	=?iso-8859-1?Q?ZF46ZqpMGmoGjRHQmOLmnf77WvHPfDGSBcJOVBjarrzZvvGKTEvADpPy15?=
	=?iso-8859-1?Q?MQ8ShLCpbJuxxQakVxm/VXxI9BGsHxze3OKdCwDa+OKQkXwc8MC9RrkYTB?=
	=?iso-8859-1?Q?qk+33Bs1sUvHa0uvero7iFVVDLbToBASb6Z1cQoV5oQqu7+iuOo425j+JD?=
	=?iso-8859-1?Q?J8mLmRj18KUp4YPrcCh5aPBmf0S0Zcl/V3UQaJCyJFnOhYln1P1J0Zgd6z?=
	=?iso-8859-1?Q?5oglBMmPdbIlAgNHNuc/nOmmCVQKdoPO+xbxELie3sRBzZmA5bofCwlEi8?=
	=?iso-8859-1?Q?BnhGNJ+uKLEK5K/onVUOwBfsG+zvwdZ95mu+VilQDB2/WtmWEpZ7onBqWF?=
	=?iso-8859-1?Q?Zx/kUI7dGVjbDimRtJ/STuI+DL9xXuXqim1FMNvdKbwqS2GcS/ZnFpC+bE?=
	=?iso-8859-1?Q?QK7EYQY9LXL5S1O0S01lsZr1AVAPTLXFdLaaZIq5Fx5yptw+YDxRkAHOpP?=
	=?iso-8859-1?Q?YATcyeF8axsiJQ3znz3uKTEKVLfNP9qo2E4nFjHXW8pefuD+3ZPZ73zqe/?=
	=?iso-8859-1?Q?QT+7yJ/dj5mqo4Nu3ENSD/KxXQcmB1u3bbGiVRbN3cp0Ba5Ne80arVTGby?=
	=?iso-8859-1?Q?uYIX4PWlwZtnx8gPj4F4xV6SmklFIO3b0GjrDFcCdEGT6d9YMGLvlZ+Pes?=
	=?iso-8859-1?Q?XVO6EkpPdE96Lkdl+GpIbijEQksMe63w0f6E+qpgFnXGeytXy9/QtTp21y?=
	=?iso-8859-1?Q?raSgYX4TlHLvPYz+7MoPIeKUrYdMsAWsaBkmTadwOg2n9aKbNDGlrX61d2?=
	=?iso-8859-1?Q?2MoPOUSSyl7xu3o6kZZwdvpyoDSy1jnpYBxFzhCFcA00UhGjCcHyLHi+M5?=
	=?iso-8859-1?Q?gK8kOJdR8k4h0+d2qk6FZ96NjO8su25ILhHemM+3Be7laxJONPeO+e7RD2?=
	=?iso-8859-1?Q?DGodQ1YY=3D?=
x-microsoft-antispam-prvs: <MWHPR04MB10222990EEE34E232D914B3B90760@MWHPR04MB1022.namprd04.prod.outlook.com>
x-forefront-prvs: 09634B1196
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(346002)(366004)(396003)(136003)(39860400002)(199004)(189003)(53936002)(5660300002)(36756003)(6506007)(1076003)(66066001)(2501003)(6512007)(5640700003)(102836004)(486006)(86362001)(2906002)(476003)(6306002)(316002)(386003)(44832011)(2616005)(25786009)(71190400001)(71200400001)(6916009)(97736004)(8676002)(68736007)(72206003)(81156014)(4326008)(14454004)(50226002)(54906003)(52116002)(478600001)(966005)(256004)(6436002)(26005)(14444005)(99286004)(8936002)(105586002)(2351001)(186003)(305945005)(6486002)(7736002)(106356001)(81166006)(3846002)(6116002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB1022;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EKG1fDFXh0Fh9/JSyaJtTjSeM3LIBFWnfoM/uk8OPL8ALF/9e9aQ2R09+M2ghBUFicmigdOcKifpkzO/FzEXSUzXjkJAJcJCsI5P4X8SpjFgkL8QokHriTQUnmIYOOSuyjY27yCJ/POEvUh8A/5MefrH7nCOJE7vHYeqVb90qSr/IgasFOP482pf1o0Jvmw4AGF3boT96+llvJ9ADnfDPzXbGyDB6s2kYXu3bMS9oe/JMe04XO9KsgbEWDcGK5tAsu1ebNGoO3CGUKg4cOFktfsUmEvEPCHYtfDP3wf77c8FOaTOrsOPFRvKQd9H7PBNiDuWeSEpqhk4Y6gUIVojOuQ3aNHArl7fog3N8CodvCYfK+GMtupr9BZRM913qZ+XjD0P6eNjbBmNIdMDSoG28ZU3F4BSRqMwh3Ffoz961cw=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f844ac0-4fae-4ae4-313e-08d69e869bfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2019 20:43:49.6423 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1022
Subject: [PATCH v2 1/2] license: Add licenses required for Mimic
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
X-List-Received-Date: Fri, 01 Mar 2019 20:50:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Add the CMU-Tex, Sun and BellBird licenses that are required for Mimic.

See:
BellBird: https://github.com/MycroftAI/mimic/blob/development/COPYING#L959
Sun: https://github.com/MycroftAI/mimic/blob/development/COPYING#L915
CMU-Tex: https://github.com/MycroftAI/mimic/blob/development/COPYING#L840

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta-multimedia/conf/layer.conf   |  2 ++
 meta-multimedia/licenses/BellBird | 25 +++++++++++++++++++++++++
 meta-multimedia/licenses/CMU-Tex  | 20 ++++++++++++++++++++
 meta-multimedia/licenses/Sun      | 23 +++++++++++++++++++++++
 4 files changed, 70 insertions(+)
 create mode 100644 meta-multimedia/licenses/BellBird
 create mode 100644 meta-multimedia/licenses/CMU-Tex
 create mode 100644 meta-multimedia/licenses/Sun

diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.c=
onf
index e2a7701c3..3500d49ca 100644
--- a/meta-multimedia/conf/layer.conf
+++ b/meta-multimedia/conf/layer.conf
@@ -17,6 +17,8 @@ BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/re=
cipes-*/*/*.bbappend"
 BBFILE_COLLECTIONS +=3D "multimedia-layer"
 BBFILE_PATTERN_multimedia-layer :=3D "^${LAYERDIR}/"
=20
+LICENSE_PATH +=3D "${LAYERDIR}/licenses"
+
 # Define the priority for recipes (.bb files) from this layer,
 # choosing carefully how this layer interacts with all of the
 # other layers.
diff --git a/meta-multimedia/licenses/BellBird b/meta-multimedia/licenses/B=
ellBird
new file mode 100644
index 000000000..bc5c03fa8
--- /dev/null
+++ b/meta-multimedia/licenses/BellBird
@@ -0,0 +1,25 @@
+(c) Copyright the authors of Bellbird. All rights reserved.
+
+Permission is hereby granted, free of charge, to use and distribute =20
+this software and its documentation without restriction, including  =20
+without limitation the rights to use, copy, modify, merge, publish, =20
+distribute, sublicense, and/or sell copies of this work, and to     =20
+permit persons to whom this work is furnished to do so, subject to  =20
+the following conditions:                                           =20
+ 1. The code must retain the above copyright notice, this list of   =20
+    conditions and the following disclaimer.                        =20
+ 2. Any modifications must be clearly marked as such.               =20
+ 3. Original authors' names are not deleted.                        =20
+ 4. The authors' names are not used to endorse or promote products  =20
+    derived from this software without specific prior written       =20
+    permission.                                                     =20
+                                                                    =20
+THE CONTRIBUTORS TO THIS WORK        =20
+DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING     =20
+ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT  =20
+SHALL THE CONTRIBUTORS BE LIABLE     =20
+FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES   =20
+WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN  =20
+AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,         =20
+ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF      =20
+THIS SOFTWARE.=20
diff --git a/meta-multimedia/licenses/CMU-Tex b/meta-multimedia/licenses/CM=
U-Tex
new file mode 100644
index 000000000..f51222852
--- /dev/null
+++ b/meta-multimedia/licenses/CMU-Tex
@@ -0,0 +1,20 @@
+Copyright (C) 2001-2014 Carnegie Mellon University
+
+Permission is granted to make and distribute verbatim copies of
+this manual provided the copyright notice and this permission notice
+are preserved on all copies.
+
+Permission is granted to process this file through TeX, or otherwise and
+print the results, provided the printed document carries copying
+permission notice identical to this one except for the removal of this
+paragraph (this paragraph not being relevant to the printed manual).
+
+Permission is granted to copy and distribute modified versions of this
+manual under the conditions for verbatim copying, provided that the entire
+resulting derived work is distributed under the terms of a permission
+notice identical to this one.
+
+Permission is granted to copy and distribute translations of this manual
+into another language, under the above conditions for modified versions,
+except that this permission notice may be stated in a translation approved
+by the authors.
diff --git a/meta-multimedia/licenses/Sun b/meta-multimedia/licenses/Sun
new file mode 100644
index 000000000..d125a1657
--- /dev/null
+++ b/meta-multimedia/licenses/Sun
@@ -0,0 +1,23 @@
+This source code is a product of Sun Microsystems, Inc. and is provided
+for unrestricted use.  Users may copy or modify this source code without
+charge.
+
+SUN SOURCE CODE IS PROVIDED AS IS WITH NO WARRANTIES OF ANY KIND INCLUDING
+THE WARRANTIES OF DESIGN, MERCHANTIBILITY AND FITNESS FOR A PARTICULAR
+PURPOSE, OR ARISING FROM A COURSE OF DEALING, USAGE OR TRADE PRACTICE.
+
+Sun source code is provided with no support and without any obligation on
+the part of Sun Microsystems, Inc. to assist in its use, correction,
+modification or enhancement.
+
+SUN MICROSYSTEMS, INC. SHALL HAVE NO LIABILITY WITH RESPECT TO THE
+INFRINGEMENT OF COPYRIGHTS, TRADE SECRETS OR ANY PATENTS BY THIS SOFTWARE
+OR ANY PART THEREOF.
+
+In no event will Sun Microsystems, Inc. be liable for any lost revenue
+or profits or other special, indirect and consequential damages, even if
+Sun has been advised of the possibility of such damages.
+
+Sun Microsystems, Inc.
+2550 Garcia Avenue
+Mountain View, California  94043
--=20
2.20.1


