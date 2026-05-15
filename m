Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3187ECD37AC
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 02:40:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26879.1778812832612148473
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 May 2026 19:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=P5Zf2xiy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=95954df25a=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F1bWQr761988
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2026 02:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=dQTB9tO8FxtsIjE8pqMPnNJplGpGAePjefRREopHK9Q=; b=
	P5Zf2xiyZ4PhlnbWsw5NSL8QVmanBx2rsrurDG0hkUb2zrGh0JF5CH8uQfaqCZp6
	27mGfwfd/3+115kFlPyOHP2d31/VAiC/TGXb9trOQUN0vtXSF/qM1BzS4+yPdtEF
	ocB1h8HO70YR0RUfVVtiQnhnmgRkI5tKRJSryKR1o6Mxigcr2Gwc1TM3fjarBz63
	hGdHYayWk7nn6ANWYTi4N4xdf0Vfpdfo70C8l6MonjT/Ro7dRzOVWUMhV3t0LCG5
	UaqOOFfzff62tNQ/f2Ras5GIbvVt5jDyy424TYV7lPy4lZ9dUYzsCv7BS+szXH19
	QwbwsPt5aaiyWCnReJkjuw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012002.outbound.protection.outlook.com [40.107.209.2])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e5m6c0bta-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 15 May 2026 02:40:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eevhe5qlVA0vmGuTw0nSijmxMOvEkFpVtU/3dIGrVwsJh+vZsGHe20u5ll71shz/3dYaXCG0YwA2qE7QYwxFBU05nUqKY/Skzx89FogiDmgp9nI6XBWJIlwf9tgwb9VFLzFD7yDYjNpXMSuXJQt7PTHmfPwJ6dNdcUSstTkeA/ZuKDifrJdBQUt8X6egl981n+CZR/FluwgOeeXEAcMQ3/5dPPUGnz/7eMbgUU2McVQ+MDDHqlAndEVAigozxfq2A0Zs0PxXbp+53iMrJKiCw/tNZUR4Srz3TM93wYYcA1T3kUI8euL7VQM2r4Ey7JPfDWiE4WTvOvE2B25AJ349rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQTB9tO8FxtsIjE8pqMPnNJplGpGAePjefRREopHK9Q=;
 b=HQGTqyN/Yb1grAY8SoCyLhahE2AduONZq+84RtaJUHX8I3IttShJIcOhhAFsiedD3M4SIW1p0q87vm9f7grYzr2icOhscEudUCwuy0c2UrAKPthBQFSSEhWJiD0ArJMyacOa8nnTYVV2s9XjDFa8JITaGtRjqpFbyJUP0PHjksTmNXUAuR0mqQQLsmhDiEtj4SzYP9P0ESZH6JJ39GErMdOJiNWf/khQeVRnQPSAt2+FU7aBBqC71/48t9whV4iPng6bJl353SKkvlnzCrKNsI5hQTaDHeDsFxZl5lyGAorVVU3K2Idpz35Jc3frduLOkB73hxSJLY4mHSCYlhVdYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by IA3PR11MB9376.namprd11.prod.outlook.com (2603:10b6:208:570::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 02:40:28 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 02:40:28 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
Subject: [meta-networking][PATCH V3] postfix: upgrade 3.10.9 -> 3.11.2
Date: Fri, 15 May 2026 10:40:10 +0800
Message-Id: <20260515024010.4189964-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAMKF1sr-mFccrpOTJ3yVitujsrkCCJyS+SFdPyki8Wo0vk+TCA@mail.gmail.com>
References: <CAMKF1sr-mFccrpOTJ3yVitujsrkCCJyS+SFdPyki8Wo0vk+TCA@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0155.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::17) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|IA3PR11MB9376:EE_
X-MS-Office365-Filtering-Correlation-Id: d7287870-477c-4ad4-ccfa-08deb22b5316
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|22082099003|11063799003|3023799003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	/uDoqS/e3QcPPl/P3zXAbiLXmoxYNEoiObty/NpXpQoAnca4DNZVvt3W1hvy6LxqOUgcx60KAofTaaaTfkXqSqtCXH68JY/Alo0KY69z1CLK0KO7tns/xNM/53m8tyRPJz6CMs/hjEO/oHrBXppXVkn03O0Hq9HYteHuWiVZwK1XBsbZjZ6eSS4KMhUy+R+PzKXzUKt8HiU33VJATsPJJ586nEa1hsKyR8aW2cQwfEtVbTG2ZDQOJs5Y4gfupFNdlwVSYR0HVgxKQQjHeFpj07AcSMSCyTw3ldJpeTs8Fs2/Ae9+TtNGfD9DuDo14CeAfZMv5+GHFw058XYtZAmPR/+37p1Z5aKH4YBrEb1HAZHVz9+bu6j5i5nI+5t+O3g71feA0vHh/901equTyMULbtUI5r6GNcel858AM87coQ7PTIMQHtxIbzL58SfsGJN1QjRTzsn2akuZAc7iwIZwGYqVUzIVDu5dtVJcET4z+lSvgPQhsjQMVBtNU1xjOm8xoXApMU4PtNScmvdGnl0dfDX17UYrKza7fsW7CDgZvojOWW6cP0x4ue8vlr8JxttRAShFtBE+wcGgjdwETlu2aTDuO53prcqGA+iHpdYmo/arnq+coPyeRbMoIYJnih2XRmihclltGPS5PxJsXVVMxYvwivEYx9aR+TdPf8HEVL2mrRU2VRV/HDAXL6NKgyfhrHZw5w7+2XMZG/1hXnBRBQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(22082099003)(11063799003)(3023799003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WLoeojETubDVIaZnYl1rPrlYebZMtTtT+i9UzH1yy2mt6uPpW4eQWSRTvDEh?=
 =?us-ascii?Q?rDU2prlJR6Qma/waDw1aXyEORmRKBWHgGCkBUEqjwazvExaghxqQzt1uUU6R?=
 =?us-ascii?Q?i5UoKbvkKKJ9ZhJ+qgYnYv+UkQxhMVFI7uvhbdcO3uPVdYde3D6ToLTnr5Ls?=
 =?us-ascii?Q?dKayu1r5WPyXxysVNFxb5CbvLW5QyUOblj8quIg8/MjezXHHf4HT/zlVoiFQ?=
 =?us-ascii?Q?qsPGKWbllZT7OQwwmt7KqAnvwzQ5/qf2kXyP4ehNVq5GxldbxBjjFxlyh0Up?=
 =?us-ascii?Q?LV4fUIN6hgi6WrEJKg54l8lzxqK+P8RVxOmsc5eOWChkMhilwNGU1e4/58EO?=
 =?us-ascii?Q?+13+HLhOyNlLZJoFIUZZpAcEVQLi+WZCAhqEjTIwKRYRklM1jXOvYkhMnaZE?=
 =?us-ascii?Q?li8KaIo48vxYp4p6JXoektp9cUi61NYtJoAKYLNP7x2K528+eXE+MZWTe5dB?=
 =?us-ascii?Q?T/hjDrWq+sYEWwMDxCVdsD3oOfjFvgHHNurOy5RyPD/GC4I9bpE5WlseC273?=
 =?us-ascii?Q?rRaQMWTl/8E3lQ2S4EWpceUtD5wlb0BiQikz6zQHGsdy80TAF5Os3TW9qyyE?=
 =?us-ascii?Q?OCcq+NolLlm9yHzYwZzXEuv69PlyQU8jo3kSYJzIABqk85emva5GCLu2kO0W?=
 =?us-ascii?Q?0SeAidCreSilhwXk9yaHsJVQIBxdhC/A6lF7kwUR65n4dp3PAifvbG7buQAe?=
 =?us-ascii?Q?aQmNq2mveQ/aYykxL26PPYMFj73sDeVJRlJ95TxWaRKw86YCpx9f3oYom5NW?=
 =?us-ascii?Q?CfFqAsEAoN6T8bFQ6v3HV9LgJ3pyL2w1/vy74idsD8JRDSDoqVaDL8R5vjSq?=
 =?us-ascii?Q?ABW/6wk+rilBBMdU/5W7/IIld8iDtLbYPqQa0ZE+OvyuABJwwtOXRL9uvrjn?=
 =?us-ascii?Q?XmnvqoMZmIPtuLzZPt8UxzgqnDhQsxyvJ//a0Rw5ihfp0NsbaVwo+kk9LgFe?=
 =?us-ascii?Q?nCV7baCBXZq3fgD/rmDlAMv+QOM7WTTdHOJruvLlVwvz1Mmgzj7yBKnz2Ral?=
 =?us-ascii?Q?Nb0XoQpDm01vM0eByN7I6A3/mg5n11KuA5vIFXjovyAezHdHGZdtN5eN3Mb5?=
 =?us-ascii?Q?awqsJn2by4hth8NT5orqNANWAa16iOfuTSR4koCUhXcJkyguCwAPcrfpBbxC?=
 =?us-ascii?Q?AEqF7QWAEBK4qtdfkaAxiNOkvMrZPdFiduUagrZ1vIOZZQPfHviXPhhpT9ni?=
 =?us-ascii?Q?yMGkNi2b/VbbNBlK7nw19eBcaYQ89hv1i2EXck0Gj1SeGzekahJQlWgo0jMp?=
 =?us-ascii?Q?5pBUw/C47nYbcAA5e7G7eUIiBhWV5eYCWwh1iboHmWmS9b+0gh9vpaUVBt9I?=
 =?us-ascii?Q?hlez3hQj90/JqLN+G4YtZ9kmEwjWOcRTNMe3RH0Aik+KcWnq4vM7UlceXz+x?=
 =?us-ascii?Q?z3n54+Rw2pEkAq3Oa7w4JSFj3tsYTtAzfNW8QY7gDyEQPpXbrhiMlhmwmW5H?=
 =?us-ascii?Q?fw7YIlM7G0J66LGlxbm2vWdDDMC0bIgUJjbkRjXfkpCt+y9B+BoAip+KJKZ0?=
 =?us-ascii?Q?oEWsZAPHH8EZNOt7zx3osxwFoKr0dI3deVlgPVN8gGm2GqZXd41rUma97JaG?=
 =?us-ascii?Q?6e8Kj59+JpfcK97f+hLy4w+TkJKNEIFNiPfFysybDpoFc3E4GjshP51Oe+eF?=
 =?us-ascii?Q?/ADdz6ubogHqXXXuqPUMIeS7bFCbKfOKJ2CO4k5K+XLYAymdKZ/Yf4GDcWNK?=
 =?us-ascii?Q?vk+Qzbkt3zhgwN41dN96Q5D6JKP7YzqGoMI+OTxWpyCK+p2let4QKMiM1yJH?=
 =?us-ascii?Q?DfCKskcmP52QPeUEJjTY26STvqGLB9U=3D?=
X-Exchange-RoutingPolicyChecked: 
	q9Sp4B7Af8piRS5rAWUpZzeJmOlSJGG7WPioQQawmkXPos+2VjjUhXYDkaEe8y/ibka2rxm744XPS1df3J1LSLBCT7DDtJ0p8SFY9L7MB3Sr/ew6aJwkHO/5t8VsPxmdnw+6TMR5xaaUIFG0bFs4XUhYLbepBKq/F/ussCvIQQHptT2I0ujPLXD84oTnoHYNJr1Dfs4LuxVoKoAdWlanVu5Je/SGgMkMh2GV+pegVeR97g07VcYbgS8zdvhvSXaeGYwFvjyzDHykqX/urNgRGB214i8kA8020WDm2OfHN8l4IUZm3bfDrVDm0tYTu3G68BTY+GgDz0Y6BW2PcUqHHQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7287870-477c-4ad4-ccfa-08deb22b5316
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 02:40:28.4155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TTIAbGO5/RqON3IW1WNw/XpwdX0Kt/aKrFPKCgqDFF/GRf1oXi3y7iAx9o4+Vq5/j7xYT9q57yU5S2QopKau6fa5FavMKEZcHPo21BM97+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9376
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: e7V_AhZg79IRuX2Xu1Lcl_HlCTJOdoHu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDAyNCBTYWx0ZWRfX3Y1ThfEOy8VY
 Idb8PuLPxCHyUVg0VW0Nw4GYHbiafa1XJxYDo8VbUqzEv2lmUZnQvF+B0bUTNMa7Q9iggrhGFsE
 tDkWBd+0y9CKx1uf/Rz99r9Vu4vjqDijMCwavNdt9/0PN4Zz/x5ivWDZBbu/5JBLp7Xk4Xqvz0f
 KmsA4q3bkqfte28bCJQJZx7BsjVPpLKSS/d38wZ+K0uTz5WUd4ZLlY3xG800kHZUC2stzcsUIWh
 nrXmmRTpVoVkupTC/uCFXCDlPPZibqSkDqJUwtSe3fZojSDB5VaMP2M2Zw9uF6uw73JV0FySRIR
 7sfvlETQm5fpKzHYHsoIpoE2nCJ/2Ev2Sa1gNq6tDawYRsz4aCcrWWLEBgAUWZn71m/+gkENCEL
 aDg7WPXmFrwlpjVwmYJVUU4GHWX7J3+N/2thL5GdMaSmTu05NyZOivxYFIsieCDwLNtcB8CnmqD
 yYassUv8jXmlbuu0SWw==
X-Authority-Analysis: v=2.4 cv=ZYUt8MVA c=1 sm=1 tr=0 ts=6a06879e cx=c_pps
 a=ziZy7zD1dJq8wwEro8zYwA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=VJYubktbAAAA:8
 a=gmDo1nssAAAA:8 a=e1GkridNAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=omOdbC7AAAAA:8 a=pGLkceISAAAA:8 a=j6XmuH0Gu1IliE9Xzg0A:9
 a=OqWDEjY5HwswFcA5adJo:22 a=DmCNEmdWNTAeIjfGWauO:22 a=6ft9yNkZjdd813gQxDxM:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: vWat2DafFuO4Id1PB8qdzt3YC1ODyJPu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_06,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150024
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2026 02:40:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126997

From: "Changqing Li via lists.openembedded.org" <changqing.li=windriver.com@lists.openembedded.org>

* Refresh patch to mute patch-fuzz
* Remove 0001-makedefs-Account-for-linux-7.x-version.patch
* This upgrade include the following commit, which make postfix can
  compile on latest stable ubuntu 26.04, which have Linux 7.x kernel

  Postfix works on Linux 7.x kernels. Frank Scheiner. Files:
        makedefs, util/sys_defs.h.

Changes:
https://www.ftp.saix.net/MTA/postfix/official/postfix-3.11.2.HISTORY

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../postfix/files/0001-Fix-makedefs.patch     | 25 ++++++++-----------
 ...tconf-to-a-variable-for-cross-compil.patch |  9 +++----
 ...tive-compiler-to-build-makedefs.test.patch | 17 ++++++-------
 .../postfix/files/0004-Fix-icu-config.patch   |  9 +++----
 ...sl-and-lresolv-to-SYSLIBS-by-default.patch | 11 +++-----
 .../{postfix_3.10.9.bb => postfix_3.11.2.bb}  |  3 +--
 6 files changed, 29 insertions(+), 45 deletions(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.10.9.bb => postfix_3.11.2.bb} (98%)

diff --git a/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
index 785fe87452..4e187849dc 100644
--- a/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
@@ -1,4 +1,4 @@
-From e4197bc1f431fd7e555a31e6f7f1e020b4ec8f4c Mon Sep 17 00:00:00 2001
+From 51e29c0a1d98948118e5135bb817a96811105d39 Mon Sep 17 00:00:00 2001
 From: Li xin <lixin.fnst@cn.fujitsu.com>
 Date: Fri, 19 Jun 2015 16:45:54 +0900
 Subject: [PATCH] Fix makedefs
@@ -19,10 +19,10 @@ Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
  1 file changed, 11 insertions(+), 16 deletions(-)
 
 diff --git a/makedefs b/makedefs
-index a740e41..28fb128 100644
+index d5103ce..9713327 100644
 --- a/makedefs
 +++ b/makedefs
-@@ -230,9 +230,6 @@ echo "# pie=$pie"
+@@ -232,9 +232,6 @@ echo "# pie=$pie"
  
  # Defaults for most sane systems
  
@@ -32,7 +32,7 @@ index a740e41..28fb128 100644
  ARFL=rv
  
  # Ugly function to make our error message more visible among the
-@@ -563,12 +560,12 @@ case "$SYSTEM.$RELEASE" in
+@@ -608,12 +605,12 @@ case "$SYSTEM.$RELEASE" in
  		case "$CCARGS" in
  		 *-DNO_DB*) ;;
  		 *-DHAS_DB*) ;;
