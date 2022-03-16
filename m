Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 110B0C433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 14:10:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.25672.1647439828078079828
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 07:10:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=AJ7zJtoC;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=00748f5f36=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22GBD2iN025805
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 07:10:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=haYAHrFJlbBAxrvkMXN3YwuzGLSAmyJMOHB0CXrY2pM=;
 b=AJ7zJtoCZu/VooCM/HwJQl2BCx8oSn2t6uSkSwstysR9CKTvZ3HUj5RmzrULcGihPKAF
 cN/6KQaKkXmxLWPUlaHN0j16PEQGLI8zCELRiHL3WCO773nHXcRig52SQkqMPYJQkM4B
 KdXp1X7IUgBLjhRr41+h5pzLf0HHJDFFSkw/Mid8UADAAtzEQwpPGudnOPmNbsBXd7h4
 JlwzohLhHFQjF5WU7dNCdwsB40ZysEArqv4pBOlfJ5gX2x5HbH8tGjcxzN3ZJY2+sWsw
 alE6PhbFSbK4ZRE5Juhe8EP0Eu9Z9ONGrZR/kgysKq+oAVm91C95vvAuyMvvf9NHYGaG +A==
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2043.outbound.protection.outlook.com [104.47.57.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3erqp9bd2w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 07:10:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KwfyPqVZB2jhexuPgKHtmD5YW2T+3Ymsfdsy6ksn2LbXtuidDqbiA0QKcRmYzjxqdiA2GUQF/U58CwS0wP6PJAiNBJ7lK0DoTCZtwKcmYihOBB428obTGCG2GPF7cAmIJwAtChXYgJ19uYde9Ec7cM4pqeVaBs/PhJddb+hDcaXLaBr39pO7H8G0Kcml+g38M8om1zg+dzQxXCmasB/nyz3f19yLUw5VsUTcwS1MErC7BJN/UQJLWYmTypWBb+6q2PI3THp4SS5fNEb/P4VJtqYjZjpyEJpdb9LJh38a5k9ythuZCpP3r0l/eShnuzSRtiv0Mwgoh+1HeJxqyOpyBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=haYAHrFJlbBAxrvkMXN3YwuzGLSAmyJMOHB0CXrY2pM=;
 b=oBQ6f2qlqKvMHhAIxIR/ZHCs2OgYncCffixQ3uM/2wgQT4qJfcM5M8Hx/hgBOdsxE02k0m7P6NZLQalvM9gThDUm3bk09wCMS6t3sKgrHSYRzL1IEPhoIOzw30fzCQhQyg2VaYshl3HPMv47LjMMhwJellOtxAnRQ3Ox7dvCkUWjjTZNAvCJ85N/SWVMAJ608MuwmAa3cJ+IoqW9Pu+XbrUlHV57XKhJ+8uvLxTuezRtxLE0GYqeJw/mOhs1OIVtVrn9UuhdInHVvG+w/7Aop3OfTTW/hafjk83ZaHKYLJJ5C+BRBBqp9cF6qjgdN4vRdRA6tHyyVECJEdzg4cIheQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by BN6PR11MB1426.namprd11.prod.outlook.com (2603:10b6:405:b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25; Wed, 16 Mar
 2022 14:10:25 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::c9bf:1f5f:3b8b:ab2d]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::c9bf:1f5f:3b8b:ab2d%6]) with mapi id 15.20.5081.014; Wed, 16 Mar 2022
 14:10:25 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] netplan: fix parallel build failure
