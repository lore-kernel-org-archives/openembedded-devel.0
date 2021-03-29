Received: from outbound-ip23a.ess.barracuda.com (outbound-ip23a.ess.barracuda.com [209.222.82.205])
 by mx.groups.io with SMTP id smtpd.web11.15721.1616980944822598601
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Mar 2021 18:22:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=PO6Zr7LB;
 spf=pass (domain: digi.com, ip: 209.222.82.205, mailfrom: ben.gampe@digi.com)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102]) by mx-outbound11-146.us-east-2a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 29 Mar 2021 01:22:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=enxWhiN/FKApjVzmIDZzY6gxE4DAAw0QwSlWdFmqnWXsk1BAaRJ0ZVu7fUEivJVXcQnB92ogllyjVvWohc7AtJUL3NN3T/XCz6gZyNXpYIzYpCrP/QX41iM9bdOOy4j9NlOW26mNTXlY2wpPUmAqFXTSPuSir7UhhcgOP19M9OVAVJHKs+weRnRcWOUU7V9nQ310GtQxDj2Q3oR3Wlo96PvApRsKyaNKm9cDVM4JrkViyOzk4YIRxTJNjSDlb0biGBuO9UgzmkBZSi1+pP/lqZVVzaeeQLRT/dN6h9l7YUylgNGnkKt8yQk8QkrRSk1Sj3rX6EXqq/fu0+eXmjoHlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9O2epYokOgR1FqRnE15Y93oZRtKzdJLPhhFz7agZ6g=;
 b=INLu6N8ShaLWj0Q77uhOcXIIAghrJcPwiwakG1DDvtf+/AVNlba3KYj0PkWB7T8W5mG0Ufg69ipSDWZMv6BgnaSIfgPeSqNS+3aQ0j4xLFvPiTC/fUb4LSTrzKSWQIbrutj3yJ+cPlUe/bn5j10XZZycuywRYg9UE/cY8ZG/49K63tqAE9GrRtJE8koH6oDHn0i17OObCzJE+TzEM9HJ/xW0rzdyfiYzMD1tEySOAAa7PNZSjj57gC9xBkU3PtePWXmSvAL5fcfVhjOS/mryJW6E3/Gw4K67D9q5eUURTiZsq4LCe/2sGQh71AKl7CzfMik1m1zjNDys7er6ErTQWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9O2epYokOgR1FqRnE15Y93oZRtKzdJLPhhFz7agZ6g=;
 b=PO6Zr7LBZrzllnLVMJ7SfFvY6KLGBujSykncWK59Q5JiYz58c+b/NdnoXkr1/9+zQVu9IgYxxnTu/pqL7C2mfK649kC4rEa2yb4/ckp1ju8K3hc6P4BxTfE2EfxpH8GWLxlv0KYsPHitysx7Q1KLqVz1vQgaa+nfOcV52t+t9k8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=digi.com;
Received: from BYAPR10MB3320.namprd10.prod.outlook.com (2603:10b6:a03:15b::21)
 by BYAPR10MB3703.namprd10.prod.outlook.com (2603:10b6:a03:122::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Mon, 29 Mar
 2021 01:22:22 +0000
Received: from BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc]) by BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc%7]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 01:22:22 +0000
From: "Ben Gampe" <bgampe@digi.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ben Gampe <bgampe@digi.com>
Subject: [meta-python][PATCH v2 2/5] python3-httptools: new package
Date: Mon, 29 Mar 2021 11:21:40 +1000
Message-Id: <20210329012143.2580564-2-bgampe@digi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210329012143.2580564-1-bgampe@digi.com>
References: <20210329012143.2580564-1-bgampe@digi.com>
X-Originating-IP: [60.241.24.90]
X-ClientProxiedBy: SYBPR01CA0170.ausprd01.prod.outlook.com
 (2603:10c6:10:52::14) To BYAPR10MB3320.namprd10.prod.outlook.com
 (2603:10b6:a03:15b::21)
