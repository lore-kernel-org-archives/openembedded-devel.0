Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17CD8C41513
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 09:03:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.28493.1690534992581637203
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jul 2023 02:03:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lgP+Aw5p;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=657345a965=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36S6Sn05013527
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Jul 2023 02:03:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=ci5wLuECSS5Jmx9c1k1p1/aZduDmxhUDHp+Rk5hgs+0=; b=
	lgP+Aw5p8ke0FGbgwyK1OfVCjcUqDGkypCHQ/PW1FMIw8gpEDnzYmW6iivtwQAeY
	xlW0hP94QGjDAadp5QAnHUeN7qTtddPqjd0bt0r6/6jSfIy90JuJELEiBrK8nvza
	/ZayV0M99nrBGhBQHV5AJGG3SWbwvUBSGtSO7Q6Ic45ZQhdc8HBKq937IHHc5jKZ
	AqP3RaF+MOQf7cl1wR7B7efb3vov2pN0oFpX8Z7wqSQ1RqnKW6s7jlVIiwybpac4
	fpMMumXihvyJrLIfL4C3gOQBYNO+TEVoOC6N6Jqa1yyGU9BbEwrfrMsBKezApDLB
	rCxrS/6blOGGpUfc+NP0Bg==
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2046.outbound.protection.outlook.com [104.47.57.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s3beasgbv-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Jul 2023 02:03:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W3SwN7GCz+QxdBnyiUjcFfx1XaBStAsxRHFXE4Qzz6vKBsnokxfsezR9+iJ+6WLjSINiUJCsB9nd+9hOTNdy7wzPIQ/I6Qex9QB9J4eelRnLsfpJ8ElFHNDW2Dmffu89dBPAE6ZLgX6Ektc75FJ2MXke2YucNy210CfGlcSLhmdLIVeoFsfVrrXaqIlKUhImWO4IELlgAGH1FVSW+mKukkK4kXiF0LboQvS9i+QgdR/h1NVB6USeo1Ki2dzQ1uuW+h/YqhMC/41Y/rCOiHsv0HP+qx3WRUiYGU2k2rFph9tnmMWlXc2ODDF8bwZYF+P++ma/Chg7mcjM8tc4JoMArQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ci5wLuECSS5Jmx9c1k1p1/aZduDmxhUDHp+Rk5hgs+0=;
 b=Q76DQVKZuz++ri9INniXdcoEBCHgpr/rGBEzVw2/vTVV8bp0mF/F/zRYnXPl7gkcWjdY5P8IR7vhcWErSbWzJPonOiuEAQqiM0LlbsfqcJSPtgYNZUrp+tpaUc5WfV+faAI+gL5/UYt63wvHpYoGWtTBasXK02uF1VukgH8TLB0rn3CW7ibNyUpUyyMv7DKT+ebYteAcSu96XuEF99v0joKfAiloaJ3wLs7EkK6ifQwSccOTYRUW6V+kaBvA9WU5sO/y6202P6p9FVln4G4W4mo0JZZA2cnoIqknQhzRGJdxgUy9LmpLpCSwBviLHim5Re3FinQKU+iYDjPUW2wDjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CH3PR11MB8188.namprd11.prod.outlook.com (2603:10b6:610:15e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.34; Fri, 28 Jul
 2023 09:03:10 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::f499:a2a9:85eb:97ac]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::f499:a2a9:85eb:97ac%3]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 09:03:10 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 3/3] daq: enable nfq module build
Date: Fri, 28 Jul 2023 17:02:55 +0800
Message-Id: <20230728090255.2577891-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230728090255.2577891-1-yi.zhao@windriver.com>
References: <20230728090255.2577891-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0007.apcprd06.prod.outlook.com
 (2603:1096:4:186::9) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|CH3PR11MB8188:EE_
