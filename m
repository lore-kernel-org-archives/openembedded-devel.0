Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1976.1621967119642552846
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 May 2021 11:25:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=eKTPP/9e;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0779a9e397=stefan.ghinea@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14PIDHvD012366
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 May 2021 11:25:18 -0700
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam08lp2040.outbound.protection.outlook.com [104.47.74.40])
	by mx0a-0064b401.pphosted.com with ESMTP id 38rr6yrkg0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 May 2021 11:25:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m1TxZltttlCgV6eUlQXr55M8GBHzNT7MKgG8WJFdYrQqMVWEzMHtggVP+9+7TiOjXAxSB+7IUB1HfMWPQvhRgR2kK7jAQIAHxKFGUxUeK0hT3C28PWxVyzNaUF9FGWZKRW3eX+1MPTl/M/saOdZ2zh5YHyNo7ImJeU4I/1ABGO7pXAExKJpY+MoSocpU2e2OHyYgoD+iZ4B3hKSp/SdB8YKuW4UXdD9j47HO1RjDQHR2MogFvA2Kb8G+31LHzsDOflkzc5Fe66p2xPWNkxxiv5+NHmYoG92ssFDr0aCHC5e1GYeVazoYekzPMpLu+u24OV97P/VTsF13CNVC1UY9rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4n6I0BB86WHJv6mAAWYsEW4H4vtBdmyekamcbhG46cM=;
 b=PzATxc6jQbuPuT52u47B+7chyiIDcXw08mr7yw+YFx8WB9ww0KAyeFPJKcYhFG2GJz509XKZ51s1kGZ7xIoP0i01Nbt4z5Kz2AwQIvoSKNFhzjtbSpZJBdMO2AfePKthZZvhCRJy23/3BbACufM+WGxs9hWf1RHzz8EXQ+NhWRiKz5YBEWRdYYNBfw0URj7byJ5Q+sRmRhfPoH0wWLD02vEi0bXfM06DujGjDN7ySS7uuRejndaRwSjkTjjU1hl56rMwv7YelgysV2dVQ/5sZp5cwqeY1WJxOnY4s0Tr4D4cze48fEZW8QzPRD+o+Cc+2Yeim2WYXi38WWsZoVbkXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4n6I0BB86WHJv6mAAWYsEW4H4vtBdmyekamcbhG46cM=;
 b=eKTPP/9eLbHy4GqCmcKGoZkdik7WnoOkUkLnRbGD2pjhsH9vGxYEaJ0QZBJy56Dw/R3RV9TqeutfGwCgaj+MgohB30t9ukzE57g9l8nu84F1SWi8WoF2hW8rot5/vgUmx758duM6p0uW++I8KW49kL54tXZwhpwfuRuIVBBAEAI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com (2603:10b6:a03:2d9::22)
 by BYAPR11MB2615.namprd11.prod.outlook.com (2603:10b6:a02:c3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Tue, 25 May
 2021 18:25:15 +0000
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::7037:7346:6da2:e8cb]) by SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::7037:7346:6da2:e8cb%7]) with mapi id 15.20.4150.027; Tue, 25 May 2021
 18:25:14 +0000
