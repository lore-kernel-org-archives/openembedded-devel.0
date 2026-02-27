Return-Path: <matthias.p@variscite.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38979FEFB6C
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 15:47:23 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.126])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.99217.1772207238011242152
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 07:47:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@variscite.com header.s=selector2 header.b=PZkW87p5;
 spf=pass (domain: variscite.com, ip: 52.101.66.126, mailfrom: matthias.p@variscite.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s8NiZzuoiy3H2FwsDk7gHRapbSdfL8mxV7H+M9QeI7xCNO2Hcbq1KVEXrBCS2UH4y+N7IVg+bujnwmUKdhZLltP3vQFDs3UdDG4A7oavTx4EH44ExShBAEnWh+Ul+k6Sk4u1drA7IJu48ZaklZl9L7bYUa0tQUwL/L4KmS7XIrzD3Wyf4EeL5DELC8S8ZcBT017k3Gzh628E57jsuL1Vfz2NmadEspPSNTQH9aqJpZv4b8VgZrUZmAMSpNq6JJV+qlclh83ljhB7cP1ZND3duuyUotCcwdIavv5VAm44ZHHrEN6lWZ+PcsZP/s3W3pEQZaNUr3unA+LHPWsANufKYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OvthUWKWKGYw2YwS0oqOjPdLjL5AMz7Zv7B2vIns8w=;
 b=YnM8EJ3dFgVca+qt5OejrSEP3LtBnWBy7rA+Hs7nRq7j8k/j6OESSt8KU38O+gFs/Vobe/4bt1Y4XlS5w9TTDdHxUqeQMxGQ8W+BhsIe0IqCaqnucW35LJr0FdqnFWcgjo4QoISiruBPmDPri7LCMFA55wSGtTVvK0eXC5eDU1q9Zt0N45eP2s48BU8C9m7VI2yQTCIx5iqfiK8EEKFJDmNnSAVhaJL9kmOPh1Ck0TnkuhQdyAkGBjuERdasBeibmKQ6NrEr216fdvX7g0WrCrGxSeluAhhCnVAiVbA1v4WEmfZYZfHPK8h9aSm6S8S98AH59dMo55Kui6tbbNaXFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=variscite.com; dmarc=pass action=none
 header.from=variscite.com; dkim=pass header.d=variscite.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=variscite.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OvthUWKWKGYw2YwS0oqOjPdLjL5AMz7Zv7B2vIns8w=;
 b=PZkW87p5fJzYLgL6BYTwmCYOlHel+8G9jFCQ9DMTbfBGSXO26EdD//pmKAmWlan0ZtCk5eQ/i8IsneQSogOBDYKatbQlhqB1+xlxMOg61Cnm3Lbd3DAkHYDcNVGpGrg3JZldVnvJfWnHGb5yglEhKwx8ADAme9c7MGH5LLMsDD93TjYH9IQ1j9oBTispmqpsvBu/qZrJmTBP3nJ7e68Cj30mO3qCbTT5E4DNEIqWkxi6niEI9LCbAFLgoAIYW5uS1JxUGeT37yXxY6fBG9RtEpBqqHhDjNj/vKlDlgIMhKhf8KB2W5GOMwQXQ2fw1JwGIywqFdQjbbpGNRtjgz2yDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=variscite.com;
Received: from AM9PR08MB6706.eurprd08.prod.outlook.com (2603:10a6:20b:303::5)
 by AS4PR08MB7878.eurprd08.prod.outlook.com (2603:10a6:20b:51d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Fri, 27 Feb
 2026 15:47:14 +0000
Received: from AM9PR08MB6706.eurprd08.prod.outlook.com
 ([fe80::1575:987:8b68:bde8]) by AM9PR08MB6706.eurprd08.prod.outlook.com
 ([fe80::1575:987:8b68:bde8%4]) with mapi id 15.20.9632.017; Fri, 27 Feb 2026
 15:47:13 +0000
From: Matthias Proske <matthias.p@variscite.com>
To: openembedded-devel@lists.openembedded.org
CC: Matthias Proske <matthias.p@variscite.com>
Subject: [meta-multimedia][PATCH] bluealsa: fix QA issue staticdev
Date: Fri, 27 Feb 2026 16:46:47 +0100
Message-ID: <20260227154646.160184-2-matthias.p@variscite.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: CPCP307CA0009.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380::16)
 To AM9PR08MB6706.eurprd08.prod.outlook.com (2603:10a6:20b:303::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR08MB6706:EE_|AS4PR08MB7878:EE_
X-MS-Office365-Filtering-Correlation-Id: 331605c6-3eef-491c-efd3-08de76177a01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	394lG11VrB6VUFdJRUbFmPF/uOXFnqljRjfS/Oxv7M4bzPpJO+ckVoAiQ06torgNKGS80+TvcgS1Ryj1zkiusnDynIS8JjUlPsjr5U26DVJtfeY48vBd1GYbFFVwrT4Y5UDN/stMOXx3Yw9S0bfOBvlKYen5EdlkxHCt/hNw3qKnXPHb82SLXmInSBdPu375Z5wiEgKq+PRGjT2jbLuguGDja6OS5tA2YpTbLVFV3k2qS9jZJN+LVR1L6cxmh4gs6JWwHRypgbHqrWjr+P8SD1VzoYzM7XwFc1KFjkg52CplfQNewFQs0nXdksBQd8tH8LYA+ZI7YkdkVXc1JKndXhy+GL+tTFtbnqlZRoFJfCET9p0JGZFyt0ol2xYj9dsXFGKOs8+4E9VtNPGSrcrDNkFAV604ii43b7vraPx23eGr5dkMZpkvWcVaGLjoJ1tVyhyrYCcwRnwPpJrn/6YhWgCBZuc7o5jri2E1pc+HJsnSCFPNwAZZIPc/D9YZXmqRiB17F7yX7TprXHvWdR7u3OS+WTjUxEO7Ni5Gdr0uQTi3BWgAJAuk79Rk0Gv+ap7WIj1jwIsgAA5ghGlW2/qEy1pLSe4pRw36ShebE/QcHVIZA2nvHgh3YCoMTTEbnUrQ6162c6UfvNlVby9qltUWFLd2HbIuD+4aqYNo5wXQoKZE9oPMIOgz6Q/rRqV1+9DEuHs3igFkKachOpCkypgEDmZEfd41LB/XCG8gJ1FwWlA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6706.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zFDgENr/KhNI8yAoFusHOMjzhX00zO09rs8NmXJOJFZRVrUkty2sRGel1sh5?=
 =?us-ascii?Q?SDqRmuYJAqSNklg5pFJPP19MF4j8fNEcqwlwxiqyfXsMDgaLJ9MPfWpnJ2we?=
 =?us-ascii?Q?xAUCfIYST1LP5aAN2wSSrmFt/R7RkNJ5e4RXHkseZSOmdic7KDEzffCUZjBe?=
 =?us-ascii?Q?YGtSsXj2Ze7iVcYbQYrTSCuD3sK9hl3b9S18qwFg9IjVItnS+Wz0fJ6g5vuq?=
 =?us-ascii?Q?9oX/RsrrgphiT/pU8DIlafT3YrgD9jPRUT8aJdZcYH0P0v1F8L40x0OCvIZm?=
 =?us-ascii?Q?M99cBL9rAwJC+buu3fGckOohoZ9yzUDCwEGn7Wxqz2qoJL9+j7sY0g9rZEvX?=
 =?us-ascii?Q?eSYqhRctii/RCY/BsduaRlgRiwiSxYk0OJKrTjliT9rDp0GQdGq4s58J0COA?=
 =?us-ascii?Q?GnOWZvQw7t0DieQw3UftYbVe8k+rSaYlqLyKKG0f6S3+UnmFV4ox33CIPJFY?=
 =?us-ascii?Q?e5Vpzz+nVAuqa4CdXUv6iQKuuDXaxCuWjGRY5ma0xG+NkVAmazdohjvkHVkX?=
 =?us-ascii?Q?2aVGMLbHPXkNnB3NkGhfktVL3cDCBmH7t1r6dBkUaXrCZHXlBbas9ZM9ADwH?=
 =?us-ascii?Q?NvrY6C1uhJF5Rrdc/oMJvaROxuvotd4J6JfW4hw31cRF3cfnzUKOftMrVct4?=
 =?us-ascii?Q?dA0prNmaRgw4ASrPgH1bh3oV1m17Vaa1d7Uy2N3QvePiy4UnjFa3RlcsU4Fq?=
 =?us-ascii?Q?tZJV0cZCLF8Fp2TOwtyqF/UW0RDo8t9c8buk0oiUVCzGOxxcIW9/oeI/F9su?=
 =?us-ascii?Q?Ghy0R/c7SQTA3k+LLEopB2x2Qpv+bzG1jdTZj9M9lmI6aPLWyGRN+XS/vNAL?=
 =?us-ascii?Q?4zOcRJQDQSqryzAuddWJLETO9/kiXQd7iHJ46ZP99+IPpzCnd19eW8f9Qyj6?=
 =?us-ascii?Q?qff/mSusj9fqpZx6pAAHOnfb7Pr6bRMi+/6MMwkdlpwbJvy0wLasxs7D4nFO?=
 =?us-ascii?Q?yqP3o7Zlag7SMzpznojEZMV7epERX7wdpa0rJq46wKNxks8Y+/pxuIocOhec?=
 =?us-ascii?Q?ofaA6taEoKQ7MIe0h7WcW2SAgAjZprnJC9FZWd0VeVV8tcM3D/wd5A247770?=
 =?us-ascii?Q?mPdkr1AZkKOjrR8D/QyGxI282atbUBfqlWgwcbn1EE9bMQQqUoY7CNUHyFdL?=
 =?us-ascii?Q?COM6sW/6PPcymJjK+ksa3kKbs53QoNBFzGeI5YA9LUdqqRZ1DiFDgvRPQRmd?=
 =?us-ascii?Q?01U+jOpo9JCsv8oC7BzOU3ebCEma7bQoD4IwQJ7wp6wJg4WHBe0kKtpc8uMC?=
 =?us-ascii?Q?/gq5WG/+1oXJf3OKd5N03IMN1GgBHlr4wS3Xed5zT7TW1zSj49wUQ/86pSyV?=
 =?us-ascii?Q?RFVadihqD7hwOTGA58I+S6IP0CO2KaLMTTZSHHEayLOn/PXdV0WcSNaY20u7?=
 =?us-ascii?Q?PUywfOb9SosoKmi1H3F3A+USZA84MVm5S1FCFvLGORqxYBLG4txh3xDYH0FF?=
 =?us-ascii?Q?rOPg3aVgAzdKxTGlpHF0r2/07VOVevOjvjRsOAYHYFD3KRh95RAvH4F27wT5?=
 =?us-ascii?Q?qyNIMyF1l/yF3lsEeLDifAm3yzxaqWgc1ycuHjnIDHLg9gMe9qRdHXyStX5s?=
 =?us-ascii?Q?Nk0g/1kefaAiNtXSFcW13Wki9XPHNs1gbbaXg+BMQOMypES39USTijWianud?=
 =?us-ascii?Q?6I6xLCTWs0M/AHZVOAqOEVa7uDqlZKdEN3HGH+USealdWExiyGUG/JAdfIFn?=
 =?us-ascii?Q?5MBm1Q/aak0x7NGKKlWIGlR9SuAU1udpmfP7C3KZDqU3lFS6vd8uoyxSqlB9?=
 =?us-ascii?Q?GlAR5QPYzuCQWxFZ+VWGuujGY1DEO58=3D?=
X-OriginatorOrg: variscite.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 331605c6-3eef-491c-efd3-08de76177a01
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6706.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 15:47:13.8096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 399ae6ac-38f4-4ef0-94a8-440b0ad581de
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KiUy6ZPNI8VdLJheiZNEHLZS1AXQnQXfCmyZxzfCkcXAZBJ03I/EtCPH510wnlVJcb8ZqwX0akGBq3JsBVJvzIW1gKkZ5oBUZoeV6iKFCAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7878
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 15:47:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124767

When building bluealsa with building static libraries NOT disabled, you
get the following error:

ERROR: bluealsa-4.3.0-r0 do_package_qa: QA Issue: non -staticdev package
contains static .a library: bluealsa path
'/usr/lib/alsa-lib/libasound_module_pcm_bluealsa.a' [staticdev]
ERROR: bluealsa-4.3.0-r0 do_package_qa: QA Issue: non -staticdev package
contains static .a library: bluealsa path
'/usr/lib/alsa-lib/libasound_module_ctl_bluealsa.a' [staticdev]
ERROR: bluealsa-4.3.0-r0 do_package_qa: Fatal QA errors were found,
failing task.

Fix this by explicitly putting these files in the -staticdev package.

Signed-off-by: Matthias Proske <matthias.p@variscite.com>
---
 meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.0.bb =
b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.0.bb
index 162a51284e..4f15465371 100644
--- a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.0.bb
+++ b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.0.bb
@@ -58,6 +58,7 @@ EXTRA_OECONF =3D "\
 PACKAGE_BEFORE_PN =3D "${PN}-aplay"
=20
 FILES:${PN}-aplay +=3D "${bindir}/bluealsa-aplay"
+FILES:${PN}-staticdev +=3D "${libdir}/alsa-lib/*.a"
 FILES:${PN} +=3D "${libdir}/alsa-lib/* ${datadir}/dbus-1/system.d"
=20
 RRECOMMENDS:${PN} =3D "${PN}-aplay"
--=20
2.53.0


