Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC2CEB8FA5
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 02:24:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.27.1693967050925052736
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 19:24:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=m3gx1CEy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7613273c4a=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38610qn5025427
	for <openembedded-devel@lists.openembedded.org>; Tue, 5 Sep 2023 19:24:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=BtczKj/MWb8Jh2T6hE
	tRcU67InHC9XsNDJCum/A8a9I=; b=m3gx1CEyjKmG0unqTtYFQ4NK7vxwGnUVPB
	579t5zaW7/rDYDvE5CwPw6vgQ+DuT0Y4iRqspyqCGKZfabZZTU5owLE3rdWGOBUU
	sY31s/en8Eum1BlbJ1SMzV5wrIt8//tscngRKAsJL9aOCuMlIg1mE781IbOUpt2v
	u12h0cI4WJDERWs67qVLP1Iugjcc6AtVCFMiRH62GPUPBJYNO8FtxYNCo/hiafk2
	YLRCcd1xZ8tkyhKOt9QDMfKEspYfO+3JyW17NbNdiO484rre6mJEOpcSb0bcwnWA
	AuPsNW8e9fvepdkapQY0Qt56ntY0R1jTgPmg/hCQqQqcJT16OwVw==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sv4jg2t7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 05 Sep 2023 19:24:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zwoj42XxgnqurdCpBWY8oXlvC55Cvm6ze31ps/1zce571QGQBUW8qG1FTgK05Oxszr63OealvxpQyo0laRZ8G/MbAu3riX75nzF858LRnkh2U7crz5B+1rDulk2PKgCqf/R096RF7TNdFAM8wfnPNMAuuHjh9FwrRwAaGNNG//fYTu2GwsleodfoFIZ5lB6C2jEsGswNeNXovCeKvaP+l/0a+gcUbu/a8MTCtg5tSOsobi3vf5eUKyjqakOc1WBYb8BupEhhbNkhmXDugNP6hu/Fezlc0Ybr0flPkIrssO+meX2nhLZfnB3383YESZjwOAOk1UYSejz+pLykCGm0AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtczKj/MWb8Jh2T6hEtRcU67InHC9XsNDJCum/A8a9I=;
 b=U0WBpVFBPt7EX6s039BZhQMJNRzFvVKaWcxbwgTSmPrdIOUi4bp0ob6vIN5LOFtInq07EaNpE0CKehJBsLpLutXiqGv8KaWqVMOko7PRlSDtJQfcxe7NC27M/lm7ydjtM04LO1pZCua6ge696kka+JpGyjJXZLklK47d2xyfzKhBya0PWqSsY+J5cOOq4W51xsHTL1BbU7SwszPu5v+NFyxrBQxisY8Fos7Lf8ZQK+jeS7LvL0I92yLJqEtVA9x+YDQVXSBeZyxzBU0yy1BhCFaqXwM0zXwBi0CcCSEkXuU7MpcG+1N01Caq1qI+7jmQqeP79rPZbGQYl4CXEZEPjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW4PR11MB6617.namprd11.prod.outlook.com (2603:10b6:303:20d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 02:24:08 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1ba9:4bef:c1a4:306]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1ba9:4bef:c1a4:306%2]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 02:24:08 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] ntp: add missing runtime dependencies