@@ -48,8 +48,8 @@ index a740e41..28fb128 100644
  		    else
  			# No, we're not going to try db1 db2 db3 etc.
  			# On a properly installed system, Postfix builds
-@@ -577,12 +574,12 @@ case "$SYSTEM.$RELEASE" in
- 			echo "Install the appropriate db*-devel package first." 1>&2
+@@ -623,12 +620,12 @@ case "$SYSTEM.$RELEASE" in
+ 			echo "Alternatively, build with CCARGS=\"-NO_DB ...\"" 1>&2
  			exit 1
  		    fi
 -		    SYSLIBS="-ldb"
@@ -63,7 +63,7 @@ index a740e41..28fb128 100644
  		    do
  			test -e $lib/lib$name.a -o -e $lib/lib$name.so && {
  			    SYSLIBS="$SYSLIBS -l$name"
-@@ -602,7 +599,7 @@ case "$SYSTEM.$RELEASE" in
+@@ -648,7 +645,7 @@ case "$SYSTEM.$RELEASE" in
  		       if [ `expr "X$CCARGS" : "X.*-DNO_EPOLL"` -gt 0 ]
  		       then
  			   :
@@ -72,7 +72,7 @@ index a740e41..28fb128 100644
  		       then
  			   echo CCARGS="$CCARGS -DNO_EPOLL"
  		       else
-@@ -626,8 +623,6 @@ int     main(int argc, char **argv)
+@@ -672,8 +669,6 @@ int     main(int argc, char **argv)
  }
  EOF
  			   ${CC-gcc} -o makedefs.test makedefs.test.c || exit 1
