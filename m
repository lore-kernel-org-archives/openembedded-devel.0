Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86670E9A777
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 12:18:16 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18015.1774354693558661919
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 05:18:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=B4Du5gcd;
 spf=pass (domain: prevas.dk, ip: 40.107.130.41, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KYt/XWr7uuAn0AR1q1k6WGvpWCm+gzYmrnZD3RLqo0K6HmgSBRn5z0CRIpwBrSFIlQz4YomPRxSeJFs2OZh3zATA8qxcFCPO3UsD0v2cHzEL5M5Vd9PDrY6m53gBKsXnvGL7qQtJOtCMGQSkXx+HCxcoWr1udV0HcZQb+zEc9z06tLsQrNrbm5XGfRfBB1ec5/avRGK+53lwaJPa8B7qcX9mEgWAwDfTEust4C2tvie4Ncj54+xZH3XoWPkd3J7FZoqcfv6lrkA3vrRAjbXAoR7MiYTBRUGzjvi42bBroFu0AROZ4JMg99PHHEmEUyYCOtEUYjGZ0kpdI2TT2Sm3ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYfvsDfrQk9qRJZL278H5lTPdRiRcT/38rTZYPPhjYI=;
 b=CPknaF8y09DjAzlUFecgboTGXNuGlobpYwCapR2EmJ8wj8xO9/C8knei5axbMYDubpTI3a0WZ9G5eGAzZLp751UUe2aYTHiLGK1eV2ciW3mIxT1U0UJEcmIgt+zfqhv1TDlas8VFeC0elqRrFV2adTpyOFvmcG1NCln8O9R6TTKkSydOi5v+k7bdJ1BmS7sHx7YNg5/tbOMb9tRrHRbg+Os1NQDz2pEVLwqVLB6qihfsSy598GLnn8SJv56EbC5rv5JMJLvpygwMXNYPfXyhdubBvMUlD5vrdBBk8Z+AeE6spJsZXUZu0Vsvyx3hX5EnRE4zKGlp2++LSEujWMtHnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYfvsDfrQk9qRJZL278H5lTPdRiRcT/38rTZYPPhjYI=;
 b=B4Du5gcdjbehj2M9lyaQs+WyAK0MKnPhz9cNTx3u3WiKzhmnQM5V8HZ55PkMBMV4iWUIZrfU/n9lu8mZeMpnqNciuDvxi5bdBEQVykF6NNKCKGb+I5ggjB6VsBX69u7pps3D7/PBfbIHQgpBdY1Md4Jr7DXQ4Xl49S2d79bzILc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by AS2PR10MB7802.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:64d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 12:18:06 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8%5]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 12:17:59 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: openembedded-devel@lists.openembedded.org
CC: Khem Raj <raj.khem@gmail.com>,
	Rasmus Villemoes <ravi@prevas.dk>
