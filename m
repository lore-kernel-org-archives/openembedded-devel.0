Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE4CDEB64DD
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 12:59:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.15466.1687957138852889421
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Jun 2023 05:58:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=TlJmgrJn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=654386a0a9=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35SAj2L0011133
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jun 2023 05:58:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=0s+X7EObBZmLAF2SHE
	jwP6meIqnlue+gpJrSVks696w=; b=TlJmgrJnMkfT19h7xatV75a/tSaRHo87NM
	k2fk9njaO3DCv6EFSp6LUx2o6EEaMd0YGU7B3klghmYeTnnmGS+uhmyBnuK9Mw1p
	hsAt3fNnTEXhfCq/qAPd08CozFtXTHKZgP4PF5pdVJZra3cs8wUaC5V7HkoEG5xH
	d+lnsqMugKs9QC9j8vhqxHD/7aCLa2DIko+a9uwe5Nm9K9pLprqp1EkicwQluwT0
	v6UvcRl+WFp3ffiGIvAisJd6HNRIRedSBnGY2TIBXOsHEfE995+Acf7dMOtE1/h2
	+b/PSfSE55DoAMTf4B0OqaHuTQDOMTlWDQTNPjOLGQffmSGUWMWg==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3regfb31e2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jun 2023 05:58:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9QxCRnOjYHffM+AM0atRg9Y2XTW02IoVYBixSnLoMB7nIjkS0W/ttc+XTG2HcilLqAWsabPdjpaOrEjWuJ/jC1IGlSSbLMOJ9TYgxpvCOwPfv849/DsHZbSujZoh2BFdre+9bpmfyx/zglV9dEBzHux89ythZfH+CpnBCH8+J0ODvN4AV8AMr/3JIl+CvBMFh5nHrWYEi4yNK7y/Wmpu6BnrA+kMzA496qFbNANa1ckryODx8Pal/yFDoZVYk+olnK05ihF2mX3Lh9BE1ou8x5xOGr3elJuQh45+dpYjmdc+/1pCq1YbPeLs+jyVG2weZOxKA+ltSfDyukl7Su4rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0s+X7EObBZmLAF2SHEjwP6meIqnlue+gpJrSVks696w=;
 b=ZsozkWIxI5AZ8gimRfudcLSe6/3bORegcz4wfnmrI28hAs4XrrL1tdU/4NiAB5IyQg7JiZmB+E0+fYFXyuf4Qm2+oxBEvhPlMntUxvGtouU3vYXQH5bBJVLJYFGu9JWOv9kWY7xhA3hcdKkkWONRDD5uzUimy4AEJr6FHKQJJblu/0DLUw/KfzMYFeMNVE0/fQPW17f+M3wes+YcgoFBu2q5qNw04odrHg4Gl2CzeaVep96KOFlSH9ArL7ukQPRnt1oXTBJN0WVLCGHoDJDKap/eV1xXV/Wwp6g274PurYzDfau7x+8UMAzJno5zxh2JneL3x3baFtmzfPgmGaoQZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SN7PR11MB7114.namprd11.prod.outlook.com (2603:10b6:806:299::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Wed, 28 Jun
 2023 12:58:56 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::60cd:a296:6dfd:e0c9]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::60cd:a296:6dfd:e0c9%7]) with mapi id 15.20.6544.012; Wed, 28 Jun 2023
 12:58:56 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/2][mickledore][master] frr: upgrade 8.4.2 -> 8.4.4
