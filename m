Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 125FDC46467
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 07:28:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7053.1672558072864328608
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Dec 2022 23:27:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=tD++Muan;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03651cea20=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3017PQ2T005202
	for <openembedded-devel@lists.openembedded.org>; Sat, 31 Dec 2022 23:27:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=NmcUpNdiTTNbrgyMss9CERpsbLRVVEGL0TkRCGbIIjM=;
 b=tD++Muan7W4WzyNcRvdNvRO+zy4FOzGrcJMH6r3q3bjzxGIhcwC79KPIXmgvGxL9G1iX
 t6eS1L20nTfXTIkNexUjukjPMUNv7gbbvsAI0Nzmad/lQIs/2YSM3KKDVcCY+FSxRPfu
 xaR6hRdqHYuGMGgNeO2dF5qnMM+ckH5Zu0t0i/6ghyC3THHC8WX7yWb1wSvIpgtJ1ZZx
 sA+Cq3fIb+1I7tvZQ5XESrYOETFM97MGCULC3dlTVfZ9Hd3AI46jdfDj4reeNVHIN1sD
 Q0gurf5wjkPxG1gOQOgSiOsy+4cV39ul9RV2Y1eIz9KYaGTn6eQdWMiJ5nX4N/IUW4JH 8w== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mth87rd7s-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 31 Dec 2022 23:27:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nnkl9UUP/0Dq6jqb7zoerdQd8iOYdjjjc0Dsi4vvNVefwtuhk9D6tna6CPyyqkFE2mU0UamxPl5jU/UuUgfK7VvUQFXPY2d91YTtVQIDOspvSGpMD/1ykUUBcVl+wtry7MZQVuydBAcWwBsXNTBT7yTsJHg/OE2kraKncfbpT0uUlN9XcfgrU0eGjv8Hi7JSOv3VmpG1fHZ2jjGPFEm5RIVhvjibi++UhB8x8c4ulsCHdlQt/144THy0d0Lvxhr6qTiNOOie7BXVp08gFONqRCIGGscmGG1gjCDG+CJVbg/KaxxC9yCpCLW0O4Rj+a2gYD29miBdRkejDMqVVmdISQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NmcUpNdiTTNbrgyMss9CERpsbLRVVEGL0TkRCGbIIjM=;
 b=LnDo2esDuGCpCAUhDc5NoXVcqqjIgJ/Kk+UOscaa/ifjWJvW3diY3gkh2tojl0MEIHkH7tv7ov/w+FGQsoiNuh4O0gNs+dj/iN57K33czXSzEbWaRHGYMAxSKgz6oqN7ZB45NFzdwhmGEzgfQ11kPJEVIidVnKYZ+Yya8vdBFfwKe+IJ2YN4FNOsa1wNutSDEuq1kyRthCg7WsbyPyXcZ8Pk+8piEhNyjPiTnHmgamnhETxe614dHOD3o7xHqt4Bob7A31UBG2mumHTNsEgDNx3bkPlnQ/qJ2vHMV4sKY9tDmAsLkk9J8mXrbUfI2pjpsrt+pCYpe2Q8+nQozzBeEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SN7PR11MB7638.namprd11.prod.outlook.com (2603:10b6:806:34b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.18; Sun, 1 Jan
 2023 07:27:50 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::eb7b:3a04:80bb:4a5f]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::eb7b:3a04:80bb:4a5f%4]) with mapi id 15.20.5944.019; Sun, 1 Jan 2023
 07:27:50 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/5] libtdb: upgrade 1.4.3 -> 1.4.7
Date: Sun,  1 Jan 2023 15:27:36 +0800
Message-Id: <20230101072739.75462-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230101072739.75462-1-yi.zhao@windriver.com>
References: <20230101072739.75462-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0103.namprd05.prod.outlook.com
 (2603:10b6:a03:334::18) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|SN7PR11MB7638:EE_
