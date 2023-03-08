Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D65FC6FD20
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 13:57:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7694.1678283842890918614
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Mar 2023 05:57:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=VzE6mciN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=24318e24f8=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 328Cr5nB024015
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Mar 2023 13:57:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=hfhD8B3mg/3fTu6D7ET6irOJCnhfMr6+sO/g/G3EMRw=;
 b=VzE6mciNHKr4qOCpDXIhrqk6cuiWuv8t0REmFvke3Zn2bNe8SOncoaky8l3YYDHMD/HA
 s0F2+wgYuHRJ4fysDDb0wOlC0oCI5hoepYt/hOvxQbpnBCoKPE0REIKJ/ErOCwNQ4EKb
 ezxt4W1j9+toAEo6wDiTz3QJgasbbPkb9XAXk1Sq0seUuLk3Z6Uj9ipUdxma97yD7WPw
 gNMaMgqITGonyOBTwRrryMYC8cIFJ8n/78kw+qTiC3KlSyd1XX8McEyyhA9IPtGqcvU+
 fi3r50pGavQnG1zuXyXr534OYMAXE9x+xfMnkC291FxGL1aXs9/zIkrOtxVxW0tcQBA1 aQ== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p6fg6ghm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 08 Mar 2023 13:57:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bGVYlvARnsp/AUVBpY0gvEcAsw/MSWTPkr//PsUAOZyb6QH9n+TP7OWa2LjXlzn8uryCIDvwcWxd+IsnYBKcRhl4NzyCfA59QQBgF8lNnQbyIhNARVHbOuHapNaFHrlMKz3uBEOty+mgUUB9lARdSnxtlgtA/EjuqVAeSCy/vthAOf9nmwAP5WwFBAFLYIcBTL4fLHuy0DJtcAaMkYiX/5Ws4LhnP945r8DEbcKQtTxkkxQ+G0YOYLKaEePghV3Z0GcEy1OIryDElYbM+yxSzBkM3SzddTcEFBmRmRy9IM1JN7ntr3bLTMEm46C8H1gHf9PjDa+KyC4zXMRzubwlzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfhD8B3mg/3fTu6D7ET6irOJCnhfMr6+sO/g/G3EMRw=;
 b=Yn1+Ia/B+A+G5geXosOVBcA77QD2154yrvXlGzMGQDeU2BQSx/WvhHkAsGfmRBDUtXKn1oCE4X67BGjiSHKAirAECa3QqjMmR5TiXh/nRjij2JsJaV4yChz1VLzLwVsU523+O9hlnY/FmesgjUsPT6psUz4TQqhn2HdmZH11PnKX3N1WfNSgiDyGpbGBsMdAen/ZRFRmaoKaOxlet+iq2l9xNDVh4zSowM+vXWCx4h89vSkI0Tp+L0N8r8jM+sZs3lSYN7SWB/ocKwFcM5pfO6wXy6GMJMQbixUnz+3sJC0n15ZoRSOLZO6ed2aCrDLYiSiL5K+Yj+Wa3Rb5B7hZEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SN7PR11MB7567.namprd11.prod.outlook.com (2603:10b6:806:328::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Wed, 8 Mar
 2023 13:57:18 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::42a3:f515:f89b:4eb3]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::42a3:f515:f89b:4eb3%4]) with mapi id 15.20.6178.016; Wed, 8 Mar 2023
 13:57:18 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/2] python3-rich: add recipe
