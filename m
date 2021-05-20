Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.238.1621531488926029334
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 May 2021 10:24:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=aqA5Bh7C;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0774a447fa=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14KHEPAg022186
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 May 2021 10:24:48 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com with ESMTP id 38nc1d8p1h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 May 2021 10:24:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jX9z7cFT0b5RfrLPJPavoWvOYHClaM9BFPour/DK8tyd2E1j567BWGD5OaJ6ZnSemquDw6lIKuRzNtP/n2OqMEjv8KJSwr0f1lWgOC0K2Oh1ilKr5YzG7YVhCzmficqkMVnItkLtMlQDawvZbZnQFpv5L+GPH5yJAOPDmfRDTT7V+OE8nTC6RaAYTIil5Z8/UGTSv6e+TMtaxW9FmNrJhyl0MZjQAgxcNAPmWIy44SZsZntmlXJ3Hyap1nyYXtFhCYcYW4pqnQ9rNuQ0BbAqNDC/7n3+05BTLDTe3H89QysAZlAbw5YmLdOfSNOKOq/kjeXqltwOKGmaQdeDwj0h4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SI9KUYdWSI7F0xDamdefThSAKFfLZASPMEBRxROnCik=;
 b=Q2wZhOkod/VDtc2dM+a3QHAXvImHxs1IvZ971QCrPGOVWikR2brCFFfBZaXhr89pOHKjBDP3g6s2eVHdoctETuRyrwrPmMdmcPhvl/pWrTHQ80OkvkMU9gUm52SgpmgEQiwO5odMgNmqWIhbzgp0sktrRWifODyAtEkFvWPXrlFCkBLo/kSM8cdkKnGlyo6wHmvs7uIZ18+TQVezmD50BWYNSGhFBoKVxSlwtCOAisFZPLmJ20tBs1tcPiI3F0n7O8KEhDJQDvyU7wKckiX56E7vESy56wIRd7KOt5TebtdMy3qx9j5Y6aCta9mVjeiwa2VEwb8dSl4KsIXvchpy8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SI9KUYdWSI7F0xDamdefThSAKFfLZASPMEBRxROnCik=;
 b=aqA5Bh7C4M9ar5UkWXKufofqv4GKl0nmnRRiDsMFg63wdVZZFPzz2L6v2dlCYP4dtucPnvQekdidXAEKlRfPeiYxzOHK7qo8p+MHsNHllH2GoiNIQucY8ukB6r39zS9BCffNdMtIJpsVWuXig3zNrN1gQ6VuI/ppoVRfBQfD9lw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3671.namprd11.prod.outlook.com (2603:10b6:a03:b3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Thu, 20 May
 2021 17:24:46 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76%5]) with mapi id 15.20.4129.031; Thu, 20 May 2021
 17:24:46 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH v2] python3-ujson: fix ptests
