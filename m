Return-Path: <ra43240@vinca.am.freescale.net>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0097.outbound.protection.outlook.com [157.56.110.97])
	by mail.openembedded.org (Postfix) with ESMTP id 01D1A65CC2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 May 2016 15:38:57 +0000 (UTC)
Received: from BY2PR03CA004.namprd03.prod.outlook.com (10.255.93.21) by
	CY1PR0301MB1194.namprd03.prod.outlook.com (10.160.165.25) with
	Microsoft SMTP
	Server (TLS) id 15.1.492.11; Fri, 13 May 2016 15:38:57 +0000
Received: from BY2FFO11OLC008.protection.gbl (10.255.93.4) by
	BY2PR03CA004.outlook.office365.com (10.255.93.21) with Microsoft SMTP
	Server (TLS) id 15.1.492.11 via Frontend Transport;
	Fri, 13 May 2016 15:38:56 +0000
Authentication-Results: spf=none (sender IP is 192.88.168.50)
	smtp.mailfrom=vinca.am.freescale.net; nxp.com;
	dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received-SPF: None (protection.outlook.com: vinca.am.freescale.net does not
	designate permitted sender hosts)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11OLC008.mail.protection.outlook.com (10.1.14.255) with Microsoft
	SMTP Server (TLS) id 15.1.492.8 via Frontend Transport;
	Fri, 13 May 2016 15:38:55 +0000
Received: from vinca.am.freescale.net (vinca.am.freescale.net [10.81.16.111])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u4DFctbE001684; Fri, 13 May 2016 08:38:55 -0700
Received: from vinca.am.freescale.net (localhost [127.0.0.1])
	by vinca.am.freescale.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP
	id u4DFc4nU032507; Fri, 13 May 2016 10:38:04 -0500
Received: (from ra43240@localhost)
	by vinca.am.freescale.net (8.14.4/8.14.4/Submit) id u4DFc4kr032506;
	Fri, 13 May 2016 10:38:04 -0500
