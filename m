Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 284AAC369A2
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 04:31:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.26931.1744259513266871049
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Apr 2025 21:31:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61957cd107=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A2eWpE008530
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 04:31:52 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tug8pce7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 04:31:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EQcoN07WkMcNN0qFfiIQ/0AWlPy98F8Luxmg80rLx99+WRsfXHilKoIfY8aQF1dT9I0KYx0VLZhPUvpp9ZLtWTO7944ucanF7hfXPT4VvOFDZ0YrZHPaZ+z83fqIcskAr2VKSGiqRiXbQVZerTd4AdwuBKQbfx/pUapfa31+zXB3Tklvns7BL3+7LvXPTBogDhwzhERftnGYSB8mK6OEO7j1j/9HJZj31pIWXhxSlzEuteMqIUFkicK4RgYaY0qf4tawErKJA3cvZLA5l7gHQaL0kthFD3amLoSxxqoIM0ds885+Rfo8kOPpY8pyvBd0OjRDjWimBp5YHLGajuZWCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMGINEyg9h5nfIiNuDO6FnwTH/4aH+7+RKQ2k/UccSU=;
 b=PINcoHiHizpjM7f+M/ajFFSalBOPtUZ3l/euS5o8q3p1AP5SesYxLea30979Nths21CD38awjOyxrAxiBxI8UlDVNiMTjR/uAxEY9YaHOmOUohCfMgJFpgAyxD15ShJQdV6ptkKZYDOsU2q2DQgR7nD7KAFV+NsNk6F6Y0VHreDIjK5L1pswTa1ZYuz7FF5P9sD4qohN+j9ujOUG23zoGkfpV9OjwoW3HISnyAtrZidfWu/7krgRucPUV//bU4nAk+pasIGLSmTI+iszuvi8cY5qbXVv50fmiCAGEfEqyUm5i/5rrJtlaioeZDlHZ6qBUN+XHwumWbaCP4BmDHerVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by LV8PR11MB8724.namprd11.prod.outlook.com (2603:10b6:408:1fd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Thu, 10 Apr
 2025 04:31:49 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 04:31:49 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][PATCH V2 2/2] waf-samba.bbclass: adapt to qemu.bbclass refactoring
