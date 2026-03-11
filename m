Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C25CDFD88FD
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 05:07:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13754.1773205623953069879
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 22:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=H7bJWt8i;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7530e974aa=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B3lOUe2674556
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 05:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=mVf/1sWiYSSepsH60YR42vLP/He0YEx1wjtllxZVt9w=; b=
	H7bJWt8iqA7smvdbix/M/a8/IKE84eLW8w6nAJfT4OF3A8Boye6c6Og+be18VuZi
	LlPy61Q5SdiDerFPGF10HJKDG3m0T4JYSvV6F0ubmjuoRjApQMbtxCRQgUNrMkX4
	zWzi5Fz0r0UkPvMXaQKvV2Fvbq4l7lA0/CcU5Re3tm4O5fmpvCgTiJclz1Tapu8x
	usPCn4yPMtnLbA/Avh5z2nNXcqEo4jA2maqkiGX4qJ2ImKJ0ye+94qGbw6C9CRWb
	wQizdqclEa6bFTIP9PcdtloxBzBR6+xmTouQI5IU/LBEIjC1yTDD0xoMYNLlBpqn
	Yt0WN3K7OX0Gf+Ibs8uihQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010035.outbound.protection.outlook.com [40.93.198.35])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cty22r4tg-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Mar 2026 05:07:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ke1XLrpeB6H5dS8JvLsEIrgxpchUqsU0bdqmrjCxPxtMeh+iK//bmkkBOF7t+RjAoK1xJbzl7kpuIU4yLv6EOacrqtIFU1vk1McFn1UKHQKA02c0cAWmMRaGeMKeoePf8sXQIQzwVLlMY4mmjkWCSbe7zza6MRq6jPEIGsqfDkEOeRHM/t5PDgkpQJYNImTt9BRGj8UUigF0qPmWXWx1nKAj7G5Rq01V/Y8UVZB1cI5RsyopxaQvR+kzUD/4lZy6SdcL+KV7o3FqmC4EDMtWvhkzoI5xD9jOpb9XrHwCrK+1UbBVQ124xDVR9TivlWrNrT3HF0HalBq/NHUSugUfDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVf/1sWiYSSepsH60YR42vLP/He0YEx1wjtllxZVt9w=;
 b=Fm6F7gyHOSKcqi9zpB09tiZtb3t4fUmFanK7Aw1FyrqFKaXxcvnoas7LarDiGtldP0aqXd0DP407wdabXTnAxxS5E9Ny85Oik814CWYp55SvoQBGPUf2vlY9NslHX2f7kVtj2920WcqOQA+SxT7fFigDNWneCYGgCD0OODPkTeCt/7mMqGF48M46Ur8f45jIulvpDL1KNkiQm1EIJx2D4AWfGn93JWFt3ObGHORB1aRLktuAR6sKVoaCcfBfCfiHknKh/ueP6Vm+S+9vs5F52wcyRWJ8UaFOBcJbEipslHzEo4bSdZmIjfzNDcazXsR1g9lvsgSLZxWXzoqAp07zPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DM4PR11MB8226.namprd11.prod.outlook.com (2603:10b6:8:182::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.8; Wed, 11 Mar
 2026 05:07:01 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 05:07:00 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: f_l_k@t-online.de
Subject: [meta-xfce][PATCH 4/8] xfce4-panel: add x11 to REQUIRED_DISTRO_FEATURES
Date: Wed, 11 Mar 2026 13:05:52 +0800
Message-Id: <20260311050556.2079418-4-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260311050556.2079418-1-changqing.li@windriver.com>
References: <20260311050556.2079418-1-changqing.li@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0144.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c8::17) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DM4PR11MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: 957dec0b-d377-43c7-086c-08de7f2c0705
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	PTKxbiBqe+WrMe5SB+ZzgE7Je/WeMjJ7iarj+BNwrykWwymiibA4ZYXSB2N+cGmYbGrFT9AwpEQEg0w27GFvEoDf9wLMuQemM1426ZihCty3xxkn0fEdfvCJpdSGWUruGXy/jOxCCV9b3GqFGaOz5YOCaaHzmX81VAKyhJLVC4W/HMe/JzbPhHfKRINcJhsLCRcvjnvtDT0/Kt9aEeucmtDFVfQSh+K5CiKaLflNqU1bOIhjdbq7KcwkTRXWDl+OOCrpaIGpYstTQV2HjYFwnFed3Ed75sYYuySAquVklNf2sNQZtXPFb2zrChrlNHs7ONQIQZz6llAgxzQ3cJWQcffZHDHD2/Nj6VLPwc6OuY5E7AFoEYwlQf3CozY6pgJjaOlP/muBnISyIjVAOGnhXEevjBmf+oAGIEDrF5T4mZ2+GOMHaedN00YQSNT1CBRFxyLtS4VrPWnKhJRZKOQnU9v0IbQPjZ9Jpcv9QWSvrKJ22mnBhBhEji5jcuQn3o6urnVNrw6QTJ4ufDFCDIbF3RGJaXnHC0OJP7S1rqLEX1d4vfWmrVizeKhW0BRtwAtWH+pi/fg7fJIcIId3RxmVEdoyImaSdwEfs2UeQBCWIYIHeARKPP8hUhjr6me8uyd/rx3+8z2ut8eOE/vTiO8KU2ZHk26CpUXsJbJx97tjtVWLy4TlZIHHWMlwXj0xQqW4TydVxhOQ9wPny512/zBBc33KEApR4rIL7waJ1j0NvoZ3xR2XDFGabl4+ThAtzkWWX1r7KMMx2ygcx/+S9YwbGwPtXEavSyTLB8DsGXbqp3Y=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hxxCVBsWGqQ9bk2pax6I4LSogJxCEqEnAIVpeQcCsCHxNJCw2A+m3iXhgdwr?=
 =?us-ascii?Q?XT07qaOFgWkRQupIGRm4olbthUZsNCKyT72n3wzsB6Jlr3AfSEyFvQcmUJ7Y?=
 =?us-ascii?Q?JneX40Du/8uaJocVauzhcmSIyvgRfZXw6axg9cDOvvRgI1K8hEo+hSK75yhC?=
 =?us-ascii?Q?9u/RrJkhRYH6UbKuPAC59tk6gE/tksrmszqMhK7QMh/PD2dBmuXTbHktz4aU?=
 =?us-ascii?Q?AmbrRl+hMP1W2IVor0D4gwm+9IGsrjwpfiKQbsKrEFrOnoSrWuzIUBA89gfU?=
 =?us-ascii?Q?aG1l8OJgZDGhvp1y2uV5d0rNOXeYheQXz2rLgUBYYNgzNnZgiB7Vw2KkZBhh?=
 =?us-ascii?Q?VsKfZRPWLkgCdLawRdQ5CgD5t9rqIumQ+8WuKjm8JjQ9cY8fzUgIC6rMjzG+?=
 =?us-ascii?Q?oNWZPzyCkGo3s+S9+BU/eOO1NUQykpLaLvJBSdnb5cb7ZyLFDwM8GkvpRcY4?=
 =?us-ascii?Q?eLCxpTXQ7vMnBWh2BVpmzGrAISrt8BkPKLT+HEa/OFUHyQb0NE3YPELbHsJT?=
 =?us-ascii?Q?+nK76Bchit2FDGhug+6QTARUx2HyIpY0ro43ITdYLOHYM4QkMWbEkX/TWMFX?=
 =?us-ascii?Q?4NZ+QJCwe9gojADTEVuV6lplaKFdV0CTOAxJoEp1bK+47ZZWJsseNGWwz38A?=
 =?us-ascii?Q?EgpsmWSl+JFf3K991SKVa8i0Fhpjyoc+xkbyFFu6Ytj53pQClnUCJPOI6wJo?=
 =?us-ascii?Q?LnzK87IrUtQ7M31nkCAz60VelhMsA62Xw8Otic+TCACK2m3W6LMFs/a0RAgc?=
 =?us-ascii?Q?14F7q+mjzJ0ohC41wbpwkWu/hWzEkqFKzuPxxb4vbfZmF2iY4S06avwJRtMg?=
 =?us-ascii?Q?vYdKW4DZtLNaHFzYtZ4KRsoj4qiZzX98ZwrVdXcpn5Z8hAa3IkgmTUkw31qY?=
 =?us-ascii?Q?byiKqOXiS/AaO2HcjcIq49ciLnEmxc8S8AdPHccfKC1/GZpuMsAfblOK7Ezc?=
 =?us-ascii?Q?OwvDjUYtUXTXoAZgt2fOhOkkrXncChIgIst6Z8S5wgvD1uNe0K5K3GuUceOp?=
 =?us-ascii?Q?HIrJIMhYMOqeD5yflCj7a462ycpBICXb7jjoKSA+DfsRowRk+ArigaHP138I?=
 =?us-ascii?Q?8isl9WhP0dSwRWK+GfghWNX2wjjrRvZ3Md73V1Xy0qS49U547wmOFr80RPgK?=
 =?us-ascii?Q?p2/hMBMEJWjAtwHw2WhX4yrJgpkmRB2jRRqpmUZ1X4a0wEUVR1z7RUnI6IvI?=
 =?us-ascii?Q?2K6AgOQiexIc/XXhTgaLkH2nHv+UZzWLIhi0vFZeS50EpxxyfS0nje+OvHRn?=
 =?us-ascii?Q?giFxyjLTqsppavBE8fghhWZIMxqaIlhqve6jxXcO6ortMWKwYWYYpp1OlhsF?=
 =?us-ascii?Q?lofcm6HB6JeJPyOKwS76n2OC8zB3wMbg1dcxvorGWBrCDTmWqil9RrZipTje?=
 =?us-ascii?Q?jUzCkiItdrj6UK4Uv9kf8MWHpnziBFNZ9cCDHtf9xul69RowZ9niiWQSPRdR?=
 =?us-ascii?Q?dBtmOopE9q+bVE+OtH/G6mRPwC/jPBOr0DwSDdCQEBf5/dKBt93YeDYyZWxt?=
 =?us-ascii?Q?2PVLfwX2hjW6/dER04ZcU5gD6OkAZiwseWgSBjn6VaVywc0gpHzRF7AK6L5C?=
 =?us-ascii?Q?HAW1pLMN+BCWcb9iJidTzKCv6UtijGzAMR7NTKYO0I18hJo1+XP84RES+xEl?=
 =?us-ascii?Q?rkMFVHL18A3zHhmT8SReGxyJnR543AzgqKP8gkCLKVQezSVgGw8vIK4ZkbwC?=
 =?us-ascii?Q?4bBAj/kDF/VzblzqVIrBe3fh5IZA/d2dQfljLJa30n5Cc2hOA6FTC0qLRa4+?=
 =?us-ascii?Q?S2Iu9s+jHWKN5ZiDhTglrXssTXbH8NY=3D?=
