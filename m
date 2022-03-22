Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B14C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 18:39:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14167.1647974369887177693
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 11:39:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=JuJLhRpC;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=0080b8e7e1=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22MCHQD6000881
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 11:39:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=jmAUJePBWOfXsOqN+jxoi02hzy66bWECMAGbjLOYWfE=;
 b=JuJLhRpCvkpHfmzHdq0AzxIwZ+Q3bDe4MKpwSwJmHMNrcfjYiiqfQDwoDmEUr3vsQsuc
 bARI6l5M3sVaOIYInyxQFhHYpkHCpzdTvNVg4ChkF+4pFaZIYCQX4ZhDPkyfvDIZ9Oxl
 DwhBH1ITffkkUVGH+KBSwFbsaHVbJls1TP/Ees2T2AERVKI4rIdjPxqnMy1Ngya+yIOi
 21yMAKm0XYGBjaQS34DSThSdksIO8bXoxdKy4HSQGyILbDUx/2wzxdlLcpwHV0qmqfaY
 LV8Tm33EQu1+6lew8zEkn3Fj2IV4H1OKpwINQobhauxbyGVcpriPY9wyY03dBlpAK4ih 6Q==
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ewepj2gwp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 11:39:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HmKEKttKtIjGB/AcJKzmryN7+Ka8kwMyS/rliTA2Q3mw0HR3IXRFOHGllrbUom7kvU1z+NDm9qpng7DL1dGkTj181SY5lnGhgshStuGQBhkL5e6IVfQidOrXh9PpI4AP75eVlxS1Ojj9Sb6jSGBrOihEUX8GeaqVi2luGqrSpwM/0VhVFW2sb+dZG1MIHyp1v78mgwi9bWdlcCpJ8GY67IE/NUMYnI+ancoIQYumBl7SCxzysivA6I5UV/vf/uSSUqTNu5IniPjok3Sa+ZQhSl6QoVhxIlFdBzoWonI16TMgVCFSj5xZJjx8QV0sNoID58JjRvF0+63b3JkDn88FTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmAUJePBWOfXsOqN+jxoi02hzy66bWECMAGbjLOYWfE=;
 b=FUhKpuy64hkeZ4KIvPWlUp2Ny8da/MTT0RnwswLv35MFJevlHhR6o7fpOJmAw1fB64hClvivo4lc0WLy5Sgp3XZK3wo0DdgJ3LEPYBzwy9uDfxYgldtSktz8/GFlMMwpb1TmqT6cECFLj88Swo56Cnr7ugNf6Foj4AKQa4nKSQzjePh67s6HdHGbJSYYrZRuDO5Ty9BxLtvwfeB8Bv4VbS/FyXl/kzmV/HU9X9B3C24ufNgg5CfbIZKcK5eTVULLdyVQKC/nx06f/KJLN28+6PcpxpP3MjuOdGLov2bK0I5sW888wKeCD3Kk0fAq2agBreeYsYFlwE/iz5UWZ5DoQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BN8PR11MB3841.namprd11.prod.outlook.com (2603:10b6:408:85::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Tue, 22 Mar
 2022 18:39:27 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::c1c7:209:c28f:67dc]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::c1c7:209:c28f:67dc%3]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 18:39:26 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/2] python3-prettytable: add
 python3-pytest-lazy-fixture to ptest RDEPENDS
