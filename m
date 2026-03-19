Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C07E107528C
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 09:56:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7481.1773914167328597459
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Mar 2026 02:56:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UnFXuT4v;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=753824cbf9=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J9OaLX2902634
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 02:56:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Nw+WaX6N7aXxNZ8i7cedIPSnPQkk85i+caXKpQfYIWw=; b=UnFXuT4v8sFo
	j795CK7pIlfm8p50GjucHfCEt7FJUpBlR972QI1HChuPZtUQMxhCtgHghyR0XKN8
	GgxW4Ymn9LF8vxxzuHIFDBtp0vZM7IqhINHPe00oDY8HpdZExk2iOIMMHe5w2TJ8
	WeS2hf5SOcnDSjoBDplgCMPC+JdL05Fpdn1MV/90BsTgDY6isK5S/1eNxjPKOrmR
	XlcilIDfWpjyMWAe/K8sEUfewGhQ84d0vuMJ9oTpnNJdWXsqr52mPFY68BrVFsGS
	rEPj9Th5VhVGMMuMQnrY5U2cM2IG8eYrTIEMF9hT9cQx3JGTTXTG8fXkx3/5adKu
	XATZEZsWRw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010016.outbound.protection.outlook.com [52.101.46.16])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cw76dwy3t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 02:56:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GOP2tCuVF87HfiNrsiGiWTTAwFgqD/rrafEA2tCv5dYOj1Jz2fhsvJ5UEdGKvYjnmpAWCk3Pa4TcKh21OqsdadPktR0HIHwqmgedarQEH88C3yh8Ib1NsqPH/9GgmPE9Utnn3eatgyZTkcrzBGE3S23uFpMzV7q9pG7gjS9UkYm0Vq9Q8bUS50/LWC0AMlkU0eGizZG2cWAL6ZLIIYgC78J65TWlnsANbgJU4y9d0qaVI2ojdH6O2iLt0z/QbmTDDzbHUIfaVg9dGg2quKTeypROonYhIErOyhIhAsM+Tlrb6GLEC81UWVDCObG3aNv6ET8Gb+sQQAs5a0OijBx3bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nw+WaX6N7aXxNZ8i7cedIPSnPQkk85i+caXKpQfYIWw=;
 b=W8pulR1t36HXFUjscKUuPDzKKb2gEQ/PzZjWgUriCrfIdv0MGV7ScU6Xnlz6CuvyincFvQh59FZFFkLQqNUVr7uiJ2y0nZZMgc6wCJNuxOJGWpOY4lQjYp/TGoSG8ZjviJJrbCEHzcJgPcqj+pkdz2j20p8CS823C3rJomGtJFZCyPIr9vSZX1wKAA/IutnyB+WZ9C/5+gk1mlC0yuBiWbWRCuOpCrT1GdBhblxNyjoZ0jzsyD8jIiztCMkKLH7RtILZ1rAG1yIU5goFFsaczj+nUElXARA6KzjFuRPbKP15Ncd2+p1BD9P3os0t0kQ8DAcifTaHNivZJ34R9rQfuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by MW4PR11MB5821.namprd11.prod.outlook.com (2603:10b6:303:184::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Thu, 19 Mar
 2026 09:56:05 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 09:56:04 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 5/9] mousepad: upgrade 0.6.1 -> 0.7.0