From: Ann Thornton <ann.thornton@nxp.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 13 May 2016 10:37:58 -0500
Message-ID: <1463153878-32468-1-git-send-email-ann.thornton@nxp.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131076275361425870;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(428002)(189002)(199003)(9170700003)(33646002)(87936001)(8936002)(105586002)(5008740100001)(81166006)(106466001)(8676002)(189998001)(230783001)(2351001)(42186005)(48376002)(50466002)(19580395003)(19580405001)(50226002)(5003940100001)(92566002)(4326007)(2906002)(229853001)(1220700001)(586003)(47776003)(36756003)(101416001)(110136002)(11100500001)(50986999)(6806005)(7059030)(42882005)(87636001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR0301MB1194;
	H:tx30smr01.am.freescale.net; FPR:; SPF:None; MLV:sfv; MX:1; A:0;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11OLC008;
	1:6CHKBtISyWh0OHqPtiqC6XclTOo3sE0Rf292Y0aL6snDJ+O5rqc645Twq8TZgeRD5vT+FpCSPtpYQmk6YE3r5E3i5nsYkMmqXTxggYlji6VPNZbUibpiR/H6UTuPrtJFzEm2JJkwPxkzHB5Q9XRkle/WOM68XXMMuScFgqAQJzEw4ttCp5R7oH540lq1p2TPqAS+I2+0d2UvoJGD63ii69Uf1lIsqZG0HCuFMaTTyucuYWx9QVgETpFEeiGsbu23ghvRQos6csHUh4KKoNy8We/z67/q41vqcRFrllhY0eIHQ60fXUqbeeouyj5bV6ksF2IoT4//DxuK9O7p6aNxOLrR0AMkdkMK+92+DRzgjKl5ZKhzZ4S2ZFuA2VjjTb04HUV+d+UjVHHsgBhXmtaoXePvGcN6xqjC5j/IA/EQDwX1PGW+uimrHGsc6jN/aGbcX0i9JDDZ9yWcHfghMaldZYIdNmEbD/8bt5X3DBBqdaRT9TdrhKVGQLF28NGayrRT0jYTEdhX/jKVEUjjwKs2Ip5rC2b6YulV4FZ9BxGDFYCD2wDQAapb93671e2i4811Y8IFlDMQUCkG99EBZ/IqqMeV/+NuErkaWMyvnLb5f6sE9Vywe+8BUszwsxxpIF85nErftnp3DDCFZzRecfKt43pjShYKzZpb7SURsd13BhSgMSjNZfdq2MZ2WXm88ffg3KUt//c+M9fow+2YJkvhPw==
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 9e4c3f58-fda8-46c9-c872-08d37b44b1da
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1194;
	2:Y+T6B/X8AVKQ+R7UMZ02iafXL2LCD96bl1P3LzsqBwiwjYvu5Ji1Lpiivu6GbU2ZFqmpMtTti4PO6XZSxmhbiv0SOHHvWRaf4qMwUtq/YW91Wtmb0lqOXLja/hMrx9ve6JzrYAR5iLWoq8wl7wV5Xh/NZAGtnQd1BmVnElz7ve9MsQprxPCFZC5JUkMr1htH;
	3:/Us5k04HIHIIJT++PUfVAF0rtbqqGyMmCPsSEWCJLDSkSmOec2a+QYRNxPNGwrNr+9sEXf1FkOIkf3tdtdo1wCEt1vrc7UdAoEI/rZ+TKd6aWnxQOTPJNA4D/+tPanMIEZdVWkt17gcTS/UicUZMSugppC0+raGnRxpt/j/OBsQ7yX1YWHQ10ZP9QWPj9aDmUQxWz4QaRMpPMEX8Y4JQcPv86SK6DvPiPYPElqw/CqU=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB1194;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1194;
	25:Ski1oFn8S5Ktz7krBNlrNX8whIxtIaGZGIGW397EDle5E6Bbb01VfJllQJUI3m+BNG66vfxrlvhYPhiCTy3Mm65q3eb6fPNLuhVqR2Z/6bmv80DlL/NifkqPDkpsAJWATKWCVMS8y0GAyTQ7NrigpWJL6OHv3T46AA+YDMAndAov6t4zfzGRINlifchUMjnPuNeQQ0oaz7xSPfcnEElUyDclr+GyXc15ztPYtOc8dC8GVs2Gx0CNenY3+co9uBu3goVbF//6Ha3SUHPKVn5knjv+dTZE/q9Or6uAciEIku3IjIFOG5GtKoOSXtAMnUSrM/EwV6b0CJmwAd4d95Ji7S5pEYNONB/oQSCGMdzfm1caV7X/pI2z0Iqja5MQDQ+pZ6Xon0Tai/RLt8hiwD4IRqH2jqYfqlZMeVWSEe7Em5jRwYEmTUmwUMC5Eog8kA4b+F1p6hpYQXbdln7CceOXifFCoyTFLTHWb/GScEHA7yS8Oylnb4qnzv/gCzcxCYCxF2xcFsspjFLDGT0bmVVyvegeEsJw/czJzvLkNR6nMHiAsXtoDkaf2rNkv5POppRJBkVcuM8awl8cMnVknzluStpnVYA8chnfufeU3mu9lhzUDD4aLfC4xe0Sd5q0EJPqMLUlK4XuoLEPTvr5iSVSsB5m3c8b8mXiC46qx462ROwevjhyM7V2SP19+CWa5a23Iw0jannh2pOqAVLoQdnetX8vaxaxglCYHUyQT3IrPA9H+wiNKCLe4ab0FwoGd0sHHIRGTw/U4qnN8sFhLmAv7DoWkJYLvsEsatwfWb5KTEw=
X-Microsoft-Antispam-PRVS: <CY1PR0301MB11945CFEA2B0EAE7579928159A740@CY1PR0301MB1194.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13015025)(13017025)(13023025)(13024025)(13018025)(8121501046)(5005006)(10201501046)(3002001)(6055026);
	SRVR:CY1PR0301MB1194; BCL:0; PCL:0; RULEID:(400006);
	SRVR:CY1PR0301MB1194; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1194;
	4:JvKkbgAvMoifJvi8xZDvG1hrOG7jiq6X/rzhiAKniJvzvcMqjCCjlTrQhHmxJN1ACaNox1rRLmvaRcKny/3DVMqlv5AlJM0sv10hDEsuKUvCWLqWFqGtI6Cimwdg9ImmQUKoKhwWt/poBLGl6b9UM0gdGHv5irCwhNbuV0ZFwv7gsDo0wZ7y6iDSm8ZzBlSIZCj1qeUFPep8YL03Mvd+ubKplsjc4tF5q0OaDKeaHenldlxzTbvKA/+tY+hvTlKeUmr83coOXqvPUQ7BOVMQlBEfmzO7s73qnaQZQB3TExmDK6xIbre9ezR/xo/zXAEaGqp6XrT8vaSdq9eY2gK75vuZ1wW2wbIA+ClJwkGhTaxmHMqI64JePTFm+p4KMNHXwreENTfSplvl+SdRg8BqI7rIhb0X1n8/6WV6hXylr3onrR9XVfZDgd4LUCT6wDqC0kDCn4nPdYh9s8f1qI1ropnURYZSgZc9W5xqxwDjFwI=
