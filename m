Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.2787.1621971536713627186
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 May 2021 12:38:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=G8NRadYc;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0779e63063=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14PJajTD028604
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 May 2021 19:38:56 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
	by mx0a-0064b401.pphosted.com with ESMTP id 38re2qh0rf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 May 2021 19:38:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UBw6xTrC7KAmtpJZJ7ZaM8R9vmEAmJWCIVvDn6dvc4hdhRRzvPyfjJmPk5Zop0QQtmhLpFYmA0sMR4b/VkfDA2U1cNW0uzg6mtRPvoxOa0YMo6m490QYbBQpZNmFJRrTio4DFzdypEnbATpRxT7MALqyAl+EuY1aS9zxQfMtFvdMhNm2T7HhqCAKtW+lkhrJDOMjXglPAxT4vinncldddVG7A7bv6dp4TMHJ5CIXvxC9YmiBOPt/grd7f0NBkdB4wPGf9WqFRkSjf+EXANUlu6+fmCjEPMQtG1+RmEEJ41b7Bt05TCJ3g0pi/Yy70tc10vBihjh0ItO4JP/xoixFMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sB/s3R9a+DtFddnARH/6LbvU0qtu846GdRyN2O19ghk=;
 b=erHkhi0B3oG8J5uKL7DQTmxBYK9nOFoktzZAl0SEvVl0WRl++3PaUIXg0CuEXXnBnFD3HvtfRCXb0lixCu4rYqCiGfSNfWZZWKPx+xzz0iZkh2tjj8gTuNfajBlqRuPiL5IK9cCi2LPh+ABy1Rzs56+igov8E5knDmh7nJLyzRnRaEVltXq5Kec1SKu/8aoImh/l73M3nw/jK4I3weubgmu/6p660XQ2W3E7LioRCnrHblVTM6n/V3pUxP6fMAI3k32UlP4g30BcR/jSEaljn9B7q1Ai2U3df50YVd+l8n36mr90VnGpXsAvSiYB9O3Og625YnBf/CiRC7f9j7KvGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sB/s3R9a+DtFddnARH/6LbvU0qtu846GdRyN2O19ghk=;
 b=G8NRadYcSauGwhheap3Yz+tqRca2/FOAhCnMhPCWXGNDBleD8HdfMeItY/cPlIMmbihcKe6JUKhCXjvik/90edcZpCLYA5Shpdq+pODw1z2xsbvZX+GRnHxl69Kr7QnwnbiJQgi0SDAyoJo36KdRgFSBnVS6Kl4/jnY0HvWlG6g=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3032.namprd11.prod.outlook.com (2603:10b6:a03:8f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Tue, 25 May
 2021 19:38:53 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::b5ac:be57:85a9:f240]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::b5ac:be57:85a9:f240%3]) with mapi id 15.20.4150.027; Tue, 25 May 2021
 19:38:53 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-prettytable: add python3-sqlite3 for ptest
