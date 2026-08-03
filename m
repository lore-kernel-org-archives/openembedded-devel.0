Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBFE3C55182
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 12:38:44 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.15])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42304.1785760720330023386
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 05:38:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=sF08vBJn;
 spf=pass (domain: est.tech, ip: 52.101.69.15, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U2FXx8hmXtnZgoEGT3B0jfVnPD18u70VMVVteUtuCuVkmZ0XzT9wMVjmZRCYn7uW02r780e0rr1XM9Dtg41EW7cPltGG6xVb59khRcD9TY6l7GHIlbsiODEl+vJuMPJhWvFGqLlzZyUw1uTuBKL7jvNkPyek/+2aX1JsRov4f4R4kEKN4IeW9GX1hPTjXyp0ReeF6FKZbCRAhA7ghdUCeEF84WVWjb/vKS+R7+5w5T5MwSTCAouNedAaRKMB3KzL8TY+TO7WuEnIvNT8Nc55Rjgx5oiI/BLv11ra5gptT+xyRiZLsoM19zqXpTSt1AsXaHgN1feikb4BFQfaH8dBSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=04Qfqo3SFdlvZfOybKcXCfaSQHyMnjVFVcTxcL6CgJI=;
 b=enm0S7CewUq25MmqXCZ05ESuQwfSWBHPAeI9iVHlm3psyWEYuNmXTYLHEZnbQfOFUO78mgS5dmvc/Qm9LcmzyvVWRn5SR045RJEP/rlzF7bwOERQTdFguFkJT9dhcoPI57ujxtWDPaPjtV5rBDDVpaQmK3jjWzEgDSIIWb3xAvcJjYVFzfjA3wEEV9J0q8OG9J/967m2l8/WW9LBJXAPQOzsBBa6eaqFbRPdvhsr+oODOfmWZEDfSEijG11rm+YMKNlhciUpyh1PblN1c6lVoi2gnwcyifK5rnuM34UrlDvaZu3aXpgDpoIpbXoqenHsQwCKmciBmX9GZloksARp0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04Qfqo3SFdlvZfOybKcXCfaSQHyMnjVFVcTxcL6CgJI=;
 b=sF08vBJnCI79lNYWR369FOALxTX4CaGCN2kLCARM+amD+aJYg0kaFMnQgKMjdJNnHfn70FmI4jWLHeEtLdkmG4fg3xCo+37jBTV6Dql0yAUAUBd9yid04TK+Rf5RtpC/If3ZHpHvYS6UzP1KDT9s5xhYfade1oEdGp4JX0YmjrOpAtJDhK7UrUlBEoAH23JDZ0NtrJA0+2dOf2IN7eZ/FkFY91cN27ZbqU142r3EKhDjxYff58pzd762iXA74Q86xY/SItvJRvemhA//xaamVs7r8DD2AHlrHZhLf6ROZGG3l4EXujbUhF5HI/k1stHl1AzNOrOtMm2UXeiZQlyPSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AS4P189MB2229.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:580::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.14; Mon, 3 Aug
 2026 12:38:35 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.012; Mon, 3 Aug 2026
 12:38:35 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: khem.raj@oss.qualcomm.com,
	Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [meta-oe][PATCH] rsyslog: add autoconf-archive-native to DEPENDS
Date: Mon,  3 Aug 2026 14:38:31 +0200
Message-ID: <20260803123831.74343-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0331.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::24) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AS4P189MB2229:EE_
X-MS-Office365-Filtering-Correlation-Id: f64484df-ae2c-48f8-6c4d-08def15c22aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|6133799003|11063799006|56012099006|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	/qnbopvBgpuODj8HEwtp5luHyxmaSmQRmN0MpmsWdt061sW/QFdXUb63Qo3ooNvpSG2/Fw5KRAuoZa4AcrlxgBPGkOXDM1NI5msMnZS/BubfNJLua54y7lT7v2N65ERI2zgYYvYUJYFg+ww+EOzCxpfUCvXuuOM2iX6HjnWfSEKXqEorsoO6bsMB+L3cCiS4X/eezF4lObRTRTi/HVCuGO6+o1naL1yOvmyCCVfZbMyg4loTOqwDNvtJH/BeTUU58OycpgHyigaJSRVUWXJRHtg2/pdrp5LdNgOhqfR3cR/BOriL2PBMeh+VpLA7/2O4DIaxG64LhV+/MnZMe6k9XT2yq7LJmXIzWXWHYbZsL76QFIfLcY0ik0B7+BiWhfTXWRG3B26O12Ms9Dm7ubqgC18j5iIb2dCJih3iX0t8prBrqbj2U66UHYadpxqj5qyW1lDGaBrT0SGznBD5uON4Y8Ubuk3j6xvlnaXPR2JSpZ4+6OTgyGHIvBU0Jq3tfTt2/h3ThBPTyJ+r1BiBqwTHXcYgT4YXVeZvKKjB4A+ptgtt4PsiyrbaaUBci6U9YLAvaOVpwLVbOWkOea/DxteVjn2MbbearWYtkSgtp9CZJ4A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(11063799006)(56012099006)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rGKphRMKATRcZWnT7ZFFo0lcLwexucctu7b1iL+w1Kdh3pYCXKW7cc18gZ1X?=
 =?us-ascii?Q?nWbGFapdx+wZD4NE1kGgITBH2IZTh3Pfqu3dZUG30O/pkKKK1+EISjyDafVB?=
 =?us-ascii?Q?WBCMIRB7k+Ek2zssHtnFmKQHE4H8om1azck9J/k8OqkTx4dW9qba/Ms9YBd/?=
 =?us-ascii?Q?ZqJo9EyRMzj2LlH+P0GWb+cLm4HvrZF2ZeOcb9IxxR73FgGxjwaUlwEMCnhB?=
 =?us-ascii?Q?21L/rSIprx9Y9aehhgkXUYK+GsYoFVD/sgn7xtTL9LnXFCJEw5I3kDjfzyMK?=
 =?us-ascii?Q?pt6ONgX0ZhW7kT6xIZz53OxiPf7I8PkMeG2eK3tVul4Mm5Aa3a9QejS51yba?=
 =?us-ascii?Q?W83CB34ysjG9pX2pro2Qxh3b/YUESNuv9rPxZrbJgkz8NuhCp3ZtaejbjcT8?=
 =?us-ascii?Q?oZKAI7xqXgiK2m4tj6VxNOiaFxTZ209V03zEdgef35CkL0X16ynYXuuthDtT?=
 =?us-ascii?Q?g/OYwAZ5YJlGbkINw6BhNlGfB6VHFYC1TCJdSNFJn/lANyl3VE+0u5X3vLMh?=
 =?us-ascii?Q?db9k1U/tDyYpPYKWp1gO+kAHXddNRyYryjt9wNQXZhBzMdwhxf9JNi8Z88L8?=
 =?us-ascii?Q?0S8k1FyvJJoe1jPGAYByBLEij5sN9nFrJDRqq2fi8GmoSZgDIh+u8s6msRER?=
 =?us-ascii?Q?z6AcRFanFYEvisGtNDL+hQKSckK6BeRxpQpL7OW+mbjLVMUQEcDVtByl+Kyy?=
 =?us-ascii?Q?eul9vJFdRZJAzHhEQ0b5NkzFvWPIdV8v85IGwqF2Th6KMb8BHo2v5wUjKDLN?=
 =?us-ascii?Q?LtCXWrIDFUsAWQ+ypveL0/fYoKwuYgrPhdUGWXVimT8yiEAn0tsf++VL0H0C?=
 =?us-ascii?Q?Uj6fVKHT7Zafs2Ye7BrckzTJIeRrHLqb9b1IpDvCKdg+Nt9Kkps6yLggDw3N?=
 =?us-ascii?Q?Ceu+tRa/s4VKZkXKaCiJTjHD29Q6qaRRELguKR5i6Nyj3ZaQqTICgxM/xxCN?=
 =?us-ascii?Q?ggLSuZ57Ccosqz2NXjM0X2M8pYftlXO9dpMuFUYnLfjjA/xy+K+18KHgFuXb?=
 =?us-ascii?Q?6PKNftdLQ+XDYQ4DdjXuPGyAmFVzdHgYn0xyVC+1hBGMJ9oe51TrRKkVRLCH?=
 =?us-ascii?Q?Eww09dv0PZy7pTQ6M/mpfonNKjKZ2ItN9eSkbiNmNDXmvIXUjoFV1dMoOtlr?=
 =?us-ascii?Q?8p14MrzOAFJ32M1hvAz3ufs+XrS4pK1TeBw+xzM8so9BjLNwiZi7PvGvofVF?=
 =?us-ascii?Q?JAFBUIlvDn02yNTXiYg34bp4eZofMa84ioDus9WkRogMU7eAsiYGhf87zGhK?=
 =?us-ascii?Q?DRNsLqbXVRlYqxC7awBMZPGAHInpTg7JMqTjAsqX7M8RwSwYU5Dh8KEnSRzW?=
 =?us-ascii?Q?1gd81Z8dR6eaScB7u9m3KJX88BeMSLDLy1HdJLVTplEm6gHf2FLuDzU3um2Q?=
 =?us-ascii?Q?nsGfDBi/ARvn2EBtZa5y7zRlzqSp9V8AL54b7llALqQKu6DRjbWh+a3FVDtO?=
 =?us-ascii?Q?pRvgqNlSgGZshpZyYVpleNW0q0QvbO3AOHKv9ZQRmDdxCLcudOg8KRIrBvl0?=
 =?us-ascii?Q?3vL1m4Nd3sdMm5dJips7xk5H5QHvFth9Nq+sao0WjWDtyolzUQXutGunuMH/?=
 =?us-ascii?Q?FgsvMvUV2i7g5U42gsF3L+PiTYyRvfe0q86J+HK0VTBIPZ5LCovDU8QVZx1O?=
 =?us-ascii?Q?ozjgFtDiywhlcqo0dxXntwL2qIJoyNTTyDWFVYV01AEz3xCf/Vtf/PDpHji3?=
 =?us-ascii?Q?wIcLyKGxTLcoHmLn9WhEnAjPIqC2Ut4idzpGS/YWs5FuRacxi66HaZ6FZdCX?=
 =?us-ascii?Q?lklm1KNL/U/DOLOLLD8dCOZtpliaR4I=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f64484df-ae2c-48f8-6c4d-08def15c22aa
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 12:38:35.5102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YTuzRubtz9TI7uZRRLM4NM//9HRDYiJS0hcmc2Rb7mO4FrvyU2CU1s6rWss/0r9PwRfI7gkL3u36sz2EfK2DAAx/EFP3Agl1kaV614C3fDQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB2229
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 12:38:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128682

