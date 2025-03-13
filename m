Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA830C28B28
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 00:12:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3271.1741824718478185154
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Mar 2025 17:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5167eddecb=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52CNQb8t026219
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 17:11:58 -0700
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2046.outbound.protection.outlook.com [104.47.51.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45b0j4sare-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 17:11:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ryBIH0yajGixnU4mUr1auzowL5XPdE3RGw8L48kvufpo9sjf2RKygXg46RcOXxGwBni56RL/58zHYVkRiIOV7drVk3cDCF2ojCV7X+EuzpVgPoI37Bsx+6juc6+gixGYWGWNVVStw/yU8NpY9MjRHfvlTnViz0HtAOHhVwf4qtil3LjgXU9WwpJOSdwzxc6q9MPXtFG651h3tr7Ux3mvOYAq41GU0gH/Rhxf4whOJvaHMHVcaWyjJe+QBN8NZgI6AcBNLLjrKgtCU9piI5+dTX2KnJ7d5VA+bSwMyZqXxv3io8c/FkQtA7TplMIxxt7YZuc5KjmGCSEX7pEeJMng8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sE3rAVWNTenujBfBVXP9TQka3NKAmubwSSXcBmXK118=;
 b=eZXHvAQmyC3MfhGmMgCT3MsicZP6pBKULms1R1wYOHAH1iE28JrHzKpJvN3a7Zepr0SYSXUHmrBEpckLIS96SmtoT1SNmEQKsrlwnmuG/eulPcBvo3HNug6nH4HVi6Ip+WmzmHGcZbNIwEM40zEySebWQ77JtNECjnya12aW0L2AGu8B+2Mt/iBRTjn+W+PdsOHF1/BZ7eJSauv8E5/Nt2ndLs0n/L2radecPljivSaLGRaae69AiqtsekyWkcbGFTq5Ut3Gb5geuPnzzqJ7xDVQhLLB9WSWrKYOaTqG3CrAPZ3oJhGoNYR8uQeMLGwiwM3FKSZRgTa7zuy9RtuXsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CY5PR11MB6317.namprd11.prod.outlook.com (2603:10b6:930:3f::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.28; Thu, 13 Mar 2025 00:11:55 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 00:11:55 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] tigervnc: upgrade 1.14.1 -> 1.15.0
Date: Thu, 13 Mar 2025 08:11:38 +0800
Message-Id: <20250313001138.986323-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0018.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::7) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CY5PR11MB6317:EE_
X-MS-Office365-Filtering-Correlation-Id: dd197bba-554d-4c1a-e1ad-08dd61c3a9a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3ueBQNeAiDA/4XUvyO8IcsNqXbCv+jIXZKg+d49A/3hlQjOwJRBsz4HLQXEt?=
 =?us-ascii?Q?kbcmmbHkIVArmlXrsBcni29SwJ/4qYcWFHneA2tLNH32EgLLZhGwgK5ljvNm?=
 =?us-ascii?Q?c3orsPLVGTYCHFZqbBHTuT0tyeIapNa1LK5lSgMtLUkKAEWjGj7GgsRE05PG?=
 =?us-ascii?Q?te/2B4QDIjyxWQjzQgmUeRajhJn96ViClPOML9/haZjwWoxQLOzd27Kjye+K?=
 =?us-ascii?Q?CQSC1sZ5CjKyzNxYr/5u/57TC9aIkets+lo2m5fSv/vPtJuU/iPoa3NJOA4Z?=
 =?us-ascii?Q?CG881c9eIngSJ+Se1w4AWFzBsv4GA7NFGmhXi181+CXQY0gnkcK+B4f3f4ig?=
 =?us-ascii?Q?Hz2HdtoIlmjjx8IAxW6SgzviryKJNKeozEFq3BMtlkoAPuurTQzqELn+Yj12?=
 =?us-ascii?Q?B7yeBpI0DIIvRzL5YxvVRX8EKgbJPd6q9Uuoj8BfDs5UBKPLWR85wdWjCHvg?=
 =?us-ascii?Q?W7SJ0ANK7yLVrWIuYbbeLOh0eFGX2PULkXfKfOMVH1izAzxQVcBE6S4DnTVN?=
 =?us-ascii?Q?iZktHTBJHu5ud+fPYaXsJutfuwT7VdZ9mB/JqaKtX7FnndpRTIDWz00N3gTC?=
 =?us-ascii?Q?Z86IF5NOrBDwxz/2ymioqNjq9YxrXuCemtVEy+4y/1XyzV3xKxfzr5qdgGSe?=
 =?us-ascii?Q?92ha6oFL1ci3qxEdjO9jnilGDjcMlOARlfz3y53qr9e7wLogVcLbHVIIWnp2?=
 =?us-ascii?Q?5B/qOn0MSJ0CZodtIopqd7UnVbnKK7fld4EyeafwpG24JDVHiMxHhrqaIf9x?=
 =?us-ascii?Q?jLcvK7HSVPP+irThkZ16h/EuuBNCZ7TJ/KubSVGCMwtSOPrrAwGDR3GSpBJW?=
 =?us-ascii?Q?pXKCLteKOliJpXckS1DTfdPbjtNbEtzPWXt6WRkBuuYVK7BXTsNBih+DrN34?=
 =?us-ascii?Q?TJj0WwpZI8U8Lu8bn+NZuW3jnoBTTDaILLWVsl2EAbarjGXU+Z/U5RJOgS09?=
 =?us-ascii?Q?GayYKt/wHeNR8TMFAO/DJNZ7olssD8Pt4BnWJQbjSIWDzWkN09W2xSMB8LdV?=
 =?us-ascii?Q?/aNFiXifuZmhbdZdh3izfEp2e8A2dws62GHyfv1KfqvJK+wSaZkn2Sgb+eg1?=
 =?us-ascii?Q?4X4+IpSxzUVE50mJ6hc/SJmzYwen/WbXH4xby1ZTPT4Z59tYlubvDdD0GfPz?=
 =?us-ascii?Q?iN3f80qn6HB/+IeJTR7DBCywFxs5ZdOMv0fGoWj54HftZkD0govjTl8zQ/i0?=
 =?us-ascii?Q?4z6IbCEFzY/pzRufG8mc8FcbeiS7oxjfAkDiFfsqAljd4xIYIpTLhC6vBqm6?=
 =?us-ascii?Q?IUWYxlveLhx1PimnIIdbI8McnkSmPZyejbVg1ybtgBcRWpvwTNuLhoM45UDJ?=
 =?us-ascii?Q?/Ppzslvw2OHACOgnvxs3J2peqJRzkUIOGLCZaHnKJtzU/NgK0pBakZzAjbkh?=
 =?us-ascii?Q?eLY6w30bXHJb5yx7j9hw7RFPR50D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?N7qzm7SEb3vVxzEcod3YSPgTLHnTgfgZzugE93r5yg5hsCwD5UIH4nJmYMdw?=
 =?us-ascii?Q?BvWvqlDs8xjU5hTVfNemjkJIfOzupPoV+08KeUgMqnqYrgzP4QCZvW/K+XwV?=
 =?us-ascii?Q?3g7jb0tnb9Y4eseyITT6QLP6m5Cpahf9Tj/sq+40SewmWwVLz0piGH2DujRW?=
 =?us-ascii?Q?jNokJuvu4bmeJGI/SYqqIPhvKCHthr9IaicuitmcnRF4zb4zani8lFpug+iQ?=
 =?us-ascii?Q?TdkLnmjb/6LEy5T9AmGOtFKcrDqnF9ULiljuKf8K+M8MnXPXoDwwUnIwqy3H?=
 =?us-ascii?Q?sD2GnSasStCP9REB364P6P5s5FKejecgYloN6IG9vZ4UNFHaoShnDehelwmm?=
 =?us-ascii?Q?YuU5V6QayVNAEvM4FBg+Plwfc5fEkxBdBzsF9qV+94O3tByA7lReuqsMWvsZ?=
 =?us-ascii?Q?aBQ63qem9G/K++xNs0WFLYYfekqwdA/ldVyhwcJQdhGtZUQrG2SELEX6A1Lq?=
 =?us-ascii?Q?bIxMOr71unnSAcZjxVGN3gSz4GoVC+63XhPFS7E7ko+zv3Y5Q9YHWqztiI6h?=
 =?us-ascii?Q?inf3GkYHMwi4cAEwCW6yGLU3XwMVNW4srJod1BtWpN3eJBoUeyiLpYp4LSpr?=
 =?us-ascii?Q?JT0lH88hZy6L3CJtp0SkmHj+mpCbU8rwoqLOk9Wk0W2rlb34XXQlEkAXNfca?=
 =?us-ascii?Q?OAgEfYBKg+deLIfcy5wZ3HykIUIZ9747M4tyO6/QWy6ilNW9cQoq7EiF8X74?=
 =?us-ascii?Q?WvCjDamJ2Fb+NIvOiOxm/lVeLdvpfa2GXKbGb5y1EYrNminYvy1aqgC8N50s?=
 =?us-ascii?Q?KfoM/EXLeCp+YgSBHeRHhSZJFfQpPEHp8+FLkJMdxqLeGL+MjDY/gNtjxgRR?=
 =?us-ascii?Q?AiJl3K7jL02B99uXFh4q+u3OR2Z2VoTYJR8FVgrC2E+8Gz5pnJXnP4kBypT8?=
 =?us-ascii?Q?b+59WEJdkUV1P/Jkop7SCCPAGFmmHqRQdUGoeaxQ5TXYLcc1LiU2B6NB5t+A?=
 =?us-ascii?Q?fejoLNTL5NuURWNYbdkfh4chBGpiiuDzEgYtnGmM37lMkHbokrx7rRUXHacx?=
 =?us-ascii?Q?iyOenRxj9R5tzY40hqlvjNWWJvC/QRGsmdjnc20t3AtQ8z303PY3mwlzZF6V?=
 =?us-ascii?Q?YVw+b5ZSlsgIsnS13fICXoEBdg87nUC64WIe2LwON4j2eggu2yXqapXe98N3?=
 =?us-ascii?Q?l1oEwSGwIlzdzn3XSoZl7K1dxzFyWRxfbfnWgMqh9017oZd4Gdg4/i9b7y6k?=
 =?us-ascii?Q?YbeJOPr12M6JgiKUY8yKblMDCiiN8vSCBfoagiA99d+iylzr3RDkdUQvNToa?=
 =?us-ascii?Q?y1PHNULeL8a1yx7bK8SQN1hPe+oIHzJNzrPTvkURjKQg/v7OCbuE8OGVSmDM?=
 =?us-ascii?Q?tH2vzxME7MSmIaP7wr9ZSygSR67Hfm2fnnoxrM2H6O9Up3cTZRdeU8nhaGhg?=
 =?us-ascii?Q?CdXETl9m6cQ1M3EZcZhhn+Sr4Sd+LmGg9I2KVrVghP0i/H46bwHIHKl6eEym?=
 =?us-ascii?Q?Ao8wNoBlrkw/2dNi2xgB6C0rn7IyGjPLpx57DNKNVXxfFXXVCMjMnihzDM57?=
 =?us-ascii?Q?XnYT9uJtAY324VBDn3uuIxDArvcOA8RDrIV2ZMnnb1fTnlqGLg4c5/durAjd?=
 =?us-ascii?Q?L/AyLQP4otOVSTG85S3Dc7az0CymA6HwNxrsWcJd?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd197bba-554d-4c1a-e1ad-08dd61c3a9a2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 00:11:55.1135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZFIW/hzLFxkvotQbIwuRaXKbDNJbn7cdyDjPtl9zvO2/EmSe3BwDNChiJKmw1DptMdiiWWhs2kQ1W+1ugGXckQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6317