@@ -81,7 +81,7 @@ index a740e41..28fb128 100644
  			   rm -f makedefs.test makedefs.test.[co]
  		       fi;;
  		esac
-@@ -644,12 +639,12 @@ EOF
+@@ -690,12 +685,12 @@ EOF
  		case "$CCARGS" in
  		 *-DNO_DB*) ;;
  		 *-DHAS_DB*) ;;
@@ -97,8 +97,8 @@ index a740e41..28fb128 100644
  		    else
  			# On a properly installed system, Postfix builds
  			# by including <db.h> and by linking with -ldb
-@@ -657,12 +652,12 @@ EOF
- 			echo "Install the appropriate db*-devel package first." 1>&2
+@@ -705,12 +700,12 @@ EOF
+ 			echo "See: https://www.postfix.org/NON_BERKELEYDB_README.html#build-conf" 1>&2
  			exit 1
  		    fi
 -		    SYSLIBS="-ldb"
@@ -112,6 +112,3 @@ index a740e41..28fb128 100644
  		    do
  			test -e $lib/lib$name.a -o -e $lib/lib$name.so && {
  			    SYSLIBS="$SYSLIBS -l$name"
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch b/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch
index d46efb95cb..a74c46fa92 100644
--- a/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch
@@ -1,4 +1,4 @@
-From 953719878466c55572294f42e85127bda5d34999 Mon Sep 17 00:00:00 2001
+From ce8deeaac8ca5d7329e1923790a1f35798953799 Mon Sep 17 00:00:00 2001
 From: Li xin <lixin.fnst@cn.fujitsu.com>
 Date: Fri, 19 Jun 2015 17:14:58 +0900
 Subject: [PATCH] Change fixed postconf to a variable for cross-compiling
@@ -12,10 +12,10 @@ Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
  2 files changed, 11 insertions(+), 9 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index a37f89f..17cb64b 100644
+index 8d7501a..d2a85e8 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -22,7 +22,7 @@ META	= meta/main.cf.proto meta/master.cf.proto meta/postfix-files \
+@@ -23,7 +23,7 @@ META	= meta/main.cf.proto meta/master.cf.proto meta/postfix-files \
  EXPAND	= sed -e "s;\$${LIB_PREFIX};$(LIB_PREFIX);" \
  	    -e "s;\$${LIB_SUFFIX};$(LIB_SUFFIX);"
  SHLIB_DIR_OVERRIDE = \
@@ -102,6 +102,3 @@ index 563ee27..00d4651 100644
      "daemon_directory = $daemon_directory" \
      "data_directory = $data_directory" \
      "command_directory = $command_directory" \
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch b/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch
index 6f8e3e84da..201b4741de 100644
--- a/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch
@@ -1,4 +1,4 @@
-From a8ec63a71361ccd3f6d2959c4c87b7824282b291 Mon Sep 17 00:00:00 2001
+From fc51d9145210350577fdb29a9b0680df779ae347 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 26 Aug 2017 10:29:37 -0700
 Subject: [PATCH] makedefs: Use native compiler to build makedefs.test
@@ -13,10 +13,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/makedefs b/makedefs
-index 28fb128..313b401 100644
+index 9713327..e879832 100644
 --- a/makedefs
 +++ b/makedefs
-@@ -622,7 +622,7 @@ int     main(int argc, char **argv)
+@@ -668,7 +668,7 @@ int     main(int argc, char **argv)
      exit(0);
  }
  EOF
