Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A95CEC01DC
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 11:42:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15264.1774266144868101662
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2026 04:42:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GVRZ1eiH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7542b98c32=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N5o1iR3735900
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 04:42:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=zAPsSK9YPfnXqp63pswli3QR7MQV1xk403uPFXIZpf4=; b=GVRZ1eiH2Uz2
	wsn9DqBrCr4bxme4HDOtojuNeu4wh0XmOyCvrElL31N9vNo7bVPGuc/BuXpMdDtR
	tHt952Y/yIJj9plXqmo2r0osB++lfaXAL/vO9nII947DGUltTygXf+idKuy3NSki
	aWWEqZSb8n6tYqXccnif7NxWpaFMMAkcBxXutZaLQYtRDWtwreDL/xV+FgBmMSmw
	fEXgi0DU1C72Ne7LlRgd22HxOgP9/9hdaNY0Lu8umL7VK4LK54n/SxREr8liYE/4
	Rr4oIYbVjBQacJ/vL5OB9bUqi6CD51iMy0GIgt+vhYt8jJYJekn0xmm9X/wSI51R
	shajdlHMEg==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010026.outbound.protection.outlook.com [52.101.193.26])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1pky9k3g-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 04:42:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G2D30leayk+/b1ERMbxx42KCeEFLohCiRLEjcff3dnW6Q6eGE0h8LjzjwMh73L6GZ/uPV9mwz55mUzWlgLDpX+P5rOV6qfg8HDKdo5MV+e57Sv6QsiUVwq+NlMum3Hm93815M1W2jDGGFwznpOw95Q2+zM5Scfl54r1lA/2tGLBdGrVh20QMDsvczuw4XmEohQOej5Vn14TXx6xqHImKI3Q/F6PnYChNRNmLWUXSkj5/loIhZWiGg4SPKzkYBYEUbWW5zM1nQ5QNOaW1X4jxaRK2sEuFfR821eMEqZYGOB/90mT/asXMexO5irAH9oDYRkwonUlHfeBHtj30VjacqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zAPsSK9YPfnXqp63pswli3QR7MQV1xk403uPFXIZpf4=;
 b=nRKP0zCHwO3DN5KQqIvM5wkjrPStR2M4MG9JzbnO1SXa/VIXLBqsdCp/YhkTh0yvRGYBYRIVzDlY8c0qFiU0DGHqLUrDviiv5/0UOT3vAXYTyPCmDA17AnHURkxTUp6KUe/hKr9DBZ+yb1S5HI7d8vo3U6c3p77qBuk4m++EjzwINP+MH4obxXVppQymuQF5StMEjVEk7mZbQiSmOUa2aqkqMZASfmSbcgDKbQCNOzESB4rx8rK2iEBEqzzHzImqMEMxHw4uC169k4oXa5+dfCq9JNRtxDem+z+6fWAmyuodqRBW++RZsfHROZIjKx5SFjcDi8M/pbyCDyxnEUU6Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by DS0PR11MB7441.namprd11.prod.outlook.com (2603:10b6:8:141::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Mon, 23 Mar
 2026 11:42:22 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Mon, 23 Mar 2026
 11:42:21 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 14/15] xfce4-datetime-setter: fix link failure due to missing libxfce4util dependency