Date: Thu, 19 Mar 2026 17:55:43 +0800
Message-ID: <20260319095547.3614749-5-peng.zhang1.cn@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: d4c268a4-d31c-4a50-1926-08de859dbc23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	fmzJlVXyQ2/h1l6+LjJnEwgggHMQLFavAgoL4noRk/ZtQYOacpuOXmH2w9jLl05QOtIknlZtKuzqdgo7v2+1hwiwpwZWrlFwe1lOJdUqyUfqkijES262JHj6FckWBxKEyWdbVmH3HUbxu4d9/EfwhmsBnBrY/cXyhI1Lgo52eXwj+YCgUVNA36gIkrJm6uzPzdST01KvUJpm+0xZbuYQ0P1aqfimmvJjen7fAW02kuH+6MSWPbPPKbF9+VxgVYWi69wYVKobLEG3DzXqqZDcBJ43rcomGDmCcB8ykOiZM++jdAqCaTPKWDUG7VRngd3u4gEpl4mIdeHyc0XNodV+a0mgXQC8k4ISWVfAwuvzWZwJTUA3/Tcsy7bMzaNr4E/ySLnNBoHlXKyEYnf2le6bECADXBFtHQLhyMQMkp5XTdBnRteVT3DXXtWnEBB5QxT0C4JS5TZMhZ/yZ34Wem8b1DvLS3PeNtrrWJE/eH3yZfFwnhYnxN3XhTJz794JHcn29Dt0A/tddZO9xBFzUQLhQspDg58nCU6r0q5J1v7EedugdvaxCvvacG54NvAHTQVdXQX78ryrv8IaRUjjEiunl5SVu4i4aJcdpgqzU2HjgMilTWWrpz6OA820tJQf2ctrOQqAeGwmFdC+jzS4zIS96bBPjqrKvczKZkTji5AMuzYRFTmqTydxwNJH4DH3Fq6Sa5UTd8L2WW6YS+h8W3Wu8pKd2jC9O+9YdihJSd2e5fOL76T7Ru6IiveLYglNoBqvOpErImaeeolBdFrNjsNY/NRlZw4FrCGF46vVtJHNkRc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ss6K0jHDWPN8QV/3hGPauLkXl0o2T1fdM9PJBq7oWbxFp3atQGEm0EMuJ9A1?=
 =?us-ascii?Q?sYDVNnndPkFFGVm64BU6knK8H0sfnpcJq8DbwPDzubW1MG5UUWBUiYB4RLGJ?=
 =?us-ascii?Q?bVNFoTGxk1RxbnVO6qxrZLnhpBu9LW/4N0Yd4er2XFyeQKhblu1Rfhs4dx6W?=
 =?us-ascii?Q?MPMI1pETWV0VKjO7WiX184U+qhkFRkt2eRxdfx2fM4aOivlsj4sGSmM4Yauz?=
 =?us-ascii?Q?oiCwoqqwQCDBTPApNiG8gbev0fzIykMkzCq3eCe8CIPZ9bdURJg1EoAHQKRy?=
 =?us-ascii?Q?dWpkYIdS9cxACVRyYHhAi6tNK3LGhmDBH1LJuCfKKwr7hjoMrjwwwN77rlp6?=
 =?us-ascii?Q?0oSRm/6KWDX5CucLQL5vZ37E1IRYF+Zb+nXk2ETfpaOuao25OWvcc3yD1vQu?=
 =?us-ascii?Q?p8rZLfPEC+C/CH+WLL+4gn6p6ULYDcdyejfd5QVjnpSWtn4XcBL4RjKfKdTf?=
 =?us-ascii?Q?gDDMVhDWeHf5lBNsYvbDvhuJS/1aKidSSEp/l05MOrxWgGjkTZVvFN1AZtVb?=
 =?us-ascii?Q?tfKli+WRmKhZifsq+mbXNnt2LlnKdRtqxtyXtjvqeAHma/WwLaxn/7fGJiZZ?=
 =?us-ascii?Q?1+AFkcBfx1TJlPrPL+IEikykwUsXo8Jhht9Sj4HwddNoAbQAyM5RGEW0YFkp?=
 =?us-ascii?Q?3Ht7hdN996W2ECB13jGvkUIsdjFvzWhXIytuDugpepK7QGVR9T4FS3bEXYRh?=
 =?us-ascii?Q?vsxekvgKT+Tl/HB8/YmITYMD3OxZgGrMc29mMPUZJoL/L8L+BtHhRLCVUevF?=
 =?us-ascii?Q?x8YUvI1NzisQlDUBnHpHoPIOljo5UubW2B7w/PvwM2ceXYwJQjXt2OEGMgVK?=
 =?us-ascii?Q?SJMhD+XsdLSdiPOEP1KKAjqXR313KERv3inGzz0SPfxmyuO1rkXb4pmIgiq3?=
 =?us-ascii?Q?YZJZV7SOQBmV5GZ0GFAw8rI149GCh5xhcdGUT0QKUlJW8WmnNHG4m8l/Luye?=
 =?us-ascii?Q?H32JZ+0muHWRasGmcrciTnMuRTt2Bq0HjdEt0j3yaYB+cMTn1GdcqkOnrrem?=
 =?us-ascii?Q?bekGBWJS3aypvq+78nW6FZ61x0eaoTzfF8pX0si63PK28cnp69mOPEvij8Zh?=
 =?us-ascii?Q?5JKY+XBqSFABOu7kS/TAsAQY3nqsJCUf3WWWOyTqoAXiO52BAvHILJPPiZlM?=
 =?us-ascii?Q?MWXdkJRntuqXQ0IC4V1/Zw7wIofibpV0oy8MvlplW6gpreFfULWoZxRvN3+D?=
 =?us-ascii?Q?AI/vkglJ64f2/Ij3fHK2QYIgP9vGHx5FdIEFEUMNxrSy3zzi5+xl9znzfA++?=
 =?us-ascii?Q?mLKCOtKHVhTJ2MWaEeZ8QFqyaMzYsFfZZ1sbak+9C/oAPaGQh/FovwSHMAdt?=
 =?us-ascii?Q?bv0J+skAMN8MPz9gR0rnyGCwcLepVrGR2iBr4X8DX9m1IucnUYAMkDOjEtga?=
 =?us-ascii?Q?YK5aYFZwy51tDwuxzFInGtUDOxEOkZCbaw6WD/N935+awtmT7HIehygqe5fu?=
 =?us-ascii?Q?V46HUGfuypjSe/hjIikpW/twukzDc/aVHBd7n7ifu5iosazXIyl4QATZYrXJ?=
 =?us-ascii?Q?3OT5cA0HKj5nE7NKKhL2rqApr1HDU55SsfKg6x9H4cGwoeDOghq89n/Hmr4Z?=
 =?us-ascii?Q?lADZhmd1iqEMBu8tf1ktplQHekb5sdi2R2OPJl20pYu24Kgc2/zWA4Ik63Zu?=
 =?us-ascii?Q?wNbI1KVIwPy/vt6DZWyI3ZwRK3jAm80Gekc7ttNd6wzcSJAA+xPwu4X2zy6V?=
 =?us-ascii?Q?J9Ll3Nvw2lrbalpuLD/iePzjHekkG+ooJzIq7v4rwna+EG9oz/hfofC7tmjF?=
 =?us-ascii?Q?uPSU1BgdPoIc8zvzIqbzEp/gNy9my2o=3D?=