@@ -25,7 +25,7 @@ index 28fb128..313b401 100644
  			   rm -f makedefs.test makedefs.test.[co]
  		       fi;;
  		esac
-@@ -865,7 +865,7 @@ int     main(int argc, char **argv)
+@@ -914,7 +914,7 @@ int     main(int argc, char **argv)
      exit(0);
  }
  EOF
@@ -34,7 +34,7 @@ index 28fb128..313b401 100644
  		   ./makedefs.test 2>/dev/null ||
  			CCARGS="$CCARGS -DNO_SIGSETJMP"
  		   rm -f makedefs.test makedefs.test.[co]
-@@ -903,7 +903,7 @@ int main(int argc, char **argv)
+@@ -952,7 +952,7 @@ int main(int argc, char **argv)
  				  &error) != 14);
  }
  EOF
@@ -43,7 +43,7 @@ index 28fb128..313b401 100644
  			$icu_ldflags >/dev/null 2>&1
  		    if ./makedefs.test 2>/dev/null ; then
  			CCARGS="$CCARGS $icu_cppflags"
-@@ -1024,7 +1024,7 @@ int     main(void)
+@@ -1088,7 +1088,7 @@ int     main(void)
      exit(ferror(stdout) ? 1 : 0);
  }
  EOF
@@ -52,7 +52,7 @@ index 28fb128..313b401 100644
      ./makedefs.test || exit 1
      rm -f makedefs.test makedefs.test.[co]
  }
