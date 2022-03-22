Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46535C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 04:47:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6121.1647924458552964869
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 21:47:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=KZWUHJGF;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=00800cfd2b=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22M4Mc12028800
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 04:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=kyxSD/HjE/FF/x0eklJshP4OjIYp5Sbf40KoonbkHS0=;
 b=KZWUHJGFYpZU+cWLbX5Peub5iZs0nwFDHboh0d3qx+5MPdCne+NBDNXBeduv5v2tIVDT
 5Wy9JGmqQ/CXxPAgecUAxbELN4inN+g1DinciB0KQy7urOvPZyHcQQb4n80j0oAWX8f2
 kxYlWFwQh4USLF00AR/bwRF1M3iCHN3yHpnODahlF+AUx/7MYlEZ6vxHjvfrwYBPyVWI
 q+3oq79/qkTat38bpOBJtUnaPXcd+ML9V83uEyox47yNWfEaWjffUsQzc7Po+XR4h1E7
 ow2u+tP/fipcbnOrIUzcqwbOMrYnJKfkT0bFT79HwoVyMJxakU4uM8yKMG0rhfsaq17U jg==
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2048.outbound.protection.outlook.com [104.47.51.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ew657a51q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 04:47:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gLJQ9wsDiJcvurfpuc5XDW1uyJy1+SRD221DG5meYMGDdIbRLuEd83zWxzqwwQ2pFUcBL4Q6bSPovZGZik5CRMNqu2b7NNVi87C+uMmRT4K2z66IgBcFGBi1wwMS1B21XDC8E3bbJLcak/2Jpd3nZRgAwDCmztYqpf6Qso5iAnPoNPGd9AJt/g9hc1sL/IGkFFJWRXtPZJkqiWx5dmb3DKJYBg+ttKNSBMUtFgdIsuMFTcRxrdlA9qC76az1pqz4tUVfou5fRBVxuqGLmXVbsWBbC78yPQtOSVzuzUvZwe2jVIuoCOBStfayVLiH60432HZPTzHaKhhRhVz3XZlHUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kyxSD/HjE/FF/x0eklJshP4OjIYp5Sbf40KoonbkHS0=;
 b=hmH0wLCj38Odjm6k//lzpkPK+4dzTgTsLrWlnei/OIUXn/oiaoKoV7CcsXjV6dbQ6trI4oDutAuUlVlkjqcWofhUIg1L++AfQALCW6AAFI2FJWOUV899bXP188pUscmYq3T4Byz+7D+pbJd0Umb+OqWSxXaEeidqk+aogO6fDJSNek0FGTbkWbQCqvQEx/Yn4E1p1rOh2c+JNlG3DTHT/dKSB1G9w0+dPNnaQzql3mjX/7xqWLGCGlXALaz15WPhz0ZD3yzHzJPZziJrd30JmeqoCwjH/Zppce5GhKEEbf+neJWLjrpzuBmQbTUxnJSQJHzSyprGVuZK3Tq1Xt6Dvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SA2PR11MB5098.namprd11.prod.outlook.com (2603:10b6:806:11c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.19; Tue, 22 Mar
 2022 04:47:35 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8ec:d095:e49b:d875]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8ec:d095:e49b:d875%7]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 04:47:35 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][PATCH 4/4] apache2: upgrade 2.4.52 -> 2.4.53
