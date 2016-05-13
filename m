Return-Path: <ra43240@vinca.am.freescale.net>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0055.outbound.protection.outlook.com [65.55.169.55])
	by mail.openembedded.org (Postfix) with ESMTP id 4ACD265CC2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 May 2016 15:39:56 +0000 (UTC)
Received: from DM2PR03CA0029.namprd03.prod.outlook.com (10.141.96.28) by
	BLUPR03MB471.namprd03.prod.outlook.com (10.141.78.145) with Microsoft
	SMTP Server (TLS) id 15.1.492.11; Fri, 13 May 2016 15:39:56 +0000
Received: from BN1AFFO11FD034.protection.gbl (2a01:111:f400:7c10::111) by
	DM2PR03CA0029.outlook.office365.com (2a01:111:e400:2428::28) with
	Microsoft SMTP Server (TLS) id 15.1.492.11 via Frontend Transport;
	Fri, 13 May 2016 15:39:56 +0000
Authentication-Results: spf=none (sender IP is 192.88.168.50)
	smtp.mailfrom=vinca.am.freescale.net; nxp.com;
	dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received-SPF: None (protection.outlook.com: vinca.am.freescale.net does not
	designate permitted sender hosts)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD034.mail.protection.outlook.com (10.58.52.158) with
	Microsoft SMTP Server (TLS) id 15.1.492.8 via Frontend Transport;
	Fri, 13 May 2016 15:39:55 +0000
Received: from vinca.am.freescale.net (vinca.am.freescale.net [10.81.16.111])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u4DFdsEe002048; Fri, 13 May 2016 08:39:54 -0700
Received: from vinca.am.freescale.net (localhost [127.0.0.1])
	by vinca.am.freescale.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP
	id u4DFd3NU032597; Fri, 13 May 2016 10:39:03 -0500
Received: (from ra43240@localhost)
	by vinca.am.freescale.net (8.14.4/8.14.4/Submit) id u4DFd3OL032596;
	Fri, 13 May 2016 10:39:03 -0500
