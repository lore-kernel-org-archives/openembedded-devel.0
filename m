Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.78])
 by mx.groups.io with SMTP id smtpd.web10.21930.1609652970001239809
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Jan 2021 21:49:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Xe0w1wjQ;
 spf=pass (domain: windriver.com, ip: 40.107.243.78, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oaK5HwVFaup8CrxpQU0YwqXRK8emw5lfJ0m+gorfYnkFCCQHPBe9JboKHE5XmxaoUABCUb4LcGXkTkhSBF7u4ux/Vjtg1Mi4LDuPqYe9S7SmtVcgQUKReMuosllp7l+LfD4e6bdAQdFJQhkqUateN0o4kSiaRn2/rDnlh4auSLmzkbgaGlf7gJ784bassaLLZIKNBPM0R/mdoIACLpmgtDRvHCTOuw2g91x44P0dvHgh75SWxOIF1z9JPS//JYWAlCQ0Q/xER2mpiq08lsoXJBDDIfpHAkG07HEGliAusYUriUS1dFWEWLQ8cStaB7aIkK9RIUDEtc/iYcc4QhgG5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AdW9o9Nd/Gad1zjqS0G0cVfSefvBFIxBgHubh5GG6YY=;
 b=iHVqaRFi1HEXQPhd0YpWUGH92Lj6VW18ClQbQVApVly22sU+xmp0L8vdLSEqYq5Ra8OjtpR/lN0r5Hpys7GUwVxQ+Z2mjSvz9PuxCBkGC+Oqo6eOi2ri22NPfCLVT8/N4DJp4GckMRxssuXq6OOX55lNbYNGmbkdy1C/cVYVtfU4rDj8Go5gi+NegFiMJGwRh0sINIqqXdmGf8kATfKRWN98j4vPfsVOdOzDGONV8XcvPsebjgX6XT1CRe8fH+kcUc0L3SejEX9uvHyH/42NEHAyJa/5/3FIqKnY6mgPthNumfa5WLbIqHfAWkKWKES2wW/CRNlwvLNIcNOA9MGNEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AdW9o9Nd/Gad1zjqS0G0cVfSefvBFIxBgHubh5GG6YY=;
 b=Xe0w1wjQMHTGydPsDFuDt+KxygwytHuoGK58j4ctGR+24xXAX6PrD0KgnzqpH+RcryhohKSvtj+W80WRfJWe+j748SVjKSz8rliFr1Xx3ixQKa0TjpAfdB9LiPsTbQ642NGVWnV7ln0uZM3xlRUyldPOT2cWVCnb12iJSbxija4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1742.namprd11.prod.outlook.com (2603:10b6:300:113::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.21; Sun, 3 Jan
 2021 05:49:29 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5%7]) with mapi id 15.20.3721.024; Sun, 3 Jan 2021
 05:49:29 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] tcpdump: add UPSTREAM_CHECK_REGEX