Date: Wed, 16 Mar 2022 22:02:13 +0800
Message-Id: <20220316140213.1071179-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HKAPR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:203:d0::23) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41458edc-8433-4382-a2b5-08da0756b718
X-MS-TrafficTypeDiagnostic: BN6PR11MB1426:EE_
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB142662266431944CD3E2755AF9119@BN6PR11MB1426.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZvS97ZbK7RuHPw3LZVFHKHSaPBXcPE+FbYr4/ud3SPVwbqCUUlZHkd0PHfOnBhWRokSmz9HmlsFMMrd+5/JqhJOaOyGJSR9N4cqKhFR3hjU2PQjaybwBr0w1T3OHEQyDSaxllK/8fOd35DzjCtlCFI4OW3zwvtMZtaq2FCsx92CfVNnlXL+N1W3pTWjmhHNff0/SvCSdwpG8I3zJSaIpjxpuLO0cfhXg8k1PsEX03rraEFbfGGEeyBG8d4jvRYz+iCcOwPPVmzS5WgeSn4+hGDgeA/I04uZU3+X7/TJ7wBwG47XPLgh2nfrVmFvO5Jk8tl5LNHg+aFZnDYLXYea2aPOg6Dh3gLfEysleN9zZJ2ZypqwyX7Yza+vLnEycTuVKCQfyBgfDvyCzF88hv2/DHmBFxIIgEH5N7VEv8uGOB/8kZ0v83+mmqlTpJRof3RJ30zjsMVxNNXTqqgAXh6fAjANX/KV3jD+D2Qg6HSn9mDl1Dihsg0jZKvYvCPLPDQvvEfgiNv7UglM8R+nU7bPjOXe8HvqFn/d3Mr+La2+HhO+Q7eXjOwjs+axR898V8ozB2c8/00eTQLfy+INE8I38xMrrJmcIEomjdT/KM2uzHHf/Lu024zcpi0f2/4AWYJzxr7ShQY4wKwFzcvinL/xb390Zekuq7z7cqLZ7E5kRCvnmzSCgMlMcM9mcqfB92+skyo7PT/SPza7sYdVEXilAYH8Oe2GmZW35wYupcYPkHRx1jcH1jHLUd2lKCmgA/q0B8wbt+hI34oLErj6yH9yZ++4t/ZlOuKVAA20DVKGLupM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(6916009)(316002)(44832011)(83380400001)(38350700002)(6666004)(6486002)(6506007)(2616005)(508600001)(38100700002)(6512007)(26005)(1076003)(186003)(52116002)(66476007)(66556008)(8676002)(8936002)(36756003)(2906002)(5660300002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XOV7J4nb4S666vjXgv3QdJN7EFo5jApPxn5JPZH1/pjZKvrZ5HPQLiN5CWZl?=
 =?us-ascii?Q?o76UyeUzXRQaGQ1HnvkM4DbYOqAmbKJ0o94asXpIrgzuvNz7vTjDlyZMuX87?=
 =?us-ascii?Q?8DmTv3r+0z8m5TNPfrEOjOWxhXGRXYo4Ysr/979RXocn7rH0FJBl7q3sPppI?=
 =?us-ascii?Q?XzLIcGe4hUUKyiNl2SpSPl9iTZOiqLP9ww4I09EMEJuUd9sfeCJ6rom5kwRi?=
 =?us-ascii?Q?wuUzBC4c36zz3+iLU6MObTRtahHHEZmQg3lxjs86DihNfkLJFHsYwTTnqaXe?=
 =?us-ascii?Q?Ti6wuBHpq1Jq6sQRWak7Wml5XPY/kJjIobVDlIY5IS7j0g8eyPMpQTu9DZ9j?=
 =?us-ascii?Q?iKKr9eNa9rkKlxjB22tEWT6RGXWFa4SiF6dxpCEGyKDMywWlReSpWdUgWU9h?=
 =?us-ascii?Q?NZs3WFoZ7P+RwkUtbwZXf1dAoKiLeiOY2k1uDO31ITQylBIlnMOK2pblWYqT?=
 =?us-ascii?Q?K73u50rkjNsH8C3ld039oEdQbxQ4XhUVUs+LEId/4eiPyvz4VOt1icy0GsF8?=
 =?us-ascii?Q?Y6iVamfyyo+S8WyY6EPz9DC3WYvlifavYN1mt3CeDdao7p6vvk99NL7q0pgF?=
 =?us-ascii?Q?sKgVGHiBjuuZyA6TyGwZ0lFxovqtYbsoWLD6NHJYH9YRHPnO+iSv2s1HQPxN?=
 =?us-ascii?Q?qOwPp23h+xYhtQ4WyGunO2ubLhIFuUZukEcs4RMQ0eG+p0Rvdh5XHvLdEpQj?=
 =?us-ascii?Q?cAfQ1RWSjt0aGPPu/9878jnAQxLGjGeS5W5tFqI0zHUKiW4E5OaZSRFPiQvo?=
 =?us-ascii?Q?eaQ1zEB/REITmFEILPav771ZmoI0PE18QAmYDreI/zcDDDElfqkJ+z4nbydz?=
 =?us-ascii?Q?O7ycEA7XH/hOLbpzGUXWYAm/JP8Em54yO71mtfZKRIIxNnSVmpZ9P34qaMAQ?=
 =?us-ascii?Q?kpGH/VOCeTx14TsXySKKQr5h7e39i8JZ9xRNZw5DKU22bx7vBZYpMZQtAejD?=
 =?us-ascii?Q?DosYQmgpM7B7uQ6paa7dcZXZHdMRcUY3kuvyOXm1PpBvPcxspe6mDLGsnpbQ?=
 =?us-ascii?Q?tvG2C/7AKyglgUGMquMG3vHHEaIBcgpSa79vjqvhn80usZVxJ7IcZUNg3PqQ?=
 =?us-ascii?Q?TnAhHEGexbwrYFilnCrXynPhw0WinlPVz6wW4Y4/yTNQTZK0HYhj54PM+tM3?=
 =?us-ascii?Q?T2duktd5NI42zfsaomSdOom6OKh6BqYTv2gu7BnocgGTFk6UB473jxAUAFml?=
 =?us-ascii?Q?FE/IJhNzIv7GxhEfxRD3wKFFKiWuEA9CdT9TiwoHns6RqxRiI5ODm4zOmWl1?=
 =?us-ascii?Q?Ge2JJnY8ej9fI3keepGsZr4VSq6atBVKTqtWrj1MqlGt3FkdDxUIMomj77Yp?=
 =?us-ascii?Q?rMFKGETb/n1SwkM4TpT5VTncbmF7uH1Qz8QerFz3cTuDbsoTVx5ZGiEgux9U?=
 =?us-ascii?Q?B67ntAOvvolOuvaRoWCD7qhJjUOgExy8nMHX3591T4AZVGPbnUBda9E2p42U?=
 =?us-ascii?Q?rzBEsO5V/uBzBc+BmBWDOwy7GZ+GhT4P?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 41458edc-8433-4382-a2b5-08da0756b718
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2022 14:10:25.1772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 uBMmYRPnlVbqj3CHgAEhKWmW3y5TnZEV9a7HqB4uPFWlWYpc6gYlEi1gt2/txWDYfRs7+p0c81Su7RtV8V/91g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1426
X-Proofpoint-GUID: O2ntVDgdrfBPGKKuLsSknLgHiYScJJ4S
X-Proofpoint-ORIG-GUID: O2ntVDgdrfBPGKKuLsSknLgHiYScJJ4S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-16_05,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=948 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203160089
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Mar 2022 14:10:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96022

Backport a patch to fix the parallel build failure:
src/dbus.c:17:10: fatal error: _features.h: No such file or directory

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-Makefile-fix-parallel-build-failure.patch | 44 +++++++++++++++++++
 .../netplan/netplan_0.104.bb                  |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/netplan/netplan/0001-Makefile-fix-parallel-build-failure.patch

diff --git a/meta-networking/recipes-connectivity/netplan/netplan/0001-Makefile-fix-parallel-build-failure.patch b/meta-networking/recipes-connectivity/netplan/netplan/0001-Makefile-fix-parallel-build-failure.patch
new file mode 100644
index 000000000..2149ee30c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/netplan/netplan/0001-Makefile-fix-parallel-build-failure.patch
@@ -0,0 +1,44 @@
+From 2e84550b47b475d830622f41576992a1d45d6af0 Mon Sep 17 00:00:00 2001
+From: Zhao Yi <38274519+yizhao1@users.noreply.github.com>
+Date: Tue, 15 Mar 2022 19:28:26 +0800
+Subject: [PATCH] Makefile: fix parallel build failure (#267)
+
+* Makefile: fix parallel build failure
+
+Add src/_features.h as dependency for dbus.o to fix the parallel build
+failure:
+src/dbus.c:17:10: fatal error: _features.h: No such file or directory
+
+Upstream-Status: Backport
+[https://github.com/canonical/netplan/commit/2e84550b47b475d830622f41576992a1d45d6af0]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 0368e41..8ac7432 100644
+--- a/Makefile
++++ b/Makefile
+@@ -52,7 +52,7 @@ NOSETESTS3 ?= $(shell command -v nosetests-3 || command -v nosetests3 || echo tr
+ 
+ default: netplan/_features.py generate netplan-dbus dbus/io.netplan.Netplan.service doc/netplan.html doc/netplan.5 doc/netplan-generate.8 doc/netplan-apply.8 doc/netplan-try.8 doc/netplan-dbus.8 doc/netplan-get.8 doc/netplan-set.8
+ 
+-%.o: src/%.c
++%.o: src/%.c src/_features.h
+ 	$(CC) $(BUILDFLAGS) $(CFLAGS) $(LDFLAGS) -c $^ `pkg-config --cflags --libs glib-2.0 gio-2.0 yaml-0.1 uuid`
+ 
+ libnetplan.so.$(NETPLAN_SOVER): $(SRCS) abicompat.lds
+@@ -62,7 +62,7 @@ libnetplan.so.$(NETPLAN_SOVER): $(SRCS) abicompat.lds
+ generate: libnetplan.so.$(NETPLAN_SOVER) generate.o
+ 	$(CC) $(BUILDFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ $(filter-out $<,$^) -L. -lnetplan `pkg-config --cflags --libs glib-2.0 gio-2.0 yaml-0.1 uuid`
+ 
+-netplan-dbus: libnetplan.so.$(NETPLAN_SOVER) src/_features.h dbus.o
++netplan-dbus: libnetplan.so.$(NETPLAN_SOVER) dbus.o
+ 	$(CC) $(BUILDFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ $(filter-out $<,$(patsubst %.h,,$^)) -L. -lnetplan `pkg-config --cflags --libs libsystemd glib-2.0 gio-2.0 yaml-0.1 uuid`
+ 
+ src/_features.h: src/[^_]*.[hc]
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/netplan/netplan_0.104.bb b/meta-networking/recipes-connectivity/netplan/netplan_0.104.bb
index e19fceb4a..ea944fa9d 100644
--- a/meta-networking/recipes-connectivity/netplan/netplan_0.104.bb
+++ b/meta-networking/recipes-connectivity/netplan/netplan_0.104.bb
@@ -16,6 +16,7 @@ PV = "0.104"
 
 SRC_URI = "git://github.com/CanonicalLtd/netplan.git;branch=main;protocol=https \
            file://0001-Makefile-do-not-use-Werror.patch \
+           file://0001-Makefile-fix-parallel-build-failure.patch \
            "
 
 SRC_URI:append:libc-musl = " file://0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch"
-- 
2.25.1


