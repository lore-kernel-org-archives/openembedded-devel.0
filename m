Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70DB0ECE577
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 15:34:36 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.100])
 by mx.groups.io with SMTP id smtpd.web11.32164.1725809673142184746
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 08:34:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=qWlJSYZ3;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.104.100, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tJWs/OEof5tJOhPyYFW6OEWLoISe5L4OymY4xFn4N4xPxmtk37qK5Qb2SfU8e5euRUsZbv9/yM/IuQwrcgu3zIxy16C9DqG7AG3/D1QmhfuBYb3kCqlyIwnpy2yLDpR919vRTCLVTNe7BXFEoj2m06gp0KBVJo8wMexkq2U8HTdZ/EfPNk9AWnh/EjNCHHvwxCkDdwTF7VLa1X5rreM/MfgJmLNsyOQNVRSMDXjXsAKDRkwrylc40Fby4snVvNTphX5h0BE6rXqXr7K20JS5tAooHf4j/sfZ0XVM/q5m1SJw0/5AGrkkLnkgnGLQxmOh1mtMhBm+Pp7b2ZU3mHo1aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kihC9rv5m8M/kaYjOIvUi1ji5r4ZdGXjH1Rpqg5DcX4=;
 b=PHSWkQBZ38LE+9XErgqpqjtPzwOlvAR+tWCVqQSrJcFx1aCt9Bede87Znp3+V+2uoVcFPM0buhpq6/nO8i8yHH+pK3L5WxEht/XvEbKZfzcWu+WmEOEWbbo46ZG6B9wNQ/qwWl1sddbRtdDm/mQovzuzrXK8Gkn2bK9iCXydBDadO0OM533PvMNGA88ce/L10HbeBzNNLJPo/H1Jh41uaD74wc3lDM3eoSzmVSPsPMJhxErriWXKxiAcg+v+ILWSzTGGM3GgJbof3f/RpBuOsdoFEfpsgG6XATvjKWAF3gpaq4BUNfTQP7gBsuS0a/x1JkhWQy6CQKO8geLNQIscEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kihC9rv5m8M/kaYjOIvUi1ji5r4ZdGXjH1Rpqg5DcX4=;
 b=qWlJSYZ3myUd5nWxQy6BLzZqS6VaLPqikq206jlHL5gXPF0efoAZb8fnTje8xk63wKr4JEF9Zw0lNjfabxjYZ04KavWGdGlZ9J+10Otjgej/W5KqRXvDDVr8PVm1HChGzD+ILmmbLQQXJTMbEQwFp4sSrrANQw+R4jimw+K0IEWqG1ZRRUTU4/aQzPKLXPgEHR9K4+PFI55SRl4vVI5VyiHBWTxupOZizQIaRXUM7aXoSJf7a/xlZTKV8viyBjyL46Mn0UQp2ji0dNctBz72JBUxo5AyL9ExaG7ldcD+QLIGVuTu5nuteXojYvLBWyXvz/IMSiWR38HA5+h8ZdlHPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DBAPR06MB7095.eurprd06.prod.outlook.com (2603:10a6:10:1a2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.22; Sun, 8 Sep
 2024 15:34:32 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.7939.022; Sun, 8 Sep 2024
 15:34:32 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][scarthgap][PATCHv4 06/19] python3-lru-dict: Fix LICENSE and change SUMMARY to DESCRIPTION
