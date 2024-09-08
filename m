Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E9F7CD4F4C
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 15:34:46 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.100])
 by mx.groups.io with SMTP id smtpd.web11.32164.1725809673142184746
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 08:34:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=ZfHQs059;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.104.100, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xYOdu9ldCCd0aGdC/H0wNn/7Zt7FKGSAczvtOnQLkPcuopI0lbSXO/vOjUSiFLR3DVB0Pr77Mv+9KAqcF268zkSCFQVLie17L6LamZblqAZ9WRWBuPOVA0xjHBmhmDCCEWfbtuczyjG48QQc3k6sKXQkTnxzXXuRc8/yPzbjoPhXMl2nnTvxkDh4m+mJl/9lNGOPi6DhJm97psvvZl13ZirQ6HCe+xHLe4ombO0cH2DdQdajmLuIQlscYy/I5qUGkjB6WG4op2oCbP7fFUnGRC3Frq6BEFI3eHHmWKNm7gBX3QHTXAVorSc9CMx06bmSPkN7xXPLBv/5Xj6lpdkccw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3CAntxH4ewoTatVNEgTk1hDbizS+GaF5eRXEwzv0BU=;
 b=jGG0PB167S8cNcm20aeFwCj5qR8zuLHpUMAjIE3y2Hi3WainZbMT5AQrKD+IM8jGcHs2h6S1Z0xFz+3NHuUv6mNlBEYDRqKs/PYsgHxzzM01+GHlCKe08E6iLBXzNJVKywOP/BeSJ70QtDXuOJYpUREkPaylqekwRbA5TgWxS844FEobOx+y7YXwVD3yrhwuhajwpfDbhfRdYIxUCAQHZGJDLbewNqUUY+EYpC9d5nNAT4ZYgZCKD/ahblV+25ir6EhWs6uq56jf96hGmPVBeRy53Uh4BZch2EXyPTUsPiYLSBSmXKCY4C8t9ZVxajrdTb/LPhOiFnQVBDtDdvpgxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3CAntxH4ewoTatVNEgTk1hDbizS+GaF5eRXEwzv0BU=;
 b=ZfHQs059sRPJJDr9gOC1MeyBroMv+vUMs/esmezn3aIdclmTbXHcRvfrGSS9OuyHYM1tIfOfFnUxVJen0Ub6j31OiMeq3bshDRJEC6dgYJnVKn50F8+l/uNjsbmdeSxPZ4iUH8xU8sHDTdmSQK2NCc2gfQ6Q0HX2epcyReGjikNUYOb5jJBS4d74OLUMw2vKntkdBZOyGWzwnx5XjD3cBPFI/U37HJm8obuacNlKIMpJOEx8LqS6vmzZSczZ08u6O/n5QR3WkaWZbvMRv1hQjAPp4p0A/qi14GoCEHDcIHMXcuRmmKTO6t1lLOBVnE725OCPcVwJSuTsIVLnCDd3JQ==
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
Subject: [meta-python][scarthgap][PATCHv4 07/19] python3-mock: Fix LICENSE
Date: Sun,  8 Sep 2024 15:33:56 +0000
Message-ID: <20240908153408.4114753-7-niko.mauno@vaisala.com>
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
X-MS-Office365-Filtering-Correlation-Id: f93a3f44-92f3-49b0-29f8-08dcd01bbc4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZvtVXEq/Ko08eHu6+IDW8nWUjt8pTwObOA4n3OYw0f+5qUWV8iw5+rEGzgcf?=
 =?us-ascii?Q?gVQnz8JhaKXHHR+G2Yu7TcurAgTXc5um1U7MmAoqmGBY3kuvol4izigiLnZa?=
 =?us-ascii?Q?uJ290qmsaZieat3wEVcQS00jXLEJlrzh9728cQN/9+jkJSduF7P9fxLGryAI?=
 =?us-ascii?Q?nijypm43kAgRl9UP9zqGZX003hr4JWgQ/fMkJmhgSFpwS8toEHJXh0+Xrn2w?=
 =?us-ascii?Q?jQNIUfuBCdp9WJMKNzpFLUvB5VD45wylEEX17QlzPzqbPfT0oDdTzzCegM1r?=
 =?us-ascii?Q?STwmn8UCka3/p1uN84WhgLp7UfC+2R3Ld7ON+u/khgcpBEDI0RpL6ZiRuTt4?=
 =?us-ascii?Q?66NIHA9hZphzlqakWkPjh79lUHHsr6oLVEmCUKaLfTZjLZn+dcNa3LI5ChQU?=
 =?us-ascii?Q?OXtWDO6qMmCePOPQINKpPyOndYhMd0Mj0f5iGIw3fo0jrjcrF1IPgjU+n4MC?=
 =?us-ascii?Q?Ba8m9qJHqhLyUzJpIXo379xmjcAgcxs/LdzXOK1GnKY4fMoCKrEALDQfmHHY?=
 =?us-ascii?Q?NOHnTGvWKEshgKyjEExe3VFgh8FDJYg6cG7i7UY6YuLkgzf2mylV9rTbDmvQ?=
 =?us-ascii?Q?n2TERUxaeX9cAE/cvvybT4KS4wlIRDxfMmhGY5SlZpy89DWqHRXqJScbtcI/?=
 =?us-ascii?Q?V17G+L9e0Egt6UqrXgok43h4rvF1EfncC87jmzZzO1Y6ekpWhxyefkS9TLgp?=
 =?us-ascii?Q?VdW+QXjN/Wm3qB3gO00kLqzWApxWkD3deItQCvfpJ+I+BN/ES1L7WwFZn+Kn?=
 =?us-ascii?Q?TPQ7kceB+Eh5dhOFW4TYcwhi8qzSDR4i9ffZh0jqiICTSBHa/JFb5a6csOtE?=
 =?us-ascii?Q?2XV1Cf73Wevv3GnQPRfKOgP39aQXWuUuyYdfmpKI3gdLvrljyNSSblwHvWan?=
 =?us-ascii?Q?RKwSpPHmvf6qcdKOVYZxxYuh/0hnkY1XyRYcRXDLvcl3jUr4nQd0cZkVm5nv?=
 =?us-ascii?Q?xY7tWGmu0XEKVj02lCCEGIIJTUcxAmxH3UoQN7sSsxUsC0FM1tsDb/fHL+kY?=
 =?us-ascii?Q?CnT/QiJL08zlibWZpxj77s+gJO1RfTGuTBY5fwZ96j/EEPs/3roBGe0tFHDd?=
 =?us-ascii?Q?OJNztFqiH9DvQW2HLv8BEmMFFj6Pt44rPO9Ei243V68TvIl35nhTMUFIdG8H?=
 =?us-ascii?Q?fraI2rQZ6AyGGYCqwEd39vGKvkNWhBt+cY7cnCN/e0sB5yyDkkaA4OZVrsza?=
 =?us-ascii?Q?g7x3KXiBZoQ/ATlGTeDAwhiiUg1x2dtCgqjlocVR7IqGhNXKX/nGWn5dzyJs?=
 =?us-ascii?Q?PVhtrnwjROkkoG7VqUyNBlXIgjoxIkr3Qr8gqBWZTQYPgXalZmncdsTTe2G1?=
 =?us-ascii?Q?lyIgiPp0FM9BDyydbFqSxxVpVuFHupDI8bzIUbtHlgrq5b8f8Rsbxi1tMvqk?=
 =?us-ascii?Q?Ui9hGKY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ppNc1Rp5twtIcUz0fET+NXpfyOHZ1loQSYbQDD8mF9sWcm8D2Vx/wDXpDMNR?=
 =?us-ascii?Q?ONp4t+J5Pq56hmqThPd2l3IKi/cjERFlqpH1rBURXDEfe633N4XVIUVGQUSZ?=
 =?us-ascii?Q?Nli7xzAYxumUWjrYiRKqQjUDBB4NIU3gSQ4R6my63eeVdcG5GWvv9eQlYvVa?=
 =?us-ascii?Q?Yjw0VxoaM40k6qo4zJAIjT5nIAitUzBeBYjr5ov5PhjgQtGNaN2E1nLkcrWy?=
 =?us-ascii?Q?28gD849JfYoeirOVqw0T9wmpkhdjaSbEIjlBNTSv1CBf+ZB7Mh3L5npwH+Wp?=
 =?us-ascii?Q?P4z7xBe38iCpauFzDg7ub7ykhjgs/Rg8NNDunMUEoisC2v06+2N2yly7cE17?=
 =?us-ascii?Q?u1Ste1jpgT1BURPM++qHWwQiDG5xTyYpXr78k9ESM3qjf7yQXZcnNkAMjuHS?=
 =?us-ascii?Q?TfDDLzvR9vr8KfXfIIii/jTxn2fAzwwWFldw2m1Te+72V2rwOSpWH7dF1v7Q?=
 =?us-ascii?Q?deUp4Am4EndxPMKvt6uDG+bjGuP00pVbDtPjpwVqdlvODpZoehV4htRws94n?=
 =?us-ascii?Q?9GsPlfH4m6s5NlmGJZMtXCjvJgFE2wsgIeLwfsyh9W1LJoIRPJJghxknae7c?=
 =?us-ascii?Q?ybjfY9ZI67oxqsSFbXjX5etAuy2gfc71VpJcyetlUWdUj6VtjoyaiePjFSBG?=
 =?us-ascii?Q?LXS6CCT1sb+ofBdCjiez5XXf+DkWixKdXiVi1PDr3p7Fs1yASuF9XY9SrIEa?=
 =?us-ascii?Q?MHpcUnAQRCX5QO7ItfyqbJp8PkgtmWTKkdb34bz9ONFj4BK6xDTj++i1MoED?=
 =?us-ascii?Q?q/pQB0gfxX79BCdImyvQndrfZslfgIUO3xQ1CST5XSgdwN3TDexCk/s/QuKD?=
 =?us-ascii?Q?Z+51QjV5oqx3bsFC+kfV8FnocZqNlFuw/d+dL++UUK0kjmszYeWkBZHFSWRs?=
 =?us-ascii?Q?sGh0HdIHKaCT/1sNlpr2uJJM2/u3dq0HNFNHfYrJBdm+F5xO6OJPUVyGkozq?=
 =?us-ascii?Q?tZA6QECC9ZdYjJakEEa0QR1+j0d+0g4fnWRkKTQsKWdR6UJjNGwTajiRUcWA?=
 =?us-ascii?Q?vymd5vcMoKTU3w2CCQMCd0mu0x+pNZFnI+8sgpI1yLOkY786Q56+/f0qgE0R?=
 =?us-ascii?Q?2870JIW4kou8Lcl67VzKE3JyZTaWZtSoyZn/nMbvHORTmrvs9fY9g2QtnCq7?=
 =?us-ascii?Q?80qcZrtjbhRccMuHVO3xwRu4hNjZb9+GOdow6pul/KLaU+4yGCqGxA0T3qf8?=
 =?us-ascii?Q?k23n9IKTje2/0XGdG0NTdeSyLIA4FaWGk+Sz7RRGRHd41sKUN8vhVCruVUv0?=
 =?us-ascii?Q?vii2FL7/hO3KPLOgqFuGu68ymx8md//HZD8lTMLvE12b6VqYBYOvSuBMIRRu?=
 =?us-ascii?Q?D2rtc8yNYR43jjwbC0le4s/5DXI17nSeyUcH+yPjV9Fkh5hyM1S0c1yF7zVi?=
 =?us-ascii?Q?APXeCBs5DnVzb0JPbYnP8AE1EYANZO1d//87KzCJN8fvneynx4lNDfcSx8t5?=
 =?us-ascii?Q?23w1ruy5s9NfCnhmiddfxj1kNXO4QzSgrLFKnsn16byt4ZXwv4oxbDil9m8c?=
 =?us-ascii?Q?g370ElW7mtiPfSaoP78Nw4XcdHOjPoYa3jQaLH9Dz5Hg1MFwC5M2izmEl0vG?=
 =?us-ascii?Q?NEyItpUBJzM0J92A1n6+KzdpRmSh5tQuw9HqycqXFG5mFY+VXzGGLUigVPpO?=
 =?us-ascii?Q?oA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f93a3f44-92f3-49b0-29f8-08dcd01bbc4a
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 15:34:32.2853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z7okONy4CJPQ5FHy074qaSCCo5g+bovZPwLzT7AuTKEkdaMR2apT86X80TgZyBlL/+KjNbiN3hRCkTL42lz5Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB7095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 15:34:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112146

According to
https://github.com/testing-cabal/mock/blob/5.1.0/LICENSE.txt the
project is subject to BSD-2-Clause license. (Also
https://pypi.org/project/mock/ states 'BSD License'.)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-mock_5.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-mock_5.1.0.bb b/me=
ta-python/recipes-devtools/python/python3-mock_5.1.0.bb
index d9ecb9d4c..1b89260e1 100644
--- a/meta-python/recipes-devtools/python/python3-mock_5.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-mock_5.1.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "A Python Mocking and Patching Library for Testing"
 HOMEPAGE =3D "https://pypi.python.org/pypi/mock"
 SECTION =3D "devel/python"
-LICENSE =3D "Apache-2.0"
+LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dde9dfbf780446b18aab11f00baa=
f5b7e"
=20
 inherit pypi setuptools3
--=20
2.39.2


