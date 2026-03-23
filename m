Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC25EC01DA
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 11:42:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15353.1774266133144884376
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2026 04:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lqJkc8Ax;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7542b98c32=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N3eb5V3686047
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 04:42:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=W/c3sinyXUDCdfNkG67nrLZ3KEsOJNc5oNwywcBNua0=; b=lqJkc8AxT8Qc
	+7F5CocDLGTUrjokJWEo/e+Xjpj5o5D99qTf5KC1j7sApBAbEzlOiDVcvX8Hfs8X
	WiLOV6P6Q8Gwie6SQd9vpVgpYd6K5G5EEd23EOB0jbpHO4idq/I0RlZM7sH6a/yJ
	yO7AgJlOUlmA5t5SHheSWfd8YdCXgXontVniL2AT6sK3j665eZgaZDuojMB7dQLo
	+76XfzP0gPDioP8p15tmRUKARPYU7StZfJEalasxZAyYe8LoxCKZz2rrrwH46jvk
	fJe9DBSaV0M/8Q5G0Zn0faW3kY6oqAA6uZNfoLFY7PlkmeRAVW4H9XQxrFY1rb9s
	jJP51Bq7Nw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012047.outbound.protection.outlook.com [52.101.43.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1tucse9t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 04:42:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g4j9ajApfS5YbruXeSAYQEKiKtPqb1UIIi91EWg7T2FwbAYvMSd37MGWzgZhU36mIEEDLXfEkbKkFH80MeAuVpTOEZffDnXKivarNRduTlz3LQuJh/9H51o0tnLyXvkXJ5k/z5LKtrDjjmA5N08Y2+AVI0nJT13Sjuf13PR3aoWDhYR7HXIMkHKaYiAK6FDrfLvsf+2g6oOwdNvmOBB92UAl42dUOA0vNwUE0HaSZ5LjzVLVc0l8ywQTbUbRDKEZmsVX9GhwXVMmBOXZjz1iV0dVmjSsasNJb9IjHEGHIWGgBDKTNLIqK2m88sYwGO4hTaODTkxbw2COmjhj/IS0lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/c3sinyXUDCdfNkG67nrLZ3KEsOJNc5oNwywcBNua0=;
 b=QtWmabpOtICkf4THW3wk3GJ/jCSV2iZhgv2v2uLsKpI1lQhYRuoLDb/QWPAdkuCSFdscUb/rouVVS1n4dpS31TQj4EjogFNoBa9hvc5q6C0gnIni87Y1jui/sX/MRMNdLvbtm+V+OBvVxdnlV5VnFKZf3OG0Xjn2BeEkoAlc+L5DpSfYlpXfvGJfPZdFSpOcac0HYvXnpKj3kPO1BMSrwsyfTeLQYHogBJ/vas3zYQITcdmdf09cBYVn0jCC3w2EQklZbeTqV97FqxJX4wWhZT11PJcDRGMLfCa0imlPnsY3e6ADI9n9SepdVqaVtd6B/vTaQjL1PGl9RVKHy87Wyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by CH3PR11MB7763.namprd11.prod.outlook.com (2603:10b6:610:145::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.10; Mon, 23 Mar
 2026 11:42:11 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Mon, 23 Mar 2026
 11:42:11 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 06/15] xfce4-panel: upgrade 4.20.1 -> 4.21.1
Date: Mon, 23 Mar 2026 19:41:43 +0800
Message-Id: <20260323114152.4178269-7-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323114152.4178269-1-peng.zhang1.cn@windriver.com>
References: <20260323114152.4178269-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0108.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::14) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|CH3PR11MB7763:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a0be78d-39fa-4dcc-e9b1-08de88d1386d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	j7Ga0npZ0PxNSoi+7cyT54Awz5Ledm41Lx8BURDAJbc+1pWnKUc6cERARE2QeYKPiq/WIs3tBnXH7BBddXUf7kVrYcaADozLkzutumYtGm69i0LH89uOpYCMUoXXLXYSythP3Ol6/koQilM28PiC/H/g39brJQejiX8dlCZTmLy+syJybJqG0fP5nOFoo/BgCh7SM+ssDKZWQLtY00r6vVXtJ8ttZ/EvWMETV3gXwW98sazO2y/xREljGws8Bc32D6CXJP3u21oybryYu9zyijYLJHHO9G/BJAB1MPKMxM5M/qou8xedM5H4pmsrZoEvNhpJZe4IW50O+1kX/zSUPOp2gP0bnxeaqH1X7kQseng8aueArAwX51V47spfxprnaj1V3J/xaGzRUxmjnAtOduFIturpiFNvpzAbJ2hZHbGgt0kb4oTiEkb/yAYJHEEnWMLvxssEjGkZmIw0R/JVxf8vPjLjqjWAXDmNYU4IB35b7fK/Je94w/r6j4COWpCVa0J1vco2W7Pi9VQp2I4rMBiDPWnpXhi/mnFj2enyLFsjsrMFUZrrvfYS+x/JeApE+9Hagf6tZI3gpgvsLXmkLLM2UVIo6xkzjlkN+50XA4H6SPFK2C/QGLfkfHfoDETU1+vhN4ikbws5nyLepuCxHuVjhMmfFScgpJXy72KvBNEo0erp4C8d/s8BOeL71G0u85GtDsD3lA8PwLstC37/pP2+X2fz1gCj7f16+IXUTJNbKnABQme1lG+esEaQrKk9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?T7k+LeuGCK+N/IDqMeVzCwDyDkrK9BqJ3U1y8tpDcr2By/HS2oikozHWZ+gS?=
 =?us-ascii?Q?OOGISZOUEAJ4kFzuMrjnlyE63QuMVbWYlYeJKb4LygLNiGNLTdWOiQNOVgpl?=
 =?us-ascii?Q?oGtF3m7doQr20KK2NF6dQSIKsnyud15glbsFCwzzrIqW+9DSTcpS49dv0fSf?=
 =?us-ascii?Q?Lw74vVmLAXFAVfX5wc7tKip+dJ1igGKRhhU0zfkxL+WInQ64HiYwmXHliwUu?=
 =?us-ascii?Q?W3z7IgPG5ZkQqLpYIr+60X9gaZOxROkxfmozOP1u5NgnlVxL/rv6Tirydd8x?=
 =?us-ascii?Q?i38/ANovS5yQ02yXp+04JlWZtrvBjwVtWiwZVQJ0OHjfRB5uvS+Xo4vD3iSH?=
 =?us-ascii?Q?x+NPzv0LeNBmo5E/imqXvGCKuIUJ4EeZDGCCY0c1aTtaW2L3qLygcs7iwE7K?=
 =?us-ascii?Q?54dq3Dj9OSOhplE/kvB0mQv5p12bDdOLkNRQISgGYqir78pGv/W/3KRi5P4V?=
 =?us-ascii?Q?2osEacA1WfxlvC7GkIE9eoUQuW/cz4Cugqb1wJTRwsVVvtDsWrBdMwAydzIP?=
 =?us-ascii?Q?BdUl6Sf1Tye0HQtfhTKY/gyKnK9X22DTlxAzMhKcqQZwdl31/9ecxMcpBYbF?=
 =?us-ascii?Q?35pt4oK6hXOjO9v1hbmk16j9Xc35nE1ylC4A65xnAOMJBcQ+YT/Uc85hSs2y?=
 =?us-ascii?Q?YNDx0lMJwBbBwuzeTf0lXBBcLs90mLuedbbfmrzPk2zyzDl8jlOQkPJVmF7+?=
 =?us-ascii?Q?2aOM+c75XmyhFrvYzIZbZOvoHqVSMfKvdpaWIWSquQtHn4lC9nVyBcYmqvU9?=
 =?us-ascii?Q?mUXOL0nX3ovJXxPvhe/tjRcdrI2jpV5aSSJDK19q0XR4RGmHfscW3meKie2U?=
 =?us-ascii?Q?iVrbLODFaO3W7X3/T1TwUwhcBaJvW3D5Fx/bWC9LrYiE1ku2giTBW1HecSNF?=
 =?us-ascii?Q?eratwb++aJPrpXDBNE8z+frHjdq4iWPCIKcMRzHlP0lgXvQZWWhP0Ii2Myu4?=
 =?us-ascii?Q?TZM969u3uzmJaPejpu93cmUEyX3OTyR64dO9tXZnWFXWSZDZTRcbPfJuWtvd?=
 =?us-ascii?Q?x+LKF6D0JxgkCZWpYhT+4w+I9UiHqFdXNfq40nFPRZAqD+X3T00XFECmtN7y?=
 =?us-ascii?Q?adrYGyCppOrcbg+Qxs6B8WoJ1X/hBrb+XBYPxePyeqWuSe67dieOgYzqKqFy?=
 =?us-ascii?Q?bCB2xQGYvYaFCxXgOlurlbhMUjA+RVXu8RSpetHs6Z9dBm9bUo4/5gbn6eF3?=
 =?us-ascii?Q?fGkyzvBZ3BlgM3DbTq1cSJ+DBi2M/DB9mrIuW4VN+QM2pwL5BG8l+9KtSzTJ?=
 =?us-ascii?Q?x0Gpi6MPBiG1THwGx/HZUC0cIbuZIbKQD/1SbRtEaZgISUpbZ75t3ziVQQVR?=
 =?us-ascii?Q?0XICIw5qmhGrTxcyHZCvK+fnxtuuGTWY5Fh0mGf8dB6sv2A9TGS8nFc8myzu?=
 =?us-ascii?Q?hESZYewd31wjwh7rjr2SCQ5kzhm9rq8TX9L0HEN0LfFKcs+Cl5S9229xUHfc?=
 =?us-ascii?Q?234gyia/wLZXEqMXtXT1fxSR/TlZ/6TtZBvRNzVVmg6qMoP9NVJoPfIRJFN3?=
 =?us-ascii?Q?E0jp6vDRxpgt3q8EyUzw5dVdo3JBYvajQaaDWo4paunvWdRcGuOL0do8u6Ao?=
 =?us-ascii?Q?+Bo3vGmQ93H77T+0Z7/dGma4axR4wKW77Fzmxo83k8WyHuRQKgn3EdCHutPs?=
 =?us-ascii?Q?VJWtia9wZgL4FiXHYF5JJxQ/2uoLtHg1KKmVfKQBiHupNU4dZ5vBWndmtW5+?=
 =?us-ascii?Q?YEJx9HF1Zq09uIrpX9rtPIyttCZzPO6OJRwEJrvK0BY+GM0WZXo0sEQZ/ZKV?=
 =?us-ascii?Q?F2vhGcc6eS1cPBe/jmBii70qwmw9eNQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	g/WAraOSpLXn6clnjPJQuiSO6/lP/N2wDkxwpL5Xeed9h1/7Os6iSvUR2FIdD3Arl/nSBQvzV+tIr/yuBQuP06iuUqoEhbAEbw/tesIdddIs+gSo6n5EKBk31tINsoe+zozamqFZK+f8PQlPN/vkKGbkJZWF1qbQlmajwlqKTQnENlM0h2ZLo7mVh71RKk/x8t8WB3WtXJIBsSbFIk+QOV9VuEb3tbOwOa4QAsRyc8g/hVDsfIlDB37+OKXC/4IE+OWbPyoofhpUSDlSAjdeM2lTzni0j05xOVXopyENPMfC2IieN9w/JfSNvzPpqOgXlhwer2Z9LmNFJCVEKurDWw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a0be78d-39fa-4dcc-e9b1-08de88d1386d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 11:42:11.1310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DHjuX0eVuoa9I+uTin7J46xEgF3XRU+C2zEj0b1gdnycn9plOiKMz9qZvDWH/dWiVeQpHmMU+RYVAyfEqsoacLpuMyUh8Yx0UP3spIZwdGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7763
