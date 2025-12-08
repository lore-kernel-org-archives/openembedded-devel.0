Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72289D3B7E2
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 21:10:38 +0000 (UTC)
Received: from ZRAP278CU002.outbound.protection.outlook.com (ZRAP278CU002.outbound.protection.outlook.com [52.101.186.143])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3286.1765227121395915927
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Dec 2025 12:52:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@spinetix.com header.s=selector2 header.b=v8Hx4R/c;
 spf=pass (domain: spinetix.com, ip: 52.101.186.143, mailfrom: valeria.petrov@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOlV2f6YOKsUwR9Ejr7M6mZNGp0uaz59nMJ0FcYctvclw8q4ZTShdvqUZRLqjg34m9Ozd9lkptpY/7tNrlE/NU5PiQeEraZ7MBNKmB8oYDxUqZ0uyywi9jQ2RNmKlwedMqKABkfxlDWacePso6mPBbqPmRTGMnsb0ZRfPu/WZBRYw4c6bIhvDHJHQdQvjU+9Rli9H+u/a2MnAcgq3+uHZJevNrUKGo1Q7Pu4rmN64+S7iRXQZanILHH1LltAeNJX0iKfQ1BOWA/Iq4qL2eMuAuIB8M+Mp1nWdEsPUZthDXoqCMTtg6/5FdiXI5pc8DG0dAnruERR7roP+euvVkY70g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+CHX9q6SNF0y7EmWNFuQnyecpFjRnGxU8/HDKOUeiE=;
 b=yM9BBdFU/DQ7Rgba4LfAJHGQfdkxKGpQpNQMrTokSpHS3E0EGUMepKUJf3UiUMzOFfgMaKY73jtFUl7O6+NowyDBbKquQHwlEfKfKu1K7UuPUiCgIFsdze8UTMHnVJifH7T4uvqezoBJesjap4M7G8cOfJ3CQc2hVSXxwTIFiZBqtKyR6bHhK9xn/7saheSsrlD/AeFNGruwZ81S5cZwaxOIMRo1fpzOhM6csZONmyhVrd5CVzUdWAL/g3sJi5LxtcN/EFZbdfK9ccOhKjhePbRvc/KDHlAPcwakIgJ0n0kQZwQ6+1pGEE4p0FBcD8265BpD4pnkemR0A4hsLmNlNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4+CHX9q6SNF0y7EmWNFuQnyecpFjRnGxU8/HDKOUeiE=;
 b=v8Hx4R/coI7adBssJh5ndJDS38JZvMW4+BHzi49IyLNoYqGecgl1TPTHJS+5cgRb4xZoxc5h3WqL6fv9JiS7HniznWUjLZ+YcufAfe1C2kYUzb+zOT6tbNsRQMAvbwxTazNECJU0hrjjxVkYsnE0H9TDzRm3eqED/3o7NTU4+xI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=spinetix.com;
Received: from ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:30::12)
 by ZR3P278MB1666.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:91::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 20:51:57 +0000
