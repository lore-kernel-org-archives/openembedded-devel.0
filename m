Return-Path: <akash.hadke@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6238C00140
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 07:52:54 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (IND01-MAX-obe.outbound.protection.outlook.com [40.107.222.77])
 by mx.groups.io with SMTP id smtpd.web12.8238.1660290768647566674
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Aug 2022 00:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=rNA9unv5;
 spf=pass (domain: kpit.com, ip: 40.107.222.77,
 mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KRFZG8KEW0IOESVWKZ+KK3MJMhfyB4E2m88bCqTzdRdi2lxeOPTh+z0iVLmPnPNFDdfEJ1SFQRTLDoKo5lTm79VejSD4gOMrW+0BbrKKq1e89SESuQGqvcqulrbCl6hWTNWJ3E2gEGV8EMlIsZrObe9B0afD19LHhHTeUUpIfgpwCO7F7cyo2J4bFrAM7XEnsY6md/Ks0HDjNgSQWEA58IxOkJtO/9WgBoN9V4T3SmdSL0r7WgGzHSyct5zL9KVT6I5IVkwgCSk4dzRsLtmt0NZvVyYjAyVWoTnJJB7KMysr/X7p1T2o2b1grzcLaax75bOoGkgNmRVo5EJ1IYuJ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vAgTzF6x9BZRiZp/HsxOg4TgXQWCBi3Oa16Of1UGap8=;
 b=Du5F8Fio0wVeFKl723S+IQs8qcXfBoK9PZHZNKmCdA2ZNmpnf1IU2x/ttWU2d+7ZEOk+VkVF7k8hu4KB8fAQz6ueVgJkaEs1TNydewh/bhIjqjTELZQnUUxXUiZYRGuoDjZa6f3MDVe/hOGFyofNNenxyIB9vCkUwKyl4pPt/j/Yj3ZfoKYeWB/5iJfi66ECCKYTcRFUnuy3xIVcqzbU3Wkd9uV3kZW4L1iNv0fhFRh0ACfjJpFw3Jl/5U8u0h7CcX8TspAbwdTqFaZ5ejGjfIRPB3PzXj/0IxKNAW1prvXtrp/qdEUOKPHz9LZMljEP6b44gKXw0YitjScUDpGAsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vAgTzF6x9BZRiZp/HsxOg4TgXQWCBi3Oa16Of1UGap8=;
 b=rNA9unv5NmySUDCWuX+/YDXOc/HtoM/XdpTzwOIbJJ1bg4N+Ia6KgRXAUkBUM+BZd3lJepZO29RjP3h8Efk9nN4WXYCOn3YjO2A5Yt8yeh+NVKdwEQIsGOqSkuuVH6UlHGNxHiAs8CR7APeYPNs10ZK6zInOsT7wKU4BdgwG6MI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:89::13)
 by PNZPR01MB8490.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:5f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 12 Aug
 2022 07:52:46 +0000
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5d77:6438:def1:ac50]) by PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5d77:6438:def1:ac50%5]) with mapi id 15.20.5504.025; Fri, 12 Aug 2022
 07:52:46 +0000
