Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E865DC41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 16:45:10 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.58])
 by mx.groups.io with SMTP id smtpd.web11.848.1703004308904640986
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Dec 2023 08:45:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=btGyeV5H;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.22.58, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VDmQvQDAo2nPhVO3prujmUfqqvwbk9kKt7/MaczyBjVTmkrQcZXvVf+SADTqMKUmz//le81Vo6Um+yJj2Xd5jiUbn/laAY8YbJOm0+99u28+++LRJytpmnn1XCIKwHtmvLoSAOVd4JJSSQT9TxHbIasJk3EyxqpuXR8x+rutcgnqwhkWCOq+IG0Tm9jX6zrKPsL6R5kguc2ZIrRb6RvNX7+T2QUJRy1WvLF4DtrPzQTHdlKWTojvCh/5l6dXs/tWlEwsAdRhzEY0aNc9UZCqFmgfXMvRXvvUMnTV8QSgSfOWvK8284fgb2a3DMtsV2qxGVkNo4jGlQ+aySIss1BuMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wvqOTAgFQJ0HDYHjml7zGFqcUec5oqkk8DWk7Ouq/Aw=;
 b=m8t4fFzXMYTw7OOu9FUrf+JOynCpX9ENf7TqesxIupk78LKDcaj0Egi5RhaosJZYWywCP4bZAfqzTPXhA0+9bFenEVmBEesyAVzIY6EeEO9Cr12y775Uh7phpWjlx+2liZ1O/8m/Yxp+YDBWtkIUGwl/S4Svp+Z6DdCmRr2lurNd68MGQU+t+g8pLaqdTL6th/Q75yJU56q93NlfPjpiQG1fIEkmXq/X3NHtWt9KwPDiEKlo8ckh7XsNCwAmWH0Hkf3SE/wSpz1ucwFc/J2RKehhVyxX0V5Gz0u1DftMg0X4er09G8tYlpSQxDm2vm7dxZaUxR+GrRnqJKLWsZPolw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wvqOTAgFQJ0HDYHjml7zGFqcUec5oqkk8DWk7Ouq/Aw=;
 b=btGyeV5H9fc0p6PbYpNVHmvdtDMiZxfJxabuQuAA2vJF791a3BVcBK4u70mlqx/odiNKWpQ8tPRW0UJGBpJkup5IDBkFJz0w5Gb1Jn5OF7HoSCzkfsIkrw0acWb9K2VfugWnUIv5tAbuAVIOHLzcVXpd+v5Iv8JUjl46yELm4XoLb0uvXXDGH3ZMNDcsX8/13za2fkSfs4N35He6KUOlbMQyf+PlGDaXppfVE5zZ5j8SjYx4A5WMBbYe/vP+BDrGE7A+hoScnbQTj0AX3W5MxOSwkqXzcmvhp6lkK3cd49x1w8MORUmJ28b/Z0hjuyWuiOwU45nkxApL033otP5rjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PAXPR06MB8061.eurprd06.prod.outlook.com (2603:10a6:102:1a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 16:45:06 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::820:f7b6:7f2b:324b]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::820:f7b6:7f2b:324b%4]) with mapi id 15.20.7091.034; Tue, 19 Dec 2023
 16:45:06 +0000
From: niko.mauno@vaisala.com
To: openembedded-devel@lists.openembedded.org
CC: quaresma.jose@gmail.com,
	raj.khem@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCHv3] pkcs11-provider: Add recipe
