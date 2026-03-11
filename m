Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0E67FD88FA
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 05:07:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13753.1773205623666354408
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 22:07:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=S5SulXeS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7530e974aa=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B3lOUd2674556
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 05:07:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=jI0CU+lfgipzGjpn1QoESUrvI+b47pH16hWACTP0jlw=; b=
	S5SulXeSkrP9pGX03VqoG6SrmS3FzZI87yx+Vpx8aiZ0W/M/8gWmT9PvpqJDHvMN
	dZJUOb13jj640W8ymJfEDffsjapd4CYHLdFIWz3094yQHEH5xR7OfpaZgxjGsGQV
	b0IZRKCtmmb4jEPAnfXuyM5WD032vMJtDTdKdT290U0ihXc4EI55WL1K9rWY/7R4
	bvoUO/jM1z+H5nOCTcr+/XJ9ZDw0ljy35AHZw/8c2VJ5rv3JoYlLiIHq+NsJsN9m
	7Z4ACFtyNDkX9LOt5Cnbe7/CJkGKMv7QpQu+nQslFCgT+KyiSyxTVUJDJC8Ylb25
	b129EyUAJcc88CTxQzeWIQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010035.outbound.protection.outlook.com [40.93.198.35])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cty22r4tg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Mar 2026 05:07:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gs58Kq3fUDyaidv4qSc3Zt5sw/PLc2ETbfTtIYcVQrgcATcyg2yLEXB3+fEevgCivE1F6ZkEWERCEIZCO/DdU+Yc4luMQh/BZ8Ki4zdcOrhBpjHe3raNy0phyy4zESRWOlYCeKHwMrx9P46h+FSAEqLwRTurimHuLEnqKxoQBrDczduXBcstcWJUryV54mLo6y5giLnoW8rGPdeHxHYNAApAK0gWLXfFfq/jPPEqr9SnO2pzLwly1Z7dQKdky+vVXMoNLnyqWunXXlIqzYE/KQPGL0mDu1N46JWdmoCiKlDcYIsBPDkcEPglVJC+ZpB2crwylkvfoHXcPQszIOS2AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jI0CU+lfgipzGjpn1QoESUrvI+b47pH16hWACTP0jlw=;
 b=B6SSzxOeodqRZYJNDQXjtcKwtDeLx84SasoHM2Ik9ksrF1qxu6a4VDyp7ylKmGQvbu5ZytXt3EuhzOEDQKneI4RqCdY7x9sMDNiZtJh/DNKHtFEmuoYv5MUdeGSWKpD+K3BTykiCn2HkPTOR5ZgfNd9IrecKpEJuF0osxvga4GdE/Rifb4L4e+eyqcRiTAtylqLzlCJ1DPxugy5u1reCH+d+wAobW9K+JEFlFwWgEpPBgX0j9QdVPFK6DMtWJykfXgJtOKRtCqC3OjYVBn6ybYsX0zjJRfb4cwd6/hoyjoku4e+lhYIY4BdZom5fhSTQoWt6aqgkwZmaOl+5GKBvqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DM4PR11MB8226.namprd11.prod.outlook.com (2603:10b6:8:182::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.8; Wed, 11 Mar
 2026 05:06:59 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 05:06:59 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: f_l_k@t-online.de
Subject: [meta-xfce][PATCH 3/8] xfce4-pulseaudio-plugin: require x11 distro feature
Date: Wed, 11 Mar 2026 13:05:51 +0800
Message-Id: <20260311050556.2079418-3-changqing.li@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: eb6fa17b-fd35-441b-c4b6-08de7f2c0612
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	F2u4E3Q7sr0g2+I7hy38ERN/tcz1WDmDhWxbMZhzHMuuD65KAJU3ZFaqCLFE2NWiFt4aH5KGYeBHfQyyZnwXii4+QqkXIwDCDzt6sc1J4iKdm9KYbSbxoQRPJM2JRIfJejakIh+4jTnTj045AKzZyPCg17Un8QNhn4H82x/TXjdt0mD9ITYNsZbrTSMAvsGlAP7YBWAwb2hq1yNDZD4CQwASYmC5vbEgS4TY1E6g8z6Y3zmvPNrMOWlMkKULCPG8E3ak8xh42b/byeG7zz1XOoVi2xqL4ZM7Pqxb8ZkiEDY13GvaiAZ9dCRYLTuBq7XPCNi3N0D+uKHgKWrtIHQR95iMzM9LWBbJsK9MnTOKZXAOP7o/lMYH1Gtwf19E5HnacJfa5l9MDpotJE/bivf40M0FdKGhDiK+nsjU+CTLFf5bbKyeS8oXwBNONx5C/Sfxaxj6Ty8othZpbz2M/r9KKXwMfHBXYVPb87+kswLJaed1F0SPH4WlLlOjSCPSnB1Ph/T0C1kWFOVb/uvGh5wypSumq+Jq+hYSsqnkcvr9VOrasu4C3UBEPXUBB+c7WLtVLdwZNTzE9ucj2wbnpX4H3SJNKVbv3NstWOHAoNcjQeJEbAYEb2rV2ho13JyX4hd4Ey6Hiot8JCyTg+H2NBfaELUByNj3sSJEvEXyDXiUpGHGEyZiouBRAQ7HMh/9TqRHiv1BBuqGrjab/doWaigN9K2pptXzNlmfDSOhZ095mbLqvDTAEWtJFUjAcyZzgqE8nDcnGz6cwWdvoF3KsL5Qm+KJqoBrXWD5yQckXNk7O88=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0Pg0h30n9/tJ9AmJyWCVbzFbNIEP1JiFprNmZPkWVLMAAMmTlkqtc8HB+4Vz?=
 =?us-ascii?Q?D7uRLJtfeKS6B76wK0w8+MkBKU3xmCl5UELb4IQXAKmzLEKO2Bp162lXnoYq?=
 =?us-ascii?Q?OF3JTqzsBRQEL05yZm1JlMH7OZo5H3R0PVr0XwdclKS7QHpSSlA7QfykO+vl?=
 =?us-ascii?Q?hEbtn7HI4t+2jIQdT7CeE8y/ur1GtF2fUucA4y8B4kAvZ/aoYBjco/MKoNnf?=
 =?us-ascii?Q?BZmEUn5EIhRkCeQis0FjXJ45eQSy1D45PmaJKC5ShgRvdsFcFfwVUacj7E/9?=
 =?us-ascii?Q?azmDUeBc2fNJ6af+3EfUIk73cLMc4wkVoli8Z0IWeQLkGmUZ4uaJ8xXyaRaz?=
 =?us-ascii?Q?qZp/9Nl2ipP/83Umb8IsDc6D8fzZzSPECgzcFFsj68OyMxgLK/T466y7tpFJ?=
 =?us-ascii?Q?mW4Od6lNJd7+DYsqEkCR2YZozbZSN+Qz8fnpw1qPr1mNUIYQs33khhJLfIz6?=
 =?us-ascii?Q?4WHU9cMIX5+yctdAHrI2FtDwN0DQBHff9FfMmfWdPbLpK3fEFIEjpxqLIUCT?=
 =?us-ascii?Q?tx4nS9lB6R7nm2HP1fabImfkO/IWShip2Nh4aSYiFDGPhP9V/av5ptrQpcqa?=
 =?us-ascii?Q?Q5kqWnf3cYhBUsCLqiub5ai3RsRv9QfDx9NUB6Sr44bxU/UKbvI9HMoSNZ5s?=
 =?us-ascii?Q?gKvSCtawg5U+gcrKg6SOhRbbuetExickkZz9KVIVg2T/7K1xw82rOQGwjNqK?=
 =?us-ascii?Q?7CInhR3XrH2hfv7VELUFHHdPv2In7i7nhDAkVNX3h2BrZqeyZRgcj8fyK3BQ?=
 =?us-ascii?Q?d5GkDBcblnHrZTtvIG28Sa8/7YbUNJbk4cqXKBtR4O9bhsl+h1mIpcP5p+St?=
 =?us-ascii?Q?Gz0SfbF//1rj4X7++9yiOfy5uDZF1XMBT/VqFfspPlN03agQuuDjNyn9Ti2R?=
 =?us-ascii?Q?JIXozGI1KiCB4WRNFDaFAPgr710rsK/YPOEWG+H4AmOVvI2WnMtBbP+e/wvL?=
 =?us-ascii?Q?QRaMGJNLvZnL/iMQpIVYG06U7+qx5FMnXUDd+KQNy/ut9ModpVLxUA7ZflrL?=
 =?us-ascii?Q?Eu+ReuWqVxMJmYo8Zxiu6DvpdT3sDSsoBdY78s2mAzq9/0STlMwvaQ/7H1jt?=
 =?us-ascii?Q?0w6uBf11w1RLZZ36l5gxP+pobgv65E5ATJaZyQFvCzOjysaccAma4+GPFTqe?=
 =?us-ascii?Q?ufswebRrSp+hh4S3gozZy7wn9bOyqe64rA7uZOX2l7LiarmH30/+xIMkl6UP?=
 =?us-ascii?Q?yEmVViZHc2/uyVIy/vDLIDI8PdiOK3WHM23TR2j4E/i/Vukdztd1mF4d2A9S?=
 =?us-ascii?Q?V+ZomJM8Wz33nb8j/rtJUtj+BjrNNP9DXRfxW5+BIqwaERHXd1SVwONVAT12?=
 =?us-ascii?Q?4Il9uPch3xWSKmoF1tfJ6ClhnkZ2L0NK6Kb25R71ISOdy8A4eI9v/7H7KrFO?=
 =?us-ascii?Q?PCM9LoAKv3y8DG7MQFyYXD5r+YbxV4YjY/2kvdJF9xvjkh6mOR+LyLKcFZCU?=
 =?us-ascii?Q?2uDhOvK0z9BUoDcxaLk977uYfL+o6YDjJWyxaWFftHGwXXdMu74kcNd0YQ3K?=
 =?us-ascii?Q?mP839CROI9Z8xyrs9pjViWY5V7V8nY2NhpX2J9O/hdR1B6Asf7m/O0TSADEt?=
 =?us-ascii?Q?zTW5Me4HI641/lDbefuzceKly519ML0ZjRBDvS0lhkqm1jUvdk315hrB36bf?=
 =?us-ascii?Q?H36WxzrI65BMUQIK5+lQqZBGr0DRHCf2swNtWggnmUwPZzY4y1JaQZkazPZr?=
 =?us-ascii?Q?fcXC39f0gJz4rfzGyv5uM43nlBZrJB5xERtsW0gqu9GcAGM5Llsv8CafxtOg?=
 =?us-ascii?Q?kDm2zuNnWgAvieaQp2MJ1gJoHzMsv2M=3D?=
X-Exchange-RoutingPolicyChecked: 
	ZFMsJtMaXCMBlB3S851jbXQFX5F3zlm/34KQ4q7QVM4Qh4E6ZfjZPerYY+imdBN1XU7h1/KOINS6dtry31lUhX90tzlPF2xKEGVm54sFoi7gUh84QrnYvbfo1dmtmecABLfBALFQQYhHD+JbjWeLwLzp/XibboAPBY9RvCRt4sjuGMoYCG0GtzyxHNp/TB6dfuvvUxoRp2gJBj4ff/JEBELv7l8CiF36lSFNhOeHQazu2lkJm3veESdz/hP1hsKKvWVDWMJB3aKpMrliFqVqubYnymM1TqPc9NPX+jkbjXckg095CnCcn6wMeaM8pcx9p/GxHmDpJJUFRQNo41Qxqw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb6fa17b-fd35-441b-c4b6-08de7f2c0612
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 05:06:59.3115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xWHpsOmMXHH2mWJX9FxwSqLHg1ZQfNB6qxPy8ENCUKvIyzLH49Jtl02hYFqrOAkJnKBjEtS5JgH7XmykkEjiz4k3FbLACgtJXKNY7u0G3+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8226
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=LqOfC3dc c=1 sm=1 tr=0 ts=69b0f876 cx=c_pps
 a=WVTIIPXEjO/6WBYygohQVQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=s--Z1-01E1JoBneAJaoA:9 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: imy4fK_pT01MTRcN03-NUsNzXo59awu8
X-Proofpoint-GUID: OJdg8xWUC-4lh1tbJD_25iey4Hx_cAvh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA0MSBTYWx0ZWRfX6Ej5294SdNAt
 GtaK0lcGgXwLiIr3e+fuqbMmGJe5+Y8tYuOO1sFo7/jzAvEALHbuFp+bbtaupjM1gqImH/0Iyx6
 q5+KeJTCzevfeUJhkQR5RLK50G78cZa8Ujqdix2ioW8gdSg3EqGUL9MrTBMwjO8NWWBuMej1pxv
 ip/q99Hp3yjvVrvK6ejui9iYxo4E/wZwLH3sK3Icz5fipP90Jat8AC5dTgPGyW4MabNRfhISu4U
 0dFo+p/Jj2ZtqF2nxGnUiYblWdnY5RIP8SiHLlOF+Yl4Ka7MjFC4eZtmT1LQQ9LsG+LqtspXOLH
 T/8QtXJvcOhrBP044M1IglPia3PemRHh1zLOyHRo4fkoz/SpAAmEoN/5fZ5QytXC+fFV6vy3PXN
 O2NyM4clsMxb2TCMUThDxvFdAHN2BB7E7NsVfy9bgLMr5y3wSSn1S14vF4ij2EmDY6vkGNFiSpw
 tUOxDb0uJJ/9sVOQ8tg==
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125053

When DISTRO_FEATURES contains pulseaudio, but not x11, world build will
report error:
pavucontrol was skipped: using DISTRO 'poky', which is missing required DISTRO_FEATURES: 'x11'
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'xfce4-pulseaudio-plugin', 'pavucontrol']

Refer [1], conditionally add x11 to REQUIRED_DISTRO_FEATURES

[1] https://git.openembedded.org/meta-openembedded/commit/?id=3a57e5274540a2b4b6d6a1d9808d0c9783f250a7

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../pulseaudio/xfce4-pulseaudio-plugin_0.5.1.bb                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.5.1.bb b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.5.1.bb
index 2fa76351a4..4f823c67b5 100644
--- a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.5.1.bb
+++ b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.5.1.bb
@@ -7,7 +7,7 @@ XFCE_COMPRESS_TYPE = "xz"
 
 inherit xfce-panel-plugin features_check
 
-REQUIRED_DISTRO_FEATURES = "pulseaudio"
+REQUIRED_DISTRO_FEATURES = "pulseaudio ${@bb.utils.contains_any('DISTRO_FEATURES', 'opengl vulkan', 'x11', '', d)}"
 
 DEPENDS += "dbus-glib pulseaudio"
 
-- 
2.34.1


