Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 628D7C43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 11:12:00 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.55])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6807.1783595517730988615
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jul 2026 04:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ZJo+QSXS;
 spf=pass (domain: est.tech, ip: 52.101.83.55, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xo2FkOQcETlmRc273RgyRrKTiSWEX1AgYiBZvMp8JaKKMdogUIzzSIZ5cfcyvMrZ5ifAD8BE7XGlr2c0rahnN4aI1BI3PoknaX36XTo9quPPA41huf9AfV2RYYRRZD1UpeGVxVbSscvjR4DwXYNVnWpC8oTsSTx8dau+mNpjfm6s/vdtjEwRVUsd755nKjwfs60D8psjceajHw7EEtPixs+TCYCAfPI46BVwtaqOvxSimSgIKkflDrXUbekmALL7y689ixmh81ZsGKkJI0KthjqBqeTt/1WPOaeiX7G3O59DHRQD3pkU/gdbxxn5eNF288RIkLUBULo/C2WGLjU65g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kkt/e19JNYnROMt+IlCaO0AeGJP1UIS2/E9kcwglpbA=;
 b=i49qudcU/HhXy5B4bOxiZruNvm6Uko642ORBw5YgLLDFOSP+RjCdpPV6XC0MAJCagi4LH3A3jp1lG0dUygXcusbcaETJMcVPOvBB3ftB9q6KouE+U5HIHKKLxgvOp6n/OW9IdmTrx4ngkea2k5hvuv8Eq9kGDPs3/sKuJ0Sr4RAs+6Mz2FLJutH6sJo38eiPimrrpxWXbPuth474KcOaWIJZ5mfU1qhKvQxBHDWC4gM5RCQHjf5wp7S8mig4InfJIujMcYquBwCEOxmsIGIHUE0bCzcUo6AnPmLo9r6zNAN0cTZu7g+jX7lel5zJEK55vqugPxey3Z73SricRoehxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kkt/e19JNYnROMt+IlCaO0AeGJP1UIS2/E9kcwglpbA=;
 b=ZJo+QSXS72zaSWfUKBZRQsI0g2fPjKqsdNnMvrUrUCJFm+mf96eoC4gqIIFCghYH8ojMOoWfZOIvfnX/SbEO1CCxsTl8uUgQSkuGan6M6F1o6JwcrzFLgvoxYaaiW2R7WKqqHi7hNIb5dQnlJNBT+CacKahYJdH79e/GJr7eG2r17BrPZbjTj5DKxH1LGTm8MRsZHtjjziP8HbrUfnTseD7juJtg9C7ITxAR+7Fr8MDkZvYbWiCiEQjwU0T2lK9ySHokxbd/gXuCSjqZqrsCOgjYkH3aIj0lTqJsBBNGEOfVo094oQj0f30ZeILlDTLE2oczatEuvzEsx1a6UzL0vQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB8P189MB0732.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:127::14)
 by DU4P189MB2718.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:566::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 9 Jul
 2026 11:11:52 +0000
Received: from DB8P189MB0732.EURP189.PROD.OUTLOOK.COM
 ([fe80::6c51:738c:1290:f77b]) by DB8P189MB0732.EURP189.PROD.OUTLOOK.COM
 ([fe80::6c51:738c:1290:f77b%4]) with mapi id 15.21.0181.012; Thu, 9 Jul 2026
 11:11:51 +0000