X-Authority-Analysis: v=2.4 cv=Cc0I5Krl c=1 sm=1 tr=0 ts=67d222cd cx=c_pps a=yfraj20uO1EtZH+TM7jpHA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=NEAV23lmAAAA:8 a=ImFfBtlnAAAA:8 a=t7CeM3EgAAAA:8 a=Q6nhPWdC5t8QPX52F5IA:9 a=1v-ibXjTJGN7_339g8em:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ROgipXtwxJcyBRBj1BQQM2Jih0SRkiGC
X-Proofpoint-GUID: ROgipXtwxJcyBRBj1BQQM2Jih0SRkiGC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_06,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2502280000 definitions=main-2503130000
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 00:12:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115945

ChangeLog
https://github.com/TigerVNC/tigervnc/releases/tag/v1.15.0

* Refresh local patch
* Update xorg-server to 21.1.16

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...d-missing-dynamic-library-to-FLTK_LIBRARIES.patch | 10 +++++-----
 .../{tigervnc_1.14.1.bb => tigervnc_1.15.0.bb}       | 12 ++++++------
 2 files changed, 11 insertions(+), 11 deletions(-)
 rename meta-oe/recipes-graphics/tigervnc/{tigervnc_1.14.1.bb => tigervnc_1.15.0.bb} (88%)

