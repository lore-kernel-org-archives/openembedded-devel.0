Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.92])
 by mx.groups.io with SMTP id smtpd.web08.7870.1625222155324722575
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Jul 2021 03:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=QbIw+MhI;
 spf=pass (domain: prevas.dk, ip: 40.107.8.92, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wvtk1hM7k9mYPpEpNnoQfxFgjN+lyNVenKRl/hYs7cKVKn0lg3QwVfXRqBkFxPLq3L3e7DDXWPcfkSkzPTOCJ6tAZQLBicuyHlQhdX2AqG6ApRsYeMqLAOOjbiclFCkb4rOOoig86BHcaN/ahmPoTYI1wiLQt+r0cuR9zbwcrjAzPh5w3XVbYpD9raSy+mHzgEMhrSptZIsV3xNXTVJneaVoRHPFpw/eGPVnX8ZmZujI36Ejt4+yeY125Tl4kS9hAOunZLtNlTPuKqDBd6IMQQ8+e1ykbh4Og9e3OrYEVqU51nvJjUzfeXa4qY6pW5th9a+qq6zYoxKXPTwvm3s4Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VlXk9wcrnUPRFprPhiwpo4InYfBksVDtYkU/7jahEfo=;
 b=cw87ciM8NsU5kspNAY5ryKZWi6zOHdBn60K7BNHBOVlEsYFOOGavYX4Bz9xqqz2XEak1QQOOX3AB0pesfRlMsuxUeubNUWsi+8vzM3F7fQAsh1oIRCuJeRQ2rAYS6CQZJeRjjDMtQTZzkEk/oK49aG6cuaII6CMtRq6U0RFzIWl2bjHqlv9hdMmNRd+Uqdz/XqCcQNoR/dkU6JA4J889TlDDQxbTrY9VRojvNJ9VjGxzaUadsyPCqaA5S8MNtRoFBDhgOMKdo9Lc4CiQ2mqPp0w9bx20zIfE7gdT9euCrugDUWW48lBb1bkgWD5PKET0NEYg784Etrmtvg5jrwRTLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VlXk9wcrnUPRFprPhiwpo4InYfBksVDtYkU/7jahEfo=;
 b=QbIw+MhIc9X5CVe/eUNtUCFgPvu+LiUCfRO2DSjrJP1eJa7NqGjjj2qKdqfcCKe7prTL8FsdxFP4F5VeDw6rJG4x8m2HYEpTBDdILg0nwPvLHiuXyVwNI0+QxJct8UVvfqBVNf1P0Sg7bX9kR7HOy6pky+3f4+a9Xortpu4rRcg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM9PR10MB4887.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:41c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Fri, 2 Jul
 2021 10:35:53 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fc83:36a5:db02:3dbb]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fc83:36a5:db02:3dbb%7]) with mapi id 15.20.4287.029; Fri, 2 Jul 2021
 10:35:53 +0000
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
To: openembedded-devel@lists.openembedded.org
CC: Khem Raj <raj.khem@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [meta-oe][PATCH] recipes-kernel: vdsotest: new recipe
Date: Fri,  2 Jul 2021 12:35:34 +0200
Message-ID: <20210702103534.105212-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.31.1
X-Originating-IP: [80.208.64.110]
X-ClientProxiedBy: AM5PR0301CA0031.eurprd03.prod.outlook.com
 (2603:10a6:206:14::44) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prevas-ravi.prevas.se (80.208.64.110) by AM5PR0301CA0031.eurprd03.prod.outlook.com (2603:10a6:206:14::44) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend Transport; Fri, 2 Jul 2021 10:35:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: faeb9706-a6b7-4f43-06e9-08d93d452ac3
