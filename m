Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C4B0C07E9D
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 06:48:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7986.1664261280348545075
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Sep 2022 23:48:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=GToX6ASJ;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=626914d71d=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28R6SHlV032278
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Sep 2022 23:47:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=wss7jx7dyMTTXZ0KiiJXoe9xwJlLRy8TgKxqamK9rro=;
 b=GToX6ASJiEHbxlb7kCzaCn29r0IOjEDmMEO7VFSzjoGX87StuuD1/++ECqhULiYW0VuR
 lQ34Jn0R/7/LmAJNRJUrcm64hpXQRI3Kg8lyH/em4esoSYUuAIhFbPu5hssRLA2sM2Sn
 xC5pnVlXBPkfeWGc8nhgteE17+eY1+juX7/x90pnGun3sFJcjk4rmMsD/irE1pJuuqwg
 acaXp5Yt/kWsRitugHiTK1L5JZIdYGJpaDMk5F9e+7NpSR/82eU/XiiMS10Vm3PgEjVi
 kH4eFNbzjo8vXjgt6W12kMi+uq7Ikj0rJXieKrCckRl2lCWd82OAnncdX770PhjIEagC Gw==
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2046.outbound.protection.outlook.com [104.47.74.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jt1dk9yrf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Sep 2022 23:47:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N0PIJxmGv1iVl1ocTqp1L/0C9WXfl6qkylctk9JvRqUo5hamD8uSeQxcdkY02H2oTXmX6+4vGx5Jnz0gLGq7CsRC+LneBXI+eIc/8ptdCOsxllWE32NX8Azd88eWfLT+YThLL5b0FimBOlUbN1qC+pCeO47dxXcdD/L1S350MBmao+QUJBzG4Ig/Ken28iJiCAvQFe7m435jIcwedfuMoLNmyUhQx7s6AN9dkUz4adOYZi7S8doyx86uOBLDwMNk0QBwf88pfpAOIXtY1mQbP7pqeSNgt4ozDRWx5KD/eMmiqKoee1yVdwT1zOmtrwiadjBtGuIktB2Pmwpyv/6qiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wss7jx7dyMTTXZ0KiiJXoe9xwJlLRy8TgKxqamK9rro=;
 b=c2RBbLKQ6qPibDnyfFSN3QBIF/8xZyKz02p/hYNcbF6WVC/mLxUOcr50JW2vWJqyGhmkqEJX5Vvg84ehWkY2MhLy9WRNsR5FrtxcL5hoNm8XYIZjMMOcG2qPA3NVB3mQGn63Y1wd7s+sXkKyewJFPx8t3W2P7BpBzgDfNLAC3/qIL7eYZM3DrENqv9bwoscfJxdKoK50wsxCe27YwLelA0MS21/MYwEDwhD3ABU3c/2n85VI6ZfYOe/5vtMsOh00471mvfHP8nQ9nzQiItCeDmW4edF/sIPQqdLi2qJsvlcHcYDWiRLKq/yGuZfQKYxftZPlU2wfqtraSf/JGq6Bew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CY8PR11MB7268.namprd11.prod.outlook.com (2603:10b6:930:9b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 06:47:57 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c112:6e86:1bdf:66ed]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c112:6e86:1bdf:66ed%3]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 06:47:56 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] polkit: refresh patch
