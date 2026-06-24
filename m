Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 675A6CDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 13:37:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7267.1782308222679692497
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2026 06:37:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=X3eH1yVn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0635a77ab7=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OASjcf2012218
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 13:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=IrcNSRlVv++v2Y6RoCFz
	wFE7bXll5E/lmU/cprUp1Ac=; b=X3eH1yVnAFDVeVSAi//yR9HY/dAGqO1LOW9S
	WWnj162eN37b+oWbK9xUT1lSKW8jzmMlTIgS+x+CArDWSjfQS/R08ngtL8/ZYFfw
	84y5P4oh+z4oHCLqG+U/BJjjm3f+PlhUJYvQf7N5Th5YwwB8qb8lQQb9jJJdJ3os
	uC9z5o9Q6ZtrwXkeHbafc31gPl/aC/8JO5SiueFVBL71a/U8bDQRa53oeyCOJVet
	28Cvjqwp33Rx1Eegw6uLXDN0tksAH+5D1oGzaCgfhaNKPpnvU56cbF2fszaTG44P
	zLDAAFacWV6H/rRwWEdLb7u4rigGESZI8PqSMOk1+y+i7X92+A==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013023.outbound.protection.outlook.com [40.93.201.23])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ewg2ww6nb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 13:37:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qEd76O3+/m7BNA03enGi7LDcbNDX2+YPu4spK76VtRtH2Ko/lqfYTXNPh650Jk6qt9aXzSK6A4y74icNezGyk2C4LwGZZ0WU10hs63Ab4DUCZvz5m22GwzSRGwTxLqWcKFfwYU2ndhFE4vUccoYrk3+2yuy/c44hVTbAr84gui1/Ci3h3Si4DHCwjY6x66L+2x1AC4HFzd85iykQTbM87dZJzbM11dH4f6AoqteCyxHAjTYIYGRcasMT5qvs0BDOyzruJjcGFPsI99XZ40S2QkiVIqROZf6yOI9CUnyqP0Xrckua+RJ8/B+bvNIfIZL0li6Df6Jt25U1PVNrAAXceA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrcNSRlVv++v2Y6RoCFzwFE7bXll5E/lmU/cprUp1Ac=;
 b=AvLMFuzb6Vw85iXNHHvuxvArwJLyq75q98ai0ZTyEaZQKYK9pxr21bcWsqi4rd+BDWkaWJjld2zOAJm2o9FeEDMPT3S6we6X1mHhfFVLJgADH1srDlOlNJxVl34vdPerstROUZYGIikK4Rg8vTaN/gtERKoal7C3No9ukr3fwfehNM3bmHbwHDN+dI+lXM0uMfOkrV76LDvPBO5MmiInZ0uK75VrB0zVM1HsKdbk4XuKl/cRFUc4TGP5Yy31O1B/RSz7SgAVWcGD+2WkQ0B8QSYHwM648Q6SxHkvs56O3hWGkAUViXiaQNHxyYCltz2Sa139bBsucyIVRUxz9hlyaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA3PR11MB9400.namprd11.prod.outlook.com (2603:10b6:208:574::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 13:36:59 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%4]) with mapi id 15.21.0159.013; Wed, 24 Jun 2026
 13:36:59 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] pm-graph: fix do_package issue for nativesdk
