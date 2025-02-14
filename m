Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F81BC02198
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 08:52:08 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.51])
 by mx.groups.io with SMTP id smtpd.web10.17062.1739523125471391807
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Feb 2025 00:52:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=Emvdo3Mj;
 spf=pass (domain: prevas.dk, ip: 40.107.105.51, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gwqepn0UeavnQ0w/uTUcapk1f6AF/OelBeSd4zgRB5JhR+3pc8G4KlPgMDkpBAIe9j00YrDZnj5rNhRURBxqM8M0AF/Ad90vWjzMgUUaehr0EzlEu33yX69BH1NkUCk9Hx+LBImGDLvwcpLmZu4QI0Q2ZJUGeePp5UnGHjdU8a3DAhy7Pq6hNo5MGMXZu+2GHxtoO9RjlZQTCURCF4J1h/2HZkPIBqk6GXL/f/WBo/dtZrLua+PPWZLIaRhRH5pNdJmnbTdcZBDhAC5sIW39AGBeQNms8bfpV00ak5fWRJFWnLlpHX90fRw/Cxj1O6ICEB7wt9IpdEKOKEVFWsKGKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZbkmF+EODv8RjkcoPWij15X3RQa71VGEtsoCAetjWg=;
 b=BA1+Sdf8muKQ8aUDaZ+uk7bvVdYQSpGIV5Vh6J1fw8WmRDivyoX0gNHpgXZ5ZBJh60JVlPnHFNAHf3HdhD5hd9FswTlr6HmM6Z9oXT/+Cx2DE0lw8di1CsNqRCFalMeYQ2APQHpCYKaBb1l74l4Ci5FZIes3PJTiltC42Cr4E1MkWDIkgjuDr8W1HNIaHQJdT06ViNXexsw+OPaYubJ3xSV4RWe2TCRBHiSKdYLfxcitXy5OUIu8rHHlNUR/WwW2KSUQj9NfsegqRRiXqQ2v9K9NWb97aCQtI8SbX/niExpDZCdGC4y+PeXMVm/u9S3CMWMb0w5AYjXdhdxgwjWeBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZbkmF+EODv8RjkcoPWij15X3RQa71VGEtsoCAetjWg=;
 b=Emvdo3MjsGbn5Y1Iqw7lf5me/0hGFvzy5IFlgWpBLXXnZFPUOAJHKTO4ty8VGKW5TSTPzgZZ80qvErQHdTHZ/BUp/acZi/s2lzkeC8+dshsJWBVysl7tGly/IEqQTYu1zkdiP+ecpY4Dv3vLu/X66qb4cBOcduOGabdCHHajkIA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:41::17)
 by PAVPR10MB7540.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2f7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.10; Fri, 14 Feb
 2025 08:51:57 +0000
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4]) by DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4%5]) with mapi id 15.20.8466.008; Fri, 14 Feb 2025
 08:51:56 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: openembedded-devel@lists.openembedded.org
CC: Khem Raj <raj.khem@gmail.com>,
	Rasmus Villemoes <ravi@prevas.dk>
