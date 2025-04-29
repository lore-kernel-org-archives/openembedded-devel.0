Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 368DFC369DC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 23:50:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5089.1745970621742036933
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Apr 2025 16:50:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7214951ce6=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TNRbDL002741
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 16:50:21 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2047.outbound.protection.outlook.com [104.47.70.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46b6ugg3jp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 16:50:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F7LCv0SHd4gfRLTOepipskzBY7yxAj7rDLdH186oboFZ/kn7MxN55aNaaBSkv0uUtYzqdFUPQoS2q8gRwCCYgt/PxZCUvaLEss43JsyOQV2xb5SLmUySXHx9KF3c3NZICvjxNkSm8P5O6Yg8Xyq3n+Hsva/2QpXU+EGcnuOJn6Z8A+g7eWNVIzF6KujN2+tM2MS5JwQ22nAg6JkEwb7Gpz/TpD3T2K1oXuNQF52ZedeAOL6aEOgypTxDpesb/t0kDi4RJ6fdt6PD/a4d48bBQYcXygmSTLakM8ncMf3WYlcCSE0ynalBKvssQkzwkKBtpal+8th56EQ/IO6pelkKaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SfKGehORfPlKagzN2db5a+F46GoA5YPgjEVOn2RQ2uQ=;
 b=n9sKR+/ji6Tpie+Y0vn62WoTST0XDtduQAMH6gwokGYctu5mHLN+zwwCxXwXfD/URPBVjGnYU8kJDAPvuoNTyOV0m5LkW54FPVSCAfPXs0DU1SSBqM8PHz83Fzoa9oEm1TNchHUi1Xs59IN26f6YUKcImkPD8bE+Ul2nN6UvvBj8XU70YSwuGIfkzNOg/FGIgOV+poehgvFtU+Qq3GHxjGLcJRyzRv7MMzxsIIcaLqWGz6i8VC0idPOfvKTtoW2zjTPqmr854zOwi+KVw0sWhe9rsdtwsPWIwOg0x6vKjVO0jHXGss0ipiaj5r1b+QQn7U/BU79LHk4MCgbndnWLGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ0PR11MB4880.namprd11.prod.outlook.com (2603:10b6:a03:2af::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.35; Tue, 29 Apr
 2025 23:50:16 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 23:50:16 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libmbim: upgrade 1.30.0 -> 1.32.0
Date: Wed, 30 Apr 2025 07:50:01 +0800
Message-Id: <20250429235001.512184-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0029.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::8) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ0PR11MB4880:EE_
X-MS-Office365-Filtering-Correlation-Id: b4d68abb-9396-4dac-0062-08dd8778973b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GwvS3KwQ1dNQYhljwtS2AaoJEd9DgeKFVN5i2sncn/tjZHBY6xm6n1lWwyvX?=
 =?us-ascii?Q?ZUNybM5U72XfwRoi5Q2tFfi1rfdW7cA4wD0whM2+QBTgHuSK6TMMK/45DYb3?=
 =?us-ascii?Q?jii2dlRSvS89SuxCk+zhyT7HUGYt2xLoPON4xpysviINGDgXMe/01cYVOYBc?=
 =?us-ascii?Q?vJ34b3m57BqvLtiMU843tO4w4jATnYb8DfoGMAZWRNzreVPAi32Irc54mYUb?=
 =?us-ascii?Q?Kd3GfTGx4KONiOXw0IDa4XgPQ8WbESDJF9qwRvMuYaN6CcyCuA5uiR6B9qTu?=
 =?us-ascii?Q?rXcHt9np8F9BTg4I+1HqU0qBbtVuvN8Jv3CyNQm4JOe9DJU3HvYI+VM+Kbaf?=
 =?us-ascii?Q?2Z7d+lVqMsj9PK28NlbIICpR2mKdiymywNudn4biihSE2R7GXsCZ6eNPWV8n?=
 =?us-ascii?Q?TPOfqpLPZXAy3OLxpQiSwOqteNHtyFhLFZVPOdFrBduJ+XhPHjOPEKQWzraz?=
 =?us-ascii?Q?dxFM2SBEy6M64Rb+ShxUV0KIjEeSqZKxniY8hwlg2FHufsJ48kB84HhRe9ar?=
 =?us-ascii?Q?228DoAdHQzH8xC8pG0nUCmMvp5V8qWcAbP4Obpv3xwUMcb/EGr1n5xfHa7eJ?=
 =?us-ascii?Q?H76U/wBmrsz3jqo0ks7xo/qCLTYOvCNTvbU2YfWg+Te/ZyXk/1lTru8thAa5?=
 =?us-ascii?Q?HsHdWaonrUSKcbp4NX9gBnItb0yXLnWSprHARnkKERxnJvYdzOoOLvilpUP4?=
 =?us-ascii?Q?55UvPIZb/VcHlKKtT4P1upTVRXvtNmnm/o+JpXn39K4fbkxonIw4vazmWEaI?=
 =?us-ascii?Q?dZHdVP8MNNjk3XwDW0iLso7bR263AasdhLzOLw62F/QJUYBc3oA3x73Sd2bL?=
 =?us-ascii?Q?snjMtX9+/owl+GwJvRQv8ttT9g8TcQxqKdXepOua6sTu7z5z/UdXJrMI8QTt?=
 =?us-ascii?Q?elCrbWrvL8XFGJ6FQZ1NjfoEo2toW2Xf3bmzm0lWZXh+Nw2bkHHNfrrSeuHa?=
 =?us-ascii?Q?AFRCQEWmUqhHa6NbLNAQqDFEXmFuI69VLv8c+t3Jy67jwyVTQiZ/vbP/n0TU?=
 =?us-ascii?Q?qflE+6sKG+2IONvSDp/G7n1bWBuBQwI7d8/YWbLK4ndmQhXfC0zrhjgkOQa4?=
 =?us-ascii?Q?cCLVN4UcIS3Zb/2XC9RpEDoXYge/1QvBGYbRZhRiori8Dt1ot/9E1yp3TBBk?=
 =?us-ascii?Q?zzY6MycQ5xYSblgj6Psp5ACNVtowEKGTzwhuAu8Xcnj961tXxGI5LEGbiTUI?=
 =?us-ascii?Q?K4vC3nPIkc++Rj+RoOvIlfnXkQBuW0LwTBh32FjkvK2ayGcqXfR+6rqc1FsN?=
 =?us-ascii?Q?TQAKt4IZMORsD+ZMrdiXstQf4H+1WIkzn/GxpUX7vD3XIkDxtNSG/MYWZftP?=
 =?us-ascii?Q?21MJA5G3Y/runfNC2aKsEq6+sliNfA/P/r5i3UCB4z4KRv/Id2e9JxE8HmsY?=
 =?us-ascii?Q?yyTFl4tKw9q3MfBHewqZFlmEcB2cos/OV2KQQHgtmRxPkUj06OjDs7j9rAMy?=
 =?us-ascii?Q?IZ9Nr2ooHSo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eYqJeVJKguI2ByUZuHPjSHuSh7qlrdrwb/oH/UCUWAtBodI6M6Oq/28tHm2z?=
 =?us-ascii?Q?7ttvcGZnc1WenRawnGQw+7PE8Yilobvmu8g5oKlWBV7ynp8mZi+Ln4jKvMzK?=
 =?us-ascii?Q?2zDZnEL8YsFVTXgGGqHsiXNQy3lMltq2U+VW6HuMubYDMtJ4eZtCMeZnook2?=
 =?us-ascii?Q?NVKeY4aCgootzPOYYVHeL+jtKMfPp8tjGT7Dwny8itUYedl2l5b5NmK2qAG4?=
 =?us-ascii?Q?hIFSVWDqz2/UUGvZusqg1wSwS8gawaqJf+6U5R04jeY+yzhViIgYCq0LEr/3?=
 =?us-ascii?Q?jyPWY7WGgKobcntT+SDe+VvInZn4Bh79owulw+BxRum4kbr12ShstEbeXYJS?=
 =?us-ascii?Q?iIMptZlfP+xUti2X6NjYP5b5aYswltBCBMX2OcS0m9aSqx3Jiu8EfrsGzgHL?=
 =?us-ascii?Q?Qw5jmKdmiKwr+5VME48L+wRyCn/+7oGEA2FYgeTcvXqFfdxQTHc3WBQL7lDt?=
 =?us-ascii?Q?qOksEIuHYwVvlLBd47tCI7Teo+BGWnrXhzX4sUxazlEKzkVSMrLcKHTdt47f?=
 =?us-ascii?Q?sfOOK324eOR0Bt7vvrnV5M8ic5D+HJG3umVQSCErhBYFGqAKvpItw7ACG4KN?=
 =?us-ascii?Q?gBk/sbscHRoWb1/vSL1M3Npy7YKr5Ca7IkIergEhXbtxH3jP6SFUq9pzubI2?=
 =?us-ascii?Q?TrtIALFKDYT3kPIxYS/77gKGNPshf4IGj+FhN/LN5FNo9hQINWSuH3cBiJgx?=
 =?us-ascii?Q?C4iFfUm37fYtZ6VP47MigDjz50Flu6OZOKTuA6We0jDmZ+rzH5zVD5cWLMiw?=
 =?us-ascii?Q?aXwUOsc+NyrVpdXnBt4yaU3c1AITR1MhUf4cKA8Kj3rjjfnPZTvIPTvICjey?=
 =?us-ascii?Q?c2QkBeDlY5wIXYxDzH58KEJR6PfHHeXr7ys/+cmPlVltfSEwfoyQP8Q+WX2t?=
 =?us-ascii?Q?p0s1VvABnisyowjwdP9iRUvNnScQo8B2J85M7ybxsgN1DcvRoW8SktFxNRoR?=
 =?us-ascii?Q?/RqRdSpqaqPLd/a/GuOKayWp0aEw5zp5CwnBnMQjFeHHGtffJcTMJTV3hbtn?=
 =?us-ascii?Q?VVSPj8W1+IANzcbWcBt7NZ9tX9u6kVAtNbkE960GAgmW2mDrldjOybUohZSe?=
 =?us-ascii?Q?6ZKVm5+iLMYgTqLi+7oZid0Wzq4P2RAFJ2zyxv9Y1IFP4KMSsdnswdvZlLNF?=
 =?us-ascii?Q?IbafRhuTaBgSX13TTmChYmKEwmo+XYcygkg8lvf6t6rbAR71ekMNURHQMQkE?=
 =?us-ascii?Q?XUjJSjyiwVGjHma1latebOaq8F5Cq0JjHSfm70olVeFm/jmrJJFO4daoWFzX?=
 =?us-ascii?Q?Qdyhd5WIPjWunxbrcIZZaHnM67z996Y9EBHNUMFAimz0VHQ95103JOyCGuBK?=
 =?us-ascii?Q?ssfUy0mBksHilbu0QpikLUVsa7aj3+GJx6457Xbefq6XKf0DSUwBERRuIarl?=
 =?us-ascii?Q?X2YWJSXRCuXrEDOCU61PrtmfsdSAUYKu3HimVR3CE1W3LoeRXyX0URxMC+MI?=
 =?us-ascii?Q?SEuYIQXjV0uGxQni5VKoPSAPVF0nFSaf3xkmnv3sFJS+QO6z9/uDRpEhVd7S?=
 =?us-ascii?Q?Z9T369PsrDotQbFi+Xe4pwaGB1jxaP6W8T4hSkQKjH3HedbnMw4gz3Gj4eUN?=
 =?us-ascii?Q?4Tzl6z8bWk/N/h8y7AUFXnyIKZSVdZlr8ocTGlY9?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4d68abb-9396-4dac-0062-08dd8778973b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:50:16.3309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DYJFqPy4CmZ5b9cCvDUJuRdj39K4/J7bUXm8e3X2AHeig1ON83zLdu+K+hKYCIeYelr9SY91xoO0y7mexj0dXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4880
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDE3NyBTYWx0ZWRfXzrtGxBWY9LjO 11ezPHfbXgO112UmGz/nIC/SXTzPmQaAbtzb/Yqm3W11xKJ60Pn0FKAcH+su8ffT0y0smygfAXc QFRzlVHOHX7i6Aby0vaVlGLuZwEzf1CoSQwr5iUfhOICqoJpKvHh/Clbb+I2MKKvtRdbW7tl4Ed
 eyw69+MpSXekYBs9ZI/asdN7sfTYWlhcbYW8yNhgFiTmr32OGhGGSJEsylHVBs34q/d2quakZlU UFZ1EAzVcKIt35iJ6sJbC3pKt6KQHIdfYv9uYt1HPGTK4cGJm8rkUAGifYRAr4bkkp0X4ITlZ9B OqGvCnztGf+54oNumWXXRiExjAq09qagC/PxFjHrp3sfGri3rgb5O690pMQP70DF2KR++fp1PTc
 Arwws4Bi0/OPOuD4vwvtKfyFxxkW0xkYjzKORouI3O2HhXmWkHmLOKprUJ+nZYYyM//nWLDU
X-Proofpoint-GUID: eJ-d_18sBGIWF8gvGHm3Dzn34_kcMIYO
X-Authority-Analysis: v=2.4 cv=MKNgmNZl c=1 sm=1 tr=0 ts=681165bd cx=c_pps a=l9lnEPKonMfu/vbXsUzXcw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=Wju0kPImnSGmx7RAKAoA:9 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: eJ-d_18sBGIWF8gvGHm3Dzn34_kcMIYO
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504290177
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 23:50:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117245

ChangeLog:
https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/blob/1.32.0/NEWS

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libmbim/{libmbim_1.30.0.bb => libmbim_1.32.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libmbim/{libmbim_1.30.0.bb => libmbim_1.32.0.bb} (90%)

diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.30.0.bb b/meta-oe/recipes-connectivity/libmbim/libmbim_1.32.0.bb
similarity index 90%
rename from meta-oe/recipes-connectivity/libmbim/libmbim_1.30.0.bb
rename to meta-oe/recipes-connectivity/libmbim/libmbim_1.32.0.bb
index a227124498..5cc4f804ba 100644
--- a/meta-oe/recipes-connectivity/libmbim/libmbim_1.30.0.bb
+++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.32.0.bb
@@ -11,8 +11,8 @@ DEPENDS = "glib-2.0 glib-2.0-native libgudev"
 
 inherit meson pkgconfig bash-completion gobject-introspection upstream-version-is-even
 
-SRCREV = "8415687e4f30ae5e36f407f179c8147f1529725c"
-SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/libmbim.git;protocol=https;branch=mbim-1-30"
+SRCREV = "2bc1080292aae30000e808ec77d7a99b87eb3553"
+SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/libmbim.git;protocol=https;branch=mbim-1-32"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


