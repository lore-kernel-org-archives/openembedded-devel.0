Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.56])
 by mx.groups.io with SMTP id smtpd.web11.4220.1608105819944877054
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Dec 2020 00:03:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=g+KE5YCt;
 spf=pass (domain: windriver.com, ip: 40.107.220.56, mailfrom: hongxu.jia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A1ue1HhcLEAZeCOqQxG22ZMm465360gIFMIAcmgfD/gVmJii7ySRPC+BwudQztE1edwRyzNBVWnt+PenV3sqtF4N3W8oU6GP4RooKHZbTjL7w3ygzhRNSo06ILJhYh7f5ZhNw6zsNIhAdLeqcm1BWKWpAFAdxMpuRKQ/GI0eHZoi9J41BM8aC4Xsj68OaQC9D71vrSuvFD3oJYmiOWCgI9iwJ1NUmVaFTDAMFDfPEeEh4pPyP5Oqic15MExkMVswAzwUdnAeTUvNj7VkIuKJupyDlQ8Gr7ouX7j69QUucVxKyDhP6Qv8Ag7FWqst2nncfEg4bAlC4sqt9yfCrMJCSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KB2wcj1DXkfOdytgZ+dzCexekxbwAEXb8BixF6BOPtY=;
 b=afQIrGkLKWL6LVXPti6c9uW660ayCF8cM12cqYtRSsfO1OfcwoALeqmp5exc5rijnUGSfPAmhXbtNa9JCz6juZEpfgA+1/gWkxlpgiT2HOZHNA7hzkAOY9CF3cQH9dwdzkWU2xLzyxZSWXrSDI4CXbtQCNPNPDZGJjanjjasZuVXx516yC32WH5ESMSpO5hwOdjP4ZiyMGx3+A+fBK5Rafnsmp6NmrMs0/g66/sV1/8YvnkEriqCVSQ8SNmBdgbsjf0iit82tW41sCaoJDCmDl0Gp7by5dvA1GIhFuN/fwdr8AiTQHx4MCTt4+ReBV/IB7XqD3h939U3gfCbYl3b7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KB2wcj1DXkfOdytgZ+dzCexekxbwAEXb8BixF6BOPtY=;
 b=g+KE5YCtdSfpK2D/fcSOKZBQn86uI9ZQSZuJGyxOyccAhnMC12TXvQo4HLdDmxDrPj9XIG+8l8/MRMD4Td9zQX/YVodDDOiiYJr7xjjeJnsntSi7dzv+Qk75JF0sSio6sJaCSN9OR5d8We+GDMD2gonx1WUHH886c6p7cawi2fM=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB4380.namprd11.prod.outlook.com (2603:10b6:5:14e::20)
 by DM5PR1101MB2074.namprd11.prod.outlook.com (2603:10b6:4:50::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.20; Wed, 16 Dec
 2020 08:03:38 +0000
Received: from DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::15ab:1cac:c06:c1f8]) by DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::15ab:1cac:c06:c1f8%7]) with mapi id 15.20.3654.017; Wed, 16 Dec 2020
 08:03:38 +0000
From: "hongxu" <hongxu.jia@windriver.com>
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/2] python3-wrapt: add native support
Date: Wed, 16 Dec 2020 16:03:23 +0800
Message-Id: <20201216080324.14442-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.18.2
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR01CA0069.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::33) To DM6PR11MB4380.namprd11.prod.outlook.com
 (2603:10b6:5:14e::20)
