Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C56CA106FD9A
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 07:30:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10677.1773387002020273424
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Mar 2026 00:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CvytiypL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7532e9d984=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D4b19u4081760
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 00:30:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=lb9vfypDsiPVGYG52Iz2
	8VKkGXCBGOEpMoyMa6uE8Ms=; b=CvytiypLWxuytiCVL1pVggb9NNg391xz4vR3
	8AvOwmPFvT4RFxA2pFUk9Cu9sJx4Ki98SUhv5ivnVI1scUS6K/XOgvxEVlTBbBKJ
	UP1NipNtMrnbE8bB11GZOBOib+VTVPI1m6E69LjmnR8xjOljnRGUlCdarXIHfDGY
	c5j+Iol9sbhEItHo1kLOa26wVxgp8UQ8yppZe2ub2nKHVR4dKv3HVjxYMTQDwfEG
	l1RuVgkwq07NBOnPbJ8Hwjy8Ibhnx/Jntf6MfKxPFXH5Wl7K9PlgMYCPpgkuX83b
	UvGNMmML6hvol625Sb0wD8KYrUgnwtZF0DV6DNPiqt91kstbVA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010035.outbound.protection.outlook.com [40.93.198.35])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh6pstfn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 00:30:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mPNuNPL0iKrvlkjCCYIZ41p7U1HQlp9zI4Nnh4BuYXEbf26corJnyQri7pRf+VqRAkaLBJWuGunT1B2kdmFbi8joUH/YRfHJv7/h3Exd6uEyqJg2FitFtzo+s9QiEmmP+r4ZAkcC6ujCB2OLFbHHsU1l87mIDCT3jTT30pESk7iM4ZLWHY8DRr0+FHyxNuAZRtfj6nwDXajfP0+cV/WYSmQiN/+iXPNdFFRSvcbVnau2gVh0vso7WkU3fbEH+2uI3wURVlYF8Dm5sKRoMh2YLe2lGMrhgmqmygBA7OonRHuYqa8zjJCCfKJoWQriNWwakWzlmTLgeJere3vvA4Z5Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lb9vfypDsiPVGYG52Iz28VKkGXCBGOEpMoyMa6uE8Ms=;
 b=ipT7DvfWKZUzFKD9e2uN26aJ6WjN/zuP6VcwfnlGZhpL0W42E0VQAvteK2+MsD7Lp00rxs7bVLAuevkqmEfUI3bb/lbhuf+hzDATBI3VXptr9xHAFyJYLQKuBnchZFqrUporTAWCUMLkMDzFCvXFH/t03qtruX9RsyDrHcpEgdeaFcbTohGMZPVmRuGMecp87Uhp4uzy+pM/4uKbNpNnJjL1PkIbU/FvLE1IGM511B3/bpKzhaY52u6crxbnSPmZ+a/Z7CP2NsRPak8h5Ihx9imD/TeTM5sGctbgU5+XNpkBF8hB6X8RcPlWhx5YtqriO0GJ+KZj4ky0cxnZo0b7uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MN2PR11MB4645.namprd11.prod.outlook.com (2603:10b6:208:269::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Fri, 13 Mar
 2026 07:29:58 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9700.009; Fri, 13 Mar 2026
 07:29:58 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/4] unixodbc: upgrade from 2.3.12 to 2.3.14
