Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE71C5475B
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 05:35:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14696.1709876113999314859
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Mar 2024 21:35:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VXyx8ZWp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=37975a1424=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4284n2De014823
	for <openembedded-devel@lists.openembedded.org>; Thu, 7 Mar 2024 21:35:13 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=kpqllwsBADKCRN267+
	b9HbwNkxCtUFNxYBAjzsOw1gw=; b=VXyx8ZWp9jcDxH9QHfsvbN1/pCWQjOiKFl
	M8r3/sZyRzHTz8wVmoSeFadQQbDu3RcwHmvG9sWqcsPdE8QKjTC0Zx5pJ4WwIipA
	1wocwiufX0ZrzbqQ+dsnF1NykSb80yuXly54W1MOHHpuxE0GQ27ozf/ZGh6dFNsh
	aYBCf+fH0Z3fiP3b9m4Al9Yv+OAtx0L9nAYUYwcH1m21R629t54EfACN7QBWO9DP
	CpNA5wu9P12dLaDclhbRTBBsA06RC7JzLFTQ6JvD1kDQZSspzIiM9XEJe7Jdt61I
	r7sgltuMpvbjL8EmXWmv2IDf9QsQgKtRmuEOukOmx11/pbrW4ZsA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wm4gm5d58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 21:35:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lyOdRsBIrvbudfgzTJB6Fvk1qWzmSpnZWcR9OlWkfOrpUAFMMZ3VxY+Tr/ug+egD5bcW32XtnaSnaTha+C1kFm4kz1wT8if8FXW4UdJYtDJguIGCLvL8LVOd0Xcgnptzb9082futXN4v4+ZDArjambRBo6+DlPiUIDWPxtbJv+vRDQwYdgMheYCJkby95SUxb62tyCQgg0xpv7ocw6G0apo6yZSM5mlYDd/hRaygeRM35vb3e0Led7kCFYqoV/eQqWmxGkmghAMLRyrVuVS7cVUJOYKw7PWx2lw6N8cJiSuZ/GipjI29/F0cjxL0+/Bt04j8+VVbwwp5NpQxwOlFhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kpqllwsBADKCRN267+b9HbwNkxCtUFNxYBAjzsOw1gw=;
 b=Vi4Ty2srHFk3e5kU+wPBPmYoY8lE74MmbU/yl+k7hYvi+mqs5cjVLtSMFuyZPweffaxWbAKhqskMUzNSmvzQ7Zo3Op+w1E70OFff9YyIM+56vXQQdcy7n2k52+RsKhClejDaqp5USVIYjzPX/D2n5OwiZ0P40QpFMMxEa/M31UJ3qBYOjtYeUXxORhOJilevf56LiTPUwo+vnbcQGv5dXEjki+wpDXw90x1tj0gdroUi2XCDKovJLA0ru2RpNVOYjykcm1Lnu5AeuEgcbO3Nsxv1tyS4MZrVTflrX8F6QSLBRr+9U9beg9EsoZ3LSk19+pgn0vGbm0Arpg4BEjCLug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by LV3PR11MB8529.namprd11.prod.outlook.com (2603:10b6:408:1b3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.8; Fri, 8 Mar
 2024 05:35:10 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0%4]) with mapi id 15.20.7339.024; Fri, 8 Mar 2024
 05:35:10 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] tcprelay: fix a minor cross compilation do_configure issue
