Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68170C369A2
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 03:13:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.66.1744168413083686445
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Apr 2025 20:13:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6194c6f013=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5391dLKU010927
	for <openembedded-devel@lists.openembedded.org>; Wed, 9 Apr 2025 03:13:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tsr1mybm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 03:13:31 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5393DVOj022261
	for <openembedded-devel@lists.openembedded.org>; Wed, 9 Apr 2025 03:13:31 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2046.outbound.protection.outlook.com [104.47.58.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tsr1mybj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 03:13:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nCP90Hq5hFDj7Re9rkqRjd0k/VH9LriahGGCdiS806scFTM60chUtzCJGrsid/fp+1JqbRISE1P0+HgRKB1aRwhDzD7fGfSZK6RfnTb/2eBN7mi5VpiDhkPCH62cCik0dpeH85MGrYOmfOv4s/KTPOizeGv6JxfYxImqP0gK7DmTZl++tBpFBea5S/c3wN5MZhOLCntefNZ4tPGWv71i9Gp0sQmVhHiKbK5i+Td64TswMFV97uijrxUbSlRRi1h7m01J1oOElw1tVTNChqgsHnHFBjzvLsylFWq/Du6P+7dllzzLRhmHg8+8YttN5C4XcZlosqZ0rXvAjwJZorKRLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tQ3c4fmpTvlPGCUerGHG2gg/CBV1/cJt4ceGYizgbaY=;
 b=iMSZLyrbNDcxuPI6ZnkPwupeJvb788up4Kxw0xK9IV7NzIbPUOALm6nXHDDklg9QaAnScGCvh/3p72XBQtpYtZsPtXX68aByvyBiERAgkrGOLTv6ttE/bDs1IKr/ImwtKeULOwQirCr7uyBO5pVw3SVc69kXGUjjuJPEZnYYmnEDsTHoqahJ9YprGdYLSEpm1rwX9wjrljw6feX2Em58qUjvb6LQ3tOxLJTB7gj5a3ORXRY6hcxsm4UYejnvahrFqjFhpCjpeEmu+s+ghfYtUuRfTvHxWF8KgZCtZMzjYssE3cCGHUIKmK6WlpDCX/RAqMu9VMs1Bl/Vrn3h3FUigw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5533.namprd11.prod.outlook.com (2603:10b6:5:38a::7) by
 IA1PR11MB7943.namprd11.prod.outlook.com (2603:10b6:208:3fc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.27; Wed, 9 Apr
 2025 03:13:27 +0000
Received: from DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd]) by DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd%4]) with mapi id 15.20.8632.017; Wed, 9 Apr 2025
 03:13:27 +0000