-@@ -1180,7 +1180,7 @@ int     main(void)
+@@ -1245,7 +1245,7 @@ int     main(void)
      exit(ferror(stdout) ? 1 : 0);
  }
  EOF
@@ -61,6 +61,3 @@ index 28fb128..313b401 100644
  	parm_val=`./makedefs.test` || exit 1
  	rm -f makedefs.test makedefs.test.[co]
  	eval ${parm_name}=\""\$parm_val"\"
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch b/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch
index 0660ee098e..daf5c7089e 100644
--- a/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch
@@ -1,4 +1,4 @@
-From 404150f53bb49af987d7338a808f47fdbd50ba7f Mon Sep 17 00:00:00 2001
+From b63facf538af99e7c79ebee8d41abd52e7d5ee5e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 16 Jan 2022 11:21:54 +0800
 Subject: [PATCH] Fix icu config
@@ -18,10 +18,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/makedefs b/makedefs
-index 313b401..e5db212 100644
+index e879832..f9c132e 100644
 --- a/makedefs
 +++ b/makedefs
-@@ -906,7 +906,6 @@ EOF
+@@ -955,7 +955,6 @@ EOF
  		    ${BUILD_CC-gcc} -o makedefs.test makedefs.test.c $icu_cppflags \
  			$icu_ldflags >/dev/null 2>&1
  		    if ./makedefs.test 2>/dev/null ; then
