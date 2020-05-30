Received: from EUR06-AM7-obe.outbound.protection.outlook.com (EUR06-AM7-obe.outbound.protection.outlook.com [40.92.16.90])
 by mx.groups.io with SMTP id smtpd.web10.3576.1590870662637596623
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 May 2020 13:31:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=QxVbAKYk;
 spf=pass (domain: outlook.com, ip: 40.92.16.90, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFK0KbDtNuBAhOKRxjEUHqtoFr1W/A6RnRZIuQJgrIAA9949aToZEOC6UBeSkdAvK3BmXJZYyFdY882HAEf+f1QJFocfBjHe4SOMMVNA7O62nh5SU+WGHgGfRdcflW2WQf1v1mje5a5BzJh2BMb2214KjNdDExnCA3uiyvnqPj3KJM1SVqIxxSfHiY5UM91oAYomsPZsJRPEJ60YfX95xEYjmYBB8RoyY/MeJewDnHzA+N6t2JOdSIC4IAiA3m0kRnQo9HtAx0IWVHeUd2dae/VL91ZUJKqC4vggU1q+1LJkla1IuykLtD6Oqkdze+W44aSl9/KYc0Y3l5ykm6g5Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYpzD5VwdsBkGvHhRrV9Tusq0Bbgd2rTd82ojpj+zpk=;
 b=NVBRD4Imu/59CLdmnIAoSjs8XuuvmQSd6yoAzQV03uFTTM+Q/gN51z5vNeHE7HNIBB6uxaUyAnPQ4a1BiNKWaPWqjp9Od8xfAVMKxQMTnp4H1wUcIWP949UomyUJKY4DCapCI9HcX6iobpR9wBBYtFrA/NVCUkfg1NhX4r9oDB6ZngXIUdt3p6OO2sD2yXbAmzzFTj13DSvSKSFYl3CTnzorT+NBh5Qfm7cjC8EtlXOBmKZOVFzAiA1uS3Ur/bI1JilJ/DsjhGmUed9Qa121BFgjDusMVl4tpqSZUA8fThGwNlzqIKBNGs+42f8IOqwKyewbhfrb8bU/xv+3e68Iag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYpzD5VwdsBkGvHhRrV9Tusq0Bbgd2rTd82ojpj+zpk=;
 b=QxVbAKYk2/HE1pxpRyw1ZLNl3XzE3Y/A0M10FZVRz2i0iq1Hux2lI0y9trtBSl1qvmxNZCrQke2uGTtKhPdyWoeIQ4uJ6SlTQ7DY95HYaCCzTP3852B2zIsusXCYRwD8zuvd5i/+nTIJUHr+QRa71Zf06lesO4Nsv1ohApQKVhzkT1eMGrg4dkNIqY4qrvcCHagdfh69mbkQtR4+2wV06+kmh04MUiGI1F2VzG/icdygoAekCY/MwHWrQk4aAxOlJ5Pv4Aa5Oe4DaFbM+41mUMUPILdBS+qZnavV1V2Gifapm5EC8OOCQMRGPVxc6Gzi3Acw/l543v7vRa2r4XvjEQ==
Received: from AM7EUR06FT008.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc36::4c) by
 AM7EUR06HT097.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc36::484)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Sat, 30 May
 2020 20:31:00 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc36::4a) by AM7EUR06FT008.mail.protection.outlook.com
 (2a01:111:e400:fc36::498) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Sat, 30 May 2020 20:31:00 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:3F0F093DCDD35AF485B7EFDDD9F7BFE1A6D46AE1E872154B8C86F27F800488CE;UpperCasedChecksum:DC5F019F5DCEB5B1AE8B2F54471C39C0510C2CCF7E5925900177AFB2B3579FAB;SizeAsReceived:7475;Count:48
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%7]) with mapi id 15.20.3045.022; Sat, 30 May 2020
 20:31:00 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-devel@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-gnome][PATCH] rest: fix typo for HOMEPAGE