Date: Tue, 19 Dec 2023 16:44:40 +0000
Message-ID: <20231219164440.3870374-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF0000382F.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:5:0:1b) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PAXPR06MB8061:EE_
X-MS-Office365-Filtering-Correlation-Id: c3ad646f-4164-4eb9-4c85-08dc00b1dad6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jA7JLnIFTnQAm/+atMKxPIoGOpmOEwgOeF4Geah4lcEY5oCIGovbawqn4MgfUSTSJT3JLVAxgPAHugx4VDOREwuEnQQWDkeKBV8z85gHWivfaSS9rDzscLFDbwjtd3J5MTAw2U8GZcAhkdL7B2bQ1zYdpDojmoAL1IBms/FMzlFxV8GDzWBu5OKZOdSGRJBB4/tyuHmjucV3rF5NgbBTawQG7we/tMIdClnIPAgEnq0ehtAcDFK38I0eOQThxQhYSPkRR05YbmBhTo7h7y414+bCF5FfaBi4aup8UdEwThMjWfuxNK+mSxkd/afjMDWZFgnidehA+/LCQHn50HQFxs5q8oOwq1qTiafhgMQqTYuUE+FpANx6ZRyuekBBV773Cb26YWlZbcBb2eQhnC05s94FVkNB16/ynlIebhth9vmMxUk2QwRw4/tcUYuVytMby0oKRx6Dad8DK0aZ841qPCt7/LPXdZcsWxb/gAQTjsFcjJ66OjddrEJD91H7c4jEEi7AIy6uYu/xOdazruySM6tk4SgaknP9RLDB2jNGZ+ZzlsYnXQlcUBu8btXHzcIP7i/HcVh8CWtbL2nAyFanz24+/NEqvlAIokhJY1bBb2Y=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(39860400002)(366004)(396003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(6512007)(6666004)(2616005)(1076003)(26005)(107886003)(9686003)(52116002)(6506007)(83380400001)(2906002)(478600001)(5660300002)(8676002)(41300700001)(4326008)(8936002)(66476007)(966005)(66556008)(66946007)(6916009)(316002)(6486002)(38350700005)(38100700002)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fJCzOPjSbelHJLI5QAg98q7oNtgr7KCw27kyVap11hz1qDRJTTyvn/VPrf5H?=
 =?us-ascii?Q?A7j15xLw3bxy0AD7zBD6TOjkMxCxT3Vcj2vmT8Ow3TRSREEqO+ECXOuW9sSd?=
 =?us-ascii?Q?CojCbEEmF4OgnbeGmcT3aTFpkk5TGjWqWd422iCHAY8Tr+nCb22qvP7bRSkK?=
 =?us-ascii?Q?4JntzwwEk/cYSDOKrsSEVy1Db8f/5zihNjGVt6LPhiVAWAtParDLMpFdDfp7?=
 =?us-ascii?Q?hGkGa3e30/enA1jln2ZbUNOS8lffAQr2iRCXavMO+SXSLfVfqtl1ei8JU7tW?=
 =?us-ascii?Q?3n0BoA/RpZOfQtXpS3HL/49xjb6MSMM0BeVxgk3RLZlMxy6LBzqZoGB43ccz?=
 =?us-ascii?Q?5dbfUGcOqoQR2ReSnAp7iP/Aweq9QVoOUvIuovXJFxVtQPhnSTO9ySuUX7/j?=
 =?us-ascii?Q?wi90KlZbbR7H80kJWRcJe2VjtmepYdIvctZ4cKAZRz6KWGzgeLt1CuvhT+sk?=
 =?us-ascii?Q?SRlGf7SS87wb1/d+zH6ZxMfgEcHa9wWvB0nNl+D5p7PSoJSoAWEVkelQ1En3?=
 =?us-ascii?Q?VQyXEtzLtLKsdzkKAK7Ow3dwBlHZKB+8fVvPIVWsHDBoRdnhbUBRCgZUdY5K?=
 =?us-ascii?Q?zgaZ9vu+K/E1K1IIeZNetZcAtz1PYzHRrSyhAc0AfmaF8XiumWCtL0e/PfMG?=
 =?us-ascii?Q?J10CDtH3L3xj5T6nH8LnOaRf3Tz7YZs6w2jZI0DGJkx20QcG9Le4uoy/dTPl?=
 =?us-ascii?Q?gJcLTYjsJg8XCif2il6DJVeUevAXp3YV0QS0rh0e1sBZrYiuxhXEoBtmSt0w?=
 =?us-ascii?Q?ON31R9lpUjeYW3z8Pp1KAkW+vwjoJgeKawglr4FGp1lUvOTy/LXmEmuyPmJS?=
 =?us-ascii?Q?am0eyT51xOOmBbaC0QCyL2vvMBQi0648I1n1k7k7AryoDBaEf7YVCgh9sunF?=
 =?us-ascii?Q?SdgPG3TngQiFyIIOyYyOfH9a6nFSsdxR5dgeoBR2TzKqu5+lfetltbQJwSJU?=
 =?us-ascii?Q?1t8NinghV4pgLplNPmwr+89BLZI+qKIru5QdsQjy55Qop0pj2Bftqr6Q74bk?=
 =?us-ascii?Q?aIj52a8FAnDBhMUEalJ5F7rAgIhW4wc3eTEbTmRy/KJ6JKa6clT7oPDF4ruR?=
 =?us-ascii?Q?e/OhRFNy8+4/HHHkKNJIl9Yv6tzixBUWWQ9tZqMHWBJlkF9GFo7yXT9TzV+a?=
 =?us-ascii?Q?mkXUFGJE6iU2Cw/JqzuR7lVNhonrvN5x/pXkplSzPmFVdWWFOhzA9CBcjMUn?=
 =?us-ascii?Q?bm5fIWbuB8kU4c5+t7dqko7D+4HjzD9RHEKsamIvlBwhNnqKAoQ9qEdKEYbF?=
 =?us-ascii?Q?8lSjCWgnJqHp2iYSb3XxoeDoUeDHeI3xmYqYepHCxjvWvbLb0x+HeLfRoDRP?=
 =?us-ascii?Q?+oR3qL4iRy+cIgi9vv8PL4Gp7KDp5lxv7z9DHVd17IkzTLgcXVFZKh1DCySu?=
 =?us-ascii?Q?6su4B8pJKKEA2eUcTpNa6BJjB4wTUNpWs6YcYeA/VQ2sq4FO0HOiW79pBipS?=
 =?us-ascii?Q?BshZQDnq273YeRnU0+U6JoVT52ChEDXypYhjYmy+WPua5Dqy1ChYpzSbUtR3?=
 =?us-ascii?Q?cNfQ12TDLqVqBIz7ue3a1guoBZ/dL17oCM42qnrFMpskqVZ7VgeIzd0fsjml?=
 =?us-ascii?Q?eiZfRQf7J72VWbcPC/KHYuNTU0Jhs9LUZETiQ1f9WQwX4PjKv9n+kPDovA5d?=
 =?us-ascii?Q?hw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3ad646f-4164-4eb9-4c85-08dc00b1dad6
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 16:45:06.1487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wq2yZIDGBIbyu4G6vCpPvhSyC744GBjkxm+pZ3EU+wkbkS2ETkBYD/Hfu5DAJsUEZBo+MDucOLXZlDSgvPl4UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB8061
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 16:45:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107641

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
index 000000000..19412a517
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
+PV =3D "0.2+git"
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