Date: Fri, 13 Mar 2026 00:29:45 -0700
Message-ID: <20260313072948.2254502-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0123.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::8) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MN2PR11MB4645:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a9fb210-de47-4188-a277-08de80d25449
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	ZPl12eduslc4Pvqn01kEB+M60DRwe3RNzxqBUvpVsOZ953JVS4EIGRf0XtmQ0pDPIph/v447VLlB7rwqqob6B2Xe0QPLz6Nc4duu1BV/4s7kmKKluIcl37Uw7r6koMr0Wdzojp+ccB02F3T7DoriZlTiljg52nBLcjWCyr08eSxIWywNJTyLJGNothdCJHIoZ1FmWzoa8gaidSeSa92WhW0uIFEF6e2vYCx2nQ53nlkB8awM6w8FrPqLvti06308zdjrryxVCE4AbC9rpHku0JpYLjc1qIOUVUQxXJtd4PtiKS9yVTap0gwv9SwhKqaah1bvvpn9SXSd9c3ncqY6PHIyIj3VzEMZMMFAo5Zk8dp4dGi0mQ58fUjJblSwQHWaQotYR1rclW1AdHK4qtvVibabAiiyrlc8TtlkdofyWHNUm83cpY1s99SVkLvCHnTZgDcWucboyoUr9kUiuAsuBB7BUGeLorZPZIGjzm4Lfi7YUXUJ/tVslRtvoZaAWNq1Vzom79ez7DaO0nio4nOE8JUgKgqNRWcGQW5aZgwKwqhFlVo7L2kOItwUEryaunuAyK2gGgc/dIp0ivCXeSivUybwLKCNvU7ygCwrO8LmKhTRVwh9LlhWyFwwu7aMfCIMt72OfCztTMovkE5885M4YK57PvXxjQinF5vEw4HNIU8WAQ/PTi80xTVGLEx/sm4JX64WB+vBSSwY4uJ4oklFwjN8u+5jVpFmsC9a/r0MnI0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wp26W1wxZIwl9NHQl6dD4wOHTeNE9WjfaTstnvPrBhLbUzfJ6yPyGSjXd/Vt?=
 =?us-ascii?Q?DXaF1EvQFlpAtbvX5MsPt1RrcMaTFbKRAyQ1J38IQcOnlu9RYBgMeGsZLu1g?=
 =?us-ascii?Q?hiBp9G8mw7kNQ/2JyHqJMxRtiSIsUEJvcBSuSpGgHKIGGsKJ0uqTBjGro7VJ?=
 =?us-ascii?Q?ZtXZMNwR3a2pp1igtMZ5hu8QQzz2Xrg/TceyQkQIy80oX8zpzSZubnRfYJ0C?=
 =?us-ascii?Q?ko3uZ4M3lnSZ/Mmy4AEiRQDLRu/BFTNzwd6kBdRqqFP7H9F5aao3zZDSnREH?=
 =?us-ascii?Q?YZqqJS0FvRiAvTC6nJmPLQwE62VglMjH35cA5zltMmeRdZNpAylbjg6fDm5n?=
 =?us-ascii?Q?RvTVgp6CaxqBubQxDO7w7XIaGjZA9xdD3Rbi0md2wTBAnvbTUDC9ETW1gJUY?=
 =?us-ascii?Q?QMnvy97h8WLhSVnUhrRBqPMDpxQ/gTD+EOFKVnwjThZU863A1qg5Xz9AWApY?=
 =?us-ascii?Q?aPx3Y/ges6tUiQc4La0nBaYaIsc6xrasbXnZjGMoH4Ujq4FPdFUaETShNTxl?=
 =?us-ascii?Q?7fJHye8Z04ow8QxNvu0rJUujDWZv4hP9jxJLWZvgZmaybzax3s/uc00wmsD4?=
 =?us-ascii?Q?N0ZnjnQ4VGj1XtZXWk6drjaUfwJNbvvpUiApy4ZuVrAO6lf7CAgZ2st/m5/H?=
 =?us-ascii?Q?2nTjXu51b8jE5Y1WkuJbl9vgURVIiV+LBMF5e2DrB+C2DglUvQJ86kOx44HV?=
 =?us-ascii?Q?ckXreUfIMFES7qxbdDjcxSiEFhFB2ny+/vd1zdwS/ZPnNoDGzplwx38bn4Kw?=
 =?us-ascii?Q?OwnjrqJb/yhDsSmC4WP4b9kY8v6VTtXMKzZwy9i+DvSE2K4YOSEL20HRQLEs?=
 =?us-ascii?Q?JNgqyMaApyDIQInMkKkjSypX9SmA2kR1eC23x+cxZ+aJtqkU/ZCeP3BToWGp?=
 =?us-ascii?Q?FI2XG9M8Z+hUkYBW9usa+0PbPKdS64XGgq7NLblTz9rrVXqRHA661hgNqlPC?=
 =?us-ascii?Q?jFgoJs5Q337j2bsLgG/ohvqQtcI9Lg77etdWSpWktBF6tYHtg/5/+2B49iv/?=
 =?us-ascii?Q?6nyspxEAZKcvJDIBouS3S/OmcOSGueqL4oahFC7B5kdsUwbB9tW1KJQ64Zx4?=
 =?us-ascii?Q?EiM5MPDAkPOEN12ISJRVnRv5k4Wq7LY9gRU5XjCPlIIjbq1eUu6cP+1cxR1z?=
 =?us-ascii?Q?JVhzUDargA43n8F9px4RBkELcSctUpqKcFvz1e//v8kypArjvgWgJahQhytX?=
 =?us-ascii?Q?o1gJ2AZ6JgyMHAj5ikrHGe8SGhI+p3/+0vK+0tWJb3fpPLh5UjiXqLlvtQ8/?=
 =?us-ascii?Q?ROARTSRr8YmM5/K4aNBqe+fRHSQX/Q+vgRl23Rn/tM8pxCFpMX3uOEjCxGr2?=
 =?us-ascii?Q?dHP0LqeTHTTD1FMRuOsAs3/kCgIZQijBa3dQXBchNqdTtzbSBVRPyQo1JpN8?=
 =?us-ascii?Q?JgD2EJFAFj9IsLjKwoh3j34Tvy+e/13qILGqfVZzir5FlJv/SPRETvnU5tCR?=
 =?us-ascii?Q?pivh93Lp+Q9GrKiewWmuQoBZszrMx7yXHHNcI2+ELnAq9A6kSyM9ebXFXzP+?=
 =?us-ascii?Q?KsD6v7lrg2Gis6UsKAG1NrV16p1bhH6kd6516ph3suTg2aAcPytZnBWFFgp4?=
 =?us-ascii?Q?nuzYd7HXzR1zlLyBNWUW6SbtudMA0fjTOOiUVLmc+gMuen093mgvywpN2fis?=
 =?us-ascii?Q?9oFgBp0hjWUcrsesw41TowEqXT63DT22AHpspmqqxlxDWtHisnzczbuhNky3?=
 =?us-ascii?Q?jueKN2cJiS+w0LGQAhVjSPjJo8WZo4CfsYqH1/7q/RI9uJMiX8/oAtd2Y9lb?=
 =?us-ascii?Q?C7rsyf3cWw=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	FzCrKTnYDvcfQzqxUMPRmLHrmpwmozCHdyGwaCwPIdF1C8UmjlNAmSaO6mPsATL7rarPG3pnasWA1eu73IV8HmFhysfktrabcFYrXHFnJ8xwvBzOwCPL7bb610/E7w9grJwQfmIpYw+/WEa6nJOPl8c3FkhXV5R3QLqnG3/3LlPjQbNdpP0ddhcYN7uOnu0GTTPAzUK9lbXVEx4wChQQtUKTT4BRSb9NN97oZiTXnhtRe6nMZ7OGyYRjPvH9OLcKRwGW1uDFDPW5nsLFllUwS+zbXlJSxqhT4AjKmTIepRH6RGYQTzHJMviAqW+mIJ+nLeahYXQp9Uy2oW6VaVBGdg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a9fb210-de47-4188-a277-08de80d25449
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 07:29:58.0156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ygUZaDRysuFKRyr+XEuUtX0xKGk75bNI+zdo7vTFpLHIuQInMIjUQkm002Xgqk/FaECTp3ucZbIB0Y3nVoDjUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4645
X-Authority-Analysis: v=2.4 cv=ePAeTXp1 c=1 sm=1 tr=0 ts=69b3bcf9 cx=c_pps
 a=WVTIIPXEjO/6WBYygohQVQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=OGsvooznAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=mkHrBcZMAAAA:8 a=aNXNN12ZspBKV4olFLYA:9
 a=_MKx33s3DjsVgJzmPKfz:22 a=FdTzh2GWekK77mhwV6Dw:22 a=1kRi9TBWcLYPZ6U7oU-V:22