Subject: [PATCH] fluentbit: improve path munging in debug source files
Date: Tue, 24 Mar 2026 13:17:55 +0100
Message-ID: <20260324121755.3059617-1-ravi@prevas.dk>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVZP280CA0057.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:271::11) To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:681::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|AS2PR10MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: bbb4b53c-0385-441b-f1a1-08de899f630a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	cKCegH3VV4/BOsZgylT6SCIZSgwLlZP4dv0gnBsgBiXVZu6R5JB0G4aDSway3yCwpa5GIuMFneb3wXOgEVi4OPM1ZKHSpgeTj9B8QVxq33X5G9kMkPCUnClVF9ubCEGjtec9jd+i0h7Glubb9I+LSoNnEJdOZBn1aTglKR10HIT77HGVzdU207bA4GouULV2oEPl7C/SRwi9NvTnLJtv76nVUpQouZu8xhHt4QIt/6bc3tpE0JwXWm5QQU5luO+JGgJw8AoshOEeH7RCyaaJj54UTjqXhsK3+BBJ02eWLHBwnKM9lwZGyH5hD4EmUwD5PoB97Djij4DwTATpX9nY5wCo3Lui1YsP/mljH0ri0oWn0xKELd5pwKowTxlw/Yn6GcP5yIK+u5HfT/3oYLMfuXEJBkJdQfhpMvaYhGjymDX/X4xfgGnJQcykusmsqGtHCUdd7pt4uJr+z5+c4iNPfrpoQNajoFRz2S3XOlecEvFgvrzQ6EoQTxkRvrvjv4oaWlKHM1C+N23G9fAy+DIsUZhB15amoB1leKNRFygKksm76jr3BBNo10NZfU81IYWTxXjci1wNqgvAoVD0hMcJPjRhLPisBSMFN4gEyDzCoL+yUojC4iIVotCrRdwG56uCmnqDBYIRuMREvMJ6V3iNDbbsQkp8B4kjYDgXgiywP0aChDV9kyL2nA3Lj3TgUmlwUr4u+yia/4/EHd72FWArpjAAmwZ7Uzq7f9gaHztuGqSpubZ06EwOgOkfkuSSfdOtnDyNPydp4k+vvfOC4AdZ9NHuF+vuL5IMp+FElE3wD+c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Z1wDnQjzB2GbRuoxyvMuibX4oqpxClYb7HY75j957QD8toE2ewKUtYm8ojcd?=
 =?us-ascii?Q?x7W+fW80Ups4qjjgw+LTpLUrnSnbjZoJ5vdtuolzrPs3QBuMrjXij8vGyNzJ?=
 =?us-ascii?Q?3ZBoEJ055gy46WGKRx0k6LYslypUJEaobgXRjeUmzh/oB/UdPAdI1PIgO0EP?=
 =?us-ascii?Q?b4X3AXOjHdJtNwNj/LC0Qo7N4++SQgZ2th9igNPoRL4uM6q9/DUcDjI2kIfF?=
 =?us-ascii?Q?jbnFVjtn50dxDXV0Uty48M+gOcdp80vk695Sb08/TDbEuktP4/cH8vj7ncxj?=
 =?us-ascii?Q?c86xolnKJ+BgUXIzmyQvNvbgRCjdX2Xt9PHrruqGfAQwP5A3d4uskDUp2sbd?=
 =?us-ascii?Q?6UxUrhHif/JvlBAnhEAx50x28ti/2s7LtHckWysmSJoJS0VNTcajYxsOetLf?=
 =?us-ascii?Q?nHyK8lZQHS+/n2kgPgPGEb81TKCrObaUhenUFRAl31/ktviywEjOwGi0xxo6?=
 =?us-ascii?Q?gIkRBp7HX8AEBW8QwyLDl+FBQCfGPGLToA+fD+IUVPtYl7NMjWvSQiXX1gXA?=
 =?us-ascii?Q?vpm0UkZP3r3zz51L4ZCS6stS9ySKRw14L1gReQytb4Jj5UXuR53AelYKg1Rp?=
 =?us-ascii?Q?tRxpMboXKjxC/9jvmZJIoQExjE4Rr5H3wEFR6VQ0evAb1tzHztOYOg9wH5QL?=
 =?us-ascii?Q?BXDMCCoc+kzWLT2Oi7M/rWRhArseLZhsXDWiuQnE06qJ8sku07og2WWjP2bk?=
 =?us-ascii?Q?gNzaw00XPzJuumyxDfQXJeCIyOCcV62azum/dYrDjhN+SatSA+bcIShB5gFN?=
 =?us-ascii?Q?nMvk1149bCvhk5a4e9f09W7sjq0Xb/c8t8eklCSJxVtmuq+n+d4uwO5T2ym8?=
 =?us-ascii?Q?Ms5cUUp+NQf0MqNrxwz3CGhdL1GVu/XjFRPPA5otROB/+n+ERIju0kI561mQ?=
 =?us-ascii?Q?1xAepQa2k8imLbrsfZ8Ve66GxUcgolru9w1VvghIIjvrIdDaRWjBYwCeiGh9?=
 =?us-ascii?Q?ZYyzMcXGebqUOQeXHqC1mOOzu4zx2xZV73KRxwhQwJc7yIrRh29c+pyglgre?=
 =?us-ascii?Q?usY1E5CpoEg2TmisMSwGUYPt8M1Kwl+cuiSMnE+TaUdQkD1if6zgcLyXhLWg?=
 =?us-ascii?Q?7G09xEeyIL6GDYwAi1ItxVqkASfnUrwQf5Fe81FsULnjwSUJBEaITB6ikwCZ?=
 =?us-ascii?Q?I0oIIOJvKZys0O9JsLv2RCX1YvZqmkYAAgJshKDCjKKlcbTghBtjc8vRJol4?=
 =?us-ascii?Q?FDY+s9E1sJw+Y5BqJ2VkYUkW+Vn4bQSgN+WA9Qp65y1d2aIQVzjKVoeImW0E?=
 =?us-ascii?Q?nMk5ixXB1MdRaNqDvY8W1br6RHnCEgsPGldAw8OAAYm/CYXWky0+plmwsmdc?=
 =?us-ascii?Q?sxnFgtpVnN89j/++08XeBdDBjrwMqBG3JPo/b6h7W2/l3XubXhHmowIORLw1?=
 =?us-ascii?Q?AeE5Eijvvy1qKfoNX0FKGvMHdVdwTB9EEXmfP39IsWOAmbBnKFCpPZL/xl+1?=
 =?us-ascii?Q?QubInQZb+n2sUzZC4xI2HpJChb/Y0Am4uVvZVgxZxC0xiol/AqpRZL1x+pnd?=
 =?us-ascii?Q?yp65AnO5rgTfoV9nBY8YIBin+ruVlhVqmCj2pjJ9CBWSvaAVt1zG2bHCr0FZ?=
 =?us-ascii?Q?01BCHJM943QstfqUfQ1zO2eNLkU+82xS8L6Mt9Sm2n6DHPsH9mghMbx402Lw?=
 =?us-ascii?Q?+gT5GMgpF4EGoXm37pk1kO1JCMXpEq3a+5zy32Ry27EUiHubPZTsuMw885OU?=
 =?us-ascii?Q?fHuF5GO/sJC/bcYvpCt4hbgVspkWHpEfibfzFTMxOUAA4yYlgQs9kiOz/+P7?=
 =?us-ascii?Q?5Sk9lODUH2+wACrJFC+s5/g+ZRP1KVo=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: bbb4b53c-0385-441b-f1a1-08de899f630a
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 12:17:58.9069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Sxfmj4OYMTF1qLBowGvsFQHZNpWFZXzd98kDlSly9CSd+6yT8J0TbbPosJKCwqfFa8BET34szX+SBGKn9jYUzOGV2KHBcFxz2V1QGXGVAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7802
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 12:18:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125557

