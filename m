Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0131.outbound.protection.outlook.com [157.56.112.131])
	by mail.openembedded.org (Postfix) with ESMTP id 081B47702C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Sep 2015 09:31:07 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	DB5PR02MB1175.eurprd02.prod.outlook.com (10.162.163.21) with Microsoft
	SMTP Server (TLS) id 15.1.256.15; Wed, 2 Sep 2015 09:31:06 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 2 Sep 2015 12:30:43 +0300
Message-ID: <1441186243-13643-1-git-send-email-samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: HE1PR06CA0059.eurprd06.prod.outlook.com (25.164.28.155) To
	DB5PR02MB1175.eurprd02.prod.outlook.com (25.162.163.21)
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1175;
	2:qE53P9CdYUzYGXnNzENkIwxbajaYvu+XKKZ7kwNPklur6UrMl5wHId008HybaRGSIvH4xSloAGzkZPtQXfr/YPxXMNIFoeAN2ftDOdO/eEKBQfLe1eo1g0p/Zxc9P5GV75GwrfRVg33GOdKzTi1zaw422tn7zCSg9Ze4MEFR1jM=;
	3:Fv4dSDOsYxtsZHs5hF0jmIWj61bdl4kRae0g2NKbYNG2DPoCHGO56nbZ8VpFYwdW4ZNqvV2WnTioYwIRSdR3YPgCeW0jIyzfRNbMgCuVYRRNcVF7E6IeIriH6I6XWbn2IlwjNVuQzO7JGMXATrvgWQ==;
	25:GQsLVxl7CNBtHv0dAvOTn3pnRNJorQUtM0IwiN1Y+RavOro47jh+FwNezhMKUEITELWEDdorS43FfE6IjAL7xuYxLt+djreFilpF5VcElVY/94sRKhc42Y8YnEFFpL3MgfCg0Mbn57JU7mlBNW77Co1Hu2CTmCeEMDtfW474UYUUyx7wkD3aoqVfgCPjElHVM/a459yC2lVDLQar5yjpA/0TPt3XUsDS948ET72gktNcbziYxDuZVUE3m8VF3sml
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB5PR02MB1175;
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1175;
	20:+Jp3LGvcwUheBjPMfudfaiIEE//FdgrzHlIKRZaOAwecbDABCiUR5LBfkCSqZ2GvqfZUJcaUN9ElEsuOliXnNYKKAxhH6Sdk2+yC5D4AwrtUhxB4VL6lHrrcRFKzQqKm/wVEvRlDDDNUgdi1ZlarY5/bpcJ+ZSXO/V0x6OhqGANxbkLwnsB1ly0vtIzp/FPHKAfxcsLJ1eTTU1T4LkC7XMepPngabB6nDhuSdKUL3PTcpBLFuJWiWBWr6XUjMcXqqRvORVmstOeQDPyWLtBAAQVNytanEa+bk8iIjJ9iyB/qfV99EUs5/FQrwCeMtRNE78QQkIuPlLBOc/CF3o2N6q7fkmcK3xEwD49tf/8oe/5G4kPQyNKBRHDAyIoP3K1/SJhu39WjWQJ07tVNLePDO0KKjMGHSMKclu/LZCtd8n4Amr86kwYachi6+E/dwOJtCiqngyXtk+2NxhDXHVh70zdLPdcG+1kK6TchEV5Ztl/bdw3OlwjQ5EpORHPbmNtU;
	4:jZWEY4fRky2s4WWgOkci0z1ksLGBuGuVABSqATijUNQhfsGhwUyRUoOl91whq9mH8mRQqeaMctEfZZbFbXFQ3TNeODl2gNekFTwzTwsRgrrRNevcInBG/3xEQpg6rWXBz4HV5ZRMllvPt41uiMMGF6fZjXHqBBUEjKE7AeoRL1UpW0MWkdLAROHjTrp19oJD+nhVTFB1YRnguPq/XwpLP2yT9fXFXkJAZ/MgDJPL+2lQ82nAsfvI2KWI4dlEAUa+LA/MEk04f5e5B7MD9SaxSZ0AXmtjLMqmJLUgRBgMzc6icLqx+e+Tz76b+flufDBs
X-Microsoft-Antispam-PRVS: <DB5PR02MB1175FEBF5E17A6EC54AA64C390690@DB5PR02MB1175.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(8121501046)(5005006)(3002001);
	SRVR:DB5PR02MB1175; BCL:0; PCL:0; RULEID:; SRVR:DB5PR02MB1175; 
