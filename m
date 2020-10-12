Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web11.30166.1602463588212385310
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Oct 2020 17:46:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DkdEm3Ol;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: babak.sarashki@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ityb1qmlycBebpqIxIP1yZFLeYopFUgHVH0OZvuP4Oi16kK+y3dcn7rCgXFvPz/Pbk2yuxOhYX9OqcqB1T0V2HaMGI2xyekNGPy/840RpEALgfLSMgos16sjnPkf4X6CsQJdc/rdWMDvGWRrgxDwNSrw0TOb3IHxBAvyXkZ0bzCuglNbGa+ZsaVYhWbwqhROeoXt3D992fDZodETcNtUoGAScDwzjf8Eo2i/eC1aa//KeAYo7Ra4dUVLVuNefiE73wu1Eysdqg0fg1NmxeOf33tJC7uumVM4MHNVpl+cOuSA5WWosx/QHVIAJq4Arqkp1gkVo2/WqvmwrjpdGnZ0Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+IbBGWhTNUkzDggi2cEnHz4OoFGT9kvg56ufDWFR8HA=;
 b=YQhOAHKLSkRxCoRKrkL1rWRXLDOM+wJekGTWH+Pavyg5rYDcVIJhrHsm5Mkyw5dx4lnGcs73eA2ymqRTm4B9yoia02LWkaVEbvR+xORYu9SZ+TshkuP8pq/nfxun7uT+wRevv2+bSvmqbxNjzSv3R5Kc8yIu4HO1CaPHyl1k3caBLu0tjhj2r0omqvJs+HeOdwMxXtc2B3PjJ/npUFSPqTAntsfxwOmbtnMsigQUzidTVdOD3pMstKlFyBKgLkCzi1WwmfYCt65lnhKe3d+1M2bQaiwtpy55KG52/iRZuGledfIzhKysyLMj6xfwvpA1qrEgUyKbdX5NwrmbG1z/MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+IbBGWhTNUkzDggi2cEnHz4OoFGT9kvg56ufDWFR8HA=;
 b=DkdEm3OltHVFJbg4RV33DW3GzCkwjdmctOqvxSN2TiqO2MqME61n3SzJLLs/cg5rik87kivrSiNCPmbKMZHK/Z49ESttu7X6Xnw/hAzTXfbZ1zrvrNNIbyjaRnfqRbo+zv2yVfxWs82p+z3VTWwvjL/zv2YMTteuFJs2FTaclqw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2855.namprd11.prod.outlook.com (2603:10b6:a02:ca::26)
 by BYAPR11MB3333.namprd11.prod.outlook.com (2603:10b6:a03:19::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Mon, 12 Oct
 2020 00:46:27 +0000
Received: from BYAPR11MB2855.namprd11.prod.outlook.com
 ([fe80::2914:88c6:145c:f360]) by BYAPR11MB2855.namprd11.prod.outlook.com
 ([fe80::2914:88c6:145c:f360%7]) with mapi id 15.20.3455.028; Mon, 12 Oct 2020
 00:46:27 +0000
From: "Babak Sarashki" <babak.sarashki@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Babak Sarashki <babak.sarashki@windriver.com>
Subject: [meta-python2][PATCH 2/3] package-amqp: add recipe upgrade version 2.5.2
Date: Mon, 12 Oct 2020 00:46:02 +0000
Message-Id: <20201012004603.990-2-babak.sarashki@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201012004603.990-1-babak.sarashki@windriver.com>
References: <20201012004603.990-1-babak.sarashki@windriver.com>
X-Originating-IP: [71.198.98.210]
X-ClientProxiedBy: BYAPR07CA0029.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::42) To BYAPR11MB2855.namprd11.prod.outlook.com
 (2603:10b6:a02:ca::26)
