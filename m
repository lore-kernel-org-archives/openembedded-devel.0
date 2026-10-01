Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E09CA5FD2
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 12:05:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9568.1790856322467019141
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2026 05:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rYqtMu/d;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=473490b304=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6918Ecf5955562
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Oct 2026 05:05:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ljhZgMVY9jb7WDTZ1tYZArXHLs9c7au7k7XaDz9+GjQ=; b=
	rYqtMu/dZ6pAYycQfD4mqxP3DyMfnnfv3wZasYe5dDP1mJBUTWWKGGpC8g5ivw6z
	jaJwvWjH4Rs+J9lqcbVNkJc++736OdTicCvXrknrIDWX6kU2M/mESfZ1P+u1SlRO
	AquvFCUVS/jBSBuzLswLCXPC3e7+BuZfYF20MqV7BO2DyFpoRyW48PQzpXumOz7q
	JgxtFWRFzbkD3XbEk11cQNTZ5KTt+cf9RNK9McefDuHAJP7BH+lqe/kXFTRItH9e
	/lYuz6Q8MnkUIhDE/IsdzZh9l3C7aS8WH3VNr5xZRgQ3D260KJegLlgR0sFszafZ
	ABLF05Yz0p9+RQsxtxTbJw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021080.outbound.protection.outlook.com [52.101.62.80])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4h1ku8gaqw-7
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 05:05:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qlfYvJKx0KADN3UkBHxlGPS/IUJGeYtmQfWA614+hhhOFtmczarrnz/ku5Fe2ushaMU2aySGO3mHok07J1GOQ9+BDXFqd0U4E4hZBWhbkA06PAM0N/f7Odaap1JaObwNc6kX+LhdpU1lzJy1aYpDr2U8wC5zqiW7BFfuxMqg4mMxRiiQ3E5VR6NdXU+lVwzwvr3XQX3APCJCTRj1RsYZHBx8Nd+FnJ3Dx+VtWBOVSsK7lq35hY54e5dK+FnlF44S6No6ZrKKsarRIkWpo6mJVe4UtmPm9ShgDlOOiHX8DFThYoihoyO+8XY0dqDnkXwBSuXwX4h/tptAQeNs/OKtzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ljhZgMVY9jb7WDTZ1tYZArXHLs9c7au7k7XaDz9+GjQ=;
 b=qO6cJM+9tDqZnKc3eLxlOHAXcydlh3hS1STaIMYEyjU5zqjLD1euYx34o3hUQuaW9knH49ScAY3pMiklyS4+j8LfrDco42FsgpDBBscNQT0Qu7gEZK+yA1yOM/CDGnG37preeT8fuIe7kwijoqvQPSGljMpvrUUEz7+aCC541O6a6sRGmtyMgjDftDsk1BJVJhlpTTT0VQE7Im1FOh7IWzNvrL9Ca9JB/Jpk2f+GFNovJUa4Rb548MpfbV7CuFcxiMXEIDCWiniv0+FP1+fbzpL5pFz7TRfSZCNG/AJk2zrxE7459qVPTjHh49w8mH12AUeD/FgkdSEnAxZegJUFQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9)
 by MW4PR11MB8292.namprd11.prod.outlook.com (2603:10b6:303:20c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.27; Thu, 1 Oct
 2026 12:05:03 +0000
Received: from IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c]) by IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c%4]) with mapi id 15.21.0472.015; Thu, 1 Oct 2026
 12:05:03 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Shiva.Komati@windriver.com