Date: Wed,  9 Apr 2025 21:31:39 -0700
Message-ID: <20250410043139.1132665-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410043139.1132665-1-Qi.Chen@windriver.com>
References: <20250410043139.1132665-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0350.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::25) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|LV8PR11MB8724:EE_
X-MS-Office365-Filtering-Correlation-Id: c0f99b54-7cfa-434c-40af-08dd77e89bbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MnYamK3LIvDbaxdn6UHIgMUAMpXsYTTG2FPlz0D8Gt1xi9uLA6ajFQkfTSLp?=
 =?us-ascii?Q?gmUHCShaJ2AQCDCsi8qSTSRryyHQRVsz77ep1655hFu0wNEj16+G0BMzuerY?=
 =?us-ascii?Q?h4PpAVYrWP3cdp9x2qgwN5EDKEITN3GVGikVPy+WfZaF5OZF7+GCu/WRSZCT?=
 =?us-ascii?Q?z3Y38ABKAxo7PZWBicwD/cJHmtblulpvQb5iw5SWpjmClD8rzcr9brxSDzPU?=
 =?us-ascii?Q?pXtrEaBgBR6CD0ArSY4yqbw0wCjF2cxk91abK4XhT1LVaJxRKfBhfhH1Yg2s?=
 =?us-ascii?Q?EQzBCldXmyqDRVZvEwjZMZ6e0Y74ZVW7QUvwVPOBOocYUC6CigQLsCGA9GmE?=
 =?us-ascii?Q?Yig0bxPqAZCh2CqpTsaQTK113aUMSc1x/HP7vYR1ZtNVjJce8vE8xvAYR072?=
 =?us-ascii?Q?VphxrnBN6shKSnU/DorcIEAcNT14/EBnqFmmklL4nkcj7pMVW/fTTcxYJflf?=
 =?us-ascii?Q?BL86/ZQu3X3D8VTuBsUrckruh09GcBOJdoPWeainA+OmAvmKLZiW2n+c5lxA?=
 =?us-ascii?Q?WMQD9ZNJeXvnJi+B+aEKCMpxvvRPMHzLxqMp+xFGEl2SyySvovMzJ4aF2nCy?=
 =?us-ascii?Q?ZZ9+RnCHUgSJm4Q3nEgmCQYfveY1Drqps56j4L+xR5G5Cf1RoAvynm1maZ85?=
 =?us-ascii?Q?asPKNM7ClCpcPVpCixg7mgXwyCTTDTBVvKILC+VFsVrVnpZqrvpE3ohO5NOn?=
 =?us-ascii?Q?SlDGjC1e/fvwRAjBDxUR6YeKn3GCCvuMxXbMtxXoTiK+9pJ5R14yhqzLDoh+?=
 =?us-ascii?Q?LeAjM7oiFpUVprSyWdOPwlfwI059VlAVFEwjAGrRHwUEPC5NgROpIrLSfE/t?=
 =?us-ascii?Q?qz2ya1rP8jEGuK2iD/t2ES7jm9rCFOvtlIBZyg9yrITMkR/tR3rD3Bw1JE1s?=
 =?us-ascii?Q?vN/jUdh/RZazBRdJWWiJGOBxkKja1v6k4Yv7+4UC1wElA+Rdhgh1G2N6QYiE?=
 =?us-ascii?Q?1TaE4KW0FZfYwjJ9x+uN3vKqOgrbWOExEWqwYIsW/unnSccTW+A1MOoZ6ZCo?=
 =?us-ascii?Q?lQ94eV9fdrKlR3Xtdv4aOKJO5X8ZX7C1ylTCiVByPyyVsho6BDy4kAXW+B88?=
 =?us-ascii?Q?bys5n5IJU+KhKiPthww3aC0uSa69E5UDdjwBH0Ww7qa0T/p1dt7KuLrBmt6n?=
 =?us-ascii?Q?ihv9jVUXD4L9E6lxb9VkLOxvCX5RALd0sXQGUP4pAvBQQqjGkF5z1DDOwnvP?=
 =?us-ascii?Q?VX1LLlWTWvsuhe0xdB88A7lxx6/2kk3g43xHQKjmdvTCS1nBqybRKeCRomgz?=
 =?us-ascii?Q?JFycd4C7Y+lFNHmpOjyoCF1Ebpxfr6I2KD9a2ni+CJWX0Bg6zAbr4gThMMlJ?=
 =?us-ascii?Q?UzSer3hwOFrWlZgJqJoncmeiNqNOFhts+YCjuKnTrRpLUU2fmGYg/AeJzqZ4?=
 =?us-ascii?Q?67JTQDbCQvIGHetSmrqoI3vqxdET?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?thXNC8T+4rVsUQsGVof5PNlXBZ+4Et56WOmDuuO+rQB2T0H7EGjdDbVpxIGS?=
 =?us-ascii?Q?8y6U9c9gBDn+6QUX/zzoc2vtI3JO+wcTLzL0FeFQvVhNrOnzcJKe6VafqZU9?=
 =?us-ascii?Q?PGCq9uTd+K/VeJJqpxgibHAapugUBlKJsc5TRWra77DUGg3TXUJfIc6wNs2j?=
 =?us-ascii?Q?oyI3v//DVmbphzPh/hJX8PQORGq+mG0kVmHm43WVxP10plHmra3kzmE5p14Y?=
 =?us-ascii?Q?FGU3UXCvAkwc6xI4MDbLLhwSO+OA7t6JREQoy/o32jY+fzlNkcJn54rXhHrS?=
 =?us-ascii?Q?iUjCOX2rDJhfXxuc2y+V1QcGOkyihN6P+KpjAFqF85Srxd01sm4QUMWD+9A7?=
 =?us-ascii?Q?tRJcfEI477L+XtPke/fdRfrNDhhZtDeTOwMvh1/OOj2Bot+ozxiCsZo8yior?=
 =?us-ascii?Q?NM3fZYJ8ks5AI7Fmou/v0JjIPawvN0vM41/BRE1taqvo5+lxFwOKMGH8l959?=
 =?us-ascii?Q?QGsprzSxyIONYwe1Rlx8Nwe4v6lwQ6jZ1WWZ8dcpEM2cayV4NN9DysSPf60j?=
 =?us-ascii?Q?QiAJCvqVXOMRWYUERebnWS8me4Fd/NSplfNq/GfQuw3w5MMdtOLlLxasklxJ?=
 =?us-ascii?Q?UYCtE+UCH7VVyTKUyR49Oo08AXxxGxmirVnuqlJJYX/Ppy2Big3J780Yxs0t?=
 =?us-ascii?Q?ViWsYNsFi3MwPqsy78Fc6SyHeXTdJeHmzzwGxpCB4fKocovHDvlgbA7IWveY?=
 =?us-ascii?Q?H64Gc8qMQmrhQpfO67DYKkNjglzOeLXbfnpDiZoE1SQrRTya1A6PKiL7JONP?=
 =?us-ascii?Q?uaDvw58gSGjTmsgOL415ppM2Xo6WZ+GSmaGtwg0tcziF5xXiKkVxSh0kGunh?=
 =?us-ascii?Q?DZlVYrYYp0uLugVjZMeZ4xGnTVYKSbOarN60cc0wUQh4EDkP0iHA3M4USH1q?=
 =?us-ascii?Q?eOBk7aRR2cqRhLFEXSOOLkVrwSxR59uN9+XwvWesU8wktN6G9DZw6oh+stHg?=
 =?us-ascii?Q?REbga4Fe4OdWUfhhzSN5Q6OH098oRzLqcIOOcSzOvPMyf9ZVa2mZT/9zR1X3?=
 =?us-ascii?Q?ocrx34wwqDwSvx3mmcE18/cKZWzzCr0ANLWnxANp8qBg+kfToB33DOY1yHL5?=
 =?us-ascii?Q?MoRw/pFdRX80f/uOAu+1X3Yf2ZpMsGA2fbs/nM3udbJzXj6/ZDpJZg7sNujA?=
 =?us-ascii?Q?t2g1YJZN1REWYWoQwFe3kQgL6zt2Mk9MtwE22xyrWoS5tW5PO3KsV7Lh+CnP?=
 =?us-ascii?Q?HR854wHU1FdFxGvEaNpA10HuETf6yOjnz/7q3BwSx9tAej97jfIvLvksEDbg?=
 =?us-ascii?Q?d+5ynXz4GZVzCe0tXsT2ktcPFHNny4IHW8whq9BXrmiMmrlG1Ha+oS23y1YZ?=
 =?us-ascii?Q?/vhxJdax6Dnha67tOcOg4OxF52nvCjEQLYOxoe0nLoxHBT/VqMprWKUgMVj2?=
 =?us-ascii?Q?LNCavGjU0yRvlkEq15gJDJvVbq8v8CiUzWZt0JAFmsoWqgP+lj6d2TNyMKWK?=
 =?us-ascii?Q?h7/v9/kvSh68XNEp2syTo9ZlxKDO/7g+eOslT9IKocGXCxYGSczeUwciWxVi?=
 =?us-ascii?Q?u4EtPfFWIz5B3SwRLbSZUv7IZoz/VjNdxvTNwmcwplZoRXie2RBkWo54XW4Z?=
 =?us-ascii?Q?dxZaNFIO/rsVifg9bADqBN+hnOR3qU7WEdfMwMUygfwJR1HgFC7UYcbbn+H/?=
 =?us-ascii?Q?zw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0f99b54-7cfa-434c-40af-08dd77e89bbb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 04:31:48.7066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OsqSPoi8M0lfwqCno+l6zFkJD+FGnHCpXsY5iLsr7weJr2pXD3/IMISi8T12Iu9tIP+bDqI/dlI3U1uv7n9YFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8724
