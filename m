Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D95C48BEB
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 08:26:00 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.110])
 by mx.groups.io with SMTP id smtpd.web11.37601.1707899157517056966
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Feb 2024 00:25:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=28rlHCMc;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.110, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O9tkFRHOFbyBr83Mmu6ntDb7UhMP4mrgYoRwNg6Y6JXU5XkNlXiAajUh+dU1kgGcB2aw4uLM/UaZ3Hlp1WDHcAue8v0teBCsq4s66p8VUdy8VHqYtVa+g6R2AP1gApRC4tMnbxgHijdnH3ttCZw5vMSJ9anUOV+z6KNNIrqAv0txB6VBVlQwYAXJN+qar+AuZ5iYH5Bcya/4qOclWJI+xHFamzAF1orhTZEUcpFxxAFI0Ii0B+0Fd+CSBThSB/fBE3rSeYnopE3sYtaEDgCpvWOUhb+atfsdXNfFjh2PCvmP2Q87VUBP1tZhlSK/KyvvP5R9ZPA2MtmDx17xkRDKFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/u9Cq/HgD1mG8TIZCR2rXXoYItgVDmTxx6NgVc+dnE=;
 b=e9fwlHgnCkq90XOK9KpdSdT5yGTJ3DKuwU4/6ZLMGY5nis6F2rtmxyqfGWirUTdYbCNfuV/ZelLCI9LqSi8bW3iyyD44gTQpMbqCEVXWtFgFw0bBzt8MWI+VzQ/jS0bAB2UL4Cr1nbWAdfl1Rd9fHd+Q+jhMTqyzGjT2h4+QiOB0snTDJod4AXTIND9aGmWX67VolnsrKUd1yT9K22hl8HjGfJQimEI2ZsQKMvfipIYkdftL43Pn49D9wnABJVj9WQneAz/iNkueOQx64GGIRnzWm3diwiSOOGuUqyPaLQEr1v9Sv1ZVSWKqIuxuh8gCS955IO3xOPTGqMD4oSGxlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/u9Cq/HgD1mG8TIZCR2rXXoYItgVDmTxx6NgVc+dnE=;
 b=28rlHCMc6MRT+bT7KJn5DUJBfY9rZp81c/M57DlB3kZauSNW06CqQDpLb+plBfEJ2jd1592RgCvqWc/1I6+69jPRhfjeKRKORy6A58+Q0dPlRyFVapv9DCRGJSnJjEcJtInf19NGQz5nfDu8iwihBCiwi3ezEvTYwXJENvg243nF7Y7dW7nA9SWlqZ4rrLgnvGNhAvmBOQkzi9WyCkeCChBcIQJ3NVF9BXrrGrokUcm7SpzObp/8ixnwPpmBxeajfGWJ7Ndw7qMLtIqd58greMazH/e6otp+rogGXrWYKKbLD0aD1iaFZ/HYiRVPVjSaZp7awBZcPats/z2oczQFOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DBAPR06MB6741.eurprd06.prod.outlook.com (2603:10a6:10:187::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Wed, 14 Feb
 2024 08:25:55 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::b5ae:8355:acaf:29e0]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::b5ae:8355:acaf:29e0%4]) with mapi id 15.20.7270.036; Wed, 14 Feb 2024
 08:25:55 +0000