Subject: [meta-networking][wrynose][PATCH 09/11] strongswan: fix CVE-2026-78133
Date: Thu,  1 Oct 2026 17:34:15 +0530
Message-Id: <20261001120417.1280843-10-Abhishek.Bachiphale@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20261001120417.1280843-1-Abhishek.Bachiphale@windriver.com>
References: <20261001120417.1280843-1-Abhishek.Bachiphale@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0020.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::13) To IA0PR11MB8399.namprd11.prod.outlook.com
 (2603:10b6:208:48d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8399:EE_|MW4PR11MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: 6625bdae-42a7-4ace-7168-08df1fb437bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|23010399003|260925022911599003|260925021911599003|260925021311599003|10067099003|11063799006|56012099006|3023799007|12006099003|6133799003|22082099003|18002099003|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	auZ8LzRjLDb3PCKAVsjtvH0vbIkShwmBHCQFW7Y/ISZ2e9w+wHOon1DpP6v+2aPdNMBndBJFDVRbDnGVh1mXSmt61Y4TMGE3Jz68clATTCQA91i4mg/2A2kYnTyfjtgE5ZKIxEcXh4ahNPDH/PvYigJZzSLsfB6XmIwDOovvCpeNTpmAF7wZFF/rUFkBZlQL/Ylm1ZhuEBUGaaw92zncGvvg3T4nEHY+N/TLwEL0mvdddtXiBzx/WI6QdNjCwtNvhtzGFIKKFdBxGDPZPmC3I8LbUQvYJy1WdIEylPOxU6pJFtc6WlHXREtCrlNYUUjb99t7nv1K8/q4eo8N1Fq7WpVddEPtvy0KweXysGeQnKvhsl6AvX9Qd+4O6SStzhGFOgxoXHIWNhlm/qrMiUq6Vzbx4rLWqOGfBlMRLQa9IOO7sEuVZhiyutGGpgT6km56COke1XKioI/epdlHheNEvhlRFpn1nUeodaYd/gw733eqCBdJZ7vVjcKSZXiOTJJTikGP6aydWOy7S7Dx1PhdmSpDr3APbNl8uUgek+k/yP0FV9nKJYL4vQMOQxm9IwD/eqyG/etBHPu5ZTUti2+xQrbdvHsR7UwL4xi/RYYPCqIX0kTr/8sVn5I/Wtj14LHpUL2ieLa3LWDwcddxx4NYGf43PbSAwGX0p+Bx5cuTgkI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(23010399003)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(11063799006)(56012099006)(3023799007)(12006099003)(6133799003)(22082099003)(18002099003)(13003099007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PY2eHlzfWGCkISJAXk7EnUvs5fE1eAH5lIO5Q/aeqOZkXpGfOVDKOyXFIo0p?=
 =?us-ascii?Q?3+/Hai7C2Vj+DJ/h2wR5CfwSrKiHD+DBaip4x5HjqkUH96luUohLA1BbykDb?=
 =?us-ascii?Q?AF08B9BRklqrUtjFf+7+NLKKonP5ZnZ/lgMQ34RYdKvg88JA5IpqF94ubkrq?=
 =?us-ascii?Q?cZABbzjCj9FVLj+o2ygmkZejYX5MGMgVRNSctb8dlvORkKOJyVEZkDf5P3db?=
 =?us-ascii?Q?UIcMYqP7LId8oi1P5gzj0vF91MQCGfOvuURnBAlv3mE3CUIovc/6DD1Pd/AT?=
 =?us-ascii?Q?ScVkn2UC5m6O0hzrs81HNhMHFgRvD2TPBai594F58dsVGLd26U6ti2w06sDe?=
 =?us-ascii?Q?riDixYtFCZyQUx+v2DPNrZteWu4h/E83f21Sd52teLioR0LrsQDu+5Qzs0M4?=
 =?us-ascii?Q?RuiXVtekZFphO2i/LdXQsxBXd9tJku9rBh/eixR4yjfpq7kmhNoCXVZNZYCb?=
 =?us-ascii?Q?FPj9v5kzg6MxdJ8vfokXqAdUaJpqseK+Ml6BxFHylwaY/TsRM1zDPAYnVmQu?=
 =?us-ascii?Q?diwtzmA5OQoW31acdFioMY0dVqDbK0X/6/vp2ypVX6GqWbE3f3sZQiMdqDLI?=
 =?us-ascii?Q?JAIpN/YAk1ynXLhYwru76tPKuDxjSzW4+uATcPcJ8twi8lS2GAXInO9Aya20?=
 =?us-ascii?Q?peAe0DGuqMQpvLSbabja+xzygO8NQubIMnyf/TUxXNLVBz25bDBkngwJp3x4?=
 =?us-ascii?Q?HLaD8BwQe5IguDGd+3uTD+7wldhRwwp0NyVd89hSn+SYBhROB8xviBh0Xi64?=
 =?us-ascii?Q?/GAXA9MlkrwH2IBYa+I2uzUOmiFn55EH2s3f/9BPQolMu2MUUjMTABCrF3mL?=
 =?us-ascii?Q?oVWMW15xy9LDn9brp0p7nX2hSUqQKvf7nqbWkzshbcd6lcyIwvICYpkMwAh5?=
 =?us-ascii?Q?HP588rFkp8cCaRetr9yAllE6lvuzUEikPv5XiHeUzT5hhDvFmaRLeytO+6yl?=
 =?us-ascii?Q?bSN3ejebIhsl9B7OS/Odrt4kCTySIoQta3bxoq1r6AWr+ocBWt/5sfN9ymOz?=
 =?us-ascii?Q?pEuUSwKkE1TNxvpsaaROXZaRhsUp7n9GEUS+HUvuluN+I7A+Sr3EurKVKACp?=
 =?us-ascii?Q?QfrTZPw/Z0OmEDv/9tvLxtdxTYSh7gLMgVCsz0D8zG7ozFzq+M2j+ftcdu28?=
 =?us-ascii?Q?54hhaECMGF0kbOyn7zEbFBznv0t/e9cppu9WxOG4PfELX7E/ekvLbq8WitTv?=
 =?us-ascii?Q?4u6DytJv0EHpAz2rjzUk+q2fdVcAcCkUgjU93kNyfZt7RMKv0O6MahRMAX+i?=
 =?us-ascii?Q?edXdGfAL9fhmk/X52qzmFOairdJAINldeSL57n6R1b+Vr9PruMtFodQz09CQ?=
 =?us-ascii?Q?tQbf6f6OP7BHNCbwUE4VNoVIRua4+GyVqYlOTdtM46E+H5gXbv73DsL8xEhC?=
 =?us-ascii?Q?xPHnbE5oQkwAo7sBNSxJ+YlEoacnqh0qEsdXhf69nYH7RsUpJvfs7hTuFWK3?=
 =?us-ascii?Q?Iw9uXGWFJfhLonEQnA8wBhx/t47xgUzs/zsh0sc4aytSkK3q75mLCtIjNZvc?=
 =?us-ascii?Q?gJ8nVCg/hgV/jqg5r1eZDBP1yrr+D/kpavb0nA7Jj1T9hXInmm4Wv39ouxr4?=
 =?us-ascii?Q?njXM0qME7tjJbxiP4Owr/nPV/m3SRn8lZ9vDemT1Fy0CrojjstNco390ZlAN?=
 =?us-ascii?Q?+pR8UDNZgVWWzXxfDhf7BPkpMw4z5ZPolUJ1p8r3qEzodXjSrJD78mXrcP1Z?=
 =?us-ascii?Q?zq4+VuyGT7/pSLDCAQpJm9ZDeqMZC3PVDj/w31fSN3WskxASR1K3Oj/lJFk6?=
 =?us-ascii?Q?wNPEBrCq45+TJDuY45XS1rEm6db0p5uXvq6vT9C2gs/KzQ5U/Pd8?=
X-Exchange-RoutingPolicyChecked: 
	w5wVnTNTyrYKfNz8BsFGUw88NCvTiUU717Srj8NzVm45NUekQfhtPh0x/Sse8gsYrZCF0mALSyB021x+OCB2KOczFhivTYKKgjgGY6E8DAzNvYJWsJryY2vbBTtWlV0MFzaIvTLPqS75Gvovpd1UbxJMllhjM10dNzZxm4dagNqmbDkP8emt/YVsbME78vyW6tul3FuKxyoqeupnQ/cRsD+PPJN8GlmmVOX/qat+rDNkwr3/6IXmZr+Ss++TkIbJFpJouZtYRVFAwSC0/AqUkEQfombMORGu2zgqbBLJtJwATXbja9XZ1mzfQJj1XyCP5tBv4vVeRw0oc6QXypf+Vw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6625bdae-42a7-4ace-7168-08df1fb437bb
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 12:05:00.2032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t4VSp6M0JPUkbDwgG8mzeebouaDYZsH6RmYb2HcDgHX+5jVmhzrZ5g2iEF1iT2jkp3nenVLVkAr6a1oL2x/aUwePLnw/tm+cp75xkvNTRKh7OMQfg4p4oapEeJKRXlGJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8292
X-Authority-Analysis: v=2.4 cv=c8Q+0h9l c=1 sm=1 tr=0 ts=6abe4c81 cx=c_pps
 a=rDyEm/81vvKQCy/iKDMZrQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=PYnjg3YJAAAA:8
 a=KiMCiSwjAAAA:8 a=xNf9USuDAAAA:8 a=t7CeM3EgAAAA:8 a=2QDO3vGFiX4y1kXMoUIA:9
 a=sPCYT0qwnquSfqsKqTDE:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0NyBTYWx0ZWRfXyChlFAt4x/6v
 yuJ8yACbKII9W/qPhgfM1M2i4QnLTLCn0qxAnOhbBMiWVVjTim/iUsPRxdRumZjzzPvlijB5bv+
 EkxqfHE9ML6Xxqqh7bte4otXTZkawxQeqth5d6U2CNEhTiL3xApG
X-Proofpoint-ORIG-GUID: wnh3L9OycFa4dubNkPplPn2-Fs4P1-fq
X-Proofpoint-GUID: wnh3L9OycFa4dubNkPplPn2-Fs4P1-fq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0NyBTYWx0ZWRfX9wdy+mmKnINr
 1Okddln4hY+vaCEWXRPwOzAef1uITegnMzbNvGA8l+cpZ2UAQcnSrYrIYV6brOLxcYkuezefRPZ
 hAozFlhYTnfeucg6819CU978+mQKZAVRogD9ekKdYEEMVD62pPn9FasQMMYbgsIZs1w5tUUmx4N
 dMXIqbw9pxYEEB3+B6GweRfRM3dJ6eFUUrao0zaKUMuJ2btdGvoNNzteFe1bhbzty22d4zEFIz7
 CYkgum3LZ6BHUDMswo7/WjwEbrjK/mSvta28oO5JdmHIa7LoQVe8v13ugaw8xLBcSORyeaQG6JT
 AIsDWPLD4D4uTeYTlukvrKuZUuHdkLguhP+Kfl3QeGI8IpWju0zS4vBViypnKXefJYGInKKZZod
 isXT+qNxkr333WZbeFpv+61cu4LLnhjfQRXR8/iG6eFBSTsGksJWwlg1oUB02WfvgaaOOcIBbiJ
 Cm0XzaAxwQ9GMm4zmSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010047
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 12:05:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130588

libcharon in strongSwan 6.0.0 through 6.0.7 has a
use-after-free in IKEv2 rekeying collision handling that
can potentially lead to remote code execution.

Reference:
[https://nvd.nist.gov/vuln/detail/cve-2026-78133]
[https://www.strongswan.org/blog/2026/09/07/strongswan-vulnerability-(cve-2026-78133).html]
[https://security-tracker.debian.org/tracker/CVE-2026-78133]

Upstream Patch:
[https://download.strongswan.org/security/CVE-2026-78133/]

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
---
 .../strongswan/CVE-2026-78133.patch           | 622 ++++++++++++++++++
 .../strongswan/strongswan_6.0.6.bb            |   1 +
 2 files changed, 623 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78133.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78133.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78133.patch
new file mode 100644
index 0000000000..688b407c41
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78133.patch
@@ -0,0 +1,622 @@
+From f2b51e7c90ca8a0f0b10213ad581d950662b739b Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Fri, 5 Jun 2026 08:15:46 +0200
+Subject: [PATCH] ikev2: Prevent use-after-free during collision after passive
+ multi-KE rekeying failed
+
+During a multi-KE rekey collision, where the initial response to the
+active rekeying is delayed (or withheld), the active task already keeps
+track of the passive task to eventually resolve the collision (it can
+only do so once all nonces are known).
+
+If the passive task then fails, e.g. due to a missing or invalid KE
+payload, and completes with SUCCESS, `collide()` previously recognized
+that the passive task is not yet complete returned FALSE, which caused
+the task manager to destroy the task.  However, the reference in the
+active task would remain.  So once the active rekeying progresses and
+the collision is resolved, that dangling pointer would get dereferenced
+for an indirect method call.  This happens via the `get_lower_nonce`
+function pointer of the `child_create_t` instance in the private task
+struct.  So besides having to be authenticated, an attacker has to get
+two indirections right to exploit this flaw for a potential RCE.
+Otherwise, the effects are a crash or basically undefined behavior
+triggered by the method call.
+
+By passing whether the passive task is done (and would get destroyed),
+the active tasks can properly clear the held reference.
+
+Note that this patch includes another fix for a state change during
+Child SA rekeying that's included in 6.1.0 (4611f41b1e14 ("child-rekey:
+Only reset state of SAs not actively rekeyed if passive rekeying
+fails")).
+
+Fixes: d2b2e1b3fae8 ("ikev2: Make CHILD_SAs properly trackable during rekey collisions")
+Fixes: ca3e6d2d144e ("ike-rekey: Support IKE_SA rekeying with multiple key exchanges")
+Fixes: CVE-2026-78133
+CVE: CVE-2026-78133
+Upstream-Status: Backport [https://download.strongswan.org/security/CVE-2026-78133/]
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+
+---
+ src/libcharon/sa/ikev2/task_manager_v2.c      |  13 +-
+ src/libcharon/sa/ikev2/tasks/child_rekey.c    |  47 ++++--
+ src/libcharon/sa/ikev2/tasks/child_rekey.h    |   3 +-
+ src/libcharon/sa/ikev2/tasks/ike_rekey.c      |  40 +++--
+ src/libcharon/sa/ikev2/tasks/ike_rekey.h      |   3 +-
+ src/libcharon/tests/suites/test_child_rekey.c | 136 ++++++++++++++++
+ src/libcharon/tests/suites/test_ike_rekey.c   | 147 ++++++++++++++++++
+ 7 files changed, 361 insertions(+), 28 deletions(-)
+
+diff --git a/src/libcharon/sa/ikev2/task_manager_v2.c b/src/libcharon/sa/ikev2/task_manager_v2.c
+index 0f3b937fdd53..5a19ce85b331 100644
+--- a/src/libcharon/sa/ikev2/task_manager_v2.c
++++ b/src/libcharon/sa/ikev2/task_manager_v2.c
+@@ -927,7 +927,8 @@ static status_t process_response(private_task_manager_t *this,
+  * Handle exchange collisions, returns TRUE if the given passive task was
+  * adopted by the active task and the task manager lost control over it.
+  */
+-static bool handle_collisions(private_task_manager_t *this, task_t *task)
++static bool handle_collisions(private_task_manager_t *this, task_t *task,
++							  bool done)
+ {
+ 	enumerator_t *enumerator;
+ 	task_t *active;
+@@ -951,7 +952,7 @@ static bool handle_collisions(private_task_manager_t *this, task_t *task)
+ 					if (type == TASK_IKE_REKEY || type == TASK_IKE_DELETE)
+ 					{
+ 						ike_rekey_t *rekey = (ike_rekey_t*)active;
+-						adopted = rekey->collide(rekey, task);
++						adopted = rekey->collide(rekey, task, done);
+ 						break;
+ 					}
+ 					continue;
+@@ -959,7 +960,7 @@ static bool handle_collisions(private_task_manager_t *this, task_t *task)
+ 					if (type == TASK_CHILD_REKEY)
+ 					{
+ 						child_rekey_t *rekey = (child_rekey_t*)active;
+-						adopted = rekey->collide(rekey, task);
++						adopted = rekey->collide(rekey, task, done);
+ 						break;
+ 					}
+ 					continue;
+@@ -1011,14 +1012,14 @@ static status_t build_response(private_task_manager_t *this, message_t *request)
+ 			case SUCCESS:
+ 				/* task completed, remove it */
+ 				array_remove_at(this->passive_tasks, enumerator);
+-				if (!handle_collisions(this, task))
++				if (!handle_collisions(this, task, TRUE))
+ 				{
+ 					task->destroy(task);
+ 				}
+ 				break;
+ 			case NEED_MORE:
+ 				/* processed, but task needs another exchange */
+-				if (handle_collisions(this, task))
++				if (handle_collisions(this, task, FALSE))
+ 				{
+ 					array_remove_at(this->passive_tasks, enumerator);
+ 				}
+@@ -1029,7 +1030,7 @@ static status_t build_response(private_task_manager_t *this, message_t *request)
+ 				/* FALL */
+ 			case DESTROY_ME:
+ 				/* destroy IKE_SA, but SEND response first */
+-				if (handle_collisions(this, task))
++				if (handle_collisions(this, task, FALSE))
+ 				{
+ 					array_remove_at(this->passive_tasks, enumerator);
+ 				}
+diff --git a/src/libcharon/sa/ikev2/tasks/child_rekey.c b/src/libcharon/sa/ikev2/tasks/child_rekey.c
+index fb3ba2aafaf7..e984668c766e 100644
+--- a/src/libcharon/sa/ikev2/tasks/child_rekey.c
++++ b/src/libcharon/sa/ikev2/tasks/child_rekey.c
+@@ -403,7 +403,7 @@ METHOD(task_t, build_r, status_t,
+ 	child_sa_t *child_sa, *old_replacement;
+ 	child_sa_state_t state = CHILD_INSTALLED;
+ 	uint32_t reqid;
+-	bool followup_sent = FALSE;
++	bool active, followup_sent = FALSE;
+ 
+ 	if (!this->child_sa)
+ 	{
+@@ -423,7 +423,8 @@ METHOD(task_t, build_r, status_t,
+ 		message->add_notify(message, TRUE, TEMPORARY_FAILURE, chunk_empty);
+ 		return SUCCESS;
+ 	}
+-	if (actively_rekeying(this, &followup_sent) && followup_sent)
++	active = actively_rekeying(this, &followup_sent);
++	if (active && followup_sent)
+ 	{
+ 		DBG1(DBG_IKE, "peer initiated rekeying, but we did too and already "
+ 			 "sent IKE_FOLLOWUP_KE");
+@@ -483,8 +484,9 @@ METHOD(task_t, build_r, status_t,
+ 		/* like installing the outbound SA, we only trigger the child-rekey
+ 		 * event once the old SA is deleted */
+ 	}
+-	else if (this->child_sa->get_state(this->child_sa) == CHILD_REKEYING)
+-	{	/* rekeying failed, reuse old child */
++	else if (!active &&
++			 this->child_sa->get_state(this->child_sa) == CHILD_REKEYING)
++	{	/* rekeying failed, reuse old child, unless we are actively rekeying */
+ 		this->child_sa->set_state(this->child_sa, state);
+ 	}
+ 	return SUCCESS;
+@@ -1127,8 +1129,22 @@ METHOD(child_rekey_t, handle_delete, child_rekey_collision_t,
+ 	return CHILD_REKEY_COLLISION_NONE;
+ }
+ 
++/**
++ * Clear the colliding passive task if it did not complete successfully.
++ */
++static void clear_collision(private_child_rekey_t *this, task_t *other)
++{
++	if (this->collision == other)
++	{
++		DBG1(DBG_IKE, "colliding passive rekeying for CHILD_SA %s{%u} "
++			 "failed", this->child_sa->get_name(this->child_sa),
++			 this->child_sa->get_unique_id(this->child_sa));
++		this->collision = NULL;
++	}
++}
++
+ METHOD(child_rekey_t, collide, bool,
+-	private_child_rekey_t *this, task_t *other)
++	private_child_rekey_t *this, task_t *other, bool done)
+ {
+ 	private_child_rekey_t *rekey = (private_child_rekey_t*)other;
+ 	child_sa_t *other_child;
+@@ -1142,16 +1158,25 @@ METHOD(child_rekey_t, collide, bool,
+ 	other_child = rekey->child_create->get_child(rekey->child_create);
+ 	if (!other_child)
+ 	{
+-		/* ignore passive tasks that did not successfully create a CHILD_SA */
++		/* ignore passive tasks that did not successfully create a CHILD_SA,
++		 * if we are already tracking it in the multi-KE case, clear it */
++		clear_collision(this, other);
+ 		return FALSE;
+ 	}
+ 	if (other_child->get_state(other_child) != CHILD_INSTALLED)
+ 	{
+-		DBG1(DBG_IKE, "colliding passive rekeying for CHILD_SA %s{%u} is not "
+-			 "yet complete", this->child_sa->get_name(this->child_sa),
+-			 this->child_sa->get_unique_id(this->child_sa));
+-		/* we do reference the task to check its state later */
+-		this->collision = other;
++		if (done)
++		{	/* passive task failed, clear it if necessary */
++			clear_collision(this, other);
++		}
++		else
++		{
++			DBG1(DBG_IKE, "colliding passive rekeying for CHILD_SA %s{%u} is "
++				 "not yet complete", this->child_sa->get_name(this->child_sa),
++				 this->child_sa->get_unique_id(this->child_sa));
++			/* we do reference the task to check its state later */
++			this->collision = other;
++		}
+ 		return FALSE;
+ 	}
+ 	if (this->collision && this->collision != other)
+diff --git a/src/libcharon/sa/ikev2/tasks/child_rekey.h b/src/libcharon/sa/ikev2/tasks/child_rekey.h
+index a8daed743687..fef0bba8d071 100644
+--- a/src/libcharon/sa/ikev2/tasks/child_rekey.h
++++ b/src/libcharon/sa/ikev2/tasks/child_rekey.h
+@@ -79,10 +79,11 @@ struct child_rekey_t {
+ 	 * are going on and notifies the active task by passing the passive.
+ 	 *
+ 	 * @param other		passive task
++	 * @param done		passive task is done and gets destroyed if not adopted
+ 	 * @return			whether the task was adopted and should be removed from
+ 	 *					the task manager's control
+ 	 */
+-	bool (*collide)(child_rekey_t* this, task_t *other);
++	bool (*collide)(child_rekey_t* this, task_t *other, bool done);
+ };
+ 
+ /**
+diff --git a/src/libcharon/sa/ikev2/tasks/ike_rekey.c b/src/libcharon/sa/ikev2/tasks/ike_rekey.c
+index c7e8ffbc8f02..f275d2da8f3f 100644
+--- a/src/libcharon/sa/ikev2/tasks/ike_rekey.c
++++ b/src/libcharon/sa/ikev2/tasks/ike_rekey.c
+@@ -743,8 +743,23 @@ METHOD(ike_rekey_t, did_collide, bool,
+ 	return this->collision != NULL;
+ }
+ 
++/**
++ * Clear the colliding passive task if it did not complete successfully.
++ */
++static bool clear_collision(private_ike_rekey_t *this,
++							private_ike_rekey_t *other)
++{
++	if (this->collision == other)
++	{
++		DBG1(DBG_IKE, "colliding passive rekeying failed, ignore");
++		this->collision = NULL;
++		return TRUE;
++	}
++	return FALSE;
++}
++
+ METHOD(ike_rekey_t, collide, bool,
+-	private_ike_rekey_t* this, task_t *other)
++	private_ike_rekey_t* this, task_t *other, bool done)
+ {
+ 	DBG1(DBG_IKE, "detected %N collision with %N", task_type_names,
+ 		 TASK_IKE_REKEY, task_type_names, other->get_type(other));
+@@ -760,23 +775,30 @@ METHOD(ike_rekey_t, collide, bool,
+ 
+ 			if (!rekey->ike_init)
+ 			{
+-				DBG1(DBG_IKE, "colliding exchange did not result in an IKE_SA, "
+-					 "ignore");
+-				if (this->collision == rekey)
++				if (!clear_collision(this, rekey))
+ 				{
+-					this->collision = NULL;
++					DBG1(DBG_IKE, "colliding exchange did not result in an "
++						 "IKE_SA, ignore");
+ 				}
+ 				break;
+ 			}
+-			/* we keep track of the passive exchange in any case, if not
+-			 * complete yet, this method might be called again later */
+-			this->collision = rekey;
++			/* we keep track of the passive exchange, if not complete yet, this
++			 * method might be called again later */
+ 			if (rekey->flags & IKE_REKEY_DONE)
+ 			{
++				this->collision = rekey;
+ 				this->flags |= IKE_REKEY_ADOPTED_PASSIVE;
+ 				return TRUE;
+ 			}
+-			DBG1(DBG_IKE, "colliding passive exchange is not yet complete");
++			else if (done)
++			{	/* passive task failed, clear it if necessary */
++				clear_collision(this, rekey);
++			}
++			else
++			{
++				DBG1(DBG_IKE, "colliding passive exchange is not yet complete");
++				this->collision = rekey;
++			}
+ 			break;
+ 		}
+ 		default:
+diff --git a/src/libcharon/sa/ikev2/tasks/ike_rekey.h b/src/libcharon/sa/ikev2/tasks/ike_rekey.h
+index 5fab3491c1e2..e68fa622d8af 100644
+--- a/src/libcharon/sa/ikev2/tasks/ike_rekey.h
++++ b/src/libcharon/sa/ikev2/tasks/ike_rekey.h
+@@ -54,10 +54,11 @@ struct ike_rekey_t {
+ 	 * are going on and notifies the active task by passing the passive.
+ 	 *
+ 	 * @param other		passive task
++	 * @param done		passive task is done and gets destroyed if not adopted
+ 	 * @return			whether the task was adopted and should be removed from
+ 	 *					the task manager's control
+ 	 */
+-	bool (*collide)(ike_rekey_t* this, task_t *other);
++	bool (*collide)(ike_rekey_t* this, task_t *other, bool done);
+ };
+ 
+ /**
+diff --git a/src/libcharon/tests/suites/test_child_rekey.c b/src/libcharon/tests/suites/test_child_rekey.c
+index 1c81e75e2bcd..4ef081a2495e 100644
+--- a/src/libcharon/tests/suites/test_child_rekey.c
++++ b/src/libcharon/tests/suites/test_child_rekey.c
+@@ -2546,6 +2546,141 @@ START_TEST(test_collision_delayed_response_multi_ke)
+ }
+ END_TEST
+ 
++/**
++ * Remove the KE payload from the IKE_FOLLOWUP_KE request
++ */
++static bool remove_ke(listener_t *listener, ike_sa_t *ike_sa,
++					  message_t *message, bool incoming, bool plain)
++{
++	if (plain && incoming &&
++		message->get_exchange_type(message) == IKE_FOLLOWUP_KE &&
++		message->get_request(message))
++	{
++		enumerator_t *enumerator = message->create_payload_enumerator(message);
++		payload_t *pld;
++
++		while (enumerator->enumerate(enumerator, &pld))
++		{
++			if (pld->get_type(pld) == PLV2_KEY_EXCHANGE)
++			{
++				message->remove_payload_at(message, enumerator);
++				pld->destroy(pld);
++				break;
++			}
++		}
++		enumerator->destroy(enumerator);
++		free(listener);
++		return FALSE;
++	}
++	return TRUE;
++}
++
++#define remove_ke_from_ike_followup_ke() ({ \
++	listener_t *_ke_listener; \
++	INIT(_ke_listener, \
++		.message = remove_ke, \
++	); \
++	exchange_test_helper->add_listener(exchange_test_helper, _ke_listener); \
++})
++
++/**
++ * This simulates an incorrect behavior by the peer.  It triggers a collision by
++ * not responding to the initial CREATE_CHILD_SA and then sends an invalid
++ * IKE_FOLLOWUP_KE (in this case the KE payload is missing).  The initiator
++ * has to correctly track and then untrack the passive rekey task.
++ *
++ *           Peer A                   Peer B
++ *            rekey ----\       /---- rekey
++ *                       \-----/----> detect collision and withhold response
++ * detect collision <---------/
++ *                  ---------------->
++ *   handle failure <---------------- send invalid additional KE
++ *     handle rekey <---------------- send withheld response
++ */
++START_TEST(test_collision_delayed_response_multi_ke_failure)
++{
++	ike_sa_t *a, *b;
++	message_t *msg;
++
++	assert_track_sas_start();
++
++	exchange_test_helper->establish_sa(exchange_test_helper,
++									   &a, &b, &multi_ke_conf);
++
++	/* make sure the responder wins the collision so it continues */
++	exchange_test_helper->nonce_first_byte = 0x00;
++	initiate_rekey(a, 1);
++	assert_ipsec_sas_installed(a, 1, 2);
++	exchange_test_helper->nonce_first_byte = 0xff;
++	initiate_rekey(b, 2);
++	assert_ipsec_sas_installed(b, 1, 2);
++
++	/* these should not get called as no SA goes down or gets rekeyed */
++	assert_hook_not_called(child_updown);
++	assert_hook_not_called(child_rekey);
++
++	/* CREATE_CHILD_SA { N(REKEY_SA), SA, Ni, [KEi,] TSi, TSr } --> */
++	exchange_test_helper->nonce_first_byte = 0xff;
++	exchange_test_helper->process_message(exchange_test_helper, b, NULL);
++	assert_child_sa_state(b, 2, CHILD_REKEYING, CHILD_OUTBOUND_INSTALLED);
++	assert_ipsec_sas_installed(b, 1, 2);
++
++	/* <-- CREATE_CHILD_SA { N(REKEY_SA), SA, Ni, [KEi,] TSi, TSr } */
++	exchange_test_helper->nonce_first_byte = 0xff;
++	exchange_test_helper->process_message(exchange_test_helper, a, NULL);
++	assert_child_sa_state(a, 1, CHILD_REKEYING, CHILD_OUTBOUND_INSTALLED);
++	assert_ipsec_sas_installed(a, 1, 2);
++
++	/* the responder is not responding */
++	msg = exchange_test_helper->sender->dequeue(exchange_test_helper->sender);
++
++	/* CREATE_CHILD_SA { SA, Nr, [KEr,] TSi, TSr } --> */
++	exchange_test_helper->process_message(exchange_test_helper, b, NULL);
++	assert_num_tasks(b, 0, TASK_QUEUE_PASSIVE);
++	assert_num_tasks(b, 1, TASK_QUEUE_ACTIVE);
++	assert_child_sa_state(b, 2, CHILD_REKEYING, CHILD_OUTBOUND_INSTALLED);
++	assert_ipsec_sas_installed(b, 1, 2);
++
++	/* remove the KE payload in the IKE_FOLLOWUP_KE request */
++	remove_ke_from_ike_followup_ke();
++
++	/* <-- IKE_FOLLOWUP_KE { N(ADD_KE) } */
++	assert_no_payload(IN, PLV2_KEY_EXCHANGE);
++	assert_single_notify(OUT, INVALID_SYNTAX);
++	exchange_test_helper->process_message(exchange_test_helper, a, NULL);
++	assert_child_sa_state(a, 1, CHILD_REKEYING, CHILD_OUTBOUND_INSTALLED);
++	assert_ipsec_sas_installed(a, 1, 2);
++	assert_num_tasks(a, 0, TASK_QUEUE_PASSIVE);
++
++	/* <-- CREATE_CHILD_SA { SA, Nr, [KEr,] TSi, TSr } (delayed) */
++	exchange_test_helper->process_message(exchange_test_helper, a, msg);
++	assert_num_tasks(a, 0, TASK_QUEUE_PASSIVE);
++	assert_num_tasks(a, 1, TASK_QUEUE_ACTIVE);
++	assert_child_sa_state(a, 1, CHILD_REKEYING, CHILD_OUTBOUND_INSTALLED);
++	assert_ipsec_sas_installed(a, 1, 2);
++
++	/* drop the STATE_NOT_FOUND error message from the initiator */
++	msg = exchange_test_helper->sender->dequeue(exchange_test_helper->sender);
++	msg->destroy(msg);
++
++	/* since we explicitly forced the responder to win, it already removed
++	 * the passive task it won't accept the request */
++
++	/* IKE_FOLLOWUP_KE { KEi, N(ADD_KE) } --> */
++	assert_payload(IN, PLV2_KEY_EXCHANGE);
++	assert_notify(IN, ADDITIONAL_KEY_EXCHANGE);
++	exchange_test_helper->process_message(exchange_test_helper, b, NULL);
++
++	/* child_rekey/child_updown */
++	assert_hook();
++	assert_hook();
++	assert_track_sas(2, 2);
++
++	call_ikesa(a, destroy);
++	call_ikesa(b, destroy);
++}
++END_TEST
++
+ /**
+  * In this scenario one of the peers does not notice that there is a
+  * rekey collision:
+@@ -4436,6 +4571,7 @@ Suite *child_rekey_suite_create()
+ 	tcase_add_loop_test(tc, test_collision_delayed_response, 0, 4);
+ 	tcase_add_loop_test(tc, test_collision_delayed_response_delete, 0, 4);
+ 	tcase_add_loop_test(tc, test_collision_delayed_response_multi_ke, 0, 4);
++	tcase_add_test(tc, test_collision_delayed_response_multi_ke_failure);
+ 	tcase_add_loop_test(tc, test_collision_delayed_request, 0, 6);
+ 	tcase_add_loop_test(tc, test_collision_delayed_request_more, 0, 3);
+ 	tcase_add_loop_test(tc, test_collision_delayed_request_more_delete, 0, 3);
+diff --git a/src/libcharon/tests/suites/test_ike_rekey.c b/src/libcharon/tests/suites/test_ike_rekey.c
+index c6691acf44aa..2c4102201d43 100644
+--- a/src/libcharon/tests/suites/test_ike_rekey.c
++++ b/src/libcharon/tests/suites/test_ike_rekey.c
+@@ -1784,6 +1784,152 @@ START_TEST(test_collision_delayed_response_multi_ke)
+ }
+ END_TEST
+ 
++/**
++ * Remove the ADDITIONAL_KEY_EXCHANGE notify payload from the IKE_FOLLOWUP_KE
++ * request
++ */
++static bool remove_notify(listener_t *listener, ike_sa_t *ike_sa,
++						  message_t *message, bool incoming, bool plain)
++{
++	if (plain && incoming &&
++		message->get_exchange_type(message) == IKE_FOLLOWUP_KE &&
++		message->get_request(message))
++	{
++		enumerator_t *enumerator = message->create_payload_enumerator(message);
++		payload_t *pld;
++
++		while (enumerator->enumerate(enumerator, &pld))
++		{	/* we only expect one notify, so just remove the first */
++			if (pld->get_type(pld) == PLV2_NOTIFY)
++			{
++				message->remove_payload_at(message, enumerator);
++				pld->destroy(pld);
++				break;
++			}
++		}
++		enumerator->destroy(enumerator);
++		free(listener);
++		return FALSE;
++	}
++	return TRUE;
++}
++
++#define remove_notify_from_ike_followup_ke() ({ \
++	listener_t *_ke_listener; \
++	INIT(_ke_listener, \
++		.message = remove_notify, \
++	); \
++	exchange_test_helper->add_listener(exchange_test_helper, _ke_listener); \
++})
++
++/**
++ * This simulates an incorrect behavior by the peer.  It triggers a collision by
++ * not responding to the initial CREATE_CHILD_SA and then sends an invalid
++ * IKE_FOLLOWUP_KE (in this case by removing the ADDITIONAL_KEY_EXCHANGE
++ * notify).  The initiator has to correctly track and then untrack the passive
++ * rekey task.
++ *
++ *           Peer A                   Peer B
++ *            rekey ----\       /---- rekey
++ *                       \-----/----> detect collision and withhold response
++ * detect collision <---------/
++ *                  ---------------->
++ *   handle failure <---------------- send invalid additional KE
++ *     handle rekey <---------------- send withheld response
++ */
++START_TEST(test_collision_delayed_response_multi_ke_failure)
++{
++	ike_sa_t *a, *b;
++	message_t *msg;
++
++	assert_track_sas_start();
++
++	exchange_test_helper->establish_sa(exchange_test_helper,
++									   &a, &b, &multi_ke_conf);
++
++	/* these should not get called as no SA goes down or gets rekeyed */
++	assert_hook_not_called(ike_updown);
++	assert_hook_not_called(ike_rekey);
++	assert_hook_not_called(child_updown);
++
++	/* make sure the responder wins the collision so it continues */
++	exchange_test_helper->nonce_first_byte = 0x00;
++	initiate_rekey(a);
++	exchange_test_helper->nonce_first_byte = 0xff;
++	initiate_rekey(b);
++
++	/* CREATE_CHILD_SA { SA, Ni, KEi } --> */
++	exchange_test_helper->nonce_first_byte = 0xff;
++	exchange_test_helper->process_message(exchange_test_helper, b, NULL);
++	assert_ike_sa_state(b, IKE_REKEYING);
++	assert_child_sa_count(b, 1);
++	assert_ike_sa_count(0);
++
++	/* <-- CREATE_CHILD_SA { SA, Ni, KEi } */
++	exchange_test_helper->nonce_first_byte = 0xff;
++	exchange_test_helper->process_message(exchange_test_helper, a, NULL);
++	assert_ike_sa_state(a, IKE_REKEYING);
++	assert_child_sa_count(a, 1);
++	assert_ike_sa_count(0);
++
++	/* the responder is not responding */
++	msg = exchange_test_helper->sender->dequeue(exchange_test_helper->sender);
++
++	/* simplify next steps by checking in original IKE_SAs */
++	charon->ike_sa_manager->checkin(charon->ike_sa_manager, a);
++	charon->ike_sa_manager->checkin(charon->ike_sa_manager, b);
++	assert_ike_sa_count(2);
++
++	/* CREATE_CHILD_SA { SA, Nr, KEr, N(ADD_KE) } --> */
++	assert_notify(IN, ADDITIONAL_KEY_EXCHANGE);
++	exchange_test_helper->process_message(exchange_test_helper, b, NULL);
++	assert_num_tasks(b, 0, TASK_QUEUE_PASSIVE);
++	assert_num_tasks(b, 1, TASK_QUEUE_ACTIVE);
++	assert_ike_sa_state(b, IKE_REKEYING);
++	assert_ike_sa_count(2);
++
++	/* remove the ADD_KE notify from the IKE_FOLLOWUP_KE request */
++	remove_notify_from_ike_followup_ke();
++
++	/* <-- IKE_FOLLOWUP_KE { KEi } */
++	assert_payload(IN, PLV2_KEY_EXCHANGE);
++	assert_no_notify(IN, ADDITIONAL_KEY_EXCHANGE);
++	assert_single_notify(OUT, STATE_NOT_FOUND);
++	exchange_test_helper->process_message(exchange_test_helper, a, NULL);
++	assert_ike_sa_state(a, IKE_REKEYING);
++	assert_child_sa_count(a, 1);
++	assert_ike_sa_count(2);
++
++	/* <-- CREATE_CHILD_SA { SA, Nr, KEr } (delayed) */
++	exchange_test_helper->process_message(exchange_test_helper, a, msg);
++	assert_num_tasks(a, 0, TASK_QUEUE_PASSIVE);
++	assert_num_tasks(a, 1, TASK_QUEUE_ACTIVE);
++	assert_ike_sa_state(a, IKE_REKEYING);
++	assert_child_sa_count(a, 1);
++	assert_ike_sa_count(2);
++
++	/* drop the STATE_NOT_FOUND error message from the initiator */
++	msg = exchange_test_helper->sender->dequeue(exchange_test_helper->sender);
++	msg->destroy(msg);
++
++	/* since we explicitly forced the responder to win, it already removed
++	 * the passive task it won't accept the request */
++
++	/* IKE_FOLLOWUP_KE { KEi, N(ADD_KE) } --> */
++	assert_payload(IN, PLV2_KEY_EXCHANGE);
++	assert_notify(IN, ADDITIONAL_KEY_EXCHANGE);
++	exchange_test_helper->process_message(exchange_test_helper, b, NULL);
++
++	/* ike_updown/rekey/child_updown */
++	assert_hook();
++	assert_hook();
++	assert_hook();
++	assert_track_sas(2, 2);
++
++	charon->ike_sa_manager->flush(charon->ike_sa_manager);
++}
++END_TEST
++
+ /**
+  * In this scenario one of the peers does not notice that there is a rekey
+  * collision because the other request is dropped:
+@@ -2590,6 +2736,7 @@ Suite *ike_rekey_suite_create()
+ 	tcase_add_loop_test(tc, test_collision_ke_invalid_delayed_retry, 0, 3);
+ 	tcase_add_loop_test(tc, test_collision_delayed_response, 0, 4);
+ 	tcase_add_loop_test(tc, test_collision_delayed_response_multi_ke, 0, 4);
++	tcase_add_test(tc, test_collision_delayed_response_multi_ke_failure);
+ 	tcase_add_loop_test(tc, test_collision_dropped_request, 0, 3);
+ 	tcase_add_loop_test(tc, test_collision_delayed_request, 0, 3);
+ 	tcase_add_loop_test(tc, test_collision_delayed_request_and_delete, 0, 3);
+-- 
+2.43.0
+
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
index ea92655270..ade8dd4696 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2026-78130.patch \
            file://CVE-2026-78131.patch \
            file://CVE-2026-78132.patch \
+           file://CVE-2026-78133.patch \
           "
 
 SRC_URI[sha256sum] = "07df7cedae56a7f3bb07e66d21a1f9f87e961db70e99184e11d3819413e4f87c"
-- 
2.40.0


