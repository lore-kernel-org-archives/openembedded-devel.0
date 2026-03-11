Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEDD5FD0656
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 08:23:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15779.1773217399866477572
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Mar 2026 01:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FhqzEJWZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7530e974aa=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B4pLpV2782713
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 08:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=xgEUu5mQI
	mjuQMep26Ic9BiuXcE3GedrSOVPKiDqeiY=; b=FhqzEJWZsNDr0gc4yPWaTBi65
	jzKEd8tSqYDHibrt4wN3LGztHkFpnLs6S4US8ZalvC1n5ihzEmhndwtpLK0pQ1R9
	PsHp++fGxX5nwopDV8wvKqPhorQlO+RQsQjzy3RNEko+PmVAfzrHMgss7jwZYGhp
	nnv0SdRn2kOrqWe0BTpzzELy1By1n8svCsKQ4iojsHEFe23GyKKBWC9TWu1VTPiS
	iToG821CZFNrZae0Ck3hGoIvCtIVzWErDMmq8CfRzR/hXxiG3ofAYjfyIGFTApzg
	/yYJ4rX5zVdRy8403VGVnAKDfaQAm30zR0Sy2rOEoOdA3tPi4YHksB+aOzvtQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012015.outbound.protection.outlook.com [40.93.195.15])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cty22racx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Mar 2026 08:23:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NZfMFC7ZBR280Zs6Gg5Bcoji6kJN0Y4qnyv+QgMPwYwbhmEhVknnDl2JShW7CsMfw+E0qucSD2bRaK+NmrUVV5m/EYc1xpzadxGbF7SqwOq9yyFm/5W6ImykKyYDecvViGNL7zVfHRKTgwiCqY7ExbdaGEyMWN9QpgA8FXlWL7HddBVjrTC9LbaJeWYw8xnIqlK16uHPjgjpJUxuXxodkNzbXHoSUXb2j+5e3kyevh5F0BGOTX56l4mtWuPL4XCwR49QqjaRmHzWBLVC/pq9IDcfN2U6G0JimZmYqx8h5M35hABzBcRpXfvsPiQ1E0SN5CvtzIeLIDbgM5AJ0G0LJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xgEUu5mQImjuQMep26Ic9BiuXcE3GedrSOVPKiDqeiY=;
 b=AMBRGUXYq+ihEfz/2BYd1i1MgbF0tbBuRgdvtit5eHwDJRs1i9tVtYu31m8KsJhX1sxuyw/06DQswLR7yXF4XkiacFp7zGNan5geT28Z6p3XVQoka90zBol7fl80M0oXBjgsSpNHB/3HbnheorputZdiBg49iS4eV1SyotiYsxQSU63cZBdbZe0eSc8+VNvBs3OCyDFY35ZbNUaoY4p4i2FCH8oyvH8hoPWJjtaO0PB6u1z95BqaTmsJ/TpJvYDyuCp6LvZ7+f4DFkQ6QKGpPkFD4ivO8mmMI4tV2RQDpCbZnrrFWjltKRVVqeY50g04fI2HKqvQnrXcjgxdsXxoiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DS0PR11MB7802.namprd11.prod.outlook.com (2603:10b6:8:de::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 08:23:15 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 08:23:15 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: f_l_k@t-online.de
Subject: [meta-oe][PATCH] gtkmm4: add x11 back to REQUIRED_DISTRO_FEATURES
Date: Wed, 11 Mar 2026 16:22:33 +0800
Message-Id: <20260311082233.690272-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0030.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::15) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DS0PR11MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: 4380580b-38d4-4f27-43bf-08de7f47714d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	6WEhM79RAMIS5dwcpL5vIJXwC1FnrmH/QK+BcYpN9mlcvl8u1DbF0zqIAXskX8ANTrLZrtbZtdCz266Xfcw4uBHHdvKpQcQY8T5g/536/9yjxWlWfCBCtTWz80X5mrVHf9YyuKRAQ1iXim0eaj0m0V9r5rowylItVZZhdpnuCt83sTXW6qQYAnZWOZyG4FtH2gWkKPXJ2tbgiwUIF7gWHxDjarpgSkQY5QTqv2Mae94ui2zxLloa4+r7git84JA2DdL7oypM4Kqc26aBcZ93rc0cEOr2VuNsNpR9CcapDE4UtkSyBQBYJvgtp/HyKf10XujZEW1LGRQ7Zloqo2P06BHuYs4q+dZxbZx9ui1NyvgNPAaenasYEWv01oB6bHOMU6Ah0R0pEP1YcrWIdcdzinJwdSBEy6dkPH3pXXNBBPgzNCrS0mwriwWQdpPTZgLvfUu8ETooHOJ19XNmnvTGu1D2grrhY+HRnqJjwgHpc1LROdUbKz976RZsAczJtalktr6xyMrtaFKAnQYAktR2SDAwW0hcTbj3himZAQLAXLNrRD+bNZSZzmJP/ZIN6EMXBju8DPPqf3yzmhqGdM6vXfqLeZS3yZ+QFAZx0EPrb6DVYCMdu9omaZx3Es4N5C1qpRUmp2zBY/Jg6gZB8P+2LsQLS3r+bo9Thr/s0/fxbYRy5Jy8Vu5na6XPjzHkXkR3mfyWKJXmJMDnLUI+h9ZtAV2Ej+z5cyA/8pyTWoQV51x6ZvBvto8FCmxsHt6zpZQwrjAik4JmdxZ7oGFQUv2UgMM6d/g9AWKzo5D5jdArX+g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4Ynx94cbWxKoZ7J+S9lJvRKSLx/3OE/cIu6NDLgc//l5sJLkIpl7CaZZi+bz?=
 =?us-ascii?Q?Vpn+g2A5XADGCrWxOLXkxQ9nTCuOTFXU7gFzeQWCD5FjrJeZd9VzY1Z+GGlf?=
 =?us-ascii?Q?gDiwXmxiL5BDhSpVyN0Nk1RgAp6aL+XcaaL/lkaI8nhcvLQhk7y8GDUtglbj?=
 =?us-ascii?Q?0PRt+/Xghrd2hCZ8hE5ppKCteGtOiisgwIvBhRWYVpW/5DEkMRZck7AFyhd5?=
 =?us-ascii?Q?HVXvoKQSv1+ZtM99FwpjiWH+lJJahURw9aKzOs8SHqo+nPNsJljPpW80c9c1?=
 =?us-ascii?Q?Jfor7Lx1dY9CgPCpaDUSb5oq27rxPmsGyYIQ29aDBaMdTN8iX/pH3fxhegP7?=
 =?us-ascii?Q?QupFl3C41MzJaoH0vJ6YeCrGDS79wyS6d1XaKtLoejQ4Hh8wSHFhLdWRsy/n?=
 =?us-ascii?Q?cQxpOKGY+nyve8J+l6DjSaH948nYV0kueN+Ol9Lek0KkXQq5ES8roTCJvfgQ?=
 =?us-ascii?Q?jSnMYD3WkSvXtiv4nHCutI97jCtMXuy4Fs8RTucNTMG852RD+Y93A+Uiqd35?=
 =?us-ascii?Q?z7NTSLdTnkC4HSyoueGoZSkV069MuD5LlEKrQKpyS/cuyrCUmr4fUGffxAH6?=
 =?us-ascii?Q?wXJzr2xvOQTxIxkHNVvsle5ZmFYSLtu1oExHBUrscMzZfGe5xk8JgpFnCV9Z?=
 =?us-ascii?Q?TvAI6SZEDWoUE5ivvA4uzGefDAU0oLoR//XzJsa8GlfLq1Lv0L1ftfa8OAGJ?=
 =?us-ascii?Q?OwkjDcnMzhPB5jtCEQfNtxDsj9RDMHBAV91bwBU6J7BJnNFLcjxRtAFiXeuT?=
 =?us-ascii?Q?OJtYDLfagkyvtiagZPY9TXt2NOYWgrb28b3/TnM2d8lAoA/dRP5aMiLvPOg6?=
 =?us-ascii?Q?nrRGe3XM0wceT7lzAM3n9c+ScXmfOHsO4TWD9p4JgfeEYaPq+HB3U97o/Ggi?=
 =?us-ascii?Q?WOJ+X1+EKPzh6iHPLbvY2ajEfCfQ9dtFrGx6rlSGs1LgSxEOlzh4sC5fsulk?=
 =?us-ascii?Q?2nXonyS/55Nmpq5wFJibrFpmiEaX9kYcTxhHs1yOx4r1vYiIRqW864I7c6OC?=
 =?us-ascii?Q?nghN7gllLBIUHVFPOdwsl48NSxik8/pHN1rs4q1VZgBPA9UHgVwgzfvZ2YDd?=
 =?us-ascii?Q?bX9uiFbtAtpMz+6AZJWDwmqK2c6CUwpY/Spk3aSK0T3VS8FCTwo8MUl+ueWk?=
 =?us-ascii?Q?HXHr5scJvvzexZzC8MQJgvub5wTySRPgE7wiTQiSR2EKzaF8OSKskRF4lt2k?=
 =?us-ascii?Q?OAbrM4F8Y36BOyd3pDdYAi+qG4QKf3dA0fT8OMNZ8lPpMk5P1GvVCUnDbgHG?=
 =?us-ascii?Q?oCzQLs6K4vRULc7IGyJrQX27zV2phsaZhUnhMWHysqXfx0/TlpRZAgNfuVKo?=
 =?us-ascii?Q?lTOxhEbve5uzwBRmdyqRn8DQhzYr+n6RCvPb0YFRjk3cocNyZ8BjHjEEbPSz?=
 =?us-ascii?Q?shOd0jSUfrrs8HFvgQ1UOHsV7xo2QZfqEAZetL7ub4X9caAKSbVHFkIUSI4s?=
 =?us-ascii?Q?sXnvoLYCYctAxQOFsD6bl5VCgQJlNE6M4ayoGglsnfpbcz0zK98sF8H6++xl?=
 =?us-ascii?Q?LErR/yq8LnpdQCLAxW2Kn60Jke1/d897thO9J9J5tvbPam0JLMp573LkBB2a?=
 =?us-ascii?Q?GL0wAPDESJhfMwbMEJDR/iNFM3uix1epMkzRBlZL3wumP3OhTojZAV5q/uav?=
 =?us-ascii?Q?ptOeo6+CagnNWdqrrE/kGEZwZhSnmPNmK6Pj8IyGLu4sfrcVUrqbT482ylr8?=
 =?us-ascii?Q?nxj1PoSNoLXt0H3XD1mWnWfXpKQcbv9NG/sDdSCWD0MFa7qqrutC3KkWrxEt?=
 =?us-ascii?Q?iWyDKxB7gJJI+tTx3jSCHoI8BCcbqCA=3D?=
