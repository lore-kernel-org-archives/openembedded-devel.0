Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.57])
 by mx.groups.io with SMTP id smtpd.web10.770.1594941636467535740
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2020 16:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=M6JvIPFc;
 spf=pass (domain: xevo.com, ip: 40.107.69.57, mailfrom: rrowe@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j2sfBME6Jkil0Pn7XtM6W2KYgZLcEjATdLb410p3ahSzKFdS5moSJ2bDFqUlQKSvz94aeZCtfY56IQ4KTtA9b5p7qLbVsx88eqf9qqSrz4/3EsdDWm9/1QNP3fjLX3oJb6Z9vu7Ynl2lMcqAA7YmjaHssDQAcOSq43dBXHZqUVJfusQxPvXVSkysRD3MUZccKWawPVLhrmK90EXT7PoMY2l0fv/iWoiBSTZU9EQ9i1Mw14FL5qkqPHp3aLC5pqJsPm5fPmOOiY3YIPmW57ZdM4MTDMgAXUplAW6/BFttVU7YSQGZSHP5vA6X+q3xRuKLKr9Ud3Evt9No+THVl0xSaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G7PY0kz12tBCZsjaTWb/D1bOdAydhWmU3KnDANqzUTU=;
 b=K+PRFb9YzYscmY6nCrZ3yxhtG9yZh6TbHjDkCN/hSWJW/T3ioznBB7WeI8KtsVnNI1YOvmB+6Fyz3huAeEPsda5oKpRqE9YFzcDcs58R1tXBxW52Dr7g0ZksHTzHSMzJ5wGAErXSYHXwj4CcQ43lxa8sItkagbUWYd8nBeT5lXfZeTyRWHB0ytHgnHLZjL1IJuYyT+Lj1YW2RPGRoHMnJqb9j+IxToAZX1lVCkwpq7oiLT77ynrbAdFutfUJm9lnPJ8soNQxCoc+UzJzz7R99a+VLHQURX0HIIp2LV0KoMitmaWm3UVFoqCtcFuob/mRV65EQp2o3IKzIu2LN4MLZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G7PY0kz12tBCZsjaTWb/D1bOdAydhWmU3KnDANqzUTU=;
 b=M6JvIPFcCxUiGQ+fPV3Gelbvj4ntFCtbhbbzNBLR5Pal1A+dXL7x9P1td/AmUaqEjOkziNOOjSVUMOsszekxcJ54EowHUAKYIiSGtpN4jqMYHthNPCpdDQJDl+sdIFI2u9I9CKX41kJHDhjDvUYTEdCns6/afG2igmtmW42TvwA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=xevo.com;
Received: from MW3PR18MB3659.namprd18.prod.outlook.com (2603:10b6:303:53::19)
 by MWHPR1801MB2032.namprd18.prod.outlook.com (2603:10b6:301:62::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Thu, 16 Jul
 2020 23:20:34 +0000
Received: from MW3PR18MB3659.namprd18.prod.outlook.com
 ([fe80::2821:7dbe:f513:2a72]) by MW3PR18MB3659.namprd18.prod.outlook.com
 ([fe80::2821:7dbe:f513:2a72%6]) with mapi id 15.20.3174.026; Thu, 16 Jul 2020
 23:20:34 +0000
From: "Ryan Rowe" <rrowe@xevo.com>
To: openembedded-devel@lists.openembedded.org
Cc: jbroadus@xevo.com,
	Ryan Rowe <rrowe@xevo.com>
Subject: [meta-python][PATCH 1/2] python3-packaging: add -native version
Date: Thu, 16 Jul 2020 16:18:38 -0700
Message-Id: <20200716231839.48850-1-rrowe@xevo.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
X-ClientProxiedBy: MWHPR07CA0020.namprd07.prod.outlook.com
 (2603:10b6:300:116::30) To MW3PR18MB3659.namprd18.prod.outlook.com
 (2603:10b6:303:53::19)
Return-Path: rrowe@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from CASE.local.rynet.xyz (73.83.210.194) by MWHPR07CA0020.namprd07.prod.outlook.com (2603:10b6:300:116::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3195.20 via Frontend Transport; Thu, 16 Jul 2020 23:20:33 +0000
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
X-Originating-IP: [73.83.210.194]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3814f366-3e63-4692-2abf-08d829ded6c1
X-MS-TrafficTypeDiagnostic: MWHPR1801MB2032:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR1801MB2032E2E835B99BB4DC68218CCC7F0@MWHPR1801MB2032.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	38/0MVLm3IBx6FxvEpbma7FvKobfLbWTY5yVlRGQVyo7amta4kaIDvTGs3LYxz1PPMQEoXOHze4WhI5IIJ0FLBHQZ3e62aLNkhl5VNMifAmqnq3N7ffBn5NXMtF/1LLconPVoOTAoffJJI1wLbpfwOMBI4MoI1GOqcv808Eq5Tyd/HnS7mS2sErSrzWxb5XBGm8WhmCgHj41eGyEyP12gNB7vzPTdllqBVvRsW658vixqWfcmtASctND7HlaYAe7XyGQtI3GnHBgcmqjO76B/Z3VrMl6/aNitQbHEvcNcw0IApGpDVPQVQZ9cZZ4SqnslSseC+FvSRHLG2h5CeQKSWfRj06lPNdQWGBgTg81G/WI52sNUtwB9YlsqX6JS9Dk
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR18MB3659.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(396003)(366004)(39840400004)(136003)(376002)(107886003)(4744005)(2906002)(8936002)(478600001)(26005)(6486002)(1076003)(36756003)(86362001)(2616005)(6916009)(956004)(8676002)(316002)(66556008)(66946007)(186003)(52116002)(4326008)(16526019)(66476007)(6512007)(6506007)(5660300002)(4730100016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	WTwbRe3v8TLkebMoSFCuCEDJwc1Nh3cQtMfQ6N4AFjb3H8hhoOor6J04IMkYBK1ct5fZPLVhUGsu1eu1fjwGYoVgdaPQBbvS5/PVsAkmXlfpR+5AHBN/hq/DZHi+TSu0nToJ5CFtGRj4nKPPB4ritRhFVm4dnUZ8jhqxdeUq7sNBRF462EJDV3H9RquZFsLYCa/a6WB3i4L7AmzVePhGESHc4qYhacucgfHUoKKf5RAaWgRUGaZVEYd+Cdhwla+wCR4QwkPR1GzqRGuWiYjiNYdrrjsT7qx45jBpbsGdWtMi8CIfKnoGwgdsv4YrBZg0AEfy+HUZ+scwkTlwqqRs0bClI2qOw7Jzcyh7qVj4jasHgt/L4SqbINFnWdNWOSrq7Jdi6LNKB0EOORb38UjqjwUHQtmdZq9F1BJgLkqhrKaOcIvbc1xlwqe3uOJEhjppNaCXNIlxmQJa155wKio5n7EbrdH1dp4xulBomPyv9po=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3814f366-3e63-4692-2abf-08d829ded6c1
X-MS-Exchange-CrossTenant-AuthSource: MW3PR18MB3659.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2020 23:20:34.0216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DxGFU3s8U9zsp2gqbZFZ9qOiLBNkVeKg4HakP1QdzWrUJkeavmaFVYgVlmz7r82m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1801MB2032
Content-Type: text/plain

Signed-off-by: Ryan Rowe <rrowe@xevo.com>
---
 meta-python/recipes-devtools/python/python3-packaging_20.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-packaging_20.4.bb b/meta-python/recipes-devtools/python/python3-packaging_20.4.bb
index 0f78fd016..c75707e69 100644
--- a/meta-python/recipes-devtools/python/python3-packaging_20.4.bb
+++ b/meta-python/recipes-devtools/python/python3-packaging_20.4.bb
@@ -8,5 +8,7 @@ SRC_URI[sha256sum] = "4357f74f47b9c12db93624a82154e9b120fa8293699949152b22065d55
 
 inherit pypi setuptools3
 
+BBCLASSEXTEND = "native"
+
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 RDEPENDS_${PN} += "${PYTHON_PN}-six ${PYTHON_PN}-pyparsing"
-- 
2.17.2 (Apple Git-113)

