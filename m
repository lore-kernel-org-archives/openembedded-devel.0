Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE6B6C0219D
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 14:20:01 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.41])
 by mx.groups.io with SMTP id smtpd.web10.12058.1739456393314594790
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Feb 2025 06:19:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=MoNGWlNH;
 spf=pass (domain: prevas.dk, ip: 40.107.241.41, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=acU3qttyfNmQAWHg8cBFeGGo+iKqc9bMIFQX3nU/B3MmnfsLHdIaMc42ww4UblZSCkiyAQLxzBwcu+C24rV/v3G/6HtY4svAY2Jp/Qda+ZouYTeEp4g0SbS/kaJRkyyo/qtAFciKJZ05+CDXriKrDjdKv7SRiPY4BM56zISpGcyRL+Av3rKD6L7qMO0hVfDgUtt35+HbMmoOiDG40EIbp1Is0x2g0fv50F9HQ+yCnhHuXk+CkihM8tKUKVfuh3XvOrEApv+ryRJgv8Ihygj8NauxFiaC13vDcCjseHA75Pv9Zbphm8c9tFdmsgO1sjxqX7GmF05Vk5cRDDYEbRBcbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9/yh9gKkhzH7qe2SWDhG2hCu/Ri2FsjmdDh1/E9e4g=;
 b=OIjJsukswQ0HCgLDRUUB7nWCtb8pfXl1NFCbUiNhHAzDC+MEOhHge5UylecCFWkV3tEnOXgy2e6y2Yk1fL2FyiOR7dLzzoKhXd78ZShUQou2i20P9q6k2h4WOSjR/6pDvSYtyyiGzSDHiulkNfOZgECWvzN9v0xS7Vn4PkdTERVDVfNeBQuAUF0RTYM+9yhnQqDLQbJCpV9SHb3Y9BEuyeXU6uzKdggIK1Em7R1MvoJo+kyfQYL+7LlkdjtSuRuVOOYROaeyEHBddNv35ZW9t4yf3JbzIohqGQ/gsEhl8v9Ybp/wgxV8a5SZS117xDUlN/5KP78Iezlto4ysJAWKkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9/yh9gKkhzH7qe2SWDhG2hCu/Ri2FsjmdDh1/E9e4g=;
 b=MoNGWlNHC046KU6tED891D0K2Xui5f9qyf5jiP4/KPuKgLTJdYnmgUQls8o3WnrUJktQUlPzq5Sw1PjGTf4RlvOjrONooPY6PIRPjrS0lh5Odr848v1UeTqX/y0nISkMC8GrZg10AaztL/dH4c3ELXS7KIvM6WwoyeIDyL11xCo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:41::17)
 by PRAPR10MB5204.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:299::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Thu, 13 Feb
 2025 14:19:48 +0000
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4]) by DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4%5]) with mapi id 15.20.8445.005; Thu, 13 Feb 2025
 14:19:47 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: openembedded-devel@lists.openembedded.org
CC: Khem Raj <raj.khem@gmail.com>,
	Rasmus Villemoes <ravi@prevas.dk>