Return-Path: hongxu.jia@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp1.wrs.com (60.247.85.82) by HK0PR01CA0069.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Wed, 16 Dec 2020 08:03:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3292e6b-6779-411d-65c4-08d8a1991897
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2074:
X-Microsoft-Antispam-PRVS: 
	<DM5PR1101MB207480284C5EABC4915F34A794C50@DM5PR1101MB2074.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0KqIiIshUTG7fM62jSUN8AaRvm6JWBFd85dEUW9XFnjdgErYs5mfPQsP4OxH6OGgYhia4rI4d82Zylicn8BQq0eOSZF8QbidZHoEyKwPn5XWi4qidW7ICmA+AgUIWfelbyNmlOXPcgHAgHe6C8Fl3BEEj+tDI9uuvY+QRbIgdRaubH5/y/1glb6c2Ad/dzkIxdR3In2vEiVKJk8AeQG5Dq0I260LZcqzWLwwTnmUkyWrvcHaVXrfjMos4pBhhrjY/or8o8tZiITh17sls116HGKrwysd4N4LB8frFTyT7ezxrdwJ0UxSssruTfhYUraR
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4380.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(366004)(346002)(396003)(376002)(6486002)(2616005)(316002)(1076003)(86362001)(2906002)(478600001)(44832011)(186003)(6666004)(6512007)(956004)(52116002)(4744005)(66556008)(16526019)(8936002)(6506007)(8676002)(5660300002)(26005)(36756003)(66946007)(66476007)(6916009)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?4flmP2WISKZyLSA4Ro8CdQj6zgxYkUJGMDKbZwONkUOfN+xYwOG4ngQb5Z/1?=
 =?us-ascii?Q?27Ds07wL6E+vmuClLs3WHVmVpEALE/OIqOoPsJ76DuMO0GAbP9xLIaHs7QLq?=
 =?us-ascii?Q?RSayXh2TuTXKy3/MTbVuGqWD75KV/OH9fQWpLqNzB3C2ax9HsIo9VcxSNw/F?=
 =?us-ascii?Q?lcxEHtpzwLe8uyKfABIdVChzLw1EYBhj6zf1AF3ZoihCb7RYKefIwAnR/b9I?=
 =?us-ascii?Q?jmgzwo2n4q7IY03YPSMSfRFPBvjR/YmIKLf36kQaURMvL12R7fHieKYJwxJG?=
 =?us-ascii?Q?QFF9EYJpRkcPsYUxNQ44GlF0Odbxwy3ksgSGbSLZ3nfweJe4Y9TEHUov84oY?=
 =?us-ascii?Q?6dKjUGhu3arCZ2AgkQD04WS/U14Hgj6fm4SOXzZiNzzE8KTOzoHibaunoJoX?=
 =?us-ascii?Q?sj5li6CSaPylcK582US/bAZ/MZyjWeohwgEEakWNcmPriS1KxBsUstZWBJDK?=
 =?us-ascii?Q?adfFQvRGvQYWN9r4pIw+QIXS66bGopqgwEkQJcnWz/nhHc1FdH7pVAEud3lM?=
 =?us-ascii?Q?0JId/6Xy0BfmlsqiFSN2UpOL2XXxbWWJ9/mHtyIZDdq/Y0x3UH020JZDMMSE?=
 =?us-ascii?Q?nxKewKDO6aNjW4HVAbsA3oA9ePf0nITbu3R+GSraKs6N9xUmfhKVqc5+IlD8?=
 =?us-ascii?Q?i/49gwnfCS88mDabjy77yzuxmaa6zoZz5wlPMckDzpZB6Yak47/b/RDvH60f?=
 =?us-ascii?Q?LHDrgXxbZT0RnLpnaMJv9JeoetjwHzxr9HQe47ga6d0BUoh0+1NwMg4JAeR+?=
 =?us-ascii?Q?dQ8gtAarH+EshuHaS/TTCdXleKQtodmO2oq6oTLJQcROwpTn4Q0dU+f6+icV?=
 =?us-ascii?Q?ayMcP5EYT7WbmZYfbQq7642MPAhAQ0lcsZ1buuiuwflgPaFzquYuFBpH1v4Z?=
 =?us-ascii?Q?xu93L32p2bOeLRtfNaQ0KbjqrFYvGRGHOzwsNcrTl19B3zhKUhXBWqa4y0F4?=
 =?us-ascii?Q?EPEWrVknatlVaQdPMHmZLl+XdmQvjdTa+GRn4iNiwWXJWrsGi92+rPbsbtQZ?=
 =?us-ascii?Q?Kw4y?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4380.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 08:03:38.7308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: b3292e6b-6779-411d-65c4-08d8a1991897
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mhQW8AbNPdrjNZzfqOvZFCZ07XEBzurBItp9EhY/bUq6bjjag0Hg8tnkjng06UrWe9EsOT0IfW+MAC4xaQKYSPh7Lomj+JZG9YGKFJLBQdw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2074
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-python/recipes-devtools/python/python3-wrapt_1.12.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-wrapt_1.12.1.bb b/meta-python/recipes-devtools/python/python3-wrapt_1.12.1.bb
index 49fde1003..bb9b95201 100644
--- a/meta-python/recipes-devtools/python/python3-wrapt_1.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-wrapt_1.12.1.bb
@@ -13,3 +13,5 @@ RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-stringold \
     ${PYTHON_PN}-threading \
 "
+
+BBCLASSEXTEND = "native"
-- 
2.18.2

