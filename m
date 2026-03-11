Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 592D0F41808
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 05:07:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14102.1773205625590794687
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 22:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fkmdwndq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7530e974aa=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B4U6P4486988
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 05:07:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=WH1YzfO3RG5xB1ildY8IDUVbtM98ZkUBIT4CaVBlTxQ=; b=
	fkmdwndqCIbiSGyEKULmh5wNSFnqvvhkGHXPVXX9lVuDo+QBNvMkfebK5sgwRwuo
	T75bFGDpdx1GMWUZ3/Uth6mfotmixfVWM0TMil83ZXbMsIrdSGzUuavEndG+dh+Z
	yXyNzgqbTxtgRrhZycnRXChCkHbq5o5EXHDLrKv+VTcyYKhiz2qUNKWM6OBGIZhm
	C47ZAEqFlx0rg7Xl2LpLVAuwH4Nu+GwyXNkcJMSUAaGWhFvKwb2kHDtTi8Fgn+IW
	o+TfdQq99Yo31+xRL01qRZyzm3bj1nkW5XB123mihLAvphFqjuyla0fsGttD48m7
	bAZLb8X35xOf4/Z1wJcT8A==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010004.outbound.protection.outlook.com [40.93.198.4])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cty5784p7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Mar 2026 05:07:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W1Xwtv2vRVEYAQFXOS4XrfIXCJl2SQYnGy/V9FTyPdnBm5STtCPPj6BUZC5QED2DznvXEuv8o8yOWeLQOMMKp/Yk83RgBYo97jLyNT74oLPYfyDoUkpFUIH33dVyYCwApgXHQy/+yflp5u4zXtfzJTQ4JRQ5ElcPiOG7fEIwTi+wrmSJ5I2aT+6Uj4ULbvBjZ+u1lLkCBcI0rN+sPX1kgm9NHbdGXQhQUJNaFyEuXatoojb7IdN2sjxipeusNZY9G804wAUOBJiu//f4VAZLfQOilfLDvf3LDsUY8pdIh+ZoItrvHddfwudUkb3TKUH/K08p80qSTu/X5OIHn0TS+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WH1YzfO3RG5xB1ildY8IDUVbtM98ZkUBIT4CaVBlTxQ=;
 b=n89A4Jb+iP0nDsfXfOqHTo7LRxgUvTeruUYCDjAcQAxSRUExKGgBIwWEeK007nx6umbdcsPlTa1y8mhyUXzk/BrYbewRzVc5CdmKyCoo1w+BYPkWMEqIzYrmspwip5tm7hQepMIMBPdM/Su9FOafPFHCWLnCpwNOiBgadfNebWzC4YnYMdPywbHBuSd+yGJpEYfeGcI5ncWamCdhkYD0qjVDndgnytglqIiIFeu5wbvx8Ysp+xiArCC9NpiER0+gb1UUHVmKpl2EkWiasxCecFt5QnEgQ2jNbRxT4wOHtfG7ho93imfuRsG6+Nz2lfwWQreii2+M3a8xaJZmI/aiNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DM4PR11MB8226.namprd11.prod.outlook.com (2603:10b6:8:182::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.8; Wed, 11 Mar
 2026 05:07:02 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 05:07:02 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: f_l_k@t-online.de
Subject: [meta-xfce][PATCH 5/8] libxfce4ui: update REQUIRED_DISTRO_FEATURES
Date: Wed, 11 Mar 2026 13:05:53 +0800
Message-Id: <20260311050556.2079418-5-changqing.li@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5ffe1e3c-8d15-49da-1950-08de7f2c0800
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	4eCP6FgzMM+Nnhs2VrOBGYW44vYmWqck3wYigvRgVXnotWKHUVvvzHVjZrR4RtKrqREJ4FtOL9EHDvRyiZd503iiHTyMhOcHUmWLzAen4gdp1yYQ3faydF7cEWhjDmq2xrWZLHxzPOh5NVwp0HJABLbTzl3KG4H2vTqn5olDZTJ7hnmJp3UrslRvyt2eJ3rTltMat5D2JTZC3MJBVMWgpQxq9eXvj2CjFpnhRyq2EiGL2yjTzpvwsjsD1EO+tvZvY6bsQmNZbUBWs6CS/o9udiRaCVM5L0n3qjNi99qSmb3VqN4X0MKgvCPA5YHszR4pp5aRuV/ipQV2n/MK/hVqvP5vYc3Jve7WWMeFI6NRtE8QoI8qaq1lbXx7R+gLwucOX6QK5RIQlLCvyUF6tHA/+2c84cc4OJmCdgPS2/J/l861RzQiTTBMVf6vGwf+MWWygF7Re40cxGd+f7njP3KKi4JmBo2vWh7RsPk1DoEap/vEwHq8k9JHvrthfhzFHOdrCzFOEwxUOtLU1oXzwdFum86L5P+/q8b2HHGDpp8RmRd4meWolhGgF14Oy9CL0My+HDckk7/QVQCdiJVdmmuAosBgoGGl87a8BZF6h2n9O1yQ43DAMkypXI66sR7eoj7BXkD5ScHp3RH0R9M/BTrGRb8cOz4Iy83ntDF4ofkoSDFW6Yv7PXOhsJarf80AqtnYBiU6ocIVkD8KC93qmTqU3qwB1h5v3amOdG+1m2PP+Vyei0Di6rV5zU0OEBEHLo9eIbo9oeeI2ThKbsLPlBGzxeL17p+oc5TuDAw/nAiL8Wg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ERA1vXv8MkOeXTGGtJtw9fIwvFLtB6RH7k+9geAX+K472OVU8j38iglM39qb?=
 =?us-ascii?Q?cEi8mej4cHap0HLHvEyz/S2RCwslDTa75qAththdB4qZNj/EQO+j4eI5JkNV?=
 =?us-ascii?Q?9cQNK54xIgMQj0uE1u5fXl7Hvid7kTYZgPk90Zdm2gfkc9Z6J/f0TuxZLyHG?=
 =?us-ascii?Q?Y9rmcUOrtSczz+WvTknDFkZq7uRYNVomj5eo+67R1+fWYYUscxnVs9dPz90X?=
 =?us-ascii?Q?oHfLg3Fsskbm90lTTLl9wq0gTdvTBDSwiSGHhVKjyy483woFMNVH4YVkRhVf?=
 =?us-ascii?Q?7dg+FLqonYR8KIQJWjdahQEBRjaG8DRW1BOa26opTcYpP1RMAOQAzShQyz9S?=
 =?us-ascii?Q?JrztJdvza85INHT1MjtVkBkgFrfQMx1D4hbAkWStgWx0vTa2cWMreKFqsMRP?=
 =?us-ascii?Q?UbE/L7fF0Bi2d4dOGHt/K3xypQKnT5wwCMqnWTo/x3UdQlHfVj3IQ0xasViT?=
 =?us-ascii?Q?I5ltPoEyZMBiV270DAukWPbYFyVyzqoH/eI/TTPiE6eQzdvC8G2KvpWEUBhf?=
 =?us-ascii?Q?OjgL1UomKKsHzH8TOFdjJu213ekcRTQ01oaTQghFzbYjIjmR0A2rEsaQDTK8?=
 =?us-ascii?Q?mMmL8Wofpl8pM0IdjISCb7qKo2Y4zb0wYGDHfJsf083vLDoL9DD9nLHP8T0M?=
 =?us-ascii?Q?5OnA8nQIihUCMHe+izMcQu1MKeekoqHzDFtcoqyrv3F98eBBBj+vJIVmy5SG?=
 =?us-ascii?Q?/BHWg13rLHZWxQMw1NlMiku/SxPtv3QYEHfaKC5QHxoabxwh4pj4JTbfogLp?=
 =?us-ascii?Q?51pUm3d4leFWpnAFdonQfrq1OuKBFsYsMU1gLNmI/zT+IhlZ8mBDeJF454AA?=
 =?us-ascii?Q?4Fr2SPigt7My70hYdfIkcxgeCn48YhPaSvHF36DrSQApHabfRscjlEAWzwOK?=
 =?us-ascii?Q?YdxR7d+ZMr2sGMq/w9GvxMvkwHnYJTyILYUXtCpG5hgN79y1Cvchnl0mg5ve?=
 =?us-ascii?Q?Ffa6zjprf8sWOUmsd3/e6cjfg+NEIMgMTsDiSyOt9Ui6lCk1RkIoT7eID7as?=
 =?us-ascii?Q?x/CpyfnO0iCvNDaUjiMsYY5TPtWWyDO8ZvhJuyju3owctQqaFGwyYGH1uBty?=
 =?us-ascii?Q?9PfUrfvzXfdaqCqNDhikpmXH4enGQSfUw0picn1fSwIt0TOtNIHMMEZ8i3+D?=
 =?us-ascii?Q?+0uq+qMlhYh8fhFXcyvkdFjU3wPZ0mp09+ZmyM/K0Kx4YI68v+Cl0k6q5yYL?=
 =?us-ascii?Q?CNaZS/cLHRnSnn4s5soxOyy74v/XLu9v8XQvLAZkUqDzy2kXIsp3B72T8aQp?=
 =?us-ascii?Q?7bJQdPspqZiBQSloSBbQoFgmReATg5RLlm8vj6MPtEFwYBnGbhQzTuBIrXG9?=
 =?us-ascii?Q?Sll2Zy9JhJ9r9GWjuSdfNftGGPRvOZorBLNvnWVO3uQC12THICCM8za08PCY?=
 =?us-ascii?Q?QV7XrzdvFJldf5U4/OJXjuXOV5viT6kBLHpVITHRnEbf5a/Z+J2rCFK9C1L/?=
 =?us-ascii?Q?GCr98vuTT4eReLrFoNMzGDGD9LUbpe9AcN+MZYqxsuQLMCJ+ah+Q4z9GRG+F?=
 =?us-ascii?Q?P5GbDurPS0ozNcmHYp0Otb6qViTEBqvsfWvnzisQNQmbYAVtXircik+tiNhi?=
 =?us-ascii?Q?fas+vAVLMzCwIle9d1rVaDvd6ctuJxge0K7EVAkI7uh694T/u0fvNflwjes6?=
 =?us-ascii?Q?5PppFgHg/EC/DNZYsUVJPNs0hOV5Fs4YxndbJWI4zTkcuH96dviKsTpCGvZL?=
 =?us-ascii?Q?xarvWlY6CnJWIjtztrc3oZpDdLgXap850gB+gEBxtAbhpzrFovqzqyANfXmK?=
 =?us-ascii?Q?N9/56aWZteE3Ozh+idznFJ8CfNRzpoc=3D?=
X-Exchange-RoutingPolicyChecked: 
	N41wIgnh+BNTzJlbPI5Y7Jc9ugGopkzcT3AaUtzg/2biLOo8YkLD29hsPoW2jO9Q9PlZJeMfloIIZI+WJNoOuWciu+zkOPIIeExPb8Cz6NSadX6v5vV1Jbc0ymkC+Z/JEhLp9EF2L1xPW62mPD/Kvr4ZHtPK7ZOHVDBLx7l9Zf+5qi7YgDup60NVdAiJnc8nlS7tdcsT2V8oReGNNQ0GXbUQYx07gK9tbU0+ZD1IqqnYk1r398sQB2PiwBmi8oHdCJJYjWMxftrlwCsLRAicZtalIxEneddewZabIheHUggYwmRM52ArsdatjZZgxrob2qyjMte9sckBJdtXlhxqAw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ffe1e3c-8d15-49da-1950-08de7f2c0800
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 05:07:02.4288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y3MWeWNS6YIPfKm2jJRsf4rvOfO/zu304hfy5uZ6oSeFn0f5NcXFF9ipOX8EIEci5HGWr9IlxU8dqDCsgF8Q3VAK+bj0NSoQ+rGxReUo1X4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8226
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: UlupTyuIsoYeSGTLViQLTUgfgWmn-c3E
X-Authority-Analysis: v=2.4 cv=fpnRpV4f c=1 sm=1 tr=0 ts=69b0f878 cx=c_pps
 a=sUcN70kXflTsQYyr7PD0vQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=J0ANhuiYi7gGgHjyVd0A:9 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: AkUkp4CVS73QADronrgcDUr7e7NEmtYh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA0MSBTYWx0ZWRfX0XjyiYvV2bJL
 jIl6F2j7hAkepTZu0F9pELy7fDRNABGnDnjuAx4N5KUft/R5j49LnjYaqURXZbCsDxSZ6jVyTQO
 OtjHH/bQZ9gztFuCOIiZo/Dn/E1VyPs4vtNX1OwvIvxHrUmu4fkGmqg5Do0eoCqoaMVrT4zVvWw
 Bw5wOjULHFqv8wZUk9cQNpI6Q0N/iNYg5a3UJvjEBsT/OmS8c/o86rN5RsdWrH8YGiI+dwL5AmJ
 ved2BUqg39lYoQ1vY0MIF665pSxtVbb1LTrVBl8ww3/M3LSlYRWLDQvK+wE4XGx6j4VTeqLmKlY
 xVD620K4o+MEaMDzUCItfLR04c6ZF2c/PGEUQTz9T372mO/BfjS44ffy8tDspilvAw+uKIBpWfy
 FkmLpaCty2bFoE88JrQYGJ/hVHQ5OsCJt2ebT9NxkvsX2p9G1fFXy2wcyy6/e73zeRX4/Y4byT3
 DKq45FFUneRyNLtWWKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110041
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 05:07:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125055

Refer [1], when DISTRO_FEATURES contains opengl, but not x11, world
build will report:
ERROR: Nothing PROVIDES 'libice' (but /build/layers/meta-openembedded/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.20.2.bb DEPENDS on or otherwise requires it)
libice was skipped: using DISTRO 'poky', which is missing required DISTRO_FEATURES: 'x11'

[1] https://git.openembedded.org/meta-openembedded/commit/?id=bd206048b6fabe22a67058aaf250a28d00d92135

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.20.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.20.2.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.20.2.bb
index d485abc19a..a0be1f6067 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.20.2.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.20.2.bb
@@ -10,6 +10,7 @@ inherit xfce gtk-doc gobject-introspection features_check
 # xfce4 depends on libwnck3. gtk+3 and libepoxy need to be built with x11 PACKAGECONFIG.
 # cairo would at least needed to be built with xlib.
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'x11','opengl', "", d)}"
 
 # TODO: Check if 0001-... can go
 SRC_URI += "file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch"
@@ -19,7 +20,7 @@ EXTRA_OECONF += "--with-vendor-info=${DISTRO}"
 EXTRA_OECONF += "--disable-vala"
 
 PACKAGECONFIG ??= " \
-       ${@bb.utils.contains('DISTRO_FEATURES', 'opengl','x11', "", d)} \
+       ${@bb.utils.contains('DISTRO_FEATURES', 'x11','x11', "", d)} \
 "
 PACKAGECONFIG[gladeui2] = "--enable-gladeui2,--disable-gladeui2,glade"
 PACKAGECONFIG[x11] = "--enable-startup-notification,--disable-startup-notification,libepoxy libice libsm startup-notification"
-- 
2.34.1


