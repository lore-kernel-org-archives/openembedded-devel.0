Return-Path: <ra43240@vinca.am.freescale.net>
X-Greylist: delayed 6079 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 02 May 2016 20:54:59 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0098.outbound.protection.outlook.com [157.56.110.98])
	by mail.openembedded.org (Postfix) with ESMTP id 7F0F7731D6
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 May 2016 20:54:59 +0000 (UTC)
Received: from BN3PR0301CA0065.namprd03.prod.outlook.com (10.160.152.161) by
	BY2PR0301MB0711.namprd03.prod.outlook.com (10.160.63.153) with
	Microsoft SMTP
	Server (TLS) id 15.1.477.8; Mon, 2 May 2016 20:54:59 +0000
Received: from BY2FFO11FD022.protection.gbl (2a01:111:f400:7c0c::188) by
	BN3PR0301CA0065.outlook.office365.com (2a01:111:e400:401e::33) with
	Microsoft
	SMTP Server (TLS) id 15.1.485.9 via Frontend Transport; Mon, 2 May 2016
	20:54:58 +0000
Authentication-Results: spf=none (sender IP is 192.88.168.50)
	smtp.mailfrom=vinca.am.freescale.net; nxp.com;
	dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received-SPF: None (protection.outlook.com: vinca.am.freescale.net does not
	designate permitted sender hosts)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD022.mail.protection.outlook.com (10.1.15.211) with Microsoft
	SMTP Server (TLS) id 15.1.485.4 via Frontend Transport;
	Mon, 2 May 2016 20:54:57 +0000
Received: from vinca.am.freescale.net (vinca.am.freescale.net [10.81.16.111])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u42Ksu9A025284; Mon, 2 May 2016 13:54:56 -0700
Received: from vinca.am.freescale.net (localhost [127.0.0.1])
	by vinca.am.freescale.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP
	id u42KsGs5030446; Mon, 2 May 2016 15:54:16 -0500
Received: (from ra43240@localhost)
	by vinca.am.freescale.net (8.14.4/8.14.4/Submit) id u42KsGNB030445;
	Mon, 2 May 2016 15:54:16 -0500