Date: Fri,  8 Mar 2024 13:33:19 +0800
Message-Id: <20240308053319.3086146-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::11) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|LV3PR11MB8529:EE_
X-MS-Office365-Filtering-Correlation-Id: 95759917-0589-4cca-2b4d-08dc3f3184f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aV52d2cts8OhdXd6CTbrTXNdC5Ef3/YzKp30cBgwUI/jGmnTMp8SaezT0Gkq7gnihuFRwC8JhitVy6Sd0yhHnz5mFh01MoEhg7mO4TAwtQuw9WNlvSiu6hXuetuqO4yNsfYSzx4GnWvL2u5gPPCVNP1Fy83oQZ1oqFEWAk1pkHznBBCSV50JM8hChijT58lbcTZxB3ay5kzYj/OrNM9NQJF2+aP2fR3DrTrDoBSXqgOGdqaWt6yWQNXA/8va98RJ/p3nwVTUyTL3rtAm2YR8Hyz9ecXkSt/FAHJkRZEtS63OEWG4dBmNMQoYBKMkrYwpgstSMQpr/yx/WwzD04fdnVk9hTQUXCuiFApVXpx6W/6g6g2ebVeS1lVTPWIluy0zSUvBg0TzKvfYh38tS2cQc7e7NlgCJ0JpFuwchclTSIGdOyx/6mKCWSTz1f9cwQucWndJAukGqM+ddl9SZ1r3fwv8M0IrFVFoWTWrU5nIZ+wSvd1GxWlfDrK0u1RYQjsvcRgcLjIJZUP2Txnl7313iGOAOfbbNO917uS7G4EfLvfGBPFuJ445g2ZsQ7bSQVPlQ1n26xipbuZ8w9EPOQvsH0/Qf3bAFDNTiXrvOTz2xL1D/Vh0HeKTgiGVReoWc8LJ1WQAUYfI2/HgnhHXkCMDJlKJnPgSWVsAeeujp8rBl9c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(1800799015)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TJyVm1GiovHixXsTs94zIO3ezusETLl4o4u3t7zNZYknFpPXqKvhHzRGYBaO?=
 =?us-ascii?Q?OFwj3DKYj9gAF0RgfqW9s+qfcDN5SImYqBLibf+Fn5bThjVigTB3Y7xy8Rsd?=
 =?us-ascii?Q?j4JU4QO6/tsh7iSs9T/MlWSN1T6qLoyRKeTKHi9U/Kh7cjwi8qRFKie1SoEy?=
 =?us-ascii?Q?0VyIHAw97BW/ki9humHpQPoVD2T7sJxZEAZ/eRg2fdMV71+gvD2GZD382oB+?=
 =?us-ascii?Q?r/G5uYnZtU7p44CemmqqTuD9YwPEUF4koxKUy2QT7g4G2VmP0yoH+Tjbm5z8?=
 =?us-ascii?Q?mHHtLftLJop0CVaCBYBP9A7qkyvZRVxj7i65FXhq6WUMc76O0O1HxjyObJNk?=
 =?us-ascii?Q?sSEfdy6mkd8ULESqAxlQDCRF14B3OfYDSQah3Z1R3RfKHjc3725Y4qKwNtno?=
 =?us-ascii?Q?2ncB6wScuBv3Gtx+QOLSSj0T02C9ZHBB93igCpjIofCNHpDMP/M9UlUw1Y6t?=
 =?us-ascii?Q?k+4hsr0hropTkq+vNGxqOyYgCt6Dwbq1nXWZk9DFmrFhwGaRroY2b1tMsAxn?=
 =?us-ascii?Q?sESeh1gUYQr7e6nnB1hoG+5IOUPIWvSNjmo43zah6S1y9j8xFvN8pdXMkBRK?=
 =?us-ascii?Q?IQrJmSTt1sF55PDbTxIW1Yu16aW+cQ53AVUk9Dko+k/72oB2ci7ght5ub/zr?=
 =?us-ascii?Q?chGGf5uL6I5DNG9i+N5q5ks7r60QoHcmdZI7yBsMyIXHy+DoUJj4IUqRgWsr?=
 =?us-ascii?Q?2BtaYhZqHxWl5TNGfdST8ZVyyyrHRC7MJtSldc0wWlPRhtAtx3/5NBVkVsZo?=
 =?us-ascii?Q?5A1Ky3R0dSojKZ+f16CNVm5DgNvhIx6tAshM5hdVonxcshdCo3+sVy+W22py?=
 =?us-ascii?Q?6UhcnwrNkpjMAiovVNkXkZf+g1/kzV3SUhC1BjSGU1U4uTNpsdy83q6V7DyZ?=
 =?us-ascii?Q?uaHllmMyqCOSzjY8erTEMIZg7kExcZlADwFj6qU5SPNWf+qaaAL6iInTkBul?=
 =?us-ascii?Q?g+PYQGifNmF9jEHJDZOHAbJOmI/UYFdJ1C3Y3D5/tZmvbVkLSMRaC6qRDzur?=
 =?us-ascii?Q?QgKMOXgtS7csu7PEnEiM3KDmZtfsgPkNY2hwn0YQFI//LAVeofM0/OJMWD5r?=
 =?us-ascii?Q?5jvf+89+xTS9WKfF/+bHxATuJDGReddU/3t3tYQRm5LLFsHNq14m0OM76Un9?=
 =?us-ascii?Q?nKP/NyzJCLMWy46RUJcDcaCwAxIVLST/n8bVfD7/u71OBLcT//dUPge/92ae?=
 =?us-ascii?Q?UxF1HMr1TZStSM0J+U0TYDVIj9Sy84r1eLEEos0vAzNXSZ2w/2Ov/xGcdAzW?=
 =?us-ascii?Q?baKXNN/PZt5d9F+/WwfRwVT9BjNngDO5Nf6V5OUy8deDs0vw7ABVGllLKCj6?=
 =?us-ascii?Q?q+20B88jqgwb72C/Z8ulxAN6raaMaHfQs+NEs62Grx9zwZHDx8tWTUMVpJtb?=
 =?us-ascii?Q?M+aIv58OXjmzafTY6bGzks2E7gwgz13LWqyigJ4A5ScznoBYcqd/nO1CvmWZ?=
 =?us-ascii?Q?LXa2fRkA9+08w+ftYzU7EDRuRE1dsywSr0OvWkwGjj9t9ugfr0tC5zgotLOU?=
 =?us-ascii?Q?IeyGkb2m7/3Nq2OkrTSqqOLDzPUZlAFD0GZ2s8dJUb3Ttediu6gf7B9+SWNk?=
 =?us-ascii?Q?kiDyp2eteD5Sh7glv3WoNEIGdNoGFRfbLY0oM2Y1?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95759917-0589-4cca-2b4d-08dc3f3184f6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 05:35:09.9265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MXi96A0D5h+77B9SzK5kTDlLIuL3aqjO6fYT7oT/tDdDitylLPL/clq5uOZxScP+99IPsvhM52h7UGvKEltxLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8529
