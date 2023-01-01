Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 252F0C3DA79
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 07:28:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7052.1672558072566571752
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Dec 2022 23:27:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=bSpe6sHV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03651cea20=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3017PQ2S005202
	for <openembedded-devel@lists.openembedded.org>; Sat, 31 Dec 2022 23:27:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=HHT10DLPqvxMO+F7CxWn6vJwNXxJuwyM0gScQaQSc5c=;
 b=bSpe6sHVl3Hy+TnM5FjYDig73g3OoiYYZUjQaImRocmovZO6Jzx1x5lnpuGwrbOHAE3d
 kNeaBy7yyeuH46bzxcSYnZzPH1cX+l29U3zkf8bOY7r/yXlRki9JrotZx7pYkxgp9hUx
 w+sNFG1b73sjhP4j6fSFa6E1v4qNXeGz3NlyQpSBiQriHQNHhH9wiH3+AInQ/WErRGCa
 l8abefF7tBShSA/5hgLMKVC0XA4moGlcjtsN4iiBd1kfyZGN63tdCIPp4cEYgp74Ljxt
 YooeIcHHUoOllEPbz4yeL+gOHAARiDRKhCHK+KjikqBPjgjUU1TTQV8H8ZtHu3MzW4e3 BQ== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mth87rd7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 31 Dec 2022 23:27:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSx2S6aDOBB8i8Jc83GrqLTDcngDDC7yxYkaP3CjPUFCApeAe+4k3o4EBFhTAKeXarLzwQ7yI2y7iPVCDn7iHo77qzx6W+ri37GbYMiLjRDlLPc4Ao0G96KuFrg57I8zUxHklP9mOer4v3eQCpbj12WaJmyJ1EneV19etoM3s0pWM5uzNs6pejeNybbBbRgWiN6U0sdU4Wm+VcujHq4T81XbfXjWaUl18G6Gl3latI0ULbM3+n8itBnmGHV0yhHg6gM4ziDOcFRkbvoIKxzSiw79fS3CTQsktx+AJvFgEvQCFxMBNHb9+5+M9WQ7fqGfVRxIMgcYKi89o5jPk2RTog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHT10DLPqvxMO+F7CxWn6vJwNXxJuwyM0gScQaQSc5c=;
 b=V2/wCtX1iOFMR8ycUG7cvJgQoRNcJtov5DT9Ht/HSIch8/IJWaoFHxvYO8CVNcA/BLd1pLtvHa6JB9c39sE+z2XgRW0eJFrSJtiAkbJ6B2fPBpGhz4feRuUeA73TOAnC+zEJpNq1sQFUNxjHeX0pakQzyQS9fMEY5i7VZyzvJiZQx8LEydZT8wDKj29F4KxMUbqnKHrIWC0mTOQkLUq9G/zZzq5D/ZYL07uLzTyt2kooAtKweyyaCGe5dp4h7zvzcLchLYx8Bi7N8TZVw5kevvsHF34ooe+e6hSLqI5K5c6xUSV6qDPxewlPfmePtLKpdY6K0D5vCdpf8NoBGp1Rcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SN7PR11MB7638.namprd11.prod.outlook.com (2603:10b6:806:34b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.18; Sun, 1 Jan
 2023 07:27:49 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::eb7b:3a04:80bb:4a5f]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::eb7b:3a04:80bb:4a5f%4]) with mapi id 15.20.5944.019; Sun, 1 Jan 2023
 07:27:49 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/5] libtalloc: upgrade 2.3.3 -> 2.3.4
Date: Sun,  1 Jan 2023 15:27:35 +0800
Message-Id: <20230101072739.75462-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0103.namprd05.prod.outlook.com
 (2603:10b6:a03:334::18) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|SN7PR11MB7638:EE_
