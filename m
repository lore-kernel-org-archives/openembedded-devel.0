Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.40])
 by mx.groups.io with SMTP id smtpd.web08.5784.1608270243931008081
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Dec 2020 21:44:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Aqna2fwp;
 spf=pass (domain: windriver.com, ip: 40.107.236.40, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IMxUllayYhG6B0YiO3qk56B5o6ff9qgX5qukaRjnqvgIeVTmbGTwhAbyr5gkjzG66vkYgOl9o3dNs7e5Nr52s/y0CBy/B+7p3yWey6I7ym4GRPvOfAUHZ0v6KKoNE9GzVSqfLtYPI+Dxkvp0/kI/ro5TS/9BQFIZCXEmrCiFeqS+WUHo19O+/rElGVBlvwc7tn0mDH3235AZwbyGTC0Ckx2Vim1ju2gK7hBHI6A9wUNbxdPPiDoWR1/BcEBuZEOLqi56C/ItUueduGZOWfyWawAAR/8Qoo97dg1EGmziDg3TmqEHFqTrwA+sNfxmDpeP34VprGD2OWiGk9lqJ6o8Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eeJYboBe23Y38evA9ZytRUt6T0ADhEOFA77rLxdJk0s=;
 b=Hamw6Ji5wuzGZBipFC9l5zxtO/UDf38FlNkvFwgwRK8fJxjzOHH3GRTP+xU7gx84QMhPJtokvl6s89JbwP4QVNfTcEkYTzSweY7mUFyC41CewBx2LS3B3yqP3FWGAKaIbhv9wrC1SNr/ei+HjT52u+PyaF5sHJ9rQf3De9wBnwoggSbGrnKHreCoQrYZRwOMHMpdMxETlXwsEtvMJhHNLDOKW3E6oQgBxd3oaGwgwnOn1qZB0S2/q3p3QNukYGnYAiccYZ7b4OlIPqehB4h+cGiXIuTXKlabFOiS1Nv0DonCncF8l9bKR/TYgttm66IJw9vdGrUiBpPI0H9Prs2hzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eeJYboBe23Y38evA9ZytRUt6T0ADhEOFA77rLxdJk0s=;
 b=Aqna2fwpxnJdlfD6mnSWy+v+7064nZ3D4G+ZT06BwPU7jjh42w0gRma2k0WXLf+EET3+Y/7Vntx1NzX+mbxIpj4W7xFbRgAVOY1HKuNHtz27CuSeIAGNU5+N23amffaFXRxylFbJK4enM0X2s5moS1k5gheyl2ibTN4Zp4yeSEU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Fri, 18 Dec
 2020 05:44:01 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5%7]) with mapi id 15.20.3676.025; Fri, 18 Dec 2020
 05:44:01 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] multipath-tools: fix error handling for udev_monitor_set_receive_buffer_size
