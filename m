Return-Path: <emkan@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F260C3DA6F
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 08:50:04 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.139])
 by mx.groups.io with SMTP id smtpd.web10.9320.1692953401511744747
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Aug 2023 01:50:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=cI4NgQIO;
 spf=pass (domain: prevas.dk, ip: 40.107.247.139, mailfrom: emil.andersen@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EBJDH+EdX1sEu6rPXYge2A6hxtNGkVrTeNSSTqQI4V3jDpgMjMvumrlKcJdF6ylgPYU1Y2rI5N9OCX+mrAZDTuPYSoeEyKK3Gu2ienwcjoThX4yYEFHmENfRNgU8nRTZHlZS4Ov/SFivhLD0OQvjS2MfeBslVsVRyzKGcU+XEuU9tg3wjrl2FFIRKNOXjE671/XDk+iB5cNd6EgcmSfjmHISHr8dQURCeOJ4pv6FknGtF5s8pUWZPNOg4CxjqhiNIYXqVABDnKBWaR0jQT+NwqnCERjBEACOX8a5kYnqEXdwATf92XJ5A8XU08b3jcGFvDjpm+nUNfAJrtAI4vkvAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rkg481ktBcPJXE4T9+ygZzOIrUoxDhWqlan/TQeuZyg=;
 b=nN9X+RaEva6+Rav1vZM+jvIGqumUluH+Dfr2GMk6MJQRPc6YhYL/r3utT9yoJ847AncdPdZwdUNd7gWmoGR3nNKXx865gXSuuPEvmcbeK6ylJSaGQSzZl/QjYDvOxNNsMjtF05OAVylKatrZtgXTIeUqxHCX8dND0dA+DWAK+d6W2bki3CkthGlK3wyRkQooqcKKWNwcDEYPxVGYdLG1SlAUs5wt09H3FQ1BY3CFJ3uYYayCAPpkVLJnLexXxl1Yh4xcsP82bb6M5Q1YWxSmERklKuHf5ZMvdvvvp1NgY4GgzXf1Y/3eS4fZ2+96FQTVJ9VQAVAEH1dQA46SQz/9Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rkg481ktBcPJXE4T9+ygZzOIrUoxDhWqlan/TQeuZyg=;
 b=cI4NgQIOQUy3Q25GzEY4+mrFZKlW7P4s7LqQcQpP5blGWsHQjsXAqPw2vsVlVyGWI9/fTyhGxGhZFalDxenfutMgjlWxMDkFISnrMjrSiI2pY0OIOsnoNsPr16xI9qHBYCU+l9+q1MPSzeFAvMLCLy95gcZ7tp6hARO3Q69UFX8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:10a::24)
 by DB9PR10MB8286.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4c6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 08:49:58 +0000
Received: from PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6def:6be3:e407:5126]) by PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6def:6be3:e407:5126%7]) with mapi id 15.20.6699.027; Fri, 25 Aug 2023
 08:49:58 +0000