configure.ac uses AX_COMPILER_FLAGS, AX_PROG_JAVAC and AX_PROG_JAVA
from autoconf-archive, and autoreconf regenerates aclocal.m4 so the
copy in the tarball doesn't help.

  | configure.ac:61: error: undefined or overquoted macro: AX_COMPILER_FLAG=
S
  | autoreconf: error: autoconf failed with exit status: 1

Works today only because relp depends on libidn which depends on
autoconf-archive. Depend on it directly.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
To reproduce, ptest needs to be off (otherwise the librelp path
masks it):

  echo 'DISTRO_FEATURES:remove =3D "ptest"' >> conf/local.conf
  bitbake rsyslog

 meta-oe/recipes-extended/rsyslog/rsyslog_8.2606.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2606.0.bb b/meta-oe=
/recipes-extended/rsyslog/rsyslog_8.2606.0.bb
index 0487259c9f..12036e32a8 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2606.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2606.0.bb
@@ -9,7 +9,7 @@ Rsyslog is an enhanced syslogd supporting, among others, My=
SQL,\
  encryption protected syslog relay chains while at the same time being\
  very easy to setup for the novice user."
=20
-DEPENDS =3D "zlib libestr libfastjson bison-native flex-native liblogging"
+DEPENDS =3D "zlib libestr libfastjson bison-native flex-native liblogging =
autoconf-archive-native"
 HOMEPAGE =3D "http://www.rsyslog.com/"
 LICENSE =3D "Apache-2.0 AND GPL-3.0-only AND LGPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D51d9635e646fb75e1b74c074f788e97=
3 \

