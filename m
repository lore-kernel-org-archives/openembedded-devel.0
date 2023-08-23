Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1087EE49B1
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 01:34:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2361.1692754480238618316
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Aug 2023 18:34:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lQTL3Plz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7599c7e7ca=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37N10pLd025544
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Aug 2023 18:34:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=kEzSBiLbg9+6VYNTm/F++zOPQ9KsS2U8uBvhSz8wPnE=; b=
	lQTL3Plz7PVMD0CWx0fE3BFVn6ILswCkb/QwJ28KM1mTqvjDgDFvqBZgtyg0zSR3
	FFccnjtNLYYvggo9X3UoMUdNbZe2zswC047UqXp8AeOW1uvJwVgFfxrGEFUXrUkJ
	32tsUnbMDLvBJN/jwAX/a5S8k76mkq9WPx7um7cpHWgX90xni5t9F7NNKkp4+Q47
	jEyF4CjxFzp2A6TMe1+MNb/azb6k19s7V7fUFRJCuu8zXwYYxHHa3jYJAzAVCidU
	nqAskpqMDQgjFwXgz5LY7Gk1lBiWuVEJYzw5qrcdqtVFcfQ4/vSgWF2U6YnklB2w
	KKGNIZ6YkYhMKVv8XuC9OQ==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sn20e09y2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Aug 2023 18:34:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aWaashSP3ePG5Miue+nYEclp448J4yrHnrhG/K84R4Gs2s0OiSZY2kZbpQiR2uHdnr9sH8nlw5xK2UboDCOISPA80F68nYCkUhKeZHFlSrZ7JXBjbEPbsmi3WttLOUj2DsE7sSYAsO7CkHTUZAXRG35ME0VlMs1QtYEMZAnoKLTUvVNNttnnQ5la4Xy4nPNnGjcoEl952qLFKGA8HyMW1oGiQkaN1CCg9uppY1IQP9ZVBOlyUcYRIvs986g01gpTMd8CUWu9TvNstMGwx1yryoivBOFlvHhBvbykbZtNWAhd8i0no7eEQt0okrc3j+3B1jMGMZhJNA7FvPQSvI+PzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEzSBiLbg9+6VYNTm/F++zOPQ9KsS2U8uBvhSz8wPnE=;
 b=KSiWD0l59RteSoMXSSg8ftd7nvmLywhnhQ16TzrRzcq39kj2l9TK3IzqUTFqeq35f4eDWXDm9knvBSiLISvcgxUfT4cIQcJGoVvSUziwpospgPw96re0nGGNRyGhEKHsqm9/BtzjdOEdqFDYgPbFY7g8d94uurDEjkj8/ByjFIvHAPMkqKr+etk/E8plpLu+zLf1IVHSJL5IFMkAuiS8b/MEy3mvdY+pXg8oyfmbLOMgW5muCQDpZPlXe2jt6ruN5cOPMWX6vQHwDehDEDnFPHOYFe90o7j839+H3O5Wb8xrSHcxTYrab9yifwI3rsu5SEqLkWCu60sjowfo/PaQrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SA1PR11MB8328.namprd11.prod.outlook.com (2603:10b6:806:376::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25; Wed, 23 Aug
 2023 01:34:38 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1ba9:4bef:c1a4:306]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1ba9:4bef:c1a4:306%2]) with mapi id 15.20.6699.026; Wed, 23 Aug 2023
 01:34:38 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] samba: upgrade 4.18.5 -> 4.18.6
