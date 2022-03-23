Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2FA9C433FE
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 16:17:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.166.1648052227288442540
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 09:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=rZxt6l78;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=00811796c1=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22NCuivm019356
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 16:17:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=7MdMzuahKzYxqqJxanAM6+Z/5J+QUV3KC2ihXSKyjBU=;
 b=rZxt6l78ioHqHtDAuyY2wEHP9SHlni9nuMk9llv7cRDjmJjeuxYHbNGgMaaamlKB4cuz
 +mGbOz1Iie/YLd4wh6se3/pXcOreOhzDDi6K+YMsGQJHx8IGhRnDieQFN81lNun0jCn4
 E6wVlc1o3AXDGEb/cNEr8ZuNXwncd90M5Ll2cJRnutg+k97gVcwWEDHJYvJckY/nWZ5y
 c/RLeqy+XwAwItoqqnbETbU6g+qXsAuX4ZjAzI9t66A7kl+aQrKdY3txikn/BROpY78D
 mP2cvcUXPeGyxTuo7Fz+/E6iDeXtECSvECUyFyj36+zMHo6uHUDfGGWG5vd0aIJfkSEI AA==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ew657bkm0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 16:17:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQemgkdVuGuVBkKFBpgHdaifUsTRDNDooFAPhOUuaBKZ+ZWkzu2+FqIF1/wi6v77CHWXHT1ruNOMxwFMx1lEa16nnI73T2+EKb5BAp6kmGsWqNp3J4gcrlNMn5JKc0FY85oOjggL5zwlgQdOBqFbX21tpuSdZ3kjYD+cFCVs2KnJ0f+NGRk98aDz7JS2SrxsMY2wESuODQ6irpPJNeNvQc/7MX2o4liTvQyxYt4w9QGF5Fn3OGe8KAYFi1nyC01mtB+R+WaJ4QpLc5dWbdSlfPaFBgb8LY5dkMcFN0bxFpCXlKrOh8uTWV3U2qHSEC3OBSKYfpuYYf/DdIHudcwFGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7MdMzuahKzYxqqJxanAM6+Z/5J+QUV3KC2ihXSKyjBU=;
 b=fJ40D+6IruIWrD/DO+Q9Qd4G4E9xJEqrjFoRuOkl57Y4053xGEUK+j8+yAlzQsBPBWSGlHIOH0zXZ5UKOWdUtZSl+bSGNyFxjv/UA5q79wgeU8zZsgUmt51odVJJ20VhCKc8NUM73HZ8FRiom3JaS8Cg0CifBSltUhuI+fxk30bwUfXYCc1uRD8GVkoDIpvODchtZjaTkAVXbpXYr/in7BrUxPWlpFQfvac4+LVdcMFKA5ud4pAG5LwdXA6NI6tvGZbs6T7gsdX1zTCvunu0UzzTtBCYw2eOyufLRyarTJh0par4reiIvAZV/oIPZj+KuyrajMN5aYXNKZqxYef5hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by DM6PR11MB4514.namprd11.prod.outlook.com (2603:10b6:5:2a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Wed, 23 Mar
 2022 16:17:04 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::c1c7:209:c28f:67dc]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::c1c7:209:c28f:67dc%3]) with mapi id 15.20.5081.023; Wed, 23 Mar 2022
 16:17:04 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][honister][PATCH 2/2] python3-django: upgrade 3.2.10 ->
 3.2.12
