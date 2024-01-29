Return-Path: <Angelo.Ribeiro@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89856C47DDB
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 16:34:57 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.88])
 by mx.groups.io with SMTP id smtpd.web10.20099.1706546096232766105
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jan 2024 08:34:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticaltechworks.com header.s=selector1 header.b=PMP0L/1o;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.21.88, mailfrom: angelo.ribeiro@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A3fa+cB2/veA3zYMB2DA7B3b0AfcxQeeghRQC01L91qCdCg4Xy2fh09aRMHG+ASjFW5VAJ+ppfv60Q+k+29NlP7mJg15JCxiaVLyNlxi1iLqqIKinstABC6+w0AgUqOm+EnR3gmDd929EGe13j03XfzxFev56tVJITBJ133BgarKRf6ziJLJ6WThFIbrEXa9sgZRTfU5l8/Rza8GBnaOczn1GNlyZ9BHVraqoC4dRqhIYdfaqiG3oBxibDT0X+NyUWIAQO+5vkujq6ZTcoGRkHEZ2w98eeVdsYjXAVbfTLm44sdUPuaAx2MW6zc0cSAOEjLWVEky/uBuYb1CnyAwlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5nVlrC8wCU0o6xAGvpt0GOsukMaksCXUjSQQo1qNp4=;
 b=Fn5+XApDRxOtah2JFvqqir6FGqd4/OjNSdgyMxiCF9gNDZPwLRARFhopzTwxmTKY8Umr4KpQicPrrPBuwp4bXmgLw5FcqlUK/4xepFuIwBHcXeiBFLq7qIDymu7mJQ/rb/MJTr6DXchpFKS46qW9NwzJFsh3z6rEx9N8U/+ifVrdkAIQI6rqdcLg958twXm0dVLpYdPEvzt7wZBz/UlxP6NjtUXS5EEVYnEvht/aegIkZgWm1ECERYtWdZmFzG4AlOSMu2j7ve7Vzxgrml39CnMTCVmqBqqWdvl3jgCuBeZu7LrrZyblTiUYjEEXLhweRNCBasM8EApdCMrLcbxB0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criticaltechworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O5nVlrC8wCU0o6xAGvpt0GOsukMaksCXUjSQQo1qNp4=;
 b=PMP0L/1ou163C3LcxGrFyvFQU9sqnhLewGIFlPviloGKJ6flD4lbB7Gm0B14DBe0KNyxlcCbxAG8rIQMigZpIB7pGNNBuW7MDRNDTphltgsWZYGoQ9kcyMWY2q/I5PLNmcdL95RXyK87QvKK9c52+CsvSFlw32dBEt89IrFRa5q/kfoCSNHy0JFWVR89HZ/NlRTq4MnHQB9lxKfQh4qNpbVacZEr0Va8d+24OKT77oQIDN5hurWhN9WoTC+h14Dawk8mKMYBWnxXUQqpLO+dr4YwtOuId/vrrTY3ie23cOU6VXKWhUcOekbJShTc6m6AKE/P25TOvhbG06ZS0nSySA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=criticaltechworks.com;
Received: from AM9P193MB1651.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:3e0::20)
 by PR3P193MB0957.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:af::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 16:34:51 +0000
