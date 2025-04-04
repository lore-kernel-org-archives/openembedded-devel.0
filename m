Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E67E4C3601E
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 10:54:42 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.113])
 by mx.groups.io with SMTP id smtpd.web10.8467.1743764076838542480
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Apr 2025 03:54:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=K6TfyShk;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.130.113, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lwrulb00/2h9PGjDIDwnvbm/erA7Z1y3G+yfXkYB7ThGeLItnRPQVuek+U507LHQLVmT8dJzuVE+j45DcqwURg/ZpI6urZADQDgoGWowc7RgbEpES3Ug79pgiXCBZ+0pu8rNMdPuKT296fjDDGoJv9eIoxttxOrl9cnDFSqk5fWrpI3CUPS6Igi27h+Up3BDAsXxxwwuHtUJ5a3MxRKfNiNUREIwYH8B0jQNfGeIKhqcqnRkClbWwazPLcesJZIOBPD9tkvQTPXnhRjOlNQWa1WCWfcnkXzGC8fRiaNkm8UFIyVJDelRGvRX1ZfhFN/my9FIK/mC2ZdNfuz7N8nlaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1lDV2gMxWCHiAHmEpUdyowdYaKuuUvwUekL7d1TckzE=;
 b=vFklgGIPZjyHOQuX+LXiyEgCmdsRkUpNhBuIwc6bpG4OSX1fJCb88rAj1Bq3p1EEAGCNlef/Fw9FJaQI6ifFvUGOb0e95DnMyy9sXsE2ImylofmE1+SQloAHRlArkj7wYzWBfN+icGET9BqrKXj6XUHm2zLir9SZHLllCWi8s9ORN3uOj+z6TCGuahkCeSGxALVI6pBWthqTsIhajr8BS99+c/DBIkl2+Dwh6+B471O/8tNVmB8G/4elORgUrBai0ehz9Txw5YryMnZ97cdCpRaabDU5P8Ch8k1pKT6pg2H6iqmKFTso8yka9SbU9wQn45g8zcJGEk7vxNRqO9zPDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1lDV2gMxWCHiAHmEpUdyowdYaKuuUvwUekL7d1TckzE=;
 b=K6TfyShkFfmeJrUzzaes+tvwUaFA9JpXDEEaHI4/rS2r4hpmlWwHJBRYkAIOvJ5rjQ8Py1Z+VerWS14ORWSSlwq7qRaESM3jc3H7fsi6kW1LbmDM+NqGXbMdX74d6/Co7fPBaUcSH6VtXGp6WVA7HyZeJgM0yyed94yBSb/x5kjDgZvTLxh+HyqP1Bt8RJubtzGT0loLevm9XZi84+ysT2dTIrZE8JSFY23Ynk/9RKm8T7kZiohPf10YLwrwt78s61HHMjI+Q/dn9Szhm4cjS3gLnNh10wQRlTlj03Uhgr0obEYicwJo9MJdcmFKWXFWY5P+lUBmsNrsWzmvOeSYAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AS8PR06MB8167.eurprd06.prod.outlook.com (2603:10a6:20b:3c1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.42; Fri, 4 Apr
 2025 10:54:33 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Fri, 4 Apr 2025
 10:54:33 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: raj.khem@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v3 02/11] dbus-cxx: Drop libsigc++-3 from RDEPENDS
