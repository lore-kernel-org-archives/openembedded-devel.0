Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D891E6FE49
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 17:12:27 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.123])
 by mx.groups.io with SMTP id smtpd.web11.34076.1725815542816309636
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 10:12:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=SVACm56D;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.123, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ShItgUOJQWblQ6vVFpK4u9VK0Y8FXeToiQQ8oaQMT2Q2cSHX55wuS8cjB2OIf2VYYhFzF70yrRanScjZ23a9tu36Nj+z7r7UHAxI40nUSv0SPSNzWu/EX+nDq7ZHg8dxB3bwqvAKuZJElAbZCRiKGNYyOact2eOS03picuNLlpwdQX22LZ2oi4I14IZq/BKe26kc10SCPqbOmBxvtVzdPomZ/Hd8F+c4eJNaAFUMqAK9iUZaqcoYKI/tWcUjcX3pQhbapl/Ie1uLaKUuYlziuZL0drrjTcwqMc81JjOQnIWAW9vu8LB1/5zKBcveNi7MEArLIF8unz5AjWzn//dv0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gr0I3HH5pRv2+WcqeHrp0XJo+4duLj+Jny3StCSNASA=;
 b=nG21FMXLU0RQPwcvRAiQX0Z9EWDicKFll7BNpkNFhHAKfwe4G64f6RdV260mZlabAlRtpMMHvnMIUXwrzsmXC5SBAPSa7tG4UQ+LTwkeJ7WnnxnGC3d7s4OeOs5vOlMEcUEQd1qr6VCP/2zIvDRwEjK5388rPXubslBwuBIsYf24MO9upgJQoM66CJmqenZazJxyku83zkJQxF+8XmB3iJO/reMJzPelSig+twUW+O/MG9BjQ6x8OGSbX3Bora2hcQnVsBG3tbNeAG8mZLh+6UhNG4TNaWNxDFJaBgly8wjArpq4M2y6KioFL4JSeUdxxjhkcjtyMWlcn/FZKTUR3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gr0I3HH5pRv2+WcqeHrp0XJo+4duLj+Jny3StCSNASA=;
 b=SVACm56D3y6XUbEQt6Ns3UomHn3b5GIGdWeIpsNguxEDaTInYnIjLQN+uBA/LL5WYvDHk3dveTG+hmWX/gmp5A9zcoFgXkHT3UrnAFK6wT9NVvzUENYgnBQeo3Ax6boSqNiVxz8U36Dxd4GOqI5We+xBwUFDY7lHIeXQhidHHXan/+p3lC1ndBaiHjaKwlE88NpVrE2NzI+WG5xnMUmU8DglGfU8mZhmEczctWsxMY4rkgT+LIPNzYIak2E5Td1a0b7uWSWZqnbexbMkdqKLgxYCFLL9Wcm7nKAJz2pHOGbZuKzhH98+0QUAezUaFtdAzjeJW4pRHAOe1xqqLNnMog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by GVXPR06MB9098.eurprd06.prod.outlook.com (2603:10a6:150:1b1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Sun, 8 Sep
 2024 17:12:21 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.7939.022; Sun, 8 Sep 2024
 17:12:21 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][kirkstone][PATCH 08/13] python3-colorama: Fix LICENSE