diff --git a/meta-oe/recipes-graphics/tigervnc/files/0002-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch b/meta-oe/recipes-graphics/tigervnc/files/0002-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch
index 56bed4bbfe..101adaa82f 100644
--- a/meta-oe/recipes-graphics/tigervnc/files/0002-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch
+++ b/meta-oe/recipes-graphics/tigervnc/files/0002-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch
@@ -1,4 +1,4 @@
-From 7ca0b0a4f8a37f9dbe461e28a731364b9aaa60bb Mon Sep 17 00:00:00 2001
+From 4c7658b43f903599608c1fea4fbd7e37dc117119 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 20 Jul 2017 05:06:00 -0400
 Subject: [PATCH] add missing dynamic library to FLTK_LIBRARIES
@@ -11,17 +11,17 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index c47c9c0e..f4b576a0 100644
+index 80c2762c..eb581600 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -270,6 +270,8 @@ if(BUILD_VIEWER)
-   endif()
+@@ -315,6 +315,8 @@ if(BUILD_VIEWER)
+   set(CMAKE_REQUIRED_LIBRARIES)
  endif()
  
 +set(FLTK_LIBRARIES ${FLTK_LIBRARIES} -lm -ldl -lpng -ljpeg)
 +
  # Check for GNUTLS library