From: niko.mauno@vaisala.com
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-python][PATCH 4/4] python3-pybind11: Cosmetic fixes
Date: Wed, 14 Feb 2024 08:24:49 +0000
Message-ID: <20240214082449.3498259-4-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240214082449.3498259-1-niko.mauno@vaisala.com>
References: <20240214082449.3498259-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0024.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::12) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DBAPR06MB6741:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e97f537-50a9-4d11-c294-08dc2d369048
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ORH9fgQV9gU/UorXdAzPYrPh2dTWp3x+QrzPGfxV4cID2E91gU97zRbNcjYPYO47NqvtqbkfroPtg0IJNkXdeqJGmV2Ix2Vja/lKXRfH+AdIM3CG+likA/b3Sg+wsAtiBRvPnkl1Ed+BECYF8CtdIaPqm5sgiL/LQ8Co6D15jG8dSDHCg5mLKfKCxBqvsL9asfHKIgAzaAGqzAE9KD0mb0hClMGdI7ylw/noFECdngxlWs4a6jICt1+cDewciThZRQlU3R11wt8xz9pkodaJOU/loIilO8iK2GYyXYEbLNriW9D24KaJ5uGGqE480VlDJJqhASItg63CqYMrLj+VNoiEdB3M6ljMmzaRsTdIwelUGAhgg/eKGWSLsTOc/ti4iCdoQswVZov+reyepKxuTjNYjOQ8yi0w03p5bCKtVc8ei5UFVIjr2cHZqzHBumeCdRagm/idm1PQuuUJErC/xL4/bo/HEUTzA+s5V/vqzIdaeCmxWdK5k9LoDra7DKy344VFNe6ct6UCxq0Ds8z0aWvG6Te2KQuDJHJnLwjF8pLg0rOus3elyDpdq6mWtgIBV6QaWcGIR8LY0a1n7/XcV4Vt0/xyFeJC0ROsZRYmth0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39850400004)(376002)(136003)(366004)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(9686003)(6512007)(6666004)(6486002)(478600001)(41300700001)(2906002)(5660300002)(8936002)(4326008)(8676002)(38350700005)(52116002)(6506007)(66476007)(66556008)(66946007)(316002)(6916009)(2616005)(83380400001)(107886003)(86362001)(1076003)(38100700002)(26005)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+3xc2yK02gg4xtttr7bok+4Q/BQVTtPiTvcBA04nViccJyNxM0QyYe3M9qE/?=
 =?us-ascii?Q?14eomtyvXn3iNhh6cVb0dYsFsIL+ZhIsN+7pNP7i7EcA8eP0iSnq9lCJqGBW?=
 =?us-ascii?Q?ebNHB5YJhsvBVKqXSgDlWnyyypcgh+wI4ohZF19g5pvLRgisELgZAX+FugrW?=
 =?us-ascii?Q?aAliXno4USQWOw9maHCkmZ4cKU5hU68o74Fv5eLdZiqkwbv95uGvDmEWPifD?=
 =?us-ascii?Q?5WaL5BlMnpKyrYUjXlIMOQPYtwpTPzvlafg+Ge+ZEiI1Ueodq1UGHPVrDpMT?=
 =?us-ascii?Q?k9sCJk0dpibZkz9pXAmFca14n5S8DtuSQIJuHdD/6zghrtVIWxknJxnAps6W?=
 =?us-ascii?Q?TYwpmr4jdX2Gp9WpzUzycakcmzPdDzHF6MP/8z7Rf9QMclpAmFotiF5K3rkF?=
 =?us-ascii?Q?/oTDijlblkkn5FmZhmzdPh/JDxjKj1+K/llOtjqdUwaCA5l+zAS7J4Kf4tZL?=
 =?us-ascii?Q?duf2XwEL0GVRqPdtfsg8URPV12awoH0kgvwl9yYES4IygUOqub16Pe4ysVsL?=
 =?us-ascii?Q?wzvOuJDEiC4/tceflRrLdkUkGUigPDSHMcUYmM9Rgh9draPqnBg8U7QN6RkX?=
 =?us-ascii?Q?Bn4nrUk/r3iawr1+6DqzCeTA62duHr48SjQ4H2UoqqAzx63uKTGLhUIcgSqu?=
 =?us-ascii?Q?xT5mEHrx7Gm3ws91gJjMbKFqIm3H85v0Mg0r3mrT+atMrnV+q65dE585a7v8?=
 =?us-ascii?Q?b69nBNVW5pe6vODGbGCAS74i9HtR26vQPd+R7Leh7Gd3wvvMdG77OugdCZyE?=
 =?us-ascii?Q?p8fYbp7XeoOl9cQAqyLSofGb1d6x4fz1uLmKR+3L3/cY0M0jKMX/lIrdKrQF?=
 =?us-ascii?Q?NAiWUFLSPg2Mn1OF2jOIMGxVRtGfnLkkAKbF0HuweVYC9gZuhMynrROPcdtT?=
 =?us-ascii?Q?ZR051bruaTAYNqie7LBb2s4gDTS61IY/ctcpgtzuHGjLpZlxydy5ke71toZX?=
 =?us-ascii?Q?s2Epbw/VioXSuTA9cCZFGRs0Ga51JJt/6SWEcLkBCPJVZ8EN/Tva6QOPwdCv?=
 =?us-ascii?Q?lA1cbh56ITJhHdtGyn4Ruc3d33l8m8JD7sNgziYuYxQLODSF9Az2l0WyIVbw?=
 =?us-ascii?Q?2F9F2BY9zSkw94G2JQcks8/JySeImwqH+uJmL0L2goUOFWbQv3qCWjOFN6Wu?=
 =?us-ascii?Q?Iw5estuu5+AyCqa1EhCc4yu2yhUnxjMoOeLvg8FzFsRM4h0bb5DOvnWTjaaj?=
 =?us-ascii?Q?uStomGOVT1N+dwAJt1RaKXVjJmqrsTQ7uN3c1BWBNJG+EkdFgKme1icB2w2z?=
 =?us-ascii?Q?JhEvBLUKVGRSWQTat+DBH7UCEtWUDYfWhdS6GBe1ExF89wUWjZ9O3tgAfrcE?=
 =?us-ascii?Q?QjaHzbfipqURaJkX+DY7ymAoeNiJxTzmmVM4fBZHlLf0h+dUkr4j9bTY2UnQ?=
 =?us-ascii?Q?l3lfNrq6YPktDFHgfjm2kypIVbaPEc1fbzxBFH0hmYjK5rIgHsmYWp8AMmxz?=
 =?us-ascii?Q?meuIs2ekhX/WED4hyOqaZb7+37i6lpZcj8Qb4APwLmR411VcP0Q/Xv3zFK2l?=
 =?us-ascii?Q?aRwDJ+0o+0INIPRihdugZ31VZ1X+BC7AXhb0x+Rbc7EjOsuasG1iQgEwwSl+?=
 =?us-ascii?Q?TXsIk22nNQ4cvAQ74eH4peAQ+tSiMtN/pfDxaA7TdnVJtVIckb9JfU8fh32W?=
 =?us-ascii?Q?OQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e97f537-50a9-4d11-c294-08dc2d369048
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 08:25:55.3315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: leoSPfiIlX7U12WermcayhtE/Y8z2/AY8G4ZXQTy732aMDZaFW2+HrxJc92DFNwbxLmkDdYfGrIDVbzoT8fopA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB6741
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Feb 2024 08:26:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108737