From: Ann Thornton <ann.thornton@nxp.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 2 May 2016 15:54:13 -0500
Message-ID: <1462222453-30407-1-git-send-email-ann.thornton@nxp.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131066960980467300;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(428002)(199003)(189002)(36756003)(42186005)(230783001)(586003)(11100500001)(189998001)(2906002)(50986999)(87936001)(1220700001)(81166005)(4326007)(229853001)(960300001)(50466002)(19580395003)(5008740100001)(48376002)(19580405001)(33646002)(2351001)(47776003)(5003940100001)(110136002)(92566002)(106466001)(101416001)(105586002)(6806005)(50226002)(7059030)(42882005)(87636001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR0301MB0711;
	H:tx30smr01.am.freescale.net; FPR:; SPF:None; MLV:sfv; A:0; MX:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD022;
	1:okoFz4OBJ8PTZ9meY5BtBOc80OI3Miyw3Hcjy8okY1oCPPAKKWQjQJpbnrnOxzoUug0OrhBWzyJLqDavcde3YvJ1Co629l2m40xvyQiKPcKTKkKPuWzWDP3CA4mqaAZkrdW3b2zQCEXUf9rxtIM0sm7GvmZT5lglKgwImupkJAlsmvX+VrApgG/5MPia0nIlCOulmRNUB996EOBcP2f+Ad8bVGxLsucGVmgiRCfFZcxDQ0FqHlZ3onL9lFwkE7uXDW/UXmSH8UKlBK2+OY4bm0FDRSK6QntpDyzUzBmi7q2FKZk2jCGDs+QUoKalWrtJY9c8rXQ7NAtoy9cubhG7jCshQifXRnA4zDQRGLAF9HhBshgq7OfhPoRhZqsN/RXh9qcvdepn4Mif/7kWRtoDHFOWCkauUNdVSqvTrkVa8Rynhef72ex7ijzSAUSMMkoHprar92uFmjVdXpqfEeJVNl+POlMtH/4UW/Syxb4QDLZQzyL5Lxx3KuX3ayekXhbVTsrCwjXxidTk0LMS5YPbGChN4N3vDUdcFO490sNULCxv84t8VlwWvU9ER6+l34FxzmKlf/y6rJtYhv+HQ2/vK8mZXpEIw7IAKyXQ9ZIOvLPOm5zAD5kFCaVPGB/aUZo2wB0R5l17qirPckqDazbQwOWYmRFCIdzTgBh7h+oxwEDnzwUrGd1adS6815t5dTJ0ZTOZA3oj5LrBMIvHZWBBMIToK5QCjCkn2T2F30K4mD0=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 15a1c2f4-5e6c-4f69-d3a4-08d372cc056b
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0301MB0711;
	2:M4mXn1StrLQgc0Tk6wr0PSigyvxwE6bfJ6vAe3Vlxl7Qlyz2+C2FiGmE4xK8cWi5Hs1lx2zjQdE5Pvhp+6y9RDdhJMyqiUeLeD8hmK6s6s/xq7s+Qzu2gwr0QCuj67FFfkTI5kEf/ZylfAAzglOrOxD+IEpznXAlSCKUvsC228Q72/9COJIftAD3zoFEFyCp;
	3:0uofO1kiCnefHcCyztzoaV2wxDE0Cn3Dfam53SPV7ML0f/ECdP5pILby2P2QzebIQycU70ngoZ06Lgw1mO/fP331Ud3bpjVIy6k5BYzqA1zdzZiDjiEk9V4BcoPkPO5l9OMZgfbjU/wMZBr0fVsHK4OjAATuaCuhlWszdgeX88e4X7tSrjUjeLw6P4GPYcs48CuM1kxTjw4Wark1MXtPzd8Xg8uJcEx9HFY8oNbujUQ=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY2PR0301MB0711;
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0301MB0711;
	25:5kwBf1CSdo71MRU18xu8THNbTATKSwPChzjDrnsGi0niJqYtEyMlyBnYM4FIzrGa+vq75xrWmSlIEftH38yD3woknySi1xFNdI7/Ce3QovkWTHw+rn2c80EylH0mNJ3+IoBxippfVOQjwdvWyXKGOHM/hVfElGXEubMehj2Y08uUBOPCIDy3SY6/n0zxspfQZkS4dUh4SQeerDaS28XC83UjF1Yrp7EvIq5QyfUsU8oyBeedi8yBoYOA+P92n30Skf+1OsSjYGEyZfRZIFVjDuFjhuBz81r8K1xxun7iaywggzouh7qJguti1pVx6UOZ6X/EzEXoFTwqamIQXaWnIScO7vnfFtz78TT7pE+WsciVbEr5jUMkBN/S0Ylysmjfoqaj/+Xbnvzlj0wib0FWrA1tVhVLFDF20HeoP1YPjT3TJFiIw+iP4cqDli3P5PjkmKY7pcwzXzV68E+QOUTgGg29jJUAP2djtTcjKQaHQpJyxnIZ5N1E4/1km692RkUMmHveGmw4vatWBZCA1cZO3qSQClPnPHqD2CFi3CKTzyzsgQB28H7QEBqeVrsu8GffAyDdCNp9Cun/jW1ybRCWek/LBZdeYcu9AInL3EO/yRqLktz0u6vTbpCJBqoGKjlSQDCpIz3cFHZEZ51uLqxS6rRfTLKB4Z+ClEH0gYXtyTSn9Pyo81gkyFvhaZVoLbj+VPGT51rlt3qMoUiq/zpDFA==
X-Microsoft-Antispam-PRVS: <BY2PR0301MB07119004E94B280063FD43479A790@BY2PR0301MB0711.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13018025)(13023025)(13017025)(13015025)(5005006)(8121501046)(13024025)(3002001)(10201501046)(6055026);
	SRVR:BY2PR0301MB0711; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BY2PR0301MB0711; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0301MB0711;
	4:rJufgwwjt17HryzljkOUpdZdOPLCQc+MwiC9V/gdzzCf4cOYi0FjZz3cUJ2HhEW+aIION+kYjjAqvx5Tq9YxQoX9JfJopa81SknwE6DxosAJn2o+WarJHxceVY2+KhOwQgMnQdy9xMRoCX637NQfY7dvidLWByxebAsBSc8ZSnPnwigLVng4D9Xtj45yLxFtlX3moUiHSqU3jb7LCgZWFRJLUDSQNoUZ9DADwl1L+9bpdtwSTOaoHxY57A8hHzbPOK/WYB8qzOnOmJCqctqatXB8BXXzLs14wr35jg34TRWj82PBxKbDYIdiaKmq2MDlh15OjVQ1qZisNYgENFrIjiVpDbHa7UalFLLukpeJQ1WKwYKSNHeFlBmyNx7Na1SC5H2xHBTqzYoyRL7r/pfNTWBLTeVaoIUqOMkc/SmWwlrmXKTyJ1L94BX5GUEiYOi0Rinmb1tJuIM8QfGsE0Vi1oUO60mVnowpXtLq1nqNeI8=
