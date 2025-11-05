Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FBD8CCF9F8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 07:40:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4186.1762328399823677194
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Nov 2025 23:40:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=N90mmtKV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3404438c32=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A56cmmM2275145
	for <openembedded-devel@lists.openembedded.org>; Wed, 5 Nov 2025 07:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=+71X2IZ1WlNvNyNd03X/
	O9lex1Nt97ujhnjLasIqLXc=; b=N90mmtKV4C3qbXyl2maXBHP8jt/2xnVdsEOi
	CssM9o7nEVMDK7pWurecg3JsvLdf4raVlUi/NsgoFiAvEp/qUSOE3LrkHnad1k20
	Smbm/cbrcWFpzY6gT069TpUdMjIHc07GfPNZsaPGI0sLwXYGwp0cwusgGa6dsWfT
	mrcoR+TSwshhpKq02hvGyBz8wZdU87sPMafUFhhxf75qUVaFoLlLpvdzfE5C03uY
	hf4MbaMhqIBWof68SDQ5T5A2af5ITO1E67JMlNVqaDah981kMZBXQNNghv/kfUXy
	f0a4JkEI8SGX5X40TpNotvrhwWwe0r2rcS4q+BD4yBY55RFqmQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010066.outbound.protection.outlook.com [52.101.61.66])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a7war875v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 07:39:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CWMnK6ONmxlSHjuXcnfOhkiIkBz+PN8NZ4Rfpus4gMj8j/jL08/Y28uNbTAmCQKjFflzN4IGLcK1OQVxjObZ41l8iUYMAuvZJWSTEnCRGSnvfJOJxkTX58edTOLsFDDdCwB9N79jpmeymJgbYaNtiFjLD2D/YDIPbdVtpRy2V7MKpNNBtpyp9OlVzn0F59vi5X732vLKZWoC3IqtVAsMQ6IgMTwjt/g3RAXuWMcUt/DvIBLN2YtB5NV8lvK9rQrQL/aR351cE+/V4Zwgp8TfRXz6hbWAdKX/eFuxwJsSu0vlbcJ54TrVhPwXtZWna7wPHvxRuX8JqmC1tA5/YsUrDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+71X2IZ1WlNvNyNd03X/O9lex1Nt97ujhnjLasIqLXc=;
 b=wdaTd4A0z+pcfgBTI1IkNWBGAdDw3kXqdgCQ4qnKFRAhC0XCpU/WbDvISdK3e7PrixxdBHOEZHPvxeZ/uQBnPY5ewQdESrumWZJ5N9k3yboEsyWo7ZGVBs+CSMHZ9K91smthfwjOpVlPzGJTBbRk8cmYRKkU+5dc67dMBkUaJaKGw8HXEahKut4I1vfXQG+Uk4yd9VX1JAn14JWYZZUqahXixpT3p/rhL7/OdbQkF+3guYVOij+qPzcxlnU6OH/IxbU4fODU/GsSul+uBZM/AIzafqoK9FX69QHCwTuwR5sD+LOnIM5E9CakDqjfLnzgVeHt9eFTqsaR7ny5Ivitxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by DS0PR11MB9502.namprd11.prod.outlook.com (2603:10b6:8:295::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 07:39:57 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%3]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 07:39:57 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][krikstone][PATCH v2] mbedtls: upgrade 2.28.9 -> 2.28.10
