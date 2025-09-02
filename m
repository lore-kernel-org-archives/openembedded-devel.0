Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE11ECA100D
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 07:44:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.71867.1756799089790867574
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Sep 2025 00:44:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ST3XU8Vw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=134031fe91=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5826vWXQ1223092
	for <openembedded-devel@lists.openembedded.org>; Tue, 2 Sep 2025 07:44:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=a/X3H9XFOyXcCtNpOebUKvWzG5zWSkxXovdCo3o4ceU=; b=ST3XU8VwXZdK
	mtYhcVE17/zHuebql9pQr0kztSi+qppPR9+t1LV8MvwBhks2Q88bb+PEG76C0asf
	CMD5vvbC4fBo1Kgu0m3MUkG06w5VZNAluz4DQnnm1T/LDYw78OzncCGCg+qpZS+Q
	Er/aS/ykSueakqZ2zuue7tEXrWD9IRVXcxgCugGlq0lHdPfxoYY9wfIOs8FuNBwQ
	D9QPiyaoZ8R80hKRd6/T2bl4ug05WybhF18Je8sU5CKKpLhP0rvrDZqvhsobi/Jk
	CvUv2Do+D0wyjKalkjCz4/AQBFuWnBWOepsXBZiFjv+eQxX75eZICSEs8XSuMRXb
	0fBU9qaBFg==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2072.outbound.protection.outlook.com [40.107.212.72])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48ur99tckq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 02 Sep 2025 07:44:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qE+57h+YUMZnB9Vhxaft8LR0Cav4+tl6r6m1Yxs+QikshsO4VKIP4s5Mjs+8MR67/F0H4Wa1UO5i4URsErD9dR3z1xb2Bp8RI1hPKpjNnsistt5cQa+xqhE0ZEfRwv5fWjfJZnBFf8ue5VoTulB9aH3ABrPmnPvI8omr52nHNzZeBamxPZZ8SsqfKIp0wLkwZtB3EQ/XTW9S2/cWxa1yg3JbJIBkeeyzES3InbArzJlarigk5eSA3t1dljOvK/YuARfINdEaJtxh+vt+qAKHxzezDgK8xcBjsIz18hDeR3fbazbt9SWbPZ61Z496z/yb4Eo0JFBil8Iug6g0qYk+KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/X3H9XFOyXcCtNpOebUKvWzG5zWSkxXovdCo3o4ceU=;
 b=tbXKNhTz+zvlGm4Ho1XNklZR2NRQbIcuwce5l6kzSLCB14MyBblMtoRj1zGkhg9GYNELFGukdNiolWP0LlkRo6cnQZGYmw5nawpgMn8rlc/x/8ayd0u9/+OnLpGuwwAB4b3dhzQhHir5GCmHzfTcH+AQksJM46GaaFr5AgXtUFEmpW21tJ3Jl0aZAM2fYRzgzeTmgaE4kJBV87SdbZYpcsQijB/ACkBvJCA8+VhgBmPArzKsi//ZMUMXxCAhFXpZDPkjr3/7R0i82GY4f4JuRT1NUBHJS7x71UipuSwYPQcO9BlrgDQTO8UTHIopZzs8dkBme0NqY3QHFyvfboTddA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 07:44:47 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%4]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 07:44:47 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 2/7] gnuplot: fix CVE-2025-31176
