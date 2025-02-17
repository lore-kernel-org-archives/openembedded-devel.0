Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC1EC021A9
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 11:39:59 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.41])
 by mx.groups.io with SMTP id smtpd.web10.49187.1739792394430035094
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Feb 2025 03:39:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=gp6SpAFR;
 spf=pass (domain: prevas.dk, ip: 40.107.20.41, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZZsGN5wIyJ8kR4AkV4YSvsnGOP57ceCeNQPdRSYUOfUb0SmV/IJj1WXRTTrS2IY8LYsgbU6ttZb2p8psHLT+hcc+eql5aP6zJOLepty6aMEdUZQI0sNTHwUzh57MPc+KmKKnvA3HvQcaZreBPX/RD6iyGlYVL0E8o7jNwncSfeF0sAf5LdBOybmyO/CDmzF1fUKY3v0Z3oEOHejvshSZ39I9lcKWk30Xq7SW3fVPdCGf/f5rNkjmjcGoOXCHQ6VqyoagKE3gUB4vUoavyg64Ze7rkW1Cv6w4K6fs27B1ejw97tC+JzxNSCI6ozGRxQhjUBxMOoNPkbLQ6usZSaZfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IvpsZOE4ejvC6VFA650t8NAfOTVp3vdyeDwbEHXDOBQ=;
 b=DuJyhsX/XsSrq0YoJK+dGQF+hplVyPAnVAASGaJKNbd0M7QDS1UGTJ7BwVGBwEMPovaMD3f2KyykuAaeqZiWebA1Y3/mJgTTQsI+mCEp01KtkoRRpYlD37o9RrOHo+5OmtsYZZJYMpemhKPRKDHRu2Jgxqk8m1phSaTfQ4TWlZShNkYqUCsaD0KjLThjyaP7eUqgFHgNaO4qcXIee3vJOR+7cj1ekpU83BUjjA3mgOjQ9b5DEjdHdErOTIuxFSiwJet9k/60aj2qnIITAnlw7l18FJcBX+FDifn3v7XJR+snKgU2L5dMrQgBl8ebviikOkSS5jLH0GRm6cU79oiqaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvpsZOE4ejvC6VFA650t8NAfOTVp3vdyeDwbEHXDOBQ=;
 b=gp6SpAFRIBkSKFMZqmB7tY6UIwDKKO+CjRtzZ2eYgUyGlff8tQfEpjvBmWXwc400qkJx5Bce546eMO4AJuQZ8UGyQWqwb6T/oT+fWTYVGd3kzxEjjE2JnKHOx/cxhv//boy6MfUiBLu2At2mfq7Zg5GRm3rZt5TeBSP9T9DMbno=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:41::17)
 by AS8PR10MB7683.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:634::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.9; Mon, 17 Feb
 2025 11:39:49 +0000
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4]) by DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4%5]) with mapi id 15.20.8466.008; Mon, 17 Feb 2025
 11:39:49 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: openembedded-devel@lists.openembedded.org
CC: Khem Raj <raj.khem@gmail.com>,
	Rasmus Villemoes <ravi@prevas.dk>