Date: Tue, 25 May 2021 15:38:45 -0400
Message-Id: <20210525193845.2411034-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: SJ0PR13CA0115.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::30) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-fedora2.wrs.com (128.224.252.2) by SJ0PR13CA0115.namprd13.prod.outlook.com (2603:10b6:a03:2c5::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.12 via Frontend Transport; Tue, 25 May 2021 19:38:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77bb21e6-15fc-4f33-11a0-08d91fb4ba2f
X-MS-TrafficTypeDiagnostic: BYAPR11MB3032:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB30324ED75AB6E3AE5744ED159F259@BYAPR11MB3032.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:361;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ouLwiVxEY/2PGmMvSJpK0HLGRU87mTiLxfLiY/keEl2nnZ73oeznUS+kNCtfQzKmn4JsWS/VvdOh7FR85pOkqvthW9M0Fm8BGH/xUNwL+5k6Hc16WCfmcAi4mcu4Jzaf6HsXri1dz+1AbgBgu8YzZfk2/pWscDtr298EesKKt+lNT7TrozqhR7U303S09GK+/GI28cA4eNKjiwDUYDQNqUrl9t2jFgjvBJNlucboCF7HHZNhUXzVb1JWBF5dv7ImaUrNnfpYaeaK305EhVOBsD3mC7DT/IeKTnDcOUhC/kcr22zYuIX+M6A61gcf56MIPHkkaiWmOfH47Bx03ofWW8E/2zTAldYFL1GG+xYd+SGbIm1TYt4UR1rvbfReex7XKzXJOQUnZ89LaLVl54VjwTL4zIitHUV0UKYz68JhzQfgXIzkuwClQX8WKez1aQcJ/GrbGxPqVpO0LQy3MbZgRrVnv+WhCBJ8InjVoXodvNQI/OkvbKBh5LrYkr0DQVCZ7SYNHbL+IE5Qa/kpN3KVyiclCh2qvPcVXcWTKu3mNZ+a0rHm/16ftvTbfA4DeWMrKiJyCrAcXjWngXCD5SAPvlpYEEMhrIPxCkCqHVIWFDtYXYH/RsSFpDEGlZB4HriTH/6ubIM2WbrUi1E1ZYGQgghUljnljd13lXDvUSLnWd0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39840400004)(396003)(366004)(6506007)(66946007)(6486002)(6512007)(2616005)(6916009)(66556008)(26005)(5660300002)(52116002)(478600001)(316002)(44832011)(36756003)(38350700002)(6666004)(38100700002)(66476007)(4744005)(8936002)(86362001)(1076003)(956004)(83380400001)(8676002)(186003)(2906002)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?9qigEXyNC/9J0oX/7viCcnPCfgi3YKzZlOIYN7vs3LG95tZgXOBYxeuj9MFV?=
 =?us-ascii?Q?E/k+ibayUqeFaYUm3wcdXqvkBP6S8WfXCzsvUwOFfhKSH1U3o0VaFbnU81QO?=
 =?us-ascii?Q?gz7/G0VPetUdrMm5s3FBOqgVTgHFroNNvHiYKG8JgIH5X4bUcatDqipeoLnS?=
 =?us-ascii?Q?rCDDziooJSDwqOjILJ1S2P/3vBg8+zbDXJhzld9LH3qCWtzZ9eCd/lwxHU1R?=
 =?us-ascii?Q?vI4ivADS7SovZ456p2Mms3Ec5NFN/wmX5gNnNaznqx/O3ZDhbAhupCHNxs2Q?=
 =?us-ascii?Q?yyQoPenU6SO3WRJXHaaf9RWl0cUnCrWNdE8q3ERDaeyLR14UlBJlCQ4X8g8t?=
 =?us-ascii?Q?ddABU4sV0+aFgmJpElaqJ11+MiTN/xIS3oW7H7d8w3sB5XoDLwvRo+TT9/Dt?=
 =?us-ascii?Q?MQlKiVE9p6XtZMxC999FigMpFQS+/qP05MouO5cULcn2U6I7EKlsUvCpXUJb?=
 =?us-ascii?Q?4RLfsUhu4KicBWtTWP4NfJ4hq6X3BhUDxVWQ2dE5i84a1BECtqbhnu4fmTE7?=
 =?us-ascii?Q?/KZ3NmsBVMWYADizBAGVI5TxxUBlrtswJkeMv+okgLUHF2edZ3fxDQq10gWc?=
 =?us-ascii?Q?fCo6FmgdifoGCd1tARJR0GrluO56nAERwm8lzOt8MnVevwA9EByDOh+HYk6s?=
 =?us-ascii?Q?813cWGjVhCQ+i6jSyCXc5peONuwPHF5nY1AYtAXgsFTkELEJYIea0oQ1FW21?=
 =?us-ascii?Q?LV0hhdxT4hQjHAZWi3t9adWcNNKinJjPYDwXydgsBhsMpFIZPoch+/MOhY8E?=
 =?us-ascii?Q?J/mSXkZl6WRF490Mb7DikEUAfoPcTOLUV6CRsnptmM5/MMofys0oCZSm1UTo?=
 =?us-ascii?Q?337wruAzzbRynTyKjcB0bWzQ7IMB+NJ+Lcx7fgsI/S5I7AEGnqmF5fr927U7?=
 =?us-ascii?Q?B32sswLU2R4L1PYmHeEHai9nSE309oDmJjWt6Mke+oH0j5384s9Zii8PPva9?=
 =?us-ascii?Q?GeOMfhAiQCfjiQnBZwwzGVQ3Pdxg9fqP3z5Og5Dgdo7vU5naeI705Km7V+p9?=
 =?us-ascii?Q?s4S48F5TFS/x6Pq03SagqgUbBKcchIyclatRjKRTCU6DSIxOgSOva09VrH7y?=
 =?us-ascii?Q?Ka/YXC1BEbqbGn+sO2WRJRaXFv1d/MEbyWgbwtJGJCHFcwEbUBZpGfElL64c?=
 =?us-ascii?Q?i1hbyox20Q+xlRt1Qyu6+3xH8rlbrL+Xg8TbNhO2Dasb1VRagyhr8oeh0+Wa?=
 =?us-ascii?Q?yOMReHvGRHreU8qmuzIjz40dL6EkPW3tdWKGMRIessElpCRe4opV/9k2+2fC?=
 =?us-ascii?Q?kvabdqkJ+gELNoX2ySYiwdjmA2WidHEufMDfWWTV8u44lfOWbApfoaXPuAlo?=
 =?us-ascii?Q?Xfvwz6IbJyQq4NmJM6jHr6dL?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77bb21e6-15fc-4f33-11a0-08d91fb4ba2f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 19:38:53.0035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jr+uvMY0vnLpH0tZx3WHYqs/D7OEXZQvvrc22ZMsA5GI0nSCjVomeCHb+HkMLlGofs9DlvJ96HrWTljVjTKaAnHE4YFnxNcmdy5LiAdZKqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3032
X-Proofpoint-GUID: wd5UiJj4GfZHCeF0V-_JCv25wbI2Bbbd
X-Proofpoint-ORIG-GUID: wd5UiJj4GfZHCeF0V-_JCv25wbI2Bbbd
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-25_08:2021-05-25,2021-05-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 spamscore=0 mlxscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105250119
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add python3-sqlite3 to ptest RDEPENDS.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../recipes-devtools/python/python3-prettytable_2.1.0.bb       | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-prettytable_2.1.0.bb b/meta-python/recipes-devtools/python/python3-prettytable_2.1.0.bb
index fe7206255..70034f840 100644
--- a/meta-python/recipes-devtools/python/python3-prettytable_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-prettytable_2.1.0.bb
@@ -31,7 +31,8 @@ RDEPENDS_${PN} += " \
 "
 
 RDEPENDS_${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
+    ${PYTHON_PN}-pytest \
+    ${PYTHON_PN}-sqlite3 \
 "
 
 do_install_ptest() {
-- 
2.31.1

