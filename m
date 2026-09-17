Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE82C982C1
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 07:59:40 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (MA0PR01CU012.outbound.protection.outlook.com [40.107.57.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33737.1789628450045182627
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Sep 2026 00:00:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=V97jLLvD;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.57.12, mailfrom: upstream_ip-sk@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B8H8/FOrDbgfgJQ/lpKblDTxCVG1mw/fjK/vH9SO/SotZ7g4rPJw+FuLijvI3XfUPlQJMd2KxaQ52Yg0vVGlUSw8SvgUgh66ioqEO2hEcHs0MlSFyDtGGXRfEKuh+a0oPEEdQuQx6YiM6+xkvdHOcTjH1NaC19xvP25c5Sd5XSaO+NxlznDnoKn+dtx2Yi8QWyREI6F+JQOb9JKh+RikuOhveThWMBQ5qZi7WseAhh5wPAyu2DYR70wJ9jYLPPGjVZUVtruaZFitfI0Td6IeCjLPB17wCE8SpLIRrhL9yP4Or6kfaQLZLM+lIsURfb8fScTW3MGYjorCQTlmC3wp9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uU/tA7KuCzYEjcQbMKmSMfvIuNc2SQvWdIUGg4TWU3k=;
 b=voGFTpJy3K7QDU74Qx+7PLoNPr9jGWG6gPDgnGczz+YG7VTKpVutxTFzdLjDV9gUeqpca0t/kYMM0WGEmq1wY8D5zxNDKqQ3wy0HDOqzGyy/KdO/TUbMBrZRG1MoPqGESxAH8AvxAs6CEit4Fo/JNG9eufTRCu2XdxZ+tj4C2sLkGIJHsxMYaawUhWCLgK+Wr4flwomzxHfu29LL5hewUC28X0S5DyWiE9EEw4k04ZZUDSgrDiulk2kyHoBQAvhYN3+u36d921hd8tv2V30MxjXdRMh1/JYd1qardkC/RV+2DrMbAIZHDVA0ArE7JKPDTdhgjiXU2N0RrD2Jsd0w/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uU/tA7KuCzYEjcQbMKmSMfvIuNc2SQvWdIUGg4TWU3k=;
 b=V97jLLvD8Z7KGPUNoCu6TS/t2j+xxsg4hT6ReVL/pXzf9d7HldRZBWM2F08O9JnJqqMcwSYJrhEOgid8vc8KD6oPp6oEjAk9+P4EpVwiWRHFpmHwC/Fhtl/gJXLueG52TI69B6hZmG/7blAlPN7sqGAaJrZdThzMxmuvB/b3Cx2m7PSaqe22x9hBFX1R1hereNonfonzqyGt0bKHIIAcB7Ajvi8jja/Zel5waODn91HUp/C4oiP76+iHoBcRlgCHpDv+ifTWbHsLLZFPkqpUrrMol/bHouslpOb3HbdcavfXORDb6d/vpUraW7hqDSr/e40ucAYkOuxUIjuz3iUzHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN2PPFE40D44641.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::156)
 by PN5P287MB6336.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:33d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 06:45:13 +0000
Received: from PN2PPFE40D44641.INDP287.PROD.OUTLOOK.COM
 ([fe80::a44:7591:bce5:fd12]) by PN2PPFE40D44641.INDP287.PROD.OUTLOOK.COM
 ([fe80::a44:7591:bce5:fd12%4]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 06:45:13 +0000
From: Sana Kazi <UpStream_IP-SK@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: Sana Kazi <Kazi.S@bmwtechworks.in>
Subject: [meta-oe][master][PATCH] avro-c++: Use fmt from oe-core instead of bundling fmt 10.2.1
Date: Thu, 17 Sep 2026 12:15:05 +0530
Message-ID: <20260917064505.1037383-1-UpStream_IP-SK@bmwtechworks.in>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: PNYPR01CA0051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25b::10) To PN2PPFE40D44641.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::156)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN2PPFE40D44641:EE_|PN5P287MB6336:EE_
X-MS-Office365-Filtering-Correlation-Id: 9422e49e-8e3d-414f-d636-08df148739f7
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|52116014|6133799003|55112099003|18002099003|3023799007|11063799006|10067099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info: 
	COSjDt7E6FUaDzAe3OuoUCjaBodQA+ZyFvZnCBkz4iTzgv+6428A766hWdzSJYS7sRZTBmg7I0/EyM6YB/eQyJse1PQt9VZSEMtgLl2dDBxU7BmgKFIE/lmoCn2yKA1tnmelX0JE/adpjvhFHyqKE97js1rdHGNaJ1a2PcTE7/1/sYUqMcXRyti8PO07eu6+CJd5mKEq6TG9o9f/bVRMDpA31iigFzZQdz2d0B/f+pMIouaqItaPXUCKqO3gSp8x6NA3A1LEspdj7BDkVg67XNAVGYhlDhUwFcelErZW1C1YFTI9JLVTRUuU79POVBoc61FECp3JDS5BaPl39WA1OGzydGE4+UOdC4K7px4FtGiyOUJgm30+iVFGsZykDwNvrTef3NcHWFl8qUPcnTTFzHDW3ZPx//1OKItcZH2cDriFW/H3G4SlVx04MjJG0t8q6BVKe/GYqN0m7IjHUM9nCWMdZBr7+Kq3HNGLqrVJvT0sMf9dJkGaCh1Q+EI+BOq3KqWQaiqKffSxkXjt6Y4K7xnaGtw7L6IsBUWlLzJIjLmmbaEc455G+ikPMxfHoLJREFu8g4/E+BvRvxbTVK0T/TrZlsYGitE1t2AbqElrjwoVD9mFuH3mS1EA4HIjPst7AHNZYtOzf1lBe3hiS61cxI8ZYnoDsSuNxD1bWjAihEjufPRj5Wo0mB/xCQn5hKNEfmDBCr6A1c9W2/2iuywqJ1l/900qx3QXckrXt8ZIjgM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PPFE40D44641.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(52116014)(6133799003)(55112099003)(18002099003)(3023799007)(11063799006)(10067099003)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8Rl8POiHjtkGzf03mznH7kUSTQhKIHgdNjoh7fDin/ux17s3NA4rXP6f2qrB?=
 =?us-ascii?Q?MBMK2W3bgPick8ujiunIFOF6CjsIhfop6iSlkDcoxRVNGJFLkCqEf5/gyf1E?=
 =?us-ascii?Q?09h5Vtq5B+KT3WEJYVVjLeokJOjO+AwXNmpu+UJ9wy/vz8DbBVPJLdJN+/vj?=
 =?us-ascii?Q?/FnVCaI7UEUpVpNyEFfekoBk8cXptuQII9afvLpYPSyfqrY/7bzn/WCq039Q?=
 =?us-ascii?Q?uXy8RS1dtG42CUwZcG6cAOnfMgcDAmTjTPNjH24XVRrw52rF5GvjzOYEdy4s?=
 =?us-ascii?Q?qnKJHDBl06YeL7QelB8+aD/WMcnhosizwn1121eZiPnwD5bJv0z65Insc4F3?=
 =?us-ascii?Q?/KEoFuyWs82+A5dXOcqDU7oKrtQQ6q77ShM5dh2IxDHVLyEp9NLcahFQXaCm?=
 =?us-ascii?Q?PzudSu6Y9zOWQOFm7Z6d2UUeCN368xMQ9R4whEUutvlmoQ5ihlBj9L8aYjJX?=
 =?us-ascii?Q?tw1dz0gYOOJOcboNMehD1c79DUwRTAuCqMyKFmAeob+Eux/c/PH6zJ7VH4th?=
 =?us-ascii?Q?gFep9oIkWNdl0N6Z2qIdklJ7/FFQpZB1fJCwn9WJfzs42HYk3rOigXVNNL0c?=
 =?us-ascii?Q?THhtGDMBBCT/+lu5VIqTQUkVZ5RCXQhsiQM0Nq/mv85nW0UG6ubyfjrWRHLr?=
 =?us-ascii?Q?YPpYg+srb1xGWLXpMMW+JZwVAjOY+A1gD2m6oh+9sGJldCHtBBIJDDKAEEXT?=
 =?us-ascii?Q?osGPkX0TZ1rFhMaKSfVTvz51X1QE5FoJzDp9Xh4erf0IZ2dl48spElEgE18O?=
 =?us-ascii?Q?eBTw0uI+aOQYScmPUa3Y5wesx/mOq4/hUWoXigVgXMm+5BogxLqm39AZy0wk?=
 =?us-ascii?Q?j/zajW8UN6DHwn32Ywia7ICBRYiRQo+ute8Yk2NRDESTB+KmLAJS3qFnm1wH?=
 =?us-ascii?Q?R9EJvagk3pD56NkoPFT2w94EIM+VLJFuZSr/e9Un2l0OzhyjafjnaVIlqkQ8?=
 =?us-ascii?Q?4xuDjyrG12oPmlkMe6BGPw2aCd0t/9zupZ6SjwT2MyLilzmVKU7EM88pYwIZ?=
 =?us-ascii?Q?5K6RvVUmlTMJEuUUYKsCrr9p5PweWaCy0KeHNlyZRbvwtaa34T5MY6YSLHWx?=
 =?us-ascii?Q?sRYROQ6GY3QoAnVWbDV6sqjJdFRhJNDG9mSHujv59oxNtK2arBsGphvdyh2C?=
 =?us-ascii?Q?j+4j4waZzlHdDpGMJ5V3eFIm4xLgtnqgGtVgp3o8nZHRNVln0SAVxg4Dwukq?=
 =?us-ascii?Q?jOjtx0RbRBN2F3IsKQD1mwIfngVrA0SoCh+lIquPe3pbrcRTT5mVPuIw0vbH?=
 =?us-ascii?Q?lejZ4AYf3da4IU6EhVAfOXPvnGbLI4Kqt5DYU+ivsEz4JLypNd2QWpIQlh37?=
 =?us-ascii?Q?lU9OZJJfyGK9xf3syl1Y8wEGWRwLdr3d2dv8WlKVnx5CQtMXyj79L6ubQtAM?=
 =?us-ascii?Q?GE/xRdgQaxJJbF3QW1UX32dBQzyPT/XR/aZ1urWjZh8Cw7/ERajZ+KdBH0pw?=
 =?us-ascii?Q?gJ/O7mzZny62mWcD5kEquEi4RH0ztqYCiylaIdYnyXPfEcMACx4g951qplLP?=
 =?us-ascii?Q?AjHtQ+1xETmOlXVMcH9nnoGXs/Aal/D8fF/+hRk3yU8qIMbCoWojx62D1nuc?=
 =?us-ascii?Q?pRXcJ4HCuG6xHC6L7B2uB4rJHtmKuZf/ulk7AoZvcfvJV5ewCR14TUVFDaNt?=
 =?us-ascii?Q?UglZTaIf0oN1HPzKcf04yhVlB+mq1u0EemaXeaizlZVi59rJpAtVYyBCoNhy?=
 =?us-ascii?Q?B8Q/5Amnw/aJ8zWnnM0+UOLT3CeG1MhPBCaOBUEBBQzi9riWulzXE7+knlEJ?=
 =?us-ascii?Q?52IaRO2C+Ea/8gfchOWzC+Vn2OydcWo=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 9422e49e-8e3d-414f-d636-08df148739f7