From: Ann Thornton <ann.thornton@nxp.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 13 May 2016 10:39:01 -0500
Message-ID: <1463153941-32558-1-git-send-email-ann.thornton@nxp.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131076275955460837;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(979002)(6009001)(2980300002)(428002)(189002)(199003)(9170700003)(230783001)(36756003)(5008740100001)(19580395003)(92566002)(19580405001)(110136002)(101416001)(189998001)(1220700001)(47776003)(4326007)(11100500001)(81166006)(586003)(50226002)(2906002)(960300001)(8676002)(6806005)(229853001)(2351001)(87936001)(50466002)(42186005)(106466001)(50986999)(8936002)(105586002)(33646002)(48376002)(5003940100001)(7059030)(42882005)(87636001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR03MB471;
	H:tx30smr01.am.freescale.net; FPR:; SPF:None; MLV:ovrnspm; MX:1;
	A:0; PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD034;
	1:TvhBT6Wl63gDzaQ6DdBvpVxuw0c2mxv6zB2f1ofvXi7KSTJnIPKYspWDyTO9cy8CxOfN9glt+pQkWsaMKScjF114GkUlH7abiiO9v2yD28A1exNU/RI1Wx/UtR+k96dpxpsNFH/b1Ga5fECmsvMkWFDgWGYCiOyds+nfZ4P6wUalsfLfegC4otd10seAWK/TCtNWwI+1PU6/+VJycXB/CgQ67bYJVzXYlvqiNqPIoOuKZh1DsarbJ2MmSNeg+GRMZT4EWTHZBcdqHwNigPeyQxPstxIvNVZqF61pYATGwMUsGluofdIinGVM2fW++jSYCdJIjCE4wm8lamLE5Kc6d85IX3yVvXS7nXOCZkn7MvNuLoGMSg2DFT6wwMB8qzkSy9ibryAXfUVYRlKtaa+b60NdCHuW8Cftr55WvfeX0DYuEKVg93SuN/ZNP+xOtcLtuaIF1y9DvJAbkMaD/9VO890duJBOUQR+puE8IOyUE8jA1ImngUQrL/1HiSdKVL6e5J6B40g4nfRz+v4pjOKe8PEm2hEpNAgSlR4OI4hlMJv26FsrwcEvtS2Hs5ebV8PzlieLiRn7AkcEoFlgYZTZyUmhoV2O0PtPxrtMWc1eAHWCkYHEjvsrK/tdFt1QXXrU0KcrNGKyXQyYcdXpSazQ7vwoWUw6Qftikif2MvJLu25pgkMUncla0TMEuSSzjPlM4hRNghwscmBtcXUyA8+xWimHL9CztiHFxN3V2wKJQeE=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 918b1b05-fab7-4db5-0983-08d37b44d543
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB471;
	2:os8i0fwohhJ2B7rqnUno8kXA7X10Ltq083DPlXZ24vwAlcDYItEglK2zkk8Q14oHx19T6+hyv6LTMvUULxL6YN1G9ioQy8ijlPtUxhFVUmmv0uI3zY3Szdx+BcAHo5qKO65JaaOey/9OXuZ/wbr4d/+R1IPN36VRm1xdp+82PXlnhVxuB262vyR9EFD69h+Q;
	3:0Un9BaxlN00dDV4AmeHpYG6bo1nfx9Q5smGUWvB1mFgfx2clAbOVf5SHdy8vrFIPhugqFTyqOSgJ2HH7HeBhUbpFtNHg7EZBMM/7+xDj+B6iQT+gwcOJ7EEFM4z6CuIWCabHq3LJgnNwiSOUuq2YN3oPKMSWKu7gC9HOztNfGFBjJnJoWnU4h6r/oxLmY4WoQllUUm6HUo3uoWBP8c3qRyU+fk2juVW3wT6Dv8obT6I=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR03MB471;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB471;
	25:OBupEOb0877/DqaB0M3Rt3d3Ve2cASQCt6wxV8WowfGG80kMe9CBQ0JkktmQXlv247I/Jb3F4GSL2bbzGSTUNTsdbgNnx2ve+usZu40SNB09wmRYGq7FV0c2taTfRTYxYJ4/21T+71xcgWYeESLQbleqqMN6e+OVPjLgzWvLP32xMcG8ww33wHe6uTTIjovFNNGMpThyQQAM4g3bMDGPcLT+iRmYvXJ12yXMn/UxPX46qRQvd+XFY+QYOE7WmTEMmJb5hwO8zNNJOSi0a19gymgckTxbzE3Pll6qXlTFPeysL4/CzpO3iFG+Yd80ngTZa6SQe1Etn7ofDAu3jfcMET9mwZHLRQH0eMDs/CLLAjT64CNevuacXe4wRxAclVaEQ0fpHc1aVq++lmrdQUYySc52y57zklvD+/Q3fUPYsUtE0q8q9aNol0MBgXMAOw5wf2/0H5KoYh9L/PvDCS0Wi3Yj2F9qVQATodys/l0L4LukBO3rVLFinOPIMzWoEmZZKJRqCvJcjb8lusMl3Qy+QqC7Pudus4xy8l9SEQVEwNqvso/VecKXDaKAzcRwXJvZ1pbWmkGN+TgNuS8lkQ0/tEttCtfsTtI3uYkqe1O3vqi+3lrQRg+yrTdZa8r8p+a+5bKcwEzRHIqGVLSsJ03U+mPPlkiP+n0wTdJ2GcYBZz+ow4VBdKEOjtSF449V9JK+nHV1nIcGl/K9ai/sFQgkB/6NWUhVZm/InbkxOpFaf637eIVtAWXuozgrCWUs5JbUr98SjH9lDX4Mu45AjkHB4zkdqeBT6kmYy/GLGh2MKIk=
X-Microsoft-Antispam-PRVS: <BLUPR03MB47156DA1E34F33C436B61809A740@BLUPR03MB471.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13018025)(13017025)(13015025)(13023025)(13024025)(8121501046)(5005006)(3002001)(10201501046)(6055026);
	SRVR:BLUPR03MB471; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BLUPR03MB471; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB471;
	4:RmC5YkAfxwStm6qBAPZn//OUbbt1Suvxx5GYx/6PZqeenLoHcjjj3tk3tWBOdO3Q/g0YN8bSTNUM9ldctnZPSYdKdM5sxqeJ9GR2h+U38TJxA+Xxl6nS6N2g/ID9Ai0Kj7YyTpOmkqZLmzWnc6DQu3hJq0U3PoQc5ZG5hP8couhe4I6W1DTeBPcGA5MGj4DWCmuUIoRym+0dONv1YCVDOCN9E4HpXzH5xnUCZnpt9+scjFzBUfDfkldZKarfxeSa7QS82NGDMmQBPDtH5oGrjEJNLCN35oQpMHrZgtYZTGa5baAx3+sKCmf8nWtievg0Jlu7h/fGoRpoexSQina0NDH8vcQHlzr9x7EcNKnFA2UNKAGS7H0W7p3/277F8IPDYGe02Gp+LYtQMJ0KsLdsP7d6+P1zj4u/q+TPZYBovysab3AmDitDyvnsFuTspPROBWCPhuvfz80VyHTAo2NDu8O9egtyyxWaFpWgHwsKq9k=
