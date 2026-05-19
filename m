Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EC60CD4F5B
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 14:01:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22282.1779199250787751687
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 07:00:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HV84yv4d;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9599199609=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9HbTE3494229
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 07:00:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=Kp9aXS4Md+N4GTZPQFj3
	tTPlsizP3HipzVmKbY+srLo=; b=HV84yv4dB5/ECgbmmcG3a38GMev4m7TPKZDg
	YSocwjbYTfiUK9jb0Ap9F8DEcWQcRKyUFMMxvw+sVlx0nfBP5V2Roq4JKCVZoLem
	5h6v5DjoCJzn9aLd6YUCgWYD4fdKPEgtee18bDqvZWwHI2x+ixkyKs9yhvTX4T5x
	HQQD1u7XSdjs+me029MAlkNmMbWjJvRPh5GSEVZSbo5mnm+yA/f233N0c1o/C7Mq
	ox9UqiP1GYlZiYNAPsKUcP2LzHJ3fP+1UrFsB1D3ro1yKL+EM8Lav65AKg1rClsD
	SzEy3b5N4n574vHa9QQAaPwRbuuysPL6EWLgKID6XlafVNilpQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010024.outbound.protection.outlook.com [40.93.198.24])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6kux3mjd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 07:00:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U2Vgbp9112e22bmfV7dvrNad8DB7e7OLOqjDa1ByPAyLQwvrIcK29esGURD1h7V396dz0FGyWtOAvamtkPSjLyEGVXcuh7kaUoWnoAGmKs+L2Yb53r3h0YOoIqrQ1RPVpMnfOGtisd/aSVekfrEQzV25ziT9zoNZKNuVVC89hCeIGB9QaREJoJlRDkEliUpHxYTRPEZch16GO+8x1RotGtbHwGGwFDTEN6SLsFHlL/kvTMyYqWrS5+K/v1Z+u/pA/R8lFaqER7ukWYb4HMXO7GlRkg58vfvTYCfBelGg6BluVa8RvM726upuj2uq+49muH1zgfvK883IbA5Vv2ey/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kp9aXS4Md+N4GTZPQFj3tTPlsizP3HipzVmKbY+srLo=;
 b=MSBwSGu2a5+n4DDMtsXphWw4234mBiTaWjyDfyftVFW9lRAxmbRJvwFWBufB3Wck8qA/wkHdHEdYZu7cy8gb0LqDyzhkIhuu9TZ9KtxPDqscOZJefCZBvMpg2SUi9VnjkXk5600EpnL7JgwpstR+ARuS9tnkkM4uqeRyhU0TpzDKrCZTtAUnFs5drZOgiwGDa9PVNWad7WK8rWhSPEYCOANSuGeyUPSM4YuENTh3G2z9PY45shlH2jKnoB8HCtUm+khQT42spN4Lo/j3jkFpOPSkTjIRucr6T5NqPSXEzQvXfmrRmBfQklmBPfonHboojQVDNvNWSqOWBXy0CPL0TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 BN9PR11MB5274.namprd11.prod.outlook.com (2603:10b6:408:133::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.25; Tue, 19 May
 2026 14:00:45 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%4]) with mapi id 15.21.0025.020; Tue, 19 May 2026
 14:00:45 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] jemalloc: fix version string