X-MS-Office365-Filtering-Correlation-Id: f72e209c-d46a-475f-933c-08daebc9afe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SWUAmbfifKIs0ElrapAHBhS7Vhag7v7JJP4+zVXA+N7yaAQQOwuqS3lpr2vUbpuib1EyCOZ+DND2ofgzSOlUQlsfCZgcLnaUovE1moKtfxPqcnODc/bo9/Tu+Qpgc1QYoYkRBk3Yuo7thWG/vp7HZ508Zmr4cDEUSXHMXJPnFwP/SdyaWNCQMUOwznCuJM5ddc/u8z8+Mj4VZZDaM1R2/dxNCbVPCNnSO6ie/oAS4pI24+w6iaxKOsYiWQZUnnJXLgvcR66WzcTGQZQUFG5dOfbTMPNhf9TrjtTAZEY+tCbMeTtt44SHbDgDiarTcCS5nRk3ELHQSd1I4jiCvGBBl7MTEW0RiFRP2xN3hTf+kQJrfG2G65SZSor13sNuO+QwZQp9KInLkNnSo8EETjov7+h/ky+mUeO0n9p/q85+ijgmpv4Ce3QPdmQ2TsbwwBao2Nxp826s3mwRapi/kdwwPxUG/cCwKiWm/4AUKSr+vnuPOsgGco73B0OaHYaC89d5HZ8AdUd0DQcvP8XYo49H9Ra9k+gWOV6uPGOw5ghtI/WFulna8nIaAG0J99dgUyDDApMellkycfFozt1/Tkw+yn08viHMvguOczG4x3mqrVn+CK/7pOmETUUetLgu5h9qVokZg/c5ZHAX00IHAhPa8qtZOz//6Ty/ywVL8HF1EHMXi5IIxz98f4oIFIQ656hc95li+rzC3sucsiCOBL2r5RT35tF7Wt8Am66D6o36oKSGwV6go/HOBaG7v3tpG6Rb
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39840400004)(396003)(376002)(366004)(451199015)(6666004)(8936002)(53546011)(38350700002)(478600001)(6506007)(38100700002)(6916009)(52116002)(2906002)(86362001)(41300700001)(2616005)(26005)(186003)(6512007)(36756003)(44832011)(66556008)(83380400001)(66476007)(5660300002)(316002)(6486002)(66946007)(1076003)(8676002)(22166003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/AWOtt5eXKrlI3h8BA6ihA7fSHX9uVGBlRJCD0tZKEYVzZTJSpbtBhT7Xt5X?=
 =?us-ascii?Q?fASBBNSmGYioYaWCCVAmVca+SbQhLxyLk/bfKjywW6Fu9lAXS8t8SKtDHXY2?=
 =?us-ascii?Q?WRFk4M0DCBv5fH7dj+Fcpsiy6BTF7WsgEjzi3bLk3kdA8mU7OAjDOnV9eW3d?=
 =?us-ascii?Q?2nwEIpzpOf45OpFkvYDY5I/FzKHJXEKdzRXSFNgnkwynasqkJtquQfff1quS?=
 =?us-ascii?Q?CmOiKT6Qy5rl2v2SMIgp5sHMsU0rTfXsfyJcPo45g0V/Mm4IDpbtDZZC/H4U?=
 =?us-ascii?Q?zVn45K2hJRuot0QknJ9aIHU74yNvMd/JElzpEHXz34AGvyEkBofuVh/EP3DB?=
 =?us-ascii?Q?5gVPuPrr/DQHy9m2hJJkxVXmfTz0nnjJIJIrSfoIXkdkAwMD+CTbXqyGH3GQ?=
 =?us-ascii?Q?JCfIElppnXYahjYjbOKXygMSXhXgGw3hWmWcMgOmTb9b1DbENeg1YtqDuLHn?=
 =?us-ascii?Q?4IcvN/sLmhW/TxZPfzx0gnqV8qtXNVshuuH6EK3sxsJEvCQRqSfEz5p0xNdb?=
 =?us-ascii?Q?P7aD96h/TO5439mPJOwZGx70yW710qLyysqLJsgEpSgK2H8g/yjCN4oStsMU?=
 =?us-ascii?Q?o4qMu2U9KPPPYQ55C/sa/Xm+w/eX3afKD9/HSw18s4Gc8HLVambVeHiZjSOB?=
 =?us-ascii?Q?5dc1Ftx2MZH53tcdmWdvhV1PAGDVDHUSsnwGkNVEs1Tg6Z2cDLIU5cAJOs4r?=
 =?us-ascii?Q?54rcOOFVqUghZEzjZxdVkcq8dZptbcIjv98U6OUsBd09iLM8VopU/6wD910A?=
 =?us-ascii?Q?aqBnD0OQ48t5OpVG+JyfQ3Gsz7jmPcdVlhgBIQjhvXOVNXrfk29AQwL9Xbel?=
 =?us-ascii?Q?hyiP/Ld0yCVXIQJIonzkiW2K3QkOzu00BO5L2G/IwUCj7AwAvFq36QzzAZHp?=
 =?us-ascii?Q?uyMFFqFmtSDwJtVITIkSIJFM4qhFf8NmfzHfTvQueYjf39p2PwhZDN20JEyd?=
 =?us-ascii?Q?HFIQHApRPRKPU1f9uTzQEgaO7HdMuWdJnslN8CHj8D6iSAnpRPjtTfTRzr1F?=
 =?us-ascii?Q?2v8+CUqeEC6qRS0r86G5uXBaCT9td8F+1IzYOai0jMBQIyY6Cdz4TP3i2WLC?=
 =?us-ascii?Q?MFw92vrAwofAeLsQkMqv3AtY2Vc1ViVyBm+IgPDllXtEJ61ptFMJbzmmIPbk?=
 =?us-ascii?Q?iNgSBFigDMbfxWjxVlQGyh0sZ9BB/Ck1XYy3pXB2Jz5ehbqMXbkWUaYr5Mmh?=
 =?us-ascii?Q?VWwGDGNIkbLMnUKyYKbi0DM3wsdKyqIsbDRi34wm4LpGEoRjeggJkjri+Rzb?=
 =?us-ascii?Q?40R3bvEFGoyBd15ivnGCLIhy3RMiDNWL8AWXE291nhn4P/zmvw1eJJ5YHZLo?=
 =?us-ascii?Q?ES+ObBdiwAqBbKf11WQ3LdGOMOqcbLpTyvFV6bIYDS8aMJMEz70EuECPWlGK?=
 =?us-ascii?Q?WiRG8rG+t5IOKCE6WjnNZ/u42YAFZowo/8Cr3/az/D8tt7+gfDvZ6Y7GJ1BT?=
 =?us-ascii?Q?UfBhL05j3X7V392YC7qZEq8e0h9s7dZh7x7JpIz9mjPCq6Y/NjkaolqeyE8l?=
 =?us-ascii?Q?fwzD+Z9rKA7ECXvD62EpkeNuRf5nhf+qDwukVsCFcD9DIi4C30f5TjITsrqo?=
 =?us-ascii?Q?bRh3r6qCo0KnaAKTaE5leYV0abVGbv1m+GwvMtl7?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f72e209c-d46a-475f-933c-08daebc9afe4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2023 07:27:50.0791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: odN7JNyD1XbGuZ33jAqdohZYEzAjNrNjUzfXaoOgchJswRXtlANPCf7vVMDkfVTc7mKl2BH9UCLN+1XMO+Tgtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7638
X-Proofpoint-ORIG-GUID: MCJ4XgTs_i5nOv9qOqb0u6bfTQGWlH97
X-Proofpoint-GUID: MCJ4XgTs_i5nOv9qOqb0u6bfTQGWlH97
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100330

* Refresh patches
* Add a patch to skip checking PYTHONHASHSEED

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-Add-configure-options-for-packages.patch} | 21 +++++++------
 ...pyext_PATTERN-for-cross-compilation.patch} | 10 +++----
 ...wscript-skip-checking-PYTHONHASHSEED.patch | 30 +++++++++++++++++++
 .../{libtdb_1.4.3.bb => libtdb_1.4.7.bb}      | 12 ++++----
 4 files changed, 52 insertions(+), 21 deletions(-)
 rename meta-networking/recipes-support/libtdb/libtdb/{tdb-Add-configure-options-for-packages.patch => 0001-tdb-Add-configure-options-for-packages.patch} (93%)
 rename meta-networking/recipes-support/libtdb/libtdb/{0001-Fix-pyext_PATTERN-for-cross-compilation.patch => 0002-Fix-pyext_PATTERN-for-cross-compilation.patch} (83%)
 create mode 100644 meta-networking/recipes-support/libtdb/libtdb/0003-wscript-skip-checking-PYTHONHASHSEED.patch
 rename meta-networking/recipes-support/libtdb/{libtdb_1.4.3.bb => libtdb_1.4.7.bb} (78%)

