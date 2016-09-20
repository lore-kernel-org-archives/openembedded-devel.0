Return-Path: <ra43240@vinca.am.freescale.net>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0058.outbound.protection.outlook.com
	[104.47.37.58])
	by mail.openembedded.org (Postfix) with ESMTP id 137776076F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Sep 2016 16:43:45 +0000 (UTC)
Received: from BN6PR03CA0062.namprd03.prod.outlook.com (10.173.137.24) by
	CY4PR03MB2439.namprd03.prod.outlook.com (10.168.163.141) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.619.10; Tue, 20 Sep 2016 16:10:04 +0000
Received: from BY2FFO11FD046.protection.gbl (2a01:111:f400:7c0c::127) by
	BN6PR03CA0062.outlook.office365.com (2603:10b6:404:4c::24) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.629.8 via
	Frontend Transport; Tue, 20 Sep 2016 16:10:04 +0000
Authentication-Results: spf=none (sender IP is 192.88.168.50)
	smtp.mailfrom=vinca.am.freescale.net; nxp.com;
	dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=fail action=none header.from=nxp.com;
	nxp.com; dkim=none (message not signed) header.d=none;
Received-SPF: None (protection.outlook.com: vinca.am.freescale.net does not
	designate permitted sender hosts)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD046.mail.protection.outlook.com (10.1.15.170) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.629.5
	via Frontend Transport; Tue, 20 Sep 2016 16:10:04 +0000
Received: from vinca.am.freescale.net (vinca.am.freescale.net [10.81.16.111])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u8KGA3rD006197; Tue, 20 Sep 2016 09:10:03 -0700
Received: from vinca.am.freescale.net (localhost [127.0.0.1])
	by vinca.am.freescale.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP
	id u8KG76qE006437; Tue, 20 Sep 2016 11:07:06 -0500
Received: (from ra43240@localhost)
	by vinca.am.freescale.net (8.14.4/8.14.4/Submit) id u8KG751w006436;
	Tue, 20 Sep 2016 11:07:05 -0500