Date: Mon, 23 Mar 2026 19:41:51 +0800
Message-Id: <20260323114152.4178269-15-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323114152.4178269-1-peng.zhang1.cn@windriver.com>
References: <20260323114152.4178269-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0108.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::14) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|DS0PR11MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: 565978ec-3e8f-4aca-8d97-08de88d13e55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	fP43rsckF/SsQ277ulgI07g7TKAHnMK1JXz3ZCpi3GulkYIbxedb28otYqRaEqdnnxKqJbXC4P70k2TwuUoBE0yqr9Fiw0R8R+bWeEqr7s9Xos9Jac8airSvD5Ht4Hqw8iix5+ER/DbSjr+dX8Bamzy8v+IABtEDQJPciR6Lqu2kLJ+O8CyNeRGjFK7LRHgv9fFayForV+Efs6kH/Uwq9PAHl2HshHei0p0mXb2bgAnGYq61Tq2/qgzxRkN6NNWiEjAayLYitWu0Dt29Y51HZA4U4lkNLkMgqGbbK4uB6l3WBeAqsVDmM7p/6xFNb5+YhW8+4oMOAilsvlrNEbxIBDqS8uEcwdc8+uKhOqKYlHenXgH3XDz5ydnvHxPXfUApaGKFXtTpEfanIYeER7Hh0hE7IDL0siHi2sJL5mfRV4SkACW8QshPEcCPQEEWde16eD08DQAlXu2t3yzppbumcKD/5lgNKg+CdxEk1Hw+l+NTLBvaubDQ9K6cHyRpg+P7sxnr1P0KVQKJo3lUf6RcCxQtbZTt6MUn58ZYCW7LDizi1pubvVgeMkYa5MrbXE/sBFGLfXcyuhxVXPLqlTgekRkmT1KaT8ngA3iBlHbEIFJA09vgXf0DMDpQSSxNPcnTTG1Ev9BrRLkqh4RlU3MXP69xg5Ypr1qZ+DMd3RyQsS/QAW9wmIGVSVf7sWrG4d1c4oIvV94E4Z9Bysz2u/OtuhfByEMeIxajaN8xzP9xSBEFdmuzF44OdDg6D+tZWlVze2eNoOrcjvHsDmzpOYv+NJYqr45tGSuhtT76ZO47aNQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9VG1Rxmk8Et58J1MD4xjez3yG9bj1BM46XfQPvNTt0gQP0LyeZ/B0L02S/io?=
 =?us-ascii?Q?VjTC1hR4YbTBSSByU8ceK30gb1vdzFWWaCMZ8FNzDc0JEZCYHaWwNtGz0PLF?=
 =?us-ascii?Q?wMeenS8AZ7f2EVZ4+czmF0Z43AmhMtQx+1dT2lVZlmQX7p5ftNp5NNKW1PT8?=
 =?us-ascii?Q?OhFi/3HdhuC3xrlM+nk6ubPnBCGoR9zKw2CwXIQ8hB3yXmldrfIC01CNI/v/?=
 =?us-ascii?Q?/IZgfmChSrQdYeofYjxqKOqFKe1BJOMF1FehqpXZ0/9ag4SWEKjfoisyOFI6?=
 =?us-ascii?Q?dfw337jICAscG6duAGr/9BJjZchYqbMoz30Ti8Koj0XqQpI7uPKvRbT7XjlU?=
 =?us-ascii?Q?H9eR6snWGNasPhiS+od4mlV2lh1On5U/X+DXTLXykgLwc5HZ6EsZQjvxNX4t?=
 =?us-ascii?Q?XZFGxX66h2sfOPG2CNNb0MQeLst0AyqkvrxLjVSprulbkKxdHpclo6BSDhZy?=
 =?us-ascii?Q?0iv5jc7vZ2c+g0+EpIhoSA1hzHQY19BBPQEDcylWGM30ttHtrCYDfkVYUDML?=
 =?us-ascii?Q?pgZU24Z+oxzmied8zhcZa0t+p91NCSKZm3JmS63Z+0UfdpsOB9Tk+sKwWprW?=
 =?us-ascii?Q?AgZz5TnaCKQ+EbsXD1Sk7KqEKNmxEXrXB3Yx7Grdhu6zeTHYxWklskfdMOeC?=
 =?us-ascii?Q?+6B2+Y/UZMDoyO8oh8bvq8C7c9hcYE/eGYkov0zgItjt0mLeck0hRhNwJ9fQ?=
 =?us-ascii?Q?um8Bk6NTVMJ3WLOY39jNfioAul6hk+IRF0lWklWd/Di6GdwrlxUyjan7pgkX?=
 =?us-ascii?Q?lMaFAj1BO5fbFC5Dv5X1VXOX5KPPcY+w8eyGTCa+ILY/80ZNcZ0SsHwZ30bL?=
 =?us-ascii?Q?46noL3Hbx53rldI266/PVxS6FqX9qpbXL/IFhEkM3aATkOx8CixiE2edanAR?=
 =?us-ascii?Q?rSD5SDWjVtSt9838ibywT3YANe5AIwT7XX8yRfwFjCcQx1wXxunUnu4bNUhj?=
 =?us-ascii?Q?LtaAmbEatlxqr4P7jjrEEJmComwSx9iupPXqc56P4/VkNpziBuBHhn0kDLOx?=
 =?us-ascii?Q?EUDqusPxZQ6XNckmiC7EUIQaVaRNg2zmAfkpJ7eVzVasynb41cL4Djbc/Bj5?=
 =?us-ascii?Q?qyVHIm/1rF+NPiB7Aj0fEqSfM+g3zToE531HdODBtqvtvb3WPMJMapQX8AEO?=
 =?us-ascii?Q?Swy7jOI0XzPEOu9ADqrTOVZJhgCg/VGRDtxwcjnBGDWkzv9v/LuJh5PYtNVu?=
 =?us-ascii?Q?tgUJ6Cub8KYSTubDddfqMgWlZeUJUKXA97hCHSXQIFTCywX4IYYc7cJYFI3a?=
 =?us-ascii?Q?rg22u0oav5d1IQ6q/hPn/8THX3JFa8wD4qpGmeh3pRn8VvjNyvrnzvff0yuj?=
 =?us-ascii?Q?QxFYzQlo1sVBbOIbdEgANj8Xf6tfJ7SfEOCTvRITSm9oxa3wqH/4cb5AW0vt?=
 =?us-ascii?Q?YMgtjSp6mRGCnajQ9iPRN49XVQjFwc5Kx3TTgdhiK0Ob97dZem4aXs3iXqBj?=
 =?us-ascii?Q?1Eq5WnM4vrGFY7j2tdZt0xQHoQOfmQ/wPF0lM3VpbKD7ws/cWdKtNA94zbYy?=
 =?us-ascii?Q?wuxZGqDfz3w1xY3A4Ef4w61oNgnXRVLP4K8XsPzp0+DdMw+x2GQuEGXlaRN3?=
 =?us-ascii?Q?k2UgoS7xyZ/8gWQgzJPOB+BncdVm5GMspWJy5CgPJ+FLGlS+p391rL30roDK?=
 =?us-ascii?Q?kflW/Mn0w1KAaQCBULCtUawwHB9kF5uroKH/Hy/pgkPrs1yd0isNaJzC7MDE?=
 =?us-ascii?Q?f3CAscZCCHYuJgdscyyDH74QZJZ6bMDXB3SOFzj6Yxx4IbbA6en4DFSdFbk4?=
 =?us-ascii?Q?ztY0XS5JU4VO6nJwry3V1bZzNlxZ1E4=3D?=
