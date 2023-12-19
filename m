Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE079C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 16:28:00 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.74])
 by mx.groups.io with SMTP id smtpd.web11.378.1703003271409456558
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Dec 2023 08:27:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=d0pfdTS3;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.22.74, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IResuLj9XAJhmEEMo1Dc31LtbQf/Fj+oSF0YYO/V6cwinANyLhyPE8U1vt3uWEcWWhXIVoGWaBZc7rhqWDCJIlRyRGlje6FxDDBMLmTY6g/y7MrRRO7+tiUeVC7vjUqJSNj4PZl4FZAIa4Gx3TEjqwcTP5VaG+IwyGhhv+5nuLGV++vTUxl7AdzhoJHF5gp/NCmrT2SbIZ5gz24ONb0cCv9Cg7pz9RqzpT9lRRJbe3WnDYoPxXS3JUaqrpwhCX+7FtbOH/ci+AvHhJNHgteHHE/fjXRSn2KJXjfzImgPq1uweVOekNX+AqVkEpgX+VbArH7eo/Nn2+Nq2PXaKMvLWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8vCP1wEUCEf+PocovFdcws9XPYTu4ksSlL1oEwjnQho=;
 b=bLhyNcxM2owxTN7yDsbbxDXroNxsMCXLYXZ4ZUYglO81tW7WbjBpIrSkZjuHTn2FYdgE0TLtY73MOD2V5L0VbIR8qJye+W6ddAd/CLnp9kwFpDMUiPqMKBahZvfVpyHLmb2cAecvdFtIMQVDpt+7xkxd+aarn22XC/+lLqgYIw0y0674wQTM0DUgmZYRxwqNJvqXp2jmi4t2BwtER9EHFB0D40z3rCadMxYR63i+aVhhM0VAj2xMrSD0r3wfLB8wB/p+3F7ErBJ5pCyy0k1tetdlneKTDCo/uG7nhIqB8BknCEfGMpnZzPDxMzDwH65Hwu7nVD013Mv3GuvkGSoXBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vCP1wEUCEf+PocovFdcws9XPYTu4ksSlL1oEwjnQho=;
 b=d0pfdTS3qJrM7FkOdBOoS9MuEFIQLetOLIT7wpPJcmCj1vhGoMHy8bH/btbHotIS2StvVLvpdwlNdVWLH4tFj98RkCc0XfWfDGRfPef2r/7q6Cett30mIBXmQDMLZHmSmOorriT/TcJ7oCq0FRlq1uLFPXsKTFfsdpGU0HAOcuI9PEZv/gA9Eb73hnAdoKQ0ETYhH//nVbDl5lIQaFJzx0S5DYQD5Hxo1y2Xjq5CVntzhvk/qMMf5CtiYJkk03RcUDsvebdETmJMC/w4fGzK1ItdEj53b6Ukx8Kp+apZzDLegE6Cbdh49QGFKLAjnA6kJQJ8QAr42fqU1uRWlP8CXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DB8PR06MB6554.eurprd06.prod.outlook.com (2603:10a6:10:129::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Tue, 19 Dec
 2023 16:27:46 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::820:f7b6:7f2b:324b]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::820:f7b6:7f2b:324b%4]) with mapi id 15.20.7091.034; Tue, 19 Dec 2023
 16:27:46 +0000