Date: Wed, 23 Mar 2022 12:16:46 -0400
Message-Id: <20220323161646.37413-2-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220323161646.37413-1-trevor.gamblin@windriver.com>
References: <20220323161646.37413-1-trevor.gamblin@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0208.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::31) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 990cf5d2-ee07-499e-fec3-08da0ce89106
X-MS-TrafficTypeDiagnostic: DM6PR11MB4514:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB45144895448BF6BC9E0065119F189@DM6PR11MB4514.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CncBjuMX27UxMamIVFt+GfmnQxyNFOMuSrGDbqVV9s4uYijC2xAEZzMX0unyQnBIKY48bmcLrQA6QgnUc6HQsuMSm3cp1/xYv5gcEoatk0LzEq1I1WjgmUQXvSk0ZyH4a8JPSZmqHu5fwtiPe5dSk6Fii2Lt9kRnkVBOS56O0Bf25ELX/9GOMICXrA8/2iMxIawX14o9RkTjEUQlz4ZKDkFpg7lQjPP5dekE5K54E+5a83N3g1PXKWWgAjY5Uexhe/Beb1J3fzg4qev42OkPcWDH1WMz+ztlcxUAFBu8hMb8MvcLIF8i/dkREzXmWLGzesLeV++x5TTupM+k7P9OsWCsSRPK5xaa/9XKGQ1f4peoGX6AoWZl8up69yIlhIETLKKntLIlGMr/Hm3g4cqwDpsVV4bg5PMSHF6Mm9xuKTjfHFFfbiRgNDB0ANllnlTO12vhSgkvLRu3a8w/cZQwxTNQhvhw+Y175jH883Bs6DLliT3l/L4XGV1XmuVKiBRdftrOnJwo56umB4RvzlJV+CPxPhBVVjDxOeHa/rtBcVSFcYvkDgYWwfTopApJazUn0EIssEkPjA/uaQ3oFn7umBa0/FeVuHLWwmO1FveG4GVvqGAIJVlgYRRVCBVaryj5aBe6lixqWvE3QPbkzViqA7iisnzSSx4n1+6ydgh2qjLhEPqzT3J8iIaIdUYD/VaIH2tWgjnc5SikLDIZGal2+Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(52116002)(36756003)(6512007)(6506007)(2616005)(186003)(26005)(5660300002)(44832011)(1076003)(83380400001)(2906002)(66946007)(66476007)(66556008)(38100700002)(38350700002)(8676002)(316002)(6666004)(86362001)(6486002)(508600001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wDwBj5ZCC2u17Jt01P5YTWDI7z9F2RsrMVitF3T4oA8QeJsHq9i0zy2R1+to?=
 =?us-ascii?Q?XpVrNSeeZnE3eOrgbc5dmOyfHQAiLjFA6Mo+S/TC5u5Z+yGhPmwiCENpFOZj?=
 =?us-ascii?Q?iviV4wD/bMCo4da9E6d/obSaYICVF/DniG/nCWdj8hhoCifeVHg4HNdhFU3q?=
 =?us-ascii?Q?fWhaLboXMdMoHQB6IBniPROZjTXff92X9IbXHmJGjG9E5MqEEdrKVh+vxxhF?=
 =?us-ascii?Q?Yejo9ShCFu6IE4nVia9ZDqia69ei0bX1r0BW2CKXmzgtJssSXcBxghE4wfNU?=
 =?us-ascii?Q?eeMKdmCWF+/dDaeK8x5XzaJ5V9ubg2Gd3t+foemQSnJDZIx0RDDRFdoKCQw/?=
 =?us-ascii?Q?cY4iVDycIXKMzMeuJ4ff/m0V6ISCfZnHy9bGP8r0Pzd9mVVBycQV8Hty6+u0?=
 =?us-ascii?Q?S2dhtLoTSbs6NdPiIpBWrg+Q3pX9vblwe1HmIN+PzkzAdas7kTdHEUHORVPl?=
 =?us-ascii?Q?p2tBw0Bo5bsaac0SJSTnqhloWGFZTXKucRZGmdSnewZhynqdE2fznE6U0xXz?=
 =?us-ascii?Q?r3Arg/aQIyj+NdMbMaVF6U6+ZTkEmACoTanS8heR8PV3XBDyfKLRcmjSgXuZ?=
 =?us-ascii?Q?4EJPAtICSrbFVPT7WUS7W1mlnClgwfBo9BsuoU/mX37Dm/8ezT0pVWe+w23f?=
 =?us-ascii?Q?w7N3cPxfBCSc98jV3bs4xA6gxMkdk9WeVwLHQBHZ3Jpr+qmKGe9gGlVijnI+?=
 =?us-ascii?Q?wdkEV81ENyIXwVwTN1SxFMVGE74E7vy1u+9nPowoEKWDV7qFR5l52lk0W3S3?=
 =?us-ascii?Q?a9ESr5uDRZEQcTIP0LaJF95ZF3nf4fXm20Goc/O+7N1eLU0PH3EnSmIXDlmj?=
 =?us-ascii?Q?gAyltGTPHU4XMH2IMHqRmYUhqdi/3s/5q9Z0O6pNxAjS/uoKK79N6aFkt2u0?=
 =?us-ascii?Q?UafTqyYsJkchUVzSst3WdPN0prJEJPsdNVZv2P6h612HGrlZxp9g3Dq7WhT6?=
 =?us-ascii?Q?Qm2n14xR+PfgPtGcfUn6QPXc578NA908BoPCyH1UvUBsgcxIcGOKQMOkmUKU?=
 =?us-ascii?Q?gXoOVxK1PkP35zQhH9XkDwYKzHPGRgwm04rb99dBaflhP1YFWSQwVkzUG/9G?=
 =?us-ascii?Q?h8aVi9L6SyI1Z3iCxcvbeW04CMvB9Ywv4oREPN4Tj9sS0rI3Ol60fhOor6mx?=
 =?us-ascii?Q?Lt3V/vXl1q9vljUQ6l6IAhFxTRITWeDRx376btJl4hp/LByMvSSgN1bff9B+?=
 =?us-ascii?Q?VJ7Kh5VHno3XJopInYWY7ZioQXp7UtP3FAd4nshXDUlxmD3xfTxoCRmF+7QE?=
 =?us-ascii?Q?Iv9t/inCa3f+FtDWqFQKQL6E83g6NveKBYk8/p9I5NFb8FGULaGAMh6EZy4i?=
 =?us-ascii?Q?sBMJrjuGW7mpebaoS0KhaETC6E/vqEEYu5wWSdpSIGC/ZvbgFnZ0vxh2crJ/?=
 =?us-ascii?Q?B2lMX81hugtmeEjJn4gsroegrHmE4T+bkx1TA7+vtiOECUAop28UyInY2n0U?=
 =?us-ascii?Q?OuyaBxNXyLqkqQT3SPwpBysSIND7Cp+8JWIZM+3PdmQ60iZa+nAMAQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 990cf5d2-ee07-499e-fec3-08da0ce89106
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 16:17:03.5196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Lj9SRlR82TG2x6IzlWNISrEiQN3TBx1cs+c8NbfkrDHeDc0G8eqXOvZPO9RD7UHAvAGY6x0hxUcaa9wpG678aiQJzuIEGc1mbDI4hvbEM7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4514
X-Proofpoint-GUID: svte37iKBc76lAjaIOgQuO6t5C7dR679
X-Proofpoint-ORIG-GUID: svte37iKBc76lAjaIOgQuO6t5C7dR679
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-23_07,2022-03-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=976
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203230086
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Mar 2022 16:17:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96160

The delta between 3.2.10 and 3.2.12 contains numerous CVE and other
bugfixes. git log --online 3.2.10..3.2.12 shows:

fdf209eab8 (tag: 3.2.12) [3.2.x] Bumped version for 3.2.12 release.
d16133568e [3.2.x] Fixed CVE-2022-23833 -- Fixed DoS possiblity in file uploads.
1a1e8278c4 [3.2.x] Fixed CVE-2022-22818 -- Fixed possible XSS via {% debug %} template tag.
a7e89fe776 [3.2.x] Added stub release notes for 3.2.12 and 2.2.27.
027f4c4ceb [3.2.x] Added CVE-2021-45115, CVE-2021-45116, and CVE-2021-45452 to security archive.
0a9a46a1d7 [3.2.x] Post-release version bump.
6e499a28ac (tag: 3.2.11) [3.2.x] Bumped version for 3.2.11 release.
8d2f7cff76 [3.2.x] Fixed CVE-2021-45452 -- Fixed potential path traversal in storage subsystem.
c7fe895bca [3.2.x] Fixed CVE-2021-45116 -- Fixed potential information disclosure in dictsort template filter.
a8b32fe13b [3.2.x] Fixed CVE-2021-45115 -- Prevented DoS vector in UserAttributeSimilarityValidator.
b0aa0709a5 [3.2.x] Added stub release notes for 3.2.11, and 2.2.26 releases.
ae242235db [3.2.x] Refs #33365, Refs #30530 -- Doc'd re_path() behavior change in Django 2.2.25, 3.1.14, and 3.2.10.
ecd2793897 [3.2.x] Added CVE-2021-44420 to security archive.
1cea03ab00 [3.2.x] Post-release version bump.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../{python3-django_3.2.10.bb => python3-django_3.2.12.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_3.2.10.bb => python3-django_3.2.12.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.10.bb b/meta-python/recipes-devtools/python/python3-django_3.2.12.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-django_3.2.10.bb
rename to meta-python/recipes-devtools/python/python3-django_3.2.12.bb
index 0c5fbb8c8..adbc498bd 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.2.10.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.2.12.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "074e8818b4b40acdc2369e67dcd6555d558329785408dcd25340ee98f1f1d5c4"
+SRC_URI[sha256sum] = "9772e6935703e59e993960832d66a614cf0233a1c5123bc6224ecc6ad69e41e2"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.33.0