X-MS-Office365-Filtering-Correlation-Id: 068d45c6-3a6d-44b1-5d20-08daebc9af36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fTqDfi91icf3bAr2RnMpTXRuBIpva1GiX0Wq+WDVGbWSb3jf8bNgstwH4n/zPMYm4TShkCAByICYR+9C3hmo4CEl042Z3y0z4B9mz7W641Ag4dUseRwkDLihDC9EWEFYunqUauO0afScbd3tvfy8chGS3Al4OtwySgOa0h5hUQokldmMbUuk4GW79Ngr34eQ2UNabjcHL38CCK/lG54qloNPTId1ibqRKYwNmGEpEttR3IW5VgxO3w/UWB7/aTVVV5JQQtAL1qwmE6mjpnCalmHuBayJPgUg8YEDb36fSUi3AqkHrs7hL/wBNAmYX3gx9GI0UhI4N7LfIKa7FJPx7y0u4omCfZhYT5ACnkH4jaKpH7cf3no2TTU65KG8zc94GZDvk7MSw+mKI+lT2gM/Z/dUAwmWuXq51bOgjw3sEzwa5ULnfcKo2w6y/4keC0JVBmsLyVBZh55nyIqdlrfWpuomXpayDfF94rSyv1khfSUGAC8mTJ/JcLcgtZtiyn1c/GEnrKcPphbePU52ASkaSqjAX1wjOWfmPrxjum1OVQKNYY0BO127zKd6oMaMVMXlDjBEkv3PvfnwfPniaPZhndSAIZrdUFih8MKbSXjEf86eRegE1G+/v4BqQkQu2ynLjZlQQ3ptzWyc7hWAXIk+FzVadHu/jSfRQAYEMDwZZTywmkN7+xorU4rykhlNoLB8Jt53glyFDowLA55WTuvxy0PAjrzDfG9oL4SzAG47ovj8xWHiER1qJzz1SqdKZ/+V
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39840400004)(396003)(376002)(366004)(451199015)(6666004)(8936002)(53546011)(38350700002)(478600001)(6506007)(38100700002)(6916009)(52116002)(2906002)(86362001)(41300700001)(2616005)(26005)(186003)(6512007)(36756003)(44832011)(66556008)(83380400001)(66476007)(5660300002)(316002)(6486002)(66946007)(1076003)(8676002)(22166003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ee9E/gStUSmKknmfPLZvqCUAa4sMZMPssCA0sTGPch/5yFT03/8kW3M4ZZAY?=
 =?us-ascii?Q?p0iSpAx1EaKvton7Ws6Fu8iVrU6XvEepzEO6E67Czs+dtMOfAvjfzePiEuaf?=
 =?us-ascii?Q?7X0KobSFVyKk+vs1PHxtOtcELDDKRmQV0sul5iKMINvQ0Hx6HCJi3sLuX3QA?=
 =?us-ascii?Q?Vdme93vRbra4a4mcCTnt4oj+oX8DpxvJfYFr11Sn5ObdXIsj2mfunOGPAf1j?=
 =?us-ascii?Q?PQEJB3MLvYHvjighXbYH4AsiprJlhcupm3OO2ZOO8XUoKvOUbFejD2HqWEhH?=
 =?us-ascii?Q?fuEJBtZAk5qU27OhQ3r5rMr8Eaoh/iol62z/ghGYsBnrTd5BnAIt+rsL4UHv?=
 =?us-ascii?Q?RlGibuJ5V9LC40tuGxUtPoHwfVBUWRbZsc07L51M1YNj+9IKmThd7LTVbvij?=
 =?us-ascii?Q?KiVd2teLJd44bHNOWbsK9Pkk5LeuXjknyDifFbRMbyQPYfq0bG0nMqq3S7SO?=
 =?us-ascii?Q?cioc1C5+8FyoLelBjMB1YC9BWl/73HnhDW7rSnGyX20r8HVGhkJiNDZv8kdq?=
 =?us-ascii?Q?g2VLbAa7m/+Vl8k+9+9TG1r+yf3k75j9cX0AiRMMdmbt6opMv7J/2GG7pGV2?=
 =?us-ascii?Q?VB0X0AggBAfyEuFebhxkPpVU7ecXvoRmtd7OV1DbsDY/yOmCi2UzfbXxyo0a?=
 =?us-ascii?Q?aIoJhQFMX4dZfWzSwerJ15mY8x8dR+ATvXLqXIBUTqCBfa2oim3TEYWdMNsb?=
 =?us-ascii?Q?LO3shw+WG4Ou9CxnavepIKQ7EfARpDENm/znsmNWTAO/DLOHlIz6tkDSz0tY?=
 =?us-ascii?Q?R6g5bUiLmKJxFIm1i6ZocYbWdxRvVHMTkQU7VCFcd31iJba1vl7jRANczDWu?=
 =?us-ascii?Q?HP9JdJfP9SglkSa0m9DDrz1fvYaTvVg7eKy90SaScf8if7dgVQ+3L3n9NxV1?=
 =?us-ascii?Q?Q3hVm8qEE55F+xOsbC3BU5bbwJZU2O7xG35NLlUO686uLIv9nLXcCq7Vp3NG?=
 =?us-ascii?Q?wAvKL0L8fgDzSGADxWDtKQuP+h1KxmThFiT7gnBDjJECZCKW2NN1fLZr33MI?=
 =?us-ascii?Q?3YULRYz9++KgJMQurjPrq4CUQF3dfFzdcYEZB3oiyiyCOCtyAkvTZnR4UbwN?=
 =?us-ascii?Q?rvpKexCmGk68juB4g7Zn1jESuWUwZVfatxIYk3p/4hplaH/IbzoxG/2ee1OQ?=
 =?us-ascii?Q?C29FJJUXo/ZlG2g9rr7wgyYfyfSrCZ1zXkE9XNSvH6ysETsK/dIIQifuaHo5?=
 =?us-ascii?Q?hgK5ojNaVdU/6zho/MvFXSOjSmL7jj/nCUSlKunUpLtsXDE5yXphifiZ1ici?=
 =?us-ascii?Q?x1BGf03N3QAPt4ZK9bAZH2zKBEYLWH+dU9TLmlSrqUtfM4AN0OnqFTJehynT?=
 =?us-ascii?Q?iVAMtIDMv/E0SenCNwXtVIEfe6aaAv3JYF8uRSKZAES3MifIqyCp7jIUX8br?=
 =?us-ascii?Q?Qtqwg8K8yOdOShpchWmxWSDN2P9f69B1XSIlnRpGoyILpj4vGjTJaf6IpquW?=
 =?us-ascii?Q?4b8UXqfgw0iIEp9jSlz4es85ydPM/rvdIJlfHZD5bEfNXqz+y5F6vsnrlmaM?=
 =?us-ascii?Q?qW2S3H+ythE1NLdcP5bDHWYKMG6Ud78VNkKhOcd7IhGw+y79RmR2AVkAjoMD?=
 =?us-ascii?Q?/qJbAAW7Tlmdf5r/b7Vrb7w92+ylcteLt3MzXlxn?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 068d45c6-3a6d-44b1-5d20-08daebc9af36
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2023 07:27:48.9375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QhDCF+VQLur05Rd/4IlpFWuqeRv6Nm+Nvwh8ly4KANXvbDg9wEQ8WBBVhYkBXqhuD/Quz/8FNwgfyG5hhyu7wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7638
X-Proofpoint-ORIG-GUID: tlnlA3KV8tzg2E3Na_jfzYymt5yVbObQ
X-Proofpoint-GUID: tlnlA3KV8tzg2E3Na_jfzYymt5yVbObQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-31_16,2022-12-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301010068
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Jan 2023 07:28:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100331

* Refresh patches
* Add a patch to skip checking PYTHONHASHSEED

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-Add-configure-options-for-packages.patch} | 12 ++++----
 ...pyext_PATTERN-for-cross-compilation.patch} | 10 +++----
 ...wscript-skip-checking-PYTHONHASHSEED.patch | 30 +++++++++++++++++++
 .../libtalloc/avoid-attr-unless-wanted.patch  | 19 ++++++++++--
 ...{libtalloc_2.3.3.bb => libtalloc_2.3.4.bb} | 10 +++----
 5 files changed, 62 insertions(+), 19 deletions(-)
 rename meta-networking/recipes-support/libtalloc/libtalloc/{options-2.2.0.patch => 0001-talloc-Add-configure-options-for-packages.patch} (96%)
 rename meta-networking/recipes-support/libtalloc/libtalloc/{0001-Fix-pyext_PATTERN-for-cross-compilation.patch => 0002-Fix-pyext_PATTERN-for-cross-compilation.patch} (87%)
 create mode 100644 meta-networking/recipes-support/libtalloc/libtalloc/0003-wscript-skip-checking-PYTHONHASHSEED.patch
 rename meta-networking/recipes-support/libtalloc/{libtalloc_2.3.3.bb => libtalloc_2.3.4.bb} (85%)