X-Proofpoint-ORIG-GUID: OCAxecGlRVrbx493k-Pw5E6ySihfGp4x
X-Proofpoint-GUID: OCAxecGlRVrbx493k-Pw5E6ySihfGp4x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1OSBTYWx0ZWRfX4YFATEZ6WFP/
 YFi4UdL4YLi1ja2a9qq6I2UV6pHo6XEnLGrxP9t/VnEp1Koepj54nC1n5js5w2LFQaw5d1ClGuR
 /T7EWrfHwtxz2h/pLZ4AgZpgGs7aPbQCTbfDLrlWNnQMHUa8oTbUHjoiRJu7EM6vqG7MTUVdevE
 wZSY39Darosn54yi5+xsn/j7TfVclEuCDW1Wu6hDaP2Gu5kPPSQcDbZAmmFnBj1RsBWmjk+lmzm
 68nZ1VduxqkR072NbMHWosaeU2whwYhstLA88646O0xaQG0tM6irouRtQcyg2E3O4IdjMvD54Is
 OQLqvEZTnVASRNqLFJNg4b9kN331/nDHkotd83/lc5MiCynJQaZmE8tOwWBDdgQkVdQWTDYuPOE
 xEZnsnkLH9vw1aq348mF1TjkH9cAkO93Kn5ze7HWscjrvz0VNQj+vpO4DhEbqIUFN2O9dZhzXMk
 LclQ/SrJnPGJafOqyxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130059
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 07:30:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125182