diff --git a/meta-networking/recipes-support/libtdb/libtdb/tdb-Add-configure-options-for-packages.patch b/meta-networking/recipes-support/libtdb/libtdb/0001-tdb-Add-configure-options-for-packages.patch
similarity index 93%
rename from meta-networking/recipes-support/libtdb/libtdb/tdb-Add-configure-options-for-packages.patch
rename to meta-networking/recipes-support/libtdb/libtdb/0001-tdb-Add-configure-options-for-packages.patch
index c35cab7c2..93a85e854 100644
--- a/meta-networking/recipes-support/libtdb/libtdb/tdb-Add-configure-options-for-packages.patch
+++ b/meta-networking/recipes-support/libtdb/libtdb/0001-tdb-Add-configure-options-for-packages.patch
@@ -1,4 +1,4 @@
-From 71a10c176c34da898c0169371b3c1b032d2f88b1 Mon Sep 17 00:00:00 2001
+From d3b1d23e01e323b9610843ab6bef096512f6c244 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 19 Jun 2019 17:53:34 +0800
 Subject: [PATCH] tdb: Add configure options for packages
@@ -19,12 +19,12 @@ Update to 1.4.0
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- lib/replace/wscript | 94 ++++++++++++++++++++++++++++++++++++++++-------------
- wscript             |  6 ++++
- 2 files changed, 78 insertions(+), 22 deletions(-)
+ lib/replace/wscript | 92 ++++++++++++++++++++++++++++++++++-----------
+ wscript             |  6 +++
+ 2 files changed, 77 insertions(+), 21 deletions(-)
 
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index 1d01e1e..2336dc3 100644
+index 827d74f..70cde6f 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
 @@ -25,6 +25,41 @@ def options(opt):