Date: Tue, 22 Mar 2022 14:39:12 -0400
Message-Id: <20220322183912.21448-2-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220322183912.21448-1-trevor.gamblin@windriver.com>
References: <20220322183912.21448-1-trevor.gamblin@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR01CA0126.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::26) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8c7d704-f8d0-4843-8081-08da0c334ae8
X-MS-TrafficTypeDiagnostic: BN8PR11MB3841:EE_
X-Microsoft-Antispam-PRVS: 
	<BN8PR11MB3841D006789B52C1540880919F179@BN8PR11MB3841.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gjI6QT5HNKOylflnkkicqftpEGZyh7DuL1HDVwXr7XPttbyGVjpuLhFlwC5445QtpRoFDmxxXSYziq/rYbUgkCuJ8n8BLVFEkOyEMRC4p92uCcD+0otEMqZwoAMQkc3YA4qpJ8WM6OtAel2hr0gsUPRnfX9OtA8kI41dg5DDPzHcjDwbNoXWQ08+innczOu0j+UaQHzHkLoVi6S9/CH56OJsZnRMZXjfwNaNu8g6TUZs1bZlplkTdK2zHfQthdPyF4t/+e36mR8vqqxm+dneaWqvJGc3jXcm90r6AU2RJ5NK7rOoyHU9uq7ONJNlPglqpKfWLYnKhH3eOoETA/P/JOwkMiI096MeLpcKAr93QtHFAAeAFzIy/2EbnsR3caf4GwV3zs9RCcxFohx9qYqxuHhUxihCBWTSGzAgHBTPNUgKGRYJ2waVXiHgY3fMrNlJejSlNE/J8Lp8N6ueaLQuVus1mix00sUuyufavmPtM2gHqUeFL4tj3W+LoZsREft5lm+bdkF/J355xRnKz6AgNVBRnMv7xfB+utAYjEPw60QqwnMG81cq4lmlS28LX8lGfHBIHV9+8DOCq+AFOswxhluwK2rj54JayhnGFT/jeOKRXVmXxdFD/i5RzKAXBQicNaV657fzCn2T48crrbwjgBzgAfqJr5YtUQwNd6G03zAxHzpHZyJuXa6TQl7e4+fdbA5cFTMbtal6GDwBevqY3Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(8936002)(66476007)(66556008)(4744005)(2906002)(44832011)(66946007)(5660300002)(8676002)(6486002)(52116002)(508600001)(316002)(186003)(2616005)(26005)(1076003)(86362001)(38100700002)(38350700002)(6506007)(6666004)(6916009)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mllPpostSYEPQN9RXep0VmPgO6o8fRTkYmiMWWAQlHD6BOs3lG9O2JY3XSwm?=
 =?us-ascii?Q?UkQKH/yynzeiOhBvcjz2tAV7JEoQsi0TBXLYNV8coOiDNBPDe1egjsIIgW01?=
 =?us-ascii?Q?a/VEFxcuu1EgrUHoblCTh1GxHqzLkknCPGWpWw/kXGLdb/kaW2wefGsUUmi1?=
 =?us-ascii?Q?HG9e3taOeJA+zGhTynFkk4iYcgxPLZ+qFJlD6c+y8sJX4z8OOSXJF+UFXo15?=
 =?us-ascii?Q?nBjI0EYcqhxi++2KpwNSSXSUQNjvXA11otVeup+oVDK0npRv/ol7qrn1pbrr?=
 =?us-ascii?Q?8go9ZUhZKpNCIdN+FaQYutGqGptJQBMr5YnrXwBZr34b3c0j3HE43kDiPlj1?=
 =?us-ascii?Q?IE92zrzBIf0XxbBa3vJITFuP2X1Yqo80MMycEr+6lxs1AEES5lQF1RQk6C9b?=
 =?us-ascii?Q?xheGWsU4AaqBP8GngXKR7U+xuK5Ia0/GiUYb3fsJpsLSXIZEGs+bttSI9uGn?=
 =?us-ascii?Q?Qcxqmq4zR9BbUgsGNgVPdhYJem3iM8j49D3wzajkJRWYWYhvGePGxKsh5dW5?=
 =?us-ascii?Q?iVuJk4CZvinOX7w5ohus8oiSS15thfZrAujCcczLSAxbjP/vcy3Dt0V8tAAt?=
 =?us-ascii?Q?6SAwfzTG0Fc2Zq044UPMuIWUHUXgTAeiSLwhaQIK2vR2wDXmK4BYpE180crS?=
 =?us-ascii?Q?PICDb9QUy0gz+cXr9PuF4aqm6ONqj7SK2UegVFOxiqp6FQPd9U/enAVUlILS?=
 =?us-ascii?Q?d2OSqRAjo85pDZUuHYB6XzWfsTpw1LhWjQ7RmCb7nOI0ukfojgV0le8mlF3y?=
 =?us-ascii?Q?+uiCqvCdsaa/xxEX1Jwd+Httg+VZB0kyjaWCTJs//S2o/MrkO7Eg9/25XeAS?=
 =?us-ascii?Q?E1AYRFT5lMph9z5CV6winLtRS/JIqudTLQsmOVDovnRJDGZxPeuSGASHJ41T?=
 =?us-ascii?Q?phIQndKaSC2lGJydhvlpcPhomBQQ2KPA4COVlOUC2YNCJmbMa/1WNQACf19q?=
 =?us-ascii?Q?yIRutsecbsii8EEsRBiguksWeBDUHVmB7od7prlDkpIVM7Yz3pqyBBly8HXq?=
 =?us-ascii?Q?1XQt3RDAxmacECRh35bEE7wR5b044RFwtPVyn/NE10g1n8zazy8wI47f/FA1?=
 =?us-ascii?Q?rf+Pcw/LGvQICtzi7J8iilXMwfGpa56zWM+1HYCq6NK3MaU3yVr/GupbvgPc?=
 =?us-ascii?Q?Bqem9OXUJSy0wU+/UqLq/DUGNaFEUnXuH+7oxmznmDIcyauyJ6YAlto0y43S?=
 =?us-ascii?Q?NNVRQ9yNaGIiYePdljTy1wqycg0eUjB/WyZgfa2DyHFCtwh4CL1QEbLMPQux?=
 =?us-ascii?Q?YdU+7K+Iuwf0NPbQv++wjkeU2NXdxkzlB+a1HOSJFTaHvr/Bf8pKsV/skuON?=
 =?us-ascii?Q?ZhLcr4uK7De7EyqWMI71zUW3LsYP5UEAHgkYXS1pJdlMQK7plHbQf3iIUrvU?=
 =?us-ascii?Q?xMJ4oxnxrThPnPhws6YkvNX2o7Fc36/TL+8KLBrFbWRTw92Gucin/TtKULik?=
 =?us-ascii?Q?PlnjBAmO/9Iy7l9y+9dcAfXCb1VKoEWlgTfqJfrtD7Mxh/QuPeR1IA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d8c7d704-f8d0-4843-8081-08da0c334ae8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 18:39:26.8775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 uDQ2ym5IVe5J2XeMguN4uRmOPLUjfrXeFF9iBHawrO7TbGXzmixIIjh29VhCBK4vGySnLyTcYs4vuVBHJtwCVKoQOIhy0ufGsLvB1VxfpjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3841
X-Proofpoint-GUID: nMviNQ2bKZ6xZT04vdRS9Uv4nXnkSpYD
X-Proofpoint-ORIG-GUID: nMviNQ2bKZ6xZT04vdRS9Uv4nXnkSpYD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-22_07,2022-03-22_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 mlxlogscore=691 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203220097
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 18:39:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96150

Now that the recipe for python3-pytest-lazy-fixture exists, add it to
RDEPENDS to fix the broken python3-prettytable ptests.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta-python/recipes-devtools/python/python3-prettytable_3.1.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-prettytable_3.1.1.bb b/meta-python/recipes-devtools/python/python3-prettytable_3.1.1.bb
index 3b75086fc..5520edc06 100644
--- a/meta-python/recipes-devtools/python/python3-prettytable_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-prettytable_3.1.1.bb
@@ -35,6 +35,7 @@ RDEPENDS:${PN} += " \
 
 RDEPENDS:${PN}-ptest += " \
     ${PYTHON_PN}-pytest \
+    ${PYTHON_PN}-pytest-lazy-fixture \
     ${PYTHON_PN}-sqlite3 \
 "
 
-- 
2.33.0


