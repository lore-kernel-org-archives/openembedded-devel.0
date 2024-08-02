Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 895BFC52D54
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 00:59:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.83303.1722560350052355410
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Aug 2024 17:59:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8944593547=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 471NgZMr007085
	for <openembedded-devel@lists.openembedded.org>; Fri, 2 Aug 2024 00:59:09 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40rjf2r41x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 02 Aug 2024 00:59:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O9XEnJ385Nn38lzN9vu5Ci83XfqkvqyM5TPt4vIM26bdJEJzyOdNnt1Intsth4TNv8iyb3L/rECc3G+YHYBQCRZnMkrN5mLFeyvSGfentni0vdaM0K3jltsu9NfHMW63ZS/oKgX1HGDGrX50N5NWsQoCOD51mezJJcStZ/q7bSp0qVVlltA0rkDWpHMU1VoMB6rdT7g04gO9fPxe2Q+xTuNeFHCk48ZaUIsYEe2ipwhiALguQObnP04L170pWZnvUQi9OnKDsnnokdb6hGT/TTCJW+HNVvNdv6hTqmmD+59ITmaUSIhkF4ThcwkWjd8u/9bNXA+iWXnAgmtMobGa9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bozE+eeNqhJJI7GKaFBmqTFbfiC9G/zg8q+xDLv18tw=;
 b=vF22nCRxXr82TqG6tJntVaX2EkjouzM54QIlGtDUS/wwvf/iG6Yb6JtML/SCU1AfqJZsmUJTG5bMBIVV9ySt60tyx++5DL4CyGMi4XyyBT+Ru3i9jRo5l9ovuBAfwmR94U61/Yya2PR1V5peNbgbzpj2ShZ7UEnr1L32nBb3C+B1+4XO3+PIgGbL9axiCWue8gIK5MvYbhWzpHVQlewpVw5c0j1bYE2wiACnJaOZg/iD/bNoJBVav3kHMPngdxuJVP5SClGxs0rPtXdqOcosKgfmS6PlWf/BLHWYV/fxJ8Uya8Xg5ykEWGhZ46xYL1yibkQ83+z6a0d8Rt5FHNe4xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA1PR11MB7871.namprd11.prod.outlook.com (2603:10b6:208:3f5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Fri, 2 Aug
 2024 00:59:06 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.7807.026; Fri, 2 Aug 2024
 00:59:06 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] tcpreplay: upgrade 4.4.4 -> 4.5.1
