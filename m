Return-Path: <Angelo.Ribeiro@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6780CC3600C
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 10:46:38 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.63])
 by mx.groups.io with SMTP id smtpd.web10.18116.1726569991033164236
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Sep 2024 03:46:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticaltechworks.com header.s=selector1 header.b=gF+YYdDi;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.21.63, mailfrom: angelo.ribeiro@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B2us7neLnY2HLtPiEYa1gjtEq1tCvqA6xRvQBh6eTPnc75HxOdWlULTR+bcFFBrn2cloLN5/NAp8x2JzRKi1xmt8zIem1ZHu5tsxT7Tt5+1L/FalQvZScGH49QwIbC3FLgmdjzVLy2f4u7Ve70jg5zjMGGHBkXi/eQ5JOq/8nEQGHMUG588eL0qUdG8nOSyFwG6Qqha6ULMFG3Ru1/1fOhSMo0xPoQfWj7mXeU325U9O7EaXR/nkiAa5L15VQjuR8JHkADfkiLxZDdbUeMZCqMYmBLByG1rfKW37UWqHmjV/uMGhOwqTINCJ7CUsTGuuyf/jl1+OlpXlmEMSeceIiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HDSoyX7VMwashLCe+s6rr8fgdXmEJ5INYZqkwbnAe4c=;
 b=Oc/4aAh0zLYk0uNwJVUy02Jy/s6XEE0s862jkT+YIYb6Jr2ec/ZY+DImLtsdg6LFixhTmwvJxrbhil1AaB5hDjJGrO0rLqQVd/66RC+ohW3rg/uB+DZtsOhrr0gIVEeVsjXr45f4v5nabb9wsWS3v+ivHbe1B/sfCbQidPILs1X0YPClXNgJ077oAjvZ3NMFvo/FACovSCu5dX3SV+6bxondWoPzUmtIdBI/2mfR7Zt+JqbJYwwjVWEJdY6Z0bCcQEWEywaxIz4ZnEnPv1ld6yG+97acEgsgrXEyTxwv8uuT3tnyoj0N01sYIK4LE++a33hVOPH60AhRBl6dU7Cjtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criticaltechworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HDSoyX7VMwashLCe+s6rr8fgdXmEJ5INYZqkwbnAe4c=;
 b=gF+YYdDiPOfXY+Oax1kesHg++QtOoguiDsQFfEKIzStvXEf7LPZc7iaTOf/M8+R6lFlk+ngUswpfwySIFJ9TYPMavQfHvtafdfsY/VVbz1f4a8SxPdf2PqvTQIcUqGyiQBcT5DVIsBjGXqsuiiaCVrZpqcOTvF8SldGl4pRR+nil9WXskz7bMojHvnm6d57gb8TLrIBb3UOdZGECZBM1FOBCAjIeFkDn3a5NGxHbd+YD/rk0/1GncvfF3QkQ5xJTpZ7HbREFaqT47Dd8OLrrFtrS8AuNUsft8H8Zk4xOf/fPu6Sez7wyi65bVSqLabMKibwHS0U+v0ufI7OtNkE84g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=criticaltechworks.com;
Received: from AM9P193MB1651.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:3e0::20)
 by PR3P193MB0618.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:3b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.25; Tue, 17 Sep
 2024 10:46:26 +0000