Date: Wed, 23 Aug 2023 09:34:23 +0800
Message-Id: <20230823013425.2252936-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230823013425.2252936-1-yi.zhao@windriver.com>
References: <20230823013425.2252936-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::9) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|SA1PR11MB8328:EE_
X-MS-Office365-Filtering-Correlation-Id: 37baa1bd-89d2-4be6-e9fd-08dba3791d50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	59zM7kryodN6BfVP55Fl1SwTOna4iphpaq2dZ1/Qp5ojWvitTgiBl3f5y8nBhkiGkBr/XbdtJ8q6CeAQusfWaM0VJUKt2q3K3RX8rXq5i7HK8Vy7BiudOz44qRKpVDJJQMRDUKqL1/yelJHiWVp8N79fDECKS52VObSsk/wg1PUkai6YSSn+9wV2qGsTHDsHeNQI0NI/MganhDgDXXwITgRXeCTpqyxesQSuieSnf4YBF1NzG7hEpTZkf2zq9snatkM8vBXJpzByCC+8hdPVKdFS0soHSiiB/7lHLtiG7B50gsaZ/KsRqwn2enee7uv7WxUpVpLM95dwwgwGh9bjmerbLYDzWQOqawF/jc9o7nvQRlj8v1loEvuB3vi5X/93+rjUmjQRIweS06TZly7J4yoGJw1U3Dzx0NqHNJ8u8tluD1ahCzlmQ7ZK1ZAtWkbV+/+BktJFGCWOdhpNATks/AFVlnuyKBrVDWSiGN77wlEpjBXloI9S/BLfhvoNJ22lZT9XqDa8b3NMxlIo9oBQ9MP0dMYBpp/hNAjCjRsbsHHPe4j9WZINY4gk4CQbg0DiMJ1R/d8DhSbZMgfd7hzZ00giEbBgiR+MP8NJdN8mYrQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39850400004)(366004)(396003)(136003)(376002)(186009)(1800799009)(451199024)(36756003)(478600001)(41300700001)(6512007)(86362001)(966005)(6506007)(66476007)(66556008)(316002)(6916009)(52116002)(66946007)(6486002)(6666004)(2616005)(5660300002)(1076003)(8936002)(8676002)(26005)(44832011)(83380400001)(38350700002)(38100700002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lo17WTeegGpAQ1fhPR9ruDFlb1TthIOGRdUadtQwkhR3BOE1WuuCZO3K7ZwW?=
 =?us-ascii?Q?IJcGWtIImHMrvRmhanJYRMJalv0onnhUTPl2eHGbhLH87KcToadaY9jQMTAz?=
 =?us-ascii?Q?4oGSQkFQYFYFOqhYONYeUARR1/+THlWmLJgVv44KAko0YzJ96JdRdTEIWENo?=
 =?us-ascii?Q?Xfag7KegIVFHzK0SOGR7EuP97DSA05j3X5I84K8g47wPOwuR7iIH9y32oT6H?=
 =?us-ascii?Q?ha5EajLcQ8k1eVGbkEOVgE92Yno0n7qQTXEgUJqr1wR19+oqz2USK00cJ81P?=
 =?us-ascii?Q?TGiF5pJ5Hg77FQ2Du0ZiYHoiJZzuXuMN63reSLijWQtH/5A6v2TfVYZxwauM?=
 =?us-ascii?Q?3vRL29ej0Tr8EZJei66oTu1c/ibmHlQ+j2iu9h8UWz1IlWv3GV8oLtHCC2JN?=
 =?us-ascii?Q?EH/zFqP52BcF64x15sXSBr6zvwuBQyxYRMx0F3Vt4X5Tz5aysUU7e82Dpf0M?=
 =?us-ascii?Q?5Z0ou577vmLf9ueY+w0p8Ov1Kr1lVmImjJeVGqAPonfRL5vVAyVss9RaQWjx?=
 =?us-ascii?Q?qb8Tmzpb81aoEfDN2ld6Wr1Uco7LCQ08bMFfWdxNP252E/AM/jdop397Mcqu?=
 =?us-ascii?Q?D0ptvbEZtxPtCGPT+RTJmPRPlsuzBD8p1xJIzI+0k3ijguaSQ+3eGnEF+xJK?=
 =?us-ascii?Q?wA/lE+r03Gs1CHoNFEprRo1kbcGiZzoBr8fhF0Ur3U0VeOiXsnp+lYuXyThf?=
 =?us-ascii?Q?O+ujUzzuaX2a6W53/yEC2D6mouwUy+Lo8nbZkfPi0MnRcygqyInb7svNXm+K?=
 =?us-ascii?Q?MejA2FVhVI9j511wU2bOycsO1FnxqGWuv3kcarvXEhpWxdX4ZBCkujLA+dc8?=
 =?us-ascii?Q?sTElgEJrPMDUua+fcpFeJgxQVxV4PhAzPOUkAHGvif0KlqSR3bYQ9/jeaGt8?=
 =?us-ascii?Q?rL1/rNl4WRFjz14ovh6nnYILxs1WSfEw+DtKsdpdkht9SZlAFqUgY8uttYoy?=
 =?us-ascii?Q?KDGQ4dTIghBYtNrbvnRkJhzBiFTzmy4iG+NzNnRoNycHBpwnv5ZxlPEY7KKx?=
 =?us-ascii?Q?GmPg7UYJ09pHG/eZRakoflxkVSApJuIndKRID12RNvhSaw9nSUb7oy1FQNmy?=
 =?us-ascii?Q?PKtkTmYfdt8F0hIEdDkAgRy6FaaFmI8jTCGUN0aU4H5zGGoSGE+CAE/kTs8P?=
 =?us-ascii?Q?XC7bBe9VCeIqn3iNH/oJivbHZNvX6GFD1UHAdmif9RIVzrU49Kp/1GIwnM7Y?=
 =?us-ascii?Q?5PHmqcMBZzRM+8u3k6AER2DY/8Q7GkLHZfFsijKLC1WvufM9bY2Op7XGwEdg?=
 =?us-ascii?Q?ODMi9JkgkOjI0QXV/z3qqzxMWg6e/Wjkcmit5uat+DplbWBByqfhCOQnGMn6?=
 =?us-ascii?Q?8KUMzn2Z2okZLNvDiHpj/+DJach71+iEvIIiSD/f9GnrsJnelXYYue8erOW4?=
 =?us-ascii?Q?7AtQQ6FZD/cy5K7sCtGER52t5yNXIV5xs6CnEV4Z1xsBKvKCVqpnCLrCxOc5?=
 =?us-ascii?Q?JiL42KlXYlryYxy6BXKwCxEwR1bdgr5S0UNB+ZBBcWnGK6JhcF7W+UC0EsiR?=
 =?us-ascii?Q?bqp/QOqauz8CNAIvqY1ArN6tutL36tfqMQzhtV22MgLMZdgGroiiiSkmSiui?=
 =?us-ascii?Q?1UxvQ/QQQgl9f5HLyJ+vSJN5moSjiGfW5aIBzyDf?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37baa1bd-89d2-4be6-e9fd-08dba3791d50
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 01:34:38.4642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1AA2awM+u068NWGme1MDgd6A45zE8ecywFQy3vtoynF2sBR1w88EUGrjDS7MOcUvyUs0mgptNO3HQv4N0crgRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8328
X-Proofpoint-GUID: Bt0u3ROf8IkCdRyDs10UI7RDurk4ej_9
X-Proofpoint-ORIG-GUID: Bt0u3ROf8IkCdRyDs10UI7RDurk4ej_9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-22_22,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 spamscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=780 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308230013
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 01:34:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104525

Release Notes:
https://www.samba.org/samba/history/samba-4.18.6.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../samba/{samba_4.18.5.bb => samba_4.18.6.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.18.5.bb => samba_4.18.6.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.18.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.18.6.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/samba/samba_4.18.5.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.18.6.bb
index 9d8802ff5..c40e10224 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.18.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.18.6.bb
@@ -32,7 +32,7 @@ SRC_URI:append:libc-musl = " \
            file://cmocka-uintptr_t.patch \
            "
 
-SRC_URI[sha256sum] = "095256ac332e1d9fbf9b7ff7823f92a3233d3ed658ce7fc9b33905c2243f447f"
+SRC_URI[sha256sum] = "284c8a994ce989c87cd6808c390fcb9d00c36b21a0dc1a8a75474b67c9e715e7"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.18(\.\d+)+).tar.gz"
 
-- 
2.25.1