Subject: [meta-oe][PATCH v4] systemd-netlogd: new recipe
Date: Mon, 17 Feb 2025 12:39:45 +0100
Message-ID: <20250217113945.1333439-1-ravi@prevas.dk>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0013.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::19) To DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:41::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR10MB2475:EE_|AS8PR10MB7683:EE_
X-MS-Office365-Filtering-Correlation-Id: 92f6a97d-9953-4d0d-6698-08dd4f47c93f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PAjkeGdpG284qVNR2RRsqeLKPTsVyyGAdZ2OPkNHL1VxGcYYPPOk//bZedpL?=
 =?us-ascii?Q?AMz2geq2sjF9XeWWwuxCF80hhJL83xHXt6AmbVvEQjPWM/jX/ehSsOHgtPf3?=
 =?us-ascii?Q?gHFKYcswGvr0RWYUrOFqLDwTopb7z9Z8qnzxwDhhrmdGOafoBnfsrANDGKaj?=
 =?us-ascii?Q?gX/Fq9CrXQ/nz5rMsMI5XNXKk1biwvPXZz3CZD0t/XljBFzwyJ1DPC/KlPSa?=
 =?us-ascii?Q?w7b+ehNyARcu328SRJuhLd+5F7EJojvFN7UoRbr+Yl0am6TYSjcMCNIMX5+d?=
 =?us-ascii?Q?3xKc4H9LaXkoKgvJegUDUp/oOpAaqIc/rf21b6aEz+1PJJMbcQNb3X42rD9j?=
 =?us-ascii?Q?IJPUiBMHHbFoM9BuzHRTYcUxyJ4nkhXHuO7GsAG7Q5pBJEfPtuwOWbhMD1YG?=
 =?us-ascii?Q?PDDfqg9f2E4qLcFY4Lh0en06BSksvqUWSrz09PDKgQFz0/a1QAbUjMO6gFTz?=
 =?us-ascii?Q?ptP4JMs816yKRP0dK825qmSFM1hBHKW+M4O96ZV9b0Roksbpe+qwOvk9MINQ?=
 =?us-ascii?Q?kisWfsvbgoTgVUYGEW9pZ/oSPk8Jf3TarCxk9oQw24VqLJgmWCt0xPOymVlZ?=
 =?us-ascii?Q?OOja2aNaGjP8O0vZ+xvnlkH963fQp9o71YTXOrZF5mj7eAKI9cxB8ncu6hxa?=
 =?us-ascii?Q?SZzh+okBmmVA8lDiVEgzbYhonCW7+9jUuxL7ks7jPZDswrGoJVpN2krev6c5?=
 =?us-ascii?Q?hXr8V0b/lg8d1Gqr9VZykj6A6D8ApHV9DtHmQmSnRwHI187pouX+yg+4gsLU?=
 =?us-ascii?Q?7YyKZEoJFV03iyHfLSMaKs5rb4p0g/FScYPSVy2NJEFIPg7J4yTBhzEtRrUO?=
 =?us-ascii?Q?dL/UVVTCeAifK2smBgegvbYNywI0oZZz4pcca5ZHiM/mpWVoIok8O9zE4sUs?=
 =?us-ascii?Q?qf8iJRwIjTU2fHVwXC48j6wzzgcMG0CHza3eFKxG5o2h8FJkQkEeG5yzsTFH?=
 =?us-ascii?Q?DsiFdzHBcKjChPYdzsw1jaTl4QUPud+72tpXaGVoR/YEuhs9IBkhls+jczKz?=
 =?us-ascii?Q?+0EhzOP2LiF1kBgW4RmBX3+DkqE55gaWRszugvnHDSJ4r3R8ottwnRye7DM7?=
 =?us-ascii?Q?Fx7gnRlSCXcykl7YHD+qBOE4eoPvybqBnRyzuULxHs0vzzoaYEO1fX7ZuzFJ?=
 =?us-ascii?Q?x+5rhwgBIXEhlV4cQNb6jeaT2QPOZFJ7PW5o7gLldCJMdMwAs0a+5uhwE6FW?=
 =?us-ascii?Q?Txut8LMZNF0EnfSlbHa/uudWqZWeukZ0+e8BpeSiAKljwf/ukAVJqdLL4h4R?=
 =?us-ascii?Q?XLXfuTjLEY014DQh/LaYYfk84jtrNeu+9ktxn5jzm7/y+I6C4/hUsNoyD8GL?=
 =?us-ascii?Q?4mQrPReiGECQF2NfbYxi2CQSPCPavjQYEMnWMNqa20J2o4BNmkJ3zxDA1e8Y?=
 =?us-ascii?Q?TUlINxhK9o/NzR2gvjgpwOoGoOziaV+x3Bj2ZDkDubnLttvTxCUxwW6QegdJ?=
 =?us-ascii?Q?cVq3cC3KVbUZKtCRl4JcApMbF8Z6nXD2?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kHcVTtF3O/GyIR5NimzcIEfgfFoyxXzgDtgnBWQn6Pjl2Jamb04Ic6d7TNxb?=
 =?us-ascii?Q?oFj/+w3965oM4abxbkBNG0e/Hzc/bjPDrild6La3pWalohpkQKvaBpd2RaaJ?=
 =?us-ascii?Q?5fIVguPStUaO14F4ntIaBKt9oJQWJfA3I0wuSeKWyneEQ1LNaSo6JdDxLlNz?=
 =?us-ascii?Q?9meEEa0wsIT2KrRCkmNsG/84mlBnuXdRHrobo13NMM+Uq7WF68HFQhHXu7oQ?=
 =?us-ascii?Q?tI3jC1bmWscq+MslJ7hlUe53UEI4/IgQJWhIfM1xO5vz5A6VH3CaiTBOscD/?=
 =?us-ascii?Q?alj2wnzGgD5H45lS0tSUezXcf62OE4CuMiJFcJBIMmKkXeAPS5WR3kvUt1Lm?=
 =?us-ascii?Q?JpJYeWdcqH3djn/TtvgH4CY10nBlAbhVjIz/4dRI80Zkl9FZ/nc/HlY7gBvf?=
 =?us-ascii?Q?h6uCdYQXxl8qs9nXUEZ6Tx7YropTlROl4+gftiuXniORtniToeuN67fAkUxe?=
 =?us-ascii?Q?csGXjdXps+n1q5DqnnmizTDgoIj9flDBxVZAYrdelJX4eiDNthVNnyH2iGDi?=
 =?us-ascii?Q?9ueVdV4reWajtJ5wFjN9/CUMolmCHpd3qzsx1LtMWT00vW0nVSisj5MsWU2+?=
 =?us-ascii?Q?oc9GlKux5KIzxpITDedJocqiyPRs2qC5ZlcxyFgYUPfJzUOnVrzQ4GzZxNpn?=
 =?us-ascii?Q?5O8Dvz9ers+Wu2gpXy0GQsuBo8lBcGXHHozKb786LNt5qQRE6qs39dIz1M1k?=
 =?us-ascii?Q?zZUeICoqbIOqUVLnQZ2ruL9I7wlrISx7X02qYkqU3GgwydLaty/lmbHtZM/A?=
 =?us-ascii?Q?NMM+f69iUI5wrbxnLl1WBaJoNxTsMVhz5kpj/X/Tzl9P36f+Ajd++u4e8d6a?=
 =?us-ascii?Q?cCha7ymZ0OepR2YetfkybBvO/dzfiUkRW+yoRudCtaAnsrjy9yHJ3Z+12Gs0?=
 =?us-ascii?Q?ZIxJ8HDSObRDOL870nqWi5VYJyrRhqG3MKZvZMUxZ5sQVSt8o8rP3/aO2WF+?=
 =?us-ascii?Q?xZ5eGd0sJz0gwGsjCTou4q1fJN+20EtzMwjlci2dA9RtNmmunmMbZ+upsslE?=
 =?us-ascii?Q?V19zFvaFG7OKUkEnqPgy0+DG45S3Rl7oPDtOpAQxn8uYbBCWSD0KAphriQzo?=
 =?us-ascii?Q?QrznThRrTNQ/2od73Gd2J7jixh8RBOCXPbuE28E29SIIWNKMJbqL0GHRlxlo?=
 =?us-ascii?Q?+FRNTrRivPYOVd8eb2ve/BRYHQOVxtPATGa6DrSsnDVUXW1hI28UV4cAXB4n?=
 =?us-ascii?Q?i7E2bCNz2G2YHlwsVIP5OuGWXJOz5JaIosp9uW8mNnay8OdmLXObTq/sa2k7?=
 =?us-ascii?Q?QJKwYnUCE8504Amq9D3FmfmNR/5IV7fg1L7l9ozvVgiOzFNXVp+/uLU94u4H?=
 =?us-ascii?Q?pKXqWtPCvBJNsrvL8zXUYvig/9jcFa0WqBamUpMjQjSwmUHRZWGyaH2G1IzH?=
 =?us-ascii?Q?qS0RYcjp/CNWsLYpQuOsxSWw1c85Nu/gZjTNui16FhAxfvGx8s5Q1VtzNXii?=
 =?us-ascii?Q?+ihzkOOO4Tg4ICj+f/U8cx9CtRtRH+RydoENvXl+/J8NWJ0j/iaTCguT0ZzC?=
 =?us-ascii?Q?8bEdrT05AbQrpyoHdSwfa0WrWKY50ONyiwgZEZu1xXXJ53AUwkYw+07lEdyE?=
 =?us-ascii?Q?Tc4FwW6YO2sbmnxORvFfCmdhu1pyoU08RUzPpHCTuAF4HYT0edUHxBD1Zi6K?=
 =?us-ascii?Q?zQ=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 92f6a97d-9953-4d0d-6698-08dd4f47c93f