From: niko.mauno@vaisala.com
To: openembedded-devel@lists.openembedded.org
CC: quaresma.jose@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCHv2] pkcs11-provider: Add recipe
Date: Tue, 19 Dec 2023 16:27:05 +0000
Message-ID: <20231219162705.3865469-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0022.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::24) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DB8PR06MB6554:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e0b4be5-da64-4817-c23d-08dc00af6f1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+D/lrLNyHr0abPaWMfYX8QzD3ez2E7JipUoQhNswoRzeGRsa6yNQb4DDWkzsXmJMGlhPEgtlPuVvW6NOKYx2wMZmutv2VWj4fz850UIWiESQ7H6/WYPHDqc1i/VUUAsostLMQSRxmSruyjFUHZG95yCPmGG106DLFyR3FCCHptf8tDgb0O75vmts0OilSB0z6gmpdLlQHBR+FDCZJhimH9wKO5+K+sdrXm4J2Ln9yxIemdnlOYuHuKE5HA+gDt9kmbYS6rXn2xAxyJhl0ViFIb/FyGMCcWLmZ/yiK3gx3k4xZcvoS8IRKlzM3Fr9TwTwseMMy9Vx7rz3pK+65zUx739/W6Ll6/VsmfwVvwcSXsU4UfFD+Iq0Pa58Jz64FXfbb+ZRZWQKefzf2xgYF0dcAsKpr5dCXu9I2lRa10QTA3VxwfSAypIPmSDR23TpXUIMPcekMLWEg5AHWq5mplUWESQb2E2B+suc3RmNNRDxhJmcyShYCupfDAvqc/bXxnq+URKY1kIyqHg+/csZXu44BoropFK9eVD5v55nX1V6Jd6Lav0Qp+m5e+CJAFWwy6OEah8dXSYQwP69p36sjDuwph9mb7lSaFRW/vnnd2v5ccg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(376002)(39860400002)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(316002)(6916009)(8936002)(966005)(4326008)(8676002)(66556008)(66946007)(66476007)(41300700001)(2616005)(83380400001)(1076003)(107886003)(38100700002)(26005)(5660300002)(9686003)(6506007)(86362001)(36756003)(52116002)(6512007)(6486002)(2906002)(6666004)(478600001)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wa6GAz+zHxj4k6AkAfSHzCxTemNs2dwBgE5UiwTPU5bLZRtDMik/oP2WuUVt?=
 =?us-ascii?Q?qId4SQk/MsDxKDu0eO+QzwqPTVdVn2C2IiavwODZ3ecu+Qg5L8g3x6Z6qaBE?=
 =?us-ascii?Q?Xo0JmUeTIrjAjqiFaH+bm8RXyGaP50IvZMTD5p8KuPbj0bIIcngxsSD20vqn?=
 =?us-ascii?Q?Nw7HaeKrI8llDg0UgbfZbJxDiacVMbF6nMxhUN540Molyjk9Ea9zudu9Zzy+?=
 =?us-ascii?Q?nR64hyxVwJvkTFQuEOu2pa3Fso42Mx3q8I+OzrdRqCBGRMNFW9x9VuOg1sy0?=
 =?us-ascii?Q?5eHjyK/OYxQMKyO24R32CQSNQCf6TfptjZulLAeWEHrII1rUmKjhyMfjUhJd?=
 =?us-ascii?Q?W9dflty5rEG0A2OGKPwMjfmYjyK/R6ZTdehTQ92urTZpa/RJODql4rQqbxOM?=
 =?us-ascii?Q?AI4vt1/2UnLOIbXEZM7RGYYTZ9hY9PyvoGyDR4+JsWLbVIzQO61cs6WEOukH?=
 =?us-ascii?Q?Jcb0ykRnZATOs8DElI8xpaZSKcc2FizmldKvBqXLbrgZERfD2EXB8X0Nc+dT?=
 =?us-ascii?Q?DOwf9A0fyqPLyXNRc3vAGEEt6/RF3o79M+mOV1ebLhs2ZWOC5z6ypqlqc+E8?=
 =?us-ascii?Q?RZPAtCXvFSghBbHYl6CiYu8FrrYDWQzQ8BkNbOtd2YXi4zX7Sgepth5bXhjN?=
 =?us-ascii?Q?TgSv2+WSsmRBIwdLyYYlu+JJEnBMiNdpDQNTFLDMwsAWHmfpnOELdcPIq5UG?=
 =?us-ascii?Q?9hgaFlTAIlIs0pNbcRe/An1l6zxKEl91desDLiUmFzUQeV37/sFsqo3rZk1n?=
 =?us-ascii?Q?TB0cwRNnbJJyarEkzI0vBdKN8lSv2ivIm8ntUxQS5jlUKiNZ3PFpT9hyKpS6?=
 =?us-ascii?Q?KoqgXLHDRdlehqQAr4NCbdd/EVIClI9jDZU+kUdMAEpuuKpKq4/AihhszyEp?=
 =?us-ascii?Q?HDMWC9Fki8LAc5O7Zqbur/4qNsYItnvSF/wh6ENWaXfYOknX/sftBboJcvYg?=
 =?us-ascii?Q?IvDdsyYF9USHlT/QRBMP0NxxiPnhteF7cV6ciIuY7pKdMf6NGtjwVGXXFb6J?=
 =?us-ascii?Q?h2c1T8S833L6jAh9QuohFahnUR+PZdM+MFFwlvHZdhey5+gIVLb7BqvihdxX?=
 =?us-ascii?Q?IpUWxatmqoICKQDKhv/DqL6+GPM8+PZUuDZvwhVuWpc1XaPz3cNJqhL1APCf?=
 =?us-ascii?Q?WxGSr2NoC/pR+WhMNwyeBJSNlv+jh9LlRI7zv+mrGtf7+DXcBVrEkdaObFRx?=
 =?us-ascii?Q?iKdaa5yHd0kUCbYWJIlI2NL/WhVWK8WUAiExIiesH4hD4ZFF3cFfguAwT8r4?=
 =?us-ascii?Q?+mhOoToYr96/Pn0VT29Y92pP3YFIX22RrRhcVuZwB4WYlwdRbh+NGW8ebWzy?=
 =?us-ascii?Q?n7sKaw+MHYxfYds5h8afnzrzpaZ92yaD3ApsmYHjBU6Ar/Phs9OASPjAQn3T?=
 =?us-ascii?Q?UCE2wsNFXM8sbdpzr6jikPQ4hTqB1BiZCdBbZCgYJnkTijxhvUI8cHehKsJB?=
 =?us-ascii?Q?8G81qjJ3hRBHPMwHOdarI+7D7oMS361EQMSw0u/ZO/NgD4wq9rsvI/gLXq7X?=
 =?us-ascii?Q?KnDbcr2Qltenj8nOSeZZf9apDCvF+n2eF4wYsJ78V3Jy/FCEVmtJe2c4CL2i?=
 =?us-ascii?Q?AercoIEqTKfacv9wPrCIrVgFPynWFOQhwqqaQb9Y2Co/RZNkMb5U9qG/0knw?=
 =?us-ascii?Q?Xw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e0b4be5-da64-4817-c23d-08dc00af6f1c
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 16:27:46.4928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QuwObIkIWeTYaULwJUVyXEPLkN76Z4CyhQHgc/i8mBZ9Dwg2r6ARoFEOGwfhz9uGS4ayEeYyqljrSA6SaatIbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR06MB6554
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 16:28:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107638