Date: Tue,  2 Sep 2025 15:44:27 +0800
Message-ID: <20250902074432.1068537-2-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902074432.1068537-1-peng.zhang1.cn@windriver.com>
References: <20250902074432.1068537-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::9) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_
X-MS-Office365-Filtering-Correlation-Id: dbcd3b2e-f527-4f58-9eb5-08dde9f49707
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OaVuVzbMpyJOb7YlUY0oZnJQijb1BSj8mG6XJGtz3mKgAiMj1odnJrzrQI/a?=
 =?us-ascii?Q?eFLKyLnOBif6sQQJEZmlz40CkUamA5iyEr+h78UtfoTVc1tOWj/dHB9+de7+?=
 =?us-ascii?Q?nuarIm7FXA+AmpgANjptjEvyTHqvGIzKtD9onQ/viKaNiwcXN8zMljsVJ/mF?=
 =?us-ascii?Q?coyq9sx22g0rWfVqX0cNoHb5rwfHbdraiY26sZz9FtjzY6+OqEGutDth/63c?=
 =?us-ascii?Q?+m8ThSKFc/r0BnFNjnZ0zSHiF/SL9fKRFGo5ic299Hle7wR1Ts+PxtQDOKaX?=
 =?us-ascii?Q?RzBqd6WCnWvc96AC4lB+H5TiGUPuO3/CX6gYbA223Mjy/VST0deKq1CPLaws?=
 =?us-ascii?Q?+m1ye9leHLOcA4/na5kFUZaniF4ThfG+xyLZay9lTwdzxnjy3XL2QZKU0Coq?=
 =?us-ascii?Q?Q7x00+JXNogO2XT1vYXAjy5GhFG7Rooe+mYJxOcr9D7Xnc3zr4EQGgHiKQf3?=
 =?us-ascii?Q?P75IHYCbiMEuKcBHU8c+cv5YGyCfKP63OSw0d6mPsAGoaZZGiAO6S3poYYTk?=
 =?us-ascii?Q?n4RuP14dfvWtzKWbNNOAQ8HERmE0LO6XhnzYTRPdFMQ5juQoQymtrykDHQOH?=
 =?us-ascii?Q?Mdrj4wNiRb5z/wqTU7ycUooTJVggXYEBdlp5hDbjs9cVwr25rFPkUcppwtj0?=
 =?us-ascii?Q?h7Aapx03DBVBw4JqhjkWojcHZpBcToNEUpgIqs7EeIiVvC8lwoW5chsW9PlN?=
 =?us-ascii?Q?3NMWlDwVVIDWuEwghSxB8ioqJ8/LsJHaa+YXZTHwTXUy9WXxx7R9wpkN1vpC?=
 =?us-ascii?Q?UyMuRWMydbdE3GQyNctV1a8uZOBNTiy4Kv/15q/cUr/Y+ReWEUsuFTC4CYUR?=
 =?us-ascii?Q?Jom7UglyPy6JJsJgP7+VBYnQtHt68i3TEQOeHoVIIVFSq7QDILcKbMByRXXB?=
 =?us-ascii?Q?zY+Sk77KHv+21wTURjLwzuCRfHlztHNvuSAYlQm34BcIyvRAxB0bJv7T3l1h?=
 =?us-ascii?Q?62V8LQD7GXvpz8Qnf2EMsi3Qai/zrUBtLI4dT9DaUb2iT2RqG9JS9Mr2jDWb?=
 =?us-ascii?Q?tZGVKpwsyUapY8kMKtcdOCzpNlFz5SRhZPaFHlKddB23RIzFp5HAq9tNzfH1?=
 =?us-ascii?Q?182rBPAOcRPKG0capYR67imfX8kuzabqUDpaBDWq7Smm67USLxyqi/a2w4dY?=
 =?us-ascii?Q?NcrV7TNK08iwnqOJvAAl1mkr4c5GswskFTRQROovvHRIA/cFLZQGvBY/plJt?=
 =?us-ascii?Q?WMv/SAEavdXJD3xrDOJ1LsVbnRgMpNdtDv9uhlC8wskHbJMFkByqutkrOtit?=
 =?us-ascii?Q?Ja3LdJh4HByNC9LjfKqM1yvbkxSzUUSa1gCdM2yyMzBQr039MjFE4xjnSNEU?=
 =?us-ascii?Q?I7+VDx3Hix1i9n8FzbjRtQrqDzkUhPEJJGBoVyLx22VjJonKm5JTydHtfbIS?=
 =?us-ascii?Q?367PKXSeUSfQtLjr8cYqy0EZzZL3I3AsUZiaAEpA3DhPII2wx9Rc90Noj9G9?=
 =?us-ascii?Q?TxBp8nITqI4ogxmpQtV1VRRbu0WwN/RY?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zTk8odP67MXPWv56FqFUmmbxvimzB3YkRdAGN71dBChDF/X93ti1ZCmLkemO?=
 =?us-ascii?Q?pnY/3gVfH+MXsbzeJkwxIiitroAnLl1/ZDSRJQcwv2lLUGwFFsEP746nhtst?=
 =?us-ascii?Q?yTmg0no6GHMJEFN1R831HCRFMkxSncNmHfheWk9em8IACDXYCvhfYzhwpqQL?=
 =?us-ascii?Q?/6lNcWRjipCnkhFpWckPNJQqSFfpaaQQnAnJC+hZoyUXKERJZqPrXuaAsdCm?=
 =?us-ascii?Q?NlTmzQ0GiuMmOiuGKZHh4A9FVCaBL8+i9HrzSGBRN8Y/0MD141B0EkuKvg2n?=
 =?us-ascii?Q?fYvCQ8crSu9zO9IZrKxHIr7Ay4L/skW+o+xiVRPxQxUOtVNRObkCtY5YOL5m?=
 =?us-ascii?Q?lOTVT+CKOiMynCM6h7ZYGIUbK0eS+Z8E4eASIKOYXxu6ZkHglo6SyIpr+6W3?=
 =?us-ascii?Q?nNBSDAZZbOsK/qzFxJOj6myXde+l+SKDtyjnWzIrAfyZu/B6DZek0RI0o5iQ?=
 =?us-ascii?Q?q4bKwWKJkKAzwgh1rOcI5D+ItBnMwQL/QH/zRX9nsIb/SfA/EiMSmAEMAuas?=
 =?us-ascii?Q?JA7hOTQmPkpjM4vnJPS38YCfMmPLu4Yik1rLGEQEZB7DS+FceqziqrFxR3Kq?=
 =?us-ascii?Q?F+cB56NMySOoHr/Tj/J0MbzveCuxzkhARUWTz2u4UAYylUrNehRw1yLZkBQA?=
 =?us-ascii?Q?0oBtyPkTBkWaAvuAF8hLvr46fy8E/XJ7nUTSisudoJXkgoEjlHUrHvj7FjRo?=
 =?us-ascii?Q?4QQ1oQBSGF8mV+pxb3JFXKZEA7/p6Uj+UGkGNYYFjPXD5J3eAiXYp1dFtUEj?=
 =?us-ascii?Q?mgYW4l+SLHTshnfYUg9U/9gnZGPcJRIT1F3o9rUizV3WticQBZnRNRnImVPC?=
 =?us-ascii?Q?El+tK/0SMm/fjoZy5383/f3IYkXLsp56yKucBkflEIkor126KZNJsi9/NubA?=
 =?us-ascii?Q?vleTBTJ6p8+YoFMAFFp6tYNJQdzSvxJ02pyAIDJSYl+Je3gxtkTKsfF/qY4v?=
 =?us-ascii?Q?03Pi413XzhdsC2v5Klr6bX25ZOZgICGpZo7iGr/OEwMZyDA2OODcf8ppD7PF?=
 =?us-ascii?Q?1H3+6nRRflJGor6Vn8FEEaAaeJCROXg71EQhWq9QGxnrTsPQzvjrUivBp67K?=
 =?us-ascii?Q?g9cMg5/d1iwYMdd/VaGd2Ht/e1Vy7mP5LingU32Fcb7Bb+u9E8Lf4rYc1AJz?=
 =?us-ascii?Q?Eju0iKm7rppqhu7qT9KfGawCcpZKv8M28PhSagYLRlpU4pXa6x/VnbTmh2HE?=
 =?us-ascii?Q?O515/qz5MH68OpMe+dW1ALp/v8hPB5T2xnFFMwkqfy/DcDEQCp3QmNyRvj7Z?=
 =?us-ascii?Q?3U+rhahy11PP6/aXwaAq3dN8SV7V0zkFb9cc7x/aoebS2MRysrYMr6O2dfhx?=
 =?us-ascii?Q?zGJFDLexQyYTd7f4ZqeGSv08J8Bg83fk/EuL3tk07NaVfSYMqMPB9UT7RPbu?=
 =?us-ascii?Q?QnVNF5wxpl8xyYKBJw45Me9Vv4nuU/VIHrrv6RpViSjALh1fTePCPd+exuSZ?=
 =?us-ascii?Q?eTI7Q2qAywVFghOxjjkkeBiFQ43Zda3JDR78FVlCNeMBqxYguNEh9j/mTIHq?=
 =?us-ascii?Q?WDr6xNtCA1SAPlpeLIdht3Kiurii6K4Fhu4gQnmpLHaNCZ9tVU4SI600iuoJ?=
 =?us-ascii?Q?iMNK21QDS+JNcY/Klu+t0VQ/AyZ/wDAxaiap9Tfsx3bhUS4VuhyDIz4zQD1K?=
 =?us-ascii?Q?Wg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbcd3b2e-f527-4f58-9eb5-08dde9f49707
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 07:44:47.3975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O5J9w39OAjfGmdj9p8uI0gPYSOlKZdwWh2VPjNumdJUI2lLtkm2WKXc+jb5i785eeMGea6cb++lg5BHdB0ttKPMQtl5fIyBnvFoBvQ8Lpvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8562
X-Authority-Analysis: v=2.4 cv=FqYF/3rq c=1 sm=1 tr=0 ts=68b6a070 cx=c_pps
 a=clEwq8AbTxs6UVDo5+t0mQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=PYnjg3YJAAAA:8 a=FP58Ms26AAAA:8
 a=t7CeM3EgAAAA:8 a=ivK4z66iH9veIhaI27MA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: BI9DsRHWJH6i0s1reFatvhqkLE0R2Sb4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDA3NiBTYWx0ZWRfX2B3XiTtobulm
 TNafpsV+UlVEdEZO31cllY5nuL1P1lfPC21yCtUDn4/xIKzgHtsvFGN9lALAPjw9dVufUaG3Qfj
 /C9BrgyhBM2cFIIIHe6N1SgW2kKf8xQ9byE+6pp8c3TceF2vsocHwDIif8ka0hOWMHgYTJucluF
 6YqbE8cH2tRgom8h7EFw/ctE4r0y2Af1700vjqr/pBaFXk2qI2WAVymNv3UXydq6cB+zg5pmTLz
 f4hUe9QUe55bnnIPI2zl4ep/pkdx1vBp9hxHoPF+Enm3J4olgUsc0WMwuYG/gViqXFoo/4Rnu1x
 YYVdNZWeWUZ6Sy3JCKi0q7FH3Nb37DYNpmV6K+kJHu63WdGAxiV0weFL4Vswgo=
