Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B591073CA7
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 12:29:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.105251.1775651385985371056
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Apr 2026 05:29:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MFd0mY7w;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=855830a691=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6385Q7V61961866
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Apr 2026 05:29:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Jvkag+aaw
	HeuyYukPAc/J4DSoN6RlVOTGK1kavhjlPE=; b=MFd0mY7wXxaajLSSF2MZGeTdI
	fWtf410BE9knBpVLddYAdxKHYKpWYKTti9Fgz2RK/o94yQ2h9VjDv1QJSttN/4BU
	eRD2Ptdz8Fy81R+UcOpw2JR0De/egAUVoidFAYFtTNMRpDlkgDT+Pn6JJX8rdsZg
	2T49b+OqhEylCQrSx6IWBd+2CasCA3BQpyZqlDboF6EDf0YrvNDMr9TRhSej7tMy
	jwyCr5KKKAfjJszKKmrdiYZmElZs2Qi44w+xDa3Jh9I0pJbGW+tWjQ59Md8jrmtE
	FpilHWxG8r38KYzAOBH0rTB72I2Z3VB/ZfX1e2LK+0GVoX+wn6ig/Dpp+NIxQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011040.outbound.protection.outlook.com [52.101.57.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrmjeyp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 08 Apr 2026 05:29:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oHYOFpnrefdFMcAhktBKa2uKYvS9xqA3pXOba2Z7xLJ1V/0WjlbUTdyE6vfLt499ZxCluAvrkiE7BHi0v4Y0a0lI0LC+pzoPm4Yz7+VnOb5UVR2yVq6FSQYvVRXNLVm9nd2MbnzTjIXHp5SPcm4yPfTw1qFHFMhmVBd/RPBTgWRE0dtOHrc1p2kg1ff0QFY4hT9FXco/vXNyOr6z2t7EU/WfWq5CPwZYS+lUhwoV5DsLMknNdoR4URJWpllBMJlwnDXFGnbqM0oYzfYD/h73U4aMpd/fC3DwV0nfBoSsW+Fe4jCKUq4lqiJnMWcSSzqKL3Nvsd1eh8cVKNUmz9i8ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jvkag+aawHeuyYukPAc/J4DSoN6RlVOTGK1kavhjlPE=;
 b=LRo2ceFO19BA+oEIoP/Ql3MRld6kW2Pz/sKLXNmTaWVMf/Uh1kcM+TWteZL+tQV5m8Y4OPstA7WvT4oGWM6Gt7yhUYeW2ZlBKF/jqKDGA0q42MSQMqKaU3W6dWUog7JC0SFT52ON8UH/7jvv0zbCKSYgdOo0wrw0hNPQBjbCZ3PwIf+IRm/Ij51zqvKTdI3OmIR0fbzdm8VyVPJAqL0t5j5CXxdC7J0MW2grB47DlYbhD3+xdSY0QINinPgRw6mVije2sQGFbksLwCC5xMEA7CIZ5UBdrB4zxVl23j8H7XFgSzCns7u8JCzlywP0CAFnBCV5/6tXFT6gyQT8z5l6kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA1PR11MB7822.namprd11.prod.outlook.com (2603:10b6:208:3f2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 8 Apr
 2026 12:29:42 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 12:29:42 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-devel@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [meta-oe][PATCH] layer.conf: add bcc into NON_MULTILIB_RECIPES
Date: Wed,  8 Apr 2026 05:29:19 -0700
Message-ID: <20260408122919.4064443-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0068.namprd03.prod.outlook.com
 (2603:10b6:408:fc::13) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA1PR11MB7822:EE_
X-MS-Office365-Filtering-Correlation-Id: 35dc81ed-d9ad-48c7-3ab7-08de956a8235
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	XQ1BgJVXQYJjrRzlVq8FAdqMHbbYLPPLgOXfPMnW76f/0lOLYXN+aVFqSJFTHTiF76WeBRtkaAJxaW+56rGDCmus8ecnapXLtIZ9IMCn4rACdRrxq+uvuhGjttGIAV4Aoo2JXlrNCnf5ZSI2HOxUDNgqwByIO2SXPMVYbfxtJYYPYZSngnZRgn9VQk3+JqyK8+G+xma4wFC5rZMcZ2ATnvimRIRZEfJ22VhPZB9OZncwNtlLyUc4LJh0C14eqc5bmWeUlXpj61L5LFz3MUT6+vbBgsx9ChAVglZphhoEtK5i+uy/L1qAVVIn9nd6bN1Szo5PmF/A5dQfJVuH92TbMJHqCH1z/NiUszIl+rA1IM1Vwx1BKBsMFPgWlE1IvDMTGgM1lB5majlFwuQfJkCMqK0O26eZRjXie+viHNj6WKdU8RyZPPMSw7Ha5vKMhhX+gnyZGHgEz4/4H8sTub0bN1bqSzoGuHEttIkMbRoYKKGJ9BVkKOOqQqpOTPgS3+hIICZ22Qi8S8r2ZJgg+pMimbcA58D7AQwiXW2nNGatUxfn7WelGbvLrhu1gzegOkz5lW4k1Es4CHL64g8KSKABv3TwbHu/EE5l/1HG6ahPy6ncxZjjBhgcI2DTOD33IsQ8/ogEfcS4nrUmium/jAEUGYonr6GK3mgPcgQZ6+6rzW96GOY6WDUWHVK0oJsdl89semckQ9aP29qOaOURN+ftKadnAivZgiTRIHP+0lLa9B8CpQ1NxU2Dl4PtWtaIFJN1BezKjgwutxgnT5XN9yVMOIcAvfc7kO+GIux3+hG6jhY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9BP63TRFOq/ojBob8XxcyemJOH8QFYrmM741mxBUVwZAfEUEGlUa1yXbOndo?=
 =?us-ascii?Q?QEjJE/aK/uLZAYY+g1JLebNO+C6U6scIwmPPhkAKFApjCOYaiDM1rJSdPWNG?=
 =?us-ascii?Q?r38BCtYb/GHEklSn0fQnUz7Rj5SgVBE3DKLahmO3UulQ423581jx1DELVjW5?=
 =?us-ascii?Q?K0LKIxTEC7mpF9RIuWLJ9CWQySWgMo7unTX9FMeZMWYA1CVECgFrBDBrAIt7?=
 =?us-ascii?Q?p2ADWTsUDt6Z1D2kpxsOmeJ254u1Bwc/iWYgx17ZhK1f90IdEb5Fu2g1ZFj8?=
 =?us-ascii?Q?fIo5mBMyPTRZfJVGYCm9ziZOowPesbVPjNX/+qRC8U1RIDusyYKk58A/pdZg?=
 =?us-ascii?Q?X827z5iGVZnRcTyPBh1FYCRvnJClakY+q/FnPJOuiHEN/DjobVGs/VQzH3Eq?=
 =?us-ascii?Q?uhJiZoqunNdOLxj1WAjvtiYQcSYoA3EsLoCkW9JRi7tVVfQXpY6iB/K9OYTT?=
 =?us-ascii?Q?1kO/98lnyy8spC4L0eGDqmfTylrwJAPNF/dw9kGIqyiTuaiqPa2uWmhdNNd/?=
 =?us-ascii?Q?BZeo4V96c94GxQPhc4zDzTZaPUSZOQjfXLjmrcR6Wyd0miv9MmDwecsW+osg?=
 =?us-ascii?Q?ihlzF1d15mNf2ZACiq7byeHtUa57AMMNZgXWke403WU+XGs5BD3Bn1MH2zMk?=
 =?us-ascii?Q?/wj8hxkHxXqkcUZ+XUCzGcEUutMvha2WbbVCfyxxzAchdiNj+J/4HFNilZLz?=
 =?us-ascii?Q?RrkYYGrkX3GuB5WOeQDOeFnhKuB+X62hFwAju5I0uYN+wyv6gWALM6Z/0W8d?=
 =?us-ascii?Q?YTUTSs1MU4ZLUTCaMfM1Ocf/WPoSv1R5ud83ID1RUticUAi6kMlXMngH6huy?=
 =?us-ascii?Q?KRrWnu3G1Syy7IT8j0yYfjY9lWs7tK5U0WYm7+DpZyw+MOijaejGu0yMs9HF?=
 =?us-ascii?Q?zY/nJTZTZg1pCaZ0QcLREVgIgmbP622fWMSwA6EP+jxQl4X4ShxWt3Rcukh6?=
 =?us-ascii?Q?S95SD9RBqdCmaaGlWFwtCtW4aBxOkyNFZ3JACGJQs/Kl/wL5bdFEKHOQMbao?=
 =?us-ascii?Q?Z4EpdHQvSZBV2y3Hg+G95YnRAknhRWDazsdLwsmFxvmFiHSMFQ4h0HnxeWzZ?=
 =?us-ascii?Q?uA2z68PpZybG6GV05rkcD3vk62AalkCsRIedkYxyyAuDVTzaq8erHEN7MOsd?=
 =?us-ascii?Q?KYPO74uzWiHgoSx+JWSRZXubrP3of69nwjtEpN04LblzW/7SPwBP6rONxigD?=
 =?us-ascii?Q?PuBT7nGJObewiAq8+HMDQp2gJT5EC9D0z6BS9CPQ32GPtzw52DcYM4b8duE7?=
 =?us-ascii?Q?TiGqRhclJhX4MFRTbczmO8VKKwW5eEYkNc/QZif/I7IMTN4nV29FvMfQMikP?=
 =?us-ascii?Q?Kbky+DBV4eXURo3uCjTMX4VaekLlxJaHmr3BwUXBb45AlTD7gprSW/WHQkfi?=
 =?us-ascii?Q?tIr0UVOkiiP8RPFFIR5GZvmtSQCdtVI9YMaJAo+fvJlIV8xfjqBupc59f3OK?=
 =?us-ascii?Q?clLQUk5N3rfTvCbj9AsxYOtRuJHOCk9wN8igmtni2sgANhS7nSUPaT87Hruh?=
 =?us-ascii?Q?ZQpbPJB0S/gbfHEJx5iXO6JO1YpimQFVKSoEdsFPGNPlR+WpX27p3XiilRGr?=
 =?us-ascii?Q?PMxAJAFbqVnj8XILFhn2kY67K5n0iGycdqf0hLYpqrQ+JzDTy6qi04bytCow?=
 =?us-ascii?Q?I/XtrBhwpMn4E1UtcSMXERp8winW6gGl/21SJp+vf9sM6k4yDMFAzh9uOTpY?=
 =?us-ascii?Q?FlmLW5oqarxweUT9BRzFx7JQdkYtITD03iJOv9pJ6GmeNvVEBxaokx4lx5lX?=
 =?us-ascii?Q?v8hZivGbLahr4CJFdMbJaHPS/JKyjmA=3D?=
X-Exchange-RoutingPolicyChecked: 
	PkHE9euvxAVSeLgY7p1X1U77hqF5+0uLol1XJsSJNgocJCKWl7xZ+wA4Odp7FGR9vOai++aBEqxJxCrnUmfM5jLSrObGdUK7utCIGdCCa+KXtjz01PwpKFZG/g54J7Pi0z7jdYIzU2WwR76hKtQm3hIB4dxtZA/KiWAzw0heD9gMFXsIGzPCdDVwbwPtlw8Tudo9S1Vet5IVjwmFWjlEK40DZ26R5s1Q9Y+v18WjL608zKkAm4X/YDDo1DJ4edkIYyf4didiR6fUEwiKoAZodL1ccy8EoKbFPbch7KVh4SAo7SgZbjv3rUKt9BaoBiXDszbWN3zdBMHwaWBUD+OTOg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35dc81ed-d9ad-48c7-3ab7-08de956a8235
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 12:29:42.1259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DXbXG2JPMmqznKLmw/jbBTRyTY8bH/ZBWL1TtUPpIp9m5v6VnEFFJDshpzFRP5/nyzyXj+mkTgBfoOTddk5xsnAHl57BrRZnBB+JHlEIcVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7822
X-Proofpoint-ORIG-GUID: fY108um6ZGIgZkJgeencV1q4TAhnytMU
X-Proofpoint-GUID: fY108um6ZGIgZkJgeencV1q4TAhnytMU
X-Authority-Analysis: v=2.4 cv=PpWjqQM3 c=1 sm=1 tr=0 ts=69d64a39 cx=c_pps
 a=MmUQU4Mtsiu6HzSWf2FVsg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=E5lkeIXTZDYB532X7YsA:9 a=zZCYzV9kfG8A:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDExNSBTYWx0ZWRfX6/MAt2ldWFw0
 ny0fSUCgnch0eA4ff6oo6/mBii8CyN+htts5DkQE5kiN9d753X+csDGJj296fbgTGdHTV8eJhXT
 3z99RJUZ67NMfo1QQ6r7PALyJ19wleR1YEnaR9Gco6pePVIGK7SFcm5dFDKVKlLTS+TSRJG+wPr
 kJjSlmo/6Tth2HrNTW62L4JVErUYptNts8lpL10EY947zTXYhbKK2GctjHxaa9ujxDJsZClp7uW
 ynRM7FtpGaqRgaKmDDu7ztxn5lycBsBCYvcaWc1fHeMoni5sd9ufCDcHzpdmouAaDjvLOhnmvVh
 hf657YeQPwlfaAk12B2a+lC8zwgBolsvhTbbAs+xF8fyDvRLWY7tTd7cabnhihBfDH7v4CLgolO
 8f3ZOFcNbtv9bg5ManygHVCo+33/vG8lkmujwm6fX5mxjTu2qSRpx7+Z2cS6n/D813JmMB5CXBe
 xj3yuf8yY+Wf6rUj+cw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_04,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080115
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Apr 2026 12:29:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126107

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Here is the setting in bcc recipe:
COMPATIBLE_HOST = "(x86_64.*|aarch64.*|powerpc64.*|riscv64.*)-linux"

bcc only support 64 bit arch, so add it into NON_MULTILIB_RECIPES
to avoid expanding lib32- variant

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta-oe/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index c6974f6dfe..78df6e3c03 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -120,7 +120,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
 
 DEFAULT_TEST_SUITES:pn-meta-oe-ptest-image = " ${PTESTTESTSUITE}"
 
-NON_MULTILIB_RECIPES:append = " crash pahole libbpf bpftrace bpftool"
+NON_MULTILIB_RECIPES:append = " crash pahole libbpf bpftrace bpftool bcc"
 
 NON_MULTILIB_RECIPES:remove:x86 = "libbpf"
 NON_MULTILIB_RECIPES:remove:x86-64 = "libbpf"
-- 
2.49.0


