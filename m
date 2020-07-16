Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web10.770.1594941636467535740
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2020 16:20:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=NrOYjuoV;
 spf=fail (domain: xevo.com, ip: <nil>, mailfrom: rrowe@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GrU5+N/3hP+LSmxpd33bU+ITB2Zy1dqdnRPPkq4+S1f9v60yoYaaFbhe6UvKymHC0iluGx3aCxnUfnYS2Db7bt1WXZZ/LpYXMbOxuuHopzJa2N18kyT5qx9D8YQWVd7mU0/XPdNAbm0e4/NHHX6r5TSTHzFuwikInJc7e9WRehyBuNEiPPgDXFBDHHeF+SfxcIeADsSHujoQRvRlUgSZZxWymcCy6azBcmc/5w4MLA1UqkX6sTcGsf+TIxMkKAzCUvmAKV4jOVQaRMlmhlMuqgrozBYJpwPxa/kbgYsfdemGx88eq3bjM/o5U/ZqF8bVxL1K36aQvzZ5vP/Fo2dKTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JgnVMYk0hjYtPbwnT042JQnijDq/iiIILU45PEErF8=;
 b=iAXLPI30fQ0hDMjgCl8BB2R6/YBvzss/0BI+Tkkxnv3G6aXivcbSiv32klW9aVBYXxcxcDH+02reU5WUqt/lt2+JsIYSaQhamqDZ/bMKg+/rgtZ/R0+lwB4wMks189kWkx0hcF5JOBSzGw580MoYdG5AVPoPLJuzvvi0psMSgsm5YwjQ7aVgXsK1uW3h5Yml9tjC58MVwZIluHNopL6IsVpEWn48L+QirKWu/jKO75KdEZOaGMHaYaGz7E1HqoYp0g8EZrr9IvZShYyIUyzab5QcH7lSrNpUzAuWaH4RGmWgGVu82/gYZfJG4YPn+81U0kBwtjG/dAaO0upgcvF0HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JgnVMYk0hjYtPbwnT042JQnijDq/iiIILU45PEErF8=;
 b=NrOYjuoVMaeuisy9yWWD/wLcVsu+Us5xFO8IDMPNHds+QCP/47umlEgOtsoTbvN2fevcGS8BpZ+yVLZY/C1Bc1Uq4HqrArsKWjgd35h2V0h9PwMWy9bd6ycn/UHb1EBu6LrB2v2mIxRTMjp1lsgWZY+fYP/Az1fDvPuWKWbV7cQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=xevo.com;
Received: from MW3PR18MB3659.namprd18.prod.outlook.com (2603:10b6:303:53::19)
 by MWHPR1801MB2032.namprd18.prod.outlook.com (2603:10b6:301:62::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Thu, 16 Jul
 2020 23:20:36 +0000
Received: from MW3PR18MB3659.namprd18.prod.outlook.com
 ([fe80::2821:7dbe:f513:2a72]) by MW3PR18MB3659.namprd18.prod.outlook.com
 ([fe80::2821:7dbe:f513:2a72%6]) with mapi id 15.20.3174.026; Thu, 16 Jul 2020
 23:20:36 +0000
From: "Ryan Rowe" <rrowe@xevo.com>
To: openembedded-devel@lists.openembedded.org
Cc: jbroadus@xevo.com,
	Ryan Rowe <rrowe@xevo.com>
Subject: [meta-python][PATCH 2/2] python3-pint: add missing python3-packaging dep
Date: Thu, 16 Jul 2020 16:18:39 -0700
Message-Id: <20200716231839.48850-2-rrowe@xevo.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
In-Reply-To: <20200716231839.48850-1-rrowe@xevo.com>
References: <20200716231839.48850-1-rrowe@xevo.com>
X-ClientProxiedBy: MWHPR07CA0020.namprd07.prod.outlook.com
 (2603:10b6:300:116::30) To MW3PR18MB3659.namprd18.prod.outlook.com
 (2603:10b6:303:53::19)
Return-Path: rrowe@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from CASE.local.rynet.xyz (73.83.210.194) by MWHPR07CA0020.namprd07.prod.outlook.com (2603:10b6:300:116::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3195.20 via Frontend Transport; Thu, 16 Jul 2020 23:20:35 +0000
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
X-Originating-IP: [73.83.210.194]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60c8cc74-a901-4258-b0eb-08d829ded7eb
X-MS-TrafficTypeDiagnostic: MWHPR1801MB2032:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR1801MB20325EB0F6C34D02B59C64FBCC7F0@MWHPR1801MB2032.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TPn2tvwrenM0ZxpvA4OsC9D15Y6DII2xnzDtwU9/5BXagHk69Fy9kmURf4q3/0Xh5mVJyFKFq/tA5VKdZ1O0p7stCcBPcavBrSNZkwYb4FSpHof2fGYDA62KXaE79kWnJ2leUiyMM56RRxwyqDESzUrhW64A7yngURI5QnYlCo7QPQfCgMsO6rqQAcRbmNHF0XkMMQ32XT7ny5JXG7WMIsKAtgV1RjBg7M+FSS5FWTacv18qEG6C33Q2Mk4o9hNdLdxr7pQ4Gz8FZi2PpLfbzGHzst1gnIM6pOmwJa3xuujRl6Y4T6yVsdd6yzaxRmBEZQJLssQv6h69TvAbeE4kKB7WT7pYodHQ97H7U6zDDJQwQL5nvS+XamG5dklgDye6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR18MB3659.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(396003)(366004)(39840400004)(136003)(376002)(107886003)(4744005)(2906002)(8936002)(478600001)(26005)(6486002)(1076003)(36756003)(86362001)(2616005)(6916009)(956004)(8676002)(316002)(66556008)(66946007)(186003)(52116002)(4326008)(16526019)(66476007)(6512007)(6506007)(5660300002)(4730100016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	gLIoSozXZp/q0Xfu26NLmxnJm1cPalB4ktccmwef05d5cEZ7xqdzM2txQ6eI73nfk6vrzIe83XlFmUZBV7rqgJ8yrqNtd1DE/hgCByG/M54GohFsuw7dO8OcBuTGgj15LePQEU+aPX+8W2A88bYFrFdy4W+y83pM7kUJeEP8ZcoOq2uCPvOsbMvMkpKsS2Z+8uHJ0sbgjtD9BEnmZZdRg704NP4gq8GEErDmxyotBnC8NH2xgVN6QjbLxCiBA1rV3CkRkidPnc1f/ve5T0yB44T1F0z9HNGBYikoehQWPU/2N5VW3bfNJxhICYqxM0eaFGd1Jy5gW6VGDwPiLUTA8IB7RbGBoGj7DuM0N3iHR/SNMfhC34rcv/yYnzNFRRZbm5H49CGFw6H00SIkvaSsm/GRX0GG0nZq5NWXqtLuZ+zoWFsXPWcl6q//zace3zvHvb3/QypujqEViSewU0l/ywsUTsMQQwsdshVmlAHnIPQ=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60c8cc74-a901-4258-b0eb-08d829ded7eb
X-MS-Exchange-CrossTenant-AuthSource: MW3PR18MB3659.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2020 23:20:35.8555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aeI2KMuofx+g47BfWKrRTkOmyomJgsPh17Je8WQtaFNA9CNAgxSKtyV0KyO1jMNJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1801MB2032
Content-Type: text/plain

Signed-off-by: Ryan Rowe <rrowe@xevo.com>
---
 meta-python/recipes-devtools/python/python3-pint_0.14.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pint_0.14.bb b/meta-python/recipes-devtools/python/python3-pint_0.14.bb
index 8e1630476..ab8b4d74d 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.14.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.14.bb
@@ -21,6 +21,10 @@ SRC_URI += " \
 	file://run-ptest \
 "
 
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-packaging \
+"
+
 RDEPENDS_${PN}-ptest += " \
 	${PYTHON_PN}-pytest \
 "
-- 
2.17.2 (Apple Git-113)

