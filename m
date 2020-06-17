Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web12.496.1592421355481917816
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2020 12:15:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=h9UsJDUl;
 spf=fail (domain: xevo.com, ip: <nil>, mailfrom: rrowe@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jFfZXwwJ/R5jnQt2LFjaHmJZJKmLfI+tSmDJTbvmFowFjUbUsAq4h6WRB/9aU2deEGxg71SiljhT5frSChJL6Nvpmtg+FZPP12ITusC0akFvANoY3NJbXmD+M+1IQPnSGwWf0moKvQnnd4+vNUjy9A13dOqOI43qB49GRQ7AIESA3hI/97FRTgZx9JAnrsXXxJ6Kan0hxGoX+4R6v0Gi9+woKIczem/C5ucNC8/dmYljR9coM3VczlEJC59TLuZLSDV33XqjmelKqWQkpuiePepT8A6/3y0iS6VqCma5HkEtBeiYi/2LVWwGTgDEudlwmjABu+HruglLtU+WZdDcxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wcK7comUVa1jwK0jxcnBVnA6S/y/jPRDi0OVtxul2E=;
 b=RdInn4OksWJQyCsc2PL6Q6Yc6Sr72obS69+vHYBoeQbmGMbpgZnAksUqILu6KNxn8pULN+Tq34mVjuD5VY051lq7i8iBbiS6dDXiMjP2hZs9Xjk+uLcYvF1kKlgPnSUwqhecvbsk+jwmZtNJHRsAjYuMVLj6ueiPAggo5kYClf2EtlO+wu2J+horTd+HGjnHo0wi1ut3CZn32XxFcqGH94b/iXPXE67m00OH61HeExfeCEEzMSZKHkVIFyHviDFHywucL6bXiTFAGh37dMzqC+OAp1fnZD1JerNOPuT+l8M61Zp6mzqYFAoHdVQcFQIBWccUnTiGvyEr8vgpjVisOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wcK7comUVa1jwK0jxcnBVnA6S/y/jPRDi0OVtxul2E=;
 b=h9UsJDUlRQF6D3Eh70pW7iI0yKa2U/i7rLMGcoeuyNO24vDDmONe9i80bTXPkvO1qeeVOfjTJu4C3eUv8vDgCZaoJJusZSV2XjOQ6d25ws5uM99SMjFNDHuwQQ/hVCvcJX4fh7HMcd8WIaSiziY5aBfpqPkM5Pts1fRU+uuwQus=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=xevo.com;
Received: from MW3PR18MB3659.namprd18.prod.outlook.com (2603:10b6:303:53::19)
 by MW3PR18MB3498.namprd18.prod.outlook.com (2603:10b6:303:5f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Wed, 17 Jun
 2020 19:15:55 +0000
Received: from MW3PR18MB3659.namprd18.prod.outlook.com
 ([fe80::3d7f:edb8:f540:5050]) by MW3PR18MB3659.namprd18.prod.outlook.com
 ([fe80::3d7f:edb8:f540:5050%5]) with mapi id 15.20.3109.021; Wed, 17 Jun 2020
 19:15:55 +0000
From: "Ryan Rowe" <rrowe@xevo.com>
To: openembedded-devel@lists.openembedded.org
Cc: jbroadus@xevo.com,
	mkelly@xevo.com,
	Ryan Rowe <rrowe@xevo.com>
Subject: [meta-python][PATCH v2 2/2] add python3-argexec
Date: Wed, 17 Jun 2020 12:15:51 -0700
Message-Id: <20200617191551.49812-2-rrowe@xevo.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
In-Reply-To: <20200617191551.49812-1-rrowe@xevo.com>
References: <20200617191551.49812-1-rrowe@xevo.com>
X-ClientProxiedBy: CO2PR04CA0098.namprd04.prod.outlook.com
 (2603:10b6:104:6::24) To MW3PR18MB3659.namprd18.prod.outlook.com
 (2603:10b6:303:53::19)
Return-Path: rrowe@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from CASE.local.rynet.xyz (73.83.210.194) by CO2PR04CA0098.namprd04.prod.outlook.com (2603:10b6:104:6::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3109.22 via Frontend Transport; Wed, 17 Jun 2020 19:15:55 +0000
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
X-Originating-IP: [73.83.210.194]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65bf1b3a-9eb0-4c9d-2e10-08d812f2dbc6
X-MS-TrafficTypeDiagnostic: MW3PR18MB3498:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MW3PR18MB3498D2A3A73DAED9B9615EFECC9A0@MW3PR18MB3498.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:586;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Sa2qjfWkHPOdvbJt8DSX+vwBGuArNdN06/Qo4HmM8YIJXAsRlfK+RF/Fuj0eWGGjkYetZl1v8tTwfE59RdTtYGhqikeqdRDseDx4bB9Ip3pAkaCBi49gaM1lZgjK0sFz01L1SBuix5CDRIIa3yefJ5kbo5tyTHwS3mi3C3A9gWi84a7sF6txlcmRDL+46gD2HhUZ4s13763KySv7Sj2VbBaAS34StuH7pMVnEb/MvHID5Qjsaq4DkTeyeqIyxtEQtrZvU9n+4J5YnN91PAMq5FCHuFQadfL5M9gUfjoaQ9zgpZafGq9nWxHDC3aV64FeNges3aLqPJIWZlK+QdZucEOx20dvKcrta8FDHpX150fXZCWJOaHyi9sIfxHpW9qA
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR18MB3659.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(136003)(396003)(346002)(376002)(39840400004)(2906002)(6666004)(4326008)(186003)(316002)(86362001)(107886003)(5660300002)(478600001)(26005)(16526019)(52116002)(8676002)(36756003)(2616005)(66946007)(956004)(66556008)(66476007)(6916009)(6506007)(6512007)(8936002)(6486002)(1076003)(4730100016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	LCiCSBMfaVvJSAP1hDdmeoE5mFk+V2WWDw86beuWlS+V2SxWEBgLf+mZBRT82VhHIRo2saugOYzX/W5eu+QsLjbHt5GyBkhhm5dvKruz5Kajt4DenLFHIe5VZ69CxtjyhnVrVZhXX6EhejXoZVa4njnYOZac89CUlpLONLvCH17nxnRBkWAK65aHi4o8AiUtgT4Uq3jPBpKu0PbwrHNUpecKKDPiQiVDIgm1XtBbjyl5QOi84U1XMajr6HBT1IZ9ExIKVfkjCZLgNJMhswI3kvL0MKqqWQU1kBU0nyXeIPypwIt0zbwMJgKXRPrY+15tJn99KMeQFjWGpRxyQlA51biRQeO/rUD1Nowiziu7+D2W8s922q47JYzg2w30bTX4GDPH3pSHgRvM2GDij/YrYMD3oq6aXB9rqPI0Z2X+lUIYts+AVsDfRAlNM1kKqH5vZyW6meosFLoOm56bMOIlBKei5QCoxOlqY2TawqYcgSw=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65bf1b3a-9eb0-4c9d-2e10-08d812f2dbc6
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 19:15:55.4376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mfHWSbpe5SjYg2fNQTlzADDn7DRRldRcLrWX2X1PjjR+PuOFTU+tLnow2yH7qB6V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR18MB3498
Content-Type: text/plain

Signed-off-by: Ryan Rowe <rrowe@xevo.com>
---
 .../python/python3-argexec_1.0.2.bb             | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-argexec_1.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-argexec_1.0.2.bb b/meta-python/recipes-devtools/python/python3-argexec_1.0.2.bb
new file mode 100644
index 000000000..179e07127
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-argexec_1.0.2.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Expose your Python functions to the command line with one easy step!"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ea70b07c354e36056bd35e17c9c3face"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "9fac09884c54db79e57ab80f0c423794"
+SRC_URI[sha256sum] = "e271286b280f930aeaae7496454573f8029c3f48ef1dc47c780155dd4a7b9e7f"
+
+DEPENDS += "python3-setuptools-scm-native"
+RDEPENDS_${PN} += "\
+  python3-typing \
+  python3-dynamic-dispatch \
+  python3-typeguard \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.2 (Apple Git-113)