X-Proofpoint-GUID: HlE9yQ7TdjXV0yzp3nNrLMr9X8X9a-_G
X-Proofpoint-ORIG-GUID: HlE9yQ7TdjXV0yzp3nNrLMr9X8X9a-_G
X-Authority-Analysis: v=2.4 cv=deCNHHXe c=1 sm=1 tr=0 ts=69c12714 cx=c_pps
 a=P3qATxxxYOxA1bnNUqDMzg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=O24Aq5uEAAAA:8
 a=t7CeM3EgAAAA:8 a=Rj8fB8i0jaicrVXhGCMA:9 a=SYBONWESK5muIIdMMRMZ:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5MSBTYWx0ZWRfX7UH8AjEBX44C
 cHg+SBKnq2caMeCIw/jSHky1wLJNDjOxBAMocg+rMDVoGGIg508shRd8JMBm/P0LqvSHIH/YeHG
 2EXH8WTPaj9pYA8rBWSHSzbuHzNY3dHkpqDYDHxky5udGKdAi9+sSUrCFCYE2xVxZW0KQM7dEih
 ais37NbamAoqmwgSbmggoRtUbdhAUZzYLp6gYfcCVD7YubOLUXhUmczKzT/SYQ7wqDs+cgYqTY6
 t4SGU4TeFw5b6YCXj9gR+VCZ9xXMG+YqlTlgKAlIdq1ZhQU43ev30liLYNjOVVTqTv0Kk/S6NjR
 N2840P7erTHyTj28YDIi1pzm8/LMOMQBlj1QEu4hGOA44pSkRxsSVTy6FvkI1F5FWEMKul8RkFp
 YSvXYgDDflge+lONhs1LQQbQRtD7lhmhVceB1vsF8Nm/7EGkIB0jqX36rm7ARZYk8cm2SpNhhYK
 PWc0gtI1LXGQbg1p44w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230091
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 11:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125509

