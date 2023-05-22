Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E00EC77B75
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 12:07:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.20273.1684757247167870941
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 May 2023 05:07:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=45064acf6e=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34MB182i004581
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 12:07:26 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qpkn1hry4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 12:07:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QU+WM+q5pIHOaYTd2j0f5QCU0W94HWK9zGZ5NbXmC6b2WMt93BuH2cuUTF1+WKWSSu3bMpjGqLlfaOWh2xBpPGAVVFxzPmR5JYDaBmJUbNQOp4m8Vo/JWZSKLjGqqr9AGsgmIoKGHEhV0Bt83O0AFufp8x2RdC14DxSkVxDArUb9jMGzlYvDb5rtZvZvPi17WbE3sm8uzURKJf2rDdX9rnlOSgke2IvKVbp+O7s4C+98nnJVkgXSV8oCkav4aF4xicXAqDp5+Td9I0R8iS6YUuhNfQMshkeh4sqVtdtISLZJ/rqHIXj3KVFRFE3nmCgbE6WmFSqqxi5/nd5Vc1JgxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2rbh4oCPTqn8n4sHk2HrckNEOzenoQUYhUBEoJov70E=;
 b=KKA/gHwYlilqMA7+wAcsG4PZzqmShy2PRVz7FPzrNWKDba7/2wY5OUL0UfG+NC/1ioD7iJLfGEjTRDMCqEum+UhREIvVxccMK0FMpLlWL8JKW/sveZrdYIA7jBknCxFg2Cv/qTmzkc7PcIl7Z7M3X7qi585l9A67THGiH0agUrbwBWdBgVkR/BqhFMlLETnCPVm1qBXCK89R8MQX+lXQI+UepXU+UhRywjggj+8pCaHQF5r6ToGI+wrKfMh/zLCWIdhHRcXgdewD26GK0N5EiX0tedKIKGa22uxU3J+HQvDPrjMn1V0SS4JQI/hzwlOdg+EqH3+2zXmgCVVMbwei9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17)
 by DS7PR11MB6125.namprd11.prod.outlook.com (2603:10b6:8:9f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 12:07:24 +0000
Received: from PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703]) by PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703%7]) with mapi id 15.20.6411.027; Mon, 22 May 2023
 12:07:24 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 1/2] Revert "pahole: fix native package build error"
