Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45683FCA19A
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 05:07:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13756.1773205628697403904
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 22:07:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Qe8B3bf/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7530e974aa=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B2sui52674919
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 22:07:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=yvEiPNtVQ42zQuHRvXbRUVQU3ArRDHJZ72gbWNJVHtQ=; b=
	Qe8B3bf/ZHncujU3Nnja8/r0VNrC1ATXim8lk4YCydYYk9RIHbaJDRyWpweEwtcz
	9f/eMr2zEJH0ETKyWu/8k8OxCRqg10ltaMdlxnPQPuVwE3BglzvVvVBorC17DEt9
	tIG9HVcBvcWjgswoE6ixX6J9MjvA4Qr+sShVIVVGcS2pVb1Z7cBUFZLP8u0yEnqV
	jwhHNyBsw2ULZlJTDSEaYI5+jUHKsjfeUECzfiqKCRKY61aJ/WZO9oBKn6KSY8GC
	vErMw9ProobUmm1JIJsU9vCEKpJbXDhhw6hCVfq1/hbRFoPZUoYXbIYM2hcS1c/1
	G0ELydfayMYptvRvoiv6Ew==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011032.outbound.protection.outlook.com [52.101.62.32])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cty5304pp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 22:07:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BkQDob+BwH6zefBFbUyVEosjc9qf4SNOOsa2+n+YHnXMR2myyhiTX4+QPN7JX4WG7KUp96DCl7qlrI0ezusGJ6s4MLLVurE9rv10tPj2nqb7Rdrv0yxuojnCU3RlAyySo8dytGl8ACkygb3e1hDqN0L1CbvV0DSBaaRZKXZunXRaZS4KaPR4JpCcXNdzDZ/bZZfDycXM4ScctnS77x32bRJD6Ozt0WvYqcig8XpBYYJkHQPzqOZrHAM9iy6y0J+Ni7NQbQ4itMyehrtfqri46rDzYjuoTXz7X183/ObgimQiaMv5Kxrcz3g2uV/tUFDoinWKM3or91YEn7G4yDDDfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yvEiPNtVQ42zQuHRvXbRUVQU3ArRDHJZ72gbWNJVHtQ=;
 b=MKNsvG4uX1cnWYdg9VOYnFfxxMO1vfO9MDr35MN/xQfnSJAay+UiRR1v/qSQQQXhmOL/Q5rMmKRP5R7yFoG6cl0bKcPR7+2jcEVScBPTsnXyXKS7AMOYmf8z4gX20vvUTRe7F/7sBx2JJKpNIgDnj7x77azldrxceHc8OhFtm/RFpbzyZsdVdHW6MRzIix9CgwE67g+acXgz7DimYw7Ef4qyIflMF9UCH/3oZS7kuPVFU1bCCQDX8FqR+nQSQftXO3zL/fpC3690iMxpuGhOXRcJw+Kqlbrrk9dm1o4TRp+MUY40HOUZrPq3bZACRW/a4S3/stqR3q+T9z1FhKQS0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DM4PR11MB8226.namprd11.prod.outlook.com (2603:10b6:8:182::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.8; Wed, 11 Mar
 2026 05:07:05 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 05:07:05 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: f_l_k@t-online.de
Subject: [meta-xfce][PATCH 7/8] thunar: add x11 to REQUIRED_DISTRO_FEATURES
Date: Wed, 11 Mar 2026 13:05:55 +0800
Message-Id: <20260311050556.2079418-7-changqing.li@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 04a52bf1-2e29-4771-b912-08de7f2c09de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	zU9V8jVyblXQkmqsoh6cgtgscWbYpa0A0oPepDctFSVbqLWgXRpJh70pj6Wshg5FEUH3pSKrstZzC+eob8wdlVzzJ+/gdkbAMuKDFta8ycYuGny+lpYkGt8a93v0yAXrzwnQtR4cx+gzVQEbwXJ2p9A71jqaAGMBADDnrHji0kjtSu6be0yyyTKDmzXEDVwFcPbHxjgRFoCLYYHJeI9Kn+5e8uFfRIn/+NaHBdqmb2EMIjypInuB39h7uHnWCtBlMHktW6PEQcSeqtTEIZrsXLzyqEkYFOH7Z00Gi+J2F3AM412iuSdRYea8/6qIEbaS+G8i0R0CaHqTSkYKE1IUJDX1200GR2ZgtQChuDhwW9oBbqJlULb2aV77DprvD2IaZIbTFZvoyCYR/DQAxRHoTo5SQmTAClJ3z8WYDVrhejwFhGzStx5ud1NvemZDY5MMYcfH4p2l5KNCwhM+++AEidlBQ22nqO3QwFn/T/VSKhQ2dRBOuKMhHYn8Q/FXwjBUW7EwwHOR8tFOd8uuDRq95sBHB1SDh0qmaiSLo5jawtScHiA5Fdn9NGOgi4ovM87a6PIIr3JFnDTXNmk6eLQHXxXkI75Ss8KUtYodCU9/TMhXj34/AytB7q2Wt+lHXaTuHTMili+n8S0+mf37OmKD72tuEUYcnlmdks+QdAY8+a2So+BD53JLH7dMhYpxHTPuo6voYjfulW9KAS/ZziGtXrlBIMt4II+MedXHq7Hcr9th99KHuam9hq+cqEHa6iWvg18bMV95q1eVvKscIlLYYu+dK3d9XkGgkMkhwJ7StjA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?O83JFp8Qln4whNKNz2pbnT5SiGphkGsrVicTMayW44ukNJ+WS+4XeGtWf61I?=
 =?us-ascii?Q?vdfDDM37MuaNxmRNb4bj7PAPGQ+1LcjqSwbcyXUY85pV6xSDE8gWDpJZK66e?=
 =?us-ascii?Q?LpeImYVIzp2RAwZEQo4a/41HNCfGxuFyzIJuAdo0t1+nwpGO8Nv/tDX/LCea?=
 =?us-ascii?Q?ABCKPySJ5LP9dW2y0Vd52jGKJ6FcoZhBc25zHK9VDHXKB8amBZf8WxeA9E/x?=
 =?us-ascii?Q?3FtVRuykjw8fTSn81I972Dx4y9tKf4UZp22ZKf9A7ei2iwSkzPif5/xCiMbv?=
 =?us-ascii?Q?lrKl+BzBTwRDpkWtBEd69++7V93HmsvvBQuxGIq2F7vv0ngB0X7Sh66dh2Mf?=
 =?us-ascii?Q?H3XC+ohcKyYM3Xis/6kXwhjJ7++JNoekJqDAKU9qX4AVCgT5SKsIgDpr9PoH?=
 =?us-ascii?Q?mse6oXIr9TTQyAWRGl/DV2l1G5zYQe3byIGXqC9m91KafH3GMu38rgYIE+YS?=
 =?us-ascii?Q?Z+VjfAsKjmGSPDQR1rLKD7xgQ2QUjnIK9RmlxKizYY0jx0ayT6wiSPU5NpIm?=
 =?us-ascii?Q?Kx+8sEAX5e+TAzJH94EbJjKt22np/5UFF3E3E+Ppy/fmfpeX501ovfTSSOaB?=
 =?us-ascii?Q?tIVVcmoJabIDQKS3wqrrsDp4lajTR6lwDeejakwlXpcm43SQhnFD5v97hObt?=
 =?us-ascii?Q?NRBDmx7POhIWkRDdVKTZkSi8HJsFWAXlh4/rIFGNyD0sSNCdxJlXDIbNFUXM?=
 =?us-ascii?Q?tUrI5O2rGzr1cGy8U7WaaOTUvsg2+rFEetYOr7+dokha7VrB9o856qoo5iET?=
 =?us-ascii?Q?MgYo6mlCSoJp+NM8WRwhI3kqeHAywb9belwDfkt9rPM4ddKrWF89HyPs9Con?=
 =?us-ascii?Q?WR7qyESJKZnrjU7g7s8gJw+FcVuJU6YwNrcxgy6zX9nGAWPy6KZBa6ZKyqAw?=
 =?us-ascii?Q?A4Ccx90nEbEy8rpuCjzLc4guHLTKXDpEuCD95iqsGPfjx2FlOhTeNk8OvH2p?=
 =?us-ascii?Q?spdqUyUrdIYKky1JXf7trOeW9VZPHEIrl0gV/EpSorrbK3d+92rThIrsqrX9?=
 =?us-ascii?Q?tzIO5jY0R00e4rBsIM0SR88FfKpmuLTFhY4KXJ8FtaeVmCqr0aC3mkeDUEg/?=
 =?us-ascii?Q?AfvQAMoQoxWfEThCYD4CvhRm0yEDm7p8KgWoMhE+Bo85Vvo7kdDPsLZG/w6F?=
 =?us-ascii?Q?N07rQdhIZC1wMw1hxbk3q27QYlHnyAib/meS+YKKzYMJSPvkbXxy3g8TyKGE?=
 =?us-ascii?Q?Su4R9SOggQBSwGSQeD+JoZVsdlFvA3aUXX6VnY0EVm7bmfiEkMrPHwiXG/aD?=
 =?us-ascii?Q?5tzr+u4u4qd5874NnVdIleX9wuLYT9G7eR69zrFOF2Im9d2pxtv1fIdIxaae?=
 =?us-ascii?Q?lx51QSRCb4LOGTCqtVOJDcb4fW6ktQdwGB9qovxj+ZcdwSewP5DBFRBlG5vR?=
 =?us-ascii?Q?9xFPWl7EoLcIJwg6TtJgdVSYCkHwi9mnAlipbLHDPtn5J9H1KUYI9+H8x/W1?=
 =?us-ascii?Q?BuyVslCGuUoV/6uDk6lQKzfQKBV6cZqlHOGJYLhr4LU4e8tw1OK4VVKmggqR?=
 =?us-ascii?Q?aZJZNsAJwpIB7huiwz5BErS+DlG4i9n7pzRSgjGWx9YRSYCOwpAPiFIHnYPV?=
 =?us-ascii?Q?d86xlNwQ7dj4WrfDM22ZPciFii7Q6si+q7lq//Z6VeFEvkPNuWotmnFFkNiG?=
 =?us-ascii?Q?QWzFARVJ+rkwRIOif1H65PKkvXSszc7xz8A9NyVVpryi1siY9+S9hjTsYxAp?=
 =?us-ascii?Q?noWsVmavfOv0TM02QiS6Y+Vm43k3jGOy6pJ+/LrWW5xxMq7iFxVbmErVG1oA?=
 =?us-ascii?Q?7C7iQYep5i4b9oTUdLbVABWv3DuVLGI=3D?=
X-Exchange-RoutingPolicyChecked: 
	gPMF73r+W4cBod7zp7bqb2iwYS+fiN8K0paku++jY67If6TbQ7wak+Fp4BTxZeqCnVjp810kqb7WdJ1rc+28co1r0B/nPURFsU5Qj6hHz+TC0cjoanmfeacVxx+a+TWGIDBz3KhQhlB1IYd/TfXB0cmh1M1nAzvMBSkvB5Y942WuE0iHTWDDolanAp508uoNBD7jYnuaVb5V3EgOdyj0Wahrbp1jKViQC2jMDy94LvjxQ0ghISDatJbe+VOgdIC+iO88cLt2O+bF/LcRCD6eCx+AP0GWbWh0/A3dIHG3fv9SFxwXEuemjCGVBLyIl7Hx4uMkbjTs7JnEGy3wu8aQ5Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04a52bf1-2e29-4771-b912-08de7f2c09de
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 05:07:05.7093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ddzj30APOjJvpc1MjgMwzkI4FI7LfUjv8lLpkOXe8Q6slvufWPrwVfKNr+1aVUKO03dtZynkSu6K6T7a7tyvJ5+qj/4pYHq5iGGZXYAbf64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8226
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA0MSBTYWx0ZWRfX6IkYmwWC0F0p
 zKr+4FOFR6Z5Ts4yT3v+MPISwXeApQ6FO5M8NaLs2dyYtUvXFa0WZwGUZDrp+gLu7jFp6yqvMK9
 bj4ZfMxW3ilwydhJz853ZoXTiaavzIPA52zfbdZrkowDmNGoTl17Y10R0uuBLKgCiVGMU82blIt
 aCNPJbnvkpm+L0fwrGwXrYRGS1B7aTnPcIBBYljMTBztvmjyYF018izKyc8AHBkYIMQMw94yZde
 BodirBPfMIdDgE7ZcEXjaVeQlRxQRibM5WcUgH3degolvNBMN4d/+6OGj1ZcFBSMm8nV2Q26s9D
 eQfZT6n59h6ipPX+CjacpkkCRAQ6HijBN5SPvjFTC78dedzea8Z0iySxy45AocJztCW795v4rQB
 IT1pPMll04KJJ/FIVYwaf52SBz1rGZqWrA4cm1dtJ/eX2FnM/B4WfuXwhQGpgJFfakXagFX1qFU
 Kii0wC/4iu3u3UTUmhw==
X-Authority-Analysis: v=2.4 cv=PvWergM3 c=1 sm=1 tr=0 ts=69b0f87c cx=c_pps
 a=j/UUtXukZThXjipu8qKQYQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=0W6OHNsgfo2JVyLuOZYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: SdU0M17IyewwUOwp9GvdLHm7hS9VpPhV
X-Proofpoint-ORIG-GUID: OJtH0zTcR0B1BzSvbXjh66SW5aRaqGxL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110041
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 05:07:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125057

thunar depends on xfce4-panel, xfce4-panel requires x11

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-xfce/recipes-xfce/thunar/thunar_4.20.7.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_4.20.7.bb b/meta-xfce/recipes-xfce/thunar/thunar_4.20.7.bb
index a9b04de13e..a03804496b 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_4.20.7.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_4.20.7.bb
@@ -7,9 +7,7 @@ DEPENDS = "libxml-parser-perl-native exo gdk-pixbuf libxfce4ui libnotify xfce4-p
 
 inherit xfce gobject-introspection features_check mime-xdg perlnative gtk-doc
 
-# xfce4 depends on libwnck3, gtk+3 and libepoxy need to be built with x11 PACKAGECONFIG.
-# cairo would at least needed to be built with xlib.
-ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI[sha256sum] = "e0dfbb732c3d7c9174d1c0216dd6177f1d4e9297e623dbced32efd3f3e8682e5"
 
-- 
2.34.1