X-Proofpoint-ORIG-GUID: 5fNkWuR8EusY522dxRYi2obcIYadkIok
X-Proofpoint-GUID: 5fNkWuR8EusY522dxRYi2obcIYadkIok
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-08_04,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 mlxscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403080043
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 05:35:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109218

From: Chen Qi <Qi.Chen@windriver.com>

We're seeing errors like below in log.do_configure:

  ./conftest: cannot execute binary file: Exec format error

The tcprelay's configure have two places to execute ./conftest.
And the result happens to be correct even with the error above.

Instead of leaving the errors as they are, we explicitly skip
running ./conftest in case of cross compiling. The build will
continue to succeed and result will remain the same.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...not-run-conftest-in-case-of-cross-co.patch | 51 +++++++++++++++++++
 .../tcpreplay/tcpreplay_4.4.4.bb              |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/0001-configure.ac-do-not-run-conftest-in-case-of-cross-co.patch

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/0001-configure.ac-do-not-run-conftest-in-case-of-cross-co.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/0001-configure.ac-do-not-run-conftest-in-case-of-cross-co.patch
new file mode 100644
index 000000000..08cb3b88f
--- /dev/null
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay/0001-configure.ac-do-not-run-conftest-in-case-of-cross-co.patch
@@ -0,0 +1,51 @@
+From 42f7bbc1ce4913fe2c0bc76293c5445d31690f5d Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 7 Mar 2024 21:02:07 -0800
+Subject: [PATCH] configure.ac: do not run conftest in case of cross
+ compilation
+
+It'll give us nothing but error like below:
+
+  ./conftest: cannot execute binary file: Exec format error
+  ...
+  ./configure: line 23950: test: -eq: unary operator expected
+
+The version check only has effect on Apple systems. We'd better
+avoid error like above when cross compilation.
+
+Also, in case of cross compilation, instead of having the above
+Exec format error and resulting in unaligned_cv_fail to yes, set
+it directly to yes.
+
+Upstream-Status: Submitted [https://github.com/appneta/tcpreplay/pull/849]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 387219de..15201601 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -928,7 +928,7 @@ cat >conftest.c <<EOF
+ EOF
+ ${CC-cc} -o conftest $CFLAGS $CPPFLAGS $LPCAPLIB \
+     conftest.c $LIBS >/dev/null 2>&1
+-if test -x conftest ; then
++if test -x conftest -a "$cross_compiling" != "yes"; then
+     full_libpcap_version=$(LD_LIBRARY_PATH="$LPCAP_LD_LIBRARY_PATH" ./conftest)
+     libpcap_version=$(echo "$full_libpcap_version" | ${CUT} -d' ' -f3)
+     pcap_version_ok=yes
+@@ -1709,7 +1709,7 @@ case "$host_os" in
+ EOF
+         ${CC-cc} -o conftest $CFLAGS $CPPFLAGS $LDFLAGS \
+             conftest.c $LIBS >/dev/null 2>&1
+-        if test ! -x conftest ; then
++        if test ! -x conftest -o "$cross_compiling" = "yes" ; then
+             dnl failed to compile for some reason
+             unaligned_cv_fail=yes
+         else
+-- 
+2.42.0
+
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
index 53f17c961..26de40a65 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=10f0474a2f0e5dccfca20f69d6598ad8"
 SRC_URI = "https://github.com/appneta/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
     file://0001-libopts.m4-set-POSIX_SHELL-to-bin-sh.patch \
     file://0001-configure.ac-unify-search-dirs-for-pcap-and-add-lib3.patch \
+    file://0001-configure.ac-do-not-run-conftest-in-case-of-cross-co.patch \
 "
 
 SRC_URI[sha256sum] = "44f18fb6d3470ecaf77a51b901a119dae16da5be4d4140ffbb2785e37ad6d4bf"
-- 
2.34.1