X-Exchange-RoutingPolicyChecked: 
	k/tW7D6fFQGe5kUlgJUNsaTrqZG0icRSTpYo44D1gA/P6c/7Ojyey6vXVVjq2ZAnkSy3zdulrD6s2IfA98vHaNugGeJuOU8V9V6pnPg1SM6eqVwnSvFe8gkTbyC9oeuKQUWQlj4On+d4ITi4fH3TdJoIo+8KhEQ/DoYDks+wGHjyOiBXPzEGxdKdH46TTGyL579e8NzUBEqs6x61SHo2I4/e9XbYqtvO7s1g2LqcAFLG+JSt3zt0UHBww75z6o4df3zxjLiEP3FM+WZn5Egh2ef/E8RPSCwa1FUS96tjEYCkMuB5UskqtqQoSy16ImpW+VcKeYKBnIrfw0C94nYXYg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 565978ec-3e8f-4aca-8d97-08de88d13e55
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 11:42:21.0636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CcRFYdHe5ISW21kYI3nUXBFeGwvZskk/mKrhF5Yd4XRLhlrmohrU++hu8NDIOjVbLQeBWylxVm8Rem4ODVTWlUP4cpySJaEnAKt476qoF0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7441
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5MSBTYWx0ZWRfX7yDWQ2hOVjX2
 f5tMRHkUMD+nSjVlWy55UT3hQhffCo+Y4BZ+k5v5F83oPSVr/9KMoTaT43Y6bGgXrAYI4J3zHgc
 CHSQTcUKm1igkaSloLCph7fgV99HZrfzHZM6V/QZIpn7FseMrC+8W/YwudxgsPfbDTQ+G+BEocZ
 fqU2CMNsPXW3ayhk2udgibJOsIDPvKB4nEcPvhR/8TO7jESTMJtAvRsYAa9/elUMD9hQ4tMpyoa
 32A4YFQkjTXkMfffdMal12UVVOMRENug9KP0VaTlU5UevlFnZPd6dHptYJWD3bv81EB3T5mBBGY
 9LN58PhkCW3eVYl+gY2d9F8OugCs+U31JLboSXhdXXm4wPKMgdXO32HO5IPNxY2vVWioX7iXxGx
 qYvdmdfFJXo9EhuO9cTM8WYwmMB5nT4ZpxD07VaSC6XWTJrM2hqSLG89hYWXVUtK7IVc6y0RCwQ
 qhwKxk/dA9PkePLBvdw==