diff --git a/meta-networking/recipes-support/libtalloc/libtalloc/options-2.2.0.patch b/meta-networking/recipes-support/libtalloc/libtalloc/0001-talloc-Add-configure-options-for-packages.patch
similarity index 96%
rename from meta-networking/recipes-support/libtalloc/libtalloc/options-2.2.0.patch
rename to meta-networking/recipes-support/libtalloc/libtalloc/0001-talloc-Add-configure-options-for-packages.patch
index 46fef1096..026a34899 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc/options-2.2.0.patch
+++ b/meta-networking/recipes-support/libtalloc/libtalloc/0001-talloc-Add-configure-options-for-packages.patch
@@ -1,4 +1,4 @@
-From 8a82056ba2f70137714f225d82993aa4b11042da Mon Sep 17 00:00:00 2001
+From 888bfe48236b4ce382dc3aa49791cadb70a1fbe4 Mon Sep 17 00:00:00 2001
 From: Wang Mingyu <wangmy@cn.fujitsu.com>
 Date: Fri, 25 Dec 2020 14:14:08 +0900
 Subject: [PATCH] talloc: Add configure options for packages
@@ -27,7 +27,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  2 files changed, 75 insertions(+), 21 deletions(-)
 
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index a2bc604..2e2e7bf 100644
+index 827d74f..0348715 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
 @@ -25,6 +25,41 @@ def options(opt):