X-Forefront-PRVS: 0930AAFAD9
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR0301MB0711;
	23:Btzr44Ek13axhdv5USlbj/yApSF9F3mcC4DkLTm?=
	=?us-ascii?Q?OBhdZY0siXfTf2poQVowSpQjIgIjPkL0OjDUJA10o6WQJtjEdddR/TYK9G9b?=
	=?us-ascii?Q?UHzQYojOvmRTCuPEjdiHRRtnvMQvfbp+BazDmTeaUZhfdqHnmAqidxn8pty+?=
	=?us-ascii?Q?ASbb4EQFlA+JwqLB0A8SB2V8ai8zOXPMPvOykWXcbtTbgS3TTJZhQoZ+8hNG?=
	=?us-ascii?Q?HNFagnNPQKRzHXBzc1N+uRyvFfLIlmLBBlwGyvHQ32ryHYmn7KthR4370h/W?=
	=?us-ascii?Q?ZC9++xKSxc4frp1uNgJtj5GtBCokUSS082sTaM3AWO8JCY6Orb2FBo3h1p/E?=
	=?us-ascii?Q?TG1GS1BWOYhMRagvOtFneq2GEqdL+/+IyR9zrjOff36EjYRrEsyPafehM9c4?=
	=?us-ascii?Q?sRifOQBvn/ujEHFiyMk5Bsz8Eui+4FCm86q2CYBfxZ2QLNipOQc/kU/w+Ufk?=
	=?us-ascii?Q?ifGbM/uzwxMQT6jYVnsNQEEE1QaTwR0D+ao3a6c/Avc5rB2sc8+0iY+ogNQO?=
	=?us-ascii?Q?gz96qXqsMw8RwbvUA5CIQepkXPtc3iY9OgCR3qiUwJNe7A2cx7MLE0WW5uOj?=
	=?us-ascii?Q?lU3nGdS9JKbkirtd1wIhIfLH426n9FuYeGMyM8yX9W+QWYh6e77WaUTlEpJU?=
	=?us-ascii?Q?uSKcJHVR47/riUEh+4R0Q+im1QmQ2PNTQB87xdi15bfNW93YfiejJjN1sjZ6?=
	=?us-ascii?Q?MsQ4x6TrOSaeRCn0vP1aY0gxwndcJXKnPJQZBUkL/uwWRiZYRj6YGTFdttef?=
	=?us-ascii?Q?jAwRzirRA35VgAUaNV739NEPG/SaWYdh9HNl06IgPYN1+fYDTElMYv9Vykah?=
	=?us-ascii?Q?/m7NPE6mrm7OcshBP83bY/swIcQ0XOOumOjiLAgH1bUWY5zS3RqpdPhDrzZ4?=
	=?us-ascii?Q?FVaxRdZehwNRc7BsRntrIJlZIJ/ZqtCnkS0KPgLKI9XaUKs/G3muWSXunj5G?=
	=?us-ascii?Q?6bBPjnpV7SMWsTzMofmQi/rfrwughusSO0UZHM0chmvAItq7YLZeFyFBddxq?=
	=?us-ascii?Q?8Ey4=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0301MB0711;
	5:zqkiFlvZPNcQHsiW0nAqRl+g85PkedU9GA1rw3Ezvp8HuhkcDlhg3dgwhejOw2rAeJqxPvGCtt8puiYPQRPng4sCe7qkQJqJEHGVhMurZ6rBI5z8eZw4AI9yn2fifzOLb8e+L5dgmPrg41OSZhjvQnpmhf5efVszeui7keqQXjI=;
	24:BnavLu+YLoMopxwmnTyPn2vzVhLf9relfU4B/I7o+/WXA+xZDREqPLL7/vjQKxdY6HgCgnyC2G2avjTHTDHV6H5x0W91gXzyznlTQC3jyBA=;
	7:654JZIFlKTGeP4uQqj3AUACDVBh6AOfwp2RpW8iaM+rAa94dKmY3Lv7B+JbiNGPeVxRApIXyh00BS+W3puWg8Ou9i4PKEVdhQgvO0M9NMm42Gi2jgHREJcyVmgtpm/td4R0sZIu+MgU7xyp9yWXBHu51yx4DLgR/CZ7y1rkB/JataxIdqFo02Nabh3YI3a5Z
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2016 20:54:57.7191 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR0301MB0711
Subject: [meta-oe][PATCH] packagegroup-tools-bluetooth.bb: Selects the tools appropriate for the version of bluez being used.
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
X-List-Received-Date: Mon, 02 May 2016 20:55:01 -0000
Content-Type: text/plain

