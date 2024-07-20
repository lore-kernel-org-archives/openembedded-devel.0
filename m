Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB23C3DA49
	for <webhook@archiver.kernel.org>; Sat, 20 Jul 2024 13:52:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6472.1721483533401536791
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Jul 2024 06:52:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7931d613be=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46KDo4Uj024556
	for <openembedded-devel@lists.openembedded.org>; Sat, 20 Jul 2024 06:52:13 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40g8h005nf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 20 Jul 2024 06:52:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S0wa4UvYv98wi2JH+16XYaC96o9r77EKOzTE8EnrVO87FKAH7ec4B5oNj4SQmzAB2UKRjaw1VBsOuOTauUIWvKanouQvM7hTdzpYkuOcz08PONV9yyraNzn6h/CVthpQy8nr4vI42TFc10CZHr3Z+y0nLluLMYjtn/KwyToYubTV8q/jjYqGuUJ4GRwkUyeI/6H6FNHyRCB/E/36q/QrQ9Goe64YlDUOFEUh93TPTTna82BDf5dIJfbLBUqPy4VQWdqT7fkGNU4CYbOklpwYe9fjunZyZAT/88jjH3ywjYRx8ba8HyqivLTfC+nPZT+BtbgVUx+ieF1x93I0/QNV6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTJYamXSe/w/Nd8htz2iJ+nNLAiQUBh6JjvJgi5WALY=;
 b=IUe+iL910zb3UNs1990Wj4UOtCDV88jQaNDntA+4yjGQc56Zk1rYeClGhvbZWxXmr+FMvD+DJIIHMGIJUwfNFQDOWFVOc3eYAHR1s4g+oMoxHIHkz5gvwkdbDTGQotEvSysmshTnJegRLh33DuV4umdR3xwwP4bTSY3E6pXFJkZPRetZ0Pw6Ljl9j+wRUkF2WJJYy49BCjMXHbvwsYTy0o6kdYQgWE3DtEvZKp20VtJRXuZSoxqfS/NYrB2u8E0BUYwDtZcLtX8JvCx9+h19CqY40l+96u+c179F9RtN0qnQjIfA/QJRpoEkcTfYtEA2Oks3q/Hpe22SQwn1yxNgsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA1PR11MB5780.namprd11.prod.outlook.com (2603:10b6:806:233::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.29; Sat, 20 Jul 2024 13:52:10 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.7784.016; Sat, 20 Jul 2024
 13:52:10 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] netplan: upgrade 1.0 -> 1.0.1