Date: Wed, 28 Jun 2023 20:58:44 +0800
Message-Id: <20230628125845.3702881-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0055.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::10) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|SN7PR11MB7114:EE_
X-MS-Office365-Filtering-Correlation-Id: 9404903d-0b48-4a8f-ff97-08db77d76ea9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	stzQ5DUv8rrCgpILXx0n79DS+XghFD/PcpBUXvB3OW0b8PKkDLZKWAe04A7qJ3FXsFk7/uQHrH4J6r4wkL9XxXo3GZgmb6Ogf65UbAC/nzC7rmLHA1MttLoTwRPswoq0qBclq2u4YlbocNnozFJXxZfWH1xbJ9WUym+FX5eBjN3D164tA0sOyK6uBuBbDYU/ndTrSuaUCpfEDNP49Q2DtIZ8huox3oppT5mHn32wDMN6TCEM/JTvnU/OUabODyy5sylX9tMmk1uQGrN0xYAOotin9BXC+2tyJWyyDCRi2sQA9juff5ie+oeyCQbsEkjiCLE4k7qiTVk6nTqAcrUdI/mRihN0kXDvpHH02rZgX1E+CLXpIwElm+m5ZaEp4YFtNu0wv+94lLUUyT/wOYBdXSqcd5z56lPW+4RhWMbV2XWaqUiv2uUe6D6/Nk7FFWECQHPSYP7HLFy4LxpFEhwqAN/OSs8/SfKcRpgZbGIl1IV4VDYwzfYCLsfqiCkngluMl8r1jgKetBu7HodecqfxiVTUq/RlEFSQEztYKDV50T5e0QWTc4b47GdJIa9FN3peku6rtCtdARkfgLIwGWqR20QY6j96DMEJiiOPYvoHLQG7SeOLl5gTyd9RFAW/PRH/PX0gmTqi4DShx+eG/I6iXQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(136003)(376002)(366004)(346002)(396003)(451199021)(41300700001)(6486002)(316002)(52116002)(2616005)(5660300002)(36756003)(6506007)(26005)(44832011)(6512007)(1076003)(186003)(2906002)(83380400001)(8676002)(966005)(86362001)(8936002)(38100700002)(38350700002)(478600001)(66946007)(6916009)(6666004)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ATtxAqc1rexR2Xxw2KuTO1uk+N8pK94I8wfHCWSbe7ycPb5gaCQErYtu7sA0?=
 =?us-ascii?Q?goGMJIgfJomOEq3fSExpLrLHkxV0pKDFHnZzGatDUWkXNJmQ3SVj+EzwjAUP?=
 =?us-ascii?Q?uxmVZd6KVStm7PC9918/2j1We/NHnLC10PQQo41by+/RgdFdKzm+IlgRZWAr?=
 =?us-ascii?Q?q0Cjdo8r0yW8AHJJQ/h/iLBid9wPLo5ZlMYMderWXfwAUgftVc57OViVzeF2?=
 =?us-ascii?Q?GQzyoMexzZKh+Gy0fpNLjSG/EwU2aE/QALZrBAn+UIDiNe4oMxpZoOY0seP6?=
 =?us-ascii?Q?x+cKHb4OZUpZ97qWPpQO474lXvWppWqyelGjP1J/bIl9Pt+viOX60G2J7C5O?=
 =?us-ascii?Q?59jNKo5ceRq+GnDJWMaoXSzgFIUMhxIyfZWskomEOudJZNCFUF/H02Qe9Yas?=
 =?us-ascii?Q?AeY2QVi7URXF+I+vBmnQkwHd0TuKrw9caZNy/9CKXCp7kYKlUhAe3MKY6OEZ?=
 =?us-ascii?Q?WQ80zzbDLR1pwLSXxEGjOnD7wbc3siWN+3JNfSpEIJQJsYeTlV7NOxckIAF4?=
 =?us-ascii?Q?9XOqJZlC1beII+1yG7pu33viF1xwgI6cerZ7GhLeKeyjb9XHBLGleLT6BxiX?=
 =?us-ascii?Q?CUWuSFaylrYe6BIKi4QGassdg3U0/hbPxreZWtriPzeAR15H1WT8ZqjS0Pov?=
 =?us-ascii?Q?ea7V/vZx3MLIXYXw+S0G5/+6CnCh6nl5kf5w1HFuTThnA004t0VV8+1ofYEK?=
 =?us-ascii?Q?gySNro0BKspJP/GSm0aRGhuWqKxWlsLsdoYfGjkONJuua2de5cN/wcW30SHJ?=
 =?us-ascii?Q?S60V2IxdTjvKiNpCmSg3ha5X4ikUgPKvlQDRv0+9oWJjzcyHJLPPccVioWaP?=
 =?us-ascii?Q?JK5SEz9FFV6kU91bGjZLys/tHdOa58q/cji8MibfBa6H8i190/lVT+5XmmlY?=
 =?us-ascii?Q?oYb6wPCbmWs0uo5gtFNpeZET/Aq2SAWs+qx2eVl/5qz5H+Z+QcasHYiqgQGt?=
 =?us-ascii?Q?NtmQ9U2SBhw5cD9MntCDPCTZfUMEE1Q2IFaw29yJFBR1mYPo+CwakeQYHNUi?=
 =?us-ascii?Q?aVjCGlG+6DfXhs7rq3RAcyzXYSHAn88Uove5cSQjcJmspiQ23HDAe/lO8yIF?=
 =?us-ascii?Q?uKi6OqLHjbJrLQUYRu1cllRMGKEyvpCxmCKXwCJLHUX5n6mr142nnErUeYAo?=
 =?us-ascii?Q?E3T3iLChZ08VPFVIj0Vb7lJ21a9Xv0xozlWMHa3tn3XfyXo9jAICBopEzqWg?=
 =?us-ascii?Q?x/8Sy5hlxPslQRF+gAv0FJsCHatPXSFEasT/nPHPaZEsPfHfkVAo73E7ELD9?=
 =?us-ascii?Q?frfWIQjE+HzYsW1nH/qB5e9qgdVWgGstUZX+IYwUw/7ZT/8ekVwR0NalVU89?=
 =?us-ascii?Q?Jp8DVk1rlCynyrHjWXpAkt2TS8M++3sGnRGeUUdhEliU1YATkutlodezHyqp?=
 =?us-ascii?Q?FhU1uEdLI/LO/7QDHT86xmmOEFBZzZDmWaPuviKGraclH5oCKrUb2HVvcfOL?=
 =?us-ascii?Q?YegUV3K2O2+ZHVt2GCN3igBju7G48YkMaQ1ESbC4oAH4om1hoiHonTrRE3ZP?=
 =?us-ascii?Q?qTQZYJSfivkbI/jDSyoF4TGFYj+qePS8fHRUWOZtBcS/ieuWzLtuL10xvvSL?=
 =?us-ascii?Q?Ab7aDNN+Cb6eYoHv1GVaOSImz/RsYNF58A8CyXiU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9404903d-0b48-4a8f-ff97-08db77d76ea9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 12:58:56.3455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /I+kbAVHgMt2JtIrqH5Ytgm//r32cu86dNpLSIvSsIwUSgpX/qzgNHTd5+6KZY/MhQ6kga4GpC/30eql02dSKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7114
