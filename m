Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.79])
 by mx.groups.io with SMTP id smtpd.web09.21844.1609652967429902712
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Jan 2021 21:49:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=l21hxRhO;
 spf=pass (domain: windriver.com, ip: 40.107.243.79, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sz//oB7vag16/gDUebAukbNeN9tIfT2VNgRIWnDlu0ttY0oqjAxpLIfRilsMCQ6UVug6gi9SLiqtfRYpkn/w9JvcUIUSjtfA8ojVdO9/6I348xSLUR8bD6jGwIRYnYci2AURzNMnPf7QXtwTg+3seofbcfSZ9OUTFTUl6SLe3m5Dy5W/azgxcfuFdK7L2+DodtWV59RoVR/yOknXAK/8oHhNO7du18M1VPi1jKOvccJ48HlzVljsyJ7vA/XRT5foylsaoZWMVeF8+mXQENZBNPZ0rXb7PIW6olU8VA5rWXnrE3UnPCVEcqGUGKFxK++mjpmcackYDl7xqdGNWQ2q9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjvdLn7NTssOva/f7l/Q8ZncjgsI3l0z8l5ynluRGkk=;
 b=WNbx9aCUZP+FH2b4rkIKa42QttlxPKcljeklEFUo6Knim4yil7WCotdyZ93f90VVRPjqnIi2zvSr2kR90Bx54AgjG//1TGNbuDBFBTth1rpbcm5v/mJM4IvehE3nyfBXnjLZTrrfxwXCIuJCa2o/cbbTUeRZsjfgyPjQLoed5kUymehKC5d/Ait/P0Ysf63Br5SEwiDKx6ErAnEF6lYB3sNmUnwxKk6lgbCwhKvwcvsEvdPrUS8bQOG1+pjN7i46v8HlP4+hc7kMTvN/+VIKs/SAp6JM2/IiMJZZToSqHO51NxYsuBxwlTVTyKDvfc9SG6HiogRRYG3NaVcUdn8Nbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjvdLn7NTssOva/f7l/Q8ZncjgsI3l0z8l5ynluRGkk=;
 b=l21hxRhOFJk8ksa+huykBz03mr+n19xenRkwGhDCJ1ucBdRSWlHvszUOqcIOVnLtouQjVkxmgUCg4YxYHJsXRP7fSowOhewjK6Ryh8k2QiPMcYH2/28UadiOKaxslI0JBrrDfB2+q8A5fN7JSN8Dj8KGSzLCMfkNA6zkO9su2zc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1742.namprd11.prod.outlook.com (2603:10b6:300:113::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.21; Sun, 3 Jan
 2021 05:49:26 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5%7]) with mapi id 15.20.3721.024; Sun, 3 Jan 2021
 05:49:26 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][PATCH 1/2] yaffs2-utils: update to latest git rev
