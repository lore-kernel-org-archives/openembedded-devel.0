Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB68CC32772
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 15:09:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.30340.1660748981888942936
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:09:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Cte4AHT0;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=522867605f=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27HDdclx015790
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 15:09:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=DQrBBmy1c9luu+/U8TC5amjcC0V1RSTv44jIBSVhyUk=;
 b=Cte4AHT0qBUM5NgO7tgv7zBd6p/Kqugkj70fH2+RcDRyZB3ID7UaU5eh60p3afyNX4q5
 /U0VGSnzOIyDNvEoBDYvhwGzG/f7ZNT4qV2lQB0rQbYZxvMReoD+d0JcAIRAKa3N8xwY
 WHjCAAHfdrwY/qSpVcv53lodwQGxRfAWIhYMo0g9lbmlLzNCmlpjdqYD8GVI16Rgmp8n
 QK1XqV2tlTcWmeCXEmktuGHH2Ari79tJaY1B0OXRUInETH2RkGzjt+2Our764E31mUcD
 gXBH4EvJgyU9TuwemG8/nGVLjl1LhjRfQZrJDFYdaXRIzoOMc1Y5+VkWuHcWUB5EvIdI LA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx2x8khn1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 15:09:40 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27HF9erj010444
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 15:09:40 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx2x8khmx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Aug 2022 15:09:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eyskbeq3Fb5ngZoERjfkcmFDhbHRZeh1Ms/d7/CwuIzybwLC7USfrQ+AJqkou1dcSYLoKg0H4G6jMX+saJfSNpGL521uuKEh4485OTtIvjmWVx6mZPhpGKq3K69XNdiolKOwT7Ml5BAdsLhFzOwail3d3sD3D+xE9R4heIpqDPEylYB8z0FYNKNcpGnKTRqHSQ/d0FYGdBANey6Ny7WpM9RaOzy5TkykLk4th57gM/9hc5rOvwScXaaMRMePVUSrenuDF71P6oP1avncAp3YaoXtxr8ZWizNLjpDmy56mwdCpiSX7jokGrt4pUfSG5xWv0I2GxgfXIL7vh595rzyzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQrBBmy1c9luu+/U8TC5amjcC0V1RSTv44jIBSVhyUk=;
 b=AZQVOeQgqFLf7Vr3EhxLKMCqPE6YmItKsQ6eTm+RCxsfxjsB1tl46IdNR/SIDAjrw92F7kR8cV2RQcjAXJkX1IOiGq3OHLFw2gCkpz7Rd3IP1QBXaUNJJaKhaylodE0fpTPTNBNAJaSS2KUiWBgJfLpLHuWSKTTYr/77t6Hh4jlPyzy6aA5AocjSmwsfVjyjVL3e8s8kXMDHWVG4ykZuA8LvoJ+Gq313T2jyFgllKmNsJJiHKOXtOPybhpnKXSp4d2kc/oSzbzF1fV8A2zaPCbtH9wHKkZR5dAllmfG4UYRik9RpB93Ev9l/rx7+EaEgLNKSUbidvZzdAb+3gyM77g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11)
 by MN2PR11MB4493.namprd11.prod.outlook.com (2603:10b6:208:190::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 17 Aug
 2022 15:09:37 +0000
Received: from PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::2db4:2f02:b7de:e4d8]) by PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::2db4:2f02:b7de:e4d8%8]) with mapi id 15.20.5504.027; Wed, 17 Aug 2022
 15:09:37 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Subject: [oe][meta-perl][PATCH 10/10] libxml-libxml-perl: Fix LICENSE string
