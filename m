Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E75EED7B87
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 07:55:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13681.1776153351983157015
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 00:55:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qZsT6wD4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=85647f3f2e=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E7Zj8J3975223
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 07:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=V10lgXqZELauNjWpQqBxql9ot5A0760dmEnspy05zK0=; b=qZsT6wD4WmTe
	EuZggkXw7cxs2A5hfC8DAakqsgXVTF6a/5N7ij2B+2TIEcOD0uzygiQBWJVCifWC
	lEMFcPg0j7oVOoSMY4lhidaExr608f7KaiqY6yEf71o8LDBwsGJ9hle7B0n+Ju78
	zECIZneVhhxwbVhmqtdiG7TLJejgmcMiqmf5DvXD3skNc0cgFwN6FES6X4EX/5RS
	ikWbRmUpPjDdl98ocX45660pfoJbxFPt8sZL1Mf/xpEAGT5ZtawT4PH/3RRQUIK9
	/4aFIDsnWnQKvVaflPiM/0dPO7ySHrHDgmNVu4m2hyGQdxT8KORpZ4vgJCCvqGt6
	eLST9l5OVQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013053.outbound.protection.outlook.com [40.93.196.53])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dh87a8ejx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 07:55:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QZAnOI1tatYHgmlGjT8dn4dMKtS5tb8MT8C2rAuivGcL0ofnU/U5PnfSGKbtvg5ZPKEDN3RGT2PavIykbXhBO/2UVxEM14Y5NZuh7Dem7NnwpSIat4+tD8teDhKmp+ojPkXUIM1IkdLJz+YMca51nBhb3TYT6ecaHDlJF88j3ya9d6XkF6Cn29o40Y0juVEW3SCKRRXcWsS9a1x+tcCa/Osmi90AAQo44li83UI86K67EYfveDSVv+Fxy4+M8ZlclRaMuH0P6UYBQMih9BAXw/jH5DM1aNZPD6V1iRMVOwVVuIfn1yzFzfCQV16FDEqZSFpeeNd0KOoh29ErMcN10w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V10lgXqZELauNjWpQqBxql9ot5A0760dmEnspy05zK0=;
 b=NAcVZAOqGD9WT3ciBml03jfHfrUYsPz3rscT7/lfSOW3MHPjmZGQRoetev0Digk/EJil2jLH8xYO69bDieUNnIPC4e3n1gDlZ9h4Qg7VwqeIlhVbur4WalIYqUFnH1Atm3GqfCktpR6LCurnCGdlz+a591Rw7eTbTHKl8pRUfWzgp8uQMbpC73qJG4gNbQe1NklUotrOlnvlJC/ur/GAyYqfdltTiMN45hE1hh/vOzlcKmMYUjDQ4VxUAA/JNaLL2CkkZjLuuOu8Y2YyoVC3kOBaIvEdgjr4hdpNGUqYjEmdxRDUh9xwMPRp37FpvO9y/Fal+kLYK5KeyQAQ+M0GXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SA2PR11MB4938.namprd11.prod.outlook.com (2603:10b6:806:fb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 07:55:48 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 07:55:48 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 7/7] parole: fix do_compile failure