Date: Wed,  6 Sep 2023 10:23:54 +0800
Message-Id: <20230906022354.905750-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:194::9) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|MW4PR11MB6617:EE_
X-MS-Office365-Filtering-Correlation-Id: d9143dff-284d-4b74-8f29-08dbae80596f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Oq7bof0PUk4MzpDhYIRE+ZnqXyuslkMTRwxs4UZBQp/CzENeTGAp5L+y2ivi8mCUUbY56rzyIctDVtoHErk9XCedwsO7tBpdV3Ef/cPafO9U7pqrQku1Y2bE2roGcueaipgpJbCriWK23zFB7+/wp9NjShP2FlMcSLzAxxdcQFOZOKzIv7uqjgHflzd4Ym/IVONWT4jYIXVpzC4hykLE3Kg0cj23cMpXRjePo2yT0el7/5fDJyK4Lt9DqiRVWvsTD2HO6mA58BcnPSnIXphnAJ1nXsFDj48qQIyoy5g69b8yEbqrlzMiBi4d4Nqeote1hBVDdix6TVZF2gIbeWbvRpbYfNlLlAO4Yy8ls2AE8bFJGinrQ403Wmwn06tDPNg2eDYwn6PGwIBiGelfrGSkNt38IWodxKy5eXV+wuseKr1mYp7ujATLezPYKpkCky8yVatxpnYOKK+St5ILqnpjTU84wM4oEJnOJRyquOQct5NirTXb1nCOAYcLFgli3cJQ3YOYpC1JvZIuU8UGTkhm3IBEPKSid1wSfvFe5SFAHkpVW9ENMxx0Hm/Y8g+9zwrQYXoIY5kleVZrqWz1AWXHvqrFl7ZYy/tumV+wFwsZMQFo+Bnbgm75ss/iSYDNSFlF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39850400004)(366004)(346002)(376002)(396003)(186009)(1800799009)(451199024)(5660300002)(41300700001)(6916009)(44832011)(316002)(66476007)(66946007)(66556008)(8676002)(8936002)(2906002)(83380400001)(38350700002)(38100700002)(26005)(2616005)(1076003)(86362001)(36756003)(478600001)(52116002)(6486002)(6512007)(6666004)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7bTtyyLoX/L8aTtAT+aWPzYg71AML5Rt7COboWuqAZDn3RXs+Ks/PJi/JDDO?=
 =?us-ascii?Q?UoeNWGKMso2IFAuAJpgfxjLdbatAx13wQQFKLizkAOhQOPdREbgWFl9cJX6n?=
 =?us-ascii?Q?6rbUyuSoS7Ylm+7Mxxna9BbcbMeSFQeIzOJI56wk85oRWUxk3Ulj5pg6Vhsc?=
 =?us-ascii?Q?rRsJj5q/GFBDs9mr7CEB1M+sBeMLRgB5PgcESeeH8h2IGjlHkunIHYyH+cz9?=
 =?us-ascii?Q?jl73vA+DoX2JOLCNG9zdmBeSFLlrdcJRHDIvML72X5Krjcyq1XTf4qWVufL9?=
 =?us-ascii?Q?z6ziEQjoXN7+XiAR4Qoh0Lvyc85a3wqLsie0Eil+KkjweCgjYqRHheow0cei?=
 =?us-ascii?Q?DMF9sV3S27caAKU33as85rXxjtoN1HdquFfdXaCGXJl8hZq1gRcNtqanf/c+?=
 =?us-ascii?Q?7oXn+jKNzdeNxPGw/xSmiVsgcdwuMRwa054spqO5yy13xL8QkqQmx/DkFZAv?=
 =?us-ascii?Q?ofeuInKshHQkIjL1D3+k5BhAvBi0wUSNRkLGcrH06gpYUSptnqbKdyhwjVwS?=
 =?us-ascii?Q?mEVDq4yZ+iTr3lANiLNeXdfDM1tQ49vTU/MGTDQ8KkJG18dJdoPoTlpKNHCA?=
 =?us-ascii?Q?UmlCtrvgzSqhXSz/KOIXvg2cQGeVLU+95mE5j4/vlxmqTWVDPha/mNkdDJin?=
 =?us-ascii?Q?KmHrEhs5jwFacrtzNId6M+jx646vVzi1ujjG4gWpRFCBmCQkVN97tpYpCISB?=
 =?us-ascii?Q?XpvcZd4RYZKRt9sGgIeOj3ZeqKLUHhGwKRDLZ4iM8qbm/K2xzxnbHBcZl3St?=
 =?us-ascii?Q?9Ohe5xGpczGsU1ntqQWq5u9wRvMSaYQS50PJ08vD+lcfZcT1PEVug/zhy+pu?=
 =?us-ascii?Q?39l+n+dSgt3l5TCcmqc6JwN5Iwsyu1BkvsLfFEdksf565c62ioU1dxr/AQsF?=
 =?us-ascii?Q?OGP6b27XvLCppDmJc3k63898B8P5x3y5u8YL7zQJS0qnkKDAP8fz7kDk9dPe?=
 =?us-ascii?Q?4xKWVWp1Vdye69vgj+J7wdHYcSzDhgo98GpfusLIuNOedC8VqiM76FINp2Gx?=
 =?us-ascii?Q?CtcfKIb5C/KF9uSrACr3rRpGKWXc0pd3DZwPzxRD+9kKgvbVCSfbS99w3eRi?=
 =?us-ascii?Q?3khh5Ual2KWw0BVHsqLqX0fqteTDN+EVmYifje3sIV13J7bNDgE29vCu0zL8?=
 =?us-ascii?Q?zuu3WnNt/fTSzPehYfEtlF46Y9gfTQ0RdQTvmzK0+c9CLxLE/iwqc0NMc7P9?=
 =?us-ascii?Q?XEKCfkh9HR23XrkIzxV2gK0htf2oAy/uZl+iCUUHRwZLsBmt21ys6ZV+qobO?=
 =?us-ascii?Q?KbjkOFiiDWKI006MfzbMSLViK1qaFQNjH2dea3BXrBUEa3bSUqn+J4eEVZl9?=
 =?us-ascii?Q?def2vy9eZF4PCZ1KZtq/eX4m3Sm4RJpbyUAitiOL6iuX/lbiuviK710fglii?=
 =?us-ascii?Q?T8WSTMIrYyB3f2kxRAlGkznWvI8hi3Y2OaDsWujOnmrdsWNzvWoGXohd0zMY?=
 =?us-ascii?Q?W1mvMWPuR1uZjTx6jfieT5IurythCGCX8w0tpHjUmcYJaM0Zw865tHRhRnB6?=
 =?us-ascii?Q?CxEHkhmNPxVcgWTFKj42jJOZ44frZR30MUhombaJfsBGA6ZRqKNvl2VpLH06?=
 =?us-ascii?Q?x6UGZHs6uNDe7kxSUXVKyPVk+PzQmieskMEJapUC?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9143dff-284d-4b74-8f29-08dbae80596f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 02:24:08.4323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u4WxhcDx5sifxmnj2TLRtID2rmvekCZZ5vW0Vrs0gklxb4jmEteB1PoCSr42kwYHraw6PCwvUB3tv4N7DZG1tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6617
