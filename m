Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4642CE77188
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 13:15:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5435.1735812438799639601
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Jan 2025 02:07:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3097a5f2a8=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5028NUvS000630
	for <openembedded-devel@lists.openembedded.org>; Thu, 2 Jan 2025 10:07:18 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43t8a83xsd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 02 Jan 2025 10:07:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OSomC1gBzGEv255ftD4brKWZyy6FrMrb5X0mjl4z4N9UxMnIkbuPTjZFwbddkepJIrKiP3cE7FbxmrVlt5i7LVpPG+az52T6iIoOZAojWbZKA752OaQLvztuHlQN9euosqXteewa0GSMQvE6+TR0LJKwgPuhavmGFxCZE7lodWo/jBYDqRf0Vcrx9I2/qW7JNRZnpGgQ+DnOe6C/bptphvoy0PTwZXeLvIr2Zu95ktqE/qIemgb4vQ+uCSM20QzIXW8dLBVs+SDbxXBaRZ10/P3bEvHdhefwO6NtKzt6jbUGATYHBbu/jh7uEFFcrSvONGEMO5kif1TiWClvVkAB9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i6MFbqaZehDqCDizUBMN/Pnu2YU356z3pIJZtsydv3I=;
 b=boEUhKwsEQDyWt++LwrcIxGE+zIMaKHTYGMn749Xs5jC95ylmXMa55r+oXvT7FMKtrc8QF5q094o8LycHsvVdReRJEXoD7BPEhhYaC2BPn8/m4HPgxtTxypIm4pbcg/jqXiJMDvgaMIfMbWXqP/Dk9sXFUQDucHn5aZd6M6t6F5CmufAIh57bozWw/Nx47URr1WVFq1rIqj9iwR5C1DmsldvXRlbSaDgPY+LM9l6Q7khfASAp9njRi+y3g/0Czqmc9GK0m3I61rQwZRbaYX9oTDZnJVP9AR0W+sP1YQUj/gNIg0ZMb2pvNkzfrkrfY2+72zwttzOqo6H5nUEpSac6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by SA3PR11MB7433.namprd11.prod.outlook.com (2603:10b6:806:31e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.20; Thu, 2 Jan
 2025 10:07:11 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%5]) with mapi id 15.20.8314.012; Thu, 2 Jan 2025
 10:07:11 +0000