@@ -69,7 +69,7 @@ index 1d01e1e..2336dc3 100644
  @Utils.run_once
  def configure(conf):
      conf.RECURSE('buildtools/wafsamba')
-@@ -34,12 +69,25 @@ def configure(conf):
+@@ -35,12 +70,25 @@ def configure(conf):
      conf.DEFINE('HAVE_LIBREPLACE', 1)
      conf.DEFINE('LIBREPLACE_NETWORK_CHECKS', 1)
  
@@ -78,10 +78,9 @@ index 1d01e1e..2336dc3 100644
 +    conf.CHECK_HEADERS('linux/types.h crypt.h locale.h compat.h')
 +    conf.CHECK_HEADERS('attr/xattr.h compat.h ctype.h dustat.h')
      conf.CHECK_HEADERS('fcntl.h fnmatch.h glob.h history.h krb5.h langinfo.h')
--    conf.CHECK_HEADERS('locale.h ndir.h pwd.h')
+     conf.CHECK_HEADERS('locale.h ndir.h pwd.h')
 -    conf.CHECK_HEADERS('shadow.h sys/acl.h')
 -    conf.CHECK_HEADERS('sys/attributes.h attr/attributes.h sys/capability.h sys/dir.h sys/epoll.h')
-+    conf.CHECK_HEADERS('locale.h ndir.h pwd.h')
 +    conf.CHECK_HEADERS('shadow.h')
 +    conf.CHECK_HEADERS('sys/attributes.h sys/dir.h sys/epoll.h')
 +
@@ -114,7 +113,7 @@ index 1d01e1e..2336dc3 100644
      conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
      conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
      conf.CHECK_HEADERS('syscall.h sys/syscall.h inttypes.h')
-@@ -380,20 +429,21 @@ def configure(conf):
+@@ -431,20 +480,21 @@ def configure(conf):
  
      strlcpy_in_bsd = False
  
