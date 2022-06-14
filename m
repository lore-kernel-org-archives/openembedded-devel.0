Return-Path: <akash.hadke@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA86CC43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 14:55:45 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.79])
 by mx.groups.io with SMTP id smtpd.web11.7109.1655218535555870832
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jun 2022 07:55:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=CwAjPisl;
 spf=pass (domain: kpit.com, ip: 40.107.239.79,
 mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VSwL4Cfm16x3oKH5TqEoJNvHQiHFrNZiwcOqrquhEfwhU8TAnRZAAEHpZ0zVJ0rw1sfxQsVhuhXPEBuxShsLyM2tlSRy03f46hZ6w5tfWvwAQgb8LTt4BfElttHQbXUBXJb6BBfvQSCs1wU6BSZj++cTnbMzqBa06uybpdv5TbmOiO4K3Bz7bIMzjurMe2KLv1pUSj85wjHREJTes0MDTHnbWR8XDNjcinTrqsGVSZK6G4UBkNvru5jdTaw1E90VZUlTQXbWhFUfkvOEvXr2aiqVPQJyQecLFJhGgTo2bnoSfi+oThVexf2emaTvJl+OVDHSl0+gpJIHVfVP9qQTuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FwhiMxn2wwEFbjgE2aq4LVTSDJIdFthQwiy95VIF1PA=;
 b=G2HNl5RDQp1DIUpnpJiHHFTL8K0BvR4HPDl0o58vyOAZBrVjMh/l6cqSiAsuBPTUmDilfXKpKMEAdtxuUt6AfQsDhG/SMsTrsIf/3erVmAw2g6OERENeUTI+tiHPu0ybCyOfd6NNwgaLZwtBef5V/35THmz14h4baOk+Z44n3Sa5FKh31a1VLbiMYUtHfh87v78btYiBIrUUCD8CO1LnKNnMB5yVqIzLDWalsx/KSIvrJexix/eQEveicc/tUDuPzGAR1QqNWnNVRRp7zBwIN12EGRboi8x1MbXvoAumA6KgrYAfI4Gv6JvtVgxCQhYeiSxRc5pnpxwgAzQVMBrSsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FwhiMxn2wwEFbjgE2aq4LVTSDJIdFthQwiy95VIF1PA=;
 b=CwAjPislvO4rHF+RpzUlwRuoPYuiXIWJkTYemLCJVCRkdFt8mo/WHOZNI3Ir6YQmBKaAGxao8wCU1SCUhgpjOM2SK2c4P632v4udT2IUlZaqHuaKyoz49X4h4in1oTzGW4NGh63ZN/rjZlmPMhbmzjkx7BFXlJyxiRUwPdu+u5A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:89::13)
 by PN3PR01MB6792.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:a7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.11; Tue, 14 Jun
 2022 14:55:30 +0000
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8119:8287:2cf2:7125]) by PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8119:8287:2cf2:7125%7]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 14:55:30 +0000
From: Akash Hadke <akash.hadke@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com,
	Akash Hadke <hadkeakash4@gmail.com>
Subject: [oe][meta-filesystems][master][kirkstone][PATCH] ntfs-3g-ntfsprogs:
 Set CVE_PRODUCT to "tuxera:ntfs-3g"
Date: Tue, 14 Jun 2022 16:54:57 +0200
Message-Id: <20220614145457.18046-1-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0502CA0005.eurprd05.prod.outlook.com
 (2603:10a6:203:91::15) To PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:89::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82877dff-4a8d-4048-b366-08da4e15ecc7