Date: Tue, 22 Mar 2022 12:46:16 +0800
Message-Id: <20220322044616.867009-4-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220322044616.867009-1-yi.zhao@windriver.com>
References: <20220322044616.867009-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0135.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::27) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dae4aa55-1299-4f23-fd0e-08da0bbf1577
X-MS-TrafficTypeDiagnostic: SA2PR11MB5098:EE_
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB5098BA64A757AB953E92B6EBF9179@SA2PR11MB5098.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1/fNFQE1ZxO1K2xVpgVs02u7jvGhZy3nZ0YoRLTByUrKHIqZAXSGLJSYbbkKE9VFXtAZwpvJ/jiWxG0lEy3HodwWkwYoPQhZC0Lc6pXTZQ7H6AXS+T/eZc0lejyqpnlsSSdxCS8cu0W+WNi0CnEhbmi3VxQsl1mnFGVcRWKaaAZAVdOcMxUobVGVz+FcfRnpD41Q5uqVt8oHx7jJdeAnICRwol0cl9CCDO18M+QHDpFaDcD+9T24fOnrjlMOnvBAguNGPjUe50HSepA7m5M0OY7pJ23AVV0sK3brTl5rAep+oxmFe6w1PuMys9WxBCwDTHctyZ1i0W5tEGrJNdIuIIiklqFrJXZFOriFY1ISHToxR43CYzZmwUG6LlYEJi5QKNXClvYnPQhzb+xdsol8bDBkpzt9pwDp2UJtCnWLePSXhVjp/+8ltSVDuGaSsTfv9oS6TnTOP6R5Hi2dLc0DFKSGVPIIhoVsuyeQOR+1fivQRyMEJR4m/s53cfT43k4BNWAAaxnPQnsZyuqzBhbeRCpOXSmy0wEQDicGv+NFjgquUDTtlFtkO/IutX581JlrCincZLywMOMek7z4ZFcCqdqk6o7H4ZTxoet04M7KRFmukaKKFi0Bd7UDD3vwCe09G0bmsuuDTCpZLx1Ww/GQaURMa8CXsiO21Ccwj/b8Zq/iceDO8tJZjpdhOOgnxrJI5th8OeXcj1Hk2TXz/g42/yPxbgVOz0u3FWMrozPSMpG4RiNzCnqNjM/7Unl/sjW0/vhCRbnCNTTgVVO4s5A2MZvm4/fECWNWWdWhf2Bg7ag=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(8936002)(5660300002)(1076003)(26005)(186003)(53546011)(6512007)(52116002)(2906002)(6506007)(44832011)(6666004)(30864003)(38100700002)(83380400001)(966005)(86362001)(66946007)(66476007)(66556008)(36756003)(8676002)(316002)(6486002)(508600001)(6916009)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jm0my4OqLXtVJfC2yhutlSegz5c9GmT7GXmADvO7WC4uvxBgtrhAOeSMTViN?=
 =?us-ascii?Q?J8pvNYC6YtIR942FOB3NgRnLao+zIl88PtnNDqJ3uzIYKmkGuxwECh8+uAUL?=
 =?us-ascii?Q?xjRGnEFV+sNrfjWPV6ZxhldkPppQrF5/f3hM5g739tVBra99CUzyI5mTeCT0?=
 =?us-ascii?Q?juUazTRb3yHLGXkMgtqEoB6qQKWZVqOn3ZDxmgCymnIKamfZMWfIJT12HQki?=
 =?us-ascii?Q?el6+Cd70zKQAkpGnI8cFPf79QtlfrpNqM3rG4pTQ/N9gKZXS3woU46Q4K3NU?=
 =?us-ascii?Q?q6TMAYcOkojHoWTnmtNm9cnzLcoHFbUEOOO7p9wGiZ0tip9UXtW3DWKEF81h?=
 =?us-ascii?Q?xQci/MoYLWEsQR7dE6hn7hn8IbW1UFUCLaDqyJDhmbnxEsdRVaVxOh+VkScP?=
 =?us-ascii?Q?oKW+x1dH39wUaly77pHKv8mIMp8KVaBZuCKOHMZ1W2yUJbJmITH0QPL1v1f6?=
 =?us-ascii?Q?UgjtbghnNrpyxhXUDR5bXTolsG/RZLJQnCh3hA2RsMB2ZRwpZN72w3JGbjTX?=
 =?us-ascii?Q?a5Citpin2Pshw+8vAb6RoRVlSey9p++5fTgyenK7dTKcdzpx6wfS9ZbtUB3V?=
 =?us-ascii?Q?fmM6DfM/N+0j7FPh/2ROoyjHIUg/7XJAQjJ4NMlKKX34igLXAKuJcqlnAEb3?=
 =?us-ascii?Q?zHhd/2xdh7lwJAcbobRAAhf4SWQXfHYu5nBzT3eFccsMiw4KHTtYfGSleZJm?=
 =?us-ascii?Q?A+QsGZoazxR1MQlUVfCvcu17g+dmnbJ8yXj8bcsFpdVa3IfjM121mu7kkNpE?=
 =?us-ascii?Q?Fq8Yzfoo+qqEgbUEO9L8gqoLm6cuBlTnpIQKcDlJGhhArBofs+KiSebpQ+pD?=
 =?us-ascii?Q?1p5NytKTpKzzngHcC3BFCFWjbRO4kLGmO+E3tyF6qkx+DqLyoMkUNG3zzhXQ?=
 =?us-ascii?Q?t52wIagYoMnw8EqogAy7bj3dyPvfA++ur9XzGGGA+r0wFTV82kFegV1rnhsE?=
 =?us-ascii?Q?Si220y6fE1Ch7yVmSxZE8BiFOfLp6Ff40Kl5czyi+uvr3yyfJMAop6jtsVwI?=
 =?us-ascii?Q?fgRQOdCzC2xI9fqMdAPtPlMLegs5x7/4T8VYw3C+PQ3INvvwGJwANTje2ejb?=
 =?us-ascii?Q?L0mWfiR5Y0S8u7gcuT5xJ9jC0i1CI3IPFCa4dUnRArEH75QPQlfEld0vDGk+?=
 =?us-ascii?Q?1MNPvmcaOQBlwDwCgz0rpK0rWhGeUxcLCBAldfta5Eg7uXnLHPvJwxbbd/EJ?=
 =?us-ascii?Q?O/27MJ6SDjiFEqV/qGNj2L+B/fK4O2Tv0JPs56uMeHLqpvae/4fKUNF5cAwS?=
 =?us-ascii?Q?Fuha+5xiNs+laZ0DiGydjJUiu+eduoC0vJOFMsINPbL/BUzP+K/FIV/rUann?=
 =?us-ascii?Q?xKm9JFvEKrYS1X50wb67wpVd/tk6KeaqzLM3kKHdWGgFqwLQ2M98L+Z1I60A?=
 =?us-ascii?Q?zcGqoY4tbVIPcoCdFt6VFEA4+IFoK8yHNoKAzfV4OyM0MUZcjDWNLAXJPTfD?=
 =?us-ascii?Q?zxBqQi1YhLtxDMsFJ9dXYD1E5UwA/WEZ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dae4aa55-1299-4f23-fd0e-08da0bbf1577
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 04:47:35.6315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 IgSR6o3n56IsqIzL7eHXdZ95RdnE3N+SGnFacOfp/hqFLC3Ebk9TQae4EngVV5KYfaHrWujD5RBkCaVmemP2Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5098
X-Proofpoint-GUID: rnH8VnUp-6QtUjoFmMGai-dhXyv2GZ__
X-Proofpoint-ORIG-GUID: rnH8VnUp-6QtUjoFmMGai-dhXyv2GZ__
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-21_10,2022-03-21_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203220026
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 04:47:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96127