@@ -29,6 +29,3 @@ index 313b401..e5db212 100644
  			SYSLIBS="$SYSLIBS $icu_ldflags"
  		    else
  			CCARGS="$CCARGS -DNO_EAI"
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch b/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch
index 1571aa844d..c2e640d6ff 100644
--- a/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch
@@ -1,4 +1,4 @@
-From 25e7d1a9bc64f39666eb0e2b9b175773615e28d2 Mon Sep 17 00:00:00 2001
+From fb5b16db0282b5d80edb0ccc6f0f197a7f663610 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Fri, 12 Oct 2018 12:38:02 +0800
 Subject: [PATCH] makedefs: add -lnsl and -lresolv to SYSLIBS by default
@@ -14,10 +14,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 2 insertions(+), 20 deletions(-)
 
 diff --git a/makedefs b/makedefs
-index e5db212..b00049b 100644
+index f9c132e..5ebef5b 100644
 --- a/makedefs
 +++ b/makedefs
-@@ -577,16 +577,7 @@ case "$SYSTEM.$RELEASE" in
+@@ -623,16 +623,7 @@ case "$SYSTEM.$RELEASE" in
  		    SYSLIBS="$SYSLIBS -ldb"
  		    ;;
  		esac
@@ -35,7 +35,7 @@ index e5db212..b00049b 100644
  		# Kernel 2.4 added IPv6
  		case "$RELEASE" in
  		2.[0-3].*) CCARGS="$CCARGS -DNO_IPV6";;