Date: Sun,  3 Jan 2021 13:49:13 +0800
Message-ID: <20210103054913.274351-5-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210103054913.274351-1-yi.zhao@windriver.com>
References: <20210103054913.274351-1-yi.zhao@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0401CA0001.apcprd04.prod.outlook.com
 (2603:1096:202:2::11) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR0401CA0001.apcprd04.prod.outlook.com (2603:1096:202:2::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20 via Frontend Transport; Sun, 3 Jan 2021 05:49:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0264eec-1047-46b9-3f8f-08d8afab5612
X-MS-TrafficTypeDiagnostic: MWHPR11MB1742:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB17420DAFFFD48E579027D68AF9D30@MWHPR11MB1742.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:361;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SQan9a+VBeF91XZdYvbgFJ6eh58of2YjefYeLI036yi2UTFACJST1xKSCWCtkbLtmsTZir5TTIZJdlH49IBGC4jAP2O+O7zsD2S25M/dSke+5EKHA/X8VlCDzdi5VKMcxdZaoFry5gLkA5TyzcALTTBuuhjwhcWv3TDeoc8pKQrOrcG/oStQuOwZ1c/foatf34ODBa8l2W7iP4tG4fYsuy+haErTTBIGpeVrWQzKAtWG34DdiT0qWVpiqWNHGzjNWr981UDTWCcJKJONIN5M/ICOFOweTWvGpP7DANmFa/mFT69WrVUmqcpci3iosGBlZbBp9yZF0h3y5y+PvcJk0qCYMXIcGvL7WHVM9ucnZyve4XCkfvsLXBzKcnXmgr9QJPTSmjpNqIcw/L8bH5gXZA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(376002)(136003)(39830400003)(6506007)(316002)(86362001)(186003)(4744005)(8676002)(6666004)(478600001)(36756003)(2616005)(956004)(6916009)(44832011)(6512007)(6486002)(16526019)(52116002)(66946007)(5660300002)(8936002)(26005)(2906002)(1076003)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?jvPiu4PuGPwt8hdLdZeLub18E3s4l8A9MkZ7l+Gn/HDJO34PJtk9sFLQQPuV?=
 =?us-ascii?Q?/BfE61f80GnO+8uGeJ5L32Tw6c2tMojCJORwSAgYsML7kyQH+WWJmf1W4v5J?=
 =?us-ascii?Q?OSnAcPbBJlT3gVT3O5tFl5i8+TQ5Yo+/5uHf/GMMVMpEsH+xL2iQJBhhY69Z?=
 =?us-ascii?Q?b0XnUuhC2VFSQzWmuryUbLsCrPYsEXr8QFgHUjpWJGDs6mVFQjt/mLfrjcmr?=
 =?us-ascii?Q?bWBxXmAvhPS8NRholmhJQbHEvmzsABLtyXsh72iT/3+PH3UxeTYqVCVGhs1v?=
 =?us-ascii?Q?MpGB0vZPo0Bjbz+xuCcLS5Ijpw9nhIDy5vLD7Gd7nBLGZjWVoYCOhwxC+aab?=
 =?us-ascii?Q?Y+CtZhIvRsbESwL2/zpIwuYLTvq6H7ial6oXr11YqHps6SoIu+JSuXKKSps9?=
 =?us-ascii?Q?9X53Hmj+MEwsmwYIJiFTWFCm4LK4yVqj+C2O4b/oOviJZ6UahnNAZWZaCcTr?=
 =?us-ascii?Q?tRMjWLAxtxR1q6jne/69MYkh4G6LCHM+N9O+6swNnCkh2AGfClhv5+5OvgZI?=
 =?us-ascii?Q?eWI3g/uJIEi/+Tu+YB3cqKq+G2Z94Ltz51iwz5yUWwV24rmmR9lQs3/J30pg?=
 =?us-ascii?Q?hX7oEQYxxtPtMFRG+ALTv7mCzShcuKc8Lj/O7ivmjPHpwDQQ9ZsQqU1n3KgE?=
 =?us-ascii?Q?JkSU3HlRSRYtekA+YyFKwrkQDsolhlDLhd2JJPTPmgzTdNBukllgPHpKRNye?=
 =?us-ascii?Q?ADfADoOeYCBTHPVU+ZFRw+ncD84EWsqrlEcEDoJFWdDp4JaD8hmKz4VEvHEE?=
 =?us-ascii?Q?0sgdNTaGZNXdaW1KM6YTk6InA+OTjpDfKdlQ4nuQO84vFBDbXe1M6OOHLDTc?=
 =?us-ascii?Q?bEwC56IalBt2wuUTvCpDjpmmGfvzMrgisGWX4SNjk8zNEhYf3m/0jowQxcbP?=
 =?us-ascii?Q?60w16UkJToVKI7MarwOMPriQ53/FFta65jjej98PoZrXm9BTRp7TajJvoPFR?=
 =?us-ascii?Q?1+mkj3Nzj17W0XUnvc4MgKev8zdHciYJqpuYt8YMROeRsBOGkCKZTMkueOz3?=
 =?us-ascii?Q?9JE3?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2021 05:49:29.0851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: e0264eec-1047-46b9-3f8f-08d8afab5612
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: miXuElKJyZTmjBdtmE4kmB/m1c9dhrOsqY+V9pxXkqiO5lKd2i+kIgmQ79/3H3Tw8nGnHKP6+S8jfVsEWVw4Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1742
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Add UPSTREAM_CHECK_REGEX to skip checking testing version (e.g. 4.99.0).

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb b/met=
a-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
index 8f7bd59f1..afcb4d508 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
@@ -23,6 +23,8 @@ SRC_URI =3D " \
 SRC_URI[md5sum] =3D "a4ead41d371f91aa0a2287f589958bae"
 SRC_URI[sha256sum] =3D "2cd47cb3d460b6ff75f4a9940f594317ad456cfbf2bd2c8e51=
51e16559db6410"
=20
+UPSTREAM_CHECK_REGEX =3D "tcpdump-(?P<pver>\d+(\.(?!99)\d+)+)\.tar"
+
 inherit autotools-brokensep ptest
=20
 PACKAGECONFIG ?=3D "openssl"
--=20
2.25.1