Return-Path: babak.sarashki@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (71.198.98.210) by BYAPR07CA0029.namprd07.prod.outlook.com (2603:10b6:a02:bc::42) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.25 via Frontend Transport; Mon, 12 Oct 2020 00:46:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3b7b0c5-a820-40e0-e249-08d86e484037
X-MS-TrafficTypeDiagnostic: BYAPR11MB3333:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3333C8BE5D5C1C618871996B86070@BYAPR11MB3333.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:147;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	i7WSyvIEJUcxmoWzjJr2hLjfGAit/mm6V40FzPbJHbKJqAOxZ4Hgf+lCZVe+pVBbJNBAzUm2Qc8gnBYGzEVtLRjpFA91+VBbaP2qLhJ2+zARx935UQlVBzu/Y11NdR/5aCGQZfjdWcvSjKk+ypavbBP4B2qEeJnzma58j+KtylAZiFcR43HKgTA42t6Xjy8R+HBZR9lp+ppLy0NdO8BeG7BcalYS/erhTfzwAaa4did+B2JPgwYLGFfQHrb5av47p3aXuaJ5v13onJhTeGHCb4VXeKJ8iEPsQ9ZOD7hXDastcTD9y0CUzvseoFVR4JrE9cYJsZ8j+AwgLxDFiklawkSWBpcFCVXBWnmbn5h3FblRZz5F8jONUtLUfXuHMo4JML6pro51/MLeX5vTBb8no3cmhCN+zagugZeqV/Wbjm9IuSIW6oDFgnmOiOWz6DDQq1bh2LON6WtZFwDUTSHJ0g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2855.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(39830400003)(136003)(366004)(478600001)(69590400008)(4326008)(316002)(107886003)(52116002)(36756003)(956004)(1076003)(2616005)(2906002)(8676002)(44832011)(5660300002)(86362001)(6916009)(186003)(6512007)(83080400001)(16526019)(8936002)(6506007)(66946007)(66476007)(66556008)(6666004)(26005)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	rhc8csvJwN3AJpuM+Y0WG1zghFIKqHGNVoOlDRDtKYcGyceQgNFA6YuwkQJkUfPcCzkDHzz4Xac1n0vEkp7EY6vIvA1wk3o5ziwI9m3xRi5gVXXehQFbhHfVcWOSDOBKN1mr1GOFu1JcZimHPiGFzRy7WfNxeK3XO7+auX+4hwLd9m125JANIy8KD9enNt84o6cx7bShD7zYQ3GfLt2betJGleLsXJnFfN9KhlHiTGDRbyvdOdGOkRbTmwKVOYRPzUVg10sX/zetizbhZtEfWHbtx9NzmdNmfwNkjUp1bNTzaFizlReqQgkv+jt1V1gzwqVxPH8C8SK94U2gtiI3Wg/rU5CEOf2sZdh7eX0wec1FotJWwfNwg/cohrQvtp9m1Pc3vRRgHhddcurufJYr6gg9NB4rjua3eyB2fBeAaQUbA6Ty5Wi4CLCYWyxRwWSHRxeACmK9KHcZBzVX6+Qd/PGp0dzdNhJffJlFSYyCYsf0WmOSYYtrQjys9BpezIQcKcu+Q9XKUJbvOtIaTVZYmhsnGiJwTKTUWWLiWRdMPPw1xzv630pGuYc5QQf5gvZRiSYly5L8bSa9T+f7MoX6aHQ3AlNtveXmYkb5O9GFCyvwOw1nxrvxu52/KMS5WBQ4s/rSZC+nwyOlr4BZnT8MYQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3b7b0c5-a820-40e0-e249-08d86e484037
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2855.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2020 00:46:26.9268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RGHQdTOgV8F2lge4humC2qGeMw0em4yrJ/ZHKQlccbqroiq+8bfvKgD75oL8+nnJQIAyQRW94U/8pRVgtCdtB98XrVcVyKRQOYLJV+aTGPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3333
Content-Type: text/plain

From commit bd22d005259f90ad2b3f7e24e6b58805039093fe in meta-openstack.

Signed-off-by: Babak Sarashki <babak.sarashki@windriver.com>
---
 recipes-devtools/python/python-amqp_2.5.2.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 recipes-devtools/python/python-amqp_2.5.2.bb

diff --git a/recipes-devtools/python/python-amqp_2.5.2.bb b/recipes-devtools/python/python-amqp_2.5.2.bb
new file mode 100644
index 0000000..a8bb4a2
--- /dev/null
+++ b/recipes-devtools/python/python-amqp_2.5.2.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Low-level AMQP client for Python"
+HOMEPAGE = "https://pypi.python.org/pypi/amqp/"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9d6ba772ac59c08a25a12ce15bd5f27b"
+
+SRC_URI[md5sum] = "852ecff645c00f124c78915fcc8ea7c0"
+SRC_URI[sha256sum] = "77f1aef9410698d20eaeac5b73a87817365f457a507d82edf292e12cbb83b08d"
+
+PYPI_PACKAGE = "amqp"
+inherit setuptools pypi
+
+RDEPENDS_${PN} += " \
+	python-vine \
+	"
-- 
2.17.1