X-Proofpoint-ORIG-GUID: gQO2wxC-4zSvYHPD3sxCOgP4G8lJTnoz
X-Authority-Analysis: v=2.4 cv=Scr6t/Ru c=1 sm=1 tr=0 ts=69c12720 cx=c_pps
 a=3NFNipLq04N0pvkhkOyhzw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=ySDnN6HVMrxVU6y22h0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: gQO2wxC-4zSvYHPD3sxCOgP4G8lJTnoz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230091
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 11:42:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125517

From: Zhang Peng <peng.zhang1.cn@windriver.com>

After libxfce4ui upgrade to 4.21.x, its pkgconfig sets
libxfce4util as Requires.private, so the linker no longer
automatically pulls in libxfce4util. This causes an undefined
reference to 'xfce_textdomain' when linking xfce4-datetime-settings.

Add patch for libxfce4util-1.0 and common_deps (gtk+-3.0 etc.) as explicit
dependencies in xfce/meson.build.

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 ...g-direct-dependencies-to-fix-link-fa.patch | 35 +++++++++++++++++++
 .../xfce4-datetime-setter_3.32.2.bb           |  6 ++--
 2 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 meta-xfce/recipes-apps/xfce4-datetime-setter/files/0001-build-add-missing-direct-dependencies-to-fix-link-fa.patch

diff --git a/meta-xfce/recipes-apps/xfce4-datetime-setter/files/0001-build-add-missing-direct-dependencies-to-fix-link-fa.patch b/meta-xfce/recipes-apps/xfce4-datetime-setter/files/0001-build-add-missing-direct-dependencies-to-fix-link-fa.patch
new file mode 100644
index 0000000000..c86e418800
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce4-datetime-setter/files/0001-build-add-missing-direct-dependencies-to-fix-link-fa.patch
@@ -0,0 +1,35 @@
+From 57fc1ba0b433f2f95cd9eb011cf64a4f28b281b4 Mon Sep 17 00:00:00 2001
+From: Zhang Peng <peng.zhang1.cn@windriver.com>
+Date: Mon, 23 Mar 2026 16:44:28 +0800
+Subject: [PATCH] build: add missing direct dependencies to fix link failures
+
+xfce/ sources directly call symbols from libxfce4util (xfce_textdomain)
+and gtk+-3.0 (gtk_builder_*, gtk_combo_box_*, gtk_widget_*), but only
+libxfce4ui-2 was listed as a dependency. Since libxfce4ui-2 correctly
+places these in Requires.private, the client must declare its own direct
+dependencies.
+
+Upstream-Status: Submitted [https://github.com/schnitzeltony/xfce4-datetime-setter/pull/4]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ xfce/meson.build | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/xfce/meson.build b/xfce/meson.build
+index 2acab2f..f1386a5 100644
+--- a/xfce/meson.build
++++ b/xfce/meson.build
+@@ -7,8 +7,9 @@ xfce_datetime_c_args = [
+   '-DHAVE_CONFIG_H',
+ ]
+
+-xfce_datetime_deps = [
++xfce_datetime_deps = common_deps + [
+   libxfce4ui_dep,
++  dependency('libxfce4util-1.0'),
+ ]
+
+ resource_data = files(
+--
+2.50.0
diff --git a/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb b/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
index 308da40c34..356c55e47b 100644
--- a/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
+++ b/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
@@ -6,10 +6,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
 
 DEPENDS = "glib-2.0-native libxfce4ui"
 
-SRC_URI = "git://github.com/schnitzeltony/xfce4-datetime-setter.git;protocol=https;branch=master \
+SRC_URI = "\
+           git://github.com/schnitzeltony/xfce4-datetime-setter.git;protocol=https;branch=master \
            file://fix-inner-dependency.patch \
            file://0001-Fix-build-with-meson-0.61.patch \
-"
+           file://0001-build-add-missing-direct-dependencies-to-fix-link-fa.patch \
+           "
 SRCREV = "5c7a73a3824b03b91719e05e2604b97c7a72d50f"
 
 
-- 
2.34.1