@@ -72,7 +72,7 @@ index a2bc604..2e2e7bf 100644
  @Utils.run_once
  def configure(conf):
      conf.RECURSE('buildtools/wafsamba')
-@@ -34,12 +69,25 @@ def configure(conf):
+@@ -35,12 +70,25 @@ def configure(conf):
      conf.DEFINE('HAVE_LIBREPLACE', 1)
      conf.DEFINE('LIBREPLACE_NETWORK_CHECKS', 1)
  
@@ -102,7 +102,7 @@ index a2bc604..2e2e7bf 100644
      conf.CHECK_HEADERS('port.h')
      conf.CHECK_HEADERS('sys/fcntl.h sys/filio.h sys/filsys.h sys/fs/s5param.h')
      conf.CHECK_HEADERS('sys/id.h sys/ioctl.h sys/ipc.h sys/mman.h sys/mode.h sys/ndir.h sys/priv.h')
-@@ -121,8 +169,9 @@ def configure(conf):
+@@ -110,8 +158,9 @@ def configure(conf):
      conf.CHECK_HEADERS('sys/fileio.h sys/filesys.h sys/dustat.h sys/sysmacros.h')
      conf.CHECK_HEADERS('xfs/libxfs.h netgroup.h')
  
@@ -114,7 +114,7 @@ index a2bc604..2e2e7bf 100644
      conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
      conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
      conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
-@@ -418,20 +467,20 @@ def configure(conf):
+@@ -431,20 +480,20 @@ def configure(conf):
  
      strlcpy_in_bsd = False
  
