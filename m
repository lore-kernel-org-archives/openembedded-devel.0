Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.83])
 by mx.groups.io with SMTP id smtpd.web12.259.1585090146556374518
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2020 15:49:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=m5jRdYzp;
 spf=pass (domain: xevo.com, ip: 40.107.92.83, mailfrom: mkelly@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQ7hlLRCAhe6GzsZ7OxFprMSjO5sBz1yW9ESucc58hlQAMT+nlnscLzdrikjurisaajFHBBXXFC0ztylToz+zmnCjOnZEx0ZNeQ4LBLycDD6UU/91sGquygaTnJeqIoMJ7dIfmBMPfw5xaCT34jVjToLtnm3grWkNVHANpzhiHlVUQR/jYDwxAP2SAdkRgK+6kK0kzWwfflFvcZ9NDlNF+u/F4+cqf4syKNuzoNDtSPddBo5HVNkeY5eqmsAtt+9ev4pXBfmLwiD029s1erdj/sMX7v3h6GAnNOM4WVwBJK3Ccb5UlNnaoYds1AcTT+5u/rScjP5LgVxzAnCvS/zFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jK+zXYshbR1TtFH3cFmpav5LJqBItbMPAg/Oa6EXYek=;
 b=gIiB1r78aKntq9qx5soILrw5M+/Px4nM4E/wwSijgnYWX39m3P1g33JfUwd0OQLDWnUikXfMVCpAeW44D3sMLQLbXmZsnSzgBCfL/6vrGbpqUzaOANuZICubssPRxCvzgfOMarH7Jwq/ppZE0EE+pndgRe36tuxCzis+mIll8w+WYZaXN532Y2PArdCQczBHUj6QHHrm7/AmHC00DKywgzFuBIoJpM0tGudjucTqdcQA+uBD/yFvyl3mW5xMLdiZb7M64quUE8mjiq2Ry2rF8jiHwG3xskwTfHxDmo8RmALk3o0VkzSlhPQppy2+xqdlBy9dHOCqBOOxrqHwq5zPBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jK+zXYshbR1TtFH3cFmpav5LJqBItbMPAg/Oa6EXYek=;
 b=m5jRdYzpq0AotBOZBhoFpMPVGLi7cIl6vt2yVWYhrkQJtoRll5bUQBWDUG7CLS8RdBZDWn7gJy8J+tdegmHF/o8UoIc4+DkoWUkcGEmkaPZgDrN72ARdYgwLQn2i9VDEJzHsblBpONNlWaGq7Cnrk1S9n1uVloS8DWsoc/f7sTQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=mkelly@xevo.com; 
Received: from MW2PR18MB2236.namprd18.prod.outlook.com (2603:10b6:907:7::14)
 by MW2PR18MB2091.namprd18.prod.outlook.com (2603:10b6:907:2::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Tue, 24 Mar
 2020 22:49:05 +0000
Received: from MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0]) by MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0%7]) with mapi id 15.20.2835.021; Tue, 24 Mar 2020
 22:49:05 +0000
From: "Martin Kelly" <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
CC: Martin Kelly <mkelly@xevo.com>
Subject: [meta-python][PATCH 01/17] recipes-devtools: remove +x bit
Date: Tue, 24 Mar 2020 15:48:27 -0700
Message-ID: <20200324224843.752394-2-mkelly@xevo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324224843.752394-1-mkelly@xevo.com>
References: <20200324224843.752394-1-mkelly@xevo.com>
X-ClientProxiedBy: MWHPR22CA0068.namprd22.prod.outlook.com
 (2603:10b6:300:12a::30) To MW2PR18MB2236.namprd18.prod.outlook.com
 (2603:10b6:907:7::14)
Return-Path: mkelly@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from columbia.frontierlocal.net (50.35.85.47) by MWHPR22CA0068.namprd22.prod.outlook.com (2603:10b6:300:12a::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19 via Frontend Transport; Tue, 24 Mar 2020 22:49:04 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [50.35.85.47]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34a3f6b0-ca97-4b46-d74d-08d7d0458de9
X-MS-TrafficTypeDiagnostic: MW2PR18MB2091:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MW2PR18MB2091D48A7570EAB2CB1D1C5EABF10@MW2PR18MB2091.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:473;
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(136003)(39840400004)(366004)(346002)(376002)(396003)(6916009)(66476007)(186003)(478600001)(16526019)(66556008)(6506007)(5660300002)(66946007)(26005)(956004)(4326008)(36756003)(2616005)(6666004)(1076003)(316002)(2906002)(107886003)(52116002)(6512007)(81156014)(8676002)(4744005)(6486002)(86362001)(8936002)(81166006);DIR:OUT;SFP:1101;SCL:1;SRVR:MW2PR18MB2091;H:MW2PR18MB2236.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: xevo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8Ndyh+18n1ECNTDJdh+F/EXp18FA51l7kUYVzeBs9jZOGQH4GTyKyBpkz0cYZ5Vu0iCDmAYBAq1X8WLkcQ4Lc0HwZ5nXvrfEn2M7JkriBHJuGt40cEFcKTJ8IRrxRWAq3Knl+z5VKEWNK49nfR/5H6jSWnt3kMJANt70ElklrQ3APRCFD6fRujOP4KRBbMZ7KifeIgFvK0QEYogbvTPFePKNWtLcVo6gcLDyEqUORurJpB/xrFJg2qQ1Z10FS7nCWNIW1NCl/COIJt3U1sjye6xroYVV4PbQaWpsqtfd/nDPKrovnml0Y4HejGC5TRJXnZbB/T+HqRxmOEEQWo5lbpLkQzSOSUBXMFCL7FPe7I6gK6iytmJSImE/JZU0XJ/z7NnS+jZ7TXNdf3XCGUL7adB8bybJV3GEz89t0Jb/+cFH3EUu6YHKUUP1h0P45GFX
X-MS-Exchange-AntiSpam-MessageData: 
	OF6fSrsi0N5RU6LksP3EfOjZfVleVoFWGgrBKolNrkT6wL75WPUoyPYaU08ZmSlcQV3gqy0NoCZBI3KAIbjgYy+UEZiOWkVkB+UG9INh48GO7iBWF7+l+ZYrDKoy5jEgwE0GjOJZy+hkQMqeCWiFzw==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34a3f6b0-ca97-4b46-d74d-08d7d0458de9
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 22:49:05.2765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0irDh3DaA6oaACBA1hhu+KKvnLFzpi5CIUN/qaY1GFO2pi+7NlZOWy3CzqmoNiCs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR18MB2091
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

The executable bit was erroneously set on these recipes.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta-python/recipes-devtools/python/python3-pytz_2019.3.bb    | 0
 meta-python/recipes-devtools/python/python3-regex_2020.1.8.bb | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100755 =3D> 100644 meta-python/recipes-devtools/python/python3=
-pytz_2019.3.bb
 mode change 100755 =3D> 100644 meta-python/recipes-devtools/python/python3=
-regex_2020.1.8.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytz_2019.3.bb b/m=
eta-python/recipes-devtools/python/python3-pytz_2019.3.bb
old mode 100755
new mode 100644
diff --git a/meta-python/recipes-devtools/python/python3-regex_2020.1.8.bb =
b/meta-python/recipes-devtools/python/python3-regex_2020.1.8.bb
old mode 100755
new mode 100644
--=20
2.25.1