Signed-off-by: Ann Thornton <ann.thornton@nxp.com>
---
 .../packagegroups/packagegroup-tools-bluetooth.bb  | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb

diff --git a/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
new file mode 100644
index 0000000..bdab389
--- /dev/null
+++ b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
@@ -0,0 +1,40 @@
+# Copyright (C) 2014-2015 Freescale Semiconductor
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SUMMARY = "Set of Bluetooh related tools for inclusion on images"
+DESCRIPTION = "Add bluetooth tools based on the version of BlueZ in use.\
+The tools that have been tested and work the best are pulled in \
+automatically.  The same packagegroup can be used in a recipe without \
+the need to know which version of BlueZ is in use. \
+Supports BlueZ4 and BlueZ5."
+
+inherit packagegroup
+
+BLUEZ4_INSTALL = " \
+    obexftp \
+"
+
+BLUEZ5_INSTALL = " \
+     bluez5-noinst-tools \
+     bluez5-obex \
+     bluez5-testtools  \
+     libasound-module-bluez \
+     ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', "pulseaudio-module-bluetooth-discover \
+                                                            pulseaudio-module-bluetooth-policy \
+                                                            pulseaudio-module-bluez5-discover \
+                                                            pulseaudio-module-bluez5-device \
+                                                            pulseaudio-module-switch-on-connect \
+                                                            pulseaudio-module-loopback", \
+                                             '', d)} \
+"
+
+# Install either bluez4 or bluez5 if they are in distro.  
+# Otherwise install nothing.
+RDEPENDS_${PN} = " \
+     ${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', '${BLUEZ5_INSTALL}', "", d)} \
+     ${@bb.utils.contains('DISTRO_FEATURES', 'bluez4', '${BLUEZ4_INSTALL}', "", d)} \
+"
-- 
1.9.1


