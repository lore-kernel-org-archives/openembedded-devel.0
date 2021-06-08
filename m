Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.12557.1623160260735883993
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 06:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=CH8wKYUQ;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=179390addc=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 158Dlikj001982
	for <openembedded-devel@lists.openembedded.org>; Tue, 8 Jun 2021 13:51:00 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	by mx0a-0064b401.pphosted.com with ESMTP id 3929drg0m2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 13:50:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T/7SjXBnZpzzBTPm0vbwICGvi/yYPMJjgcp0DtEi4oNlaoewBaSJ6PxKYeSy2Llw5nVz9SOKdBQb/IrqOaafy9P7f1Kh1y2qKfg/v4XmweZ+RVnhWhgfdsPsNo7JUWIh9J9g7f2YBzFquDTrfNDFI/RmX6gHKziMxf/z0n6ufOZ7mG8nTiXSIE1kJS0oQgt+6hlolis5fj/SuW2mS/zxGvzNv2BXgIUWSG8CLgWBKkqDYSZsbh8q1iZZJWWyfLLmFlptyOlBa31sPo/iUTVI7IUO+nXAd8z+D0wyONmB2T9yZQRzOzJ4MbGAKOeGfcZiFDPOs6uHuz2Wqv/YzCiYzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIg1ncBI5baqZHEsOUPozNwY9T3ZtDi0oB4xndICrd0=;
 b=QaGw5t7OrW8hjCOZ4DTW35Ne9HfhPFDz06nvcPf4u69G8qYOKA9Nrnr/qXdR0JuhUWSMSXUHOdZbz4OO7Mo/sW0Clqf9EpI9lzut5pnPuyaMXW52tppnBC4wnao3hFJzHiCZHrS82/UOs2muqoyUA6eoqTBdxtoANSmVuQM6Ooaw7a7mIf9+EATE+E3UTVK9oxn22/M4j5KGNWyvufR8JGWg53/PYxnZC7j/5az56p6xdgYUvEWduuNZ9kJObm1COEukgk/NOvKdbdqI2dJN0k/Y0W5wuVb8CNjLNCAmbsK2pbIveoOARUoAUxVnicwMlPSe/v4uGpEM9avICqL6Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIg1ncBI5baqZHEsOUPozNwY9T3ZtDi0oB4xndICrd0=;
 b=CH8wKYUQKD7f1MmrkD+dzMHy3hrtAHXT033lKNXhvYoGIlYmldMIvBWFXGO5+N6mpdyRbS2sg3di+nHA6q1AGwgCLCWoS086F2yKC786B4qIQElwWktBrb9DGpwCPsh4QBSvekeSqsGUAxo+9UQj8F1vePrz06/B0nSqt4L105I=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW3PR11MB4762.namprd11.prod.outlook.com (2603:10b6:303:5d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Tue, 8 Jun
 2021 13:50:58 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::55fe:763e:6961:7bbf]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::55fe:763e:6961:7bbf%4]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 13:50:58 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] samba: upgrade 4.14.4 -> 4.14.5