X-MS-Office365-Filtering-Correlation-Id: c03bf6e2-1790-49f8-240f-08db8f49776c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xxSR1t6xCvWBpmKEZvpe6VDbF/nNCYd3NTYdzUryEBUC8M0LLvdhathqlOgnJ8TB212lrRzsuvE/ojn2QwFJCo5CYT2OF7Er7cWrmRTOj2UtT5Zen4mH9vt6R7ruCv3DKJ2laJEBdjrizjCut05p/sLTl/fNZhDHYa0nrumouR52BZtW2S5vpiOHPwYuEC1X+afuCRwtoWMOg2addg8//f898Zwg1GKzPsTc/Avk7o//xQQhhVUwxCd18yrz53zCLieHdkRhdE9ozbyt2ol28Rc8/Igtchzw7s9ffhYkvHpGS5gj3dfmuuDnNZ95rH/hNMBEbGc8OtTH9Ndp/eUVpeyFooN0VKHKtsVjqzZFg89O5SEj8OD+Z2VpjiUa4hGUWeb6wmzKgZEPF3pfK8zby2b1cVhIw/JvJl8gopob/i5paCh4uUjBsAhEPTr4oB1GrlJdb0YxWCICj/iE2rpSAF/d3MOsz+pwh3QLUedkvDmKjJ+QF+4WxPzo9ZptrSzZ/olXwM9piA7WYnr8PoNcibwbT3tM23YW58GIdQSAbUQ+EzY9jq6L5p8+SqLBltWwS0/e4bYXDTEwR316pMDyDIXlNzfHLZcWY/BNq3ZmHSI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39850400004)(376002)(346002)(136003)(396003)(451199021)(83380400001)(36756003)(2906002)(86362001)(2616005)(38350700002)(38100700002)(41300700001)(316002)(6916009)(6512007)(26005)(1076003)(8676002)(8936002)(52116002)(6486002)(478600001)(66946007)(66476007)(66556008)(6666004)(44832011)(186003)(5660300002)(6506007)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?j/AoXST+lPDMKqMMRgsIgdgxlXkyZ77AdEoF6JnjExaKQzc6YmJmdepeFMqD?=
 =?us-ascii?Q?5JZH0nfPFxBrRrTt0tGsInGyBiiGnBreRFOQp8bB40SFL1Q3X03A+X/O4B1Y?=
 =?us-ascii?Q?kW3QY1MjARug8xGNCQqYsjgMeTFbbmbEOk8OBZDup1xECh2hgvrfp9o5jcnJ?=
 =?us-ascii?Q?eTwupS5AYYz680VQrYgplDmmQcxWVEiI4CbTn3ZK5DaABb++rnJMdsNJXcQt?=
 =?us-ascii?Q?zwmcA6vC6nEPn+gTprNK75c+7g/qqPhXVAwKSHACtG0ZbLRv/O9xIsOGiUvW?=
 =?us-ascii?Q?/HGGOfLTR6D2dDmPQ590IjLMYnJzbDVpthCRL/GYSw8LMOgx3Y8dOH16e8bM?=
 =?us-ascii?Q?zg11NM+qj0Ko5JDnS96tE+RvOWAza4mUC6cm5rVRjMQDio4dU8OXjlHHUdWH?=
 =?us-ascii?Q?hEio5OwcCqXE6hDOLk2pbiPLudzlCqOeeMZ289Smb0mzjXVXeHR8xYRVCpDm?=
 =?us-ascii?Q?OJiThIMzyThcJEpjUh/ebQwLNpxnxT5PWYs80/vC9hAxgYd1VYHnTJxyUHHx?=
 =?us-ascii?Q?ZUy0HUmgim3HOyWxkp02H4qlWtGdTA2+tIsnsCduT88Rq4xUkBFU95c2rI+0?=
 =?us-ascii?Q?r/nd/pLsov/mqAE4DCiLjLgddJ0vtcoQ0KmrZLlv5XzZzU8gN3ru/X6//dxT?=
 =?us-ascii?Q?i8us3fzNmQZ8u37doYuixbVWqtk8aR9NrEDhM9dQ2HSOR/NAwwsbDy7f1nYO?=
 =?us-ascii?Q?S96RSvU+Nko34XCfG240OYwjXH6pHoE4OnaJY1qnGopuNWwWc3Hu6HQwUlKu?=
 =?us-ascii?Q?hJ6+tjponf0gIjw0TH1jQVHRTHb3fLU026NCKBno53+/4bbz/piCBLIhPNKZ?=
 =?us-ascii?Q?WUBSi9H4KUOE41IO7an9oBo6C7kbvEI0HRr0Gv0NvaRzNC+gvNHpDfq7F70w?=
 =?us-ascii?Q?0u9si5lCL68A8QD3sAOECTW84rRlEYnHkvux/jDHmCjd/ODKTp7xLCluatOf?=
 =?us-ascii?Q?1IIxVxdoo9q8DuOgcvqFDpAPiqpWNR9a61p7nBN9jrsjaCjp1IkDVFkeshCT?=
 =?us-ascii?Q?zBKSFznEHC/DD3L/Ljv7vJXRbM/yrhaMDmDcNIlaOJ12XSaN2LmoO2F3KzDj?=
 =?us-ascii?Q?nyNzaeAgHfBfm+VKqpMyEisthDROBo+CqIsK9EgR7lI3PI7ENPOmXx5/ZAgI?=
 =?us-ascii?Q?hDKFhzNtQtjWJdrCOBzT2HWfh01d35Evl24QVPaYMNt7xuX31RuhVER8ZtF8?=
 =?us-ascii?Q?1jNoSi6QRGKRVPpDXxvrlwZ7aXu1t+UtAdwU6vBI2PZ2DRtgpwAr86BzD6Jv?=
 =?us-ascii?Q?Dwnrqp2/0/1oBLc0CpoKM2IRx5X8cf4ikjKNxzpsSNbcSk3VS771QgljuQvi?=
 =?us-ascii?Q?cVUFNqUAAVqI16dUm3DrOfd7zdAFQFVKudcw9BoYCyeJkfwqG89zD6i5Iox0?=
 =?us-ascii?Q?JuzY2B3o0kCyW/dGf2HFHvd4KSQKL8bcOiH82z2Xmfj1B7nMjNtujLgLS6QW?=
 =?us-ascii?Q?GaFeisTv3jo7vDtzBrAp6MoTE+T0JldZA8uFxMOOpGsnyxfPTf/7UHdzNrMc?=
 =?us-ascii?Q?LtkeCqeZudanbxfGYZ4PwWonERD2R620O7gYkUTLZ5Bxp6bK+ZbpiZ8AUtNo?=
 =?us-ascii?Q?hu3molbS0TIUgSOos0hR0l481CvATNX6FjggvcgE?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c03bf6e2-1790-49f8-240f-08db8f49776c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 09:03:10.3678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FiFaDxfZP4qnIKOLArxiAbFrNd93Cp7DN4gaMpMNjR/BE8cYGLDjBstcsV3zyTA8cd2QM3ex/IWkduhN3siVhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8188
