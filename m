Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 301ADD5E127
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 03:52:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5365.1731037919622436192
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Nov 2024 19:51:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1042324eef=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A83nEsI019497
	for <openembedded-devel@lists.openembedded.org>; Fri, 8 Nov 2024 03:51:59 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42s6g5g788-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 08 Nov 2024 03:51:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ag0B+xkad1uQOAzBGx8z7y0dUHoRDG638OEWifa5cVu8lxKRs/fpbkD8IqccZv+JMEA4IwgSnbNgxIWemexr+pJ4O9gBvjESUrGL8BXKJs1viPFmgRFXcD/Qp8C+/oazgDYlui7O+x1QfpSr/M4JhlH/dd5BnNfyHW3CGbY+jcNYaDO7b1L5qqI5uCJW5+vmlxlu0EXt8b5KYzjjPTP+CBpFEKa87G6CvfHN77YTnK/s9ZnS72QW1smJbX/xZt2ItoXOmoZE8Q8YQNnd41XYxDz/JMJYrRQeysd0qc0X4Xvffnuq2Nwig+e/sDaLvYXHvG1HfJqEGzKWWZsIkWoqmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTatxzw82wDLCJhjY3R3BqEAlwCVj7Wd8l431nH3GSc=;
 b=RyXzbRPGwteSPFxRMxJ4SGRb/A+3T3ABcCKTtNjCcqWBMCZyXK6GYfsurUya5VNXtxGHO/4vdgofsdtoBK+d/YM9UsGf0/cyGAUZvDRbvMbwlalJLNWPUgMcyzlDuHSC4LKCLs+j5brM2nZfXrChUsCt5IoMIcEtZu9SFl1tANI4t2g/TrW51u/sKpmAn2nejnhYTM08pmmdYRUA1o1EX23uumjJgsphL7M//nyNqI9cvvaOCnZ0ruO1Nx7ATqVt3I84ycdwqptpv303Yt9tX62tBgSC4BTHd/3bcQAry9lo+zdc+CpR26xGLSEDKsxZ5nvwE+dtfqruF5PMPsQ5Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA1PR11MB6918.namprd11.prod.outlook.com (2603:10b6:806:2bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 03:51:55 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 03:51:55 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-gnome][PATCH 4/4] gnome-boxes: require opengl distro feature
