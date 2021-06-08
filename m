Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.87])
 by mx.groups.io with SMTP id smtpd.web11.8568.1623128666355992566
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 22:04:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=S3bhdwUX;
 spf=pass (domain: kpit.com, ip: 40.107.139.87, mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGuQQlpU0f7+BDhilWxHNezhfjeXrwdbNVVhKUBiwiou7IbXrzjTPag7MI1RUwt2+Xkdupzy07VAdvs0Lgnd1Q8s/14LVRbcQS7TfwuRw0IdD4+ql6a1Pn/qXKM1WtQioXtslfrzx8bA4dBpXVI8lK4crr/VYiwPa0qu/z50AsWPE1t0EwbSODSpswzTfDJRuZRZnkHhGKra0q3LtMe7wdxOEavJ7nAjdZ+k1xT7n6cqwj7LdUf0A71rNtjDjBxl7NtCp0GCcd43HO+ztdkD8YQsAcKbWjahl/Ky7RANS3MSbz2o3yI5N4pjiwPlGLERBfihySodCbVfs46dSCY+xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdS6pZz9uA+Ww+CLPF8CqZ8MsFmJPbOmmlmjq+tYzb8=;
 b=MwvIKm6KbxkzXzhqoTBfLlntJgbwBlTz7nvY6wqBTu0HINjUUCeVaKcCR63k/EyvCKIrrKZAZ/RP9SRR6bbszpPna5IkTnH/ctYLQHJN/HJQSdIkXgQob1jXyeBY5/VOAZVYIm+KETEYdlljQKkUrKEIMLP+bOJHYeuLf8QUJYQ/pGH1hHv56kEAHNj1lAR1DusYBjExM1DTOHhYW2tAdEqRa6tjvfzNaks3ktulSL7gvts2n1YC0Ir4EDwl9GXCJ9VviyEP90uxhTiekrOJqSZPAv5bOHvNMX8ugmZI1UvNw+89ETUiWM3F5psTX6myk0rLG2M7H4P/JqkH50HKoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdS6pZz9uA+Ww+CLPF8CqZ8MsFmJPbOmmlmjq+tYzb8=;
 b=S3bhdwUXgF3S+b++1s2UxxrYY4vDCtZzCmo+YGYpu0fNPV3pn3bCFfzWxXlFh8HTTrDBMIYURkz02KHjO9sdjBR1ujwJ5Er49wEFPNFJp7NCXZsUjrXj/zAZr5ZIsrSLBbIGbjZTD3wMv6j1f/KltzHgPv1ZB3+wSbcadtwamCA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:a::14)
 by PNZPR01MB5295.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:3e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Tue, 8 Jun
 2021 05:04:16 +0000
Received: from PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c962:e30e:1f2:44e7]) by PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c962:e30e:1f2:44e7%7]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 05:04:16 +0000
From: "akash hadke" <akash.hadke@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: nisha.parrakat@kpit.com,
	harpritkaur.bhandari@kpit.com,
	Mikko Rapeli <mikko.rapeli@bmw.de>