Return-Path: bgampe@digi.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from beng-dev-laptop.beng.bne.opengear.com (60.241.24.90) by SYBPR01CA0170.ausprd01.prod.outlook.com (2603:10c6:10:52::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24 via Frontend Transport; Mon, 29 Mar 2021 01:22:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81140223-8750-4e3d-ffc8-08d8f2511a24
X-MS-TrafficTypeDiagnostic: BYAPR10MB3703:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB3703CA7C312DA4C0BB3539338F7E9@BYAPR10MB3703.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:494;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wBZ9vHBYKmJ0wVLIcGzn2OnG28x9JIUdq0r6AqQz2t60kN+9osN3dXKl41l890wWSchgQ4pJL20+JzDPYbsFSEhkMyZ5tMQMXWobq+J7ooUJItNoxK2Jz/60XVOE2w4Hid+6tTVhe8UJUvkC/TTHgy3SJxwvv8STP0ZpqKjgCwm/r9JSSEtK/HQTxdJPtR73QYIGjM5jAYBdVcAffdI/ZfpYOokdzFMalVHDImbW3vGxg1QpSPtCcyEW1gy+Cv/5VlUA5ICSKepQ7YUvPPzojpN6WRfRJDTHqbmRUpCYI4cA8oDvlkVfKdb2UH+zq9E0fJc/MjeEiuwVi2yIjsIGlYOlomkaaePZR6gvLM5GOtTjmTdP/GY2TGGP6B0GFlGKoHTC1WYTlvQZrx4w5xEAy2/KVZZMOfoC+nRYajtYq1nmUPqMXLn+RmHnntIxwy+SbAlwGGYQ01yGEAURAf5EV23l4DPbzWsz4NzNPPzs324afg89ybXkZmj2o8AgGnDmVi8MuzOTO1fG4aq7BKriZiXEf/Dy21ZVWnyUcGa9+OyGhPTXQMayesZ6CAfbmbLudQPTkAByDYNyVXMDQq9R1iuDQASi5/fIFrb/JQviImAtEYPd6bmTP5gYFgWYVsObaxKFeFw4Xl5mH45j+ka3C9unCDW2yFwW+9NzuA6vtYJzRABM5ow2nk2TKKBr5SaMLChHWD3ol3zJV9RcdsSAcWjqajggABh8Yu0cGOAkQgc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3320.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(396003)(39840400004)(136003)(6506007)(1076003)(8936002)(956004)(2616005)(38100700001)(5660300002)(6666004)(66556008)(26005)(6512007)(66946007)(316002)(186003)(36756003)(66476007)(2906002)(16526019)(107886003)(52116002)(6916009)(6486002)(8676002)(478600001)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?wdXIV4SdgTnKDPX0j9v9lo54GqmqQAL7JZRRZMBUx6hoVp0Eiu6hxY2rwE75?=
 =?us-ascii?Q?WuUFc8J/56Vfmn5iBiRlk6XlHlEyNKWdBZpPjKi47BfcX3n2tl8nvUHiUeuS?=
 =?us-ascii?Q?BbSQAn4VziVWULjzJdI05xOAuJ0ylCT+hmF2vSmCp8mlWLxXtOjzmGkfGpqY?=
 =?us-ascii?Q?b+zDFIDr88dIyusEPGlkGhGoMWvzmgj7YjQLGOE5/SYiGcqZXh6tQiXlhNBI?=
 =?us-ascii?Q?64rQDHr86ATsQU4XLxqA7Z/sggggZZDalEbCWw8mpvpmOKA156wiOwPSr9kG?=
 =?us-ascii?Q?DhEWMj1wsAXBXnmWpyAkC/RPi8aEG/TkQ9mocnISV3tfxwn1+jUQTiq6g8+A?=
 =?us-ascii?Q?ZWZkedE3BuPCR9Me1unr357bwEX6U44M2krj5yQ/NNPNYbqjqeFwgl0Cjd+r?=
 =?us-ascii?Q?MbnhIYl+MO3xDv5ejZE+hUe/JDAN/hLFLW07/DWHNwVzuVcILUmEZqUoGEmW?=
 =?us-ascii?Q?Qesv2FzDwe3jZF5gGM4mYao2hdODZm6dga6A+n9b23q+453vDrJLIh7MEpIk?=
 =?us-ascii?Q?54OFP9sd7ELdkJMhFmPwPwsNHl1rYPTeYFyi6nBaSE85MzyVhyaSVLHX58I9?=
 =?us-ascii?Q?ZuIiDyMVHHQ3IyxNq+GivR/Gulq3UM0bwncBdcCjyMF1kwPVcjB7eL2XHnAC?=
 =?us-ascii?Q?bT7AF/4K9QtGypditAJBWOv4XUzQpRmt66GNS40BltlWOasXiiWmlDTpbc+w?=
 =?us-ascii?Q?MYr9bBwhXcxrw/QRpumb1NPf4uBQ6V13rCS8fmvqxXhH1SoRb4kTekeoRaPL?=
 =?us-ascii?Q?ZgNqSsmEv00kKK4JHdG0rV9yuct1/P/r64zUh9FmnTsj3+0AHl2JwP09y1+N?=
 =?us-ascii?Q?49Nor+H2RVqQwfAZvUijo3W4ukv/ChTcCak726WwzVEXh3b4hMCPRdEc+Ltj?=
 =?us-ascii?Q?61Ym1Th/ccYgyNExJ2bX1b/0dtVehmipTpTl12M6Fa80gvJl1897ROoYNDKd?=
 =?us-ascii?Q?Km64FnT3h7zuFqQCsVwDy3obdWJDi0Fz44x+tk478k8Treo1CVqxKcjWyrrU?=
 =?us-ascii?Q?b5rF/DWPgP7Swmsp/SfUmsRIYpuK5jeoxIj1SGKMokvQ6qEU26dprfdwPzJr?=
 =?us-ascii?Q?P4MB2ZioleGZolgxE4ptLfJqCB/uvSfy+t9ASBnCRcQ3V65+e+DUqsLUoLgA?=
 =?us-ascii?Q?AK52DyKb4LsCbeuLL48EtuVRiZrvstPV0KF9bfjIh14NA3T65OLtsBPsOz3z?=
 =?us-ascii?Q?dj2lgoJTGbLTq+ObyeZlL7NWXs1FR2ETDxByGiiIZpf8KS5Y8xE63o+iWOSf?=
 =?us-ascii?Q?2YtMnEdGz+KJJ5VSvfrk+HR7nldRKQnJGnojKBVLP6uLPeAVyN3JmNOCWayf?=
 =?us-ascii?Q?bznykK58ot4TNfNELUkB4ryH?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81140223-8750-4e3d-ffc8-08d8f2511a24
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3320.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 01:22:21.8909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RhuXQoM1ExKdbL748GikkrdRmvmJN0bXC3jKroifm1fSOF9ddB4+mNrdJnBjhbuC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3703
X-BESS-ID: 1616980942-102962-5413-23910-1
X-BESS-VER: 2019.1_20210325.2126
X-BESS-Apparent-Source-IP: 104.47.55.102
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.231164 [from 
	cloudscan11-97.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 MSGID_FROM_MTA_HEADER  META: Message-Id was added by a relay 
	0.50 BSF_RULE7568M          META: Custom Rule 7568M 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.50 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=MSGID_FROM_MTA_HEADER, BSF_RULE7568M, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add recipe for python3-httptools: a collection of framework
independent HTTP protocol utils

Signed-off-by: Ben Gampe <bgampe@digi.com>
---
 .../packagegroups/packagegroup-meta-python.bb            | 1 +
 .../recipes-devtools/python/python3-httptools_0.1.1.bb   | 9 +++++++++
 2 files changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-httptools_0.1.1.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 0418b5930..30e90dcd7 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -162,6 +162,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-html2text \
     python3-html5lib \
     python3-httplib2 \
+    python3-httptools \
     python3-huey \
     python3-humanfriendly \
     python3-humanize \
diff --git a/meta-python/recipes-devtools/python/python3-httptools_0.1.1.bb b/meta-python/recipes-devtools/python/python3-httptools_0.1.1.bb
new file mode 100644
index 000000000..1f623fa9d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-httptools_0.1.1.bb
@@ -0,0 +1,9 @@
+SUMMARY = "A collection of framework independent HTTP protocol utils"
+HOMEPAGE = "https://github.com/MagicStack/httptools";
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0a2d82955bf3facdf04cb882655e840e"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "41b573cf33f64a8f8f3400d0a7faf48e1888582b6f6e02b82b9bd4f0bf7497ce"
+
-- 
2.25.1