Date: Sun,  3 Jan 2021 13:49:11 +0800
Message-ID: <20210103054913.274351-3-yi.zhao@windriver.com>
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
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR0401CA0001.apcprd04.prod.outlook.com (2603:1096:202:2::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20 via Frontend Transport; Sun, 3 Jan 2021 05:49:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36687b1f-9bff-49ad-ee4d-08d8afab5494
X-MS-TrafficTypeDiagnostic: MWHPR11MB1742:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB17422E224C500D45B0B75C3DF9D30@MWHPR11MB1742.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:639;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Vq0gObkj1Q6Lie8nCckGUNl86kTb7NSUOEwJmbMMsQWjDnmHXp5qeWyG0EyOI135ndElGBFierXjdfOILCTBKx5yZaimpRd0pErjc+CvehdGdsSgDcM80PCPEMx4GamIwTGjgwEbHHY73RsFV+2grf+dGuFVroqlkIGR0b2pcEWNxZOuj4A4DcIp0oj/KghpO1ZF/ox7jJC+Oo/O8G7W16swNSHM0B1qm1EcS/FCUnC8Iad34+CBQF76fKeq/+iUvyKE2rxzEYjQip3iwcNseZlFa8CGGweanJjfRB+9znVdLEOv9eZZ9oWfVPzYOhKWf9FjiinJKIITlDGYNx9J+aU5Ti5mKrFfFdiIbRzIzwrKCSpThneOVboFpfKbQ1PYMUlHgJMs24DeaAar8G9Tb5XG/rObBZZgZreJpiKLPHcsmrzRngbvMg2HMh0P1k8EY815D/aAE6FuSDfi39v6Tg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(376002)(136003)(39830400003)(6506007)(316002)(86362001)(186003)(4744005)(8676002)(6666004)(478600001)(36756003)(2616005)(956004)(6916009)(44832011)(6512007)(6486002)(16526019)(52116002)(66946007)(5660300002)(8936002)(26005)(83380400001)(2906002)(1076003)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?1x2TUC1jCDSFy+ltgGa4GszoXj/gzctT0TA6M8Fjf/4WZQ3+2681PpjwQ9mI?=
 =?us-ascii?Q?XcOrAbZjFwQDlvWvpMTDHJQSSIA1letkZqcdloxNBkBcyDS7Iv2tOqHpebC/?=
 =?us-ascii?Q?HwvUqwDkqBkpOenUkdDAMJHDod5sJE7im/1qFMKESfZe+RdbftOQl5PrMYGB?=
 =?us-ascii?Q?GhZ9C2loJdK/3d3bbwGuQ+GBSeZ+6DAab3U9Hk87fhACKeF1eP7Ppxjgy01i?=
 =?us-ascii?Q?h8TpU54o68PcSjBdpz0qImtvG0XCdCYkvRqhQCRMd00x3kw917Y//jCrCKKi?=
 =?us-ascii?Q?Nv1cjDtHcqMEGwHA+C09UXtav8lPQMliLa4KzWJGfAD3JUQreKQ5d/1E4j+f?=
 =?us-ascii?Q?knNyuTNhaBmiLE1iqT7EMjZ9RgSVihWE/0TrGMaPg6JKRSW/5VkX/czwi52M?=
 =?us-ascii?Q?dhgXMAx+Fy99AUJXbpzbdLc0cUTTUScn6pXR9D/Ye6EAxukIErzzJQLLpy1i?=
 =?us-ascii?Q?71aifvLmHH2N7+gOnOakG7w/YRRAlFoZQ6Mhpow73nxSTe5V2vQzH8EJYZS4?=
 =?us-ascii?Q?odVpIBG6ojb90ruKFc0Va3f6wwcZ5tYI31j0Cc047GHBkjykoNrhYRauYkmK?=
 =?us-ascii?Q?Y0NMs+m9GqfnD0+KNkN+rrgp/CFrn3HhTbHLiafNTCBZ/8Pq0MO3UOmktufT?=
 =?us-ascii?Q?vbgtO+WktMdlV3SNmExq7tXZEb2z0XFJXzIe+qcaH0RWssSwE4vZbftW5ZF0?=
 =?us-ascii?Q?sGufO7AkJn54Lr9cvtW1YyGW5eIzXIoIn7KmIZfXjc98kKCD4NtGssSnCZXE?=
 =?us-ascii?Q?5qhTGIOyr9w/rCcf65dcNA1JR6wqrNFVGIxYngv/wfEETMGWi8dLEogV1H3k?=
 =?us-ascii?Q?v5tImig47zv9ILOnk1DIp09Rw8Xgt/i1VPPf6RX96vPDGWs9rRM8VXz8TkSD?=
 =?us-ascii?Q?A2Yfd28PEmK7IZXEYSavUPPJe6fLDs4ACFEGeKTEh+OzVmR/cAvH/j8xeB/Z?=
 =?us-ascii?Q?PPgiK8BOerQJDHW2YqLNaZ7ehHH3sW+RaO0UDRmne1sFVJWMw5J++RqZif1F?=
 =?us-ascii?Q?hS2/?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2021 05:49:26.5244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 36687b1f-9bff-49ad-ee4d-08d8afab5494
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XJk/DJCRPWsR/bL7IashWE9kl6ZGa/2OxR4cH62SSPlOQRc9KEARffYwuldn6Qx0loYHzOirYGrs1HDAUieVkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1742
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.b=
b b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
index 7ecae4c1c..bd0886d67 100644
--- a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
+++ b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
@@ -19,7 +19,7 @@ SRC_URI =3D "git://www.aleph1.co.uk/yaffs2;protocol=3Dgit=
;branch=3Dmaster \
            file://0001-define-loff_t-if-not-already-defined.patch \
            "
=20
-SRCREV =3D "b4ce1bb1b46accb1619dc07164ef6945feded9db"
+SRCREV =3D "9a6f486e56f927eeb8dc7e4e0d84f6bb95eeaa0f"
=20
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
--=20
2.25.1

