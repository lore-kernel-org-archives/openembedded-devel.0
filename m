Return-Path: <ovidiu.panait@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A926DC001B2
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 20:20:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.645.1670530810321173025
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Dec 2022 12:20:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=93414a1a6e=ovidiu.panait@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B8DnE9t019970
	for <openembedded-devel@lists.openembedded.org>; Thu, 8 Dec 2022 20:20:09 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2047.outbound.protection.outlook.com [104.47.74.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m7up0cuh0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 08 Dec 2022 20:20:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dROORe1cw1ZdAPHL4xe6GZpu+WZazFIgz61uNjnS4iwduIcLuGTrI1AZEXONnuCP/QAYOFpsfB9TOaURt2Lvj2wTZkMgmuFAxqI5dhNC17Ffbl5QHklS4BNMSDp019hjBrFAm+Ne+F99KPD8f91+/LKbuAh6U1t0Z6igBlTObKoGpQoNbe0cNx+pjjlbquoaDrwFfmtoCt0Gkm7lU5pSCapli5cApdmq+KxVYaDDx/aPG4EBVDjx3BtDDqkNcpr6e8cosxEFeVG7S7K67kN6xAs6krK9adLuWtAC38GBukEOj0uPCRMgOBWcmxYY1KDNkyOYid6n5BHkkxbJP2+w9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fFuky1yVfHmu9TmzWvZ+aZIsvSKBtBBaGbycveNK/E0=;
 b=g1I4tl9VmuKfUXP7aIwLPbwmPAWxEij3KmRx3Gp32fCb06uU2UaKm5NJskrspg1bH4pEOsEuvomoF9oC0c9Mtke8IMy9H10nxXPZzDROXul+JBiNgl/q0EsBUsAI1eIxh8QP8+BcLWpZwkYknJIiBB+xiO4k8o1+tMGusaLTDvd0c1KYOeGJvyQJSCbIH82Wr9lOfie6i5tz9uS++bxpcLMdtVE1qr1GuUBrh1D9wNiTPoRsymYroTiicDxDC2pYARP5DxvoPs+ljFrTFCV+s0FsZFVGtSxm7WFlCeUzTevzjHLA/m2SCkLGFOWMNObMETWt4NvQaALynUpbjSRXIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from DM4PR11MB5327.namprd11.prod.outlook.com (2603:10b6:5:392::22)
 by CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.16; Thu, 8 Dec
 2022 20:20:06 +0000
Received: from DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::da82:93c2:307:df99]) by DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::da82:93c2:307:df99%7]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 20:20:05 +0000
From: Ovidiu Panait <ovidiu.panait@eng.windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/1] multipath-tools: upgrade 0.8.4 -> 0.9.3
Date: Thu,  8 Dec 2022 22:19:44 +0200
Message-Id: <20221208201944.2010999-1-ovidiu.panait@eng.windriver.com>
X-Mailer: git-send-email 2.38.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR08CA0006.eurprd08.prod.outlook.com
 (2603:10a6:803:104::19) To DM4PR11MB5327.namprd11.prod.outlook.com
 (2603:10b6:5:392::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5327:EE_|CO6PR11MB5602:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c86c318-8bbc-4619-8c37-08dad9599820
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hWQkM4N29QFTWPcPGWCaFJfj8DuR1mQwRH6rG3axQY3eVboc1zHk7N87BvQKgLlI0biLxk4Ker2flTq7LJAT8AAQReTukowvo6x++MsjF04tzv0KZnk5puwJPzBUNMyjHS2FoVlmFftUwiPnOi5RLYWf8Q3c5joelKkkqnCQUJ6VaWFk79xK62o6pC+4PADUjjGlLqpp4hiey4Sw5wWkPxW5Sv7Rt/A5ztmFnk3G7goltLvawhYJbxwEIGNheLxYyiaaZ1jvP+4SBCiducdqtJkJN6BHvCJU66oKSMVWPx30VBnJGwErFweJlo+mKe0YwyZf48hc6AJESGM/2ENds5ZwSl4aMCJFQedaYpI7fk2nFLDPnhBW7ZEC0q/Mi7O410PR/VSogfcABSBXy91w6nX8GSFH9JRMq1EZogkepevMI2HRAPesv3B1xZyoRcbBq4WTvcwHKL30/8ckCe0lC8E+X7YGDtPBFKTCMg92AP1knHGcSx4ou1i6UREOw9va88l2uXV0OHgcyzcdG9MRGiYSUf/fN931HjWEOejndb6uovc+GGGhNisBWa0mP0JQyrZGAhtRLsM6b5wj7obInHGXlm/0Xn7OX1+Rnvd5UL/xX1Rh6eLNFqt69xFC5R//LF1aDabOlr9JJyS9Iuywu52RcCuHoZsriWx1KvXe1s51Z3EppXcT24coaBFwQP7Tv+7lqvAlEZfttz0zWTk09QDV3occTY44FTOkyDAy/Bdt1swzKstjgzx72uc7rBdR
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5327.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(366004)(396003)(346002)(136003)(376002)(451199015)(83380400001)(6666004)(966005)(44832011)(30864003)(6486002)(478600001)(2906002)(52116002)(6506007)(5660300002)(8936002)(316002)(53546011)(8676002)(83170400001)(26005)(186003)(41300700001)(1076003)(6512007)(2616005)(66946007)(66556008)(38100700002)(6916009)(38350700002)(66476007)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pIenK7imIPkG937dfi+r/uekfnpUGpTlL55qWkkCRj9pnGKIkvYpjuSqErMw?=
 =?us-ascii?Q?vZaaXKl7XAJFr/JXJeCDNn6A1z8IuLCXNJdT9ttpFQGFzqYSHIBRh94ckjCa?=
 =?us-ascii?Q?A74hSaKMGqfy5aiVtVUMGlTMJklni3oIjraNVGIhydEW54RChLdKNVe7BdGe?=
 =?us-ascii?Q?J2Jj9RLbtDy0/K1otEJs2AWBPsta/FBjEnVDwmQE+FY0F9pY1/tm9IkmDILE?=
 =?us-ascii?Q?1Ryr4mmzkmLQnLxbMF8pa3LkgUMYRdcuH+Ig62L+/1ZKe3cFU+hhvb+bXrwp?=
 =?us-ascii?Q?b5T9fhiIqasT9Ta9KjS7wNUaIW1bCw0HlAomKeOY+rwhU93rxXpCjYzrH00w?=
 =?us-ascii?Q?GfMJjWtWa7J+Mm5fEOsUPiN0urkSWx6IOA5VInnNvdpJ1qwme+3qe0Qr8s0T?=
 =?us-ascii?Q?fu9axaeYmOg8Yysjk3UNnDad22QSg9Wq9g7nkMc0jK7o8jnLW7adpIs6EDTX?=
 =?us-ascii?Q?FEHfmlqMc8AD2frfT9UwimiGmk+iNFo2fUKl4llaA2NOu1YYY2BIhnFg32xe?=
 =?us-ascii?Q?XhAwKNxuOeh2X6KRaaIRn9giyXStPnaYB4edSLng31ja6BuwcjIdsTENwIoZ?=
 =?us-ascii?Q?Ir3WRU7Nw4UnXF5oU0p4rP2Vh0KpA8FAiIKCgCN8rSDqmT1ChRm8xP1W8aeI?=
 =?us-ascii?Q?igeVJS2XcMFTIfEzDYIUglSNPf3dshMuR+36GxtE0pBMLvVtnMBdakxmOT7U?=
 =?us-ascii?Q?BrgZlGatxaOR2/TQ4Nix+Slp4uBLYchnic2BsstXXbVJ8p6vbhEi7trLdB66?=
 =?us-ascii?Q?cnWrK6FHNl409XCamQsonGOjlq9IJtrdUpHTP8e3FJrsdBcn9piY8omiSo2P?=
 =?us-ascii?Q?lD6ambF3sZqeIZfy6PFht3cjnakLB9v9VbAL9URmC5V8mq22PSxAJm0Ds+kb?=
 =?us-ascii?Q?khLaW03NvpeayTrL1HzwjfZiNTKhNh7yP1h58UtTBCOLkTpbXTUM5lzDsJVz?=
 =?us-ascii?Q?xGR6QF1bN3o2b1+EsU4P0gFzcASvRygRLh4IZXnLbZ58yFED3uwjU+mA5zT0?=
 =?us-ascii?Q?2qXWaaeJOMZl6KjRnhRBnlARA/2cPXoXJzN5CNPZYjMp9G6ujYiHVirGOn3/?=
 =?us-ascii?Q?Y7w2XdD6scKPX+ZsoZglnbuZwVpNEX14/JiD1X7dRl/WPKMXKmTyXvsn7/vM?=
 =?us-ascii?Q?LOI1cs8GZHIUO2MkIADMdwMrCMhrHhZjni/TEbR64FkJCTobsD+fBrtxdnOR?=
 =?us-ascii?Q?wJW3AHQWmWIcyS2eFN67qlwaUmJNizl+4kbtvjyb3ORMbg4USksWViGebeBt?=
 =?us-ascii?Q?LLQiQo/ZKEUIZ0Abefi9C+FJRt3o8uo59qaUBqJeTCvyMKLJXS/XIFzfYWO/?=
 =?us-ascii?Q?tDLx5WJU99RqAjQ+0BeHF6THLIG/1nVk57/Iq292eLcsz9mv89Lc0qm0gQm1?=
 =?us-ascii?Q?LVZLMBpPRw7fSEZSpZsecetRC152LKNAFCRxAsFcjcbDjWOz0m+lMhgNF0Q8?=
 =?us-ascii?Q?LQg4Q6xl72wwETql9YXCHmGBqBQVB1JrrsjZmGLSacfvVIrH2zhEpC86Y6yg?=
 =?us-ascii?Q?9wTv5UvPUrCjn5c78+Rvfl9TH1yYeaXxpAvYUawy+VaxAZ0eKlenmv+u9IcO?=
 =?us-ascii?Q?3Tq3HF+aPxKHeUtrWlIwvrK1JaAOAnTO9NWvNyQDxk85IlWd0gDTkupI+W+m?=
 =?us-ascii?Q?Pw=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c86c318-8bbc-4619-8c37-08dad9599820
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5327.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 20:20:05.7682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CT4Li9NkPq57QY5MBr4elJS1INGVpk9n8fuc4efNOyBfYN77PT6SLwLK0tx9NFqvltk1iGmiTE4+Al6xj4dRyVE5h+n+TMWyv3XKicp3w9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5602
X-Proofpoint-ORIG-GUID: 74vS_M5Ujxf2M3r7p4G5J4KqcHoy4oLx
X-Proofpoint-GUID: 74vS_M5Ujxf2M3r7p4G5J4KqcHoy4oLx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-08_11,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011 impostorscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212080169
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Dec 2022 20:20:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99998

From: Ovidiu Panait <ovidiu.panait@windriver.com>

* most patches were rebased on top of 0.9.3 with various small adjustments.

* the following patches were dropped:
  0001-fix-boolean-value-with-json-c-0.14.patch
  0001-libmultipath-uevent.c-fix-error-handling-for-udev_mo.patch

  replaced by upstream commits:
  82129852d747 ("fix boolean value with json-c 0.14")
  54349bcfc818 ("libmultipath: avoid buffer size warning with systemd 240+")

* prefix, plugindir, modulesloaddir, and tmpfilesdir were added to EXTRA_OEMAKE
  to fix QA.

* libgcc was added to RDEPENDS in order to fix the following startup error:
  "libgcc_s.so.1 must be installed for pthread_cancel to work"

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 ...add-explicit-dependency-on-libraries.patch | 24 +++---
 ...1-fix-boolean-value-with-json-c-0.14.patch | 42 ----------
 ...fix-bug-of-do_compile-and-do_install.patch | 33 ++++----
 ...ent.c-fix-error-handling-for-udev_mo.patch | 39 ---------
 .../0021-RH-fixup-udev-rules-for-redhat.patch | 40 ++++-----
 ...property-blacklist-exception-builtin.patch | 25 +++---
 ...RH-don-t-start-without-a-config-file.patch | 58 ++++++-------
 .../0024-RH-use-rpm-optflags-if-present.patch | 44 ++++++----
 .../files/0025-RH-add-mpathconf.patch         | 61 +++++++-------
 ...om-kernel-cmdline-mpath.wwids-with-A.patch | 17 ++--
 ...-on-invalid-regex-instead-of-failing.patch | 82 +++++++------------
 ...modify-Makefile.inc-for-cross-compil.patch | 14 ++--
 .../files/0030-Always-use-devmapper.patch     | 59 ++++++++-----
 ...0031-Always-use-devmapper-for-kpartx.patch | 16 ++--
 ...-replace-perl-with-sed-in-install-ta.patch | 14 ++--
 ...ools_0.8.4.bb => multipath-tools_0.9.3.bb} | 10 ++-
 16 files changed, 256 insertions(+), 322 deletions(-)
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0001-fix-boolean-value-with-json-c-0.14.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0001-libmultipath-uevent.c-fix-error-handling-for-udev_mo.patch
 rename meta-oe/recipes-support/multipath-tools/{multipath-tools_0.8.4.bb => multipath-tools_0.9.3.bb} (93%)

diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-add-explicit-dependency-on-libraries.patch b/meta-oe/recipes-support/multipath-tools/files/0001-add-explicit-dependency-on-libraries.patch
index 2827bb874..3b0a70448 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0001-add-explicit-dependency-on-libraries.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0001-add-explicit-dependency-on-libraries.patch
@@ -1,4 +1,4 @@
-From 04884263d1de8c427a7a15bd1cf6466ea65d3a0b Mon Sep 17 00:00:00 2001
+From ee9f7b6e764be5668bc958f8bb97a46e5056d050 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 25 May 2020 23:22:55 -0700
 Subject: [PATCH] add explicit dependency on libraries
@@ -17,24 +17,24 @@ ln -sf libmpathpersist.so.0 libmpathpersist.so
 Upstream-Status: Pending
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+[OP: Rebase to 0.9.3]
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
 ---
- Makefile | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
+ Makefile | 1 +
+ 1 file changed, 1 insertion(+)
 
 diff --git a/Makefile b/Makefile
-index bea0a0b2..37a77129 100644
+index f195b570..2d22881c 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -29,7 +29,8 @@ $(BUILDDIRS):
- 	$(MAKE) -C $@
- 
- multipath multipathd mpathpersist libmpathpersist : libmultipath
--mpathpersist:  libmpathpersist
-+mpathpersist multipathd:  libmpathpersist
-+libdmmp libmultipath mpathpersist multipath multipathd: libmpathcmd
+@@ -78,6 +78,7 @@ libmultipath: libmpathutil
+ libmpathpersist libmpathvalid multipath multipathd: libmultipath
+ libmultipath/prioritizers libmultipath/checkers libmultipath/foreign: libmultipath
+ mpathpersist multipathd:  libmpathpersist
++libmultipath mpathpersist multipath multipathd: libmpathcmd
  
  DEPS_ON_MULTIPATH := \
  	multipath \
 -- 
-2.21.0
+2.38.1
 
diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-fix-boolean-value-with-json-c-0.14.patch b/meta-oe/recipes-support/multipath-tools/files/0001-fix-boolean-value-with-json-c-0.14.patch
deleted file mode 100644
index cf97b491e..000000000
--- a/meta-oe/recipes-support/multipath-tools/files/0001-fix-boolean-value-with-json-c-0.14.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 5ae81386a8cfea4180738c261cd3f7944a631199 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 3 Jun 2020 16:03:56 -0700
-Subject: [PATCH] fix boolean value with json-c 0.14
-
-Patch from Christian Hesse posted here
-https://www.spinics.net/lists/dm-devel/msg40646.html
-
-Upstream json-c 0.14+ removed the TRUE and FALSE defines in commit
-0992aac61f8b087efd7094e9ac2b84fa9c040fcd.
-
-Upstream-Status: Submitted [https://www.spinics.net/lists/dm-devel/msg40646.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libdmmp/libdmmp_private.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libdmmp/libdmmp_private.h b/libdmmp/libdmmp_private.h
-index ac85b63f..29400826 100644
---- a/libdmmp/libdmmp_private.h
-+++ b/libdmmp/libdmmp_private.h
-@@ -82,7 +82,7 @@ static out_type func_name(struct dmmp_context *ctx, const char *var_name) { \
- do { \
- 	json_type j_type = json_type_null; \
- 	json_object *j_obj_tmp = NULL; \
--	if (json_object_object_get_ex(j_obj, key, &j_obj_tmp) != TRUE) { \
-+	if (json_object_object_get_ex(j_obj, key, &j_obj_tmp) != 1) { \
- 		_error(ctx, "Invalid JSON output from multipathd IPC: " \
- 		       "key '%s' not found", key); \
- 		rc = DMMP_ERR_IPC_ERROR; \
-@@ -90,7 +90,7 @@ do { \
- 	} \
- 	if (j_obj_tmp == NULL) { \
- 		_error(ctx, "BUG: Got NULL j_obj_tmp from " \
--		       "json_object_object_get_ex() while it return TRUE"); \
-+		       "json_object_object_get_ex() while it return 1"); \
- 		rc = DMMP_ERR_BUG; \
- 		goto out; \
- 	} \
--- 
-2.27.0
-
diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-fix-bug-of-do_compile-and-do_install.patch b/meta-oe/recipes-support/multipath-tools/files/0001-fix-bug-of-do_compile-and-do_install.patch
index ac8733769..97425fe9b 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0001-fix-bug-of-do_compile-and-do_install.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0001-fix-bug-of-do_compile-and-do_install.patch
@@ -1,4 +1,4 @@
-From fd90d952edaa4b27e62a29fdba7a201288d440eb Mon Sep 17 00:00:00 2001
+From 51f1f351262a31d94c10504e4d135526c6a7caeb Mon Sep 17 00:00:00 2001
 From: Wang Mingyu <wangmy@cn.fujitsu.com>
 Date: Sun, 10 May 2020 21:22:53 +0800
 Subject: [PATCH] fix bug of do_compile and do_install
@@ -7,27 +7,24 @@ when multiple processes make run in parallel,
 because of dependency error will occur.
 
 Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
+
+[OP: Rebase to 0.9.3]
+[OP: Drop dependencies that are already present in the 0.9.3 Makefile]
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
 ---
- Makefile | 15 ++++++++++++++-
- 1 file changed, 14 insertions(+), 1 deletion(-)
+ Makefile | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
 
 diff --git a/Makefile b/Makefile
-index 1dee3680..bea0a0b2 100644
+index 27b4641f..f195b570 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -28,9 +28,22 @@ all:	$(BUILDDIRS)
- $(BUILDDIRS):
- 	$(MAKE) -C $@
- 
--multipath multipathd mpathpersist: libmultipath
-+multipath multipathd mpathpersist libmpathpersist : libmultipath
- mpathpersist:  libmpathpersist
+@@ -79,6 +79,16 @@ libmpathpersist libmpathvalid multipath multipathd: libmultipath
+ libmultipath/prioritizers libmultipath/checkers libmultipath/foreign: libmultipath
+ mpathpersist multipathd:  libmpathpersist
  
 +DEPS_ON_MULTIPATH := \
 +	multipath \
-+	libmultipath/prioritizers \
-+	libmultipath/checkers \
-+	libmultipath/foreign \
 +	multipathd \
 +	mpathpersist \
 +	libmpathpersist
@@ -36,9 +33,9 @@ index 1dee3680..bea0a0b2 100644
 +mpathpersist.install:  libmpathpersist.install
 +libdmmp.install libmultipath/foreign.install:  mpathpersist.install
 +
- $(BUILDDIRS.clean):
- 	$(MAKE) -C ${@:.clean=} clean
- 
+ libmultipath/checkers.install \
+ 	libmultipath/prioritizers.install \
+ 	libmultipath/foreign.install: libmultipath.install
 -- 
-2.17.1
+2.38.1
 
diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-libmultipath-uevent.c-fix-error-handling-for-udev_mo.patch b/meta-oe/recipes-support/multipath-tools/files/0001-libmultipath-uevent.c-fix-error-handling-for-udev_mo.patch
deleted file mode 100644
index d261b13d9..000000000
--- a/meta-oe/recipes-support/multipath-tools/files/0001-libmultipath-uevent.c-fix-error-handling-for-udev_mo.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 8579d8a35886f91974e0ac4dbdf2edb7dac06d52 Mon Sep 17 00:00:00 2001
-From: Joe Slater <joe.slater@windriver.com>
-Date: Fri, 18 Dec 2020 11:17:50 +0800
-Subject: [PATCH] libmultipath/uevent.c: fix error handling for
- udev_monitor_set_receive_buffer_size
-
-Since systemd v246.5[1], udev_monitor_set_receive_buffer_size() will
-return 0 or 1 if successful. We only need to check a negative value for
-the failure.
-
-[1] https://github.com/systemd/systemd-stable/commit/4dcae666889ae9469e4406c0bcaffadbc01c4f66
-    https://github.com/systemd/systemd-stable/commit/fe9b92e566f837665cc06c82374e4e42f9295c99
-    https://github.com/systemd/systemd-stable/commit/5dd4cc4b10daea5d2ba969425ba02d2098dd06a4
-
-Upstream-Status: Pending
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- libmultipath/uevent.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/libmultipath/uevent.c b/libmultipath/uevent.c
-index d38e8a7f..4b298052 100644
---- a/libmultipath/uevent.c
-+++ b/libmultipath/uevent.c
-@@ -810,7 +810,8 @@ int uevent_listen(struct udev *udev)
- 	}
- 	pthread_cleanup_push(monitor_cleanup, monitor);
- #ifdef LIBUDEV_API_RECVBUF
--	if (udev_monitor_set_receive_buffer_size(monitor, 128 * 1024 * 1024))
-+	err = udev_monitor_set_receive_buffer_size(monitor, 128 * 1024 * 1024);
-+	if (err < 0)
- 		condlog(2, "failed to increase buffer size");
- #endif
- 	fd = udev_monitor_get_fd(monitor);
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-support/multipath-tools/files/0021-RH-fixup-udev-rules-for-redhat.patch b/meta-oe/recipes-support/multipath-tools/files/0021-RH-fixup-udev-rules-for-redhat.patch
index e88e25617..0b9971dc9 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0021-RH-fixup-udev-rules-for-redhat.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0021-RH-fixup-udev-rules-for-redhat.patch
@@ -1,4 +1,4 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From 9a941729d3c0d19d30d65e16b291c380e589eeb3 Mon Sep 17 00:00:00 2001
 From: Benjamin Marzinski <bmarzins@redhat.com>
 Date: Thu, 13 Apr 2017 07:22:23 -0500
 Subject: [PATCH] RH: fixup udev rules for redhat
@@ -14,6 +14,8 @@ Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
 Update patch to 0.8.0
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+[OP: Rebase to 0.9.3]
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
 ---
  Makefile.inc        | 2 +-
  kpartx/kpartx.rules | 2 +-
@@ -21,23 +23,23 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  3 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile.inc b/Makefile.inc
-index fc728ca..2f0bcea 100644
+index 4d843ce5..57779fd8 100644
 --- a/Makefile.inc
 +++ b/Makefile.inc
-@@ -48,7 +48,7 @@ endif
+@@ -81,7 +81,7 @@ endif
  prefix		=
  exec_prefix	= $(prefix)
  usr_prefix	= $(prefix)
 -bindir		= $(exec_prefix)/sbin
 +bindir		= $(exec_prefix)/usr/sbin
  libudevdir	= $(prefix)/$(SYSTEMDPATH)/udev
+ tmpfilesdir	= $(prefix)/$(SYSTEMDPATH)/tmpfiles.d
  udevrulesdir	= $(libudevdir)/rules.d
- multipathdir	= $(TOPDIR)/libmultipath
 diff --git a/kpartx/kpartx.rules b/kpartx/kpartx.rules
-index 8f99049..8a3a171 100644
+index 1969dee0..d2b28233 100644
 --- a/kpartx/kpartx.rules
 +++ b/kpartx/kpartx.rules
-@@ -32,6 +32,6 @@ LABEL="mpath_kpartx_end"
+@@ -39,6 +39,6 @@ LABEL="mpath_kpartx_end"
  GOTO="kpartx_end"
  
  LABEL="run_kpartx"
@@ -46,27 +48,27 @@ index 8f99049..8a3a171 100644
  
  LABEL="kpartx_end"
 diff --git a/multipath/Makefile b/multipath/Makefile
-index 0828a8f..b9bbb3c 100644
+index 116348e2..8482de6a 100644
 --- a/multipath/Makefile
 +++ b/multipath/Makefile
-@@ -24,7 +24,7 @@ install:
+@@ -23,7 +23,7 @@ install:
  	$(INSTALL_PROGRAM) -m 755 $(EXEC) $(DESTDIR)$(bindir)/
  	$(INSTALL_PROGRAM) -d $(DESTDIR)$(udevrulesdir)
  	$(INSTALL_PROGRAM) -m 644 11-dm-mpath.rules $(DESTDIR)$(udevrulesdir)
--	$(INSTALL_PROGRAM) -m 644 $(EXEC).rules $(DESTDIR)$(libudevdir)/rules.d/56-multipath.rules
-+	$(INSTALL_PROGRAM) -m 644 $(EXEC).rules $(DESTDIR)$(libudevdir)/rules.d/62-multipath.rules
- 	$(INSTALL_PROGRAM) -d $(DESTDIR)$(man8dir)
- 	$(INSTALL_PROGRAM) -m 644 $(EXEC).8.gz $(DESTDIR)$(man8dir)
- 	$(INSTALL_PROGRAM) -d $(DESTDIR)$(man5dir)
-@@ -33,7 +33,7 @@ install:
- uninstall:
- 	$(RM) $(DESTDIR)$(bindir)/$(EXEC)
+-	$(INSTALL_PROGRAM) -m 644 multipath.rules $(DESTDIR)$(udevrulesdir)/56-multipath.rules
++	$(INSTALL_PROGRAM) -m 644 multipath.rules $(DESTDIR)$(udevrulesdir)/62-multipath.rules
+ 	$(INSTALL_PROGRAM) -d $(DESTDIR)$(modulesloaddir)
+ 	$(INSTALL_PROGRAM) -m 644 modules-load.conf $(DESTDIR)$(modulesloaddir)/multipath.conf
+ 	$(INSTALL_PROGRAM) -d $(DESTDIR)$(tmpfilesdir)
+@@ -43,7 +43,7 @@ uninstall:
  	$(RM) $(DESTDIR)$(udevrulesdir)/11-dm-mpath.rules
+ 	$(RM) $(DESTDIR)$(modulesloaddir)/multipath.conf
+ 	$(RM) $(DESTDIR)$(modulesloaddir)/scsi_dh.conf
 -	$(RM) $(DESTDIR)$(libudevdir)/rules.d/56-multipath.rules
 +	$(RM) $(DESTDIR)$(libudevdir)/rules.d/62-multipath.rules
- 	$(RM) $(DESTDIR)$(man8dir)/$(EXEC).8.gz
- 	$(RM) $(DESTDIR)$(man5dir)/$(EXEC).conf.5.gz
+ 	$(RM) $(DESTDIR)$(man8dir)/$(EXEC).8
+ 	$(RM) $(DESTDIR)$(man5dir)/$(EXEC).conf.5
  
 -- 
-2.7.4
+2.38.1
 
diff --git a/meta-oe/recipes-support/multipath-tools/files/0022-RH-Remove-the-property-blacklist-exception-builtin.patch b/meta-oe/recipes-support/multipath-tools/files/0022-RH-Remove-the-property-blacklist-exception-builtin.patch
index 21b8ec6b0..0eff18b85 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0022-RH-Remove-the-property-blacklist-exception-builtin.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0022-RH-Remove-the-property-blacklist-exception-builtin.patch
@@ -17,28 +17,27 @@ Upsteam-Status: Pending
 
 Update patch to 0.8.2
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+[OP: Rebase to 0.9.3]
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
 ---
- libmultipath/blacklist.c | 13 +++++--------
- 1 file changed, 5 insertions(+), 8 deletions(-)
+ libmultipath/blacklist.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/libmultipath/blacklist.c b/libmultipath/blacklist.c
-index 00e8dbd..5204501 100644
+index 8d15d2ea..820b0d68 100644
 --- a/libmultipath/blacklist.c
 +++ b/libmultipath/blacklist.c
-@@ -192,12 +192,6 @@ setup_default_blist (struct config * conf)
- 	char * str;
+@@ -198,9 +198,6 @@ setup_default_blist (struct config * conf)
+ 	struct hwentry *hwe;
  	int i;
  
--	str = STRDUP("^(ram|zram|raw|loop|fd|md|dm-|sr|scd|st|dcssblk)[0-9]");
--	if (!str)
--		return 1;
--	if (store_ble(conf->blist_devnode, str, ORIGIN_DEFAULT))
+-	if (store_ble(conf->blist_devnode, "!^(sd[a-z]|dasd[a-z]|nvme[0-9])", ORIGIN_DEFAULT))
 -		return 1;
 -
- 	str = STRDUP("^(td|hd|vd)[a-z]");
- 	if (!str)
+ 	if (store_ble(conf->elist_property, "(SCSI_IDENT_|ID_WWN)", ORIGIN_DEFAULT))
  		return 1;
-@@ -437,8 +431,11 @@ filter_property(struct config *conf, struct udev_device *udev, int lvl,
+ 
+@@ -435,8 +432,11 @@ filter_property(const struct config *conf, struct udev_device *udev,
  			r = MATCH_NOTHING;
  	}
  
@@ -53,5 +52,5 @@ index 00e8dbd..5204501 100644
  
  static void free_ble(struct blentry *ble)
 -- 
-2.7.4
+2.38.1
 
diff --git a/meta-oe/recipes-support/multipath-tools/files/0023-RH-don-t-start-without-a-config-file.patch b/meta-oe/recipes-support/multipath-tools/files/0023-RH-don-t-start-without-a-config-file.patch
index ea6137f87..840b00093 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0023-RH-don-t-start-without-a-config-file.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0023-RH-don-t-start-without-a-config-file.patch
@@ -1,4 +1,4 @@
-From 0bf8ff8dab26201b268b419809844c07e168f17d Mon Sep 17 00:00:00 2001
+From 056fdaece0f1a3a5ca92e8c08912730faa89875d Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Fri, 23 Nov 2018 17:25:15 +0800
 Subject: [PATCH] From 0000000000000000000000000000000000000000 Mon Sep 17
@@ -19,30 +19,32 @@ Upstream-Status: Pending
 
 update this patch to new version
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+[OP: Rebase to 0.9.3]
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
 ---
  libmultipath/config.c         | 18 ++++++++++++++++++
  libmultipath/config.h         |  1 +
- multipath/multipath.rules     |  1 +
+ multipath/multipath.rules.in  |  1 +
  multipathd/multipathd.8       |  2 ++
  multipathd/multipathd.service |  1 +
  5 files changed, 23 insertions(+)
 
 diff --git a/libmultipath/config.c b/libmultipath/config.c
-index 5af7af5..e4233f1 100644
+index 5c5c0726..31894810 100644
 --- a/libmultipath/config.c
 +++ b/libmultipath/config.c
 @@ -26,6 +26,7 @@
- #include "devmapper.h"
  #include "mpath_cmd.h"
  #include "propsel.h"
+ #include "foreign.h"
 +#include "version.h"
  
- static int
- hwe_strmatch (const struct hwentry *hwe1, const struct hwentry *hwe2)
-@@ -743,6 +745,23 @@ load_config (char * file)
- 			goto out;
+ /*
+  * We don't support re-initialization after
+@@ -966,6 +967,23 @@ int _init_config (const char *file, struct config *conf)
  		}
  		factorize_hwtable(conf->hwtable, builtin_hwtable_size, file);
+ 		validate_pctable(conf->overrides, 0, file);
 +	} else {
 +		condlog(0, "/etc/multipath.conf does not exist, blacklisting all devices.");
 +		if (conf->blist_devnode == NULL) {
@@ -64,21 +66,21 @@ index 5af7af5..e4233f1 100644
  
  	conf->processed_main_config = 1;
 diff --git a/libmultipath/config.h b/libmultipath/config.h
-index 7d0cd9a..d7fb8e2 100644
+index 87947469..0dc89c16 100644
 --- a/libmultipath/config.h
 +++ b/libmultipath/config.h
-@@ -9,6 +9,7 @@
+@@ -10,6 +10,7 @@
  
  #define ORIGIN_DEFAULT 0
  #define ORIGIN_CONFIG  1
 +#define ORIGIN_NO_CONFIG 2
  
- /*
-  * In kernel, fast_io_fail == 0 means immediate failure on rport delete.
-diff --git a/multipath/multipath.rules b/multipath/multipath.rules
-index 9df11a9..0486bf7 100644
---- a/multipath/multipath.rules
-+++ b/multipath/multipath.rules
+ enum devtypes {
+ 	DEV_NONE,
+diff --git a/multipath/multipath.rules.in b/multipath/multipath.rules.in
+index 8d3cf33a..5c4447a2 100644
+--- a/multipath/multipath.rules.in
++++ b/multipath/multipath.rules.in
 @@ -9,6 +9,7 @@ IMPORT{cmdline}="nompath"
  ENV{nompath}=="?*", GOTO="end_mpath"
  IMPORT{cmdline}="multipath"
@@ -88,30 +90,30 @@ index 9df11a9..0486bf7 100644
  ENV{DEVTYPE}!="partition", GOTO="test_dev"
  IMPORT{parent}="DM_MULTIPATH_DEVICE_PATH"
 diff --git a/multipathd/multipathd.8 b/multipathd/multipathd.8
-index 94c3f97..ed13efd 100644
+index bdf102eb..a16a0bd5 100644
 --- a/multipathd/multipathd.8
 +++ b/multipathd/multipathd.8
-@@ -38,6 +38,8 @@ map regains its maximum performance and redundancy.
- This daemon executes the external \fBmultipath\fR tool when events occur.
- In turn, the multipath tool signals the multipathd daemon when it is done with
- devmap reconfiguration, so that it can refresh its failed path list.
+@@ -48,6 +48,8 @@ map regains its maximum performance and redundancy.
+ With the \fB-k\fR option, \fBmultipathd\fR acts as a client utility that
+ sends commands to a running instance of the multipathd daemon (see
+ \fBCOMMANDS\fR below).
 +
 +In this Linux distribution, multipathd does not run unless a /etc/multipath.conf file exists.
  .
  .
  .\" ----------------------------------------------------------------------------
 diff --git a/multipathd/multipathd.service b/multipathd/multipathd.service
-index ba24983..17434ce 100644
+index aec62dbb..ab7585de 100644
 --- a/multipathd/multipathd.service
 +++ b/multipathd/multipathd.service
-@@ -4,6 +4,7 @@ Wants=systemd-udev-trigger.service systemd-udev-settle.service
- Before=iscsi.service iscsid.service lvm2-activation-early.service
- Before=local-fs-pre.target blk-availability.service
- After=multipathd.socket systemd-udev-trigger.service systemd-udev-settle.service
+@@ -5,6 +5,7 @@ Before=local-fs-pre.target blk-availability.service shutdown.target
+ Wants=systemd-udevd-kernel.socket
+ After=systemd-udevd-kernel.socket
+ After=multipathd.socket systemd-remount-fs.service
 +ConditionPathExists=/etc/multipath.conf
+ Before=initrd-cleanup.service
  DefaultDependencies=no
  Conflicts=shutdown.target
- ConditionKernelCommandLine=!nompath
 -- 
-2.7.4
+2.38.1
 
diff --git a/meta-oe/recipes-support/multipath-tools/files/0024-RH-use-rpm-optflags-if-present.patch b/meta-oe/recipes-support/multipath-tools/files/0024-RH-use-rpm-optflags-if-present.patch
index 17542fd4f..e7b3e1223 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0024-RH-use-rpm-optflags-if-present.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0024-RH-use-rpm-optflags-if-present.patch
@@ -1,7 +1,8 @@
-From 436f7594485e35523269e662c4b5dc3a2c10ff9b Mon Sep 17 00:00:00 2001
+From cc38276a5d3926fd96e58366e15ba887d7d02ed0 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 26 Nov 2018 09:19:17 +0800
 Subject: [PATCH] From 0000000000000000000000000000000000000000 Mon Sep
+
 17
  00:00:00 2001 From: Benjamin Marzinski <bmarzins@redhat.com> Date: Wed,
 19
@@ -19,21 +20,29 @@ Upstream-Status: Pending
 update this patch to new version
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+[OP: Rebase to 0.9.3]
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
 ---
- Makefile.inc | 24 ++++++++++++++++--------
- 1 file changed, 16 insertions(+), 8 deletions(-)
+ Makefile.inc | 28 ++++++++++++++++++----------
+ 1 file changed, 18 insertions(+), 10 deletions(-)
 
 diff --git a/Makefile.inc b/Makefile.inc
-index 42dbb5bf..55a06c60 100644
+index 57779fd8..34f2cc6d 100644
 --- a/Makefile.inc
 +++ b/Makefile.inc
-@@ -89,15 +89,23 @@ TEST_CC_OPTION = $(shell \
- 		echo "$(2)"; \
+@@ -140,20 +140,28 @@ FORTIFY_OPT := $(shell \
+ 		echo "-D_FORTIFY_SOURCE=2"; \
  	fi)
  
 -STACKPROT := $(call TEST_CC_OPTION,-fstack-protector-strong,-fstack-protector)
 -ERROR_DISCARDED_QUALIFIERS := $(call TEST_CC_OPTION,-Werror=discarded-qualifiers,)
--WNOCLOBBERED := $(call TEST_CC_OPTION,-Wno-clobbered,)
+-WNOCLOBBERED := $(call TEST_CC_OPTION,-Wno-clobbered -Wno-error=clobbered,)
+-WFORMATOVERFLOW := $(call TEST_CC_OPTION,-Wformat-overflow=2,)
+-
+-OPTFLAGS	:= -O2 -g $(STACKPROT) --param=ssp-buffer-size=4
+-WARNFLAGS	:= -Werror -Wall -Wextra -Wformat=2 $(WFORMATOVERFLOW) -Werror=implicit-int \
+-		  -Werror=implicit-function-declaration -Werror=format-security \
+-		  $(WNOCLOBBERED) -Werror=cast-qual $(ERROR_DISCARDED_QUALIFIERS)
 +ifndef RPM_OPT_FLAGS
 +       STACKPROT := $(call TEST_CC_OPTION,-fstack-protector-strong,-fstack-protector)
 +       OPTFLAGS        = -O2 -g -pipe -Wall -Werror=format-security \
@@ -50,15 +59,16 @@ index 42dbb5bf..55a06c60 100644
 +                  -Werror=implicit-function-declaration -Wno-sign-compare \
 +                  -Wno-unused-parameter -Werror=cast-qual \
 +                  -Werror=discarded-qualifiers
- 
--OPTFLAGS	= -O2 -g -pipe -Werror -Wall -Wextra -Wformat=2 -Werror=implicit-int \
--		  -Werror=implicit-function-declaration -Werror=format-security \
--		  $(WNOCLOBBERED) \
--		  -Werror=cast-qual $(ERROR_DISCARDED_QUALIFIERS) \
--		  $(STACKPROT) --param=ssp-buffer-size=4
- CPPFLAGS	:= -Wp,-D_FORTIFY_SOURCE=2 
- CFLAGS		:= $(OPTFLAGS) -DBIN_DIR=\"$(bindir)\" -DLIB_STRING=\"${LIB}\" -DRUN_DIR=\"${RUN}\" \
- 		   -MMD -MP $(CFLAGS)
++
+ CPPFLAGS	:= $(FORTIFY_OPT) \
+ 		   -DBIN_DIR=\"$(bindir)\" -DMULTIPATH_DIR=\"$(plugindir)\" -DRUN_DIR=\"${RUN}\" \
+ 		   -DRUNTIME_DIR=\"$(runtimedir)\" \
+ 		   -DCONFIG_DIR=\"$(configdir)\" -DEXTRAVERSION=\"$(EXTRAVERSION)\" -MMD -MP
+-CFLAGS		:= --std=gnu99 $(CFLAGS) $(OPTFLAGS) $(WARNFLAGS) -pipe
++CFLAGS		:= --std=gnu99 $(CFLAGS) $(OPTFLAGS) -pipe
+ BIN_CFLAGS	= -fPIE -DPIE
+ LIB_CFLAGS	= -fPIC
+ SHARED_FLAGS	= -shared
 -- 
-2.17.1
+2.38.1
 
diff --git a/meta-oe/recipes-support/multipath-tools/files/0025-RH-add-mpathconf.patch b/meta-oe/recipes-support/multipath-tools/files/0025-RH-add-mpathconf.patch
index a1407718d..471ff0932 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0025-RH-add-mpathconf.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0025-RH-add-mpathconf.patch
@@ -1,4 +1,4 @@
-From eb5a36e6e0caedf06008e48eb77b7bf7c6534ee5 Mon Sep 17 00:00:00 2001
+From b0b4cca566e3e0c3a232b3754555c41d4e0c1273 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 26 Nov 2018 09:55:12 +0800
 Subject: [PATCH] From 0000000000000000000000000000000000000000 Mon Sep 17
@@ -19,21 +19,23 @@ Upstream-Status: Pending
 update this patch to new version
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+[OP: Rebase to 0.9.3]
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
 ---
  libmultipath/config.c |   1 +
- multipath/Makefile    |   5 +
- multipath/mpathconf   | 464 ++++++++++++++++++++++++++++++++++++++++++++++++++
- multipath/mpathconf.8 | 101 +++++++++++
- 4 files changed, 571 insertions(+)
+ multipath/Makefile    |   4 +
+ multipath/mpathconf   | 464 ++++++++++++++++++++++++++++++++++++++++++
+ multipath/mpathconf.8 | 101 +++++++++
+ 4 files changed, 570 insertions(+)
  create mode 100644 multipath/mpathconf
  create mode 100644 multipath/mpathconf.8
 
 diff --git a/libmultipath/config.c b/libmultipath/config.c
-index e4233f1..b779505 100644
+index 31894810..af59dd3c 100644
 --- a/libmultipath/config.c
 +++ b/libmultipath/config.c
-@@ -747,6 +747,7 @@ load_config (char * file)
- 		factorize_hwtable(conf->hwtable, builtin_hwtable_size, file);
+@@ -969,6 +969,7 @@ int _init_config (const char *file, struct config *conf)
+ 		validate_pctable(conf->overrides, 0, file);
  	} else {
  		condlog(0, "/etc/multipath.conf does not exist, blacklisting all devices.");
 +		condlog(0, "You can run /sbin/mpathconf to create or modify /etc/multipath.conf");
@@ -41,42 +43,39 @@ index e4233f1..b779505 100644
  			conf->blist_devnode = vector_alloc();
  			if (!conf->blist_devnode) {
 diff --git a/multipath/Makefile b/multipath/Makefile
-index b9bbb3c..e720c7f 100644
+index 8482de6a..780b1b73 100644
 --- a/multipath/Makefile
 +++ b/multipath/Makefile
-@@ -18,10 +18,12 @@ $(EXEC): $(OBJS) $(multipathdir)/libmultipath.so $(mpathcmddir)/libmpathcmd.so
- 	$(CC) $(CFLAGS) $(OBJS) -o $(EXEC) $(LDFLAGS) $(LIBDEPS)
- 	$(GZIP) $(EXEC).8 > $(EXEC).8.gz
- 	$(GZIP) $(EXEC).conf.5 > $(EXEC).conf.5.gz
-+	$(GZIP) mpathconf.8 > mpathconf.8.gz
- 
+@@ -21,6 +21,7 @@ $(EXEC): $(OBJS) $(multipathdir)/libmultipath.so $(mpathcmddir)/libmpathcmd.so
  install:
  	$(INSTALL_PROGRAM) -d $(DESTDIR)$(bindir)
  	$(INSTALL_PROGRAM) -m 755 $(EXEC) $(DESTDIR)$(bindir)/
 +	$(INSTALL_PROGRAM) -m 755 mpathconf $(DESTDIR)$(bindir)/
  	$(INSTALL_PROGRAM) -d $(DESTDIR)$(udevrulesdir)
  	$(INSTALL_PROGRAM) -m 644 11-dm-mpath.rules $(DESTDIR)$(udevrulesdir)
- 	$(INSTALL_PROGRAM) -m 644 $(EXEC).rules $(DESTDIR)$(libudevdir)/rules.d/62-multipath.rules
-@@ -29,13 +31,16 @@ install:
- 	$(INSTALL_PROGRAM) -m 644 $(EXEC).8.gz $(DESTDIR)$(man8dir)
+ 	$(INSTALL_PROGRAM) -m 644 multipath.rules $(DESTDIR)$(udevrulesdir)/62-multipath.rules
+@@ -32,6 +33,7 @@ install:
+ 	$(INSTALL_PROGRAM) -m 644 $(EXEC).8 $(DESTDIR)$(man8dir)
  	$(INSTALL_PROGRAM) -d $(DESTDIR)$(man5dir)
- 	$(INSTALL_PROGRAM) -m 644 $(EXEC).conf.5.gz $(DESTDIR)$(man5dir)
-+	$(INSTALL_PROGRAM) -m 644 mpathconf.8.gz $(DESTDIR)$(man8dir)
- 
- uninstall:
- 	$(RM) $(DESTDIR)$(bindir)/$(EXEC)
- 	$(RM) $(DESTDIR)$(udevrulesdir)/11-dm-mpath.rules
+ 	$(INSTALL_PROGRAM) -m 644 $(EXEC).conf.5 $(DESTDIR)$(man5dir)
++	$(INSTALL_PROGRAM) -m 644 mpathconf.8 $(DESTDIR)$(man8dir)
+ ifneq ($(SCSI_DH_MODULES_PRELOAD),)
+ 	$(INSTALL_PROGRAM) -m 644 scsi_dh.conf $(DESTDIR)$(modulesloaddir)/scsi_dh.conf
+ 	for _x in $(SCSI_DH_MODULES_PRELOAD); do echo "$$_x"; done \
+@@ -44,8 +46,10 @@ uninstall:
+ 	$(RM) $(DESTDIR)$(modulesloaddir)/multipath.conf
+ 	$(RM) $(DESTDIR)$(modulesloaddir)/scsi_dh.conf
  	$(RM) $(DESTDIR)$(libudevdir)/rules.d/62-multipath.rules
 +	$(RM) $(DESTDIR)$(bindir)/mpathconf
- 	$(RM) $(DESTDIR)$(man8dir)/$(EXEC).8.gz
- 	$(RM) $(DESTDIR)$(man5dir)/$(EXEC).conf.5.gz
-+	$(RM) $(DESTDIR)$(man8dir)/mpathconf.8.gz
+ 	$(RM) $(DESTDIR)$(man8dir)/$(EXEC).8
+ 	$(RM) $(DESTDIR)$(man5dir)/$(EXEC).conf.5
++	$(RM) $(DESTDIR)$(man8dir)/mpathconf.8
  
  clean: dep_clean
- 	$(RM) core *.o $(EXEC) *.gz
+ 	$(RM) core *.o $(EXEC) multipath.rules tmpfiles.conf
 diff --git a/multipath/mpathconf b/multipath/mpathconf
 new file mode 100644
-index 0000000..e839134
+index 00000000..e8391347
 --- /dev/null
 +++ b/multipath/mpathconf
 @@ -0,0 +1,464 @@
@@ -546,7 +545,7 @@ index 0000000..e839134
 +fi
 diff --git a/multipath/mpathconf.8 b/multipath/mpathconf.8
 new file mode 100644
-index 0000000..4cd3267
+index 00000000..4cd32672
 --- /dev/null
 +++ b/multipath/mpathconf.8
 @@ -0,0 +1,101 @@
@@ -652,5 +651,5 @@ index 0000000..4cd3267
 +.SH AUTHOR
 +Benjamin Marzinski <bmarzins@redhat.com>
 -- 
-2.7.4
+2.38.1
 
diff --git a/meta-oe/recipes-support/multipath-tools/files/0026-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch b/meta-oe/recipes-support/multipath-tools/files/0026-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch
index 5fd6d668e..17c36e86c 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0026-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0026-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch
@@ -1,7 +1,8 @@
-From 0f54b3120ca06ff3168cdbf901a27b68c4638398 Mon Sep 17 00:00:00 2001
+From 262de33671ede81e424344ea9125d9e546cf8612 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 26 Sep 2019 16:29:48 +0800
 Subject: [PATCH] From 0000000000000000000000000000000000000000 Mon Sep
+
 17
  00:00:00 2001 From: Benjamin Marzinski <bmarzins@redhat.com> Date: Fri,
 17
@@ -25,19 +26,21 @@ Upstream-Status: Pending
 Update this patch to new version 0.8.2
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+[OP: Rebase to 0.9.3]
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
 ---
  libmultipath/wwids.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
  libmultipath/wwids.h |  1 +
  2 files changed, 45 insertions(+)
 
 diff --git a/libmultipath/wwids.c b/libmultipath/wwids.c
-index 28a2150d..a0bfa851 100644
+index 89bb60ca..bab9aa85 100644
 --- a/libmultipath/wwids.c
 +++ b/libmultipath/wwids.c
-@@ -454,3 +454,47 @@ int op ## _wwid(const char *wwid) \
- declare_failed_wwid_op(is_failed, false)
- declare_failed_wwid_op(mark_failed, true)
- declare_failed_wwid_op(unmark_failed, true)
+@@ -451,3 +451,47 @@ int unmark_failed_wwid(const char *wwid)
+ 	print_failed_wwid_result("unmark_failed", wwid, r);
+ 	return r;
+ }
 +
 +int remember_cmdline_wwid(void)
 +{
@@ -95,5 +98,5 @@ index 0c6ee54d..e32a0b0e 100644
  enum {
  	WWID_IS_NOT_FAILED = 0,
 -- 
-2.17.1
+2.38.1
 
diff --git a/meta-oe/recipes-support/multipath-tools/files/0027-RH-warn-on-invalid-regex-instead-of-failing.patch b/meta-oe/recipes-support/multipath-tools/files/0027-RH-warn-on-invalid-regex-instead-of-failing.patch
index c59edbbb2..22cb4beeb 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0027-RH-warn-on-invalid-regex-instead-of-failing.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0027-RH-warn-on-invalid-regex-instead-of-failing.patch
@@ -15,26 +15,41 @@ Upstream-Status: Pending
 update this patch to 0.8.2
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+[OP: Rebase to 0.9.3]
+[OP: adjusted FREE() -> free(), made set_regex_value() static]
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
 ---
- libmultipath/dict.c   | 29 ++++++++++++++++++++++-------
- libmultipath/parser.c | 13 +++++++++++++
- libmultipath/parser.h |  1 +
- 3 files changed, 36 insertions(+), 7 deletions(-)
+ libmultipath/dict.c | 42 +++++++++++++++++++++++++++++++++++-------
+ 1 file changed, 35 insertions(+), 7 deletions(-)
 
 diff --git a/libmultipath/dict.c b/libmultipath/dict.c
-index c6eba0f..05ed3d8 100644
+index aa93fe43..55a22d32 100644
 --- a/libmultipath/dict.c
 +++ b/libmultipath/dict.c
-@@ -59,6 +59,21 @@ set_str(vector strvec, void *ptr)
+@@ -155,6 +155,34 @@ set_str_noslash(vector strvec, void *ptr, const char *file, int line_nr)
+ 	return 0;
  }
  
- static int
-+set_regex(vector strvec, void *ptr)
++static void *
++set_regex_value(vector strvec)
++{
++       char *buff = set_value(strvec);
++
++       if (buff && strcmp("*", buff) == 0) {
++               condlog(0, "Invalid regular expression \"*\" in multipath.conf. Using \".*\"");
++               free(buff);
++               return strdup(".*");
++       }
++       return buff;
++}
++
++static int
++set_regex(vector strvec, void *ptr, const char *file, int line_nr)
 +{
 +       char **str_ptr = (char **)ptr;
 +
 +       if (*str_ptr)
-+               FREE(*str_ptr);
++               free(*str_ptr);
 +       *str_ptr = set_regex_value(strvec);
 +
 +       if (!*str_ptr)
@@ -43,11 +58,10 @@ index c6eba0f..05ed3d8 100644
 +       return 0;
 +}
 +
-+static int
- set_yes_no(vector strvec, void *ptr)
+ static int
+ set_yes_no(vector strvec, void *ptr, const char *file, int line_nr)
  {
- 	char * buff;
-@@ -1415,8 +1430,8 @@ ble_ ## option ## _handler (struct config *conf, vector strvec)		\
+@@ -1679,8 +1707,8 @@ ble_ ## option ## _handler (struct config *conf, vector strvec,		\
  									\
  	if (!conf->option)						\
  		return 1;						\
@@ -58,7 +72,7 @@ index c6eba0f..05ed3d8 100644
  	if (!buff)							\
  		return 1;						\
  									\
-@@ -1432,7 +1447,7 @@ ble_ ## option ## _ ## name ## _handler (struct config *conf, vector strvec) \
+@@ -1700,7 +1728,7 @@ ble_ ## option ## _ ## name ## _handler (struct config *conf, vector strvec, \
  	if (!conf->option)						\
  		return 1;						\
  									\
@@ -67,7 +81,7 @@ index c6eba0f..05ed3d8 100644
  	if (!buff)							\
  		return 1;						\
  									\
-@@ -1535,16 +1550,16 @@ device_handler(struct config *conf, vector strvec)
+@@ -1806,16 +1834,16 @@ device_handler(struct config *conf, vector strvec, const char *file,
  	return 0;
  }
  
@@ -88,42 +102,6 @@ index c6eba0f..05ed3d8 100644
  declare_hw_snprint(bl_product, print_str)
  
  declare_hw_handler(hwhandler, set_str)
-diff --git a/libmultipath/parser.c b/libmultipath/parser.c
-index e00c5ff..6ca5842 100644
---- a/libmultipath/parser.c
-+++ b/libmultipath/parser.c
-@@ -382,6 +382,19 @@ oom:
- 	return NULL;
- }
- 
-+void *
-+set_regex_value(vector strvec)
-+{
-+       char *buff = set_value(strvec);
-+
-+       if (buff && strcmp("*", buff) == 0) {
-+               condlog(0, "Invalid regular expression \"*\" in multipath.conf. Using \".*\"");
-+               FREE(buff);
-+               return strdup(".*");
-+       }
-+       return buff;
-+}
-+
- /* non-recursive configuration stream handler */
- static int kw_level = 0;
- 
-diff --git a/libmultipath/parser.h b/libmultipath/parser.h
-index 62906e9..b791705 100644
---- a/libmultipath/parser.h
-+++ b/libmultipath/parser.h
-@@ -77,6 +77,7 @@ extern void dump_keywords(vector keydump, int level);
- extern void free_keywords(vector keywords);
- extern vector alloc_strvec(char *string);
- extern void *set_value(vector strvec);
-+extern void *set_regex_value(vector strvec);
- extern int process_file(struct config *conf, char *conf_file);
- extern struct keyword * find_keyword(vector keywords, vector v, char * name);
- int snprint_keyword(char *buff, int len, char *fmt, struct keyword *kw,
 -- 
-2.7.4
+2.38.1
 
diff --git a/meta-oe/recipes-support/multipath-tools/files/0029-multipath-tools-modify-Makefile.inc-for-cross-compil.patch b/meta-oe/recipes-support/multipath-tools/files/0029-multipath-tools-modify-Makefile.inc-for-cross-compil.patch
index 3919f9904..952009b1d 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0029-multipath-tools-modify-Makefile.inc-for-cross-compil.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0029-multipath-tools-modify-Makefile.inc-for-cross-compil.patch
@@ -1,4 +1,4 @@
-From c3436ec8a502a40579abf62be0a479fa9d7888ad Mon Sep 17 00:00:00 2001
+From d139474f2a6d87c1cd20dfbb916fe650bfcce968 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Tue, 4 Jun 2019 11:39:39 +0800
 Subject: [PATCH] multipath-tools: modify Makefile.inc for cross-compilation
@@ -26,21 +26,23 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
 
 update for version 0.8.1
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+[OP: Rebase to 0.9.3]
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
 ---
  Makefile.inc | 11 -----------
  1 file changed, 11 deletions(-)
 
 diff --git a/Makefile.inc b/Makefile.inc
-index 661f141..3f9fd28 100644
+index 34f2cc6d..ee6a4c9f 100644
 --- a/Makefile.inc
 +++ b/Makefile.inc
-@@ -35,17 +35,6 @@ ifndef RUN
+@@ -42,17 +42,6 @@ ifndef RUN
  	endif
  endif
  
 -ifndef SYSTEMD
--	ifeq ($(shell pkg-config --modversion libsystemd >/dev/null 2>&1 && echo 1), 1)
--		SYSTEMD = $(shell pkg-config --modversion libsystemd)
+-	ifeq ($(shell $(PKGCONFIG) --modversion libsystemd >/dev/null 2>&1 && echo 1), 1)
+-		SYSTEMD = $(shell $(PKGCONFIG) --modversion libsystemd | awk '{print $$1}')
 -	else
 -		ifeq ($(shell systemctl --version >/dev/null 2>&1 && echo 1), 1)
 -			SYSTEMD = $(shell systemctl --version 2> /dev/null | \
@@ -53,5 +55,5 @@ index 661f141..3f9fd28 100644
  	SYSTEMDPATH=usr/lib
  endif
 -- 
-2.7.4
+2.38.1
 
diff --git a/meta-oe/recipes-support/multipath-tools/files/0030-Always-use-devmapper.patch b/meta-oe/recipes-support/multipath-tools/files/0030-Always-use-devmapper.patch
index 3e88b4100..c2025ed6f 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0030-Always-use-devmapper.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0030-Always-use-devmapper.patch
@@ -1,7 +1,7 @@
-From e4acb46b10484d1da6f093257e34f269832e6a37 Mon Sep 17 00:00:00 2001
+From f20d7651a62efff818ebd0d1bc920f6f362c890d Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 26 Nov 2018 11:17:41 +0800
-Subject: [PATCH] Subject: [PATCH]  Always use devmapper
+Subject: [PATCH] Subject: [PATCH] Always use devmapper
 
 Do not try to compute several _API_ make variables
 from host information when cross-compiling.
@@ -21,40 +21,57 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
 
 Rebase to 0.7.9
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+[OP: Rebase to 0.9.3]
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
 ---
- libmultipath/Makefile | 19 ++++---------------
- 1 file changed, 4 insertions(+), 15 deletions(-)
+ libmultipath/Makefile | 34 +++++++---------------------------
+ 1 file changed, 7 insertions(+), 27 deletions(-)
 
 diff --git a/libmultipath/Makefile b/libmultipath/Makefile
-index 33f5269..adf6f4a 100644
+index 3b60a525..72aca7ca 100644
 --- a/libmultipath/Makefile
 +++ b/libmultipath/Makefile
-@@ -20,21 +20,10 @@ ifdef SYSTEMD
+@@ -22,33 +22,13 @@ ifdef SYSTEMD
  	endif
  endif
  
--ifneq ($(call check_func,dm_task_no_flush,/usr/include/libdevmapper.h),0)
--	CFLAGS += -DLIBDM_API_FLUSH -D_GNU_SOURCE
+-ifneq ($(call check_func,dm_task_no_flush,$(DEVMAPPER_INCDIR)/libdevmapper.h),0)
+-	CPPFLAGS += -DLIBDM_API_FLUSH
 -endif
 -
--ifneq ($(call check_func,dm_task_set_cookie,/usr/include/libdevmapper.h),0)
--	CFLAGS += -DLIBDM_API_COOKIE
+-ifneq ($(call check_func,dm_task_get_errno,$(DEVMAPPER_INCDIR)/libdevmapper.h),0)
+-	CPPFLAGS += -DLIBDM_API_GET_ERRNO
 -endif
 -
--ifneq ($(call check_func,udev_monitor_set_receive_buffer_size,/usr/include/libudev.h),0)
--	CFLAGS += -DLIBUDEV_API_RECVBUF
+-ifneq ($(call check_func,dm_task_set_cookie,$(DEVMAPPER_INCDIR)/libdevmapper.h),0)
+-	CPPFLAGS += -DLIBDM_API_COOKIE
 -endif
 -
--ifneq ($(call check_func,dm_task_deferred_remove,/usr/include/libdevmapper.h),0)
--	CFLAGS += -DLIBDM_API_DEFERRED
+-ifneq ($(call check_func,udev_monitor_set_receive_buffer_size,$(LIBUDEV_INCDIR)/libudev.h),0)
+-	CPPFLAGS += -DLIBUDEV_API_RECVBUF
 -endif
-+CFLAGS += -DLIBDM_API_FLUSH -D_GNU_SOURCE
-+CFLAGS += -DLIBDM_API_COOKIE
-+CFLAGS += -DLIBUDEV_API_RECVBUF
-+CFLAGS += -DLIBDM_API_DEFERRED
+-
+-ifneq ($(call check_func,dm_task_deferred_remove,$(DEVMAPPER_INCDIR)/libdevmapper.h),0)
+-	CPPFLAGS += -DLIBDM_API_DEFERRED
+-endif
+-
+-ifneq ($(call check_func,dm_hold_control_dev,$(DEVMAPPER_INCDIR)/libdevmapper.h),0)
+-	CPPFLAGS += -DLIBDM_API_HOLD_CONTROL
+-endif
+-
+-ifneq ($(call check_var,ELS_DTAG_LNK_INTEGRITY,$(LINUX_HEADERS_INCDIR)/scsi/fc/fc_els.h),0)
+-	CPPFLAGS += -DFPIN_EVENT_HANDLER
+-endif
++CPPFLAGS += -DLIBDM_API_FLUSH
++CPPFLAGS += -DLIBDM_API_GET_ERRNO
++CPPFLAGS += -DLIBDM_API_COOKIE
++CPPFLAGS += -DLIBUDEV_API_RECVBUF
++CPPFLAGS += -DLIBDM_API_DEFERRED
++CPPFLAGS += -DLIBDM_API_HOLD_CONTROL
++CPPFLAGS += -DFPIN_EVENT_HANDLER
  
- OBJS = memory.o parser.o vector.o devmapper.o callout.o \
- 	hwtable.o blacklist.o util.o dmparser.o config.o \
+ # object files referencing MULTIPATH_DIR or CONFIG_DIR
+ # they need to be recompiled for unit tests
 -- 
-2.7.4
+2.38.1
 
diff --git a/meta-oe/recipes-support/multipath-tools/files/0031-Always-use-devmapper-for-kpartx.patch b/meta-oe/recipes-support/multipath-tools/files/0031-Always-use-devmapper-for-kpartx.patch
index 418c0200f..2d043c399 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0031-Always-use-devmapper-for-kpartx.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0031-Always-use-devmapper-for-kpartx.patch
@@ -1,4 +1,4 @@
-From 1fe937835311a2d0afbc85ce4a4dbd3c9e0c912f Mon Sep 17 00:00:00 2001
+From 820d2ef3596189041da43d1139da8689336bb918 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 26 Nov 2018 11:19:45 +0800
 Subject: [PATCH] Subject: [PATCH] Always use devmapper for kpartx
@@ -19,25 +19,27 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
 
 Rebase to 0.7.9
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+[OP: Rebase to 0.9.3]
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
 ---
  kpartx/Makefile | 4 +---
  1 file changed, 1 insertion(+), 3 deletions(-)
 
 diff --git a/kpartx/Makefile b/kpartx/Makefile
-index 7eb467e..c143321 100644
+index 742d3bcd..d886483d 100644
 --- a/kpartx/Makefile
 +++ b/kpartx/Makefile
-@@ -8,9 +8,7 @@ LDFLAGS += $(BIN_LDFLAGS)
+@@ -9,9 +9,7 @@ LDFLAGS += $(BIN_LDFLAGS)
  
  LIBDEPS += -ldevmapper
  
--ifneq ($(call check_func,dm_task_set_cookie,/usr/include/libdevmapper.h),0)
--	CFLAGS += -DLIBDM_API_COOKIE
+-ifneq ($(call check_func,dm_task_set_cookie,$(DEVMAPPER_INCDIR)/libdevmapper.h),0)
+-	CPPFLAGS += -DLIBDM_API_COOKIE
 -endif
-+CFLAGS += -DLIBDM_API_COOKIE
++CPPFLAGS += -DLIBDM_API_COOKIE
  
  OBJS = bsd.o dos.o kpartx.o solaris.o unixware.o dasd.o sun.o \
  	gpt.o mac.o ps3.o crc32.o lopart.o xstrncpy.o devmapper.o
 -- 
-2.7.4
+2.38.1
 
diff --git a/meta-oe/recipes-support/multipath-tools/files/0032-libdmmp-Makefile-replace-perl-with-sed-in-install-ta.patch b/meta-oe/recipes-support/multipath-tools/files/0032-libdmmp-Makefile-replace-perl-with-sed-in-install-ta.patch
index b35d67cf5..407dff507 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0032-libdmmp-Makefile-replace-perl-with-sed-in-install-ta.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0032-libdmmp-Makefile-replace-perl-with-sed-in-install-ta.patch
@@ -1,4 +1,4 @@
-From 35421d03898ac1b38f97a76241e6a29086d0c9f1 Mon Sep 17 00:00:00 2001
+From 21a8680b7bd436867ac689a0b4b1b18a3359e208 Mon Sep 17 00:00:00 2001
 From: Geoff Parker <geoffrey.parker@arthrex.com>
 Date: Fri, 9 Oct 2020 17:48:47 +0000
 Subject: [PATCH] libdmmp/Makefile: replace perl with sed in install target to
@@ -12,15 +12,17 @@ ownership or permissions settings on the files. 'sed -i' is compatible
 with pseudo.
 
 Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
+[OP: Rebase to 0.9.3]
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
 ---
  libdmmp/Makefile | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/libdmmp/Makefile b/libdmmp/Makefile
-index 1dd3f340..8166075c 100644
+index e4589250..34e06425 100644
 --- a/libdmmp/Makefile
 +++ b/libdmmp/Makefile
-@@ -34,11 +34,11 @@ install:
+@@ -39,11 +39,11 @@ install:
  	$(LN) $(LIBS) $(DESTDIR)$(usrlibdir)/$(DEVLIB)
  	$(INSTALL_PROGRAM) -m 644 -D \
  		$(PKGFILE).in $(DESTDIR)$(pkgconfdir)/$(PKGFILE)
@@ -33,8 +35,8 @@ index 1dd3f340..8166075c 100644
 -	perl -i -pe 's|__INCLUDEDIR__|$(includedir)|g' \
 +	sed -i 's|__INCLUDEDIR__|$(includedir)|g' \
  		$(DESTDIR)$(pkgconfdir)/$(PKGFILE)
- 	@for file in docs/man/*.3.gz; do \
- 		$(INSTALL_PROGRAM) -m 644 -D \
+ 	$(INSTALL_PROGRAM) -d 755 $(DESTDIR)$(man3dir)
+ 	$(INSTALL_PROGRAM) -m 644 -t $(DESTDIR)$(man3dir) docs/man/*.3
 -- 
-2.20.1
+2.38.1
 
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.9.3.bb
similarity index 93%
rename from meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
rename to meta-oe/recipes-support/multipath-tools/multipath-tools_0.9.3.bb
index 5a8db0877..a1342131e 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.9.3.bb
@@ -46,13 +46,11 @@ SRC_URI = "git://github.com/opensvc/multipath-tools.git;protocol=http;branch=mas
            file://0032-libdmmp-Makefile-replace-perl-with-sed-in-install-ta.patch \
            file://0001-fix-bug-of-do_compile-and-do_install.patch \
            file://0001-add-explicit-dependency-on-libraries.patch \
-           file://0001-fix-boolean-value-with-json-c-0.14.patch \
-           file://0001-libmultipath-uevent.c-fix-error-handling-for-udev_mo.patch \
            "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
-SRCREV = "d4915917655b3d205aa0e339ca13080ed8182d0d"
+SRCREV = "1332947447133fdf26246012b836868a3d974f0e"
 
 S = "${WORKDIR}/git"
 
@@ -75,10 +73,14 @@ ARM_INSTRUCTION_SET:armv5 = "arm"
 #
 EXTRA_OEMAKE = 'MULTIPATH_VERSION=${PV} DESTDIR=${D} syslibdir=${base_libdir} \
                 OPTFLAGS="${CFLAGS}" \
+                prefix=${prefix} \
                 bindir=${base_sbindir} \
                 LIB=${base_libdir} libdir=${base_libdir}/multipath \
+                plugindir=${base_libdir}/multipath \
                 unitdir=${systemd_system_unitdir} \
                 libudevdir=${nonarch_base_libdir}/udev \
+                modulesloaddir=${sysconfdir}/modules-load.d \
+                tmpfilesdir=${sysconfdir}/tmpfiles.d \
                 ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "SYSTEMD=216", "", d)} \
                '
 
@@ -105,7 +107,7 @@ FILES:${PN}-dbg += "${base_libdir}/multipath/.debug"
 PACKAGES =+ "${PN}-libs"
 FILES:${PN}-libs = "${base_libdir}/lib*.so.* \
                     ${base_libdir}/multipath/lib*.so*"
-RDEPENDS:${PN} += "${PN}-libs bash"
+RDEPENDS:${PN} += "${PN}-libs bash libgcc"
 
 PROVIDES += "device-mapper-multipath"
 RPROVIDES:${PN} += "device-mapper-multipath"
-- 
2.38.1


