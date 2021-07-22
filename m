Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10302.1626971995463653697
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jul 2021 09:39:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=R81wSNGz;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2837ca27b6=joe.slater@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16MFvWUv012925
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jul 2021 16:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=zTcBy9KGj8ey2ARZ7EWpigEFIRdnKI6cw/yCJEnIl9k=;
 b=R81wSNGzzUX6mY/nU2a9t16X/gkuhFCWqUAzwZqaOppI7C17FBHfXMCQ88KNxogQ8qIl
 F9EDz1EInTPQzl2389oOlGEsSomO9xpyEPg4c3LWhU+gou/xEb9QXpngjXm/TlUc0FQn
 hUUikr3Csk8An1F1SVzVQv4k1yF3iHJ6au6oGUwPKGjX8kslkaEl3aUpx0KxGtLVv2If
 P1bXlKNmUkvBR2xmDoqY87l+mi4c1grY8Hi8kheeV65lAjlGrGFk8WJmnYMUBmIdSdg2
 xo5vf8pocuB5vF74K4/1udxT8Wskbn4tCalQSgc2APNixHH6RfN1pc7cfVyWSQaFBeh3 pA== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by mx0a-0064b401.pphosted.com with ESMTP id 39y84kg788-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jul 2021 16:39:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahXuZ0bo8Pg6gcKKgGc3Y64rdWNx9tyTOcml9iZtXbBrrTJiW4O8chKlscKfpuVWR8rhmixd8YmvBVNrOAot3ZUQCVgqXMWl68ZUDMM74wtWLZG4kuLvQsRtCwZKvoC6jAyGefE3s7J5EbqgKrpgVzFcCelJcdWCf1+/I+X4pbp177xPtB8If0KpoI7XtzesY1nrK7pS4+edVq3JWeXDaWjzQRdlxpH7Z9TGTHLgguo5khJbptIsl8c5BYeZ5Ms7fA9LqfIvB4LkzpKDRVes+Y9E+xXPpzM0H8IwM9BO26la8INbgZGd4ZhX9/UPI28jJYdYnYsctXp/nJtFmOcjDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTcBy9KGj8ey2ARZ7EWpigEFIRdnKI6cw/yCJEnIl9k=;
 b=gRyBaH87SDDDhCnwPPiKpZQp10X9amozuIoU1PvHMN2x9gmpL5B6alFTIMw3siPHM/dDIiVPy5YROATtJo+esWxZZit9n7AYKPVPGq8s0RC+dz+vqz1D90EiYBptVHiTCNSTtihdjXaxfM2zkzNxpJnVf8TklH+CiuYY3paUjPbLuP9B1xMhok5hi5RkIoOxFAW0l0U4kA+md/rBmFPo7YAQx69w7qQhaLOSxcVNpULk3vvKNlL2pKI0JFkyK5LIZ2E0NCxnn+tL2a7z71l3W3zDgt5VRjEHHdGnbwsf55/CmaqSx8n3gy88ASOqNitHg/BBJK3AId9Bj+bYSn5Meg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by BYAPR11MB3688.namprd11.prod.outlook.com (2603:10b6:a03:f8::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Thu, 22 Jul
 2021 16:39:51 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::21e7:f902:62e6:1f04]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::21e7:f902:62e6:1f04%7]) with mapi id 15.20.4352.025; Thu, 22 Jul 2021
 16:39:50 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: joe.slater@windriver.com, randy.macleod@windriver.com