X-Exchange-RoutingPolicyChecked: 
	s0l1qIbZrhf9In/uY0mWTTtMDTdZhDehJMeI5yXGu8DspGLKVFpYojtMc8225rp127a3jXa18krZ1Q+AdvC0EH2Rt5Eu1OiRQ3r6tEdo/ceIf9xqtTKLDQ3g0YvZw/hE2vjS4pcCL+ktsvddl9YSfI0Hpm2T45vuCajmgKz6GZnLwrNfxwf1VO/V9nmUmsEqU9aSjhd19OgioEFuJACOvZx/CLHe7b3aMJFrkAEh2Q8Q0IPuxRXA+QQo1EhgkOF5AykfN1N3gQhEeEjyvnp+VE7X39NE/sxjHhJgI3FmZ/HyNChSTdgssSPGQFinmNUvpKOHyB3/w+HDY6j9BpRV/w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 957dec0b-d377-43c7-086c-08de7f2c0705
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 05:07:00.9254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fCkaIYlSnAJvNjFyDQxwFEHyWHOwms/N4SPseHEiUrVvi0BC1zer4D0bWB6lmKK5TRtX2qAV/ZXJj6Q1+NlFe0QPzzw+QZKOvUQXvEFQlqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8226
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=LqOfC3dc c=1 sm=1 tr=0 ts=69b0f876 cx=c_pps
 a=WVTIIPXEjO/6WBYygohQVQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=J0ANhuiYi7gGgHjyVd0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 4r4sHspAhrHfPtWl7y8senwknKXOkXDT