Date: Tue, 14 Apr 2026 15:55:21 +0800
Message-Id: <20260414075521.91846-7-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260414075521.91846-1-changqing.li@windriver.com>
References: <20260414075521.91846-1-changqing.li@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0092.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c2::9) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SA2PR11MB4938:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c39a3a7-6733-485d-65b4-08de99fb3d8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	jAeHEx8m9G3c5WSjYrxPOw6BDBcfKV0gejVgtqPHJKuDkJcNqIoM98fLU4B4nCNv13url4n5/AMFOx9HgfkS1Nwxd8JDspffzkp1Ge1/By+FSn0hEyfo46GxP5dGKkniGmqgBBSkWK6Yzxds6holR9wsfm4GstWOgVOpWtNa9dvCQQlcIk3hkw3cRfO2J705TatIMl2YcSPgVxf2+J8uUD01wo/xMVBUF0ZtOrgwr/35OIootCNUTm/RAq7w784pMdjWj/TEunsDb9gkDDvCP2KCDUagmRVZ/0AjGU7c/XfccawvX8dVpTjwWjLxGiyffI4k/UqaHKy0dOSr8EYEkqsQpF4oQGfVKQlKJmVJrCURP1ymu0ZVy4HMDwGAB6QBVBXwF5T2wGmOw6nHvbMvBHRqxxgLQO3ugq9hfnf3p461NuYSIcB47r/dgsv9Le4OCNmJp4haWcqQcYJHbbf0XV0uHvSxtSdPdDxcXPds9uONQe/rOvmvF09u6vT/VmgK9N8o9fgGRh6j5f+23YsLYr2zlbfiJVJiURUZZyFjmFrx5TnjCFj42JYz/2P6rXXIY0k+UhJiIchnvXd5tFznvFuEuD6m04S54XNBZcn1pkRaU2VQWCkQKpsjqC53y34Nd0QxgCcmmupB9erR6wjwAfXSWXLTyur9d54Z916tuCsKF7uozbPTTSgzprsymQz1+te8lWcImqHUQC1iz99SZCV1PTTWlm31cvMADE+Qt/EdF+hvbhkqbZWvJFybh564xFQQvd5vElpUmVo28G0GULZGPmScvFGGVvJLBwAHI1c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6vD5slebfiqtbwB2L3scLbI/4r6ThqSfyesllw7vYadXj9S+b0gVOzW6KMrG?=
 =?us-ascii?Q?+iAnk1SpNXopkwFwco0jzVjU8T0lcSR31Z2nPgtUmQV97O35lwUy3sfleem4?=
 =?us-ascii?Q?I/5N3xEeyovaJfnejX++U1nxS2+YeA3DwCvnBPJIRYWnN6+aaXl5ux8N5ogO?=
 =?us-ascii?Q?69LQbUgyo1aHj8xRMX5zAkj9EPVixq0jt0/Ql3jwsnVN2BUjaxk1mQXIux5L?=
 =?us-ascii?Q?qJusD5MbWkB72ZPyFmuqchGiLeha4A4RcQTjMd2WaAKULOKevQyzsTlO5wK9?=
 =?us-ascii?Q?2RuNu+xFAKeG2Z52SZBFrjlwKKFGcppnTNY+aMYD+rlwiWxFlNt3PQ0R3K8C?=
 =?us-ascii?Q?+H3CN9R+aoNePKgR0I90abrcKfymtWhrVOol0HnseLtacjACJPC+mrtjlYoA?=
 =?us-ascii?Q?HezPEGybL3XfAuVNqotVjTEf6ri93S/3BeotzADTO0MgNNSTxRyA04ezGtZ0?=
 =?us-ascii?Q?SVS6ckDAyQ5kB6w6CtDTswmLEHTxbswRLvB/kL4AVwE5s+hUASqdahggY4Op?=
 =?us-ascii?Q?GUljWEfkMxeFFrmCAqhRGuJsnzy1jWyKpwgn3QCpq28a1eo1dpjefUOFXCZr?=
 =?us-ascii?Q?L1WlzXM52gjB0efjWQsjPYQLVNkhupLG19P2OHqZK9ZFWjcCm5KKIABwvH4A?=
 =?us-ascii?Q?mcCwBwvnd6+7yW7+FZ8+4W6NAgAA2v1n2l3pxhCkV9umEGnW5nG6U9mLCyoY?=
 =?us-ascii?Q?YPy+znib48dLTf6/OxHeGEIMyRhKNuirfxs+l3ccS77rkAFtOwTvZjAOljYg?=
 =?us-ascii?Q?f0veNz8lOhWo9wtk0sFHJoAhSL7xscsCBkS/UuVbwvyY5NoW7pjSAyHrjfJC?=
 =?us-ascii?Q?PpxsjTwyDouiMTCyzJX7Zth0sX3v6kz2RQ8Hb9ajQyg/HOv69S3hehIb1xbL?=
 =?us-ascii?Q?o0EfUSHudYC+Jh0b5x52hrYK2oq+su8AMLjsopqt4CatwNVAW7IQXfIAANsl?=
 =?us-ascii?Q?43E8PSwxg0hyKeRb8A+OlW7wBYdAZfDb3J7rOb7pOEONMJL5N9Uau/f1vBkG?=
 =?us-ascii?Q?IeSDJej5MJ3sWsyW/lgt8zMjajBhIxuclpCt/DyXJHIY5sTfq1/Um4YYYbve?=
 =?us-ascii?Q?nb8R7MYKusydvWiCYHhMj3awa8Rp+PnzWe3vf3MA40N72nFlL7zETnuC2iYN?=
 =?us-ascii?Q?LPyDM5kTWKlB0oey9WsIoIKJXhIJAAAbJtGr6UBkVoUqEL5UWprNAPzMZd88?=
 =?us-ascii?Q?HnAvKalt/Rl+Tz9To6jfPRjbEhlPtaDuL+g/Q32WRij75HdkFsVD3TL6vbvU?=
 =?us-ascii?Q?Le9oNL00nljbrZOroP8tHWwgHg9+mUQbpfKyb0pzXi2T9jEzzNNWpFRS11E0?=
 =?us-ascii?Q?O6Ggys0wMWaMFdWc8k/xyYOgCfYWjCV2KtOIXQQmd8sDhrZ2JeKmXT8JJcvC?=
 =?us-ascii?Q?4dhStkzqTfyLl6w2XukVdy8lfLounhCDVQNKFQeACORpVy3nzCJJdXoqSxHk?=
 =?us-ascii?Q?5klKM9mYkytC1SEDJaUqkiwCQiILsfEwwh35D7o6R7EJzboHyyG0kPYrhZPI?=
 =?us-ascii?Q?v1xFdNebMP33KEqsz4g2feV9AtBVRwBbmGvgdesiL3GDsNvUmAhr82Ig572t?=
 =?us-ascii?Q?MQNZSAPvaCcDxGAH6G3XcE3vQl+AXD3AouORK/aLpoXZWc+Wgs0y1VXLx2JY?=
 =?us-ascii?Q?zect4U2ysh7n5W66AzeSVaRbmJtjNnFgUEA8IQ7GzVp2xMO0jZ/td3jzP+zf?=
 =?us-ascii?Q?zth8fycL59LXeJFNyQh57kp3W9Jdwwtc9pC1jSpuuJQ+pecIPktmjEgJRFoH?=
 =?us-ascii?Q?ArtAUL5omxk52O63UEs+eOsx3/NFFAQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	cK97u9iejtddkpRz7ORDSrvX2QheVFumbnGDv/QTDBBOTFmNQx9GpiSmdRXZen6K/KlHZvDIAwf61OH7LIWeHK2pYFKlTE2fFscSzR0HeYog+C+R8JxFdBIRPZRaa8dBiweydVjid8RKpRZjO8G8wr468bm/i61busLAJOfBs6P/oWm7OFMCClROEtueiGcr8U+HFFbm94LQNGv/+VdTcAKeL3i6yoajBLIExqAXCZ1PCtdcIjTbnoDVHhYrLp+Wpj5OCMJscTRlk09Qturo+t899onanhfgr5F1xMpaWskrIJbuTjTesktCiK3GGJE86A8djOWcNw8f6lJB7ePz+A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c39a3a7-6733-485d-65b4-08de99fb3d8b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 07:55:48.3290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kvx++R5BgDNxd0PCcnP7u3Qb+m1ZFRaKBXGJUxZ9i81wj/xGVn6uJFxh9iiHzf9VOke/HS6fwQVZEbBsEiEMUSAa2VyiM+1BlOpHy7Y5+xQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4938