Date: Fri, 18 Dec 2020 13:43:50 +0800
Message-ID: <20201218054350.112118-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0213.apcprd02.prod.outlook.com
 (2603:1096:201:20::25) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR02CA0213.apcprd02.prod.outlook.com (2603:1096:201:20::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Fri, 18 Dec 2020 05:44:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac43d46c-cc78-4832-8d15-08d8a317ec5d
X-MS-TrafficTypeDiagnostic: CO1PR11MB5076:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB50760F5BC761F3E0B3DD2C87F9C30@CO1PR11MB5076.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:565;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dM+2yE66PlB+uOkAU27BJpIvC4aWLywoyEe7Q9cz/v0n+1NDP+rqq6JWLnPHST9SM7uCSkakEUonJKWSpumq+G6BvqGSPr0dN8FcPQoBP4ttqRv+B86KWUbGXzTzihjSEWCVFDNdvY/o5pT60LT1PK1jSz+AXQ9z0D9t+yO99TBIUgsQ27cHN+g1bFOBf4fUhgDIuDNQepYUn70N9BeX9lirM2k46KkkLxeKOmkUHwTm0/fUPCYw/THbYPBY8F32bSU/Tq709ghG9wAjDRePJZUVVtninn+9X2CnOA1TWrzjDfvHVH1CaOvitlvHXeWFvCC2vJ4YQRK3pYZIrSI+py5AOoiPy1si9cLCqSYOgQm+D9uZnlRSNGDTiByoDUnJ9f2KWfyvwHiOSFQpmHNqYw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39850400004)(376002)(136003)(396003)(966005)(8676002)(6486002)(52116002)(83380400001)(16526019)(36756003)(6506007)(44832011)(66476007)(2906002)(186003)(1076003)(66946007)(6916009)(26005)(316002)(2616005)(956004)(6666004)(5660300002)(6512007)(86362001)(8936002)(66556008)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?OZlwUGmNlPEBjlKzAL6pqA6IS6e7xxbjvTvtr5CmMkZRgPc7YdTN5WuOj3eA?=
 =?us-ascii?Q?eJ4H/1lYYlHSJY9reU+usWBTqYhcQ90PuxtRkAHbu+/j9B7pwJnwkTeAx48j?=
 =?us-ascii?Q?eZ+2/ZJJEO0WXKdUQxZhxcoDxmDkobPtq+ERlspihYrmow7VcQ6bjI/7f6rb?=
 =?us-ascii?Q?t12P2CwZygPyUbqZSdl40V5HGYtGhjEAy90ydhxiOyMxJNLi/Rq1rFg+fhdg?=
 =?us-ascii?Q?qpWZX+z0AOcx1+3hO/Px7lejhBAR3cQfc/4wvLj8CtcxA4n+jMtF4aKp7rR7?=
 =?us-ascii?Q?R5FQuVoerdGGi4OzfeSrAJp5zqLtIcxVKkMNCzeBYWP0QA8IPkYPy2yGT99T?=
 =?us-ascii?Q?bGWnbmrnLp28YLz58I6z6WbEt4uxde+dYDEZSl4h4ZIRUxJfD2fs+ZLWMb+s?=
 =?us-ascii?Q?Hz3NlxTa2w8iPY7TD4O787PdQAQAZid+6zU2DbzjvtgpAbjayIM2wQGw9Oxt?=
 =?us-ascii?Q?eOvxxzm9XGMZfwbJO+JNYqG6NAFULvu8ueKvGnWJ8PZPfoQCJ+MIQLjBQ9Ze?=
 =?us-ascii?Q?MJeA3zIrxjVADno0wS/DnHm3DyXDd+iKBg7LXnYlzHA/42zSKN17JWHtncap?=
 =?us-ascii?Q?RJ8pV0/O9aZ5FL7QuQGwp0sTOr3KKTmPtTSp1kNMZf+/8UOLSLeN36Y1rQyD?=
 =?us-ascii?Q?TxCMwVaIZV9MbUq9hr3zuvvSjUh1OetA5Cbj6Zhi/maNDKfeoaOT1dJSG2DK?=
 =?us-ascii?Q?0bQa0Jow1bupFzjqHea2H4GP/XiDUrD1iq6Iwhq4sRcMbH7mXVwS+v8xTxRM?=
 =?us-ascii?Q?oa+D6Q+5KmAQYKEO676toWvFfLL1zYbdoLeSxAhGIyWiK/j3Nvt1SAx1FUmc?=
 =?us-ascii?Q?ev0qK+q2mF856P1bI1s6jHtrVPMSYLrIu3LUV/vwTODgxmhmkbSB0TaI0Vz2?=
 =?us-ascii?Q?KZTownkFCggyQb9fTL9g+Ri8i1zmt2Y+CMrwH3NCCm5/ElgAyCLj7k8KPcpD?=
 =?us-ascii?Q?Uaqfx8AwREn3G5Qr2g2KSGXNG4tFYoG7gCidJ3CuGlI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2020 05:44:01.7277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: ac43d46c-cc78-4832-8d15-08d8a317ec5d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lex1GwMi93Rp+tnLVJo3lBpslNizhvvSJbyjpOd/WOMQ4a+O5XOtePeApg+UbCJwWGPjNlJJGujokAJN+ctXlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5076
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Joe Slater <joe.slater@windriver.com>