X-MS-TrafficTypeDiagnostic: AM9PR10MB4887:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM9PR10MB488781AC1EF204210D41DE8D931F9@AM9PR10MB4887.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CjvH5cs9/7jGHyo047SFHQrc+pAHJcZCIG1RUpzvteUAbf5J1U4kBAdI+X7ts3IqPw+fNDX9DzmTZ0hS1nyAwPDPGyFOXwwYOj04akC7weYKrs7R2Jnsa5NWaTXF/q5otimKv+6xZre5wcQRqpWG8hHcRpypRLPKWriNdkWtx34w999OnWqRoycFEzyXTI8TE//sP16heTmKUutLwiXpqsEwFHAfrR8rfUVxztMIqrfULCx8jowSQQF9BENtB5rfypWb7AZ+04bPKTpWkLfs8WDIo7BAJg/CKFik3GR/6KFUBOVtSsu/9xKXO0R+2cEoFN5qdtFHm5GFYGkjsuPkXgZIRUr8yohjyWwgCowm1ZV0diDP1afvGdS58c44anMWzPVnVqe6XOpNxLlXRHh7BOUjW5YLiEtj0ylMu9JbHtmUi0igctHb9iUsvQulzEgKa1nmSNoYHuuACvORpw9T3LL0tsBv6SOBKPNMmGWblqJzHOHd1TY2aKZZ4sD/6IAetLw2ySEHjjKmL2mwrysbON2MKbTw50wJnAaiiQCWlWBnOHo+Z60c6yNrXzaNdfVI63/VIh59sIBpyUmQaiYJU2544o/Y4ziTPfbNfJiGFWzXV0PBLu2/e9u8r0EfPvBzJ8R1tR+vT8gDX9f6Qx/pSZMTuVoyZSTZlfbAmBmiJaXMPQoJuAlxguYobxPkihvq3uTV7GczBAapyy+/WFMx57rImKoa3BcZSC933CN7+1gGXtB7wny80DdS2wZxDuSd/L2jVRLE7+og/xGE2hXK2Hi72SmPuf7RBOAFExtL+ZKAhl9z8z0LoDPvSZEUF42IrfdQ6oezj9gwYFR4ntthBg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(366004)(376002)(346002)(136003)(39840400004)(396003)(316002)(6512007)(66946007)(38350700002)(6486002)(26005)(38100700002)(8936002)(66556008)(54906003)(36756003)(2906002)(66476007)(16526019)(186003)(52116002)(956004)(4326008)(107886003)(44832011)(2616005)(478600001)(8976002)(6506007)(6916009)(6666004)(83380400001)(5660300002)(1076003)(86362001)(8676002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cneQNH/IeTokipl9QzT6nlxk/5XKS3CEfi69vCWUBEfkBYZhwApZyRJmbxwA?=
 =?us-ascii?Q?wb+e2dbLQeN+Qq0cwbi3o4aGTMxMHNIivzvi70MKDyItK/vPqlyBS9Q2XiBR?=
 =?us-ascii?Q?MBY0iKVEtR612EdAqQsosYQgkOU8du70jmTEvqRSdksWP8SmqosnmF4wx02v?=
 =?us-ascii?Q?lhe77GY31xGS1COv+9DtcISgZnJKXOifGywJsvHyvzS67+J4yIjoKxKmUkMQ?=
 =?us-ascii?Q?Ocu1vsgAjq2T3o6sqdhvX+hdYZ3nzxACn8fbCoMxxhBANxdDlQH7OyGrbAFn?=
 =?us-ascii?Q?dQR4Rqz9A8ZvHAFdg6QROdjsAG3qjUKhOS5IXC/QLmEco/LX5EbZW8VZjGj8?=
 =?us-ascii?Q?34AANaEsVRRrm7G8ObSZ2CbTemrImrL8ZSnU+dGGKjDu0n2SU6Dai+cKgzFK?=
 =?us-ascii?Q?PJomfrB6fsjrcIbPUTNhbeuA0MW4hbDbVoJFUQVdz/Vlp8T+YjGyQG/IP74i?=
 =?us-ascii?Q?W/GdcPOa0WMQDLytNSQtJraF5lWZMlubnxq/PRrKGElqlQznsp1dfP8AbI6i?=
 =?us-ascii?Q?WPWO8/6KbEiRePy43ez+09BLtuoOBN3P88XIfOQOpnGfAnvUWD0DiDZAC4p3?=
 =?us-ascii?Q?CZsKoGnJuVHWrIYzb3ihjpyfYS9SSFmr5UxpzpyoWWNYjZw7iLQEMVuPIqIY?=
 =?us-ascii?Q?7W4EVNsN8OojXnCXc1H7hL6IJh8YPgWbIY6KGL828usGTK1dZbldnZ3gEQmg?=
 =?us-ascii?Q?r6i6RkItwy5fD5uMzq0F9EGR1YMZoABrs8AFAZHv21tqsRm58Gr1Aseus183?=
 =?us-ascii?Q?rJQAORcd/GyzpICpProaAtgTpBma6kFEe+eyqGdpVEzkq5Ds+mPGGnIXmYNP?=
 =?us-ascii?Q?KurE2q3W31hEDWAj95E+siQ0h1CMyVwzHXyvRj7fPJLF+w16Gp6B85b4z26X?=
 =?us-ascii?Q?QTHDt1RpjuDPLFcY0IqMHNchyhdnCymz/UAhIdW7UXWNG04qYS4IWJI4AZwX?=
 =?us-ascii?Q?segrc+7RZHb0KKiUfds+U1CZ+D9QR3K+CQwgteZRNMfTaXbsoKcJnvFxI4ti?=
 =?us-ascii?Q?ovSNZovykrCI0MkASWdfijY+PAMvZ7HV0+pT202AO4YmTYI7kaJDjVTR41WQ?=
 =?us-ascii?Q?qe1AUlZER9UX1Pg0IQqeOETNem9VT/Gi1X7ze5ah0lZLNtukbDnoi5mABbQc?=
 =?us-ascii?Q?8/d8EQF2/PtkAHU4SlrMKVLE2ZXuDv6fAe2Q2fA3VR848vgyL++jTC03xSkB?=
 =?us-ascii?Q?1GFTwYNDDs7qGfTIddNrJR2tj8VpCF+kRcqsFgye/NZhVHrXIeb8G4wLYZjc?=
 =?us-ascii?Q?zIOrLIy4Xw3NQOhGG+nqMQFYzqGg3qHz6PPFfSnhePV1Y1Y4pZD1AwtNYFj9?=
 =?us-ascii?Q?wYxJYMnVSCe/AN4fmszd+GTF?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: faeb9706-a6b7-4f43-06e9-08d93d452ac3
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2021 10:35:53.0077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sszC8x95L7EnYNd68bQPR7EXg3b8UxYstSrCJqTN70KJsVnB3ms0GCEdQ4jzaplw88uen7WMb/Jx4L94HGhdtxdfO4VC6M9FDjaMpbsWBDQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4887
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

vdsotest is a handy tool for testing and benchmarking the vDSO,
e.g. to measure the overhead of clock_gettime() done via the vDSO
compared to an actual system call.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 meta-oe/recipes-kernel/vdsotest/vdsotest_0.3.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/vdsotest/vdsotest_0.3.bb

diff --git a/meta-oe/recipes-kernel/vdsotest/vdsotest_0.3.bb b/meta-oe/reci=
pes-kernel/vdsotest/vdsotest_0.3.bb
new file mode 100644
index 000000000..5f9490910
--- /dev/null
+++ b/meta-oe/recipes-kernel/vdsotest/vdsotest_0.3.bb
@@ -0,0 +1,11 @@
+SUMMARY =3D "vdsotest is a utility for testing and benchmarking a Linux VD=
SO"
+HOMEPAGE =3D "https://github.com/nlynch-mentor/vdsotest"
+LICENSE =3D "GPL-2.0"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3"
+
+SRC_URI =3D "git://github.com/nlynch-mentor/vdsotest.git"
+SRCREV =3D "4ad733fb25364e4afaf4060e57c2429a93b686c5"
+
+S =3D "${WORKDIR}/git"
+
+inherit autotools
--=20
2.31.1