X-Proofpoint-GUID: 3dckEIzOEso3gs6Zq4RvOjS8074omogD
X-Authority-Analysis: v=2.4 cv=Q4jiJY2a c=1 sm=1 tr=0 ts=69ddf306 cx=c_pps
 a=5zjvB78PlnLPEzvzEo0MXg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=O24Aq5uEAAAA:8
 a=t7CeM3EgAAAA:8 a=nJ3TWLNaVyPuCwUjh7MA:9 a=SYBONWESK5muIIdMMRMZ:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 3dckEIzOEso3gs6Zq4RvOjS8074omogD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA3MiBTYWx0ZWRfX7gvfPCSQXJ7S
 aDMDJ/uS7UDA9KoFP8EuQ/0DJoHKgu5C5E/SygP/ijtTTdbeHQLVyxza3WDIzIT/2PGbBHdTHpX
 i8GZ9KPfFyxoRfKt6yIWPKoly1vJ0VIn3LhTaJWSwKJ2Sr4eG6P9IoeJWSmk5GWHFUbLkoK6+gI
 nCDlS1vR0+ttlpHNasiP0Ql1U6WoWWfWCQqCGe2dlQjAMTUfYK9H2RjsH0rzikACEmQas0Aq1Iw
 Kffa43U9Wmjk+8DAFjae4foXo1k2PoMWc99ZCz4LrbGmwjdnncgUxdxiiLJwygAKhZiy8/nx/6i
 Tvfnw/RbO02HtA83HzxYaExMM8e6RdiqqtkVbx48lArM9n3FDe+SoyRhumgyesG5GaXWGSzvZWi
 P+Eb8lU0HGTf7ZUI4JM6Jn+1Y1abFByPFG8uqFbKejScG1MIPGxbFxCV/HvVmgLgqfQva91nu78
 354+SnJ4J6yxuyuJ56Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140072
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 07:55:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126303