X-Exchange-RoutingPolicyChecked: 
	rd5Na3UDcLL5Y0GfGK6I4DdO66t9sjLfS/OMTWYav0aNn7Z48U8om244zfB753Da8VILOc7pdnk7gpJvmQHJralZongML2IRCNWZDAVDrdgAtIMkZnRP3rfCUFoxMrcBylWUgiVoz/YtONVxzR80gU45D0tEuQtrHxT9QYp41vo69LbToijdJYNDCpeuePiZRT/W3LkRxj1rYAuRbyjsBzIuIH/TjIqDNmTNCH0QgN3OVMS2mj+0vjwjyMLaKXbD7cVo/Z2SMlvMat3B32ZsqJqMXpJORQI9laNVMd4SJTj1ksue8mtQrynEBdNGn9B+HGnFy8RfiPgkodwYHpbnxg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4c268a4-d31c-4a50-1926-08de859dbc23
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 09:56:04.8276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cYzWS8eXs+D/PgxVvczWFi38XPw1VFhxk/97DyIYbhp8DXTlx0VSrtJwC428oyxyCFaq0bHGahEJUa5NKjopF0DoBy586eb22Fw35YqwcG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5821
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69bbc836 cx=c_pps
 a=+tUgqrp9vGCFEjR5l+cGAg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=O24Aq5uEAAAA:8
 a=t7CeM3EgAAAA:8 a=4ZU5GxkhvbaFsd5fDeEA:9 a=SYBONWESK5muIIdMMRMZ:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3OSBTYWx0ZWRfX4a3NEW813vZa
 vSYJg02A7DeqY0Q0AJH41AaQyH5ytIs2Ec/Wt+z5JaBbRs5IrTNhoZH976ASZaGnCUjJrd9ulCL
 SocgqleEZ0qnmaliE4qvzZkwimbb1VFz3+49wZL6UZrB0L8JeLxn+CQU6YEkyQmhK6UlXso+/cG
 HyKm2XHhczZ7CwMGelE9O8FaZp31KInwCFUBBr+T483OgbeL+ODThi7b+HP6nwb/DcT5rSo2XiF
 rMg+Lwc1Ovvw5+CVGdG0SB8WioGm7beiyZKVtWRiW4Q7/x4F5kpJtAEu6taHZq3o39DrgJenW8y
 65WlH+/hkK1nuFSJqYTi9v7IlXkFbz5u3Ru84252fMnPuJ4vM8sdruGnvRNxf4YHwzwI6RtN2vP
 Fo6HCNdECovppfMHDWkPqbQmrdHRAISsZiLBQFwJ1mf+cE2vNVQxzeoDcI3KSOApO1qQgH6kSOU
 aIVtNbOwxra3Z2ZAHOw==
