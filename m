Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.75])
 by mx.groups.io with SMTP id smtpd.web12.14251.1604809756240073667
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Nov 2020 20:29:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=aPNEimfn;
 spf=pass (domain: windriver.com, ip: 40.107.93.75, mailfrom: hongxu.jia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LdpfRR4NBWY2eLsVm9UsUCom0IIno7jPZrB9qi58+6Sfsk6QsY7CQvSVkRSY9aaOz+pmIxmSwxDdrp6IPA88EybTxibIycOKvm1K51uxQdvyl2OdCBw74Y+QXCFgcwQOGJw1gnQC/bgZmmGTdCosfgf/t16CrMvsiHzsut1Jk8zkyzJe3SVuz1Uk748HnhpBaA8q3xKVChYUF3l2XFInZMJLbeXN/IHM020yVcaHuXFKyAzt3BStcbPES9Z+e8bgUQ3cXKRPdhq3y9mRu518I3+jk8VxbkfSRPg46vFR7rvxy+a7gPw5gkCe90yNKwoBEeRlT2iBiONqfj9ngHBZHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JG7vCIWcxxC3seN8iNVo/xDd4w4DP/ZoGbRYaoNQAY4=;
 b=hU50Yq+WJU/TUMWEXGNjESjvDXRxRvVYHnMf/So3gH4DP970DT6acjZc0hqwuebKrv1WGxTiKmhw4kpn085Fs5svUUGqlIU76h8rsYM6xLEYRSdAen+W9imHitg89ABAm+B33hOtJ6JkUSYEc8Dk19jFvpmxcJEXRP40BbdcfEVFcxN+R1AGd6MmEG/Hm6EXZgMXj90ZSCGZm7oH9ZI5sSR5vaEpS4889YjYkORsNoqBcVlAGTSS1cZDDDlg3JgPVD9zxEpLqrMn3/hVsjJ6krS6yaEbkXSGxCteDCp8KP1qvdVUaTlXbKziWUBge8VpVo8BcMmlw2YhrS/rzZ37Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JG7vCIWcxxC3seN8iNVo/xDd4w4DP/ZoGbRYaoNQAY4=;
 b=aPNEimfnnCH04xKUGQBSN8o4eFYG5G2yu+8s8GtA4M8ocVZtcK22DCMp3Jlhu1xa1aUfATdS4tuBQ4hEXAAMxGF4ZUeQzuRZCwZ/bWRCQhoCC3QP853p7Kk0UAitkCw9uuvqMjCt2vlL93t/NkkTmAHqLnGLLJdplfVl5Mn6qiU=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB4380.namprd11.prod.outlook.com (2603:10b6:5:14e::20)
 by DM5PR11MB1545.namprd11.prod.outlook.com (2603:10b6:4:9::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21; Sun, 8 Nov 2020 04:29:14 +0000
Received: from DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::316e:5d08:7a3e:cfc2]) by DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::316e:5d08:7a3e:cfc2%5]) with mapi id 15.20.3499.032; Sun, 8 Nov 2020
 04:29:14 +0000
From: "hongxu" <hongxu.jia@windriver.com>
To: raj.khem@gmail.com
CC: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] lvm2.inc: switch branch master to main
Date: Sat,  7 Nov 2020 20:29:06 -0800
Message-ID: <20201108042906.22305-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [147.11.105.68]
X-ClientProxiedBy: SJ0PR13CA0156.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::11) To DM6PR11MB4380.namprd11.prod.outlook.com
 (2603:10b6:5:14e::20)