Subject: [hardknott][meta-python][PATCH 1/1] python3-pillow: fix CVE-2021-34552
Date: Thu, 22 Jul 2021 09:39:38 -0700
Message-Id: <20210722163938.98640-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: BY3PR10CA0025.namprd10.prod.outlook.com
 (2603:10b6:a03:255::30) To BY5PR11MB3992.namprd11.prod.outlook.com
 (2603:10b6:a03:188::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by BY3PR10CA0025.namprd10.prod.outlook.com (2603:10b6:a03:255::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24 via Frontend Transport; Thu, 22 Jul 2021 16:39:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffdb768d-8b75-434e-8022-08d94d2f533d
X-MS-TrafficTypeDiagnostic: BYAPR11MB3688:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3688A1102480187F0FDD4F4988E49@BYAPR11MB3688.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:94;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nV+rThXw4cq1UNUTOYM5XLFdmVOkEF9Sdf0Zpz6AYPsnu0o3+SdY1f5hNGMjjryjDFOuHqYFI/+vWup/v7tEbLRxKKz2FIJBJUsaI2DNrZliNk2VUHM73VWANRjBX7mLCVy75SAmAi4t11FBzFlFQnlw2FvYj22MADmOZyF1bckrCEPjZ6hG+u1WJuXuzc3RrPmPQ+GoCpVI/xslFozcZVb1JmVu0lDiG0U6JwTiDK3gXUDaFwV1wOyrdGGaxus/GFOG/AT6w5lUmi5G1S5PLy8ZrRW0cdNw55+MQf6GttNnvwfaU0g2RITfSYUGOZrXWDbx+fQ9z7u1faj/L4qbb0sHyNpW6k5HEiy+pBJrGzPtLjzmh+dzYgP6bsncZjr8V1TMqjzhTe/LmDq1FOcdVk38mdljOffEBG9tu7c/cGiUbWcUihJV669hV1bd8RB6hLySNgyDuz/WREUOhucZ8l2fdB9O0APIotn+55XdwIFFbqwhLmEsi4rCMScN8XffvFJMCPuiTEP+dJcNeYg3GTmGXrOwQZi5j40nQ9XiiiUBt35yB2ldptDWB0ngvKL9uYVDHwRDyXP5XM5pu+Vfsb4aLADiOdseA5A/amo3fLwxbLNA/LedTkioIaxyDF1FAIcjgsqApfzsCrp/9yNMkEQ+Wf+cMMwF6+sLXOnnEuZC1RUuODxeG46lRZJUDorP2AZvjFuYnmKmuKWtB6/q5w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(396003)(346002)(39850400004)(5660300002)(4326008)(6486002)(186003)(316002)(36756003)(86362001)(6916009)(6506007)(83380400001)(1076003)(66476007)(66556008)(2906002)(956004)(44832011)(478600001)(6666004)(2616005)(66946007)(26005)(52116002)(6512007)(38350700002)(107886003)(38100700002)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XJTQ2a/nmEsH8NYa2HCFym8+X8XiC/Hq/oML9ApU9l3VF2xlbJk58RZ402yi?=
 =?us-ascii?Q?KG29dkwJkBn97+IjMcSaivOOAd5089zi616c2LPpVe+vVa3PMxTNZVvsH+T5?=
 =?us-ascii?Q?QpZLSztdG4Hnv/BmgKwH5AxzvwekNZARHibXHt3n9HvGti3amEu1X5seKC1P?=
 =?us-ascii?Q?WwgLt+heXv1xIBxpAD4PY9q0hcmzoLkjqUX0P8TcozRfoIOQLHATpOo0w+An?=
 =?us-ascii?Q?BoUboH4/PTdvjTv1e7IYx7mFAspo3DHfmxeYDWP+2LUz6qQa673YXzZyfj2R?=
 =?us-ascii?Q?YLtmqxI9Llj/ZN7tDsYPKSAJjqSplK+wzcDunGvvesdHvTVdZkKUIu4wjG8D?=
 =?us-ascii?Q?vyE4cufpSl4ceBD5HbeIb5l5MVTSRAczjjZ8hzO4EaQWU92okOPuHiLBsH4F?=
 =?us-ascii?Q?O6scHeu16RQ4YsL5ChDwR0zeRsBBkW/lMMieoTBRwvqR8UiHPl3zAhhaNZxS?=
 =?us-ascii?Q?RvQOafevC/LTGGVC3ICH8sF6P+ncvZPFTC3hEkmLmazOZ5gH0b+yehwbD0Lx?=
 =?us-ascii?Q?uvN+RAwNNnRRwCIR0u0ZAc9T6I/8PjKqjzFbYiBhhbvuyksPOuGDKBGp0c+e?=
 =?us-ascii?Q?pvEx1yZmGtZqPRjnzYGtIJ0/P1cX0kZN616ZsweAUV6OrmY37GQazJgmK3TA?=
 =?us-ascii?Q?m+64iIcFvPcFO1dN0qzX5wBN35NiXPx1nV58rWHTmFeGbWRuIiJqC3wZP6tp?=
 =?us-ascii?Q?oZ0ddAce1LEg7Q+0/EVmZ2zZ7FKAWs7V8ggiZZAHtlo3rLCZuuJCHy+FIO62?=
 =?us-ascii?Q?iG/XHKEbNKk2+xyErpnwlzVA6maU4sX/hnpen2GE5dP+GC+NjEiupVk/2Cde?=
 =?us-ascii?Q?Guzu1skwmxsZ97fEPUd96I9210+qLok+pEifY388OKa1zE01OXkmQnHjfs8Q?=
 =?us-ascii?Q?9itODjWwaSuioow6e/OmHq7zP5juIj9TkYwLMZPAyEEc4OjUFEbSbwWVtUyf?=
 =?us-ascii?Q?HaoMnrDE6PjFPCUGMAWsL6MYKCJSMgnaD2uMIClkIpE8co6zlFnBOWhUVQWI?=
 =?us-ascii?Q?4tm8qIiJWE/YbtrNxUbEr8i/ef06eEjfDXcC4NOB4q9qdD9JW2fh0G3ZLD3y?=
 =?us-ascii?Q?7kr7gMHdCUsQkwhdaXKB5WJTJa5p9H+IEe7Gf7daOvVAqjFG7HS/bNvj4ncP?=
 =?us-ascii?Q?v+dEz0Xp8yMey2bGhHr+f0lhS8xvM2YJlpAuJsYSVGm/nrsPjIc6nBgsk7nM?=
 =?us-ascii?Q?hR6OSFgF8mZvK0/jVmnMeQY2ZlEZgufvzXPyQN2uRIUp1P6sMLuWqBIpbk+J?=
 =?us-ascii?Q?3G0MakTn0mo0GTHK8n4I1CWZ5YOpcsnjlykuSWoQhJdldRsGsDYVA9OShQIx?=
 =?us-ascii?Q?qTk5HB8PR5VYK8lUudZjy0ai?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffdb768d-8b75-434e-8022-08d94d2f533d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 16:39:50.7575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2+dAxuXy8N5q3n3DRi43yZlpjHQFtJCWk4K+RwSvdWPG6DIuprUGyYNee3MNabzMOdux6r4sUsmYycfxQTRhXoihUT3qnwidsqECknAmbIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3688
X-Proofpoint-ORIG-GUID: YHS8a5HbzAG0GHT17gtHHRDdxNxAvXxx
X-Proofpoint-GUID: YHS8a5HbzAG0GHT17gtHHRDdxNxAvXxx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-07-22_09,2021-07-22_03,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 mlxscore=0 clxscore=1015 adultscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107220110
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Pull fix from version 8.3.1 back to 8.2.0.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 ...Limit-sprintf-modes-to-10-characters.patch | 49 +++++++++++++++++++
 ...0001-Use-snprintf-instead-of-sprintf.patch | 43 ++++++++++++++++
 .../python/python3-pillow_8.2.0.bb            |  2 +
 3 files changed, 94 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/0001-Limit-sprintf-modes-to-10-characters.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/0001-Use-snprintf-instead-of-sprintf.patch

diff --git a/meta-python/recipes-devtools/python/python3-pillow/0001-Limit-sprintf-modes-to-10-characters.patch b/meta-python/recipes-devtools/python/python3-pillow/0001-Limit-sprintf-modes-to-10-characters.patch
new file mode 100644
index 000000000..d61ae3a62
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/0001-Limit-sprintf-modes-to-10-characters.patch
@@ -0,0 +1,49 @@
+From 5f4504bb03f4edeeef8c2633dc5ba03a4c2a8a97 Mon Sep 17 00:00:00 2001
+From: Andrew Murray <radarhere@users.noreply.github.com>
+Date: Tue, 15 Jun 2021 15:14:26 +1000
+Subject: [PATCH 1/1] Limit sprintf modes to 10 characters
+
+Needed to make CVE-2021-34552 fix apply cleanly.
+
+commit 5f4504bb03f4edeeef8c2633dc5ba03a4c2a8a97 (unmodified)
+
+Upstream-Status: Backport
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+---
+ src/libImaging/Convert.c | 10 ++++------
+ 1 file changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/src/libImaging/Convert.c b/src/libImaging/Convert.c
+index 8c7be36a2..1fa74a13b 100644
+--- a/src/libImaging/Convert.c
++++ b/src/libImaging/Convert.c
+@@ -1594,9 +1594,8 @@ convert(
+ #ifdef notdef
+         return (Imaging)ImagingError_ValueError("conversion not supported");
+ #else
+-        static char buf[256];
+-        /* FIXME: may overflow if mode is too large */
+-        sprintf(buf, "conversion from %s to %s not supported", imIn->mode, mode);
++        static char buf[100];
++        sprintf(buf, "conversion from %.10s to %.10s not supported", imIn->mode, mode);
+         return (Imaging)ImagingError_ValueError(buf);
+ #endif
+     }
+@@ -1645,11 +1644,10 @@ ImagingConvertTransparent(Imaging imIn, const char *mode, int r, int g, int b) {
+     }
+ #else
+     {
+-        static char buf[256];
+-        /* FIXME: may overflow if mode is too large */
++        static char buf[100];
+         sprintf(
+             buf,
+-            "conversion from %s to %s not supported in convert_transparent",
++            "conversion from %.10s to %.10s not supported in convert_transparent",
+             imIn->mode,
+             mode);
+         return (Imaging)ImagingError_ValueError(buf);
+-- 
+2.29.2
+
diff --git a/meta-python/recipes-devtools/python/python3-pillow/0001-Use-snprintf-instead-of-sprintf.patch b/meta-python/recipes-devtools/python/python3-pillow/0001-Use-snprintf-instead-of-sprintf.patch
new file mode 100644
index 000000000..fc0337f13
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/0001-Use-snprintf-instead-of-sprintf.patch
@@ -0,0 +1,43 @@
+From 518ee3722a99d7f7d890db82a20bd81c1c0327fb Mon Sep 17 00:00:00 2001
+From: Andrew Murray <radarhere@users.noreply.github.com>
+Date: Wed, 30 Jun 2021 23:47:10 +1000
+Subject: [PATCH 1/1] Use snprintf instead of sprintf
+
+Fix CVE-2021-34552.
+
+commit 518ee3722a99d7f7d890db82a20bd81c1c0327fb (unmodified)
+
+Upstream-Status: Backport
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+---
+ src/libImaging/Convert.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/libImaging/Convert.c b/src/libImaging/Convert.c
+index 1fa74a13b..9012cfcd7 100644
+--- a/src/libImaging/Convert.c
++++ b/src/libImaging/Convert.c
+@@ -1595,7 +1595,7 @@ convert(
+         return (Imaging)ImagingError_ValueError("conversion not supported");
+ #else
+         static char buf[100];
+-        sprintf(buf, "conversion from %.10s to %.10s not supported", imIn->mode, mode);
++        snprintf(buf, 100, "conversion from %.10s to %.10s not supported", imIn->mode, mode);
+         return (Imaging)ImagingError_ValueError(buf);
+ #endif
+     }
+@@ -1645,8 +1645,9 @@ ImagingConvertTransparent(Imaging imIn, const char *mode, int r, int g, int b) {
+ #else
+     {
+         static char buf[100];
+-        sprintf(
++        snprintf(
+             buf,
++            100,
+             "conversion from %.10s to %.10s not supported in convert_transparent",
+             imIn->mode,
+             mode);
+-- 
+2.29.2
+
diff --git a/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb b/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
index 3241230d1..40745bb76 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0337b116233da4616ae9fdb130bf6f1a"
 SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=8.2.x \
            file://0001-support-cross-compiling.patch \
            file://0001-explicitly-set-compile-options.patch \
+           file://0001-Limit-sprintf-modes-to-10-characters.patch \
+           file://0001-Use-snprintf-instead-of-sprintf.patch \
 "
 SRCREV ?= "e0e353c0ef7516979a9aedce3792596649ce4433"
 
-- 
2.29.2

