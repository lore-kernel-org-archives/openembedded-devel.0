Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.70])
 by mx.groups.io with SMTP id smtpd.web11.24164.1611122410229063475
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jan 2021 22:00:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=hdAh/9rg;
 spf=pass (domain: kpit.com, ip: 40.107.138.70, mailfrom: harpritkaur.bhandari@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FbEPECcplMjY+lxiytMtH3BRCIgH0+xcxrGJqV8Kh3d4E6Ioc/p+sL+fhinasge+wgf+hVva5ThaKD7Um9urp3YJ4iaUpniFSLD6mX8LmvMYyNEBrA4WtHaAZlY2rVh4YpwsauKVzXpqCq5oR2w1Z9ajfDMczHVF5j+r4IAyzAoB+h5RB24000zulcCtXnQGZ2WBiQcqch0Vn8yjePxS6N4qSXtpwikyucmlfhfGKEvNIFjnIVOAlDs/e+jI5jYRolwajNgazX4vMgLARXPZM/xwin1t4ySc+9nAVwx8n02BNNPohqZfGWj91chY6JHx1ctuXcwZdVT3SNVWIpvXEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mb4kqOdT/GeFRWZG9sNTzeheW8vs5Fn970A0cTP5khw=;
 b=mzEViMLiX2wUFaHxycx2S2fnHmEg/8dR4gnZePeLvXw1rpTU8NfliZY49fdDEjmNdIn/lXCBl6fEAHKe0RwtNBnk/gYez3WyxR8bQpfvZADzJTJmvvyg3SwDaRNYYz6P/l3/6Mj/9lGIAU9tGnIDhgELbzr4S5MppPRfuoqJ1uuPsiyzD5V08RmAMGlA/7xPLiG2X8U/bq6nta0pZbySR7NBZ8YsCXV/n47dZFiL6UZoGQTLc764qawGe1tfyGCM5wxWKOm2+wpRWr9o6ufUi1qzrKD8u4jLVeRMUW6x6TB1f9D0SiVGsQtA7vDrpmunaT5ts3qm0w3gQ+fRHInyAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mb4kqOdT/GeFRWZG9sNTzeheW8vs5Fn970A0cTP5khw=;
 b=hdAh/9rg+l5jkoaRUwGSK7CQ05whydXe8LK4FT3mBf+VTQN5Hg88xA73uoF/QtNeRfijVoo3M6NwPfuQaQCIo1Zl+oBm71w6wX4L5MSAdiFB4w0ue4KWlGWoY0DbehSculB6FvFE+RfgfX7dy5sq8AjLY7ieg6PmWKb45nZWvDQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:16::13)
 by PN1PR0101MB1376.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:13::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Wed, 20 Jan
 2021 06:00:00 +0000
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9d4e:7536:7e00:3cd1]) by PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9d4e:7536:7e00:3cd1%7]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 06:00:00 +0000
From: "Harpritkaur Bhandari" <harpritkaur.bhandari@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	aditya.tayade@kpit.com
Subject: [meta-oe][dunfell][PATCH] rapidjson: Upgrade SRCREV to latest
Date: Wed, 20 Jan 2021 11:29:52 +0530
Message-Id: <1611122392-13465-1-git-send-email-Harpritkaur.Bhandari@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [182.48.232.78]
X-ClientProxiedBy: PN2PR01CA0177.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::32) To PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:16::13)
Return-Path: Harpritkaur.Bhandari@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (182.48.232.78) by PN2PR01CA0177.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:26::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3763.10 via Frontend Transport; Wed, 20 Jan 2021 06:00:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 44c828cd-0089-4333-36de-08d8bd089f4b
X-MS-TrafficTypeDiagnostic: PN1PR0101MB1376:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PN1PR0101MB1376EE463ADFDFDC21D9CC29EFA20@PN1PR0101MB1376.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	W5nyl8052Eowlle9FlDQUmhf8bHNzMiWZm9x5h+fSsmlD3VctxlCWlZVYTNALnyMQPltWSKmJGfIAAJCvuh5IBI0yR92VgALyiOs8V04QegzmTxKp5J7knsTHyA7y8TupLBPSlpLw2wV/m6MN04nYQK/T4M/fmw54suAcrjqcXq210fw+/GKmPtcxrvU2qxdDkPnCiJ3qjYNgYCGNevuYFXGqL8rLabHP3cR6EQP13w6rKb2m2hM7yVF8CFtKFKza6tn+xFGvvFAbNJFH5uvXi5pgKAQCmw2poBd5Ni/oe95fgKU+D5a6knz0dYrxIe8TMcK0/64C/hHsjpvtnckiNBM7pOUQov9m9LZ3X8Wse9yxvpAT5MfMoXJ6rjCwgnifE8Dd70ZwclxIN2FQpAHbJLvMEyhEm2UmSSKasTvckS3H5imHZS28Z50CpE6F4Ij
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(136003)(396003)(346002)(366004)(316002)(66946007)(66574015)(36756003)(66556008)(16526019)(2616005)(86362001)(5660300002)(186003)(52116002)(956004)(83380400001)(478600001)(6666004)(6486002)(2906002)(8936002)(66476007)(6512007)(26005)(8676002)(107886003)(6506007)(69590400011)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	IYo5fUJL15RHMdxj1Xz1UfvvPTre7Zoi3pXsndvTGHv3A7vis50FqHgv1X7gnmfN6gRX29Ajf2a8prqU0K679g1SrrK5ISOADXVi4vbB/pbLQSppvT9+utmEZLCgC/A9z4bXwOqySSjc5NAZF9gmVg1suJetu37aCdN6JexScl7LrTvwVfL0XEXiSMWi1OX4mb9ECV7uFqX+2fCNBU1RzNVfOnfOvu8FHVZroxpejB4Jt2SH1NQG+2yA/iS9Szxv2rbymtZPcivFEMuHwpoOVDg9dJZibnPysL4G0mqAXSE7yJmEyX4KBCS8aTgipbpgzbBfcclr9J7d8tz9HU9GOvenJ/+zyL/M2JBeyKbZijTJuotGYO3J0rGLv8wEY+R4KtMxi4HUhWP9z5EfKlKk+w==
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c828cd-0089-4333-36de-08d8bd089f4b
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 06:00:00.4601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CnSOYg+QVAZ6UmVPQzrSTCbKfl3fgUOu1+FVN5Mx/FhgJsjEltYKFsYf9JtexcINfGTAQ50xWOXswjIUdr6/4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1PR0101MB1376
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Upgrade SRCREV to latest as it fixes the below issue:
Running UndefinedBehaviorSanitizer on projects that use
rapidjson triggers 'applying non-zero offset <NN> to null
pointer' findings in 'internal/stack.h' which are hard
to suppress by library users.
Removed "0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch"
as the changes are already incorporated in the latest
codebase.
As per abi-compliance-checker report the source compatibility
and binary compatibility between previous SRCREV
6a905f9311f82d306da77bd963ec5aa5da07da9c and current
SRCREV 0ccdbf364c577803e2a751f5aededce935314313
is 100% and this patch is already tested on 64bit
ARM (aarch64) in a product with on target CI tests.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 04d9ea0ba7ece968244bf049893dd5636675b76f)
Signed-off-by: Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
---
 meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-oe/=
recipes-devtools/rapidjson/rapidjson_git.bb
index e3ed9c6..5b5c8b2 100644
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
@@ -4,10 +4,9 @@ SECTION =3D "libs"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://license.txt;md5=3Dba04aa8f65de1396a7e59d1d746=
c2125"

-SRC_URI =3D "git://github.com/miloyip/rapidjson.git;nobranch=3D1 \
-           file://0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path=
.patch"
+SRC_URI =3D "git://github.com/miloyip/rapidjson.git;nobranch=3D1"

-SRCREV =3D "6a905f9311f82d306da77bd963ec5aa5da07da9c"
+SRCREV =3D "0ccdbf364c577803e2a751f5aededce935314313"

 PV =3D "1.1.0+git${SRCPV}"

--
2.7.4

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