X-MS-Exchange-CrossTenant-AuthSource: PN2PPFE40D44641.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 06:45:13.6597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S8OPD5zr2y4d37Lu44BxsACi7VFoxFWxTrc2LudNtM45fEEqQI0ZMwAnVr6PFvQcs0vz6mKX7WAsaB9dyjlJyARUGFw386aEX+a847lt/PE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN5P287MB6336
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 07:59:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130094

From: Sana Kazi <Kazi.S@bmwtechworks.in>

avro-c++'s CMakeLists.txt calls find_package(fmt) and only falls
back to fetching fmt 10.2.1 via FetchContent if fmt isn't found.
The recipe never added fmt to DEPENDS, so find_package fallback
is always triggered. The recipe then had to stage it into
${B}/_deps/fmt-src.

oe-core already provides fmt_12.1.0, and avro-c++ only
uses a small, stable part of its API (fmt::format_string,
fmt::format, fmt::formatter<T>) that is unchanged between 10.x and
12.x.

Add fmt to DEPENDS so find_package(fmt) succeeds and avro-c++ links
oe-core's fmt instead, and drop the fmt SRC_URI, SRCREV_fmt and
do_configure:prepend()

Following tests provided by avro-c++ use fmt headers:
CodecTests DataFileTests SchemaTests buffertest unittest
No tests are breaking after using fmt_12.1.0.