X-Exchange-RoutingPolicyChecked: 
	ZgZrNS2Qj2XCpV5AFKn2NdXZMP8FGo7/VyfYMatZVGeOWtmIJkZdA/wSJS86iybPNy5KdKN4Io7S2hWLvYm8liDhyEI2Nm5z/QAH6VS9IfWEUG/W0so7pT7RPVU9awcPlR33M6ZGQyaNX8VITNExvKRqVE1avJMjZlyzgEo06Qb2ubFTZHWfso3f/h0uO/DpFO4O4iFPPDoiDeiNAz2JQxrrqcWWkW29RC9ZvMV+UlQnkdwPgaTvZT0qiboJ1O94MLoH/53ByC7J9BBq2hUGHBFU/spINpeMy2smCT7hqiNFloG583DK0hXEseo91zyQPOYFnz0Sqn4ReDDm0cOIpA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4380580b-38d4-4f27-43bf-08de7f47714d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 08:23:15.6835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0423oxowgXfCyb80yqu4AZSyepMP7sdtEdvuVSn2eaCxWDfAnNXjq/qclu7FyOvt6V4G7T2q1TRBtqVgvjDoWiGg+MSCfB8iucpPcfFkc/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7802
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=LqOfC3dc c=1 sm=1 tr=0 ts=69b12676 cx=c_pps
 a=OAmo50eV21M7Ophgg7+Z+Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=YqYYM9B5Txu4L5yVDt0A:9 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: lKZNK-ciVUYglYM26tzp-n9mqew1LlJ4