Received: from AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
 ([fe80::6030:cbfc:2907:451f]) by AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
 ([fe80::6030:cbfc:2907:451f%4]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 10:46:25 +0000
From: "Angelo.Ribeiro" <Angelo.Ribeiro@criticaltechworks.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Kjellerstedt <pkj@axis.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH] libdevmapper: Inherit nopackages
Date: Tue, 17 Sep 2024 11:45:50 +0100
Message-Id: <20240917104550.31718-1-Angelo.Ribeiro@criticaltechworks.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0186.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:344::15) To AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:3e0::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P193MB1651:EE_|PR3P193MB0618:EE_
X-MS-Office365-Filtering-Correlation-Id: ce8e446e-5073-46f7-27da-08dcd705fa16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/DCLVtcs3rpTIF9XrzZMul1G92QJaeNDIrouDzk58Ox23xL9PCACD3VCnLkS?=
 =?us-ascii?Q?FhsWTThEyu0ZvHmprlhoxyZEinhVqnitznej4mKr44vWVsn7TJEnShYJfOaj?=
 =?us-ascii?Q?aHui49Ff1pfcBPuDTiu7gELlYOWMhrRIBMF3RhWJp5l+91kEl96SX2dy6xQr?=
 =?us-ascii?Q?mTeZITPcH/IAP1kCY/07J4AJC/uPbVZiFKqDIZT6ZB+Dg3GEVa5jEhGXphIi?=
 =?us-ascii?Q?7bGaeab83sDkcr7HUOsxaPb+tzzORF5oshE1oEvqI9psYNvSjEP5cY+CBrJn?=
 =?us-ascii?Q?TJIpMVpWP1ltKiBWFyzDBqvrdmfneEg46IHW9G9EptMkwS75Ezm+mY3drzrD?=
 =?us-ascii?Q?EEdgpSijP91vnFrmjcTVBEKTlHd7Xdtd9pKHTkx4yvu0jyW9J+MOvQkkYGMO?=
 =?us-ascii?Q?E/3p0D9sCyPrep5R70CKseygkrsFruWusIP+mpw4gu1sQhE+u7EC2KMN9AQZ?=
 =?us-ascii?Q?qwcjGPs9ruzg9qqIVnsQ8PT98yXaEEn+FdAxCMuXN4dHbzzdLUOdXo0XGlA1?=
 =?us-ascii?Q?j/yekyf3EoD7pCoQAAsuBNdWnySiGl+xW1z6HlyhNfoPqz0Z7ikSsRkDypQP?=
 =?us-ascii?Q?pHSaGOgLUpE6g/acWt2eshnkjg9K31miqsS31BbOR300kui2SLtdo7hKiS+V?=
 =?us-ascii?Q?mzQ8Sg0oMKhZU/5w7MWvxVE3i1h4i/DInkxvcLMfdrbXQbszuJxXlg8uZa3O?=
 =?us-ascii?Q?aG7KV47L8LpsvDiUFoWIFwPhovwwfJHoylsirGwGYBly1Sr6UfgSbLc0wHUw?=
 =?us-ascii?Q?uqvPrsME4qXJmhKdpg0t9rSs4JPeHOtTsBIK+w0CFtjO5ddplFKN6pGd+pbB?=
 =?us-ascii?Q?PdOOG41HrXtVV1tEIAXIfgZCkxIm7k2Bu+edb+yMglqZ7SBvoYSPFKIT0y3M?=
 =?us-ascii?Q?ymjoGJVTeqjf/eUaLc0pWDRGgsgqg0Lv8nsCv+DF7Dm8YxktcWBnQbQFzqqN?=
 =?us-ascii?Q?7Mn96erKEa1xEsqMHaYk7WQykrlak5WUGIB4mGAem12pCVCeFfCokH9/Z2mH?=
 =?us-ascii?Q?NBmlc/3ETAerQw1r4Y0BMM67QBOtlewwfLQf7q4chC5+pS4HEWPXSxkthG/S?=
 =?us-ascii?Q?o9TSGKaC/dSvuIAMAuI93lbiFQSLjcIUk4iO1q/biDzMiV6ifj6kpkh9IIqj?=
 =?us-ascii?Q?lWBlKYtnuewtq+0hkrGp5XMjmkMe3fNgk5bl8ZXS6R0BFyAX5XHSkt6XKEMq?=
 =?us-ascii?Q?mAO9bENzQBixenvJwwq0ttJ8IqIrZG7FU4YieeCEWhn7y29IT9mawR0Sj0uB?=
 =?us-ascii?Q?QDiJL9iEDe1kfSulmKpY2jhiKACBpRa092soFn074NTj00sBfnKILRSDxvSq?=
 =?us-ascii?Q?8UOLlAdBH1Q6woSZzWt518NocM2jM3f3XyEGrFYiM7Rnkh9z/rF00ifiRPUm?=
 =?us-ascii?Q?SC0cfIdvqIpEpstJUrtpy2WtNhthvSFusbIpFXaQkKRk71zPSQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P193MB1651.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?99++BpFQwfLGMiPCpJ9u+MrzNrkknLa08IuNhJUMaBzsJinEk+74VqcqXdNZ?=
 =?us-ascii?Q?gZmdVCR/iWr+vI2TED4DTWEv+K5dn2Q6Z1U+O1Kf31zYRT3flsO03GozchMu?=
 =?us-ascii?Q?1X8H6QP6oeaNOt++FNke4sNA9rjjH2Rk7Ok9/BfDuuACoLrgD2Zw9t4aLLhg?=
 =?us-ascii?Q?XR02UxdIVK44xEhX4Fwk7kKyisWMByN+GeblOi4Sirbo65IeowM9br7FUwfF?=
 =?us-ascii?Q?KIex5BaatG00Kg0mSE1l6I+JbxesZ1xm1HDJzg8UymZi//NXNNQXpBrNdeKM?=
 =?us-ascii?Q?y6LGke1vLhxkfvncT9z9LbU1b6t2pEx50p7qi81G4MsLIjEAAPcE/9KhxEnf?=
 =?us-ascii?Q?0gwiYrD0DuORpDLHbo0o+xnF6iJeQhhraVtnAmxWVE27Gz2Lsg06uIm6uskY?=
 =?us-ascii?Q?/vX5rxIb0NODRUtrS35syfzPqd8WGgFc4uE4x/hucUMn3yrGcHUtB99lbZX5?=
 =?us-ascii?Q?Y2RybeLQocXRbKParcOt9FVv0H7CLlkPYOKKC8OaUJJ7hzZEFGhTZEnOU2U2?=
 =?us-ascii?Q?GUrpDuW7vGthUQ10U3NoyiYu66JMmPPQjUmJdAy55eheSCWZSy0AtAXyNNbJ?=
 =?us-ascii?Q?T8/yx4td2kVaGwSz3b0u7RuIEPShBPVX/szf4Q21Tnqf2/hoqXYh6Bl0Srne?=
 =?us-ascii?Q?cwnf7HQKbzQrp43qJRNZMZYSMg9wUCTZDAnYwN0hHEUBFYTqqcnUgMao8F9F?=
 =?us-ascii?Q?WttM0FdjGzsTB+eEsGsBGYbtJlBzndOe9mDX21pPvRZ2we/OnjukkUc7t+P5?=
 =?us-ascii?Q?wt8RgUEDzqvX125tAhYnJGKFUHQwH+CKnvDRU8ee53vilaC1Hrb4r6TCC73a?=
 =?us-ascii?Q?XgocSPu1QoXaC+YeTr3WVLoMrFvE3WZYd38w7LH7A/gyTSiirrMg7YQ5vUVl?=
 =?us-ascii?Q?gb7zz801ttjqRp3uyAp3r1lhpLFSPAGSoiFBRIq+/n/IdjR6klbfGnqoAbzO?=
 =?us-ascii?Q?vN0TvNZ11c9sYxH1spCBHw1zGHqV5PHypFkdFIruY3ducKZ9vssL8M4DB2VL?=
 =?us-ascii?Q?HEtQ2GtNOi+s4HL2lTfTGTerwmtGX3uOTHhkYNL5mOBLZfpFCviyB3Hpw4qH?=
 =?us-ascii?Q?JmKvCJOXKLrKT/r/GZheJYV2yaom2Q9dtB8IhWGwdKBV0bw/Ca7slktt9oFf?=
 =?us-ascii?Q?Xy/eQJBB5W0AydTTCR5UEL8cQHelYMwG1/+thF2qN5Wx5uC5PJA5AbtYBosH?=
 =?us-ascii?Q?V8YIR74iGbpyWlY1fKx2M82b1WPrs7dBBX7a6E3c8ATC/tqkpzQiQ90adKOZ?=
 =?us-ascii?Q?sfJFC4vDPsIqODXo5Rz6e8ErwooIfky/WLi6sQNKRzA8Ttemxkz0uVKum+Zu?=
 =?us-ascii?Q?YLet0gtz2KsRtIXTOxHEizBB7EbGp9GbiCX92SP02rhsyJSvlb0yQ1XZMkq4?=
 =?us-ascii?Q?2IpkMdKoza0xNUciKOFSG7j0sNUxmY3BK8laz3smZSpZ+6DA9WGT0XkK8UtC?=
 =?us-ascii?Q?YqG+FVt2tNBbLe5HkdoUhnvsX5zeqNGNhSF3dnZmcRun3rFX41gts6Y+B5n9?=
 =?us-ascii?Q?+p3BifVzVkLjs+9oIuUFVxRLsLViI9prwLz88bSCvEvdT9zhxfCwt0M3uWPX?=
 =?us-ascii?Q?1p0zjwb4IuMohnjgEABHwBCW7Vo5Nl7I68gaLC8Y7VHL8FUJoWji8iNS0XfG?=
 =?us-ascii?Q?ug=3D=3D?=
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce8e446e-5073-46f7-27da-08dcd705fa16
X-MS-Exchange-CrossTenant-AuthSource: AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 10:46:25.1457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Op6EkoUpKAubZoU5uLULZKKm1HTkyznkD9IpxLLXaLZRqG5ORWB8QUf6e2s8vuoyu9xwThjL+ridb9XLn84imQzsscJVaj9uSOoX72XkDo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P193MB0618
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 10:46:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112342