Subject: [meta-oe][PATCH v3] systemd-netlogd: new recipe
Date: Fri, 14 Feb 2025 09:51:52 +0100
Message-ID: <20250214085152.1273827-1-ravi@prevas.dk>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0068.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::35) To DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:41::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR10MB2475:EE_|PAVPR10MB7540:EE_
X-MS-Office365-Filtering-Correlation-Id: d8725499-985f-411d-ff72-08dd4cd4d632
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gOekZk8Sqh5j7/34eNc7B6pBV6krIldp/RJzD6IK16tPRfATEZMjhFheUlH2?=
 =?us-ascii?Q?MTQEpGd/rlBP+8hp8fwwKaKLoeziJhMayWB23pA10IPra8iGrhhwnPZcmZhV?=
 =?us-ascii?Q?9QDZd7afaXBgV16J/fnYzIytENmkzK5iR1WhxL1Mf0QYWTxo/xD6bkZ+60Y8?=
 =?us-ascii?Q?wsHjUAHKTQJ5N/6ht+VII8CBI4OhQWUbIYzLX1do9JHjJ2SqnPFFO+Z+xkXa?=
 =?us-ascii?Q?WZoTY1W64lMBJZGAr//p7/Vo7lG3ub00CzMldafzGks09TywsXR4jo7W54lX?=
 =?us-ascii?Q?s/KChhnXPodSKEZgWDUPa3Mx2MEp2m6ieH6d5TQxN3550rdNDzRw040z5MPx?=
 =?us-ascii?Q?JCwTrLSj1LUY7kqb5alvC2h79Dkt/rH0jF016kU1fbktUH8wOxEruqE3l99g?=
 =?us-ascii?Q?ZMUcbMq4DHz5aC55d9Hi8ByA+YpqxEXvjYtLMDO/qan7CGaZjwcFfa4LMykc?=
 =?us-ascii?Q?Jl8uURCVKN0WqNtog+PqkUxVbN4GouYM2xg9BUNHUIRzn4sFf2zZ8pzDQyqW?=
 =?us-ascii?Q?PYaTjHASeZIDrJDqcoSDp6TNdxwlHCEw2jIoJN25UwPt5NRDDgvzoxq2egkc?=
 =?us-ascii?Q?8eYUueTBluqh/0Ucnsoh9PmS25AYuWngletokY2zdbxCqreSa3ucKRH4maFc?=
 =?us-ascii?Q?+g68sTzHyvJJub6V79L5pZySwd0y2EnErJXu8jOs/RHlTuwG4XEVGU9TD+ik?=
 =?us-ascii?Q?aToeM5865SnBeivRU07dPRUJP6pOiuH2cfxS2SwkKwoM0+PtgG/rA89AXQ/I?=
 =?us-ascii?Q?Qgp9whpKeob2ytKxzrjR/rvcFAttoC+AIKXdbhc6S2sLTeB+F4l+tfcO2G1J?=
 =?us-ascii?Q?s/AtdOvASQYuVnpu+5tHppyn3UGTAe4oVmls10K488fA7lOz2HSC13mxZ1Nd?=
 =?us-ascii?Q?GN7h2lN6gdgGYRmgDc0vJg7SVZbO9BfopxgbJFf9PzPjGMr7nOY5965jFCHZ?=
 =?us-ascii?Q?ME9URkTkJMU9+aipwD4LPXYNt7ja27fbssoEA+zR6l6pq7Uzb9qE85EB3iQf?=
 =?us-ascii?Q?KqXEORgs2qZnPq2THqdGcJ/hlEZJFH/KwNbVMYtwEsDgz/n3fxDDvncPCq8d?=
 =?us-ascii?Q?JbWbEQLNVc2/fbSxkCDzY0PtWvItx5tfdAL7MjEkIRrf1nSvXgVTcSbXHG+J?=
 =?us-ascii?Q?ISgLRs+CMOljg/KoGAg3PQJbnM4nCgp312sQBQw5nUs5tGdgrLNjXHYkWhdL?=
 =?us-ascii?Q?wR/pj00x3D9WoxiKu1lDzGEBQoRqzvAHHIYCkBEjB0SJ1tU4ARAprs7scNjj?=
 =?us-ascii?Q?EopmJzhja+AtAXt2GpTKwr1ls/909TFz9yhZyhiCO3Z64PCP2/3knOtLpG9V?=
 =?us-ascii?Q?8k4GENaOK6T1pfNgfBoCOL1xymmdnRlfmUOXIQ1jYr5eT8eASMXcIyBFhy6v?=
 =?us-ascii?Q?bdbOvQEuX4qVA3w19oLbB4+lbjASg01zMziB9/e25WkdR+XvDINqJatVvyv9?=
 =?us-ascii?Q?RyBhJrdYSh0/zLfrml45eGyIIfpsuTB9?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LOORcoq0eO+wkNFHMOiP5hMvtRq+MEZpjqbJk4MRGsU4E5SpCk2huLP1jWnu?=
 =?us-ascii?Q?C0i+4Nt2jEmybWmjh8otk6NRi3rY88IZFxmSuD+sHU1qTwK0cUvUip7WGvNG?=
 =?us-ascii?Q?nCqMit/r33OWzE/8VP+hL/8HAW3Kz5TlRlnQEIqyY0H0x5heZeTBN7M0HwWe?=
 =?us-ascii?Q?Vb29uK4NDA0lcV+aUG74M1OIHKd5K8JTR1HxLphrcy1axLFFTDPggQHBPCuv?=
 =?us-ascii?Q?886fxJ8V0UOsgkXe8Ul2jF0mD5toaWcPshHvVuZRjWmFcK9+MHMSnVGEN3sz?=
 =?us-ascii?Q?PHo784WVxSWmRgHtCKVjK+o+i6Q0G3NJ8wXvQRz+lizHYpEYgkYR0kk7ISaM?=
 =?us-ascii?Q?7oZqbOjSlWLQWTGY09VkxLkSi7ir/rv8iUMAwRtTbjQM0y5ok9DpE3o6TKgO?=
 =?us-ascii?Q?shE77/tFCh9AjENWVVzlEYlxKLBwXflYJwRChW4KoW1AiEj1V7ZXIYTHtHUF?=
 =?us-ascii?Q?YSqyUhY9CZZtRBv3nd5QniF0BBaZx+eQM/ToTu35MM0verr80VqSavoDzgnk?=
 =?us-ascii?Q?MGwaoVUzFMwxewa1kA2RMOokm4lInFarS8dgqSdjX9Beno7ge92rNV82I8Yv?=
 =?us-ascii?Q?QqLLpEkXSRWE/7jo8+dwhVhLFYiEX/eCmo8jC6MXpzF4QqiRk9Wqg0aktA5m?=
 =?us-ascii?Q?8Xwy7kJA2TZ7KXP6C46fFagAkkpwmQVspB9U2KqChReisCGepev/xWo5gRFs?=
 =?us-ascii?Q?SO5S8KI65o3EsXBWOVs+EEiroYzB3qmmIMI53Z9iSZ0tbROLDhG8WvanYfUy?=
 =?us-ascii?Q?OrmJzl5zQQDtdQdKgtp6VAAYLfXW0n4GhLvMa28S0MFCkUUu89uV/qHZQQiI?=
 =?us-ascii?Q?bvWECd4TU3ok8CyaUxLnNr9IjKGB6vzDIMAMocH+fy1q0v1QWTqBCv8Y+aSx?=
 =?us-ascii?Q?ZTeYcRkxJc3WbX7tRgcrWvwlZWPF1Qt2LSzHfvTc6zMxTqcmWZamMqWTlb6V?=
 =?us-ascii?Q?7ppOjXr3CgfEIF2tvBjq6SjxnH2DSYIb3KR/eJnQ+Emp0a+ouOO/lrmrQdvS?=
 =?us-ascii?Q?mMM608lqjlEnLKPGq4F4f5ALyfo1AS9WmyCI0w+haUZLz/vyPpZTqrk7fSDb?=
 =?us-ascii?Q?AfgtS2ENwiDVv1U0Am/h5WwVMkaW61fvSxSnRNJF7RTBuINfQAPv/0iJHzMW?=
 =?us-ascii?Q?l82UCNttBKZNco8SZ8S41zYFGIb36Bz5gl4Pav+aiiVfFSR133Gwctmn4WTX?=
 =?us-ascii?Q?l5q5aG+ZB+/erRZesQKga/pwF4qq0UgYf/Wjk9StWn7Pspc/bSuFFq+mfe/v?=
 =?us-ascii?Q?VdasU2YylxeTGWypKFoOerZC2/nU9j1Z+hiKZtoQB6mD7MUipqcXuEf+QBkE?=
 =?us-ascii?Q?lP1njJeD9o8x4vMSmnJPGX6K1lB9k8U1UuFdaq/8VeG2C7YxXZcax86TgNFZ?=
 =?us-ascii?Q?RqamZfy7IY3Y3AW4whpqKSOfiw2boc7X9KEB5EvzNClwZGB6tSeshpXHsS8L?=
 =?us-ascii?Q?ojxbzl9Zr0wYnly8KXGtgJavjaVByAjSlFaeq4820Otamxe8QYaI5C08rXzZ?=
 =?us-ascii?Q?bnmr3Fa/7GH+j6AdEnw+JT0NrXwalXP2DHLzHIqSY3L5yNJf/Ok8JynMkFur?=
 =?us-ascii?Q?dlQQdAxgkNAkrRoFalXTH8AfRRhgaKiWEI4JiJ5Z4KfDVCa9yCAR5UTkv88V?=
 =?us-ascii?Q?tA=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: d8725499-985f-411d-ff72-08dd4cd4d632
X-MS-Exchange-CrossTenant-AuthSource: DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 08:51:56.8451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ivzC0meJ2EicIJM5V/cTE2wmQsrr9BdoPI9R+4+RdLb2m4iT6hDUNqkVO/vKb9lwYq4KrK6Nr25MLQhPp/3YprGvjME4mQv7DkLe9C7HOK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7540
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Feb 2025 08:52:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115482

From: Rasmus Villemoes <ravi@prevas.dk>

In some deployments, the log aggregator collects log messages in the
syslog format, so systemd-journal-upload and friends can not be
used.

systemd-netlogd is a daemon for filling that gap.

Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
---
v2: add systemd as required distro feature
v3: also inherit the features_check class to make that have effect

 .../systemd-netlogd/systemd-netlogd_1.4.4.bb  | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-support/systemd-netlogd/systemd-netlogd=
_1.4.4.bb

diff --git a/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.=
bb b/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.bb
new file mode 100644
index 0000000000..f95cfdb418
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
+inherit meson systemd pkgconfig useradd features_check
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