X-Proofpoint-GUID: LPtIj7yuTGUTJsAHvhb6uFtwxEG_T77y
X-Proofpoint-ORIG-GUID: LPtIj7yuTGUTJsAHvhb6uFtwxEG_T77y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-28_08,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306280115
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Jun 2023 12:59:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103627

ChangeLog:
https://github.com/FRRouting/frr/releases/tag/frr-8.4.4
https://github.com/FRRouting/frr/commit/45e36c0c00a517ad1606135b18c5753e210cfc0d

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-protocols/frr/{frr_8.4.2.bb => frr_8.4.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-protocols/frr/{frr_8.4.2.bb => frr_8.4.4.bb} (98%)

diff --git a/meta-networking/recipes-protocols/frr/frr_8.4.2.bb b/meta-networking/recipes-protocols/frr/frr_8.4.4.bb
similarity index 98%
rename from meta-networking/recipes-protocols/frr/frr_8.4.2.bb
rename to meta-networking/recipes-protocols/frr/frr_8.4.4.bb
index 966926094..b87c3e78b 100644
--- a/meta-networking/recipes-protocols/frr/frr_8.4.2.bb
+++ b/meta-networking/recipes-protocols/frr/frr_8.4.4.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/8.4 \
            file://0001-m4-ax_python.m4-check-for-python-x.y-emded.pc-not-py.patch \
            "
 
-SRCREV = "62ac43de9f3bc470586cf4f51fadf013bf542b32"
+SRCREV = "45e36c0c00a517ad1606135b18c5753e210cfc0d"
 
 UPSTREAM_CHECK_GITTAGREGEX = "frr-(?P<pver>\d+(\.\d+)+)$"
 
-- 
2.25.1