Received: from ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
 ([fe80::8b9c:72de:ac10:1dd8]) by ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
 ([fe80::8b9c:72de:ac10:1dd8%7]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 20:51:56 +0000
From: "Valeria Petrov" <valeria.petrov@spinetix.com>
To: openembedded-devel@lists.openembedded.org
CC: Valeria Petrov <valeria.petrov@spinetix.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][kirkstone][PATCH] apache2: upgrade 2.4.65 -> 2.4.66
Date: Mon,  8 Dec 2025 21:51:28 +0100
Message-ID: <20251208205128.1274030-1-valeria.petrov@spinetix.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: ZR2P278CA0044.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::6) To ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:30::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR0P278MB0379:EE_|ZR3P278MB1666:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e79b063-e3a1-449a-253e-08de369ba008
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8dEvghDaI8Tlg2I4yA72CXVuvxoV90M+bFo7r/yEu2EWBRtMgfuKOeesRJA6?=
 =?us-ascii?Q?6dm4uO8lzD3iL1d8U9+rfRsSVXH04XQL7hEa+C/W4O1jHbcaiDAvaCVfo0He?=
 =?us-ascii?Q?iO8Yi0W5M4B3xMToPIrQF0Ebm2aP8acYs4PqtRtYvcL3eltvMFfTFfgF9gyd?=
 =?us-ascii?Q?Qme1njTtIzPUIuFWWRIzx9sNRT8bgvzlpltknIkTetbKQ+oPkyZbsNTFMUpd?=
 =?us-ascii?Q?t0Zka5qPQyPvVAURGwxm0BrmYbp1fMuvrNmZKphieCgK0uIAcZegDSA8hD81?=
 =?us-ascii?Q?EpjFTLy6gIHfsDfNaXrPMXG1qP2uMJ+01UBSjIzH6bPQSIpXhsjK3tfYWt/y?=
 =?us-ascii?Q?WSvIgG8gVy4DV12JA4qm68Y0gSDtKoSOOZ2ZAQoppEeRAdvvsWvT0OIGaz8Y?=
 =?us-ascii?Q?T/lU28mj1L/NJ/O1HNHuUN/kMHGLabKMgDqtbSdKJScQvOz2I16Wq0TXhNo7?=
 =?us-ascii?Q?86+5+onYIqI02SUZv9g4Kb+0LE784GfkTeoIeLN6BrDMSWRcmXXUt60eE0kl?=
 =?us-ascii?Q?oUIY6gEiXHCKqYj78snEDhWMWU9wZiXHsL4aX0ne9wjTTKj2jqvjcp2JMm/G?=
 =?us-ascii?Q?kVqLptUGjWH0x0ph3fqybTRdaWzxSQOhdSoT3sOpipPsXwd6mfa+Ib1Xt+ML?=
 =?us-ascii?Q?P/Cjq6LG2zL4rEEcX1xoUJgvFw05eK3jmzc69jAMZXyYk6KpQsMUPcpahGOO?=
 =?us-ascii?Q?loSWrn6K0Siz8tMHIy2Trza/jKEmgfBJipsvkt1SsTvTI4cOJ0zLW5SggsCB?=
 =?us-ascii?Q?gqZnG6kO+V3sxk8Ak9CWOkIJkG8gI0qC6Q3nMJGG0J5eTj3TEHExXWbvpa4g?=
 =?us-ascii?Q?Zeww+cnqb8725PJ9mkb+1LFCyKzTqOdCZCCPZwhjeJVUo0cMDpGthPcHFcq7?=
 =?us-ascii?Q?8O4ey1jzG+tU03fv5KTq/FC9G45p3Efx6u2jLrpGL/JFoxzdudEonotRjl/I?=
 =?us-ascii?Q?8IynImV8RKdtk+JgitrfQDTZkIRU2JNhD5YADnwtCmc5zH8Ix9UuZoUkX2NS?=
 =?us-ascii?Q?KcxmV1n21We0PwrMsglMYkYmw7YNQf3WLdt6JLsPakI38QXVF63hVSXO3Cxm?=
 =?us-ascii?Q?EyiaekeNTY3T8FLlAEgceLEDL5vdRCBqVjkhZNlvhIH1kDsM4dd7+1+Ee36N?=
 =?us-ascii?Q?ffTXTB0DuJZ6vqxXJbNKDODsph8713fayGGnjSBuFW8i3TZPYLWeOqKGfsL9?=
 =?us-ascii?Q?rlGjZ795SkVhmFERKs9Rs7Y/bG4W5gBvyvJhnyjMMNrBJhn9+knUoutVwkdB?=
 =?us-ascii?Q?xyD/QEnymr6+M4uCFKQ+yhfSQvEcBEoazhjTDhIGnxdW+1I5p4geVaqbZvtL?=
 =?us-ascii?Q?bfSPAZ0HnlwBCRyzRGZQsTiFirbgKrRNaS/XwaP0mFD+5ymUUxFro1FuxFtI?=
 =?us-ascii?Q?FJ0JaHSLpmJ7VdxbPor+uD4u1h8DunDn+f9JyvSfRASKqQ9UeTNmK5HCWF7s?=
 =?us-ascii?Q?yz9XvpqJG8ztJ9cUie2CLyBWWrbGUJGFCMF8Q/uc7jofJ0zd7RZZdvaiZ5OO?=
 =?us-ascii?Q?PDuobVflvEMQ3KgqXzdar7vwvqG892B2mqrm?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?52A+Hsa7/SNTig9OIUzwpKFvOStpB/tbb06wPTvTUSnoJccGWKqOERz41F+p?=
 =?us-ascii?Q?+4p4GB+N7esXHZD9wGJuYSMDUGoZyumvR2DUeyK+uNvupBZz8g3DGjEpH22L?=
 =?us-ascii?Q?GLdXLAHkof1KdvDbBjRzkky8C1k6f39/d7JWixaSJDOqfzN3rUt5xDw8g5N3?=
 =?us-ascii?Q?RrHRmv1nEIHnid7XBDFbrKeqPFPjn0K9p7942EXEaR5ZTPxk+pucv65/edRy?=
 =?us-ascii?Q?XcFVvRkg8nwX6QKPk3hbD0sWNW0fMzUJVFDB9qpSgioHVlrFvidTu4GeBG4B?=
 =?us-ascii?Q?kV7j1uZ7GA5xWbzkK0TYdkbYqh29fVT8qsJ6HqS1o8E4W/ukXBNWH5BR9p7D?=
 =?us-ascii?Q?QJ5FknjRt2yjezOaM4qDOvuYyChFwflAzKE+2WwpCgoB88WIerUD+C7Xlc5+?=
 =?us-ascii?Q?e9gUbm3tQBmeHy4Yw6QkYC26qZd0xz2YFS6Xo3qUldV98vJSi2NRGzdRh+vb?=
 =?us-ascii?Q?3YU7PJrEwFp0e7dxBaOrPt+/QifQAlDATbmGNlkmiJV6+tBW90LrS79ceTnF?=
 =?us-ascii?Q?jsHSDquH9TOxSDKU3dc+LaAB1RZey2ZK4j0yHTRV4Cimt7GmAnV3VFmi89Z9?=
 =?us-ascii?Q?RumQfRbcpDI3SM99W7gELlD9L521NiViI1pv9Air/imzMQ8A/JdvnMRhEVwN?=
 =?us-ascii?Q?w2mmeRjv7plqH6/U5AWyxy6MSe9M2tInDzNJQsLKIoBh6Hybojedp9/5arEX?=
 =?us-ascii?Q?lrknZNAvvfWLwxmAwgFQvSoow+zmcaCQzZ0YvlXt8oHQawNSJXmOGeLI5xj6?=
 =?us-ascii?Q?o+E/DiI69S3wrZsUdob94E88/Q6wSoqAhiR434+DaOb+ZQIP4xxy6hi+YoN3?=
 =?us-ascii?Q?fijNVdB/4WZgVAQPyTZXwYNsnvGdWgF5At0d2RYvVL2KO/k4IrtVd7B4cnWT?=
 =?us-ascii?Q?k11Nu98OKJ4hsPR1rscNV2geTHsUqf85AaUAiI4D4lqtaw+pXABl3jzxiexu?=
 =?us-ascii?Q?hqAddebHIM9Z97WJBfmyp2sHFyQUlzyhfZYcE2JAxuCUNvEaZ4ut1s+NdxPs?=
 =?us-ascii?Q?mB1EyjeLiQdBd0TvRyjXmhh/uQlLJrB8vrRxn8b00SGqKwmT129m4sNHpm05?=
 =?us-ascii?Q?ucCBNKGAHdx06ePeqCS//NXe0hk5cTcstfDrMJC8xHqhLb7gr+sz/vJH7Bar?=
 =?us-ascii?Q?xULzWNDCueHVKeUkGI13CZS/Ya1C3Dcb6/wJGQqC0czdc3sUUIfO/dlaBp82?=
 =?us-ascii?Q?ZwQhvp/tFzkJ8LHj1Y+KMoMyq3K0DAjpE+9c11YO1FZIC5KV1gCY0LDlDuVO?=
 =?us-ascii?Q?ZwXM1eGQrqCoCcIKiVtYTNDo+u8fJgkB7z4aCaqzm9IYLWgYZZZDx6Bkg063?=
 =?us-ascii?Q?KlqDPAk/ajHcjvrNnBb8CWDmD02dJMoPA6ZGjEdYl3wjKBZyyaWPQHlnvVvB?=
 =?us-ascii?Q?4xemgvKGGfJIjtfnjO/Pg5FufLwSUxTNiN1VSjsKBIzyk8nLz4PzUMSvlBHF?=
 =?us-ascii?Q?hN5ZPeieXbO1zVESZAO8+oirEEtfH2rOrCOFntFnVizNxud+indAUgAIYhHr?=
 =?us-ascii?Q?yWQGcHsaKmX93aqezYSJ3yHH7T2VDHmwc2t1Qh0SZhjfX/DOM1PMM4J+A4MU?=
 =?us-ascii?Q?PJUkvNxbOOzUin9sxNM5dLXCCv0xEOZ+kiXCQlEwnZpYmS4Vz0lzFvm7l9bU?=
 =?us-ascii?Q?Jg=3D=3D?=
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e79b063-e3a1-449a-253e-08de369ba008
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 20:51:56.8494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FrcwWmzjX7VJOb+P4AIvalNdlknNphHFDrfyW+WFM2eRaxuzg/YtHD62jkGzPO/gZ7ghgyPJ4GnkyjyxMW3yIwgnyf7oyLUVHxCWOdqHCm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR3P278MB1666
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 21:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122390

From: Valeria Petrov <valeria.petrov@spinetix.com>

Security fixes:
- CVE-2025-66200
- CVE-2025-65082
- CVE-2025-59775
- CVE-2025-58098
- CVE-2025-55753

See: http://www.apache.org/dist/httpd/CHANGES_2.4.66

Signed-off-by: Valeria Petrov <valeria.petrov@spinetix.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../apache2/{apache2_2.4.65.bb =3D> apache2_2.4.66.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.65.bb =3D> apache=
2_2.4.66.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb b/meta-=
webserver/recipes-httpd/apache2/apache2_2.4.66.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.66.bb
index 98b2215f44..0e96643fc3 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.66.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target =3D " \
            "
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbddeddfac80b2c9a882241d008bb41c=
3"
-SRC_URI[sha256sum] =3D "58b8be97d9940ec17f7656c0c6b9f41b618aac468b894b5341=
48e3296c53b8b3"
+SRC_URI[sha256sum] =3D "94d7ff2b42acbb828e870ba29e4cbad48e558a79c623ad3596=
e4116efcfea25a"
=20
 S =3D "${WORKDIR}/httpd-${PV}"
=20
--=20
2.25.1


