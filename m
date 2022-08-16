Return-Path: <virendra.thakur@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39082C19F2C
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 04:58:56 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.62])
 by mx.groups.io with SMTP id smtpd.web12.12086.1660625932462704501
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 21:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=D+/rPM9n;
 spf=pass (domain: kpit.com, ip: 40.107.239.62,
 mailfrom: virendra.thakur@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FslxadoHru+z8AwsXf/bEApcJOzBkG2XMEl32z9/OFCfnF+mhyilKJmsEa6U+C09gU9/14DA86WVWvDDaQpj78rWGrEk7BrHfBhoqU2LqYEy0miCRaQtZRCfErha9YRWc9bAJhoTTyoXa8/czICFNhO58+wAj1NDuqx1DqPo0kppPhaSroT2dhIi1GPi4v3ZbYq20Hd3c6ZccL7J5XFtGerF7qd+yN/Qdr2mZ1k++PJaGi2FhHsB+NwFqNcMq+nv1Aklh016QCY63MEeW11j7O6h6e3t84FjzBji/qeIUD0TmwWrX4E+rPCS81HLjOfBtiHHxebw5tcqiM5ijBH1Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYF9Y4aB4oJPcSGpJRbpqUcav+n6nFgsFhKjOw5BsE4=;
 b=HBY17NVPdbB7FbAsK+8i7IGAPU26/ZIaGNG6SVPKLwGm2a9AYKm2q5Hdel9GETlfrBj9mp4bU+3sPkkmSGtRzCGw89LLLaSrjXXCjH4ayv2XMB3EFBQOfp+mlY2tvwtIJ041w4eE/Hrkihs/qZFbu0PCXFE93sj5Y1aoEXaO4kb62KKRjD4sWlXQq75ZWQ8yOmaHoyNAzUe4mBBs/3JQPGRq351gZqpVJdNZZhGlc12n4t10/vQgP3ljmGnXjIxVfHwlnoHfBQGpceoeD+Y8mnX1UGpLbj+MCMFsB+9dbWrWZBgiaNFH/TXF7sEpZ8o6D3UCtTqBoyBw19Lk3tJTKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYF9Y4aB4oJPcSGpJRbpqUcav+n6nFgsFhKjOw5BsE4=;
 b=D+/rPM9nkbOdh0Mu0j+YH+eIBFwKNFp1XjkS9nRQd7cduXotqb2eFJB/IfL5m7p/CukiBWdN3xvJxop5pT+5uhb73aktnsTlpACAFIbz6l3JNKnmUvZFViJuvEr3AzLQk++Krch4SWV54H9GR77awLDdmSpZlYq1JRXv4SwTalk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:3::12)
 by MAZPR01MB6896.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:59::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 16 Aug
 2022 04:58:44 +0000
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5875:d757:2635:3674]) by MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5875:d757:2635:3674%6]) with mapi id 15.20.5525.011; Tue, 16 Aug 2022
 04:58:44 +0000
From: Virendra Thakur <virendra.thakur@kpit.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-java][dunfell][PATCH] junit: Set CVE_PRODUCT to
 "junit:junit4"