From: Peter Kjellerstedt <pkj@axis.com>

This fixes errors from buildhistory changes where packages-split would
be empty.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 90f96e053ad3eefa7693d9748efdfbfa72d7dcfd)
---
 meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb b/meta-oe=
/recipes-support/lvm2/libdevmapper_2.03.22.bb
index be558ce1d..3b4439c3a 100644
--- a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb
+++ b/meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb
@@ -5,6 +5,8 @@ require lvm2.inc

 DEPENDS +=3D "autoconf-archive-native"

+inherit nopackages
+
 TARGET_CC_ARCH +=3D "${LDFLAGS}"

 do_install() {
--
2.34.1

The information in this communication may contain confidential or legally p=
rivileged information. It is intended solely for the use of the individual =
or entity it addresses and others authorized to receive it. If you are not =
an intended recipient, you are hereby notified that any disclosure, copying=
, distribution or action in reliance on the contents of this information is=
 strictly prohibited and may be unlawful. If you have received this communi=
cation by error, please notify us immediately by responding to this e-mail =
and then delete it from your system. Critical TechWorks is not liable for t=
he proper and complete transmission of the information in this communicatio=
n nor for any delay in its receipt

This e-mail is environmentally friendly, just like Critical TechWorks, whic=
h lives in a paper-free atmosphere. Therefore, please consider the environm=
ent before printing it!