Return-Path: hongxu.jia@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-blade48.wrs.com (147.11.105.68) by SJ0PR13CA0156.namprd13.prod.outlook.com (2603:10b6:a03:2c7::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.10 via Frontend Transport; Sun, 8 Nov 2020 04:29:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecbf66a7-ed81-45d0-e4e8-08d8839ed891
X-MS-TrafficTypeDiagnostic: DM5PR11MB1545:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB15457BEF29E1F4E4F9A15A5794EB0@DM5PR11MB1545.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:324;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AqQOtLvzzksinu+hmw/MGNor/OE7Jp6aQaGbzMfomN/N3OZ809ZFkYgQKLJYYAIPxvjN77MnuXb04tJCzq35TxIwZEGoU9d3gzpK7cNCf8I5Wfo73shXrcEAWnjfskKvJhoRBZhBWBCaQZGIhZOTU6LQ1NBVbnb68ZHNSD4jg7x+6GKYffnJtiYdC/74MJokfZGY+gzupEpOp0Ta5MxriHuMnWcimzpCQZAEKy55l1mcC0tRDewBPnfPU1n22IqVBCk8LRIUiElUWrZNyQJ9FR/vnARTRG4q4dhT5qtovrRyFyALeeH4iJWX8GIMci9/KIvPoijXZqVa3Geki+PChQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4380.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39840400004)(396003)(366004)(136003)(2906002)(956004)(6512007)(52116002)(44832011)(316002)(186003)(478600001)(6486002)(86362001)(4326008)(36756003)(6506007)(16526019)(6666004)(66556008)(5660300002)(66946007)(1076003)(2616005)(26005)(66476007)(6916009)(4744005)(8676002)(8936002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	6sN8MgkMN8o1eI3yyBV+K+QyPZUsA8q/PCv/l3g7c15eENlJ4dm+SJWpXA6Q3DpjugwxT6ZlYoidrgI/nao+woysv+ZBQ8PF0ddL6mep/6syttPbvZL98zDdutUkC4gX5qPH+qf0YKCgyywxCtUnJSJEhzfiyqedHVSeTyt1hgmjkw7sMjRgD5Sa01Ow4KokFsI2lYmrDys2lzmn7v0pIICyWBaJvxsjOgw1fKUo0jILs2PHdIbHOhnQOqzLbeS7na8lSyPBzDQTS8N4mXwZaTezfb7KK+HB/ORPzLQs1pP6mreVDCsVJz1I9p97Wq3HprSNewbdZ/KzmxhyT4XoEnQcC45Dl/3XFwBp+gaofij/RBuHDNNPUKdYirybpg4Z/F3a4TEF4NBNdp95nypjKfi9jyi4pjRFa8jBhqfEZfmdLrvD3VfOKiUoQ95X/3Hn9jigQuZDq9IThHb4CpbPqk7t1hk42SrQJrqelCigezMoPWvZTUI1kG1E+0R/L9rzep6AXXx3PLlCj7IlU0PNy9YEDJGJbwrpOjGuqC8x/nKO4GBwMzyXPeDvHkU2a6qGW8UcIs+ODjOMudn8b4CcXkL4ri9rFXCvEwv76CC/RSuMW1Jn5DTXlyF8Z8s3qVws5MbkR3oQLeA8iKaj1j/X2Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecbf66a7-ed81-45d0-e4e8-08d8839ed891
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4380.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2020 04:29:13.9663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tyvwvzsWdwFRQeISZJvNC2bfThQIkE+XZBEulhvZTx/5mrI4vbDD+TWmo4E2sBKEF505mM1Mj7sEJsl3+te3iV0zzKwAn9brzNfJReFCWeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1545
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Keep sync with upstream

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-suppor=
t/lvm2/lvm2.inc
index 3c6c7edfc..11ee7ca8b 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12713b4d9386533f=
eeb07d6e4831765a \
=20
 DEPENDS +=3D "libaio"
=20
-SRC_URI =3D "git://sourceware.org/git/lvm2.git \
+SRC_URI =3D "git://sourceware.org/git/lvm2.git;branch=3Dmain \
            file://lvm.conf \
            file://0001-implement-libc-specific-reopen_stream.patch \
            file://0002-Guard-use-of-mallinfo-with-__GLIBC__.patch \
--=20
2.26.2