Date: Tue,  8 Jun 2021 21:50:44 +0800
Message-Id: <20210608135044.42608-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210608135044.42608-1-yi.zhao@windriver.com>
References: <20210608135044.42608-1-yi.zhao@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0086.apcprd04.prod.outlook.com
 (2603:1096:202:15::30) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR04CA0086.apcprd04.prod.outlook.com (2603:1096:202:15::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend Transport; Tue, 8 Jun 2021 13:50:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51aa55dc-19be-47d9-6cd7-08d92a847163
X-MS-TrafficTypeDiagnostic: MW3PR11MB4762:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4762E5C15F712E826598E776F9379@MW3PR11MB4762.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eULqfnoUISIbzs4W0P+hFCwO9UW/XdPO4zt940la/tKklM7mkJ+J9IX84qzj0+fUzk6Biyb49b8hQh3Fo08vlw+xVO15/htzo5vMploTmTuS8BA/HImV82Rdx4qF6nmL4mel43cGYQBrqNb22kLssCcaWBbx5Yyu/zdNytrVE4o+dR15c1mwuy8dxY6uiu3xWTPs2CZ7HZHAFMAm3L+W2t2B48j3tZfhh4Q8oPFX59jw1H6jqCw0eGV4hBEEBgB2mG83yLv97aSPk/whefDd8KgrSXYrI8hDVsVOUlbaFKo4a+sb+39IOlEqvYHgkFun88duhTSXP82e3lnEPH1QAenvrzXSuBiv1c1pcPJe67MU94cTQyiOnWGSYQv7OhbM6RS7AcxKUwp4l7nyNuv9fNuhb8DAYwjwZRVdOAAPvt0jERVGxZNK2vN6eIDw53aX0b3pzYRLzcq8ug5rp2fo1/sliAusnND+sog5JdRMRXo+EaS/6WdTLVjamMBSO7wk7iRdbj68lO4kzOzja1zgFJsVjFEepvrv8TtuSgZtxlYPTXG4Z2eldsWxS/L6akVTTswonyQ/Qo5361XTiCey/ja3mLo6zfaYNCY4OmVnuv4Aggshxg3DM0UoBemrRTlgwxO74xQ9fW4/0msc6vy5TtA6l65TlbZMcnloKsWX5mUrepOrKT9hqUuyt2YF9ITqPhyKFRa1OOj+5beo2cxRooG6eIE/OazKNs0w37utVi91oqaEa42Rba3KU1uJO5npX3ocAWGfdC0QK7Ulqq7KWQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(39840400004)(366004)(376002)(186003)(8676002)(2616005)(16526019)(26005)(956004)(44832011)(8936002)(66476007)(66556008)(316002)(2906002)(66946007)(6506007)(36756003)(52116002)(6666004)(478600001)(38100700002)(38350700002)(966005)(6916009)(5660300002)(86362001)(6486002)(83380400001)(6512007)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aeFbZjmp7aw+vW/i+3sRyuYxtUEzvmycQgmi6f2aNmriuYGmZ9xHMxjyZXUT?=
 =?us-ascii?Q?cWqOgWat8IJO3ZtNZtwZbuaLpg7s9YOjhpDcECeH+kaphetu7e+SlRT4rnKM?=
 =?us-ascii?Q?QpxDjt0uztQXJeEqI6LkvfujGdW/7ICyvWY9XghCnzA2MFY4UlA7aG0KgMm1?=
 =?us-ascii?Q?5VmSDKARYEG3vdrS3XT8LaFhvxF7ZqMxiVLNbWqF/Y85SEDgW5vOCqGi5dwy?=
 =?us-ascii?Q?AT8Rpl4LpR+uuOqotT0wOETIfWGIFvop0WyfsU0+QqOyIXygr4GNcA5/tdqr?=
 =?us-ascii?Q?VDfGYBGGFQWHpiCS475NgQxtG8uMoQO3ouycaj+BavltWcG2Rpzp3QZ5YrLd?=
 =?us-ascii?Q?nkdIJvuuPt5gq+TKYiDY14loexj1bhjYZc1W0z3A9jSxa8+u0eSE2I0BVMD6?=
 =?us-ascii?Q?nEWSA8CWZC2L1z5hIU1fk3ghT/DGtdOHxMS56rde26bFbZnqHpQgQ7DdUzc4?=
 =?us-ascii?Q?L+a+X0EfFVm8WyRSMo9eqwtrgxBfF7YCoXqugVj7TCBvNpLSbYT3BAW84acr?=
 =?us-ascii?Q?+REW0L2DoWhYRjbxCc6698xotZ6NsAYCM0fX9WOmqPF0oaARNNuQow1X8ZuL?=
 =?us-ascii?Q?Y7iiCPD4NOzAcwsJ9pxUTkAQAxEfqLoSYKUueeqRbVqJu9yZHewtP2vPVEBN?=
 =?us-ascii?Q?vxphjdiIfIwnQF78laOchM5bzH2EYLb6V8M6n9A8RWQfkx4QO8kEA8iTENVe?=
 =?us-ascii?Q?3N2iJDsPkLIIQOBJGF8+qJQfO89k6JvBT60pi939coZ3lnllNm7KSHMXY3e5?=
 =?us-ascii?Q?saWPVJ7iuszNJq/7fAHd/VBqfIVBH7QJga+8ZMJ7TTdZ1oZrDubcSi2Wf2yU?=
 =?us-ascii?Q?mFti4Y5CjIt/BaW40RanfyYmgrLVYDduQoM2qzoKdwBMXvjKFscZ6dZVCqJm?=
 =?us-ascii?Q?JG7HBpxrF3RZWnu1hCJvV+adONS4/Xutye8odsogiic5Hp8XRGcqI3D12JHH?=
 =?us-ascii?Q?8D/Hxqb0x8NO1joUf7Qfb0BYyqBVNSYX0DHjxhgElW+vVfaLqhCImyoUKAgs?=
 =?us-ascii?Q?5sgUBabqNcGZFTOn6hvOvqTFVqh/sdAjJ7WnqaMKDI0LrjLwxczveLv4fzUO?=
 =?us-ascii?Q?iGv5qEdkqgOPvKiuqC/FrVgrj3byXI7IPW8zCeT1dEMDiTwg4Bl3TPcILZ5D?=
 =?us-ascii?Q?rdb5KPzUKlbThMJDxsEZrdc/YgyHGXFxXmyKS6mnBmjGGXaoiYXKFMDYLXW2?=
 =?us-ascii?Q?ekxn1oeuZKqRI0TxCld+Z3Bf3d6uR7LK6NRGOsL7wdM9D+fTZDAl3ZluM/7N?=
 =?us-ascii?Q?geFASkDMcoS2znr+mHEhtkd0lIKb+xPxyfvFCGHmI+DgqUuO3E/YC4T5f5Wt?=
 =?us-ascii?Q?e6IMIc13E7vTa7Zvwg2mBiZs?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51aa55dc-19be-47d9-6cd7-08d92a847163
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 13:50:58.1353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: euRVEVFtF95bPRiLirdAuN2CbeQip7fisKT9ghO/w2y4pw5EtomagjdMlDXBHT3DC2EAZGoSUXQwPEci1+7qCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4762
X-Proofpoint-ORIG-GUID: K4VKHDKytMsLCpnIdxEFFF7CTgikNd7q
X-Proofpoint-GUID: K4VKHDKytMsLCpnIdxEFFF7CTgikNd7q
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-08_09:2021-06-04,2021-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 phishscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106080090
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Changelog:
https://www.samba.org/samba/history/samba-4.14.5.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../samba/{samba_4.14.4.bb => samba_4.14.5.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.14.4.bb => samba_4.14.5.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.4.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/samba/samba_4.14.4.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.14.5.bb
index 0e6f134c2..bc4c615a7 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.4.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb
@@ -34,8 +34,8 @@ SRC_URI_append_libc-musl = " \
            file://samba-fix-musl-lib-without-innetgr.patch \
            "
 
-SRC_URI[md5sum] = "171629ad42b4b303107e8b0fff942a1f"
-SRC_URI[sha256sum] = "89af092a0b00f5354ed287f0aa37b8c2cf9ba2ce67ea6464192e2c18528f89b9"
+SRC_URI[md5sum] = "96d275e31387e6c403d6c16465d15b7e"
+SRC_URI[sha256sum] = "bb6ef5d2f16b85288d823578abc453d9a80514c42e5a2ea2c4e3c60dc42335c3"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.14(\.\d+)+).tar.gz"
 
-- 
2.25.1