X-MS-TrafficTypeDiagnostic: PN3PR01MB6792:EE_
X-Microsoft-Antispam-PRVS: 
	<PN3PR01MB679234247FC1AFA273F651AE8EAA9@PN3PR01MB6792.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HJw1/iknGQhgLbRNI2KhdkxGQoqg5DQeb4e05PqrDrAy3FNiEH9Mh9eGhHQpZUFHcU40xtJGcnhi9dZvABdjkKktGS7W0Mzt//Bt0KwsGlzn/UqmzO1kKKL9Nbm0jSMmN0sG++8kosTF3I5hzVfJVwQ+wwu7lNTJjeXzSQSvpJqaCOuahKREF7Z7fo1FL9uVvN39Gn716oVrfWAyRSIGz7EETg1JXyatmrt0HFzxeX+zPqNDpGD3MXB609HKDnBITUxz3TD7Hv5SZHRlZwzgDwLtKnS8VtlazzmFtAyzQ5J8JMeYPW7FCR/13DAdfLCuLA9Zl8YXlX9do5vUORIlsg+8pUvCCvDM8awWi5DckHGzDFjaKSnOiIdPiB6AyqDd0M//h5mFj4/uOlhGLN0rz9UE9dVsnJLTLpDENhOFiyEdKm1UhBH1mFV/GMY+S2NfSqg1WC247AGuufx/MGz1hh0I+4xtQ2x5jsUjNo5lN5UsOp1qWaNbveVb2oRo8C8e2HvUV7IuXGnsjnxZr6igqO+IMiu4ntG6IUEUfXObf6n5ceZi3SU7HMM1erLoXyfSumw4UMfPq2ADAz7pUZx83hZR82xIsF4/lVyBdt714q4WIj1DwuzpZdNyy4GchqJGhyI1bGBaengb03a/1J/mIKFl9wHSrVJnp3vPJWPMqxBfO3RMX+KNE/ldqgvP4ZHX6XLcEHxC6TMbO6sMmWdHjtWHuCFd6QVYR4Vvl0uu/Sa/wtwVtJepPbNCNy+2tqszvG0LxUVvqPsSLoMXvLZ27pbJ6d6pOkc6rVfpLjQWfMM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(5660300002)(44832011)(66476007)(6666004)(966005)(2906002)(6506007)(86362001)(38100700002)(66556008)(66946007)(8936002)(8676002)(4326008)(38350700002)(6512007)(26005)(6916009)(316002)(36756003)(508600001)(52116002)(2616005)(186003)(1076003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MeQyUqu0VPLAVg4lSijPo5pe5+mvqcetkzExSDJdLWiB1JunxoluK8OrPDR+?=
 =?us-ascii?Q?oy5MGGIQdziy89XBt2UxyWeEJF/vWoaX0IhkUmL9PbApa0WqlTgH+gwK9jiC?=
 =?us-ascii?Q?IJ5NGzUBaBi2Bt5mgYNEHQ0MUn8idA5IOE4acpEOigXs9/kv+4/9Zg7Hn0f6?=
 =?us-ascii?Q?L7dolDT+VX0gsXZAJoa8wzgkH8Fur5xrCTN+S3U9WEBal799wwyK/H/DY6HK?=
 =?us-ascii?Q?wRiKCfek3ox6WNHQfxUnaHHHzseI5tK/uua3xI32c2jtK3bDhMqhR3RZcpn3?=
 =?us-ascii?Q?c71Hj1ZwFBhO374JtjPbCdxJ3LiyMShSBGK4qGywJbB1Int++bXCMcnXSP7K?=
 =?us-ascii?Q?lcnlVm3zgW7PM+tcZv+0qL3c3K1RUuzQlL2el357+B3wrSifKMp/sWZwNYRF?=
 =?us-ascii?Q?VKyt8ftorgX5U4PqKFi8NUpbZ2bSWNVKlp0NLwX5dPCGO8Rs326xTXQt7Ni2?=
 =?us-ascii?Q?uLeVAhL4u5lAHLju8gLhqQYBzgkdaQ25kF+MzYqsOmLgfeJl802+afmiBfX3?=
 =?us-ascii?Q?DLaD+HRkALIJokxmctTWGZFhVQREkv09o+D9ILYXTRNp45VKWDmkXng3Pnod?=
 =?us-ascii?Q?zx4OPh6tHTO2btGGkrKU18aYNf743VdNdUjoC71HsP8hvjrqxiggTO/ZoEnO?=
 =?us-ascii?Q?xozE6l/HQm493cGs4q5BZUrs61pACbzkiP6cOQjAHdZOeNP1XkJqmukIv5WM?=
 =?us-ascii?Q?0fxNRtOrn1uVqbQvVVeEs97TGF4paR3aI/ubYePfgMvM9nV3ShQzkG7g9BIc?=
 =?us-ascii?Q?sqX667eLeVAQNqSrOU9AGk+0A/tkmingXGDoF5ydVjWpYIM9fCZXkvZB91fU?=
 =?us-ascii?Q?eHfuN+C+8eWd+7xzan0qGUNFNWT1R2JyE6erdnH2VuBNcmKfVxzh1eJ3y9bh?=
 =?us-ascii?Q?E7LDZ+E6pc8jdKIcWx6wF6aqeizWTbtKBfEVVj06nzE3Ed2VahGryHTo9FHL?=
 =?us-ascii?Q?3JR2uCIG9CuzH2JFzkYVEp/+OofTkI8v9VyALhwjFWVQ2Fu85dG1rJ5ZnuwC?=
 =?us-ascii?Q?piefIguZiUv6qmKPaYCFA0HJE6QAKwr2fE5e/O7zl6Ob5MkN5Zu50lCb5o8K?=
 =?us-ascii?Q?hJ7pND3EOIFcQ419eQb3ZBRdU4GUv9801s50B9dxc9qQRuzeTS95pzIRfKcE?=
 =?us-ascii?Q?9Hz/pyqyI1W8lcCquh7BUmtgOkc72VfuAJJjFe2usIpMm6uaUlWJXTJVqst6?=
 =?us-ascii?Q?5pTHlFv3ob2ZUAN1xhCNZbmq+x/BkZ4A2t98fddjrbocRz/Im6cfQwxtmWRl?=
 =?us-ascii?Q?Zw3zwAji6+FzDfrFk1hb5X5HcWzRvIm37bThIZvKaKv52z2iA4NqBsxObwVq?=
 =?us-ascii?Q?ukB5ldU5/andbG47+qOH7mZ94qGP1IqgMvRIM491Al9nt/9W+d/706fOEev1?=
 =?us-ascii?Q?p0C3IJGMuch6QN0Iz15FVw72bgf8Im99teqdQeN46fnb2CVYCqIkCFwfPUF3?=
 =?us-ascii?Q?NkwV6ix2ABSs52eSWoOh6lelm9T1DNhCgIocbodkvq5j5NYVTJcj3u7YfwR3?=
 =?us-ascii?Q?5961qu+lSE+7qr7C1bg8BpSa2HxCir7n+7lfymJYj2Xqi0C8p1gTj77tvn4K?=
 =?us-ascii?Q?w1gJPWWLW0Blh7kg+nN7AIenWiLMOcgzqc7XCPl7Rr4tqijbnruAxJEGZ1Wv?=
 =?us-ascii?Q?Cjauh9AqMLM3VSNVgodCqxGrqzoS+3bYqJW/0YRXYhXlIeTAN+KXBSMKSWVf?=
 =?us-ascii?Q?DOjJo/6qkt3RDr51MkhjBizjohA+RYG9UlckewZtswOW052rv6y3jJE7ZHzq?=
 =?us-ascii?Q?JwPyWODS2g=3D=3D?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 82877dff-4a8d-4048-b366-08da4e15ecc7
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 14:55:30.2960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xuahgfXK1OrAgpN5sshnCpD4fKhHExqJeB3oBzwr1eJok/hHyj3FN4nCyWVbwSthiBNIVSeJmisXJflYFXa7Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB6792
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jun 2022 14:55:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97515

Set CVE_PRODUCT to 'tuxera:ntfs-3g' for ntfs-3g-ntfsprogs recipe,
cve-check class is setting default CVE_PRODUCT to 'ntfs-3g-ntfsprogs'
which ignores the ntfs-3g-ntfsprogs CVEs from NVD Database.

Reference:
CVE-2019-9755
Link: https://nvd.nist.gov/vuln/detail/CVE-2019-9755

Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
Signed-off-by: Akash Hadke <hadkeakash4@gmail.com>
---
 .../ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2021.8.22.bb            | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2021.8.22.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2021.8.22.bb
index aa1b4c2e9..c77028785 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2021.8.22.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2021.8.22.bb
@@ -50,3 +50,5 @@ do_install:append() {
 
 # Satisfy the -dev runtime dependency
 ALLOW_EMPTY:${PN} = "1"
+
+CVE_PRODUCT = "tuxera:ntfs-3g"
-- 
2.17.1