Date: Thu, 20 May 2021 13:24:39 -0400
Message-Id: <20210520172439.1065020-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: BY3PR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:a03:217::24) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-fedora2.wrs.com (128.224.252.2) by BY3PR04CA0019.namprd04.prod.outlook.com (2603:10b6:a03:217::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.33 via Frontend Transport; Thu, 20 May 2021 17:24:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d96d870-b923-4616-e291-08d91bb42a32
X-MS-TrafficTypeDiagnostic: BYAPR11MB3671:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB367130DBA7EA69A57045B5A99F2A9@BYAPR11MB3671.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WSUlPEW42QrAzmcbtslf1VVs5gR/6Rfvil9CTNWoTTjPTgJj3JjzHPzJXcK1G+SRKOG1rp3g0pEhATJvfOLuwQdXdFxUwshvxMf6l02H6xExeB9YpkZdk/VcfRFK/Y40/QwMupxA6NSFLChOIl+RTDWpNtwLZxp77Ebvq7BEd0qj7JCkDZxNPgTx6ziq7OpZciyb0BaJVUpD8VrGJMZLUU2wpzN8Ju3DhmMdaJ4RaIdrDWDRGXhdD3H6Ll2PanIKe9OytAaSn1dhn0U3R987uSjDUMWb61DxOLk6oppnNs58lxuMtVJViT0NYkuszdvV2icwonEn2zIUbl/ScZ9uY6QFgJsH9ThDE28KNFxVq0yaWZEtQY1D8M15aTA35e+emNGyqMeJ1bJh4Dp4Gs0yffjbM1mb5eozQmEdFFl3wjzllPBjQLu+9SxYqOqrf0weFZ/U10C9MdwtsdGxpPVBDRYIQQjkQhI02zyPeVM87rWy8n4w+Pex6NuanVZbo2+zLsyJnPw59zm9tX1l7ldBKhhuljk1z/ZfXNxRqSnQkvTgLOrq7szJOxK+2qJNYYPPhGigtWVxUTCWTYBXlE143oA2zt0KqNashBVu6cX3eSjuNeYBlD/j8sjYFeSjufB1A9mTXJOGnrDNn6eY6QmnMA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(136003)(396003)(376002)(346002)(478600001)(38350700002)(38100700002)(2906002)(6486002)(6916009)(83380400001)(8676002)(26005)(8936002)(6506007)(66556008)(6666004)(66476007)(2616005)(956004)(5660300002)(66946007)(52116002)(316002)(1076003)(6512007)(44832011)(86362001)(36756003)(186003)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?PwSFz3588YujKnoKMGJpD3dPQ4q28ZQzd9cNzcLnUBsza76hq17MhjkAddc+?=
 =?us-ascii?Q?dF7FDnTn/Oj973bAFs2Pjzl+RUdUcjFdzdUDE/v/BMXlCnkXu7Bt+JbNQXZf?=
 =?us-ascii?Q?F+0AoB0rSe00ZghHTacoZKhypu1pNHWcYOrfqXGF4W3FA+BG6cxTB+Q2wgms?=
 =?us-ascii?Q?UM5/tsWrMb39zQPLX9/9VjHdfghz/ktv+oJyv9avjA4mjKj22KqoW1u1yWwq?=
 =?us-ascii?Q?j7Gy14eMckOgGw7U1pX4ONeH8muWWgZaWOsM7l38Rq89EDQppFt8cuzhxHMC?=
 =?us-ascii?Q?dvQZboijAvNXnyjwQWMjlveXQj2LE+WtraiqiMjQfAoErHLXuuU0oflnRDmw?=
 =?us-ascii?Q?CI+JssxNNGPWmJIewJThbeOgDaBjf+H8Ey/GpXelBium3myC/9453VZPeURf?=
 =?us-ascii?Q?lSUMSQBrQUWld/1BjIR65l5hC/2stJPegyqW2vMtJ3gWOIWoU+Eqe9WrWXTw?=
 =?us-ascii?Q?mdbTH54COjoeAqZ0s+jUOelQouiub2fdu30+YmfoTRkxD2/ItsNALiYOP/lB?=
 =?us-ascii?Q?gNt02Pk1yWX/sPSd6yW1nbZo7IcnUSIieOmPrG2c5wY9liKk6ueNJdY6YAUl?=
 =?us-ascii?Q?IUsBw3M8TZYhpF+BVC+O0SzzOoxO3GVV2jc0gKC/aGaq4smbc5Dxr8eqsikK?=
 =?us-ascii?Q?CxjeLB46lXLiFgZcqFACVpf7ktbKewf2uQpWUR2hNm20b2VyhxSU6phWDSKQ?=
 =?us-ascii?Q?gSXcolKjX9SfAE1DlT74odEX5apJ2NZlvW0GrWotDgyAYUbhywb4vSq62qwY?=
 =?us-ascii?Q?BYkXSE+MNIWcjc9MtIMk8GGFZ6ArelegvGJZBI3VjxJS7uKsPzAUqBcoTKCO?=
 =?us-ascii?Q?/nQvVyAOr1X/iXPY2PIn5rHxBQfP6a4gdKff3NWr20lz16jqJL+UsuEvfUyb?=
 =?us-ascii?Q?84UPy4Mc8x6MdXa+8VVZWCq5BqJW7TsDnCPbBw96T/7GGTKWLzJwZubLypSW?=
 =?us-ascii?Q?x2tgE4kiOpIKseELEEHbOG5D8gAKqBqh6L3RBnUcMEB0D6F8zYRkO5U/rj7T?=
 =?us-ascii?Q?+VA6oy4vQl1+H6TmSmn8xzif6WcPBHJKZ2/hHgQ2MYeH+wp8vSu3c9Z45UE5?=
 =?us-ascii?Q?luOI87lbrAaq4hjP6YTTFEOk1oMvIf6tdfWk9Drdl4CDjIsA/+ckueIw6l6y?=
 =?us-ascii?Q?2NQfkWzt59AHzIthp4uOBy39FQ84Z8Slb6s9JcDJB3oPni2zeTHgGS9bc85i?=
 =?us-ascii?Q?LEJ6tiGeZZDHqGHj0Gnv/yjvNzERniIMwvp6+FOWCOqpHa+ce7Udx8dtklx7?=
 =?us-ascii?Q?0uAyqF8m9EGmzgUDcD3Tz0YfrtMw509EncKNhpEkgb6qVyZcVQteQJEpQ6vP?=
 =?us-ascii?Q?QBxOZ8oVepiaLa7pZqLqkqeT?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d96d870-b923-4616-e291-08d91bb42a32
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 17:24:46.7465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m8gmNLXe1BiRDQIwd12+MLXNuwKh8rOKYtPn1EoXE4nOSQimmJH1rU0eGIViKeIBwr0Jq0MLeGz/WODVpYs6Vg2i7LTjb8xTxyyffWbA3q8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3671
X-Proofpoint-ORIG-GUID: o2mW6qW3ABnLUO3KeBXi3GfKJkFqoh_8
X-Proofpoint-GUID: o2mW6qW3ABnLUO3KeBXi3GfKJkFqoh_8
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-20_04:2021-05-20,2021-05-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 mlxlogscore=911 mlxscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105200109
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

- Add python3-json and python3-pytest to ptest RDEPENDS
- Correct test file in run-ptest to be test_ujson.py instead of tests.py

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta-python/recipes-devtools/python/python3-ujson/run-ptest | 2 +-
 meta-python/recipes-devtools/python/python3-ujson_4.0.2.bb  | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-ujson/run-ptest b/meta-python/recipes-devtools/python/python3-ujson/run-ptest
index 1b3914647..b1539453a 100644
--- a/meta-python/recipes-devtools/python/python3-ujson/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-ujson/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-python3 tests/tests.py
+python3 tests/test_ujson.py
diff --git a/meta-python/recipes-devtools/python/python3-ujson_4.0.2.bb b/meta-python/recipes-devtools/python/python3-ujson_4.0.2.bb
index d79206fe6..43f286d16 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_4.0.2.bb
@@ -20,6 +20,8 @@ RDEPENDS_${PN} += "\
 "
 
 RDEPENDS_${PN}-ptest += " \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-pytest \
     ${PYTHON_PN}-pytz \
 "
 
-- 
2.31.1

