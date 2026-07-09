Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 825F2C43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 11:11:50 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6799.1783595504793123148
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jul 2026 04:11:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=k2BOEEJu;
 spf=pass (domain: est.tech, ip: 40.107.162.31, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bbT1sruwKdMstxJeUhs0ivkp8VbPHq9GoPEe94/w1n/P2Tncpe1riEpwUopwa1qZA3WzWZ+LpEIEp8Ucpep8ZHF/tC/LGopcd1W+zxASK+WYteHPg4t6fZ5gLPhDTlrYy2oXiXUDOekiB7L7EfQMOqIxsVKTnOw5PDYKxCpE32ZvkjxVgkpQuKWn1QrNPeYjZLywFrrWrlrTG5XXSgwi/d9u25ofZOKvDY+QaUdlx4PBIymRvW3N8DdsNtqniENFb/UG2kO6XYwUGjj/C6lDmZvPHYPoNxTZwJbhvJK+Wc+/0SmlP9O6xJ8d4FP8i8wol58KH1FK3J3kfY1MAF+zgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KniU847vw7R6dEJXGkiTK2y7EfT5TQtM8hiyVNs318Y=;
 b=r55mqXbQ4zZH39TdO/o9juk1Kr53mM6SeWt3Flha5p6NlpV8/NrfTZplxuaBG0+YoftFTmOuWgq+LoY1wtG7X4nsjrsjCGVodwhYs+2NE2f1aImQIq4vE6u9eREJ9/qeZI5yFhnVakc+fTQP/sazLeH3pRBve3i3nR0nRlNxJWMsT4AqCR2ThpuWirPCGrdsNhw4gjsZvWynVa5z2CK/Uf88M/eI/Hc4JezULhwPO0P4AmjoxRalcbDM8027ZNjZJlBAvCtrHIC4X5Ei/W9Jhd962F1nQydAEV2bsspXuRJDdNVt1h3PEuC/QQdTDjajmQkJpdLrrjpBW8QB/oXEKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KniU847vw7R6dEJXGkiTK2y7EfT5TQtM8hiyVNs318Y=;
 b=k2BOEEJuunikTOdEELX1nqwQmvPhKn0Z430SYC/nYKtt3b643brAVy2kTGLcETbkI3dA3KQAUiJta9XRPEyua050/ConYD7St8Gn5Rght5a5Qsx1HHXEYqIXONsJvkrBL3xfIrkmXt2uu6ecU3z4pxhABh+9PfWTaUGGmDYLPVc0GKSQyIvRhAzZKI8GLLhdkRCkLI/McoetNPpboSeMNG+TmAfHm6ApQK9V7MDi76fuTxMDaTkRvTIu/qHpZ3FB2FiSzINLNjjPJteHXmYhQ3iBUmTPnlFHKNrqQiEH7qG9Euo4CN1vxMwhRA2lQv/N8b/XIUyO5OO4FvnFIN+vaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB8P189MB0732.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:127::14)
 by DU4P189MB2718.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:566::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 9 Jul
 2026 11:11:39 +0000
Received: from DB8P189MB0732.EURP189.PROD.OUTLOOK.COM
 ([fe80::6c51:738c:1290:f77b]) by DB8P189MB0732.EURP189.PROD.OUTLOOK.COM
 ([fe80::6c51:738c:1290:f77b%4]) with mapi id 15.21.0181.012; Thu, 9 Jul 2026
 11:11:39 +0000