Received: from AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
 ([fe80::412d:4d7:fa21:8757]) by AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
 ([fe80::412d:4d7:fa21:8757%5]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 16:34:51 +0000
From: Angelo Ribeiro <Angelo.Ribeiro@criticaltechworks.com>
To: openembedded-devel@lists.openembedded.org
Cc: Angelo Ribeiro <Angelo.Ribeiro@criticaltechworks.com>
Subject: [meta-oe][PATCH] flatcc: Add tool recipe
Date: Mon, 29 Jan 2024 16:34:18 +0000
Message-Id: <20240129163418.143102-1-Angelo.Ribeiro@criticaltechworks.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0101.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::16) To AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:3e0::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P193MB1651:EE_|PR3P193MB0957:EE_
X-MS-Office365-Filtering-Correlation-Id: 91aff0a0-3925-474f-4dc7-08dc20e83784
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZMrtWqD+tzdl6NAI5b2BzBZTxWA3zT3gfwBRNp/qEt6yUKkY+VBsnCok+jy8KZZM45DkujL54yYtq5+15ENv8vVBcUW7Nb5mSN5FD/EsxzhGnhE1LiSrTtcUJGU2SjWgaa8pTBxsntfn9ajdnd+Es3GiudU5Y2ed6XV/fk0gO+qx26z7zBfjJpManq1XIJjIDlMHaB3CRMr1HLuyOaob1MALq51E9TTn1Ixw7ukwE1e3AdWJ3OLhoUslblq6GdDn0l2s4/aKn+6Nf9SmTxG7kc0QqFWcRsSI+7rO8s1KVMyQJ/RIy9+TDEuE12c08tgwxdhKDpaEXClofhGqEocz/lSh28ewxnzsEFH+/BNSmv9NM+WkcqGuAnHDCCt6Bg4YxV4g7DPgms8ACxXlGtVsATSmNpTe6XQPTO2czm4ZvpmV/FA4Jvd+Fw2ZlwQgpsDcdJErES2sUMkxXDRqxvLTj9LWPinSlkCNpt8qzCbLuF3fnd2yWT6attKcF5WdMYKstz1Wk8MJDhiwkyMi9KuHJinPYUBpS4lzPBysXcI66FLspLItKthUDZQDxtU6y++fTfXiqsZ33tMBaP+cnPp7a5djEdNWbA13kC8hox4TDTk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P193MB1651.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(39850400004)(136003)(376002)(346002)(396003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(83380400001)(86362001)(36756003)(38350700005)(1076003)(38100700002)(26005)(6512007)(107886003)(2616005)(6666004)(66556008)(6916009)(6506007)(6486002)(2906002)(52116002)(8676002)(478600001)(316002)(66946007)(66476007)(41300700001)(8936002)(4326008)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?f6w8ObL/p8ENi9P0vBarZ/vbtHuBdd5NSyFeCo5ydF0KeK9OapHAjCk8YEf4?=
 =?us-ascii?Q?0n9X9qSQxlsvEOmsK2uihPKYT10zyYgBgSy3u5jKSVQaHiJ66oG43f/fBqm6?=
 =?us-ascii?Q?/uPfUC/Epe/xa+QNcWkYja2/eEbr8pIRZ4QO3rTbjwO6s7PgfAOlJ6h8EP+j?=
 =?us-ascii?Q?aAMMHGDTd97113aS2wlPG1um77/1Incs4JOnRwbjPimD9m6c9vcKk7g0EkkX?=
 =?us-ascii?Q?jOFI45Wwpzt2733aUz3bSso+ZVzGjMTigzVqhpgKmz6C4iuNTr+86JNIR5S/?=
 =?us-ascii?Q?nxzPPAZz+aUy3d+jsjn/6/MflrgIRMI72z+N5rrXwvOVWlmhEc36hfEVgDT8?=
 =?us-ascii?Q?daHBo7tpBbVzEpxVfVvZNN1iOIkEMBnTp+d9y9v2OPq2XSyjei8B6+EQe457?=
 =?us-ascii?Q?d5zvitROv/6RlOSSU10x+VjBebGq7bufAl0vqZrrYEeDYmYcA6EhVqHOWtAv?=
 =?us-ascii?Q?fEBN7qSqS5WfOgobiyDZXOXLQDgksdlZgNXQyQUZikBAmuKETIURjtmTsl/g?=
 =?us-ascii?Q?ucaW5uYyOSBsYRiaJhGli5xvVbOu4RIbmpzfw2XSk0F5u8z+bPKJ9qQX19xk?=
 =?us-ascii?Q?VfHkmwisL2cFhHWqp1XVZAEc6QUaGOAyOOxtz227Yxjm+gJ32RNpDIgeQ1nA?=
 =?us-ascii?Q?UDnGkqO6cIUzkfkNAxGVgn9lLvlMt9iSP8AtbxM31lvNr4zydwDJbly8Sn4I?=
 =?us-ascii?Q?5ZG30e/GlH8ApSUwYxKl2TlsMj1OZ/6WnGFoQxJGmtZ0tczxkVjDEfnPXcW0?=
 =?us-ascii?Q?SDYeLObPkRmLUD8KADsxNlghbsPhQ4EuZfPbENIMUWWzOkjtz4GS2bxYR5+C?=
 =?us-ascii?Q?WKAJeCPI2qFmef6rvo5wtmtBKEceZk3MBl6kJ9ptbglkatISw+WTrYTb4POM?=
 =?us-ascii?Q?e/4vci/fAnOrhBtVCn5rHDosOhSMnSOzug6Sv0+gVQkTQlSsWZTtF0S4WDzi?=
 =?us-ascii?Q?zJGIQnuVSZd+9LVwB515na5bKNN3/1JUtvR3yWdZz+/Pk9sJ892IHmyLOObg?=
 =?us-ascii?Q?o7G8YM9704DCP53SSLdHaeT9f5RNVKwOKGRbenRr0J8ajrv9p7wY1q5/gc5i?=
 =?us-ascii?Q?TgCJg3P9vs+PhePxLinJHZvIB0aABMRDabaLbhi20mW3tYSKTVIDgkWaVG1u?=
 =?us-ascii?Q?X/65SGcNL9rSNMNziEJI2tWc6Pl/9mRlOY/z/HFlDztgd/JayaVf6AU5KXsV?=
 =?us-ascii?Q?ZrbfHRzZGuw7Xc8vLoxRxea1ZRr7H8zysHL38RKwrxHPmnPfYyDk9Am7htLy?=
 =?us-ascii?Q?ocH/2MMrKTztBllK0bfjQha77R7Ce6EGw5DGVGwCHQltmFhI0iIbX3nt6uEl?=
 =?us-ascii?Q?iwSpx6eqKc11ohsy83GshBXnrnO/V1FwdqFaCUuB2ID2JcjBRu1b7Bz7hONK?=
 =?us-ascii?Q?/PdBVmddKCaubdgF/2M5eV4E0gD6E2re5G/BjARsouAXAU4jY7+v1saxWFMs?=
 =?us-ascii?Q?tX522Txg5Z7gnUhIxlFvgPu2a7L1kkoCYFAsRGMJ5iIC+di3wt5yV7mvpfwy?=
 =?us-ascii?Q?rEAa5dJI/xuCMV6+GNop/5iNgGKlo1JAkuHW1jgBjQIygw8nDqvp1TmYS0wS?=
 =?us-ascii?Q?1IA/ggMOPScIEEN1QYgtRWIwwyjcSQY+ZkXufDI2mo8iz9g9J0eQiu6+Teeq?=
 =?us-ascii?Q?AsHz+K2vpqAdTceWhHQCwM4=3D?=
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91aff0a0-3925-474f-4dc7-08dc20e83784
X-MS-Exchange-CrossTenant-AuthSource: AM9P193MB1651.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 16:34:51.6693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U0dztg8pu4u1qcuoPtKw804BHNGScSY7XJYhT61LQfJXVto69Tnx2Jtb3Pnet9v3Tr4Azh6RFiteAeLI7HpuiSEMBtLYxSBQiT1OZm6n1GU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P193MB0957
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Jan 2024 16:34:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108487

Add FlatCC FlatBuffers in C for C.
FlatCC is a compiler that generates FlatBuffers code for C given a
FlatBuffer schema file.

Signed-off-by: Angelo Ribeiro <Angelo.Ribeiro@criticaltechworks.com>
---
 meta-oe/recipes-devtools/flatcc/flatcc_git.bb | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/flatcc/flatcc_git.bb

diff --git a/meta-oe/recipes-devtools/flatcc/flatcc_git.bb b/meta-oe/recipe=
s-devtools/flatcc/flatcc_git.bb
new file mode 100644
index 000000000..660a44c5a
--- /dev/null
+++ b/meta-oe/recipes-devtools/flatcc/flatcc_git.bb
@@ -0,0 +1,27 @@
+SUMMARY =3D "FlatCC FlatBuffers in C for C"
+DESCRIPTION =3D "FlatCC is a compiler that generates FlatBuffers code for =
C \
+given a FlatBuffer schema file."
+HOMEPAGE =3D "https://github.com/dvidelabs/flatcc"
+SECTION =3D "devel/lib"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db3d8fb7158bf7e2600ba3191428dc4e=
f"
+
+PV =3D "0.6.2+gitr${SRCPV}"
+
+SRC_URI =3D " \
+           git://github.com/dvidelabs/flatcc.git;protocol=3Dhttps;branch=
=3Dmaster \
+"
+SRCREV =3D "1653ec964730ec7d9892a08a1695ada6d20f5196"
+
+S =3D "${WORKDIR}/git"
+
+inherit cmake
+
+# Enable installation for target
+# Disable tests as is not possible to execute with cross-compilation
+EXTRA_OECMAKE +=3D " \
+    -DFLATCC_INSTALL=3DOn \
+    -DFLATCC_TEST=3DOff \
+"
+
+BBCLASSEXTEND =3D "native nativesdk"
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

