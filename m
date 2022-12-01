Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A8DC43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 13:43:42 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web10.43423.1669902216943395807
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Dec 2022 05:43:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=mtePIR/O;
 spf=pass (domain: ni.com, ip: 148.163.156.75, mailfrom: prvs=93349a59e9=alex.stewart@ni.com)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B1BwoX1029562;
	Thu, 1 Dec 2022 07:43:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : content-type : mime-version; s=PPS11062020;
 bh=OiVBsg05404UwbtZz3CBRL9wWvhJSnL+BAvEMTzP4os=;
 b=mtePIR/O+AWARLpdXmW+U6lnoT977GJzmPDsIrW7F8NJTpmV3Fpr2xjjECkRmRHyPqtM
 m6HK1edMhjIHH06t6eYxFw5RDt6/vVW8RNxOBNbTqB4UURWru6pTQpdXPcVmWdij6Blp
 NY4xNbT1kguJgdAy3OvRyVpQR7L35vH2/hnHSNqjh+fbe8qgg4v+ntGy3K4rr9K8dtJH
 M3eIzHluEN8K6xAqipX0jW75SaHvwRkhKnN8AzIWngYV7q/q/FQrFHbgZLR6R7w9l+2K
 3rh9G3MmRMVbJzn3gf7PIkgUEXUVsG/cLQG1PeVJ4/jbWLasdaZ/F8oC2Prg/ltj/4cV MQ== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2042.outbound.protection.outlook.com [104.47.56.42])
	by mx0a-00010702.pphosted.com (PPS) with ESMTPS id 3m6k50s2tg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Dec 2022 07:43:35 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SvCMn57N5/1Y/FCqURgyTR8Z9YfYyg1NpgR95bFJbajtssPpo4csAzeD4ZLqqd8Ywr2+ExSDtXg9GZrY4Vz3ohxjRrpqgOZ/byzd3jrNBi+NlGr1uXCnlwUN7TV4qJVocXoEta5C81O5l3svYprjdHZ5BzluPx8J/pJqOFFFANQ8VVZqNGEe4vRSo2pe2f3wm0Tkd9/GiYQDuxLorv5u0DqZtjxaHWAPArRfYHcvGNWj1LcsddICnIbo8EXtmeMWdbdxzUOYtUgv62Tl6HED1zOD0PLzFUxqmVSXMZOTVZsDBpID3iSPb4Gf4tGTrWiL3lGppJFU+oCq4fAc/tBaVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OiVBsg05404UwbtZz3CBRL9wWvhJSnL+BAvEMTzP4os=;
 b=OZKrqTmpDIQBuaC2Str9U9q1FltuAiH60MD2IHFi6g+5Oh0BOs9y51gqvY8MhxTRa7Ho2WjysVeKzU6BoYT/mwDddPaDDx2k4g6GM1Jg5Br+rnx+j37MR7VTKm0c8Jsruz104Oz7AswUeiFOPe++c2ywrxh85RT+gLXT95ix+D4APikw0sxdWcFbDDqNsQEJ+ikQoCYmK5eaRXiT8QyCqqGcGb47F6dKLSE1FVq3CXw1/CCa5FYlRciOx0z/hXXxiYkhk/VUcb5MYxPLTte9k0xY2SMLrfaiRZyRtCRjNpSikllENEfeo1lVMhyprw2SXvj5cfT3bhblI9M/7uCyLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OiVBsg05404UwbtZz3CBRL9wWvhJSnL+BAvEMTzP4os=;
 b=CemQyObxFka3j3q8MjqhmWnnEGy6lQZrVzRP6/kztO61pjWYOgxqqIgsh1nMc1ZYsYl4+xMh3ENjhmZ/Q2mY6zUzA+vAK90f6CrtL/l4PFx2IxaadHjr0ItSO/dlA3jIcE40M4Kv6H22jLrbznX6hLJO9NyxgJcTnRWpY8Mf2fE=
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by MN2PR04MB6925.namprd04.prod.outlook.com (2603:10b6:208:1e1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 13:43:34 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::d240:66cd:3152:9511]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::d240:66cd:3152:9511%3]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 13:43:34 +0000
From: Alex Stewart <alex.stewart@ni.com>
To: openembedded-devel@lists.openembedded.org
Cc: schnitzeltony@gmail.com, Alex Stewart <alex.stewart@ni.com>
Subject: [oe][meta-gnome][PATCH 2/3] gvfs: stylize DEPENDS
Date: Thu,  1 Dec 2022 07:41:47 -0600
Message-Id: <20221201134148.116754-3-alex.stewart@ni.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201134148.116754-1-alex.stewart@ni.com>
References: <20221201134148.116754-1-alex.stewart@ni.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN1PR12CA0095.namprd12.prod.outlook.com
 (2603:10b6:802:21::30) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB5151:EE_|MN2PR04MB6925:EE_
