Return-Path: <zhixiong.chi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C67FD5F9D
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 09:17:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.102312.1775639870155218679
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Apr 2026 02:17:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Mw/2OulY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=855873c0d9=zhixiong.chi@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6385eCxR1986103
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Apr 2026 02:17:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=m0nnNyCHnZq3VRnmcOy2
	wSNhKNyrgJUrLE6c83T17cU=; b=Mw/2OulYeJ39yBXdO2nqWnx62Ptare/s1jzH
	7wfwp88aEx4NxwNQrMaZhSI5CjDP29m+AnfaCj86e3xz+uwDzZgdET0/8lMpxF60
	V9Eoq4LeEJ5ol2dhozSTlB7mlI0jEMfFP0aB7cp/9O2OBbrozdRG4+UKc5asgt9J
	23J6uotEwkyvLZLg54+OmXuuyhqaHdiljSEF6uqS8CWggWPIoBXbV8i7e69VQsuX
	alNwyAYpuVwIUFh8UWTtaLOEYDvCh1wq9lB34BiNb+jqzkll+duIUM/CzXVoon2+
	qTTY6zmIjek/rb4VX1b1pdwv/VW98YskaMdhM1nwj7bmtbQIJQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010028.outbound.protection.outlook.com [52.101.46.28])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrmj7jk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 08 Apr 2026 02:17:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gv7O3ZmU4A6XZ0tULgCJDNaENQxBSjRD0YgcMIgzrtKTvF/bvVWkCPbwsxXo9q9aFkFBItuUtEWctAhKAmsPCR2BsLoK271UG1fTPFgiuHYvnMqHj7EiHrhS1751fC1PjVehKVYEb0ratKkeK/OQ3w3CZAySFygRuQ9mAjKYT2U/ikeOqy2B6k7ox41wk1uHCrUZnJCOt7QpGcSoMQBBtUm3LhXWba7h2bGVxB2kDIwuX+m7NN85B6ucf8jjsH+YLmqiVlIFuCX8DnFa9Tl/uNbVY4uTylAnWL4XAgEFdAWT9rxkupe8Tku4ctMUKZTp5WoqQJGyEinAIoMCSjokCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0nnNyCHnZq3VRnmcOy2wSNhKNyrgJUrLE6c83T17cU=;
 b=T+zrihlBXEguweaG47NB9nUrjNTW9imMQ/qFM5PAHrou2DkqX0YEKZbY8xWRqDmi0Uyw0eo0vZ3FNnSsQT7S53zwN0plltJLsIT7tVzXNEArHgrrcD+m+aJAELNU9LnZsZoHKwkcnor2mviOrIqbohZbz7wQp4XiKGGLynvDcMVJQINJiuLt8mG8Ouq8OzhZhW3tuIDYomyTYeoX6KBltazvjNbPQjmF6WzeAbhzJqwIvz0hz48iOdvEghRPUyBuhsCCHgE0PbuuUmeCV79UW67ILD52hOvcBeKvRqQMmAIPv+Uyyl8TXzxQUEHDxUh40TuZttYZRmzNYfu1QbQhSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB8986.namprd11.prod.outlook.com (2603:10b6:208:577::21)
 by CYYPR11MB8357.namprd11.prod.outlook.com (2603:10b6:930:c5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Wed, 8 Apr
 2026 09:17:48 +0000
Received: from IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c]) by IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c%5]) with mapi id 15.20.9745.012; Wed, 8 Apr 2026
 09:17:47 +0000
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] networkmanager: Do not ship initrd specific services into rootfs
Date: Wed,  8 Apr 2026 09:17:40 +0000
Message-ID: <20260408091740.460406-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9P221CA0019.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:408:10a::34) To IA3PR11MB8986.namprd11.prod.outlook.com
 (2603:10b6:208:577::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB8986:EE_|CYYPR11MB8357:EE_
X-MS-Office365-Filtering-Correlation-Id: 97af9e73-bd37-4d45-a544-08de954fb35d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	ClTck6r3Ju/9yfeCMeqMx4/p9T31c+poZ2iwKBshTxQCP1oKH8iFbmH17rBECjX/hM/uDjFfkeXDR2hLGCnGPRvA4S0ppt4kxEq3fwEvasM70A4N4yO2IpllZbpmZEObPl/PzFxmhi4AXKK0gRb0lLzyM+2wPDx7fasfVm+AiF2SVsq9lUdxeQtaCWdjUyqUpTxkStVPEaXm8Roq0Nx1m5yHyf0/XtZi5Ne4sLvqQ1e4GTyTLFaULAuQFw1NzsDQQPabwkAJhs7s/lgc2RUicCK921lPOETpZ1jYUw3mqkEkMTYNu15z3HOu8UA726gNGjh6V3dJ7KyJzSvA7Jk6omBZUTxDLcRYQmXmbm2NCypUr60nCf8Fg5jh+V6p/4Nvd5x1Jni2pvtnJJN5LoroTMIgltXAvnm4ZFd2MDthzrioRWMpCbCToZZYThjU9F2LLkOIsbBluiSLWhpRTk+IuVc2lqTQawBIz/UmkAOGbrFMNblRhqQ1Br+0gixH/yvYhj2b+VH1jpSym7QZwsd9k4K8RqYqcjajCJ3yRXzyXwnyEpu1NsGdv8NelYcE3wcMN67vAUfpIdXK3a20Xft0WJsE+MyaIPAXxLXaqngqdEt9H9MAsfL0Hhb+tkWyCsu3Ox2r/0AAvB0ZP1oBigr7VCyc4trVZQ8APL1LPt0ZpLEcGY+LobCtomwoUdaUC+9zF9LIMdJGqkJhTLN3Zuk7hxyA7CMn0r/sQ8ioaplpKwACQAS6T213/xJVTHwe+1X9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB8986.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qmCFG71RmWJtnt6lYcXed6ntpTWIfBiRuxCFqiE9RyCfu7+3qhn9RdDmd48m?=
 =?us-ascii?Q?FeDqAWaNFc6Ve5OWkjMAdzKjcnku5W6O+5+pEGxdvormlJa+kyy+9CrWYhNs?=
 =?us-ascii?Q?oIeEl+ionhL+ddps1SfXs7Kh/00Mg5zbzKWZsxIj3WD52vs+w8SK1XQ50FiK?=
 =?us-ascii?Q?q172cR9Y3YfSNamUQT9LtFMGnnqIv8UXAGcEwvlQ4Jf0lAopxlCBB6zOlhnh?=
 =?us-ascii?Q?07BvrWzo7gGVU6jytiVT9gAojJFJ07ZFIDEFx2Ja38rLz/nRitpqZ3/kG/GH?=
 =?us-ascii?Q?jopiTg8efGLiAJAX1R7+iNEkcZrW4HyezAApn9k+EGFUAtL/l+9gjgMeLXUB?=
 =?us-ascii?Q?vUYIs33TPzzVuHnLBEijStyv/9wL/X7iS1uYl7N4R5NJdhq2zmOcCAPBVCJb?=
 =?us-ascii?Q?Jnn0tNGWyai2/Wp5x03QN7BQiF5eqeNezF3oDv2aGIayQRb1UTeiG5yc/9AF?=
 =?us-ascii?Q?cPLhv7WvMPFgl2hBi5EHg6ZEuVV7/fRvWblHgHjAXEhkYI4giygb46wLeFf6?=
 =?us-ascii?Q?3vv2PaZRnaUPEb2hVQkeOd26FjhMwx4cV7lQZGWxeNcni2Z4ZX4QmCdDyt+e?=
 =?us-ascii?Q?2mABYLJY23zImooPrv8pCnE4geL88rrqwAPaVr+kQLFNpAHItrEki7GujY76?=
 =?us-ascii?Q?HyepjlrUcJhXNRQ/4LM1lqgm5M2EWdqyOz7Mv7Rdzpc8O1N49lZqkQlnDZiC?=
 =?us-ascii?Q?vAHIyIoKMb2wWaS2GP0XARVxwr8mNuK0THo0arLimfAjX4ZxBSR7hDc8//js?=
 =?us-ascii?Q?Rx7L0yWFBDrWzKeLGFwF7IQQEPLJZ7G8lM0+xt24vXvKdKBFqfn4XJl28+z2?=
 =?us-ascii?Q?7OU7rjEjnAYxmhmSKy3usftjJK0S5gFqlfpKEF4M98cNjViR9v6fh7CiHifP?=
 =?us-ascii?Q?FSAXw6WLEobIc47QdLDidP/n+IwPV9THdx74VItzrbczu2/nLBbbvka+cSEe?=
 =?us-ascii?Q?xxpdtn1WIte6y8mMNc6D7PgsWsWSiDmV/NqVw9rYQZAHA9LoS8ImJ3Yb7KKc?=
 =?us-ascii?Q?GluaAZkp1Ybn3InQoWCPLRfFiflubwP64y5dFcUsaSK7LP3YE6CEDNQ+k2h/?=
 =?us-ascii?Q?QuumRBsCS87vYRQF+UXKDYY9zSchWLjL43aSFopyx3NuVLwtlYAbFNPKKKVU?=
 =?us-ascii?Q?Rd8ZvVpTsZvf1nWRVeQe/I90grfpMjFwI45hOWYQC+tzmHwiDXAv/RFFk3I3?=
 =?us-ascii?Q?h/HtVgb3m60CtWwE8kV3R2VNE0rBy4JxvabQgre+y9+bhbYLx2JbHyeH5OH/?=
 =?us-ascii?Q?SBIuWb0k5iXq3/8cT1h19xCF0hLqHNYPtFxXEGkHYsXgzbHbWJja0GdG0No2?=
 =?us-ascii?Q?RAN4r/gT5cxQug5cXYxC9JelmF367+cgCxMiYtLcMGUgB2CXA9q1VLsWHDB7?=
 =?us-ascii?Q?uNXTyDMlUX5W8qF4gk45Du2E+M/feJAtIz/WQvhAKCK/bAvqGtcT3E7o3T7I?=
 =?us-ascii?Q?KgNOm6YxWAhYSqL6nZQ8VZxg6vqH69NhZjV0MJXItidQd1HU1fyDA9fdvyj5?=
 =?us-ascii?Q?Mf7wpyzMdnhCktFic56RkNaBnaQLDaHSFjNMY3ssGL5E2FoH1iYyy8rpSrkR?=
 =?us-ascii?Q?nk0cXpEUDhdHnbqw5kwDoKS6rrC/3Jy23p758b+BXosv+sOXAogtMzNCSuSE?=
 =?us-ascii?Q?TRgPXARriT8jfvHudOt2XyaE3Jb50N3S1tj02n2Wx6Kt1JchauAbxJF0mIOX?=
 =?us-ascii?Q?R9D/dQ8AEgEm4dGhHd6RxDstGg1JZmnNlaFFDqZzck/FzwVoivD84kzgWb9q?=
 =?us-ascii?Q?pykErbMHFe22Su9Ry4jWnn1EDTiYznA=3D?=
X-Exchange-RoutingPolicyChecked: 
	QvbZnnwAYAS39AKX4na61BOIq2tWulgB68JmbICChDuoBDrdBDdRiFABt/S856DCGHsCZx4tT4jnvY7zO8sJweXgu3UXC+zW+/VXyxYpnqqP2IiZj/y1aHYIF/fhSNyadyUPe9f/zVqA0RMDwbybapd2KswUvHcTql0yCp6WchTxlZWJTM0w1RaWkRcpWTvCM4OuVrk3UnZ4V52xpOGJvYikm4/cpgiIvcptY1AZJApPg6VedMg3bzpRiiEkgh8BkQNbZpfOowqFE51yG565L8Hha/RwVB0Hr+731cTx9jbUQzCLxevH06H9GKOdN/lj2Gii4yPs1yZO4KziTeJRdw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97af9e73-bd37-4d45-a544-08de954fb35d
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8986.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 09:17:47.9201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sJEehuX5o4hkSMrEZDjTD3Xv4Rsq85NQ6NBRjLae4S75p4bG4aRUxsxKk6qfKlrjIt+UhFRp3nh9r50bHnUw/vF1RqU894IvM0iNk4yRLME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8357
X-Proofpoint-ORIG-GUID: 1aEOFEg_H56XG6vxERvtMiR-BtRV8j7Y
X-Proofpoint-GUID: 1aEOFEg_H56XG6vxERvtMiR-BtRV8j7Y
X-Authority-Analysis: v=2.4 cv=PpWjqQM3 c=1 sm=1 tr=0 ts=69d61d3d cx=c_pps
 a=5NePcLBJi4TpPzNSyn8y/w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=e5mUnYsNAAAA:8
 a=t7CeM3EgAAAA:8 a=FsIFGfylGi5KHtYiohgA:9 a=Vxmtnl_E_bksehYqCbjh:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4NCBTYWx0ZWRfX3Y4R0L8zFM8q
 YIOT9CvbG5+Gi3eo3sPVCzHmvegFqoI0OtgvAfPmnRYjBQgLiuWnSvC8fpzTLdMeMPCePZCQw4r
 CY18dCICEswa0ih5i1IBoYs+8UAvLJ6BAa8dluRjD8YXJxIwyLDPfqwE9+8kb4qnCzOv8IfyRJk
 oJWc04FgHptckT6eWlXAhImZMa3rlHB2IAtga7rsAhK1Q7iqffdYvuLtaLXeWQchgyt4AR70ilB
 sdl3MBclb5hvfVozJx6IISkPdBO/TjfDvsBy/1YQiHDHMACQy+imWJq2dw988u1zTLQ4LyyyI7l
 J9c6GkF7UwKpiE4hD64upnyUlTVNB1IPT5m0YUaJPG5aWZ4Z0RD3M/OBzV//+/Z1bnTygYbm00o
 q9NpqT0loT2P3MZDJe/VagGwtFLdyglSrcJ9w4Op14l8f209Bc6X94gYk5QXHIuNXNZmtGfnXvf
 b92nDvoyd9nEm610nig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080084
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Apr 2026 09:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126102

Those systemd services were added in 1.54 upstream
https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/merge_requests/2089

According the comments we can see they are meant for the inird
other than using for rootfs. They will conflict with the main
services and can lead to potentially confusing error messages.
So remove them for now to avoid the following issue.

>$systemd-analyze --man=false verify \
> /lib/systemd/system/NetworkManager-wait-online-initrd.service
  Failed to put bus name to hashmap: File exists
  NetworkManager-initrd.service: Two services allocated for the \
  same bus name org.freedesktop.NetworkManager, refusing operation.

Test:
PASS: bitbake core-image-minimal
PASS: runqemu qemux86-64
PASS: systemd-analyze --man=false verify \
      /lib/systemd/system/NetworkManager.service

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 .../networkmanager/networkmanager_1.56.0.bb                  | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.56.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.56.0.bb
index f9fc9f3966..b04ad90738 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.56.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.56.0.bb
@@ -311,4 +311,9 @@ do_install:append() {
     if ${@bb.utils.contains('PACKAGECONFIG','dhcpcd','true','false',d)}; then
         install -Dm 0644 ${UNPACKDIR}/enable-dhcpcd.conf ${D}${nonarch_libdir}/NetworkManager/conf.d/enable-dhcpcd.conf
     fi
+
+    # Don't ship initrd specific services into rootfs to avoid the conflict with the main services
+    rm -f ${D}${systemd_system_unitdir}/NetworkManager-config-initrd.service
+    rm -f ${D}${systemd_system_unitdir}/NetworkManager-initrd.service
+    rm -f ${D}${systemd_system_unitdir}/NetworkManager-wait-online-initrd.service
 }
-- 
2.53.0


