Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.55])
 by mx.groups.io with SMTP id smtpd.web08.1290.1609292578429605430
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Dec 2020 17:42:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=l86bW20J;
 spf=pass (domain: windriver.com, ip: 40.107.223.55, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oPXFdjU24OWJbk9BJwqRpv72Ww2fk+A6APMEJC6HSwyl9j8bG89AI+3THsUD0KW8nqbFNTdJhXGfhJg0f8TRlsVXNyOWv89lXLomRQ4BFwCyvf5eyHtjdfqopi0ii08cLTGPsJQCXBe3tOT7/spbA8uibuXv8PBHwpSW/pWqXbSayUUW6XCMeL12ICVM4BGG69mLFAKp8oWb5ZVdMw3cCLVdHmaSFCKlYGSpzr+1mQp2dbQwqQRoOQoQDWGtELDYOutHDtJaA/KVJZQ1t+wbdngdGhyOBtOn7PKgH8ujkQbq/e70serKMdqXzGv8q/WynYsui4mkkeITHWIT9jNRrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tp7TzvmhNCgOrN1H/oiBiwvM9f2LrUiOXKYP3lT9O0U=;
 b=G7Qm3pBvS1rdpiUnWAQCWh5RukZVkL77U8CaW4xyhHI3rUO198tY8AVkTV0Xq+Sawid4YDwNs5iYpjjmEZPKhdRX/sRDnnUAH+FM9ZVJ6Ny57HkIuEAsSKi6O2slmSJqWmokm5yk4m3F8r1hkurdaNFqlcdgOg7+lMWhlt1L82d2+uqS633TuiegSO2crt3Il3I67OgOuwUNjWG++9JD94KiL+Sk6e8htT+zhTk8APjwKW6+8xjlQiCHHUWlW3dRfOK6JHJBFwVXn9yNgnXySV64wgEJ/JzBc9O7RV9oZ1KB1uGmFdfn9Cnp0a0DftFEgoN60jorcZ9thZj+BNA5oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tp7TzvmhNCgOrN1H/oiBiwvM9f2LrUiOXKYP3lT9O0U=;
 b=l86bW20Jj5PYcWyi3KukoN0IYldHxdsWbCiK4L5y8Xl4aFQHFsO/z8Cotra56PF3oKByDEUSUs0gQwV07ms37cdBNpJTK5ynxTKUUr/MVknTBYuV82sxoKCFQei6OquX7gcKIRdiZYlZMatCC5NOPLUXJcGT34AgS20V0EUeywc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN7PR11MB2548.namprd11.prod.outlook.com (2603:10b6:406:b3::19)
 by BN6PR11MB4131.namprd11.prod.outlook.com (2603:10b6:405:80::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19; Wed, 30 Dec
 2020 01:42:57 +0000
Received: from BN7PR11MB2548.namprd11.prod.outlook.com
 ([fe80::2cab:3fc4:7f35:c8d1]) by BN7PR11MB2548.namprd11.prod.outlook.com
 ([fe80::2cab:3fc4:7f35:c8d1%6]) with mapi id 15.20.3700.031; Wed, 30 Dec 2020
 01:42:57 +0000
From: "Changqing Li" <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/2] nginx: upgrade 1.16.1 -> 1.18.0
Date: Wed, 30 Dec 2020 09:42:43 +0800
Message-Id: <20201230014244.759-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR04CA0015.apcprd04.prod.outlook.com
 (2603:1096:203:d0::25) To BN7PR11MB2548.namprd11.prod.outlook.com
 (2603:10b6:406:b3::19)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HKAPR04CA0015.apcprd04.prod.outlook.com (2603:1096:203:d0::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend Transport; Wed, 30 Dec 2020 01:42:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9ae56f0-6b76-460c-a265-08d8ac643bc7
X-MS-TrafficTypeDiagnostic: BN6PR11MB4131:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB4131CBF0C2541D378B8EB0A082D70@BN6PR11MB4131.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ab0D9VL3IGJnX/RoQ+O/YEcPmpEHe6M1EjJRwzCVv43mSeq0b4SqH16fjeiJRb2+rlMmvmFsQW6hm/UsiDcdXuME0Wll2Gzg6mmkv1jdFd8VaU5BbbQrWBCQ2Gt7M7OyngDRVpYs8Xl11PXQpKHiN7EJy5e+trICMVsSEhnKG2IvzQhbtTudbpHnKnXG7xOfgGiNE3bIsAU3noA9IyC+k2ugO8NWd46ZOustCOf7kRpmIHcC9igSCsK3qkauQuwBmfdtdR5VR9Ek+WDA8nU2HhCOdjuAWPL5t30K+qkRt0M3SGQ4ebyL1XAcYwjIXSLh018OGDy/NWAFwtGfF6YDsnfqOd87MD86kQtRBZ9qzRO9Iie4fnBvTu068p5YnOywall5mmnta/HvaCr1cNnkYg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR11MB2548.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(136003)(376002)(366004)(346002)(396003)(2906002)(6916009)(316002)(2616005)(6512007)(8676002)(5660300002)(44832011)(83380400001)(66476007)(8936002)(16526019)(86362001)(52116002)(6666004)(6486002)(36756003)(1076003)(6506007)(186003)(956004)(66946007)(66556008)(478600001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?GDi+dW5y8TGJaVmHRJ0Y5FgVV1d6/znhok9URUZOsNKAzaV9K+4NvpkftudH?=
 =?us-ascii?Q?IF3VNqIx0aRQ7h8pPnDYF/BplDtI6RW3b+w5SG7mhX4yM8AJ12Y1K6nRT6jt?=
 =?us-ascii?Q?gMsBKcHz2JLpl22QSxfaNGtuAumVLfjDu1ENktjJ3bcd43FShZPLCGJ7Ueey?=
 =?us-ascii?Q?Tl76pY3/mefjhQiZJuSonGbHJDM8ooyrurlcycXoZ8cvanvFB0CS8Ec/NgWt?=
 =?us-ascii?Q?B3KGcf3qFs8SZOri2xsutXU9LB1Fwv3ZI3YqcpOKlywLuUE6v/ENAlYBtkZW?=
 =?us-ascii?Q?2E/hrde4U7H5ghUkEjMqVhxoXS9hHjSwGNa1d9cBxTqgM9bOin38Yv0UEbr9?=
 =?us-ascii?Q?rzCAi5GOLB862qlAJ0FuDflsijPzkMcc2ZfhJZWDqhvrKucUpcHiuNyKyRhn?=
 =?us-ascii?Q?E+hHAHtwQ/yEexwrIw4trHLnrNSBMuYKrOagHn7LXLo42BGgGcm92h3YBfCf?=
 =?us-ascii?Q?zYMHbR7P67RhIRhvX70x54oAAA9Qcc1axgtAsqlcw3DwJHTc2W9KalnZ9LfX?=
 =?us-ascii?Q?tUyE8h/BlYZHmWYoVLXPxAbfmk9RvKthMXuTu03VUzDzkbqqj0vPdpFgc14F?=
 =?us-ascii?Q?p4v4l3XOz1JaBPU5hmQF7jf5gNOkSHWNhy8s2Gc7gWDJwO1D0MPunf0HboCj?=
 =?us-ascii?Q?vDVyvaqo/ki3IazEJLsUn2artZh1VXzy5q2jXUUg6oftzM3H7HcsGxD9vnwS?=
 =?us-ascii?Q?mBdvEQNG7yFgNhZA2wJSJOR6R0EQQ4lWTrZOrbls8ucmlPJk258XRs8QPsOo?=
 =?us-ascii?Q?1oLUPF5IKEIXkux9aZfCObXarZfGqAt8KJ47SwA839ZedX2DbFHBohnyE1D2?=
 =?us-ascii?Q?wZHh6QsJz/jVV+EaZjyw4ORRA5xNNXv44G/XLpA46fWb3u4mxekmdSlq1UOc?=
 =?us-ascii?Q?SmdHImXxCfNr63DM4X0PLEZkeD1+fXY3G2c58KlLU+9IF2X16xSRxtQsuljz?=
 =?us-ascii?Q?VmqOCFQ7f4wyogMvPdK7jSyTttTsTv+cqqX/jUig5Oc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2548.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2020 01:42:57.0722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ae56f0-6b76-460c-a265-08d8ac643bc7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SX2NZVjvYim/zwyub3TpnHxlmiXbxB6zJ2wYMHvVoDYFCFHcJDd1zqBxM/2XK4mtTLKFLN81ElX6Y5Mp6g6vvkLTVtK8cimY27mtuNOilsI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4131
Content-Type: text/plain

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.16.1.bb | 6 ------
 meta-webserver/recipes-httpd/nginx/nginx_1.18.0.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.16.1.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.18.0.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.16.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.16.1.bb
deleted file mode 100644
index 207642575..000000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.16.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require nginx.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=52e384aaac868b755b93ad5535e2d075"
-
-SRC_URI[md5sum] = "45a80f75336c980d240987badc3dcf60"
-SRC_URI[sha256sum] = "f11c2a6dd1d3515736f0324857957db2de98be862461b5a542a3ac6188dbe32b"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.18.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.18.0.bb
new file mode 100644
index 000000000..ac303e47d
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.18.0.bb
@@ -0,0 +1,6 @@
+require nginx.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=52e384aaac868b755b93ad5535e2d075"
+
+SRC_URI[md5sum] = "b2d33d24d89b8b1f87ff5d251aa27eb8"
+SRC_URI[sha256sum] = "4c373e7ab5bf91d34a4f11a0c9496561061ba5eee6020db272a17a7228d35f99"
-- 
2.17.1