X-MS-Exchange-CrossTenant-AuthSource: DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 11:39:49.5346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cyUArFEYDmk3tqz1n4XYZVfYjfeEuJFb4Gx8aXIQ2X4CAbazbn9nwXofAzfN8fhf5h09+mVzIN0PAIWN8TOf6qr5MPBC5QsmQYWodZ6nJIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7683
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Feb 2025 11:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115514

From: Rasmus Villemoes <ravi@prevas.dk>

In some deployments, the log aggregator collects log messages in the
syslog format, so systemd-journal-upload and friends can not be
used.

systemd-netlogd is a daemon for filling that gap.

Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
---
v3: https://lore.kernel.org/openembedded-devel/20250214085152.1273827-1-rav=
i@prevas.dk/

v4: Disable for musl due to use of glibc-only comparison_fn_t.

Perhaps one could add some musl-compat patch(es) as oe-core does for
systemd itself, but I don't know what else would be needed besides
that comparison_fn_t typedef, so for now just disable it for musl.

 .../systemd-netlogd/systemd-netlogd_1.4.4.bb  | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-support/systemd-netlogd/systemd-netlogd=
_1.4.4.bb

diff --git a/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.=
bb b/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.bb
new file mode 100644
index 0000000000..d88cad75cd
--- /dev/null
+++ b/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.bb
@@ -0,0 +1,28 @@
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
+COMPATIBLE_HOST:libc-musl =3D "null"
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