Date: Wed, 24 Jun 2026 21:36:45 +0800
Message-Id: <20260624133645.1262580-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0034.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::11) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA3PR11MB9400:EE_
X-MS-Office365-Filtering-Correlation-Id: 30dcd7e1-3f29-4189-e14e-08ded1f5aa5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|18002099003|3023799007|56012099006|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info: 
	0/7nezwNV4IwU1XauAQbFWAXpDH78/RT4RU4jzjOeO3WuAaTQR0UwwAMZlP7XMbdgQINEaukklb1tkxBVF8Kl5YuZD8DQatsd6trmb7m/ixqjywDu12F60vU0hK7h4KG2lPIDCVROcbS84J1EBmEfSJJZ9daICduHCR3/iOcC6F6TXX3g0vR5R6CzDpsxKu/gI9F5JTiT2QnhvASQianBg4jb4AvICvUJz7sxMP0sC+soFKHSbHnR/j0Ul3UI3w5LXM23SEKF7hD2igRqDKZ/bcT2avQoxZ7zV1BC5yYCdGaRabXL4zsCNmFkkLiHYBkAMWpYIM0YQGqoSPs89hiJjhySAq/TR1YOPiAvhW6I8/Y8gkgdDFXS+cHWht03saH/DSXyoqFz5Lo6S5wi7T/Ntd20lNOLZtZviHNnbfLu0Q3f2NFNYHxOUP8Dr79dlcSTzKHtLFjBPeSK0TgQ4xtYt0SlHlGb3VnVjbe2QplxSpUev/1KnN6hjdBpj+Pa0SeDKfa9x8St+6cplh6DGbHgDHhLeS2gFY8how+UIERjW0VQqZRDRv2/R7cdWX8a93QSaDwOoH7Wc4/TnHFhrsqWvq41iU09qPunL4PfVdabLmKkL6hl0OHAPi/kkuRrnPXVKgDygCmh17+5HUyph/8hSOTlGMZ4A3JeTKCjJNimCNMfSjEOybQd+mA19bIuUSF26FWUk8R1Rv3zQyWrpzk7JjHdQX8p7JJkKzIzhBP8PU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(18002099003)(3023799007)(56012099006)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ajDF/0ksFziWv7EZ7Ce58MkkpvfOxpzJ6A/hQou444cvOPdy3keeqySbfv8G?=
 =?us-ascii?Q?QzddL2Wu+454o6bzBAK1+Blz1Fux8dJWWEwaQvaMHt3RaVUTHC7Hswvc63TM?=
 =?us-ascii?Q?YwzVXedGgHS69OUTWMYp5VTeov+6DF/J0qneLNVCO7a7d4caz2kJNqQiSVwl?=
 =?us-ascii?Q?A5ADiYBde5yOsk1WZENz205n7nnSrCZgdW7DF1Dbz67lnICgk5kPWnPjPcVR?=
 =?us-ascii?Q?z8QjrjyFctV1Oi7SdoHmgWxSw7mC76rAlUcF7BjkO5aZQs3Y9ZMJGBm9+SH+?=
 =?us-ascii?Q?1FOMwy90HTmOmFGGv0YvGNx9at2SMJTbCj3KD1asV1pkaaRR6Hj9AsChs5tl?=
 =?us-ascii?Q?14mz2Hx8C4XRAsvBxqjnDEGPtS9xCFUavTC2hb9An+ba+U+N1R610VO0LGPi?=
 =?us-ascii?Q?lLMGskTwD+iEslQfXMzo/is6jBNZrMPIhXIuQTCKAjbYTTDUUfWVJNF9YVQH?=
 =?us-ascii?Q?MmoC6rrgVa/j/KNRbHJJDCfAepmG+NwsLyb7k6T99PtxSDXAO2fL9NhDg+oI?=
 =?us-ascii?Q?7lyaWjv2nEmtxmB5xqnhGwMq4MchIsbm+KS/+IY2er9OGHjWlk4np5gIuohQ?=
 =?us-ascii?Q?ulyzPPm9SGOsHVvcYO4UotgHt3+KbUtLZUhd/mV7bIGGSdgCW0yyQToD4Uwe?=
 =?us-ascii?Q?ryXeW8nauLCwyYox6D74NkEcfK3omQLi1gZbUrMtCuTOgw15vXoKuHayN7t2?=
 =?us-ascii?Q?PUenCVrmGoJiW/gXnUhkGW/J4ZZP7Q2MMUnShqCL1VMyyl2zFXvSiA0OB8eV?=
 =?us-ascii?Q?oVy6cx9w2y+bqiZP9RlxZaTzBhl/nKHKfbbkM8KyFTja6//keqREzuIID+1Y?=
 =?us-ascii?Q?VWoMcYjlBx6FtwXCoXESsa+Gjt3klIOBtpPRJkXZS0UA1NxZeq6dC3Euz4T4?=
 =?us-ascii?Q?0dyO9Kr6oX6GVQJ+vCkWLakMZeCrAr8b4q2Gigwsspylkx1761KOc+eImRtG?=
 =?us-ascii?Q?nady+dRbrwVfzU+DG+z5IQLRx9GkwTDe3BrF6Ru41TxKwA+OIQ1PtmJ8ABCf?=
 =?us-ascii?Q?HTifsMgbCpp2iQPeT6CtB6KcMGDbz3VDo1WDUr4cHHRTvdfVrdMgxiEZ9AAM?=
 =?us-ascii?Q?xlPAvlf/uzPIy3xyYbdGIn8PggvuceL/ih2TNd7omYawxAnphJkipHX2Uh34?=
 =?us-ascii?Q?zY1xHNLTvy0FfZN3XCRiAxygOwZWJYiu+3uje4LIP26Ic22A5vDLFa006OrA?=
 =?us-ascii?Q?YzTEfjOSDWckiS/rithSS4ozgRlLHzlRWa4lD6/mZanqfbGMhnhqFVRFwejJ?=
 =?us-ascii?Q?qOyL+KA5TgxaKjMs2efO/Ye3lGKpexq+J8X9AxSa4C95yrGujAQ182hYbiaD?=
 =?us-ascii?Q?NbdNA3E4gorg6hIhXzdX4KCVFay2rfSu14gZvOlJ2282tHTXluE8jULyl2XW?=
 =?us-ascii?Q?qomVcuVLrds/vtO3BrFaQU5JpO29PMemNB6jtVS6gO0Dt2BE8+3HIcog/ZpM?=
 =?us-ascii?Q?QQIGwzzjR7ndUT8Kupwmh/WXYGvIlTn26YWH7VcSdNpAO7mpfNwCLfPfQaH5?=
 =?us-ascii?Q?6ZhSWtXSZ7GatEwtHRF8bR+MK9OSkPe6PFz4cSoId3nJbTHu/QHVABMKm113?=
 =?us-ascii?Q?+z7+WzuhHoWxbMpiiZvvACUkWviFxth8yOcVERC8S7732GInjloC48eNfpm6?=
 =?us-ascii?Q?2mbYM4v6DaHkg2beoMobo3ZInxO6e3RkjQTf6lRmqq40gcK2q7Te3L63NCbg?=
 =?us-ascii?Q?AyGIpFadTTeydroMGPJvL2blTfhzJMatuBBuPsTEiHatsv+zDv60/b22ELZy?=
 =?us-ascii?Q?DfhDUQA1Lw=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	naemKg9Lpeg8sUMF8CuTLIJChCf/Bv7beKy0kE+uldwRntdlfAjl8ES+YSnXVOfV9SgKSinuFphM8zuJiKaLoAn3IvYAlbmZsV5Ja80OGM7FbFPZ4Zi1MLXg3P6x1Ww9wEYHzGQ1yPY6G0I5xE5oPx0Th+QdoiM4gORBL2NXNdaT1fiLK6OuWUA9Wn95cz+Kgu23YTHE8rmy2L4SBmLNp+Axv7ZLyqcf0sLNckdz5iKLRLKU2hvcGoUed+T/kBw1TDkmJsyZgMHgl30kC4rKAXrLCns3VzPvbi0X8ojFO2F0xmDdhCftaDQBaZAcoDgCcVjnd8CddPrHQZYuDLgtPg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30dcd7e1-3f29-4189-e14e-08ded1f5aa5a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 13:36:59.1098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M+HGiNlbpvNdvC5EeLyIBEMh9vsHMdq6ep4ksmXjZKowu/o3+Obwrm9+aVdPTGX+cAzc32qL8zPU2DD0MdWXvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9400