From: Ann Thornton <ann.thornton@nxp.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 20 Sep 2016 11:07:02 -0500
Message-ID: <1474387622-6398-1-git-send-email-ann.thornton@nxp.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131188614045677948;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(428002)(199003)(189002)(105586002)(110136003)(11100500001)(50466002)(2351001)(5003940100001)(189998001)(229853001)(81156014)(81166006)(48376002)(230783001)(8676002)(106466001)(36756003)(50226002)(92566002)(47776003)(33646002)(97736004)(586003)(19580395003)(8936002)(19580405001)(50986999)(4326007)(8666005)(356003)(960300001)(305945005)(7846002)(87936001)(2906002)(68736007)(5660300001)(42186005)(626004)(101416001)(7059030)(42882005)(87636001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR03MB2439;
	H:tx30smr01.am.freescale.net; FPR:; SPF:None;
	PTR:InfoDomainNonexistent; A:0; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD046;
	1:rQ7ZlBGb8a7u27LACW1+XhIA52Ebg8J61kpZz+wdPyJ/kYdcNroc3/BtwT2OIetjJiVoYoo8nIdjefL5owPCOjZrl8IWWqNmrYqGc34JUb18ttaUMNVTcNdk7FIWLRMKHhi5Vi3BgO+NroGOPqsfoq9+txHST6rl3K9PPDBzZquhL5PdmYoBIxQp5t+CFQNxlZw9viqxugDayDVymzNCexfaivK+57cKiVRwjDtlP3r3soedHBxhPSrEmOk+QTYz05MKCbX3dfuCzQRdgIzEixBPVAosc4k7ktB4A3rv/uMgQVTW47/nPs33GEntsHwcjcX7X4SossDPuF0GuRxiPzKFCRzqd+2g/i4npJY7ZRW++Xuz7fXlArjuxYDxApPMJUykWw9/vZIEAfuAVTxYtQUDVnMOtZa3A9dFdwoaIOID4PJR2TcnzjGiHeC2Y4rTcl2BVxBFmlTPNHr8xr1GlQXbGB0i9LtWTDY6SuTvPONXtCwWjrt0ukb9ytvojpsOtcodUf3IjL5njh6+RHXcB5Vw4vr5lwHsJGcDV9s8nCzu9z0miMR1Sdmb/qc2y2CgDb/O6kA9g60UXJIAG+bo/eO03VB/yV06RF2gO5II7c5cZKRu2N+Ym3PjoYE/VU22ZwdGmx0NqHMMmIPNLC6kr/m0t2tDrtmqCc9Ax/3sI7AKEkA1L7SaD5G+jpryszPTAbbxoBG7H05TApscbuKDPB3FQEI6l4vMbGJHE1zpSDo=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 8c2633bc-331e-4b61-ae84-08d3e1709528
X-Microsoft-Exchange-Diagnostics: 1; CY4PR03MB2439;
	2:TJE5F9B9TuT0Dj8WbZVEP0PEw8FFTJ3n31LwMOVntR8opaqF+HM9sLqk5rxNMORsoNWA5vTUOLV4AredT0czNf8/cEGDfO+zPZzMQK6w7q9tD5yiq/m2x7UOyplvewgxGAB21szbrXIB2XhP7vM5i9GZ1DtTwqOaHnRHPL+h5vCeyobrzzoTOTSGmc5iUgdM;
	3:fPNwIBKKkG3kW38diAa4JQYoJXvKn4s3j3zapLUguVHDcUPAEz18oeBHAMQJbYLRehQ1kWVgHalqtHTjtJi3FlWhBuScytlPujdS5RpcA29ThysBXX3pHlTjLID8JM7WYHJPL3NRMpIuVQF9Ks7f0k1I1dpWu+x3J09x0wKxpO9oj/QCrWFi1DwqkMM+2IaxiMn3oubjsZw/fKTrltEfNbJUREdyPLVlVykKa23wZqY=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY4PR03MB2439;
X-Microsoft-Exchange-Diagnostics: 1; CY4PR03MB2439;
	25:fCh8cVIpu+zyTCFXu0yBwweGRDkw/cKe5soDnO3uwOiEuS2x2kiP9AJyA8OPMwl91jKYzZSIy4RQC526FjJIpeHfb4emeBWrOq9QYwqjuk0Lx/j0kmby24vNarQaq8MQjmpqnugQYoxqvNV3ouf+eTHdoeicZ0U4s9zThrbd/a2mGLoZXQQ5wMBHsjgh2jxpmmNtspE5qAAkXutG3n3I6YxrZWNaRCV4qSXvPpZ4aQPTbEpffRkABOrXsKsjhiqfvXyyJcMl6FZfhWCqTEEz9P0DCo5m3WowlP/H/tI6XN9PInOCNNUWQg7AVRmG3zfNzoBdtiZX8f7yTqQYg3NvBxrYZEbqF60Q3AK/sypwdnud3MrtLUCtCm61cxloQPy8EcbhIQuCB5iY/9+p9pO/i6lDHUDHs19C7bnnHAxlAU97wIQLucin78pY3rGroEfNkvBZy42yj5EJj2mG6xPbOzyKmh3EZlAvqI2v+2DWu4+60e9YQh5mgu9BCknBGEgK4R0SNG6epAUkcs+5ORmGvkx01+Q5cIVSC5ZRX2YifsjVuE3Hd6Q9qFiUZg3OBRlayo+vfKdHp8DrxJ8XHPpGYvmeDGvNPwsqquH0QK8Em0fo+6gCmC3b1QPx9xs57DAoGDztVNpFjsqJxIsX/e103/gRMvaPI27h5B4G6GndVLhiwVb4qo34/VWW0eqm4pVJKQ20sjGSY+7xm2NrWP8wCUF2uP9eqgrTHEwbkxf2whhU62/unDrf8cvWvdvQAA1CWuqXXxdMZqYErjX0QtP15g==
X-Microsoft-Exchange-Diagnostics: 1; CY4PR03MB2439;
	31:TLDha+Lo9ur1GA7tvdEsPR8kRdJVb1SmWxenYfvcFxOYaGuTMp2Ivk46ScOec/0CVt17W7/cysMrFsHJSQgjn7VyO/f6ZBC16ILGdE4xjw0ISRF2EjMRc94AYXpcI7upJHydAWC0joalsjTmU6kssUKxrzA5iwfLeVx6wt8OJNqBiDEy+3Q+l24xKCm47ao5XSzW7qod/TZJJBCI/XwmqjmqZfQQ8FMf4vY6ytKM2II=;
	4:s+1xEKsDMVW3YCP4sSUuoW+VoLdGPPOfoLoFc0jh8btdwtNWpjWmSnNQCAcjma05Rmx0wp29JdUmpNqMXwIHzbTSsJz6f+TP7RQVeAfu+duNTfgSU+skkOOcvqGxc5QcHdNi1M9skmxCuDcn/ccYj9e320lmzuI/fQ45ilJ//1lAHyPQKGb0r5nUZW6pTmdLEcR97f6pXrVXncxiIwB0Cs2WkJWrk4KwT5ZT3EBztdbTiNZRXe1T70/yVF8FNfk9a3+p49Y9MAl1SStYlUH539dyAq3wt70rGfCfXTsCNbgyn5xWM3MJaYqQJJW0VASNwr8eaTrQVHlnKrvuglWNfJ0Qs2W2kUk5K4sQTotSzusIdJW51likmeGPQF3aCd/lj6UZIWf7jGHsMh6vbLSv9CTmG28j1ZAvb5x5nGwzR2/02oAdoiiLDig52SSSScnsmvH11/rXaegFfBhb4V5G2d1qDUgNir3V0XG5DlMPVvGtgDI25JT+nA184DBsBjszXhETSCakkQms00KTdX+YEYa5okfPTxPb+5YN8dLsx84=
X-Microsoft-Antispam-PRVS: <CY4PR03MB2439F1BE6801CECB5F52D2849AF70@CY4PR03MB2439.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13015025)(13018025)(13023025)(13024025)(13017025)(5005006)(8121501046)(10201501046)(3002001)(6055026);
	SRVR:CY4PR03MB2439; BCL:0; PCL:0; RULEID:(400006);
	SRVR:CY4PR03MB2439; 