Date: Sat, 20 Jul 2024 21:51:58 +0800
Message-Id: <20240720135158.1749528-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::20)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA1PR11MB5780:EE_
X-MS-Office365-Filtering-Correlation-Id: 603676c7-18a5-4c52-e7f1-08dca8c326b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1w40dqBrWcbuZsKVDsDCShdsEWt2ZYBrdXRw43CyWBY4Sj9OYiqXi2qn2NoJ?=
 =?us-ascii?Q?IsOD33LbANpHT/PAX3yc5kNsfVp4SisZ4kCY/Ld1EHO29cYahQTCA/5g9VUn?=
 =?us-ascii?Q?qt6B5/3KJSF0gO/EbyLgA/fSSjKP9hQij9ImJttu7xtyPCRX1QekpbdTEoqk?=
 =?us-ascii?Q?QsBh6w9nHHBBwWoMMO69pL2WKiFYjHKREsCiJQQjeR44Zg57QyOioH09sGpE?=
 =?us-ascii?Q?I9JqRWaC/gnYLd41KM9Xk1joH2bn9LGDM0AZk+vt2ZRImnBJPaldGRL2dQHr?=
 =?us-ascii?Q?O6at2h7VRuynlH5JBbMSYyD1IpHjml6Fy1H8i1FP3FT5KMhdfyd+vXJWyGW3?=
 =?us-ascii?Q?yhAIjPwhD97oloeX1vxVOu3RCwX/moPhNGSZcY7EWN6ji+1ogShDWcJ4jxJ+?=
 =?us-ascii?Q?71f/jDX/lPpkoP2hKbpDfKgPvAWygZImsnGMGHE35K5AkDfugxRjQAOun8DL?=
 =?us-ascii?Q?8ycd6X8V46RLrCSaiJWfRizXqN3NvSHHWqggKBqDsv5Euv1a4aHvQpOHAF4q?=
 =?us-ascii?Q?l7fI1cyKRsMHT1TUjf5RJOj2QxlqdRBHEW27lib9IBgjUHP/ymyjJfCLzK9q?=
 =?us-ascii?Q?Rz51bB87S4bzP1oym4JZ1yaLaE7rNQ7GsJCipEwBS9NcS0ZXzQJQ3BNIJRPZ?=
 =?us-ascii?Q?6iaVslLe6El3WgjNOWgkXjZgHJlRc7MAJ93YLblU4CgTvMI4aPU/uQT2IcOo?=
 =?us-ascii?Q?URD1jA6v/jdS5YpM8Sxg4Mjb5Zd/hvHMV4eUQCPpeD7pcvTz47vkEXt6pupQ?=
 =?us-ascii?Q?6hDmOh5ZtfBAQSGmk4ziGS932pa0SZmIOZ7pftqIkep3CXtUav6oZ+7M7m9i?=
 =?us-ascii?Q?Rr6oFVs5ZbhQLMuKDQJVeFDM9pvrjC3IPOnsgzEXAjgs67eHJt/cxGSSVZbG?=
 =?us-ascii?Q?Xx4tNVp6XDLs4xSMmnH5EeKLOLSrHZyaIzN8neqY80LeAq+iXD5DnMIr2eIa?=
 =?us-ascii?Q?C+a11EcdrdwHdp4Ange+JZ9lT7odwlyxnPgRhJOA+Gu8BMBxwxccSev4yEKD?=
 =?us-ascii?Q?EfnAooz+/CmvruuX+60CUJDlAbB+hOCF8cB4a7F8S+BaW2VOiTUvGfChsHSG?=
 =?us-ascii?Q?KgLeblQhOU2vfQwg2TvzNu/Fjcg+M9+QHXCSU0fBosr/Lk7AlOXPrI3ucaW0?=
 =?us-ascii?Q?gtQoDfA2AlGP/T24BHP2xE0k6JakytHbA6ITW25+2NPe91ZZ7/NbRNUPah1q?=
 =?us-ascii?Q?SmsfYBrfidXRw781pMabBvyv9S2C4PsT2Pp/XVe+eTTyNRFs1HehvH5MSkMd?=
 =?us-ascii?Q?CSNKPdhb3Eo6Ej4DwpMlKWuleyjY/lCfRq5tDaz+kW+/aDj1L7JVlIQTj8YB?=
 =?us-ascii?Q?TE5c372iJ6yS/qtG4f7VJTpWTV0GpBrkkQjbX3IwPYNe0Qq4q1R3TAHyKQx1?=
 =?us-ascii?Q?YEMe/Tc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1naDHLquite7DFELMS87K3+NvOnQIxCJeuzD8Q4UDQ+yKKj//xNzwa0q8o0b?=
 =?us-ascii?Q?0qADD2Vp27ao0sp+nMGXFnOWC+8pTLDonAunUXpU8LzZ3nqj1qUSTlOLy91v?=
 =?us-ascii?Q?c2rVBm5f8/kTqTMAk91C2rNxJwoxFwjl96HkWdV/bqbIYjwKg3Jt9sn9kRpH?=
 =?us-ascii?Q?ti835+Irh7gVw3PZ/ZzUSrP2pj9FyGiQY3dzvVHCqJwsHH4qpc/jPGX9Y0C/?=
 =?us-ascii?Q?nSoc4UevQYgCDfZgpZBksLqAmMZ80oF/CBIJWCgtb0ENN36VCVXwynOCXRsR?=
 =?us-ascii?Q?YDyws6KbQwTByIMHFg9vTM7xPywUtWsjfIwPPGsJllGs+DrtFsUF1SUqUtht?=
 =?us-ascii?Q?vaK57VuyPvhN7gKK24G6q2jvGVqOMLPRM3mY7xVM9X3ER9dyg6je9rzF82P1?=
 =?us-ascii?Q?BxRFlPijF557Ear/9wk/umDi8N0L/C+YAkKlVtihYsZTy0hgWU6tJXZZMHXu?=
 =?us-ascii?Q?ufplmwjB40PITyu3VT0PnVFOMmZlCQAVnAe+kqPepDmuVyjlGjvexidH0k0M?=
 =?us-ascii?Q?nrSHEn9oJKSEdKuYTkOAU6dJgHHyUr7F8sJR2/uJjF6tSWPymeZ+x/cUV9Or?=
 =?us-ascii?Q?8V4vSFh9Jg6l2NaSq5u4pw7wuf5JaHqAJgvzWBa4nPs797jVmVgM6AARX9ic?=
 =?us-ascii?Q?BnW0fKoknd/8ltE5amFlqojQ0MEF7J+Jt/csC+35MQl6V3kMaXV/un3KlUTa?=
 =?us-ascii?Q?eRdNIAMp6OBwociygOn49ZAlrEJYR3rnsWyDGzaz+zQuzT9hwEM6cJY5QdxM?=
 =?us-ascii?Q?JEJh/5ghgSF6k7NFGjsCrPFoVzgrC5ofgNiX4bKlJO3r6UeUkZKIhild1D1w?=
 =?us-ascii?Q?+k2B5247bx9zEyrj4IoKQJo59W3d5tP9EmBLvLwFkBvxrBJ3PuyabE/d9GHv?=
 =?us-ascii?Q?uDWzNt2Xx7A3ILq4qGT16DhlyfCPf5NasIBQb5GrwtoVKOtwO5Shc1R+RLkw?=
 =?us-ascii?Q?1vtViITw4RbGCc4SorHH/fRNdDyGsAoUe4H+RBIpiYcH2cuJpmEwlyFDlZqV?=
 =?us-ascii?Q?P72TdpIc8TbW81iTDMlVb5s4uzkb8yhXegUcWjQnQWq64luCnAOiyC8aZgeS?=
 =?us-ascii?Q?antht+6a95WC/8DzbPt4HIXq2zM4TzLj2CfHmEEQpiJ3WG5vxJTkAbVFTdkD?=
 =?us-ascii?Q?uSzPCJNjEK8fF2vrhEoDYuVK0Njnu8AO7meNFiTRAovRse0PRtBrbZDhAaZW?=
 =?us-ascii?Q?rJALkjp5rqTe7MS9UP09qvIAj/b8LCo9APx/pnP7OnZ7CbGt6IJHbF3o3KWs?=
 =?us-ascii?Q?xc1TaI0Yfiriv68vlhXRqmzEjFh3iwSBgY/fBREk/siXfp02e49iby68RBST?=
 =?us-ascii?Q?0ZCsh1VKnVapGUkfvFSPz/CfW0j6BNKxwfhtJry1Z4QuDWMiFIC61cDFEaZS?=
 =?us-ascii?Q?okvi5zGFzd9lWevhrulYWz+MnuCz4edC9EOw0GVG50Swd+ghHggkXDNsjMy4?=
 =?us-ascii?Q?TYxklHAuP1fl3SHU526NcF0iE5gtj690TSS1KSBNeDFQdrdgt0ItI9WKNfC+?=
 =?us-ascii?Q?R1AA7BPpZRbfVQuZOeFjVse838Djc+ELZL1REWaDJveGSkaheSY0iflb2OMK?=
 =?us-ascii?Q?/9uRja1by52O0jIzlBNqcrOeSniMWY08FKyGNvlF?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 603676c7-18a5-4c52-e7f1-08dca8c326b9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2024 13:52:10.3041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 971mvfx7OWRhJtWsiyNusqBPZmoOQFculCR5Dy4KuX5pado90nDehpA8hEQWVLsBp17FHHvoM8/IHkYuQeLrnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5780