Date: Sun,  8 Sep 2024 15:33:55 +0000
Message-ID: <20240908153408.4114753-6-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240908153408.4114753-1-niko.mauno@vaisala.com>
References: <20240908153408.4114753-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0011.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:b::7)
 To AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DBAPR06MB7095:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e976877-0842-4647-e54b-08dcd01bbc00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?y9WiOtFGrCo8QhjtEt2Y5KTT0auiMp133e0feJ5YasBfINkrbN8v9Ewidkik?=
 =?us-ascii?Q?h7KT4WuS0zqt4xH2LpnV2OIPiODd8YcLU/rODWQcOZe669Vlm2NH6W7RQCjo?=
 =?us-ascii?Q?tE0vppr+N/2hGCSqW+fk//vWlP8tMfgZIh5H86bJF4KTQPQa5p4kOov0GTrE?=
 =?us-ascii?Q?AKAn9/QHnnPk0dGHwZCFyxg82Tydv41WDhLSpbpYtwnUfsRTHQRLNKkEsXaC?=
 =?us-ascii?Q?Z407uEnpj6kP71hyP/bA1i/0CHdwy9BUDBfqAO3QvP/hkvAk/EANG1g34DzX?=
 =?us-ascii?Q?7mr2n7gcAA2qz2mQoyowTK2GBBNHgRzyI5SJWlJui+NVyUSHJuYQ/D7ge+rM?=
 =?us-ascii?Q?ijo6LokwRwUcbV4JkMuzDZmbVrcBk17Y9nO/zn37N3+oCakOCD5ccLSGSKya?=
 =?us-ascii?Q?vc0Pu2uguk2SWbYEr2AoRk30lA2nMf2Alo6a8m8hOH6VqWM9BNE+XHN27QNa?=
 =?us-ascii?Q?UKvahjTYkpI/+vU0sK96fjWJ+0hCTKPQZXwsHMkYv+ETXveg48+XfdjS1ymd?=
 =?us-ascii?Q?E8TRdmsLa07uTjVWXjqrRkN3fPtam556a87iKGNi3DqNcEHj4P6fjVvG4AcC?=
 =?us-ascii?Q?1+guONiCTq9+SEjalZZmCr6+Xi6QYcjqK6gN1JyCP04+ARbEmjwaQhu+/QEe?=
 =?us-ascii?Q?7wZHevSdWdZWSYUjXZzgZZYirfkELdkZLEoXx0lDlpnp1o98H0uPf38p+PX9?=
 =?us-ascii?Q?KYGrVeji2hOBNL7HMSJqO67F3xabvVxYdbHfXO13wdV1Yk3Kzf1u0I1lq5NW?=
 =?us-ascii?Q?dlnz5qWyYbaBgHZYWiKM7YQhqD7pqa9whiXJjS6T5fFnKpEBx2WwRcoRpH+j?=
 =?us-ascii?Q?fxoOIaHTLGPTaxWX5yygX3kDHYcYnG0oXX8jWI/VAFmKJq+vYuxvfQr5r44z?=
 =?us-ascii?Q?gfjxpOBzR/ixABolBbO+6ajoNbb1MwndTOpHPZO1TEMI1lzasSIPntUig6xM?=
 =?us-ascii?Q?UxdXRQEEk+F2u6cY3cerm474exs1xr5Hkq/S2j94tJtWtwS/PxC46V6qAlV1?=
 =?us-ascii?Q?vVsVLE/doL1pccxIGoMRV/vFUq7GIppuElOUs5BG29QH+frN1HrX0nhTRcwC?=
 =?us-ascii?Q?euqGnY4z45M2nq0BH3JOG4tWCC8V+sRjhK/7pr8koVn54DofIDEubxpARodO?=
 =?us-ascii?Q?lOW1B4Am06x7KxVvT6KFqaa/D9jtb4tVAp7wzkwWzjE19kAQw3HadgbwTv/A?=
 =?us-ascii?Q?yZPH0gTcLTbtkVwEQn1s2jiXZcNWfQqFWybYLXAEH1gpGIFPSl9FjPqMeC52?=
 =?us-ascii?Q?Qlng6T9uayRUFWMZH0MSbRUNXX66T8BVHz0YHbBlBipZ5XcyUSd08uMbU99+?=
 =?us-ascii?Q?mzbRhdYhnyqzUdfE/M4MpLfT1FSnzzHfyQsxFRHtkd2r2l10MPKrwNXKK54E?=
 =?us-ascii?Q?O/r+sJ1Xm+ROxCfuYnYje/EFGq9o618hzswzOury01jxxerb4A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?J38xX7KM+JuRu/mHpfT7YJ7G0rZuQhnGsch/450YMJoi21AJXzArPxiS7EsK?=
 =?us-ascii?Q?xpfHsui02dx0x7oJYf642Yz4Q0kVgXtoPUrwXAQ13HisJa9oCi5ulAW1qbJM?=
 =?us-ascii?Q?89/RfRFemKbBHU7yFsMTzxuF2hV+531KoWQAsgqw6bRZVfsuy0VpYnKEYQi4?=
 =?us-ascii?Q?f9kzgCaaHgbR5w64i7BhVqQCQRl9M7hrxZ2Kai1UjkaaJb5SzZJvzCUX8aal?=
 =?us-ascii?Q?pTnmzoCDnqPvpB0xicqyAUhqW5QfyN3c36KGmW8OQWJFMnwbRbhC9pghVvEq?=
 =?us-ascii?Q?BIzG/JrrOHL0pUsKAdnup8ybrx78OlB5r1puemFIuhAqL9d05TO7SYgGiIjQ?=
 =?us-ascii?Q?ilecrgmWIjPXoJO1IlHnlJsBCa/fLv9Rz/UUob39OVS8iOetmoWbqit1Z+5r?=
 =?us-ascii?Q?PqJqDiyiKeAMYIM7g+fw+WYk82PKT5VkhlkXnLIwAqa5BTXBxhXZJ3iQKkrc?=
 =?us-ascii?Q?qfAqQ/qB4FmR9RYGBoMQG+/8jbd0QsazdGYbp59ONymWOxqP3GA1ABEJvuVx?=
 =?us-ascii?Q?SqqfLfKuu82q1ZJGwWsrJCvwMGxIuGx1yJ8X+Oy/PR8Ps0NgbBeCVOWQhQrx?=
 =?us-ascii?Q?4D2AuwBeL2nhOM8N6WRTqy8MivpJ2JWbghXmc1jOlo9bIAahjUcmyOBMrx7A?=
 =?us-ascii?Q?M/RjKfnpaoudAsgue7LWhkS9utZl0GR1pCMRAVSsviH9n9FPZ58gbUvGGRhb?=
 =?us-ascii?Q?fsBjyyU22/0BPJ7omcn40z1pMhM2wAF9IokZWy6eWZ5jpPXuHBSJfJgSAUYs?=
 =?us-ascii?Q?jYNhmXfYGSEndPAyIoeGIeIWkyk+ZvQYOjBhxsTf5vFRlvROW3Z+Afl07AMI?=
 =?us-ascii?Q?9/g12pFVHgDCPFNKXtiLfGk3ASbi6GcAHCT/ICB3J4TiEyKjBJ/JEl6rXIYx?=
 =?us-ascii?Q?WZOjITpcuZ/d6UTy8vUhIVCZ8J1o0cmAckE16LUXr0hJlj44gTARnE1XBNLS?=
 =?us-ascii?Q?71BFyPfyAg4BwN1vR1uK3sV+p8g4I8FijwbIgeHGvYHLrQNVS3PT/Z0SuT2h?=
 =?us-ascii?Q?AP/LMjOQKuvMY6lrvkUnqnvkfb/sdSPyjqJnR2yUHISdQyBkuwilDuTa8GC5?=
 =?us-ascii?Q?4wam7Qr12QahUjQ3XlABx2woMiwk7QywrQcSp42aY0ozVIOM+ol+jdIN9D5U?=
 =?us-ascii?Q?ZD0ne2+dLNyAxPZ8Pva/SrS0ayiy52WA1/GYsjpakTvti6GHIbS3gSBqVVqg?=
 =?us-ascii?Q?RA5z/kZwagpkRW0w0/hwkS1ZofwaUlakmyKScrqUz9yJeLBTpUgJKGZKR3pD?=
 =?us-ascii?Q?nQqVsbN2J4gNid5xeqE/hjUwoe5wB+Ra+GdQbyIC61IVWKMcf2COoNsfg7Mj?=
 =?us-ascii?Q?ltF8LGvmqEHI8uDzGEtlCZDep1p0gxExQyQMzeHxpCJR5OWKP8YPzV6vxn9b?=
 =?us-ascii?Q?xv83hJVIO1TUK1/TfiWGpvSPtCj8ISc8ysVpt1N8y1sRrAlACG/OkfpcF1eY?=
 =?us-ascii?Q?XiDl750C9uiW3k4uvNoiCIySlROVKbLFxrDSwUZ6/s8zFhTSGkbJeYl7ijAV?=
 =?us-ascii?Q?SxTFRYQhfXaqkNmdco+Is8pfBv3m85QUr6iM8VwCCxTmBnd9hGEGDmUHBf4Q?=
 =?us-ascii?Q?kach0VxD1VioOtB6H8675JRJfUmU2UopJFEhu4bOTMQq3K09F+ukMakMn1zN?=
 =?us-ascii?Q?vQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e976877-0842-4647-e54b-08dcd01bbc00
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 15:34:31.7964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: puGtI9H9xKEvUp5qhrKNs2kt8f4ICj80sZewJ9dtIuhq+r8mjVMrA1gAnd5wKNwV4oX3vVslNcLqAlLWUgGdUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB7095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 15:34:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112145

According to https://pypi.org/project/lru-dict/ and
https://github.com/amitdev/lru-dict/blob/v1.3.0/LICENSE the project is
licensed under MIT.

Also change SUMMARY to DESCRIPTION as it's value is clearly over 72
characters long.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb =
b/meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb
index e9535fa6f..51f3860b0 100644
--- a/meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb
@@ -1,7 +1,7 @@
-SUMMARY =3D "A fixed size dict like container which evicts Least Recently =
Used (LRU) items once size limit is exceeded."
+DESCRIPTION =3D "A fixed size dict like container which evicts Least Recen=
tly Used (LRU) items once size limit is exceeded."
 HOMEPAGE =3D "https://github.com/amitdev/lru-dict"
 SECTION =3D "devel/python"
-LICENSE =3D "BSD-3-Clause"
+LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9d10a486ee04034fdef5162fd791f15=
3"
=20
 SRC_URI[sha256sum] =3D "54fd1966d6bd1fcde781596cb86068214edeebff1db13a2cea=
11079e3fd07b6b"
--=20
2.39.2


