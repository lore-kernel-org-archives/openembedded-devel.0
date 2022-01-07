Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D1FCC433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 18:52:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.11054.1641581553827281465
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jan 2022 10:52:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=qetQS0fD;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=80067cba28=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 207IZ6wr027774
	for <openembedded-devel@lists.openembedded.org>; Fri, 7 Jan 2022 18:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=EqnfDRbWJu3C2aj03+6AQq544MNNt4he/Oa8r9wx2q0=;
 b=qetQS0fDHzara2xJtWbaZtpH8bmj4LnpCwsJqNNCgn6i6gcFQRdByIDeBFY/xRp5Qy99
 ICInmj+EhGLdhFdLxBA3GzW6ww23ZyYfl1iKtob2z+SPoaqq6sCIEoaxCK1A2eBaer9y
 qvy7W0decZ6ABQtyP4bwlRJ+8fQNGDaiKd4loRlrxZvCaxWrcNoy5fCwpz5eYgyyccHO
 NCoCBLBNO731XMRSok0IKD0z80IA40pJaYRU/RBS1ehzxH5fKYN8/wJzXxKn0F2ypRXD
 zMp0O4NQjv+8d6m8T44JPrEHxBBJVcuKDLVj3o2PM3B1IcLsv8JHSJ/O3LMC9rwdyJnr Sw==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3de4w88tf8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jan 2022 18:52:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EqP6nQox/HmW7udr4dDdcBFSVFfXyyUmk1exUG6L9oF8NXSYbaHko1PIqvErSfmFS5X5UJj9SamBYNXUpcEYR2QOUuUXljCr/DWBCBBJ5cDkprIIgF0S/gKBVF//VxN39Kws3RRZYeJZIwWVx9c9Xub8Gw5W+VoPXu4LlJ1upqGZcrgs3oO7DG6rZBx2nhuWjy2Zb/Z1iWwPcEF0ou5/1ewjjMyogjEr+EwFx/PdWH0IPKEhO/PapyP1PGg6s6tCbCgvoFd7SWvgeUIGx885AkEEXTiZHlVB1i8jmPSslt1a96kkCE7HQxLH6nDdmusdyRl37JW2ZGijDeDFErh4Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EqnfDRbWJu3C2aj03+6AQq544MNNt4he/Oa8r9wx2q0=;
 b=NO6h4fdB1ndXU1TJWhh+/6+DyE0dhHZAH8Jscfhd67pEYLxgQHAsxeBOiJBAZA6k2y3LW3biRglsMfLRr4XLAeoL0ijQNltATp2oCHXE2rlmtHAahCrV2sqlwWKUpuuKNCLANA8WyeWzxGWyLAFOzZ0+LdHDAf3xkFxJgeAz2mwcD1hOzGnLThEKTPCevABZGjwf6xW1TBZ9GOu5hgqgCEKaGwe3U9met25v1vnrhA0lMnzRpIJu3KjZ7qnJiNNpBk/h6zvafhSycRlSU91ZP4oaLxa5wy0ehePw+gGRVsDIO1LFVsGJ64j2BQEQbfrCLuH0+on/lypRwoIilUdWeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3029.namprd11.prod.outlook.com (2603:10b6:a03:8e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Fri, 7 Jan
 2022 18:52:29 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::2c56:bbbb:8def:1f37]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::2c56:bbbb:8def:1f37%5]) with mapi id 15.20.4867.011; Fri, 7 Jan 2022
 18:52:29 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/3] python3-django: upgrade 2.2.25 -> 2.2.26