Date: Wed,  5 Nov 2025 15:39:38 +0800
Message-Id: <20251105073938.3187663-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0209.apcprd06.prod.outlook.com
 (2603:1096:4:68::17) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|DS0PR11MB9502:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c349cf3-0fe2-47fc-09e8-08de1c3e8484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sIseur7LfnKwOzTxDvxY8WhjwVl/qsG1ehsnKb+Bqo4hzfdzv9qN7jzh1evA?=
 =?us-ascii?Q?6tTRIAacEGWf3P3TXtTQvpq4NTmyTUB4w0lnlvCWvERgE8eMXAn9p+iV+mK+?=
 =?us-ascii?Q?nOQCmJYzXgXhNZ64+ZAnt2aqjzj6SioriuFJ6FGsd4OXsrPcSCN1uXyIFDEc?=
 =?us-ascii?Q?4sGUkNxSk3RirPRz5p27RfYzUODpCkbA1/9bMyaoxPDJmWlCx3ckYPUT9VcU?=
 =?us-ascii?Q?G/+gvLgTfpO33Vut8nCjdMTCT5t7xhMA7OQJqfCVPq6D7Z8M7rP7TEYc1/2S?=
 =?us-ascii?Q?0Ufa9plZZfU8CGVQ7eAN7puRHOkPnHPDBam6Ut+xayiHrIhVB6Yo29ZmmT/q?=
 =?us-ascii?Q?s0zpodknAOUaVMjnFEJgIc9wexmnp3uxBkxGVlm1FIC8boHDG5XHzBdNkMTU?=
 =?us-ascii?Q?UAJaDqN5yFNGaNbs3g4/5uhFKKMGh/X31gUHdUIR8DxkCvO+OEYK/fsybzYx?=
 =?us-ascii?Q?RmlJ00uyk4zTyk5rDBPi24hkf73zEt9hUvZv0FIpTfo/+7UEDY6McrKThQeQ?=
 =?us-ascii?Q?LKEFv5qM848FCi7wXA4w48aa40pZ6XHtlGab8WWjVxcK2EvGNa2t+HXSWmt1?=
 =?us-ascii?Q?1v469nBPetZAF6mKVPLtrIiCQ//5ZHvOICFX60oJU5G2jIFbv2L2osEMqtjz?=
 =?us-ascii?Q?jzzfw2D4a62webhcyxrCYIjxppZcVZv87aOWE9r+LGdyc1FUhXyG7S4olsZ9?=
 =?us-ascii?Q?KQxW0AsXq0lZqxve/K1flD2q27uETjIm/6tuYJiciI8Gy+A28YEK3IQiC8kh?=
 =?us-ascii?Q?r0yT1Et3i53e/i13R+ELv6Etivy0Z/l7ucKMCQUxYCd+n5s93rFoKzFeT72n?=
 =?us-ascii?Q?qxikfxwYiunxtBQQtn/oXRih8SYqFXaLiZhgf8FddD3s2kViHjo/G0BvtmX/?=
 =?us-ascii?Q?k483EegpFC2clh+Gpg8t2R5tnYJr1Mhhn4bI2739M8JGpk8Tl7hTQ/ovydrN?=
 =?us-ascii?Q?H4xr4q1gFZMi5uuFoPomJek9fmyHPrj3UTsDqwrJnFcYMLKmT5JPE2TUwvTn?=
 =?us-ascii?Q?47S+miKLYxURgkz+z5Y6Froeb/6/sNvXULTvrHXFRM/zVSPn+Q4nf8GmnElG?=
 =?us-ascii?Q?LalmsQNDN0IEBpuDF/2NfjaN2Pm2dI/8QVZLp/m94GbS2F0rJx07CCm77610?=
 =?us-ascii?Q?gL3sTOekQnmJeVTQ1I7qn3di94Dsi1t9bHLcznDEfw3Uu5SAqYoc4rX78UfE?=
 =?us-ascii?Q?1g+hKJrG35xFmbSuMRvqDgGISHzvbDn+nmw+upZIZhUZo7BL+K47PfoNK+dF?=
 =?us-ascii?Q?2/nBbRNcnI7zeudz3IEIDjlOL2GxakfNKloSKGAxxmAgNl1CqmnPtxU20uOv?=
 =?us-ascii?Q?euile2rae/7RUb6wJ/p0eC1w2XP2LDwhDNS+sgYdX6BLR+wq/k+HyDV5d3Za?=
 =?us-ascii?Q?3X31w23wJFkqVb+65GM30eKA2iTn4/rkEzn8X2WQ+gDUAc2Y9M0ubRlbjYbM?=
 =?us-ascii?Q?dM9ee7DR51Fl0TZAsvaEQYTJbhB1kuYj4ytsOtVsxibpyZEuNq0tEYhhzYt5?=
 =?us-ascii?Q?XI3jRHMs6uNHclgAdOycHd37mZSvE/w0E+Z3?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jG5ChKd/fpXH+oBwQQXENL/FiKnmMjxucZRRqaunLGd3hJ/+FIJ3rZUuUw6Q?=
 =?us-ascii?Q?p4MiRztn2llxs3cPPWH3M2MCmAjMNbTsXyrv7L/iV0OORWsv66QI54xALl4C?=
 =?us-ascii?Q?IKix7MKYTHYx0vLFYqHpESVE/6/VuD/J2F8vVgseiXtC92r0z/33536CnCGi?=
 =?us-ascii?Q?20h25iUjdjrnW6vOvKzq0Z+kMA6iof9SJ7GgkaheGJE5AM/caUwvKEcFbeUd?=
 =?us-ascii?Q?f8O2f+e/JwVDYVPaqfMHCFGyUC5TQMou+HMGGv7txdlTQy14UHKKPiHJxyzN?=
 =?us-ascii?Q?aOM8S+vI4m/4Ug1G4/vJww0E51UhyfBz/PbQMX1/lZCQttXR8nDJChh+hP4Y?=
 =?us-ascii?Q?l4WXvOdqQxRGDj15J0CMbAuEaD35L11HPlBnmMQB39gtPmk4jHX/U70huYnI?=
 =?us-ascii?Q?mRx+XZHu8xj2J7+gbno15ABorBCd1rATZDLN6rv5WAfDkmRIgVc792/CLWQn?=
 =?us-ascii?Q?cEB94f+AcZVQ8tsM+a8ESDo4e3wVF8Ix7OLIS5zqD7He08ZtS0jyIH2ikbd7?=
 =?us-ascii?Q?YWuDMXSIWsx4OS314vcT9vcNkrj1lYksrw8er3KkgEulmeNEg4Xa6We4s7aF?=
 =?us-ascii?Q?Dlv2oqcZQZD8dzoZrnR5Fe0LhimCvWEHLH/qUXN2hBkLyYB6HH5vqELSYVY/?=
 =?us-ascii?Q?Z+A1Y8wbQXJzcBzjI8/amE5hYUdzRQ9v9Rq1ASD3O031bWce04XGwovWdlTn?=
 =?us-ascii?Q?rZeduXA3Bst5UkZEAGvb2PvE/pT5xCX7YZhrg5dsd6aVRikx+LDlkEuyUIAw?=
 =?us-ascii?Q?QN5bgbUUx8zipQgvBOQyz5Ln1i+LvFFuNB4YH5ur/S/5g4Ucpp76CukAPibW?=
 =?us-ascii?Q?mYtEp1O/VyUscAE1hBzp9EzDAFWrLtHHZCiQ7arI8TIXH9M36TYFgLr4dEWb?=
 =?us-ascii?Q?nbkmc3m8wrOvTSHz5jI4nd84Xn0lqReqWnBx+WZPLnE9ai03WIBeYXdeN6II?=
 =?us-ascii?Q?P5cBSF16rbSxpEguFCMrHjJabTJnKjtWDtxWDfFnqhxabeo8uEUYGkEkdiCj?=
 =?us-ascii?Q?ZfPyY9C4jNS7zc/lWie/A7PWe64j2X9W/7WQPJSIWXi5iEJq0Y4KzPOYfv7k?=
 =?us-ascii?Q?tIeuKVaTOgIUSmJF48lCpYZ96dFoE1C1O9y7T1x0yFkIdTcjyW/WjDJlSmvb?=
 =?us-ascii?Q?NtXWJCh3jtDsbrtnkFDFaK5jjF/5KroIGxaEkQz/36zuSgkB5M+O6SkV5CG7?=
 =?us-ascii?Q?g3SIPGo56mgrrbmMxqAsTRmHFBQA9ePubvdD5yLjxBNdEY/znfknx3rUecP4?=
 =?us-ascii?Q?ql3rKj5OglaQEfHvBpWmy8d/U3LzenhN3ah2p802Gkqx0Oa7AgKj+FrukLlJ?=
 =?us-ascii?Q?1eERSO7Jp4/vnTBfJkhl+cm5nIoG1FRlWUu6zzHmiJZJVk+74OsO3iRdbU2S?=
 =?us-ascii?Q?yPpIFDKrE7zsrbN4GO8PdrXCb7XrbtZZCb7/vpXYRh/UzMKmIKnqDj8IG837?=
 =?us-ascii?Q?I0WtQSFyf7dopMa6+/rUgmOIQK9WbFd0Ovzhh2gtO2WzIEsAuTATp51cYYt8?=
 =?us-ascii?Q?eyS5RqA21Ax49JlYvaBslsSi9RWgaS6LpYj2P6DT60yvmkQCT15yL3D3EhqC?=
 =?us-ascii?Q?rkkNHoyg01cz5pDDUEocLMLtQ4GtSuS83TV90W//GLB3RC66OGyYixM3+1UM?=
 =?us-ascii?Q?BA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c349cf3-0fe2-47fc-09e8-08de1c3e8484
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 07:39:57.1925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uZc8gzQTPm16N+71ghQn6miFGxiQsT1PRCo1++l4yBVUvMqOtVGEsY8GNKPlEmK/+antTbrr2dbgxFZBlBaS1Smzflxl1+V6tmAXNZ1PrMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9502
X-Authority-Analysis: v=2.4 cv=UYJciaSN c=1 sm=1 tr=0 ts=690aff4e cx=c_pps
 a=3Q3Nz7QybYLir9TwqGRfQw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=w7DaXHQ_nlfINUCxHZoA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA1NSBTYWx0ZWRfXyNYufmvgf21W
 QkBRV6FFUjOuy3/t+xAfl5aoUCGgqx0opTDBkl8pyI+08ufxF/QKcZOuQIfYbU8IWUD9Eeky9Uz
 +3NWRA2I3btcVqnKHRcdK4bJDXX/WsS22RG4YQ4pBuJRIb8fdPypJMI05OEExjNu8Xud6N5832H
 I6/ghePcF2lgOap8UfjdabWrmVcI76s5m9Pwx1drmqfQD99/jQ1SAW2KsdsI8+GEQw5CdfIumeg
 62Cq1+0Q6MDmAcNQ54eZ20FNZxoAzucSjUa8UVwVKflPg6Whzg4wxcnQhVE2bJ8xgAabYgVbutj
 DIgTv2qJD3k68BX86jgWlWaM2KLpj36cBDognM+M6N02HcCd7M7Vnrlrf6syeDtS6PoskraWZbR
 8f8d6vLLD6gEnK2nn+4/P8XXsHwUQg==
X-Proofpoint-GUID: lU9zQAT3mr0rJocGXtYQwNCW3A2FP3lr
X-Proofpoint-ORIG-GUID: lU9zQAT3mr0rJocGXtYQwNCW3A2FP3lr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_03,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050055
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 07:40:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121322

From: Yi Zhao <yi.zhao@windriver.com>

ChangeLog
https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-2.28.10

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ca08c742230b758f6ebb428901d51169f1e6044a)
Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
v2: Regenerate the patch based on commit 33eb562e382d0c90fc6574c3de2fff3e79a414cf.
fix fetch failure due to branch name mismatch.

 .../mbedtls/{mbedtls_2.28.9.bb => mbedtls_2.28.10.bb}       | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.9.bb => mbedtls_2.28.10.bb} (94%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.9.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
similarity index 94%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.9.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
index d935cb233122..61e740389cea 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.9.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
@@ -23,8 +23,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRCREV = "5e146adef63b326b04282252639bebc2730939c6"
-SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-2.28"
+SRCREV = "2fc8413bfcb51354c8e679141b17b3f1a5942561"
+SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=archive/mbedtls-2.28 \
+           file://run-ptest \
+          "
 
 inherit cmake update-alternatives
 
-- 
2.25.1