X-Proofpoint-ORIG-GUID: cpPGD_u0wknNnrNCwtWlNcuC6UtYqYGr
X-Proofpoint-GUID: cpPGD_u0wknNnrNCwtWlNcuC6UtYqYGr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-05_13,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=902 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309060020
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 02:24:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104770

Some perl modules are required by ntptrace:

$ ntptrace
Can't locate lib.pm in @INC (you may need to install the lib module)
(@INC contains: /usr/lib/perl5/site_perl/5.36.0/x86_64-linux
 /usr/lib/perl5/site_perl/5.36.0
 /usr/lib/perl5/vendor_perl/5.36.0/x86_64-linux
 /usr/lib/perl5/vendor_perl/5.36.0 /usr/lib/perl5/5.36.0/x86_64-linux
 /usr/lib/perl5/5.36.0) at /usr/sbin/ntptrace line 10.
BEGIN failed--compilation aborted at /usr/sbin/ntptrace line 10.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-support/ntp/ntp_4.2.8p17.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p17.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p17.bb
index e80ea4c14..4ed58cd6a 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p17.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p17.bb
@@ -136,7 +136,14 @@ RPROVIDES:${PN}-utils = "${PN}-bin"
 RREPLACES:${PN}-utils = "${PN}-bin"
 RCONFLICTS:${PN}-utils = "${PN}-bin"
 # ntpdc and ntpq were split out of ntp-utils
-RDEPENDS:${PN}-utils = "ntpdc ntpq"
+RDEPENDS:${PN}-utils = "ntpdc ntpq \
+                        perl-module-lib \
+                        perl-module-exporter \
+                        perl-module-carp \
+                        perl-module-version \
+                        perl-module-socket \
+                        perl-module-getopt-long \
+                       "
 
 SYSTEMD_PACKAGES = "${PN} sntp"
 SYSTEMD_SERVICE:${PN} = "ntpd.service"
-- 
2.25.1