From: Zhang Peng <peng.zhang1.cn@windriver.com>

Changelog:
https://gitlab.xfce.org/xfce/xfce4-panel/-/tags/xfce4-panel-4.21.1
https://gitlab.xfce.org/xfce/xfce4-panel/-/tags/xfce4-panel-4.21.0
https://gitlab.xfce.org/xfce/xfce4-panel/-/tags/xfce4-panel-4.20.7
https://gitlab.xfce.org/xfce/xfce4-panel/-/tags/xfce4-panel-4.20.6
https://gitlab.xfce.org/xfce/xfce4-panel/-/tags/xfce4-panel-4.20.5
https://gitlab.xfce.org/xfce/xfce4-panel/-/tags/xfce4-panel-4.20.4
https://gitlab.xfce.org/xfce/xfce4-panel/-/tags/xfce4-panel-4.20.3
https://gitlab.xfce.org/xfce/xfce4-panel/-/tags/xfce4-panel-4.20.2

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 ...splay-full-path-in-generated-headers.patch | 36 +++++++++++++++++++
 ...-panel_4.20.1.bb => xfce4-panel_4.21.1.bb} |  9 +++--
 2 files changed, 43 insertions(+), 2 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-panel/files/0001-build-Do-not-display-full-path-in-generated-headers.patch
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.20.1.bb => xfce4-panel_4.21.1.bb} (85%)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/files/0001-build-Do-not-display-full-path-in-generated-headers.patch b/meta-xfce/recipes-xfce/xfce4-panel/files/0001-build-Do-not-display-full-path-in-generated-headers.patch
new file mode 100644
index 0000000000..34ec80b47e
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-panel/files/0001-build-Do-not-display-full-path-in-generated-headers.patch
@@ -0,0 +1,36 @@
+From 61f40b65637695abe9d9e2f80ca99d3c076c96e8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ga=C3=ABl=20Bonithon?= <gael@xfce.org>
+Date: Mon, 16 Mar 2026 16:31:23 +0100
+Subject: [PATCH] build: Do not display full path in generated headers
+
+Upstream-Status: Backport [https://gitlab.xfce.org/xfce/xfce4-panel/-/commit/61f40b65637695abe9d9e2f80ca99d3c076c96e8]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ libxfce4panel/meson.build | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libxfce4panel/meson.build b/libxfce4panel/meson.build
+index 38d8ad198..3fee75d58 100644
+--- a/libxfce4panel/meson.build
++++ b/libxfce4panel/meson.build
+@@ -67,7 +67,7 @@ libpanel_enums += gnome.mkenums(
+   install_dir: libpanel_install_dir,
+   sources: libpanel_headers,
+   fhead: '#if !defined(_LIBXFCE4PANEL_INSIDE_LIBXFCE4PANEL_H) && !defined(LIBXFCE4PANEL_COMPILATION)\n#error "Only <libxfce4panel/libxfce4panel.h> can be included directly, this file may disappear or change contents"\n#endif\n\n#ifndef __LIBXFCE4PANEL_ENUM_TYPES_H__\n#define __LIBXFCE4PANEL_ENUM_TYPES_H__\n#include <glib-object.h>\nG_BEGIN_DECLS\n',
+-  fprod: '/* enumerations from "@filename@" */\n',
++  fprod: '/* enumerations from "@basename@" */\n',
+   vhead: 'GType @enum_name@_get_type (void) G_GNUC_CONST;\n#define XFCE_TYPE_@ENUMSHORT@ (@enum_name@_get_type())\n',
+   ftail: 'G_END_DECLS\n\n#endif /* !__LIBXFCE4PANEL_ENUM_TYPES_H__ */',
+ )
+@@ -76,7 +76,7 @@ libpanel_enums += gnome.mkenums(
+   install_header: false,
+   sources: libpanel_headers,
+   fhead: '#include "libxfce4panel-enums.h"\n#include "libxfce4panel-enum-types.h"\n\n#include "libxfce4panel-visibility.h"',
+-  fprod: '\n/* enumerations from "@filename@" */',
++  fprod: '\n/* enumerations from "@basename@" */',
+   vhead: 'GType\n@enum_name@_get_type (void)\n{\n\tstatic GType type = 0;\n\tif (type == 0) {\n\tstatic const G@Type@Value values[] = {',
+   vprod: '\t{ @VALUENAME@, "@VALUENAME@", "@valuenick@" },',
+   vtail: '\t{ 0, NULL, NULL }\n\t};\n\ttype = g_@type@_register_static ("@EnumName@", values);\n  }\n\treturn type;\n}\n',
+--
+2.34.1
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.20.1.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.21.1.bb
similarity index 85%
rename from meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.20.1.bb
rename to meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.21.1.bb
index 8efa88b9d7..6854808cf9 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.20.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.21.1.bb
@@ -7,6 +7,10 @@ DEPENDS = "garcon exo gtk+3 cairo virtual/libx11 libxfce4windowing libxml2 \
            libwnck3 vala-native \
            "
 
+XFCE_COMPRESS_TYPE = "xz"
+XFCEBASEBUILDCLASS = "meson"
+GTKDOC_MESON_OPTION = "gtk-doc"
+
 inherit xfce gtk-doc gobject-introspection features_check mime-xdg
 
 # xfce4 depends on libwnck3, gtk+3 and libepoxy need to be built with x11 PACKAGECONFIG.
@@ -16,10 +20,11 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 SRC_URI += " \
     file://0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch \
     file://0002-use-lxdm-to-replace-dm-tool.patch \
+    file://0001-build-Do-not-display-full-path-in-generated-headers.patch \
 "
-SRC_URI[sha256sum] = "5a7c8097527555640ab3d00307505c7c1b7302d11d92874f88842ea969483519"
+SRC_URI[sha256sum] = "c940dae515bef4af08a126011d2fd873ce99e815157ba8cef5332195bb60e51e"
 
-EXTRA_OECONF += "--disable-vala GDBUS_CODEGEN=${STAGING_BINDIR_NATIVE}/gdbus-codegen"
+EXTRA_OEMESON += "-Dvala=disabled"
 
 python populate_packages:prepend() {
     plugin_dir = d.expand('${libdir}/xfce4/panel/plugins/')
-- 
2.34.1