Date: Fri,  4 Apr 2025 10:51:41 +0000
Message-ID: <20250404105150.870898-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250404105150.870898-1-niko.mauno@vaisala.com>
References: <20250404105150.870898-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM0PR06CA0133.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::38) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AS8PR06MB8167:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a7cd8de-3698-452d-89ea-08dd73671555
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?t8CyJGFEhYWXhYmfTEnooKPVPOx+95t56oEoX0JexUXWZ96vLHGH6WZaHmru?=
 =?us-ascii?Q?CkFxuTvDFxopO4IxXqJ+m22r3Tg8LGk85dUt/BCKOcDEqOaeR7bAKq6WpGqk?=
 =?us-ascii?Q?7oRNxC/FRugPubrzNa3Kba4heYRDCzdrFENgFBxu4aoykLmLQM7CGsAjON5r?=
 =?us-ascii?Q?wRys9VTuJqqLI2/v6ae0ax9noJE3W8ZdMMbLi0oB9KxtbLejcUnkPxzV0RWU?=
 =?us-ascii?Q?e3nvte8AsmSz32UQTon81UYZU61VcZA65jikHU/NpaDrA+XlkN89bnJ7dB0k?=
 =?us-ascii?Q?lWwHlaHeIUDCO0mTThRmmOvYUU6qrSDIHieIY2RXPFJewDTll2e914r8x31d?=
 =?us-ascii?Q?tiUrAqMWH0vunDUQc5QK6L4SEHqX0zqqh9rMNbfyZhXOfl52yiWdmMbaCJKs?=
 =?us-ascii?Q?QxVIYHEzTDjfVBtXKS1F2/PITS19auBasPxQXN9qSWDzARd4txCmqGaJylm9?=
 =?us-ascii?Q?B7+1uZM4hZQWxfdVLkuLzKMcHYWV5g5XGTTdqxxkJZcY6GZwVXSJRNaef4cL?=
 =?us-ascii?Q?y9J3Eoz7akN2JjmsHRfaEwWODWgxownaqCQsvkeavDL9XP2mHl5Y51cvf56T?=
 =?us-ascii?Q?nGCdx4ZnlUTdoufDO0qk5ZpwG38nNEMqBnrY+xjgFRBxSpFu8ySW0N6Gtz9x?=
 =?us-ascii?Q?sciHSfavy6y1yZD0Z0S767Qto3R8Pnk0Vcb37TUS5BKyjiLlI0ZPfOOtr6M7?=
 =?us-ascii?Q?Un+S2ETCZU185slozlFWdy9sY05FdpZf/o9RqQHrNKZ5l5xvWH8py+0iDLi0?=
 =?us-ascii?Q?8AbRxPgFrpQgrU43PBEcBl0HWSUy/2RBYeY+3FEyc1Z9KLpATi3+C83B5t4v?=
 =?us-ascii?Q?uHvLGUujyGv7HbGcs7kocKI05C1aNxKB5rR1HhI8p2Cr8I8yaL4Mm6OgHQI0?=
 =?us-ascii?Q?FwryMcWRkvY/OK5X/JWXTTV9yUZLsuMgrB98U6ZbCHtnKyjrQzlpcAu861Vp?=
 =?us-ascii?Q?OUtPMHdpe6J8tDw/EjUc4Xu0PWmjgNMXrSjIfV+h4h1E+Z9q6lV1ZgL52xXi?=
 =?us-ascii?Q?7nObjXxJkjDIhLQ/wJVif+itVEjKo+kdFIVntsZO74BjhRc4YBRw5Ackixig?=
 =?us-ascii?Q?wWym7gvqIRroYcS7rJMQTM+VUdKvCiJN7DVN+pvOeK6b6zgPZb8KdUu5OmMp?=
 =?us-ascii?Q?2C8P8SImgpDRB+rLv9QueORvQ+d6lMbRUi2WigTgP81KfducJ/yM2aDaDDme?=
 =?us-ascii?Q?2u0c8CebN2jElcGS9hVVnglq2x9f0FuIRqTS+ZgouFkC1b7qwxYPl9te4KBY?=
 =?us-ascii?Q?SdsRE4v4gUvqkVwBRzWq2zEqroTW+I0GOp9FN1m4Qhu33ycU4gljB6dg7fI7?=
 =?us-ascii?Q?9RBP5/2drnCDm/4V46FHodGN1cHqFFj8TUMnxL3CJhRLmerB/kVE0O9B0Sxn?=
 =?us-ascii?Q?4qFu09x5h2YR1Btwbgwa/3rQlFxKXcx2pWaZjgeRV+cB/zShjVkXUi95RCIC?=
 =?us-ascii?Q?oKGdZ5LF5019of5dFeyZibTfO9LMYxJ3?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tIugdb0tllvtXnUO5sqhYAOy/84AbsFL/eLfmmIaGhU5ZRUJsMpxFmt8j/vt?=
 =?us-ascii?Q?E9OZoBKeub+WbWkmyJyJZ7FtI7xWDSRp7cj/yA1TDLj1BZRpQby5FPoB8P19?=
 =?us-ascii?Q?6eMYfTFXy9HuMlBa3UsiZQcxtQ32Hjs0UxPS9VNKh+eQFGzEQj25EIkIRW0w?=
 =?us-ascii?Q?xQqmOde9ZFoVouG3u9UUwUh8hSaqEhnCbiyC9JRMKs1sNbp/czamO9w/wcEn?=
 =?us-ascii?Q?+cNd1iWQ/Vo+qSxQ/kg2RTW/jnwFcIygleddJJMjK7BZT2qFxQhgB2O1bpoV?=
 =?us-ascii?Q?LkGyF8Fwb3AIqqchkhMCG9kB3BG2xZ4BQom3Vc3qXYhvX1Q7agmxLkVv5u8r?=
 =?us-ascii?Q?KvV2wYQbc7tYx/P2mQbvTZS+Ndru9jepSzUFNQKkBEEjC6AFnHUzI13qgz5V?=
 =?us-ascii?Q?pG6lz0bOqQu4Oyi8kks3PaSyYvbawy2LNqtRFiE674RQr+tYLD3Kx5Ze5ys9?=
 =?us-ascii?Q?+EU6aGoArJDT4FsV3L7gJJHXsexUW/AV36y99XCQpBrzyOLA/xHuk/2KECUF?=
 =?us-ascii?Q?99sREWBhQapU4FE42zjPNIz+HWG6CPKWxET1dZXDA48E1jhECZrOQZ5s5I1l?=
 =?us-ascii?Q?1a94TNhM99rCokarYSi7GJj9kNn0EN8+fcsir8m6mjE6g0CdvXJCNB38r5Bz?=
 =?us-ascii?Q?rs6x0E3eQYoJbpap12a12LaO616PTIEy9/9/xqmOgb/oZVxoreHKsLeHKf03?=
 =?us-ascii?Q?MiM4iKE7S4HHSaOk9UHJFh5tvfQK5i4wRgjktuxF8ftfEsmc9J3kiJgIHwK+?=
 =?us-ascii?Q?j2k+jH9e1hjvnZelDxvNmv04JF0NvXUqt4GfqtoQ0VzIs7z8/n1IlAnqGpvG?=
 =?us-ascii?Q?Lzal5M2idXroIfjRYZOyyq434AwNGOElgackMnR1eyT/XLuI7Xa9ckRe0J0a?=
 =?us-ascii?Q?V/SVdqo0ZLwPP0bDBYUfP7u7LXw6eVaJa8QYz9886pSzEtbNKsroY9QvUTFg?=
 =?us-ascii?Q?vydWrfj0UvHidiCMIrs7CIz5OCI3+YeTqDKNZ1pI03LwjQVUlgvLKqvEjF2I?=
 =?us-ascii?Q?I0wFz1usNS4Jw2fu/kSWXjojkXARPrW3/OYiSfI30n8Vf01Zb0vsfZ6I176i?=
 =?us-ascii?Q?wW5HqRcI6Wfw+RgtBgZu+JSozgO0iaFSidDDdyb/IJa9Hod4TzKOYitrM3/I?=
 =?us-ascii?Q?DpU/7qjgSbdJMmCY+1t5n5E7z1MVBkIChYfRHVrBV2GyCJJJimS0Ubpp4WSp?=
 =?us-ascii?Q?lzJLDempx9PMpP0Q4jAxuHQaG3S04IoOYkjNrPDzyPCXNI51vfS3jurCQKRB?=
 =?us-ascii?Q?CNFnkOmbYxF1oZxEkLJBd5/vGUoTF8pbRQFiye0QT7h9s3Vi4CxgFKDprpL4?=
 =?us-ascii?Q?67q/VDleJXqUh6FEQlDow0mv/bGCqLsToRXN9DtYfmkYDPEVHCb3+pjDfg+A?=
 =?us-ascii?Q?lrzHGtynjEa71AA4DIz77cLcxX/ENR3WUsLDHfTvvEMeHCtk361jW1fTF5+Q?=
 =?us-ascii?Q?MlAN7Vl3IT9vyMW2ovAbgLG3xDrO2ehSpT53dY+WmTM2Cx7anTepbpkB4OQH?=
 =?us-ascii?Q?nRTozdHFRTrSj5rlOXpPkDX/bwvYuzbg8IphLCGflX3/T520WdVVgBgIRwKA?=
 =?us-ascii?Q?0xXpol/bH8PHqWjb5QBlG9QNhXLkA2vXFWdtSAXdf7tVDazw4+vLePoE8R7g?=
 =?us-ascii?Q?OA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a7cd8de-3698-452d-89ea-08dd73671555
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 10:54:33.5452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pF3ZVWViZuYtBCV2Jw7o0y0r/xnFy3UPjVvDsz35CX7OiDg3bzoyMbl7MiMnhvxjoXsS0tKSTvvbCgD8lMeMIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB8167
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 10:54:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116573

Since it is already declared in DEPENDS the build system will add the
libsigc++-3 runtime dependency automatically, therefore we can leave
out the redundant declaration.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb b/meta-oe/reci=
pes-core/dbus-cxx/dbus-cxx_2.5.2.bb
index 3282e4dcf2..a10f7f22dd 100644
--- a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
+++ b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
@@ -10,10 +10,7 @@ SRCREV =3D "f2637e726207ecfbdaaf02744e1b36e54f929c9d"
=20
 DEPENDS =3D "libsigc++-3"
=20
-RDEPENDS:${PN} =3D "\
-	dbus \
-	libsigc++-3 \
-"
+RDEPENDS:${PN} =3D "dbus"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.39.5