Date: Tue, 19 May 2026 22:00:29 +0800
Message-Id: <20260519140029.129962-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0172.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ca::17) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|BN9PR11MB5274:EE_
X-MS-Office365-Filtering-Correlation-Id: a048a9ac-2e82-4c5f-5aeb-08deb5af05b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|56012099003|18002099003|3023799003|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info: 
	ta/P8Abb4m7T1NveIDIp+zU3IO9XbEyVAv7JaN4l6IEtJ4xDS8fvRuo+7clYQqtajX51dLpD132OKMvkggKpc6yL/jBSHhTQdzT1nHfOkjeKp2g99+KMZ/rmaR7BCSWvspLAFwXYnItOmPs41XhmZ0+SsFckPNSqCyb6QLhYIzz9R6FcsAoLhhg3cdieQpzFiwMWxZcveqinMTPUIwidmp9oXLr+ZuxTOd1f5LLhNa9FSym3rf98w5xow77wMqCPqpOOoUrvjc4QxUXNfvOahtWM+65Arm9zEbiosssuAsHuj+zbAKVudYDJwyouxrXsg/YKdZZNWFiGZ+BMVb4F/ltzul7n2O4PwUh/2xyCtlWgr1KQpcAfRr+vpuf+/d/3dLgU/nLvM77Pj0gy3BL1zE7IdrHEU3eI2BMedmOT+4TQacoSPSNd4xbSyvR854PE913nxXmdV1PDiVx28TW4GlTmpc7AsKD1/QuZz/t/PMnuZ20/bozzFtaIhEbb6id/eDRhhZefN09HoPIsWGlxA8DOeoG5zR4QisIPcZCyRiuahMwXQfBgg8n83oATZ60Dit0MJQ3nrSau++SBZ7RpCaOpkt90QGho0PNCxnxtHEMQ81bURZm+oQMxnbTdMsbLx4nbY0qvoyAPcK2BLis2vjUc9mLEaaiQmt6R/RYp8fXtbrdQya5e1Vu7KfCjorFpWcVxHY6ndxg9+NXevGR7GvOeonIc861OdSkF1F/B58DtnAAqqP20Oede8YluOI4W
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(56012099003)(18002099003)(3023799003)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qez6ibT8IisVUEf0l8lPXeyLWMfZCJyUTLk27xGmqMVaJBdKKdY5OkUxgsyl?=
 =?us-ascii?Q?mcajkNhh1R7dcgZu0QyUoxYlsmRFIyf9bigH/NCyBJNn567s3+lmL1FKu3Xt?=
 =?us-ascii?Q?qb/5o3YEUscz9hT/FquBHWX6nnYUebXxkdv8QlqMdgLd8GVhQsa54d/jKZrI?=
 =?us-ascii?Q?ncSHtNZW2h46RxX96ZdwQMIPiIwWMgI+E4MJEKL9l/YRajLY5ssKe+wgmMQD?=
 =?us-ascii?Q?LuBlI4Dc/odSkhLmHL+uU9Uf7Ba1Iqe3SWJu4MXM6qFY3CtIy00IXdd3ATjN?=
 =?us-ascii?Q?WRskPrp/K7vf+OmyibT9xI97rsjxwjmUigCzErcoNGkJcAmSDevfDcEstOa1?=
 =?us-ascii?Q?UeB52QIIpg//8h4P6b3uxvVjGGs/im1uoMB+miUVfNQZKFVa49kbI0ZP07/7?=
 =?us-ascii?Q?ko5FdK0viUJAutIt6Qmsye2/Lrs0z88XjX6q8j2lpHP0df2C62nTRAf1nrcK?=
 =?us-ascii?Q?rToyMSyHkYd4COrZcEG7alpwnftUe8PiWXe88SrtJpHsMsN3R5NvtnSitLHk?=
 =?us-ascii?Q?aUmcjEkBvznIIw6Zw1WOfRah4KuOGcjNVmf7n9S+vA+8Sd5BgTsb1LMMryZg?=
 =?us-ascii?Q?7ye6ACWBmM8LeP/FCeM1lgVkJ4m1KrCVmfwM0XBBjKGYGMn04ZVXS4S9CKFb?=
 =?us-ascii?Q?ZRPSs/DFIaJiPFW087BjQRFDMMzmlEgN6HUVZJhnhYgMMs7Wm8vDTGa74GU/?=
 =?us-ascii?Q?tbZGrEyK16YgDDKGn6O2vzDOwC8wOgfwlFq2c9usC82zccSgijbU29NPzygt?=
 =?us-ascii?Q?XF7FszY7eKR73PJWnCOj+S+A4FmuOOZEsLeTB+uomDxtPT1Otpu74+e3BcE3?=
 =?us-ascii?Q?r26IdAyQ30dXurGzzNNSQYP75Zt+/5JwxxE3C2Xewo72ijnyD250C7fCz7RG?=
 =?us-ascii?Q?/Zsdpwo/my2fOiKFnL3EHcbjFJA64bryv5Wsl9bBS1bpIICUdt6hko3ykDUO?=
 =?us-ascii?Q?T2i5/ewIE+7z3Tn4o9RCTosSTQQCQiPM76hyYZyk8w6cmgCrxj3EHICZgQS/?=
 =?us-ascii?Q?gAjL8CkykaaoJRP3qeEYs94m+DN4RJa4Rr5Uh9zoLGitX8ZXxIzO1z97J6h2?=
 =?us-ascii?Q?sWjRqJ1Bp5Y21nloKz2gd/rBr96pzL4VZmSvRmRa7CYSA3CjT/59MQf928Wi?=
 =?us-ascii?Q?IjqxvOCX3EVWK3Vouk3JGcHd8htTZpE1zx1qHlI3/KgptoIdVB8O11JNCVkd?=
 =?us-ascii?Q?Aa/JFhYToG+/ucRu3+E4qFEl6nWIyF0htO/ftDGJOMTAZyNIDGhBtg/zTSwr?=
 =?us-ascii?Q?IW3VMH0aIJx+gCsOVcKU77az5to6nfxBaR7o4Ulr9+eu0MQFlxehbeOLbPe0?=
 =?us-ascii?Q?HIqDSLLtwDnXjQnyFY7Pr1kf58qKF+795i+REsDzP3n3xWDH2gqH7/bLW7Dr?=
 =?us-ascii?Q?mQhLReRDspDBaPHrv5Pyv0DUzq5H+txzw4zup0LsAaE9EyK3GtLfRQ2JSPjT?=
 =?us-ascii?Q?cyGbKkic4gOrYcydtXnKKJ8uFIIHWv+9FjD03pezZ43dh7AO4HZPkipV/B4k?=
 =?us-ascii?Q?oX3fPwg+ctQCTb84LHlSaV3ch6cyqjsoLvXmzhamWfyKhe2ytiU7YKrnIJSQ?=
 =?us-ascii?Q?EOGfK7RBdtPB8CwU3GDkfSSLEnJuEDVdmQb2Hv+Dvkmg35ys/pcBfPQ9d4yc?=
 =?us-ascii?Q?BOFa43+sCicn38mS0YloL3aDYq9vnJX87724budihu/97hjSnSZYP52xt4CM?=
 =?us-ascii?Q?7c3A5BxgziZi337MqkgnxsaXtOJ+c45o82xy28b4psDYd/4pzf7RFyhMblty?=
 =?us-ascii?Q?boDgJdk7tA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	nR9y51a1Y8L9LDRYmkSS7d69B8symTVxI4MxLX2t7MJJ3KlihfYGhvytzYJhLoQaA4T0x16I/j9fd3EwYyUs09YTjA92OgWFMbf3jhE/aHY2tSt0DKetXJVfdUlWQdfRSbktf2tmT8+RrAk4DP6+3ksA+Gz+AA8lMfsWUhqdDT7zhMIwlGrSPInFs+u42FBDc9XlMzyajsHZcAWB05RfrzPdrLXead9QsXkjNih52ls0abWwLVox6po89jyvvxBPjC5/jUZygoWDoJP8aTDu21zBL3/KH4Vep03XWpz3ii2leh+vyk09l1njMW0CvlrCJb0FsYwZ99vNcHCmBzSvSw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a048a9ac-2e82-4c5f-5aeb-08deb5af05b9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 14:00:45.6410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ojxfxzu8RzhXZqNHntbYBBRw/7kF9hrju+bD/vIccYTDrE1RySKoprioCizhCvqDmONQzdidk2gmAM/lrTiDNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5274