Date: Fri,  7 Jan 2022 13:52:14 -0500
Message-Id: <20220107185216.3375-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YTOPR0101CA0065.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::42) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7564a227-a3c5-48f3-d0fe-08d9d20edb02
X-MS-TrafficTypeDiagnostic: BYAPR11MB3029:EE_
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB30292BD9636939F8B944D9669F4D9@BYAPR11MB3029.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WW0fBzzw+lxOhWeLLrsWMNr9W5Y4SroLTUk/j5s8HsiNhCsEPuPrpr1r1ay2I5h2YnLFyBQTLpGmn25zkJa4O0yc/B475xMSKNtCq8JtuodDDdZBiNPP23lXc1Fwzgl7vw69y3n5PTmII0e+peMLcHOB75PZrWfHiNF5Wq228H8cl1San/iJ+Nucc/DmzTHEN+OrJife0svah0tOQdLUuTyaFcF/YlmnIGj1Hq57mSiaX9FFQ1EAe0MABtzXaxgzU8ZeEwgTfZGpQ+ZEyac3ceZxGxrImcWfVLlV5/EvXsphL6ArWZ4mGSmkmqnsTs4NP5DS2cQrssnH4b9Pu9/1MVaBZzWO9pMQryyVP0rezAr+eWuYgg0ec1OYzZTB0Ao+sf4ZA0JcwEQMb+cK++9as0ynVcdY5A+V1HrBQy+xj9l+c5vNrmeA1CWw11c56/EfArqBBvJX6IEieu4yX4DLrceMnzJg1MN65tPvteVt8+eO91ZgyfVzMyfG/F3tiJArM12vVL1XM/g+py5J+tzIHxppk+aIooAO78zMKHwxQDoYt/O7Ykbp/58TCK380TMZ0DKF1jlZ929wNOtn1Cbur09O5IhunO3rIgOLKgFM3F1AVSNBCmc1QMM8OYPnZEJahBA/BCARSvq9fVtyRRTeVEvBmgQMI57KdOVzdyrveP6I7enCbcqptU9sPx9KLXB5nKXTD2bZXeE4zEKyOg6bclTNOr6u26JlQpR+Vh7GQrfiAUw1hn/kNFc7hgBILMMwTARABppTURwNFIkvILpkizFFTWX7Hre2+SkVpw3EOSI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(5660300002)(26005)(83380400001)(316002)(186003)(44832011)(38100700002)(66476007)(66556008)(2616005)(86362001)(8676002)(38350700002)(6506007)(6486002)(52116002)(508600001)(6512007)(1076003)(966005)(2906002)(6666004)(36756003)(6916009)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hVlAIZk6RwKLt+qN+sIWp3m6vp9naM2xLykgGFA5lT7st4xaQ6n1zvY4kTxm?=
 =?us-ascii?Q?3IfE1c0JPVikSrsd5yyTeN5IhkROdHksjGBlJV45eInze/aPPayCO0/mNSIs?=
 =?us-ascii?Q?5Yi+nTbIh3Hbn+qkfpvy977DUNx+i+PDwUEIOWdeScIhGQcRu+gtvhqKczBL?=
 =?us-ascii?Q?VQTzj9RdDJ0g/h/RAmEHM+3kjQaqKnz/YwHBvQNnYFfK3PMFacuoGpFyiXaY?=
 =?us-ascii?Q?ITzLykULbsIFx+nuFq0AOUbFBLHlnE8uCEqsEj7EGy+cDxazu4EYYkH02/IH?=
 =?us-ascii?Q?Q1ubdDMMUj0C2+9lUeBYt/I7Mr/VvJMQRCWsAKeZ0tiF061TFpdDAjoB0W6M?=
 =?us-ascii?Q?ftrF7Lh2SqSzQMn5Fpj47sPsKMLS4Fz1M2JVkEAXMuTFzcQUju4AtTBxN71u?=
 =?us-ascii?Q?tbhb+/XFNTnbm0VLKFlweEpelSBz9mKOqn+jF1Rmadtu1+Bv8ORv/IuAtTgt?=
 =?us-ascii?Q?3a9IZ9dkJIgEhcvs+QW23WyPISAF9RJ+fqx4mY/lF0KI0J8+cazQQozeB4VJ?=
 =?us-ascii?Q?WJCIXo6N1Ps7hxNrtCTc4BU4I0mqWA+MPTMDZgpjtwRmZkd3UoLdB25h2rVW?=
 =?us-ascii?Q?TOJ9H5MqBXjaml+ZXG3aqYul0tL2ecCcrWSPfvcECjIOIv+yCGLw27XqCgC3?=
 =?us-ascii?Q?NZeO22+weewUMnsw0+Ft6kyFs18Mn5fb/QMh+VwOWf4e+8rWnUU0OO9capoV?=
 =?us-ascii?Q?3R+HjlFY9AyonVVeRn8gS6Fk5O5DbBxHyLFIIg/lpZc0+cd7DrJMWZwE7kQK?=
 =?us-ascii?Q?I3BeMpdE2pXxX/s+z94fgW722IYCh73BjtORl2bUle0PXwG2sOxyRFo2pq+M?=
 =?us-ascii?Q?ef4tqobfjyV1kYHmLwtbi53Ln25lx/BKYNd4/4sRWlE/fl2ncRvgae9EGRjt?=
 =?us-ascii?Q?7Z//nksqMC0CZsyMYkrRL3EvxlGlh/p/bthqEJD4NTAtDje4tiDWXYjW5HJW?=
 =?us-ascii?Q?uWk6WaX3frYeHEwuopJCY8M/i8YU8q6Q51A1D1rPvBDeO+dg/aEVl5posfPq?=
 =?us-ascii?Q?nuZnNqzLGtKtsshZ8aEP9N7Sb+a6xwCeHBcCUYhH4ONBJf6/06YzH3pGdr31?=
 =?us-ascii?Q?Y8W4pnBfoHSLZhiyeQFk6qCgCRDKqoGawf03AimNXgBsGO4D/Nq1iZdhKP+w?=
 =?us-ascii?Q?i4DFCegaiyp05EJYAX0nGk9FzUd/3tdemaZUjOdjLEcKotfseS0OSOP7Quei?=
 =?us-ascii?Q?hhpL0wdcuFeDeIOOrI5ZKAedbYEd/d/4DNlIvNsEUkZlTWwi6ydwFU3XVoUU?=
 =?us-ascii?Q?6ixoR7eIKiWjNQywmBtp/m5GDd03EIH9kvKUvssE08Iq4wZCvtX6tGNUj7Uj?=
 =?us-ascii?Q?0EQx6ry7LRaUpktcDJRngdcawJfNeUDFXDxQzcHmSE3Om2I11U88JxwKArH8?=
 =?us-ascii?Q?LyWwtX4UsrR5Vu0+9q7aQVTWsZdppZs9ZOqDS9GUS6vSUI4B9tdP8EUUHr2l?=
 =?us-ascii?Q?RvtW1DC9VCzr5HyYyuFymtw11Yw61ZV9A7cVr14RAgx1oyXj0LcunE41IbLr?=
 =?us-ascii?Q?3DMp4DqgCD0GkRz4oEJFkuHa4ySa2R4rDD/UQzCJIeCkJH2zESQeWKjhx0nQ?=
 =?us-ascii?Q?coyVi+YOas2AtY9lvaiCg1p30aL+CnIH5TL1ULV24pd5hJVU/TDD0iv+/JSO?=
 =?us-ascii?Q?dofYoskL+bSL97nYPwd7sY0J3sK+spXniA7SawJwVO30Kcvp/Y301h9DC+zQ?=
 =?us-ascii?Q?ug3Ctg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7564a227-a3c5-48f3-d0fe-08d9d20edb02
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 18:52:29.7905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 rx5ZvzyRW3couaR2Et7oCRGc7PkXfVzJ+RcXeim7B3DEU+p4HS1pwyAjvRIuE1wbQTzUpZQh3MmyNH8qLzpAQwuNi/BTc6Nvu0XDDSlqtBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3029
X-Proofpoint-GUID: JCp9elMiyOSmVvm8tuuoYX-jnknOSP4h
X-Proofpoint-ORIG-GUID: JCp9elMiyOSmVvm8tuuoYX-jnknOSP4h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_08,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201070119
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jan 2022 18:52:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94700

2.2.26 provides fixes for three CVEs:

CVE-2021-45115
CVE-2021-45116
CVE-2021-45452

https://docs.djangoproject.com/en/4.0/releases/2.2.26/

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../{python3-django_2.2.25.bb => python3-django_2.2.26.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_2.2.25.bb => python3-django_2.2.26.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.25.bb b/meta-python/recipes-devtools/python/python3-django_2.2.26.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-django_2.2.25.bb
rename to meta-python/recipes-devtools/python/python3-django_2.2.26.bb
index 86d21fed0..523f0e091 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.25.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.26.bb
@@ -5,7 +5,7 @@ UPSTREAM_CHECK_REGEX = "/${PYPI_PACKAGE}/(?P<pver>(2\.2\.\d*)+)/"
 
 inherit setuptools3
 
-SRC_URI[sha256sum] = "b1e65eaf371347d4b13eb7e061b09786c973061de95390c327c85c1e2aa2349c"
+SRC_URI[sha256sum] = "dfa537267d52c6243a62b32855a744ca83c37c70600aacffbfd98bc5d6d8518f"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.33.0