X-Proofpoint-ORIG-GUID: 9-hGAtcfC4shhRWXgbizqGKASxVKBzw0
X-Proofpoint-GUID: 9-hGAtcfC4shhRWXgbizqGKASxVKBzw0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 mlxlogscore=898 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307280082
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jul 2023 09:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104068

NFQ is the new and improved way to process iptables packets. Snort IPS
mode requires this module in some cases.

Before the patch:
$ snort --daq-list
Available DAQ modules:
pcap(v3): readback live multi unpriv
ipfw(v3): live inline multi unpriv
dump(v3): readback live inline multi unpriv
afpacket(v5): live inline multi unpriv

After the patch:
$ snort  --daq-list
Available DAQ modules:
pcap(v3): readback live multi unpriv
nfq(v7): live inline multi
ipfw(v3): live inline multi unpriv
dump(v3): readback live inline multi unpriv
afpacket(v5): live inline multi unpriv

Also update 0001-correct-the-location-of-unistd.h.patch to fix build
with musl.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-connectivity/daq/daq_2.0.7.bb     |  4 +--
 ...001-correct-the-location-of-unistd.h.patch | 27 +++++++++++++++----
 2 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/meta-networking/recipes-connectivity/daq/daq_2.0.7.bb b/meta-networking/recipes-connectivity/daq/daq_2.0.7.bb
index 14d809f51..c5499ffee 100644
--- a/meta-networking/recipes-connectivity/daq/daq_2.0.7.bb
+++ b/meta-networking/recipes-connectivity/daq/daq_2.0.7.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f9ce51a65dd738dc1ae631d8b21c40e0"
 
 PARALLEL_MAKE = ""
 
-DEPENDS = "libpcap libpcre libdnet bison-native"
+DEPENDS = "libpcap libpcre libdnet bison-native libnetfilter-queue"
 
 SRC_URI = "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
            file://disable-run-test-program-while-cross-compiling.patch \
@@ -19,7 +19,7 @@ SRC_URI[sha256sum] = "bdc4e5a24d1ea492c39ee213a63c55466a2e8114b6a9abed609927ae13
 #
 # never look to /usr/local lib while cross compiling
 
-EXTRA_OECONF = "--disable-nfq-module --disable-ipq-module --includedir=${includedir} \
+EXTRA_OECONF = "--enable-nfq-module --disable-ipq-module --includedir=${includedir} \
     --with-libpcap-includes=${STAGING_INCDIR} --with-dnet-includes=${STAGING_LIBDIR}"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
diff --git a/meta-networking/recipes-connectivity/daq/files/0001-correct-the-location-of-unistd.h.patch b/meta-networking/recipes-connectivity/daq/files/0001-correct-the-location-of-unistd.h.patch
index 38dae2099..7587d4433 100644
--- a/meta-networking/recipes-connectivity/daq/files/0001-correct-the-location-of-unistd.h.patch
+++ b/meta-networking/recipes-connectivity/daq/files/0001-correct-the-location-of-unistd.h.patch
@@ -1,14 +1,15 @@
-From 10e7d4e4bfcb70344d18f0d4ce36068475747f25 Mon Sep 17 00:00:00 2001
+From b7d54de51553f6d09906c355bd0dd326890c8fe4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 29 Mar 2017 15:59:43 -0700
 Subject: [PATCH] correct the location of unistd.h
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Pending
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
  os-daq-modules/daq_ipfw.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ os-daq-modules/daq_nfq.c  | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/os-daq-modules/daq_ipfw.c b/os-daq-modules/daq_ipfw.c
 index 016beb0..c2a4175 100644
@@ -26,6 +27,22 @@ index 016beb0..c2a4175 100644
  
  #include <netinet/in.h>
  #include <sys/socket.h>
+diff --git a/os-daq-modules/daq_nfq.c b/os-daq-modules/daq_nfq.c
+index 33021c0..4de94b6 100644
+--- a/os-daq-modules/daq_nfq.c
++++ b/os-daq-modules/daq_nfq.c
+@@ -24,10 +24,10 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <unistd.h>
+ 
+ #include <sys/types.h>
+ #include <sys/time.h>
+-#include <sys/unistd.h>
+ 
+ #include <netinet/ip.h>
+ 
 -- 
-2.12.1
+2.25.1
 
-- 
2.25.1