Date: Fri,  2 Aug 2024 08:58:54 +0800
Message-Id: <20240802005856.1717959-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:404:56::29) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA1PR11MB7871:EE_
X-MS-Office365-Filtering-Correlation-Id: 908deb12-f708-438f-28fc-08dcb28e4f2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?g9Cm8JtPhRStIzebqUwhYt5tnHUvAtQ4TPlJD0ym5D4/WRexijyqkS/wDr1k?=
 =?us-ascii?Q?4qONhcbD8ZerG++F0PwUxUE1YTt+hybK6vVpggStWsM5JivHhdrOMl6Y3RVa?=
 =?us-ascii?Q?I+QQnYqJa/p7JmYovWQKrbdsioMtfd5hSY7g26M6Z4vcrqW4/OrUnnGdJyoX?=
 =?us-ascii?Q?2YDb2pArBnxfiHrgKSw1vZOyeCVdqgHfOOglP3nwntGZCBUiGkc7uhgHFfL4?=
 =?us-ascii?Q?xYr1jM+HB8zB2l/4qu0PA5zEUyDtOOIPiDmRY2xEBlnjPzB8D8O4qd57xSgS?=
 =?us-ascii?Q?ZAnasj731BCbDv2qjHTdrbcJd+rJF1ZZqEoXY8beXMgmEhF7/WG/aTLQdRg5?=
 =?us-ascii?Q?fb5vtw2iFqKPZynavSSivncwa/cc2IDihkYcdBY+ZmZpfgpTXEYi2qDXtpTM?=
 =?us-ascii?Q?Q0NbuxxraPkvXO+gBqnxjgmImZY0IBMkjIyMWwHovyQTQvUTH51JthNoH2Ae?=
 =?us-ascii?Q?4FGWkViqicr3rDxjpOluB3zEWGKqNzNBYT/2ordOItD6Be7zg24CmHPRowse?=
 =?us-ascii?Q?C4gETMEF0Fp1KokZ2c/g2+ZK4PkBozopcLEIi+z0xuKDSk5VqA+TO6NtZWG5?=
 =?us-ascii?Q?+xsm8BDB+121oYb+qIqhdN2T8OJ0ZDBA/8JfeDz0jGwvcnyf79rMogKH2Ma+?=
 =?us-ascii?Q?vxj7PLKKmQexS3j7XKEepn0hcxXkUazRApTEUzjQOSb46lo25wKoQS6321CV?=
 =?us-ascii?Q?yVTvo7kxJufa2I79E21AtCx1iPO9iw20g0x2+bVqoXYfODCB3ruZ5UkjH23M?=
 =?us-ascii?Q?2Z4OwEy3fsa1M86EWx9+RjyW0KJzboKmvVU8qClOLrtPmc0tjMVcTvpXS1Wd?=
 =?us-ascii?Q?/xPcayR9zYpur6pTwYFlRaLM6oDYW7L755Aziron3QRmtF5Iibtu1Gf4eQbw?=
 =?us-ascii?Q?+mcARtaPzlX3B1XaoQ7EIFzX3+7P71by3tiizfjFpwWtRi5JCyg/1dHQlmNH?=
 =?us-ascii?Q?TVdwcBASV0+VMgKRbPuvWwZYAUAjo40bBPm27UL3HPmtZOnpKgHTjAWOLY7C?=
 =?us-ascii?Q?oDjhrYzluYcnIQvTXWYAeKL1pLRPeSPuhnflsGodF9RcNY1IpTheSVX/jgEd?=
 =?us-ascii?Q?BIMkYHqbp18YHiMw6x5EUbDtf4XLeHz56ucvCxOJgb3w0sofgCkAbclWFgZt?=
 =?us-ascii?Q?MHpv4zwSCic1YWRXHZCDmJMMP6zzCTkG2AHCL9lr6+uHUh2yco+EMm5FiC3V?=
 =?us-ascii?Q?7vob9OQ8y1FEZtZwTU73jx+BUpW/ezFGAgOmRWSGm2P5QI2jaSPioo+ZymKF?=
 =?us-ascii?Q?Kl23G29HKTzLT1Q3zI67u72m5K2W4HrxYigsyXbiZIx6qhYROOzff+7zd5A5?=
 =?us-ascii?Q?bEMUF9Yyr5wCyd2LH2M11NBxiHWTswYAvQIlpSZ+8OPG2VGJpvAF0C586iCE?=
 =?us-ascii?Q?5iCIOLk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QhVc3Do5fE7ktYk49wOq3SalgbEc0oXHGT9D5IKhD9sH4S9Zz0yoSy9C3EnT?=
 =?us-ascii?Q?nm126LRXz6kp5PV8XRvTnoQNVQ44TCDXTQxYH9Ya3KBd2aPcnIlJkKKC32aq?=
 =?us-ascii?Q?WbSO5p77y3GUUPea82HPz3iGFCB+F/2JW9DgcdeWIwdrOe6dB75qyu9C+wET?=
 =?us-ascii?Q?Afmb9U6gx/8cP6xfKWjbRHURbVNNKpfrD8nrNlv7O1l2+/XTbvXdS6Zf5tvg?=
 =?us-ascii?Q?X99EgVkAhvk0Xk7zvIgzeAlDEkd/b2AK5CAirc0/LRknXfxxk3kFIfpbBa2/?=
 =?us-ascii?Q?uAKbVeVacGMxJ6EqT38oiUt3JK6nJV3+B0mTrSPGwuOtw/NJNo1j14pkB+0P?=
 =?us-ascii?Q?emD+/1NxsbFxu2H+sM9bfBRqeSdQoYneyq/0Xg56ruyZI3ISJ8bQvZ92TBy6?=
 =?us-ascii?Q?HeTrY+LbnAxkE9eoCExg+/8NdN1GUVizJuLaTHmwni20dknd5tc3lhbrgyOV?=
 =?us-ascii?Q?cCQrwYixi2yMqhBnwsaYYzMDTs5f/QBbIsZhlqcZrWLmM/226Aml9eNZ1NfV?=
 =?us-ascii?Q?M5DE1vWxhwq156wwmz6dGlvR1U4NS9zy/P3chR/v5dY8Yy4/Ovy7iTF7vDuB?=
 =?us-ascii?Q?wnaDD7X8r9PH9zMw4nP30L1REtI68yDbwG90d/0W42KP0h+rp1/ROtkAx6w6?=
 =?us-ascii?Q?5hOYX4pdUlJtYoNdUkGm37nepqnDWZLWfbcCKpweFHDE3K5ikb+5fRPqKQPP?=
 =?us-ascii?Q?hhasYVKsvb90pWdmjgDINvz+QkwPrmOTwDzAeYuJCfCOVfwUfVjnOCt0ImH0?=
 =?us-ascii?Q?4TKKq0Y5jWU2BHtoRPdsiUgOmmp9Ym+yphWWSOSd9WNUX/NNuNvAXd0nJ2cz?=
 =?us-ascii?Q?0umCZYChwqvg+O5UBQplF+gK3HE6jEO+KigLYew5It0FhPjTJW+luGeHJXY7?=
 =?us-ascii?Q?OfLfkfMGUPJg+3ICnErL6zYoQ5FAvFHC39uqX5YDTg5I8Xol0eu6N+QEfWxA?=
 =?us-ascii?Q?RtgmpJypJP2xpUF/s8KDh/RZmO4W0c8+cjr9HN8+a1OvIvTK03BSCrIpcXLF?=
 =?us-ascii?Q?OHEg1GsEiDn9Oeb/dwGTyIJhxpN9bF3+32kPYrvnCbi5lXYhQ5PRubEMH/ZJ?=
 =?us-ascii?Q?PMtECdhAPuRsPCjZqJ6CYvaJK6JjTwKlimMWVHag/bkTD5DSSgPre/kHi7rs?=
 =?us-ascii?Q?iEFF4ofX4OVgFC5HdmUyLS4GFEj5ai19fW0OTD5ZUjAac2MFApXGKAngalDh?=
 =?us-ascii?Q?CnDXzxtgVw6g9loejN1SKFYtW3sVoMfLG0wwrsln3u72mz9SLIYfmFdYMz6F?=
 =?us-ascii?Q?ptsbpqbamMBhnw8HsJI0c7AHwQixRMWCzGZL5/pVslKtPFnFetcBwjqfShEp?=
 =?us-ascii?Q?gKxmQi9lAmjHsv4bWzHP4SGdflmTUN0ygT7mQK3oXw9LteWfS7Zi7izkJWBr?=
 =?us-ascii?Q?3PW3G8EYDQwFm4ShvCgP9TpU2TsTvzzV2VhXuH3mLxQ8GY/VfFGc+TdyiK2T?=
 =?us-ascii?Q?WA1m5KKHmY3ubsNpH/ZDZg26DTFszOBO3yFmujPj1lCzCfdxiKhM4B54ZixQ?=
 =?us-ascii?Q?4ethq8eR6lJ7jwcNp3AHiImHXE5Jj4GnXoTnVOI9r+an8bjMEaKDaxHHPiaC?=
 =?us-ascii?Q?48uBwXhZmGTsS2/53UWlkFTBByEbvKFg39CWqCqC?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 908deb12-f708-438f-28fc-08dcb28e4f2e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 00:59:06.5589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XrtMWChnQ1L4XQ5Yyk8lyTptkqkqhu+lpWr8o4W8b/HYLpNPc0/KxmcghlxyIKrLPRPDT5nmAW+Z7lGb8abcYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7871