Date: Mon, 26 Sep 2022 23:47:41 -0700
Message-Id: <20220927064741.72304-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0036.namprd04.prod.outlook.com
 (2603:10b6:a03:40::49) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CY8PR11MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: d5cf67aa-028f-48d3-6b0b-08daa05435c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DOTCefKv1ExafbpLkEfMH0Wzv0EKACGqxdhsgD+zKRDdDeUtZ2d79RYP1zte03ZjBIph+uyfdgPscZCkkVxGJhSoaXuUBtuu8r3/KqBfcgC/CDrFj2ZLn+HchqAsjosHMaSpssuG3vDyHYUNy0fiL+ij5zrxrLFi2ki7T/iOkbMA6Ne2fOazd1lG0ZH2jt5tHQwSlpNDXvKKywG7OOhW5HJa/HNxwrHuZuL1He8ScZ1R2QOQOMQapnOxzYubAHarLPbrDbYusWITDfk4evfqQdFEMmLu33v1txFfBCvHof9r7zdyyhGzDm4kFGa7lSAQPlTG2KSjypTx5GMaoOKCM7pPHFPX8Cle0OPVU0fMFwHH5Ny4DGcVJgtwpKXS4q8GBTsdmqL6PuzL6izH/Z62SRC1gm28ZqmsJ+0vtYrtHxq7CADinAo222ghHC+pH5Xw4ZivU2OJAgTmWGDnv9MghqCfPF1qYMmLo884xIek7+1pNM2KVvawfQ+9gx7LY0wqSxqkNPBMZH/PapKvIpRsnsoHdVy1KD9e+8rFMz74DIdVpzIZsLvnSIHe/yQ0wd7+s6YsvjmCl/EZhM9Ptdei3ZdC2DHSEIBgySGt6RUTaSQEhunj64tWf0J79O8oKRlTL4HCY14TViNexliNSImEssIcfMHL8pdqV1F6vM1gP7iA5sOkDSzgR69oIf2TKQmhUZWm5J74iDxzoFqygnekNy4cOW9zFr51Zm8/BsPJFOrLNH/1VtMjgBO4hnv6LkzbzwMPChOAQGnqp1Y7juEN0Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(39850400004)(396003)(376002)(346002)(451199015)(2906002)(36756003)(1076003)(186003)(2616005)(41300700001)(6666004)(26005)(5660300002)(6512007)(53546011)(52116002)(8936002)(6506007)(38350700002)(38100700002)(86362001)(83380400001)(478600001)(6486002)(6916009)(316002)(19627235002)(66946007)(8676002)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?igvGm4NKzzDyFYAHGziz5m8UIe8RxussITq1hN9HcSrRya75rKmZa9tTQ1Cz?=
 =?us-ascii?Q?i4z4rC3bXJHZvuBdZCcB142xFP0o6Yg+zYTZUIXLuHVNss6kXcGbC/Q4MDkP?=
 =?us-ascii?Q?2w+MV4RcmhKTXq35zW9cIL63faLpAfEhh4nzb0i2et5IAotELQolrwuhUQSF?=
 =?us-ascii?Q?neKd0ndgi73Q/AKo72i0oxVRUj6nHM7OvJKykAMtXlgjqMwuTSIkeNMY8Y97?=
 =?us-ascii?Q?Wk717uN85E9XslQFDPTa7A1KfVjq3M3Ii5sAX87ECsfS13EhUxMCjJcagMqE?=
 =?us-ascii?Q?n6cQAvfWDy+Ud9wNq2gjqikRl2Oqtizp9pYcV5U6cv7CqrCnHvuNml2bHDd7?=
 =?us-ascii?Q?/Kt5PoX4SO71O0D0POvdVbROkRwBLQTULXox/23BCW/ALldkR4/9hlGIdFpo?=
 =?us-ascii?Q?Sw8CZjvGTM2eEn+OklEElEUGn0BhgDuoU+Zk+mncXc8+yUHmSF6XWoTKBebd?=
 =?us-ascii?Q?JApLct5mDS/xd+2YUPg6PA9agnWxfR2BCGRg51cNSvYzOr5n+iPuUoSPgNgt?=
 =?us-ascii?Q?Uees5SuBeppQdAtctiuvkFcBpBT1Vs2+05Eerif49ectWjvdahWlKoGk6Qh1?=
 =?us-ascii?Q?GN6+BsjWtTAppCSMpYfhic06aNSsTdw87x31zqzHM/UUn784r+lkJAGlyiyV?=
 =?us-ascii?Q?ahkW7zmSd+Kn4fieFirqGFt1Oz3HOILx81BNeujV42yPSmzgThwhJqEh4WBA?=
 =?us-ascii?Q?8S7eUELAf9Y3UsdsSKZXdPTVjbhGJmDEoIgYyG5mfd3fb2Cc8Kffs1tHxPta?=
 =?us-ascii?Q?sBiPwIvHYNDF2t9hiADtcFIK44HtfbWBsKUfA25TLP0BNpjWhUK5M/FMrK8U?=
 =?us-ascii?Q?GlP045yHBccWq0Uj0m6d2nFOtOVujZKqTnU4qUEtQHb+NYJSAZAB0Uq/Xswu?=
 =?us-ascii?Q?Hz0fPNUXYf4os3mk2gwBlCjWMGfiMUl2591bSAaQZg7bOYElGczMnMsIL/Jc?=
 =?us-ascii?Q?lz8Ba87UkxrA+s4oh7fL0p7blg/tZz9nE7GcFWvwdHxxeRgittQaRFMeY2lg?=
 =?us-ascii?Q?9JmLy2RWA44bfS2h3OjPND/GVSKAQGIs1/smh1VBMR5JQxgLRFbi9qYD5y28?=
 =?us-ascii?Q?2WPWxtLhtLFDOH7UGBtuRuXEtRuJr//h+g1h2PzHjbWfSRsYGeq8NYIP2eed?=
 =?us-ascii?Q?wek7lrfJknne97fjpJ2Ysbp8kkQsUHERFZUFNoJ8DzXMMCAkLHgUbnJN8Yj2?=
 =?us-ascii?Q?N1JDM3bk6Ti+tTOwgxOsdxClq+To9F0as5EjNaBkzRyhZPEH1dskF+RYmUUm?=
 =?us-ascii?Q?GzwoFf51leBlvISQ+chISaCSAdiXCWUj2gEEIt6cPtVnFmZxGcEwsd1IMD7p?=
 =?us-ascii?Q?BQ/Z5JFYe2pdahojXvgibUJkiKgMfOkgWHNoGInhfjZFVE495CyYrlkp2FbV?=
 =?us-ascii?Q?kuU6k+JLPlU0WaxA5mJwUJy/7TeuQ1CJ0xDiwdVBtYhxQngSDN4da+SsC0eZ?=
 =?us-ascii?Q?ZE23o2tPdTzUmMiq6fdcs9wXP45r88mZ0a1J2wmoU+cAV6gPBXIgjAcx/eQh?=
 =?us-ascii?Q?+gQpfA7dnCQxMzBcIXTfRuAaZeAy8l3fEC5L9DEJOybFouDxTXlzcdDe6lpt?=
 =?us-ascii?Q?o4imct0ePUR8/98I7AZxfD+3cuA8MpmZo7onHqlXOkvpvldOdepkbsvtg2QB?=
 =?us-ascii?Q?9Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d5cf67aa-028f-48d3-6b0b-08daa05435c7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 06:47:56.7711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 nK4P8nBGtJB+rcdzkAVg4maVm1cEvH5RP3KMHFb10G5NpZP1b4NAzuP0T1tqbHnNpx3F04S3T63C0Gd6usvdoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7268