Subject: [meta-oe][dunfell][PATCH] meta-oe/conf/layer.conf: depend on meta-python
Date: Tue,  8 Jun 2021 10:32:03 +0530
Message-Id: <1623128523-11804-1-git-send-email-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2402:3a80:cb1:1876:861f:8f19:371b:f6bc]
X-ClientProxiedBy: BM1PR01CA0084.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1::24) To PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:a::14)
Return-Path: akash.hadke@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2402:3a80:cb1:1876:861f:8f19:371b:f6bc) by BM1PR01CA0084.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:1::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4195.21 via Frontend Transport; Tue, 8 Jun 2021 05:04:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77f5147f-c1ef-4f19-449f-08d92a3add7c
X-MS-TrafficTypeDiagnostic: PNZPR01MB5295:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PNZPR01MB529556905D4BF43E771E06CD8E379@PNZPR01MB5295.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:972;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/t7ncXYoKtnPucX5gcaBvgg25HjhOrk5vCDy4FD9aXJxPN1mTB+GCysoJkPH+30rD9Rb0/7ORb6j1JW5e4j2sFj1IVzUKwOQVP+L5YR74XE4gXHlRZiWbTF60qhFPPhbvYFskUyBhvEwzwzpSyesPJO0/RiqB/7PKZ29A9B/2OvCmHOOLb5RLXzGaancDjbfPcfEh1MkQqJWmh+QFWUxXHrWKXoTw0L6PoMv8blR4SVZ7MKaxPc0R/ny7+pj5OIVFqwg9lKeuern2sC56seLM1eeK56kDVk7KeVYb5bCKi9NlAsfe+3OMkgiReR4d5fIQp+sRJGPktHq0z4/LObRDEh2U9jllqHBxr77IPTWQ7AWtH3R61Uej1WjH+3iI8lovQ1psW8am6ruedj5c2gLBdcwTHWhHJ6qDOwd3BZkxEAgGFp3PNcJWlfk9AvmfvZeTEJ2SwxTz0baO63CEcu/DWELl2YMwoVSGf+YBcZ3+9ptBHzdrHWCthl9n9IHWVorMH/TZsnSmV0Y6360J1YU7iZZ5eTTuGo1odfHsUz6B3RXIt4TYvF8ZaY1554Dcdm3exi/twHXwSrbf1KeHjE6Ft0ggRPfcPUDHGPLO8qEY7Qc8r4+47/AYtepGrvQAG9GvHk91h2ky7TCGA3fX/fhUzzhP5d+hKomQMWTUtU28O4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(39850400004)(346002)(136003)(52116002)(66476007)(5660300002)(83380400001)(4326008)(316002)(66556008)(2616005)(8676002)(186003)(478600001)(6486002)(38100700002)(6666004)(6916009)(8936002)(2906002)(36756003)(86362001)(6506007)(66946007)(16526019)(6512007)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?+RlDDfOADZPY/GG8NjG7iIUAMKQN4Z09nm8BJHCtYuN7rNnm3pjnIqc4xv2s?=
 =?us-ascii?Q?EVRsPzm/3z4vTupzTYuiocSR3Q4j0I4ENsq++cIEFoHgmDAApdH4S7OU8zRI?=
 =?us-ascii?Q?gpnKakl5bIeNQQjWURkthsfi6kmX/QZq7DHUZRDtAZR6xJSA2lTStovMHNg6?=
 =?us-ascii?Q?PtyCnlpDTR+houwujc6ftxayJs7SxaKNTa4QXw0h5bESP/b4q9f9J+5B+Mbw?=
 =?us-ascii?Q?Ma6PprA0+jC19O599BzFkFlupq6u2m4HIkdTrGf2RkxbEHb3Wz+l0sl1ZUTR?=
 =?us-ascii?Q?PdRsWO578ck1su4rNgZjYtMP9I4X0AkxWpYURwMiI/TTZg/XfKhnLuIPWDoE?=
 =?us-ascii?Q?yPFjDmffxt1TlX9M4pCF3BJHV1qzYeQewg95mIelPNyDUYpGc1ziMTYYq6Rk?=
 =?us-ascii?Q?oBnJvFCXuy5OHNpmTNKdXNRLSbxSApYAhKBkvUGD421ykuBvwD7T+dapW7jJ?=
 =?us-ascii?Q?lIfXdKMx6R7ZpTnMkHF5QUK27lccBvY2nuxK54Bt11nuleX+TlCE6bSW8vwi?=
 =?us-ascii?Q?P70r8MPWr8Nhi6vh2ZuOxYj6uNJ5OERxntdA48iTsIyO42Us6WXoi+b/P7b0?=
 =?us-ascii?Q?Fz5yHlcLg4mg645fgi7U4WJDMxtA3emCl7G56A80ZDFA2gvZprTpiqV5y8uy?=
 =?us-ascii?Q?ynA9odahI+wPs4L73MBj9Oo/PoCRnU9ANlEr8aP6TJTZCoJkzuJueOBqmgTR?=
 =?us-ascii?Q?S79Y1gIIEKAaZ4PkHjaoo1DDqQ3BhOqyBosV/38ciUicHxVkDcU7J6k6VYAa?=
 =?us-ascii?Q?q1zru2/Ml1y91DhJ2kVqZv/NPVQEEURzYKXz0u73Im9F6imr460ItLBtQ8KM?=
 =?us-ascii?Q?W7ePWy1xumV+mNqr4Kf4cICaldk3c5Z28GdVv8jd7ZBTsZvNZbPGeRg4th4a?=
 =?us-ascii?Q?LqBb8CG/P45hAKKe663Bz/ewR8UUsIPQ1Ylitr01ZZO1SEo/RvA+Cohg6BdW?=
 =?us-ascii?Q?b4vJa2AXOM7mRVUwSZVhFFQugRS9JzM2xcd7d++R/VJv51RgGitvctowXxaC?=
 =?us-ascii?Q?Yn0fXi3cG4YDR+jQ4GWgQdDaaUKt7iryZgy5Tr4bb1P/KtXUHiRsqzQ+rrPC?=
 =?us-ascii?Q?bz4f0Vn3iLHxQ+ir2Uk3RGuDzbtRE3AzOoRaGnlY/1ZGTFsO3SJAkBvD+PTQ?=
 =?us-ascii?Q?SPdg1ZGC0w+ecSEXZQzt912oul404GRTout951EyHPsSOUvaZ8VeHYqXXW/6?=
 =?us-ascii?Q?fHfib68ug+JeFTHFmtB4FDRc8DY7bq4EslgV1+Mnfgf5EkovUlbtG34d1mSc?=
 =?us-ascii?Q?QZbTarVkkAWwUrlWR79i+JMAwexNCWfv/F8P6v/NfU7bHfqhQNzoTCkRFZAv?=
 =?us-ascii?Q?FJR+5JWJ7eb4AOVLk769X1xBvBnObSPOGtuaKK/rtUnQx5zDd7zEes0En9aX?=
 =?us-ascii?Q?HRxN+uFTAAoAP5rzUtxg/XSwQ9IF?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f5147f-c1ef-4f19-449f-08d92a3add7c
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 05:04:16.6341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cMuozE3B7yD/z7jrFcGAycZfoAbpT8Fe/iAFWxZNJLorPOULR9J5F8mG9dcKf7e9DftO4UbcILYpVvhXK94ZfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB5295
Content-Type: text/plain

From: Mikko Rapeli <mikko.rapeli@bmw.de>

Fixes yocto-layers-check error:

ERROR: Nothing RPROVIDES 'python3-pyyaml' (but /home/builder/src/base/meta-openembedded/meta-oe/recipes-extended/ostree/ostree_2020.3.bb
 RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'python3-pyyaml' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-pyyaml']
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'ostree', 'python3-pyyaml']

Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
Signed-off-by: akash hadke <akash.hadke@kpit.com>
---
 meta-oe/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index adcec83..efdd04a 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -34,7 +34,7 @@ perl-layer:${LAYERDIR}/dynamic-layers/perl-layer/recipes-*/*/*.bb \
 # cause compatibility issues with other layers
 LAYERVERSION_openembedded-layer = "1"
 
-LAYERDEPENDS_openembedded-layer = "core"
+LAYERDEPENDS_openembedded-layer = "core meta-python"
 
 LAYERSERIES_COMPAT_openembedded-layer = "thud warrior zeus dunfell"
 
-- 
2.7.4

