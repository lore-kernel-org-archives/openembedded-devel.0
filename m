Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D7221075292
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 09:56:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7571.1773914171368574506
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Mar 2026 02:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Nh7DEQNP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=753824cbf9=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5n2gr2534518
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 02:56:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Dx6h3Uu3cfS6WGsEuHBRPYpUj+BHu0Emzjya2VJ8qwM=; b=Nh7DEQNPkc0g
	SBwdIO/t+lsk0K4MwaXpoRlAe4lAvzR458rJTaOmJ08EocJcvPZr+gDPoq4GE4bh
	w7ILWIruXiMrhy6PzRVO8Jt/2ec0ysq/jj8wVstmCi+LEBtu6+JdzT+jOtCjdAvn
	qR5XVoumpcapWOZDx6UoH5+hnOQYvlUk9Y6j0eDN0lRc/R4rNaLx9vxLMMQpqnrp
	Kxv6GIlxP2BlTK6b8paKkr5r5rpu9teTh3cu5BHu3Dn1iKja9XxkeTyHaaI+AXw4
	u6V82e8+30mBF1oEVa+kv7YFXuzxtzgw9rsI4JfDhY73KZTyCEk8DBwekUSKSubm
	NJKI5NJFyw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010065.outbound.protection.outlook.com [52.101.46.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cw76dwy43-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 02:56:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PtNOy0T/UIzrHC3MZwbXlslCUWDJxMhUkourMAr7Cg6qunYYuO5os4YOGrBZwLMcNELeP1l6P2MEN9+gaWGU7wLRtCsfIynOIw2Sabnn7QV1XL26GaP4T+mS4uvPvJJn4uEolJPIILMs3zMoEEjLSvnm+qHWoU568JQvbPyTe2M5F2Wdw1DQ/GxDlIOvjvLWJ/uq/sQIq4uEgng4PbKPZ97haUOHEoRWP+C9KPyumU5V6wyuUAMmmZgJsPX90RMzqaD9PCajThDTAeeqevkA2pJakb6E1Vf3daceFOVtkd8uEB0O5bhTnAYpmOSPRsLNfyP6tEPHIvZ6wK/x+6HSbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dx6h3Uu3cfS6WGsEuHBRPYpUj+BHu0Emzjya2VJ8qwM=;
 b=Gy+kUqX/vosw6bk5eclYqsW/l7Gl2hme3Tpmi5b7xA3jrc8QDswlHhDJdWNFUd0wJYepz/rYgyBB3Aku+L1Sk66riHSTrmgbRQMhhjDd5Z6A21zwJcp8WsCC7OTvJ4yCHY/zJKOVqmjLdgJ4g5S7S7O4HYsxlRK6w5wvf9an0nuXpC4bWt0N2jvdXoSHjuPeB5PY+LX02OK4jLqKr2QGBrrQaSWMn3ULotKeh6RagS2MeNrT07Y7Z989fIoqsCH+rlbaucavQPEP8Vs/J2gxGCeU2Qeq6zFtCNb9Qz3w1u/8e3cY8eBED5o505lhDGUd/0+DBJxbfibiM1yBjVqJig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by MW4PR11MB5821.namprd11.prod.outlook.com (2603:10b6:303:184::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Thu, 19 Mar
 2026 09:56:09 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 09:56:09 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 8/9] xfce4-sensors-plugin: upgrade 1.4.5 -> 1.5.0
Date: Thu, 19 Mar 2026 17:55:46 +0800
Message-ID: <20260319095547.3614749-8-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20260319095547.3614749-1-peng.zhang1.cn@windriver.com>
References: <20260319095547.3614749-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0123.apcprd03.prod.outlook.com
 (2603:1096:4:91::27) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|MW4PR11MB5821:EE_
X-MS-Office365-Filtering-Correlation-Id: fdf2e23f-92e5-47de-b5a8-08de859dbed9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	a/zRHclO5jG5Q8lnuhwa1J0oLXW0oM2Vvb0A14ZhaLfBTALuKg81Sw6GbQscRiLPqBVIKHD3oASOL92JWpU95m8Vk1zR144/fjObtKcbgQvHQ8gSQ0Hkl9jRFwK1gyXZcGhmGfFfJAgZ8nH64pkHw2CVWu3/Ugc5LyNKlpUNrTaRVdBFZC1SbjAwyaEJBsQ9ME00k1fSRWVim+Ku88bRfXcCFPvq4Z55y9Dm7c/7KWmSTLFkxyLMyJIKSOcQY8Y7tDjlMPAfYfcdocsKCvTHfkFY8Do78w8vqyOVO+meELe+eEfeHzxt3q4Nw7d2Z+7d2teR2SWXJwkErP1wpwpR4fygmB+iXiE0EcK0s/Kn6UOq2my77BP9l39NAjrQq9bbV1yUoQhh/08apCWJOMExgLQceIGiQBdaR6mbqfAHKZcA4h4M/EDymgnBz+JLrdhtyiEmKiuucUgrgI4PlQQ4TaGkwOe5fkW+1isolASYUFGwl6oLIPB1Ag3NaxAKkq4ek3gWpPAxyYIpjSCE0hRs53F7Gfjwfcfqm/+5VAKDz2JubpF5DFN61WiHciNWRk+nIMz6CqaJslw+Cjuue52SM6N6nF8AQevG+1BCr6grMkf7xbbLK7QplKqN/8WaCk3/G2CSlGKTVv4HM8TBPK/P+ZsJoECEgEM5nbGAn6BG2BlYVfUdzjpdLBbqrZ/9RYMzIDC/MHu+PpbZlwTlKGlAGYJFjLc2C/fEbRIxbo80GpJlgOTKj3+08QiqLUk6tIJQqe6nBwEcCejnN+NTMnYBz0C6WcxEZEwd+SSTq+r2Tlw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?F/ExkhFg73pf39xXfEK4FwW0zybw5tXWa9KYdf4B4/HCMPqlTWDa3gY/FOAH?=
 =?us-ascii?Q?0vLCL0JK/V1NbSF3wcn9dOHLvRpajIzP/XgM/CyYa9kwZj3EOqpwOVQmEara?=
 =?us-ascii?Q?x+W2WOul064mVbnTkbe1RLEjAPml8xFUAMG8055AbsSRPuWi8J9ujOwz4bA8?=
 =?us-ascii?Q?tx5FRM6h8y7ACT2xeglnc6Xrtr260o5xDm0FBSmjNRzQSqw7tbiUGU6fOzz8?=
 =?us-ascii?Q?4dwC5So4oPW1xqMlXPqNBFVv6omubhjycVqQuvdmq6kA1uw1XH2w9mA2IoRV?=
 =?us-ascii?Q?eRadreY2EQE5gXskxiXcOyclPpO1HJfIhHbfELqPxIcOd3TLPa1zjL1hqNTH?=
 =?us-ascii?Q?xFHSz+cncnyB3ka3GtEDPW6860lFSfB+AqzyE5CkbtuH25jsgi03uuC8SGy6?=
 =?us-ascii?Q?RkiBSqH0D/PqRV0nrUi/8lwKr4kbaCWgX5Xklyie9IYjf+qaSKT1Y5c+fhug?=
 =?us-ascii?Q?vK+ACeSJedHLcXKbSS+OcmgN+g70fL146ncQwzaocCrxl/yi//5Fk2aybbIM?=
 =?us-ascii?Q?5HZf8LJnqBsoIWf6ROONtLn+EmOWvARm5nAgRacms3IPqzFz7lF7cVinly7e?=
 =?us-ascii?Q?VFwzWG5x/TyfPj8lcI43chgaAqozdUQiDgstwIcDGsW3ZE/aJkDaYlCTza9k?=
 =?us-ascii?Q?I5bnZEMnqgvnZSe83aXfOfMG+01X5sqlEMlnJxx9GAyopOzFRMVY3Qqtx/MH?=
 =?us-ascii?Q?+28CH6NgckUg+ZmLyVUzZoaOnpRuc25kfmE2hXPHIDjKDB2LhvJ7EE83jKPa?=
 =?us-ascii?Q?On7jWyLp5QpWwcu6DKRd0tMa7lRRQvP9qZF3hhg2YKtA7l9K7Hw4966+mnDW?=
 =?us-ascii?Q?GKgvZYdl4tYsRF9RrIJSsPIABLdYWEBaPccYHl/j1FzFcdCdLlvXMwLCOAh1?=
 =?us-ascii?Q?5AbX10/NCutpYSYy5oevR2KGZ/JqW7EmQ2c+mnH2fTH8jFRZWCql5PrV3UOh?=
 =?us-ascii?Q?jMU8y2vpVbLjkw0Hiq+BUbK/BegBUa93VNaLTICBcKmulgsNma0BoGeMufzS?=
 =?us-ascii?Q?/GAu9YdtFFMmlbHVSeoPU09IZw7YWHS2ga08YxV362BRYdY2cX6udTL2e0El?=
 =?us-ascii?Q?gJrwIFxz7cuYmTEjHA4lvQJdhUcmb9efNdfG3GquWcS9SG/Ss0mXNLBYoYng?=
 =?us-ascii?Q?6k4zwzT8/7TNLPh4LSoiA8Mp4mmRmM6oNX+Su2Inc+5HRLyQjIQQ2jhT3dN2?=
 =?us-ascii?Q?+KJDiGg2/5Cub7gxmPI2CPQBYDMjv1e9s4PXtbYY1z5ifzMU0ASuriXpofFO?=
 =?us-ascii?Q?B/ZfIfdQGGfAeLUJWWhl/p51JM4gBcKtuQg4D+XmMIBLPdF6wBH2a/OsMCz8?=
 =?us-ascii?Q?JJXRRP2u5g+U7n8+6Uu+mxfH1AxDlHnd9nis+7xe7JCVByNyjXl2kALWrYTi?=
 =?us-ascii?Q?QgEeIwekqGuq11yyAVS/MpfjiaY8JOfaV6cPT/cUYDbzXWTFzxGmJLdni7ZU?=
 =?us-ascii?Q?vObzRjRcKCBrnoCQE2/uVtVy3w4uPNN0gzFD3wlpsuL4O7l9oGQOFWZVKR+q?=
 =?us-ascii?Q?mHnc9YOB9VLl/QuiPW6wBcUxGOqdqs42hMuqYeuOFEDkSHJ0RHWhy/LjcpXE?=
 =?us-ascii?Q?oZGrEQ6X4fqC+f/j18OyOcdGrTNyYpNc8oqxBy8QGnqyNDSilI0N4MZdkE3r?=
 =?us-ascii?Q?r10ruBVq2tjbSIBxmOHu81t15IXiijMoc4NnmbEZU1xFuYRtEiRPtGvvGsKq?=
 =?us-ascii?Q?YaSfkOMQgAKBTHYwHSJexpABiHGNCeQVEvAIXHz+haWISmXU5BEpb544XMKA?=
 =?us-ascii?Q?RDrf/Goy+uEj/326BND1/t2BPPbW9W0=3D?=
X-Exchange-RoutingPolicyChecked: 
	GHNjDQfVsz8bt/9pKhMq2R4fbBCTv2ltK1okj3J5jF+x2cG8it+ne1Rm3TuRyynZhh6sofQvCteYG5ejwaUI9LWw5MAGnad1TseXfrIg0goGeRXiZEQG4Sk966rGFCl3QQP0kCAlZ0gvEixGgUX9q3HXgVJNq+70FMiS9MLX/Fi5WxZFao6TaiI72zxi1dSy10rPHIC3Y2ZgdvCv+SirA4FhNtG0+vUsUjic0U0rzrIiCco8OvF4GZCbfex3FQ00IePaFLLYcwZv2yX+gz6IrfxLYGsiBToA1Gn8kqL8NCbE1wqg1tJSAvoOdb97eQ9xULbg9vbIY4SPeDBWkkS42g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdf2e23f-92e5-47de-b5a8-08de859dbed9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 09:56:09.3607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xnAW+vqe3ZbrmmfCxnJh/S76DM5GHCUBToufxs6GwwTFW080bVzH+OXFsTRl+wn6YMEds1nO0Ddhg63gwB6wzvAbCVhtMkHBHHqUPJLt7LA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5821
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69bbc83a cx=c_pps
 a=0FlYyfQadWprtAtRvkXThA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=O24Aq5uEAAAA:8
 a=t7CeM3EgAAAA:8 a=oYTJdQYqYDpxuUc3Op4A:9 a=SYBONWESK5muIIdMMRMZ:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3OSBTYWx0ZWRfX0+ad+sGcCn0B
 XcA3OyDY5gcOgjEBKg/GLzgYjjauoZpbq2V1/L96s9QaRhM9PvF+5vBDssEXGvpUt21HyYCm9u2
 mE/CnE2CWcnkUZC4Qc8lhC6wKRDv3Lcfg69RJ0z5I8p3H8cGojwIrN/MdQaJqHK9Kt221JTo+sf
 nojifQBrcF+wEUffPGpWPi01E0aZJAOuRi4Iw3XUDUNIc1JrRpLi38fwwRUpPKbHWUF9FEPnCZP
 iGWEKm4sR5MNUXrDzdkxh6tjpyR/07kfv1ft5C0gaJvpGnD2ncBw4Dm2LUCA5IIVIpsdaRaXURf
 RdnkDmlBk0rXlPHJO1J8GMSVipzFzEChBXZGZ/hcnyNL5dFYsP+0NXbg9JLXRoqfnXf1AwUTBK6
 Pkg1PsZkyA6NFO7KIN9BZVyryAqak1U4vwRpSOpt46bEapAjkF3Vs5zeUQOMUopzvNvdxX2r2pD
 C/EZiay68hC1VReFwYg==
X-Proofpoint-ORIG-GUID: k7DQWzcsrOJLPSXyYrbmF9unFFsDT4aB
X-Proofpoint-GUID: k7DQWzcsrOJLPSXyYrbmF9unFFsDT4aB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190079
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 09:56:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125390

From: Zhang Peng <peng.zhang1.cn@windriver.com>

1.5.0
======
Meson has been added as a build system in this release, and the
associated archive has been generated by 'meson dist'. Although
autotools has been retained for the time being and can still be used
via 'autogen.sh', meson is now the preferred build system, and
autotools will be removed in a future release.

- Update README after switchover to meson
- build: Automate copyright year management
- Add meson build
- autotools-build: xfce4-sensors.1.in -> xfce4-sensors.1
- autotools-build: Remove spec files
- autotools-build: Make libxfce4sensors internal
- autotools-build: Don't build libxfce4_pp
- Fix libxfce4panel include
- Translation Updates:
  Albanian, Greek, Portuguese (Brazil)

https://gitlab.xfce.org/panel-plugins/xfce4-sensors-plugin/-/tags/xfce4-sensors-plugin-1.5.0

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 ...-sensors-plugin_1.4.5.bb => xfce4-sensors-plugin_1.5.0.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/sensors/{xfce4-sensors-plugin_1.4.5.bb => xfce4-sensors-plugin_1.5.0.bb} (90%)

diff --git a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.5.bb b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.5.0.bb
similarity index 90%
rename from meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.5.bb
rename to meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.5.0.bb
index d283684aa2..1d9f7c205a 100644
--- a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.5.bb
+++ b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.5.0.bb
@@ -3,10 +3,12 @@ HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-sensors-plugin/start"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
+XFCE_COMPRESS_TYPE = "xz"
+
 inherit xfce-panel-plugin
 
 SRC_URI += "file://0001-Do-not-check-for-sys-class-power_supply-we-are-cross.patch"
-SRC_URI[sha256sum] = "f69fdf79b7f76d2a81724828124a6fce76803a9122a4c82de8f3dfa3efbb179a"
+SRC_URI[sha256sum] = "840442b87fdddcd8595bd9f83ea8b81f771fe296bb9d2abf0e1979e208727ae9"
 
 EXTRA_OECONF = " \
     --disable-procacpi \
-- 
2.50.0