ChangeLog:
https://downloads.apache.org/httpd/CHANGES_2.4.53

Security fixes:
CVE-2022-23943
CVE-2022-22721
CVE-2022-22720
CVE-2022-22719

Refresh patches.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...re-use-pkg-config-for-PCRE-detection.patch | 37 +++++++++----------
 ...the-core-size-limit-if-CoreDumpDirec.patch | 13 +++----
 ...xport-apr-apr-util-symbols-when-usin.patch | 11 +++---
 ...2-log-the-SELinux-context-at-startup.patch | 15 ++++----
 ...ace-lynx-to-curl-in-apachectl-script.patch |  4 +-
 ...-race-issue-of-parallel-installation.patch |  4 +-
 ...he2-allow-to-disable-selinux-support.patch |  8 ++--
 ...x-perl-install-directory-to-usr-bin.patch} | 10 +++--
 ...in-force-destdir-to-be-empty-string.patch} | 10 ++---
 ...use-relative-path-for-gen_test_char.patch} |  7 ++--
 .../{apache2_2.4.52.bb => apache2_2.4.53.bb}  |  8 ++--
 11 files changed, 62 insertions(+), 65 deletions(-)
 rename meta-webserver/recipes-httpd/apache2/apache2/{apache-configure_perlbin.patch => 0008-Fix-perl-install-directory-to-usr-bin.patch} (85%)
 rename meta-webserver/recipes-httpd/apache2/apache2/{0001-support-apxs.in-force-destdir-to-be-empty-string.patch => 0009-support-apxs.in-force-destdir-to-be-empty-string.patch} (90%)
 rename meta-webserver/recipes-httpd/apache2/apache2/{0008-apache2-do-not-use-relative-path-for-gen_test_char.patch => 0010-apache2-do-not-use-relative-path-for-gen_test_char.patch} (86%)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.52.bb => apache2_2.4.53.bb} (96%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0001-configure-use-pkg-config-for-PCRE-detection.patch b/meta-webserver/recipes-httpd/apache2/apache2/0001-configure-use-pkg-config-for-PCRE-detection.patch
index 6c0286457..50775be53 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/0001-configure-use-pkg-config-for-PCRE-detection.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0001-configure-use-pkg-config-for-PCRE-detection.patch
@@ -1,44 +1,43 @@
-From d2cedfa3394365689a3f7c8cfe8e0dd56b29bed9 Mon Sep 17 00:00:00 2001
+From ba9015386cbc044e111d7c266f13e2be045e4bf1 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen.kooi@linaro.org>
 Date: Tue, 17 Jun 2014 09:10:57 +0200
 Subject: [PATCH] configure: use pkg-config for PCRE detection
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
 ---
- configure.in | 27 +++++----------------------
- 1 file changed, 5 insertions(+), 22 deletions(-)
+ configure.in | 26 +++++---------------------
+ 1 file changed, 5 insertions(+), 21 deletions(-)
 
 diff --git a/configure.in b/configure.in
-index 9feaceb..dc6ea15 100644
+index 38c1d0a..c799aec 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -215,28 +215,11 @@ fi
- AC_ARG_WITH(pcre,
- APACHE_HELP_STRING(--with-pcre=PATH,Use external PCRE library))
+@@ -221,27 +221,11 @@ else if which $with_pcre 2>/dev/null; then :; else
+ fi
+ fi
  
--AC_PATH_PROG(PCRE_CONFIG, pcre-config, false)
--if test -d "$with_pcre" && test -x "$with_pcre/bin/pcre-config"; then
--   PCRE_CONFIG=$with_pcre/bin/pcre-config
--elif test -x "$with_pcre"; then
--   PCRE_CONFIG=$with_pcre
--fi
+-AC_CHECK_TARGET_TOOLS(PCRE_CONFIG, [pcre2-config pcre-config],
+-                      [`which $with_pcre 2>/dev/null`], $with_pcre)
 -
--if test "$PCRE_CONFIG" != "false"; then
+-if test "x$PCRE_CONFIG" != "x"; then
 -  if $PCRE_CONFIG --version >/dev/null 2>&1; then :; else
--    AC_MSG_ERROR([Did not find pcre-config script at $PCRE_CONFIG])
+-    AC_MSG_ERROR([Did not find working script at $PCRE_CONFIG])
 -  fi
 -  case `$PCRE_CONFIG --version` in
+-  [1[0-9].*])
+-    AC_DEFINE(HAVE_PCRE2, 1, [Detected PCRE2]) 
+-    ;;
 -  [[1-5].*])
 -    AC_MSG_ERROR([Need at least pcre version 6.0])
 -    ;;
 -  esac
 -  AC_MSG_NOTICE([Using external PCRE library from $PCRE_CONFIG])
 -  APR_ADDTO(PCRE_INCLUDES, [`$PCRE_CONFIG --cflags`])
