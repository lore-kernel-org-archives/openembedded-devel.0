Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7EF0C5321D
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 09:41:20 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.132])
 by mx.groups.io with SMTP id smtpd.web11.48815.1724665267299741598
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Aug 2024 02:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=l5iq5U1N;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.132, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DfcNlKxmZWx/2C4R+F4vrTlgkgIfL/181viCTsomaNpNDOBYiD2YXamGZZa5KG4BFbQQ/NGguQXc6qofw4KFIuIl89fx+f5UIQ0NJriXKpWeU9qjg4PtRbsm2CKesHJxLyxkox5xLXz9+eQmVoToiscdGQJ5ceRTKhd2tiFaPaUlMzHxKdKFLlX0CbpKbRQjBV4ru69Jp2SEicf/3NKWeIdhCGwrkdZ4wTZzo1wmZbQ5Ec0U6v0vQiiVtCe+TilrEpOo4rgqrZThZ9nladFXzYHn8ShpyYVlSbBms6bTs8u/tIREYQHiz7Frq4U7u2dgtw2EwIDlLvcjOAbgEmLE9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWvzahyWDuJ5OympmY2jT3poKksYDnAwh2rWHEqVRFc=;
 b=Ox0HtzKuhVQz7w+B/bo2GE9u4LKjiTtnTJNJ/X4tVIZ5cdYW8hIKeWsUVbAIUfxygf4Ly9NCBZVHCzETNzjMGkvVw0AGSLm6N8/p6KcXhsG5k5Vfme1AcXd3i/Dd9t5OaexQDb4f5XTg9J5mCEjWGFiMb/ypoOgoYkeUgsKKNMyBRwvvn3dPks2tuLMCkXxQmjg2F2RBU/r0ZKfzP55lijdmYPwhcdSB9cLtQ3FdgTiNn9hNp3rWHSsrYphoscXmQCgOFecbYQvLWu6Mad62nuzBipHthV6OmB/umi4nzrFZw1cJxtOTxuycSvK2fp+twYBVFdj8F9GdfwmoHhxfnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dWvzahyWDuJ5OympmY2jT3poKksYDnAwh2rWHEqVRFc=;
 b=l5iq5U1NsYpSDVKX89XEe/Bw14dqejEDSsSCCfS8+4XbXq2G2sZ9VAGtqhtFHqagRQEosszM/8PgEEfdx3Sbf/YKWzU6TB+i3SrcIQ6Ha3fh6wWRB3CK2CGOe4JrpJz1u61unvEetxRV1xkMBpV2h7c/lye9kqPHppih1wVa/b1QjPhEJz2isdt0mr6h71S8tPpnkrHkIofX9BHxdn+U4b/9Q9z42bdIFbLS0pL0Lkbic8x607caC0ArgDImVrpfxin7JeNhAZ2WzMPXDGfWFAiJ8LJEyCsLwvUYv8bK5L6QbD/j1QVykrBDMocF4ts1HwfM/BCqL+k9iwVw3dymxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PA1PR06MB9577.eurprd06.prod.outlook.com (2603:10a6:102:44e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 26 Aug
 2024 09:41:06 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 09:41:06 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-python][PATCH 17/21] python3-googleapis-common-protos: Fix LIC_FILES_CHKSUM
