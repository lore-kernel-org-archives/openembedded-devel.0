Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.54])
 by mx.groups.io with SMTP id smtpd.web12.5243.1615790970108785460
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Mar 2021 23:49:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=vGgrFLpo;
 spf=pass (domain: kpit.com, ip: 40.107.138.54, mailfrom: harpritkaur.bhandari@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZzuPrFf/S+/qRXeQWtQ+rf+OljVGbt19CHVyuR2UhHwDMrWVjr/T8v9yIKPNKpldijHypRA1gJM22ZYc2ld1WwBuzExiKxQncPNjmTU5KmnWILzGPENT2cQQ8gTbQBseyQSM6FP9KonyheuQaUrU/KIlg0T0o7BxMWTaWE6FBW5UywkrvzZFMWPFiR9zdVB0tlSMBP+FhTlVVoawxWFSjqiU0/Syw6aKkdCmh+O6cE2PV5KyhwoPn8Rd6PNdGYFDXcn7RSnw9jhmhR/n5a2W54rfDoFuKbBINMC1elkobHmZntZ2d+gnuITayQklRqYgCudsSF71OU2vQeTKlwDzUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubJ+zfN+mfm0IejMnjM1yovo5vOmq3GrROkomePYmvI=;
 b=Ryd/ToxC6niwZW3KyZg2zN86qprTmTLaQA6c/cA7taFTVFZQZFpKDW4mwA09/aZJCRp1NHA/vTiP6c4WGsnT1bi60WnasN0HllBuMscXHzojN/V6euro5I+ZK8RwHaJkf9aenSt9g2gN5wzr9EmB282y2MGzxVSJd5WdWAZXkDhPqbsg35bk4BN3O56Pq6G3/f3OxhSsbOB15w3J439vxtrpcVhJfs+daFkZqzc4xXmp35oGpfdlf4rn7j3iirnYWoqbSgkzOK82mYbuwOugl8pwOn/kRs4sRrBW7Nf5nZoRHOyRetLaoUIKXeeAByaxAL+j3NBWo1Ihg047hHqhwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubJ+zfN+mfm0IejMnjM1yovo5vOmq3GrROkomePYmvI=;
 b=vGgrFLpoO15XQKSByYrIWgwfanJoUYhle+/aALubkbiH27E6dlkqcPbCuwUtIj/+YjSYexyZ9euNiGtVXyAMmOOcd1ZWiOTDJ5VyK1wlBj6rJf1tR3ateqH/YJ4rbxspM9o2E1zstRIvxXv4x6VBzzEJRlnz1CbCcNvQeFWd+Ek=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:16::13)
 by PN2PR01MB4714.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 06:49:16 +0000
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::148f:99ca:65bc:1277]) by PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::148f:99ca:65bc:1277%6]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 06:49:16 +0000
From: "Harpritkaur Bhandari" <harpritkaur.bhandari@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Harpritkaur Bhandari <harpritkaur.bhandari@kpit.com>,
	Armin Kuster <akuster808@gmail.com>