- option(ENABLE_GNUTLS "Enable protocol encryption and advanced authentication" ON)
+ trioption(ENABLE_GNUTLS "Enable protocol encryption and advanced authentication")
  if(ENABLE_GNUTLS)
 -- 
 2.25.1
diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.14.1.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
similarity index 88%
rename from meta-oe/recipes-graphics/tigervnc/tigervnc_1.14.1.bb
rename to meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
index ca737e48ba..079d3d0741 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.14.1.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "TigerVNC remote display system"
 HOMEPAGE = "http://www.tigervnc.com/"
 LICENSE = "GPL-2.0-or-later"
 SECTION = "x11/utils"
-DEPENDS = "gettext-native xserver-xorg gnutls nettle jpeg pixman libxtst fltk libpam libx11 libxdamage libxfixes libxrandr"
+DEPENDS = "gettext-native xserver-xorg gnutls nettle jpeg pixman libxtst fltk libpam libx11 libxdamage libxfixes libxrandr xkbcomp"
 RDEPENDS:${PN} = "coreutils hicolor-icon-theme perl bash xkbcomp"
 
 LIC_FILES_CHKSUM = "file://LICENCE.TXT;md5=75b02c2872421380bbd47781d2bd75d3"
@@ -17,9 +17,9 @@ REQUIRED_DISTRO_FEATURES = "x11 pam"
 # out-of-tree builds.
 B = "${S}"
 
-SRCREV = "1b4af5c586eb7a30a38c82fd088c1fa47a83e72f"
+SRCREV = "8bdf8734ce12c8ed3c232496fc8a4ccdb04636b8"
 
-SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.14-branch;protocol=https \
+SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.15-branch;protocol=https \
            file://0001-do-not-build-tests-sub-directory.patch \
            file://0002-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch \
            file://0003-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch \
@@ -27,10 +27,10 @@ SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.14-branch;protocol=ht
 
 # Keep sync with xorg-server in oe-core
 XORG_PN ?= "xorg-server"
-XORG_PV ?= "21.1.15"
+XORG_PV ?= "21.1.16"
 SRC_URI += "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${XORG_PV}.tar.xz;name=xorg"
 XORG_S = "${UNPACKDIR}/${XORG_PN}-${XORG_PV}"
-SRC_URI[xorg.sha256sum] = "841c82901282902725762df03adbbcd68153d4cdfb0d61df0cfd73ad677ae089"
+SRC_URI[xorg.sha256sum] = "b14a116d2d805debc5b5b2aac505a279e69b217dae2fae2dfcb62400471a9970"
 
 # It is the directory containing the Xorg source for the
 # machine on which you are building TigerVNC.
@@ -72,7 +72,7 @@ do_configure:append () {
 }
 
 do_compile:append () {
-    oe_runmake
+    oe_runmake 'TIGERVNC_BUILDDIR=${B}'
 }
 
 do_install:append() {
-- 
2.25.1