X-Forefront-PRVS: 0071BFA85B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR03MB2439;
	23:ObW6/+fOx+Vf05EoNLxF2oBVN2xjfTx/D6dpfJktB?=
	=?us-ascii?Q?n9iwL/90W0r8k8gg+WAzfCV5vofgPxr89mkra2/j3zX1OyRqtD8cRSRGGMpX?=
	=?us-ascii?Q?0wfMyOjiv2MIPQFuOlyBbkGLbFp5eIKzCFgnIPODjyiBWw/AH9DU0qodj6ZU?=
	=?us-ascii?Q?+TC11kLkNGc1DAu1TjRaXgxSECD0VJjSl0AzxBeujl+mbCVQcS6lFs9PKdOj?=
	=?us-ascii?Q?D8haYJENfPZt72BpH5pFcuPbuOj/Hb/4y/nE4SqmscSNqxQt0SbZ3SlkZwbl?=
	=?us-ascii?Q?OLcYaQWh0zYTc8GHfOQ/AAVMXauGnzw0PtL59IehtIAuhvLNh92/P0U68I5y?=
	=?us-ascii?Q?gJCElvHi+fd0EVVyeFE5KkH+w+jGSteixNPrQbhhCdIpXUcykZP07LQAy1Ki?=
	=?us-ascii?Q?vEKd2qnr9UXBuKW1Nwb5vP5YR26IcHwi4IQeucL1XpJ3gtLmdTs3GwoOKzuK?=
	=?us-ascii?Q?fN/dMSLWopXrQUEdCQAoSp1m08+DMfuga7mavDMWSkGgWQgCtB5qvVbWzGTu?=
	=?us-ascii?Q?yg85lXkxUVsdwEcsfJBVhY+OzCCFLMCiCGUVrd/wLryISSiZ+J0GSxdIdt72?=
	=?us-ascii?Q?F6UYXldBTxt2/xrCUVW0my5bGN4WIZ2vB+qYR940tK1i7r/Id9vyv7+YEjOv?=
	=?us-ascii?Q?SS3a3VPnZcPkIDXZe9UnRkVCnqd4jLY8JV218vvMwGbXORdTq3mTkI93mNqK?=
	=?us-ascii?Q?/x1wDnAViECJVHqwZPy05fSKxfKDm3M0MM/Qif/mptXsriptTjcPls1UIzDZ?=
	=?us-ascii?Q?y/CfNqVP0EVOgQoeMxSZqCTLPT4LtEqRPWruhIaG3c5tVBE6ym0fiPsoJnWW?=
	=?us-ascii?Q?B+HwJ6Pd02gy35tYdzzTw0bRlQtxBCn8Htxl8Ns90pSlhSB2bPQ6W5tm0doC?=
	=?us-ascii?Q?tbjAcKm0/8SH0sh+LkDSvMJqnOWRoOTVPM2m+dLEjuMOWb5DR081xN3lz7p/?=
	=?us-ascii?Q?l2HFtlTPxeFb954gJLFxn9NsvtmJSNGZo1JRlHIyY9/E8lG+TNoiYS1JHXb7?=
	=?us-ascii?Q?vHddJ0y1FDg5OHLPuk/R/4w6llmfccoLUKS29wp2c9mxjEHsWR1bS0ZhPvUw?=
	=?us-ascii?Q?irfsQbwdsZ4BHcVlPF5CtxdNy6/W2wjsbynSaLItbRE27rEvPxaImGoMmgRa?=
	=?us-ascii?Q?0hAE4+mAKQ=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR03MB2439;
	6:OlQtvVoV3A/bISy65Nk0MwvScKg0RqSeET8mt97lMbSoXhfDyuOyEKn2X/A7iPZ42f8dlLJhm5hAkelBSi9DHGlTFhwT2nmQSTnnpeV33BVunfVx5o6folgniXx+6Cg6rCV44FEAs6eqGavU+VkOoUBI0s1/UHTnOCbzUFBAn/O2GTRztgCmiDzUMEMDr5ld9IQEsEvUHA5CpW6tORQuszYyIq8zU7iEZsC03ygpHOi8Y2iYn6wcsUrd//8dbavWZcImlUiXyHYOgOHAwQsrhNR+NFo+Yy0rzZvcdvphWCU=;
	5:ayOeBc+uwokPpGTOQYdfPzPn+2at26MN0Xr525wLYEFe53wBL5Db/sTkpG29YqAb2PGYffSXOSamStBEn/JZlZgcmiRXkzuohHGLxysh+MnlIaS6iHqUdixDGJJiLJGQJBNhJUoAlCy8DBe0vnEGLD52+3O43/3n8xbmCZJOlG8=;
	24:Xj06dkBAsGq8TCTSE/tvZEY295ZahXK/B5q/4KWbWeZEapO1ULsaXTlv+sZdqLTEgaH1RcV0R4cDi9YXP0FxKMpi3Vrl1YMwRlHjYd7z6ck=;
	7:72M1Ptfbuv0Wvqs+BjPRo4d3OJzl+sEsBixOcbdy7bJlBJRrGL6lG9sU845DfoXq0lJ5zYWJUbP5GKVRzw0g1ilbcxfKtOwcEIB8qJa18AQSdDvRqnd6PsL9SD2n36aEpv84qgISRC5Bte56eOS5LMfyMPHbITV9b+SP16CeQuzhX4Cq2vHlTpDdhOvfcwf+cqhL9lwc5N9jtFitjsXu9+qJ0YtP5f/xax3ev97nSe+3Rg7Vag9u9g1usBAabQO8DhVoxmFt6JTK6cEdAiQvz0P2202P4DriGC7Shan+LUieD6SKCutd5CkaSf3KrnP8
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2016 16:10:04.2557 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB2439
Subject: [meta-qt5][PATCH] packagegroup-qt5-webengine.bb: Includes qtwebengine, plugins and examples in one convenient packagegroup
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
X-List-Received-Date: Tue, 20 Sep 2016 16:43:48 -0000
Content-Type: text/plain

qtwebengine qmlplugins and examples and qtquickcontrols qmlplugins

Signed-off-by: Ann Thornton <ann.thornton@nxp.com>
---
 recipes-qt/packagegroups/packagegroup-qt5-webengine.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100755 recipes-qt/packagegroups/packagegroup-qt5-webengine.bb

diff --git a/recipes-qt/packagegroups/packagegroup-qt5-webengine.bb b/recipes-qt/packagegroups/packagegroup-qt5-webengine.bb
new file mode 100755
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


