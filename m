Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web08.22127.1609652965455797646
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Jan 2021 21:49:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DUfmy5sm;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Myx46iHpQBpFKCvOEg9lnecKdDu2rkkI77A0mYk5MhGpovKcRRv21XKFntDp8KiNtFRuIp+CgzRYSd8OpWyhiAIdQKc4DEYkdMDU3lvv+Z/pQlxdsIiCXxCwrcp2+2XbUIT71Ce7NwEvQkZrNmkYoGR0xNUxRJpSHR7OXtYvKPuWcZhS2UvZDqIQ2KRYU8c1maLE9peEfTNR9G/ww9WMHagIcoN84YlhDZuQ4JMJfdERGs4uX1EZKNN5K0xqXXeZpbqLYMMPSeDMS/AN0zS8L3lTqoHHM/vRMJbyf3J4zFbUPtQQ/Pe0sQAClm7TgYPM7OMQWwd2wBjVZFdzVbR5hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+GFEgrU+gj0fLbE7C2GVRiXE4pv33UM0KEUw/yNuASc=;
 b=NnEF/IKafCdsWaT5b0vS+HRtBO0MWPPzJmhJxWpsZYQvuOiawPbCZANd3//dxJsOOtPfUsFBMf8NAW+LwbJFM8JOxNqIKEusrVF0F8rj3iSIeHnFMhFeXbISvQOgnBKGwFSVSJd7mLv7EvrIfWhkrEWHHTImFLRZ39GWvoD+KFRDzuMUe90yPKxUFrMR2g6PZFcLR10ThcComAMelpqogr5zb/RpK64nyKpmDL5VxAN+BHgAJbtYeP2YV+lfF/QXw0LnaT6Dg+Nxp+KEprXHCSdL88ggc1SDLpfb0PtwxtuOUgO2kJPJTxR3BSpv7EQhW71lif0Osy1xrefNBdfzAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+GFEgrU+gj0fLbE7C2GVRiXE4pv33UM0KEUw/yNuASc=;
 b=DUfmy5smx+sxiuO9EB7VsguSXAcqecd/qHMtiscUBHq+vJ7NdShopBYuI9rTXDfvjSwsKAi2cJPN+SN0fy5L0UyYDrsy/zLVXV3nGoYPL8PANASnIk2WNXysVvTmANUP+4BAcMg2/jHwLl82uyFAzIH/1myRcoLLW7j+5eDwny4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1742.namprd11.prod.outlook.com (2603:10b6:300:113::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.21; Sun, 3 Jan
 2021 05:49:25 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5%7]) with mapi id 15.20.3721.024; Sun, 3 Jan 2021
 05:49:25 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][PATCH] phpmyadmin: 5.0.2 -> 5.0.4