@@ -150,7 +150,7 @@ index a2bc604..2e2e7bf 100644
      conf.CHECK_CODE('''
                  struct ucred cred;
 diff --git a/wscript b/wscript
-index b955d21..4ac6e1e 100644
+index 3089663..fdf9510 100644
 --- a/wscript
 +++ b/wscript
 @@ -31,7 +31,12 @@ def options(opt):
diff --git a/meta-networking/recipes-support/libtalloc/libtalloc/0001-Fix-pyext_PATTERN-for-cross-compilation.patch b/meta-networking/recipes-support/libtalloc/libtalloc/0002-Fix-pyext_PATTERN-for-cross-compilation.patch
similarity index 87%
rename from meta-networking/recipes-support/libtalloc/libtalloc/0001-Fix-pyext_PATTERN-for-cross-compilation.patch
rename to meta-networking/recipes-support/libtalloc/libtalloc/0002-Fix-pyext_PATTERN-for-cross-compilation.patch
index 47ee4bb24..058ac34f8 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc/0001-Fix-pyext_PATTERN-for-cross-compilation.patch
+++ b/meta-networking/recipes-support/libtalloc/libtalloc/0002-Fix-pyext_PATTERN-for-cross-compilation.patch
@@ -1,4 +1,4 @@
-From b5eaeb7ed4e75012d2715f995e15a13850064f61 Mon Sep 17 00:00:00 2001
+From 6580e8191c219909d50c991662310e668973722d Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Wed, 24 Nov 2021 13:33:35 +0800
 Subject: [PATCH] Fix pyext_PATTERN for cross compilation
@@ -40,18 +40,18 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/third_party/waf/waflib/Tools/python.py b/third_party/waf/waflib/Tools/python.py
-index b1c8dd0..24faa31 100644
+index a23bd01..af202e0 100644
 --- a/third_party/waf/waflib/Tools/python.py
 +++ b/third_party/waf/waflib/Tools/python.py
 @@ -328,7 +328,7 @@ def check_python_headers(conf, features='pyembed pyext'):
  	x = 'MACOSX_DEPLOYMENT_TARGET'
  	if dct[x]:
- 		env[x] = conf.environ[x] = dct[x]
--	env.pyext_PATTERN = '%s' + dct['SO'] # not a mistake
+ 		env[x] = conf.environ[x] = str(dct[x])
+-	env.pyext_PATTERN = '%s' + (dct['EXT_SUFFIX'] or dct['SO']) # SO is deprecated in 3.5 and removed in 3.11
 +	env.pyext_PATTERN = '%s.so'
  
  
  	# Try to get pythonX.Y-config
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-networking/recipes-support/libtalloc/libtalloc/0003-wscript-skip-checking-PYTHONHASHSEED.patch b/meta-networking/recipes-support/libtalloc/libtalloc/0003-wscript-skip-checking-PYTHONHASHSEED.patch
new file mode 100644
index 000000000..617eaa7dc
--- /dev/null
+++ b/meta-networking/recipes-support/libtalloc/libtalloc/0003-wscript-skip-checking-PYTHONHASHSEED.patch
@@ -0,0 +1,30 @@
+From 4a1b8659235dcac5382a627a4add4d636a65a886 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Wed, 28 Dec 2022 16:31:05 +0800
+Subject: [PATCH] wscript: skip checking PYTHONHASHSEED
+
+Skip checking PYTHONHASHSEED as it is set to 0 in oe-core by default.
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ buildtools/wafsamba/wscript | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/buildtools/wafsamba/wscript b/buildtools/wafsamba/wscript
+index 8729b08..a4d6f3e 100644
+--- a/buildtools/wafsamba/wscript
++++ b/buildtools/wafsamba/wscript
+@@ -8,10 +8,6 @@ import wafsamba
+ from samba_utils import symlink
+ from optparse import SUPPRESS_HELP
+ 
+-phs = os.environ.get("PYTHONHASHSEED", None)
+-if phs != "1":
+-    raise Errors.WafError('''PYTHONHASHSEED=1 missing! Don't use waf directly, use ./configure and make!''')
+-
+ # this forces configure to be re-run if any of the configure
+ # sections of the build scripts change. We have to check
+ # for this in sys.argv as options have not yet been parsed when
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/libtalloc/libtalloc/avoid-attr-unless-wanted.patch b/meta-networking/recipes-support/libtalloc/libtalloc/avoid-attr-unless-wanted.patch
index 5b7f69ec0..3c85a8a2d 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc/avoid-attr-unless-wanted.patch
+++ b/meta-networking/recipes-support/libtalloc/libtalloc/avoid-attr-unless-wanted.patch
@@ -1,6 +1,17 @@
+From e18370c204056de799064d8ac72a656eb3745f95 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@cn.fujitsu.com>
+Date: Fri, 25 Dec 2020 15:10:58 +0900
+Subject: [PATCH] avoid attr unless wanted
+
+---
+ lib/replace/wscript | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/lib/replace/wscript b/lib/replace/wscript
+index 0348715..a8554d9 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
-@@ -947,8 +947,6 @@ def build(bld):
+@@ -967,8 +967,6 @@ def build(bld):
      if not bld.CONFIG_SET('HAVE_INET_ATON'):     REPLACE_SOURCE += ' inet_aton.c'
      if not bld.CONFIG_SET('HAVE_INET_NTOP'):     REPLACE_SOURCE += ' inet_ntop.c'
      if not bld.CONFIG_SET('HAVE_INET_PTON'):     REPLACE_SOURCE += ' inet_pton.c'