X-MS-Office365-Filtering-Correlation-Id: 4575c24f-d32d-4dd5-a263-08dad3a20a82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uqAAp43f7kpoBm2mmtE2YYoJ/hR6q123ezRsQUt/1bzZEG8/ADbuD6VRwgTlKzJul4vkJljzfUjKS7Q7vHIxrcNlg5ig5sdfXvI8Y8WBI3G6u9EL2y30vY42lgicAU4WbeRzIoL4rf0W9EAfybBR45Alb8KOpPkgyBVwU8DPfuYnxVrdYg9GrWfdE8Fq/PpFDuYlwxn3jbAjrabrYMXxjRAYz+RsDTZQg2jFV3FScWlNu0QuIcwL4Ff+xpKWQoZzqQYP62vdMxvKrPFzqTMgqdmefWc7pHQgNqaW/WzMUl1R1WHX5SqZaTdxWEXjbiDZglZQtw3If52DK7Ny/xoL8oVrzO1oFDTsBHLi0w41qfx1cGomA8Leeve/AYR4ZW/NuegAJKlcaLeoelfdU7Cd8PCWGunaV6QmCTXDDl39Wlqh0AHZNYNzySB+vh5m+78JzrXtIEkxfyp/a4Po+Ki9RQuanct/pLauSiNRQXf1jW4CeWqjZGA8mwTlQqSy5S4EcBzFNWpLbeaDv+RkCpkanl+ZqpVHm5PBlMsLMyrHLzQ1AFFQgLuy6ZGBA5Cw4LLiSdrFnMG1AcNz78l7COnekLKCvaIjdmaW7RwmwfkpzfY8swA40h8z5KXz5MPwX2pR
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(396003)(346002)(39860400002)(376002)(451199015)(6666004)(2906002)(36756003)(2616005)(86362001)(6486002)(478600001)(26005)(316002)(6506007)(66556008)(44832011)(5660300002)(41300700001)(6916009)(4326008)(8676002)(66476007)(8936002)(66946007)(38100700002)(6512007)(186003)(83380400001)(1076003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Bh8R472vAP7QWvaS5n9MBpQV2ymOMVa+X4+42uPmJOKrHI+N06dzaIWcgN0e?=
 =?us-ascii?Q?KL+4NZKOFc7RQ22qLpfVtXKYtWI+jiLf5raFrlLsJo9QlpS6cE3UPvJthMWe?=
 =?us-ascii?Q?Sg2TuwxbyemJR0VKstiDhR5Osl/mH2J77Qkf+c8KGOHFqHqHCRFeRe/QMkgU?=
 =?us-ascii?Q?MDzVaDU+NPgOpcMux/+7/1i53P30VRdebkblRss5lrbxZRzb9ZSwnXJXojuK?=
 =?us-ascii?Q?HKzad/QmISj3WBLW5pkOoyyOJfM4wcMjZXtEYrn8TOJbMXOUZu7JC0tN1zts?=
 =?us-ascii?Q?qdw2JvvRfXcaShNT1lVK40u+JLvTU0RBfoKM1Le3VyN3o77UTeAG7WjXrjCZ?=
 =?us-ascii?Q?2jbuDpGlgYdcJO/CfbcZnxkUWtQPWh7il2HhSaP0WkI3YotKf+qFU5a7bkqv?=
 =?us-ascii?Q?jYbTErcmwHpIHIgW5//fFAPzvBUWcl3viWKVoHSxKcrimfgnlmlxTyKLsNhn?=
 =?us-ascii?Q?ntGhv7BesGZDVLZYb9xc339Ifymj9SU1QUUAB2srVTkIfLTKxrjC2Clb6dI3?=
 =?us-ascii?Q?nFM2wg6xFzlpeCgzANOH99Ly3RdXoeD7E5TZM3zI69qMVfF9vE9CnXzWocVY?=
 =?us-ascii?Q?sAQly6DQXv3WHlZi0I86raolDHHGU18tDGhI8w73doTDRCRQLVSyUjb+DD3j?=
 =?us-ascii?Q?t8mz7HJZ6F1M2xikCtT9fZA7GmtWBUxidQTjL/wP7rhXSxf4FlnYX/IQkm/2?=
 =?us-ascii?Q?kFDbTwYV6I0bFyVyOn6N+86YnWPlslIDO/Mmoveh5ZYOxs8wq71pXLyyz1vv?=
 =?us-ascii?Q?8a0zH+uv6FDCx7AQrU8d3iVl7pQwlE3FTpAJpnG55I96kE5wOXG0kHPI3j+v?=
 =?us-ascii?Q?+d6/M3FSwRfzTv4DAbYSpT1XGTqLkllPvscGAlyqjZF58voBTLS5uNDOLgLw?=
 =?us-ascii?Q?1FZaxWOFYmxXX45wRdi0HgIMovif+ITCRGs/R60RkA4DtmXecy1im/B0eG7Z?=
 =?us-ascii?Q?+2tGciabdde7R/hzBNuKCr9ke/kgh0JDQIA189jRr2UgQ2BJjvbvWFklmtKw?=
 =?us-ascii?Q?I6fYx2+yPdBKFxfmRXLpKHGuEkXXn71kS0ys6ACfTVY4k2zyZI6rArjhe7Af?=
 =?us-ascii?Q?BxgxJHQNYCACm450JIEBwSXya3CpyaO2tb0gTcnQ0+OR1R+yLts5TIMf6v9K?=
 =?us-ascii?Q?t0JCo8feEAiLhA+NVzcNE0bptfoZutnQ/LCnPFCGi/4ZwefNoK521kIPUhZo?=
 =?us-ascii?Q?tpnij8fzF2dZMnDpMRZCeysV5fgrAzk6WFUjyLz5swNN1sO/OXf5BEpr3r+g?=
 =?us-ascii?Q?R7f819Zyi2jdtGwNXTo6iuYw6pzoCNSFVryudyM6j44HTmYwZGrEazqRUu4O?=
 =?us-ascii?Q?pOLF9LL3sXahL4km5AJucvzmALhHCrUJ2F97GwvGJCugb+qrSOVp9XelVnys?=
 =?us-ascii?Q?2gj59N+tzrnAyv/U9L4FpOwnMswyDb1OFD1MEc+ZtzlsKMJkALbLhAUo+n1c?=
 =?us-ascii?Q?QccNccEBhby5GJbmJCKM42Tb0n9k5w/3k4gl7wILlyWgwT+0l3i2a6vChT3+?=
 =?us-ascii?Q?sVSwh+iJKeyClnkvP3/h8KcjRwzmlGhTC14tDKARV39wpb8mLe/j4F+f7p7G?=
 =?us-ascii?Q?7trR7rvqrm9BkpsytUYAqUK2eFgDtY7jjOS2SziI?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4575c24f-d32d-4dd5-a263-08dad3a20a82
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 13:43:34.2717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /fdsTjjCIJafY5+1V7xsAPFkOJhojabZ+3scx/NJH89id1boSEmgq3oX6z616nkb6NW6ZODoeFASdZEvRX5eSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6925
X-Proofpoint-ORIG-GUID: ZaIAvfDysr8k8x90rM76cNgweg9t2ll_
X-Proofpoint-GUID: ZaIAvfDysr8k8x90rM76cNgweg9t2ll_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-01_04,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30 clxscore=1015
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 spamscore=0
 mlxlogscore=940 phishscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2212010099
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Dec 2022 13:43:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99887

Use multiline styling in the gvfs DEPENDS variable assignment, so that
diffs are easier to understand.

Also alpha-sort the DEPENDS, since their order isn't meaningful.

Signed-off-by: Alex Stewart <alex.stewart@ni.com>
---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
index e8d9f16de..4c251d2f4 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
@@ -5,8 +5,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=05df38dd77c35ec8431f212410a3329e"
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gsettings bash-completion gettext upstream-version-is-even features_check useradd
 
-DEPENDS += "libsecret glib-2.0 glib-2.0-native libgudev shadow-native \
-            gsettings-desktop-schemas dbus"
+DEPENDS += "\
+    dbus \
+    glib-2.0 \
+    glib-2.0-native \
+    gsettings-desktop-schemas \
+    libgudev \
+    libsecret \
+    shadow-native \
+"
 
 RDEPENDS:${PN} += "gsettings-desktop-schemas"
 
-- 
2.38.1