X-Proofpoint-ORIG-GUID: xIYfll54fvTMdYa16vRw4O35cf-Qv4GB
X-Authority-Analysis: v=2.4 cv=Xdm5Co55 c=1 sm=1 tr=0 ts=6a3bdd7d cx=c_pps
 a=lrInUZDIVE0OTqvzw4499w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=5obYp8aCXcendP3GqFEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: xIYfll54fvTMdYa16vRw4O35cf-Qv4GB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDExMyBTYWx0ZWRfX/YHBMBj5/Xin
 LECSWG8NSxMKeJoTXHd0rxi1MJYeFPpmgo6y1hR6VAlyYkgOC9RBaUDisxOsEUqA1XC3kvpqLE2
 MYSgYAZHnZhltRubZaKfYX/43UOqwMvjJHrVZPjHBXr+oKHcjKCU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDExMyBTYWx0ZWRfX3l1thufu7A1H
 69s7SXkCBCeSrPt5SMDNMqr2edCq2BKCfcQVDciYOFnIT+ZgOK/+yV5510vWl+6ETGeSWC3wtes
 XBWclg+HshHByck9uvklcOXeLACOMHInfO6hAyouGL+UZa1FJoDLfASRMI2E8NyBCnOYFjCICNB
 fGleFhPcRhsjFudW8qliJ9o8opNOmdc1JBk4kI1VEE/MBrdliD1IQ+m0kXvatbzLU7/EoBhriqO
 Y4H70qEycXJ5RHxugrqgXLneCHtO23sn1dmnJyXi2SxZOYdgOyLQxZPoixc4P2nu5IKxCvgMMfP
 F0UzDDjRgj2uhQBhQCO4Ds5LCUPK5KAPZCFzh0RoKgklA2/+749F7enSYFirTBILtiRbzVVAlUU
 EJ6yxMaBGPx/MU3lv18UGGwq6XmtCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240113
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 13:37:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127716

Specify BINDIR, MANDIR and SHRDIR to fix nativesdk-pm-graph do_package
QA issue:
  ERROR: nativesdk-pm-graph-5.13-r0 do_package: QA Issue:
  nativesdk-pm-graph: Files/directories were installed but not shipped
  in any package:
    /usr/bin
    /usr/share
    /usr/bin/bootgraph
    /usr/bin/netfix
    /usr/bin/sleepgraph
    /usr/share/pm-graph
    /usr/share/man
    /usr/share/man/man8
    /usr/share/man/man8/sleepgraph.8
    /usr/share/man/man8/bootgraph.8

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-kernel/pm-graph/pm-graph_5.13.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.13.bb b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.13.bb
index 219629d4d7..c4daa5f786 100644
--- a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.13.bb
+++ b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.13.bb
@@ -19,7 +19,8 @@ SRC_URI = "git://github.com/intel/pm-graph.git;branch=master;protocol=https \
 #   - CONFIG_FUNCTION_GRAPH_TRACER=y
 
 COMPATIBLE_HOST = '(i.86|x86_64).*'
-EXTRA_OEMAKE = "PREFIX=${prefix} DESTDIR=${D} LIBDIR=${libdir} BASELIB=${baselib}"
+EXTRA_OEMAKE = "PREFIX=${prefix} DESTDIR=${D} LIBDIR=${libdir} BASELIB=${baselib} \
+                BINDIR=${bindir} MANDIR=${mandir} SHRDIR=${datadir}/pm-graph"
 
 do_install() {
     oe_runmake install
-- 
2.34.1