X-Proofpoint-GUID: 0JGA4CiKZBM0VeFtOYjfpdac2UWoTq2M
X-Authority-Analysis: v=2.4 cv=YJefyQGx c=1 sm=1 tr=0 ts=67f749b8 cx=c_pps a=19K1aDEwnJ0RahI1emVHDw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=hGzw-44bAAAA:8 a=t7CeM3EgAAAA:8 a=0cNpdDu4uiylx8giwlQA:9 a=ahtzkqAwBOYA:10 a=HvKuF1_PTVFglORKqfwH:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 0JGA4CiKZBM0VeFtOYjfpdac2UWoTq2M
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 bulkscore=0 mlxlogscore=929 adultscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504100032
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 04:31:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116755

From: Chen Qi <Qi.Chen@windriver.com>

Avoid inheriting qemu.bbclass and use oe.qemu.xxx instead.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-networking/classes/waf-samba.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-networking/classes/waf-samba.bbclass
index cb78ce6b0d..49d64b096f 100644
--- a/meta-networking/classes/waf-samba.bbclass
+++ b/meta-networking/classes/waf-samba.bbclass
@@ -1,7 +1,7 @@
 # waf is a build system which is used by samba related project.
 # Obtain details from https://wiki.samba.org/index.php/Waf
 #
-inherit qemu python3native
+inherit python3native
 
 DEPENDS += "qemu-native libxslt-native docbook-xsl-stylesheets-native python3"
 
@@ -77,7 +77,7 @@ do_configure() {
     echo 'Checking uname release type: "${OLDEST_KERNEL}"' >> ${CROSS_ANSWERS}
     cat ${WAF_CROSS_ANSWERS_PATH}/cross-answers-${TARGET_ARCH}.txt >> ${CROSS_ANSWERS}
 
-    qemu_binary="${@qemu_target_binary(d)}"
+    qemu_binary="${@oe.qemu.qemu_target_binary(d)}"
     if [ "${qemu_binary}" = "qemu-allarch" ]; then
         qemu_binary="qemuwrapper"
     fi
-- 
2.49.0