Date: Thu,  7 Nov 2024 19:51:43 -0800
Message-Id: <20241108035143.2214659-4-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241108035143.2214659-1-Qi.Chen@windriver.com>
References: <20241108035143.2214659-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:a03:254::16) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA1PR11MB6918:EE_
X-MS-Office365-Filtering-Correlation-Id: 63d6a02e-3dcb-4621-1f0e-08dcffa8af86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jUBVbhjHpldtLK2uf4y2iwfkiDOhPO00lj848vwH0GQCapuHj19IjyBHlqLz?=
 =?us-ascii?Q?Nd2+tmk/1oC5fzOQQM6k0UFP4ZPlEZxGyzRx8XUNrOX83z95tW3gk8S4z7QN?=
 =?us-ascii?Q?mGAWTTSDNsjr95WamtwA+0AvUW1DJeLunckJKdR/Hy/xBfYNLyrJ7VyQb9q0?=
 =?us-ascii?Q?+/hwT+RKzfC7FxTayJcCQ0VogUkykoySOtt7FGrxf0Yx/u/jVP22hwVodRqH?=
 =?us-ascii?Q?zz8iISLrN4hb6aEz5drLkZlsapelS94UKR2246eJhMGj4Lw+db2u7D1Uthln?=
 =?us-ascii?Q?PWtuIER6T/sJQ7uJnvlCHmY8XF8O7DW/ekTQyMXxgK4uHMv12q8udfjUOFrh?=
 =?us-ascii?Q?zUqR7gU/NxNCnlR3LBS7xumTd3jJJkFGILpfGinBReGYcZQhx/JlDGb0ne3c?=
 =?us-ascii?Q?SplhTxY4cei87ez9N52ATzWkRZETpyHXVeUZdNnFrUNRJ9XeqsryAfAB/vsC?=
 =?us-ascii?Q?supNI7sBh3weMr3znWhAKz2+BLSu/99xdwtXWcUK7IK+YxqBiCny1XBWZKNy?=
 =?us-ascii?Q?RouuzK9omqEI6T2EMgBgDjC3hTt9S4VL1fDjtbH899on7FD2+McGSAizPCAK?=
 =?us-ascii?Q?vgUdssxCk3IP0/wmiJNojvCgJiazVBCaGf6eexALHmpWA3ow8y1wQh+iwZAq?=
 =?us-ascii?Q?IZwRddZb83CjpznPSs4Rnl7UxTxM8KpaeqxkHuGMB7eM6Ntwotwd4vI4SuoH?=
 =?us-ascii?Q?kyYhnq0KFd94hcIHoK6O6r/wkJ8lfmFr+QLf9a71qQqRP8P3xFSrIJ7wA1fr?=
 =?us-ascii?Q?33U7N9Suw9BYMQty2tlZw4AbU7L3uLImtIIkPDmGUC/u5LJS7enDeIHbVCeO?=
 =?us-ascii?Q?5aRNiyo3sHY+k9NbKRuj37+9zcanSWMGnUqrkmAgfpk81ou8yzsygvf49p+2?=
 =?us-ascii?Q?J3p0MuogZgF1yQrN1JJIzCZAoWUKOhgUPDIxyInPvJNZKUXejbqRhznh+uZT?=
 =?us-ascii?Q?kD+yvuXUqhqfFdEJZWa0ICpotnSxhDMAzVLwf+K/xIhB6DU60QaGiAhw2IzT?=
 =?us-ascii?Q?VKxdKbXq9iEp1Bx5VfClSHwNrAcXiYUx1+QWZZnW9DJgfdtV+TocGZl8cgn7?=
 =?us-ascii?Q?Haao+uhNnpG3VKcV4F0gHxuktVgWexF46BupQQ+4O3Lx0N4rzWzwjKJ73R5q?=
 =?us-ascii?Q?QIYI4xsHOGgO7J5A8YILkIgjzdn9h31ZjJoltPViUd+vve9EuJO7VHtEasmU?=
 =?us-ascii?Q?j5/MgR5H2LmZXNQtjVpQ1H8G89Oy+PRgMUzEn9lRaKQw4km5QFkToREtjg4U?=
 =?us-ascii?Q?Cv0L2a0iDAt+KRN3A803zPrLbgChEyqpi4NxVgyHtp20Id2TbKSABygZF+WO?=
 =?us-ascii?Q?5j9F7+3S15i7s0d7j6WoEVKKTKjPzpn7YqaHIrJS4j0cDSxxneFeGMSj8AtE?=
 =?us-ascii?Q?TbYdHxY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kVpfG6zSVk/7AvMG6vUrlmkYEX2ma2dOY9nYfZIQwRnBX+uY8nN25FkvsNS6?=
 =?us-ascii?Q?GElT2D+9PWrjqAKgT+t2qEsvKfggpY0CUnVP6WUm+H3eTdEChpA47fTbXHCg?=
 =?us-ascii?Q?6wMoBHgEZprOx5EnXGLOrw7FQmLsBUUmmvcTx+IS1/oI+ACaYTQkhEn+7lY/?=
 =?us-ascii?Q?Hqjv3T9TKxj3HNxaiXBMqhQczbERenF61bW1MoEOjdkrTMqBxXhRzUsUa/l0?=
 =?us-ascii?Q?9fP7hbsk/SDjw0xuOCj6RN50XpSK3fNekWc8R9evHkKN/eJoeGEJ3fNxs9lM?=
 =?us-ascii?Q?uP4jLvvxIJ0LJ5ozOQeDqv1Xj1U0N1qdvKYCElXdAc6Zco0OzosWi11g2DSx?=
 =?us-ascii?Q?6nJ4CtXH8bHxHgKqPlmlVGLVIw/O2Bl6Kl8JLVvCaj04jtR+2m96RoxZOGrF?=
 =?us-ascii?Q?tyQP8N4XVpjR9bmEl1HQ5DY+uwU7utlHBPkHGgP/pzR1iQGS9uIAhzfTisIQ?=
 =?us-ascii?Q?BtQax/MoQCCUajKT3NdZ0ahVloC/QtC8SLtD8moCOIjcEHmGmkw3i9ayVE35?=
 =?us-ascii?Q?fQFytowWg0g0SOcpT6Uizu7K8b0rdOD87nzaVqnwfU9UZDCt6dFTQeNfPPGg?=
 =?us-ascii?Q?7e+5513Muh0O/VMIBDE/aDrX2KLI01uVfNZ56hpIzKZkgMSv7NgxoY6X55ne?=
 =?us-ascii?Q?ynj7joRE6IgUyt467BpayxHNRXkhhfSYenA1oHY3aIjuj1C8bdb/pAOX6+rl?=
 =?us-ascii?Q?f/RDac8aJS+VK6RU9tNI/8tnnS+fZre3lIUqrUp8X4iKzGbOtg98ngzgMroP?=
 =?us-ascii?Q?bvkWXiav+8Spsxnychor+0xr0GBGkRNWoOm1Y/KK0QuXcbQVvCEeJ8Yg3q+I?=
 =?us-ascii?Q?UpyLYbAPAVuPTvsMM++OhA1UJ3aLuXXyQBOb85Y3o3WeIwOV/M4p8kRsPKFv?=
 =?us-ascii?Q?rQBEvOcvVGe1Q4/LR3DyszQGZO4whBRbNvqNel6wtb9x3KMUEK7bKwrxYlLa?=
 =?us-ascii?Q?bCwARieRIvzAfY5pYYEPV5DAnHr98ehrxnLuagw7dFYqhoEqWiiJWmK0Qw/n?=
 =?us-ascii?Q?cYB9DsDqPiTlYeIX9WX+rtNidCraiHyAjL05kxJi65IItvznp4X83SnZebGs?=
 =?us-ascii?Q?8uvgNkb+CC+V6IMWOUXsG7Ps+68R5NVI7hXA6PFHxYvMTzKAbB/MNGuPRrjQ?=
 =?us-ascii?Q?DhBvr87WtrHN6M1sHxueBRapy32voqFUT4mRHJTrFLx6lHTktZoaN9wpf/a1?=
 =?us-ascii?Q?Zjl/WeQ3ybNXMINZoWvNhVY9mAlCwqkIHtGXOwtwMFpo5xWda6608qOdSF5O?=
 =?us-ascii?Q?C1tp6h+ThmWgVRKdoku0E0QF0oepkq5b8nX+90sEsrVkkiO4ozYiB2XVw70Q?=
 =?us-ascii?Q?0T4q6KeykZem23OLNXy+K9PurbeKlWleTeYB3X2d0r7PfkAla6vSea4RVL1S?=
 =?us-ascii?Q?P8L3Veef7DDG7T9CtP7RsNlrHDAXg4X4brYCVK6zBiHWcZfXtkeRQ2TnIcLj?=
 =?us-ascii?Q?K8FvrfZV33UFjGLaYF7AWwT0k6RG2z2ioW7e0fRaPLMwX7R0TIi/9XqB7cm/?=
 =?us-ascii?Q?H6plEPadyvpIwimiD8i8QxoTQ7WXuvagJeAmJLJAJQV5ippoxkxjS1ogmQN8?=
 =?us-ascii?Q?VypRPFdVKkGzpbF8akaxbQZOPhkxb/pyG+cG+nwCkdpar+9RxqBLLkZhrPPC?=
 =?us-ascii?Q?qw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63d6a02e-3dcb-4621-1f0e-08dcffa8af86
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 03:51:54.5425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gCXoth0y3DubvmYRFZLzQiCKcAZ+oDF4NrIJKe4v2nvQD9GVIohiJnY+5Nj7AEJBayUxFtxPwIuXxaBZYP2tDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6918
X-Proofpoint-GUID: elgpvgJ9JRcPc7i2fgJ6DbZsYs4JsECT
X-Authority-Analysis: v=2.4 cv=JoCjr94C c=1 sm=1 tr=0 ts=672d8ade cx=c_pps a=H8RDR50mQ1szzU+C1Tr1+Q==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=1FEWDv0GHpNdgRvbwgEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: elgpvgJ9JRcPc7i2fgJ6DbZsYs4JsECT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-08_02,2024-11-07_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=656 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411080031
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Nov 2024 03:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113763

From: Chen Qi <Qi.Chen@windriver.com>

spice-gtk requires opengl distro feature, so gnome-boxes should
require it too.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-gnome/gnome-boxes/gnome-boxes_47.0.bb              | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-boxes/gnome-boxes_47.0.bb b/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-boxes/gnome-boxes_47.0.bb
index fca055d39..4787651a9 100644
--- a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-boxes/gnome-boxes_47.0.bb
+++ b/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-boxes/gnome-boxes_47.0.bb
@@ -5,7 +5,8 @@ LIC_FILES_CHKSUM = "file://copyright;md5=a65e9b0c9f78617732f09f68fc4ef79a"
 
 GNOMEBASEBUILDCLASS = "meson"
 
-REQUIRED_DISTRO_FEATURES += "gobject-introspection-data"
+# reason for opengl: spice-gtk requires opengl
+REQUIRED_DISTRO_FEATURES += "gobject-introspection-data opengl"
 
 DEPENDS = " \
   glib-2.0 \
-- 
2.25.1