X-Proofpoint-GUID: -oIvb9WhmsouV1H5g_aIpZZnn7Px1bVQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA0MSBTYWx0ZWRfXxkr0VAxyQ5E2
 3c+sEelFnK03N38YwG985QoU+FBFkt4SNQoomPn9AG8ltCM4LyYa06by3S+zAid40ZqOn44ppUY
 ww6wWV/eth7hC9+RiPFFK6fOhdZbvyGpgobP5UY8pKPZ1EyI8kaN0PoiswMxrcUCmnWXDLJgLa6
 Ane8zeK3Z1dd30a2IvxMBKpinb9vRgQoM4nA7ewiMosv+2IIWt4rmXjMjlD46erjIyx7yjpHBtN
 dWkQ2UKTP1Be6DC4PHrid6gK0e6R/l51Hg77oZ9WE6VZvCOXnY/TnjqVJnnXN8ZoCfmjOBfNOSZ
 KLeDhNmKFxH/aJu8p/1iXlY4gg1L3PUCngrJlx/wN6UNCx+IaGURUZSZ22G2ItHRed/tFXrerr6
 x8gZOtxfq6nPGyorWjImErErEb4kH4jbj1zuxXczQYAUPG/GjQZvushKxpGv3CvhuAJe3Cz2Ufv
 Deq+CHUKHo++6NOfUXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110041
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 05:07:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125054

xfce4-panel depends on libwnck3, which only support x11

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.20.1.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.20.1.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.20.1.bb
index 8efa88b9d7..fdfe39014a 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.20.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.20.1.bb
@@ -9,9 +9,7 @@ DEPENDS = "garcon exo gtk+3 cairo virtual/libx11 libxfce4windowing libxml2 \
 
 inherit xfce gtk-doc gobject-introspection features_check mime-xdg
 
-# xfce4 depends on libwnck3, gtk+3 and libepoxy need to be built with x11 PACKAGECONFIG.
-# cairo would at least needed to be built with xlib.
-ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += " \
     file://0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch \
-- 
2.34.1