Date: Tue, 16 Aug 2022 10:28:28 +0530
Message-Id: <20220816045828.30363-1-virendra.thakur@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0123.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::13) To MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:3::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6ecbfb3-1999-4bb1-b0bd-08da7f43fef0
X-MS-TrafficTypeDiagnostic: MAZPR01MB6896:EE_
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bKpDtTbvTkDZ0bCvjUrlSdZKWFFx+dZ77QbyVSPOKtKOMBxrboOAJmm4Y2JrXLdZ2qJVH5xuISvcP+TdK2acbPa0fYxOq7PmIRDWlxxFcSO8TxbS9+MZHXiqxjHGlUOqpOpVtfrjiq4iWJhbEYE1a60chGERHNnmqg/xi3SJcSq+NbqjJ0PtOqzcffeZw8eD2pzB5YfT3gSeTmGysWJO4PL3EEPFFHRUC51z/guX4r8yitqYxi9fNUNgPijGh69Vp+/llxc5hQHq2dpuLYinxZerAUrj/Abz5hp9o5gweFSjks4PPlHOYOP+10TW1BJOOT7FMeULZTUM0HWHq6qNyphSFMGig4rfpwhyG17xd8SSA8p8PJJuGHxf9DJ2WZuTf/euiHnvTtCf9R4AgqIOlg6D0TDC/yB8VLWNF0o40XOvIoNDPSbFid8Wi8Srh9Gtj7h0IFaihMdoAgGh1NirrNY0rU2GuwsiY7CZUyqXjZ8J6ar1do2n6fzxVcLFHztioQ2AWJ799egjXd2a02xMSFNapv2eDUGRMXBioE1mWmexWjJfT6vnS2nYqZ6kgAN4zhSmIiH/vsh/JqQIr9KKhllNHIbVULzpAZ9myAgs43IpBxgSuq1sgytkEP5OLj+5d2llltfwlJw/YW8IIDnSnetJbCnotCtJTykXNfnIuUZhLSHaZZnG8Vmbjk1NMmUEt91nhodsHdv84NQ+CmZF0InG72drcxIS6m2lhcJuvnKI+prvMfSwGoIIBBLY+vq5i0J9Rw/afAsH0jR/3EiqW07w4V44vTycL2se/ilLUVMJyBTlrZxuDN1n67/xOP6QJb4zvnQ1vCgaCHZZW1TWpA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(396003)(346002)(39850400004)(376002)(2906002)(66556008)(8676002)(66476007)(66946007)(36756003)(478600001)(316002)(6486002)(966005)(44832011)(5660300002)(52116002)(6506007)(26005)(38350700002)(6512007)(83380400001)(6916009)(38100700002)(66574015)(1076003)(186003)(41300700001)(2616005)(6666004)(8936002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dEFwyeTxj8s+5EX2V8VxQVOEVZq1oRsv64F7wi1T02Cy70JROX14bIjWaVes?=
 =?us-ascii?Q?NrCMW+khkEKsnsAsNf0E5k8xuBerm9QKmt6p+e0I6ueS16WUyThTA5d4bJcC?=
 =?us-ascii?Q?FOXvxtPFjsF4qptr7vE2HqXg1mBf0ggmGnYynDMb+TFeqd1uhJd3bSq7Lbfy?=
 =?us-ascii?Q?yO2i7mcNNlDzOWUfQPylN/xS32ysFSVhY1a41eJYxZdbvOkRwX/NqXPEJNOw?=
 =?us-ascii?Q?BJWMuqzxwpfwhdCOyrQKOer01ltR8SuTpvQxhHp42m7UQZNIEITX/tpdVa3J?=
 =?us-ascii?Q?SGFsHikjPhaFwf4sRwiqIO0CCczjdBTFJ8zV9GPPv+UbTl/CjT9hmzRUlGGd?=
 =?us-ascii?Q?ZD/VYlOW/J9tKdgwoIexDfLx+HwBH8jyV9xXObAS3wg+LAQEbnC7+sIL8EEZ?=
 =?us-ascii?Q?zJP8HdmnudKv8kDJnF3fovsVOQFNJmKHlNJ43NAVyNHkmY5YQUfQoQAbOnWR?=
 =?us-ascii?Q?AjDM2AFdrgi5mMR4yJ7lyhWuN1fFqImfWHrGuxAMdIZ/zqJXxEO5msiLNxEs?=
 =?us-ascii?Q?ubGYw5aeLrCxlax+Uy2uSiWyesWlk+44XrdY7toDKJ0ehG8LNcCHvIFw9BMi?=
 =?us-ascii?Q?uQpOSuakMdfylSlGt3JQBjwImM5yZgDO0n7eSH6t31l9GX78/TAeW/DHjeTX?=
 =?us-ascii?Q?yjmOsckB/mF6bF//DNedAhSwoqmJghHhVO3f+9dEn9ubXhXHV0te3azEmIGc?=
 =?us-ascii?Q?drOUa8mRe1l2ELuvaQyTyP1VK5oyhH4BtXrIDmYf1nAvvR44e/Y2dvRwiK4s?=
 =?us-ascii?Q?h+O8tDpzDmAZqLmjZnSRoHHTpMpzoBTBxJdd2dUzvJizr11WspWOu+pRniD7?=
 =?us-ascii?Q?fbVbW3RuoazxpbkHCsaa9bDsE5/q6+bduPtvE5TbFSnbSM2i7rbG8GvrMtoQ?=
 =?us-ascii?Q?2Cdmm/enPFHHNCKMB/Gl8yutojrV4SrJxa1RbprgEKkINm5tr3jOGXI9qJtx?=
 =?us-ascii?Q?JjuXZPrJxlLLA9amYTdpNqzKq9K/D6O5K6zKt+wnF53AZFd0DcrKwiaFlLBE?=
 =?us-ascii?Q?tUiW260EC9ee0x973J+LOP5Tw+UGmL/70qdvQwAthqfHP7UImaEyEIKbBVxw?=
 =?us-ascii?Q?A5EVqtLKrSEC8UwOkfxNMbU/THVSIoQawMcVbD+pGiNZ7PhaRah+QZV5GhbF?=
 =?us-ascii?Q?nDMQxvWxlbCqf7AanEhFsw3B4pBmIrgLf1sG3uZJCzh9OE8Y99XdAipoNWFA?=
 =?us-ascii?Q?AJFbAiwC+PHoKSB/gXEZrpSgbgC16EspUZ27jBM2x4P6Nc2AWrN5rswadAs9?=
 =?us-ascii?Q?U6PuSiE99701QZLZRhNSm0Ii4cZ2RzBlOKMgHRmNxhyDiV2XOkeP0YecGZTX?=
 =?us-ascii?Q?RZ3cjCVgGXMf/1EgksSfaV1KKmcRnJjIVHUTGaDm+P1MsFcWhh42YYhcOsmB?=
 =?us-ascii?Q?xzj7PWLAV9VUfz3TAO3rAXBzVbiX3dumesJ5fo/138zqw0y1bJl/NRm1/S9F?=
 =?us-ascii?Q?9anDujt7DXCYON3YegnCzKKPiPiPSvUgb5wmDNlzWHg83ChuUYkSg2S10QvI?=
 =?us-ascii?Q?p1Fa/x7LIUvnZUTb67iTcFa/ulqqW9T/p0XkHYyBv5nS3gH3sBGtCUSG+yrh?=
 =?us-ascii?Q?YHwPJ7gg0ZTC03kttiVILpObK6S4kMn0o0J47uGJ?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c6ecbfb3-1999-4bb1-b0bd-08da7f43fef0
X-MS-Exchange-CrossTenant-AuthSource: MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 04:58:44.4632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 1RmpwGYjVrAYbVgsdymZ4H8rx3w6wP6ZeQDSyyb4aFw9x1rN2s5FPn+eIk4VI4ZZJJudPoOMcAaIn0Evbhe0EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB6896
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Aug 2022 04:58:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98261

Set CVE_PRODUCT to 'junit:junit4' for junit recipe,
cve-check class is setting default CVE_PRODUCT to 'junit'
which ignores the juint CVEs from NVD Database.

Reference:

Link: CVE-2022-34176 https://security-tracker.debian.org/tracker/CVE-2022-3=
4176

Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
---
 recipes-core/junit/junit_3.8.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-core/junit/junit_3.8.2.bb b/recipes-core/junit/junit_3=
.8.2.bb
index 57dd459..bb45af7 100644
--- a/recipes-core/junit/junit_3.8.2.bb
+++ b/recipes-core/junit/junit_3.8.2.bb
@@ -40,3 +40,4 @@ SRC_URI[md5sum] =3D "9b8963ba2147a64bd5f1574b6fd289cb"
 SRC_URI[sha256sum] =3D "aae23d20e6f4dc45b4bf0b10fedcbd209c100342a0cafce1aa=
07d2da6da1f24a"

 BBCLASSEXTEND =3D "native"
+CVE_PRODUCT =3D "junit:junit4"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