X-Proofpoint-ORIG-GUID: jx1gc4arUPwmqG0Us7BipcqPhKs1uxkp
X-Proofpoint-GUID: jx1gc4arUPwmqG0Us7BipcqPhKs1uxkp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_23,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 adultscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2407110000
 definitions=main-2408020005
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Aug 2024 00:59:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111494

ChangeLog:
https://github.com/appneta/tcpreplay/releases/tag/v4.5.1

Drop patches that have been merged upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...not-run-conftest-in-case-of-cross-co.patch | 51 ------------
 ...fy-search-dirs-for-pcap-and-add-lib3.patch | 82 -------------------
 .../tcpreplay/tcpreplay/CVE-2023-4256.patch   | 27 ------
 ...{tcpreplay_4.4.4.bb => tcpreplay_4.5.1.bb} |  5 +-
 4 files changed, 1 insertion(+), 164 deletions(-)
 delete mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/0001-configure.ac-do-not-run-conftest-in-case-of-cross-co.patch
 delete mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/0001-configure.ac-unify-search-dirs-for-pcap-and-add-lib3.patch
 delete mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-4256.patch
 rename meta-networking/recipes-support/tcpreplay/{tcpreplay_4.4.4.bb => tcpreplay_4.5.1.bb} (70%)

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/0001-configure.ac-do-not-run-conftest-in-case-of-cross-co.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/0001-configure.ac-do-not-run-conftest-in-case-of-cross-co.patch
deleted file mode 100644
index 08cb3b88f..000000000
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay/0001-configure.ac-do-not-run-conftest-in-case-of-cross-co.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 42f7bbc1ce4913fe2c0bc76293c5445d31690f5d Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Thu, 7 Mar 2024 21:02:07 -0800
-Subject: [PATCH] configure.ac: do not run conftest in case of cross
- compilation
-
-It'll give us nothing but error like below:
-
-  ./conftest: cannot execute binary file: Exec format error
-  ...
-  ./configure: line 23950: test: -eq: unary operator expected
-
-The version check only has effect on Apple systems. We'd better
-avoid error like above when cross compilation.
-
-Also, in case of cross compilation, instead of having the above
-Exec format error and resulting in unaligned_cv_fail to yes, set
-it directly to yes.
-
-Upstream-Status: Submitted [https://github.com/appneta/tcpreplay/pull/849]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 387219de..15201601 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -928,7 +928,7 @@ cat >conftest.c <<EOF
- EOF
- ${CC-cc} -o conftest $CFLAGS $CPPFLAGS $LPCAPLIB \
-     conftest.c $LIBS >/dev/null 2>&1
--if test -x conftest ; then
-+if test -x conftest -a "$cross_compiling" != "yes"; then
-     full_libpcap_version=$(LD_LIBRARY_PATH="$LPCAP_LD_LIBRARY_PATH" ./conftest)
-     libpcap_version=$(echo "$full_libpcap_version" | ${CUT} -d' ' -f3)
-     pcap_version_ok=yes
-@@ -1709,7 +1709,7 @@ case "$host_os" in
- EOF
-         ${CC-cc} -o conftest $CFLAGS $CPPFLAGS $LDFLAGS \
-             conftest.c $LIBS >/dev/null 2>&1
--        if test ! -x conftest ; then
-+        if test ! -x conftest -o "$cross_compiling" = "yes" ; then
-             dnl failed to compile for some reason
-             unaligned_cv_fail=yes
-         else
--- 
-2.42.0
-
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/0001-configure.ac-unify-search-dirs-for-pcap-and-add-lib3.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/0001-configure.ac-unify-search-dirs-for-pcap-and-add-lib3.patch
deleted file mode 100644
index 709d2cccb..000000000
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay/0001-configure.ac-unify-search-dirs-for-pcap-and-add-lib3.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From 5f8c78362b3b1e06f5adff2d4b140509c4799894 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sun, 3 Sep 2023 12:31:59 +0200
-Subject: [PATCH] configure.ac: unify search dirs for pcap and add lib32
-
-* add lib32 because when building lib32-tcpreplay it's
-  impossible to set --with-libpcap so that it would find
-  both include files as well as the library in lib32 directory
-
-* maybe it would be beneficial to split --with-libpcap
-  into --with-libpcap-includedir --with-libpcap-libdir as this
-  already searches in the --with-libpcap value with and
-  without any "lib" prefix, but include files always expect
-  "include" dir there
-
-* most of this code was added in:
-  https://github.com/appneta/tcpreplay/commit/202b8e82f9fd3c84ce5804577caeb36a33baabe7#diff-49473dca262eeab3b4a43002adb08b4db31020d190caaad1594b47f1d5daa810R570
-
-* then search for
-  ${host_cpu} lib/${host_cpu} (without -${host_os} suffix)
-  and ${build_arch}-${host_os} lib/${build_arch}-${host_os}
-  was added, but only for search of dynamic library in:
-  https://github.com/appneta/tcpreplay/commit/c3d5236563985a99f8bb02c3f1bd6950e3929047
-
-* ${build_arch}-${host_os} lib/${build_arch}-${host_os}
-  was later replaced with:
-  lib/${MULTIARCH} ${MULTIARCH}
-  and it was added to static library search as well
-
-  but for dynamic library it was searching in reversed order:
-  ${MULTIARCH} lib/${MULTIARCH}
-  https://github.com/appneta/tcpreplay/commit/ed9e3a818bde04813144014561e62f018c9eb85f
-
-  I don't think this reversed order was intentional, just unify all 4 cases
-  to use the same directories in the same order
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-Upstream-Status: Submitted [https://github.com/appneta/tcpreplay/pull/819]
----
- configure.ac | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 387219de..26ba31a5 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -671,7 +671,7 @@ AC_ARG_WITH(libpcap,
-         LPCAPINCDIR=${testdir}
-         if test $dynamic_link = yes; then
-             for ext in .dylib .so .tbd ; do
--                for dir in . lib lib64 lib/${host_cpu}-${host_os} ${host_cpu}-${host_os} lib/${MULTIARCH} ${MULTIARCH}; do
-+                for dir in . lib lib64 lib32 lib/${host_cpu}-${host_os} ${host_cpu}-${host_os} lib/${MULTIARCH} ${MULTIARCH}; do
-                     sharefile=$(ls ${testdir}/$dir/libpcap${ext}* 2> /dev/null | sort | head -n1)
-                     if test -n "${sharefile}"; then
-                         LPCAP_LD_LIBRARY_PATH="$(dirname ${sharefile})"
-@@ -690,7 +690,7 @@ AC_ARG_WITH(libpcap,
-             dnl If dynamic library not found, try static
-             dnl
-             for ext in ${libext} .a .A.tbd ; do
--                for dir in . lib lib64 lib/${host_cpu}-${host_os} ${host_cpu}-${host_os} lib/${MULTIARCH} ${MULTIARCH}; do
-+                for dir in . lib lib64 lib32 lib/${host_cpu}-${host_os} ${host_cpu}-${host_os} lib/${MULTIARCH} ${MULTIARCH}; do
-                     staticfile=$(ls ${testdir}/$dir/libpcap${ext} 2> /dev/null | sort | head -n1)
-                     if test -n "${staticfile}"; then
-                         LPCAPLIB="${staticfile}"
-@@ -771,7 +771,7 @@ AC_ARG_WITH(libpcap,
-                 LPCAPINCDIR="${testdir}/include"
-                 if test $dynamic_link = yes; then
-                     for ext in .dylib .so .tbd; do
--                        for dir in . lib lib64 ${host_cpu} lib/${host_cpu} ${host_cpu}-${host_os} lib/${host_cpu}-${host_os} ${MULTIARCH} lib/${MULTIARCH}; do
-+                        for dir in . lib lib64 lib32 lib/${host_cpu}-${host_os} ${host_cpu}-${host_os} lib/${MULTIARCH} ${MULTIARCH}; do
-                             sharefile=$(ls "${testdir}/$dir/libpcap${ext}" 2> /dev/null | sort | head -n1)
-                             if test -n "${sharefile}"; then
-                                 LPCAPLIB="-L$(dirname ${sharefile}) -lpcap"
-@@ -790,7 +790,7 @@ AC_ARG_WITH(libpcap,
-                     dnl If dynamic library not found, try static
-                     dnl
-                     for ext in ${libext} .a .A.tbd ; do
--                        for dir in . lib lib64 lib/${host_cpu}-${host_os} ${host_cpu}-${host_os} lib/${MULTIARCH} ${MULTIARCH}; do
-+                        for dir in . lib lib64 lib32 lib/${host_cpu}-${host_os} ${host_cpu}-${host_os} lib/${MULTIARCH} ${MULTIARCH}; do
-                             staticfile=$(ls "${testdir}/$dir/libpcap${ext}" 2> /dev/null | sort | head -n1)
-                             if test -n "${staticfile}"; then
-                                 LPCAPLIB="${staticfile}"
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-4256.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-4256.patch
deleted file mode 100644
index 2e4eee025..000000000
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-4256.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 62bc10d4f1d2c9e2833ef2898fb0170e9300a9dd Mon Sep 17 00:00:00 2001
-From: Marsman1996 <lqliuyuwei@outlook.com>
-Date: Tue, 2 Apr 2024 17:29:21 +0800
-Subject: [PATCH] dlt_jnpr_ether_cleanup: check config before cleanup
-
-CVE: CVE-2023-4256
-Upstream-Status: Backport [https://github.com/appneta/tcpreplay/pull/851]
-Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
----
- src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c b/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c
-index c53ec297..9642a2c2 100644
---- a/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c
-+++ b/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c
-@@ -164,8 +164,9 @@ dlt_jnpr_ether_cleanup(tcpeditdlt_t *ctx)
-         jnpr_ether_config_t *config;
- 
-         config = (jnpr_ether_config_t *)ctx->encoder->config;
--        if (config->subctx != NULL)
-+        if (config != NULL && config->subctx != NULL) {
-             tcpedit_dlt_cleanup(config->subctx);
-+        }
-         safe_free(plugin->config);
-         plugin->config = NULL;
-         plugin->config_size = 0;
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.1.bb
similarity index 70%
rename from meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
rename to meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.1.bb
index 16cff2f0e..f01bbb95a 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.1.bb
@@ -9,12 +9,9 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=10f0474a2f0e5dccfca20f69d6598ad8"
 
 SRC_URI = "https://github.com/appneta/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
     file://0001-libopts.m4-set-POSIX_SHELL-to-bin-sh.patch \
-    file://0001-configure.ac-unify-search-dirs-for-pcap-and-add-lib3.patch \
-    file://0001-configure.ac-do-not-run-conftest-in-case-of-cross-co.patch \
-    file://CVE-2023-4256.patch \
 "
 
-SRC_URI[sha256sum] = "44f18fb6d3470ecaf77a51b901a119dae16da5be4d4140ffbb2785e37ad6d4bf"
+SRC_URI[sha256sum] = "2de79bfd67ec92ca9ae2ffb50456dd1d53ff40f3fa71b422c65e8062013c9e85"
 
 UPSTREAM_CHECK_URI = "https://github.com/appneta/tcpreplay/releases"
 
-- 
2.25.1