@@ -151,7 +150,7 @@ index 1d01e1e..2336dc3 100644
      conf.CHECK_CODE('''
                  struct ucred cred;
 diff --git a/wscript b/wscript
-index 5598d02..8d47244 100644
+index 71ada31..10b16a7 100644
 --- a/wscript
 +++ b/wscript
 @@ -69,6 +69,12 @@ def options(opt):
@@ -168,5 +167,5 @@ index 5598d02..8d47244 100644
  def configure(conf):
      conf.env.disable_tdb_mutex_locking = getattr(Options.options,
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-networking/recipes-support/libtdb/libtdb/0001-Fix-pyext_PATTERN-for-cross-compilation.patch b/meta-networking/recipes-support/libtdb/libtdb/0002-Fix-pyext_PATTERN-for-cross-compilation.patch
similarity index 83%
rename from meta-networking/recipes-support/libtdb/libtdb/0001-Fix-pyext_PATTERN-for-cross-compilation.patch
rename to meta-networking/recipes-support/libtdb/libtdb/0002-Fix-pyext_PATTERN-for-cross-compilation.patch
index 6f221989f..6bd118b53 100644
--- a/meta-networking/recipes-support/libtdb/libtdb/0001-Fix-pyext_PATTERN-for-cross-compilation.patch
+++ b/meta-networking/recipes-support/libtdb/libtdb/0002-Fix-pyext_PATTERN-for-cross-compilation.patch
@@ -1,4 +1,4 @@
-From 00bd6680ad38c20c95a35c963d7077269f3a3aa2 Mon Sep 17 00:00:00 2001
+From 10b4546edb194ede7a5e8bb5e4c9f5fdc67984eb Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Wed, 24 Nov 2021 13:33:35 +0800
 Subject: [PATCH] Fix pyext_PATTERN for cross compilation
@@ -25,18 +25,18 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/third_party/waf/waflib/Tools/python.py b/third_party/waf/waflib/Tools/python.py
-index 7c45a76..c9a90f7 100644
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
 
diff --git a/meta-networking/recipes-support/libtdb/libtdb/0003-wscript-skip-checking-PYTHONHASHSEED.patch b/meta-networking/recipes-support/libtdb/libtdb/0003-wscript-skip-checking-PYTHONHASHSEED.patch
new file mode 100644
index 000000000..ebe3198f1
--- /dev/null
+++ b/meta-networking/recipes-support/libtdb/libtdb/0003-wscript-skip-checking-PYTHONHASHSEED.patch
@@ -0,0 +1,30 @@
+From b5864f0d542485c4fbfeb7b02fdd99e0b4e1dbc7 Mon Sep 17 00:00:00 2001
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
diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.4.3.bb b/meta-networking/recipes-support/libtdb/libtdb_1.4.7.bb
similarity index 78%
rename from meta-networking/recipes-support/libtdb/libtdb_1.4.3.bb
rename to meta-networking/recipes-support/libtdb/libtdb_1.4.7.bb
index 2affcf754..6775e6f06 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.4.3.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.4.7.bb
@@ -1,5 +1,5 @@
 SUMMARY = "The tdb library"
-HOMEPAGE = "http://tdb.samba.org/"
+HOMEPAGE = "https://tdb.samba.org/"
 SECTION = "libs"
 LICENSE = "LGPL-3.0-or-later & GPL-3.0-or-later"
 
@@ -7,12 +7,13 @@ LIC_FILES_CHKSUM = "file://tools/tdbdump.c;endline=18;md5=b59cd45aa8624578126a8c
                     file://include/tdb.h;endline=27;md5=f5bb544641d3081821bcc1dd58310be6"
 
 SRC_URI = "https://samba.org/ftp/tdb/tdb-${PV}.tar.gz \
-           file://tdb-Add-configure-options-for-packages.patch \
-           file://0001-Fix-pyext_PATTERN-for-cross-compilation.patch \
+           file://0001-tdb-Add-configure-options-for-packages.patch \
+           file://0002-Fix-pyext_PATTERN-for-cross-compilation.patch \
+           file://0003-wscript-skip-checking-PYTHONHASHSEED.patch \
 "
 
-SRC_URI[md5sum] = "e638e8890f743624a754304b3f994f4d"
-SRC_URI[sha256sum] = "c8058393dfa15f47e11ebd2f1d132693f0b3b3b8bf22d0201bfb305026f88a1b"
+SRC_URI[md5sum] = "bc27d5b20c7f013305c40b3bced43b3a"
+SRC_URI[sha256sum] = "a4fb168def533f31ff2c07f7d9844bb3131e6799f094ebe77d0380adc987c20e"
 
 PACKAGECONFIG ??= "\
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)} \
@@ -35,6 +36,7 @@ inherit waf-samba
 export WAF_NO_PREFORK="yes"
 
 EXTRA_OECONF += "--disable-rpath \
+                 --disable-rpath-install \
                  --bundled-libraries=NONE \
                  --builtin-libraries=replace \
                  --with-libiconv=${STAGING_DIR_HOST}${prefix}\
-- 
2.25.1