Subject: [meta-oe][PATCH v2] systemd-netlogd: new recipe
Date: Thu, 13 Feb 2025 15:19:40 +0100
Message-ID: <20250213141940.1231925-1-ravi@prevas.dk>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0056.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::29) To DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:41::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR10MB2475:EE_|PRAPR10MB5204:EE_
X-MS-Office365-Filtering-Correlation-Id: c9d54841-c9ce-4672-6467-08dd4c3978a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mvAAZy15OIi/yimrFqyvPOyyp9ju7XFHiwK+mmpE97FvJbpM39Boh14lwA26?=
 =?us-ascii?Q?aZ6I7FZV2oNihC7CqkFbA4dNuWfgmzW1M7VC2SczRamnQhKHF2fv11XL1dru?=
 =?us-ascii?Q?PAtOv2tbwmpARbYifR3FWh0lIId3nZDcmfcE82HPFIFnJQzS/cVva87Ay+JI?=
 =?us-ascii?Q?mhNlPWI9X54GH25JEXMlAF74WpqCD8WgsMP0SghY93xHJd8giQPBPQSQgBSB?=
 =?us-ascii?Q?aNF7BJrSAlysUx/qDe91+Kua/6ktodsi+cVr4jVPt8kOLAtaNnPwoTfi9wIa?=
 =?us-ascii?Q?PWWrM2fK/efgC9PaiiJTzME/Kj2hqYFssvFCZLo5Sopjni96/IYbJJDM9Jry?=
 =?us-ascii?Q?O+VERweEeZ1ff8e+HLYvRnHz2emoTQyaZJ+tQ7fkFdZ6GnUQIRkWrB3YjAuj?=
 =?us-ascii?Q?HTFNwFtuM47AiZVbNqLpqap1XTEUVWcw2I8JN7NqP75NWVTy24qDW8DpAdwe?=
 =?us-ascii?Q?oDfsEQ0kza1L+xqvIqggnmU3dHfAmTX3+rrbEQbx2Xi9Ji9WuVbF5ywJiO5a?=
 =?us-ascii?Q?QBAXDx7W7BWk+VFRnzRTiTU0r3vzLT550stxPRkqnQnVgd+RmTmtIZJ5i0lz?=
 =?us-ascii?Q?c6SBubF/iykOxQUoRuAoMw/8j2wpCcpjg+tFDG+TgqTWTy3mhSo6igHxHjm4?=
 =?us-ascii?Q?ibY1ti9N+28dAAoJFsbds7n7K2AW/QZkD44XohUN6mbXBDwLslx7hBSl69fx?=
 =?us-ascii?Q?93eDS8elR3/eUAszV76dJ28lnxU3vMWYHC/e8NzLt+2VTvKCD26SUyw6aZmR?=
 =?us-ascii?Q?v9BfnbLTj8JiiuLNxCWdqcRsyUU3HfYIVREnrLZuvI+pO4b2381LhVNGHyjM?=
 =?us-ascii?Q?gobSO/SIYGkJ5QxYzYOGvIMNh3oVr4556nvuwnU/AwUVYmGkeC7zDWWUN7Fk?=
 =?us-ascii?Q?ZlkcFAtnrq01zzFPJWVL7TAAM3GX6wnVGCk3obqaeWvOwSCfbhCek52K2+1q?=
 =?us-ascii?Q?9skq6lpDkamJe/u3KcxQdm2fhxWV8xTfJ4fmOhrWjQGBEhXtV+ULQja86Q40?=
 =?us-ascii?Q?Q/eA6U5YM2o1R0DpzUhskxSZiS60SRuWqNC0IqhCpGUPKqdjnJ+fKLHNTgI9?=
 =?us-ascii?Q?ue2WVWil/SawkwuOZEfQMM6ybBFZAgvAE42LyConsk0urKHkAWRucp/hHCfh?=
 =?us-ascii?Q?0hWUZ60l8moPnD2QRioXqTSp6Qf9IQPcuhooO8Q/bGBPQuWlmPKvkHaspG07?=
 =?us-ascii?Q?x3eHTol5a5Hh8isj5Kp3IZ2ZrqTSUD2k3lippVFagV3BKFGxaf+2o54n9Vrw?=
 =?us-ascii?Q?dNq4GPRtZMrQ+iHhr8QOS0auSC6nzlEO3jhORuqRsV7B6HCkDX3uy0dyehWm?=
 =?us-ascii?Q?OyKHlEQHNW0QOpFnsJwfDMuAmMWGPrzLuzJqcAv2I8YPuE95D3WgfMYKkeEX?=
 =?us-ascii?Q?x7mmzw1BLS3jf09VSq7rQVszNu+P33MxVa0LElJ+7UOwxGlXXNrzhZLw3QBl?=
 =?us-ascii?Q?HFiCIhNrqqA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6l2byC2VdQiW6pGm+za1GD2pIJ1/5UjFm6mEFqCGkLLqkhtnDS+GLug75poR?=
 =?us-ascii?Q?dvrPhIE9VJmuOWykFb6s9wlJKYPeBnerLfbG1p88Kd84GwI4lFI5BTGisyNu?=
 =?us-ascii?Q?I+iTi6f0hiwM1B6plT2iRuA16ddc4XQkVkVSHn61e750BtvvWDH4uZJauo+q?=
 =?us-ascii?Q?K4TMIMKm1+yR58/gEFIkv8RIO2KI7QF4HQALIJgR9R8QGkqFPpfEGPwLc63P?=
 =?us-ascii?Q?KIJiw4lJsN+K55sev0RxaMnDMjCEOnRm39JvwNBK3ViBhayo9ONJYGY7GpZG?=
 =?us-ascii?Q?eEx39lt22q6dXSR1JSqTkA8Tf8hm3loCHJFGN5QcGK2zYF99POstZ2Uz1GT0?=
 =?us-ascii?Q?3SGHalGsTGXB7OSzpO3+oKiXXkErw8OqKskeRBTY6f7k8mHUhA6542Mse5de?=
 =?us-ascii?Q?w5CMCXG8BRAwVi1C3rcD8FzOMcVjA8YM56vpIMYBeKy8eQohR0K78ihkdYe3?=
 =?us-ascii?Q?1KzqmeZGXj+uyp3RRgMJHwWRFY7LN8u/dQlXpWXg1AxnCBzLRTelizhk55VS?=
 =?us-ascii?Q?Ydf6vkSkCEbtYikaI8iBsQlkQL4nPPQJPtVe/e4aHv+IMluQw0iu7oX1t+2n?=
 =?us-ascii?Q?Oz6QYVnTcPa6K1tzcV8TrShzKUz02BZTwFYJVXVE1KRa3vzN+Wt3pID89jtz?=
 =?us-ascii?Q?3D0ow0iynEr3asToHGch9uOXNvZzJeQGf94tGiPqAle8QbxFXlGKvG16RqQy?=
 =?us-ascii?Q?PMrJn9oKIus5nhkO+uI8RG2YjI8sQi/6ndkGs1WMYGFJHPNBcD3GAHQTFzOV?=
 =?us-ascii?Q?hnHwmNXIiFeDggcT75T43kv70dGKqANGPcDrPKTU2+STDuN545RW2uIg2otq?=
 =?us-ascii?Q?4cZQCX6cf2RZVd6a9Nb+Y5LH2zJqaNHV5jBtk29Z2bof+gPCSOoEYRT/I3Mv?=
 =?us-ascii?Q?D0FHlGEwfVQ8yGNvKZvozGFWNMYb1oy+SFRud+o98sZziJJhkQieNY5Cpp/q?=
 =?us-ascii?Q?GJDVEiBnDvogTJk2ZUJi8Z0zbc9oPY18MbC0X/l7NuZLF8x5ZdJBc4o7IwfJ?=
 =?us-ascii?Q?m2WwvTpFG3cGRcFo0z8JFmWeoMq8r9TBGbLys3n72MG9k6pCCcnWHb0D8qnU?=
 =?us-ascii?Q?H7YJI4BEO50Ea4GoOC+qJQk0LS+obvW6e4vqJa82HrHU28GUNm5r4nO68NqQ?=
 =?us-ascii?Q?LvDK/XpirzEAh4U6AGcm/8EN5iQiVc1BRc119Q+xkBlxQukGnnkKQKf9RmB4?=
 =?us-ascii?Q?swgfsYl+D00NCYv5eGnAAqXXqqYIPJD89AXoq/C1DTIQNzhOQW2wLXTJExju?=
 =?us-ascii?Q?fGALse60J7WTaqmV5T6bDdyKtXBRRZNgPbAdu66D8tf6MZTwgONgMAtZz+Li?=
 =?us-ascii?Q?d8n6k+fHF2Msqnk+SnOqYR5DN/J2IWbUgPkZo9N6EBqr/9Szkh3oteEErNHN?=
 =?us-ascii?Q?Cq1SYljkp1/ztsh2KkZ8hpfWrdz47BmyfdZUJm9ESrKAi98CqKkOOj3RHwSl?=
 =?us-ascii?Q?k65HhCfB9PTWWxU0GpaBNOUl7cHI1fxOlWaPRlT+bKCVur7/sMT2RYKQqkST?=
 =?us-ascii?Q?SjeIHEBm7fUDnBOTF2hT5SGBbDH/n24F+J7cYwXO5oHxHodNGKnp0rrjeJ+N?=
 =?us-ascii?Q?vCurvGD8lFK3Zq6AaXDOsrhjl8tHcXSXfZ/yQgcdTQG4N9upjUG26o5PfSb4?=
 =?us-ascii?Q?kQ=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: c9d54841-c9ce-4672-6467-08dd4c3978a8
