Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.52])
 by mx.groups.io with SMTP id smtpd.web12.5109.1612509801020742053
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 23:23:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=F9UWStVK;
 spf=pass (domain: windriver.com, ip: 40.107.100.52, mailfrom: hongxu.jia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJt14l2QRskdd1n5eFeQt61JoR/kAJLiEXwXfaHGFhxpz3ps7Wfgb04i+AjhjuWb2BSJIq39HYexQ1lpNmDrTKV6VxZAbqAp+hdpZKISdW5T4jYv1ejFggFVKygrBvn/SKOruBkVn8EWqmLtOCHcpgOV5zVtsRxrzFb38cmIySEut5lxN6ugdOzKyL00w2kBviC78SKhwCSTs++EtPOdB1eIdLRMAN1qOSajCfMk+vTsSrBLs7+KveS3HAreaawNrFqGTgQXoSv9PbmzmQWHtFW4+WxsmJNgSEQNcA1BPHiy4stCc1vfjpqidJcipWwswooiU4rfS3Xmf5ju9KjjHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+wt+4JoPpurGFXnyK9FQJlBUEXeiVUkksuhMBOSlow=;
 b=gSpdhMqAI28kKTUIdJWwmXrp3xz/DL0j4tvBcXbQP3cvpWag1ofplflW1DUKcdp6l/xYufd0+mihUkPWFFQ6Bu160wtEDhzOcT0GfrTABerziIn3OOAJDpH6kIgxreBDVy0f3ZDdK93RjTYCBH2QS3zhFhZKzWoflrUB5BREapJdcGo54ldBMK/UN75pGvzUYJvxIed6fh68Q6mff5b1771meMCnwk7q/Fptouh7lKJhy/z3QunEmw9K6+lOfquF513kuR4zoCWieO+TY6QDEq4cAo3pL2ejdgPA6GliWlIW3X7XcErRopKgSQsd2T8XWPmsQbO1oFEXInXj/bdRoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+wt+4JoPpurGFXnyK9FQJlBUEXeiVUkksuhMBOSlow=;
 b=F9UWStVKt+WfvOOmP3Pc2GGBHYN4Gm3J2Mk7h+xpcdn6FeUfEdtI5eM47XaYva9g0SYxSDpQ3CykUqUlmOyvPS9IRDXPzfzXy2IVbFr6nS/sd1juzgMyBdT+s+X6XQw79997FKC48ya7FU6Ti97AnXNi7ghovXbhsgD9maNMSrw=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB4380.namprd11.prod.outlook.com (52.132.248.84) by
 DM5PR11MB1948.namprd11.prod.outlook.com (10.175.91.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16; Fri, 5 Feb 2021 07:23:19 +0000
Received: from DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a500:2ae3:a6c4:bc13]) by DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a500:2ae3:a6c4:bc13%4]) with mapi id 15.20.3825.020; Fri, 5 Feb 2021
 07:23:19 +0000
From: "hongxu" <hongxu.jia@windriver.com>
To: raj.khem@gmail.com
CC: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-pykwalify: correct runtime depends
Date: Fri,  5 Feb 2021 15:23:05 +0800
Message-ID: <20210205072305.6252-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR03CA0059.apcprd03.prod.outlook.com
 (2603:1096:202:17::29) To DM6PR11MB4380.namprd11.prod.outlook.com
 (2603:10b6:5:14e::20)