From: Chen Qi <Qi.Chen@windriver.com>

The following two patches are dropped as they have already been
in the new version:
- 0001-exe-Makefile.am-add-CROSS_LAUNCHER-to-run-odbc_confi.patch
- CVE-2024-1013.patch

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...add-CROSS_LAUNCHER-to-run-odbc_confi.patch | 54 -------------------
 .../unixodbc/files/CVE-2024-1013.patch        | 53 ------------------
 ...{unixodbc_2.3.12.bb => unixodbc_2.3.14.bb} |  4 +-
 3 files changed, 1 insertion(+), 110 deletions(-)
 delete mode 100644 meta-oe/recipes-support/unixodbc/files/0001-exe-Makefile.am-add-CROSS_LAUNCHER-to-run-odbc_confi.patch
 delete mode 100644 meta-oe/recipes-support/unixodbc/files/CVE-2024-1013.patch
 rename meta-oe/recipes-support/unixodbc/{unixodbc_2.3.12.bb => unixodbc_2.3.14.bb} (87%)

diff --git a/meta-oe/recipes-support/unixodbc/files/0001-exe-Makefile.am-add-CROSS_LAUNCHER-to-run-odbc_confi.patch b/meta-oe/recipes-support/unixodbc/files/0001-exe-Makefile.am-add-CROSS_LAUNCHER-to-run-odbc_confi.patch
deleted file mode 100644
index c763a9feb6..0000000000
--- a/meta-oe/recipes-support/unixodbc/files/0001-exe-Makefile.am-add-CROSS_LAUNCHER-to-run-odbc_confi.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From e886222c70d4b251f0785f670477b7aee938e5af Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Wed, 21 Feb 2024 13:55:41 +0800
-Subject: [PATCH] exe/Makefile.am: add CROSS_LAUNCHER to run odbc_config
-
-In case of cross compilation, the odbc_config cannot run, the error message
-would be like below:
-
-  /bin/bash: line 1: ../exe/odbc_config: cannot execute binary file: Exec format error
-
-Add CROSS_LAUNCHER to allow the possibility of running odbc_config correctly in
-case of cross compilation.
-
-For example, here's a possible value for it (Yocto project environment, aarch64 target).
-  export CROSS_LAUNCHER="PSEUDO_UNLOAD=1 qemu-aarch64 -r 5.15 \
-  -L /PATH/TO/unixodbc/2.3.11/recipe-sysroot \
-  -E LD_LIBRARY_PATH=/PATH/TO/unixodbc/2.3.11/recipe-sysroot//usr/lib:/PATH/TO/unixodbc/2.3.11/recipe-sysroot//usr/lib  "
-
-Other projects can use the launcher they like to allow correct generation of
-the odbc.pc file in cross compilation environment.
-
-Upstream-Status: Submitted [Personal Email, nick.gorham@easysoft.com]
-
-As said in the official website, https://www.unixodbc.org/, the way to report bug and send
-out patch is via personal email. So there's a public link above.
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- exe/Makefile.am | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/exe/Makefile.am b/exe/Makefile.am
-index 03f3d5a..5f33cf2 100644
---- a/exe/Makefile.am
-+++ b/exe/Makefile.am
-@@ -59,11 +59,13 @@ slencheck_SOURCES = slencheck.c
- dltest_DEPENDENCIES = $(LTDLDEPS)
- dltest_LDADD = $(LIBLTDL)
- 
-+CROSS_LAUNCHER ?= ""
-+
- all-am:
--	@sed "s![@]ODBC_ULEN[@]!`$(top_builddir)/exe/odbc_config$(EXEEXT) --ulen`!" \
-+	@sed "s![@]ODBC_ULEN[@]!`$(CROSS_LAUNCHER)$(top_builddir)/exe/odbc_config$(EXEEXT) --ulen`!" \
- 	  $(top_builddir)/DriverManager/odbc.pc > $(top_builddir)/exe/odbc.pc.tmp
- 	@mv -f $(top_builddir)/exe/odbc.pc.tmp $(top_builddir)/DriverManager/odbc.pc
--	@sed "s![@]ODBC_CFLAGS[@]!`$(top_builddir)/exe/odbc_config$(EXEEXT) --cflags | sed 's/ -I.*//'`!" \
-+	@sed "s![@]ODBC_CFLAGS[@]!`$(CROSS_LAUNCHER)$(top_builddir)/exe/odbc_config$(EXEEXT) --cflags | sed 's/ -I.*//'`!" \
- 	  $(top_builddir)/DriverManager/odbc.pc > $(top_builddir)/exe/odbc.pc.tmp
- 	@mv -f $(top_builddir)/exe/odbc.pc.tmp $(top_builddir)/DriverManager/odbc.pc
- 
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/unixodbc/files/CVE-2024-1013.patch b/meta-oe/recipes-support/unixodbc/files/CVE-2024-1013.patch
deleted file mode 100644
index 6884465452..0000000000
--- a/meta-oe/recipes-support/unixodbc/files/CVE-2024-1013.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 76beb0938ef14276123996bfd99df23b0c7f0982 Mon Sep 17 00:00:00 2001
-From: Soumya Sambu <soumya.sambu@windriver.com>
-Date: Fri, 7 Jun 2024 11:10:46 +0000
-Subject: [PATCH] PostgreSQL driver: Fix incompatible pointer-to-integer types
-
-These result in out-of-bounds stack writes on 64-bit architectures
-(caller has 4 bytes, callee writes 8 bytes), and seem to have gone
-unnoticed on little-endian architectures (although big-endian
-architectures must be broken).
-
-This change is required to avoid a build failure with GCC 14.
-
-CVE: CVE-2024-1013
-
-Upstream-Status: Backport [https://github.com/lurcher/unixODBC/commit/45f501e1be2db6b017cc242c79bfb9de32b332a1]
-
-Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
----
- Drivers/Postgre7.1/info.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/Drivers/Postgre7.1/info.c b/Drivers/Postgre7.1/info.c
-index 63ac91f..2216ecd 100644
---- a/Drivers/Postgre7.1/info.c
-+++ b/Drivers/Postgre7.1/info.c
-@@ -1779,14 +1779,14 @@ char *table_name;
- char index_name[MAX_INFO_STRING];
- short fields_vector[8];
- char isunique[10], isclustered[10];
--SDWORD index_name_len, fields_vector_len;
-+SQLLEN index_name_len, fields_vector_len;
- TupleNode *row;
- int i;
- HSTMT hcol_stmt;
- StatementClass *col_stmt, *indx_stmt;
- char column_name[MAX_INFO_STRING], relhasrules[MAX_INFO_STRING];
- char **column_names = 0;
--Int4 column_name_len;
-+SQLLEN column_name_len;
- int total_columns = 0;
- char error = TRUE;
- ConnInfo *ci;
-@@ -2136,7 +2136,7 @@ HSTMT htbl_stmt;
- StatementClass *tbl_stmt;
- char tables_query[STD_STATEMENT_LEN];
- char attname[MAX_INFO_STRING];
--SDWORD attname_len;
-+SQLLEN attname_len;
- char pktab[MAX_TABLE_LEN + 1];
- Int2 result_cols;
-
---
-2.40.0
diff --git a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.14.bb
similarity index 87%
rename from meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb
rename to meta-oe/recipes-support/unixodbc/unixodbc_2.3.14.bb
index 389c3be903..6f26f7b174 100644
--- a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb
+++ b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.14.bb
@@ -10,10 +10,8 @@ DEPENDS = "libtool readline"
 
 SRC_URI = "https://www.unixodbc.org/unixODBC-${PV}.tar.gz \
            file://do-not-use-libltdl-source-directory.patch \
-           file://0001-exe-Makefile.am-add-CROSS_LAUNCHER-to-run-odbc_confi.patch \
-           file://CVE-2024-1013.patch \
 "
-SRC_URI[sha256sum] = "f210501445ce21bf607ba51ef8c125e10e22dffdffec377646462df5f01915ec"
+SRC_URI[sha256sum] = "4e2814de3e01fc30b0b9f75e83bb5aba91ab0384ee951286504bb70205524771"
 
 UPSTREAM_CHECK_URI = "https://www.unixodbc.org/download.html"
 UPSTREAM_CHECK_REGEX = "unixODBC-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.49.0