X-Proofpoint-GUID: pHT24x-a0VrNY959LDBaDzeujBW1Y1pO
X-Proofpoint-ORIG-GUID: pHT24x-a0VrNY959LDBaDzeujBW1Y1pO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-27_02,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209270038
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Sep 2022 06:48:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98957

Refresh patch to avoid QA issue about patch fuzz.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../0004-Make-netgroup-support-optional.patch | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta-oe/recipes-extended/polkit/polkit/0004-Make-netgroup-support-optional.patch b/meta-oe/recipes-extended/polkit/polkit/0004-Make-netgroup-support-optional.patch
index 09be3b728..181aca16c 100644
--- a/meta-oe/recipes-extended/polkit/polkit/0004-Make-netgroup-support-optional.patch
+++ b/meta-oe/recipes-extended/polkit/polkit/0004-Make-netgroup-support-optional.patch
@@ -1,4 +1,4 @@
-From 501e6df3468f5da05881fc38cf68740e153ab403 Mon Sep 17 00:00:00 2001
+From a334fac72112c01cd322f7c97ef7ca21457ab52f Mon Sep 17 00:00:00 2001
 From: "A. Wilcox" <AWilcox@Wilcox-Tech.com>
 Date: Sun, 15 May 2022 05:04:10 +0000
 Subject: [PATCH] Make netgroup support optional
@@ -37,12 +37,12 @@ Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
  9 files changed, 43 insertions(+), 8 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 18e422300bb7..0f87ea0e8a26 100644