-@@ -655,16 +646,7 @@ EOF
+@@ -703,16 +694,7 @@ EOF
  		    SYSLIBS="$SYSLIBS -ldb"
  		    ;;
  		esac
@@ -53,6 +53,3 @@ index e5db212..b00049b 100644
  		SYSLIBS="$SYSLIBS -ldl"
  		: ${SHLIB_SUFFIX=.so}
  		: ${SHLIB_CFLAGS=-fPIC}
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.10.9.bb b/meta-networking/recipes-daemons/postfix/postfix_3.11.2.bb
similarity index 98%
rename from meta-networking/recipes-daemons/postfix/postfix_3.10.9.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.11.2.bb
index 633e4a7a0d..894e58261b 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.10.9.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.11.2.bb
@@ -26,11 +26,10 @@ SRC_URI = "http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch \
            file://0004-Fix-icu-config.patch \
            file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
-           file://0001-makedefs-Account-for-linux-7.x-version.patch \
            file://0001-Fix-build-with-musl.patch \
            "
 
-SRC_URI[sha256sum] = "d4b4daab0af2e0c16c0d2d5ac3c7680d5ebd2001ea054f7f2a601c759801bc13"
+SRC_URI[sha256sum] = "daed65b08c9288cdb386a914f3e52cdddd44935407b5ce5aee8bcc3aa4207778"
 
 UPSTREAM_CHECK_URI = "https://www.postfix.org/announcements.html"
 UPSTREAM_CHECK_REGEX = "postfix-(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