From: haixiao.yan.cn@eng.windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] php: Remove buildpaths from scripts and generated headers
Date: Thu,  2 Jan 2025 18:06:55 +0800
Message-Id: <20250102100655.3794330-1-haixiao.yan.cn@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SG2PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:3:17::35) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|SA3PR11MB7433:EE_
X-MS-Office365-Filtering-Correlation-Id: ec24ac2f-5305-4ebb-1e2d-08dd2b153962
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dEYqWl0Vspa6rTr6PsEPX/0+H5w8sqh/q/Pto09DezRvTSfYA5Dlof8UPLkU?=
 =?us-ascii?Q?QQSZo1Cu9UsVcIlj/WdI8E4GVCrkufor/uAkqiQWmPvgDRrWlY44CyuuD6Pj?=
 =?us-ascii?Q?X9+SS9+/guLH4lMEGuou5eAJoOraVeu95TGKZc1Aj3VKp0FfpkcKEzyzur3s?=
 =?us-ascii?Q?7IU8kUq7X5f+8Mx0OzBMnPGo9McMLiHYvglKdj7Ju4uK96ow/1fDKuid5fBx?=
 =?us-ascii?Q?TTQGiCaanI3tIDhffXAlKBhd/5ZP6k74FbnQDw2+hQQcy9KPS85Z4cf5d7XF?=
 =?us-ascii?Q?e5bZ9teZStRIPdijYvYbH3wKiTJB6iOOGsDsQyyCYuBgkXzLDAsCwbzS8dxd?=
 =?us-ascii?Q?CZHxtBm03Pj+ILQu1WDo2zhZH3xy4BKBuJnmAccEr9/T2mF+o9DGmEsvCZHX?=
 =?us-ascii?Q?KI8BJzZOZuT2MtVXeUUTbu2b3XpuGLz5cTHIklmNdIVF1mWtSkgYUDG6TnXm?=
 =?us-ascii?Q?8Bst40L7i8vci9wQNf6lG/lxmAixdD8fNGO8HDIpjSsyDXoXuz9PmP6sVQm8?=
 =?us-ascii?Q?0K5qz2zX8xsxmYyiA8lAg0xxo398CDtlvG/oSAov8Gn3NDXSWbeeGukEGpmS?=
 =?us-ascii?Q?AjLX9mgHnCDtqh9YSIZeLhVZkQtVBE5a2lQja+8x/Zqs9i+ZV/fiavWonmiR?=
 =?us-ascii?Q?ogldzwXt88AnsaOo+hM2luE1u9vThiRxpgyemodVMZDbRu8/qE2LN/AHiOzU?=
 =?us-ascii?Q?d3pWoOZUI5fdXJqvVADGIWgOPb99J46myBn2Vsnvze/qPwsW+mj25MmDDxbO?=
 =?us-ascii?Q?v8wrOv47Omyoxy1SBsvtV85fZsf+5kykADZElv2w2IeDdGjes+kxp1x5GnQO?=
 =?us-ascii?Q?WWbpZHssnXV8N2wH9pM6iS9hzauhpsl5Uw40Qf807j3lOPBiFcQouD2X+J7M?=
 =?us-ascii?Q?b9oZJju9+Pdi+cyNUeGxqrm3u/YL5jNaCJXEOelFyHy6NBpNpTlCVtoaRZso?=
 =?us-ascii?Q?QQY9BtxnkTKGxo+nKFoPCQqDjw3VwxDa0qyrhe9y8TQ3S49fbO/VjxW6tS3b?=
 =?us-ascii?Q?ERItOyFQIDIE8KXnGF10eyY6WdICt020xpntKVvQ+ENTGX06a0B6GkAQVL+b?=
 =?us-ascii?Q?jerdaN3QbMMsHHINVkBA+t9U4JPqI0c8ZwL37N9E5dXENJ3b4FXz5Iobhpt9?=
 =?us-ascii?Q?4SSDbuljyjjvmikNgAloCW1ulpD+rq4ASqIS18ZqOCqCcufVRbqV6Q7huG8q?=
 =?us-ascii?Q?sgrsLZNvf4IoJ22yCLfFuC9sgiOsjfKB6VMdEMfq3WN8Co1leMj+gl42xWky?=
 =?us-ascii?Q?fjI0hgG8IPCKUOBBXtYG/GDlGWVqyr+9uGAZax5Su7kZ8rtkpmH1g39gR8ZJ?=
 =?us-ascii?Q?JuiKzhtL3w6eq2EumN2xdkxaOOGoXmjJpnrH/tcdiplifusFQaQmk8PWN7AL?=
 =?us-ascii?Q?SGn0Z1AVZFJfjVfSeADrP2KtQDng59qrSEAPv3lNK16IRQdr/fDtpe6MdQ9P?=
 =?us-ascii?Q?TH7D7uEoQ24lolcJa5Uok5FRyZIQyWpO?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZU2v1n/Pwl99x0uhBbx/DXbUII23SCLvF6ztpxw3oj6b9hCD30lzqo9qk1En?=
 =?us-ascii?Q?zxDgH031We3hG/gMjkblfrM1T+TV+Wat31imDuIeBIfjgmIHIuh8UrqCsN3d?=
 =?us-ascii?Q?vwI1Le4OLjxW8UJ4HgvSTejlkCQTzDjtkjPaAKjm9bmNZQ/+cg5XVXDlPB0o?=
 =?us-ascii?Q?5rGVZ1976QBXvgvAu7WexJtMcocFPxmJbBVbx1FS1ThmrBoTl3YYCed/3Enk?=
 =?us-ascii?Q?W93/4yT/YvVI/MOuuEJy586d3B8pz6IoIn5MKa/coKh4KDyQ+tE0np8FF8VN?=
 =?us-ascii?Q?o6gVWkARJzew8VSuT3A99ewU14zGnt+LQJXI5DO0OJKYnnf1OSoQVzuvfyFb?=
 =?us-ascii?Q?A80nJkkR6G0pF0yTeBU5rl8G976W8bNP0uYovGl8SuEVR/LIrEqViRbEmgRX?=
 =?us-ascii?Q?GfJssi5bhyxscC1SiTPdjIglikPFwRa1CL6OeGk5wJCWEXTLDP/H3MrKM2XW?=
 =?us-ascii?Q?feW32ynN6gIT3vsh5c7AdnKsg8+rgF41IurXHybLpxk2MegyDjhgu3IuS2bB?=
 =?us-ascii?Q?CNeWd9WCCw+an+Yk2GGlJYPht8XTj80bQDaVzKtYDIIwK+UqbBDAkoG3LcSF?=
 =?us-ascii?Q?SbAD+N39KYT1hB92gu6iwaElp71bmvbpj1yFM9eHIXFKoaTB55PDZw+xi9iy?=
 =?us-ascii?Q?pNjYX/Y3BDhXgnyJOtwctIbUA726iltOAYMTwDmU61vSs67DSTeOIi00FNM/?=
 =?us-ascii?Q?ezXw9urw+IJneO5u5t9BSJAkk5lYgW+iYYszgU6moahBt7BPZA4evivkzFkm?=
 =?us-ascii?Q?A+rOR+iAmSMbd/pj8vfMFhlQarV30dhQb5fxv0UQ1ksC7Yxt8XkoO/o99nCW?=
 =?us-ascii?Q?jX9FdLLA8SPdBo6P1p+i6MsgSnn3WxdkIWoX/rLdxdKV1vCnGzdQorUJiIDH?=
 =?us-ascii?Q?CeO9mlKYXRumQPaobmSsBRP7t/gWHo+oHAHdaFy9IXUbNgB38SACA4BE9B1k?=
 =?us-ascii?Q?42vF2yEcpr5BPBpVFizODX6sbZ4x/Kppe4Tlq42ia1uzOBoZ4qWjYIOO5+vv?=
 =?us-ascii?Q?oFn376CHWUqvOKS2vdW9O1qns/x3nUulKeprz1CsgyVDPgfPH9HS88S0P/t2?=
 =?us-ascii?Q?qehlVMkBtD41D5QyqjYJHRLuJXX+iA87JJjHHuOlt8hU4aQ+dNc8v1/jvxbF?=
 =?us-ascii?Q?ZWcI3VEm1yItTq2jLg35RrESfPKZMtcb4GG+OJFfYWyxPYS1uJFPzVTLLzs7?=
 =?us-ascii?Q?FZyEpAb4L8dE+3WPCFoV1Xtgw1vvA5/8J+2vWDIzD8PnztXgrZopP6Ek4t1X?=
 =?us-ascii?Q?tZjFB/QcCRylKChZQaMxWjbDb0tYd+OjYgil1xAU+NSgM2dz24zKeuWm8XST?=
 =?us-ascii?Q?Ms4Sv2rLVhZluDXEpyI+EyY5GxtSNgFSPYXsF5sAQykYYf9ubNAGOsibGx/7?=
 =?us-ascii?Q?kkiPeczZID+2xqsK1rLeXrm9ephz2BsISzjNuZjdEQ89NgLYi6IHCLYAqQBk?=
 =?us-ascii?Q?VfmhaNK/47DbdFGCbIM1Ef0toDiQpmxEcLmquRVz+adw5gIDCeiw1mtE0J0N?=
 =?us-ascii?Q?2wX8cZTxoLgblGVrWeM26lbrij3hyRHtJylj2pp4mvR9QDgv/9T42x3+9eNW?=
 =?us-ascii?Q?ktWiXKhKeP5Ukk0xaGJx/EMWiC5aKc3qkqarUCrmC22HCwttgCXN8KV+B3SS?=
 =?us-ascii?Q?iw=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec24ac2f-5305-4ebb-1e2d-08dd2b153962
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 10:07:11.6921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3oV0GT9jsOpkbZnuZZt+HkOT3pRnBpY8sHJ14BmrCDYvBU5//jT/S0RTbnbKsHXtXhxawJSjPf/ppbL/2IIga+ndmaIS+NZUrhAy67b9bHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7433
X-Proofpoint-GUID: Ar8SNvhHUyVFYd7ksRgHJVhyqnv8t6Pi
X-Proofpoint-ORIG-GUID: Ar8SNvhHUyVFYd7ksRgHJVhyqnv8t6Pi
X-Authority-Analysis: v=2.4 cv=f8qyBPyM c=1 sm=1 tr=0 ts=67766555 cx=c_pps a=gHjWyi4SN+6fNgZLRl0D7Q==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=_Eqp4RXO4fwA:10 a=pGLkceISAAAA:8
 a=t7CeM3EgAAAA:8 a=MXrr8OOu4Lm6l7dBeNAA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=Omh45SbU8xzqK50xPoZQ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-02_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501020086
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Jan 2025 13:15:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114619

From: Khem Raj <raj.khem@gmail.com>

(master rev: 439239ca9c543b0913de054f01453796e373ac00)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 meta-oe/recipes-devtools/php/php_8.1.30.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-devtools/php/php_8.1.30.bb b/meta-oe/recipes-devtools/php/php_8.1.30.bb
index 2b999df49397..19d7a84b9b11 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.30.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.30.bb
@@ -142,6 +142,13 @@ do_configure:append() {
     # No, libtool, we really don't want rpath set...
     sed -i 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' libtool
     sed -i 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' libtool
+    sed -i -e's@${RECIPE_SYSROOT}@@g' \
+        -e's@-ffile-prefix-map=[^ ]*[ ]*@@g' \
+        -e's@-fdebug-prefix-map=[^ ]*[ ]*@@g' \
+        -e's@-ffile-prefix-map=[^ ]*[ ]*@@g' \
+        -e's@-fmacro-prefix-map=[^ ]*[ ]*@@g' \
+        ${B}/main/build-defs.h \
+        ${B}/scripts/php-config
 }
 
 do_install:append:class-native() {
-- 
2.34.1