Return-Path: hongxu.jia@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp1.wrs.com (60.247.85.82) by HK2PR03CA0059.apcprd03.prod.outlook.com (2603:1096:202:17::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.11 via Frontend Transport; Fri, 5 Feb 2021 07:23:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01ac7513-0cbb-40ff-9f6c-08d8c9a6e98a
X-MS-TrafficTypeDiagnostic: DM5PR11MB1948:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB1948AA91AFC943915C650C8E94B29@DM5PR11MB1948.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cLCecFlphrZsyOx75OGewwOxYwS27xP3eWLlLT5gb2lpJL1zfOYefzLjNWgV/gt4+IqZjJ8ddn2FS656A4W2jQyZqk3iWDpGUcHBxAmNWsdtbSBh6YQWhtcplEGCfS29rySyBNZnmf7YS6udfChRciWsCGh9FfaUGdC1AUvcFiqvw1sXlHa2FRqRvJf5clmfpwczvMopAdij5nNPVfy7y/ptYFBYGra4A1tfCNW086PXPpnpkMJTrOx0QCDJOdXt49Vy++kHNefnGNcbIc77ocGLVJ6U5ZrF72cW1QHi96bENOAUKmZYU+uT5+yZAJW8N9iE2QVopuqeSl5cJwogcxVxA1CxVdcjcBPc//L8rDVSx9/xg3i9pMuI6dvLh6EkHaJokU9DaN8JJyNoVUOCRffGkfRiIeUsrZbO5QDuTMeAu2SwdoEfQlyVg5HsTeDxDFoFe8rrfdzCdjRhg/v76Fz3XcNEiwq8wa2ipaIUdDBnyNVIGvpm3+B5rpRYdybVal0Yabh8KtO5JQhR3I8UmQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4380.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(396003)(39850400004)(346002)(66946007)(66556008)(83380400001)(66476007)(1076003)(36756003)(478600001)(8936002)(44832011)(16526019)(6486002)(186003)(2906002)(316002)(6666004)(6506007)(86362001)(6916009)(2616005)(26005)(8676002)(5660300002)(956004)(4744005)(52116002)(6512007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?4AsWR0EtGSXtBQojChK7w2RHRKS7Y5KXJh8aoBmKghLnbSh+StA+VehSGV9j?=
 =?us-ascii?Q?BpWp4K1Qc/WUA9nUeG0ZqG77ZC6IxF8PDsbAWYpT5EQ8eKbQFYu64X6c8ZT/?=
 =?us-ascii?Q?hzTuPcSsesbk7o5xsGvOKFPK3TnUnCuwwLgOl4zhYOJ7oqH42bMEDwrtMgzV?=
 =?us-ascii?Q?/9QXK8mVIl9ABf1AfuBt6znNADlKmFqrp/ttaqcxl41hrHZp4sJSBpliiQRY?=
 =?us-ascii?Q?0GuaOyiSRz4IJUVtWhGYfbmPrU6Zmwlm4r57gEnptqWcqpqyAGe88B0PnQgw?=
 =?us-ascii?Q?0O2Tsha2XjcAiScTYte+F/3SezFwgoqlZN5rq5PPB/dI22+LjhC+1qP/FERG?=
 =?us-ascii?Q?ITW9QcXGuom1XHqY0u0f6JE5g2V8QD7toqLPF8r9eQ4LQMlxubl4g4HYIHIc?=
 =?us-ascii?Q?3V6GfpHjMXvtBXrPPoX6ygHtnBjMonK1DULDnC6xrvyIRvwukvynJk2DPIIz?=
 =?us-ascii?Q?ee9X9ATimH24WUQrF0MYHtZa4gOm6j52UXTx2Gf0rhZJPoCkOB9SqQzZAIvN?=
 =?us-ascii?Q?tLpyaeHth/WouMBUFh7Hi8TB6SLR4Zzk9CO3FM2tqxc6mfJiWZKRIzDjWcgs?=
 =?us-ascii?Q?XSaC20lRjNCmIBGO5ZCnBEQeVvkr3rZpTtzm6yes2/aQAPdELPTjd8h30LRd?=
 =?us-ascii?Q?5DL+67wqrMLgAgXK4INHQd1IJUaT3YuxrAt+Jqr8bZeY8UAA7EfjvzwLaFyY?=
 =?us-ascii?Q?PqC7zOk+0rOEtzkzHVSB6s5bXS+WwXp4K5iuMaZ1nM95czv86+OT1XGz4+i5?=
 =?us-ascii?Q?dvAnHaCGPn4OLA3e4ZNArLIyYjWi7Mt4PlGKUlxwFzmi3yNJqJ7pto1esIDL?=
 =?us-ascii?Q?RlFXxxujwS/f7n2wYcnsWmOMaPSeFlSLG5g61cNK8z99TFmOt6qpzemd87Xh?=
 =?us-ascii?Q?H+dhiQTbef9S8SGW3HydHS5dYcuNdrCSqrjCZVddnRNqBYJe7qKCRNjIPCAI?=
 =?us-ascii?Q?waJ5GWG9Vsu3I7XqFae9q7KRKJ8iBmVnGB+kqHRYX7jcqkZegcG6fL65ypD4?=
 =?us-ascii?Q?stzqxj4LO2ZHMiaJodbQB8ZnkZgVIcO+MYjBIlAIxGTOJqDivpY7BCZUAN9U?=
 =?us-ascii?Q?a495j8x2TUP8CgstT9wnaeCEMN+gCJeqCenDb8uCxn7k0IZd8bkWFncdIYLR?=
 =?us-ascii?Q?e1og99ZzoVC352jRIzcKGS+1nGQOh3m9puOaoGxLTLaGcKAOoIAeyK1yK2Rt?=
 =?us-ascii?Q?6pkniK6XNz8q/HwwR0vupwweMHE62L5EN0BE1DG8l8QxsTViQ51eBZuVuLeu?=
 =?us-ascii?Q?BxVCzvDGiu/8mX6bn+6eL1K99mePMXxjfqVxfVv9m6bgN96iXK74rxgP/zDd?=
 =?us-ascii?Q?Lb8mf3bW0rN/HcO2hnP4WNip?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01ac7513-0cbb-40ff-9f6c-08d8c9a6e98a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4380.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 07:23:19.6113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8iG9tl4EmplM6y9+TenLJcBe+X2y1QelP/k1rUbdI63oD1G+r+GC8D+gjMr6yx+uyykf+Mco3EM36AVFhsXRwGSjp7WHsqXm5yT3GnAhkn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1948
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Since upgrade pykwalify from 1.7.0 -> 1.8.0, the ruamel.yaml is now
the default and preffered yaml parser, correct runtime depends

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb=
 b/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb
index aa14cdd4b..4d4d2b79c 100644
--- a/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb
@@ -13,7 +13,7 @@ inherit setuptools3 pypi
 RDEPENDS_${PN} =3D "\
     ${PYTHON_PN}-docopt \
     ${PYTHON_PN}-dateutil \
-    ${PYTHON_PN}-pyyaml \
+    ${PYTHON_PN}-ruamel-yaml \
 "
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.27.0