Date: Wed,  8 Mar 2023 21:57:04 +0800
Message-Id: <20230308135705.796596-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::7) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|SN7PR11MB7567:EE_
X-MS-Office365-Filtering-Correlation-Id: da9ecf3e-7509-40b6-d508-08db1fdd078e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1WPjsv5gBcwQMkwZWdA8ShhjU/q2XBr9EGsPQV7imglImDabZT2kVKcFdHb6hZHi9OWPET6Dh8pvjLvsAXMBtpFl4sgfzM/Iekhav2odaa57+GVbFKoxfmI8g93edMa1nz8suSlrhJROpq5vyU5AIMlKi2TLtBJrxMkmNwr+uYPxAk5H+0ajTa1Zu/Pq1HHu0d0kwCFhgeVCYzzZ+Or92pYVNYoAvrqCOQoFAVcITUiPChbntV6hesbDDtJvDHRizrLIhiFCNPkq/J++tUqWTbfQnMtBfV3YEO8rmMRzphe3AooEh0p5714FjhBzDEzOakHktj0akJ0o46nURO30MZ1A/HU51iEr2FZjA2R436mVVVOVN7q1a0dMJrXZkRPNV+S7b4QLuga6CkVqufGah5j4yyp+NYnrs31z+8NxkwUzl8k/mKDJ483OLzbEzCf7L3ZWK8YrdyvfmYPjSRXB651sFWuupz+oE/HrcsTyTpBQZgMAUhBf8YJ5PdULYNUwEysP4AZePIOKOwC3MxOhjxqHtgJssBTozGmVS0h9vd1oGsGKvA2K/CyP9DS32gC9sYRqi8lWUAh4bEIHqdL/BIK5QslH6mEI+GCh3k5eGFwQjgMwGhcCRNcK0OCBETSB0MzLbfESVqOW9/mAmSgvs2J47FaMdlvdj1vdC4yH67U0CW90pfyiLr4w0hDpch+/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(39850400004)(366004)(136003)(396003)(346002)(451199018)(36756003)(8676002)(66556008)(8936002)(41300700001)(2906002)(5660300002)(44832011)(66946007)(6916009)(66476007)(38350700002)(38100700002)(86362001)(478600001)(6666004)(52116002)(6486002)(1076003)(316002)(6512007)(6506007)(2616005)(186003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JxxpztMGASm0tKjLfBrrFizmalaPrJAhoCK3kJlmSOeD9QD/iL6SroXbFp83?=
 =?us-ascii?Q?iJ8QHemEmO7OEphOOBHO0RVJtt5V69G25z9gPhstzm+z7mH71fJuYlGF4sPX?=
 =?us-ascii?Q?nvAewx1mMEWZjjFoV7gwcfPHed9bThgTksND5JSko1foG1YX30DeFZmkX4X3?=
 =?us-ascii?Q?ZuAqRTWLqZbH9XLibz7Pgjg9bwGavsgTkPMFTGHhasg/f0yYC4luQWhhQeyl?=
 =?us-ascii?Q?y4zlsroNmM3XfaEgMifUBGsfdd1OPyiwRKLDWFPtsx7ZITDv+/VwVFtOVNrt?=
 =?us-ascii?Q?JiDjirv/hdz8qNlEWgCmH46pFp6j3/nvfXR8DeLj6ccnK6+ixm4xHxsAZfj+?=
 =?us-ascii?Q?li3BY3mb9r2CJ3xBzl5jA3FR7dVV/bwahl3YapW97ZNJN+nTbAstwBC++oX+?=
 =?us-ascii?Q?Sq16hXsR31df0NkXCHuXpvTw2BjqW0o5U0BllH1xoFdJ3y5F2C3H186fpF3O?=
 =?us-ascii?Q?02suJwi3kdtzBWno1M7TbQU+CB4SUjrQGtvbBd0ffOAhNc2K+qi+Mqmdj9t9?=
 =?us-ascii?Q?2EGzcTZs7ztxGyLmOXwzQkrA2BzF6/e2WlhISr9lz0CWjoB7ra5XRAYfyDpF?=
 =?us-ascii?Q?QwcRovM1owJNqT/z9x7h/epIxMCOSLTu50xnIuXXIGglXuf8qtRWgUMqKkCR?=
 =?us-ascii?Q?RRvixpKejCn6cxhOBb6DRM7JZSPxABDRrByMRXPZEz48842kSAPl9BcFNMkA?=
 =?us-ascii?Q?czQOCVEru2x+INPAEf29aOC7BtyCj6C6wvrVn5FtGApC7CeeowIpnYU7I+he?=
 =?us-ascii?Q?+9HIw736K4RRsLhKM0El1B/FXaLpABd0JfRabzqynugRvItq4PcVYPuNnOIQ?=
 =?us-ascii?Q?jUva08ULOsYMGkIIvgbEa/rcJBNTaAbgfpmu4+WqwJm/HKMGVAgfBs0/4VNT?=
 =?us-ascii?Q?o8vuwW5/rAA74Qtdhw/aZsQp/5mDWdXxYPS+pwpwO2x/GWYDIlbsC2wQF9CG?=
 =?us-ascii?Q?RqTi5XOU4bSJbtmdTjbYdI4sJ2mj5im6j34Zh4ccUyXjeb0inzz5cEcwUpfj?=
 =?us-ascii?Q?cq4Gx2shJMzRnhZMtTzsVQHkxLiI1nXfcynJlsRHV+kslVEeiHDC94Y9A/2f?=
 =?us-ascii?Q?sKKmOpUnW/rgtJMbW2GDD1r6jNkhvkL0oI5TJleyayOK9sbSDKnQdxjBCyU8?=
 =?us-ascii?Q?ypRg+hhHhWVstxOn6I74GuejK7GvUuL4NFR2IZmBE3y1c+djsUvBW2TjXQJR?=
 =?us-ascii?Q?8hoj6BJpvA6s5fY0FsN9idDCJBlQpucjLY9p9HFmN8qpvWr9rhdJh3xeWsY3?=
 =?us-ascii?Q?BfdbfbV+ybHF2XnUDpcMtDDOEn/gptBva2QzCRU2ejzdYdAbLrnEgB0OK/a9?=
 =?us-ascii?Q?itM/U+biFFpodivenxFVMj168J2dWYEUfoR7bEnubjJiwE4nELMNQK+cUwYo?=
 =?us-ascii?Q?+fxWJQLRDE+9EgP/bjEO2Rm0zwgtNUO8IOTDMjkUlDq8XqbZk2fG3xYuRu7I?=
 =?us-ascii?Q?9ClMqPyMo3KwkKnJQAoyjwmAK27GsjOPL+TF+D1cErfnTEKcrCj6t5XUz6Ji?=
 =?us-ascii?Q?xXkhUHBJ7kVyoNUjJrDrgvd35fJXPq7wUd/5VKJICZ27MH512/gmoU6P4MQ/?=
 =?us-ascii?Q?TZsZkGoEZdDftnTnagslKByRcrhyf67mn7fZmu98Qk6eMp0nRT7DIKwJJhrW?=
 =?us-ascii?Q?tg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da9ecf3e-7509-40b6-d508-08db1fdd078e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 13:57:18.0747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IRflAs7BZXRIC1UNRJSFkcte8fLddcpSBtOm5Xeqx23wTS4+snOMBIWnQMazzR4/EEGf1NAjj4ffOVAKt7fuQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7567
X-Proofpoint-ORIG-GUID: _6d46X54ZyJ8zY_qpcfh_aeHWIMT5D3S
X-Proofpoint-GUID: _6d46X54ZyJ8zY_qpcfh_aeHWIMT5D3S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_08,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 mlxlogscore=843 clxscore=1015 lowpriorityscore=0 adultscore=0
 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303080119
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Mar 2023 13:57:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101424

Rich is a Python library for rich text and beautiful formatting in the
terminal.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../python-rich/python3-rich_13.3.2.bb              | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-extended/python-rich/python3-rich_13.3.2.bb

diff --git a/meta-python/recipes-extended/python-rich/python3-rich_13.3.2.bb b/meta-python/recipes-extended/python-rich/python3-rich_13.3.2.bb
new file mode 100644
index 000000000..b3a458ab8
--- /dev/null
+++ b/meta-python/recipes-extended/python-rich/python3-rich_13.3.2.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Rich is a Python library for rich text and beautiful formatting in the terminal"
+DESCRIPTION = "The Rich API makes it easy to add color and style to terminal output. \
+Rich can also render pretty tables, progress bars, markdown, syntax highlighted source code, \
+tracebacks, and more."
+HOMEPAGE="https://github.com/Textualize/rich"
+SECTION = "devel/python"
+LICENSE = "MIT"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b5f0b94fbc94f5ad9ae4efcf8a778303"
+
+SRC_URI[sha256sum] = "91954fe80cfb7985727a467ca98a7618e5dd15178cc2da10f553b36a93859001"
+
+inherit pypi setuptools3
-- 
2.25.1