From: Akash Hadke <akash.hadke@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: wangmy <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [oe][meta-oe][dunfell][PATCH 5/5] c-ares: upgrade 1.17.2 -> 1.18.1
Date: Fri, 12 Aug 2022 09:51:36 +0200
Message-Id: <20220812075136.31326-5-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220812075136.31326-1-akash.hadke@kpit.com>
References: <20220812075136.31326-1-akash.hadke@kpit.com>
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::19) To PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:89::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da074cad-cb36-429c-837f-08da7c37a4e1
X-MS-TrafficTypeDiagnostic: PNZPR01MB8490:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0JjMvF69wmw3RwFiXgBudMz0XE2GTlHQeR4JdZTXP48cJgGy7xmgiMJas4aDxfzk7fKu4+JJdizSy6e95pEWiMbgp+zAoWWLvB2JIHfLNPMKPjZDwuiYrxvn2g3ysCwAQ1YGDc65aAJWZwVYo88BEE3yhjQIhA85qkXMNXjVhLEdYiJ8VaPuNBI7Ez+hIqVKo16UJYZFQO1x8HFldbO25brRZP72dFTBLc6v6qfGON8QSlxvrvIGJvV8jj5vpKnaVh72jFO1Hj1UwocvZoFY4yrJRlX7t9TLXHCy4aK5v96oIIYYbcsGzGSOMIpXXtGDHjmmKb7rAyMBsyPHqMy90X62uyx5r7KL0sp6Mzhe5l7fylsIryl28xgX2J6Ay3R5IIPd/OY8m7k8rIWF7BelAXqfDtGvabQ6PzhZn1DdECxEC0YDMKCEOtMpUE0OtKNx2rmUzx9hn1hQmqm4hgpu7z25qUPaEbH+GS5NpGU61jX+j+ACoPgaEUEuTTOaVl9p9I5R0p1+7sRQIZoCP1eYFMwVsij+4uqBzuX9RYB9DEosy6KYT/y/L2FQf8z3IQWVhTlfOMR59Qw408Qx7swAL3j04tVyNBBYzkOrVE9bsJJYnI1F2B6LOipUNM2iCQ39Van+TwbaSGRD9E9geYdQUt/DjWboCVJapWU+MPxIf11UR7Y8HuPUZ6tObjD/3/1b9mqCI5atYCOzCwMZHy71TRgOu+lWkUzDIkKsieVvI3crkU1Sbwc+otHnESkc52CrA/QT+as1SYr0beqvmT5GX7uuS4OMSflNCu5I63nIVt0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(376002)(346002)(396003)(366004)(36756003)(5660300002)(2906002)(44832011)(478600001)(8936002)(316002)(66946007)(6916009)(2616005)(38100700002)(38350700002)(6506007)(26005)(66476007)(6512007)(6486002)(86362001)(54906003)(41300700001)(52116002)(6666004)(186003)(8676002)(4326008)(66556008)(107886003)(83380400001)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wMdB/b5e803rGhlJYZPRI7z6knNb2cTRxAvYjzc+kJsSFfzMJxCg9oR8T+ZK?=
 =?us-ascii?Q?fxlE0h8tDB+5qO25U5qd/khe5wnPTZAPTABV7xp83RDU+lXvHBnfrX3Jw6wK?=
 =?us-ascii?Q?xsDJ4CTCndqPCVwuPXDyxuuqDis6LuVY2nDmaRN5QGvN/noeY6yYsTCGB7Vo?=
 =?us-ascii?Q?NI7najbqVLkm1e203O4F0iPognMa57EfT1ZGuCcIwLLYiIQHH4Le9TNcfPw0?=
 =?us-ascii?Q?We2yn/J11g9YFjs+Sv7g3CP7W2SgUVzaikyEVXiDDL5Fo/bogU3QAMTZ/j0e?=
 =?us-ascii?Q?fC535jmUUvnBYb1qFKNbQlN8TP6JCQqjYLeCqL7gxRCkMeyXDIQSfvbxvEgU?=
 =?us-ascii?Q?wk1k4SYKyPlhFxY7jcsUJutXA8RdnF7MIhtZjZxF22/LQhAcJSE9SN+zmyCT?=
 =?us-ascii?Q?zbI+kl5OY5Y+UIBGOZgfxd9pdCdDqX0cv34Urqb1IriDZapfs9KhE4vAjgHD?=
 =?us-ascii?Q?uR21AywfC0lLgSwUdanAAezMW8GYVqfLEdQXZaxaNI3vJWMTOeGXI6QNeJGl?=
 =?us-ascii?Q?YilLEOfnIfyP88foAdZTVjjDbh+xBfyECTtnjI691cmLWay3Q3OOaNKXPNB7?=
 =?us-ascii?Q?J7+pO2rVdvVv6L8tqGUKL7WbMFfjQ7qPBLWRjJzrQ34NX3DhhomMupNKiBLM?=
 =?us-ascii?Q?RfT23ylwvqLZ7Qxp7QoIATVZuvObRYsimZdIV0Tb8EKiH7TM2gcS+x91zJ9p?=
 =?us-ascii?Q?Ic0fRCFuFZ3iDD8ZF5pTxHC6YjwKHD5XYE+jdNZwZkcyBmHpaubGyvtqnx3c?=
 =?us-ascii?Q?tRNth2jbyKjjbIrzP1Lzh6QsnRvaFVLaB7LYjc/sOptbgjFtyvuveB1GQNs2?=
 =?us-ascii?Q?3k9Li6XwNDzQj0F06LMJdFp8Y3kRa7yoS1rMV8bInMdry2GNNwc4QnH7ap1v?=
 =?us-ascii?Q?1nyDej5uFU9bplTOl98w+XhAcar+MncFp3rslAmH5ZWjDMqJ4HBWbiemoCiq?=
 =?us-ascii?Q?+ek9Sa3P9WiVx/fjoQRqPnvsbBS2u8+qQCU0OhTesHtA8gH/8cIZldwTP5nL?=
 =?us-ascii?Q?brrnIjtIUN+Ch1CNrr96j0dnuFHF5U5oveFkmHS78RZWjHSmatpwcYm4a/D1?=
 =?us-ascii?Q?fSJwEjlLUYbtiatRclxFbx7bRAklGwVdDAiCul48oJs24TmNt0+Egf+gmJrx?=
 =?us-ascii?Q?oC6jJ1444QgvbfNEUjoAJO4QteMaBOTpTfZ2iVCI0KZQxWGZF1lnVT5F+mE/?=
 =?us-ascii?Q?CysZpCHKoYEC+8FoJcY0NR1XxOkbVHbl5SaKRJewi3wLS9diytr49NVH5+9n?=
 =?us-ascii?Q?sqMRfd8GU+u8KXuR/BcAhkYyyI6xIs3akHo48NFul/dvV9Dus2z76qeJn+Pw?=
 =?us-ascii?Q?J9DGp2wdCUxiBJexXeEqTsNNrAa/KcTFtvhWW/E7XqQtr3bGxMKrl+hgrxL1?=
 =?us-ascii?Q?lQ+Xzk5hauySfZ9DXmc+aLd5KUqPW4CDPyoDeMMCysbxzQqsce2/jQbzdEGD?=
 =?us-ascii?Q?1u3Xi+UNdObl8pCLar+GvuHIGi6uhsQ74cj7fkomQ1BmTr1xApvTsmCETKHi?=
 =?us-ascii?Q?he4deghXlsd//ZxNHFYSaLeN3c493AmMVDq7Yn2saE9RE6L/YCmft2VMSFbp?=
 =?us-ascii?Q?DWmNG9NCmP2dnLy+VQF2PSw9QVYNcJpIlBzvvv9O?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 da074cad-cb36-429c-837f-08da7c37a4e1
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 07:52:45.9821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 0ar+vfymNxqSyAYrLRu9RC6a4lqnN5mLXyyCkqaSEbPBSIJm0Ej9XQw6kxqCRqFsc2yzkqt1y6n15fpHQYy7nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB8490
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Aug 2022 07:52:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98206

From: wangmy <wangmy@fujitsu.com>

c-ares version 1.18.1 - Oct 27 2021
Bug fixes:

ares_getaddrinfo() would return ai_addrlen of 16 for ipv6 adddresses
rather than the sizeof(struct sockaddr_in6)

Conflicts:
meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e251d7b827d63277a36f1b8094d992303329b866)
Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
---
 .../c-ares/{c-ares_1.17.2.bb => c-ares_1.18.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.17.2.bb => c-ares_1.18.1.bb} (91%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb b/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
similarity index 91%
rename from meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
index 80d711a36f..6e0d0fc38f 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb997454c8d62aa6a47f07a8cd48b006"
 
 SRC_URI = "git://github.com/c-ares/c-ares.git;branch=main;protocol=https"
-SRCREV = "6654436a307a5a686b008c1d4c93b0085da6e6d8"
+SRCREV = "2aa086f822aad5017a6f2061ef656f237a62d0ed"
 
 UPSTREAM_CHECK_GITTAGREGEX = "cares-(?P<pver>\d+_(\d_?)+)"
 
-- 
2.17.1