Since systemd v246.5[1], udev_monitor_set_receive_buffer_size() will
return 0 or 1 if successful. We only need to check a negative value for
the failure.

[1] https://github.com/systemd/systemd-stable/commit/4dcae666889ae9469e4406=
c0bcaffadbc01c4f66
    https://github.com/systemd/systemd-stable/commit/fe9b92e566f837665cc06c=
82374e4e42f9295c99
    https://github.com/systemd/systemd-stable/commit/5dd4cc4b10daea5d2ba969=
425ba02d2098dd06a4

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...ent.c-fix-error-handling-for-udev_mo.patch | 39 +++++++++++++++++++
 .../multipath-tools/multipath-tools_0.8.4.bb  |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0001-libm=
ultipath-uevent.c-fix-error-handling-for-udev_mo.patch

diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-libmultipat=
h-uevent.c-fix-error-handling-for-udev_mo.patch b/meta-oe/recipes-support/m=
ultipath-tools/files/0001-libmultipath-uevent.c-fix-error-handling-for-udev=
_mo.patch
new file mode 100644
index 000000000..d261b13d9
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0001-libmultipath-ueven=
t.c-fix-error-handling-for-udev_mo.patch
@@ -0,0 +1,39 @@
+From 8579d8a35886f91974e0ac4dbdf2edb7dac06d52 Mon Sep 17 00:00:00 2001
+From: Joe Slater <joe.slater@windriver.com>
+Date: Fri, 18 Dec 2020 11:17:50 +0800
+Subject: [PATCH] libmultipath/uevent.c: fix error handling for
+ udev_monitor_set_receive_buffer_size
+
+Since systemd v246.5[1], udev_monitor_set_receive_buffer_size() will
+return 0 or 1 if successful. We only need to check a negative value for
+the failure.
+
+[1] https://github.com/systemd/systemd-stable/commit/4dcae666889ae9469e440=
6c0bcaffadbc01c4f66
+    https://github.com/systemd/systemd-stable/commit/fe9b92e566f837665cc06=
c82374e4e42f9295c99
+    https://github.com/systemd/systemd-stable/commit/5dd4cc4b10daea5d2ba96=
9425ba02d2098dd06a4
+
+Upstream-Status: Pending
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ libmultipath/uevent.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libmultipath/uevent.c b/libmultipath/uevent.c
+index d38e8a7f..4b298052 100644
+--- a/libmultipath/uevent.c
++++ b/libmultipath/uevent.c
+@@ -810,7 +810,8 @@ int uevent_listen(struct udev *udev)
+ 	}
+ 	pthread_cleanup_push(monitor_cleanup, monitor);
+ #ifdef LIBUDEV_API_RECVBUF
+-	if (udev_monitor_set_receive_buffer_size(monitor, 128 * 1024 * 1024))
++	err =3D udev_monitor_set_receive_buffer_size(monitor, 128 * 1024 * 1024)=
;
++	if (err < 0)
+ 		condlog(2, "failed to increase buffer size");
+ #endif
+ 	fd =3D udev_monitor_get_fd(monitor);
+--=20
+2.17.1
+
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.=
bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
index 331c0cd01..186f78b8f 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
@@ -47,6 +47,7 @@ SRC_URI =3D "git://git.opensvc.com/multipath-tools/.git;p=
rotocol=3Dhttp \
            file://0001-fix-bug-of-do_compile-and-do_install.patch \
            file://0001-add-explicit-dependency-on-libraries.patch \
            file://0001-fix-boolean-value-with-json-c-0.14.patch \
+           file://0001-libmultipath-uevent.c-fix-error-handling-for-udev_m=
o.patch \
            "
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5f30f0716dfdd0d91eb439ebec522ec=
2"
--=20
2.25.1

