Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.44])
 by mx.groups.io with SMTP id smtpd.web10.2312.1592354820594621513
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jun 2020 17:47:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=i5ku03qu;
 spf=pass (domain: xevo.com, ip: 40.107.237.44, mailfrom: rrowe@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sjzi7jEob7ZXr7Ng6GZtg9OGvlcawgJcfiHhS33tS4GQoIem99Wvtm3R7xGX4Pfw6jxSP5bMI2KsPAhD3eXuOwnh+6uMks379xc8oJZJq0yc9g58Am9Wmu4t/C5sc9RjtzneqlBcpX0d+GL8leTLWSzhE2pnzTapD/h086HZFJNOVfX2mwmeY0p11fXNweN/2N9dPhimbvk/BpvvwobBRHuGKjyTp/L09KDzWCQcVTsGN236zLCe/PNUuWE7YWRgI+lYQREVOlu4SvMOIT2zi+PPqTdqE1xdIoKXA+SnJJxWcYhzgdTyjtgkuIQlFsdwzS1U87eH/an9yKVNEmAoNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zH9U+Gnq4WykdqkPtkGo0fR7YXCXaTJ0r9f4vvMO/3U=;
 b=ap0X1pMyT1qiP6MFAtOjcoVCXy4wJ7L1yA49QEHf9bNfx96ZoaJ9fQ4ttpi7hVri+QBK5MtiHlS0ovOhx4CJ86VMvIB/Kr2Jpd9gj6RVPJuoYA5VQdFe8bwIuhUyw5G0zuxDnyJ+KhqjQjXcatk6YGL6Pf6NM0+qcR9aR6qYnEaB9Iw384usniG0zsWIKGpoVEyTna5pqncL/QXwcU+d7RG/wdMBTCLFLcdWqO/o//JSsdX4966UqZgrn7JKEnwPz7K3u5N7huqd6G1T71uX5Vlg6Te3EzjrwnX/woXCFR9cN5XyvORJtcAT06bsbTHbvXKfo3IRKIky4hRbozxXdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zH9U+Gnq4WykdqkPtkGo0fR7YXCXaTJ0r9f4vvMO/3U=;
 b=i5ku03quWaH3gnLhFaqgURi7ItPVGLbxTZtnlD+8XGxrlrLA0mFuNFjmvDRDaCb1mtxeFv6LQw5HlWODiv0yHcriibSUHRdTR6PKdIkuC71888fVhuio+p7bVap5qsugEiX7dg7DcQsG1NJLYOAPzlhzcQkLbXf+nuAlj5xLDAQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=xevo.com;
Received: from MW3PR18MB3659.namprd18.prod.outlook.com (2603:10b6:303:53::19)
 by MWHPR18MB0992.namprd18.prod.outlook.com (2603:10b6:300:a1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.24; Wed, 17 Jun
 2020 00:46:57 +0000
Received: from MW3PR18MB3659.namprd18.prod.outlook.com
 ([fe80::3d7f:edb8:f540:5050]) by MW3PR18MB3659.namprd18.prod.outlook.com
 ([fe80::3d7f:edb8:f540:5050%5]) with mapi id 15.20.3109.021; Wed, 17 Jun 2020
 00:46:57 +0000
From: "Ryan Rowe" <rrowe@xevo.com>
To: openembedded-devel@lists.openembedded.org
Cc: jbroadus@xevo.com,
	mkelly@xevo.com,
	Ryan Rowe <rrowe@xevo.com>
Subject: [meta-python][PATCH 1/2] add python3-dynamic-dispatch
Date: Tue, 16 Jun 2020 17:46:47 -0700
Message-Id: <20200617004648.43633-1-rrowe@xevo.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
X-ClientProxiedBy: MWHPR08CA0046.namprd08.prod.outlook.com
 (2603:10b6:300:c0::20) To MW3PR18MB3659.namprd18.prod.outlook.com
 (2603:10b6:303:53::19)
Return-Path: rrowe@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from CASE.local.rynet.xyz (73.83.210.194) by MWHPR08CA0046.namprd08.prod.outlook.com (2603:10b6:300:c0::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3109.21 via Frontend Transport; Wed, 17 Jun 2020 00:46:56 +0000
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
X-Originating-IP: [73.83.210.194]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f802f7b1-1dc5-4577-3025-08d81257f007
X-MS-TrafficTypeDiagnostic: MWHPR18MB0992:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR18MB09923E219C0D3D78BC06908BCC9A0@MWHPR18MB0992.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wzyLckJFxP0tkiEbTUQj0LTJCcowtJG0hAxRhRp+nyqCJyJNPDXCZVuZ1leopPSNGow2XcNuBptLjFbDbfXxXe/HBjnY99FbncCb1wGlcIDqnUo8GKZWvHI9l/SQUENUdWse0EQs3zbUSfSJYt1jyR/nrtaFYSjilP+KNRZB6XoWeME/FONfrLX/eN/z5l1a9HATvjUlMgFi0peSmALMiMChiD2isBQ8o/lXM7DCN+UIhMpthD1wqYp2Rq1U+o2HhwtDKguwp+BP8GcNbz3f/5RpTySSSY+5gsXDVM/kztgagZ1+nPPRZZyWI1YK/GJPKKKWAlOI1ObJ1P0sZTOnrHLNaX5l/0k7f9s50Ut5Q7a+sLvcvgM0qlf9Xsi2W9N3SPUzQy0Fzq5t3l2zeryfSPD/TWZmqFbuw/GjFsb2Aar8DfM5wsvET7BYZmTYOSej49e1BEz1q4zzXYppXFmxjw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR18MB3659.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(136003)(366004)(396003)(39840400004)(52116002)(6512007)(26005)(36756003)(478600001)(1076003)(8936002)(66946007)(6666004)(86362001)(66476007)(2906002)(66556008)(6486002)(316002)(8676002)(186003)(16526019)(5660300002)(2616005)(107886003)(6506007)(6916009)(4326008)(956004)(4730100016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	37pouThmxuEhAbgzXp4oydgEvvQRC4IYSAGxzVWvx3Bo/4j+jWIyxWaz7wNgjGfwWIzru406EG3E9P2CNAoMcFRgyWBrnftaJAtLzxyOGf1HhWYG6YJZUa7ft1nCjEahhMeHo8Pj1xKVcSSHzHJO5gzsmcQdpySNbNhtxEBmykZyCcDTsX5oCQYPzt3vEsXuggg2+9djNeKKN59EIenX0k35QtWF4LzTm5pLL+v68ItsHmzsQP1QoA4FowPBff+DaxLSYHLlbuFRxnFm374HB4A5esOlSczGRBM0+CBL/MI1pMoJbvVkq7eZhu1hqnBd1rE9kHODKoCkIwA5oVdJZ2fqES3ake5LcpVcgsGC9E2J0i5AP5rCXQzJs8BLA5cSF/QsHA9xhRkcI9U6v0PEtxpBF/stY3aOdGkS4jE5u7/QNlKSI6CUM5d4bAKgTEcMjyLNqo1qZmWD4s5zz7cmLl4KGdRMIo8DYmFf1uVTJvg=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f802f7b1-1dc5-4577-3025-08d81257f007
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 00:46:57.3722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y3DzbpfI7MoUaFtcuQXoaPRzcB5t4fPRJH1Y0LxUxh/V2raf8yetgESjEYK40foU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR18MB0992
Content-Type: text/plain

Signed-off-by: Ryan Rowe <rrowe@xevo.com>
---
 .../python/python3-dynamic-dispatch_1.0.2.bb  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.2.bb b/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.2.bb
new file mode 100644
index 000000000..be39a3775
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.2.bb
@@ -0,0 +1,19 @@
+SUMMARY = "dynamic dispatch decorator for classes and functions"
+HOMEPAGE = "https://github.com/XevoInc/dynamic_dispatch"
+SECTION = "devel/python"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ea70b07c354e36056bd35e17c9c3face"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "0e29d2afa806b9b87dadfbed6a0afd6d"
+SRC_URI[sha256sum] = "ec7025b2890e7a882ceef95ff82fd154265136af930cab42533070b557d2a15d"
+
+DEPENDS += "python3-setuptools-scm-native"
+RDEPENDS_${PN} += "\
+  python3-typing
+  python3-typeguard
+"
+
+BBCLASSEXTEND = "native nativesdk"
\ No newline at end of file
-- 
2.17.2 (Apple Git-113)