From: "Stefan Ghinea" <stefan.ghinea@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] thunar: fix CVE-2021-32563
Date: Tue, 25 May 2021 21:24:58 +0300
Message-Id: <20210525182458.20957-1-stefan.ghinea@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [89.137.231.29]
X-ClientProxiedBy: VI1P195CA0067.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::20) To SJ0PR11MB4989.namprd11.prod.outlook.com
 (2603:10b6:a03:2d9::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (89.137.231.29) by VI1P195CA0067.EURP195.PROD.OUTLOOK.COM (2603:10a6:802:59::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend Transport; Tue, 25 May 2021 18:25:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72a5ba61-0a58-4e93-c495-08d91faa7043
X-MS-TrafficTypeDiagnostic: BYAPR11MB2615:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB26158968C45B05BEFA287AC4F2259@BYAPR11MB2615.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:363;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	60FYAa+yVA6aYiZWdEjS3Jr8E5d3g9CjIHM0cHRaThqTtk6FUZGyWvcYCCkjurwS8XL8WRNx1LDSIzkjNMKDFqcr4AR2JlHrXVCY9+FO1tCqzj5SfDxawebxszHfuJ84UFO+tNG1w/Re2D+5ykCsbEgUFAdCn9PdOxombl1eKM4LBHFowKrKs3Shjs1KjOpy8z9Ola15H1HLLrfqGx0CRG21REVmRQH4mXP+P260C7cQ/fHKiNy7rxxWHu4qYEmOwaBOulDoXOViQBRxP1KI1YaEsW99zIhzZ7ifK4w3Ut8ij4cIkBVBd9+JQeUDXsuKp/zk9GcO+se148HyyHFBQm22rYQVbGXZXpEwRinoDlc6Oem+iJdUNXlHwuImpwgLZBqRmlQz0HckghNzhEHRT5NrfAc9j1ilNdvRRgDmfQAUGyrsgYeF7gjgq8fpPxD1zwHtphqUwg1mYzEheI1YrTyuax8ZKuPENvfnxN6Y8N9jBAAHxTfp6Snv2Wc7tR/+nyswb74xrbtxgJigSUswo1bSha9Bl1pirapHfzrIKze+m1lyV6mq2dRnPQ0uhyTevLfP3dSgsIsCcIWh9TpWaf8hvjV/bmuwF6grV1iLVTeuAYfc0Ptc1+ETQsvjHrLCRntW1js8Q3SoGmuyXtrrcE0KcIHeoYGBBmQupwgO5X99LSSSGDe4arnjgLZHQajaEIpbcdjVlT00IpakZXKTgCtrhuvFMxCGvrnih47ejOGfeomIqW/Qns+byvqOui3Hher3LLguvFubgRHG41SFYqJv3flXr0kq5hz8zYS2KgULEoJU0PaFhBqvbpJZMbtU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4989.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(346002)(396003)(39840400004)(30864003)(66574015)(2906002)(66946007)(5660300002)(6916009)(966005)(186003)(36756003)(6666004)(956004)(2616005)(1076003)(16526019)(44832011)(83380400001)(66556008)(316002)(38100700002)(6486002)(26005)(8936002)(6506007)(478600001)(38350700002)(8676002)(6512007)(66476007)(86362001)(52116002)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?ZFIb26XiBNAvENL94zULgRvmMfS+mY9Zz1WVE/icyA2Bw5kI3B3F4xvlUxlz?=
 =?us-ascii?Q?ukQeK98iCIFL2C68jxm4yGvcVGCoYPmtPaOOn7MvnpoteFECvWl1tdmaDSzX?=
 =?us-ascii?Q?TuUZ8FmnHDNOsTW+63sNeR2ZhRXbp/hFp5RsvTiCalu/a/C+8vqZhMRdlZt7?=
 =?us-ascii?Q?gxXgAHM1SACI2JndySKuWtbm+2fTkI0T5kZ0Rm0Alz3UhqW+IeNEcOaw8zSU?=
 =?us-ascii?Q?2FzF3Ej5iEGkdabkd9Rfc0HgS5l7Z6kE5DOFWs6AyZBZMNTJZArdnt9u8uKc?=
 =?us-ascii?Q?8l1kgxTPabNxbiVpzq/pblVXhcdZl1Yo2w0P+1zt4OMSyv9sH3Ijd2wNpH1Q?=
 =?us-ascii?Q?irzio2xQKW/DMhbfJokuhu30Afd29lctu8pIoPZx4lhaw0ozy2eu9xOrVjF9?=
 =?us-ascii?Q?/CIUHqpMoFO0rrstn90FccD5Y0P/NowjiG++JkXecEaAnc9yH3RnI0qEElUD?=
 =?us-ascii?Q?GGlh3xMCAgpNTBZNEcPMxgfAi0YOigyXSqGGx6yuqWxoVwh5b4TNNKVhjPtz?=
 =?us-ascii?Q?1Pe2kVvUsM1lGvUGodV/bvm6sGUEkCj4roPhCDxaeTQ/HHPkgXoLUN8Uk4zF?=
 =?us-ascii?Q?FLmoVoGaKd41DyUqxGRzvsdMBZz1YDWrCAxRfgRTqnR2ftM53PMm3nSUYs+G?=
 =?us-ascii?Q?IZ9eE5FyPzI+IJsMdOOTkGWyvLRzLW17eias+actI4eoBOOjrQ7+wYMupmDZ?=
 =?us-ascii?Q?C+yva20hbzdLbWxK3B3h/tLpCNzeutPehQhDwc7pMbsh034Sd1w0vPsGVWWG?=
 =?us-ascii?Q?+YxB2sg7cjKlD7gfZcdM2nmbRRTuStwDSoGRdY0DHc7zbVidpcUj8qosfLpQ?=
 =?us-ascii?Q?R2PaEA90w4FJi+jxndHiflsmx2A0woDZqClc+61cjoNBwpI9c+9BMcO0xBkg?=
 =?us-ascii?Q?l9CxYNsh71cuoxMJEKBCX1yNCnYfg9qzUwMUT74cP5mu5Rim68p4w3sv7pUK?=
 =?us-ascii?Q?B5+sfPcdklKmNBZ4Iz0nnJ+d6AWJjV1e8TJXGh40bVpbi/tXkd8rlikBnvks?=
 =?us-ascii?Q?BAfxvTjotEFsgBXR1Xx/rQ/eKF4achr3HEbMQ+Y+TAv9BonaS2b0CqJD3e6W?=
 =?us-ascii?Q?WOWel5VBKq7sFTuKCWRVCiDwLKXr/U+Y4y3qxL0/Anf38bAjiFxZtqmSLWEj?=
 =?us-ascii?Q?LsXwi2cvM+ki6qtMJLd5GoxMRq1KHC80EWOAZa8hU+bLASNWplEmqBQ9W2Sw?=
 =?us-ascii?Q?glvZ3T3eVSv9W3vviFcpz9l7BCG9+RQbv88qMguuX+XMISFqM8hA6qB51NJg?=
 =?us-ascii?Q?/5PLMHHfmSeGIRfDIldvPzuPmilIps6VTUvmzCYGkfCRUyzHLrtQz8VZ3nWF?=
 =?us-ascii?Q?rZUrr4KvzbOKFcbr+07BC7Wz?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72a5ba61-0a58-4e93-c495-08d91faa7043
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4989.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 18:25:14.1152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TmpKm4NZdcWzAv/VZbnowp7SxInMutgCAa7K1PFJrAPHrkODJowJkvjkALPPes9x9CTJ2lxw0njzTxPWGtxoV3n1pZUFJgusS3yi+Mk6k/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2615
X-Proofpoint-ORIG-GUID: hd-Z79tPmUnq964Er7ymFwMF5ZQV_F_B
X-Proofpoint-GUID: hd-Z79tPmUnq964Er7ymFwMF5ZQV_F_B
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-25_08:2021-05-25,2021-05-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 clxscore=1011 malwarescore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105250112
Content-Type: text/plain

An issue was discovered in Thunar before 4.16.7 and 4.17.x before 4.17.2.
When called with a regular file as a command-line argument, it delegates
to a different program (based on the file type) without user confirmation.
This could be used to achieve code execution.

References:
https://nvd.nist.gov/vuln/detail/CVE-2021-32563

Upstream patches:
https://gitlab.xfce.org/xfce/thunar/-/commit/9165a61f95e43cc0b5abf9b98eee2818a0191e0b
https://gitlab.xfce.org/xfce/thunar/-/commit/3b54d9d7dbd7fd16235e2141c43a7f18718f5664

Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
---
 .../thunar/thunar/CVE-2021-32563-1.patch      |  97 ++++++++
 .../thunar/thunar/CVE-2021-32563-2.patch      | 208 ++++++++++++++++++
 .../recipes-xfce/thunar/thunar_4.16.6.bb      |   4 +
 3 files changed, 309 insertions(+)
 create mode 100644 meta-xfce/recipes-xfce/thunar/thunar/CVE-2021-32563-1.patch
 create mode 100644 meta-xfce/recipes-xfce/thunar/thunar/CVE-2021-32563-2.patch

diff --git a/meta-xfce/recipes-xfce/thunar/thunar/CVE-2021-32563-1.patch b/meta-xfce/recipes-xfce/thunar/thunar/CVE-2021-32563-1.patch
new file mode 100644
index 000000000..f942f990b
--- /dev/null
+++ b/meta-xfce/recipes-xfce/thunar/thunar/CVE-2021-32563-1.patch
@@ -0,0 +1,97 @@
+From 9165a61f95e43cc0b5abf9b98eee2818a0191e0b Mon Sep 17 00:00:00 2001
+From: Alexander Schwinn <alexxcons@xfce.org>
+Date: Sat, 1 May 2021 00:40:44 +0200
+Subject: [PATCH 1/2] Dont execute files, passed via command line due to
+ security risks
+
+Instead open the containing folder and select the file.
+
+Fixes #121
+
+Upstream-Status: Backport
+CVE: CVE-2021-32563
+
+Reference to upstream patch:
+[https://gitlab.xfce.org/xfce/thunar/-/commit/9165a61f95e43cc0b5abf9b98eee2818a0191e0b]
+
+Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
+---
+ thunar/thunar-application.c | 25 +++++++++++++++++++++++--
+ thunar/thunar-window.c      |  4 +---
+ thunar/thunar-window.h      |  2 ++
+ 3 files changed, 26 insertions(+), 5 deletions(-)
+
+diff --git a/thunar/thunar-application.c b/thunar/thunar-application.c
+index df862fd..1243940 100644
+--- a/thunar/thunar-application.c
++++ b/thunar/thunar-application.c
+@@ -1512,8 +1512,29 @@ thunar_application_process_files_finish (ThunarBrowser *browser,
+     }
+   else
+     {
+-      /* try to open the file or directory */
+-      thunar_file_launch (target_file, screen, startup_id, &error);
++      if (thunar_file_is_directory (file))
++        {
++          thunar_application_open_window (application, file, screen, startup_id, FALSE);
++        }
++      else
++        {
++          /* Note that for security reasons we do not execute files passed via command line */
++          /* Lets rather open the containing directory and select the file */
++          ThunarFile *parent = thunar_file_get_parent (file, NULL);
++
++          if (G_LIKELY (parent != NULL))
++            {
++              GList* files = NULL;
++              GtkWidget *window;
++
++              window = thunar_application_open_window (application, parent, screen, startup_id, FALSE);
++              g_object_unref (parent);
++
++              files = g_list_append (files, thunar_file_get_file (file));
++              thunar_window_select_files (THUNAR_WINDOW (window), files);
++              g_list_free (files);
++            }
++        }
+ 
+       /* remove the file from the list */
+       application->files_to_launch = g_list_delete_link (application->files_to_launch,
+diff --git a/thunar/thunar-window.c b/thunar/thunar-window.c
+index b330a87..b234fd3 100644
+--- a/thunar/thunar-window.c
++++ b/thunar/thunar-window.c
+@@ -243,8 +243,6 @@ static void      thunar_window_update_go_menu             (ThunarWindow
+                                                            GtkWidget              *menu);
+ static void      thunar_window_update_help_menu           (ThunarWindow           *window,
+                                                            GtkWidget              *menu);
+-static void      thunar_window_select_files               (ThunarWindow           *window,
+-                                                           GList                  *path_list);
+ static void      thunar_window_binding_create             (ThunarWindow           *window,
+                                                            gpointer                src_object,
+                                                            const gchar            *src_prop,
+@@ -891,7 +889,7 @@ thunar_window_screen_changed (GtkWidget *widget,
+  *
+  * Visually selects the files, given by the list
+  **/
+-static void
++void
+ thunar_window_select_files (ThunarWindow *window,
+                             GList        *files_to_selected)
+ {
+diff --git a/thunar/thunar-window.h b/thunar/thunar-window.h
+index 9cbcc85..3c1aad2 100644
+--- a/thunar/thunar-window.h
++++ b/thunar/thunar-window.h
+@@ -126,6 +126,8 @@ void                      thunar_window_redirect_menu_tooltips_to_statusbar (Thu
+                                                                              GtkMenu             *menu);
+ const XfceGtkActionEntry* thunar_window_get_action_entry                    (ThunarWindow        *window,
+                                                                              ThunarWindowAction   action);
++ void                     thunar_window_select_files                        (ThunarWindow         *window,
++                                                                             GList                *path_list);
+ G_END_DECLS;
+ 
+ #endif /* !__THUNAR_WINDOW_H__ */
+-- 
+2.17.1
+
diff --git a/meta-xfce/recipes-xfce/thunar/thunar/CVE-2021-32563-2.patch b/meta-xfce/recipes-xfce/thunar/thunar/CVE-2021-32563-2.patch
new file mode 100644
index 000000000..a22cdc6d8
--- /dev/null
+++ b/meta-xfce/recipes-xfce/thunar/thunar/CVE-2021-32563-2.patch
@@ -0,0 +1,208 @@
+From 3b54d9d7dbd7fd16235e2141c43a7f18718f5664 Mon Sep 17 00:00:00 2001
+From: Alexander Schwinn <alexxcons@xfce.org>
+Date: Fri, 7 May 2021 15:21:27 +0200
+Subject: [PATCH 2/2] Regression: Activating Desktop Icon does not Use Default
+ Application (Issue #575)
+
+- Introduced by 9165a61f (Dont execute files, passed via command line
+due to security risks)
+- Now via DBus files are executed, and via CLI, files are just selected
+
+Fixes #575
+
+Upstream-Status: Backport
+CVE: CVE-2021-32563
+
+Reference to upstream patch:
+[https://gitlab.xfce.org/xfce/thunar/-/commit/3b54d9d7dbd7fd16235e2141c43a7f18718f5664]
+
+Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
+---
+ thunar/thunar-application.c  | 68 +++++++++++++++++++++---------------
+ thunar/thunar-application.h  |  9 ++++-
+ thunar/thunar-dbus-service.c |  2 +-
+ 3 files changed, 49 insertions(+), 30 deletions(-)
+
+diff --git a/thunar/thunar-application.c b/thunar/thunar-application.c
+index 1243940..53d0b23 100644
+--- a/thunar/thunar-application.c
++++ b/thunar/thunar-application.c
+@@ -182,37 +182,38 @@ struct _ThunarApplicationClass
+ 
+ struct _ThunarApplication
+ {
+-  GtkApplication         __parent__;
++  GtkApplication                 __parent__;
+ 
+-  ThunarSessionClient   *session_client;
++  ThunarSessionClient            *session_client;
+ 
+-  ThunarPreferences     *preferences;
+-  GtkWidget             *progress_dialog;
++  ThunarPreferences              *preferences;
++  GtkWidget                      *progress_dialog;
+ 
+-  ThunarThumbnailCache  *thumbnail_cache;
+-  ThunarThumbnailer     *thumbnailer;
++  ThunarThumbnailCache           *thumbnail_cache;
++  ThunarThumbnailer              *thumbnailer;
+ 
+-  ThunarDBusService     *dbus_service;
++  ThunarDBusService              *dbus_service;
+ 
+-  gboolean               daemon;
++  gboolean                        daemon;
+ 
+-  guint                  accel_map_save_id;
+-  GtkAccelMap           *accel_map;
++  guint                           accel_map_save_id;
++  GtkAccelMap                    *accel_map;
+ 
+-  guint                  show_dialogs_timer_id;
++  guint                           show_dialogs_timer_id;
+ 
+ #ifdef HAVE_GUDEV
+-  GUdevClient           *udev_client;
++  GUdevClient                    *udev_client;
+ 
+-  GSList                *volman_udis;
+-  guint                  volman_idle_id;
+-  guint                  volman_watch_id;
++  GSList                         *volman_udis;
++  guint                           volman_idle_id;
++  guint                           volman_watch_id;
+ #endif
+ 
+-  GList                 *files_to_launch;
++  GList                          *files_to_launch;
++  ThunarApplicationProcessAction  process_file_action;
+ 
+-  guint                  dbus_owner_id_xfce;
+-  guint                  dbus_owner_id_fdo;
++  guint                           dbus_owner_id_xfce;
++  guint                           dbus_owner_id_fdo;
+ };
+ 
+ 
+@@ -279,6 +280,7 @@ thunar_application_init (ThunarApplication *application)
+    * in the primary instance anyways */
+ 
+   application->files_to_launch = NULL;
++  application->process_file_action = THUNAR_APPLICATION_SELECT_FILES;
+   application->progress_dialog = NULL;
+   application->preferences     = NULL;
+ 
+@@ -531,7 +533,7 @@ thunar_application_command_line (GApplication            *gapp,
+     }
+   else if (filenames != NULL)
+     {
+-      if (!thunar_application_process_filenames (application, cwd, filenames, NULL, NULL, &error))
++      if (!thunar_application_process_filenames (application, cwd, filenames, NULL, NULL, &error, THUNAR_APPLICATION_SELECT_FILES))
+         {
+           /* we failed to process the filenames or the bulk rename failed */
+           g_application_command_line_printerr (command_line, "Thunar: %s\n", error->message);
+@@ -539,7 +541,7 @@ thunar_application_command_line (GApplication            *gapp,
+     }
+   else if (!daemon)
+     {
+-      if (!thunar_application_process_filenames (application, cwd, cwd_list, NULL, NULL, &error))
++      if (!thunar_application_process_filenames (application, cwd, cwd_list, NULL, NULL, &error, THUNAR_APPLICATION_SELECT_FILES))
+         {
+           /* we failed to process the filenames or the bulk rename failed */
+           g_application_command_line_printerr (command_line, "Thunar: %s\n", error->message);
+@@ -1512,7 +1514,12 @@ thunar_application_process_files_finish (ThunarBrowser *browser,
+     }
+   else
+     {
+-      if (thunar_file_is_directory (file))
++      if (application->process_file_action == THUNAR_APPLICATION_LAUNCH_FILES)
++        {
++          /* try to launch the file / open the directory */
++          thunar_file_launch (target_file, screen, startup_id, &error);
++        }
++      else if (thunar_file_is_directory (file))
+         {
+           thunar_application_open_window (application, file, screen, startup_id, FALSE);
+         }
+@@ -1603,18 +1610,20 @@ thunar_application_process_files (ThunarApplication *application)
+  * @startup_id        : startup id to finish startup notification and properly focus the
+  *                      window when focus stealing is enabled or %NULL.
+  * @error             : return location for errors or %NULL.
++ * @action            : action to invoke on the files
+  *
+  * Tells @application to process the given @filenames and launch them appropriately.
+  *
+  * Return value: %TRUE on success, %FALSE if @error is set.
+  **/
+ gboolean
+-thunar_application_process_filenames (ThunarApplication *application,
+-                                      const gchar       *working_directory,
+-                                      gchar            **filenames,
+-                                      GdkScreen         *screen,
+-                                      const gchar       *startup_id,
+-                                      GError           **error)
++thunar_application_process_filenames (ThunarApplication               *application,
++                                      const gchar                     *working_directory,
++                                      gchar                          **filenames,
++                                      GdkScreen                       *screen,
++                                      const gchar                     *startup_id,
++                                      GError                         **error,
++                                      ThunarApplicationProcessAction   action)
+ {
+   ThunarFile *file;
+   GError     *derror = NULL;
+@@ -1686,7 +1695,10 @@ thunar_application_process_filenames (ThunarApplication *application,
+ 
+   /* start processing files if we have any to launch */
+   if (application->files_to_launch != NULL)
+-    thunar_application_process_files (application);
++    {
++      application->process_file_action = action;
++      thunar_application_process_files (application);
++    }
+ 
+   /* free the file list */
+   g_list_free (file_list);
+diff --git a/thunar/thunar-application.h b/thunar/thunar-application.h
+index 547cb70..8c180e8 100644
+--- a/thunar/thunar-application.h
++++ b/thunar/thunar-application.h
+@@ -31,6 +31,12 @@ G_BEGIN_DECLS;
+ typedef struct _ThunarApplicationClass ThunarApplicationClass;
+ typedef struct _ThunarApplication      ThunarApplication;
+ 
++typedef enum
++{
++  THUNAR_APPLICATION_LAUNCH_FILES,
++  THUNAR_APPLICATION_SELECT_FILES
++} ThunarApplicationProcessAction;
++
+ #define THUNAR_TYPE_APPLICATION             (thunar_application_get_type ())
+ #define THUNAR_APPLICATION(obj)             (G_TYPE_CHECK_INSTANCE_CAST ((obj), THUNAR_TYPE_APPLICATION, ThunarApplication))
+ #define THUNAR_APPLICATION_CLASS(klass)     (G_TYPE_CHECK_CLASS_CAST ((klass), THUNAR_TYPE_APPLICATION, ThunarApplicationClass))
+@@ -74,7 +80,8 @@ gboolean              thunar_application_process_filenames          (ThunarAppli
+                                                                      gchar            **filenames,
+                                                                      GdkScreen         *screen,
+                                                                      const gchar       *startup_id,
+-                                                                     GError           **error);
++                                                                     GError           **error,
++                                                                     ThunarApplicationProcessAction action);
+ 
+ void                  thunar_application_rename_file                (ThunarApplication *application,
+                                                                      ThunarFile        *file,
+diff --git a/thunar/thunar-dbus-service.c b/thunar/thunar-dbus-service.c
+index 2d27642..4205a2b 100644
+--- a/thunar/thunar-dbus-service.c
++++ b/thunar/thunar-dbus-service.c
+@@ -991,7 +991,7 @@ thunar_dbus_service_launch_files (ThunarDBusFileManager  *object,
+     {
+       /* let the application process the filenames */
+       application = thunar_application_get ();
+-      thunar_application_process_filenames (application, working_directory, filenames, screen, startup_id, &error);
++      thunar_application_process_filenames (application, working_directory, filenames, screen, startup_id, &error, THUNAR_APPLICATION_LAUNCH_FILES);
+       g_object_unref (G_OBJECT (application));
+ 
+       /* release the screen */
+-- 
+2.17.1
+
diff --git a/meta-xfce/recipes-xfce/thunar/thunar_4.16.6.bb b/meta-xfce/recipes-xfce/thunar/thunar_4.16.6.bb
index 128043d19..7bef08ed9 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_4.16.6.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_4.16.6.bb
@@ -8,6 +8,10 @@ inherit xfce gobject-introspection features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
+SRC_URI += "file://CVE-2021-32563-1.patch \
+            file://CVE-2021-32563-2.patch \
+           "
+
 SRC_URI[sha256sum] = "cb531d3fe67196a43ca04979ef271ece7858bbc80c15b0ee4323c1252a1a02b7"
 
 PACKAGECONFIG ??= ""
-- 
2.17.1