Signed-off-by: Sana Kazi <Kazi.S@bmwtechworks.in>
---
 meta-oe/recipes-support/avro/avro-c++_1.12.1.bb | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta-oe/recipes-support/avro/avro-c++_1.12.1.bb b/meta-oe/reci=
pes-support/avro/avro-c++_1.12.1.bb
index fdc7303280..e5368a3d43 100644
--- a/meta-oe/recipes-support/avro/avro-c++_1.12.1.bb
+++ b/meta-oe/recipes-support/avro/avro-c++_1.12.1.bb
@@ -5,26 +5,18 @@ SECTION =3D "libs"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D34cb96edab958a981837bf6f44bf654=
d"
=20
-DEPENDS =3D "boost"
+DEPENDS =3D "boost fmt"
=20
 SRC_URI =3D "git://github.com/apache/avro.git;branch=3Dbranch-1.12;protoco=
l=3Dhttps;name=3Davro-c++;tag=3Drelease-${PV} \
-           git://github.com/fmtlib/fmt.git;branch=3D10.x;protocol=3Dhttps;=
name=3Dfmt;destsuffix=3D_deps/fmt-src \
            "
=20
-SRCREV_FORMAT =3D "avro-c++_fmt"
 SRCREV_avro-c++ =3D "9110c693767c1dde2665b2b57939333478b12036"
-# Tag 10.2.1
-SRCREV_fmt =3D "e69e5f977d458f2650bb346dadf2ad30c5320281"
=20
 S =3D "${UNPACKDIR}/${BP}/lang/c++"
=20
 inherit cmake pkgconfig
=20
 EXTRA_OECMAKE +=3D "-DAVRO_BUILD_TESTS=3DOFF"
-do_configure:prepend() {
-        install -d ${B}/_deps
-        cp -r ${UNPACKDIR}/_deps/fmt-src ${B}/_deps/
-}
=20
 # Workaround for 32-bit build failures due to -Werror:
 # 'useless-cast' in Symbol.cc and 'conversion' in FileStream.cc
--=20
2.43.0