X-MS-Exchange-CrossTenant-AuthSource: DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 14:19:47.9201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: czhMqwZ8zfpPnS+lrRHJ5sLa7n1dcykJXh7hF6R33/l2Azj/o/E/oHS8AughOkp1PDjuAcNtR/VS9TB5ZIu0UBaBmyz9GZ5wlGcH6undz3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5204
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 14:20:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115466

From: Rasmus Villemoes <ravi@prevas.dk>

In some deployments, the log aggregator collects log messages in the
syslog format, so systemd-journal-upload and friends can not be
used.

systemd-netlogd is a daemon for filling that gap.

Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
---
v2: add systemd as required distro feature

 .../systemd-netlogd/systemd-netlogd_1.4.4.bb  | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-support/systemd-netlogd/systemd-netlogd=
_1.4.4.bb

diff --git a/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.=
bb b/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.bb
new file mode 100644
index 0000000000..6b609a0f5f
--- /dev/null
+++ b/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.bb
@@ -0,0 +1,27 @@
+SUMMARY =3D "Forwards messages from the journal to other hosts over the ne=
twork using the Syslog Protocol"
+
+LICENSE =3D "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM =3D "file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd25595107900=
8b364516c"
+
+SRC_URI =3D "git://github.com/systemd/systemd-netlogd.git;protocol=3Dhttps=
;branch=3Dmain"
+SRCREV =3D "b03cc3b1a75048c7cf19467d8918a4b7320767e6"
+
+inherit meson systemd pkgconfig useradd
+
+REQUIRED_DISTRO_FEATURES =3D "systemd"
+
+S =3D "${WORKDIR}/git"
+
+DEPENDS +=3D "systemd"
+DEPENDS +=3D "openssl"
+DEPENDS +=3D "gperf-native"
+DEPENDS +=3D "python3-sphinx-native"
+
+# systemd-netlogd uses prefix and sysconfdir in a weird way.
+EXTRA_OEMESON +=3D "--prefix ${libdir}/systemd --sysconfdir ${sysconfdir}/=
systemd"
+
+FILES:${PN} +=3D "${libdir}"
+
+USERADD_PACKAGES =3D "${PN}"
+GROUPADD_PARAM:${PN} =3D "-r systemd-journal"
+USERADD_PARAM:${PN} =3D "--system -d / -M --shell /sbin/nologin -g systemd=
-journal systemd-journal-netlog"
--=20
2.48.1