Date: Sat, 30 May 2020 22:30:44 +0200
Message-ID: <AM7PR05MB6881862DB18103E380EF05ADA88C0@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM6PR01CA0037.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::14) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200530203044.12458-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.43.214) by AM6PR01CA0037.eurprd01.prod.exchangelabs.com (2603:10a6:20b:e0::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend Transport; Sat, 30 May 2020 20:31:00 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200530203044.12458-1-kweihmann@outlook.com>
X-TMN: [AvBxmoloURDq6kMMiFzR/bPquq+AmPAy]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 17b7e686-67da-4812-f02d-08d804d85dab
X-MS-Exchange-SLBlob-MailProps: 
	=?us-ascii?Q?apgo5D0uMOHu9u6AKyaa05BxdpLYz6fwWPz5uylcui7H15uhp8en2G3/2gwJ?=
 =?us-ascii?Q?LN+b4cv10vd52vGbwxJ9Rj+V41Ds63aezCJ4fTJeNU8QIJcA+Em6el4B244f?=
 =?us-ascii?Q?ec7Ft8DbMjsjXgmSN7kw4J1V9SvCs2j+rS8NhFxGUjr/BU3ma4bjYohx9vD7?=
 =?us-ascii?Q?1Ze9lcbN9NOgTnPZggKBRISEmYfqI8vCCwXtUCz0BjTtuvQL2OPhI36w0f79?=
 =?us-ascii?Q?qyUgNpm6akWhWiGTWOL5ZoxdXKIxJlNZxXmgr9CTpdoMnsr7znyG99rphlCh?=
 =?us-ascii?Q?q0VRsdejofnqQg24V0ioc579pefy5C0esQ62b7FlVZSX1M2h43W0ylYhWnrm?=
 =?us-ascii?Q?+QqLcjycTbleRPhnIlg7wPIuc3+8Wst1yRrixLbH4GVtT0hvfBBUIKeWtyfN?=
 =?us-ascii?Q?4B0ey/oDUjEJKWrSicKdWqyL+eOOBPZ73IHBptsEQ7sjy5klTTh+0koGYf5q?=
 =?us-ascii?Q?eMVtIuAITGRHm6sOeOedVFxWQ/OuDwKldrCj/XiDRFt26DSTClzFVrftRJgh?=
 =?us-ascii?Q?SSX5MsA4V7FJTco7cvEnfGonA4weUypX19I5YtnCaBKTLRcrJBfhaJklSCqn?=
 =?us-ascii?Q?a4NEndZOXDRy0/yRq24/zieivBZo0WJIZfeUsm0pbFBh22uU6rzbVfIuUkWO?=
 =?us-ascii?Q?sN4PpP5MeqkDSZIEO4QWsbbKszuVzkPYgU/XWxvndbCIyUQ17HwDSeZtVG5A?=
 =?us-ascii?Q?J1ejckEPTCJMLjIC4OGurkoxEyAkktJKWFcLDNIWBs0DWBgEHVLEU1Km3GNi?=
 =?us-ascii?Q?sHqGHbozCoBKOHXKkCWuIucTuTiC5cEcbnaUX7YwC7Tjz+vzUdhP4LohnWG+?=
 =?us-ascii?Q?YmFvQShfWoWqKGsqE5vR/KFx57Ob/r5laEZtGC/yiBX6yHVZCH3PSYnuhN9s?=
 =?us-ascii?Q?pCYTrMcHrLYkbvkxOkMAkobsFyrCtsyZz+sgK8nBg+ttxda0beKnY6i5GsF9?=
 =?us-ascii?Q?x9s+R9UpeAZWPre+XZFwaexqLmpMNvzo0K6nv0D4sQay9O1uG084cQ=3D=3D?=
X-MS-TrafficTypeDiagnostic: AM7EUR06HT097:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	522Mucx9tp2fpsSFQsKg7ZdrJRlLlBUER1NyZE68lmFBwIe6tmxveztk+HKqSs2AMChRwj4EUYn+qn/6uIqn5axe/HBtODuwEwDkuMHERjgfFcrV1Tvh6DBxRD0hxcRugYN16Jzm6U/KqzzDq9wTTPi1drLlcoRRoBbR9NJK4YcouQTVBIKLC81G1HFyRSR6OJZHVNqF66WMkDpx4xE0Da6lW0r6bchLmgWw3yfmu0GyHK83ggR8tKifNA8JK7Io
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	yqTFQeWym38ZxozwCvbR99LFRWO4wZ4qld782QUWsPupJQXYnD9fS0MBszjdnBiJYFkYiZH2ZeX5zIaZI9zkS0aIKisFibo9yUR9UtzHj5WWEaTBdQ8TE72fqNTG7zdN6XyQQ1+Yhz9iZjfQ9c15Hw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17b7e686-67da-4812-f02d-08d804d85dab
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2020 20:31:00.6191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7EUR06HT097
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta-gnome/recipes-gnome/rest/rest_0.8.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/rest/rest_0.8.1.bb b/meta-gnome/recip=
es-gnome/rest/rest_0.8.1.bb
index 33b8744eb..e875f7a7d 100644
--- a/meta-gnome/recipes-gnome/rest/rest_0.8.1.bb
+++ b/meta-gnome/recipes-gnome/rest/rest_0.8.1.bb
@@ -1,5 +1,5 @@
 SUMMARY =3D "library to access web services that claim to be "RESTful""
-HOMPAGE =3D "https://wiki.gnome.org/Projects/Librest"
+HOMEPAGE =3D "https://wiki.gnome.org/Projects/Librest"
 LICENSE =3D "LGPLv2.1"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b0a=
1"
=20
--=20
2.20.1