X-Proofpoint-GUID: Op0REtHfn4hZoej-e_d7IiB30WstNUnn
X-Proofpoint-ORIG-GUID: Op0REtHfn4hZoej-e_d7IiB30WstNUnn
X-Authority-Analysis: v=2.4 cv=NMblPU6g c=1 sm=1 tr=0 ts=6a0c6d11 cx=c_pps
 a=V/jExjqSSumuV0DCu/2ZVg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=Q1dB3ThKr0GqZ_BV9LYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzOSBTYWx0ZWRfX7GXSKBrre/R6
 JPqq+/Wt9oXfb86Iyk8zohEN3ciRaQzwfDe0LRu0Zo1Xrv8uQl0DkpOGgOyDPo3cqLK865EfVGj
 iol9XxG8GtMEQqFSWF9tqdjKs8pBYuATtK5gSoenKP5OmBcjQ6Ky7eaeYAb4UP/A/rbM3iLz0Gd
 YQG2g2vnuYP3KTBL5lAEydZ5HmECO1QNxHD+LwLi2rxvCZtAVMiCEMqUs64YyeLfEt3r8Me48NE
 Uojk770PHJOTIHMYlwYomjdE3vbTOp6MxiInyFPDRe4Avr2oGb7ulAlMQ/GIrmWl9E+w4MosQcx
 UR/f82O9iZO+ZW5dY37r1+sNBnFHVuUZ28BRjJMubI7GrkYxyexf/MgDFFZc0LnU6iXdfyCkWTH
 9QgsPDqot4KbyV19gbQbSrsutpWv9Lxc9VvIpz5du+PFtwx/zSjVamSPgobRBEpkX5+gUtUJdsy
 bXNBSCMFF4XsaDs/8cg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190139
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 14:01:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127102

Referring to the VERSION file within the released source tarball, the
version string for --with-version option should be ${PV}-0-g${SRCREV}.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.1.bb b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.1.bb
index a369650ec5..261ff02e16 100644
--- a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.1.bb
+++ b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.1.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/jemalloc/jemalloc.git;branch=master;protocol=https;t
            file://run-ptest \
            "
 SRCREV = "81034ce1f1373e37dc865038e1bc8eeecf559ce8"
-PV_LONG := "${PV}-171-g${SRCREV}"
+PV_LONG := "${PV}-0-g${SRCREV}"
 
 inherit autotools ptest
 
-- 
2.34.1