X-Forefront-PRVS: 0941B96580
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB1194;
	23:2Tt8O0MGYRIeifdtSzaTwnkfBh4WgfYUqTzEVyt?=
	=?us-ascii?Q?4eNVR4K3Xrwrw2ngCkLl/wPR75VJ+SNxUqecSq07afcXJ5jGWiVHPPGRGpcw?=
	=?us-ascii?Q?DLO+894EhbuSzwRKM1JzDw/VL4Z94PkA7DMG48Imll7ZZAXRQaZm0bFHAxYY?=
	=?us-ascii?Q?9iW2fJmijr+xtOtuLqg4LHRxqdJGajAG3sAqvbCVpIruZGb5VFh0NHqfHXe4?=
	=?us-ascii?Q?pSBkuQcVXCfUagRKvx3wUqz+2RTXZ4lGRAI3oRAqtN8OOv/UonL2xl+r95Vm?=
	=?us-ascii?Q?bApM3RncqZW6t7T2Qo+VDdUXYmouk0FNNUjxdXTG2X4HcDIIW+7CHIu70V35?=
	=?us-ascii?Q?t53tcfBoBpiv0Z43Idh5lS+vdh14mdYxL2gtAh9zJViZbZdJhr3786r4iZAj?=
	=?us-ascii?Q?J1tHyw16oqri+/l2Gfq86rMuaj4KPFx+4+Mldem/ZvrNDl5fZWOG/D9u5Usd?=
	=?us-ascii?Q?+YtgvIpU1sutwicElHhXjVMcPsgyli2hRkW1qYkHeryweHQSiD73c/K3V5rG?=
	=?us-ascii?Q?24GYesZqglubH+OYJnl7Uv37G9g8+hx7Dx6yDzmFSjSagnC4GOjVjArpxios?=
	=?us-ascii?Q?/aGQi7AR/o933xTK/jFkJ9bSPJ0BZH14Bxfc8a36SqtcWnVoufWeh2nF1PWt?=
	=?us-ascii?Q?PSFNL/iu/CGvoicDLK5skMh0q8uv2mm3h8kkWY1JJ9v/cIQEooxTiZEYru1q?=
	=?us-ascii?Q?cukxg1BoQIRZdY6oWAdEpfQMwRrMQLohwQ+FXvGdIXujdQJvyrV7DqXPBxCw?=
	=?us-ascii?Q?nr2atlo4bb23CZHrqvmrfNIqTWEsAJRTQAnQ2qOwbbpN0ayJil0SUKJioq2T?=
	=?us-ascii?Q?AnI3RAl/UZ3tJiVLDbvEU/SFDQayZR4ffdz/h6yPE71Iohp9w+l0NnX0WAqp?=
	=?us-ascii?Q?5xD54CPiN/2j5mIr9Hs3yLVYhvNsNFEL7/BBQ/du7ffLUhuWabxvcLdY8t9l?=
	=?us-ascii?Q?fkSkquy5BR/258Zs70OYcSfFnuTlGWgpq3gke3FccXcA61y0u7v2z7YIOofY?=
	=?us-ascii?Q?EOf+BeYCGh2zCo60oxnfWsmKOHSPkdoT0xk7pGr0XP60vUQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1194;
	5:SXOlc4Ygp2oesJ/hS8STjxKE0BMhUa/qH1r+0xbUiWd0oSG3cy3YM/TCqNoI6stm54jO2tc1S3shoROoGmHgHFEgBLbCyGkkBKdc4xazI+LwIBTIQ4i6q+ZjZgsf4ZJH6n/W7ybx828/NPLHTHBhTmTC6ObStFlbGL/B344MPiY=;
	24:3pLgufyKTgU2rizzxZ6wf3weeW0T5liTzCEzwVXJEYYpNnhr5/JqirKCBajtfguiQCPXiXq4uNjLy2iwBFovZmf00oTnpPIpbLg8db5C6LM=;
	7:utygBhlwgZ7ASQzHtFGrryBbYx0yBDRP+2HaTGLfTpv0LP4rpZlBlthx/idse4NHQlnBp5ByfVHl+xOlFp/qKbGkG94Sipn4U2aeKTg3KBxttFyGCayGOtUrUzKRT3/n9C1i+oAR/IRTgrwKHAcogh/s3GcIcIwJhonaJP0owJXTMs7Or7h+wRrFyWSjZwih
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2016 15:38:55.9397 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB1194
Subject: [meta-qt5][PATCH] packagegroup-qt5-webengine.bb: Includes qtwebengine, plugins and examples in one convenient packagegroup.
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
X-List-Received-Date: Fri, 13 May 2016 15:38:58 -0000
Content-Type: text/plain

Signed-off-by: Ann Thornton <ann.thornton@nxp.com>
---
 recipes-qt/packagegroups/packagegroup-qt5-webengine.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 recipes-qt/packagegroups/packagegroup-qt5-webengine.bb

diff --git a/recipes-qt/packagegroups/packagegroup-qt5-webengine.bb b/recipes-qt/packagegroups/packagegroup-qt5-webengine.bb
new file mode 100644
index 0000000..5d09efe
--- /dev/null
+++ b/recipes-qt/packagegroups/packagegroup-qt5-webengine.bb
@@ -0,0 +1,14 @@
+# Copyright (C) 2015 Freescale Semiconductor
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "Package group for Qt5 webengine and examples"
+LICENSE = "MIT"
+
+inherit packagegroup
+
+RDEPENDS_${PN} += " \
+    qtwebengine \
+    qtwebengine-qmlplugins \
+    qtquickcontrols-qmlplugins \
+    qtwebengine-examples \
+"
-- 
1.9.1