X-Proofpoint-ORIG-GUID: TDGxGn-oDAPXSE-5zEiIkn6Yv9XWyZv0
X-Proofpoint-GUID: TDGxGn-oDAPXSE-5zEiIkn6Yv9XWyZv0
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
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 09:56:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125387

From: Zhang Peng <peng.zhang1.cn@windriver.com>

ChangeLog:
https://gitlab.xfce.org/apps/mousepad/-/tags/mousepad-0.7.0
https://gitlab.xfce.org/apps/mousepad/-/tags/mousepad-0.6.5
https://gitlab.xfce.org/apps/mousepad/-/tags/mousepad-0.6.4
https://gitlab.xfce.org/apps/mousepad/-/tags/mousepad-0.6.3
https://gitlab.xfce.org/apps/mousepad/-/tags/mousepad-0.6.2

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../mousepad/{mousepad_0.6.1.bb => mousepad_0.7.0.bb}      | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/mousepad/{mousepad_0.6.1.bb => mousepad_0.7.0.bb} (64%)

diff --git a/meta-xfce/recipes-apps/mousepad/mousepad_0.6.1.bb b/meta-xfce/recipes-apps/mousepad/mousepad_0.7.0.bb
similarity index 64%
rename from meta-xfce/recipes-apps/mousepad/mousepad_0.6.1.bb
rename to meta-xfce/recipes-apps/mousepad/mousepad_0.7.0.bb
index dc75a4b220..68e84dd3c4 100644
--- a/meta-xfce/recipes-apps/mousepad/mousepad_0.6.1.bb
+++ b/meta-xfce/recipes-apps/mousepad/mousepad_0.7.0.bb
@@ -5,12 +5,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "gtk+3 gtksourceview4 xfconf xfce4-dev-tools-native"
 
+XFCE_COMPRESS_TYPE = "xz"
+XFCEBASEBUILDCLASS = "meson"
+
 inherit xfce-app gsettings mime-xdg
 
-SRC_URI[sha256sum] = "560c5436c7bc7de33fbf3e9f6cc545280772ad898dfb73257d86533880ffff36"
+SRC_URI[sha256sum] = "e86c59feb08126d4cace368432c16b2dee8e519aaca8a9d2b409ae1cdd200802"
 
 PACKAGECONFIG ??= ""
-PACKAGECONFIG[spell] = "--enable-plugin-gspell,--disable-plugin-gspell,gspell"
+PACKAGECONFIG[spell] = "-Dgspell-plugin=enabled,-Dgspell-plugin=disabled,gspell"
 
 FILES:${PN} += " \
     ${datadir}/glib-2.0/schemas \
-- 
2.50.0