X-Proofpoint-ORIG-GUID: w3xItDf1kJ8wIuv2Na75dHdNCo0_LqY5
X-Proofpoint-GUID: w3xItDf1kJ8wIuv2Na75dHdNCo0_LqY5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-20_11,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2407200099
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 20 Jul 2024 13:52:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111421

ChangeLog:
https://github.com/canonical/netplan/releases/tag/1.0.1

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...01-meson.build-drop-unnecessary-build-dependencies.patch | 6 +++---
 .../netplan/{netplan_1.0.bb => netplan_1.0.1.bb}            | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/{netplan_1.0.bb => netplan_1.0.1.bb} (92%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-meson.build-drop-unnecessary-build-dependencies.patch b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-meson.build-drop-unnecessary-build-dependencies.patch
index 4f385e917..860451d97 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-meson.build-drop-unnecessary-build-dependencies.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-meson.build-drop-unnecessary-build-dependencies.patch
@@ -1,4 +1,4 @@
-From d3aa30f5cd7ba375e006a755752acbcfcd619452 Mon Sep 17 00:00:00 2001
+From 6a1a24eb0f30002a4b0049d6cf38d3f2bc3c0209 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Wed, 6 Mar 2024 19:27:15 +0800
 Subject: [PATCH] meson.build: drop unnecessary build dependencies
@@ -15,7 +15,7 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 6 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 9556836a..30f33fe2 100644
+index b29174de..09421d99 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -25,8 +25,8 @@ bash_completions_dir = completions.get_variable(pkgconfig: 'completionsdir', def
@@ -39,7 +39,7 @@ index 9556836a..30f33fe2 100644
       timeout: 100,
 @@ -91,7 +92,9 @@ test('legacy-tests',
       find_program('tests/cli_legacy.py'),
-      timeout: 600,
+      timeout: 900,
       env: test_env)
 +endif
  #TODO: split out dbus tests into own test() instance, to run in parallel
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.0.1.bb
similarity index 92%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.0.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.0.1.bb
index 229414718..bb9f09f7e 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.0.1.bb
@@ -14,7 +14,7 @@ inherit meson pkgconfig systemd python3targetconfig features_check
 
 REQUIRED_DISTRO_FEATURES = "systemd"
 
-SRC_URI = "git://github.com/CanonicalLtd/netplan.git;branch=main;protocol=https \
+SRC_URI = "git://github.com/CanonicalLtd/netplan.git;branch=stable/1.0;protocol=https \
            file://0001-meson.build-drop-unnecessary-build-dependencies.patch \
            file://0002-meson.build-do-not-use-Werror.patch \
           "
@@ -22,7 +22,7 @@ SRC_URI = "git://github.com/CanonicalLtd/netplan.git;branch=main;protocol=https
 SRC_URI:append:libc-musl = " file://0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch"
 SRC_URI:append:toolchain-clang = " file://0001-networkd.c-define-scope-specific-to-case-statement.patch"
 
-SRCREV = "45f7cd1569896d9e316c130bf5c60b7ccfc8211d"
+SRCREV = "3a7516aadaf864ee9d04727977d3d9fd1bccbbda"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