From: Niko Mauno <niko.mauno@vaisala.com>

Introduce cosmetic fixes to recipe file content based on oe-stylize.py
suggestions.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../recipes-devtools/python/python3-pybind11_2.11.1.bb    | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb=
 b/meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb
index 402f2c7ca..6b768140f 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb
@@ -2,19 +2,17 @@ SUMMARY =3D "Seamless operability between C++11 and Pytho=
n"
 HOMEPAGE =3D "https://github.com/pybind/pybind11"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D774f65abd8a7fe3124be2cdf766cd06=
f"
-
 DEPENDS =3D "boost"
=20
-SRC_URI =3D "git://github.com/pybind/pybind11.git;branch=3Dstable;protocol=
=3Dhttps"
-
 SRCREV =3D "8a099e44b3d5f85b20f05828d919d2332a8de841"
+SRC_URI =3D "git://github.com/pybind/pybind11.git;branch=3Dstable;protocol=
=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
=20
-EXTRA_OECMAKE =3D  "-DPYBIND11_TEST=3DOFF"
-
 inherit cmake setuptools3
=20
+EXTRA_OECMAKE =3D "-DPYBIND11_TEST=3DOFF"
+
 PIP_INSTALL_DIST_PATH =3D "${S}/dist"
 PIP_INSTALL_PACKAGE =3D "pybind11"
=20
--=20
2.39.2