Date: Mon, 22 May 2023 20:07:07 +0800
Message-Id: <20230522120708.356500-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR01CA0003.jpnprd01.prod.outlook.com
 (2603:1096:404:a::15) To PH7PR11MB5820.namprd11.prod.outlook.com
 (2603:10b6:510:133::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB5820:EE_|DS7PR11MB6125:EE_
X-MS-Office365-Filtering-Correlation-Id: a6bb963c-4cc0-41e7-6b95-08db5abd1a21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QyryNpOVlde8IF1N8fJwUpjGYQGEOZqkrikTZ01KVcdrfoM7qfRk/g3K3C668wwJAw/39O9MHtOwPr1BJSYxvyV0tEzqySptkw4C2GzaV/+ZxOkv1yjjV13SxTU1RO+ENa83OXx/k2IjJGhAicHXC+19O5WUuLI81X6ADk9nMtFgCzIn2UzE+VNz1RDdTPTqSW4Jyh750tSJrDW9mmxwmsAgVHmEBv1Z8DMmEhwWIif0TUSXllNtogJXLoV37Xe4F2j4PsUY06bG2qY0Trk1Kgo10Oi20FXHua0vZNqn1RenQyKUOFNkvtWcpq4DkZMLHrKowVBjqD/5D25eizQ1jP2/ExT9ZiOnd8LJZPM6TKRQzULNEu8LPy9SrHyGhUVtNZTCL18TPWxFZnMB85nUQvJXVe4KJH4k2uD4iiBijsgWR2/YBxBZtpnJNv5gV+g/cSM+zLDRAXVSmsfm4qPYM4po5HI/iyl5h0SnoJ2+YmFb2u8jLmrFJ0KBiKOb/Yo3C9Kef6vhOl1P5HVuLDuDctur5CHzb8j+JTN/ryBroFbHWv5tf4u/ofymZFW/Xq43qk8PQsv5DyI5bUuU+YvvOWdGXyJFQ7BVLxBuaoGkOJ2aSXHR5xYDyNRFA1HatPxt
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(39840400004)(396003)(366004)(346002)(451199021)(4744005)(2906002)(5660300002)(44832011)(8676002)(8936002)(41300700001)(316002)(66476007)(66556008)(66946007)(478600001)(6916009)(52116002)(6666004)(6486002)(1076003)(6506007)(6512007)(38100700002)(38350700002)(2616005)(26005)(186003)(83380400001)(83170400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1Yaja5QRmVTdjgjaYRWdIp9IIFTEPQka8xBuhVI9cEQh8bboACR1e2eZdx5U?=
 =?us-ascii?Q?oRGaxw8pQZj6fEzDxqYiRK+Ctv3OUzyjMiTg6Coah44Bzqj8BJz28jcPHdGm?=
 =?us-ascii?Q?8JHYlBwk5WSEXXAp+IuzKxtJDI+qqOTCCE6aBi3rJFzw5YGmY9WsxQjWhfcF?=
 =?us-ascii?Q?ZUXitbrnskcfxi37NM1jxHabQqeeIuUkzx6i/7IcPEzQopNpJ9gZ2qYLj710?=
 =?us-ascii?Q?4R/UbBV4h2Ack1xPvSSSjdLlgtUSio1qF9jmBcnX9Kb3Rd1VmDpea2RJbdwo?=
 =?us-ascii?Q?mcg3+jN4XPNOyhZrdDdUCrGrk+G5n5g380N4agoHB9YV1/Sex792L4c8KIw3?=
 =?us-ascii?Q?5aH/nlPTQGwteVBFjhjhUDYWPhwuPRnuzRiWE9HIdI/80yYYLBWuun+FernM?=
 =?us-ascii?Q?cIT0QDWpaLlv7o5EUhbPo9/Se+WGsDY4Sn2s6vOmQie0++A6W9Uojzyq5o0e?=
 =?us-ascii?Q?u5QtskpEZN13FhYExAJY4FPcgHC9tW0Uz9NvPfS9uvQg5/ICLt7zyaXhczdG?=
 =?us-ascii?Q?ZvWUajkVAM80m34+xo75PUiqdRhQnL00OuX7yGTqtMtmyyum5BICvIm48RgR?=
 =?us-ascii?Q?gs8IHmJ6fDrERwj9Z0rGj97dnncnUUPtJtQDUQYYixMyRNWZPMlZoMn9HoDL?=
 =?us-ascii?Q?lKotiuUnb22VEsqmiYkyZ7ALsYQ4iSIk2LNRK8JNInA+lQG7UpiYGOcp9fmH?=
 =?us-ascii?Q?tzqiY95WzLSDlU6GYVf4OB3blu0cf61hfbpDEE+kzOwRGY39FRzOkQxWF35+?=
 =?us-ascii?Q?ptJT6UptVL7HLguiUSPMPzO8FgGByhBq91b7ku92JGzDMhhoAXy04M0oA0TM?=
 =?us-ascii?Q?9MeEsO176TuSw7H8FxPOscJZXgfuk5gqqrqPMgx/AHjg2PZqt2hDPzc7/LoG?=
 =?us-ascii?Q?x1uff/X02t7KiwVaR5MPxEkoWeyxHwYlyuYaHB8bTvPWgI/cq/KMjYGOZtb+?=
 =?us-ascii?Q?rg3+MyzWGdrJ40lhyiy9GYoPLsFTJb0M29kpD/hKjs6t2HIgCAXfU2VHTqxd?=
 =?us-ascii?Q?Qsqr19TfCM8fUt0EsP2cgvZHInh9RFCRqgbwZI1QnREGsMfSstk/AOYxHoxq?=
 =?us-ascii?Q?YtwhdgBGZQZi4ksEInKxtJ59s29+2izLkRWNiZacPJeFZlukNqIQHsXhmRif?=
 =?us-ascii?Q?DSGVn7lTnY1mH9jMqJjlYIHWHudXjrPHNxXacKD6rh67vN4lIVwrMfrdzNCG?=
 =?us-ascii?Q?Kqhb6Rjab4kD7O8h+jWUkDEHj19u8BrGEMsu5S0oif5swwoytJGGTvrvNuZN?=
 =?us-ascii?Q?YZjrAVDmYmiglxaKkcl4JD83rN4ZLWMFKnIGO87n9KMNb42jGZYCq+NizCsV?=
 =?us-ascii?Q?LBMSEnjhH9L7b4z6AZnpnp77ayEgPFf9tM54i3J//vY9fuIOEnaY3rUda6tn?=
 =?us-ascii?Q?jkyyKAjBtTSlmuYyTF+WCl2Go4IqLOhnVtmTQyfqbNnmPYKZVQqqKlzyuiyv?=
 =?us-ascii?Q?VWDTM25YMfiGvEBImyGaqF8TIiYtc3AJmoU6xQWbZyUnaHpAXix91CzZC8z8?=
 =?us-ascii?Q?rjtyFiEKkw349nYWY17z6Q8Op7FoYtgkdfl2NAZ1JESpotd6jIHouJm8Z1/S?=
 =?us-ascii?Q?DygLx6p4B9Ty/jTu8zghXW29y8Tfrgg7YZQqwtdz7WJ+04KQ2g0Xjr9bMlbz?=
 =?us-ascii?Q?CQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6bb963c-4cc0-41e7-6b95-08db5abd1a21
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 12:07:23.9654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JwuLYLXSM7JYekcgRuQYItkxxLxTZOpNLBxQ/0N5iQ7Ua85sbp6Za+Y6W5Y3fLwj0IlB6DH5gJ54HmLVBma0v0pHkLnG5JM4ftvs1CU4zXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6125
X-Proofpoint-ORIG-GUID: RwDLi7V10151lr2H-H9uyUkr6H6mrMfy
X-Proofpoint-GUID: RwDLi7V10151lr2H-H9uyUkr6H6mrMfy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-22_08,2023-05-22_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=591 priorityscore=1501 adultscore=0 lowpriorityscore=0
 mlxscore=0 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305220101
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 12:07:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102707

From: Xiangyu Chen <xiangyu.chen@windriver.com>

This reverts commit b9df3387002195ad365735bd15a3b70b1355d70f.

The pahole-native package should use the header from libbpf instead of linux-libc-headers,
the b9df33870 would cause compile error, so revert it.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta-oe/recipes-devtools/pahole/pahole_1.24.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.24.bb b/meta-oe/recipes-devtools/pahole/pahole_1.24.bb
index f44b0cef0..2bb73c3eb 100644
--- a/meta-oe/recipes-devtools/pahole/pahole_1.24.bb
+++ b/meta-oe/recipes-devtools/pahole/pahole_1.24.bb
@@ -4,7 +4,6 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS = "elfutils zlib libbpf"
-DEPENDS:append:class-native = " linux-libc-headers"
 
 # Depends on MACHINE_ARCH libbpf
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.34.1