From: Emil Kronborg Andersen <emkan@prevas.dk>
To: openembedded-devel@lists.openembedded.org
CC: Emil Kronborg Andersen <emkan@prevas.dk>
Subject: [meta-oe][PATCH 0/3] add missing CVE_PRODUCT
Date: Fri, 25 Aug 2023 10:49:46 +0200
Message-ID: <20230825084949.18322-1-emkan@prevas.dk>
X-Mailer: git-send-email 2.41.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0078.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::13) To PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:10a::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB4576:EE_|DB9PR10MB8286:EE_
X-MS-Office365-Filtering-Correlation-Id: fede0a51-fb7a-4b8d-9138-08dba54842e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eOhZW6nZmGX4A6Y3zNf/Z614NQCH97EH2ucwZqVHHaKZwkzlXZxqanVxVV4YIi09Y6rk4TKDNKEXEdj/FxBeMBM8zeQz7NZ5/f/ojSUK+zkguvuRozjrNv6AD6UkcDvjZJoZorvm+guxhXgYki5RcT9qYSEj8IGrl4wn7XTW3bAosbBDRfblBL7CYRyDEt2QtfKMxxb24GUybtmqw3ZhUEKJ8zHsvSkuvdskp2AvKjg1d8MwNS/mbEh+QAI7a2fV1srmBCuqGOu2Iolm3A0jL+Z9a/INXuT8TO7H4cZe10VDKQANTLiuhVC+3YN1nK6+qWA3TJq1yk/cCOWNgV+jOM5wH3rScSAW98Qn2/PSFfMO11H/jPwot030zdUWEqvZOM1w6DrxZoHCv9xhdUSvB4IfBJQvTF9bDfArRNCLxWEj544mNc2pdDLn59m9KbftCCcdmF7442dRg0XZEfwyxnbHI0mvQIxFQKo/d3xP5e+Z1lTR3dcv1kEWfoMp3UTtm2Cq25QS9F2Uuj0exrUZlJP8NxCjOyyhkZIAaNPHUI2pLbPe11SpVgrxP1dp40UCGr8D1mKDSxHQtRnNQTrrzKWEMyGStxzWNAFcQGQCL1S0qp72fmr7vTJtjfd7UIxk
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39850400004)(396003)(136003)(366004)(1800799009)(186009)(451199024)(1076003)(2616005)(5660300002)(107886003)(8976002)(4326008)(8676002)(8936002)(36756003)(4744005)(26005)(38350700002)(38100700002)(6666004)(6916009)(66556008)(66946007)(66476007)(6506007)(316002)(478600001)(6512007)(41300700001)(52116002)(2906002)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yFbUgFBaXLaCMyPISknBzFs/XhA+WdlOtPIeJWHp1TVtbZRDhF/pNMVgymWQ?=
 =?us-ascii?Q?GJIwzz7yiIr3ghUcWwHo4/y7CfQHMmgCvDIMHvEeI8Aa6PB+jpSqtp2cE8ew?=
 =?us-ascii?Q?oyzpdLy3IMHXw1c16fZo6HxVnG4ke8/sDUTOzdBo2PlhU2ax6l3t0XR7RRD9?=
 =?us-ascii?Q?VxU13BvNbKUxvkyWe4JEwjG19ZDvb1ktLpnc0+KaShWXKacFOF2YVB+DJciA?=
 =?us-ascii?Q?Z558mCtpEbaKHk2bMvHxxKR3YwI8Qq5BACMkL5nmsQaBqkyJW7fdtYjpMhLm?=
 =?us-ascii?Q?KIqaVHSydbZND57f+UbxnPAoYPuTPMYAmaFQQ4b6TzFgCXOYVU4Tofon/kky?=
 =?us-ascii?Q?RnVBLjwfnB+APneHLOWPzSWfEaphwGYJ50eHldaceBsPG0Ds3OsTRIxqFrMW?=
 =?us-ascii?Q?g47GX745y4P1eXlAWURjtjsUTn7UR7q4jQgITJ6BTC00Zf4LWmcZVH9m0tzy?=
 =?us-ascii?Q?RG8E2LSMvpU53nqzL3pUuxrqsjJPf5X1Tv3FRARa42MoFXvT6ijqydo7IJs+?=
 =?us-ascii?Q?Pf2poB6xVYD9hyI4QS0l1KBlm7onrVpzMDza0IFHOJiI5+a9LKbI812+ZSqI?=
 =?us-ascii?Q?G1Azhdqt8ySPLOtfoliP/EJgYPRQvLPlhc7SpbPafTwXl9zDnN9yYbeiyiji?=
 =?us-ascii?Q?f6KFN1VBEbyA/FGR4EY1gbBhWDkhKjzL+CJIZdDKtyHr/Fox+Q3Dubgk5Q9P?=
 =?us-ascii?Q?AZfxv9qFVHzVDZJLSmQKFbdY27xTu35yO4aHtmHqFVBwCySRUBawmkpMzDFo?=
 =?us-ascii?Q?eJlKtEOCDva/S2HrsTNDu28s34KGcLMdYL8n4yvr+tG90H2wUMoyNrWCCLCv?=
 =?us-ascii?Q?tsT1xQGqqyGG46thj7tYs8NcnsQPkNel52eccnctPp1vV1UE/E8oPbEBQpzq?=
 =?us-ascii?Q?UOIkVTGGNlpQ3sEKKXplVeFN1GNwt4xtNrQ+vKFplIL4UL1zShNqUsJWOI9h?=
 =?us-ascii?Q?9OKJ4TJvEeiOo5R/Oy3zEs0XiZEEQOXgllToJr7duELEpGWF5I5RQQSZ/4cw?=
 =?us-ascii?Q?peUnjiTAZYIxPtb4fen7zHAncqfDL+YnD5KjTICZNGAjhn/5qQXsK5J8oeQm?=
 =?us-ascii?Q?4x7VUSw33lpKe1ALjyPW5Z3HvpMrlC6nT1vpb9zYYe1hVPtgWI2U1RMbT3sY?=
 =?us-ascii?Q?IuGMaBXU6B7POB3iQfKsl/Pg10lEF+xHBIYhyRPwg13XKylNybpumfuEJobi?=
 =?us-ascii?Q?Rb9rhV0ArQoDDaWfXtXP6751L+G0nLQ/+tY68L0mc+4BLBNkpdHmk4XreBFR?=
 =?us-ascii?Q?79mzekGdsvJfgFqKXm6AmQ2/R8JIsWusa7mEd8f9qziDjy4uOvpUkWfpLQSB?=
 =?us-ascii?Q?ahXHlTxqPUaqmVGeLPbP8ILXoDfF2HEhN0/xPt61diB7edrv66cLRtQD0lW9?=
 =?us-ascii?Q?1SpMMVXHXxZpCtdpu+Y2x7JAuCKUYvJz+7iv82FBtxwsI/DNJyI+6XgCwfu+?=
 =?us-ascii?Q?LvWuU/OSj8ElsM1aOwZHG68290Cy1c5i/aKSdmdvuT5ZdJZPlTfEmkVF+zvO?=
 =?us-ascii?Q?hpltGZLrsbE1b9NHzWLqzL+ywkNxlC/UqI9GkZau4MXXATIkrqbL89R4oNUx?=
 =?us-ascii?Q?pC3t3fUCEdKEeJ2kfK36WniDVqY7TRTrmu+UJJnHapgpVLz2vw0/1ZYsjArW?=
 =?us-ascii?Q?rA=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: fede0a51-fb7a-4b8d-9138-08dba54842e3
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 08:49:58.3345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4PC3a644C4d/b1mzO9vpq6ZodcJ4Kaw1lLrNbaolk3vwI1p+t7v0Yd+hgVRGvFNy4Vof0513u85JtaVdSPmQVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB8286
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Aug 2023 08:50:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104603

Some recipes does not have 'CVE_PRODUCT' set, and will thus pass a check
against the NIST database with 0 CVEs, even though there could be
several.

Emil Kronborg Andersen (3):
  libopus: add CVE_PRODUCT
  lcms: add CVE_PRODUCT
  snappy: add CVE_PRODUCT

 meta-oe/recipes-extended/snappy/snappy_1.1.9.bb   | 2 ++
 meta-oe/recipes-multimedia/libopus/libopus_1.4.bb | 2 ++
 meta-oe/recipes-support/lcms/lcms_2.15.bb         | 2 ++
 3 files changed, 6 insertions(+)

--=20
2.41.0


