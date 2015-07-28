Return-Path: <Zongchun.Yu@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0123.outbound.protection.outlook.com [207.46.100.123])
	by mail.openembedded.org (Postfix) with ESMTP id 53A91601F7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jul 2015 09:31:47 +0000 (UTC)
Received: from BY2PR03CA003.namprd03.prod.outlook.com (10.255.93.20) by
	CY1PR0301MB0697.namprd03.prod.outlook.com (10.160.159.139) with
	Microsoft
	SMTP Server (TLS) id 15.1.219.17; Tue, 28 Jul 2015 09:16:08 +0000
Received: from BN1BFFO11FD008.protection.gbl (10.255.93.4) by
	BY2PR03CA003.outlook.office365.com (10.255.93.20) with Microsoft SMTP
	Server (TLS) id 15.1.225.19 via Frontend Transport;
	Tue, 28 Jul 2015 09:16:07 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD008.mail.protection.outlook.com (10.58.144.71) with
	Microsoft SMTP Server (TLS) id 15.1.231.11 via Frontend Transport;
	Tue, 28 Jul 2015 09:16:07 +0000
Received: from neptune.ap.freescale.net (neptune.ap.freescale.net
	[10.192.208.77])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t6S9G4vJ007733; Tue, 28 Jul 2015 02:16:05 -0700