From: Roland Kovacs <roland.kovacs@est.tech>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking,wrynose][PATCH] radvd: fix CVE-2026-48715
Date: Thu,  9 Jul 2026 13:11:50 +0200
Message-ID: <20260709111150.129412-1-roland.kovacs@est.tech>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0272.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::7) To DB8P189MB0732.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:127::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8P189MB0732:EE_|DU4P189MB2718:EE_
X-MS-Office365-Filtering-Correlation-Id: 50d8c2ce-dcbe-4a4f-1555-08deddaae096
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|11063799006|56012099006|3023799007|18002099003|25016099003|6133799003|12006099003|29003799003;
X-Microsoft-Antispam-Message-Info: 
	lfBhUicFN+jIGm7xvS2e30Apho8qLzpIn6wFVMIing4pMREYTQSv7QkpmFkCejc6RtjBC/nGdLGgMN3aLC7LS6ZJz3sT0UrJND8YTY2Gkhw0/aHMd22njYcXk43jvgVIpr7bniPTTkfxOmY89CzOzQ0SAGFlwSY/VR2VsSKO2NCzvbfl6hqw5MteHGo6P04u6upUTQ3mHWpatMgHDY5CjKHulvGkz9eSY+o/j14yBb9S/A/G1ISdox/80dEbF0j5UF4DdG+N4+fOaKx9N7l6dnDQObLzMtqaohA4c6AS+83LCyMtR/MrCFWX7Y+6iLHH80H5RWQ3y1cJ5Ok8oB4fAhf0EmhaX7QfTGCZO9oiIHy7VnhXgix7IWFcux77GfLtTaYGGew67n8xvJ5Tc2oORCenZRj7eiOWsFvforV0yS4vm27zqRjUbW817cc7P3d2mW8FLXkk1x4G92pa1NCV0+valOUhsmEBIl9if6iUcrB+UF/s2RkqQdkRqvZVSQXntc3mZV31CmeWIwdTScIn0Qsqqcj/r7YBTPQb8W4AREWJhs4b5BQaUh6oSCtyw+03JnZaa2+EexzkeeDH1WFtaeP2X7WnIp96TzKhzgWxcEc6/k9qCImNLXp7beIXuhhRVWEtp4gPOYsV5SJ3t4xaEgVB8yLn49BBO0l2bea3jiE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8P189MB0732.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(11063799006)(56012099006)(3023799007)(18002099003)(25016099003)(6133799003)(12006099003)(29003799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IqHIvjdizTpPmlN60lTFDTDJcU3hk3bMpdFVPpka3QJ5KozbfZj7EvQws6bn?=
 =?us-ascii?Q?60Rs+OdUidyHVi9zW5e7CG3YLRczbSO0KBMGFAzqL9oZ8ZBhJ0Xn0GQcZ8o8?=
 =?us-ascii?Q?1FGwnBWb6KW9/lK/eXR9M/KPl/xwyYFfCfurC5PV9VTUzuI5h6sxXNHEer8z?=
 =?us-ascii?Q?xEQAiXwADFyWKYMJKqCvMOAwXq9obr2jnUr/EJvQz7vQa0Jpmi1VZmufkdwl?=
 =?us-ascii?Q?B7W1aEWS59BrSHXg7Nlj6xSKmnLVijiCufROFck3WdFq/06cr2j6AB/V8TZB?=
 =?us-ascii?Q?QsNHkYbqo9mjQgatrzFqGFlI5DsuBfmpzRrmS+W1DdT0GRxprqBAAvqSfXoW?=
 =?us-ascii?Q?FNNaOOZ1NSNuGOwtVejT/2Ho5rsrAmVn9JQj3bIWRmdCKV74aBK/lhbe0U9g?=
 =?us-ascii?Q?3McJM4DUiiD8kqOQ1JYhyGX4vpySVVJOMX9Ll4Shvnl0BQUm8+N88/jEFnCJ?=
 =?us-ascii?Q?9+kJsDe9OatltAuFmCmuzGB70VfiR8kpiw+zVa3Gyr8J/W2Kx8EMCjS+EpNK?=
 =?us-ascii?Q?JkL3QtVe2Wd9INfzQSydg7vvaGxXS9Et62sEHUyJiPZ4hB84ZZ/TcgVkWfAh?=
 =?us-ascii?Q?VWsAiOwC9umZNlCpAQvh4HjYRhnN2q5nVryE3WU0Ji9v7X4DZ3QfWHNuOJy+?=
 =?us-ascii?Q?E1X/ILWLMNfjKaviwcIZ6JtA/QLjoAa/nw5CrvEal5ElUAiyQeNSr0GDG5ew?=
 =?us-ascii?Q?qRshBYo2/voy9HNX/pKb7PugMbkE+UksaO7mAR8OBd5k70JhlheV8WT6eVn2?=
 =?us-ascii?Q?0zB97+J/o1Z6i2tSv3u24tfSaDMNFcBF+e0CNvv22+buPhJ0PuXRTWUbJqjg?=
 =?us-ascii?Q?FQq3TLZ7U33XMaFSDO0QzPPhDG9b2sg7aQS6IGCiVzCmbo8squNZd1c0kVmh?=
 =?us-ascii?Q?VUz+KOoXvUZgJLqntMilj9VQrTS2SVw5HZH5GCBzmUFgsaAwAeLgqi8L5s+B?=
 =?us-ascii?Q?m6eGLnb9JgbWZk5cUNhIzBhG/MPf4HsDomJNk5MsWD80wjZk2npO8FgbZHUK?=
 =?us-ascii?Q?pNuFfbYqwyfYGyvKlWviu+8l+htqqZJucVwJyrhV9UKm6r9+T1Bf/Asjzlk+?=
 =?us-ascii?Q?JPNclMMDXlYDwqEa64GOx9DYmWbyAaj9MfUnRrP0wwzv58Ip7wT2OI6jdkqG?=
 =?us-ascii?Q?NKwR7btTOgFiSR1FumYGGABZPFV2FmV3LaSi5a6xGXy8GSprwaxZUpAU4fQK?=
 =?us-ascii?Q?IFy09nF+LoMezd0TamfCtl9qwIqhpnsUeJ2OAxUONmU3lrQX6YFasOyQf5X/?=
 =?us-ascii?Q?N+M+FbOaTa68gmUfAsUxy3q3xrIwzoIkw5XpNw970qGsnZUeNndBP39+8bjy?=
 =?us-ascii?Q?R1ppB9/u0dXF+q901XcbHUn9MNXgwK8bVYcS5jBwM5ziPw0oSepUusXZNP5k?=
 =?us-ascii?Q?2qWUxNkUm76DV4soUXXAA//TrlGcFIgLlriermYMBNQ4wHBGOF+xawkAqOgN?=
 =?us-ascii?Q?SkSUjrxsLsk6HoklW9b8+tI42DGGJv9ntxabGwsx16pXuW9YuI5M9Q5PnMlV?=
 =?us-ascii?Q?IBmOTQj5TNssL/rSq9b9QzBgNQArLj3HarmXIEV3QJt9RQ/79QOW1Oihk0Yw?=
 =?us-ascii?Q?aK+Wq0Htkot4EKHdjW534xZgqMaWd6Lp7rBSLwyHSngEWCullCJjSsmzT/q+?=
 =?us-ascii?Q?KKEaqVtJLr5bZ0wVsU8Ud4bR6+ZXVryIc+u5ztKwbBQYx39Jrx29mAoUbpv6?=
 =?us-ascii?Q?mjKYGjHjumPKskI3UbbGKZAnWovH2LDMGzelDAgavgVgmZetlzU2AdQAt3AX?=
 =?us-ascii?Q?n96An+r+rA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 50d8c2ce-dcbe-4a4f-1555-08deddaae096
X-MS-Exchange-CrossTenant-AuthSource: DB8P189MB0732.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 11:11:51.6644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HdvnC9GEzorrNDOMAWuczGxpRmJRKa/suCvmClzQyvtrkcAH6UWIwX02pvKuj+7DMA775MtR+ZV7zO/2WcA9oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P189MB2718
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jul 2026 11:12:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128118

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
 .../recipes-daemons/radvd/radvd_2.20.bb       |   2 +
 3 files changed, 321 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/radvd/files/CVE-2026-48=
715.patch
 create mode 100644 meta-networking/recipes-daemons/radvd/files/CVE-2026-48=
715_dep.patch

diff --git a/meta-networking/recipes-daemons/radvd/files/CVE-2026-48715.pat=
ch b/meta-networking/recipes-daemons/radvd/files/CVE-2026-48715.patch
new file mode 100644
index 0000000000..ca128294ef
--- /dev/null
+++ b/meta-networking/recipes-daemons/radvd/files/CVE-2026-48715.patch
@@ -0,0 +1,213 @@
+From 545487bba7b8bcf447ca119f45eb6a1b8eb70dc7 Mon Sep 17 00:00:00 2001
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
+index 0ac39e4..a58c655 100644
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
+index bb918c8..032d705 100644
+--- a/radvdump.c
++++ b/radvdump.c
+@@ -23,11 +23,18 @@
+ #define bswap64(y) (y)
+ #endif
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
+@@ -45,12 +52,14 @@ int main(int argc, char *argv[])
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
+@@ -65,6 +74,9 @@ int main(int argc, char *argv[])
+ 		case 'v':
+ 			version();
+ 			break;
++		case 'u':
++			strncpy(username, optarg, 255);
++			break;
+ 		case 'h':
+ 			usage(pname);
+ #ifdef HAVE_GETOPT_LONG
+@@ -89,12 +101,29 @@ int main(int argc, char *argv[])
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
+@@ -126,7 +155,7 @@ int main(int argc, char *argv[])
+ 			} else if (icmph->icmp6_type =3D=3D ND_ROUTER_ADVERT)
+ 				print_ff(msg, len, &rcv_addr, hoplimit, (unsigned int)pkt_info->ipi6_=
ifindex, edefs);
+ 		} else if (len =3D=3D 0) {
+-			flog(LOG_ERR, "received zero lenght packet");
++			flog(LOG_ERR, "received zero length packet");
+ 			exit(1);
+ 		} else {
+ 			flog(LOG_ERR, "recv_rs_ra: %s", strerror(errno));
+@@ -208,7 +237,8 @@ static void print_ff(unsigned char *msg, int len, stru=
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
+@@ -320,7 +350,8 @@ static void print_ff(unsigned char *msg, int len, stru=
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
+@@ -376,6 +407,32 @@ static void print_ff(unsigned char *msg, int len, str=
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
+@@ -519,6 +576,7 @@ static void print_ff(unsigned char *msg, int len, stru=
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
index 0000000000..7bb338e38b
--- /dev/null
+++ b/meta-networking/recipes-daemons/radvd/files/CVE-2026-48715_dep.patch
@@ -0,0 +1,106 @@
+From c0efc056a45a75977a1f400e8023dcdacab84c07 Mon Sep 17 00:00:00 2001
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
+index 3784b76..0d3fa1d 100644
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
+@@ -862,21 +861,6 @@ static void reset_prefix_lifetimes_foo(struct Interfa=
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
+index 38f6533..ae4f471 100644
+--- a/radvd.h
++++ b/radvd.h
+@@ -381,6 +381,7 @@ struct safe_buffer_list *new_safe_buffer_list(void);
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
+index c033794..f18385e 100644
+--- a/util.c
++++ b/util.c
+@@ -287,3 +287,34 @@ struct in6_addr get_prefix6(struct in6_addr const *ad=
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
diff --git a/meta-networking/recipes-daemons/radvd/radvd_2.20.bb b/meta-net=
working/recipes-daemons/radvd/radvd_2.20.bb
index d02433c5ec..466d7c77f5 100644
--- a/meta-networking/recipes-daemons/radvd/radvd_2.20.bb
+++ b/meta-networking/recipes-daemons/radvd/radvd_2.20.bb
@@ -20,6 +20,8 @@ SRC_URI =3D "http://v6web.litech.org/radvd/dist/radvd-${P=
V}.tar.gz \
            file://volatiles.03_radvd \
            file://radvd.default \
            file://radvd.conf \
+           file://CVE-2026-48715_dep.patch \
+           file://CVE-2026-48715.patch \
            "
 SRC_URI[sha256sum] =3D "af37c5a81d59f3bdc00d83056606ffa1810d4550beed6caa4f=
81181246494220"
=20
--=20
2.34.1