@@ -9,13 +20,15 @@
  
      if not bld.CONFIG_SET('HAVE_CLOSEFROM'):
          REPLACE_SOURCE += ' closefrom.c'
-@@ -962,7 +960,7 @@ def build(bld):
-                       # at the moment:
+@@ -983,7 +981,7 @@ def build(bld):
                        # hide_symbols=bld.BUILTIN_LIBRARY('replace'),
                        private_library=True,
+                       provide_builtin_linking=True,
 -                      deps='dl attr' + extra_libs)
 +                      deps='dl' + extra_libs)
  
      replace_test_cflags = ''
      if bld.CONFIG_SET('HAVE_WNO_FORMAT_TRUNCATION'):
+-- 
+2.25.1
 
diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.3.3.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.3.4.bb
similarity index 85%
rename from meta-networking/recipes-support/libtalloc/libtalloc_2.3.3.bb
rename to meta-networking/recipes-support/libtalloc/libtalloc_2.3.4.bb
index b3f8b2ce2..ad812da80 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.3.3.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.3.4.bb
@@ -1,17 +1,17 @@
 SUMMARY = "Hierarchical, reference counted memory pool system with destructors"
-HOMEPAGE = "http://talloc.samba.org"
+HOMEPAGE = "https://talloc.samba.org"
 SECTION = "libs"
 LICENSE = "LGPL-3.0-or-later & GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://talloc.h;beginline=3;endline=27;md5=a301712782cad6dd6d5228bfa7825249 \
                     file://pytalloc.h;beginline=1;endline=18;md5=21ab13bd853679d7d47a1739cb3b7db6 \
                     "
 
-
 SRC_URI = "https://www.samba.org/ftp/talloc/talloc-${PV}.tar.gz \
-           file://options-2.2.0.patch \
-           file://0001-Fix-pyext_PATTERN-for-cross-compilation.patch \
+           file://0001-talloc-Add-configure-options-for-packages.patch \
+           file://0002-Fix-pyext_PATTERN-for-cross-compilation.patch \
+           file://0003-wscript-skip-checking-PYTHONHASHSEED.patch \
 "
-SRC_URI[sha256sum] = "6be95b2368bd0af1c4cd7a88146eb6ceea18e46c3ffc9330bf6262b40d1d8aaa"
+SRC_URI[sha256sum] = "179f9ebe265e67e4ab2c26cad2b7de4b6a77c6c212f966903382869f06be6505"
 
 inherit waf-samba
 
-- 
2.25.1