X-Forefront-PRVS: 0687389FB0
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(50226001)(86362001)(48376002)(47776003)(5003940100001)(97736004)(19580395003)(5001960100002)(189998001)(50466002)(105586002)(229853001)(450100001)(46102003)(106356001)(64706001)(92566002)(77156002)(4001540100001)(66066001)(5001920100001)(33646002)(101416001)(68736005)(81156007)(50986999)(77096005)(110136002)(107886002)(5001830100001)(5001860100001)(122386002)(42186005)(87976001)(2351001)(62966003)(40100003)(5004730100002)(36756003)(5007970100001)(7099028)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB5PR02MB1175; H:piippo.it.local;
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB5PR02MB1175;
	23:ZmQpBE7iEzGG7+mJTpO0YcrwqPAw0z7Vu0th/ioMd?=
	=?us-ascii?Q?5CyqpdEgCv/7rUW5WdBk+QKPnLu7LnrJrKwLwjNomZZCLu8JdUWLStzZ4wq4?=
	=?us-ascii?Q?NkHaORoSeaAvrLt7FLdWiKGCW6OVfVrgWkIK6a4848sGToZMVY8I6GGTf3+c?=
	=?us-ascii?Q?/k0PsI/t8xHYU1OjGYskDNJVWpAJP8qRqyVkpUFIBbKOGlU2zcoxEWl5CaZV?=
	=?us-ascii?Q?2Ljv3HNiI4du3idkH/T/DXNA+BA28eOtLqn/psu/nvFNqYkGAPingb6+x3p5?=
	=?us-ascii?Q?yEBz+kGx73GDFiU+G4CBqSO1RUIaGZFG9rLbOcLbpOAuym/K5nrRCnnupU+K?=
	=?us-ascii?Q?RVEI+le84wHJNDhsz7YvRpRObD6QT9UbQ2wNq01xqsP34XaAQfugNgi2ahfx?=
	=?us-ascii?Q?QePMKwE7e8Lfc+pmo7IoGT/mwxAGnB34LYESC1jU3SMLy9fTRBKl6ZGzv0VU?=
	=?us-ascii?Q?655w2BO12yMPCpVI5723/Eo0n97ETtk1MxULTldYIt5iJHKtqEMGnT833n8l?=
	=?us-ascii?Q?ZGxoaCe24LSuI75egVBTcOVQ/pQs6HzeYnLX2Pq7dhGOPskqDuzj6M48YQ+E?=
	=?us-ascii?Q?0KuT3l31R8eBVZL0LsYSiieXKUnCEKHXrgUzmVxDb4s86Va4X5ijAC4xMtPn?=
	=?us-ascii?Q?VZ67cFQqSV7PLi1VjjHrAUN/AhEBGe4dCCg3DRuvgnx55FwDL44RxTvtAnuW?=
	=?us-ascii?Q?wb72FFyYSKlhwXYD5Clj5DDMuQ5Gh0qfkg5GTaXdJO2vymxKnT/Ik8dcvnA5?=
	=?us-ascii?Q?mY3g/aXpOP7FEzz2gjzWsKbvKVYhHnwXwXL9ik4Hop+uLWh/0J9aqplXec3v?=
	=?us-ascii?Q?5z0o01bINoWrLomOSdtS9Un8SFHaap2MeBtsR1vD6LYwJv1jivcJkaVP/x5y?=
	=?us-ascii?Q?y+Q2vDCFXx+CDwp1wDAX+0JN9f6UND+efBcKp/3fwsKY6mD/EILKd0EZ06nv?=
	=?us-ascii?Q?cb1VfZsTzcHpch6wKCaY7OyPlr/oXBmDnNoUWzN4ewl1K+qyfATRve0uUMVw?=
	=?us-ascii?Q?o7kANJVu2jRC6n7gc/Vm19d1YkYHVOw3bohF5iXFYq4mIv9FuZ5CPxHmHV7z?=
	=?us-ascii?Q?T5fAqSEfxdVl3PPR6kPdxwTt+AUeVF420gZUDLc/u1inzaXngWEs69Dqq6T6?=
	=?us-ascii?Q?B2NjDUVSlLdkNCpyD89xIkDWU36fTOoL8RMrBft3ePZeLQ+t2SVTXiPMTrnz?=
	=?us-ascii?Q?nUaqyIUD93g0m5LcyhHjrGOv0BKc9JWmt5UUgSNbnOLbxUlUUVmDHggLw=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1175;
	5:1Xw6Z52/lSckxVGr0yE54zSfmGiiovllyLCVZ7NuPdaxEJgUrjPzD0tQtHhVi1J4PSuZInM34u1GU0CcpB3yXSsOygQ0Zaqu2PC99by3d1dNoAxMT+XtQJ+AHSkcuMIXxO6WW8CtAOxI+k30wPro6g==;
	24:Jazz9OAatQIxmX8GKti7tgtmanhrmrHi+DYD8Fr1CLIk6i+AZ9G+S5kJJjRZuEkVasJDP4wky0jjleBPJGuuCTe45wCXUzGzVpOLMlpa2sM=;
	20:A5QlWx6u+PfZpMRrMftVdU8gTNq6UTAG8DDUTE5biy9FBqz2dn/t7CQ4y+kAzC3WRNljpTMTTj1Tu/wPMP5rSg==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2015 09:31:06.0458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB1175
Subject: [meta-qt5][PATCH] qtcanvas3d: add recipe
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
X-List-Received-Date: Wed, 02 Sep 2015 09:31:08 -0000
Content-Type: text/plain

Qt Canvas 3D module was added in Qt 5.5
---
 recipes-qt/qt5/qtcanvas3d_git.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 recipes-qt/qt5/qtcanvas3d_git.bb

diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d_git.bb
new file mode 100644
index 0000000..aca896f
--- /dev/null
+++ b/recipes-qt/qt5/qtcanvas3d_git.bb
@@ -0,0 +1,12 @@
+require qt5.inc
+require qt5-git.inc
+
+LICENSE = "LGPL-3.0 | GPL-3.0"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
+    file://LICENSE.GPL;md5=05832301944453ec79e40ba3c3cfceec \
+"
+
+DEPENDS = "qtdeclarative"
+
+SRCREV = "f8fe29aab406ded57f13ad961ba977401d9585c9"
-- 
1.9.1