From: Rasmus Villemoes <ravi@prevas.dk>

Just remapping TMPDIR to TARGET_DBGSRC_DIR results in the files that
end up in the -src package containing lines such as

  #line 196 "/usr/src/debug/fluentbit/4.0.1//work/cortexa76-oe-linux/fluent=
bit/4.0.1/sources/fluentbit-4.0.1/lib/cmetrics/src/cmt_decode_prometheus.l"
  #line 1561 "/usr/src/debug/fluentbit/4.0.1//work/cortexa76-oe-linux/fluen=
tbit/4.0.1/build/lib/cmetrics/cmt_decode_prometheus_parser.c"

By instead remapping both B and S, we strip more of the irrelevant
part of WORKDIR, and one ends up with line directives in the -src
package that actually match the source files' location in that
package:

  #line 196 "/usr/src/debug/fluentbit/4.0.1/lib/cmetrics/src/cmt_decode_pro=
metheus.l"
  #line 1561 "/usr/src/debug/fluentbit/4.0.1/lib/cmetrics/cmt_decode_promet=
heus_parser.c"

  $ find packages-split/fluentbit-src/ -name cmt_decode_prometheus*.[cl] | =
sort
  packages-split/fluentbit-src/usr/src/debug/fluentbit/4.0.1/lib/cmetrics/c=
mt_decode_prometheus_lexer.c
  packages-split/fluentbit-src/usr/src/debug/fluentbit/4.0.1/lib/cmetrics/c=
mt_decode_prometheus_parser.c
  packages-split/fluentbit-src/usr/src/debug/fluentbit/4.0.1/lib/cmetrics/s=
rc/cmt_decode_prometheus.c
  packages-split/fluentbit-src/usr/src/debug/fluentbit/4.0.1/lib/cmetrics/s=
rc/cmt_decode_prometheus.l
  packages-split/fluentbit-src/usr/src/debug/fluentbit/4.0.1/lib/cmetrics/s=
rc/cmt_decode_prometheus_remote_write.c

and that also matches the remapping that the compiler is instructed to
do via the -ffile-prefix-map mechanism.

Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
---
 meta-oe/recipes-extended/fluentbit/fluentbit_4.2.3.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_4.2.3.1.bb b/meta=
-oe/recipes-extended/fluentbit/fluentbit_4.2.3.1.bb
index b476206437..03f9e0e003 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_4.2.3.1.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_4.2.3.1.bb
@@ -144,7 +144,8 @@ do_configure:prepend() {
=20
 # flex hardcodes the input file in #line directives leading to TMPDIR cont=
amination of debug sources.
 do_compile:append() {
-    find ${B} -name '*.c' -or -name '*.h' | xargs sed -i -e 's|${TMPDIR}|$=
{TARGET_DBGSRC_DIR}/|g'
+    find ${B} -name '*.c' -or -name '*.h' | xargs sed -i -e 's|${B}|${TARG=
ET_DBGSRC_DIR}|g'
+    find ${B} -name '*.c' -or -name '*.h' | xargs sed -i -e 's|${S}|${TARG=
ET_DBGSRC_DIR}|g'
 }
=20
 # needed for shared-lib package config
--=20
2.53.0