From: <b40527@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 28 Jul 2015 17:16:01 +0800
Message-ID: <1438074961-21773-1-git-send-email-b40527@freescale.com>
X-Mailer: git-send-email 1.8.3.2
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD008;
	1:si2VknruqHR3Ed970QjuuW7DmsOqvd0WORgBU9V/1f+fe7swcvMY9TzDGK9lQgW/uOh6KZaZe957/erzNI0pb92dentk8A/5bxI05I7tpP7NAgg2u9vtJxOykRKZJUDN4QlmooHLjSFopesVIIlINucT6RN4GAX/oPQJZkzZGK5lBSzPS99xIImn1Ax3hfjsVvBE/r+4RLP5b4AaEYJAkyTCoBEM4igTCu3THXcGBxM/6h6tVTb8UYApWxbvE+DF0QyELxwEY0qnOdtqPLan+lN6wX8ssQ/FTA4pTYzfREInkdpThc5RuPKSHp1tc2oN6yt53+JLeGlFjwtHewGNmw==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(979002)(6009001)(2980300002)(339900001)(199003)(189002)(105606002)(229853001)(86152002)(189998001)(5003940100001)(19580395003)(106466001)(87936001)(5001960100002)(33646002)(2351001)(77096005)(85426001)(19580405001)(50986999)(46102003)(50226001)(92566002)(77156002)(47776003)(6806004)(62966003)(110136002)(104016003)(5001920100001)(107886002)(36756003)(48376002)(50466002)(4001430100001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB0697;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; A:1;
	MX:1; PTR:InfoDomainNonexistent; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0697;
	2:30RNbNeZIpI9OMA9PvsmZNvF5Mwi91wqgZi4yaIAquknnsbzGydkYRm2RZUVRhGf;
	3:Q6vc7v1Ib+dKxPwJSrnQBCUrl+iGDbfUpw3D8jdP2ebLowspCKUDGKkCkSnGRFwlAiF+7vGEtN7y1rw1lCnH2KcYwiVVxJ7H/pYa2+HgNkt0N1HvHIh0s+Ef5KIN3LMG4Ljo6fOKay4dkw96LEqeZ7Ee+PER+iW/XNCc4agjlpEO8ZGDcb2cGl1/E853hEdmtGLdGduDtUpams3erKvmRoXByM4OFM9eC2aAHuZJJY0=;
	25:YyPaOkKs9lD4WLF6o11PnIPTZTfYEeySMbstvsoTUla9Ztc09o4pbPJS3Apl+N4in6oZS/QPk2oU3B0nDOH69gwvjFRzo6QNS2NDhttbAYjdotze34hvn6Rn87XauL+y6nvIU8kQr5rwmRsx2jVbVkdYXkvJUlNBjTk0Eii/KhbnYjG3z8lKKFkN/5ln2O2hD1nopzpXeSxgde485XM5SLJM7XanlohbUjThiAx3MDtPpVpnu8o9SvRCIl8aESxsoO2Z1A8utqqt/n0ulPtIfw==;
	20:CDL22Jt9M1mW7NzW93+YZycwMmFzuuW0OE1TAXHpD7yr/eZX/J1mUFFzShBVM9Tu6nDCv6ljDr4iDGUZs8k03kD4sHAJS8r/FiFq9G7YbIPdxiqT817YqtfBc5CrH/NjzLNm1en5+ogzfLAfeUQdAP9euCUNQGDL5ZIi+CeR6dfn14O/DQszW3p2m281ctXCG5s74PEjYi9JekHvq8pYBk2+CEX+4RtlegvE6+sa8IBfFZ6F+6xvp+odnnht+AMRBctUWddeBRZ5GBl/VF79pOFUtQESRSGZLNxhDkUVrtQM+uwCyEJeLNoU7E7S9TodV8gUOEJoYlKaJgEZMgh69CgtpHcUExnWBlEyheTd7Jo=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB0697;
CY1PR0301MB0697: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <CY1PR0301MB0697BAEA97168C972B357F01F78D0@CY1PR0301MB0697.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:CY1PR0301MB0697; BCL:0;
	PCL:0; RULEID:; SRVR:CY1PR0301MB0697; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0697;
	4:M1AMnz57D/xWs6LKJTUMWogCrsBOO7dYPCKdEOh+GPcjCGTRXrK8K0zP/fmeNIsjC0jJIk+/G07BkbC/1MmQ7vvznD4iPDuEaP8SOOaKkokHNjwPypdlSXneNHzPxMgD9ZJIMNR/A900MNsrm/hjVHv1E+SFCFl2fBg1JQT3f5Y16wwQXuaBSjiPQdxdbNe0pRyHdNtvy8+hSlDSw9CRvFqzYcB1LsJPlAYo2ygASzElomAJ8piudzf6NwCmnbWtg3KL/PZnqcfMAFr5IwC4PIZlZu1w1vhHYvx++RM5U5g=
X-Forefront-PRVS: 06515DA04B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB0697;
	23:uB89T9E62IUe7VoSIV5tASXggHWQIO/i07FLdk2?=
	=?us-ascii?Q?vmIVl1ly5thO4KnfTAXFp1kN1Hb5El7BH/6z6qI3vLRdS2zvz66thqZ+sFIy?=
	=?us-ascii?Q?3OajoehXfa1znaGJWZag1BCA0jP+OfJUFx9HqvnzOwavASVKGrC5iTnsEVid?=
	=?us-ascii?Q?3LFmOtUVg0Rfm6JOTA1yfNG9x4SChnGR5TVv2P9KLBzPNjJzZu4z7acQhasj?=
	=?us-ascii?Q?peZn/bsCgtoTHz7DAVTglLzrkbEyxVI10+HJn+h5ToltIre8YhM+Vj4joHaa?=
	=?us-ascii?Q?nkbE2wFdRSA6BnSY6l4lcsHWVW3/d/7ClitXjiqsipYfLFCZFy0hN1CQur3Z?=
	=?us-ascii?Q?nqCuZb30wsSV4uB2SbiVX5Y/JIJo+J1xop0ADemvt0C5v6LF9+19VP44xASu?=
	=?us-ascii?Q?9AFbAaLwItONsZSqVMUd2XoM/6RPV1TqJv4pxeb2G7kC0K92mOXupzKQxjWo?=
	=?us-ascii?Q?xOvcjHgW49iDz1bKmf5wqwx1Mbqi7jgZeHDV09KJ3u2jRUfxUBq+pVB6rwYV?=
	=?us-ascii?Q?Jqm8W0K37/+E2tF9WWrn6xJPg/YyiwD/MYYlxspKwSV9sY8KO14K/vQGsGXT?=
	=?us-ascii?Q?QksrJ6q8wJ0abll8i5teayCSvtKY5qAOF5TKvz2mZ0VrNfQ6iWCuLiftieaL?=
	=?us-ascii?Q?XycxbfG4t0w9kls5H2OAHuPILcBJ2qVpzZibNXiqwMRUFilo2kKISvVd6QEd?=
	=?us-ascii?Q?hTpw90xoYza42iyDLkNb5eTLITQDl09RyA2mtacieH7nM1chwaSEnzUqmW53?=
	=?us-ascii?Q?HtDVUhFl5C5Ub7uJ9rQOmwtvVV213YNogGTa8/b3bRjLIvVMpAuSbAGMnfpq?=
	=?us-ascii?Q?CMBnuMQXW4CBNzl093BjqdlV+1tB+LNWN4OoJG41VLbBcgw2QRksaYuMnXCe?=
	=?us-ascii?Q?bV7YPWvshlu9dgiELMnuWeNXA1dy5tpCkwoZ5bZRyQWmm3qyW28TOQav8n3y?=
	=?us-ascii?Q?GJqitYVAwvkMzaKnLhPSyxhoYH2bP8gETsvzvbQ8WF3Y4FzcRrFLoRPi4KvG?=
	=?us-ascii?Q?0X2ilCGlTKPrbYbpToBp9sFEt+kdQGw+qxD8AKx5ICXB8kNKxlrJ5ebYP2+L?=
	=?us-ascii?Q?nRHwWiz0=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0697;
	5:PicGn4Wu7POnoljn92ehQBsxuJcruUZZpj0PNKGWINI+fhO31cp26Tp70+ek+lRb1DxT21uJs0qg1dWqMynz34LrwoCiRc/RjhftkaQCdFNq3aa4lKYfTt502ORTq3lRzT8cSDG0pF28pt91kJ51LA==;
	24:HODhhi9NMzb4/B444FZOZ+rcMB23f/mKOy6EsewK6ed6UV7yvhED91g0UQe8hjMvSN+qoxRwj9It+Ymkd9JSfkEOXSDLmcoI7uqQxyJvewE=;
	20:DlOn8pbWALmfL2kvkHb3/i/J0IX0AVq9JauuM/IPGmlzAqXiWw6oEsgrTFJjQ4R+xmZgchHXtb4T43zx1S7WZw==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2015 09:16:07.0077 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB0697
Cc: Zongchun Yu <Zongchun.Yu@freescale.com>
Subject: [meta-networking][PATCH] netperf: fix the broken download url
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
X-List-Received-Date: Tue, 28 Jul 2015 09:31:53 -0000
Content-Type: text/plain

From: Zongchun Yu <Zongchun.Yu@freescale.com>

Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>
---
 meta-networking/recipes-support/netperf/netperf_2.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
index d634af4..760bab0 100644
--- a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
+++ b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
@@ -6,7 +6,7 @@ LICENSE = "netperf"
 LICENSE_FLAGS = "non-commercial"
 
 
-SRC_URI="ftp://ftp.netperf.org/netperf/netperf-${PV}.tar.bz2 \
+SRC_URI="ftp://ftp.netperf.org/netperf/archive/netperf-${PV}.tar.bz2 \
          file://cpu_set.patch \
          file://vfork.patch \
          file://init"
-- 
1.8.3.2