Date: Wed, 17 Aug 2022 08:08:53 -0700
Message-Id: <20220817150853.2823101-11-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220817150853.2823101-1-saul.wold@windriver.com>
References: <20220817150853.2823101-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0035.namprd04.prod.outlook.com
 (2603:10b6:303:6a::10) To PH7PR11MB5818.namprd11.prod.outlook.com
 (2603:10b6:510:132::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd0e6a7b-221e-41e0-1159-08da806272b8
X-MS-TrafficTypeDiagnostic: MN2PR11MB4493:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6kwusJ5UXuyblRTlZ3ibo6TQ4dkInNbAazv5HziHJFHcpQNOFgM2oAf6187Nj0U0u2B1GnVeUUfSfak5G8louFxtD/WMXtGZTkWcn0i2cbT2KbM8N+9T4A4/dyydhgMEnkvStEw2HY8FlDhuDjQfY/Pvk66uiTMQ1Bc9VsjY9jtdkd3lA/rlzXxQUrOtuomWy2UpQPr9Z22ClVxaw97nryQ0iQTnCG/xvriCqoi0rtdupKredIlaqh+0Qc80865L+Mle9Xg377CyA9dup9vZGa4ZGSKFTs1ZbCjqbIZe6cHQm7Sr7ZTrBcD0Uc/bfcCBItrP4Vd5EZVu+qdbzjA8au2bTY/GgwbZSxdSlxiMqtoMPnGcs6CJiDd5R7pIQy0h8Z3aYMENrwrL/TGKJGTgvpOOPGGrFOk5Ice3SedqlDP0l1XERzKr7pibKQrg+8WzQBz9tYOUq7f+h5WMuXL+EVQx7ekh6qChsBnmLrSld18l9mi7BSJulP1zS3pktTN4kwmADPhhAatf5zq1kqxkrUUGW7QuWxStWy2wHIQJ/yv83Xj91az+NMBCYw5eVGMgce2cH0dArUhjr6puxK+FWDQT77PH2Wed+KercwCcCB99uMVlH2VjFB/2VLPSA82eZN1GkfmgWpY8DypcoBqM0ndlRcJsGrhOd3CBEhSqfQ2Jsr5BC0U/XNfD81LT8+m/10XaxuyhoDoGYdT9nNAB49VmVcUPx7R9vguJOCt+XuOplHmK0CdtT6gZay2cvlqbZJokHgFUa9MSLk6qcjs4YLLUCLVMFukqxLhr09xcud1QNhypsA6bv7qL3AqvhDjM
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5818.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(366004)(396003)(39850400004)(41300700001)(4744005)(316002)(478600001)(38350700002)(38100700002)(6486002)(66946007)(8676002)(5660300002)(66476007)(8936002)(66556008)(44832011)(26005)(2906002)(36756003)(186003)(86362001)(6506007)(1076003)(6666004)(2616005)(52116002)(83380400001)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?d9M8igV8Tzey4K18O7aRulMyZbvFmzuM0hZMYFLA+3EPl64jMer0qmBDuXYt?=
 =?us-ascii?Q?WLi1jBhZoujAjzatv1nNOSiuiVKehBOSrO4cRT6vwWOecQZHydCxgDw6dbSR?=
 =?us-ascii?Q?iSJrTL4l30oXpLqlMsGW9MicgrEN0jIt0uVSIHtViyge4ObeTODWDKBqYMsh?=
 =?us-ascii?Q?kCobGouy3IoUG+ay0S3kheZGyN/1lcWtiVfaOomL6dIiTp5xZsyTkFfz+iqt?=
 =?us-ascii?Q?CMA2VP9XCD/PX1n6XJ6v83Spb5m+j3Es7WW0qldCzRSDBu2pZCkFWxZF3KgH?=
 =?us-ascii?Q?5cDO4a9t1tYDIyUWPc3kfE4SLIIqMEe2TrzwN/IAVm6icYMLahhfgML/U5E0?=
 =?us-ascii?Q?/WaaUFc7nOMDaEaj59RBkzabeGKInxL1GW4E13uwmGq80yv1KZ6SyD+XjHxc?=
 =?us-ascii?Q?5oQRclgReiKZa1G9oaDSDs8UXURSqhRNLbOQ183amQkqfx72R3oVTZbnRKMA?=
 =?us-ascii?Q?cnbFletCNI3LhT60QGIXsGy0hdNgQQFvXD2EG51x2LGPWre0dEfedukEC5T/?=
 =?us-ascii?Q?Pxl1UKzEgRAESrLuYMJT4B3YmSs06pDr9iIGb3Y1VsDt88svxGsoUrhmaBJU?=
 =?us-ascii?Q?QIEVdrdbQYtN083w3301IIZFG13l/sor/rL9wH3tv6DX7+Kst+qXRoGOnhsA?=
 =?us-ascii?Q?s8wAfRcPAGSnBEDZTSbuUk7qUCqYnDrKqxGsIM759SFQh1ObJxLAcsgT4qFK?=
 =?us-ascii?Q?KWmUAeIJQjl6RiEgDAG4DuYwicnhpbTx5tTNCY7up3Xpvudx1Jmf7rckFxmv?=
 =?us-ascii?Q?/qdkMpXGHxaGhYrTsgWcg7wne9g4IYGEnVPxNOI9eO5ahh54/eR9vfZBX5C8?=
 =?us-ascii?Q?SzvlBwyZGbl6dmk0k2dyUH6ebMzqyqMateYjMeA592nWZowZy5WA4bVSL4W6?=
 =?us-ascii?Q?EkNWsfw6dCyXyItJR4JhPqZdgWjwbBSXbiK4UZtxA+7vAe63ejJF43ZmTtHi?=
 =?us-ascii?Q?1SbTSbLSZ/1NzZ8kLVLjM+KegJBklMw22LaG5yPFUFApw6EyQBLP/XJ6g1c7?=
 =?us-ascii?Q?uf5ex+6WpNp4pNA223mFfdjBJ+iM7T+Ts/II7u+3SrNRvfIt1wyr3pikVOUZ?=
 =?us-ascii?Q?7t/IaQohYqborI2qWxkXBbpYpyIjPVgWBo4pALM1ixBxw4mUf8sgpsb2sO/O?=
 =?us-ascii?Q?ygTRRhflO8zOEcMHDXmwlRzYLnmMlK50I9mChKIYt80nRqh4TWN5aY4gJv6I?=
 =?us-ascii?Q?HUekZCK3I4Lb9HA4+rotzlSBSYz+RCMVGNX6AHTYa44xScFWYaS/B/h7R1cm?=
 =?us-ascii?Q?UmI/7NrS4bn4qDMAzV0SzRGUAlZ6mgwgsA3zPivWdvB9FkJbXSZflJF4rZjh?=
 =?us-ascii?Q?LQdSSXgIXBQChgYuLewIM4xEoBuJ7wSMNqBbXsAqbUFLfDJHQOV5nBr8+6Uk?=
 =?us-ascii?Q?tHlBvD69Ao9gvbq674GwKuJ6osQTtowdQ6worlsZKodVZsDPpdNmOTR6vo21?=
 =?us-ascii?Q?wmvWBlZqolVwt0LV26G7XiCU85WhdLlJdPuwkGZP0SvMbWzTG+eM3BT6jst8?=
 =?us-ascii?Q?KZBfdxw47+lwOrkeOlsaOLsrtzXdnOzyXnCWdP3XLUht/hQ5i6xWupdjojy0?=
 =?us-ascii?Q?s5KImCeiUPO8/thcDmmLqTK7N06yQs/exxjB3ODYP4vrzWUgBoWXi3GAZz+n?=
 =?us-ascii?Q?GA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bd0e6a7b-221e-41e0-1159-08da806272b8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5818.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 15:09:14.8037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 nCRRsww8W5yS3pSCK1I7UPKuBt/nj0Fn0YW/zJO2RC1BDcYnPrKWpGlwNgb4VyROad9OdfW7dU7Pv9HLy1BntA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4493
X-Proofpoint-ORIG-GUID: EeQwvETMH9obb_rpkKRyhTy5Sz2-5P6L
X-Proofpoint-GUID: aVdS_jZY4SnAbCxps5FmUztb26DkWiil
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-17_09,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208170058
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 15:09:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98305

The create_spdx bbclass does not currently handle the lack of
spaces around the op (| or &). For now fix the LICENSE string.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
index c2898a901..c2ea47ae5 100644
--- a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
@@ -8,7 +8,7 @@ your programs."
 
 HOMEPAGE = "http://search.cpan.org/dist/XML-LibXML-1.99/"
 SECTION = "libs"
-LICENSE = "Artistic-1.0|GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 DEPENDS += "libxml2 \
         libxml-sax-perl-native \
         zlib \
-- 
2.25.1