X-Proofpoint-GUID: Njd498pUNKtzy2K-Iuvye1TUxpAS6zk7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA3MCBTYWx0ZWRfX3VnG5NhPS5pr
 fbp4N8SEh6FbfWQd8kKHQgQr6NV64F1+tq45tBPW07Kik3SyWejmJb4N5OW5XnMDVmGQyPmtT8g
 21WV9K80x6799aCsnepTWEal7OXq9SmGS/hUqPimF30/Z8FzvAM/7Sl0P3eKhvtLU/UfpCNrU08
 ehRg44oN7kustfb7kc+ld0NENN9Q6L604kfYB6MonrTgjk4PsAMgRt0TJ+spPQ3HjcHT2Vt75IR
 aL9aAzR0tZLiD+XfT3CdbXj2kMen/PouvsZfJx0/A3fhQ3RGxjPXqWEwtnSJw99/TZywRZ8ToeM
 Vh3zxC4fx/UlFcSs6ZZ8+x2mJapHTLnJqtdJ0cLZL6gAHnkW8AzzwATyKqfyzaEH2OZcJVXvINR
 3ozPfCMbDu4bWr4zyKzLojBp6LHG0EVb2XgShMFnDPzFs7+cQpZ5xf+eSjNnKgF05SH5FOpYp5a
 XKgg/m41ouDdCgvXRbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110070
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 08:23:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125067

x11 is moved in comit [1], but when DISTRO_FEATURES contains
opengl, but not contains x11, bitbake gtkmm4 reports:
ERROR: Nothing PROVIDES 'atkmm' (but /build/layers/meta-openembedded/meta-oe/recipes-gnome/gtk+/gtkmm4_4.20.0.bb DEPENDS on or otherwise requires it)
atkmm was skipped: one of 'wayland x11' needs to be in DISTRO_FEATURES

[1] https://git.openembedded.org/meta-openembedded/commit/?id=2cd317e9551492a64fddf2fb535333eb7e3f7fef

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-gnome/gtk+/gtkmm4_4.20.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm4_4.20.0.bb b/meta-oe/recipes-gnome/gtk+/gtkmm4_4.20.0.bb
index 0bef860c1c..0e08bed8a1 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm4_4.20.0.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm4_4.20.0.bb
@@ -14,7 +14,7 @@ GNOMEBN = "gtkmm"
 
 inherit gnomebase features_check
 
-REQUIRED_DISTRO_FEATURES = "opengl"
+REQUIRED_DISTRO_FEATURES = "opengl x11"
 
 SRC_URI[archive.sha256sum] = "daad9bf9b70f90975f91781fc7a656c923a91374261f576c883cd3aebd59c833"
 
-- 
2.34.1


