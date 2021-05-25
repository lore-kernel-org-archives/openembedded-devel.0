Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5727.1621921251702030558
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 May 2021 22:40:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ViLdxFSs;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0779b37967=liwei.song@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14P5c1H4010323
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 May 2021 05:40:50 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by mx0a-0064b401.pphosted.com with ESMTP id 38rgn50b52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 May 2021 05:40:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MfO6DUMHlThnM4EQbFj7uP4MNTwSeJtmHD5laE7A3mWmxLCpPpDEpiMUhLLX6fg7OHaiDYna/Pk50u6X1UsEO8ArDbCmbYHoGQ1E1stoy5dzxdUn9cfloXLEmvciOg5UpAdtqziWnuLw6808V5WdDVVPeBReTdJX4c58PMHDr7ntAh5srWt5BaKDoiWn/EkoQkYsF8RwFc96xQVGXm0UlcjoeoNQuzmxDTv8VkNW4Y5pYRvLVWRbSIqZbcKqPbaT2wicZ+AQ3FjuGwMihrAoi+3tzvg0duOoPCHANCIDyBHWru/LMMyKCQz70lo9Xhz/kDrrWHQYwRdLJiQ+1YsQVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K04RSGvVu+qfIVLjtwa9ZJwyh18erklJwaqXXdmebfc=;
 b=Rfgd9JpiynKSxx1hi06u6ajET+o+2321qqulFGyQHOVjFz55lhJGu3bkpjCOB4VUThzCr59dFjRD551JePhPtAPgKhBahUgdhqhjaqe/FtfoJ6lUhd9l8FCxB5UNt3au7JoShPUermV6q9M4msK1tenFqUyHktvA7M+RHgDfuRhGUax0JNYiec4r1uFYxVCGN4TGIfpxOPVI4be96wxxGSk6YfU9DhoxvyEI/qZo2QX0PlSYmiuR+JyUP/+1oopPEilG8pflq4tkGKXXVDotk4FyiWRZN4nMCYvDPdxYZpj2xleun5rPGwhQUb0MgMMkck7oJ6Tsmkg2A1td/XmuMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K04RSGvVu+qfIVLjtwa9ZJwyh18erklJwaqXXdmebfc=;
 b=ViLdxFSsN4sG3FfUfcUdynbqurwMUeUdyEDGeBtFDmVzAKea4OnbFRD9CkVOiX2dvESS/X6juX7EZtjBWj4c6Vr3pVFU55LDi8UZ/YnGfisUyL7TZmAYZRdcH90lJ8P7FiFQ7HAw0suNxLeklw729SaKj7ds1uInNa+LxSL2FgA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3419.namprd11.prod.outlook.com (2603:10b6:5:6f::32) by
 DM6PR11MB4595.namprd11.prod.outlook.com (2603:10b6:5:2ac::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20; Tue, 25 May 2021 05:40:47 +0000
Received: from DM6PR11MB3419.namprd11.prod.outlook.com
 ([fe80::e436:ec10:350f:578f]) by DM6PR11MB3419.namprd11.prod.outlook.com
 ([fe80::e436:ec10:350f:578f%5]) with mapi id 15.20.4150.027; Tue, 25 May 2021
 05:40:46 +0000
From: "LiweiSong" <liwei.song@windriver.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Cc: liwei.song@windriver.com
Subject: [oe][meta-oe][PATCH] pm-graph: parse separated cpu exec line
Date: Tue, 25 May 2021 13:40:33 +0800
Message-Id: <20210525054033.28545-1-liwei.song@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0140.apcprd02.prod.outlook.com
 (2603:1096:202:16::24) To DM6PR11MB3419.namprd11.prod.outlook.com
 (2603:10b6:5:6f::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp3.wrs.com (60.247.85.82) by HK2PR02CA0140.apcprd02.prod.outlook.com (2603:1096:202:16::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26 via Frontend Transport; Tue, 25 May 2021 05:40:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 707e6eb9-64a7-484a-4132-08d91f3fa559
X-MS-TrafficTypeDiagnostic: DM6PR11MB4595:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB459515199F70DFEF86ABF9EB9E259@DM6PR11MB4595.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	US8hEuY0es3LhjXA1xoy2Q/q3riT5WFu5J0ajm6AL1/oa5nbbtq4cIx+SRUGozZ9CLM20bTHuFKEOWHEJDoSLiF8EPxO+H2ACrJXoAh5w70zjy9g3+84nSXsr214aQJ0e/OLx3eX2p9PC0Pp244NN/Ik5dCEppYQ8G/ZBKptJ/IK3Y2DI8tNvRuHyfs3ZfitZ7GeyDn1kTb9u+sSrOe42zy7tYuJQzdYSPIrMkrgDEPT5GrOPZswMCu7gvGthN6nhEkcGWEIQyOEx6uuIAzDZ9f9wdyoviPLxgBTWQiib4TZH4yzBlxDKQgpiR/wIBV0Zc+bdqGBaLmCaUVuMdeYA73MU9jGzSIYg0MMqd0Fh4lWzfnTTHORzeJkYNgDlYbuv4fuC6Ta0VtjfmbqrmUW/ds5CPrjDL6AIakhAwoqNIFt+71jRYfqjjPPTt1H1eHIJeUOW3mJ3ePk1O21l4Hq/WyhX9jSZS71Y6VZ4t+/E5JblsHNdkL4UCAcmakZgJpAme5SG9a9HVdUB4h9wQyBxHwq9K1cxFMvzboMbu5e8EfZUxe4YNOjFGQ78pV83Y1rV64adeyvdEZMSyGHtCQDKtvaNDAd9ZEIiJPPkxgMPd8pauu7WGrj1VXNNn+cWZY18amP46rx7/uBXx3cnF7A86J6q7YKkiYbj9AEWM+QkbhRvUX5Bfp1GUtvjsupx9fhCW1cT9SFcIrdSVPEN45HNLcUIbTFeLVft4CgoxFUvY5iVTyoySFzdQ4Q1T19PQyNoZlBIkSBJcaKpK5EF9nI3lctu7XPVzzTHqCg8lWX+VM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3419.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39850400004)(366004)(136003)(346002)(86362001)(6506007)(2906002)(38350700002)(1076003)(83380400001)(38100700002)(6486002)(107886003)(5660300002)(52116002)(36756003)(6666004)(316002)(44832011)(4326008)(8936002)(8676002)(66946007)(26005)(478600001)(16526019)(6512007)(66556008)(66476007)(186003)(6916009)(956004)(966005)(2616005)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?8Nc5rCphKPrrSodt4OwDbE7yTVtckHs/HdUmhTbHU2/Lh2lrXwjCVDLJhNCm?=
 =?us-ascii?Q?75t2dLzMVa8CvK5kYR8TNbhgd2w7a7apFweqUJwmlCRvk94neliyciLoPjkB?=
 =?us-ascii?Q?slY1EZXOaBCe+uxZ6sHP1cMl8mYGuvKpj5n+vrSUW+UDHJVnpFDaoBZBppGz?=
 =?us-ascii?Q?dCg4hqLD1nRndExaHsXTrCretPOvinEjfpHz/YamU/4xmeh1Qpo4nWTNq4a/?=
 =?us-ascii?Q?S8mPUKAiwqEagSnZr/xzUgWAdcYFcheQaQ58sCLuScWFvsaSIYRYU+PX0tUA?=
 =?us-ascii?Q?y1S1sBkSpfjXJXH12Peoe6Hj0TOTnKTpjyNlICdViYEAbs7gWbPxn8HRSg0X?=
 =?us-ascii?Q?MhnT203M+4aFbEgk4Ol4YKkILHHiXVWv7NrMRfs6FeoAJGLbliVPWnD4Gxhv?=
 =?us-ascii?Q?kq+B/RdbD3grmm4OtL93BRGTgThbE4/J6nBS+9lW8F+Xt+WzgvczXCDFOoU8?=
 =?us-ascii?Q?ZR5+Tf6VtNr0JJUzELLGIVYlNniJ4hRzVRlXT/Y2Z6VOhwEoiOyCXiZxoxzd?=
 =?us-ascii?Q?wtW4L7GURzhGqFZEGnZEAuZulXuBuGfIn2v6JM2LTbh0zF57moHRyPl39gBA?=
 =?us-ascii?Q?8TpCbgwiA9kfqtnhLlGZ08RJ2VuRa9qqdLKvrQoQ715uG5J8lmoRBt3fkcIi?=
 =?us-ascii?Q?dRoiBNumCWY+2HvahdSFgRSW4INY16B+upUyzbaewE6yhVqSvgRJxaF/XijG?=
 =?us-ascii?Q?qmZSEoBdZ3UEM//i0LnK2dZ8zsxuqRHuMyRyIATo7yV24kmRmv/xcH0atjXC?=
 =?us-ascii?Q?1/9oNVp/r+bLzpA0T8ZXJFkvCmg3Oqz3koC2LG6fsCR3jGkGsz9kHSm2sSSu?=
 =?us-ascii?Q?KrCQ1RElF49zg3pMUUZUE+zoKGmbZ4MbNKqCs3gnEq1tNlzTa/MAj0RmoNfb?=
 =?us-ascii?Q?pMw2bJnxzB8M15y5MlOxZsjQ7oDlfocU27ins/a7Kavjvfsl+s4bunI0OfDT?=
 =?us-ascii?Q?Mt214QB3SW1Btuv4lJPgY0xyp1Zm2ymksnAadTKV2rWSt/gADCRUCfRO4P5Q?=
 =?us-ascii?Q?IDnBtAL9ZmLm+nKkmZ76doauEnw+gZsEX8B9lc4ErhOZ3V1YuhqrstCjyQts?=
 =?us-ascii?Q?zvdCL+Jlq7k1b7ATtPcCMoOyX1v/sRUfQeoSBxUSex+/svAZRD0XuCulz5ry?=
 =?us-ascii?Q?UGFFg5OwrSpwvxeH5FZkao+BA3ffEBABJqIlM5ib80RC5Q1/UdQTSuog3cEs?=
 =?us-ascii?Q?HNyBX+ULepGWV+NYR14S9fLCKRz7x9rfn8CD3nLdcbcfxJnetT/gY9vkpIZJ?=
 =?us-ascii?Q?C0toAt/+6C+Rd+dG/rrJLbrU1AmMXclWWKQ/D6ptBjZOG3e291bR4jMlsskF?=
 =?us-ascii?Q?w7CLq+iXS3wzxinikyAphNVu?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 707e6eb9-64a7-484a-4132-08d91f3fa559
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3419.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 05:40:46.8785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/SoNDWrNKkGREjEZT6TWoFY3OEPRf438mqhlBpTbuz4h0kq/6+DQn2FYJzouoMWiNwwyYp1E0PEc9xwLN/a5MNGxDPOmf1w4ZyzGecpztk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4595
X-Proofpoint-GUID: i1HcYyuF4mtNaSYr2BJdhUsm9UAD9ss2
X-Proofpoint-ORIG-GUID: i1HcYyuF4mtNaSYr2BJdhUsm9UAD9ss2
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-25_03:2021-05-24,2021-05-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 phishscore=0 spamscore=0 mlxscore=0 suspectscore=0 clxscore=1011
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2105250039
Content-Type: text/plain

if cpu exec line was split into different line, there will be an error
when parse it:

  File "/usr/bin/sleepgraph", line 3165, in parseTraceLog
    proclist[name] = int(val[1])
IndexError: list index out of range

check this case and append to parse the unfinished line.

Signed-off-by: Liwei Song <liwei.song@windriver.com>
---
 ...raph.py-parse-unfished-cpu-exec-line.patch | 51 +++++++++++++++++++
 .../recipes-kernel/pm-graph/pm-graph_5.5.bb   |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/pm-graph/pm-graph/0001-sleepgraph.py-parse-unfished-cpu-exec-line.patch

diff --git a/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-sleepgraph.py-parse-unfished-cpu-exec-line.patch b/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-sleepgraph.py-parse-unfished-cpu-exec-line.patch
new file mode 100644
index 000000000000..33557275fb6b
--- /dev/null
+++ b/meta-oe/recipes-kernel/pm-graph/pm-graph/0001-sleepgraph.py-parse-unfished-cpu-exec-line.patch
@@ -0,0 +1,51 @@
+From 9bbc991a927722439cad38c892fc9f57207089d3 Mon Sep 17 00:00:00 2001
+From: Liwei Song <liwei.song@windriver.com>
+Date: Mon, 24 May 2021 08:27:28 +0000
+Subject: [PATCH] sleepgraph.py: parse unfished cpu exec line
+
+exist the below case in ftrace file:
+sleepgraph-6508    [003] .... 18197.824037: tracing_mark_write: ps - xxx..., lock_torture_wr-94 169,lock_torture_wr-95 143,lock_tort
+sleepgraph-6508    [003] .... 18197.824043: tracing_mark_write: ure_wr-96 189,lock_torture_wr-97 174,lock_torture_wr-98 160,lock_torture_st-99 1
+
+lock_torture_wr-96 was split to different line due to limited buffer
+size(1k) set in kernel, check this case and re-parse the unfinished
+line.
+
+Upstream-Status: [Submitted: https://github.com/intel/pm-graph/pull/20]
+
+Signed-off-by: Liwei Song <liwei.song@windriver.com>
+---
+ sleepgraph.py | 17 +++++++++++++++--
+ 1 file changed, 15 insertions(+), 2 deletions(-)
+
+diff --git a/sleepgraph.py b/sleepgraph.py
+index e340d5b3f03b..38b4439db8eb 100755
+--- a/sleepgraph.py
++++ b/sleepgraph.py
+@@ -3365,8 +3365,21 @@ def parseTraceLog(live=False):
+ 					val = ps.split()
+ 					if not val:
+ 						continue
+-					name = val[0].replace('--', '-')
+-					proclist[name] = int(val[1])
++					if not len(val) < 2:
++						name = val[0].replace('--', '-')
++						proclist[name] = int(val[1])
++					else:
++						proclist = dict()
++						nextline = next(tf)
++						mcont = re.match(tp.ftrace_line_fmt, nextline)
++						n = m.group('ps') + mcont.group('msg').split(': ')[1]
++						for pscont in n.split(','):
++							val = pscont.split()
++							if not val:
++								continue
++							if not len(val) < 2:
++								name = val[0].replace('--', '-')
++								proclist[name] = int(val[1])
+ 				data.pstl[t.time] = proclist
+ 				continue
+ 		# find the end of resume
+-- 
+2.29.2
+
diff --git a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.5.bb b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.5.bb
index 4526eeed3fe6..4d7a1b2d45d5 100644
--- a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.5.bb
+++ b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.5.bb
@@ -10,6 +10,7 @@ SRC_URI = "git://github.com/intel/pm-graph.git \
            file://0001-Makefile-fix-multilib-build-failure.patch \
            file://0001-sleepgraph.py-use-python3.patch \
            file://0001-sleepgraph-add-support-for-RT-kernel-ftrace-flags.patch \
+           file://0001-sleepgraph.py-parse-unfished-cpu-exec-line.patch \
 "
 S = "${WORKDIR}/git"
 
-- 
2.17.1

