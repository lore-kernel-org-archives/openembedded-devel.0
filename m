Return-Path: <chanh@os.amperecomputing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 084EED206A4
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 07:11:25 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.102])
 by mx.groups.io with SMTP id smtpd.web11.17724.1729062684116085167
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Oct 2024 00:11:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@os.amperecomputing.com header.s=selector2 header.b=PEUmaK8f;
 spf=pass (domain: os.amperecomputing.com, ip: 52.101.43.102, mailfrom: chanh@os.amperecomputing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BnkQLX0FyYE3bDHrD3+P+q1Rtn/Iy8gPp8ZTcV5JW1LWfZOVGsjT75TJ/+dOA8BZBfxfoo5JMa1B32NuFvYnUoyd9520Kbu7EsRFccgmeUwfWYWb1WGc9YibB8UIb7PjnFJec2ip1a9XKtv33I+75GiFR7Fjme1GITZHJrHp7HoPXAe260bL7aZEDOrD3SRN0vJnkpXDT+R013fSuP8zV65AMAUq4+z7V/SsNArZm/MYjdOsFPJomoAL/YIZ7G3vCYWV2wsFQ3oxA3KNpXGPwjl6kgadaGTMbk5ZvLHL00Te4VyN5KgipzdkuNG5rxYkrLGd333+n2/aA59PRK7E/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pDeElP3dThJBmM0oAHEk1A2Lpx3qQq62opP7ZJFnwoA=;
 b=LavyUPxaXJ7s61jJOFN1Wba8VTcn9qT1Qxbk9h9aXfjsoL+2X38wMU7tGtqhpjKweuhZQ/wbzHnrTxwe3dz8f723VoF6Wk47fkT5dQu5fUhHdT20tZY7JQ8ElJYJUxDqbirMQ5iFSUrcgSPRh41qQv3n8Xk5vh8NAcoWqjRzSmo1PZUAGDt3y5XotXf14i0oUrQxS+lNaRv351EkGRqqNWH/UeTNEVv47sRJ8D3CUanHFry8PDoCLtXmJt4frfxOqq9RQ9AEqb+kVMsMrBlq3HfE5tPWwSiOErzmmToZyC7qw83B5K/GCkiTIR0l5Iak8bZCI5ueFApaSrkGYASUzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pDeElP3dThJBmM0oAHEk1A2Lpx3qQq62opP7ZJFnwoA=;
 b=PEUmaK8fFU93bQIOggLTsJk39YthyPWpHUR6T2vEl5/W+uotiu5Nw0GjcKS2GaViJPPfZDFMROcGdfxxNqTlQEt/Xw3lDZEfphcpFRA2LvvfOjoM+hrBC2Z7FdkCFO9HtbBvSs6xlc8m3mhtwfBnd/HIj01exnSUSf658gT20uk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 SA1PR01MB8302.prod.exchangelabs.com (2603:10b6:806:385::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.34; Wed, 16 Oct 2024 07:11:20 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7982.033; Wed, 16 Oct 2024
 07:11:17 +0000
From: Chanh Nguyen <chanh@os.amperecomputing.com>
To: Khem Raj <raj.khem@gmail.com>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	openembedded-devel@lists.openembedded.org
CC: Phong Vo <phong@os.amperecomputing.com>,
	Thang Nguyen <thang@os.amperecomputing.com>,
	Quan Nguyen <quan@os.amperecomputing.com>,
	Khanh Pham <khpham@amperecomputing.com>,
	Chanh Nguyen <chanh@os.amperecomputing.com>
Subject: [meta-networking][PATCH] mctp: upgrade 1.1 -> 2.0
Date: Wed, 16 Oct 2024 07:10:44 +0000
Message-ID: <20241016071044.2039824-1-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0191.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::6) To BL3PR01MB7057.prod.exchangelabs.com
 (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|SA1PR01MB8302:EE_
X-MS-Office365-Filtering-Correlation-Id: 880f6d5a-d495-4588-30a8-08dcedb1ba71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Zfe9QgX4iJm38He6WC0kvypRypxQok52c558FB3wgxTcUyokEuHRpuLLmq9z?=
 =?us-ascii?Q?MQV/5iRAwgUhkYekGbP8piZ9Y109xWbLRMZLrU8//ljqrEL+LYjeBpkwSt8K?=
 =?us-ascii?Q?TNLIJn7TNpzkJTX46nUHiaLDDGgRGyfx17KVq8TAbcByLJrBApmSvoWA1xZD?=
 =?us-ascii?Q?U2N+uepUZKtXz7uA8hbFTOO1fXVDNxq9DggjurjPcXKgqyWiBjm9vA57KT1+?=
 =?us-ascii?Q?T+OkAEbtWw976alUyH3Z6zBYfwN5GBittNxP/XUWH69hxMahS+0SfjG7j/5z?=
 =?us-ascii?Q?ogGjSiJ+227if9EngSYLO5ODrGhaW3GIk8kFiDtIjVkmODfOLxKPwSmgZwYS?=
 =?us-ascii?Q?vODETTh2kV7Zg/2FQ6kj4POtxbkcYufBa+vLy9yPBhPOQHca0Q5639x+/bBf?=
 =?us-ascii?Q?QGTliDBGopb/YVHcgt8EpXZ26pW9bcDI1nSy10CM0DcVAb07EBcQBFrp/0vl?=
 =?us-ascii?Q?mWw938tg1RA/ChugOgs5QOGFmtYq3BAI2ejpIr0kF8qV+UqbgLvh4j87Kj9m?=
 =?us-ascii?Q?V+L+ASurGKB13v6bIw8AxeGjHag7+bcHl0y4QAy8qA3zEBA2HAONnZIq86nj?=
 =?us-ascii?Q?k/oPR912JOPsUt9nPfRHf4pxQ3G7EfSX/8rMohABl+fsbLlgenFqRl5dXEGq?=
 =?us-ascii?Q?jkUGhPgx80wzPCSMBOVpuNZ2mP/uI37lSCwo4mejykp5Dqn0+ybOw/roZ6fO?=
 =?us-ascii?Q?K9uFM7jOKaIQT1al+rgtvs6VNHfuH8HmaYqfVK41msSINxamh71MbTmZJcWL?=
 =?us-ascii?Q?LHTtFW6XRMAaucy2YZqKxesJFCAevJF3iKUAu1a0BQoL0NAltvJYBJMAZ5pf?=
 =?us-ascii?Q?WEspz60Qn261d9Ka0843vp9MPNxiTdAlAD6dH5iJEj7M2uQ2MBEj2/5BUc3P?=
 =?us-ascii?Q?aF7i7acIkLoXTzOjh9TV5sa8jcR7XDaGNEcQhHHiJBKtIEBVLTb/2fsyhLd6?=
 =?us-ascii?Q?IH6W8GysauQq0SzM2DiPDv5HpBkudXr6AC+T3wpo0C9l+slHrVUyDX/Iq5zj?=
 =?us-ascii?Q?ngl6RqwdPi5WL6g9/a4rBBfZP8vsfRg9vnsZnRKAlom6I7Xpea+2KMNAeob6?=
 =?us-ascii?Q?AqQqAGrSlxUbMZHyAVwKssUM/0xLFhOu8XlwQ2J8pAJDzoOR0fAznnV+t8fm?=
 =?us-ascii?Q?+eSgVAo+Ay3p3+Q7wPALTWc8oOGxfhZb7W7myA4qphc6WuYKU4yudRQt7MMx?=
 =?us-ascii?Q?bon3Bt3JtOr3CnqnFcZebwVwhG9tOotkymQgeLol3eRzdrAJGMlBmlG3y+Sy?=
 =?us-ascii?Q?fRTvzE7GtoLXiNBBhf3z6qW07WYCu/eBJXR4kcnYYgYKQJuBnC1M/Kk/Chlr?=
 =?us-ascii?Q?584M7ml5Te1XAae/GmIoWM91Q+QHKHPmn/VRsuzAp7Fwbw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?txgtdsHSnLN2DTjV7h1W5CaJsw6a5KolDObgx5bXxneAo9W4R/CZbYWnnvXP?=
 =?us-ascii?Q?iRt4OqJicnOnjc4JqDKvIvQGfffBX3RssPu5rRlSqp2mk2TpXONgZY5vodZ+?=
 =?us-ascii?Q?Yqo3yh2RLZ53PvaCJgv0hoEoghIMV2JwODYsvMqTggDKB2T2t5jIPxMnpfuN?=
 =?us-ascii?Q?1M9OdrzrwG8Cg7jCSq6ws+mZoZ9kETdaZlV8OuqKKskiaXUvytJFI6DBUW+4?=
 =?us-ascii?Q?if68zaRJmf313gzBrM2m9FVzaxdfIW96fT/rYLI1zJU3S9yvrbiF0f9ENkYB?=
 =?us-ascii?Q?SQDhTDv9ux+ya8dhe7FvUF6m6jRT0F9ElLpTFo2onMTDyAW2Dmu4oq0RKCuD?=
 =?us-ascii?Q?s0BG9TUDnxcRztKuV79rcONXqfHzz4rmHjIZ6x+kfDwYVi6d8vB7L2jAfjlD?=
 =?us-ascii?Q?pAfqK6UifFrse3rwoucD2/INolWFxAEW3Kl1Fn3TMUnIQs9sKnouqU5e4+3i?=
 =?us-ascii?Q?M39RnkcE7+V++in4pD01F/+tP8Boq2eNzl34+uM4tRACFii2W1eIgWarZv57?=
 =?us-ascii?Q?u7WaKAi/9zZ5pCrKGR0nCw+79D5Sm+xwHnIc3+JsDvKvyBK2pG9b9xG66y5N?=
 =?us-ascii?Q?EWZwpvxFjf7NikX1ADRZwVESNzgZOpwZagk3oLwMmFvj9GxOi7VpOVcNPUPo?=
 =?us-ascii?Q?/RlkcsB6MpkccfrbwUqbq6AlW0ILoxFKAFf+z1Xnzpq4I6zmWImq19WgrQ/a?=
 =?us-ascii?Q?chrkKnCIbePZcU2gOxlJtLXOJvQI92pDYyu+ZF/UkTiaas5sKGyaabWyd8OH?=
 =?us-ascii?Q?w9U44TB4WmuwMMpOaQWgHEP9Ww6FV+D8vbSLpCzSvO90w8/3OrmHxln0OsYi?=
 =?us-ascii?Q?d2WE2H5vWFzoVyPNcz3xCxGjFpr7+SwFjj0nQgkN1zRej5u5g4X2pg2rzbHt?=
 =?us-ascii?Q?x94VDaT5DeHJtG7TOuRb4tT03V44wsUHML8N1vrZXnBNyzoQMktcDnpRUkbM?=
 =?us-ascii?Q?4bOyGJWwH4KRsboicIhk1DrIFZHhdD5g/s0lC7FG6X/TjkwZcVgNR17JDlsv?=
 =?us-ascii?Q?evGG91/TpD4VJ+eI7wGG+pBb2hKFmHg/UAE3/me7HeeTML7+OIVUjcx1dv9b?=
 =?us-ascii?Q?TpKY+tN+n9OmezwxNEbO2WNYzwTEmLvINrf3bs+5uyli13OFlg8cDm0xC+Np?=
 =?us-ascii?Q?7Sb+n54F8ybNpEW8fzJiNrVkR8Oehuvc0ww/Uf1iGtDmN+WnV5BeMvoKbge0?=
 =?us-ascii?Q?CiJWMgAVvScW3WWg0E9XQ+bQ6XfTp7mX74a7X5sQrWmYNp3RnnRJEW8NnHtW?=
 =?us-ascii?Q?SVm5kPMbS3Ij+sJCEPq2HY9nnLYpDIBbwInnftFj2c/fwtVuJpJa0wrnhCT6?=
 =?us-ascii?Q?sIokSENZvrlZVVhyfiSnjErehTLwuK6FXlk9Yryq3jOo8hJGIkG/qXfMGgae?=
 =?us-ascii?Q?ifuvkM/5t9iFjc98YkwaMPALHYEDBux1OLJPfo/szyw/4KvdvM1Zu7RWQ0FX?=
 =?us-ascii?Q?uaOtiUiFNnhKO/ddhnmgf2KMD1l1FRT9UdEkInJmPYEK+UkAeO8FCz3W8k7v?=
 =?us-ascii?Q?tc0kKalZYnIiYXL1o3fO80k2bRIAfKaKN0ihOumOk0lZSkyFK2xubhNJ5WwU?=
 =?us-ascii?Q?8YiSIttht9bTttCbvG45h3S8iD5ymVvMS04A1G+VRouKUHqWw+e4mtQOfUy5?=
 =?us-ascii?Q?1aIIty+qO4tW59c3UWRELOQ=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 880f6d5a-d495-4588-30a8-08dcedb1ba71
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 07:11:17.6916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VFzHpJiXnSiN5MM1Xsl/RzXlYXAHmdgzaDD3RgObRFOrjJ9d1DnXQnclE/QzWQ0WfpLLTXt1DqR0ad78R+VrQxULro0fe/4hllFFIcaUPE2N/hA73kiqBlbBLp1eHH8e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB8302
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 07:11:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112937

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
 .../recipes-support/mctp/{mctp_1.1.bb =3D> mctp_2.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/mctp/{mctp_1.1.bb =3D> mctp_2.0.bb}=
 (96%)

diff --git a/meta-networking/recipes-support/mctp/mctp_1.1.bb b/meta-networ=
king/recipes-support/mctp/mctp_2.0.bb
similarity index 96%
rename from meta-networking/recipes-support/mctp/mctp_1.1.bb
rename to meta-networking/recipes-support/mctp/mctp_2.0.bb
index bf3961be4..a0e757a6e 100644
--- a/meta-networking/recipes-support/mctp/mctp_1.1.bb
+++ b/meta-networking/recipes-support/mctp/mctp_2.0.bb
@@ -5,7 +5,7 @@ LICENSE =3D "GPL-2.0-only"
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc61db2=
1"
=20
-SRCREV =3D "a591ad885aa28f113cb45870b2fd5bce48378d6f"
+SRCREV =3D "9986862f88fd6e6ca75e2a29236cf332d640e600"
=20
 SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3D=
https"
=20
--=20
2.43.0