Date: Sun,  3 Jan 2021 13:49:10 +0800
Message-ID: <20210103054913.274351-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210103054913.274351-1-yi.zhao@windriver.com>
References: <20210103054913.274351-1-yi.zhao@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0401CA0001.apcprd04.prod.outlook.com
 (2603:1096:202:2::11) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR0401CA0001.apcprd04.prod.outlook.com (2603:1096:202:2::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20 via Frontend Transport; Sun, 3 Jan 2021 05:49:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30e6c4c9-1f22-47be-7961-08d8afab53d2
X-MS-TrafficTypeDiagnostic: MWHPR11MB1742:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB17426FC0A30B755E9040A048F9D30@MWHPR11MB1742.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yr156xNlw6VkW3XsV9DSW/Khfmy1b0ztLpr9d42GRSqAki3//Gope5BV6usxFmTUB8M/oS4Ntndl/cuKWuynMzRJxbT1GehiLOH+Pg9f8jzQR7WyJ68CcpgIeX6H1ZG+PB8ERwfQjFzuP4SmiJTojFHm3Y19ryr88t6dHLEJJ+g058lecQb6NmVktPIB6j920XYcAGTj5OPWUBsZdxBAwQVPdzGwpxyjnvsu7JGqwfhCMrLq5gkVMctVQpua0CvzZxSvoCN3Ku935ekO+SWeLPVztKs49ATdA8blmXsepu1YrkLecrOv2gwxnjsrz+Ov8+tZl+mGHNzLizTJc92WGO/lEGSYcO4ltbPkhzrzMPRUT5JoELVoqFilhJ1rNdh1IYVb8T9SnUaXfurAZBHQxrAOKAk1aaBlk1QaThrmXSxAQGcb6kAcNUwAvI+Eu86fX5xBVtO63Kl2LBw8BMvyjg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(376002)(136003)(39830400003)(6506007)(316002)(86362001)(186003)(8676002)(6666004)(478600001)(36756003)(2616005)(956004)(6916009)(44832011)(6512007)(6486002)(16526019)(52116002)(66946007)(5660300002)(8936002)(26005)(83380400001)(2906002)(1076003)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?f5j4YayglhXd5ojKFI3l0WoiRtW7C2AYkx3MAWjLzVLbZI/opciMGTdDGUTU?=
 =?us-ascii?Q?H98ikzcsnlfbOLzlG6YTYDIMVqktIFm61zEFBIPrtExAMTAt4ZYaXdmhkas+?=
 =?us-ascii?Q?I6bycwSOG+N5VJNmq3gK3Ga3LNw6dyRW6OOq4p3dGoDXKrmvJOM8zyg67o2S?=
 =?us-ascii?Q?SJWJVpmFtpDEYqoCXqGQdjn7P8S9HQOVlEddLOJ8mYSZ9M+ZShbrtyPtAYPM?=
 =?us-ascii?Q?SSIUIqFF6pKwGaWG+dmKMtMNPsbXuOgSFUB0B25r9Us0v5Rh1sPlD1GQVe0l?=
 =?us-ascii?Q?XB8Az5BmoIhvgHYCCHwhJ/5BlBAo1wCx08k87HWEWr9MoFkXOtw9cqvMlTDF?=
 =?us-ascii?Q?pA5QFxe0qyAdSVHIy+h6iZR/Vb/f72whLq6QA6/Hs4sGb8JKcLRyRP+476No?=
 =?us-ascii?Q?liHkbZ0dF2PwrNA/WPhXGjcPoexoK0+zRF2TnbjcOX1suVKvbOekmF2MvIPa?=
 =?us-ascii?Q?af3O3HQtTPe87LlPcwH94zFvlK0kb+kRUtxumnvz+F/MMncQA1Dy0jEX/ii0?=
 =?us-ascii?Q?xr3xzDkaHwJG7V3UoD3VdUSVhwCUBU1IBqc6BlChjjSnYDxOjHnzY9pnMMFl?=
 =?us-ascii?Q?J+mqtFFQQM7RD05XulQv8ZLQb4wMES5Xu13Z7gz8NuxEFTen/dM5oSTlpiPW?=
 =?us-ascii?Q?qkJ4ak/SLAR3Ulf/pG1S2HgU+2bracca0BDk+iTr6MJYzDb3fgnGrX13K/qJ?=
 =?us-ascii?Q?RRahdVXY7wRPgSzDf9JYp/0Z/wUQDstv0ot1njy1ApTHh9Nkf8H76/eYnHcd?=
 =?us-ascii?Q?M5huxDTyzSbOETinLGDmHlWnGVbLccV52z6Fg48jgdURCFBkDJ3K9VZMbS8v?=
 =?us-ascii?Q?OsUcb/cHn0kJwoS7pERieyLE/f0W5CDH4aAi4sv/zOPTnBUqS18zoBkxs0wW?=
 =?us-ascii?Q?1yGrg+twIAfifw9uweX0ZUWG5ojgYOOge849BR8aBOjqcYVgtVtIMBoDzkz9?=
 =?us-ascii?Q?gFLJyro7hYHMb3nejX7zOdqIesjMqiF8WuaC4YVhmqgqp6Qf+rymMlPOKrgN?=
 =?us-ascii?Q?IP4s?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2021 05:49:25.2868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 30e6c4c9-1f22-47be-7961-08d8afab53d2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ymMCSWpvn3Y5GEsnz3tgttckLIAn9Taj4yZyd/VUZdjjOr8POciuiW1Z6QSY1bElsZusDEYkv4MXCGZ8lJPdAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1742
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../phpmyadmin/{phpmyadmin_5.0.2.bb =3D> phpmyadmin_5.0.4.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_5.0.2.bb =3D> php=
myadmin_5.0.4.bb} (91%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.0.2.bb b/me=
ta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.0.4.bb
similarity index 91%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.0.2.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.0.4.bb
index ac878c5fd..43fed1081 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.0.2.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.0.4.bb
@@ -11,8 +11,8 @@ SRC_URI =3D "https://files.phpmyadmin.net/phpMyAdmin/${PV=
}/phpMyAdmin-${PV}-all-la
            file://apache.conf \
 "
=20
-SRC_URI[md5sum] =3D "442eb85912d3a2ad2fc0b9d6c21b1527"
-SRC_URI[sha256sum] =3D "cbcc78d1499308d9329950fcba2ebaa84c559a934fe54efc02=
7d459d8e4161c8"
+SRC_URI[md5sum] =3D "38c6b9f38e4aeb68a2840d5903dd00c5"
+SRC_URI[sha256sum] =3D "1578c1a08e594da4f4f62e676ccbdbd17784c3de769b094ba4=
2c35bf05c057db"
=20
 UPSTREAM_CHECK_URI =3D "https://www.phpmyadmin.net/downloads/"
 UPSTREAM_CHECK_REGEX =3D "phpMyAdmin-(?P<pver>\d+(\.\d+)+)-all-languages.t=
ar.xz"
--=20
2.25.1