From: jinfeng.wang.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Cc: tim.dylla.ext@rohde-schwarz.com, piotr.l.lewicki@hitachienergy.com
Subject: [kirkstone][PATCH v2] net-snmp: fix memory leak
Date: Wed,  9 Apr 2025 11:13:07 +0800
Message-Id: <20250409031307.777898-1-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0016.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::17) To DM4PR11MB5533.namprd11.prod.outlook.com
 (2603:10b6:5:38a::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5533:EE_|IA1PR11MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: 184f8ca5-9dc7-4978-4212-08dd77147f1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?iiGjM/+b2bSa0gyFWNmMNtrav4oCIiaUVIDCy1XxSso5nuFGZ7pnHkNoeVql?=
 =?us-ascii?Q?mYYk4SV+lsFXunlbFIkYK3tEAxnuFJEs0rFlXZSNI86FHELODxxjGAgUfI8x?=
 =?us-ascii?Q?49D5KNNQBD12iwHKudysMhfksUToBIfAXAU/NeFUsDHck9XEU0xPDS5l1ArS?=
 =?us-ascii?Q?AJ5dSIHqDGiF2ltXJetOnvf0FRnGERzZOdOqhcqO3XJSpgtl1yynoPU0+N5z?=
 =?us-ascii?Q?/0urcymMMZ2UxAqdK3b9QcDnMAXQXnKpOWfOCZF4crjjraNkwUZxQv1bp4c7?=
 =?us-ascii?Q?+jQMOquCDsY2oioN1p9zq9wRXHXzreW7BJ1sjxBCeNPtgRAUYTqylwyoNH4U?=
 =?us-ascii?Q?/UfRySnpa17V0S4fDw2P9vTooZ+g4xXDevaDB8+WmxW7scd6qdyWJDIPWixR?=
 =?us-ascii?Q?EGJAx2SSZuYPglYs4KsIxVbgZUtjydHqtOYlOKdqd95Q8WICqpihVYIQyqul?=
 =?us-ascii?Q?5ltQv7yvFLf2e0X1TmoEDNV6v2OGjBCYBj0Q2uS4faYthdEAFG0cd/8yYXky?=
 =?us-ascii?Q?MGurOjUyn7XkSpQeHlWlynCLzQnLuPMR5ONw0NR/5ahgOl1icbfl0jqtoaT2?=
 =?us-ascii?Q?YhKky8HieEPEwdQmNm9lOwbCzVlDahO7FukBT/jfNlrn8rb7gt21CojOXU61?=
 =?us-ascii?Q?ZLg218CRh39JpdrxFVu+/jU9j2xdtjzbSghcjttPuuOB1/DpI4YofFvz709Q?=
 =?us-ascii?Q?K8rFROG+kfw+VOgI7OrQQtsJUh1DvpS6GkEEpmSwhf4DHZmbinq2qtZEJf4S?=
 =?us-ascii?Q?4+u6lGm2HskAYW3for2FoaPN8gXuaw1chGiCRHvHZA7axDtDuiuW1wYivdJH?=
 =?us-ascii?Q?8nVimxASwrHPmyppTeIF169ms8gTnYIR65JB7CATnrdLQWljMZsn+0dKz9Uq?=
 =?us-ascii?Q?F14ToRBXS+oT4gB9h/ix1Rn6SGeDimEudnecEyItkel9sm1jbEVZJ3GbHjv5?=
 =?us-ascii?Q?+95gf0LBV4cm2bEZd4SRqXqFTuXwhn3UtgD2ovR6rgbzOeST367EK1MWNJJp?=
 =?us-ascii?Q?Mv/hvJdcQyFVSKOgUbVP1ENm3bxyXTXM5UoWrSAivzU9EIGFEcFEKIo8zKhL?=
 =?us-ascii?Q?erDyZKIwg+XlRZ91Oo+ORlh8kRsSbRgipdfnrcyDQlDqz03/uXiKAsk0FVFg?=
 =?us-ascii?Q?7mcq4CpPo6D5/OjHAtycGPZuYc7FMds5hanYPW06IUWul4RFzqOUbOhY2l8h?=
 =?us-ascii?Q?kTGbIg5xgj2inMqZnv1Yd1zHH1+kMGaxtpZabcpz8eeVojERv2zBnAOL5tIy?=
 =?us-ascii?Q?zosI9Gz5iyNGhk6acKy7rbhSK9+WX6j7pq7ZSOxWd9rMhBqjyUeL42y3WUxU?=
 =?us-ascii?Q?zCw/WgR+IOPVJnL0ZrwCqpWj8JjZsrsM2WM7VsdXLa5amjEQSmCKtEzVfpCK?=
 =?us-ascii?Q?GRevYZQaSmCmkeXCfaTBRv4LB0b2zwEzbuVXvdf6sf+J9Ijak4lP7isPC0xK?=
 =?us-ascii?Q?XopBVmREKqQdZBihM9nSv5iUVUqGwXbenOoGaP0Z8fAfVjujUocOrailPJsV?=
 =?us-ascii?Q?Tb+qt6VcEto6swE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5533.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oGk4BmTWXN7m+gR6TZP4wNxH3+A+oBoHzNM5QZSq4cPnvio8gQtDvJ4X3vzc?=
 =?us-ascii?Q?QbL5CKUpHbCLLf1BLtD3mQy+GUzRvYHdPU8bN9PRCLFhoaojwoJg5clKNrwr?=
 =?us-ascii?Q?+nAF1IUAgJDIMgMuY7KuYf6nULC4AtfC8OK+vmgWu87oDQaWsz1Hr5JkJnH+?=
 =?us-ascii?Q?2jKG+bYbsnBJe+LrRgt61yqcuAUVvA0Cru//l8h6eO1XtlvxuYbe8aG9G09T?=
 =?us-ascii?Q?xKFNDPkcckE9xXa1pQK5Y6l/yRr8zXPDOaBtNmA9CZUV6EUBA2pVr8fec2uH?=
 =?us-ascii?Q?kXVVH31G5MqvB+wjQs5KREK3os1UjqbAEoMOFm2j0kVZ0a0WbGlqgaKKRsCJ?=
 =?us-ascii?Q?isM1W1LYMZO+A7EPAc9kX8G+3CGM6V9snMyl+RUxvndNR39QWoeT/F4hs6Vk?=
 =?us-ascii?Q?3KGeBaTqZSNosVEUxEwjf0K+G/XCePP6EUVN+fuCAci5ZG7YWoJFQ0oY37LZ?=
 =?us-ascii?Q?W/riaMba0PKI4oe9SgFV9TbQD90lcTTCMN0l0MJnc0MxG4up/bZjRbqtAsQj?=
 =?us-ascii?Q?h2Rlo8nq/ngtIljM6jkvxPlZAo8vxZmfcDTdUysanzM7LNPtWsjaZDoJaxA0?=
 =?us-ascii?Q?ycG9/a+kZlhlqb7AKeUXmT4/3pieK00f3DDj69JEFMQMAvnWthW6Qyh7b00M?=
 =?us-ascii?Q?WWXxC5dUlaRSyUYjnbJpKAwwFuw47iTbHjuHm8pQ08W5JFvrHq1mytZH+ixd?=
 =?us-ascii?Q?sa/N/b9Vy22BAAbF1jL/ZLqWi8qqLJ8JKXI207Cedhhb4EPYpr2OHvl2sT3H?=
 =?us-ascii?Q?ZRpo/e1b1AR62VrK0HF1sulul7lyOelWEMTXywDZaTcgwm1vIUuRsalr7lyB?=
 =?us-ascii?Q?59l87rNLHaV62m3KMDuvgYONExjtRRrjgSRwM45LPDNcUDqi+0N1hu/wJ4Su?=
 =?us-ascii?Q?xHslz8ySa/iJwK9JBT9N5fWlzuij0hk75IiklaeXPo5i15JXHtN0qkhIJTyc?=
 =?us-ascii?Q?q5HVlqv6qUbuvriGjw+S3azEBWCTf0vSkmIaAcy99vlhYLweqPx7v2UqUXI2?=
 =?us-ascii?Q?dfYthw25CDSFm9LBBYeu+cDJh+AaFt4EMPiBghGAC2dOpoZw65khAiATkmZj?=
 =?us-ascii?Q?vzUbfzvBF1LNJwgKfUDovrPnec/tsjgBuJj0ozEux9EfnszD30t2nJxgZD/i?=
 =?us-ascii?Q?EOK6c1kh1uyuwYGy0MFA7sHhcLSDKHKHRIvZptePJHjMhQzc1nchTozsOeIX?=
 =?us-ascii?Q?WBa9BdrX+MGBqNpSJ683eJVt984eQCKUXgBmj9zFQS8ZshssGPsqno8P2xD5?=
 =?us-ascii?Q?kcIFYNHpSpXrbwHUepzHVhWya1z8jTY5KmjUJFvOurFDKXIogHsxWtifjMKU?=
 =?us-ascii?Q?Mr5eYeTV9SkEfqlupg1E1vuScF+aGs96pvIn9c/RmXdXQm3P/ky7j9PUsQQH?=
 =?us-ascii?Q?xccqnGFHsrfHFthxz3js8QemeMlEwhMLXNidWlZsqrEyUX4lcDy5UxCLNGXr?=
 =?us-ascii?Q?VuFZ2o9A8cdfFwAyUbtN8GmP8g9pHQRZBEIyZetXWmJkdAoJdupo9OOqO7tR?=
 =?us-ascii?Q?9D3Rq5txKI92ygn5CxzDn/Ag1zn5agzZPEzqmIIuEoHe/F7aRhSNGK4/FasC?=
 =?us-ascii?Q?iGJ8X2qQRz5LZVuQfYkWmE//RRAuBsysfdlNULfRdhojFaH0rjzD0j7IfVFH?=
 =?us-ascii?Q?YQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 184f8ca5-9dc7-4978-4212-08dd77147f1e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5533.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 03:13:27.3946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PmZoCfnvYqB7Wcs5e6jpXlGPcDgD+5NRmOofdc0uJuEPfdORfeiJPkM1AtHZsohsDbP82uLzRzBtg0mRFvwUFxx/n7ivrHeloRGGzaVv/Nk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7943
X-Authority-Analysis: v=2.4 cv=Td6WtQQh c=1 sm=1 tr=0 ts=67f5e5db cx=c_pps a=ur2hu7Zt/Tb0cWAHmjvzJg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=2AmNxeKuHq6Xx3GgDKcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: G8_L0Pj-dJpPWvuumBvngwdjzix4sl-0
X-Proofpoint-GUID: b7T8QnanezIWt_AOIspU8M6bH-kBSin_
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504090009
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 03:13:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116722

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

Backport patch [1] to fix memory leak by freeing tclist
[1] https://github.com/net-snmp/net-snmp/commit/4bd0d9a8a2860c2c46307aef5ee1ccc69f7e3b62

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
V2: delete hunk1 of v1, as there is special character.
    update the line numbers in hunk2 of v1

 ...bs-fix-memory-leak-by-freeing-tclist.patch | 32 +++++++++++++++++++
 .../net-snmp/net-snmp_5.9.3.bb                |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-unload_all_mibs-fix-memory-leak-by-freeing-tclist.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-unload_all_mibs-fix-memory-leak-by-freeing-tclist.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-unload_all_mibs-fix-memory-leak-by-freeing-tclist.patch
new file mode 100644
index 0000000000..4e1d09e15a
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-unload_all_mibs-fix-memory-leak-by-freeing-tclist.patch
@@ -0,0 +1,32 @@
+From 606e2cbb2d607820345aa20d4095613b1f563a08 Mon Sep 17 00:00:00 2001
+From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
+Date: Wed, 9 Apr 2025 09:24:45 +0800
+Subject: [PATCH] unload_all_mibs: fix memory leak by freeing tclist
+
+tclist is always allocated in netsnmp_init_mib_internals, when doing multiple init_snmp("")/snmp_shutdown("") this memory is never free'd.
+Remove the special character in the origin commit.
+
+Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/4bd0d9a8a2860c2c46307aef5ee1ccc69f7e3b62]
+
+Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
+---
+ snmplib/parse.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/snmplib/parse.c b/snmplib/parse.c
+index 9406f4f88..2f9a20175 100644
+--- a/snmplib/parse.c
++++ b/snmplib/parse.c
+@@ -4225,7 +4225,8 @@ unload_all_mibs(void)
+         if (ptc->description)
+             free(ptc->description);
+     }
+-    memset(tclist, 0, tc_alloc * sizeof(struct tc));
++    SNMP_FREE(tclist);
++    tc_alloc = 0;
+ 
+     memset(buckets, 0, sizeof(buckets));
+     memset(nbuckets, 0, sizeof(nbuckets));
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
index eb8e1599fb..88466c94b4 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
@@ -27,6 +27,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
            file://reproducibility-have-printcap.patch \
            file://0001-ac_add_search_path.m4-keep-consistent-between-32bit.patch \
            file://CVE-2022-44792-CVE-2022-44793.patch \
+           file://0001-unload_all_mibs-fix-memory-leak-by-freeing-tclist.patch \
            "
 SRC_URI[sha256sum] = "2097f29b7e1bf3f1300b4bae52fa2308d0bb8d5d3998dbe02f9462a413a2ef0a"
 
-- 
2.34.1