--  APR_ADDTO(PCRE_LIBS, [`$PCRE_CONFIG --libs`])
+-  APR_ADDTO(PCRE_LIBS, [`$PCRE_CONFIG --libs8 2>/dev/null || $PCRE_CONFIG --libs`])
 -else
--  AC_MSG_ERROR([pcre-config for libpcre not found. PCRE is required and available from http://pcre.org/])
+-  AC_MSG_ERROR([pcre(2)-config for libpcre not found. PCRE is required and available from http://pcre.org/])
 -fi
 +PKG_CHECK_MODULES([PCRE], [libpcre], [
 +  AC_DEFINE([HAVE_PCRE], [1], [Define if you have PCRE library])
@@ -49,5 +48,5 @@ index 9feaceb..dc6ea15 100644
  
  AC_MSG_NOTICE([])
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0002-apache2-bump-up-the-core-size-limit-if-CoreDumpDirec.patch b/meta-webserver/recipes-httpd/apache2/apache2/0002-apache2-bump-up-the-core-size-limit-if-CoreDumpDirec.patch
index 85fe6ae4b..bbe8b325b 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/0002-apache2-bump-up-the-core-size-limit-if-CoreDumpDirec.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0002-apache2-bump-up-the-core-size-limit-if-CoreDumpDirec.patch
@@ -1,8 +1,8 @@
-From 7df207ad4d0dcda2ad36e5642296e0dec7e13647 Mon Sep 17 00:00:00 2001
+From 5074ab3425e5f1e01fd9cfa2d9b7300ea1b3f38f Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Tue, 17 Jul 2012 11:27:39 +0100
-Subject: [PATCH] apache2: bump up the core size limit if CoreDumpDirectory
- is configured
+Subject: [PATCH] apache2: bump up the core size limit if CoreDumpDirectory is
+ configured
 
 Bump up the core size limit if CoreDumpDirectory is
 configured.
@@ -11,16 +11,15 @@ Upstream-Status: Pending
 
 Note: upstreaming was discussed but there are competing desires;
 	there are portability oddities here too.
-
 ---
  server/core.c | 19 +++++++++++++++++++
  1 file changed, 19 insertions(+)
 
 diff --git a/server/core.c b/server/core.c
-index eacb54f..7aa841f 100644
+index 090e397..3020090 100644
 --- a/server/core.c
 +++ b/server/core.c
-@@ -4965,6 +4965,25 @@ static int core_post_config(apr_pool_t *pconf, apr_pool_t *plog, apr_pool_t *pte
+@@ -5107,6 +5107,25 @@ static int core_post_config(apr_pool_t *pconf, apr_pool_t *plog, apr_pool_t *pte
      }
      apr_pool_cleanup_register(pconf, NULL, ap_mpm_end_gen_helper,
                                apr_pool_cleanup_null);
@@ -47,5 +46,5 @@ index eacb54f..7aa841f 100644
  }
  
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0003-apache2-do-not-export-apr-apr-util-symbols-when-usin.patch b/meta-webserver/recipes-httpd/apache2/apache2/0003-apache2-do-not-export-apr-apr-util-symbols-when-usin.patch
index 081a02baa..adb728ba3 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/0003-apache2-do-not-export-apr-apr-util-symbols-when-usin.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0003-apache2-do-not-export-apr-apr-util-symbols-when-usin.patch
@@ -1,8 +1,8 @@
-From ddd560024a6d526187fd126f306b59533ca3f7e2 Mon Sep 17 00:00:00 2001
+From 9c03ed909b8da0e1a288f53fda535a3f15bcf791 Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Tue, 17 Jul 2012 11:27:39 +0100
-Subject: [PATCH] apache2: do not export apr/apr-util symbols when using
- shared libapr
+Subject: [PATCH] apache2: do not export apr/apr-util symbols when using shared
+ libapr
 
 There is no need to "suck in" the apr/apr-util symbols when using
 a shared libapr{,util}, it just bloats the symbol table; so don't.
@@ -10,13 +10,12 @@ a shared libapr{,util}, it just bloats the symbol table; so don't.
 Upstream-Status: Pending
 
 Note: EXPORT_DIRS change is conditional on using shared apr
-
 ---
  server/Makefile.in | 3 ---
  1 file changed, 3 deletions(-)
 
 diff --git a/server/Makefile.in b/server/Makefile.in
-index 1fa3344..f635d76 100644
+index 8111877..8c0c396 100644
 --- a/server/Makefile.in
 +++ b/server/Makefile.in
 @@ -60,9 +60,6 @@ export_files:
@@ -30,5 +29,5 @@ index 1fa3344..f635d76 100644
  
  exports.c: export_files
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch b/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch
index 78a04d9af..5d8291968 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch
@@ -1,4 +1,4 @@
-From dfa834ebd449df299f54e98f0fb3a7bb4008fb03 Mon Sep 17 00:00:00 2001
+From 37699e9be04d83c5923644e298f400e077f76e85 Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Tue, 17 Jul 2012 11:27:39 +0100
 Subject: [PATCH] Log the SELinux context at startup.
@@ -8,17 +8,16 @@ Log the SELinux context at startup.
 Upstream-Status: Inappropriate [other]
 
 Note: unlikely to be any interest in this upstream
-
 ---
  configure.in  |  5 +++++
  server/core.c | 26 ++++++++++++++++++++++++++
  2 files changed, 31 insertions(+)
 
 diff --git a/configure.in b/configure.in
-index dc6ea15..caa6f54 100644
+index c799aec..76811e7 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -466,6 +466,11 @@ getloadavg
+@@ -491,6 +491,11 @@ getloadavg
  dnl confirm that a void pointer is large enough to store a long integer
  APACHE_CHECK_VOID_PTR_LEN
  
@@ -31,10 +30,10 @@ index dc6ea15..caa6f54 100644
  [AC_TRY_RUN(#define _GNU_SOURCE
  #include <unistd.h>
 diff --git a/server/core.c b/server/core.c
-index 7aa841f..79f34db 100644
+index 3020090..8fef5fd 100644
 --- a/server/core.c
 +++ b/server/core.c
-@@ -59,6 +59,10 @@
+@@ -65,6 +65,10 @@
  #include <unistd.h>
  #endif
  
@@ -45,7 +44,7 @@ index 7aa841f..79f34db 100644
  /* LimitRequestBody handling */
  #define AP_LIMIT_REQ_BODY_UNSET         ((apr_off_t) -1)
  #define AP_DEFAULT_LIMIT_REQ_BODY       ((apr_off_t) 0)
-@@ -4984,6 +4988,28 @@ static int core_post_config(apr_pool_t *pconf, apr_pool_t *plog, apr_pool_t *pte
+@@ -5126,6 +5130,28 @@ static int core_post_config(apr_pool_t *pconf, apr_pool_t *plog, apr_pool_t *pte
      }
  #endif
  
@@ -75,5 +74,5 @@ index 7aa841f..79f34db 100644
  }
  
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0005-replace-lynx-to-curl-in-apachectl-script.patch b/meta-webserver/recipes-httpd/apache2/apache2/0005-replace-lynx-to-curl-in-apachectl-script.patch
index 47320a9ee..7b4a1b932 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/0005-replace-lynx-to-curl-in-apachectl-script.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0005-replace-lynx-to-curl-in-apachectl-script.patch
@@ -1,4 +1,4 @@
-From 7db1b650bb4b01a5194a34cd7573f915656a595b Mon Sep 17 00:00:00 2001
+From e59aab44a28c654e518080693d573ca472ca5a08 Mon Sep 17 00:00:00 2001
 From: Yulong Pei <Yulong.pei@windriver.com>
 Date: Thu, 1 Sep 2011 01:03:14 +0800
 Subject: [PATCH] replace lynx to curl in apachectl script
@@ -48,5 +48,5 @@ index 3281c2e..6ab4ba5 100644
  *)
      $HTTPD "$@"
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0006-apache2-fix-the-race-issue-of-parallel-installation.patch b/meta-webserver/recipes-httpd/apache2/apache2/0006-apache2-fix-the-race-issue-of-parallel-installation.patch
index 227d04064..dbaf01d2c 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/0006-apache2-fix-the-race-issue-of-parallel-installation.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0006-apache2-fix-the-race-issue-of-parallel-installation.patch
@@ -1,4 +1,4 @@
-From 4f4d7d6b88b6e440263ebeb22dfb40c52bb30fd8 Mon Sep 17 00:00:00 2001
+From fb09f1fe4525058b16b3d4edb2e3ae693154026e Mon Sep 17 00:00:00 2001
 From: Zhenhua Luo <zhenhua.luo@freescale.com>
 Date: Fri, 25 Jan 2013 18:10:50 +0800
 Subject: [PATCH] apache2: fix the race issue of parallel installation
@@ -31,5 +31,5 @@ index e2d5bb6..dde5ae0 100755
          pathcomp="$pathcomp/"
      done
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0007-apache2-allow-to-disable-selinux-support.patch b/meta-webserver/recipes-httpd/apache2/apache2/0007-apache2-allow-to-disable-selinux-support.patch
index fed6b5010..3ff689440 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/0007-apache2-allow-to-disable-selinux-support.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0007-apache2-allow-to-disable-selinux-support.patch
@@ -1,4 +1,4 @@
-From 964ef2c1af74984602f46e7db938d3b95b148385 Mon Sep 17 00:00:00 2001
+From 0686564f64130f230870db8b4846973e3edbd646 Mon Sep 17 00:00:00 2001
 From: Wenzong Fan <wenzong.fan@windriver.com>
 Date: Mon, 1 Dec 2014 02:08:27 -0500
 Subject: [PATCH] apache2: allow to disable selinux support
@@ -11,10 +11,10 @@ Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
  1 file changed, 10 insertions(+), 4 deletions(-)
 
 diff --git a/configure.in b/configure.in
-index caa6f54..eab2090 100644
+index 76811e7..4df3ff3 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -466,10 +466,16 @@ getloadavg
+@@ -491,10 +491,16 @@ getloadavg
  dnl confirm that a void pointer is large enough to store a long integer
  APACHE_CHECK_VOID_PTR_LEN
  
@@ -36,5 +36,5 @@ index caa6f54..eab2090 100644
  AC_CACHE_CHECK([for gettid()], ac_cv_gettid,
  [AC_TRY_RUN(#define _GNU_SOURCE
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/apache-configure_perlbin.patch b/meta-webserver/recipes-httpd/apache2/apache2/0008-Fix-perl-install-directory-to-usr-bin.patch
similarity index 85%
rename from meta-webserver/recipes-httpd/apache2/apache2/apache-configure_perlbin.patch
rename to meta-webserver/recipes-httpd/apache2/apache2/0008-Fix-perl-install-directory-to-usr-bin.patch
index 61669e364..dc5b5c88f 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/apache-configure_perlbin.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0008-Fix-perl-install-directory-to-usr-bin.patch
@@ -1,4 +1,4 @@
-From 5412077c398dec74321388fe6e593a44c4c80de6 Mon Sep 17 00:00:00 2001
+From 443d15b91d4e4979d92405610303797663f31102 Mon Sep 17 00:00:00 2001
 From: echo <fei.geng@windriver.com>
 Date: Tue, 28 Apr 2009 03:11:06 +0000
 Subject: [PATCH] Fix perl install directory to /usr/bin
@@ -11,16 +11,15 @@ error:
 bad interpreter: No such file or directory
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
 ---
  configure.in | 5 +----
  1 file changed, 1 insertion(+), 4 deletions(-)
 
 diff --git a/configure.in b/configure.in
-index d828512..be7bd25 100644
+index 4df3ff3..4eeb609 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -855,10 +855,7 @@ AC_DEFINE_UNQUOTED(SERVER_CONFIG_FILE, "${rel_sysconfdir}/${progname}.conf",
+@@ -903,10 +903,7 @@ AC_DEFINE_UNQUOTED(SERVER_CONFIG_FILE, "${rel_sysconfdir}/${progname}.conf",
  AC_DEFINE_UNQUOTED(AP_TYPES_CONFIG_FILE, "${rel_sysconfdir}/mime.types",
  	[Location of the MIME types config file, relative to the Apache root directory])
  
@@ -32,3 +31,6 @@ index d828512..be7bd25 100644
  AC_SUBST(perlbin)
  
  dnl If we are running on BSD/OS, we need to use the BSD .include syntax.
+-- 
+2.25.1
+
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0001-support-apxs.in-force-destdir-to-be-empty-string.patch b/meta-webserver/recipes-httpd/apache2/apache2/0009-support-apxs.in-force-destdir-to-be-empty-string.patch
similarity index 90%
rename from meta-webserver/recipes-httpd/apache2/apache2/0001-support-apxs.in-force-destdir-to-be-empty-string.patch
rename to meta-webserver/recipes-httpd/apache2/apache2/0009-support-apxs.in-force-destdir-to-be-empty-string.patch
index bdedd146c..d1f9bb0f4 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/0001-support-apxs.in-force-destdir-to-be-empty-string.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0009-support-apxs.in-force-destdir-to-be-empty-string.patch
@@ -1,10 +1,10 @@
-From 705c0a7e9d9c1e64ee09fc0b54f6b5a4e27de1ca Mon Sep 17 00:00:00 2001
+From 43a4ad04e0d8771267a73f98b5918bcd10b167ec Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <trevor.gamblin@windriver.com>
 Date: Fri, 17 Apr 2020 06:31:35 -0700
 Subject: [PATCH] support/apxs.in: force destdir to be empty string
 
-If destdir is assigned to anything other than the empty string, the 
-search path for apache2 config files is appended to itself, and 
+If destdir is assigned to anything other than the empty string, the
+search path for apache2 config files is appended to itself, and
 related packages like apache-websocket will be unable to locate them:
 
 | cannot open
@@ -24,7 +24,7 @@ Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
  1 file changed, 6 insertions(+), 4 deletions(-)
 
 diff --git a/support/apxs.in b/support/apxs.in
-index 65e1288527..9d96e33728 100644
+index b2705fa..781f2ab 100644
 --- a/support/apxs.in
 +++ b/support/apxs.in
 @@ -28,10 +28,12 @@ package apxs;
@@ -45,5 +45,5 @@ index 65e1288527..9d96e33728 100644
  my %config_vars = ();
  
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0008-apache2-do-not-use-relative-path-for-gen_test_char.patch b/meta-webserver/recipes-httpd/apache2/apache2/0010-apache2-do-not-use-relative-path-for-gen_test_char.patch
similarity index 86%
rename from meta-webserver/recipes-httpd/apache2/apache2/0008-apache2-do-not-use-relative-path-for-gen_test_char.patch
rename to meta-webserver/recipes-httpd/apache2/apache2/0010-apache2-do-not-use-relative-path-for-gen_test_char.patch
index 82e9e8c35..ced8469f3 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/0008-apache2-do-not-use-relative-path-for-gen_test_char.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0010-apache2-do-not-use-relative-path-for-gen_test_char.patch
@@ -1,16 +1,15 @@
-From b62c4cd2295c98b2ebe12641e5f01590bd96ae94 Mon Sep 17 00:00:00 2001
+From d9993cbc33565c0acd29b0127d651dafa2a16975 Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Tue, 17 Jul 2012 11:27:39 +0100
 Subject: [PATCH] apache2: do not use relative path for gen_test_char
 
 Upstream-Status: Inappropriate [embedded specific]
-
 ---
  server/Makefile.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/server/Makefile.in b/server/Makefile.in
-index f635d76..0d48924 100644
+index 8c0c396..3544f55 100644
 --- a/server/Makefile.in
 +++ b/server/Makefile.in
 @@ -29,7 +29,7 @@ gen_test_char: $(gen_test_char_OBJECTS)
@@ -23,5 +22,5 @@ index f635d76..0d48924 100644
  util.lo: test_char.h
  
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.52.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.53.bb
similarity index 96%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.52.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.53.bb
index 39407b8a1..8413f5379 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.52.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.53.bb
@@ -13,12 +13,12 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
            file://0005-replace-lynx-to-curl-in-apachectl-script.patch \
            file://0006-apache2-fix-the-race-issue-of-parallel-installation.patch \
            file://0007-apache2-allow-to-disable-selinux-support.patch \
-           file://apache-configure_perlbin.patch \
-           file://0001-support-apxs.in-force-destdir-to-be-empty-string.patch \
+           file://0008-Fix-perl-install-directory-to-usr-bin.patch \
+           file://0009-support-apxs.in-force-destdir-to-be-empty-string.patch \
           "
 
 SRC_URI:append:class-target = " \
-           file://0008-apache2-do-not-use-relative-path-for-gen_test_char.patch \
+           file://0010-apache2-do-not-use-relative-path-for-gen_test_char.patch \
            file://init \
            file://apache2-volatile.conf \
            file://apache2.service \
@@ -26,7 +26,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "0127f7dc497e9983e9c51474bed75e45607f2f870a7675a86dc90af6d572f5c9"
+SRC_URI[sha256sum] = "d0bbd1121a57b5f2a6ff92d7b96f8050c5a45d3f14db118f64979d525858db63"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.25.1