Fix build failure:
/build/tmp/work/x86-64-v3-poky-linux/parole/4.18.2/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-ld: parole-conf.o: undefined reference to symbol 'xfce_rc_close'
/build/tmp/work/x86-64-v3-poky-linux/parole/4.18.2/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-ld: /build/tmp/work/x86-64-v3-poky-linux/parole/4.18.2/recipe-sysroot/usr/lib/libxfce4util.so.7: error adding symbols: DSO missing from command line

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...0001-Makefile.am-fix-compile-failure.patch | 31 +++++++++++++++++++
 .../parole/parole_4.18.2.bb                   |  3 +-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-xfce/recipes-multimedia/parole/files/0001-Makefile.am-fix-compile-failure.patch

diff --git a/meta-xfce/recipes-multimedia/parole/files/0001-Makefile.am-fix-compile-failure.patch b/meta-xfce/recipes-multimedia/parole/files/0001-Makefile.am-fix-compile-failure.patch
new file mode 100644
index 0000000000..f84f6e5388
--- /dev/null
+++ b/meta-xfce/recipes-multimedia/parole/files/0001-Makefile.am-fix-compile-failure.patch
@@ -0,0 +1,31 @@
+From 34ff86795396c320a9e19641d9d226190b7fdfc6 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Sun, 12 Apr 2026 19:30:23 +0800
+Subject: [PATCH] Makefile.am: fix compile failure
+
+Fix build failure:
+/build/tmp/work/x86-64-v3-poky-linux/parole/4.18.2/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-ld: parole-conf.o: undefined reference to symbol 'xfce_rc_close'
+/build/tmp/work/x86-64-v3-poky-linux/parole/4.18.2/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-ld: /build/tmp/work/x86-64-v3-poky-linux/parole/4.18.2/recipe-sysroot/usr/lib/libxfce4util.so.7: error adding symbols: DSO missing from command line
+
+Upstream-Status: Submitted [https://gitlab.xfce.org/apps/parole/-/issues/146]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 920b708..244c14c 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -90,6 +90,7 @@ parole_LDADD =						   	\
+ 	$(GMODULE_LIBS)				\
+ 	$(DBUS_GLIB_LIBS)                       \
+ 	$(LIBXFCE4UI_LIBS)                     \
++	$(LIBXFCE4UTIL_LIBS)                \
+ 	$(XFCONF_LIBS)                     \
+ 	$(GST_VIDEO_LIBS)			\
+ 	$(TAGLIBC_LIBS)				\
+-- 
+2.34.1
+
diff --git a/meta-xfce/recipes-multimedia/parole/parole_4.18.2.bb b/meta-xfce/recipes-multimedia/parole/parole_4.18.2.bb
index 7787196fdd..1d2c858a2d 100644
--- a/meta-xfce/recipes-multimedia/parole/parole_4.18.2.bb
+++ b/meta-xfce/recipes-multimedia/parole/parole_4.18.2.bb
@@ -11,11 +11,12 @@ DEPENDS += " \
     libxfce4util \
     libxfce4ui \
     xfconf \
-    \
     gstreamer1.0-plugins-base \
     taglib \
 "
 
+SRC_URI += "file://0001-Makefile.am-fix-compile-failure.patch"
+
 SRC_URI[sha256sum] = "6625288b760d38a15c295051ecf66c556fcad21dd1516d6d661c2a582421ee0e"
 
 RDEPENDS:${PN} += "gstreamer1.0-plugins-good"
-- 
2.34.1