X-Forefront-PRVS: 0941B96580
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR03MB471;
	23:dRl0xZMkkYSGCd4s9+tIMhubFC6TzUtFUHSiD7xZDb?=
	=?us-ascii?Q?vIBMmBUV8P/SJx49LcETOfiCqYwwNDNN6rvbCefheQOBWYqxYffomt4i05+h?=
	=?us-ascii?Q?aQGInHw5GH4bXJ+brU3bRt0b+sVi6UhDH9opWgPY5a4Vn9Clhu0vWGQQfaGX?=
	=?us-ascii?Q?vEP+d0srn4GPefkMnVYdXiWgCnhOD8KMVT5g8K95ULk0rjHX5RXo1mVfINfM?=
	=?us-ascii?Q?I8xZ6rA86KGKNUPAXuWzPKrEhK1LGguRBLE9X0O7IXQkU8mJH6rj0fgjbUUA?=
	=?us-ascii?Q?b5OY4ZamLQ8EWq1uODS8+xPwcUK65ZWISZnqPbylh0Z+4ntfBW0DCm1a0lXg?=
	=?us-ascii?Q?/yh7IV68W0qLD+Vaka0P3o9wLawlKfg13zikJk4xDfJEvPPSVHfvlAwYxv1B?=
	=?us-ascii?Q?GDAx0JBlyA/AmfActXznVgJH5CJsov6butGSJguFZCGh8tV57yTs7EdtrLKB?=
	=?us-ascii?Q?+7wxAHaze6H0TsTjnYZCWC7cDsKRJXGUg+qRsP/D+4BbcVqfhHeFmu0dhKfl?=
	=?us-ascii?Q?z2ltBh0Xg1Esgrq688ErpWTU+GppwIZ1Bw56PMMgj17C0AGK+1C6HTpgRVwp?=
	=?us-ascii?Q?3fX2fsJZ14gqgwFzjCDbZgg5yBtgNqXamhV3GBDuvps6EICxGe69IoTOlzu4?=
	=?us-ascii?Q?UY8U9v0ydym851QXGc1V4rkVCedefkoaBzXXbQCnpmwWwEg8QzTt9kgYH757?=
	=?us-ascii?Q?ruzcURRZ+GHdYSF+EKGbfp3alzwpS9KCf0D+Jg2X0FoVYSQXvfqRmhi6TOXW?=
	=?us-ascii?Q?oaAxgap7JlDduxW3BymrVzFqBYmggWFxrL6yDYyRNSJnpshab8JROmPNLO6h?=
	=?us-ascii?Q?F1h77jsFNgZ/foBRiksmLWq10yl9nilB2BlNlt5TWPH7X00iLq1yCskhy2oH?=
	=?us-ascii?Q?OUyC2oflpIhxu0BoV2QgXmYuKIoxgcvZETCkzXSzHpzsTogWWxk6GHFspkOT?=
	=?us-ascii?Q?UY5yE4IaPnOn7x7ZhtArZ2WcnSEOIbktNq8DLfqfghxiN+rR/deRkdJmSo5W?=
	=?us-ascii?Q?0FC6DdIv6MbD4xYGMWZTYUDwUt0+PnwJ2e4GLAAWJKzsWI+CyE4mQFTd7xd/?=
	=?us-ascii?Q?S1EKSUJ2D1p/vVrxl2QbE3rlYZ0324MvjpgnhKsFgpZZxlTvC0Rzt5CcyGoX?=
	=?us-ascii?Q?QS8UdwAfWzsnNo7Tih2x5B6IwQYZavaVH3nBOVK4AR+SaJKcUDzg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB471;
	5:mdEeLUoZpIoAjNjhbxIlyMLkGWjsY0WVCiEOVPM2CVLXLIatwH96SjNLcI3fXryIcuniRrW/KNqkdlnDT+S4OZ4dGHtcAQ4DXU5CWs+rzQHDIwcygy8uOkseQyxhrPYB9LxdUlfIARg8pBSoE06xT3KqtwbDjNkbh9oQ6OMmyU4=;
	24:O0BLZAwiYrOxDT1qMkB+8DdXlnQAxsaP9dGE4tcRq9cNcQVYN+q7s9//G39mHlmgp6DbkAtMQS6RiRW4mfHtvsXu0ZukwoeGuuJV4iySPbw=;
	7:e0QZroBXhIv0qcf6xILOC7WOvH5TklzDCDB0Z9ObN3mYy9XRYyYZQMcsBX1p/GjIKMkjp+Ng27qfEDc/1B+uJpLfj/4R/j3yU125LQuGNpbGsWKP6Rc8+8rUx80hL2QG+/4MR2F0eIHmNQ3BoQ1uh2q4xoFBUUv7ibFL+AXO7XBaw2zcOxL8Pl3hbrqNwgI6
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2016 15:39:55.3432 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR03MB471
Subject: [meta-qt5][PATCH] packagegroup-qt5-demos.bb: Includes some interesting Qt5 demos.
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
X-List-Received-Date: Fri, 13 May 2016 15:39:57 -0000
Content-Type: text/plain

Signed-off-by: Ann Thornton <ann.thornton@nxp.com>
---
 recipes-qt/packagegroups/packagegroup-qt5-demos.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 recipes-qt/packagegroups/packagegroup-qt5-demos.bb

diff --git a/recipes-qt/packagegroups/packagegroup-qt5-demos.bb b/recipes-qt/packagegroups/packagegroup-qt5-demos.bb
new file mode 100644
index 0000000..436ba03
--- /dev/null
+++ b/recipes-qt/packagegroups/packagegroup-qt5-demos.bb
@@ -0,0 +1,22 @@
+# Copyright (C) 2014 Freescale Semiconductor
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "Package group for Qt5 demos"
+LICENSE = "MIT"
+
+inherit packagegroup
+
+RDEPENDS_${PN} += " \
+    qtbase-examples \
+    qtdeclarative-examples \
+    qt3d-examples \
+    qtsmarthome \
+    qt5ledscreen \
+    quitbattery \
+    qt5everywheredemo \ 
+    qt5nmapcarousedemo \
+    qt5nmapper \
+    cinematicexperience \
+    quitindicators \
+    qt5-demo-extrafiles \
+  "
-- 
1.9.1