From: Roland Kovacs <roland.kovacs@est.tech>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking,scarthgap][PATCH] radvd: fix CVE-2026-48715
Date: Thu,  9 Jul 2026 13:11:37 +0200
Message-ID: <20260709111137.129370-1-roland.kovacs@est.tech>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P194CA0017.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:10:553::6) To DB8P189MB0732.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:127::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8P189MB0732:EE_|DU4P189MB2718:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b1bef89-ca04-4dd3-0fd4-08deddaad980
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|11063799006|56012099006|3023799007|18002099003|25016099003|6133799003|12006099003|29003799003;
X-Microsoft-Antispam-Message-Info: 
	lfNUsneqm/GD/QQqLX8a8GUjnfnff6TGQH3ifg80esNnu7i9PPaHHbt5gO1tK7Y48xQgz7Juze+sO0pM7r+DNHOVkcuQysJJNpI0oryv9fRlxUrNjOOEq/KezEM/LAvyf3cj36+90xDqOW7rkOKW7Hm4xmOWVOyRqFf/sBOritqI5GtnC+7/svefu9FV+03S2iJrOQukpX7NwcjgZhmNt9CtXzHVtvYTsAf/tJbR9dJZIBpHbD6uLV25J1foWwE+XrNfH2IKrFi2dgfsPA/HaqGu2vWu4YONZ16NBnq9Qeol7NPCW8aI+aVvNuP0ymEjSY8qxMDIUvMtmGfMDGiUPS7d7F5iLuh7/ZMxEdDSeTP2ScJ3tiVTcsiY9C7CB7m/SaAGtFoRaRX9reuY6uIC3E2ArTQ4eDkLSUqI47QeNF3xkcluJ92R2W3YJOrzxTP7QkIF+DY6Q3iE42SdjlG5B8y5ss9HVwlXB1IHdAomc4wQrFWOoTKVDt99pEmCMoBxbp8fCzrfR4ZaYA1Yt3t2HnVCrkkArvLcyC2UWNFFFAtghOGbrjubsMVNBTZ19zmLPtWhqL0PtsYlvhLxST3S5zTG0ADWEFK6nYroemplSReVTQb2b6a4QzTWkc9CJYkrfiftBdCF5kbA5jhDZt/25fNbAGAbHUlqOYWta9uBZkw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8P189MB0732.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(11063799006)(56012099006)(3023799007)(18002099003)(25016099003)(6133799003)(12006099003)(29003799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zmXK9Fqtif5ovfO9gtiZMobN3TJJBqZPUh79yksw8WEER1p8qyYKzQDEIjpH?=
 =?us-ascii?Q?R/hu5o39PIEP355JKhZ5l1pdaErc8zAg6ErfpudhWvpkbF8ExxAORD2D3W6x?=
 =?us-ascii?Q?k3wSrZfBGy+zsEUkf4hd7EfndswwSSsu8eZwOTHbFnKiTYCBYwGA1D+anlN3?=
 =?us-ascii?Q?2cAOaV21wWu6m/oH6Jt2vOVXKz42av2p0To0Qqje/AVywHF0/lWOgOKvWsBU?=
 =?us-ascii?Q?gYDQfP/LCBwLpz4AFBVAdfQKTKX96l+XqHkcLgP0zTfrBF9OFs5b0AFQ9AfO?=
 =?us-ascii?Q?zdv5E8dvWJNPoMlK/8m3+fjHQs4K/ar9GjXzj21/ZBbZsY5I/L7HUl4nW340?=
 =?us-ascii?Q?riN22NVfqYNRYp3/PNPQhti6kXbwyWaV6/N8WuLdrsFnFFUq9OfNVQDbKd5q?=
 =?us-ascii?Q?rPeSN1W/dO8U+BuNfRVuSMOYLIajZ7p73ZnRTaw/BC1vwAyK3aiZCRVjWAvG?=
 =?us-ascii?Q?WUa49o+vXdi+Kp/M85nXlo5BUgrhcrqAKgM1vMhdiGL3D6k7CWrxc74DMKkW?=
 =?us-ascii?Q?i69IbB00S8o9INtqwJ1UiB3hCZflQve2IMIOTjV60v0WCfIkY2D2Sa73QCH+?=
 =?us-ascii?Q?T+y/EFu2zj5sNpTPGujwTPb5jJDGpttk/PoyQ6mOCR2npWnwPT17QwJrrcLN?=
 =?us-ascii?Q?nXNAIlOyDCcM/G+TPaC3qK28tTzdhczmuIsPMUbARoD83NV4PxMAHQqIxcRO?=
 =?us-ascii?Q?xHq8M6oTs2NUM4XYWRnlapdgnXI0ddUXE6ClZlbWgmH9Xgmv7SMhc0pL/Dr4?=
 =?us-ascii?Q?WcFhiaibrgSyUELEX8MOJbA61glufqEhXiGGJW4FwVp8dOMUqKObJmgHDir9?=
 =?us-ascii?Q?BgbQpAczi/ALgvsm3vP5S29tB4Yjf/QnLNJiJfJx7LGxfZ9YS+JeRANXftOV?=
 =?us-ascii?Q?c5mMFq4SAV0VypC3RZeSAft1Jz/6vP891g9jj5tc+FMBG2osBv5noh9xTUJa?=
 =?us-ascii?Q?5MpEa8WRiQPH8BH7UEIanpmFzl7r2gp+l1/G8RGyycfp96HJfR64MxyI6sEW?=
 =?us-ascii?Q?LATjOx9LntBCNsZ0zAhrVaFlVwSlf/8kcce4R/UDSEN6HFgUU71ovrRgVy+G?=
 =?us-ascii?Q?qQWVQq30aQiuJmCl+AMxgMXnIRzfdMLbSm1AzhP5eOUhtD2BQY/5Bz/LnTFk?=
 =?us-ascii?Q?Bihs9XeqRv0FQV00kV6omFc1BreDlZRyiFZ/D6bUaFnJk533P2opaVCzHIiF?=
 =?us-ascii?Q?AwKZOG+e5PEidsatbYfb2e7EsDUET9ghmOxzyHDQUZ2j4PJaPXUvtHUzJnKI?=
 =?us-ascii?Q?FugOOAx9EvgHvNL/83N9I4JMe3kQqw6OjCdA2ovZy7i4gS1zFmaYlteu1V8h?=
 =?us-ascii?Q?EzSl3YqGMkiIplIY1qxK6X7dAgN3666kP5dx42ZJwnS4FmYJqvYUQkrgoE60?=
 =?us-ascii?Q?ZDPVtsEWe+2b/JRZG5gaDsev53MqX3yiTil5ycmtV1ljCR7wdPBqw/yK6g0C?=
 =?us-ascii?Q?OghB5lRoR+yO0pzRXKmlque3znUwp5dJbWPOSuQMG6eyKvkQYbVv6am77rce?=
 =?us-ascii?Q?wWbPCxRcKVYGfNYMx053uosIpHKrc5V01bL1rsVm3uBk50dMubnw5HeYWXCl?=
 =?us-ascii?Q?UotNKOWdH2SFQkdunoyrIpay9ALglHShRl2991cKc0Uw63k+S3RtG6P3bGHj?=
 =?us-ascii?Q?LImZMwrS+ymT5tQ5HVbOcf86eUmEPiwIB5JnseOWLKI/198kpc4s6lKms8BQ?=
 =?us-ascii?Q?1qZi8zXVghMpMuhtKjpeJ2SgfJuu/5D6ofAxPJuXscs54e35wPXTxH3wfhg7?=
 =?us-ascii?Q?a/EyxDZc/g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b1bef89-ca04-4dd3-0fd4-08deddaad980
X-MS-Exchange-CrossTenant-AuthSource: DB8P189MB0732.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 11:11:39.8040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bD5JxGbUbepoVi2xGtV6FXRcOYaow1q1rTLQuyVYIkvaZYdDXn9fJYwzLGYJ5XejpMrigjpfLd8B2WislvfsnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P189MB2718
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jul 2026 11:11:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128117

Prior to version 2.21, the `radvdump` utility shipped with radvd
contains a stack buffer overflow in the Route Information option
parser.

When processing a crafted ICMPv6 Router Advertisement, `print_ff()`
copies up to 2032 bytes from attacker-controlled packet data into a
16-byte `struct in6_addr` on the stack, overflowing by up to 2016
bytes.

Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
---
 .../radvd/files/CVE-2026-48715.patch          | 213 ++++++++++++++++++
 .../radvd/files/CVE-2026-48715_dep.patch      | 106 +++++++++
 .../recipes-daemons/radvd/radvd_2.19.bb       |   2 +
 3 files changed, 321 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/radvd/files/CVE-2026-48=
715.patch
 create mode 100644 meta-networking/recipes-daemons/radvd/files/CVE-2026-48=
715_dep.patch

diff --git a/meta-networking/recipes-daemons/radvd/files/CVE-2026-48715.pat=
ch b/meta-networking/recipes-daemons/radvd/files/CVE-2026-48715.patch
new file mode 100644
index 0000000000..e15ae4aaba
--- /dev/null
+++ b/meta-networking/recipes-daemons/radvd/files/CVE-2026-48715.patch
@@ -0,0 +1,213 @@
+From 44c72b548ed11da60ff3b8d43711e74d64032526 Mon Sep 17 00:00:00 2001
+From: "Robin H. Johnson" <robbat2@gentoo.org>
+Date: Sun, 17 May 2026 15:52:03 -0700
+Subject: [PATCH] feat: harden radvdump (CVE-2026-48715)
+
+- drop root after startup & validate
+- ensure buffers are zeroed between parsed packets
+- Jumbo packets were truncated in parsing due to outdated MSG_SIZE_RECV
+- Route Information option length field was not sufficiently validated
+
+Thanks to @TristanInSec for finding the Route Information
+length validation issue.
+
+Signed-off-by: Robin H. Johnson <robbat2@orbis-terrarum.net>
+Reference: https://github.com/radvd-project/radvd/security/advisories/GHSA=
-52px-gh9p-m379
+
+CVE: CVE-2026-48715
+Upstream-Status: Backport [https://github.com/radvd-project/radvd/commit/0=
68bde13e3fd6a5fcdb6859e6a2acd293a325dc5]
+
+Changes: Added the missing '-u username' argument to the help output.
+
+Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
+---
+ radvdump.8.man | 10 +++++++
+ radvdump.c     | 78 +++++++++++++++++++++++++++++++++++++++++++-------
+ 2 files changed, 78 insertions(+), 10 deletions(-)
+
+diff --git a/radvdump.8.man b/radvdump.8.man
+index ea9932c..25dbad8 100644
+--- a/radvdump.8.man
++++ b/radvdump.8.man
+@@ -20,6 +20,7 @@ radvdump \- dump router advertisements
+ .B radvdump
+ .B "[ \-vhfe ]"
+ .BI "[ \-d " debuglevel " ]"
++.BI "[ \-u " username " ]"
+=20
+ .SH DESCRIPTION
+ .B radvdump
+@@ -62,6 +63,15 @@ debugging level of 0 completely turns off debugging.
+=20
+ The default debugging level is 0.
+=20
++.TP
++.BR "\-u " username, " \-\-username " username
++If specified, drops root privileges and changes user ID to
++.I username
++and group ID to the primary group of
++.IR username .
++This is recommended for security reasons.
++Defaults to "nobody", pass "" or "root" to not drop privileges by default=
.
++
+ .SH FILES
+=20
+ .nf
+diff --git a/radvdump.c b/radvdump.c
+index 0a20272..a939970 100644
+--- a/radvdump.c
++++ b/radvdump.c
+@@ -17,11 +17,18 @@
+ #include "config.h"
+ #include "includes.h"
+=20
+-static char usage_str[] =3D "[-vhfe] [-d level]";
++static char usage_str[] =3D "[-vhfe] [-d level] [-u username]";
+=20
+ #ifdef HAVE_GETOPT_LONG
+-struct option prog_opt[] =3D {{"debug", 1, 0, 'd'},   {"file-format", 0, =
0, 'f'}, {"exclude-defaults", 0, 0, 'e'},
+-			    {"version", 0, 0, 'v'}, {"help", 0, 0, 'h'},	{NULL, 0, 0, 0}};
++struct option prog_opt[] =3D {
++	{"debug", 1, 0, 'd'},
++	{"username", 1, 0, 'u'},
++	{"file-format", 0, 0, 'f'},
++	{"exclude-defaults", 0, 0, 'e'},
++	{"version", 0, 0, 'v'},
++	{"help", 0, 0, 'h'},
++	{NULL, 0, 0, 0}
++};
+ #endif
+=20
+ int sock =3D -1;
+@@ -39,12 +46,14 @@ int main(int argc, char *argv[])
+ 	int opt_idx;
+ #endif
+ 	char const *pname =3D ((pname =3D strrchr(argv[0], '/')) !=3D NULL) ? pn=
ame + 1 : argv[0];
++	char username[256];
++	strncpy(username, "nobody", 255);
+=20
+ /* parse args */
+ #ifdef HAVE_GETOPT_LONG
+-	while ((c =3D getopt_long(argc, argv, "d:fehv", prog_opt, &opt_idx)) > 0=
)
++	while ((c =3D getopt_long(argc, argv, "d:fehvu:", prog_opt, &opt_idx)) >=
 0)
+ #else
+-	while ((c =3D getopt(argc, argv, "d:fehv")) > 0)
++	while ((c =3D getopt(argc, argv, "d:fehvu:")) > 0)
+ #endif
+ 	{
+ 		switch (c) {
+@@ -59,6 +68,9 @@ int main(int argc, char *argv[])
+ 		case 'v':
+ 			version();
+ 			break;
++		case 'u':
++			strncpy(username, optarg, 255);
++			break;
+ 		case 'h':
+ 			usage(pname);
+ #ifdef HAVE_GETOPT_LONG
+@@ -83,12 +95,29 @@ int main(int argc, char *argv[])
+ 		exit(1);
+ 	}
+=20
++	if(strncmp(username, "", 255) =3D=3D 0 || strncmp(username, "-", 255) =
=3D=3D 0) {
++		// Must opt out of security
++	} else {
++		if (drop_root_privileges(username) < 0) {
++			perror("drop_root_privileges");
++			flog(LOG_ERR, "unable to drop root privileges");
++			exit(1);
++		}
++		dlog(LOG_DEBUG, 5, "running as user: %s/%d", username, geteuid());
++	}
++
++#define _MSG_SIZE MSG_SIZE_RECV
++#define _CHDR_SIZE CMSG_SPACE(sizeof(struct in6_pktinfo)) + CMSG_SPACE(si=
zeof(int))
+ 	for (;;) {
+-		unsigned char msg[MSG_SIZE_RECV];
++		unsigned char msg[_MSG_SIZE];
+ 		int hoplimit =3D 0;
+ 		struct in6_pktinfo *pkt_info =3D NULL;
+ 		struct sockaddr_in6 rcv_addr;
+-		unsigned char chdr[CMSG_SPACE(sizeof(struct in6_pktinfo)) + CMSG_SPACE(=
sizeof(int))];
++		unsigned char chdr[_CHDR_SIZE];
++		// safety; completely zero buffers for each receive
++		memset(&msg, 0, _MSG_SIZE);
++		memset(&chdr, 0, _CHDR_SIZE);
++
+ 		int len =3D recv_rs_ra(sock, msg, &rcv_addr, &pkt_info, &hoplimit, chdr=
);
+ 		if (len > 0) {
+ 			struct icmp6_hdr *icmph;
+@@ -120,7 +149,7 @@ int main(int argc, char *argv[])
+ 			} else if (icmph->icmp6_type =3D=3D ND_ROUTER_ADVERT)
+ 				print_ff(msg, len, &rcv_addr, hoplimit, (unsigned int)pkt_info->ipi6_=
ifindex, edefs);
+ 		} else if (len =3D=3D 0) {
+-			flog(LOG_ERR, "received zero lenght packet");
++			flog(LOG_ERR, "received zero length packet");
+ 			exit(1);
+ 		} else {
+ 			flog(LOG_ERR, "recv_rs_ra: %s", strerror(errno));
+@@ -202,7 +231,8 @@ static void print_ff(unsigned char *msg, int len, stru=
ct sockaddr_in6 *addr, int
+ 			flog(LOG_ERR, "option length greater than total"
+ 				      " length in RA (type %d, optlen %d, len %d)",
+ 			     (int)*opt_str, optlen, len);
+-			break;
++			// Do not process anything further in this RA.
++			goto end_of_interface;
+ 		}
+=20
+ 		switch (*opt_str) {
+@@ -289,7 +319,8 @@ static void print_ff(unsigned char *msg, int len, stru=
ct sockaddr_in6 *addr, int
+ 			flog(LOG_ERR, "option length greater than total"
+ 				      " length in RA (type %d, optlen %d, len %d)",
+ 			     (int)*opt_str, optlen, orig_len);
+-			break;
++			// Do not process anything further in this RA.
++			goto end_of_interface;
+ 		}
+=20
+ 		switch (*opt_str) {
+@@ -345,6 +376,32 @@ static void print_ff(unsigned char *msg, int len, str=
uct sockaddr_in6 *addr, int
+ 			} else {
+ 				struct in6_addr addr;
+ 				memset(&addr, 0, sizeof(addr));
++				/* RFC4191 section 2.3 (reformatted)
++				   Length      8-bit unsigned integer.
++
++				   The length of the option (including the Type and Length
++				   fields) in units of 8 octets.
++
++				   The Length field is 1, 2, or 3 depending on the Prefix
++				   Length.
++
++				   If Prefix Length is greater than 64, then Length must be 3.
++
++				   If Prefix Length is greater than 0, then Length must be 2 or
++				   3.
++
++				   If Prefix Length is zero, then Length must be 1, 2, or 3.
++				*/
++				if (
++					(rinfo->nd_opt_ri_len > 3)
++					|| (rinfo->nd_opt_ri_len =3D=3D 0)
++					|| (rinfo->nd_opt_ri_prefix_len > 64 && rinfo->nd_opt_ri_len < 3)
++					|| (rinfo->nd_opt_ri_prefix_len > 0  && rinfo->nd_opt_ri_len < 1)
++					) {
++					flog(LOG_ERR, "Invalid Route Information option length %d from %s", =
rinfo->nd_opt_ri_len, addr_str);
++					printf("# Invalid Route Information option length %d, per RFC4191 se=
ction 2.3 ", rinfo->nd_opt_ri_len);
++					break;
++				}
+ 				if (rinfo->nd_opt_ri_len > 1)
+ 					memcpy(&addr, &rinfo->nd_opt_ri_prefix, (rinfo->nd_opt_ri_len - 1) *=
 8);
+ 				addrtostr(&addr, prefix_str, sizeof(prefix_str));
+@@ -444,6 +501,7 @@ static void print_ff(unsigned char *msg, int len, stru=
ct sockaddr_in6 *addr, int
+ 		opt_str +=3D optlen;
+ 	}
+=20
++end_of_interface:
+ 	printf("}; # End of interface definition\n");
+=20
+ 	fflush(stdout);
+--=20
+2.34.1
+
diff --git a/meta-networking/recipes-daemons/radvd/files/CVE-2026-48715_dep=
.patch b/meta-networking/recipes-daemons/radvd/files/CVE-2026-48715_dep.pat=
ch
new file mode 100644
index 0000000000..eaabb0f243
--- /dev/null
+++ b/meta-networking/recipes-daemons/radvd/files/CVE-2026-48715_dep.patch
@@ -0,0 +1,106 @@
+From 3b7602ee0da3c8313e147e539e0efc01dd34a0df Mon Sep 17 00:00:00 2001
+From: "Robin H. Johnson" <robbat2@gentoo.org>
+Date: Sun, 17 May 2026 16:21:39 -0700
+Subject: [PATCH] refactor: make drop_root_privileges reusable
+
+Signed-off-by: Robin H. Johnson <robbat2@gentoo.org>
+
+Upstream-Status: Backport [https://github.com/radvd-project/radvd/commit/1=
1c92dafc392dab1843964316950e297fbd35d33]
+
+Note: dependency of CVE-2026-48715
+
+Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
+---
+ radvd.c | 16 ----------------
+ radvd.h |  1 +
+ util.c  | 31 +++++++++++++++++++++++++++++++
+ 3 files changed, 32 insertions(+), 16 deletions(-)
+
+diff --git a/radvd.c b/radvd.c
+index 22255b1..e807121 100644
+--- a/radvd.c
++++ b/radvd.c
+@@ -79,7 +79,6 @@ static volatile int sigterm_received =3D 0;
+ static volatile int sigusr1_received =3D 0;
+=20
+ static int check_conffile_perm(const char *, const char *);
+-static int drop_root_privileges(const char *);
+ static int open_and_lock_pid_file(char const *daemon_pid_file_ident);
+ static int write_pid_file(char const *daemon_pid_file_ident, pid_t pid);
+ static pid_t daemonp(char const *daemon_pid_file_ident);
+@@ -841,21 +840,6 @@ static void reset_prefix_lifetimes_foo(struct Interfa=
ce *iface, void *data)
+=20
+ static void reset_prefix_lifetimes(struct Interface *ifaces) { for_each_i=
face(ifaces, reset_prefix_lifetimes_foo, 0); }
+=20
+-static int drop_root_privileges(const char *username)
+-{
+-	struct passwd *pw =3D getpwnam(username);
+-	if (pw) {
+-		if (initgroups(username, pw->pw_gid) !=3D 0 || setgid(pw->pw_gid) !=3D =
0 || setuid(pw->pw_uid) !=3D 0) {
+-			flog(LOG_ERR, "Couldn't change to '%.32s' uid=3D%d gid=3D%d", username=
, pw->pw_uid, pw->pw_gid);
+-			return -1;
+-		}
+-	} else {
+-		flog(LOG_ERR, "Couldn't find user '%.32s'", username);
+-		return -1;
+-	}
+-	return 0;
+-}
+-
+ static int check_conffile_perm(const char *username, const char *conf_fil=
e)
+ {
+ 	FILE *fp =3D fopen(conf_file, "r");
+diff --git a/radvd.h b/radvd.h
+index 2a61c75..4276bbe 100644
+--- a/radvd.h
++++ b/radvd.h
+@@ -341,6 +341,7 @@ struct safe_buffer_list *new_safe_buffer_list(void);
+ void safe_buffer_list_free(struct safe_buffer_list *sbl);
+ struct safe_buffer_list *safe_buffer_list_append(struct safe_buffer_list =
*sbl);
+ void safe_buffer_list_to_safe_buffer(struct safe_buffer_list *sbl, struct=
 safe_buffer *sb);
++int drop_root_privileges(const char *);
+=20
+ /* privsep.c */
+ int privsep_interface_curhlim(const char *iface, uint32_t hlim);
+diff --git a/util.c b/util.c
+index b160cc9..012f16b 100644
+--- a/util.c
++++ b/util.c
+@@ -283,3 +283,34 @@ struct in6_addr get_prefix6(struct in6_addr const *ad=
dr, struct in6_addr const *
+=20
+ 	return prefix;
+ }
++
++int drop_root_privileges(const char *username)
++{
++	struct passwd *pw =3D getpwnam(username);
++	if (pw) {
++		if (initgroups(username, pw->pw_gid) !=3D 0 || setgid(pw->pw_gid) !=3D =
0 || setuid(pw->pw_uid) !=3D 0) {
++			flog(LOG_ERR, "Couldn't change to '%.32s' uid=3D%d gid=3D%d", username=
, pw->pw_uid, pw->pw_gid);
++			return -1;
++		}
++		// If the target 0 was zero; then the later checks would return false
++		// positives. This can take place if explicitly running as '-u root'.
++		if(pw->pw_uid =3D=3D 0) {
++			return 0;
++		}
++		// Validate that we cannot get root again
++		if (setuid(0) !=3D -1) {
++			flog(LOG_ERR, "Drop root privileged unsuccessful, setuid regained root=
");
++			return -1;
++		}
++
++		if (seteuid(0) !=3D -1) {
++			flog(LOG_ERR, "Drop root privileged unsuccessful, seteuid regained roo=
t");
++			return -1;
++		}
++
++	} else {
++		flog(LOG_ERR, "Couldn't find user '%.32s'", username);
++		return -1;
++	}
++	return 0;
++}
+--=20
+2.34.1
+
diff --git a/meta-networking/recipes-daemons/radvd/radvd_2.19.bb b/meta-net=
working/recipes-daemons/radvd/radvd_2.19.bb
index a9b5f79424..7f73143649 100644
--- a/meta-networking/recipes-daemons/radvd/radvd_2.19.bb
+++ b/meta-networking/recipes-daemons/radvd/radvd_2.19.bb
@@ -21,6 +21,8 @@ SRC_URI =3D "http://v6web.litech.org/radvd/dist/radvd-${P=
V}.tar.gz \
            file://radvd.default \
            file://radvd.conf \
            file://0001-Reverts-the-include.h-change-in-46883f8a1a02fe42040=
d.patch \
+           file://CVE-2026-48715_dep.patch \
+           file://CVE-2026-48715.patch \
            "
 SRC_URI[sha256sum] =3D "c36470706fec3a9e6bed394ffea08acaff5dac647848d26b96=
bb9b9c65d58da0"
=20
--=20
2.34.1