Subject: [meta-oe][gatesgarth][PATCH 1/2] rapidjson: Upgrade SRCREV to latest
Date: Mon, 15 Mar 2021 12:19:01 +0530
Message-Id: <1615790942-1428-1-git-send-email-Harpritkaur.Bhandari@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [1.186.38.155]
X-ClientProxiedBy: PN2PR01CA0046.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::21) To PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:16::13)
Return-Path: Harpritkaur.Bhandari@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (1.186.38.155) by PN2PR01CA0046.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:22::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3933.31 via Frontend Transport; Mon, 15 Mar 2021 06:49:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 99c88540-a47b-4122-0b9a-08d8e77e7321
X-MS-TrafficTypeDiagnostic: PN2PR01MB4714:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PN2PR01MB47148104A137A321A715A57BEF6C9@PN2PR01MB4714.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uc9jtdJMZyyFvDyKeT30ge46vbKfeYWgh2q4ZGKk3YU5RsClHfG55vie7ngSf8LnXFxzZ0ErN8GQsXDm0R2LI2vvSfkmT1JoZHLMLnMDXG4hPh0yXVI8opif0AqMYzDM0SpaDF9WpEKosfgTz05GTnPTpcKJbO8Zumj8KNmoESrVyCUsXLnyMQJJjfb6D3jE4f0RBJYfFseUPeLoVsvTyD4f6WGTUmfrItWYrAmHnd3vsLiAVYwB1lxAEOP6rdy+phwiguJk3SrrATDg1IoYNf+xVl+dzqAgC+jHBIN6t7HaHksgDC/UWB/aeqj7EGtFj0dKgqymBTW2ikxNwmWZUAb8XXclwpv37odrDo97JRbYuaVnRFIj2MaHyobKX257mjQzJVSyJn60HwLNLPvKYdtjUqO8dei2VY+J83aTvM1Z/2s7flwK9WXkMaUzJtY/N1XWkU22qcpSQW8NwwmlDC5fGUBiLzyXkXRRf3+Fp+p9Wa4EuLVsMCtp9ZGOzIPAKSnt7mUkFnFFG/bVepXIAGXw18YezUCSstObQVLJ1ggpSgiv4gSuu8yj+Qnbq6Rt8uBXtPhk2fGtpXw18bZaVXeZso6+zjy4m5COLBBv3AhdOgGmWHttS+PBuCHcM7rm
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(346002)(39850400004)(136003)(5660300002)(2906002)(1006002)(6666004)(36756003)(4326008)(86362001)(6486002)(66574015)(54906003)(69590400012)(2616005)(956004)(316002)(66476007)(16526019)(26005)(66946007)(8936002)(186003)(478600001)(52116002)(66556008)(6506007)(55236004)(6512007)(83380400001)(8676002)(36456004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?aPyVYAq/I0gbNWH7e17FA8gnxWE/ZE4jgXbQaXgrGQyldJqj4RUyJbSUgCIA?=
 =?us-ascii?Q?s+YrSWyCp56UfdnTKuOCKRuTxtPmsM4PLXSUJPubDnIPbo8QTT6moAiXlvds?=
 =?us-ascii?Q?we3L02wSQpOU3hf9zsreOl2sOYCcf0r8PYMfhMpjpN5SbMthBCxKj1VvQYjH?=
 =?us-ascii?Q?Z4aVjXH/oGqJ5mhxdUZwUypAmBNe/ieet9jee61q+u5qd9aAFEYEUijWyS2D?=
 =?us-ascii?Q?zUldUgVx0uBkQEEXtFCDUJcxWX46jfof49S8aDNyhto+gpSvwh18qE9Jnw3/?=
 =?us-ascii?Q?1dJeYOO6eYZQLex2/KkSHjuR5yOkprRaJHYW2AY2739AwG0Pyvk61owqReY/?=
 =?us-ascii?Q?So+d1LNs0aoPNKsQk7XXzurFCB4WQ2AX1Y7EcpraR2tA/OkGzNO1ffI/vD/L?=
 =?us-ascii?Q?O7NaOcCKk/LgFd36f7fVEowcHhV5AMAGfqpx4TCahnfb3KamDHYZEqWAqRCK?=
 =?us-ascii?Q?mMUiwGe8nz/YOlZk5G0DD506CBVCj7A64uDr3Vbf2KzKlNYtoVDGV12AeLdd?=
 =?us-ascii?Q?luuCztU/jpXi/2ujfR1ItSvQDTP9N/NgwBz3qX8bht0XIoP/Mw3TcUz5RS7k?=
 =?us-ascii?Q?a7IZjb7fvKPrSboVG63AbTYiZg/vQgdeU8REeAr/mb7aszK237i12sxHdH3J?=
 =?us-ascii?Q?g3IlGNWT/vRPqfMaNimuB6Gd2T+PRN3S35oYnpwO8TBzZEmdNMUexgnUnwwe?=
 =?us-ascii?Q?PQ1ewjh+4Vf3ActSczMI4Qk7KP1sbD6SV6DcASR11ffFlmX513StbiA3BGzg?=
 =?us-ascii?Q?NJ69FwaJu73EpqFfUS4px9W7ZV1kn965mkjJQy52OsKrV+Iy7f1/+veIOO50?=
 =?us-ascii?Q?ni203k2SDUkkCFPc+wm9dJ6peyKBfBDoYMn9BDvQ1X4YpBXl1IlcjNdk2ULo?=
 =?us-ascii?Q?ksy5MeTIRRG+1m4NMir/qpezQll7f+BC5MBtVbRcVf+nYLZRBTxGXmUcK5fo?=
 =?us-ascii?Q?WEXr3WRbMkngLwJpEWFc+Dt5kwsnfhTJVVOYnIHRmrg2JTgBJ5AojZZso90t?=
 =?us-ascii?Q?/7ITZMqRcMXOqNjeZ66PkQc6IMfdZw/T6wEX+0uZvuxpGtzYGPZSOCO1VDoy?=
 =?us-ascii?Q?C/EJodYtJMT297r2RCwOAKfPeVgEc8mAqblS0qldWp6fOq+LUyUiC+T3Bv1h?=
 =?us-ascii?Q?hdeh//YKTwmKPvZKAQ8DlJfW17zHLq50Lsr6qTx4b9zgK0AZuF3nuM55Pm7+?=
 =?us-ascii?Q?7PfKDXWglJKKyJDHAdRcQm7ET4JR1RAKqDIkg/nAJlV0QMhOHruh/Q4QbqB1?=
 =?us-ascii?Q?tJTsS4XMLGw9N2It5yNwS8/tRc7QRotOTZdBIrbFQED4nrx4qrcXFAyxS9Uo?=
 =?us-ascii?Q?BQCfctI+Nu9r1JtKNOblsvxf?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99c88540-a47b-4122-0b9a-08d8e77e7321
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 06:49:15.7690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FhpjnNWepkUuOS/FcXZ/ewqv8QzCdWf1sbNuKefvYXEvFlvnk2ZN4cQ1GfcVYv9u8jui6/a66mVDHZ/lqyqRNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB4714
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Harpritkaur Bhandari <harpritkaur.bhandari@kpit.com>

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
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