From: Niko Mauno <niko.mauno@vaisala.com>

Starting with version 3.0 the OpenSSL project introduced a new modular
system to extend OpenSSL that replaces the deprecated Engine modules.

Providers are loaded via configuration directives in the openssl
configuration file (or directly loaded by applications).

The pkcs11 provider allows applications linked to openssl to use keys
and cryptographic operations from a hardware or software token via
their PKCS #11 driver and the use of PCKS #11 URIs.

The pkcs11 provider can be configured to be automatically loaded via
openssl.cnf

For more details, visit
https://github.com/latchset/pkcs11-provider/blob/main/docs/provider-pkcs11.=
7.md

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../pkcs11-provider/pkcs11-provider_git.bb    | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-support/pkcs11-provider/pkcs11-provider=
_git.bb

diff --git a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_git.bb=
 b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_git.bb
new file mode 100644
index 000000000..2e25d91c5
--- /dev/null
+++ b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_git.bb
@@ -0,0 +1,28 @@
+SUMMARY =3D "An OpenSSL provider that allows direct interfacing with pkcs1=
1 drivers"
+DESCRIPTION =3D "\
+This is an Openssl 3.x provider to access Hardware or Software Tokens usin=
g \
+the PKCS#11 Cryptographic Token Interface\
+\
+This code targets version 3.1 of the interface but should be backwards \
+compatible to previous versions as well.\
+"
+HOMEPAGE =3D "https://github.com/latchset/pkcs11-provider"
+SECTION =3D "libs"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db53b787444a60266932bd270d1cf2d4=
5"
+DEPENDS =3D "\
+    autoconf-archive \
+    openssl \
+    p11-kit \
+"
+
+SRCREV =3D "e2abc4a7ae33159f2fb21b9d87a05ea9e79ef584"
+PV =3D "0.2+git${SRCPV}"
+
+SRC_URI =3D "git://github.com/latchset/${BPN}.git;branch=3Dmain;protocol=
=3Dhttps"
+
+S =3D "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+FILES:${PN} +=3D "${libdir}/ossl-modules/pkcs11.so"
--=20
2.39.2


