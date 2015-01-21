Return-Path: <ting.liu@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0131.outbound.protection.outlook.com [207.46.100.131])
	by mail.openembedded.org (Postfix) with ESMTP id 68A1C65D19
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jan 2015 08:23:20 +0000 (UTC)
Received: from BN3PR0301CA0034.namprd03.prod.outlook.com (25.160.180.172) by
	CY1PR0301MB1195.namprd03.prod.outlook.com (25.160.165.26) with
	Microsoft SMTP
	Server (TLS) id 15.1.59.20; Wed, 21 Jan 2015 08:23:20 +0000
Received: from BN1BFFO11FD006.protection.gbl (2a01:111:f400:7c10::1:154) by
	BN3PR0301CA0034.outlook.office365.com (2a01:111:e400:4000::44) with
	Microsoft
	SMTP Server (TLS) id 15.1.65.19 via Frontend Transport; Wed, 21 Jan 2015
	08:23:19 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD006.mail.protection.outlook.com (10.58.144.69) with
	Microsoft SMTP Server (TLS) id 15.1.75.11 via Frontend Transport;
	Wed, 21 Jan 2015 08:23:17 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t0L8NEer017727; Wed, 21 Jan 2015 01:23:15 -0700
From: <b28495@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Jan 2015 16:23:02 +0800
Message-ID: <1421828586-19021-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=ting.liu@freescale.com; 
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(199003)(189002)(450100001)(62966003)(106466001)(229853001)(87936001)(77096005)(77156002)(92566002)(48376002)(104016003)(46102003)(33646002)(50466002)(2351001)(110136001)(6806004)(47776003)(85426001)(36756003)(50226001)(50986999)(97736003)(19580405001)(68736005)(19580395003)(86152002)(64706001)(105606002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB1195;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-DmarcAction-Test: None
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(3005004);SRVR:CY1PR0301MB1195;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:CY1PR0301MB1195; 
X-Forefront-PRVS: 04631F8F77
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB1195; 
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2015 08:23:17.8693 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB1195
Subject: [meta-java][PATCH 0/4] patches for openjdk-6
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
X-List-Received-Date: Wed, 21 Jan 2015 08:23:26 -0000
Content-Type: text/plain

From: Ting Liu <ting.liu@freescale.com>

Based on the below commit:
c600dd3 icedtea: openjdk: Remove currency data generation expiration date

Ting Liu (4):
  openjdk-6: Remove currency data generation expiration date
  openjdk-6: pass option --disable-system-lcms
  openjdk-6: do not run gamma test for cross compiles
  README: correct openjdk-6-jre version

 README                                             |  2 +-
 ...njdk-remove-currency-data-generation-expi.patch | 25 ++++++++++++++++++++++
 recipes-core/openjdk/openjdk-6-common.inc          |  1 +
 recipes-core/openjdk/openjdk-6-release-6b32.inc    |  9 ++++++++
 4 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 recipes-core/openjdk/openjdk-6-6b32/icedtea-openjdk-remove-currency-data-generation-expi.patch

-- 
1.9.1