X-Proofpoint-ORIG-GUID: BI9DsRHWJH6i0s1reFatvhqkLE0R2Sb4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Sep 2025 07:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119170

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2025-31176:
A flaw was found in gnuplot. The plot3d_points() function may lead to a segmentation
fault and cause a system crash.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2025-31176]

Upstream patches:
[https://sourceforge.net/p/gnuplot/gnuplot-main/ci/b456a3ef618f55a20b3071d336cb20514274f1d4/]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../gnuplot/gnuplot/CVE-2025-31176.patch      | 86 +++++++++++++++++++
 .../recipes-extended/gnuplot/gnuplot_5.4.3.bb |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-31176.patch

diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-31176.patch b/meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-31176.patch
new file mode 100644
index 0000000000..7fdabff476
--- /dev/null
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-31176.patch
@@ -0,0 +1,86 @@
+From d0664704daa46d2e4440c0c50057d0dfa47467ea Mon Sep 17 00:00:00 2001
+From: Ethan A Merritt <merritt@u.washington.edu>
+Date: Tue, 11 Mar 2025 12:31:54 -0700
+Subject: [PATCH] guard against invalid read from plot->labels
+
+If a plot style uses points and the point chosen has PT_CHARACTER
+then the program looks for a possible font in plot->labels->font.
+These plot styles contain a flag bit HAS_POINT (gp_types.h).
+The program makes sure to initialize plot->labels for these styles.
+However a problem arises when a plot style that doesn't use points
+nevertheless triggers this same attempted font lookup by using a
+linetype that happens to use pointtype PT_CHARACTER.
+I think this is only possible with 'splot' but I added parallel
+checks for 'plot' as well.
+
+Bug 2776
+
+CVE: CVE-2025-31176
+Upstream-Status: Backport [https://sourceforge.net/p/gnuplot/gnuplot-main/ci/b456a3ef618f55a20b3071d336cb20514274f1d4/]
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/boundary.c | 2 +-
+ src/graph3d.c  | 4 ++--
+ src/graphics.c | 4 ++--
+ 3 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/boundary.c b/src/boundary.c
+index fd2ac86f4..60dbce042 100644
+--- a/src/boundary.c
++++ b/src/boundary.c
+@@ -1440,7 +1440,7 @@ do_key_sample_point(
+ 	    (*t->pointsize)(pointsize);
+ 	if (on_page(xl + key_point_offset, yl)) {
+ 	    if (this_plot->lp_properties.p_type == PT_CHARACTER) {
+-		if (this_plot->labels->textcolor.type != TC_DEFAULT)
++		if (this_plot->labels && this_plot->labels->textcolor.type != TC_DEFAULT)
+ 		    apply_pm3dcolor(&(this_plot->labels->textcolor));
+ 		(*t->put_text) (xl + key_point_offset, yl, 
+ 				this_plot->lp_properties.p_char);
+diff --git a/src/graph3d.c b/src/graph3d.c
+index 0d3ca7221..48b02f580 100644
+--- a/src/graph3d.c
++++ b/src/graph3d.c
+@@ -2016,7 +2016,7 @@ plot3d_points(struct surface_points *plot)
+     /* Set whatever we can that applies to every point in the loop */
+     if (plot->lp_properties.p_type == PT_CHARACTER) {
+ 	ignore_enhanced(TRUE);
+-	if (plot->labels->font && plot->labels->font[0])
++	if (plot->labels && plot->labels->font && plot->labels->font[0])
+ 	    (*t->set_font) (plot->labels->font);
+ 	(*t->justify_text) (CENTRE);
+     }
+@@ -2111,7 +2111,7 @@ plot3d_points(struct surface_points *plot)
+ 
+     /* Return to initial state */
+     if (plot->lp_properties.p_type == PT_CHARACTER) {
+-	if (plot->labels->font && plot->labels->font[0])
++	if (plot->labels && plot->labels->font && plot->labels->font[0])
+ 	    (*t->set_font) ("");
+ 	ignore_enhanced(FALSE);
+     }
+diff --git a/src/graphics.c b/src/graphics.c
+index bdbebe92a..2b500b12b 100644
+--- a/src/graphics.c
++++ b/src/graphics.c
+@@ -2353,7 +2353,7 @@ plot_points(struct curve_points *plot)
+     /* Set whatever we can that applies to every point in the loop */
+     if (plot->lp_properties.p_type == PT_CHARACTER) {
+ 	ignore_enhanced(TRUE);
+-	if (plot->labels->font && plot->labels->font[0])
++	if (plot->labels && plot->labels->font && plot->labels->font[0])
+ 	    (*t->set_font) (plot->labels->font);
+ 	(*t->justify_text) (CENTRE);
+     }
+@@ -2475,7 +2475,7 @@ plot_points(struct curve_points *plot)
+ 
+     /* Return to initial state */
+     if (plot->lp_properties.p_type == PT_CHARACTER) {
+-	if (plot->labels->font && plot->labels->font[0])
++	if (plot->labels && plot->labels->font && plot->labels->font[0])
+ 	    (*t->set_font) ("");
+ 	ignore_enhanced(FALSE);
+     }
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb b/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
index eff2ccc98c..18722b3641 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
@@ -16,6 +16,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${PV}/${BP}.tar.gz;name=a
            file://gnuplot.desktop \
            file://gnuplot.png \
            file://CVE-2025-3359.patch \
+           file://CVE-2025-31176.patch \
            "
 SRC_URI:append:class-target = " \
     file://0002-do-not-build-demos.patch \
-- 
2.50.0