Date: Sun,  8 Sep 2024 17:11:36 +0000
Message-ID: <20240908171141.99382-8-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240908171141.99382-1-niko.mauno@vaisala.com>
References: <20240908171141.99382-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF00002BA4.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:6:0:1b) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|GVXPR06MB9098:EE_
X-MS-Office365-Filtering-Correlation-Id: a9908610-d119-48dc-a4b4-08dcd0296646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RhyJBWUusQzidRYRyx7P7yThJYcUFItK3u2rOBGqa/JwpqbSrjiXdVFQ0oZ5?=
 =?us-ascii?Q?O7HF5/rQid84PyBuQw+fB6yHxFF2hsgTIX3i3L5ayOPhcMLSKnf6PQz27CTk?=
 =?us-ascii?Q?O/zofve66R3lvc2CS/BamdE0CMWjJFyhqW9qrNcENoz9BvNkuwF6A8wbB9gd?=
 =?us-ascii?Q?anFLBxaZZgGNoSfh0Jo5/zh3DdjnBe/FFq95cSGEp7bV0f87cQOA5P5BUCUJ?=
 =?us-ascii?Q?OQSWcyvkn18JCJ8wnG+/sWLwZlZa5Kf33TBqFX0HokTSnVIvGFwrrmwKEwYy?=
 =?us-ascii?Q?3hJeMy094V/Agn0CK3UuBMDgZCdkeg456YnBXj+pp6dcTM3c5X58ZZ/yhvy2?=
 =?us-ascii?Q?mQUoQd+/U/0U3CZ5XGwkpmcgQH3CAasoi1YnACyah4VcULpsbn/ChUYu4cbt?=
 =?us-ascii?Q?YnoLDNNJ7UDsIIQuIwVAGSU8N1J1KmGCG+Ia1fy6a/2hY2CFRv6Wtys4cUmg?=
 =?us-ascii?Q?U7uAc+lZ+9v+Id35QC9mqgEuXvqgF+BceWFj6sgTCViNiGioBYGw8SrIbqL3?=
 =?us-ascii?Q?wrWHgo2WFntFqajVVnmfPUpFdIbN0H2oSePG+YjX4Wv+K1B8vB8aBnzQHczL?=
 =?us-ascii?Q?j2Eb/NQyOKVIQ1c1G1Y4TMOks9BjFFbX/VujqvL7V8aPjzo26dhg8TlONKvW?=
 =?us-ascii?Q?gfKx4WN9P58LMIofUmdBjKnDUw8OSSnPDy/1NdRbVcCPi7d4TUfM7wWqnTC3?=
 =?us-ascii?Q?/Rf+Bkr+4FNDRVBPwRM94xP1nnS+/O6qZn+zDsa06Hb/eR1y4TaxHhMl1c3r?=
 =?us-ascii?Q?dQJzSIwvSIRKTvaYHYRaKBPtnlI3yTI474RrfurEZDfA7FyxyWeyfQEp8yZc?=
 =?us-ascii?Q?PIOuUVvQNjeeBve9FMpw53OG9xt2j2ERHA9ynRpNvh8JasUFLr4JSHqhhZFc?=
 =?us-ascii?Q?slK+acaCNiLHYAvBlpLOMggkzppkvzTJzlWV/bq/T8hw1ck5YwXBYi0FBMbi?=
 =?us-ascii?Q?SZ0nIK/gyQu8Q7TeD68cKfUILP9aHMf+rc9Ji1vECn59Pv2YPy8pTZtDn8qc?=
 =?us-ascii?Q?dfIE/8GyWt1QePYTQmkqZxIRPbmCMyiNM9We1AySrdgeHZbTuoqgaAFHqlwg?=
 =?us-ascii?Q?lxbamEfPqC2zERntmChtgPpf1oxrqnfptp38xRiB4MlGXvLYXuCeYq0r9n68?=
 =?us-ascii?Q?SVQcY8pHsUEjdXpt4x+036Z6jYnZ7qTnY3dBerTfyYF47HLU3hYQtPSxz5I4?=
 =?us-ascii?Q?44oVjMwSHTU4rrkFqIjzd3Zvv7+H6EgNXjOlrk1qQNeoQKZR+7AYLY6XGkq1?=
 =?us-ascii?Q?DdOP7BXSJwxuLc+AlcY/0dFRbpItNC0sWWf8VXSX+AFedr7OTYBMvmhEpqgy?=
 =?us-ascii?Q?sMyORy3QU4j/HuyljhOBRkq0HH7smQlsn4zIkZkHnA/A+DtgwXLxODaS37WP?=
 =?us-ascii?Q?vWbYGn/Dh9BwusxX9EoysxkaBWsXm8PU6uJ0GxZgyJYF8OzO+Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?R4POMOqnmmzpkw22Ka+0F2E8sDTGhBy2WmRD/OarXe7rwWeEQE1vc+9LfTAr?=
 =?us-ascii?Q?RqlN4IbZz5FMASd54q7uR2vjxY0FRJukXn3jOkpeFmLrgSY024lGUy3+VHK8?=
 =?us-ascii?Q?wO06Nb0ogt8nIhQJCkvy0Mm5/ltAYCz4rFgg+jt8dGL6gcCU2DuXiyElNTwF?=
 =?us-ascii?Q?My9qVuQboMTBrPpaJJjO66JQmnW/rcjC/9yO/fE5FpLhzR+7RHAGzy4EK62n?=
 =?us-ascii?Q?3SpbGRDiJorgY/vXRqGa7F6scMjPYQBUBQ27cOtdWfBBiGeGn0UGIDjBEBh6?=
 =?us-ascii?Q?5pTixmGxxDZBlciKuQZMgySe9nPC0Bzu3woe5PG6sCS+aaHdtee9U1NvpJuP?=
 =?us-ascii?Q?iwZ7wCDzA/aphbZwjrVp1J+r3Efd/buGdtTe5jw/e554eP1rSeI+Cj8CW37k?=
 =?us-ascii?Q?xEsppZ0/8RZ8q1EOFWgn/p2wj8fs5SQD20pEUkTLqIxi/QDIBYM7kbnGrAty?=
 =?us-ascii?Q?Xy8SXMgwietVjueSEaOcxM0SGp+HPSGmNIi+KqYLGhhtlxajBzZaavEl78Dt?=
 =?us-ascii?Q?kJrgj3hKXmDzF5GcsfqUHnDbV85/gArfYmCgmMX72doyacSYMcJNUoSrAPju?=
 =?us-ascii?Q?+MW756MwzEScHwkJGn0jO/RUC9hfh84O1TUwfyAa85Mm/cGRuEGyyqMEeI4g?=
 =?us-ascii?Q?r/QcNFVROYoJHXCI7r9DMR2OpfWhF5GQ3F4+V9GndfyV5ZpCTO0aocoWy5m/?=
 =?us-ascii?Q?NpCgMTOowUHLkJU3HjYIjSw/gSQxiIJsk4t6xN2H8Cx/bNy+DDb3pMkijLl1?=
 =?us-ascii?Q?MzMdO/hdkORoKgvNxDwgWHEzlTKent0xIwXUl8kmYd9wE47+WjIkexjdzPg5?=
 =?us-ascii?Q?1SknOxv7osR8oswi7uVXO033dOSLMFGlgQ0lfNm54K8UjQnwazY4kJ4cxB60?=
 =?us-ascii?Q?KGzu7+UUhHm4Ld8hBIG88Dy7AsL47EvKu6Yio0ynG59GmU+WtTmqEEQVZe6K?=
 =?us-ascii?Q?n3Nr2UGNzWhXQz9LwCKM5FUIRYOsBZqLDslE4tZmfZp/c9eT3ccSyfi2Rvus?=
 =?us-ascii?Q?W6sC2h/sBWaBsl98Vio1CfQCHjrTZl/CBl5XtIrpIcaE6gHsHObPSODENhHS?=
 =?us-ascii?Q?cu9LT5AWZYKo7US1fPXLxiEv/ikdt6V8KUl1ZeaPm1f70Uke1h+yZkP7iR+z?=
 =?us-ascii?Q?X9UOB1uid/+E8UrqfdBkHdpqNgMGhp2ux4qp09uqb19WtBzjQxyXvLQg05q2?=
 =?us-ascii?Q?jEBzidS64WgS64+RuH/4R6stNv3aqhdR+gQ+4Gzmv9v+OGmpKbAJXVjW3+1B?=
 =?us-ascii?Q?MvjK0bOo30PlULnO8Z9oR4CB9aqTvB5HBtZLcsKAgHQmdKg8/islj4AfuH6M?=
 =?us-ascii?Q?pyjJJD+5LTzagGbJ6KX7KSd6gWQ0y2kwXsSbLTLCWldwGxibb7Qvh6QUSzUu?=
 =?us-ascii?Q?/MiownRuF7SFLJLSeiN6tdm63nchTCId/6C2/WiQXtX/ZDq6UCqNdcjdRPJs?=
 =?us-ascii?Q?L9x9BZBYAdNoRm6IH0zcGoCAwwE1ri3ckagtdNQFgSlGmpEq58TdPkU74j2s?=
 =?us-ascii?Q?FRTTZCJTvb0EwIQYic+c5z4UP9pGaS0E32xFzwYOZ6ASjKN2sVIsdbCDTzPd?=
 =?us-ascii?Q?m847srCr6VDHTIqpGSu8Xxf1fyZ/gykFQgsVr1fVK2iI+YtFNQXve1PkJ7Z1?=
 =?us-ascii?Q?Yw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9908610-d119-48dc-a4b4-08dcd0296646
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 17:12:20.9058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BkfgwvVQAIlB6sHnEsj9aSc+Ife+OkyAhE0kRs6cZBXZBFzCafe8VJogdNyPexUHKmG1fYdc0BI22tYZIuO8QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB9098
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 17:12:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112169

https://github.com/tartley/colorama?tab=3Dreadme-ov-file#license and
https://github.com/tartley/colorama/blob/0.4.4/LICENSE.txt declare
that this project is subject to BSD-3-Clause license.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-colorama_0.4.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-colorama_0.4.4.bb =
b/meta-python/recipes-devtools/python/python3-colorama_0.4.4.bb
index 54640de04..6f9721353 100644
--- a/meta-python/recipes-devtools/python/python3-colorama_0.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-colorama_0.4.4.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Cross-platform colored terminal text."
 HOMEPAGE =3D "https://github.com/tartley/colorama"
-LICENSE =3D "BSD-2-Clause"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Db4936429a56a652b84c5c01280d=
caa26"
=20
 inherit pypi setuptools3
--=20
2.39.2