+index ca4b9f2..4c5d596 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -117,7 +117,7 @@ CFLAGS="$CFLAGS $PTHREAD_CFLAGS"
- CC="$PTHREAD_CC"
- AC_CHECK_FUNCS([pthread_condattr_setclock])
+@@ -100,7 +100,7 @@ AC_CHECK_LIB(expat,XML_ParserCreate,[EXPAT_LIBS="-lexpat"],
+ 	     [AC_MSG_ERROR([Can't find expat library. Please install expat.])])
+ AC_SUBST(EXPAT_LIBS)
  
 -AC_CHECK_FUNCS(clearenv fdatasync)
 +AC_CHECK_FUNCS(clearenv fdatasync setnetgrent)
@@ -50,7 +50,7 @@ index 18e422300bb7..0f87ea0e8a26 100644
  if test "x$GCC" = "xyes"; then
    LDFLAGS="-Wl,--as-needed $LDFLAGS"
 diff --git a/meson.build b/meson.build
-index 750623179750..2d9d67a23409 100644
+index 733bbff..d840926 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -82,6 +82,7 @@ config_h.set('_GNU_SOURCE', true)
@@ -62,7 +62,7 @@ index 750623179750..2d9d67a23409 100644
  
  foreach func: check_functions
 diff --git a/src/polkit/polkitidentity.c b/src/polkit/polkitidentity.c
-index 3aa1f7f1c762..793f17d5d1fe 100644
+index 3aa1f7f..793f17d 100644
 --- a/src/polkit/polkitidentity.c
 +++ b/src/polkit/polkitidentity.c
 @@ -182,7 +182,15 @@ polkit_identity_from_string  (const gchar   *str,
@@ -105,7 +105,7 @@ index 3aa1f7f1c762..793f17d5d1fe 100644
    else
      {
 diff --git a/src/polkit/polkitunixnetgroup.c b/src/polkit/polkitunixnetgroup.c
-index 8a2b36938ac5..83f8d4a13efd 100644
+index 8a2b369..83f8d4a 100644
 --- a/src/polkit/polkitunixnetgroup.c
 +++ b/src/polkit/polkitunixnetgroup.c
 @@ -194,6 +194,9 @@ polkit_unix_netgroup_set_name (PolkitUnixNetgroup *group,
@@ -119,7 +119,7 @@ index 8a2b36938ac5..83f8d4a13efd 100644
    return POLKIT_IDENTITY (g_object_new (POLKIT_TYPE_UNIX_NETGROUP,
                                         "name", name,
 diff --git a/src/polkitbackend/polkitbackendinteractiveauthority.c b/src/polkitbackend/polkitbackendinteractiveauthority.c
-index 056d9a8f27f8..36c2f3dc1a79 100644
+index 056d9a8..36c2f3d 100644
 --- a/src/polkitbackend/polkitbackendinteractiveauthority.c
 +++ b/src/polkitbackend/polkitbackendinteractiveauthority.c
 @@ -2233,25 +2233,26 @@ get_users_in_net_group (PolkitIdentity                    *group,
@@ -164,10 +164,10 @@ index 056d9a8f27f8..36c2f3dc1a79 100644
  }
  
 diff --git a/src/polkitbackend/polkitbackendjsauthority.cpp b/src/polkitbackend/polkitbackendjsauthority.cpp
-index 11e91c045da1..9ee0391b8c70 100644
+index 5027815..bcb040c 100644
 --- a/src/polkitbackend/polkitbackendjsauthority.cpp
 +++ b/src/polkitbackend/polkitbackendjsauthority.cpp
-@@ -1291,6 +1291,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
+@@ -1524,6 +1524,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
  
    JS::CallArgs args = JS::CallArgsFromVp (argc, vp);
  
@@ -175,7 +175,7 @@ index 11e91c045da1..9ee0391b8c70 100644
    JS::RootedString usrstr (authority->priv->cx);
    usrstr = args[0].toString();
    user = JS_EncodeStringToUTF8 (cx, usrstr);
-@@ -1305,6 +1306,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
+@@ -1538,6 +1539,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
      {
        is_in_netgroup =  true;
      }
@@ -184,7 +184,7 @@ index 11e91c045da1..9ee0391b8c70 100644
    ret = true;
  
 diff --git a/test/polkit/polkitidentitytest.c b/test/polkit/polkitidentitytest.c
-index e91967bec5b9..2635c4c4c64b 100644
+index e91967b..2635c4c 100644
 --- a/test/polkit/polkitidentitytest.c
 +++ b/test/polkit/polkitidentitytest.c
 @@ -145,11 +145,15 @@ struct ComparisonTestData comparison_test_data [] = {
@@ -219,7 +219,7 @@ index e91967bec5b9..2635c4c4c64b 100644
    add_comparison_tests ();
  
 diff --git a/test/polkit/polkitunixnetgrouptest.c b/test/polkit/polkitunixnetgrouptest.c
-index 3701ba1671b7..e1d211e47634 100644
+index 3701ba1..e1d211e 100644
 --- a/test/polkit/polkitunixnetgrouptest.c
 +++ b/test/polkit/polkitunixnetgrouptest.c
 @@ -69,7 +69,9 @@ int
@@ -233,7 +233,7 @@ index 3701ba1671b7..e1d211e47634 100644
    return g_test_run ();
  }
 diff --git a/test/polkitbackend/test-polkitbackendjsauthority.c b/test/polkitbackend/test-polkitbackendjsauthority.c
-index 2103b174d58d..b187a2ffee3e 100644
+index f97e0e0..fc52149 100644
 --- a/test/polkitbackend/test-polkitbackendjsauthority.c
 +++ b/test/polkitbackend/test-polkitbackendjsauthority.c
 @@ -137,12 +137,14 @@ test_get_admin_identities (void)
-- 
2.37.1