Date: Mon, 26 Aug 2024 09:40:17 +0000
Message-ID: <20240826094021.2744296-17-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240826094021.2744296-1-niko.mauno@vaisala.com>
References: <20240826094021.2744296-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF00003668.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::384) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PA1PR06MB9577:EE_
X-MS-Office365-Filtering-Correlation-Id: 912d70d7-71bf-4bcd-6917-08dcc5b3317b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KxqBM7CkUN8h/Jrv7qlG2+DV5gy/bwcY4HGRIMdcbuwOs5Wsjvr3T8NJ7f/4?=
 =?us-ascii?Q?5rds+NLhxnP9GuV82iX+28OGiVG8eH8QTdOVgSw7o9Wveh4mxe+Alf60qWYY?=
 =?us-ascii?Q?dIFgwMYzHpHO01HoSbivkMhokZbOmjdxtYVZXVlP9fBGZ7B23ZCz1dfBECKN?=
 =?us-ascii?Q?49/1n1NkfTmX4J6EOpJ7hi8yAnxVx2YHos33M4kD7lnDZqD8yJjFnBHoiwGq?=
 =?us-ascii?Q?KQpK+6OhpYcWawD+uQkfihUw3XHCTYA9A/vaa+3WrUeq/U0za4nIeXaDZLXI?=
 =?us-ascii?Q?WbMzyqJaXWlK0lN0CkKbByZZKclgEVff8oOWHoShaf/ST8zCNvue4fDeJnD9?=
 =?us-ascii?Q?bo/5dHiEnGA6cKYR+nxUZ4qFkON3aiQuJ9kyjOWEALI2ObFZbrSchCw4sTRg?=
 =?us-ascii?Q?5kWxqblmWrpxJwjXsjsUDC+T+R7KzVaVRtdi+ZzrBxVJrL4cNZnbVJasfyID?=
 =?us-ascii?Q?t8XEOvxlthYx+t48D53FmldU2HGZbLSibc5SA/G++3jW8nhQ5QHapNlInXnD?=
 =?us-ascii?Q?tHoK8mPovFnh9VRQwO28jIBB+eTSbO99WW6CNtvZ0zC8XHQ3Gctw6DQuqsRD?=
 =?us-ascii?Q?rBGm9kLuPZm7ps4KO2xXEvdvrg+sna/hvNyiFsUBQCZicsJ9ubAJt8ZVb9EH?=
 =?us-ascii?Q?jtiOfyV17XC5fc5UIzzSBfOS65FMb8GdyJFz0mvAPVshCkxDMpcV0ymz/zQv?=
 =?us-ascii?Q?vaD8vJkBQ1L2gcAAC01vZM5WcgiYyMopxIdvejr6OeGTXDCstEwHmlrjDIOh?=
 =?us-ascii?Q?T8/LBzMbPp396wfB6USNWg5tuF9RaHHqu+KQxyOuJ5mHIzatjLsW6D40rUjM?=
 =?us-ascii?Q?PeuMauknX6xxC76xV3jbX7TqNw70k50FHk+uUj8ZMh2ckU+RaCK0Y2VwYQ2M?=
 =?us-ascii?Q?NLhPIC54BSRO3xdmIeDZtShMOAxZwtGGS/jA1Unz5VPAAto7SOuATwZoXSEB?=
 =?us-ascii?Q?5cnW7d1P7Ty1g6fLqC8xzPG2fVdYRKR2nAdLApegnSfGa5mxVctcEB+aZnea?=
 =?us-ascii?Q?UwSIxALI2jIEz3f00/dkSRxHdHEJ3Fxu0dEfkritkkfgLbjWxNRhOiISjPQr?=
 =?us-ascii?Q?BRfP6q7Z/16376k3V4FFSdunGIrm7leuH7cvAfjvSkKy1Sx0ekpTNg++6b2J?=
 =?us-ascii?Q?t3AwgReug9Uez+90DAWnakdWS0Lr6i+F3NeT4KZJOVi1jwEDCCCmxjdlouFm?=
 =?us-ascii?Q?X/D5mcWDDZQVNG9YKau8A/pvU5/thMboBOB+HTXdKEtCq9NFSAaijOdzIZJQ?=
 =?us-ascii?Q?8d2IFJxeAMH+iurDyca9JrUAN5OI6urO6FA8gk4YkiFbwLKIn1yPCu2pfsnh?=
 =?us-ascii?Q?+Xu57YktxfxpvUtvPFM1y/+BSHIUA9uNYJ8azVwN4phjczbIguzNFLkU9Tdi?=
 =?us-ascii?Q?S2D9B3I=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BJPQFxVQsGsK1GTWxOtuyQCg7U7EVDtwX0/AuoWVBnQAPYv0+Z0HkKvndQOH?=
 =?us-ascii?Q?mHK9mA/xq2Ty9xvFjd4s3TOWOIOmG0v8epfpZqxFCGFKlEPCMKomHXkIMK7a?=
 =?us-ascii?Q?SP7ObobN9LI3f1Ai4SYk2+uQXlMMVe0Ze776r5CyxPMiVulc3PoU46tk9uck?=
 =?us-ascii?Q?magpcggYqJb0Ux39fYw6XTBZOD8TBZ71Y42n/pln1Y7zv2kfo7yLPGoR604I?=
 =?us-ascii?Q?SeFTkk7kEnTl0NB9E8CIbgBpt3v0ZcIN1RJZO7dl76nxVH412CS9KGrqQdut?=
 =?us-ascii?Q?GSRUJekiXR9HZCOBvbznKMp/GPOt+vW/8O4h2GlcJ4tFpT52ZL76DcYO7K8t?=
 =?us-ascii?Q?QZoJAThohu56ISgg18gHb73r72crJSPcTRaXh/mGYwa7IG4UM5EXTgNuCEGm?=
 =?us-ascii?Q?wDUohIyrX+NBo8OHJ8aQomg7Gh2z74XSih65cKCLZxRAnMOQ5oWQiiHeGn2B?=
 =?us-ascii?Q?lWA5Xq73SUIqjxYzmfbx2dHGdSPwZuMAF+793SBipS+zj+HbBWRCo8D/lEBy?=
 =?us-ascii?Q?+r4BLqpg809hkKoE6AAYa7EmMeUFdVtH7RGXrIhnyLzokbskWw+Xqr93C3OF?=
 =?us-ascii?Q?+asiys8DGbFO/un87vgXOfUZbJ/ok/LMC8JfPqR9tYrprBSzlOhqysv4AbeZ?=
 =?us-ascii?Q?zRNLMG6YHHfufRtXxEHQ+T62EwtnCE/ULlVNHk2n52/0F6xVKcn42qsp+CNM?=
 =?us-ascii?Q?suoWwonJsvzszR2qX4AhxAoTCyFfJ0DEgS+tCUflPvYbzE9tfG0Vz7fKvRtD?=
 =?us-ascii?Q?v649JbdWEuO0A7QftBzHUkpTV7pb++DhpGFJHFP9pJ0ShYhqiQsjqQUvfH3+?=
 =?us-ascii?Q?NOEyQkwVkXnNM5l6VG/Oij9fVmLzb+1iZ9V5+YrjiwV+mVNqpZCb+HbTXMzY?=
 =?us-ascii?Q?XRgGw9vX6hMgQZCWqUBaLmqo+zD1FZJXdLakMQLNQwtCnY0ONb2BsJEJ+L90?=
 =?us-ascii?Q?IruSRJKVOlt/5yHDMy1heAVp1mAK4GDtpIjrRQ/Gdj5TBHv3ahh9+i275cjU?=
 =?us-ascii?Q?SHmjO+5MpTZiJC+YKUuh2BvbcOR3YQGVO+WtQvcsanf3fP3b/YaMAr2b8UWR?=
 =?us-ascii?Q?OIeeMzBmVIp2ojrEXHxu5eq1cwl59gyUJSB0LriNknj2UcXk/s8m7pWgxsxc?=
 =?us-ascii?Q?wDWapKIeYUb/ricwFGq7IjcN+cafs9p9Vxm8mttIUx8HlF9HlE1no3HO8cjA?=
 =?us-ascii?Q?Jp6V5AtfOb/BYFX2vsHYo3UT38Yt+vJa3gr9esN9MUP/AEhHVHDUSR/cwwmK?=
 =?us-ascii?Q?qU544fHL4EiMLfLzwQfXjSpTD4EUYLP4oTfMFQxO4glMmmKGrPVoZTfb21gO?=
 =?us-ascii?Q?Zy7eYqOHER0rji+HjC6SfOAs/3T2obvwntp3aDchuEXa7REF7fB6HCziECWt?=
 =?us-ascii?Q?lrJtJWW63DwSQBcY8M0+Dm/mhrAagI6VcTRzlbuT+TeHaXl0Ih9Xdy/YliAK?=
 =?us-ascii?Q?HQ9+plPeTP0nXuLnAsRZdnbjQna1fQ71+NzGpTBLEe2cRaxl9XgeBkNYo43m?=
 =?us-ascii?Q?2q4aNoaJyTy7+8Xq03ReQs6bxZM0R5VufXaRAifrR6Vw3pd3uFBUSsPfP3f4?=
 =?us-ascii?Q?5oD2LnEV3i3Owi1iLIwQHYPM7SMylMUMXPddArj9DYthI8Wof5THfxYteepB?=
 =?us-ascii?Q?tw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 912d70d7-71bf-4bcd-6917-08dcc5b3317b
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 09:41:00.1111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LCA7EeHPFB0eDXK5bFJS5EGzhA2zOMnNLFNmo/ljQbyUceRu/5p5PxoS0hA+XxX2AzW2awS77+r66mCsuoesuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9577
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Aug 2024 09:41:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111957

Change the reference to the Apache-2.0 license containing LICENSE file
in the downloaded archive.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../python/python3-googleapis-common-protos_1.63.2.bb           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-googleapis-common-=
protos_1.63.2.bb b/meta-python/recipes-devtools/python/python3-googleapis-c=
ommon-protos_1.63.2.bb
index 83e0a33c0..5539d19f6 100644
--- a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_=
1.63.2.bb
+++ b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_=
1.63.2.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "Common protobufs used in Google APIs"
 HOMEPAGE =3D "https://github.com/googleapis/python-api-common-protos"
 LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89aea4=
e17d99a7cacdbeed46a0096b10"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd5=
7"
=20
 inherit pypi setuptools3
=20
--=20
2.39.2


