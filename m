Return-Path: <peter.kjellerstedt@axis.com>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB32C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 07:13:32 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.77])
 by mx.groups.io with SMTP id smtpd.web10.5518.1699341203814610707
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 23:13:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=URKP1EMT;
 spf=pass (domain: axis.com, ip: 40.107.8.77, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kERgzA6WGwYry6OzJXvM5TBCrxNUvkuCYQOfWfi4oNBat38sJPvjWwGf9UHK2FBQu7DwbB98WTV7rU4dANGUaJ5WAMpkycVds6S2wzeylHXPQ7IOBkGv6SNVPLPN6KcDZf0itljpeKLCwAYfH6Sax9lMQmQnAZSKssGwSyxzGLV0FcS7p0YLbMRE0asJxbnuReyhgLTlksmS04uiCNGWOvDac+LT9rnXG7PIiIa/uw7wOkhmbUaf7kCh5UHFje9cph/TA6WaAr5wlvznjYPCuPRsI64x1vrx0ps5Ysi/bOqMVQwdSnM2txU/QgvJwXJfUSj4wFCOWBsfEqESnam0XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMdIpZPImPznwvmHI1SzvGEZrrUtQvyz33u5HKAvt4Q=;
 b=FIlX7nmBV/PTG8VV0CW9dpmdKbpRlXRoM0i+aLeigfAvVW0u2kfut0V90FCcJ5mvQV7XKDDMbTVlvePp43vdci4ymw28dfT7NlEMk7fje+d9fIFQf4dT7HGaLOH1fMXmWDyLr6krN29dNt6r3mmpK721nOyk6rqikhhz9sKLU2tK6isF6bNWSgo7HkMNuAjPqY2F1juNsuiAyS7ZRhFPTbJtxJ5dQMQwgRyfa8leRiHy9Z8IScue/ewXR4gFVwkuqvdlSNCKiS6/hWE7/snUmie9UjpyBgl7irJFBJSb8ZzeuN531W8m9rLp46G4bapHdrRy+DT6Sl7ou1mSLvfXuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMdIpZPImPznwvmHI1SzvGEZrrUtQvyz33u5HKAvt4Q=;
 b=URKP1EMTOi/DTPgo1V/VnHJybOw+nk9aXIyZZTZKEDUxi3sGK15bZ2nwTVFtF+zcR0nvPRu8S8e8agdRgZdyBm53XXunCbtISbc6mHffvv/RAAmk8rw5/Kx4k24xG9fFV4iyk9XX1Zg2NRCxPRTI6po6SRlB+P97MykVnSShiBM=
Received: from AS9PR06CA0708.eurprd06.prod.outlook.com (2603:10a6:20b:49f::35)
 by GVXPR02MB10593.eurprd02.prod.outlook.com (2603:10a6:150:156::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Tue, 7 Nov
 2023 07:13:02 +0000
Received: from AM4PEPF00027A64.eurprd04.prod.outlook.com
 (2603:10a6:20b:49f:cafe::59) by AS9PR06CA0708.outlook.office365.com
 (2603:10a6:20b:49f::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29 via Frontend
 Transport; Tue, 7 Nov 2023 07:13:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00027A64.mail.protection.outlook.com (10.167.16.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Tue, 7 Nov 2023 07:13:02 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Nov
 2023 08:12:49 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Nov 2023 08:12:49 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 878486D3C
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Nov 2023 08:12:49 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3A77CniQ1519713
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Nov 2023 08:12:49 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3A77CnGB1519712
	for openembedded-devel@lists.openembedded.org; Tue, 7 Nov 2023 08:12:49 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 05/16] Revert "libtorrent: upgrade 0.13.8 -> 1"
Date: Tue, 7 Nov 2023 08:12:29 +0100
Message-ID: <20231107071240.1519631-5-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231107071240.1519631-1-pkj@axis.com>
References: <20231107071240.1519631-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A64:EE_|GVXPR02MB10593:EE_
X-MS-Office365-Filtering-Correlation-Id: 68dd87eb-0041-4d0e-e694-08dbdf60fb18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xIjkfOXpufvSfWqSCWnkWiCvUuHEUnQJXzjwwuHRM/1GrIXkB54HyK7mOkAOOaBEby/JVkaIPEAxUEo3/IDUwdl2L0gw6ZQ4KrT1NIw1q1SQ175iwSH0cLXv2ech743QeFXAQpa7aH3UpfGtYJE8bRmHMK2+WJOxB58rXH+yFpH2ArYbcAKeKNjUgh3aSLLQ6Qw/l+r2b79MF5deEC+Jvz751aN2hUApxVufgsExs1YZ/ProsjyK0b3/c2YHZ0CTbrptJPcFnTkmdJvXyct/EGf769rUuc9KpTmSYoOUxU0PxxLzCI37kUefC17+l9BFybG3br8I8ksFNPBy2B7sI1YLarsaTsMUBhJ7tL9RuFerfwFdCt4U4VJVJxR05of9Q6eJkO4n3XpQTJPXc2ZTP6HK0aSh/aMotdIIkDx6yahmZyjBdsy3DOO9lyHqHKK6iQWk4bEA22D1KGIbFq6sQuZPDXLlBqm9kOOkAMt4974TmqqnBGDteylC78zY0qXwOPyzB1shjsyM9FJgs+9cTRrL3piyAphg3DOII9OtsdwDxf9+ivtekuBkqrsRqDQcv5F246xROGatNBSZcM7qY3LkQX3XfPyFxZyrENOp8fVKiZtInj4MYmXTQKoe1ieFy/sLGokubnVnEMFR+uAY3DF0XyFvh/RIkcAlukwQJdaEbl+kBQH+NP+beRLplKJhLZ/WWjaJ+EbhVrkKSAR4nd2VwDuSaAOwYzaUFfox8arw87/kvajGtwP363dnPXljwk9rHjS0Jky2iRHbhGIlZnuQn+YBvXETY0rDmU2R2iO8bBHAsFmICjE7Htdr5wro
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(396003)(136003)(39860400002)(230173577357003)(230273577357003)(230922051799003)(82310400011)(451199024)(64100799003)(186009)(1800799009)(40470700004)(46966006)(36840700001)(19627235002)(1076003)(82740400003)(70586007)(83380400001)(2616005)(70206006)(336012)(426003)(66574015)(40460700003)(26005)(478600001)(6666004)(66899024)(966005)(356005)(8936002)(40480700001)(8676002)(41300700001)(47076005)(5660300002)(36860700001)(2906002)(81166007)(30864003)(6916009)(42186006)(316002)(40140700001)(36756003)(2004002)(36900700001)(579004)(559001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 07:13:02.5155
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68dd87eb-0041-4d0e-e694-08dbdf60fb18
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A64.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR02MB10593
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 07:13:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106438

This reverts commit 3259bc75f5cbe83623e340efd4518414ae2f7593.

AUH incorrectly identified the tag "pre-merge-1" as version "1".

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...issue-with-gcc-v6.x-and-empty-CXXFLA.patch |   44 -
 ...c-v6.x-fix-for-empty-CXXFLAGS-See-10.patch |   56 -
 ...pace-to-fmt-str-in-log_gz_file_write.patch |   27 -
 ...ncement-11IPv4-filter-enhancement-Cl.patch |  379 -
 ...extents-test-to-pass-TravisCI-See-11.patch |   47 -
 .../0006-Bumped-version-to-0.13.7.patch       |   30 -
 .../0007-Added-support-for-openssl-1.1.patch  |  105 -
 ...nstead-of-AC_RUN-to-check-for-execin.patch |   24 -
 ...-to-prevent-unnecessary-kqueue-check.patch |   46 -
 ...failed-tracker-bencode-parsing-See-9.patch |   58 -
 ...when-displaying-info-on-failed-track.patch |   60 -
 ...tch-to-C-11-MRT-RNG-for-random-bytes.patch |   45 -
 ...m_ipv6_socket-attribute-which-led-to.patch |   45 -
 ...-creation-AF_INET6-failes-initialize.patch |   27 -
 ...hub.com-rakshasa-rtorrent-issues-731.patch |   29 -
 ...ottle.min_peers-settings-in-rtorrent.patch |   40 -
 .../0017-increase-piece-length-max.patch      |   22 -
 .../0018-Set-max-piece-size-512mb.patch       |   22 -
 .../0019-Fixed-compiler-warning.patch         |   22 -
 ..._GNU_SOURCE-to-fallocate-test.-neheb.patch |   74 -
 ...-Fixed-diffie-hellman-implementation.patch |  293 -
 ...sed-max-timeout-for-tracker-requests.patch |   64 -
 ...-Close-log-files-when-reusing-a-name.patch |  123 -
 .../0024-Bumped-to-version-0.13.8.patch       |   30 -
 ...-be-appended-rather-than-overwritten.patch |  109 -
 ...nd-function.-Added-append-parameter-.patch |  101 -
 ...kport-changes-from-feature-bind.-200.patch | 7365 -----------------
 ...ibtorrent.pc.in-add-Libs.Private-202.patch |   26 -
 ...fy-missing-quickly-renamed-files-203.patch |   27 -
 .../0030-Fix-compiler-warnings.-204.patch     |  470 --
 ...-log-format-so-GCC-can-check-it.-205.patch |   33 -
 ...e-make-script-to-optimize-build.-206.patch |  843 --
 .../0033-Refactor-make-process.-207.patch     | 2710 ------
 ...0034-Changes-automake-required-files.patch |   22 -
 ...placed-custom-execinfo-autoconf-test.patch |   48 -
 ...option-to-disable-pthread_setname_np.patch |  135 -
 ...37-Improved-backtrace-error-checking.patch |  594 --
 ...-multiple-connections-from-NAT-not-w.patch |  199 -
 ...disable-execinfo-option-to-configure.patch |   32 -
 .../libtorrent/0040-Detect-ip-address.patch   |  457 -
 .../libtorrent/0041-Added-ipv6-options.patch  |   85 -
 .../0042-Removed-obsolete-files.patch         |  444 -
 ...Updated-and-cleaned-up-automake.-224.patch | 2979 -------
 .../libtorrent/0044-Create-FUNDING.yml.patch  |   29 -
 .../libtorrent/libtorrent_git.bb              |   51 +-
 45 files changed, 3 insertions(+), 18468 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0001=
-Fix-compilation-issue-with-gcc-v6.x-and-empty-CXXFLA.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0002=
-Modfiy-gcc-v6.x-fix-for-empty-CXXFLAGS-See-10.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0003=
-Add-space-to-fmt-str-in-log_gz_file_write.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0004=
-IPv4-filter-enhancement-11IPv4-filter-enhancement-Cl.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0005=
-Disable-extents-test-to-pass-TravisCI-See-11.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0006=
-Bumped-version-to-0.13.7.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0007=
-Added-support-for-openssl-1.1.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0008=
-Use-AC_COMPILE-instead-of-AC_RUN-to-check-for-execin.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0009=
-Modify-configure-to-prevent-unnecessary-kqueue-check.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0010=
-Display-info-on-failed-tracker-bencode-parsing-See-9.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0011=
-Strip-tags-also-when-displaying-info-on-failed-track.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0012=
-Switch-to-C-11-MRT-RNG-for-random-bytes.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0013=
-Prevent-loss-of-m_ipv6_socket-attribute-which-led-to.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0014=
-If-during-socket-creation-AF_INET6-failes-initialize.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0015=
-Fixes-https-github.com-rakshasa-rtorrent-issues-731.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0016=
-Fix-honoring-throttle.min_peers-settings-in-rtorrent.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0017=
-increase-piece-length-max.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0018=
-Set-max-piece-size-512mb.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0019=
-Fixed-compiler-warning.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0020=
-Added-_GNU_SOURCE-to-fallocate-test.-neheb.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0021=
-Fixed-diffie-hellman-implementation.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0022=
-Increased-max-timeout-for-tracker-requests.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0023=
-Close-log-files-when-reusing-a-name.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0024=
-Bumped-to-version-0.13.8.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0025=
-Allow-logs-to-be-appended-rather-than-overwritten.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0026=
-Removed-log-append-function.-Added-append-parameter-.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0027=
-Backport-changes-from-feature-bind.-200.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0028=
-libtorrent.pc.in-add-Libs.Private-202.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0029=
-Fix-for-inotify-missing-quickly-renamed-files-203.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0030=
-Fix-compiler-warnings.-204.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0031=
-Fix-log-format-so-GCC-can-check-it.-205.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0032=
-Consolidate-make-script-to-optimize-build.-206.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0033=
-Refactor-make-process.-207.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0034=
-Changes-automake-required-files.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0035=
-Replaced-custom-execinfo-autoconf-test.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0036=
-Added-option-to-disable-pthread_setname_np.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0037=
-Improved-backtrace-error-checking.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0038=
-Fixed-issue-with-multiple-connections-from-NAT-not-w.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0039=
-Added-disable-execinfo-option-to-configure.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0040=
-Detect-ip-address.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0041=
-Added-ipv6-options.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0042=
-Removed-obsolete-files.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0043=
-Updated-and-cleaned-up-automake.-224.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0044=
-Create-FUNDING.yml.patch

diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0001-Fix-co=
mpilation-issue-with-gcc-v6.x-and-empty-CXXFLA.patch b/meta-oe/recipes-conn=
ectivity/libtorrent/libtorrent/0001-Fix-compilation-issue-with-gcc-v6.x-and=
-empty-CXXFLA.patch
deleted file mode 100644
index bc4bade51..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0001-Fix-compilati=
on-issue-with-gcc-v6.x-and-empty-CXXFLA.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From c2b119de0e66fb047bb20e445ac8e25824448858 Mon Sep 17 00:00:00 2001
-From: chros <chros@chrosGX620>
-Date: Sun, 30 Jul 2017 20:34:47 +0100
-Subject: [PATCH] Fix compilation issue with gcc v6.x and empty CXXFLAGS (S=
ee
- #10)
-
----
- configure.ac            |  1 +
- scripts/rak_compiler.m4 | 13 +++++++++++++
- 2 files changed, 14 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 65e34872..2f29e3f9 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -28,6 +28,7 @@ AC_C_BIGENDIAN(
-     AC_MSG_ERROR([Could not determine endianness])
- )
-=20
-+RAK_CHECK_CXXFLAGS
- RAK_ENABLE_DEBUG
- RAK_ENABLE_EXTRA_DEBUG
- RAK_ENABLE_WERROR
-diff --git a/scripts/rak_compiler.m4 b/scripts/rak_compiler.m4
-index 39bd19a7..87871abf 100644
---- a/scripts/rak_compiler.m4
-+++ b/scripts/rak_compiler.m4
-@@ -1,3 +1,16 @@
-+AC_DEFUN([RAK_CHECK_CXXFLAGS], [
-+
-+  AC_MSG_CHECKING([for user-defined CXXFLAGS])
-+
-+  if test -n "$CXXFLAGS"; then
-+    AC_MSG_RESULT([user-defined "$CXXFLAGS"])
-+  else
-+    CXXFLAGS=3D"-O2"
-+    AC_MSG_RESULT([default "$CXXFLAGS"])
-+  fi
-+])
-+
-+
- AC_DEFUN([RAK_ENABLE_DEBUG], [
-   AC_ARG_ENABLE(debug,
-     AC_HELP_STRING([--enable-debug], [enable debug information [[default=
=3Dyes]]]),
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0002-Modfiy=
-gcc-v6.x-fix-for-empty-CXXFLAGS-See-10.patch b/meta-oe/recipes-connectivit=
y/libtorrent/libtorrent/0002-Modfiy-gcc-v6.x-fix-for-empty-CXXFLAGS-See-10.=
patch
deleted file mode 100644
index 532b65a7c..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0002-Modfiy-gcc-v6=
.x-fix-for-empty-CXXFLAGS-See-10.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 8229218dff1105e9fb2bb2c7510910a0db98f3ef Mon Sep 17 00:00:00 2001
-From: chros <chros@chrosGX620>
-Date: Wed, 2 Aug 2017 12:48:27 +0100
-Subject: [PATCH] Modfiy gcc v6.x fix for empty CXXFLAGS (See #10)
-
----
- configure.ac            |  1 +
- scripts/rak_compiler.m4 | 21 +++++++++++++++++----
- 2 files changed, 18 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 2f29e3f9..a6df6b80 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -28,6 +28,7 @@ AC_C_BIGENDIAN(
-     AC_MSG_ERROR([Could not determine endianness])
- )
-=20
-+RAK_CHECK_CFLAGS
- RAK_CHECK_CXXFLAGS
- RAK_ENABLE_DEBUG
- RAK_ENABLE_EXTRA_DEBUG
-diff --git a/scripts/rak_compiler.m4 b/scripts/rak_compiler.m4
-index 87871abf..9a361bed 100644
---- a/scripts/rak_compiler.m4
-+++ b/scripts/rak_compiler.m4
-@@ -1,12 +1,25 @@
-+AC_DEFUN([RAK_CHECK_CFLAGS], [
-+
-+  AC_MSG_CHECKING([for user-defined CFLAGS])
-+
-+  if test "$CFLAGS" =3D ""; then
-+    unset CFLAGS
-+    AC_MSG_RESULT([undefined])
-+  else
-+    AC_MSG_RESULT([user-defined "$CFLAGS"])
-+  fi
-+])
-+
-+
- AC_DEFUN([RAK_CHECK_CXXFLAGS], [
-=20
-   AC_MSG_CHECKING([for user-defined CXXFLAGS])
-=20
--  if test -n "$CXXFLAGS"; then
--    AC_MSG_RESULT([user-defined "$CXXFLAGS"])
-+  if test "$CXXFLAGS" =3D ""; then
-+    unset CXXFLAGS
-+    AC_MSG_RESULT([undefined])
-   else
--    CXXFLAGS=3D"-O2"
--    AC_MSG_RESULT([default "$CXXFLAGS"])
-+    AC_MSG_RESULT([user-defined "$CXXFLAGS"])
-   fi
- ])
-=20
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0003-Add-sp=
ace-to-fmt-str-in-log_gz_file_write.patch b/meta-oe/recipes-connectivity/li=
btorrent/libtorrent/0003-Add-space-to-fmt-str-in-log_gz_file_write.patch
deleted file mode 100644
index 810b4d4ca..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0003-Add-space-to-=
fmt-str-in-log_gz_file_write.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 48635a0fdb06b8572809dc54c630109db1e6e85c Mon Sep 17 00:00:00 2001
-From: Matt Traudt <sirmatt@ksu.edu>
-Date: Mon, 20 Nov 2017 15:22:51 -0500
-Subject: [PATCH] Add space to fmt str in log_gz_file_write
-
-Without this space, the log level identifier ('D', 'I', etc.)
-would be right next to actual content.
-
-Before: <timestamp> Depoll->pcb(17): Open event.
-After: <timestamp> D epoll->pcb(17): Open event.
----
- src/torrent/utils/log.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/torrent/utils/log.cc b/src/torrent/utils/log.cc
-index 646d36e3..58b563a6 100644
---- a/src/torrent/utils/log.cc
-+++ b/src/torrent/utils/log.cc
-@@ -381,7 +381,7 @@ log_gz_file_write(std::shared_ptr<log_gz_output>& outf=
ile, const char* data, siz
-=20
-   // Normal groups are nul-terminated strings.
-   if (group >=3D 0) {
--    const char* fmt =3D (group >=3D LOG_NON_CASCADING) ? ("%" PRIi32 " ")=
 : ("%" PRIi32 " %c");
-+    const char* fmt =3D (group >=3D LOG_NON_CASCADING) ? ("%" PRIi32 " ")=
 : ("%" PRIi32 " %c ");
-=20
-     int buffer_length =3D snprintf(buffer, 64, fmt,
-                                  cachedTime.seconds(),
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0004-IPv4-f=
ilter-enhancement-11IPv4-filter-enhancement-Cl.patch b/meta-oe/recipes-conn=
ectivity/libtorrent/libtorrent/0004-IPv4-filter-enhancement-11IPv4-filter-e=
nhancement-Cl.patch
deleted file mode 100644
index c7a01409d..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0004-IPv4-filter-e=
nhancement-11IPv4-filter-enhancement-Cl.patch
+++ /dev/null
@@ -1,379 +0,0 @@
-From facd1b78071e315a2e5ee4992d3545dae4290e07 Mon Sep 17 00:00:00 2001
-From: chros <chros@chrosGX620>
-Date: Sun, 10 Dec 2017 18:51:32 +0000
-Subject: [PATCH] IPv4 filter enhancement #11IPv4 filter enhancement (Close=
s
- #11)
-
----
- src/torrent/peer/peer_list.cc |  23 ++-
- src/torrent/peer/peer_list.h  |   2 +-
- src/torrent/utils/extents.h   | 267 ++++++++++++++--------------------
- 3 files changed, 134 insertions(+), 158 deletions(-)
-
-diff --git a/src/torrent/peer/peer_list.cc b/src/torrent/peer/peer_list.cc
-index 23ca651a..aa60939a 100644
---- a/src/torrent/peer/peer_list.cc
-+++ b/src/torrent/peer/peer_list.cc
-@@ -146,7 +146,11 @@ PeerList::insert_address(const sockaddr* sa, int flag=
s) {
-=20
-   PeerInfo* peerInfo =3D new PeerInfo(sa);
-   peerInfo->set_listen_port(address->port());
--  peerInfo->set_flags(m_ipv4_table.at(address->sa_inet()->address_h()) & =
PeerInfo::mask_ip_table);
-+  uint32_t host_byte_order_ipv4_addr =3D address->sa_inet()->address_h();
-+
-+  // IPv4 addresses stored in host byte order in ipv4_table so they are c=
omparable. ntohl has been called
-+  if(m_ipv4_table.defined(host_byte_order_ipv4_addr))
-+    peerInfo->set_flags(m_ipv4_table.at(host_byte_order_ipv4_addr) & Peer=
Info::mask_ip_table);
-  =20
-   manager->client_list()->retrieve_unknown(&peerInfo->mutable_client_info=
());
-=20
-@@ -264,12 +268,25 @@ PeerList::connected(const sockaddr* sa, int flags) {
-       !socket_address_key::is_comparable_sockaddr(sa))
-     return NULL;
-=20
--  int filter_value =3D m_ipv4_table.at(address->sa_inet()->address_h());
-+  uint32_t host_byte_order_ipv4_addr =3D address->sa_inet()->address_h();
-+  int filter_value =3D 0;
-+
-+  // IPv4 addresses stored in host byte order in ipv4_table so they are c=
omparable. ntohl has been called
-+  if(m_ipv4_table.defined(host_byte_order_ipv4_addr))
-+    filter_value =3D m_ipv4_table.at(host_byte_order_ipv4_addr);
-=20
-   // We should also remove any PeerInfo objects already for this
-   // address.
--  if ((filter_value & PeerInfo::flag_unwanted))
-+  if ((filter_value & PeerInfo::flag_unwanted)) {
-+    char ipv4_str[INET_ADDRSTRLEN];
-+    uint32_t net_order_addr =3D htonl(host_byte_order_ipv4_addr);
-+
-+    inet_ntop(AF_INET, &net_order_addr, ipv4_str, INET_ADDRSTRLEN);
-+
-+    lt_log_print(LOG_PEER_INFO, "Peer %s is unwanted: preventing connecti=
on", ipv4_str);
-+
-     return NULL;
-+  }
-=20
-   PeerInfo* peerInfo;
-   range_type range =3D base_type::equal_range(sock_key);
-diff --git a/src/torrent/peer/peer_list.h b/src/torrent/peer/peer_list.h
-index a3b409cb..4c2f707d 100644
---- a/src/torrent/peer/peer_list.h
-+++ b/src/torrent/peer/peer_list.h
-@@ -46,7 +46,7 @@ namespace torrent {
-=20
- class DownloadInfo;
-=20
--typedef extents<uint32_t, int, 32, 256, 8> ipv4_table;
-+typedef extents<uint32_t, int> ipv4_table;
-=20
- class LIBTORRENT_EXPORT PeerList : private std::multimap<socket_address_k=
ey, PeerInfo*> {
- public:
-diff --git a/src/torrent/utils/extents.h b/src/torrent/utils/extents.h
-index 8ec1e600..c2b887b1 100644
---- a/src/torrent/utils/extents.h
-+++ b/src/torrent/utils/extents.h
-@@ -37,191 +37,150 @@
- #ifndef LIBTORRENT_UTILS_EXTENTS_H
- #define LIBTORRENT_UTILS_EXTENTS_H
-=20
--#include lt_tr1_array
-=20
--#include <algorithm>
-+#include <map>
-+#include <stdexcept>
-=20
- namespace torrent {
-=20
--template <typename Key, typename Tp, unsigned int TableSize, unsigned int=
 TableBits>
--struct extents_base {
--  typedef Key                          key_type;
--  typedef std::pair<Key, Key>          range_type;
--  typedef std::pair<extents_base*, Tp> mapped_type;
--  typedef Tp                           mapped_value_type;
--
--  typedef std::array<mapped_type, TableSize> table_type;
-- =20
--  extents_base(key_type pos, unsigned int mb, mapped_value_type val);
--  extents_base(extents_base* parent, typename table_type::const_iterator =
itr);
--  ~extents_base();
--
--  bool         is_divisible(key_type key) const { return key % mask_bits =
=3D=3D 0; }
--  bool         is_leaf_branch() const           { return mask_bits =3D=3D=
 0; }
--  bool         is_equal_range(key_type first, key_type last, const mapped=
_value_type& val) const;
--
--  unsigned int sizeof_data() const;
--
--  typename table_type::iterator       partition_at(key_type key)         =
  { return table.begin() + ((key >> mask_bits) & (TableSize - 1)); }
--  typename table_type::const_iterator partition_at(key_type key) const   =
  { return table.begin() + ((key >> mask_bits) & (TableSize - 1)); }
--
--  unsigned int mask_distance(unsigned int mb) { return (~(~key_type() << =
mb) >> mask_bits); }
--
--  key_type     partition_pos(typename table_type::const_iterator part) co=
nst { return position + (std::distance(table.begin(), part) << mask_bits); =
}
--
--  void         insert(key_type pos, unsigned int mb, const mapped_value_t=
ype& val);
--
--  const mapped_value_type& at(key_type key) const;
--
--  unsigned int mask_bits;
--  key_type     position;
--  table_type   table;
--};
--
--template <typename Key, typename Tp, unsigned int MaskBits, unsigned int =
TableSize, unsigned int TableBits>
--class extents : private extents_base<Key, Tp, TableSize, TableBits> {
-+template <class Address, class Value, class Compare=3Dstd::less<Address> =
>
-+class extents {
- public:
--  typedef extents_base<Key, Tp, TableSize, TableBits> base_type;
--
--  typedef typename base_type::key_type          key_type;
--  typedef base_type                             value_type;
--  typedef typename base_type::range_type        range_type;
--  typedef typename base_type::mapped_type       mapped_type;
--  typedef typename base_type::mapped_value_type mapped_value_type;
--  typedef typename base_type::table_type        table_type;
--
--  static const key_type mask_bits  =3D MaskBits;
--  static const key_type table_bits =3D TableBits;
--  static const key_type table_size =3D TableSize;
--
--  using base_type::at;
--  using base_type::sizeof_data;
-+  typedef Address                                  key_type;           //=
 start address
-+  typedef Value                                    mapped_value_type;  //=
 The value mapped to the ip range
-+  typedef std::pair<Address, Value>                mapped_type;        //=
 End address, value mapped to ip range
-+  typedef std::map<key_type, mapped_type, Compare> range_map_type;     //=
 The map itself=20
-=20
-   extents();
-+  ~extents();
-=20
--  bool is_equal_range(key_type first, key_type last, const mapped_value_t=
ype& val) const;
--
--  void insert(key_type pos, unsigned int mb, const mapped_value_type& val=
);
-+  void              insert(key_type address_start, key_type address_end, =
mapped_value_type value);
-+  bool              defined(key_type address_start, key_type address_end)=
;
-+  bool              defined(key_type address);
-+  key_type          get_matching_key(key_type address_start, key_type add=
ress_end); // throws error on not defined. test with defined()=20
-+  mapped_value_type at(key_type address_start, key_type address_end);    =
           // throws error on not defined. test with defined()=20
-+  mapped_value_type at(key_type address);                                =
           // throws error on not defined. test with defined()
-+  unsigned int      sizeof_data() const;
-=20
--  base_type* data() { return this; }
-+  range_map_type    range_map;
- };
-=20
--template <typename Key, typename Tp, unsigned int TableSize, unsigned int=
 TableBits>
--extents_base<Key, Tp, TableSize, TableBits>::extents_base(key_type pos, u=
nsigned int mb, mapped_value_type val) :
--  mask_bits(mb), position(pos) {
--  std::fill(table.begin(), table.end(), mapped_type(NULL, mapped_value_ty=
pe()));
-+///////////////////////////////////////
-+// CONSTRUCTOR [PLACEHOLDER]
-+///////////////////////////////////////
-+template <class Address, class Value, class Compare >
-+extents<Address, Value, Compare>::extents() {
-+  //nothing to do
-+  return;
- }
-=20
--template <typename Key, typename Tp, unsigned int TableSize, unsigned int=
 TableBits>
--extents_base<Key, Tp, TableSize, TableBits>::extents_base(extents_base* p=
arent, typename table_type::const_iterator itr) :
--  mask_bits(parent->mask_bits - TableBits), position(parent->partition_po=
s(itr)) {
--  std::fill(table.begin(), table.end(), mapped_type(NULL, itr->second));
-+///////////////////////////////////////
-+// DESTRUCTOR [PLACEHOLDER]
-+///////////////////////////////////////
-+template <class Address, class Value, class Compare >
-+extents<Address, Value, Compare>::~extents() {
-+  //nothing to do. map destructor can handle cleanup.=20
-+  return;
- }
-=20
--template <typename Key, typename Tp, unsigned int MaskBits, unsigned int =
TableSize, unsigned int TableBits>
--extents<Key, Tp, MaskBits, TableSize, TableBits>::extents() :
--  base_type(key_type(), mask_bits - table_bits, mapped_value_type())
--{
--}
-+/////////////////////////////////////////////////////////////////////////=
/////////
-+// INSERT O(log N) assuming no overlapping ranges
-+/////////////////////////////////////////////////////////////////////////=
////////
-+template <class Address, class Value, class Compare >
-+void extents<Address, Value, Compare>::insert(key_type address_start, key=
_type address_end, mapped_value_type value) {
-+  //we allow overlap ranges though not 100% overlap but only if mapped va=
lues are the same.  first remove any overlap range that has a different val=
ue.
-+  typename range_map_type::iterator iter =3D range_map.upper_bound(addres=
s_start);=20
-+  if( iter !=3D range_map.begin() ) { iter--; }=20
-+  bool ignore_due_to_total_overlap =3D false;
-+  while( iter->first <=3D address_end && iter !=3D range_map.end() ) {
-+    key_type delete_key =3D iter->first;
-+    bool do_delete_due_to_overlap        =3D  iter->first <=3D address_en=
d && (iter->second).first >=3D address_start && (iter->second).second !=3D =
value;
-+    bool do_delete_due_to_total_overlap  =3D  address_start <=3D iter->fi=
rst && address_end >=3D (iter->second).first;
-+    iter++;
-+    if(do_delete_due_to_overlap || do_delete_due_to_total_overlap) {
-+      range_map.erase (delete_key);
-+    }
-+    else {
-+      ignore_due_to_total_overlap =3D ignore_due_to_total_overlap || ( it=
er->first <=3D address_start && (iter->second).first >=3D address_end );
-+    }
-+  }
-=20
--template <typename Key, typename Tp, unsigned int TableSize, unsigned int=
 TableBits>
--extents_base<Key, Tp, TableSize, TableBits>::~extents_base() {
--  for (typename table_type::const_iterator itr =3D table.begin(), last =
=3D table.end(); itr !=3D last; itr++)
--    delete itr->first;
-+  if(!ignore_due_to_total_overlap) {
-+    mapped_type entry;
-+    entry.first =3D address_end;
-+    entry.second =3D value;
-+    range_map.insert( std::pair<key_type,mapped_type>(address_start, entr=
y) );
-+  }
- }
-=20
--template <typename Key, typename Tp, unsigned int TableSize, unsigned int=
 TableBits>
--unsigned int
--extents_base<Key, Tp, TableSize, TableBits>::sizeof_data() const {
--  unsigned int sum =3D sizeof(*this);
--
--  for (typename table_type::const_iterator itr =3D table.begin(), last =
=3D table.end(); itr !=3D last; itr++)
--    if (itr->first !=3D NULL)
--      sum +=3D itr->first->sizeof_data();
--
--  return sum;
-+//////////////////////////////////////////////////////////////////////
-+// DEFINED  O(log N) assuming no overlapping ranges
-+//////////////////////////////////////////////////////////////////////
-+template <class Address, class Value, class Compare >
-+bool extents<Address, Value, Compare>::defined(key_type address_start, ke=
y_type address_end) {
-+  bool defined =3D false;
-+  typename range_map_type::iterator iter =3D range_map.upper_bound(addres=
s_start);
-+  if( iter !=3D range_map.begin() ) { iter--; }=20
-+  while( iter->first <=3D address_end && !defined && iter !=3D range_map.=
end() ) {
-+    defined =3D iter->first <=3D address_end && (iter->second).first >=3D=
 address_start;
-+    iter++;
-+  }
-+  return defined;
- }
--
--template <typename Key, typename Tp, unsigned int MaskBits, unsigned int =
TableSize, unsigned int TableBits>
--void
--extents<Key, Tp, MaskBits, TableSize, TableBits>::insert(key_type pos, un=
signed int mb, const mapped_value_type& val) {
--  key_type mask =3D ~key_type() << mb;
--
--  base_type::insert(pos & mask, mb, val);
-+template <class Address, class Value, class Compare >
-+bool extents<Address, Value, Compare>::defined(key_type address) {
-+  return defined(address, address);
- }
-=20
--template <typename Key, typename Tp, unsigned int TableSize, unsigned int=
 TableBits>
--void
--extents_base<Key, Tp, TableSize, TableBits>::insert(key_type pos, unsigne=
d int mb, const mapped_value_type& val) {
--  // RESTRICTED
--  typename table_type::iterator first =3D partition_at(pos);
--  typename table_type::iterator last =3D partition_at(pos) + mask_distanc=
e(mb) + 1;
--
--  if (mb < mask_bits) {
--    if (first->first =3D=3D NULL)
--      first->first =3D new extents_base(this, first);
-+//////////////////////////////////////////////////////////////////////
-+// GET_MATCHING_KEY  O(log N) assuming no overlapping ranges
-+//////////////////////////////////////////////////////////////////////
-+template <class Address, class Value, class Compare >
-+typename extents<Address, Value, Compare>::key_type extents<Address, Valu=
e, Compare>::get_matching_key(key_type address_start, key_type address_end)=
 {
-+  key_type key;
-+  bool defined =3D false;
-+  typename range_map_type::iterator iter =3D range_map.upper_bound(addres=
s_start);
-+  if( iter !=3D range_map.begin() ) { iter--; }=20
-+  while( iter->first <=3D address_end && !defined && iter !=3D range_map.=
end() ) {
-+    defined =3D iter->first <=3D address_end && (iter->second).first >=3D=
 address_start;
-+    if(defined)
-+      key =3D iter->first;
-    =20
--    first->first->insert(pos, mb, val);
--    return;
-+    iter++;
-   }
--
--  while (first !=3D last) {
--    if (first->first !=3D NULL) {
--      delete first->first;
--      first->first =3D NULL;
--    }
--   =20
--    (first++)->second =3D val;
-+  // this will cause exception to be thrown=20
-+  if(!defined) {
-+    std::out_of_range e("nothing defined for specified key");
-+    throw e;
-   }
-+  return key;
- }
-=20
--template <typename Key, typename Tp, unsigned int MaskBits, unsigned int =
TableSize, unsigned int TableBits>
--bool
--extents<Key, Tp, MaskBits, TableSize, TableBits>::is_equal_range(key_type=
 first, key_type last, const mapped_value_type& val) const {
--  // RESTRICTED
--  first =3D std::max(first, key_type());
--  last =3D std::min(last, key_type() + (~key_type() >> (sizeof(key_type) =
* 8 - MaskBits)));
--
--  if (first <=3D last)
--    return base_type::is_equal_range(first, last, val);
--  else
--    return true;
-+//////////////////////////////////////////////////////////////////////
-+// AT  O(log N) assuming no overlapping ranges
-+//////////////////////////////////////////////////////////////////////
-+template <class Address, class Value, class Compare >
-+typename extents<Address, Value, Compare>::mapped_value_type extents<Addr=
ess, Value, Compare>::at(key_type address_start, key_type address_end) {
-+  key_type key =3D get_matching_key(address_start, address_end);
-+  mapped_type entry =3D range_map.at(key);
-+  return entry.second;
- }
--
--template <typename Key, typename Tp, unsigned int TableSize, unsigned int=
 TableBits>
--bool
--extents_base<Key, Tp, TableSize, TableBits>::is_equal_range(key_type key_=
first, key_type key_last, const mapped_value_type& val) const {
--  // RESTRICTED
--  typename table_type::const_iterator first =3D partition_at(key_first);
--  typename table_type::const_iterator last =3D partition_at(key_last) + 1=
;
--
--  do {
--    //    std::cout << "shift_amount " << key_first << ' ' << key_last <<=
 std::endl;
--
--    if (first->first =3D=3D NULL && val !=3D first->second)
--      return false;
--
--    if (first->first !=3D NULL && !first->first->is_equal_range(std::max(=
key_first, partition_pos(first)),
--                                                              std::min(ke=
y_last, partition_pos(first + 1) - 1), val))
--      return false;
--
--  } while (++first !=3D last);
--
--  return true;
-+template <class Address, class Value, class Compare >
-+typename extents<Address, Value, Compare>::mapped_value_type extents<Addr=
ess, Value, Compare>::at(key_type address) {
-+  return at(address, address);
- }
-=20
--// Assumes 'key' is within the range of the range.
--template <typename Key, typename Tp, unsigned int TableSize, unsigned int=
 TableBits>
--const typename extents_base<Key, Tp, TableSize, TableBits>::mapped_value_=
type&
--extents_base<Key, Tp, TableSize, TableBits>::at(key_type key) const {
--  typename table_type::const_iterator itr =3D partition_at(key);
--
--  while (itr->first !=3D NULL)
--    itr =3D itr->first->partition_at(key);
--
--  return itr->second;
-+//////////////////////////////////////////////////////////////////////
-+// SIZEOF_DATA  O(1)
-+//////////////////////////////////////////////////////////////////////
-+template <class Address, class Value, class Compare >
-+unsigned int extents<Address, Value, Compare>::sizeof_data() const {
-+  // we don't know overhead on map, so this won't be accurate.  just esti=
mate.
-+  unsigned int entry_size =3D sizeof(key_type) + sizeof(mapped_type);
-+  return entry_size * range_map.size();
- }
-=20
-+
- }
-=20
- #endif
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0005-Disabl=
e-extents-test-to-pass-TravisCI-See-11.patch b/meta-oe/recipes-connectivity=
/libtorrent/libtorrent/0005-Disable-extents-test-to-pass-TravisCI-See-11.pa=
tch
deleted file mode 100644
index 45f92524f..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0005-Disable-exten=
ts-test-to-pass-TravisCI-See-11.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 4a5ed3897e772c75929b376b08985d844898b619 Mon Sep 17 00:00:00 2001
-From: chros <chros@chrosGX620>
-Date: Tue, 12 Dec 2017 15:19:51 +0000
-Subject: [PATCH] Disable extents test to pass TravisCI (See #11)
-
----
- test/torrent/utils/test_extents.cc | 10 ++++++----
- 1 file changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/test/torrent/utils/test_extents.cc b/test/torrent/utils/test_=
extents.cc
-index 6ac5a57d..d6b8d11d 100644
---- a/test/torrent/utils/test_extents.cc
-+++ b/test/torrent/utils/test_extents.cc
-@@ -16,10 +16,11 @@ void
- ExtentsTest::tearDown() {
- }
-=20
--typedef torrent::extents<uint32_t, int, 8, 16, 4> extent_type_1;
-+//typedef torrent::extents<uint32_t, int, 8, 16, 4> extent_type_1;
-+typedef torrent::extents<uint32_t, int> extent_type_1;
-=20
- // typedef torrent::extents<uint32_t, int, 0, 256, 16> extent_type_3;
--
-+/*
- template <typename Extent>
- bool
- verify_extent_data(Extent& extent, const uint32_t* idx, const int* val) {
-@@ -46,11 +47,11 @@ static const int      val_basic_1[] =3D {1, 0, 1};
-=20
- // static const uint32_t idx_basic_2[] =3D {0, 1, 16, 255, 256, 256};
- // static const int      val_basic_2[] =3D {1, 0, 2, 1};
--
-+*/
- void
- ExtentsTest::test_basic() {
-   extent_type_1 extent_1;
--
-+/*
-   // Test empty.
-   CPPUNIT_ASSERT(verify_extent_data(extent_1, idx_empty, val_empty));
-=20
-@@ -68,4 +69,5 @@ ExtentsTest::test_basic() {
-   // extent_1.insert(38, 3, 2);
-=20
-   // CPPUNIT_ASSERT(verify_extent_data(extent_1, idx_basic_2, val_basic_2=
));
-+*/
- }
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0006-Bumped=
-version-to-0.13.7.patch b/meta-oe/recipes-connectivity/libtorrent/libtorre=
nt/0006-Bumped-version-to-0.13.7.patch
deleted file mode 100644
index 645cf0f99..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0006-Bumped-versio=
n-to-0.13.7.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From da7db7db29a8488e29d3b0f02906c5db379d4b6d Mon Sep 17 00:00:00 2001
-From: rakshasa <sundell.software@gmail.com>
-Date: Thu, 7 Jun 2018 13:18:03 +0900
-Subject: [PATCH] Bumped version to 0.13.7.
-
----
- configure.ac | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index a6df6b80..5b1ea237 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1,12 +1,12 @@
--AC_INIT(libtorrent, 0.13.6, sundell.software@gmail.com)
-+AC_INIT(libtorrent, 0.13.7, sundell.software@gmail.com)
-=20
- LT_INIT([disable-static])
-=20
- dnl Find a better way to do this
--AC_DEFINE(PEER_NAME, "-lt0D60-", Identifier that is part of the default p=
eer id)
--AC_DEFINE(PEER_VERSION, "lt\x0D\x60", 4 byte client and version identifie=
r for DHT)
-+AC_DEFINE(PEER_NAME, "-lt0D70-", Identifier that is part of the default p=
eer id)
-+AC_DEFINE(PEER_VERSION, "lt\x0D\x70", 4 byte client and version identifie=
r for DHT)
-=20
--LIBTORRENT_CURRENT=3D19
-+LIBTORRENT_CURRENT=3D20
- LIBTORRENT_REVISION=3D0
- LIBTORRENT_AGE=3D0
-=20
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0007-Added-=
support-for-openssl-1.1.patch b/meta-oe/recipes-connectivity/libtorrent/lib=
torrent/0007-Added-support-for-openssl-1.1.patch
deleted file mode 100644
index eaec545bb..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0007-Added-support=
-for-openssl-1.1.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From dbf6abfd6f905b9218465d15eebec7eedaaed6b0 Mon Sep 17 00:00:00 2001
-From: rakshasa <sundell.software@gmail.com>
-Date: Tue, 20 Dec 2016 19:51:02 +0900
-Subject: [PATCH] Added support for openssl 1.1.
-
----
- configure.ac                |  4 ++++
- src/utils/diffie_hellman.cc | 36 ++++++++++++++++++++++++++++++++++--
- 2 files changed, 38 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 5b1ea237..b885714d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -71,12 +71,15 @@ AC_ARG_ENABLE(openssl,
-   [  --disable-openssl       Don't use OpenSSL's SHA1 implementation.],
-   [
-     if test "$enableval" =3D "yes"; then
-+dnl move to scripts.
-       PKG_CHECK_MODULES(OPENSSL, libcrypto,
-         CXXFLAGS=3D"$CXXFLAGS $OPENSSL_CFLAGS";
-         LIBS=3D"$LIBS $OPENSSL_LIBS")
-=20
-       AC_DEFINE(USE_OPENSSL, 1, Using OpenSSL.)
-       AC_DEFINE(USE_OPENSSL_SHA, 1, Using OpenSSL's SHA1 implementation.)
-+      AC_CHECK_LIB([crypto], [DH_set0_pqg], [AC_DEFINE(USE_OPENSSL_1_1, 1=
, Using OpenSSL 1.1.)])
-+
-     else
-       AC_DEFINE(USE_NSS_SHA, 1, Using Mozilla's SHA1 implementation.)
-     fi
-@@ -87,6 +90,7 @@ AC_ARG_ENABLE(openssl,
-=20
-     AC_DEFINE(USE_OPENSSL, 1, Using OpenSSL.)
-     AC_DEFINE(USE_OPENSSL_SHA, 1, Using OpenSSL's SHA1 implementation.)
-+    AC_CHECK_LIB([crypto], [DH_set0_pqg], [AC_DEFINE(USE_OPENSSL_1_1, 1, =
Using OpenSSL 1.1.)])
-   ]
- )
-=20
-diff --git a/src/utils/diffie_hellman.cc b/src/utils/diffie_hellman.cc
-index aa653d45..7ec13165 100644
---- a/src/utils/diffie_hellman.cc
-+++ b/src/utils/diffie_hellman.cc
-@@ -54,11 +54,23 @@ DiffieHellman::DiffieHellman(const unsigned char *prim=
e, int primeLength,
-   m_secret(NULL), m_size(0) {
-=20
- #ifdef USE_OPENSSL
-+
-   m_dh =3D DH_new();
-+
-+#ifdef USE_OPENSSL_1_1
-+  BIGNUM * const dh_p =3D BN_bin2bn(prime, primeLength, NULL);
-+  BIGNUM * const dh_g =3D BN_bin2bn(generator, generatorLength, NULL);
-+
-+  if (dh_p =3D=3D NULL || dh_g =3D=3D NULL ||
-+      !DH_set0_pqg(m_dh, dh_p, NULL, dh_g))
-+	  throw internal_error("Could not generate Diffie-Hellman parameters");
-+#else
-   m_dh->p =3D BN_bin2bn(prime, primeLength, NULL);
-   m_dh->g =3D BN_bin2bn(generator, generatorLength, NULL);
-+#endif
-=20
-   DH_generate_key(m_dh);
-+
- #else
-   throw internal_error("Compiled without encryption support.");
- #endif
-@@ -74,7 +86,19 @@ DiffieHellman::~DiffieHellman() {
- bool
- DiffieHellman::is_valid() const {
- #ifdef USE_OPENSSL
-+  if (m_dh =3D=3D NULL)
-+    return false;
-+
-+#ifdef USE_OPENSSL_1_1
-+  const BIGNUM *pub_key;
-+
-+  DH_get0_key(m_dh, &pub_key, NULL);
-+
-+  return pub_key !=3D NULL;
-+#else
-   return m_dh !=3D NULL && m_dh->pub_key !=3D NULL;
-+#endif
-+
- #else
-   return false;
- #endif
-@@ -103,8 +127,16 @@ DiffieHellman::store_pub_key(unsigned char* dest, uns=
igned int length) {
- #ifdef USE_OPENSSL
-   std::memset(dest, 0, length);
-=20
--  if ((int)length >=3D BN_num_bytes(m_dh->pub_key))
--    BN_bn2bin(m_dh->pub_key, dest + length - BN_num_bytes(m_dh->pub_key))=
;
-+  const BIGNUM *pub_key;
-+
-+#ifdef USE_OPENSSL_1_1
-+  DH_get0_key(m_dh, &pub_key, NULL);
-+#else
-+  pub_key =3D m_dh->pub_key;
-+#endif
-+
-+  if ((int)length >=3D BN_num_bytes(pub_key))
-+    BN_bn2bin(pub_key, dest + length - BN_num_bytes(pub_key));
- #endif
- }
-=20
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0008-Use-AC=
_COMPILE-instead-of-AC_RUN-to-check-for-execin.patch b/meta-oe/recipes-conn=
ectivity/libtorrent/libtorrent/0008-Use-AC_COMPILE-instead-of-AC_RUN-to-che=
ck-for-execin.patch
deleted file mode 100644
index 6625fb55c..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0008-Use-AC_COMPIL=
E-instead-of-AC_RUN-to-check-for-execin.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From c2ec5e0fb8ce7a0df513b5f4086e23d92049ef0e Mon Sep 17 00:00:00 2001
-From: Stephen Shkardoon <ss23@ss23.geek.nz>
-Date: Mon, 25 Jun 2018 20:05:18 +1200
-Subject: [PATCH] Use AC_COMPILE instead of AC_RUN to check for execinfo.h
-
-This way enables cross compiling, since we don't need to run anything
-during the configure script.
----
- scripts/common.m4 | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/scripts/common.m4 b/scripts/common.m4
-index ff023928..b6d051f5 100644
---- a/scripts/common.m4
-+++ b/scripts/common.m4
-@@ -153,7 +153,7 @@ dnl   Need to fix this so that it uses the stuff defin=
ed by the system.
- AC_DEFUN([TORRENT_CHECK_EXECINFO], [
-   AC_MSG_CHECKING(for execinfo.h)
-=20
--  AC_RUN_IFELSE([AC_LANG_SOURCE([
-+  AC_COMPILE_IFELSE([AC_LANG_SOURCE([
-       #include <execinfo.h>
-       int main() { backtrace((void**)0, 0); backtrace_symbols((char**)0, =
0); return 0;}
-       ])],
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0009-Modify=
-configure-to-prevent-unnecessary-kqueue-check.patch b/meta-oe/recipes-conn=
ectivity/libtorrent/libtorrent/0009-Modify-configure-to-prevent-unnecessary=
-kqueue-check.patch
deleted file mode 100644
index 974f992de..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0009-Modify-config=
ure-to-prevent-unnecessary-kqueue-check.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From b0fb874a8921fa4ba2ea0923d779fae8f70c82b1 Mon Sep 17 00:00:00 2001
-From: Stephen Shkardoon <ss23@ss23.geek.nz>
-Date: Thu, 21 Jun 2018 14:38:30 +1200
-Subject: [PATCH] Modify configure to prevent unnecessary kqueue checks
-
-By only running the TORRENT_CHECK_KQUEUE_SOCKET_ONLY check if kqueue suppo=
rt
-is already detected, we increase the number of platforms that we can
-cross compile on.
-Otherwise, the cross compilation fails due to TORRENT_CHECK_KQUEUE_SOCKET_=
ONLY
-using AC_RUN_IFELSE, which fails during cross compilation.
----
- scripts/checks.m4 | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/scripts/checks.m4 b/scripts/checks.m4
-index 8d77fc5e..c9333561 100644
---- a/scripts/checks.m4
-+++ b/scripts/checks.m4
-@@ -88,6 +88,7 @@ AC_DEFUN([TORRENT_CHECK_KQUEUE], [
-     [
-       AC_DEFINE(USE_KQUEUE, 1, Use kqueue.)
-       AC_MSG_RESULT(yes)
-+      TORRENT_CHECK_KQUEUE_SOCKET_ONLY
-     ], [
-       AC_MSG_RESULT(no)
-     ])
-@@ -137,7 +138,6 @@ AC_DEFUN([TORRENT_WITH_KQUEUE], [
-     [
-         if test "$withval" =3D "yes"; then
-           TORRENT_CHECK_KQUEUE
--          TORRENT_CHECK_KQUEUE_SOCKET_ONLY
-         fi
-     ])
- ])
-@@ -149,11 +149,9 @@ AC_DEFUN([TORRENT_WITHOUT_KQUEUE], [
-     [
-       if test "$withval" =3D "yes"; then
-         TORRENT_CHECK_KQUEUE
--        TORRENT_CHECK_KQUEUE_SOCKET_ONLY
-       fi
-     ], [
-         TORRENT_CHECK_KQUEUE
--        TORRENT_CHECK_KQUEUE_SOCKET_ONLY
-     ])
- ])
-=20
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0010-Displa=
y-info-on-failed-tracker-bencode-parsing-See-9.patch b/meta-oe/recipes-conn=
ectivity/libtorrent/libtorrent/0010-Display-info-on-failed-tracker-bencode-=
parsing-See-9.patch
deleted file mode 100644
index 562cdae7a..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0010-Display-info-=
on-failed-tracker-bencode-parsing-See-9.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 4ff83fc53b2c7462b02f804ee20414d85944e3c9 Mon Sep 17 00:00:00 2001
-From: chros <chros@chrosGX620>
-Date: Sun, 14 May 2017 19:36:09 +0100
-Subject: [PATCH] Display info on failed tracker bencode parsing (See #9)
-
----
- rak/string_manip.h          | 20 ++++++++++++++++++++
- src/tracker/tracker_http.cc |  6 ++++--
- 2 files changed, 24 insertions(+), 2 deletions(-)
-
-diff --git a/rak/string_manip.h b/rak/string_manip.h
-index f8d3f590..68614d2a 100644
---- a/rak/string_manip.h
-+++ b/rak/string_manip.h
-@@ -371,6 +371,26 @@ is_all_name(const Sequence& src) {
-   return is_all_name(src.begin(), src.end());
- }
-=20
-+template <typename Iterator>
-+std::string
-+sanitize(Iterator first, Iterator last) {
-+  std::string dest;
-+  for (; first !=3D last; ++first) {
-+    if (std::isprint(*first) && *first !=3D '\r' && *first !=3D '\n' && *=
first !=3D '\t')
-+      dest +=3D *first;
-+    else
-+      dest +=3D " ";
-+  }
-+
-+  return dest;
-+}
-+
-+template <typename Sequence>
-+std::string
-+sanitize(const Sequence& src) {
-+    return trim(sanitize(src.begin(), src.end()));
-+}
-+
- }
-=20
- #endif
-diff --git a/src/tracker/tracker_http.cc b/src/tracker/tracker_http.cc
-index 553f922c..b6d9e0ac 100644
---- a/src/tracker/tracker_http.cc
-+++ b/src/tracker/tracker_http.cc
-@@ -288,8 +288,10 @@ TrackerHttp::receive_done() {
-   Object b;
-   *m_data >> b;
-=20
--  if (m_data->fail())
--    return receive_failed("Could not parse bencoded data");
-+  if (m_data->fail()) {
-+    std::string dump =3D m_data->str();
-+    return receive_failed("Could not parse bencoded data: " + rak::saniti=
ze(dump).substr(0,99));
-+  }
-=20
-   if (!b.is_map())
-     return receive_failed("Root not a bencoded map");
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0011-Strip-=
tags-also-when-displaying-info-on-failed-track.patch b/meta-oe/recipes-conn=
ectivity/libtorrent/libtorrent/0011-Strip-tags-also-when-displaying-info-on=
-failed-track.patch
deleted file mode 100644
index 7a8c9aa5a..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0011-Strip-tags-al=
so-when-displaying-info-on-failed-track.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 2f197be69057f793d29272b90300f74d0b588d51 Mon Sep 17 00:00:00 2001
-From: chros <chros@chrosGX620>
-Date: Mon, 15 May 2017 19:24:33 +0100
-Subject: [PATCH] Strip tags also when displaying info on failed tracker
- bencode parsing (See #9)
-
----
- rak/string_manip.h          | 25 +++++++++++++++++++++++++
- src/tracker/tracker_http.cc |  2 +-
- 2 files changed, 26 insertions(+), 1 deletion(-)
-
-diff --git a/rak/string_manip.h b/rak/string_manip.h
-index 68614d2a..ae867c98 100644
---- a/rak/string_manip.h
-+++ b/rak/string_manip.h
-@@ -391,6 +391,31 @@ sanitize(const Sequence& src) {
-     return trim(sanitize(src.begin(), src.end()));
- }
-=20
-+template <typename Iterator>
-+std::string striptags(Iterator first, Iterator last) {
-+  bool copychar =3D true;
-+  std::string dest;
-+
-+  for (; first !=3D last; ++first) {
-+    if (std::isprint(*first) && *first =3D=3D '<') {
-+      copychar =3D false;
-+    } else if (std::isprint(*first) && *first =3D=3D '>') {
-+      copychar =3D true;
-+      continue;
-+    }
-+
-+    if (copychar)
-+      dest +=3D *first;
-+  }
-+
-+  return dest;
-+}
-+
-+template <typename Sequence>
-+std::string striptags(const Sequence& src) {
-+    return striptags(src.begin(), src.end());
-+}
-+
- }
-=20
- #endif
-diff --git a/src/tracker/tracker_http.cc b/src/tracker/tracker_http.cc
-index b6d9e0ac..eefe5a17 100644
---- a/src/tracker/tracker_http.cc
-+++ b/src/tracker/tracker_http.cc
-@@ -290,7 +290,7 @@ TrackerHttp::receive_done() {
-=20
-   if (m_data->fail()) {
-     std::string dump =3D m_data->str();
--    return receive_failed("Could not parse bencoded data: " + rak::saniti=
ze(dump).substr(0,99));
-+    return receive_failed("Could not parse bencoded data: " + rak::saniti=
ze(rak::striptags(dump)).substr(0,99));
-   }
-=20
-   if (!b.is_map())
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0012-Switch=
-to-C-11-MRT-RNG-for-random-bytes.patch b/meta-oe/recipes-connectivity/libt=
orrent/libtorrent/0012-Switch-to-C-11-MRT-RNG-for-random-bytes.patch
deleted file mode 100644
index f4776247d..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0012-Switch-to-C-1=
1-MRT-RNG-for-random-bytes.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 0e86289a8bb5672781e508683bb28aebf9995127 Mon Sep 17 00:00:00 2001
-From: lps-rocks <admin@lps.rocks>
-Date: Mon, 4 Mar 2019 05:03:47 -0500
-Subject: [PATCH] Switch to C++11 MRT RNG for random bytes
-
-Switching to a better RNG for generating strings will prevent the common p=
eerID collisions the rTorrent client has been seeing for YEARS in #440 and =
#318.
----
- rak/string_manip.h | 12 +++++++++---
- 1 file changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/rak/string_manip.h b/rak/string_manip.h
-index ae867c98..1a09c377 100644
---- a/rak/string_manip.h
-+++ b/rak/string_manip.h
-@@ -39,9 +39,13 @@
-=20
- #include <algorithm>
- #include <cctype>
-+#include <climits>
- #include <cstdlib>
-+#include <functional>
- #include <iterator>
- #include <locale>
-+#include <random>
-+
-=20
- namespace rak {
-=20
-@@ -312,11 +316,13 @@ transform_hex_str(const Sequence& seq) {
- template <typename Sequence>
- Sequence
- generate_random(size_t length) {
-+  std::random_device rd;
-+  std::mt19937 mt(rd());
-+  using bytes_randomizer =3D std::independent_bits_engine<std::mt19937, C=
HAR_BIT, uint8_t>;
-+  bytes_randomizer bytes(mt);
-   Sequence s;
-   s.reserve(length);
--
--  std::generate_n(std::back_inserter(s), length, &::random);
--
-+  std::generate_n(std::back_inserter(s), length, std::ref(bytes));
-   return s;
- }
-=20
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0013-Preven=
t-loss-of-m_ipv6_socket-attribute-which-led-to.patch b/meta-oe/recipes-conn=
ectivity/libtorrent/libtorrent/0013-Prevent-loss-of-m_ipv6_socket-attribute=
-which-led-to.patch
deleted file mode 100644
index 1d4cc3e33..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0013-Prevent-loss-=
of-m_ipv6_socket-attribute-which-led-to.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From bf35c5f3d4e458a671fdc3c382f4fa06ecaeb119 Mon Sep 17 00:00:00 2001
-From: Vladyslav Movchan <vladislav.movchan@gmail.com>
-Date: Sat, 3 Nov 2018 19:52:56 +0200
-Subject: [PATCH] Prevent loss of 'm_ipv6_socket' attribute which led to
- execution of setsockopt(..., IPPROTO_IP, IP_TOS, ...) on IPv6 socket
-
----
- src/net/socket_fd.cc | 4 ++--
- src/net/socket_fd.h  | 1 +
- 2 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/src/net/socket_fd.cc b/src/net/socket_fd.cc
-index 54cb6ded..f04059f6 100644
---- a/src/net/socket_fd.cc
-+++ b/src/net/socket_fd.cc
-@@ -251,7 +251,7 @@ SocketFd::accept(rak::socket_address* sa) {
-   socklen_t len =3D sizeof(rak::socket_address);
-=20
-   if (sa =3D=3D NULL) {
--    return SocketFd(::accept(m_fd, NULL, &len));
-+    return SocketFd(::accept(m_fd, NULL, &len), m_ipv6_socket);
-   }
-=20
-   int fd =3D ::accept(m_fd, sa->c_sockaddr(), &len);
-@@ -260,7 +260,7 @@ SocketFd::accept(rak::socket_address* sa) {
-     *sa =3D sa->sa_inet6()->normalize_address();
-   }
-=20
--  return SocketFd(fd);
-+  return SocketFd(fd, m_ipv6_socket);
- }
-=20
- // unsigned int
-diff --git a/src/net/socket_fd.h b/src/net/socket_fd.h
-index ca765e88..2329b4e9 100644
---- a/src/net/socket_fd.h
-+++ b/src/net/socket_fd.h
-@@ -51,6 +51,7 @@ public:
-=20
-   SocketFd() : m_fd(-1) {}
-   explicit SocketFd(int fd) : m_fd(fd) {}
-+  SocketFd(int fd, bool ipv6_socket) : m_fd(fd), m_ipv6_socket(ipv6_socke=
t) {}
-=20
-   bool                is_valid() const                        { return m_=
fd >=3D 0; }
-  =20
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0014-If-dur=
ing-socket-creation-AF_INET6-failes-initialize.patch b/meta-oe/recipes-conn=
ectivity/libtorrent/libtorrent/0014-If-during-socket-creation-AF_INET6-fail=
es-initialize.patch
deleted file mode 100644
index 4bb1ed21c..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0014-If-during-soc=
ket-creation-AF_INET6-failes-initialize.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 1890bde5c051d932d1b2940e815d0c82964c474c Mon Sep 17 00:00:00 2001
-From: Gleb Smirnoff <glebius@FreeBSD.org>
-Date: Tue, 2 Oct 2018 18:57:43 -0700
-Subject: [PATCH] If during socket creation AF_INET6 failes initialize sock=
addr
- as AF_INET. Otherwise any bind(2) would fail due to sockaddr address fami=
ly
- not matching socket address family.
-
----
- src/net/listen.cc | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/src/net/listen.cc b/src/net/listen.cc
-index da1c2e84..d424e94c 100644
---- a/src/net/listen.cc
-+++ b/src/net/listen.cc
-@@ -75,7 +75,10 @@ Listen::open(uint16_t first, uint16_t last, int backlog=
, const rak::socket_addre
-=20
-   // TODO: Temporary until we refactor:
-   if (bindAddress->family() =3D=3D 0) {
--    sa.sa_inet6()->clear();
-+    if (m_ipv6_socket)
-+      sa.sa_inet6()->clear();
-+    else
-+      sa.sa_inet()->clear();
-   } else {
-     sa.copy(*bindAddress, bindAddress->length());
-   }
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0015-Fixes-=
https-github.com-rakshasa-rtorrent-issues-731.patch b/meta-oe/recipes-conne=
ctivity/libtorrent/libtorrent/0015-Fixes-https-github.com-rakshasa-rtorrent=
-issues-731.patch
deleted file mode 100644
index a33a0103b..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0015-Fixes-https-g=
ithub.com-rakshasa-rtorrent-issues-731.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From cbd946b6cad8c93b3d39ab4f338b3640f684cbfc Mon Sep 17 00:00:00 2001
-From: Adam Fontenot <adam.m.fontenot@gmail.com>
-Date: Sat, 7 Jul 2018 16:52:07 -0700
-Subject: [PATCH] Fixes https://github.com/rakshasa/rtorrent/issues/731
-
----
- src/tracker/tracker_http.cc | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/tracker/tracker_http.cc b/src/tracker/tracker_http.cc
-index eefe5a17..1bf94107 100644
---- a/src/tracker/tracker_http.cc
-+++ b/src/tracker/tracker_http.cc
-@@ -145,13 +145,13 @@ TrackerHttp::send_state(int state) {
-   if (!localAddress->is_address_any())
-     s << "&ip=3D" << localAddress->address_str();
-  =20
--  if (localAddress->is_address_any() || localAddress->family() !=3D rak::=
socket_address::pf_inet6) {
-+  if (localAddress->is_address_any() && localAddress->family() =3D=3D rak=
::socket_address::pf_inet) {
-     rak::socket_address local_v6;
-     if (get_local_address(rak::socket_address::af_inet6, &local_v6))
-       s << "&ipv6=3D" << rak::copy_escape_html(local_v6.address_str());
-   }
-=20
--  if (localAddress->is_address_any() || localAddress->family() !=3D rak::=
socket_address::pf_inet) {
-+  if (localAddress->is_address_any() && localAddress->family() =3D=3D rak=
::socket_address::pf_inet6) {
-     rak::socket_address local_v4;
-     if (get_local_address(rak::socket_address::af_inet, &local_v4))
-       s << "&ipv4=3D" << local_v4.address_str();
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0016-Fix-ho=
noring-throttle.min_peers-settings-in-rtorrent.patch b/meta-oe/recipes-conn=
ectivity/libtorrent/libtorrent/0016-Fix-honoring-throttle.min_peers-setting=
s-in-rtorrent.patch
deleted file mode 100644
index 6ef5f1ad4..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0016-Fix-honoring-=
throttle.min_peers-settings-in-rtorrent.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From d49316117401cff4045b1d1194cec60909e45555 Mon Sep 17 00:00:00 2001
-From: chros <chros@chrosGX620>
-Date: Sun, 13 May 2018 11:34:33 +0100
-Subject: [PATCH] Fix honoring throttle.min_peers* settings in rtorrent (Se=
e
- #13)
-
----
- src/download/download_main.cc | 17 ++++++-----------
- 1 file changed, 6 insertions(+), 11 deletions(-)
-
-diff --git a/src/download/download_main.cc b/src/download/download_main.cc
-index 48222c38..efe91d66 100644
---- a/src/download/download_main.cc
-+++ b/src/download/download_main.cc
-@@ -355,19 +355,14 @@ DownloadMain::receive_tracker_success() {
-=20
- void
- DownloadMain::receive_tracker_request() {
--  bool should_stop =3D false;
--  bool should_start =3D false;
-+  if (info()->is_pex_enabled() && info()->size_pex() > 0
-+      || connection_list()->size() + peer_list()->available_list()->size(=
) / 2 >=3D connection_list()->min_size()) {
-=20
--  if (info()->is_pex_enabled() && info()->size_pex() > 0)
--    should_stop =3D true;
--
--  if (connection_list()->size() + peer_list()->available_list()->size() /=
 2 < connection_list()->min_size())
--    should_start =3D true;
--
--  if (should_stop)
-     m_tracker_controller->stop_requesting();
--  else if (should_start)
--    m_tracker_controller->start_requesting();
-+    return;
-+  }
-+
-+  m_tracker_controller->start_requesting();
- }
-=20
- struct SocketAddressCompact_less {
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0017-increa=
se-piece-length-max.patch b/meta-oe/recipes-connectivity/libtorrent/libtorr=
ent/0017-increase-piece-length-max.patch
deleted file mode 100644
index 7108507a1..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0017-increase-piec=
e-length-max.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From 9fd2f35f86397b9259e0c9b7c54444c0ec3c8965 Mon Sep 17 00:00:00 2001
-From: adam <adam@shinka.sh>
-Date: Mon, 26 Feb 2018 16:04:34 +0200
-Subject: [PATCH] increase piece length max
-
----
- src/download/download_constructor.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/download/download_constructor.cc b/src/download/download_=
constructor.cc
-index 1bb261bd..67ef4276 100644
---- a/src/download/download_constructor.cc
-+++ b/src/download/download_constructor.cc
-@@ -157,7 +157,7 @@ DownloadConstructor::parse_info(const Object& b) {
-   } else {
-     chunkSize =3D b.get_key_value("piece length");
-=20
--    if (chunkSize <=3D (1 << 10) || chunkSize > (128 << 20))
-+    if (chunkSize <=3D (1 << 10) || chunkSize > (128 << 22))
-       throw input_error("Torrent has an invalid \"piece length\".");
-   }
-=20
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0018-Set-ma=
x-piece-size-512mb.patch b/meta-oe/recipes-connectivity/libtorrent/libtorre=
nt/0018-Set-max-piece-size-512mb.patch
deleted file mode 100644
index f864d23c3..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0018-Set-max-piece=
-size-512mb.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From b263b347f14b9d0ca54d04ca92367a98d791dc17 Mon Sep 17 00:00:00 2001
-From: Jari Sundell <sundell.software@gmail.com>
-Date: Sun, 9 Jun 2019 14:53:32 +0900
-Subject: [PATCH] Set max piece size 512mb.
-
----
- src/download/download_constructor.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/download/download_constructor.cc b/src/download/download_=
constructor.cc
-index 67ef4276..1bf362fa 100644
---- a/src/download/download_constructor.cc
-+++ b/src/download/download_constructor.cc
-@@ -157,7 +157,7 @@ DownloadConstructor::parse_info(const Object& b) {
-   } else {
-     chunkSize =3D b.get_key_value("piece length");
-=20
--    if (chunkSize <=3D (1 << 10) || chunkSize > (128 << 22))
-+    if (chunkSize <=3D (1 << 10) || chunkSize > (512 << 20))
-       throw input_error("Torrent has an invalid \"piece length\".");
-   }
-=20
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0019-Fixed-=
compiler-warning.patch b/meta-oe/recipes-connectivity/libtorrent/libtorrent=
/0019-Fixed-compiler-warning.patch
deleted file mode 100644
index 0a06a2688..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0019-Fixed-compile=
r-warning.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From cdfb4381bedb278dabb8ca75c10858d16b895355 Mon Sep 17 00:00:00 2001
-From: Jari Sundell <sundell.software@gmail.com>
-Date: Sun, 9 Jun 2019 14:55:44 +0900
-Subject: [PATCH] Fixed compiler warning.
-
----
- src/download/download_main.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/download/download_main.cc b/src/download/download_main.cc
-index efe91d66..9a3f9df2 100644
---- a/src/download/download_main.cc
-+++ b/src/download/download_main.cc
-@@ -355,7 +355,7 @@ DownloadMain::receive_tracker_success() {
-=20
- void
- DownloadMain::receive_tracker_request() {
--  if (info()->is_pex_enabled() && info()->size_pex() > 0
-+  if ((info()->is_pex_enabled() && info()->size_pex()) > 0
-       || connection_list()->size() + peer_list()->available_list()->size(=
) / 2 >=3D connection_list()->min_size()) {
-=20
-     m_tracker_controller->stop_requesting();
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0020-Added-=
_GNU_SOURCE-to-fallocate-test.-neheb.patch b/meta-oe/recipes-connectivity/l=
ibtorrent/libtorrent/0020-Added-_GNU_SOURCE-to-fallocate-test.-neheb.patch
deleted file mode 100644
index 0f183816c..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0020-Added-_GNU_SO=
URCE-to-fallocate-test.-neheb.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 8934703edb5982661483eb8a29d76e6a726b5fe2 Mon Sep 17 00:00:00 2001
-From: rakshasa <sundell.software@gmail.com>
-Date: Mon, 8 Jul 2019 19:37:06 +0200
-Subject: [PATCH] Added _GNU_SOURCE to fallocate test. (neheb)
-
----
- scripts/checks.m4       | 10 ++++++----
- src/data/socket_file.cc |  1 +
- 2 files changed, 7 insertions(+), 4 deletions(-)
-
-diff --git a/scripts/checks.m4 b/scripts/checks.m4
-index c9333561..83be8461 100644
---- a/scripts/checks.m4
-+++ b/scripts/checks.m4
-@@ -88,7 +88,6 @@ AC_DEFUN([TORRENT_CHECK_KQUEUE], [
-     [
-       AC_DEFINE(USE_KQUEUE, 1, Use kqueue.)
-       AC_MSG_RESULT(yes)
--      TORRENT_CHECK_KQUEUE_SOCKET_ONLY
-     ], [
-       AC_MSG_RESULT(no)
-     ])
-@@ -97,7 +96,7 @@ AC_DEFUN([TORRENT_CHECK_KQUEUE], [
- AC_DEFUN([TORRENT_CHECK_KQUEUE_SOCKET_ONLY], [
-   AC_MSG_CHECKING(whether kqueue supports pipes and ptys)
-=20
--  AC_RUN_IFELSE([AC_LANG_SOURCE([
-+  AC_LINK_IFELSE([AC_LANG_SOURCE([
-       #include <fcntl.h>
-       #include <stdlib.h>
-       #include <unistd.h>
-@@ -138,6 +137,7 @@ AC_DEFUN([TORRENT_WITH_KQUEUE], [
-     [
-         if test "$withval" =3D "yes"; then
-           TORRENT_CHECK_KQUEUE
-+          TORRENT_CHECK_KQUEUE_SOCKET_ONLY
-         fi
-     ])
- ])
-@@ -149,9 +149,11 @@ AC_DEFUN([TORRENT_WITHOUT_KQUEUE], [
-     [
-       if test "$withval" =3D "yes"; then
-         TORRENT_CHECK_KQUEUE
-+        TORRENT_CHECK_KQUEUE_SOCKET_ONLY
-       fi
-     ], [
-         TORRENT_CHECK_KQUEUE
-+        TORRENT_CHECK_KQUEUE_SOCKET_ONLY
-     ])
- ])
-=20
-@@ -172,8 +174,8 @@ AC_DEFUN([TORRENT_WITHOUT_VARIABLE_FDSET], [
- AC_DEFUN([TORRENT_CHECK_FALLOCATE], [
-   AC_MSG_CHECKING(for fallocate)
-=20
--  AC_TRY_LINK([#include <fcntl.h>
--               #include <linux/falloc.h>
-+  AC_TRY_LINK([#define _GNU_SOURCE
-+               #include <fcntl.h>
-               ],[ fallocate(0, FALLOC_FL_KEEP_SIZE, 0, 0); return 0;
-               ],
-     [
-diff --git a/src/data/socket_file.cc b/src/data/socket_file.cc
-index 4b4519ed..b359ef8e 100644
---- a/src/data/socket_file.cc
-+++ b/src/data/socket_file.cc
-@@ -48,6 +48,7 @@
- #include <sys/types.h>
-=20
- #ifdef HAVE_FALLOCATE
-+#define _GNU_SOURCE
- #include <linux/falloc.h>
- #endif
-=20
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0021-Fixed-=
diffie-hellman-implementation.patch b/meta-oe/recipes-connectivity/libtorre=
nt/libtorrent/0021-Fixed-diffie-hellman-implementation.patch
deleted file mode 100644
index ad9e45758..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0021-Fixed-diffie-=
hellman-implementation.patch
+++ /dev/null
@@ -1,293 +0,0 @@
-From 856d42e2ca3c9810bf84a8bce219000e822540fa Mon Sep 17 00:00:00 2001
-From: rakshasa <sundell.software@gmail.com>
-Date: Fri, 12 Jul 2019 00:29:35 +0200
-Subject: [PATCH] Fixed diffie hellman implementation.
-
----
- src/utils/diffie_hellman.cc | 137 ++++++++++++------------------------
- src/utils/diffie_hellman.h  |  67 ++++--------------
- 2 files changed, 59 insertions(+), 145 deletions(-)
-
-diff --git a/src/utils/diffie_hellman.cc b/src/utils/diffie_hellman.cc
-index 7ec13165..d53a857b 100644
---- a/src/utils/diffie_hellman.cc
-+++ b/src/utils/diffie_hellman.cc
-@@ -1,118 +1,79 @@
--// libTorrent - BitTorrent library
--// Copyright (C) 2005-2011, Jari Sundell
--//
--// This program is free software; you can redistribute it and/or modify
--// it under the terms of the GNU General Public License as published by
--// the Free Software Foundation; either version 2 of the License, or
--// (at your option) any later version.
--//=20
--// This program is distributed in the hope that it will be useful,
--// but WITHOUT ANY WARRANTY; without even the implied warranty of
--// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--// GNU General Public License for more details.
--//=20
--// You should have received a copy of the GNU General Public License
--// along with this program; if not, write to the Free Software
--// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
--//
--// In addition, as a special exception, the copyright holders give
--// permission to link the code of portions of this program with the
--// OpenSSL library under certain conditions as described in each
--// individual source file, and distribute linked combinations
--// including the two.
--//
--// You must obey the GNU General Public License in all respects for
--// all of the code used other than OpenSSL.  If you modify file(s)
--// with this exception, you may extend this exception to your version
--// of the file(s), but you are not obligated to do so.  If you do not
--// wish to do so, delete this exception statement from your version.
--// If you delete this exception statement from all source files in the
--// program, then also delete it here.
--//
--// Contact:  Jari Sundell <jaris@ifi.uio.no>
--//
--//           Skomakerveien 33
--//           3185 Skoppum, NORWAY
--
- #include "config.h"
-=20
-+#include "diffie_hellman.h"
-+
-+#include "torrent/exceptions.h"
-+
- #include <cstring>
--#include <string>
-=20
- #ifdef USE_OPENSSL
-+#include <openssl/dh.h>
- #include <openssl/bn.h>
- #endif
-=20
--#include "diffie_hellman.h"
--#include "torrent/exceptions.h"
--
- namespace torrent {
-=20
--#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
--DiffieHellman::DiffieHellman(const unsigned char *prime, int primeLength,
--                             const unsigned char *generator, int generato=
rLength) :
--  m_secret(NULL), m_size(0) {
--
- #ifdef USE_OPENSSL
-=20
--  m_dh =3D DH_new();
--
--#ifdef USE_OPENSSL_1_1
--  BIGNUM * const dh_p =3D BN_bin2bn(prime, primeLength, NULL);
--  BIGNUM * const dh_g =3D BN_bin2bn(generator, generatorLength, NULL);
-+static void      dh_free(void* dh) { DH_free(reinterpret_cast<DH*>(dh)); =
}
-+static DiffieHellman::dh_ptr dh_new() { return DiffieHellman::dh_ptr(rein=
terpret_cast<void*>(DH_new()), &dh_free); }
-+static DH*       dh_get(DiffieHellman::dh_ptr& dh) { return reinterpret_c=
ast<DH*>(dh.get()); }
-=20
--  if (dh_p =3D=3D NULL || dh_g =3D=3D NULL ||
--      !DH_set0_pqg(m_dh, dh_p, NULL, dh_g))
--	  throw internal_error("Could not generate Diffie-Hellman parameters");
-+static bool
-+dh_set_pg(DiffieHellman::dh_ptr& dh, BIGNUM* dh_p, BIGNUM* dh_g) {
-+#if OPENSSL_VERSION_NUMBER >=3D 0x10100000L
-+  return DH_set0_pqg(reinterpret_cast<DH*>(dh.get()), dh_p, nullptr, dh_g=
);
- #else
--  m_dh->p =3D BN_bin2bn(prime, primeLength, NULL);
--  m_dh->g =3D BN_bin2bn(generator, generatorLength, NULL);
-+  reinterpret_cast<DH*>(dh.get())->p =3D dh_p;
-+  reinterpret_cast<DH*>(dh.get())->g =3D dh_g;
-+  return true;
- #endif
-+}
-=20
--  DH_generate_key(m_dh);
--
-+static const BIGNUM* dh_get_pub_key(const DiffieHellman::dh_ptr& dh) {
-+#if OPENSSL_VERSION_NUMBER >=3D 0x10100000L
-+  const BIGNUM *pub_key;
-+  DH_get0_key(reinterpret_cast<DH*>(dh.get()), &pub_key, nullptr);
-+  return pub_key;
- #else
--  throw internal_error("Compiled without encryption support.");
-+  return dh !=3D nullptr ? reinterpret_cast<DH*>(dh.get())->pub_key : nul=
lptr;
- #endif
--};
-+}
-=20
--DiffieHellman::~DiffieHellman() {
--  delete [] m_secret;
--#ifdef USE_OPENSSL
--  DH_free(m_dh);
-+#else
-+static DiffieHellman::dh_ptr dh_new() { throw internal_error("Compiled wi=
thout encryption support."); }
-+static void  dh_free(void* dh) {}
-+static void* dh_get_pub_key(const DiffieHellman::dh_ptr& dh) { return nul=
lptr; }
- #endif
--};
-=20
--bool
--DiffieHellman::is_valid() const {
--#ifdef USE_OPENSSL
--  if (m_dh =3D=3D NULL)
--    return false;
-+#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
-+DiffieHellman::DiffieHellman(const unsigned char *prime, int primeLength,
-+                             const unsigned char *generator, int generato=
rLength) :
-+  m_dh(dh_new()), m_size(0) {
-=20
--#ifdef USE_OPENSSL_1_1
--  const BIGNUM *pub_key;
-+#ifdef USE_OPENSSL
-+  BIGNUM* dh_p =3D BN_bin2bn(prime, primeLength, nullptr);
-+  BIGNUM* dh_g =3D BN_bin2bn(generator, generatorLength, nullptr);
-=20
--  DH_get0_key(m_dh, &pub_key, NULL);
-+  if (dh_p =3D=3D nullptr || dh_g =3D=3D nullptr || !dh_set_pg(m_dh, dh_p=
, dh_g))
-+    throw internal_error("Could not generate Diffie-Hellman parameters");
-=20
--  return pub_key !=3D NULL;
--#else
--  return m_dh !=3D NULL && m_dh->pub_key !=3D NULL;
-+  DH_generate_key(dh_get(m_dh));
- #endif
-+};
-=20
--#else
--  return false;
--#endif
-+bool
-+DiffieHellman::is_valid() const {
-+  return dh_get_pub_key(m_dh) !=3D nullptr;
- }
-=20
- bool
- DiffieHellman::compute_secret(const unsigned char *pubkey, unsigned int l=
ength) {
- #ifdef USE_OPENSSL
--  BIGNUM* k =3D BN_bin2bn(pubkey, length, NULL);
-+  BIGNUM* k =3D BN_bin2bn(pubkey, length, nullptr);
-=20
--  delete [] m_secret;
--  m_secret =3D new char[DH_size(m_dh)];
--
--  m_size =3D DH_compute_key((unsigned char*)m_secret, k, m_dh);
-+  m_secret.reset(new char[DH_size(dh_get(m_dh))]);
-+  m_size =3D DH_compute_key(reinterpret_cast<unsigned char*>(m_secret.get=
()), k, dh_get(m_dh));
-  =20
-   BN_free(k);
-=20
-@@ -124,16 +85,10 @@ DiffieHellman::compute_secret(const unsigned char *pu=
bkey, unsigned int length)
-=20
- void
- DiffieHellman::store_pub_key(unsigned char* dest, unsigned int length) {
--#ifdef USE_OPENSSL
-   std::memset(dest, 0, length);
-=20
--  const BIGNUM *pub_key;
--
--#ifdef USE_OPENSSL_1_1
--  DH_get0_key(m_dh, &pub_key, NULL);
--#else
--  pub_key =3D m_dh->pub_key;
--#endif
-+#ifdef USE_OPENSSL
-+  const BIGNUM *pub_key =3D dh_get_pub_key(m_dh);
-=20
-   if ((int)length >=3D BN_num_bytes(pub_key))
-     BN_bn2bin(pub_key, dest + length - BN_num_bytes(pub_key));
-diff --git a/src/utils/diffie_hellman.h b/src/utils/diffie_hellman.h
-index 432542be..2cec5bee 100644
---- a/src/utils/diffie_hellman.h
-+++ b/src/utils/diffie_hellman.h
-@@ -1,79 +1,38 @@
--// libTorrent - BitTorrent library
--// Copyright (C) 2005-2011, Jari Sundell
--//
--// This program is free software; you can redistribute it and/or modify
--// it under the terms of the GNU General Public License as published by
--// the Free Software Foundation; either version 2 of the License, or
--// (at your option) any later version.
--//=20
--// This program is distributed in the hope that it will be useful,
--// but WITHOUT ANY WARRANTY; without even the implied warranty of
--// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--// GNU General Public License for more details.
--//=20
--// You should have received a copy of the GNU General Public License
--// along with this program; if not, write to the Free Software
--// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
--//
--// In addition, as a special exception, the copyright holders give
--// permission to link the code of portions of this program with the
--// OpenSSL library under certain conditions as described in each
--// individual source file, and distribute linked combinations
--// including the two.
--//
--// You must obey the GNU General Public License in all respects for
--// all of the code used other than OpenSSL.  If you modify file(s)
--// with this exception, you may extend this exception to your version
--// of the file(s), but you are not obligated to do so.  If you do not
--// wish to do so, delete this exception statement from your version.
--// If you delete this exception statement from all source files in the
--// program, then also delete it here.
--//
--// Contact:  Jari Sundell <jaris@ifi.uio.no>
--//
--//           Skomakerveien 33
--//           3185 Skoppum, NORWAY
--
- #ifndef LIBTORRENT_DIFFIE_HELLMAN_H
- #define LIBTORRENT_DIFFIE_HELLMAN_H
-=20
- #include "config.h"
-=20
-+#include <memory>
- #include <string>
-=20
--#ifdef USE_OPENSSL
--#include <openssl/dh.h>
--#endif
--
- namespace torrent {
-=20
- class DiffieHellman {
- public:
-+  typedef std::unique_ptr<char[]> secret_ptr;
-+  typedef std::unique_ptr<void, void (*)(void*)> dh_ptr;
-+
-   DiffieHellman(const unsigned char prime[], int primeLength,
-                 const unsigned char generator[], int generatorLength);
--  ~DiffieHellman();
-=20
--  bool                compute_secret(const unsigned char pubkey[], unsign=
ed int length);
--  void                store_pub_key(unsigned char* dest, unsigned int len=
gth);
-+  bool         is_valid() const;
-=20
--  bool                is_valid() const;
-+  bool         compute_secret(const unsigned char pubkey[], unsigned int =
length);
-+  void         store_pub_key(unsigned char* dest, unsigned int length);
-=20
--  unsigned int        size() const         { return m_size; }
-+  unsigned int size() const         { return m_size; }
-=20
--  const char*         c_str() const        { return m_secret; }
--  std::string         secret_str() const   { return std::string(m_secret,=
 m_size); }
-+  const char*  c_str() const        { return m_secret.get(); }
-+  std::string  secret_str() const   { return std::string(m_secret.get(), =
m_size); }
-=20
- private:
-   DiffieHellman(const DiffieHellman& dh);
-   DiffieHellman& operator =3D (const DiffieHellman& dh);
-=20
--#ifdef USE_OPENSSL
--  DH*                 m_dh;
--#else
--  void*               m_void;
--#endif
--  char*               m_secret;
--  unsigned int        m_size;
-+  dh_ptr       m_dh;
-+  secret_ptr   m_secret;
-+  int          m_size;
- };
-=20
- };
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0022-Increa=
sed-max-timeout-for-tracker-requests.patch b/meta-oe/recipes-connectivity/l=
ibtorrent/libtorrent/0022-Increased-max-timeout-for-tracker-requests.patch
deleted file mode 100644
index 66f43f0ce..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0022-Increased-max=
-timeout-for-tracker-requests.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 660bbc17e32c518c2727607ee5b73039c7109207 Mon Sep 17 00:00:00 2001
-From: rakshasa <sundell.software@gmail.com>
-Date: Sat, 13 Jul 2019 00:07:43 +0200
-Subject: [PATCH] Increased max timeout for tracker requests.
-
----
- src/torrent/tracker.h | 40 ++--------------------------------------
- 1 file changed, 2 insertions(+), 38 deletions(-)
-
-diff --git a/src/torrent/tracker.h b/src/torrent/tracker.h
-index 2b00ad47..a528ef6a 100644
---- a/src/torrent/tracker.h
-+++ b/src/torrent/tracker.h
-@@ -1,39 +1,3 @@
--// libTorrent - BitTorrent library
--// Copyright (C) 2005-2011, Jari Sundell
--//
--// This program is free software; you can redistribute it and/or modify
--// it under the terms of the GNU General Public License as published by
--// the Free Software Foundation; either version 2 of the License, or
--// (at your option) any later version.
--//=20
--// This program is distributed in the hope that it will be useful,
--// but WITHOUT ANY WARRANTY; without even the implied warranty of
--// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--// GNU General Public License for more details.
--//=20
--// You should have received a copy of the GNU General Public License
--// along with this program; if not, write to the Free Software
--// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
--//
--// In addition, as a special exception, the copyright holders give
--// permission to link the code of portions of this program with the
--// OpenSSL library under certain conditions as described in each
--// individual source file, and distribute linked combinations
--// including the two.
--//
--// You must obey the GNU General Public License in all respects for
--// all of the code used other than OpenSSL.  If you modify file(s)
--// with this exception, you may extend this exception to your version
--// of the file(s), but you are not obligated to do so.  If you do not
--// wish to do so, delete this exception statement from your version.
--// If you delete this exception statement from all source files in the
--// program, then also delete it here.
--//
--// Contact:  Jari Sundell <jaris@ifi.uio.no>
--//
--//           Skomakerveien 33
--//           3185 Skoppum, NORWAY
--
- #ifndef LIBTORRENT_TRACKER_H
- #define LIBTORRENT_TRACKER_H
-=20
-@@ -148,8 +112,8 @@ protected:
-=20
-   void                set_group(uint32_t v)                 { m_group =3D=
 v; }
-=20
--  void                set_normal_interval(int v)            { m_normal_in=
terval =3D std::min(std::max(600, v), 3600); }
--  void                set_min_interval(int v)               { m_min_inter=
val =3D std::min(std::max(300, v), 1800); }
-+  void                set_normal_interval(int v)            { m_normal_in=
terval =3D std::min(std::max(600, v), 8 * 3600); }
-+  void                set_min_interval(int v)               { m_min_inter=
val =3D std::min(std::max(300, v), 4 * 3600); }
-=20
-   int                 m_flags;
-=20
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0023-Close-=
log-files-when-reusing-a-name.patch b/meta-oe/recipes-connectivity/libtorre=
nt/libtorrent/0023-Close-log-files-when-reusing-a-name.patch
deleted file mode 100644
index 885b1828d..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0023-Close-log-fil=
es-when-reusing-a-name.patch
+++ /dev/null
@@ -1,123 +0,0 @@
-From efc75948253c1a8db482daabf45d9eabaaf4b099 Mon Sep 17 00:00:00 2001
-From: rakshasa <sundell.software@gmail.com>
-Date: Wed, 17 Jul 2019 19:41:04 +0200
-Subject: [PATCH] Close log files when reusing a name.
-
----
- src/torrent/utils/log.cc             | 20 ++++++++++++++++----
- src/torrent/utils/log.h              |  7 +++++++
- test/torrent/tracker_timeout_test.cc |  8 ++++----
- test/torrent/utils/log_test.cc       | 12 ++++++------
- 4 files changed, 33 insertions(+), 14 deletions(-)
-
-diff --git a/src/torrent/utils/log.cc b/src/torrent/utils/log.cc
-index 58b563a6..5169a730 100644
---- a/src/torrent/utils/log.cc
-+++ b/src/torrent/utils/log.cc
-@@ -294,12 +294,16 @@ log_open_output(const char* name, log_slot slot) {
-     throw input_error("Cannot open more than 64 log output handlers.");
-   }
-  =20
--  if (log_find_output_name(name) !=3D log_outputs.end()) {
--    pthread_mutex_unlock(&log_mutex);
--    throw input_error("Log name already used.");
-+  log_output_list::iterator itr =3D log_find_output_name(name);
-+
-+  if (itr =3D=3D log_outputs.end()) {
-+    log_outputs.push_back(std::make_pair(name, slot));
-+  } else {
-+    // by replacing the "write" slot binding, the old file gets closed
-+    // (handles are shared pointers)
-+    itr->second =3D slot;
-   }
-=20
--  log_outputs.push_back(std::make_pair(name, slot));
-   log_rebuild_cache();
-=20
-   pthread_mutex_unlock(&log_mutex);
-@@ -307,6 +311,14 @@ log_open_output(const char* name, log_slot slot) {
-=20
- void
- log_close_output(const char* name) {
-+  pthread_mutex_lock(&log_mutex);
-+
-+  log_output_list::iterator itr =3D log_find_output_name(name);
-+
-+  if (itr !=3D log_outputs.end())
-+    log_outputs.erase(itr);
-+
-+  pthread_mutex_unlock(&log_mutex);
- }
-=20
- void
-diff --git a/src/torrent/utils/log.h b/src/torrent/utils/log.h
-index a053d6ec..430bda5e 100644
---- a/src/torrent/utils/log.h
-+++ b/src/torrent/utils/log.h
-@@ -229,6 +229,7 @@ void log_cleanup() LIBTORRENT_EXPORT;
-=20
- void log_open_output(const char* name, log_slot slot) LIBTORRENT_EXPORT;
- void log_close_output(const char* name) LIBTORRENT_EXPORT;
-+void log_close_output_str(const std::string name) LIBTORRENT_EXPORT;
-=20
- void log_add_group_output(int group, const char* name) LIBTORRENT_EXPORT;
- void log_remove_group_output(int group, const char* name) LIBTORRENT_EXPO=
RT;
-@@ -240,6 +241,12 @@ void        log_open_file_output(const char* name, co=
nst char* filename) LIBTORR
- void        log_open_gz_file_output(const char* name, const char* filenam=
e) LIBTORRENT_EXPORT;
- log_buffer* log_open_log_buffer(const char* name) LIBTORRENT_EXPORT;
-=20
-+//
-+// Implementation:
-+//
-+
-+inline void log_close_output_str(const std::string name) { log_close_outp=
ut(name.c_str()); }
-+
- }
-=20
- #endif
-diff --git a/test/torrent/tracker_timeout_test.cc b/test/torrent/tracker_t=
imeout_test.cc
-index 081b9301..cd060006 100644
---- a/test/torrent/tracker_timeout_test.cc
-+++ b/test/torrent/tracker_timeout_test.cc
-@@ -29,13 +29,13 @@ tracker_timeout_test::test_set_timeout() {
-=20
-   tracker.set_new_normal_interval(100);
-   CPPUNIT_ASSERT(tracker.normal_interval() =3D=3D 600);
--  tracker.set_new_normal_interval(4000);
--  CPPUNIT_ASSERT(tracker.normal_interval() =3D=3D 3600);
-+  tracker.set_new_normal_interval(8 * 4000);
-+  CPPUNIT_ASSERT(tracker.normal_interval() =3D=3D 8 * 3600);
-=20
-   tracker.set_new_min_interval(100);
-   CPPUNIT_ASSERT(tracker.min_interval() =3D=3D 300);
--  tracker.set_new_min_interval(4000);
--  CPPUNIT_ASSERT(tracker.min_interval() =3D=3D 1800);
-+  tracker.set_new_min_interval(4 * 4000);
-+  CPPUNIT_ASSERT(tracker.min_interval() =3D=3D 4 * 3600);
- }
-=20
- void
-diff --git a/test/torrent/utils/log_test.cc b/test/torrent/utils/log_test.=
cc
-index 9b99c245..24c22b59 100644
---- a/test/torrent/utils/log_test.cc
-+++ b/test/torrent/utils/log_test.cc
-@@ -75,13 +75,13 @@ utils_log_test::test_output_open() {
-   // Test inserting duplicate names, should catch.
-   // CPPUNIT_ASSERT_THROW(torrent::log_open_output("test_output_1", torre=
nt::log_slot());, torrent::input_error);
-=20
--  try {
--    torrent::log_open_output("test_output_1", torrent::log_slot());
--  } catch (torrent::input_error& e) {
--    return;
--  }
-+  // try {
-+  //   torrent::log_open_output("test_output_1", torrent::log_slot());
-+  // } catch (torrent::input_error& e) {
-+  //   return;
-+  // }
-=20
--  CPPUNIT_ASSERT(false);
-+  // CPPUNIT_ASSERT(false);
-=20
-   // Test more than 64 entries.
- }
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0024-Bumped=
-to-version-0.13.8.patch b/meta-oe/recipes-connectivity/libtorrent/libtorre=
nt/0024-Bumped-to-version-0.13.8.patch
deleted file mode 100644
index ffe6b3f22..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0024-Bumped-to-ver=
sion-0.13.8.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 7faa9c58ce098bbdeff83b6add72f3075b47881d Mon Sep 17 00:00:00 2001
-From: rakshasa <sundell.software@gmail.com>
-Date: Fri, 19 Jul 2019 13:38:12 +0200
-Subject: [PATCH] Bumped to version 0.13.8.
-
----
- configure.ac | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index b885714d..4ed08124 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1,12 +1,12 @@
--AC_INIT(libtorrent, 0.13.7, sundell.software@gmail.com)
-+AC_INIT(libtorrent, 0.13.8, sundell.software@gmail.com)
-=20
- LT_INIT([disable-static])
-=20
- dnl Find a better way to do this
--AC_DEFINE(PEER_NAME, "-lt0D70-", Identifier that is part of the default p=
eer id)
--AC_DEFINE(PEER_VERSION, "lt\x0D\x70", 4 byte client and version identifie=
r for DHT)
-+AC_DEFINE(PEER_NAME, "-lt0D80-", Identifier that is part of the default p=
eer id)
-+AC_DEFINE(PEER_VERSION, "lt\x0D\x80", 4 byte client and version identifie=
r for DHT)
-=20
--LIBTORRENT_CURRENT=3D20
-+LIBTORRENT_CURRENT=3D21
- LIBTORRENT_REVISION=3D0
- LIBTORRENT_AGE=3D0
-=20
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0025-Allow-=
logs-to-be-appended-rather-than-overwritten.patch b/meta-oe/recipes-connect=
ivity/libtorrent/libtorrent/0025-Allow-logs-to-be-appended-rather-than-over=
written.patch
deleted file mode 100644
index c8884d856..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0025-Allow-logs-to=
-be-appended-rather-than-overwritten.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From 7667094274879fe158e718bf2765d35f82d924bd Mon Sep 17 00:00:00 2001
-From: nicholi <nschell@gmail.com>
-Date: Tue, 23 Jul 2019 23:59:16 -0700
-Subject: [PATCH] Allow logs to be appended rather than overwritten.
-
----
- src/torrent/utils/log.cc       | 13 +++++++++++++
- src/torrent/utils/log.h        |  1 +
- test/torrent/utils/log_test.cc | 35 ++++++++++++++++++++++++++++++++++
- test/torrent/utils/log_test.h  |  2 ++
- 4 files changed, 51 insertions(+)
-
-diff --git a/src/torrent/utils/log.cc b/src/torrent/utils/log.cc
-index 5169a730..a900c109 100644
---- a/src/torrent/utils/log.cc
-+++ b/src/torrent/utils/log.cc
-@@ -428,6 +428,19 @@ log_open_file_output(const char* name, const char* fi=
lename) {
-                                   std::placeholders::_3));
- }
-=20
-+void
-+log_open_file_output_append(const char* name, const char* filename) {
-+  std::shared_ptr<std::ofstream> outfile(new std::ofstream(filename, std:=
:ofstream::out | std::ofstream::app));
-+
-+  if (!outfile->good())
-+    throw input_error("Could not open log file '" + std::string(filename)=
 + "'.");
-+
-+  log_open_output(name, std::bind(&log_file_write, outfile,
-+                                  std::placeholders::_1,
-+                                  std::placeholders::_2,
-+                                  std::placeholders::_3));
-+}
-+
- void
- log_open_gz_file_output(const char* name, const char* filename) {
-   std::shared_ptr<log_gz_output> outfile(new log_gz_output(filename));
-diff --git a/src/torrent/utils/log.h b/src/torrent/utils/log.h
-index 430bda5e..531c8565 100644
---- a/src/torrent/utils/log.h
-+++ b/src/torrent/utils/log.h
-@@ -238,6 +238,7 @@ void log_add_child(int group, int child) LIBTORRENT_EX=
PORT;
- void log_remove_child(int group, int child) LIBTORRENT_EXPORT;
-=20
- void        log_open_file_output(const char* name, const char* filename) =
LIBTORRENT_EXPORT;
-+void        log_open_file_output_append(const char* name, const char* fil=
ename) LIBTORRENT_EXPORT;
- void        log_open_gz_file_output(const char* name, const char* filenam=
e) LIBTORRENT_EXPORT;
- log_buffer* log_open_log_buffer(const char* name) LIBTORRENT_EXPORT;
-=20
-diff --git a/test/torrent/utils/log_test.cc b/test/torrent/utils/log_test.=
cc
-index 24c22b59..aa13fff8 100644
---- a/test/torrent/utils/log_test.cc
-+++ b/test/torrent/utils/log_test.cc
-@@ -155,3 +155,38 @@ utils_log_test::test_file_output() {
-=20
-   CPPUNIT_ASSERT_MESSAGE(buffer, std::string(buffer).find("test_file") !=
=3D std::string::npos);
- }
-+
-+void
-+utils_log_test::test_file_output_append() {
-+  std::string filename =3D "utils_log_test.XXXXXX";
-+
-+  mktemp(&*filename.begin());
-+
-+  torrent::log_open_file_output_append("test_file", filename.c_str());
-+  torrent::log_add_group_output(GROUP_PARENT_1, "test_file");
-+
-+  lt_log_print(GROUP_PARENT_1, "test_line_1");
-+
-+  torrent::log_cleanup(); // To ensure we flush the buffers.
-+
-+  // re-open and write 2nd line
-+  torrent::log_open_file_output_append("test_file", filename.c_str());
-+  torrent::log_add_group_output(GROUP_PARENT_1, "test_file");
-+
-+  lt_log_print(GROUP_PARENT_1, "test_line_2");
-+
-+  torrent::log_cleanup(); // To ensure we flush the buffers.
-+
-+  std::ifstream temp_file(filename.c_str());
-+
-+  CPPUNIT_ASSERT(temp_file.good());
-+
-+  char buffer_line1[256];
-+  temp_file.getline(buffer_line1, 256);
-+
-+  char buffer_line2[256];
-+  temp_file.getline(buffer_line2, 256);
-+
-+  CPPUNIT_ASSERT_MESSAGE(buffer_line1, std::string(buffer_line1).find("te=
st_line_1") !=3D std::string::npos);
-+  CPPUNIT_ASSERT_MESSAGE(buffer_line2, std::string(buffer_line2).find("te=
st_line_2") !=3D std::string::npos);
-+}
-diff --git a/test/torrent/utils/log_test.h b/test/torrent/utils/log_test.h
-index 3a66cc24..d4cb3bc6 100644
---- a/test/torrent/utils/log_test.h
-+++ b/test/torrent/utils/log_test.h
-@@ -10,6 +10,7 @@ class utils_log_test : public CppUnit::TestFixture {
-   CPPUNIT_TEST(test_print);
-   CPPUNIT_TEST(test_children);
-   CPPUNIT_TEST(test_file_output);
-+  CPPUNIT_TEST(test_file_output_append);
-   CPPUNIT_TEST_SUITE_END();
-=20
- public:
-@@ -22,4 +23,5 @@ public:
-   void test_print();
-   void test_children();
-   void test_file_output();
-+  void test_file_output_append();
- };
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0026-Remove=
d-log-append-function.-Added-append-parameter-.patch b/meta-oe/recipes-conn=
ectivity/libtorrent/libtorrent/0026-Removed-log-append-function.-Added-appe=
nd-parameter-.patch
deleted file mode 100644
index 9859f954c..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0026-Removed-log-a=
ppend-function.-Added-append-parameter-.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-From df54913c34c8b584d6d2072a65ad1590766780c5 Mon Sep 17 00:00:00 2001
-From: nicholi <nschell@gmail.com>
-Date: Fri, 26 Jul 2019 00:50:52 -0700
-Subject: [PATCH] Removed log append function. Added append parameter with
- default value (false) to log_open_file functions.
-
----
- src/torrent/utils/log.cc       | 26 ++++++++------------------
- src/torrent/utils/log.h        |  5 ++---
- test/torrent/utils/log_test.cc |  4 ++--
- 3 files changed, 12 insertions(+), 23 deletions(-)
-
-diff --git a/src/torrent/utils/log.cc b/src/torrent/utils/log.cc
-index a900c109..6c605474 100644
---- a/src/torrent/utils/log.cc
-+++ b/src/torrent/utils/log.cc
-@@ -73,7 +73,7 @@ struct log_cache_entry {
- };
-=20
- struct log_gz_output {
--  log_gz_output(const char* filename) { gz_file =3D gzopen(filename, "w")=
; }
-+  log_gz_output(const char* filename, bool append) { gz_file =3D gzopen(f=
ilename, append ? "a" : "w"); }
-   ~log_gz_output() { if (gz_file !=3D NULL) gzclose(gz_file); }
-=20
-   bool is_valid() { return gz_file !=3D Z_NULL; }
-@@ -416,8 +416,11 @@ log_gz_file_write(std::shared_ptr<log_gz_output>& out=
file, const char* data, siz
- }
-=20
- void
--log_open_file_output(const char* name, const char* filename) {
--  std::shared_ptr<std::ofstream> outfile(new std::ofstream(filename));
-+log_open_file_output(const char* name, const char* filename, bool append)=
 {
-+  std::ios_base::openmode mode =3D std::ofstream::out;
-+  if (append)
-+    mode |=3D std::ofstream::app;
-+  std::shared_ptr<std::ofstream> outfile(new std::ofstream(filename, mode=
));
-=20
-   if (!outfile->good())
-     throw input_error("Could not open log file '" + std::string(filename)=
 + "'.");
-@@ -429,21 +432,8 @@ log_open_file_output(const char* name, const char* fi=
lename) {
- }
-=20
- void
--log_open_file_output_append(const char* name, const char* filename) {
--  std::shared_ptr<std::ofstream> outfile(new std::ofstream(filename, std:=
:ofstream::out | std::ofstream::app));
--
--  if (!outfile->good())
--    throw input_error("Could not open log file '" + std::string(filename)=
 + "'.");
--
--  log_open_output(name, std::bind(&log_file_write, outfile,
--                                  std::placeholders::_1,
--                                  std::placeholders::_2,
--                                  std::placeholders::_3));
--}
--
--void
--log_open_gz_file_output(const char* name, const char* filename) {
--  std::shared_ptr<log_gz_output> outfile(new log_gz_output(filename));
-+log_open_gz_file_output(const char* name, const char* filename, bool appe=
nd) {
-+  std::shared_ptr<log_gz_output> outfile(new log_gz_output(filename, appe=
nd));
-=20
-   if (!outfile->is_valid())
-     throw input_error("Could not open log gzip file '" + std::string(file=
name) + "'.");
-diff --git a/src/torrent/utils/log.h b/src/torrent/utils/log.h
-index 531c8565..0dfdc86b 100644
---- a/src/torrent/utils/log.h
-+++ b/src/torrent/utils/log.h
-@@ -237,9 +237,8 @@ void log_remove_group_output(int group, const char* na=
me) LIBTORRENT_EXPORT;
- void log_add_child(int group, int child) LIBTORRENT_EXPORT;
- void log_remove_child(int group, int child) LIBTORRENT_EXPORT;
-=20
--void        log_open_file_output(const char* name, const char* filename) =
LIBTORRENT_EXPORT;
--void        log_open_file_output_append(const char* name, const char* fil=
ename) LIBTORRENT_EXPORT;
--void        log_open_gz_file_output(const char* name, const char* filenam=
e) LIBTORRENT_EXPORT;
-+void        log_open_file_output(const char* name, const char* filename, =
bool append =3D false) LIBTORRENT_EXPORT;
-+void        log_open_gz_file_output(const char* name, const char* filenam=
e, bool append =3D false) LIBTORRENT_EXPORT;
- log_buffer* log_open_log_buffer(const char* name) LIBTORRENT_EXPORT;
-=20
- //
-diff --git a/test/torrent/utils/log_test.cc b/test/torrent/utils/log_test.=
cc
-index aa13fff8..9f975636 100644
---- a/test/torrent/utils/log_test.cc
-+++ b/test/torrent/utils/log_test.cc
-@@ -162,7 +162,7 @@ utils_log_test::test_file_output_append() {
-=20
-   mktemp(&*filename.begin());
-=20
--  torrent::log_open_file_output_append("test_file", filename.c_str());
-+  torrent::log_open_file_output("test_file", filename.c_str(), false);
-   torrent::log_add_group_output(GROUP_PARENT_1, "test_file");
-=20
-   lt_log_print(GROUP_PARENT_1, "test_line_1");
-@@ -170,7 +170,7 @@ utils_log_test::test_file_output_append() {
-   torrent::log_cleanup(); // To ensure we flush the buffers.
-=20
-   // re-open and write 2nd line
--  torrent::log_open_file_output_append("test_file", filename.c_str());
-+  torrent::log_open_file_output("test_file", filename.c_str(), true);
-   torrent::log_add_group_output(GROUP_PARENT_1, "test_file");
-=20
-   lt_log_print(GROUP_PARENT_1, "test_line_2");
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0027-Backpo=
rt-changes-from-feature-bind.-200.patch b/meta-oe/recipes-connectivity/libt=
orrent/libtorrent/0027-Backport-changes-from-feature-bind.-200.patch
deleted file mode 100644
index 6b1578bde..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0027-Backport-chan=
ges-from-feature-bind.-200.patch
+++ /dev/null
@@ -1,7365 +0,0 @@
-From b0f945e11d6afe43c917b58291c6fbcf5468a908 Mon Sep 17 00:00:00 2001
-From: Jari Sundell <sundell.software@gmail.com>
-Date: Fri, 23 Aug 2019 23:23:48 +0900
-Subject: [PATCH] Backport changes from feature-bind. (#200)
-
----
- .dir-locals.el                                |   7 +
- Makefile.am                                   |   1 +
- configure.ac                                  |  40 +-
- extra/corrupt_file.cc                         |   2 +-
- rak/file_stat.h                               |   2 +-
- rak/fs_stat.h                                 |   2 +-
- rak/partial_queue.h                           |   2 +-
- rak/path.h                                    |   2 +-
- rak/priority_queue_default.h                  |   2 +-
- rak/socket_address.h                          |  49 +-
- rak/timer.h                                   |   2 +-
- scripts/checks.m4                             |   4 +-
- scripts/rak_cxx.m4                            |  47 --
- scripts/ssl.m4                                |  38 ++
- src/data/chunk_list.cc                        |   2 -
- src/data/chunk_list.h                         |   2 +-
- src/data/chunk_list_node.h                    |   2 +-
- src/data/hash_check_queue.h                   |   2 +-
- src/data/hash_queue.cc                        |   2 -
- src/data/hash_queue.h                         |   2 +-
- src/data/hash_queue_node.h                    |   4 +-
- src/data/hash_torrent.cc                      |   2 -
- src/data/hash_torrent.h                       |   4 +-
- src/data/memory_chunk.h                       |   2 +-
- src/data/socket_file.h                        |   2 +-
- src/dht/dht_hash_map.h                        |  57 +-
- src/download/chunk_selector.h                 |   2 +-
- src/download/chunk_statistics.h               |   2 +-
- src/download/delegator.cc                     |   2 +-
- src/download/delegator.h                      |   2 +-
- src/download/download_constructor.h           |   2 +-
- src/globals.cc                                |  15 +-
- src/globals.h                                 |  36 --
- src/manager.cc                                |  36 --
- src/net/Makefile.am                           |   2 +
- src/net/data_buffer.h                         |   2 +-
- src/net/listen.cc                             |  40 +-
- src/net/listen.h                              |   4 +-
- src/net/protocol_buffer.h                     |   2 +-
- src/net/socket_base.h                         |   2 +-
- src/net/socket_fd.cc                          |  10 +
- src/net/socket_fd.h                           |   6 +
- src/net/socket_listen.cc                      | 137 +++++
- src/net/socket_listen.h                       |  46 ++
- src/net/socket_set.h                          |   2 +-
- src/net/throttle_node.h                       |   2 +-
- src/protocol/handshake.cc                     |  13 +-
- src/protocol/handshake_manager.cc             |  56 +-
- src/protocol/handshake_manager.h              |  40 +-
- src/protocol/peer_connection_base.cc          |   2 -
- src/protocol/request_list.cc                  |  38 +-
- src/torrent/Makefile.am                       |   1 +
- src/torrent/common.h                          |   5 +-
- src/torrent/connection_manager.h              |   2 +-
- src/torrent/data/download_data.h              |   2 +-
- src/torrent/data/file_list.cc                 |   2 -
- src/torrent/data/transfer_list.h              |   3 +-
- src/torrent/download.cc                       |   4 +-
- src/torrent/download/choke_group.cc           |   2 +-
- src/torrent/download/choke_group.h            |   2 +-
- src/torrent/download/choke_queue.cc           |   3 +-
- src/torrent/download/choke_queue.h            |   5 +-
- src/torrent/download/group_entry.h            |   3 +-
- src/torrent/download/resource_manager.cc      |   1 -
- src/torrent/download/resource_manager.h       |   2 +-
- src/torrent/download_info.h                   |   4 +-
- src/torrent/error.cc                          |   6 +-
- src/torrent/error.h                           |   7 +-
- src/torrent/event.cc                          |  19 +
- src/torrent/event.h                           |  82 ++-
- src/torrent/http.h                            |   2 +-
- src/torrent/net/Makefile.am                   |  18 +-
- src/torrent/net/address_info.cc               |  43 ++
- src/torrent/net/address_info.h                |  69 +++
- src/torrent/net/fd.cc                         | 209 +++++++
- src/torrent/net/fd.h                          |  63 ++
- src/torrent/net/socket_address.cc             | 559 ++++++++++++++++++
- src/torrent/net/socket_address.h              | 229 +++++++
- src/torrent/net/socket_address_key.h          |   2 +-
- src/torrent/net/socket_event.cc               |  29 +
- src/torrent/net/socket_event.h                |  31 +
- src/torrent/net/types.h                       |  33 ++
- src/torrent/object.h                          |  21 +-
- src/torrent/peer/client_list.cc               |   2 +-
- src/torrent/peer/connection_list.h            |   3 +-
- src/torrent/peer/peer_list.cc                 |   7 +-
- src/torrent/poll.h                            |   3 +-
- src/torrent/torrent.cc                        |  42 +-
- src/torrent/torrent.h                         |  11 +-
- src/torrent/tracker.h                         |   2 +-
- src/torrent/tracker_controller.h              |   3 +-
- src/torrent/tracker_list.h                    |   2 +-
- src/torrent/utils/Makefile.am                 |   5 +-
- src/torrent/utils/directory_events.h          |   3 +-
- src/torrent/utils/log.cc                      |  66 +--
- src/torrent/utils/log.h                       |  98 ++-
- src/torrent/utils/log_buffer.cc               |  55 +-
- src/torrent/utils/log_buffer.h                |  52 +-
- src/torrent/utils/net.cc                      |  72 ---
- src/torrent/utils/net.h                       |  56 --
- src/torrent/utils/option_strings.cc           |  63 +-
- src/torrent/utils/option_strings.h            |   7 +-
- src/torrent/utils/random.cc                   |  29 +
- src/torrent/utils/random.h                    |  15 +
- src/torrent/utils/ranges.h                    |   1 -
- src/torrent/utils/resume.cc                   |   2 -
- src/torrent/utils/signal_bitfield.h           |   3 +-
- src/torrent/utils/thread_base.h               |   3 +-
- src/utils/instrumentation.cc                  |   2 -
- src/utils/instrumentation.h                   |   3 +-
- src/utils/queue_buckets.h                     |   4 +-
- src/utils/sha_fast.h                          |   2 +-
- test/Makefile.am                              |  29 +-
- test/data/hash_check_queue_test.cc            |   2 +-
- test/data/hash_queue_test.cc                  |   2 +-
- test/helpers/expect_fd.h                      | 107 ++++
- test/helpers/expect_utils.h                   |  13 +
- test/helpers/mock_compare.h                   |  96 +++
- test/helpers/mock_function.cc                 | 170 ++++++
- test/helpers/mock_function.h                  | 133 +++++
- test/helpers/network.h                        | 182 ++++++
- test/helpers/progress_listener.cc             |  63 ++
- test/helpers/progress_listener.h              |  47 ++
- test/helpers/test_fixture.cc                  |  18 +
- test/helpers/test_fixture.h                   |  14 +
- test/helpers/utils.h                          |  60 ++
- test/main.cc                                  |  82 ++-
- test/net/test_socket_listen.cc                | 398 +++++++++++++
- test/net/test_socket_listen.h                 |  44 ++
- test/torrent/net/test_address_info.cc         |  62 ++
- test/torrent/net/test_address_info.h          |  19 +
- test/torrent/net/test_fd.cc                   |  24 +
- test/torrent/net/test_fd.h                    |  12 +
- test/torrent/net/test_socket_address.cc       | 383 ++++++++++++
- test/torrent/net/test_socket_address.h        |  43 ++
- test/torrent/net/test_socket_address_key.cc   |  87 ---
- test/torrent/object_stream_test.cc            |   4 +-
- test/torrent/tracker_controller_features.cc   |   2 +-
- test/torrent/tracker_controller_requesting.cc |   2 +-
- test/torrent/tracker_controller_test.cc       |   2 +-
- test/torrent/tracker_list_features_test.cc    |   2 +-
- test/torrent/utils/directory_events_test.cc   |   4 +-
- test/torrent/utils/log_buffer_test.h          |  17 -
- test/torrent/utils/log_test.cc                |   4 +-
- test/torrent/utils/net_test.cc                |  32 -
- test/torrent/utils/net_test.h                 |  15 -
- test/torrent/utils/option_strings_test.cc     |   3 +-
- test/torrent/utils/test_extents.cc            |   2 +-
- ...{log_buffer_test.cc =3D> test_log_buffer.cc} |  14 +-
- test/torrent/utils/test_log_buffer.h          |  17 +
- test/torrent/utils/test_uri_parser.cc         |   2 +-
- test/torrent/utils/thread_base_test.cc        |   3 +-
- 152 files changed, 3968 insertions(+), 1110 deletions(-)
- create mode 100644 .dir-locals.el
- create mode 100644 scripts/ssl.m4
- create mode 100644 src/net/socket_listen.cc
- create mode 100644 src/net/socket_listen.h
- create mode 100644 src/torrent/event.cc
- create mode 100644 src/torrent/net/address_info.cc
- create mode 100644 src/torrent/net/address_info.h
- create mode 100644 src/torrent/net/fd.cc
- create mode 100644 src/torrent/net/fd.h
- create mode 100644 src/torrent/net/socket_address.cc
- create mode 100644 src/torrent/net/socket_address.h
- create mode 100644 src/torrent/net/socket_event.cc
- create mode 100644 src/torrent/net/socket_event.h
- create mode 100644 src/torrent/net/types.h
- delete mode 100644 src/torrent/utils/net.cc
- delete mode 100644 src/torrent/utils/net.h
- create mode 100644 src/torrent/utils/random.cc
- create mode 100644 src/torrent/utils/random.h
- create mode 100644 test/helpers/expect_fd.h
- create mode 100644 test/helpers/expect_utils.h
- create mode 100644 test/helpers/mock_compare.h
- create mode 100644 test/helpers/mock_function.cc
- create mode 100644 test/helpers/mock_function.h
- create mode 100644 test/helpers/network.h
- create mode 100644 test/helpers/progress_listener.cc
- create mode 100644 test/helpers/progress_listener.h
- create mode 100644 test/helpers/test_fixture.cc
- create mode 100644 test/helpers/test_fixture.h
- create mode 100644 test/helpers/utils.h
- create mode 100644 test/net/test_socket_listen.cc
- create mode 100644 test/net/test_socket_listen.h
- create mode 100644 test/torrent/net/test_address_info.cc
- create mode 100644 test/torrent/net/test_address_info.h
- create mode 100644 test/torrent/net/test_fd.cc
- create mode 100644 test/torrent/net/test_fd.h
- create mode 100644 test/torrent/net/test_socket_address.cc
- create mode 100644 test/torrent/net/test_socket_address.h
- delete mode 100644 test/torrent/net/test_socket_address_key.cc
- delete mode 100644 test/torrent/utils/log_buffer_test.h
- delete mode 100644 test/torrent/utils/net_test.cc
- delete mode 100644 test/torrent/utils/net_test.h
- rename test/torrent/utils/{log_buffer_test.cc =3D> test_log_buffer.cc} (8=
6%)
- create mode 100644 test/torrent/utils/test_log_buffer.h
-
-diff --git a/.dir-locals.el b/.dir-locals.el
-new file mode 100644
-index 00000000..af1189f2
---- /dev/null
-+++ b/.dir-locals.el
-@@ -0,0 +1,7 @@
-+;;; Directory Local Variables
-+;;; For more information see (info "(emacs) Directory Variables")
-+
-+((c++-mode
-+  (flycheck-clang-language-standard . "c++11")
-+  (flycheck-gcc-language-standard . "c++11")))
-+
-diff --git a/Makefile.am b/Makefile.am
-index f175e634..9507b9ea 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -8,6 +8,7 @@ EXTRA_DIST=3D \
- 	scripts/checks.m4 \
- 	scripts/common.m4 \
- 	scripts/attributes.m4 \
-+	scripts/ssl.m4 \
- 	doc/main.xml \
- 	doc/http.xml \
- 	doc/torrent.xml \
-diff --git a/configure.ac b/configure.ac
-index 4ed08124..620ca552 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -17,7 +17,7 @@ AC_SUBST(LIBTORRENT_CURRENT)
- AC_SUBST(LIBTORRENT_INTERFACE_VERSION_INFO)
- AC_SUBST(LIBTORRENT_INTERFACE_VERSION_NO)
-=20
--AM_INIT_AUTOMAKE
-+AM_INIT_AUTOMAKE([serial-tests])
- AC_CONFIG_HEADERS(config.h)
-=20
- AC_PROG_CXX
-@@ -35,7 +35,6 @@ RAK_ENABLE_EXTRA_DEBUG
- RAK_ENABLE_WERROR
-=20
- RAK_CHECK_CXX11
--RAK_CHECK_TR1_LIB
-=20
- AC_SYS_LARGEFILE
-=20
-@@ -67,41 +66,8 @@ CFLAGS=3D"$PTHREAD_CFLAGS $CPPUNIT_CFLAGS $CFLAGS"
- CXXFLAGS=3D"$PTHREAD_CFLAGS $CPPUNIT_CFLAGS $CXXFLAGS"
- LIBS=3D"$PTHREAD_LIBS $CPPUNIT_LIBS $LIBS"
-=20
--AC_ARG_ENABLE(openssl,
--  [  --disable-openssl       Don't use OpenSSL's SHA1 implementation.],
--  [
--    if test "$enableval" =3D "yes"; then
--dnl move to scripts.
--      PKG_CHECK_MODULES(OPENSSL, libcrypto,
--        CXXFLAGS=3D"$CXXFLAGS $OPENSSL_CFLAGS";
--        LIBS=3D"$LIBS $OPENSSL_LIBS")
--
--      AC_DEFINE(USE_OPENSSL, 1, Using OpenSSL.)
--      AC_DEFINE(USE_OPENSSL_SHA, 1, Using OpenSSL's SHA1 implementation.)
--      AC_CHECK_LIB([crypto], [DH_set0_pqg], [AC_DEFINE(USE_OPENSSL_1_1, 1=
, Using OpenSSL 1.1.)])
--
--    else
--      AC_DEFINE(USE_NSS_SHA, 1, Using Mozilla's SHA1 implementation.)
--    fi
--  ],[
--    PKG_CHECK_MODULES(OPENSSL, libcrypto,
--      CXXFLAGS=3D"$CXXFLAGS $OPENSSL_CFLAGS";
--      LIBS=3D"$LIBS $OPENSSL_LIBS")
--
--    AC_DEFINE(USE_OPENSSL, 1, Using OpenSSL.)
--    AC_DEFINE(USE_OPENSSL_SHA, 1, Using OpenSSL's SHA1 implementation.)
--    AC_CHECK_LIB([crypto], [DH_set0_pqg], [AC_DEFINE(USE_OPENSSL_1_1, 1, =
Using OpenSSL 1.1.)])
--  ]
--)
--
--AC_ARG_ENABLE(cyrus-rc4,
--  [  --enable-cyrus-rc4=3DPFX  Use Cyrus RC4 implementation.],
--  [
--    CXXFLAGS=3D"$CXXFLAGS -I${enableval}/include";
--    LIBS=3D"$LIBS -lrc4 -L${enableval}/lib"
--    AC_DEFINE(USE_CYRUS_RC4, 1, Using Cyrus RC4 implementation.)
--  ]
--)
-+TORRENT_ARG_OPENSSL
-+TORRENT_ARG_CYRUS_RC4
-=20
- AC_CHECK_FUNCS(posix_memalign)
-=20
-diff --git a/extra/corrupt_file.cc b/extra/corrupt_file.cc
-index 2a818cc7..7ae906e6 100644
---- a/extra/corrupt_file.cc
-+++ b/extra/corrupt_file.cc
-@@ -1,6 +1,6 @@
- #include <iostream>
- #include <stdexcept>
--#include <inttypes.h>
-+#include <cinttypes>
- #include <stdio.h>
- #include <stdlib.h>
- #include <fcntl.h>
-diff --git a/rak/file_stat.h b/rak/file_stat.h
-index 5ad45e8f..f1ad8c2b 100644
---- a/rak/file_stat.h
-+++ b/rak/file_stat.h
-@@ -38,7 +38,7 @@
- #define RAK_FILE_STAT_H
-=20
- #include <string>
--#include <inttypes.h>
-+#include <cinttypes>
- #include <sys/stat.h>
-=20
- namespace rak {
-diff --git a/rak/fs_stat.h b/rak/fs_stat.h
-index 5e844277..2d73ff1b 100644
---- a/rak/fs_stat.h
-+++ b/rak/fs_stat.h
-@@ -38,7 +38,7 @@
- #define RAK_FS_STAT_H
-=20
- #include <string>
--#include <inttypes.h>
-+#include <cinttypes>
-=20
- #include <rak/error_number.h>
-=20
-diff --git a/rak/partial_queue.h b/rak/partial_queue.h
-index 6650a633..1abfdddf 100644
---- a/rak/partial_queue.h
-+++ b/rak/partial_queue.h
-@@ -39,7 +39,7 @@
-=20
- #include <cstring>
- #include <stdexcept>
--#include <inttypes.h>
-+#include <cinttypes>
-=20
- namespace rak {
-=20
-diff --git a/rak/path.h b/rak/path.h
-index bfe8ccc1..64daf355 100644
---- a/rak/path.h
-+++ b/rak/path.h
-@@ -99,7 +99,7 @@ path_expand(const char* src, char* first, char* last) {
-     src++;
-   }
-=20
--  return std::max(first + strlcpy(first, src, std::distance(first, last))=
, last);
-+  return std::min(first + strlcpy(first, src, std::distance(first, last))=
, last);
- }
-=20
- }
-diff --git a/rak/priority_queue_default.h b/rak/priority_queue_default.h
-index 01a0070e..a7bba0ce 100644
---- a/rak/priority_queue_default.h
-+++ b/rak/priority_queue_default.h
-@@ -37,7 +37,7 @@
- #ifndef RAK_PRIORITY_QUEUE_DEFAULT_H
- #define RAK_PRIORITY_QUEUE_DEFAULT_H
-=20
--#include lt_tr1_functional
-+#include <functional>
- #include <rak/allocators.h>
- #include <rak/priority_queue.h>
- #include <rak/timer.h>
-diff --git a/rak/socket_address.h b/rak/socket_address.h
-index 961c53b2..8eb60116 100644
---- a/rak/socket_address.h
-+++ b/rak/socket_address.h
-@@ -47,9 +47,12 @@
- #ifndef RAK_SOCKET_ADDRESS_H
- #define RAK_SOCKET_ADDRESS_H
-=20
-+#include <cinttypes>
-+#include <cstdint>
- #include <cstring>
--#include <string>
- #include <stdexcept>
-+#include <string>
-+
- #include <arpa/inet.h>
- #include <netinet/in.h>
- #include <sys/types.h>
-@@ -84,7 +87,6 @@ public:
-=20
-   bool                is_valid_inet_class() const             { return fa=
mily() =3D=3D af_inet || family() =3D=3D af_inet6; }
-=20
--  // Should we need to set AF_UNSPEC?
-   void                clear()                                 { std::mems=
et(this, 0, sizeof(socket_address)); set_family(); }
-=20
-   sa_family_t         family() const                          { return m_=
sockaddr.sa_family; }
-@@ -124,6 +126,7 @@ public:
-   // extranous bytes and ensure it does not go beyond the size of this
-   // struct.
-   void                copy(const socket_address& src, size_t length);
-+  void                copy_sockaddr(const sockaddr* src);
-=20
-   static socket_address*       cast_from(sockaddr* sa)        { return re=
interpret_cast<socket_address*>(sa); }
-   static const socket_address* cast_from(const sockaddr* sa)  { return re=
interpret_cast<const socket_address*>(sa); }
-@@ -220,6 +223,8 @@ public:
-=20
-   void                set_address_any()                       { set_port(=
0); set_address(in6addr_any); }
-=20
-+  std::string         pretty_address_str() const;
-+
-   sa_family_t         family() const                          { return m_=
sockaddr.sin6_family; }
-   void                set_family()                            { m_sockadd=
r.sin6_family =3D AF_INET6; }
-=20
-@@ -340,7 +345,7 @@ socket_address::pretty_address_str() const {
-   case af_inet:
-     return sa_inet()->address_str();
-   case af_inet6:
--    return sa_inet6()->address_str();
-+    return sa_inet6()->pretty_address_str();
-   case af_unspec:
-     return std::string("unspec");
-   default:
-@@ -380,13 +385,16 @@ socket_address::length() const {
- inline void
- socket_address::copy(const socket_address& src, size_t length) {
-   length =3D std::min(length, sizeof(socket_address));
-- =20
--  // Does this get properly optimized?
-+
-   std::memset(this, 0, sizeof(socket_address));
-   std::memcpy(this, &src, length);
- }
-=20
--// Should we be able to compare af_unspec?
-+inline void
-+socket_address::copy_sockaddr(const sockaddr* src) {
-+  std::memset(this, 0, sizeof(socket_address));
-+  std::memcpy(this, src, socket_address::cast_from(src)->length());
-+}
-=20
- inline bool
- socket_address::operator =3D=3D (const socket_address& rhs) const {
-@@ -488,6 +496,35 @@ socket_address_inet6::set_address_c_str(const char* a=
) {
-   return inet_pton(AF_INET6, a, &m_sockaddr.sin6_addr);
- }
-=20
-+inline std::string
-+socket_address_inet6::pretty_address_str() const {
-+  char buf[INET6_ADDRSTRLEN + 2 + 6];
-+
-+  if (inet_ntop(family(), &m_sockaddr.sin6_addr, buf + 1, INET6_ADDRSTRLE=
N) =3D=3D NULL)
-+    return std::string();
-+
-+  buf[0] =3D '[';
-+
-+  char* last_char =3D (char*)std::memchr(buf + 1, 0, INET6_ADDRSTRLEN);
-+
-+  // TODO: Throw exception here.
-+
-+  if (last_char =3D=3D NULL || last_char >=3D buf + 1 + INET6_ADDRSTRLEN)
-+    throw std::logic_error("inet_ntop for inet6 returned bad buffer");
-+
-+  *(last_char++) =3D ']';
-+
-+  if (!is_port_any()) {
-+    if (snprintf(last_char, 7, ":%" PRIu16, port()) =3D=3D -1)
-+      return std::string("error"); // TODO: Throw here.
-+
-+  } else {
-+    *last_char =3D '\0';
-+  }
-+
-+  return std::string(buf);
-+}
-+
- inline socket_address
- socket_address_inet6::normalize_address() const {
-   const uint32_t *addr32 =3D reinterpret_cast<const uint32_t *>(m_sockadd=
r.sin6_addr.s6_addr);
-diff --git a/rak/timer.h b/rak/timer.h
-index e25ad2e6..842a2e53 100644
---- a/rak/timer.h
-+++ b/rak/timer.h
-@@ -38,7 +38,7 @@
- #define RAK_TIMER_H
-=20
- #include <limits>
--#include <inttypes.h>
-+#include <cinttypes>
- #include <sys/time.h>
-=20
- namespace rak {
-diff --git a/scripts/checks.m4 b/scripts/checks.m4
-index 83be8461..98ef17f8 100644
---- a/scripts/checks.m4
-+++ b/scripts/checks.m4
-@@ -88,6 +88,7 @@ AC_DEFUN([TORRENT_CHECK_KQUEUE], [
-     [
-       AC_DEFINE(USE_KQUEUE, 1, Use kqueue.)
-       AC_MSG_RESULT(yes)
-+      TORRENT_CHECK_KQUEUE_SOCKET_ONLY
-     ], [
-       AC_MSG_RESULT(no)
-     ])
-@@ -137,7 +138,6 @@ AC_DEFUN([TORRENT_WITH_KQUEUE], [
-     [
-         if test "$withval" =3D "yes"; then
-           TORRENT_CHECK_KQUEUE
--          TORRENT_CHECK_KQUEUE_SOCKET_ONLY
-         fi
-     ])
- ])
-@@ -149,11 +149,9 @@ AC_DEFUN([TORRENT_WITHOUT_KQUEUE], [
-     [
-       if test "$withval" =3D "yes"; then
-         TORRENT_CHECK_KQUEUE
--        TORRENT_CHECK_KQUEUE_SOCKET_ONLY
-       fi
-     ], [
-         TORRENT_CHECK_KQUEUE
--        TORRENT_CHECK_KQUEUE_SOCKET_ONLY
-     ])
- ])
-=20
-diff --git a/scripts/rak_cxx.m4 b/scripts/rak_cxx.m4
-index 3660f3a7..0db61b83 100644
---- a/scripts/rak_cxx.m4
-+++ b/scripts/rak_cxx.m4
-@@ -12,50 +12,3 @@ AC_DEFUN([RAK_CHECK_CXX11], [
-     ]
-   )
- ])
--
--AC_DEFUN([RAK_CHECK_TR1_LIB], [
--  AC_LANG_PUSH(C++)
--  AC_MSG_CHECKING(should use TR1 headers)
--
--  AC_COMPILE_IFELSE([AC_LANG_SOURCE([
--      #include <unordered_map>
--      class Foo; typedef std::unordered_map<Foo*, int> Bar;
--      Bar b1;
--      ])
--  ], [
--      AC_MSG_RESULT(no)
--      AC_DEFINE(USE_TR1_LIB, 0, Define to 1 if you need to use TR1 contai=
ners.)
--
--      AC_DEFINE([lt_tr1_array], [<array>], [TR1 array])
--      AC_DEFINE([lt_tr1_functional], [<functional>], [TR1 functional])
--      AC_DEFINE([lt_tr1_memory], [<memory>], [TR1 memory])
--      AC_DEFINE([lt_tr1_unordered_map], [<unordered_map>], [TR1 unordered=
_map])
--
--  ], [
--    AC_COMPILE_IFELSE([AC_LANG_SOURCE([
--        #include <tr1/unordered_map>
--        class Foo; typedef std::tr1::unordered_map<Foo*, int> Bar;
--        Bar b1;
--        ])
--    ], [
--        AC_MSG_RESULT([yes])
--        AC_DEFINE(USE_TR1_LIB, 1, Define to 1 if you need to use TR1 cont=
ainers.)
--
--        AC_DEFINE([lt_tr1_array], [<tr1/array>], [TR1 array])
--        AC_DEFINE([lt_tr1_functional], [<tr1/functional>], [TR1 functiona=
l])
--        AC_DEFINE([lt_tr1_memory], [<tr1/memory>], [TR1 memory])
--        AC_DEFINE([lt_tr1_unordered_map], [<tr1/unordered_map>], [TR1 uno=
rdered_map])
--
--    ], [
--        AC_MSG_ERROR([No support for C++11 standard library nor TR1 exten=
sions found.])
--    ])
--  ])
--
--  AH_VERBATIM(lt_tr1_zzz, [
--#if USE_TR1_LIB =3D=3D 1
--namespace std { namespace tr1 {} using namespace tr1; }
--#endif
--])
--
--  AC_LANG_POP(C++)
--])
-diff --git a/scripts/ssl.m4 b/scripts/ssl.m4
-new file mode 100644
-index 00000000..f07349a1
---- /dev/null
-+++ b/scripts/ssl.m4
-@@ -0,0 +1,38 @@
-+AC_DEFUN([TORRENT_CHECK_OPENSSL],
-+  [
-+    PKG_CHECK_MODULES(OPENSSL, libcrypto,
-+      CXXFLAGS=3D"$CXXFLAGS $OPENSSL_CFLAGS";
-+      LIBS=3D"$LIBS $OPENSSL_LIBS")
-+
-+    AC_DEFINE(USE_OPENSSL, 1, Using OpenSSL.)
-+    AC_DEFINE(USE_OPENSSL_SHA, 1, Using OpenSSL's SHA1 implementation.)
-+  ]
-+)
-+
-+AC_DEFUN([TORRENT_ARG_OPENSSL],
-+  [
-+    AC_ARG_ENABLE(openssl,
-+      [  --disable-openssl       Don't use OpenSSL's SHA1 implementation.=
],
-+      [
-+        if test "$enableval" =3D "yes"; then
-+          TORRENT_CHECK_OPENSSL
-+        else
-+          AC_DEFINE(USE_NSS_SHA, 1, Using Mozilla's SHA1 implementation.)
-+        fi
-+      ],[
-+        TORRENT_CHECK_OPENSSL
-+      ])
-+  ]
-+)
-+
-+AC_DEFUN([TORRENT_ARG_CYRUS_RC4],
-+  [
-+    AC_ARG_ENABLE(cyrus-rc4,
-+      [  --enable-cyrus-rc4=3DPFX  Use Cyrus RC4 implementation.],
-+      [
-+        CXXFLAGS=3D"$CXXFLAGS -I${enableval}/include";
-+        LIBS=3D"$LIBS -lrc4 -L${enableval}/lib"
-+        AC_DEFINE(USE_CYRUS_RC4, 1, Using Cyrus RC4 implementation.)
-+      ])
-+  ]
-+)
-diff --git a/src/data/chunk_list.cc b/src/data/chunk_list.cc
-index 00abbc2a..7622b825 100644
---- a/src/data/chunk_list.cc
-+++ b/src/data/chunk_list.cc
-@@ -36,8 +36,6 @@
-=20
- #include "config.h"
-=20
--#define __STDC_FORMAT_MACROS
--
- #include <rak/error_number.h>
- #include <rak/functional.h>
-=20
-diff --git a/src/data/chunk_list.h b/src/data/chunk_list.h
-index b6ff4cdb..4b40dc42 100644
---- a/src/data/chunk_list.h
-+++ b/src/data/chunk_list.h
-@@ -37,9 +37,9 @@
- #ifndef LIBTORRENT_DATA_CHUNK_LIST_H
- #define LIBTORRENT_DATA_CHUNK_LIST_H
-=20
-+#include <functional>
- #include <string>
- #include <vector>
--#include lt_tr1_functional
-=20
- #include "chunk.h"
- #include "chunk_handle.h"
-diff --git a/src/data/chunk_list_node.h b/src/data/chunk_list_node.h
-index 76de6671..95e4ed4f 100644
---- a/src/data/chunk_list_node.h
-+++ b/src/data/chunk_list_node.h
-@@ -37,7 +37,7 @@
- #ifndef LIBTORRENT_DATA_CHUNK_LIST_NODE_H
- #define LIBTORRENT_DATA_CHUNK_LIST_NODE_H
-=20
--#include <inttypes.h>
-+#include <cinttypes>
- #include <rak/timer.h>
-=20
- namespace torrent {
-diff --git a/src/data/hash_check_queue.h b/src/data/hash_check_queue.h
-index b933f137..9f28c118 100644
---- a/src/data/hash_check_queue.h
-+++ b/src/data/hash_check_queue.h
-@@ -38,8 +38,8 @@
- #define LIBTORRENT_DATA_HASH_CHECK_QUEUE_H
-=20
- #include <deque>
-+#include <functional>
- #include <pthread.h>
--#include lt_tr1_functional
-=20
- #include "rak/allocators.h"
-=20
-diff --git a/src/data/hash_queue.cc b/src/data/hash_queue.cc
-index 7dffaee4..3f54892b 100644
---- a/src/data/hash_queue.cc
-+++ b/src/data/hash_queue.cc
-@@ -36,8 +36,6 @@
-=20
- #include "config.h"
-=20
--#define __STDC_FORMAT_MACROS
--
- #include <functional>
- #include <rak/functional.h>
- #include <unistd.h>
-diff --git a/src/data/hash_queue.h b/src/data/hash_queue.h
-index 6885a383..3a841967 100644
---- a/src/data/hash_queue.h
-+++ b/src/data/hash_queue.h
-@@ -38,9 +38,9 @@
- #define LIBTORRENT_DATA_HASH_QUEUE_H
-=20
- #include <deque>
-+#include <functional>
- #include <map>
- #include <pthread.h>
--#include lt_tr1_functional
-=20
- #include "torrent/hash_string.h"
- #include "hash_queue_node.h"
-diff --git a/src/data/hash_queue_node.h b/src/data/hash_queue_node.h
-index aa59a062..c8367b7c 100644
---- a/src/data/hash_queue_node.h
-+++ b/src/data/hash_queue_node.h
-@@ -37,9 +37,9 @@
- #ifndef LIBTORRENT_DATA_HASH_QUEUE_NODE_H
- #define LIBTORRENT_DATA_HASH_QUEUE_NODE_H
-=20
-+#include <cinttypes>
-+#include <functional>
- #include <string>
--#include lt_tr1_functional
--#include <inttypes.h>
-=20
- #include "chunk_handle.h"
- #include "hash_chunk.h"
-diff --git a/src/data/hash_torrent.cc b/src/data/hash_torrent.cc
-index 758a10fa..e803f1cb 100644
---- a/src/data/hash_torrent.cc
-+++ b/src/data/hash_torrent.cc
-@@ -36,8 +36,6 @@
-=20
- #include "config.h"
-=20
--#define __STDC_FORMAT_MACROS
--
- #include "data/chunk_list.h"
- #include "torrent/exceptions.h"
- #include "torrent/data/download_data.h"
-diff --git a/src/data/hash_torrent.h b/src/data/hash_torrent.h
-index 6af643f2..9ce2f100 100644
---- a/src/data/hash_torrent.h
-+++ b/src/data/hash_torrent.h
-@@ -37,9 +37,9 @@
- #ifndef LIBTORRENT_DATA_HASH_TORRENT_H
- #define LIBTORRENT_DATA_HASH_TORRENT_H
-=20
-+#include <cinttypes>
-+#include <functional>
- #include <string>
--#include <inttypes.h>
--#include lt_tr1_functional
- #include <rak/priority_queue_default.h>
-=20
- #include "data/chunk_handle.h"
-diff --git a/src/data/memory_chunk.h b/src/data/memory_chunk.h
-index cc32eff1..d2b5565d 100644
---- a/src/data/memory_chunk.h
-+++ b/src/data/memory_chunk.h
-@@ -38,7 +38,7 @@
- #define LIBTORRENT_DATA_MEMORY_CHUNK_H
-=20
- #include <algorithm>
--#include <inttypes.h>
-+#include <cinttypes>
- #include <sys/mman.h>
- #include <cstddef>
-=20
-diff --git a/src/data/socket_file.h b/src/data/socket_file.h
-index 7b27af8c..d25c4a44 100644
---- a/src/data/socket_file.h
-+++ b/src/data/socket_file.h
-@@ -38,7 +38,7 @@
- #define LIBTORRENT_SOCKET_FILE_H
-=20
- #include <string>
--#include <inttypes.h>
-+#include <cinttypes>
- #include <fcntl.h>
- #include <sys/types.h>
-=20
-diff --git a/src/dht/dht_hash_map.h b/src/dht/dht_hash_map.h
-index 140f070b..1506db56 100644
---- a/src/dht/dht_hash_map.h
-+++ b/src/dht/dht_hash_map.h
-@@ -39,20 +39,14 @@
-=20
- #include "config.h"
-=20
--#if HAVE_TR1
--#include <lt_tr1_unordered_map>
--#else
--#include <map>
--#endif
--
--#include "torrent/hash_string.h"
-+#include <unordered_map>
-=20
- #include "dht_node.h"
- #include "dht_tracker.h"
-+#include "torrent/hash_string.h"
-=20
- namespace torrent {
-=20
--#if HAVE_TR1
- // Hash functions for HashString keys, and dereferencing HashString point=
ers.
-=20
- // Since the first few bits are very similar if not identical (since the =
IDs
-@@ -142,53 +136,6 @@ public:
-=20
- };
-=20
--#else
--
--// Compare HashString pointers by dereferencing them.
--struct hashstring_ptr_less : public std::binary_function<const HashString=
*, const HashString*, bool> {
--  size_t operator () (const HashString* one, const HashString* two) const=
=20
--  { return *one < *two; }
--};
--
--class DhtNodeList : public std::map<const HashString*, DhtNode*, hashstri=
ng_ptr_less> {
--public:
--  typedef std::map<const HashString*, DhtNode*, hashstring_ptr_less> base=
_type;
--
--  // Define accessor iterator with more convenient access to the key and
--  // element values.  Allows changing the map definition more easily if n=
eeded.
--  template<typename T>
--  struct accessor_wrapper : public T {
--    accessor_wrapper(const T& itr) : T(itr) { }
--
--    const HashString&    id() const    { return *(**this).first; }
--    DhtNode*             node() const  { return (**this).second; }
--  };
--
--  typedef accessor_wrapper<const_iterator>  const_accessor;
--  typedef accessor_wrapper<iterator>        accessor;
--
--  DhtNode*            add_node(DhtNode* n);
--
--};
--
--class DhtTrackerList : public std::map<HashString, DhtTracker*> {
--public:
--  typedef std::map<HashString, DhtTracker*> base_type;
--
--  template<typename T>
--  struct accessor_wrapper : public T {
--    accessor_wrapper(const T& itr) : T(itr) { }
--
--    const HashString&    id() const       { return (**this).first; }
--    DhtTracker*          tracker() const  { return (**this).second; }
--  };
--
--  typedef accessor_wrapper<const_iterator>  const_accessor;
--  typedef accessor_wrapper<iterator>        accessor;
--
--};
--#endif // HAVE_TR1
--
- inline
- DhtNode* DhtNodeList::add_node(DhtNode* n) {
-   insert(std::make_pair((const HashString*)n, (DhtNode*)n));
-diff --git a/src/download/chunk_selector.h b/src/download/chunk_selector.h
-index 52c31fd5..ab1b8c17 100644
---- a/src/download/chunk_selector.h
-+++ b/src/download/chunk_selector.h
-@@ -37,7 +37,7 @@
- #ifndef LIBTORRENT_DOWNLOAD_CHUNK_SELECTOR_H
- #define LIBTORRENT_DOWNLOAD_CHUNK_SELECTOR_H
-=20
--#include <inttypes.h>
-+#include <cinttypes>
- #include <rak/partial_queue.h>
-=20
- #include "torrent/bitfield.h"
-diff --git a/src/download/chunk_statistics.h b/src/download/chunk_statisti=
cs.h
-index 816ec6c9..62f76c5a 100644
---- a/src/download/chunk_statistics.h
-+++ b/src/download/chunk_statistics.h
-@@ -37,7 +37,7 @@
- #ifndef LIBTORRENT_DOWNLOAD_CHUNK_STATISTICS_H
- #define LIBTORRENT_DOWNLOAD_CHUNK_STATISTICS_H
-=20
--#include <inttypes.h>
-+#include <cinttypes>
- #include <vector>
-=20
- namespace torrent {
-diff --git a/src/download/delegator.cc b/src/download/delegator.cc
-index 711cd461..27ae42ec 100644
---- a/src/download/delegator.cc
-+++ b/src/download/delegator.cc
-@@ -39,7 +39,7 @@
- #include "config.h"
-=20
- #include <algorithm>
--#include <inttypes.h>
-+#include <cinttypes>
-=20
- #include "torrent/exceptions.h"
- #include "torrent/bitfield.h"
-diff --git a/src/download/delegator.h b/src/download/delegator.h
-index 3b997b81..b75d4c2a 100644
---- a/src/download/delegator.h
-+++ b/src/download/delegator.h
-@@ -37,9 +37,9 @@
- #ifndef LIBTORRENT_DELEGATOR_H
- #define LIBTORRENT_DELEGATOR_H
-=20
-+#include <functional>
- #include <string>
- #include <vector>
--#include lt_tr1_functional
-=20
- #include "torrent/data/transfer_list.h"
-=20
-diff --git a/src/download/download_constructor.h b/src/download/download_c=
onstructor.h
-index 7d43aba3..6a09b7f1 100644
---- a/src/download/download_constructor.h
-+++ b/src/download/download_constructor.h
-@@ -39,7 +39,7 @@
-=20
- #include <list>
- #include <string>
--#include <inttypes.h>
-+#include <cinttypes>
-=20
- namespace torrent {
-=20
-diff --git a/src/globals.cc b/src/globals.cc
-index 88130c19..20644fbd 100644
---- a/src/globals.cc
-+++ b/src/globals.cc
-@@ -37,11 +37,24 @@
- #include "config.h"
-=20
- #include "globals.h"
--#include "torrent/common.h"
-+#include "manager.h"
-+#include "torrent/connection_manager.h"
-+#include "torrent/event.h"
-+#include "torrent/poll.h"
-=20
- namespace torrent {
-=20
- LIBTORRENT_EXPORT rak::priority_queue_default taskScheduler;
- LIBTORRENT_EXPORT rak::timer                  cachedTime;
-=20
-+void poll_event_open(Event* event) { manager->poll()->open(event); manage=
r->connection_manager()->inc_socket_count(); }
-+void poll_event_close(Event* event) { manager->poll()->close(event); mana=
ger->connection_manager()->dec_socket_count(); }
-+void poll_event_closed(Event* event) { manager->poll()->closed(event); ma=
nager->connection_manager()->dec_socket_count(); }
-+void poll_event_insert_read(Event* event) { manager->poll()->insert_read(=
event); }
-+void poll_event_insert_write(Event* event) { manager->poll()->insert_writ=
e(event); }
-+void poll_event_insert_error(Event* event) { manager->poll()->insert_erro=
r(event); }
-+void poll_event_remove_read(Event* event) { manager->poll()->remove_read(=
event); }
-+void poll_event_remove_write(Event* event) { manager->poll()->remove_writ=
e(event); }
-+void poll_event_remove_error(Event* event) { manager->poll()->remove_erro=
r(event); }
-+
- }
-diff --git a/src/globals.h b/src/globals.h
-index 564ac86d..e9fe1177 100644
---- a/src/globals.h
-+++ b/src/globals.h
-@@ -1,39 +1,3 @@
--// libTorrent - BitTorrent library
--// Copyright (C) 2005-2011, Jari Sundell
--//
--// This program is free software; you can redistribute it and/or modify
--// it under the terms of the GNU General Public License as published by
--// the Free Software Foundation; either version 2 of the License, or
--// (at your option) any later version.
--//=20
--// This program is distributed in the hope that it will be useful,
--// but WITHOUT ANY WARRANTY; without even the implied warranty of
--// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--// GNU General Public License for more details.
--//=20
--// You should have received a copy of the GNU General Public License
--// along with this program; if not, write to the Free Software
--// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
--//
--// In addition, as a special exception, the copyright holders give
--// permission to link the code of portions of this program with the
--// OpenSSL library under certain conditions as described in each
--// individual source file, and distribute linked combinations
--// including the two.
--//
--// You must obey the GNU General Public License in all respects for
--// all of the code used other than OpenSSL.  If you modify file(s)
--// with this exception, you may extend this exception to your version
--// of the file(s), but you are not obligated to do so.  If you do not
--// wish to do so, delete this exception statement from your version.
--// If you delete this exception statement from all source files in the
--// program, then also delete it here.
--//
--// Contact:  Jari Sundell <jaris@ifi.uio.no>
--//
--//           Skomakerveien 33
--//           3185 Skoppum, NORWAY
--
- #ifndef LIBTORRENT_GLOBALS_H
- #define LIBTORRENT_GLOBALS_H
-=20
-diff --git a/src/manager.cc b/src/manager.cc
-index c503974d..11ef4b0f 100644
---- a/src/manager.cc
-+++ b/src/manager.cc
-@@ -1,39 +1,3 @@
--// libTorrent - BitTorrent library
--// Copyright (C) 2005-2011, Jari Sundell
--//
--// This program is free software; you can redistribute it and/or modify
--// it under the terms of the GNU General Public License as published by
--// the Free Software Foundation; either version 2 of the License, or
--// (at your option) any later version.
--//=20
--// This program is distributed in the hope that it will be useful,
--// but WITHOUT ANY WARRANTY; without even the implied warranty of
--// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--// GNU General Public License for more details.
--//=20
--// You should have received a copy of the GNU General Public License
--// along with this program; if not, write to the Free Software
--// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
--//
--// In addition, as a special exception, the copyright holders give
--// permission to link the code of portions of this program with the
--// OpenSSL library under certain conditions as described in each
--// individual source file, and distribute linked combinations
--// including the two.
--//
--// You must obey the GNU General Public License in all respects for
--// all of the code used other than OpenSSL.  If you modify file(s)
--// with this exception, you may extend this exception to your version
--// of the file(s), but you are not obligated to do so.  If you do not
--// wish to do so, delete this exception statement from your version.
--// If you delete this exception statement from all source files in the
--// program, then also delete it here.
--//
--// Contact:  Jari Sundell <jaris@ifi.uio.no>
--//
--//           Skomakerveien 33
--//           3185 Skoppum, NORWAY
--
- #include "config.h"
-=20
- #include "torrent/exceptions.h"
-diff --git a/src/net/Makefile.am b/src/net/Makefile.am
-index fb4da4f3..e3a8c7e1 100644
---- a/src/net/Makefile.am
-+++ b/src/net/Makefile.am
-@@ -15,6 +15,8 @@ libsub_net_la_SOURCES =3D \
- 	socket_datagram.h \
- 	socket_fd.cc \
- 	socket_fd.h \
-+	socket_listen.cc \
-+	socket_listen.h \
- 	socket_set.cc \
- 	socket_set.h \
- 	socket_stream.cc \
-diff --git a/src/net/data_buffer.h b/src/net/data_buffer.h
-index d35cdc48..5dd0cb30 100644
---- a/src/net/data_buffer.h
-+++ b/src/net/data_buffer.h
-@@ -38,7 +38,7 @@
- #define LIBTORRENT_NET_DATA_BUFFER_H
-=20
- #include <memory>
--#include <inttypes.h>
-+#include <cinttypes>
-=20
- namespace torrent {
-=20
-diff --git a/src/net/listen.cc b/src/net/listen.cc
-index d424e94c..61fedbf8 100644
---- a/src/net/listen.cc
-+++ b/src/net/listen.cc
-@@ -1,39 +1,3 @@
--// libTorrent - BitTorrent library
--// Copyright (C) 2005-2011, Jari Sundell
--//
--// This program is free software; you can redistribute it and/or modify
--// it under the terms of the GNU General Public License as published by
--// the Free Software Foundation; either version 2 of the License, or
--// (at your option) any later version.
--//=20
--// This program is distributed in the hope that it will be useful,
--// but WITHOUT ANY WARRANTY; without even the implied warranty of
--// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--// GNU General Public License for more details.
--//=20
--// You should have received a copy of the GNU General Public License
--// along with this program; if not, write to the Free Software
--// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
--//
--// In addition, as a special exception, the copyright holders give
--// permission to link the code of portions of this program with the
--// OpenSSL library under certain conditions as described in each
--// individual source file, and distribute linked combinations
--// including the two.
--//
--// You must obey the GNU General Public License in all respects for
--// all of the code used other than OpenSSL.  If you modify file(s)
--// with this exception, you may extend this exception to your version
--// of the file(s), but you are not obligated to do so.  If you do not
--// wish to do so, delete this exception statement from your version.
--// If you delete this exception statement from all source files in the
--// program, then also delete it here.
--//
--// Contact:  Jari Sundell <jaris@ifi.uio.no>
--//
--//           Skomakerveien 33
--//           3185 Skoppum, NORWAY
--
- #include "config.h"
-=20
- #define __STDC_FORMAT_MACROS
-@@ -95,7 +59,7 @@ Listen::open(uint16_t first, uint16_t last, int backlog,=
 const rak::socket_addre
-       manager->poll()->insert_read(this);
-       manager->poll()->insert_error(this);
-=20
--      lt_log_print(LOG_CONNECTION_INFO, "listen port %" PRIu16 " opened w=
ith backlog set to %i",
-+      lt_log_print(LOG_CONNECTION_LISTEN, "listen port %" PRIu16 " opened=
 with backlog set to %i",
-                    m_port, backlog);
-=20
-       return true;
-@@ -107,7 +71,7 @@ Listen::open(uint16_t first, uint16_t last, int backlog=
, const rak::socket_addre
-   get_fd().close();
-   get_fd().clear();
-=20
--  lt_log_print(LOG_CONNECTION_INFO, "failed to open listen port");
-+  lt_log_print(LOG_CONNECTION_LISTEN, "failed to open listen port");
-=20
-   return false;
- }
-diff --git a/src/net/listen.h b/src/net/listen.h
-index b3c845aa..58c06c7e 100644
---- a/src/net/listen.h
-+++ b/src/net/listen.h
-@@ -37,8 +37,8 @@
- #ifndef LIBTORRENT_LISTEN_H
- #define LIBTORRENT_LISTEN_H
-=20
--#include <inttypes.h>
--#include lt_tr1_functional
-+#include <cinttypes>
-+#include <functional>
- #include <rak/socket_address.h>
-=20
- #include "socket_base.h"
-diff --git a/src/net/protocol_buffer.h b/src/net/protocol_buffer.h
-index b64d47ea..f9711ded 100644
---- a/src/net/protocol_buffer.h
-+++ b/src/net/protocol_buffer.h
-@@ -38,7 +38,7 @@
- #define LIBTORRENT_NET_PROTOCOL_BUFFER_H
-=20
- #include <memory>
--#include <inttypes.h>
-+#include <cinttypes>
- #include <netinet/in.h>
-=20
- #include "torrent/exceptions.h"
-diff --git a/src/net/socket_base.h b/src/net/socket_base.h
-index 02c9497d..20ae1d9f 100644
---- a/src/net/socket_base.h
-+++ b/src/net/socket_base.h
-@@ -38,7 +38,7 @@
- #define LIBTORRENT_NET_SOCKET_BASE_H
-=20
- #include <list>
--#include <inttypes.h>
-+#include <cinttypes>
-=20
- #include "torrent/event.h"
- #include "socket_fd.h"
-diff --git a/src/net/socket_fd.cc b/src/net/socket_fd.cc
-index f04059f6..c36ff4b9 100644
---- a/src/net/socket_fd.cc
-+++ b/src/net/socket_fd.cc
-@@ -210,6 +210,11 @@ SocketFd::bind(const rak::socket_address& sa, unsigne=
d int length) {
-   return !::bind(m_fd, sa.c_sockaddr(), length);
- }
-=20
-+bool
-+SocketFd::bind_sa(const sockaddr* sa) {
-+  return bind(*rak::socket_address::cast_from(sa));
-+}
-+
- bool
- SocketFd::connect(const rak::socket_address& sa) {
-   check_valid();
-@@ -222,6 +227,11 @@ SocketFd::connect(const rak::socket_address& sa) {
-   return !::connect(m_fd, sa.c_sockaddr(), sa.length()) || errno =3D=3D E=
INPROGRESS;
- }
-=20
-+bool
-+SocketFd::connect_sa(const sockaddr* sa) {
-+  return connect(*rak::socket_address::cast_from(sa));
-+}
-+
- bool
- SocketFd::getsockname(rak::socket_address *sa) {
-   check_valid();
-diff --git a/src/net/socket_fd.h b/src/net/socket_fd.h
-index 2329b4e9..4db0087b 100644
---- a/src/net/socket_fd.h
-+++ b/src/net/socket_fd.h
-@@ -39,6 +39,8 @@
-=20
- #include <unistd.h>
-=20
-+struct sockaddr;
-+
- namespace rak {
-   class socket_address;
- }
-@@ -80,7 +82,11 @@ public:
-=20
-   bool                bind(const rak::socket_address& sa);
-   bool                bind(const rak::socket_address& sa, unsigned int le=
ngth);
-+  bool                bind_sa(const sockaddr* sa);
-+
-   bool                connect(const rak::socket_address& sa);
-+  bool                connect_sa(const sockaddr* sa);
-+
-   bool                getsockname(rak::socket_address* sa);
-=20
-   bool                listen(int size);
-diff --git a/src/net/socket_listen.cc b/src/net/socket_listen.cc
-new file mode 100644
-index 00000000..97f006e0
---- /dev/null
-+++ b/src/net/socket_listen.cc
-@@ -0,0 +1,137 @@
-+#include "config.h"
-+
-+#include "socket_listen.h"
-+
-+#include <algorithm>
-+
-+#include "torrent/connection_manager.h"
-+#include "torrent/exceptions.h"
-+#include "torrent/utils/log.h"
-+#include "torrent/utils/random.h"
-+
-+#define LT_LOG_SAP(log_fmt, sap, ...)                                   \
-+  lt_log_print(LOG_CONNECTION_LISTEN, "listen->%s: " log_fmt, sap_pretty_=
str(sap).c_str(), __VA_ARGS__);
-+
-+namespace torrent {
-+
-+socket_listen::socket_listen() : m_backlog(SOMAXCONN) {
-+}
-+
-+void
-+socket_listen::set_backlog(int backlog) {
-+  if (backlog < 0 || backlog > SOMAXCONN)
-+    throw internal_error("Could not set socket_listen backlog, out-of-ran=
ge value.");
-+
-+  m_backlog =3D backlog;
-+}
-+
-+bool
-+socket_listen::open(sa_unique_ptr&& sap, uint16_t first_port, uint16_t la=
st_port, uint16_t start_port, fd_flags open_flags) {
-+  if (is_open())
-+    throw internal_error("socket_listen::open: already open");
-+
-+  if (!(sap_is_inet(sap) || sap_is_inet6(sap)) || sap_is_v4mapped(sap) ||=
 !sap_is_port_any(sap) || sap_is_broadcast(sap))
-+    throw internal_error("socket_listen::open: socket address must be ine=
t/inet6 with no port, and not v4mapped nor broadcast: " + sap_pretty_str(sa=
p));
-+
-+  if (sap_is_inet(sap) && !(open_flags & fd_flag_v4only))
-+    throw internal_error("socket_listen::open: socket address is inet wit=
hout v4only flag");
-+
-+  if (first_port =3D=3D 0 || last_port =3D=3D 0 || start_port =3D=3D 0 ||
-+      !(first_port <=3D last_port && first_port <=3D start_port && start_=
port <=3D last_port))
-+    throw internal_error("socket_listen::open: port range not valid");
-+
-+  int fd =3D fd_open(open_flags);
-+
-+  if (fd =3D=3D -1) {
-+    LT_LOG_SAP("open failed (flags:0x%x errno:%i message:'%s')", sap, ope=
n_flags, errno, std::strerror(errno));
-+    return false;
-+  }
-+
-+  uint16_t p =3D start_port;
-+
-+  do {
-+    if (m_open_port(fd, sap, p))
-+      return is_open();
-+
-+    if (p =3D=3D last_port)
-+      p =3D first_port;
-+    else
-+      p++;
-+  } while (p !=3D start_port);
-+
-+  LT_LOG_SAP("listen ports exhausted (fd:%i first_port:%" PRIu16 " last_p=
ort:%" PRIu16 ")",
-+             sap, fd, first_port, last_port);
-+  fd_close(fd);
-+  return false;
-+}
-+
-+bool
-+socket_listen::open_randomize(sa_unique_ptr&& sap, uint16_t first_port, u=
int16_t last_port, fd_flags open_flags) {
-+  if (last_port < first_port)
-+    throw internal_error("socket_listen::open_randomize: port range not v=
alid");
-+
-+  return open(std::move(sap), first_port, last_port, random_uniform_uint1=
6(first_port, last_port), open_flags);
-+}
-+
-+bool
-+socket_listen::open_sequential(sa_unique_ptr&& sap, uint16_t first_port, =
uint16_t last_port, fd_flags open_flags) {
-+  return open(std::move(sap), first_port, last_port, first_port, open_fla=
gs);
-+}
-+
-+void
-+socket_listen::close() {
-+  if (!is_open())
-+    return;
-+
-+  torrent::poll_event_closed(this);
-+
-+  fd_close(file_descriptor());
-+  set_file_descriptor(-1);
-+  m_socket_address.reset();
-+}
-+
-+void
-+socket_listen::event_read() {
-+}
-+
-+void
-+socket_listen::event_error() {
-+}
-+
-+// Returns true if open is successful or if we cannot bind to the
-+// address, returns false if other ports can be used.
-+bool
-+socket_listen::m_open_port(int fd, sa_unique_ptr& sap, uint16_t port) {
-+  sap_set_port(sap, port);
-+
-+  if (!fd_bind(fd, sap.get())) {
-+    if (errno =3D=3D EADDRNOTAVAIL || errno =3D=3D EAFNOSUPPORT) {
-+      LT_LOG_SAP("listen address not usable (fd:%i errno:%i message:'%s')=
",
-+                 sap, fd, errno, std::strerror(errno));
-+      fd_close(fd);
-+      return true;
-+    }
-+
-+    return false;
-+  }
-+
-+  if (!fd_listen(fd, m_backlog)) {
-+    LT_LOG_SAP("call to listen failed (fd:%i backlog:%i errno:%i message:=
'%s')",
-+               sap, fd, m_backlog, errno, std::strerror(errno));
-+    fd_close(fd);
-+    return true;
-+  }
-+
-+  LT_LOG_SAP("open listen port success (fd:%i backlog:%i)", sap, fd, m_ba=
cklog);
-+
-+  m_fileDesc =3D fd;
-+  m_socket_address.swap(sap);
-+
-+  torrent::poll_event_open(this);
-+  torrent::poll_event_insert_read(this);
-+  torrent::poll_event_insert_error(this);
-+
-+  return true;
-+}
-+
-+}
-diff --git a/src/net/socket_listen.h b/src/net/socket_listen.h
-new file mode 100644
-index 00000000..817d5fa5
---- /dev/null
-+++ b/src/net/socket_listen.h
-@@ -0,0 +1,46 @@
-+#ifndef LIBTORRENT_SOCKET_LISTEN_H
-+#define LIBTORRENT_SOCKET_LISTEN_H
-+
-+#include <cinttypes>
-+#include <functional>
-+
-+#include "torrent/net/fd.h"
-+#include "torrent/net/socket_address.h"
-+#include "torrent/net/socket_event.h"
-+
-+namespace torrent {
-+
-+class socket_listen : public socket_event {
-+public:
-+  typedef std::function<void (int, sa_unique_ptr)> accepted_ftor;
-+
-+  socket_listen();
-+
-+  int  backlog() const;
-+
-+  void set_backlog(int backlog);
-+  void set_slot_accepted(accepted_ftor&& ftor);
-+
-+  bool open(sa_unique_ptr&& sap, uint16_t first_port, uint16_t last_port,=
 uint16_t start_port, fd_flags open_flags);
-+  bool open_randomize(sa_unique_ptr&& sap, uint16_t first_port, uint16_t =
last_port, fd_flags open_flags);
-+  bool open_sequential(sa_unique_ptr&& sap, uint16_t first_port, uint16_t=
 last_port, fd_flags open_flags);
-+  void close();
-+
-+  void event_read() override;
-+  void event_error() override;
-+
-+  const char* type_name() const override { return "socket_listen"; }
-+
-+private:
-+  bool m_open_port(int fd, sa_unique_ptr& sap, uint16_t port);
-+
-+  int           m_backlog;
-+  accepted_ftor m_slot_accepted;
-+};
-+
-+inline int  socket_listen::backlog() const { return m_backlog; }
-+inline void socket_listen::set_slot_accepted(accepted_ftor&& ftor) { m_sl=
ot_accepted =3D ftor; }
-+
-+}
-+
-+#endif
-diff --git a/src/net/socket_set.h b/src/net/socket_set.h
-index 9264edf7..78443c88 100644
---- a/src/net/socket_set.h
-+++ b/src/net/socket_set.h
-@@ -39,7 +39,7 @@
-=20
- #include <list>
- #include <vector>
--#include <inttypes.h>
-+#include <cinttypes>
- #include <rak/allocators.h>
-=20
- #include "torrent/exceptions.h"
-diff --git a/src/net/throttle_node.h b/src/net/throttle_node.h
-index 77cb6cc7..5af27a22 100644
---- a/src/net/throttle_node.h
-+++ b/src/net/throttle_node.h
-@@ -37,7 +37,7 @@
- #ifndef LIBTORRENT_NET_THROTTLE_NODE_H
- #define LIBTORRENT_NET_THROTTLE_NODE_H
-=20
--#include lt_tr1_functional
-+#include <functional>
-=20
- #include "torrent/rate.h"
-=20
-diff --git a/src/protocol/handshake.cc b/src/protocol/handshake.cc
-index 6b41bbe3..1b877c7a 100644
---- a/src/protocol/handshake.cc
-+++ b/src/protocol/handshake.cc
-@@ -46,6 +46,7 @@
- #include "torrent/error.h"
- #include "torrent/poll.h"
- #include "torrent/throttle.h"
-+#include "torrent/utils/log.h"
- #include "utils/diffie_hellman.h"
-=20
- #include "globals.h"
-@@ -55,6 +56,10 @@
- #include "handshake.h"
- #include "handshake_manager.h"
-=20
-+#define LT_LOG(log_fmt, ...)                                            \
-+  lt_log_print(LOG_CONNECTION_HANDSHAKE, "handshake->%s: " log_fmt,     \
-+               m_address.pretty_address_str().c_str(), __VA_ARGS__);
-+
- namespace torrent {
-=20
- const char* Handshake::m_protocol =3D "BitTorrent protocol";
-@@ -862,7 +867,7 @@ restart:
-     m_manager->receive_failed(this, e.type(), e.error());
-=20
-   } catch (network_error& e) {
--    m_manager->receive_failed(this, ConnectionManager::handshake_failed, =
e_handshake_network_error);
-+    m_manager->receive_failed(this, ConnectionManager::handshake_failed, =
e_handshake_network_read_error);
-   }
- }
-=20
-@@ -969,7 +974,7 @@ Handshake::event_write() {
-     m_manager->receive_failed(this, e.type(), e.error());
-=20
-   } catch (network_error& e) {
--    m_manager->receive_failed(this, ConnectionManager::handshake_failed, =
e_handshake_network_error);
-+    m_manager->receive_failed(this, ConnectionManager::handshake_failed, =
e_handshake_network_write_error);
-   }
- }
-=20
-@@ -1070,7 +1075,7 @@ Handshake::prepare_peer_info() {
-     m_peerInfo =3D m_download->peer_list()->connected(m_address.c_sockadd=
r(), PeerList::connect_incoming);
-=20
-     if (m_peerInfo =3D=3D NULL)
--      throw handshake_error(ConnectionManager::handshake_failed, e_handsh=
ake_network_error);
-+      throw handshake_error(ConnectionManager::handshake_failed, e_handsh=
ake_no_peer_info);
-=20
-     if (m_peerInfo->failed_counter() > m_manager->max_failed)
-       throw handshake_error(ConnectionManager::handshake_dropped, e_hands=
hake_toomanyfailed);
-@@ -1221,7 +1226,7 @@ Handshake::event_error() {
-   if (m_state =3D=3D INACTIVE)
-     throw internal_error("Handshake::event_error() called on an inactive =
handshake.");
-=20
--  m_manager->receive_failed(this, ConnectionManager::handshake_failed, e_=
handshake_network_error);
-+  m_manager->receive_failed(this, ConnectionManager::handshake_failed, e_=
handshake_network_socket_error);
- }
-=20
- }
-diff --git a/src/protocol/handshake_manager.cc b/src/protocol/handshake_ma=
nager.cc
-index b52c8d4e..99592ba8 100644
---- a/src/protocol/handshake_manager.cc
-+++ b/src/protocol/handshake_manager.cc
-@@ -1,39 +1,3 @@
--// libTorrent - BitTorrent library
--// Copyright (C) 2005-2011, Jari Sundell
--//
--// This program is free software; you can redistribute it and/or modify
--// it under the terms of the GNU General Public License as published by
--// the Free Software Foundation; either version 2 of the License, or
--// (at your option) any later version.
--//=20
--// This program is distributed in the hope that it will be useful,
--// but WITHOUT ANY WARRANTY; without even the implied warranty of
--// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--// GNU General Public License for more details.
--//=20
--// You should have received a copy of the GNU General Public License
--// along with this program; if not, write to the Free Software
--// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
--//
--// In addition, as a special exception, the copyright holders give
--// permission to link the code of portions of this program with the
--// OpenSSL library under certain conditions as described in each
--// individual source file, and distribute linked combinations
--// including the two.
--//
--// You must obey the GNU General Public License in all respects for
--// all of the code used other than OpenSSL.  If you modify file(s)
--// with this exception, you may extend this exception to your version
--// of the file(s), but you are not obligated to do so.  If you do not
--// wish to do so, delete this exception statement from your version.
--// If you delete this exception statement from all source files in the
--// program, then also delete it here.
--//
--// Contact:  Jari Sundell <jaris@ifi.uio.no>
--//
--//           Skomakerveien 33
--//           3185 Skoppum, NORWAY
--
- #include "config.h"
-=20
- #include <rak/socket_address.h>
-@@ -54,10 +18,10 @@
-=20
- #include "manager.h"
-=20
--#define LT_LOG_SA(log_level, sa, log_fmt, ...)                          \
--  lt_log_print(LOG_CONNECTION_##log_level, "handshake_manager->%s: " log_=
fmt, (sa)->address_str().c_str(), __VA_ARGS__);
--#define LT_LOG_SA_C(log_level, sa, log_fmt, ...)                        \
--  lt_log_print(LOG_CONNECTION_##log_level, "handshake_manager->%s: " log_=
fmt, \
-+#define LT_LOG_SA(sa, log_fmt, ...)                                     \
-+  lt_log_print(LOG_CONNECTION_HANDSHAKE, "handshake_manager->%s: " log_fm=
t, (sa)->address_str().c_str(), __VA_ARGS__);
-+#define LT_LOG_SA_C(sa, log_fmt, ...)                                   \
-+  lt_log_print(LOG_CONNECTION_HANDSHAKE, "handshake_manager->%s: " log_fm=
t, \
-                reinterpret_cast<const rak::socket_address*>(sa)->address_=
str().c_str(), __VA_ARGS__);
-=20
- namespace torrent {
-@@ -122,7 +86,7 @@ HandshakeManager::add_incoming(SocketFd fd, const rak::=
socket_address& sa) {
-     return;
-   }
-=20
--  LT_LOG_SA(INFO, &sa, "Adding incoming connection: fd:%i.", fd.get_fd())=
;
-+  LT_LOG_SA(&sa, "Adding incoming connection: fd:%i.", fd.get_fd());
-=20
-   manager->connection_manager()->inc_socket_count();
-=20
-@@ -183,7 +147,7 @@ HandshakeManager::create_outgoing(const rak::socket_ad=
dress& sa, DownloadMain* d
-   else
-     message =3D ConnectionManager::handshake_outgoing;
-=20
--  LT_LOG_SA(INFO, &sa, "Adding outcoming connection: encryption:%x messag=
e:%x.", encryptionOptions, message);
-+  LT_LOG_SA(&sa, "Adding outcoming connection: encryption:%x message:%x."=
, encryptionOptions, message);
-   manager->connection_manager()->inc_socket_count();
-=20
-   Handshake* handshake =3D new Handshake(fd, this, encryptionOptions);
-@@ -213,7 +177,7 @@ HandshakeManager::receive_succeeded(Handshake* handsha=
ke) {
-                                                  handshake->extensions())=
) !=3D NULL) {
-    =20
-     manager->client_list()->retrieve_id(&handshake->peer_info()->mutable_=
client_info(), handshake->peer_info()->id());
--    LT_LOG_SA_C(INFO, handshake->peer_info()->socket_address(), "Handshak=
e success.", 0);
-+    LT_LOG_SA_C(handshake->peer_info()->socket_address(), "Handshake succ=
ess.", 0);
-=20
-     pcb->peer_chunks()->set_have_timer(handshake->initialized_time());
-=20
-@@ -237,7 +201,7 @@ HandshakeManager::receive_succeeded(Handshake* handsha=
ke) {
-     else
-       reason =3D e_handshake_duplicate;
-=20
--    LT_LOG_SA_C(INFO, handshake->peer_info()->socket_address(), "Handshak=
e dropped: %s.", strerror(reason));
-+    LT_LOG_SA_C(handshake->peer_info()->socket_address(), "Handshake drop=
ped: %s.", strerror(reason));
-     handshake->destroy_connection();
-   }
-=20
-@@ -255,13 +219,13 @@ HandshakeManager::receive_failed(Handshake* handshak=
e, int message, int error) {
-   handshake->deactivate_connection();
-   handshake->destroy_connection();
-=20
--  LT_LOG_SA(INFO, sa, "Received error: message:%x %s.", message, strerror=
(error));
-+  LT_LOG_SA(sa, "Received error: message:%x %s.", message, strerror(error=
));
-=20
-   if (handshake->encryption()->should_retry()) {
-     int retry_options =3D handshake->retry_options() | ConnectionManager:=
:encryption_retrying;
-     DownloadMain* download =3D handshake->download();
-=20
--    LT_LOG_SA(INFO, sa, "Retrying %s.",
-+    LT_LOG_SA(sa, "Retrying %s.",
-               retry_options & ConnectionManager::encryption_try_outgoing =
? "encrypted" : "plaintext");
-=20
-     create_outgoing(*sa, download, retry_options);
-diff --git a/src/protocol/handshake_manager.h b/src/protocol/handshake_man=
ager.h
-index cfd52aa0..dc398e3e 100644
---- a/src/protocol/handshake_manager.h
-+++ b/src/protocol/handshake_manager.h
-@@ -1,45 +1,9 @@
--// libTorrent - BitTorrent library
--// Copyright (C) 2005-2011, Jari Sundell
--//
--// This program is free software; you can redistribute it and/or modify
--// it under the terms of the GNU General Public License as published by
--// the Free Software Foundation; either version 2 of the License, or
--// (at your option) any later version.
--//=20
--// This program is distributed in the hope that it will be useful,
--// but WITHOUT ANY WARRANTY; without even the implied warranty of
--// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--// GNU General Public License for more details.
--//=20
--// You should have received a copy of the GNU General Public License
--// along with this program; if not, write to the Free Software
--// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
--//
--// In addition, as a special exception, the copyright holders give
--// permission to link the code of portions of this program with the
--// OpenSSL library under certain conditions as described in each
--// individual source file, and distribute linked combinations
--// including the two.
--//
--// You must obey the GNU General Public License in all respects for
--// all of the code used other than OpenSSL.  If you modify file(s)
--// with this exception, you may extend this exception to your version
--// of the file(s), but you are not obligated to do so.  If you do not
--// wish to do so, delete this exception statement from your version.
--// If you delete this exception statement from all source files in the
--// program, then also delete it here.
--//
--// Contact:  Jari Sundell <jaris@ifi.uio.no>
--//
--//           Skomakerveien 33
--//           3185 Skoppum, NORWAY
--
- #ifndef LIBTORRENT_NET_HANDSHAKE_MANAGER_H
- #define LIBTORRENT_NET_HANDSHAKE_MANAGER_H
-=20
--#include <string>
-+#include <functional>
- #include <inttypes.h>
--#include lt_tr1_functional
-+#include <string>
- #include <rak/functional.h>
- #include <rak/unordered_vector.h>
- #include <rak/socket_address.h>
-diff --git a/src/protocol/peer_connection_base.cc b/src/protocol/peer_conn=
ection_base.cc
-index c02998fb..bd870425 100644
---- a/src/protocol/peer_connection_base.cc
-+++ b/src/protocol/peer_connection_base.cc
-@@ -36,8 +36,6 @@
-=20
- #include "config.h"
-=20
--#define __STDC_FORMAT_MACROS
--
- #include <cstdio>
- #include <fcntl.h>
- #include <rak/error_number.h>
-diff --git a/src/protocol/request_list.cc b/src/protocol/request_list.cc
-index a4338bcb..ea5d388a 100644
---- a/src/protocol/request_list.cc
-+++ b/src/protocol/request_list.cc
-@@ -1,44 +1,8 @@
--// libTorrent - BitTorrent library
--// Copyright (C) 2005-2011, Jari Sundell
--//
--// This program is free software; you can redistribute it and/or modify
--// it under the terms of the GNU General Public License as published by
--// the Free Software Foundation; either version 2 of the License, or
--// (at your option) any later version.
--//=20
--// This program is distributed in the hope that it will be useful,
--// but WITHOUT ANY WARRANTY; without even the implied warranty of
--// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--// GNU General Public License for more details.
--//=20
--// You should have received a copy of the GNU General Public License
--// along with this program; if not, write to the Free Software
--// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
--//
--// In addition, as a special exception, the copyright holders give
--// permission to link the code of portions of this program with the
--// OpenSSL library under certain conditions as described in each
--// individual source file, and distribute linked combinations
--// including the two.
--//
--// You must obey the GNU General Public License in all respects for
--// all of the code used other than OpenSSL.  If you modify file(s)
--// with this exception, you may extend this exception to your version
--// of the file(s), but you are not obligated to do so.  If you do not
--// wish to do so, delete this exception statement from your version.
--// If you delete this exception statement from all source files in the
--// program, then also delete it here.
--//
--// Contact:  Jari Sundell <jaris@ifi.uio.no>
--//
--//           Skomakerveien 33
--//           3185 Skoppum, NORWAY
--
- #include "config.h"
-=20
- #include <algorithm>
- #include <functional>
--#include <inttypes.h>
-+#include <cinttypes>
- #include <rak/functional.h>
-=20
- #include "torrent/data/block.h"
-diff --git a/src/torrent/Makefile.am b/src/torrent/Makefile.am
-index 1bdfde3d..8cd26ce7 100644
---- a/src/torrent/Makefile.am
-+++ b/src/torrent/Makefile.am
-@@ -22,6 +22,7 @@ libsub_torrent_la_SOURCES =3D \
- 	download_info.h \
- 	error.cc \
- 	error.h \
-+	event.cc \
- 	event.h \
- 	exceptions.cc \
- 	exceptions.h \
-diff --git a/src/torrent/common.h b/src/torrent/common.h
-index 3363143d..42cc3246 100644
---- a/src/torrent/common.h
-+++ b/src/torrent/common.h
-@@ -37,10 +37,13 @@
- #ifndef LIBTORRENT_COMMON_H
- #define LIBTORRENT_COMMON_H
-=20
--#include <inttypes.h>
-+#include <cinttypes>
- #include <cstddef>
-=20
- struct sockaddr;
-+struct sockaddr_in;
-+struct sockaddr_in6;
-+struct sockaddr_un;
-=20
- namespace torrent {
-=20
-diff --git a/src/torrent/connection_manager.h b/src/torrent/connection_man=
ager.h
-index 2dcf2b37..cf43b0bf 100644
---- a/src/torrent/connection_manager.h
-+++ b/src/torrent/connection_manager.h
-@@ -39,13 +39,13 @@
- #ifndef LIBTORRENT_CONNECTION_MANAGER_H
- #define LIBTORRENT_CONNECTION_MANAGER_H
-=20
-+#include <functional>
- #include <list>
- #include <arpa/inet.h>
- #include <netinet/in.h>
- #include <netinet/in_systm.h>
- #include <netinet/ip.h>
- #include <sys/socket.h>
--#include lt_tr1_functional
- #include <torrent/common.h>
-=20
- namespace torrent {
-diff --git a/src/torrent/data/download_data.h b/src/torrent/data/download_=
data.h
-index 2b9c9412..fc212047 100644
---- a/src/torrent/data/download_data.h
-+++ b/src/torrent/data/download_data.h
-@@ -37,7 +37,7 @@
- #ifndef LIBTORRENT_DATA_DOWNLOAD_DATA_H
- #define LIBTORRENT_DATA_DOWNLOAD_DATA_H
-=20
--#include lt_tr1_functional
-+#include <functional>
-=20
- #include <torrent/common.h>
- #include <torrent/bitfield.h>
-diff --git a/src/torrent/data/file_list.cc b/src/torrent/data/file_list.cc
-index 4721bdbd..2e334fa8 100644
---- a/src/torrent/data/file_list.cc
-+++ b/src/torrent/data/file_list.cc
-@@ -36,8 +36,6 @@
-=20
- #include "config.h"
-=20
--#define __STDC_FORMAT_MACROS
--
- #include <algorithm>
- #include <cstring>
- #include <functional>
-diff --git a/src/torrent/data/transfer_list.h b/src/torrent/data/transfer_=
list.h
-index 0a359b5e..9813af12 100644
---- a/src/torrent/data/transfer_list.h
-+++ b/src/torrent/data/transfer_list.h
-@@ -37,9 +37,10 @@
- #ifndef LIBTORRENT_TRANSFER_LIST_H
- #define LIBTORRENT_TRANSFER_LIST_H
-=20
-+#include <functional>
- #include <vector>
-+
- #include <torrent/common.h>
--#include lt_tr1_functional
-=20
- namespace torrent {
-=20
-diff --git a/src/torrent/download.cc b/src/torrent/download.cc
-index edddedfb..f72c9351 100644
---- a/src/torrent/download.cc
-+++ b/src/torrent/download.cc
-@@ -36,9 +36,7 @@
-=20
- #include "config.h"
-=20
--#define __STDC_FORMAT_MACROS
--
--#include <inttypes.h>
-+#include <cinttypes>
-=20
- #include "data/block.h"
- #include "data/block_list.h"
-diff --git a/src/torrent/download/choke_group.cc b/src/torrent/download/ch=
oke_group.cc
-index a1540fc1..d9b25a9c 100644
---- a/src/torrent/download/choke_group.cc
-+++ b/src/torrent/download/choke_group.cc
-@@ -37,7 +37,7 @@
- #include "config.h"
-=20
- #include <algorithm>
--#include lt_tr1_functional
-+#include <functional>
-=20
- #include "choke_group.h"
- #include "choke_queue.h"
-diff --git a/src/torrent/download/choke_group.h b/src/torrent/download/cho=
ke_group.h
-index 93fd1d02..50804b3e 100644
---- a/src/torrent/download/choke_group.h
-+++ b/src/torrent/download/choke_group.h
-@@ -39,7 +39,7 @@
-=20
- #include <string>
- #include <vector>
--#include <inttypes.h>
-+#include <cinttypes>
- #include <torrent/common.h>
- #include <torrent/download/choke_queue.h>
-=20
-diff --git a/src/torrent/download/choke_queue.cc b/src/torrent/download/ch=
oke_queue.cc
-index 3827e25e..7c00b686 100644
---- a/src/torrent/download/choke_queue.cc
-+++ b/src/torrent/download/choke_queue.cc
-@@ -37,10 +37,9 @@
- #include "config.h"
-=20
- #include <algorithm>
-+#include <cstdlib>
- #include <functional>
- #include <numeric>
--#include <cstdlib>
--#include lt_tr1_functional
- #include <rak/functional.h>
-=20
- #include "protocol/peer_connection_base.h"
-diff --git a/src/torrent/download/choke_queue.h b/src/torrent/download/cho=
ke_queue.h
-index 973f6522..5e274a99 100644
---- a/src/torrent/download/choke_queue.h
-+++ b/src/torrent/download/choke_queue.h
-@@ -39,10 +39,11 @@
-=20
- #include <torrent/common.h>
-=20
-+#include <cinttypes>
-+#include <functional>
- #include <list>
- #include <vector>
--#include <inttypes.h>
--#include lt_tr1_functional
-+
- #include <torrent/download/group_entry.h>
-=20
- namespace torrent {
-diff --git a/src/torrent/download/group_entry.h b/src/torrent/download/gro=
up_entry.h
-index e167ecbb..a7c9e429 100644
---- a/src/torrent/download/group_entry.h
-+++ b/src/torrent/download/group_entry.h
-@@ -38,8 +38,9 @@
- #define LIBTORRENT_DOWNLOAD_GROUP_ENTRY_H
-=20
- #include <algorithm>
-+#include <functional>
- #include <vector>
--#include lt_tr1_functional
-+
- #include <torrent/common.h>
- #include <torrent/exceptions.h>
-=20
-diff --git a/src/torrent/download/resource_manager.cc b/src/torrent/downlo=
ad/resource_manager.cc
-index bc6374d2..51434c91 100644
---- a/src/torrent/download/resource_manager.cc
-+++ b/src/torrent/download/resource_manager.cc
-@@ -38,7 +38,6 @@
-=20
- #include <algorithm>
- #include <functional>
--#include lt_tr1_functional
- #include <limits>
- #include <numeric>
- #include <rak/functional.h>
-diff --git a/src/torrent/download/resource_manager.h b/src/torrent/downloa=
d/resource_manager.h
-index b2f861af..ba61b45f 100644
---- a/src/torrent/download/resource_manager.h
-+++ b/src/torrent/download/resource_manager.h
-@@ -39,7 +39,7 @@
-=20
- #include <string>
- #include <vector>
--#include <inttypes.h>
-+#include <cinttypes>
- #include <torrent/common.h>
-=20
- namespace torrent {
-diff --git a/src/torrent/download_info.h b/src/torrent/download_info.h
-index 341e4c25..2c4dbaf2 100644
---- a/src/torrent/download_info.h
-+++ b/src/torrent/download_info.h
-@@ -37,10 +37,10 @@
- #ifndef LIBTORRENT_DOWNLOAD_INFO_H
- #define LIBTORRENT_DOWNLOAD_INFO_H
-=20
-+#include <cinttypes>
-+#include <functional>
- #include <list>
- #include <string>
--#include <inttypes.h>
--#include lt_tr1_functional
-=20
- #include <torrent/rate.h>
- #include <torrent/hash_string.h>
-diff --git a/src/torrent/error.cc b/src/torrent/error.cc
-index 5010c803..eea9bb83 100644
---- a/src/torrent/error.cc
-+++ b/src/torrent/error.cc
-@@ -54,11 +54,15 @@ static const char* errorStrings[e_last + 1] =3D {
-   "unencrypted connection rejected",    // eh_unencrypted_rejected
-   "invalid encryption method",          // eh_invalid_encryption
-   "encryption sync failed",             // eh_encryption_sync_failed
--  "network error",                      // eh_network_error
-+  "<deprecated>",                       // eh_
-   "network unreachable",                // eh_network_unreachable
-   "network timeout",                    // eh_network_timeout
-   "invalid message order",              // eh_invalid_order
-   "too many failed chunks",             // eh_toomanyfailed
-+  "no peer info",                       // eh_no_peer_info
-+  "network socket error",               // eh_network_socket_error
-+  "network read error",                 // eh_network_read_error
-+  "network write error",                // eh_network_write_error
-=20
- //   "", // e_handshake_incoming
- //   "", // e_handshake_outgoing
-diff --git a/src/torrent/error.h b/src/torrent/error.h
-index f3fac463..295a595b 100644
---- a/src/torrent/error.h
-+++ b/src/torrent/error.h
-@@ -55,11 +55,14 @@ const int e_handshake_invalid_value             =3D 8;
- const int e_handshake_unencrypted_rejected      =3D 9;
- const int e_handshake_invalid_encryption        =3D 10;
- const int e_handshake_encryption_sync_failed    =3D 11;
--const int e_handshake_network_error             =3D 12;
- const int e_handshake_network_unreachable       =3D 13;
- const int e_handshake_network_timeout           =3D 14;
- const int e_handshake_invalid_order             =3D 15;
- const int e_handshake_toomanyfailed             =3D 16;
-+const int e_handshake_no_peer_info              =3D 17;
-+const int e_handshake_network_socket_error      =3D 18;
-+const int e_handshake_network_read_error        =3D 19;
-+const int e_handshake_network_write_error       =3D 20;
-=20
- // const int e_handshake_incoming                  =3D 13;
- // const int e_handshake_outgoing                  =3D 14;
-@@ -69,7 +72,7 @@ const int e_handshake_toomanyfailed             =3D 16;
- // const int e_handshake_retry_plaintext           =3D 18;
- // const int e_handshake_retry_encrypted           =3D 19;
-=20
--const int e_last                                =3D 16;
-+const int e_last                                =3D 20;
-=20
- const char* strerror(int err) LIBTORRENT_EXPORT;
-=20
-diff --git a/src/torrent/event.cc b/src/torrent/event.cc
-new file mode 100644
-index 00000000..e68974ea
---- /dev/null
-+++ b/src/torrent/event.cc
-@@ -0,0 +1,19 @@
-+#include "config.h"
-+
-+#include "event.h"
-+
-+#include "torrent/exceptions.h"
-+#include "torrent/net/fd.h"
-+
-+namespace torrent {
-+
-+void
-+Event::close_file_descriptor() {
-+  if (!is_open())
-+    throw internal_error("Tried to close already closed file descriptor o=
n event type " + std::string(type_name()));
-+
-+  fd_close(m_fileDesc);
-+  m_fileDesc =3D -1;
-+}
-+
-+}
-diff --git a/src/torrent/event.h b/src/torrent/event.h
-index f3549762..73f87e46 100644
---- a/src/torrent/event.h
-+++ b/src/torrent/event.h
-@@ -1,39 +1,3 @@
--// libTorrent - BitTorrent library
--// Copyright (C) 2005-2011, Jari Sundell
--//
--// This program is free software; you can redistribute it and/or modify
--// it under the terms of the GNU General Public License as published by
--// the Free Software Foundation; either version 2 of the License, or
--// (at your option) any later version.
--//=20
--// This program is distributed in the hope that it will be useful,
--// but WITHOUT ANY WARRANTY; without even the implied warranty of
--// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--// GNU General Public License for more details.
--//=20
--// You should have received a copy of the GNU General Public License
--// along with this program; if not, write to the Free Software
--// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
--//
--// In addition, as a special exception, the copyright holders give
--// permission to link the code of portions of this program with the
--// OpenSSL library under certain conditions as described in each
--// individual source file, and distribute linked combinations
--// including the two.
--//
--// You must obey the GNU General Public License in all respects for
--// all of the code used other than OpenSSL.  If you modify file(s)
--// with this exception, you may extend this exception to your version
--// of the file(s), but you are not obligated to do so.  If you do not
--// wish to do so, delete this exception statement from your version.
--// If you delete this exception statement from all source files in the
--// program, then also delete it here.
--//
--// Contact:  Jari Sundell <jaris@ifi.uio.no>
--//
--//           Skomakerveien 33
--//           3185 Skoppum, NORWAY
--
- #ifndef LIBTORRENT_TORRENT_EVENT_H
- #define LIBTORRENT_TORRENT_EVENT_H
-=20
-@@ -43,26 +7,48 @@ namespace torrent {
-=20
- class LIBTORRENT_EXPORT Event {
- public:
--  virtual ~Event() {}
-+  Event();
-+  virtual ~Event();
-=20
--  // These are not virtual as the fd is heavily used in select based
--  // polling, thus fast access is critical to performance.
--  int                 file_descriptor() const { return m_fileDesc; }
-+  // TODO: Disable override.
-+  bool is_open() const;
-=20
--  virtual void        event_read() =3D 0;
--  virtual void        event_write() =3D 0;
--  virtual void        event_error() =3D 0;
-+  int file_descriptor() const;
-=20
--  // Require all event types to define this function.
--  virtual const char* type_name() const { return "default"; }
-+  virtual void event_read() =3D 0;
-+  virtual void event_write() =3D 0;
-+  virtual void event_error() =3D 0;
-=20
--  // Event closed?
-+  // TODO: Require all to define their ownh typename.
-+  virtual const char* type_name() const { return "default"; }
-=20
- protected:
--  int                 m_fileDesc;
--  bool                m_ipv6_socket;
-+  void close_file_descriptor();
-+  void set_file_descriptor(int fd);
-+
-+  int  m_fileDesc;
-+
-+  // TODO: Deprecate.
-+  bool m_ipv6_socket;
- };
-=20
-+inline Event::Event() : m_fileDesc(-1), m_ipv6_socket(false) {}
-+inline Event::~Event() {}
-+inline bool Event::is_open() const { return file_descriptor() !=3D -1; }
-+inline int  Event::file_descriptor() const { return m_fileDesc; }
-+inline void Event::set_file_descriptor(int fd) { m_fileDesc =3D fd; }
-+
-+// Defined in 'src/globals.cc'.
-+[[gnu::weak]] void poll_event_open(Event* event) LIBTORRENT_EXPORT;
-+[[gnu::weak]] void poll_event_close(Event* event) LIBTORRENT_EXPORT;
-+[[gnu::weak]] void poll_event_closed(Event* event) LIBTORRENT_EXPORT;
-+[[gnu::weak]] void poll_event_insert_read(Event* event) LIBTORRENT_EXPORT=
;
-+[[gnu::weak]] void poll_event_insert_write(Event* event) LIBTORRENT_EXPOR=
T;
-+[[gnu::weak]] void poll_event_insert_error(Event* event) LIBTORRENT_EXPOR=
T;
-+[[gnu::weak]] void poll_event_remove_read(Event* event) LIBTORRENT_EXPORT=
;
-+[[gnu::weak]] void poll_event_remove_write(Event* event) LIBTORRENT_EXPOR=
T;
-+[[gnu::weak]] void poll_event_remove_error(Event* event) LIBTORRENT_EXPOR=
T;
-+
- }
-=20
- #endif
-diff --git a/src/torrent/http.h b/src/torrent/http.h
-index c68d3933..c605afa5 100644
---- a/src/torrent/http.h
-+++ b/src/torrent/http.h
-@@ -38,9 +38,9 @@
- #define LIBTORRENT_HTTP_H
-=20
- #include <string>
-+#include <functional>
- #include <iosfwd>
- #include <list>
--#include lt_tr1_functional
- #include <torrent/common.h>
-=20
- namespace torrent {
-diff --git a/src/torrent/net/Makefile.am b/src/torrent/net/Makefile.am
-index 51999d19..35dd4774 100644
---- a/src/torrent/net/Makefile.am
-+++ b/src/torrent/net/Makefile.am
-@@ -1,11 +1,25 @@
- noinst_LTLIBRARIES =3D libsub_torrentnet.la
-=20
- libsub_torrentnet_la_SOURCES =3D \
-+	address_info.cc \
-+	address_info.h \
-+	fd.cc \
-+	fd.h \
-+	socket_address.cc \
-+	socket_address.h \
- 	socket_address_key.cc \
--	socket_address_key.h
-+	socket_address_key.h \
-+	socket_event.cc \
-+	socket_event.h \
-+	types.h
-=20
- AM_CPPFLAGS =3D -I$(srcdir) -I$(srcdir)/.. -I$(srcdir)/../.. -I$(top_srcd=
ir)
-=20
- libtorrentincludedir =3D $(includedir)/torrent/net
- libtorrentinclude_HEADERS =3D \
--	socket_address_key.h
-+	address_info.h \
-+	fd.h \
-+	socket_address.h \
-+	socket_address_key.h \
-+	socket_event.h \
-+	types.h
-diff --git a/src/torrent/net/address_info.cc b/src/torrent/net/address_inf=
o.cc
-new file mode 100644
-index 00000000..25a51ebd
---- /dev/null
-+++ b/src/torrent/net/address_info.cc
-@@ -0,0 +1,43 @@
-+#include "config.h"
-+
-+#include "address_info.h"
-+
-+namespace torrent {
-+
-+int
-+ai_get_addrinfo(const char* nodename, const char* servname, const addrinf=
o* hints, ai_unique_ptr& res) {
-+  addrinfo* ai;
-+  int err =3D ::getaddrinfo(nodename, servname, hints, &ai);
-+
-+  if (err !=3D 0)
-+    return err;
-+
-+  res.reset(ai);
-+  return 0;
-+}
-+
-+sa_unique_ptr
-+ai_get_first_sa(const char* nodename, const char* servname, const addrinf=
o* hints) {
-+  ai_unique_ptr aip;
-+
-+  if (ai_get_addrinfo(nodename, servname, hints, aip) !=3D 0)
-+    return nullptr;
-+
-+  return sa_copy(aip->ai_addr);
-+}
-+
-+int
-+ai_each_inet_inet6_first(const char* nodename, ai_sockaddr_func lambda) {
-+  int err;
-+  ai_unique_ptr ai;
-+
-+  // TODO: Change to a single call using hints with both inet/inet6.
-+  if ((err =3D ai_get_addrinfo(nodename, NULL, ai_make_hint(0, PF_INET, S=
OCK_STREAM).get(), ai)) !=3D 0 &&
-+      (err =3D ai_get_addrinfo(nodename, NULL, ai_make_hint(0, PF_INET6, =
SOCK_STREAM).get(), ai)) !=3D 0)
-+    return err;
-+
-+  lambda(ai->ai_addr);
-+  return 0;
-+}
-+
-+}
-diff --git a/src/torrent/net/address_info.h b/src/torrent/net/address_info=
.h
-new file mode 100644
-index 00000000..c0b1c082
---- /dev/null
-+++ b/src/torrent/net/address_info.h
-@@ -0,0 +1,69 @@
-+#ifndef LIBTORRENT_NET_ADDRESS_INFO_H
-+#define LIBTORRENT_NET_ADDRESS_INFO_H
-+
-+#include <cstring>
-+#include <functional>
-+#include <memory>
-+#include <string>
-+#include <netdb.h>
-+#include <torrent/common.h>
-+#include <torrent/net/socket_address.h>
-+
-+namespace torrent {
-+
-+struct ai_deleter {
-+  void operator()(addrinfo* ai) const { freeaddrinfo(ai); }
-+};
-+
-+typedef std::unique_ptr<addrinfo, ai_deleter> ai_unique_ptr;
-+typedef std::unique_ptr<const addrinfo, ai_deleter> c_ai_unique_ptr;
-+typedef std::function<void (const sockaddr*)> ai_sockaddr_func;
-+
-+inline void          ai_clear(addrinfo* ai);
-+inline ai_unique_ptr ai_make_hint(int flags, int family, int socktype);
-+
-+int ai_get_addrinfo(const char* nodename, const char* servname, const add=
rinfo* hints, ai_unique_ptr& res) LIBTORRENT_EXPORT;
-+
-+// Helper functions:
-+
-+// TODO: Consider servname "0".
-+// TODO: ai_get_first_sa_err that returns a tuple?
-+sa_unique_ptr ai_get_first_sa(const char* nodename, const char* servname =
=3D nullptr, const addrinfo* hints =3D nullptr) LIBTORRENT_EXPORT;
-+
-+int ai_each_inet_inet6_first(const char* nodename, ai_sockaddr_func lambd=
a) LIBTORRENT_EXPORT;
-+
-+// Get all addrinfo's, iterate, etc.
-+
-+//
-+// Safe conversion from unique_ptr arguments:
-+//
-+
-+inline void aip_clear(ai_unique_ptr& aip) { return ai_clear(aip.get()); }
-+
-+inline int aip_get_addrinfo(const char* nodename, const char* servname, c=
onst ai_unique_ptr& hints, ai_unique_ptr& res) { return ai_get_addrinfo(nod=
ename, servname, hints.get(), res); }
-+inline int aip_get_addrinfo(const char* nodename, const char* servname, c=
onst c_ai_unique_ptr& hints, ai_unique_ptr& res) { return ai_get_addrinfo(n=
odename, servname, hints.get(), res); }
-+
-+//
-+// Implementations:
-+//
-+
-+inline void
-+ai_clear(addrinfo* ai) {
-+  std::memset(ai, 0, sizeof(addrinfo)); =20
-+}
-+
-+inline ai_unique_ptr
-+ai_make_hint(int flags, int family, int socktype) {
-+  ai_unique_ptr aip(new addrinfo);
-+
-+  aip_clear(aip);
-+  aip->ai_flags =3D flags;
-+  aip->ai_family =3D family;
-+  aip->ai_socktype =3D socktype;
-+
-+  return aip;
-+}
-+
-+}
-+
-+#endif
-diff --git a/src/torrent/net/fd.cc b/src/torrent/net/fd.cc
-new file mode 100644
-index 00000000..07c91779
---- /dev/null
-+++ b/src/torrent/net/fd.cc
-@@ -0,0 +1,209 @@
-+#include "config.h"
-+
-+#include "fd.h"
-+
-+#include <cerrno>
-+#include <fcntl.h>
-+#include <unistd.h>
-+#include <netinet/in.h>
-+#include <netinet/in_systm.h>
-+#include <netinet/ip.h>
-+
-+#include "torrent/exceptions.h"
-+#include "torrent/net/socket_address.h"
-+#include "torrent/utils/log.h"
-+
-+#define LT_LOG(log_fmt, ...)                                    \
-+  lt_log_print(LOG_CONNECTION_FD, "fd: " log_fmt, __VA_ARGS__);
-+#define LT_LOG_FLAG(log_fmt)                                            \
-+  lt_log_print(LOG_CONNECTION_FD, "fd: " log_fmt " (flags:0x%x)", flags);
-+#define LT_LOG_FLAG_ERROR(log_fmt)                                      \
-+  lt_log_print(LOG_CONNECTION_FD, "fd: " log_fmt " (flags:0x%x errno:%i m=
essage:'%s')", \
-+               flags, errno, std::strerror(errno));
-+#define LT_LOG_FD(log_fmt)                                      \
-+  lt_log_print(LOG_CONNECTION_FD, "fd->%i: " log_fmt, fd);
-+#define LT_LOG_FD_ERROR(log_fmt)                                        \
-+  lt_log_print(LOG_CONNECTION_FD, "fd->%i: " log_fmt " (errno:%i message:=
'%s')", \
-+               fd, errno, std::strerror(errno));
-+#define LT_LOG_FD_SOCKADDR(log_fmt)                                   \
-+  lt_log_print(LOG_CONNECTION_FD, "fd->%i: " log_fmt " (address:%s)", \
-+               fd, sa_pretty_str(sa).c_str());
-+#define LT_LOG_FD_SOCKADDR_ERROR(log_fmt)                               \
-+  lt_log_print(LOG_CONNECTION_FD, "fd->%i: " log_fmt " (address:%s errno:=
%i message:'%s')", \
-+               fd, sa_pretty_str(sa).c_str(), errno, std::strerror(errno)=
);
-+#define LT_LOG_FD_FLAG(log_fmt)                                         \
-+  lt_log_print(LOG_CONNECTION_FD, "fd->%i: " log_fmt " (flags:0x%x)", fd,=
 flags);
-+#define LT_LOG_FD_FLAG_ERROR(log_fmt)                                   \
-+  lt_log_print(LOG_CONNECTION_FD, "fd->%i: " log_fmt " (flags:0x%x errno:=
%i message:'%s')", \
-+               fd, flags, errno, std::strerror(errno));
-+#define LT_LOG_FD_VALUE(log_fmt, value)                                 \
-+  lt_log_print(LOG_CONNECTION_FD, "fd->%i: " log_fmt " (value:%i)", fd, (=
int)value);
-+#define LT_LOG_FD_VALUE_ERROR(log_fmt, value)                           \
-+  lt_log_print(LOG_CONNECTION_FD, "fd->%i: " log_fmt " (value:%i errno:%i=
 message:'%s')", \
-+               fd, (int)value, errno, std::strerror(errno));
-+
-+namespace torrent {
-+
-+int fd__accept(int socket, sockaddr *address, socklen_t *address_len) { r=
eturn ::accept(socket, address, address_len); }
-+int fd__bind(int socket, const sockaddr *address, socklen_t address_len) =
{ return ::bind(socket, address, address_len); }
-+int fd__close(int fildes) { return ::close(fildes); }
-+int fd__connect(int socket, const sockaddr *address, socklen_t address_le=
n) { return ::connect(socket, address, address_len); }
-+int fd__fcntl_int(int fildes, int cmd, int arg) { return ::fcntl(fildes, =
cmd, arg); }
-+int fd__listen(int socket, int backlog) { return ::listen(socket, backlog=
); }
-+int fd__setsockopt_int(int socket, int level, int option_name, int option=
_value) { return ::setsockopt(socket, level, option_name, &option_value, si=
zeof(int)); }
-+int fd__socket(int domain, int type, int protocol) { return ::socket(doma=
in, type, protocol); }
-+
-+int
-+fd_open(fd_flags flags) {
-+  int domain;
-+  int protocol;
-+
-+  if (!fd_valid_flags(flags))
-+    throw internal_error("torrent::fd_open failed: invalid fd_flags");
-+
-+  if ((flags & fd_flag_stream)) {
-+    domain =3D SOCK_STREAM;
-+    protocol =3D IPPROTO_TCP;
-+  } else {
-+    LT_LOG_FLAG("fd_open missing socket type");
-+    errno =3D EINVAL;
-+    return -1;
-+  }
-+
-+  int fd =3D -1;
-+
-+  if (fd =3D=3D -1 && !(flags & fd_flag_v4only)) {
-+    LT_LOG_FLAG("fd_open opening ipv6 socket");
-+    fd =3D fd__socket(PF_INET6, domain, protocol);
-+  }
-+
-+  if (fd =3D=3D -1 && !(flags & fd_flag_v6only)) {
-+    LT_LOG_FLAG("fd_open opening ipv4 socket");
-+    fd =3D fd__socket(PF_INET, domain, protocol);
-+  }
-+
-+  if (fd =3D=3D -1) {
-+    LT_LOG_FLAG_ERROR("fd_open failed to open socket");
-+    return -1;
-+  }
-+
-+  if ((flags & fd_flag_v6only) && !fd_set_v6only(fd, true)) {
-+    LT_LOG_FD_FLAG_ERROR("fd_open failed to set v6only");
-+    fd_close(fd);
-+    return -1;
-+  }
-+
-+  if ((flags & fd_flag_nonblock) && !fd_set_nonblock(fd)) {
-+    LT_LOG_FD_FLAG_ERROR("fd_open failed to set nonblock");
-+    fd_close(fd);
-+    return -1;
-+  }
-+
-+  if ((flags & fd_flag_reuse_address) && !fd_set_reuse_address(fd, true))=
 {
-+    LT_LOG_FD_FLAG_ERROR("fd_open failed to set reuse_address");
-+    fd_close(fd);
-+    return -1;
-+  }
-+
-+  LT_LOG_FD_FLAG("fd_open succeeded");
-+  return fd;
-+}
-+
-+void
-+fd_close(int fd) {
-+  if (fd =3D=3D STDIN_FILENO || fd =3D=3D STDOUT_FILENO || fd =3D=3D STDE=
RR_FILENO)
-+    throw internal_error("torrent::fd_close: tried to close stdin/out/err=
");
-+
-+  if (fd__close(fd) =3D=3D -1)
-+    throw internal_error("torrent::fd_close: " + std::string(strerror(err=
no)));
-+
-+  LT_LOG_FD("fd_close succeeded");
-+}
-+
-+fd_sap_tuple
-+fd_accept(int fd) {
-+  sa_unique_ptr sap =3D sa_make_inet6();
-+  socklen_t socklen =3D sap_length(sap);
-+
-+  int accept_fd =3D fd__accept(fd, sap.get(), &socklen);
-+
-+  if (accept_fd =3D=3D -1) {
-+    LT_LOG_FD_ERROR("fd_accept failed");
-+    return fd_sap_tuple{-1, nullptr};
-+  }
-+
-+  return fd_sap_tuple{accept_fd, std::move(sap)};
-+}
-+
-+bool
-+fd_bind(int fd, const sockaddr* sa) {
-+  if (fd__bind(fd, sa, sa_length(sa)) =3D=3D -1) {
-+    LT_LOG_FD_SOCKADDR_ERROR("fd_bind failed");
-+    return false;
-+  }
-+
-+  LT_LOG_FD_SOCKADDR("fd_bind succeeded");
-+  return true;
-+}
-+
-+bool
-+fd_connect(int fd, const sockaddr* sa) {
-+  if (fd__connect(fd, sa, sa_length(sa)) =3D=3D 0) {
-+    LT_LOG_FD_SOCKADDR("fd_connect succeeded");
-+    return true;
-+  }
-+
-+  if (errno =3D=3D EINPROGRESS) {
-+    LT_LOG_FD_SOCKADDR("fd_connect succeeded and in progress");
-+    return true;
-+  }
-+
-+  LT_LOG_FD_SOCKADDR_ERROR("fd_connect failed");
-+  return false;
-+}
-+
-+bool
-+fd_listen(int fd, int backlog) {
-+  if (fd__listen(fd, backlog) =3D=3D -1) {
-+    LT_LOG_FD_VALUE_ERROR("fd_listen failed", backlog);
-+    return false;
-+  }
-+
-+  LT_LOG_FD_VALUE("fd_listen succeeded", backlog);
-+  return true;
-+}
-+
-+bool
-+fd_set_nonblock(int fd) {
-+  if (fd__fcntl_int(fd, F_SETFL, O_NONBLOCK) =3D=3D -1) {
-+    LT_LOG_FD_ERROR("fd_set_nonblock failed");
-+    return false;
-+  }
-+
-+  LT_LOG_FD("fd_set_nonblock succeeded");
-+  return true;
-+}
-+
-+bool
-+fd_set_reuse_address(int fd, bool state) {
-+  if (fd__setsockopt_int(fd, SOL_SOCKET, SO_REUSEADDR, state) =3D=3D -1) =
{
-+    LT_LOG_FD_VALUE_ERROR("fd_set_reuse_address failed", state);
-+    return false;
-+  }
-+
-+  LT_LOG_FD_VALUE("fd_set_reuse_address succeeded", state);
-+  return true;
-+}
-+
-+bool
-+fd_set_v6only(int fd, bool state) {
-+  if (fd__setsockopt_int(fd, IPPROTO_IPV6, IPV6_V6ONLY, state) =3D=3D -1)=
 {
-+    LT_LOG_FD_VALUE_ERROR("fd_set_v6only failed", state);
-+    return false;
-+  }
-+
-+  LT_LOG_FD_VALUE("fd_set_v6only succeeded", state);
-+  return true;
-+}
-+
-+}
-diff --git a/src/torrent/net/fd.h b/src/torrent/net/fd.h
-new file mode 100644
-index 00000000..a7094646
---- /dev/null
-+++ b/src/torrent/net/fd.h
-@@ -0,0 +1,63 @@
-+#ifndef LIBTORRENT_NET_FD_H
-+#define LIBTORRENT_NET_FD_H
-+
-+#include <string>
-+#include <torrent/common.h>
-+#include <torrent/net/types.h>
-+
-+namespace torrent {
-+
-+enum fd_flags : int {
-+  fd_flag_stream =3D 0x1,
-+  fd_flag_nonblock =3D 0x10,
-+  fd_flag_reuse_address =3D 0x20,
-+  fd_flag_v4only =3D 0x40,
-+  fd_flag_v6only =3D 0x80,
-+  fd_flag_all =3D 0xff,
-+};
-+
-+constexpr bool fd_valid_flags(fd_flags flags);
-+
-+int  fd_open(fd_flags flags) LIBTORRENT_EXPORT;
-+void fd_close(int fd) LIBTORRENT_EXPORT;
-+
-+fd_sap_tuple fd_accept(int fd) LIBTORRENT_EXPORT;
-+
-+bool fd_bind(int fd, const sockaddr* sa) LIBTORRENT_EXPORT;
-+bool fd_connect(int fd, const sockaddr* sa) LIBTORRENT_EXPORT;
-+bool fd_listen(int fd, int backlog) LIBTORRENT_EXPORT;
-+
-+bool fd_set_nonblock(int fd) LIBTORRENT_EXPORT;
-+bool fd_set_reuse_address(int fd, bool state) LIBTORRENT_EXPORT;
-+bool fd_set_v6only(int fd, bool state) LIBTORRENT_EXPORT;
-+
-+[[gnu::weak]] int fd__accept(int socket, sockaddr *address, socklen_t *ad=
dress_len) LIBTORRENT_EXPORT;
-+[[gnu::weak]] int fd__bind(int socket, const sockaddr *address, socklen_t=
 address_len) LIBTORRENT_EXPORT;
-+[[gnu::weak]] int fd__close(int fildes) LIBTORRENT_EXPORT;
-+[[gnu::weak]] int fd__connect(int socket, const sockaddr *address, sockle=
n_t address_len) LIBTORRENT_EXPORT;
-+[[gnu::weak]] int fd__fcntl_int(int fildes, int cmd, int arg) LIBTORRENT_=
EXPORT;
-+[[gnu::weak]] int fd__listen(int socket, int backlog) LIBTORRENT_EXPORT;
-+[[gnu::weak]] int fd__setsockopt_int(int socket, int level, int option_na=
me, int option_value) LIBTORRENT_EXPORT;
-+[[gnu::weak]] int fd__socket(int domain, int type, int protocol) LIBTORRE=
NT_EXPORT;
-+
-+constexpr fd_flags
-+operator |(fd_flags lhs, fd_flags rhs) {
-+  return static_cast<fd_flags>(static_cast<int>(lhs) | static_cast<int>(r=
hs));
-+}
-+
-+inline fd_flags&
-+operator |=3D(fd_flags& lhs, fd_flags rhs) {
-+  return (lhs =3D lhs | rhs);
-+}
-+
-+constexpr bool
-+fd_valid_flags(fd_flags flags) {
-+  return
-+    (flags & fd_flag_stream) &&
-+    !((flags & fd_flag_v4only) && (flags & fd_flag_v6only)) &&
-+    !(flags & ~(fd_flag_all));
-+}
-+
-+}
-+
-+#endif
-diff --git a/src/torrent/net/socket_address.cc b/src/torrent/net/socket_ad=
dress.cc
-new file mode 100644
-index 00000000..c36ba0ae
---- /dev/null
-+++ b/src/torrent/net/socket_address.cc
-@@ -0,0 +1,559 @@
-+#include "config.h"
-+
-+#include "socket_address.h"
-+
-+#include <cstring>
-+#include <arpa/inet.h>
-+#include <sys/un.h>
-+
-+// TODO: Deprecate.
-+#include "rak/socket_address.h"
-+
-+#include "torrent/exceptions.h"
-+
-+namespace torrent {
-+
-+constexpr uint32_t
-+sin6_addr32_index(const sockaddr_in6* sa, unsigned int index) {
-+  return
-+    (sa->sin6_addr.s6_addr[index * 4 + 0] << 24) +
-+    (sa->sin6_addr.s6_addr[index * 4 + 1] << 16) +
-+    (sa->sin6_addr.s6_addr[index * 4 + 2] << 8) +
-+    (sa->sin6_addr.s6_addr[index * 4 + 3] << 0);
-+}
-+
-+inline void
-+sin6_addr32_set(sockaddr_in6* sa, unsigned int index, uint32_t value) {
-+  sa->sin6_addr.s6_addr[index * 4 + 0] =3D (value >> 24);
-+  sa->sin6_addr.s6_addr[index * 4 + 1] =3D (value >> 16);
-+  sa->sin6_addr.s6_addr[index * 4 + 2] =3D (value >> 8);
-+  sa->sin6_addr.s6_addr[index * 4 + 3] =3D (value >> 0);
-+}
-+
-+inline in6_addr
-+sin6_make_addr32(uint32_t addr0, uint32_t addr1, uint32_t addr2, uint32_t=
 addr3) {
-+  uint32_t addr32[4];
-+  addr32[0] =3D htonl(addr0);
-+  addr32[1] =3D htonl(addr1);
-+  addr32[2] =3D htonl(addr2);
-+  addr32[3] =3D htonl(addr3);
-+
-+  return *reinterpret_cast<in6_addr*>(addr32);
-+}
-+
-+bool
-+sa_is_unspec(const sockaddr* sa) {
-+  return sa !=3D NULL && sa->sa_family =3D=3D AF_UNSPEC;
-+}
-+
-+bool
-+sa_is_inet(const sockaddr* sa) {
-+  return sa !=3D NULL && sa->sa_family =3D=3D AF_INET;
-+}
-+
-+bool
-+sa_is_inet6(const sockaddr* sa) {
-+  return sa !=3D NULL && sa->sa_family =3D=3D AF_INET6;
-+}
-+
-+bool
-+sa_is_inet_inet6(const sockaddr* sa) {
-+  return sa !=3D NULL && (sa->sa_family =3D=3D AF_INET || sa->sa_family =
=3D=3D AF_INET6);
-+}
-+
-+bool
-+sa_is_any(const sockaddr* sa) {
-+  switch (sa->sa_family) {
-+  case AF_INET:
-+    return sin_is_any(reinterpret_cast<const sockaddr_in*>(sa));
-+  case AF_INET6:
-+    if (sa_is_v4mapped(sa))
-+      return sin6_addr32_index(reinterpret_cast<const sockaddr_in6*>(sa),=
 3) =3D=3D htonl(INADDR_ANY);
-+    return sin6_is_any(reinterpret_cast<const sockaddr_in6*>(sa));
-+  default:
-+    return true;
-+  }
-+}
-+
-+bool
-+sin_is_any(const sockaddr_in* sa) {
-+  return sa->sin_addr.s_addr =3D=3D htonl(INADDR_ANY);
-+}
-+
-+bool
-+sin6_is_any(const sockaddr_in6* sa) {
-+  return std::memcmp(&sa->sin6_addr, &in6addr_any, sizeof(in6_addr)) =3D=
=3D 0;
-+}
-+
-+bool
-+sa_is_broadcast(const sockaddr* sa) {
-+  switch (sa->sa_family) {
-+  case AF_INET:
-+    return sin_is_broadcast(reinterpret_cast<const sockaddr_in*>(sa));
-+  case AF_INET6:
-+    if (sa_is_v4mapped(sa))
-+      return sin6_addr32_index(reinterpret_cast<const sockaddr_in6*>(sa),=
 3) =3D=3D htonl(INADDR_BROADCAST);
-+    return false;
-+  default:
-+    return false;
-+  }
-+}
-+
-+bool
-+sin_is_broadcast(const sockaddr_in* sa) {
-+  return sa->sin_addr.s_addr =3D=3D htonl(INADDR_BROADCAST);
-+}
-+
-+bool
-+sa_is_v4mapped(const sockaddr* sa) {
-+  return sa !=3D NULL && sa->sa_family =3D=3D AF_INET6 && sin6_is_v4mappe=
d(reinterpret_cast<const sockaddr_in6*>(sa));
-+}
-+
-+bool
-+sin6_is_v4mapped(const sockaddr_in6* sa) {
-+  return sa !=3D NULL && IN6_IS_ADDR_V4MAPPED(&sa->sin6_addr);
-+}
-+
-+bool
-+sa_is_port_any(const sockaddr* sa) {
-+  return sa_port(sa) =3D=3D 0;
-+}
-+
-+size_t
-+sa_length(const sockaddr* sa) {
-+  switch(sa->sa_family) {
-+  case AF_INET:
-+    return sizeof(sockaddr_in);
-+  case AF_INET6:
-+    return sizeof(sockaddr_in6);
-+  default:
-+    return sizeof(sa);
-+  }
-+}
-+
-+sa_unique_ptr
-+sa_make_unspec() {
-+  sa_unique_ptr sa(new sockaddr);
-+
-+  std::memset(sa.get(), 0, sizeof(sa));
-+  sa.get()->sa_family =3D AF_UNSPEC;
-+
-+  return sa;
-+}
-+
-+sa_unique_ptr
-+sa_make_inet() {
-+  return sa_unique_ptr(reinterpret_cast<sockaddr*>(sin_make().release()))=
;
-+}
-+
-+sa_unique_ptr
-+sa_make_inet6() {
-+  return sa_unique_ptr(reinterpret_cast<sockaddr*>(sin6_make().release())=
);
-+}
-+
-+sa_unique_ptr
-+sa_make_unix(const std::string& pathname) {
-+  if (!pathname.empty())
-+    throw internal_error("torrent::sa_make_unix: function not implemented=
");
-+
-+  sun_unique_ptr sunp(new sockaddr_un);
-+
-+  std::memset(sunp.get(), 0, sizeof(sockaddr_un));
-+  sunp->sun_family =3D AF_UNIX;
-+  // TODO: verify length, copy pathname
-+
-+  return sa_unique_ptr(reinterpret_cast<sockaddr*>(sunp.release()));
-+}
-+
-+sa_unique_ptr
-+sa_convert(const sockaddr* sa) {
-+  if (sa =3D=3D NULL)
-+    return sa_make_unspec();
-+
-+  switch(sa->sa_family) {
-+  case AF_INET:
-+    return sa_copy_in(reinterpret_cast<const sockaddr_in*>(sa));
-+  case AF_INET6:
-+    if (sin6_is_v4mapped(reinterpret_cast<const sockaddr_in6*>(sa)))
-+      return sa_from_v4mapped_in6(reinterpret_cast<const sockaddr_in6*>(s=
a));
-+
-+    return sa_copy_in6(reinterpret_cast<const sockaddr_in6*>(sa));
-+  case AF_UNSPEC:
-+    return sa_make_unspec();
-+  default:
-+    throw internal_error("torrent::sa_convert: sockaddr is not a valid fa=
mily");
-+  }
-+}
-+
-+sa_unique_ptr
-+sa_copy(const sockaddr* sa) {
-+  if (sa =3D=3D nullptr)
-+    throw internal_error("torrent::sa_copy: sockaddr is a nullptr");
-+
-+  switch(sa->sa_family) {
-+  case AF_INET:
-+    return sa_copy_in(reinterpret_cast<const sockaddr_in*>(sa));
-+  case AF_INET6:
-+    return sa_copy_in6(reinterpret_cast<const sockaddr_in6*>(sa));
-+  case AF_UNSPEC:
-+    return sa_make_unspec();
-+  default:
-+    throw internal_error("torrent::sa_copy: sockaddr is not a valid famil=
y");
-+  }
-+}
-+
-+sa_unique_ptr
-+sa_copy_in(const sockaddr_in* sa) {
-+  sa_unique_ptr result(reinterpret_cast<sockaddr*>(new sockaddr_in));
-+  std::memcpy(result.get(), sa, sizeof(sockaddr_in));
-+  return result;
-+}
-+
-+sa_unique_ptr
-+sa_copy_in6(const sockaddr_in6* sa) {
-+  sa_unique_ptr result(reinterpret_cast<sockaddr*>(new sockaddr_in6));
-+  std::memcpy(result.get(), sa, sizeof(sockaddr_in6));
-+  return result;
-+}
-+
-+sa_unique_ptr
-+sa_copy_addr(const sockaddr* sa, uint16_t port) {
-+  if (sa =3D=3D nullptr)
-+    throw internal_error("torrent::sa_copy_addr: sockaddr is a nullptr");
-+
-+  switch(sa->sa_family) {
-+  case AF_INET:
-+    return sa_copy_addr_in(reinterpret_cast<const sockaddr_in*>(sa), port=
);
-+  case AF_INET6:
-+    return sa_copy_addr_in6(reinterpret_cast<const sockaddr_in6*>(sa), po=
rt);
-+  case AF_UNSPEC:
-+    return sa_make_unspec();
-+  default:
-+    throw internal_error("torrent::sa_copy_addr: sockaddr is not a valid =
family");
-+  }
-+}
-+
-+sa_unique_ptr
-+sa_copy_addr_in(const sockaddr_in* sa, uint16_t port) {
-+  sa_unique_ptr result(reinterpret_cast<sockaddr*>(new sockaddr_in));
-+  std::memset(result.get(), 0, sizeof(sockaddr_in));
-+  reinterpret_cast<sockaddr_in*>(result.get())->sin_family =3D AF_INET;
-+  reinterpret_cast<sockaddr_in*>(result.get())->sin_addr =3D sa->sin_addr=
;
-+  reinterpret_cast<sockaddr_in*>(result.get())->sin_port =3D htons(port);
-+  return result;
-+}
-+
-+sa_unique_ptr
-+sa_copy_addr_in6(const sockaddr_in6* sa, uint16_t port) {
-+  sa_unique_ptr result(reinterpret_cast<sockaddr*>(new sockaddr_in6));
-+  std::memset(result.get(), 0, sizeof(sockaddr_in6));
-+  reinterpret_cast<sockaddr_in6*>(result.get())->sin6_family =3D AF_INET6=
;
-+  std::memcpy(&reinterpret_cast<sockaddr_in6*>(result.get())->sin6_addr, =
&sa->sin6_addr, sizeof(in6_addr));
-+  reinterpret_cast<sockaddr_in6*>(result.get())->sin6_port =3D htons(port=
);
-+  return result;
-+}
-+
-+sin_unique_ptr
-+sin_copy(const sockaddr_in* sa) {
-+  sin_unique_ptr result(new sockaddr_in);
-+  std::memcpy(result.get(), sa, sizeof(sockaddr_in));
-+  return result;
-+}
-+
-+sin6_unique_ptr
-+sin6_copy(const sockaddr_in6* sa) {
-+  sin6_unique_ptr result(new sockaddr_in6);
-+  std::memcpy(result.get(), sa, sizeof(sockaddr_in6));
-+  return result;
-+}
-+
-+sin_unique_ptr
-+sin_make() {
-+  sin_unique_ptr sa(new sockaddr_in);
-+  std::memset(sa.get(), 0, sizeof(sockaddr_in));
-+  sa.get()->sin_family =3D AF_INET;
-+
-+  return sa;
-+}
-+
-+sin6_unique_ptr
-+sin6_make() {
-+  sin6_unique_ptr sa(new sockaddr_in6);
-+  std::memset(sa.get(), 0, sizeof(sockaddr_in6));
-+  sa.get()->sin6_family =3D AF_INET6;
-+
-+  return sa;
-+}
-+
-+sa_unique_ptr
-+sa_from_v4mapped(const sockaddr* sa) {
-+  if (!sa_is_inet6(sa))
-+    throw internal_error("torrent::sa_from_v4mapped: sockaddr is not inet=
6");
-+
-+  return sa_from_in(sin_from_v4mapped_in6(reinterpret_cast<const sockaddr=
_in6*>(sa)));
-+}
-+
-+sa_unique_ptr
-+sa_to_v4mapped(const sockaddr* sa) {
-+  if (!sa_is_inet(sa))
-+    throw internal_error("torrent::sa_to_v4mapped: sockaddr is not inet")=
;
-+
-+  return sa_from_in6(sin6_to_v4mapped_in(reinterpret_cast<const sockaddr_=
in*>(sa)));
-+}
-+
-+sin_unique_ptr
-+sin_from_v4mapped_in6(const sockaddr_in6* sin6) {
-+  if (!sin6_is_v4mapped(sin6))
-+    throw internal_error("torrent::sin6_is_v4mapped: sockaddr_in6 is not =
v4mapped");
-+
-+  sin_unique_ptr result =3D sin_make();
-+  result.get()->sin_addr.s_addr =3D reinterpret_cast<in_addr_t>(htonl(sin=
6_addr32_index(sin6, 3)));
-+  result.get()->sin_port =3D sin6->sin6_port;
-+
-+  return result;
-+}
-+
-+sin6_unique_ptr
-+sin6_to_v4mapped_in(const sockaddr_in* sin) {
-+  sin6_unique_ptr result =3D sin6_make();
-+
-+  result.get()->sin6_addr =3D sin6_make_addr32(0, 0, 0xffff, ntohl(sin->s=
in_addr.s_addr));
-+  result.get()->sin6_port =3D sin->sin_port;
-+
-+  return result;
-+}
-+
-+sin_unique_ptr
-+sin_from_sa(sa_unique_ptr&& sap) {
-+  if (!sap_is_inet(sap))
-+    throw internal_error("torrent::sin_from_sa: sockaddr is nullptr or no=
t inet");
-+
-+  return sin_unique_ptr(reinterpret_cast<sockaddr_in*>(sap.release()));
-+}
-+
-+sin6_unique_ptr
-+sin6_from_sa(sa_unique_ptr&& sap) {
-+  if (!sap_is_inet6(sap))
-+    throw internal_error("torrent::sin6_from_sa: sockaddr is nullptr or n=
ot inet6");
-+
-+  return sin6_unique_ptr(reinterpret_cast<sockaddr_in6*>(sap.release()));
-+}
-+
-+c_sin_unique_ptr
-+sin_from_c_sa(c_sa_unique_ptr&& sap) {
-+  if (!sap_is_inet(sap))
-+    throw internal_error("torrent::sin_from_c_sa: sockaddr is nullptr or =
not inet");
-+
-+  return c_sin_unique_ptr(reinterpret_cast<const sockaddr_in*>(sap.releas=
e()));
-+}
-+
-+c_sin6_unique_ptr
-+sin6_from_c_sa(sa_unique_ptr&& sap) {
-+  if (!sap_is_inet6(sap))
-+    throw internal_error("torrent::sin6_from_c_sa: sockaddr is nullptr or=
 not inet6");
-+
-+  return c_sin6_unique_ptr(reinterpret_cast<const sockaddr_in6*>(sap.rele=
ase()));
-+}
-+
-+void
-+sa_clear_inet6(sockaddr_in6* sa) {
-+  std::memset(sa, 0, sizeof(sockaddr_in6));
-+  sa->sin6_family =3D AF_INET6;
-+}
-+
-+uint16_t
-+sa_port(const sockaddr* sa) {
-+  if (sa =3D=3D NULL)
-+    return 0;
-+
-+  switch(sa->sa_family) {
-+  case AF_INET:
-+    return ntohs(reinterpret_cast<const sockaddr_in*>(sa)->sin_port);
-+  case AF_INET6:
-+    return ntohs(reinterpret_cast<const sockaddr_in6*>(sa)->sin6_port);
-+  default:
-+    return 0;
-+  }
-+}
-+
-+void
-+sa_set_port(sockaddr* sa, uint16_t port) {
-+  switch(sa->sa_family) {
-+  case AF_INET:
-+    reinterpret_cast<sockaddr_in*>(sa)->sin_port =3D htons(port);
-+    return;
-+  case AF_INET6:
-+    reinterpret_cast<sockaddr_in6*>(sa)->sin6_port =3D htons(port);
-+    return;
-+  default:
-+    throw internal_error("torrent::sa_set_port: invalid family type");
-+  }
-+}
-+
-+bool
-+sa_equal(const sockaddr* lhs, const sockaddr* rhs) {
-+  switch(rhs->sa_family) {
-+  case AF_INET:
-+  case AF_INET6:
-+  case AF_UNSPEC:
-+    break;
-+  default:
-+    throw internal_error("torrent::sa_equal: rhs sockaddr is not a valid =
family");
-+  }
-+
-+  switch(lhs->sa_family) {
-+  case AF_INET:
-+    return lhs->sa_family =3D=3D rhs->sa_family &&
-+      sin_equal(reinterpret_cast<const sockaddr_in*>(lhs), reinterpret_ca=
st<const sockaddr_in*>(rhs));
-+  case AF_INET6:
-+    return lhs->sa_family =3D=3D rhs->sa_family &&
-+      sin6_equal(reinterpret_cast<const sockaddr_in6*>(lhs), reinterpret_=
cast<const sockaddr_in6*>(rhs));
-+  case AF_UNSPEC:
-+    return lhs->sa_family =3D=3D rhs->sa_family;
-+  default:
-+    throw internal_error("torrent::sa_equal: lhs sockaddr is not a valid =
family");
-+  }
-+}
-+
-+bool
-+sin_equal(const sockaddr_in* lhs, const sockaddr_in* rhs) {
-+  return lhs->sin_port =3D=3D rhs->sin_port && lhs->sin_addr.s_addr =3D=
=3D rhs->sin_addr.s_addr;
-+}
-+
-+bool
-+sin6_equal(const sockaddr_in6* lhs, const sockaddr_in6* rhs) {
-+  return lhs->sin6_port =3D=3D rhs->sin6_port && std::equal(lhs->sin6_add=
r.s6_addr, lhs->sin6_addr.s6_addr + 16, rhs->sin6_addr.s6_addr);
-+}
-+
-+bool
-+sa_equal_addr(const sockaddr* lhs, const sockaddr* rhs) {
-+  switch(rhs->sa_family) {
-+  case AF_INET:
-+  case AF_INET6:
-+  case AF_UNSPEC:
-+    break;
-+  default:
-+    throw internal_error("torrent::sa_equal_addr: rhs sockaddr is not a v=
alid family");
-+  }
-+
-+  switch(lhs->sa_family) {
-+  case AF_INET:
-+    return lhs->sa_family =3D=3D rhs->sa_family &&
-+      sin_equal_addr(reinterpret_cast<const sockaddr_in*>(lhs), reinterpr=
et_cast<const sockaddr_in*>(rhs));
-+  case AF_INET6:
-+    return lhs->sa_family =3D=3D rhs->sa_family &&
-+      sin6_equal_addr(reinterpret_cast<const sockaddr_in6*>(lhs), reinter=
pret_cast<const sockaddr_in6*>(rhs));
-+  case AF_UNSPEC:
-+    return lhs->sa_family =3D=3D rhs->sa_family;
-+  default:
-+    throw internal_error("torrent::sa_equal_addr: lhs sockaddr is not a v=
alid family");
-+  }
-+}
-+
-+bool
-+sin_equal_addr(const sockaddr_in* lhs, const sockaddr_in* rhs) {
-+  return lhs->sin_addr.s_addr =3D=3D rhs->sin_addr.s_addr;
-+}
-+
-+bool
-+sin6_equal_addr(const sockaddr_in6* lhs, const sockaddr_in6* rhs) {
-+  return std::equal(lhs->sin6_addr.s6_addr, lhs->sin6_addr.s6_addr + 16, =
rhs->sin6_addr.s6_addr);
-+}
-+
-+std::string
-+sa_addr_str(const sockaddr* sa) {
-+  if (sa =3D=3D NULL)
-+    return "unspec";
-+
-+  switch (sa->sa_family) {
-+  case AF_INET:
-+    return sin_addr_str(reinterpret_cast<const sockaddr_in*>(sa));
-+  case AF_INET6:
-+    return sin6_addr_str(reinterpret_cast<const sockaddr_in6*>(sa));
-+  case AF_UNSPEC:
-+    return "unspec";
-+  default:
-+    return "invalid";
-+  }
-+}
-+
-+std::string
-+sin_addr_str(const sockaddr_in* sa) {
-+  char buffer[INET_ADDRSTRLEN];
-+
-+  if (inet_ntop(AF_INET, &sa->sin_addr, buffer, INET_ADDRSTRLEN) =3D=3D N=
ULL)
-+    return "inet_error";
-+
-+  return buffer;
-+}
-+
-+
-+std::string
-+sin6_addr_str(const sockaddr_in6* sa) {
-+  char buffer[INET6_ADDRSTRLEN];
-+
-+  if (inet_ntop(AF_INET6, &sa->sin6_addr, buffer, INET6_ADDRSTRLEN) =3D=
=3D NULL)
-+    return "inet6_error";
-+
-+  return buffer;
-+}
-+
-+std::string
-+sa_pretty_str(const sockaddr* sa) {
-+  if (sa =3D=3D nullptr)
-+    return "nullptr";
-+
-+  switch (sa->sa_family) {
-+  case AF_INET:
-+    return sin_pretty_str(reinterpret_cast<const sockaddr_in*>(sa));
-+  case AF_INET6:
-+    return sin6_pretty_str(reinterpret_cast<const sockaddr_in6*>(sa));
-+  case AF_UNSPEC:
-+    return "unspec";
-+  default:
-+    return "invalid";
-+  }
-+}
-+
-+std::string
-+sin_pretty_str(const sockaddr_in* sa) {
-+  auto result =3D sin_addr_str(sa);
-+
-+  if (sa->sin_port !=3D 0)
-+    result +=3D ':' + std::to_string(ntohs(sa->sin_port));
-+
-+  return result;
-+}
-+
-+std::string
-+sin6_pretty_str(const sockaddr_in6* sa) {
-+  auto result =3D "[" + sin6_addr_str(sa) + "]";
-+
-+  if (sa->sin6_port !=3D 0)
-+    result +=3D ':' + std::to_string(ntohs(sa->sin6_port));
-+
-+  return result;
-+}
-+
-+// Deprecated:
-+
-+void
-+sa_inet_mapped_inet6(const sockaddr_in* sa, sockaddr_in6* mapped) {
-+  uint32_t addr32[4];
-+  addr32[0] =3D 0;
-+  addr32[1] =3D 0;
-+  addr32[2] =3D htonl(0xffff);
-+  addr32[3] =3D sa->sin_addr.s_addr;
-+
-+  sa_clear_inet6(mapped);
-+
-+  mapped->sin6_addr =3D *reinterpret_cast<in6_addr*>(addr32);
-+  mapped->sin6_port =3D sa->sin_port;
-+}
-+
-+std::string
-+sa_pretty_address_str(const sockaddr* sa) {
-+  return sa_pretty_str(sa);
-+}
-+
-+}
-diff --git a/src/torrent/net/socket_address.h b/src/torrent/net/socket_add=
ress.h
-new file mode 100644
-index 00000000..f64aee68
---- /dev/null
-+++ b/src/torrent/net/socket_address.h
-@@ -0,0 +1,229 @@
-+#ifndef LIBTORRENT_NET_SOCKET_ADDRESS_H
-+#define LIBTORRENT_NET_SOCKET_ADDRESS_H
-+
-+#include <memory>
-+#include <string>
-+#include <netinet/in.h>
-+#include <sys/socket.h>
-+#include <torrent/common.h>
-+#include <torrent/net/types.h>
-+
-+namespace torrent {
-+
-+bool sa_is_unspec(const sockaddr* sa) LIBTORRENT_EXPORT;
-+bool sa_is_inet(const sockaddr* sa) LIBTORRENT_EXPORT;
-+bool sa_is_inet6(const sockaddr* sa) LIBTORRENT_EXPORT;
-+bool sa_is_inet_inet6(const sockaddr* sa) LIBTORRENT_EXPORT;
-+
-+bool sa_is_any(const sockaddr* sa) LIBTORRENT_EXPORT;
-+bool sin_is_any(const sockaddr_in* sa) LIBTORRENT_EXPORT;
-+bool sin6_is_any(const sockaddr_in6* sa) LIBTORRENT_EXPORT;
-+
-+bool sa_is_broadcast(const sockaddr* sa) LIBTORRENT_EXPORT;
-+bool sin_is_broadcast(const sockaddr_in* sa) LIBTORRENT_EXPORT;
-+
-+bool sa_is_v4mapped(const sockaddr* sa) LIBTORRENT_EXPORT;
-+bool sin6_is_v4mapped(const sockaddr_in6* sa) LIBTORRENT_EXPORT;
-+
-+bool sa_is_port_any(const sockaddr* sa) LIBTORRENT_EXPORT;
-+
-+size_t sa_length(const sockaddr* sa) LIBTORRENT_EXPORT;
-+
-+sa_unique_ptr   sa_make_unspec() LIBTORRENT_EXPORT;
-+sa_unique_ptr   sa_make_inet() LIBTORRENT_EXPORT;
-+sa_unique_ptr   sa_make_inet6() LIBTORRENT_EXPORT;
-+sa_unique_ptr   sa_make_unix(const std::string& pathname) LIBTORRENT_EXPO=
RT;
-+
-+sa_unique_ptr   sa_convert(const sockaddr* sa) LIBTORRENT_EXPORT;
-+
-+sa_unique_ptr   sa_copy(const sockaddr* sa) LIBTORRENT_EXPORT;
-+sa_unique_ptr   sa_copy_in(const sockaddr_in* sa) LIBTORRENT_EXPORT;
-+sa_unique_ptr   sa_copy_in6(const sockaddr_in6* sa) LIBTORRENT_EXPORT;
-+sa_unique_ptr   sa_copy_addr(const sockaddr* sa, uint16_t port =3D 0) LIB=
TORRENT_EXPORT;
-+sa_unique_ptr   sa_copy_addr_in(const sockaddr_in* sa, uint16_t port =3D =
0) LIBTORRENT_EXPORT;
-+sa_unique_ptr   sa_copy_addr_in6(const sockaddr_in6* sa, uint16_t port =
=3D 0) LIBTORRENT_EXPORT;
-+sin_unique_ptr  sin_copy(const sockaddr_in* sa) LIBTORRENT_EXPORT;
-+sin6_unique_ptr sin6_copy(const sockaddr_in6* sa) LIBTORRENT_EXPORT;
-+
-+sin_unique_ptr  sin_make() LIBTORRENT_EXPORT;
-+sin6_unique_ptr sin6_make() LIBTORRENT_EXPORT;
-+
-+sa_unique_ptr   sa_from_v4mapped(const sockaddr* sa) LIBTORRENT_EXPORT;
-+sa_unique_ptr   sa_to_v4mapped(const sockaddr* sa) LIBTORRENT_EXPORT;
-+sa_unique_ptr   sa_from_v4mapped_in6(const sockaddr_in6* sin6) LIBTORRENT=
_EXPORT;
-+sa_unique_ptr   sa_to_v4mapped_in(const sockaddr_in* sin) LIBTORRENT_EXPO=
RT;
-+sin_unique_ptr  sin_from_v4mapped_in6(const sockaddr_in6* sin6) LIBTORREN=
T_EXPORT;
-+sin6_unique_ptr sin6_to_v4mapped_in(const sockaddr_in* sin) LIBTORRENT_EX=
PORT;
-+
-+sa_unique_ptr     sa_from_in(sin_unique_ptr&& sinp) LIBTORRENT_EXPORT;
-+c_sa_unique_ptr   sa_from_in(c_sin_unique_ptr&& sinp) LIBTORRENT_EXPORT;
-+sa_unique_ptr     sa_from_in6(sin6_unique_ptr&& sin6p) LIBTORRENT_EXPORT;
-+c_sa_unique_ptr   sa_from_in6(c_sin6_unique_ptr&& sin6p) LIBTORRENT_EXPOR=
T;
-+sin_unique_ptr    sin_from_sa(sa_unique_ptr&& sap) LIBTORRENT_EXPORT;
-+sin6_unique_ptr   sin6_from_sa(sa_unique_ptr&& sap) LIBTORRENT_EXPORT;
-+c_sin_unique_ptr  sin_from_c_sa(c_sa_unique_ptr&& sap) LIBTORRENT_EXPORT;
-+c_sin6_unique_ptr sin6_from_c_sa(c_sa_unique_ptr&& sap) LIBTORRENT_EXPORT=
;
-+
-+void        sa_clear_inet6(sockaddr_in6* sa) LIBTORRENT_EXPORT;
-+
-+uint16_t    sa_port(const sockaddr* sa) LIBTORRENT_EXPORT;
-+void        sa_set_port(sockaddr* sa, uint16_t port) LIBTORRENT_EXPORT;
-+
-+bool        sa_equal(const sockaddr* lhs, const sockaddr* rhs) LIBTORRENT=
_EXPORT;
-+bool        sin_equal(const sockaddr_in* lhs, const sockaddr_in* rhs) LIB=
TORRENT_EXPORT;
-+bool        sin6_equal(const sockaddr_in6* lhs, const sockaddr_in6* rhs) =
LIBTORRENT_EXPORT;
-+
-+bool        sa_equal_addr(const sockaddr* lhs, const sockaddr* rhs) LIBTO=
RRENT_EXPORT;
-+bool        sin_equal_addr(const sockaddr_in* lhs, const sockaddr_in* rhs=
) LIBTORRENT_EXPORT;
-+bool        sin6_equal_addr(const sockaddr_in6* lhs, const sockaddr_in6* =
rhs) LIBTORRENT_EXPORT;
-+
-+std::string sa_addr_str(const sockaddr* sa) LIBTORRENT_EXPORT;
-+std::string sin_addr_str(const sockaddr_in* sa) LIBTORRENT_EXPORT;
-+std::string sin6_addr_str(const sockaddr_in6* sa) LIBTORRENT_EXPORT;
-+
-+std::string sa_pretty_str(const sockaddr* sa) LIBTORRENT_EXPORT;
-+std::string sin_pretty_str(const sockaddr_in* sa) LIBTORRENT_EXPORT;
-+std::string sin6_pretty_str(const sockaddr_in6* sa) LIBTORRENT_EXPORT;
-+
-+// Rename/replace:
-+void sa_inet_mapped_inet6(const sockaddr_in* sa, sockaddr_in6* mapped) LI=
BTORRENT_EXPORT;
-+
-+std::string sa_pretty_address_str(const sockaddr* sa) LIBTORRENT_EXPORT;
-+
-+//
-+// Tuples:
-+//
-+
-+bool fd_sap_equal(const fd_sap_tuple& lhs, const fd_sap_tuple& rhs) LIBTO=
RRENT_EXPORT;
-+
-+//
-+// Safe conversion from unique_ptr arguments:
-+//
-+
-+inline bool sap_is_unspec(const sa_unique_ptr& sap) { return sa_is_unspec=
(sap.get()); }
-+inline bool sap_is_unspec(const c_sa_unique_ptr& sap) { return sa_is_unsp=
ec(sap.get()); }
-+inline bool sap_is_inet(const c_sa_unique_ptr& sap) { return sa_is_inet(s=
ap.get()); }
-+inline bool sap_is_inet(const sa_unique_ptr& sap) { return sa_is_inet(sap=
.get()); }
-+inline bool sap_is_inet6(const sa_unique_ptr& sap) { return sa_is_inet6(s=
ap.get()); }
-+inline bool sap_is_inet6(const c_sa_unique_ptr& sap) { return sa_is_inet6=
(sap.get()); }
-+inline bool sap_is_inet_inet6(const sa_unique_ptr& sap) { return sa_is_in=
et_inet6(sap.get()); }
-+inline bool sap_is_inet_inet6(const c_sa_unique_ptr& sap) { return sa_is_=
inet_inet6(sap.get()); }
-+
-+inline bool sap_is_any(const sa_unique_ptr& sap) { return sa_is_any(sap.g=
et()); }
-+inline bool sap_is_any(const c_sa_unique_ptr& sap) { return sa_is_any(sap=
.get()); }
-+inline bool sinp_is_any(const sin_unique_ptr& sinp) { return sin_is_any(s=
inp.get()); }
-+inline bool sinp_is_any(const c_sin_unique_ptr& sinp) { return sin_is_any=
(sinp.get()); }
-+inline bool sinp6_is_any(const sin6_unique_ptr& sin6p) { return sin6_is_a=
ny(sin6p.get()); }
-+inline bool sinp6_is_any(const c_sin6_unique_ptr& sin6p) { return sin6_is=
_any(sin6p.get()); }
-+
-+inline bool sap_is_broadcast(const sa_unique_ptr& sap) { return sa_is_bro=
adcast(sap.get()); }
-+inline bool sap_is_broadcast(const c_sa_unique_ptr& sap) { return sa_is_b=
roadcast(sap.get()); }
-+inline bool sinp_is_broadcast(const sin_unique_ptr& sap) { return sin_is_=
broadcast(sap.get()); }
-+inline bool sinp_is_broadcast(const c_sin_unique_ptr& sap) { return sin_i=
s_broadcast(sap.get()); }
-+
-+inline bool sap_is_v4mapped(const sa_unique_ptr& sap) { return sa_is_v4ma=
pped(sap.get()); }
-+inline bool sap_is_v4mapped(const c_sa_unique_ptr& sap) { return sa_is_v4=
mapped(sap.get()); }
-+inline bool sinp6_is_v4mapped(const sin6_unique_ptr& sin6p) { return sin6=
_is_v4mapped(sin6p.get()); }
-+inline bool sinp6_is_v4mapped(const c_sin6_unique_ptr& sin6p) { return si=
n6_is_v4mapped(sin6p.get()); }
-+
-+inline bool sap_is_port_any(const sa_unique_ptr& sap) { return sa_is_port=
_any(sap.get()); }
-+inline bool sap_is_port_any(const c_sa_unique_ptr& sap) { return sa_is_po=
rt_any(sap.get()); }
-+
-+inline size_t sap_length(const sa_unique_ptr& sap) { return sa_length(sap=
.get()); }
-+inline size_t sap_length(const c_sa_unique_ptr& sap) { return sa_length(s=
ap.get()); }
-+
-+inline sa_unique_ptr sap_copy(const sa_unique_ptr& sap) { return sa_copy(=
sap.get()); }
-+inline sa_unique_ptr sap_copy(const c_sa_unique_ptr& sap) { return sa_cop=
y(sap.get()); }
-+inline sa_unique_ptr sap_copy_addr(const sa_unique_ptr& sap, uint16_t por=
t =3D 0) { return sa_copy_addr(sap.get(), port); }
-+inline sa_unique_ptr sap_copy_addr(const c_sa_unique_ptr& sap, uint16_t p=
ort =3D 0) { return sa_copy_addr(sap.get(), port); }
-+inline sa_unique_ptr sap_copy_in(const sin_unique_ptr& sinp) { return sa_=
copy_in(sinp.get()); }
-+inline sa_unique_ptr sap_copy_in(const c_sin_unique_ptr& sinp) { return s=
a_copy_in(sinp.get()); }
-+inline sa_unique_ptr sap_copy_in6(const sin6_unique_ptr& sin6p) { return =
sa_copy_in6(sin6p.get()); }
-+inline sa_unique_ptr sap_copy_in6(const c_sin6_unique_ptr& sin6p) { retur=
n sa_copy_in6(sin6p.get()); }
-+
-+inline sa_unique_ptr   sap_from_v4mapped(const sa_unique_ptr& sap) { retu=
rn sa_from_v4mapped(sap.get()); }
-+inline sa_unique_ptr   sap_from_v4mapped(const c_sa_unique_ptr& sap) { re=
turn sa_from_v4mapped(sap.get()); }
-+inline sa_unique_ptr   sap_to_v4mapped(const sa_unique_ptr& sap) { return=
 sa_to_v4mapped(sap.get()); }
-+inline sa_unique_ptr   sap_to_v4mapped(const c_sa_unique_ptr& sap) { retu=
rn sa_to_v4mapped(sap.get()); }
-+inline sin_unique_ptr  sinp_from_v4mapped_in6(const sin6_unique_ptr& sin6=
p) { return sin_from_v4mapped_in6(sin6p.get()); }
-+inline sin_unique_ptr  sinp_from_v4mapped_in6(const c_sin6_unique_ptr& si=
n6p) { return sin_from_v4mapped_in6(sin6p.get()); }
-+inline sin6_unique_ptr sin6p_to_v4mapped_in(const sin_unique_ptr& sinp) {=
 return sin6_to_v4mapped_in(sinp.get()); }
-+inline sin6_unique_ptr sin6p_to_v4mapped_in(const c_sin_unique_ptr& sinp)=
 { return sin6_to_v4mapped_in(sinp.get()); }
-+
-+inline uint16_t sap_port(const sa_unique_ptr& sap) { return sa_port(sap.g=
et()); }
-+inline uint16_t sap_port(const c_sa_unique_ptr& sap) { return sa_port(sap=
.get()); }
-+inline void sap_set_port(const sa_unique_ptr& sap, uint16_t port) { sa_se=
t_port(sap.get(), port); }
-+
-+inline bool sap_equal(const sa_unique_ptr& lhs, const sa_unique_ptr& rhs)=
 { return sa_equal(lhs.get(), rhs.get()); }
-+inline bool sap_equal(const sa_unique_ptr& lhs, const c_sa_unique_ptr& rh=
s) { return sa_equal(lhs.get(), rhs.get()); }
-+inline bool sap_equal(const c_sa_unique_ptr& lhs, const sa_unique_ptr& rh=
s) { return sa_equal(lhs.get(), rhs.get()); }
-+inline bool sap_equal(const c_sa_unique_ptr& lhs, const c_sa_unique_ptr& =
rhs) { return sa_equal(lhs.get(), rhs.get()); }
-+inline bool sinp_equal(const sin_unique_ptr& lhs, const sin_unique_ptr& r=
hs) { return sin_equal(lhs.get(), rhs.get()); }
-+inline bool sinp_equal(const sin_unique_ptr& lhs, const c_sin_unique_ptr&=
 rhs) { return sin_equal(lhs.get(), rhs.get()); }
-+inline bool sinp_equal(const c_sin_unique_ptr& lhs, const sin_unique_ptr&=
 rhs) { return sin_equal(lhs.get(), rhs.get()); }
-+inline bool sinp_equal(const c_sin_unique_ptr& lhs, const c_sin_unique_pt=
r& rhs) { return sin_equal(lhs.get(), rhs.get()); }
-+inline bool sin6p_equal(const sin6_unique_ptr& lhs, const sin6_unique_ptr=
& rhs) { return sin6_equal(lhs.get(), rhs.get()); }
-+inline bool sin6p_equal(const sin6_unique_ptr& lhs, const c_sin6_unique_p=
tr& rhs) { return sin6_equal(lhs.get(), rhs.get()); }
-+inline bool sin6p_equal(const c_sin6_unique_ptr& lhs, const sin6_unique_p=
tr& rhs) { return sin6_equal(lhs.get(), rhs.get()); }
-+inline bool sin6p_equal(const c_sin6_unique_ptr& lhs, const c_sin6_unique=
_ptr& rhs) { return sin6_equal(lhs.get(), rhs.get()); }
-+
-+inline bool sap_equal_addr(const sa_unique_ptr& lhs, const sa_unique_ptr&=
 rhs) { return sa_equal_addr(lhs.get(), rhs.get()); }
-+inline bool sap_equal_addr(const sa_unique_ptr& lhs, const c_sa_unique_pt=
r& rhs) { return sa_equal_addr(lhs.get(), rhs.get()); }
-+inline bool sap_equal_addr(const c_sa_unique_ptr& lhs, const sa_unique_pt=
r& rhs) { return sa_equal_addr(lhs.get(), rhs.get()); }
-+inline bool sap_equal_addr(const c_sa_unique_ptr& lhs, const c_sa_unique_=
ptr& rhs) { return sa_equal_addr(lhs.get(), rhs.get()); }
-+inline bool sinp_equal_addr(const sin_unique_ptr& lhs, const sin_unique_p=
tr& rhs) { return sin_equal_addr(lhs.get(), rhs.get()); }
-+inline bool sinp_equal_addr(const sin_unique_ptr& lhs, const c_sin_unique=
_ptr& rhs) { return sin_equal_addr(lhs.get(), rhs.get()); }
-+inline bool sinp_equal_addr(const c_sin_unique_ptr& lhs, const sin_unique=
_ptr& rhs) { return sin_equal_addr(lhs.get(), rhs.get()); }
-+inline bool sinp_equal_addr(const c_sin_unique_ptr& lhs, const c_sin_uniq=
ue_ptr& rhs) { return sin_equal_addr(lhs.get(), rhs.get()); }
-+inline bool sin6p_equal_addr(const sin6_unique_ptr& lhs, const sin6_uniqu=
e_ptr& rhs) { return sin6_equal_addr(lhs.get(), rhs.get()); }
-+inline bool sin6p_equal_addr(const sin6_unique_ptr& lhs, const c_sin6_uni=
que_ptr& rhs) { return sin6_equal_addr(lhs.get(), rhs.get()); }
-+inline bool sin6p_equal_addr(const c_sin6_unique_ptr& lhs, const sin6_uni=
que_ptr& rhs) { return sin6_equal_addr(lhs.get(), rhs.get()); }
-+inline bool sin6p_equal_addr(const c_sin6_unique_ptr& lhs, const c_sin6_u=
nique_ptr& rhs) { return sin6_equal_addr(lhs.get(), rhs.get()); }
-+
-+inline std::string sap_addr_str(const sa_unique_ptr& sap) { return sa_add=
r_str(sap.get()); }
-+inline std::string sap_addr_str(const c_sa_unique_ptr& sap) { return sa_a=
ddr_str(sap.get()); }
-+inline std::string sap_pretty_str(const sa_unique_ptr& sap) { return sa_p=
retty_str(sap.get()); }
-+inline std::string sap_pretty_str(const c_sa_unique_ptr& sap) { return sa=
_pretty_str(sap.get()); }
-+
-+//
-+// Implementations:
-+//
-+
-+inline sa_unique_ptr
-+sa_from_v4mapped_in6(const sockaddr_in6* sin6) {
-+  return sa_from_in(sin_from_v4mapped_in6(sin6));
-+}
-+
-+inline sa_unique_ptr
-+sa_to_v4mapped_in(const sockaddr_in* sin) {
-+  return sa_from_in6(sin6_to_v4mapped_in(sin));
-+}
-+
-+inline sa_unique_ptr
-+sa_from_in(sin_unique_ptr&& sinp) {
-+  return sa_unique_ptr(reinterpret_cast<sockaddr*>(sinp.release()));
-+}
-+
-+inline c_sa_unique_ptr
-+sa_from_in(c_sin_unique_ptr&& sinp) {
-+  return c_sa_unique_ptr(reinterpret_cast<const sockaddr*>(sinp.release()=
));
-+}
-+
-+inline sa_unique_ptr
-+sa_from_in6(sin6_unique_ptr&& sin6p) {
-+  return sa_unique_ptr(reinterpret_cast<sockaddr*>(sin6p.release()));
-+}
-+
-+inline c_sa_unique_ptr
-+sa_from_in6(c_sin6_unique_ptr&& sin6p) {
-+  return c_sa_unique_ptr(reinterpret_cast<const sockaddr*>(sin6p.release(=
)));
-+}
-+
-+inline bool
-+fd_sap_equal(const fd_sap_tuple& lhs, const fd_sap_tuple& rhs) {
-+  return std::get<0>(lhs) =3D=3D std::get<0>(rhs) && sap_equal(std::get<1=
>(lhs), std::get<1>(rhs));
-+}
-+
-+}
-+
-+#endif
-diff --git a/src/torrent/net/socket_address_key.h b/src/torrent/net/socket=
_address_key.h
-index 9d6e0c49..0fd0feb3 100644
---- a/src/torrent/net/socket_address_key.h
-+++ b/src/torrent/net/socket_address_key.h
-@@ -5,7 +5,7 @@
- #define LIBTORRENT_UTILS_SOCKET_ADDRESS_KEY_H
-=20
- #include <cstring>
--#include <inttypes.h>
-+#include <cinttypes>
- #include <netinet/in.h>
-=20
- // Unique key for the socket address, excluding port numbers, etc.
-diff --git a/src/torrent/net/socket_event.cc b/src/torrent/net/socket_even=
t.cc
-new file mode 100644
-index 00000000..e6805290
---- /dev/null
-+++ b/src/torrent/net/socket_event.cc
-@@ -0,0 +1,29 @@
-+#include "config.h"
-+
-+#include "socket_event.h"
-+
-+#include "torrent/exceptions.h"
-+
-+namespace torrent {
-+
-+socket_event::~socket_event() {
-+  if (is_open())
-+    throw internal_error("Called socket_event::~socket_event while still =
open on type " + std::string(type_name()));
-+}
-+
-+void
-+socket_event::event_read() {
-+  throw internal_error("Called unsupported socket_event::event_read on ty=
pe " + std::string(type_name()));
-+}
-+
-+void
-+socket_event::event_write() {
-+  throw internal_error("Called unsupported socket_event::event_write on t=
ype " + std::string(type_name()));
-+}
-+
-+void
-+socket_event::event_error() {
-+  throw internal_error("Called unsupported socket_event::event_error on t=
ype " + std::string(type_name()));
-+}
-+
-+}
-diff --git a/src/torrent/net/socket_event.h b/src/torrent/net/socket_event=
.h
-new file mode 100644
-index 00000000..d9904bd6
---- /dev/null
-+++ b/src/torrent/net/socket_event.h
-@@ -0,0 +1,31 @@
-+#ifndef LIBTORRENT_SOCKET_EVENT_H
-+#define LIBTORRENT_SOCKET_EVENT_H
-+
-+#include <cinttypes>
-+
-+#include "torrent/event.h"
-+#include "torrent/net/socket_address.h"
-+
-+namespace torrent {
-+
-+class LIBTORRENT_EXPORT socket_event : public Event {
-+public:
-+  ~socket_event() override;
-+
-+  const sockaddr* socket_address() const;
-+  uint16_t        socket_address_port() const;
-+
-+  void event_read() override;
-+  void event_write() override;
-+  void event_error() override;
-+
-+protected:
-+  sa_unique_ptr m_socket_address;
-+};
-+
-+inline const sockaddr* socket_event::socket_address() const { return m_so=
cket_address.get(); }
-+inline uint16_t        socket_event::socket_address_port() const { return=
 sap_port(m_socket_address); }
-+
-+}
-+
-+#endif
-diff --git a/src/torrent/net/types.h b/src/torrent/net/types.h
-new file mode 100644
-index 00000000..016e8b85
---- /dev/null
-+++ b/src/torrent/net/types.h
-@@ -0,0 +1,33 @@
-+#ifndef LIBTORRENT_NET_TYPES_H
-+#define LIBTORRENT_NET_TYPES_H
-+
-+#include <memory>
-+#include <tuple>
-+#include <sys/socket.h>
-+
-+struct sockaddr_in;
-+struct sockaddr_in6;
-+struct sockaddr_un;
-+
-+namespace torrent {
-+
-+typedef std::unique_ptr<sockaddr>     sa_unique_ptr;
-+typedef std::unique_ptr<sockaddr_in>  sin_unique_ptr;
-+typedef std::unique_ptr<sockaddr_in6> sin6_unique_ptr;
-+typedef std::unique_ptr<sockaddr_un>  sun_unique_ptr;
-+
-+typedef std::unique_ptr<const sockaddr>     c_sa_unique_ptr;
-+typedef std::unique_ptr<const sockaddr_in>  c_sin_unique_ptr;
-+typedef std::unique_ptr<const sockaddr_in6> c_sin6_unique_ptr;
-+typedef std::unique_ptr<const sockaddr_un>  c_sun_unique_ptr;
-+
-+typedef std::tuple<int, std::unique_ptr<sockaddr>> fd_sap_tuple;
-+
-+struct listen_result_type {
-+  int fd;
-+  sa_unique_ptr address;
-+};
-+
-+}
-+
-+#endif
-diff --git a/src/torrent/object.h b/src/torrent/object.h
-index 3325a434..3f9fe7e4 100644
---- a/src/torrent/object.h
-+++ b/src/torrent/object.h
-@@ -37,8 +37,9 @@
- #ifndef LIBTORRENT_OBJECT_H
- #define LIBTORRENT_OBJECT_H
-=20
--#include <string>
-+#include <limits>
- #include <map>
-+#include <string>
- #include <vector>
- #include <torrent/common.h>
- #include <torrent/exceptions.h>
-@@ -162,6 +163,7 @@ public:
-   string_type&        as_string()                             { check_thr=
ow(TYPE_STRING); return _string(); }
-   const string_type&  as_string() const                       { check_thr=
ow(TYPE_STRING); return _string(); }
-   const string_type&  as_string_c() const                     { check_thr=
ow(TYPE_STRING); return _string(); }
-+  const char*         as_c_str() const                        { check_thr=
ow(TYPE_STRING); return _string().c_str(); }
-   list_type&          as_list()                               { check_thr=
ow(TYPE_LIST); return _list(); }
-   const list_type&    as_list() const                         { check_thr=
ow(TYPE_LIST); return _list(); }
-   map_type&           as_map()                                { check_thr=
ow(TYPE_MAP); return _map(); }
-@@ -179,6 +181,8 @@ public:
-   raw_map&            as_raw_map()                            { check_thr=
ow(TYPE_RAW_MAP); return _raw_map(); }
-   const raw_map&      as_raw_map() const                      { check_thr=
ow(TYPE_RAW_MAP); return _raw_map(); }
-=20
-+  template <typename T> T as_value_type(const char* err_msg) const { chec=
k_value_throw<T>(err_msg); return _value(); }
-+
-   bool                has_key(const key_type& k) const        { check_thr=
ow(TYPE_MAP); return _map().find(k) !=3D _map().end(); }
-   bool                has_key_value(const key_type& k) const  { check_thr=
ow(TYPE_MAP); return check(_map().find(k), TYPE_VALUE); }
-   bool                has_key_string(const key_type& k) const { check_thr=
ow(TYPE_MAP); return check(_map().find(k), TYPE_STRING); }
-@@ -246,6 +250,8 @@ public:
-   inline bool         check(map_type::const_iterator itr, type_type t) co=
nst { return itr !=3D _map().end() && itr->second.type() =3D=3D t; }
-   inline void         check_throw(type_type t) const                     =
    { if (t !=3D type()) throw bencode_error("Wrong object type."); }
-=20
-+  template <typename T> void check_value_throw(const char* err_msg) const=
;
-+
-   uint32_t            m_flags;
-=20
- #ifndef HAVE_STDCXX_0X
-@@ -484,6 +490,19 @@ object_equal(const Object& left, const Object& right)=
 {
-   }
- }
-=20
-+template <typename T>
-+inline void
-+Object::check_value_throw(const char* err_msg) const {
-+  if (!std::numeric_limits<T>::is_integer)
-+    throw internal_error("Tried to check value with non-integer type.");
-+
-+  if (!is_value())
-+    throw bencode_error(err_msg);
-+
-+  if (!(_value() >=3D std::numeric_limits<T>::min() && _value() <=3D std:=
:numeric_limits<T>::max()))
-+    throw bencode_error(err_msg);
-+}
-+
- }
-=20
- #endif
-diff --git a/src/torrent/peer/client_list.cc b/src/torrent/peer/client_lis=
t.cc
-index c857f62d..9c18aa50 100644
---- a/src/torrent/peer/client_list.cc
-+++ b/src/torrent/peer/client_list.cc
-@@ -37,8 +37,8 @@
- #include "config.h"
-=20
- #include <algorithm>
-+#include <functional>
- #include <rak/string_manip.h>
--#include lt_tr1_functional
-=20
- #include "client_list.h"
- #include "exceptions.h"
-diff --git a/src/torrent/peer/connection_list.h b/src/torrent/peer/connect=
ion_list.h
-index ec26835f..eb058784 100644
---- a/src/torrent/peer/connection_list.h
-+++ b/src/torrent/peer/connection_list.h
-@@ -37,9 +37,10 @@
- #ifndef LIBTORRENT_PEER_CONNECTION_LIST_H
- #define LIBTORRENT_PEER_CONNECTION_LIST_H
-=20
-+#include <functional>
- #include <list>
- #include <vector>
--#include lt_tr1_functional
-+
- #include <torrent/common.h>
- #include <torrent/hash_string.h>
-=20
-diff --git a/src/torrent/peer/peer_list.cc b/src/torrent/peer/peer_list.cc
-index aa60939a..080a7f13 100644
---- a/src/torrent/peer/peer_list.cc
-+++ b/src/torrent/peer/peer_list.cc
-@@ -36,8 +36,6 @@
-=20
- #include "config.h"
-=20
--#define __STDC_FORMAT_MACROS
--
- #include <algorithm>
- #include <functional>
- #include <rak/functional.h>
-@@ -56,6 +54,8 @@
-=20
- #define LT_LOG_EVENTS(log_fmt, ...)                                     \
-   lt_log_print_info(LOG_PEER_LIST_EVENTS, m_info, "peer_list", log_fmt, _=
_VA_ARGS__);
-+#define LT_LOG_ADDRESS(log_fmt, ...)                                    \
-+  lt_log_print_info(LOG_PEER_LIST_ADDRESS, m_info, "peer_list", log_fmt, =
__VA_ARGS__);
- #define LT_LOG_SA_FMT "'%s:%" PRIu16 "'"
-=20
- namespace torrent {
-@@ -196,6 +196,7 @@ PeerList::insert_available(const void* al) {
-   for (; itr !=3D last; itr++) {
-     if (!socket_address_key::is_comparable_sockaddr(itr->c_sockaddr()) ||=
 itr->port() =3D=3D 0) {
-       invalid++;
-+      LT_LOG_ADDRESS("skipped invalid address " LT_LOG_SA_FMT, itr->addre=
ss_str().c_str(), itr->port());
-       continue;
-     }
-=20
-@@ -242,6 +243,8 @@ PeerList::insert_available(const void* al) {
-=20
-     inserted++;
-     m_available_list->push_back(&*itr);
-+
-+    LT_LOG_ADDRESS("added available address " LT_LOG_SA_FMT, itr->address=
_str().c_str(), itr->port());
-   }
-=20
-   LT_LOG_EVENTS("inserted peers"
-diff --git a/src/torrent/poll.h b/src/torrent/poll.h
-index b12c8ec2..15a73897 100644
---- a/src/torrent/poll.h
-+++ b/src/torrent/poll.h
-@@ -37,8 +37,7 @@
- #ifndef LIBTORRENT_TORRENT_POLL_H
- #define LIBTORRENT_TORRENT_POLL_H
-=20
--#include lt_tr1_functional
--
-+#include <functional>
- #include <torrent/common.h>
-=20
- namespace torrent {
-diff --git a/src/torrent/torrent.cc b/src/torrent/torrent.cc
-index 339c2c4f..fb70d247 100644
---- a/src/torrent/torrent.cc
-+++ b/src/torrent/torrent.cc
-@@ -1,39 +1,3 @@
--// libTorrent - BitTorrent library
--// Copyright (C) 2005-2011, Jari Sundell
--//
--// This program is free software; you can redistribute it and/or modify
--// it under the terms of the GNU General Public License as published by
--// the Free Software Foundation; either version 2 of the License, or
--// (at your option) any later version.
--//=20
--// This program is distributed in the hope that it will be useful,
--// but WITHOUT ANY WARRANTY; without even the implied warranty of
--// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--// GNU General Public License for more details.
--//=20
--// You should have received a copy of the GNU General Public License
--// along with this program; if not, write to the Free Software
--// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
--//
--// In addition, as a special exception, the copyright holders give
--// permission to link the code of portions of this program with the
--// OpenSSL library under certain conditions as described in each
--// individual source file, and distribute linked combinations
--// including the two.
--//
--// You must obey the GNU General Public License in all respects for
--// all of the code used other than OpenSSL.  If you modify file(s)
--// with this exception, you may extend this exception to your version
--// of the file(s), but you are not obligated to do so.  If you do not
--// wish to do so, delete this exception statement from your version.
--// If you delete this exception statement from all source files in the
--// program, then also delete it here.
--//
--// Contact:  Jari Sundell <jaris@ifi.uio.no>
--//
--//           Skomakerveien 33
--//           3185 Skoppum, NORWAY
--
- #include "config.h"
-=20
- #include <rak/address_info.h>
-@@ -139,8 +103,8 @@ main_thread() {
-=20
- ChunkManager*      chunk_manager() { return manager->chunk_manager(); }
- ClientList*        client_list() { return manager->client_list(); }
--FileManager*       file_manager() { return manager->file_manager(); }
- ConnectionManager* connection_manager() { return manager->connection_mana=
ger(); }
-+FileManager*       file_manager() { return manager->file_manager(); }
- DhtManager*        dht_manager() { return manager->dht_manager(); }
- ResourceManager*   resource_manager() { return manager->resource_manager(=
); }
-=20
-@@ -189,8 +153,10 @@ download_add(Object* object) {
-     download->main()->set_metadata_size(metadata_size);
-   }
-=20
-+  std::string local_id =3D PEER_NAME + rak::generate_random<std::string>(=
20 - std::string(PEER_NAME).size());
-+
-   download->set_hash_queue(manager->hash_queue());
--  download->initialize(infoHash, PEER_NAME + rak::generate_random<std::st=
ring>(20 - std::string(PEER_NAME).size()));
-+  download->initialize(infoHash, local_id);
-=20
-   // Add trackers, etc, after setting the info hash so that log
-   // entries look sane.
-diff --git a/src/torrent/torrent.h b/src/torrent/torrent.h
-index 7bcf88fe..0cdfdaa7 100644
---- a/src/torrent/torrent.h
-+++ b/src/torrent/torrent.h
-@@ -44,6 +44,11 @@
-=20
- namespace torrent {
-=20
-+class FileManager;
-+class ResourceManager;
-+
-+class thread_base;
-+
- // Make sure you seed srandom and srand48 if available.
- void                initialize() LIBTORRENT_EXPORT;
-=20
-@@ -53,16 +58,12 @@ void                cleanup() LIBTORRENT_EXPORT;
-=20
- bool                is_inactive() LIBTORRENT_EXPORT;
-=20
--class FileManager;
--class ResourceManager;
--class thread_base;
--
- thread_base*        main_thread() LIBTORRENT_EXPORT;
-=20
- ChunkManager*       chunk_manager() LIBTORRENT_EXPORT;
- ClientList*         client_list() LIBTORRENT_EXPORT;
--FileManager*        file_manager() LIBTORRENT_EXPORT;
- ConnectionManager*  connection_manager() LIBTORRENT_EXPORT;
-+FileManager*        file_manager() LIBTORRENT_EXPORT;
- DhtManager*         dht_manager() LIBTORRENT_EXPORT;
- ResourceManager*    resource_manager() LIBTORRENT_EXPORT;
-=20
-diff --git a/src/torrent/tracker.h b/src/torrent/tracker.h
-index a528ef6a..bd7546a9 100644
---- a/src/torrent/tracker.h
-+++ b/src/torrent/tracker.h
-@@ -2,7 +2,7 @@
- #define LIBTORRENT_TRACKER_H
-=20
- #include <string>
--#include <inttypes.h>
-+#include <cinttypes>
- #include <torrent/common.h>
-=20
- namespace torrent {
-diff --git a/src/torrent/tracker_controller.h b/src/torrent/tracker_contro=
ller.h
-index 70d1b43f..9452be0f 100644
---- a/src/torrent/tracker_controller.h
-+++ b/src/torrent/tracker_controller.h
-@@ -37,8 +37,9 @@
- #ifndef LIBTORRENT_TRACKER_CONTROLLER_H
- #define LIBTORRENT_TRACKER_CONTROLLER_H
-=20
-+#include <functional>
- #include <string>
--#include lt_tr1_functional
-+
- #include <torrent/common.h>
- #include <torrent/tracker.h>
-=20
-diff --git a/src/torrent/tracker_list.h b/src/torrent/tracker_list.h
-index c6817b3a..bb06f8af 100644
---- a/src/torrent/tracker_list.h
-+++ b/src/torrent/tracker_list.h
-@@ -38,10 +38,10 @@
- #define LIBTORRENT_TRACKER_LIST_H
-=20
- #include <algorithm>
-+#include <functional>
- #include <string>
- #include <vector>
- #include <torrent/common.h>
--#include lt_tr1_functional
-=20
- namespace torrent {
-=20
-diff --git a/src/torrent/utils/Makefile.am b/src/torrent/utils/Makefile.am
-index 51c9a026..a48786c6 100644
---- a/src/torrent/utils/Makefile.am
-+++ b/src/torrent/utils/Makefile.am
-@@ -8,10 +8,10 @@ libsub_torrentutils_la_SOURCES =3D \
- 	log.h \
- 	log_buffer.cc \
- 	log_buffer.h \
--	net.cc \
--	net.h \
- 	option_strings.cc \
- 	option_strings.h \
-+	random.cc \
-+	random.h \
- 	ranges.h \
- 	resume.cc \
- 	resume.h \
-@@ -32,7 +32,6 @@ libtorrentinclude_HEADERS =3D \
- 	extents.h \
- 	log.h \
- 	log_buffer.h \
--	net.h \
- 	option_strings.h \
- 	ranges.h \
- 	resume.h \
-diff --git a/src/torrent/utils/directory_events.h b/src/torrent/utils/dire=
ctory_events.h
-index 30fa0508..fd9246c5 100644
---- a/src/torrent/utils/directory_events.h
-+++ b/src/torrent/utils/directory_events.h
-@@ -37,9 +37,10 @@
- #ifndef LIBTORRENT_DIRECTORY_EVENTS_H
- #define LIBTORRENT_DIRECTORY_EVENTS_H
-=20
-+#include <functional>
- #include <string>
- #include <vector>
--#include lt_tr1_functional
-+
- #include <torrent/event.h>
-=20
- namespace torrent {
-diff --git a/src/torrent/utils/log.cc b/src/torrent/utils/log.cc
-index 6c605474..b855a2c6 100644
---- a/src/torrent/utils/log.cc
-+++ b/src/torrent/utils/log.cc
-@@ -1,45 +1,6 @@
--// libTorrent - BitTorrent library
--// Copyright (C) 2005-2011, Jari Sundell
--//
--// This program is free software; you can redistribute it and/or modify
--// it under the terms of the GNU General Public License as published by
--// the Free Software Foundation; either version 2 of the License, or
--// (at your option) any later version.
--//=20
--// This program is distributed in the hope that it will be useful,
--// but WITHOUT ANY WARRANTY; without even the implied warranty of
--// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--// GNU General Public License for more details.
--//=20
--// You should have received a copy of the GNU General Public License
--// along with this program; if not, write to the Free Software
--// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
--//
--// In addition, as a special exception, the copyright holders give
--// permission to link the code of portions of this program with the
--// OpenSSL library under certain conditions as described in each
--// individual source file, and distribute linked combinations
--// including the two.
--//
--// You must obey the GNU General Public License in all respects for
--// all of the code used other than OpenSSL.  If you modify file(s)
--// with this exception, you may extend this exception to your version
--// of the file(s), but you are not obligated to do so.  If you do not
--// wish to do so, delete this exception statement from your version.
--// If you delete this exception statement from all source files in the
--// program, then also delete it here.
--//
--// Contact:  Jari Sundell <jaris@ifi.uio.no>
--//
--//           Skomakerveien 33
--//           3185 Skoppum, NORWAY
--
- #include "config.h"
-=20
--#define __STDC_FORMAT_MACROS
--
- #include "log.h"
--#include "log_buffer.h"
-=20
- #include "globals.h"
- #include "torrent/exceptions.h"
-@@ -54,8 +15,6 @@
- #include <fstream>
- #include <functional>
- #include <memory>
--#include lt_tr1_functional
--#include lt_tr1_memory
-=20
- namespace torrent {
-=20
-@@ -232,7 +191,6 @@ log_initialize() {
-=20
-   LOG_CASCADE(LOG_CRITICAL);
-=20
--  LOG_CASCADE(LOG_CONNECTION_CRITICAL);
-   LOG_CASCADE(LOG_PEER_CRITICAL);
-   LOG_CASCADE(LOG_SOCKET_CRITICAL);
-   LOG_CASCADE(LOG_STORAGE_CRITICAL);
-@@ -240,7 +198,6 @@ log_initialize() {
-   LOG_CASCADE(LOG_TRACKER_CRITICAL);
-   LOG_CASCADE(LOG_TORRENT_CRITICAL);
-=20
--  LOG_CHILDREN_CASCADE(LOG_CRITICAL, LOG_CONNECTION_CRITICAL);
-   LOG_CHILDREN_CASCADE(LOG_CRITICAL, LOG_PEER_CRITICAL);
-   LOG_CHILDREN_CASCADE(LOG_CRITICAL, LOG_SOCKET_CRITICAL);
-   LOG_CHILDREN_CASCADE(LOG_CRITICAL, LOG_STORAGE_CRITICAL);
-@@ -248,6 +205,12 @@ log_initialize() {
-   LOG_CHILDREN_CASCADE(LOG_CRITICAL, LOG_TRACKER_CRITICAL);
-   LOG_CHILDREN_CASCADE(LOG_CRITICAL, LOG_TORRENT_CRITICAL);
-=20
-+  LOG_LINK(LOG_CONNECTION, LOG_CONNECTION_BIND);
-+  LOG_LINK(LOG_CONNECTION, LOG_CONNECTION_FD);
-+  LOG_LINK(LOG_CONNECTION, LOG_CONNECTION_FILTER);
-+  LOG_LINK(LOG_CONNECTION, LOG_CONNECTION_HANDSHAKE);
-+  LOG_LINK(LOG_CONNECTION, LOG_CONNECTION_LISTEN);
-+
-   LOG_LINK(LOG_DHT_ALL, LOG_DHT_MANAGER);
-   LOG_LINK(LOG_DHT_ALL, LOG_DHT_NODE);
-   LOG_LINK(LOG_DHT_ALL, LOG_DHT_ROUTER);
-@@ -447,21 +410,4 @@ log_open_gz_file_output(const char* name, const char*=
 filename, bool append) {
-                                   std::placeholders::_3));
- }
-=20
--log_buffer*
--log_open_log_buffer(const char* name) {
--  log_buffer* buffer =3D new log_buffer;
--
--  try {
--    log_open_output(name, std::bind(&log_buffer::lock_and_push_log, buffe=
r,
--                                    std::placeholders::_1,
--                                    std::placeholders::_2,
--                                    std::placeholders::_3));
--    return buffer;
--
--  } catch (torrent::input_error& e) {
--    delete buffer;
--    throw;
--  }
--}
--
- }
-diff --git a/src/torrent/utils/log.h b/src/torrent/utils/log.h
-index 0dfdc86b..fe6127d6 100644
---- a/src/torrent/utils/log.h
-+++ b/src/torrent/utils/log.h
-@@ -1,47 +1,12 @@
--// libTorrent - BitTorrent library
--// Copyright (C) 2005-2011, Jari Sundell
--//
--// This program is free software; you can redistribute it and/or modify
--// it under the terms of the GNU General Public License as published by
--// the Free Software Foundation; either version 2 of the License, or
--// (at your option) any later version.
--//=20
--// This program is distributed in the hope that it will be useful,
--// but WITHOUT ANY WARRANTY; without even the implied warranty of
--// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--// GNU General Public License for more details.
--//=20
--// You should have received a copy of the GNU General Public License
--// along with this program; if not, write to the Free Software
--// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
--//
--// In addition, as a special exception, the copyright holders give
--// permission to link the code of portions of this program with the
--// OpenSSL library under certain conditions as described in each
--// individual source file, and distribute linked combinations
--// including the two.
--//
--// You must obey the GNU General Public License in all respects for
--// all of the code used other than OpenSSL.  If you modify file(s)
--// with this exception, you may extend this exception to your version
--// of the file(s), but you are not obligated to do so.  If you do not
--// wish to do so, delete this exception statement from your version.
--// If you delete this exception statement from all source files in the
--// program, then also delete it here.
--//
--// Contact:  Jari Sundell <jaris@ifi.uio.no>
--//
--//           Skomakerveien 33
--//           3185 Skoppum, NORWAY
--
- #ifndef LIBTORRENT_UTILS_LOG_H
- #define LIBTORRENT_UTILS_LOG_H
-=20
-+#include <array>
- #include <bitset>
-+#include <functional>
- #include <string>
- #include <vector>
--#include lt_tr1_array
--#include lt_tr1_functional
-+
- #include <torrent/common.h>
-=20
- namespace torrent {
-@@ -55,13 +20,6 @@ enum {
-   LOG_INFO,
-   LOG_DEBUG,
-=20
--  LOG_CONNECTION_CRITICAL,
--  LOG_CONNECTION_ERROR,
--  LOG_CONNECTION_WARN,
--  LOG_CONNECTION_NOTICE,
--  LOG_CONNECTION_INFO,
--  LOG_CONNECTION_DEBUG,
--
-   LOG_DHT_CRITICAL,
-   LOG_DHT_ERROR,
-   LOG_DHT_WARN,
-@@ -113,6 +71,14 @@ enum {
-=20
-   LOG_NON_CASCADING,
-=20
-+  LOG_CONNECTION,
-+  LOG_CONNECTION_BIND,
-+  LOG_CONNECTION_FD,
-+  LOG_CONNECTION_FILTER,
-+  LOG_CONNECTION_HANDSHAKE,
-+  LOG_CONNECTION_LISTEN,
-+
-+  // TODO: Rename dht_all to just dht.
-   LOG_DHT_ALL,
-   LOG_DHT_MANAGER,
-   LOG_DHT_NODE,
-@@ -125,7 +91,10 @@ enum {
-   LOG_INSTRUMENTATION_POLLING,
-   LOG_INSTRUMENTATION_TRANSFERS,
-=20
-+  LOG_MOCK_CALLS,
-+
-   LOG_PEER_LIST_EVENTS,
-+  LOG_PEER_LIST_ADDRESS,
-=20
-   LOG_PROTOCOL_PIECE_EVENTS,
-   LOG_PROTOCOL_METADATA_EVENTS,
-@@ -137,6 +106,8 @@ enum {
-   LOG_RPC_EVENTS,
-   LOG_RPC_DUMP,
-=20
-+  LOG_SYSTEM,
-+
-   LOG_UI_EVENTS,
-=20
-   LOG_GROUP_MAX_SIZE
-@@ -145,34 +116,32 @@ enum {
- #define lt_log_is_valid(log_group) (torrent::log_groups[log_group].valid(=
))
-=20
- #define lt_log_print(log_group, ...)                                    \
--  if (torrent::log_groups[log_group].valid())                           \
--    torrent::log_groups[log_group].internal_print(NULL, NULL, NULL, 0, __=
VA_ARGS__);
-+  { if (torrent::log_groups[log_group].valid())                         \
-+      torrent::log_groups[log_group].internal_print(NULL, NULL, NULL, 0, =
__VA_ARGS__); }
-=20
- #define lt_log_print_info(log_group, log_info, log_subsystem, ...)      \
--  if (torrent::log_groups[log_group].valid())                           \
--    torrent::log_groups[log_group].internal_print(&log_info->hash(), log_=
subsystem, NULL, 0, __VA_ARGS__);
-+  { if (torrent::log_groups[log_group].valid())                         \
-+      torrent::log_groups[log_group].internal_print(&log_info->hash(), lo=
g_subsystem, NULL, 0, __VA_ARGS__); }
-=20
- #define lt_log_print_data(log_group, log_data, log_subsystem, ...)      \
--  if (torrent::log_groups[log_group].valid())                           \
--    torrent::log_groups[log_group].internal_print(&log_data->hash(), log_=
subsystem, NULL, 0, __VA_ARGS__);
-+  { if (torrent::log_groups[log_group].valid())                         \
-+      torrent::log_groups[log_group].internal_print(&log_data->hash(), lo=
g_subsystem, NULL, 0, __VA_ARGS__); }
-=20
- #define lt_log_print_dump(log_group, log_dump_data, log_dump_size, ...) \
--  if (torrent::log_groups[log_group].valid())                           \
--    torrent::log_groups[log_group].internal_print(NULL, NULL, log_dump_da=
ta, log_dump_size, __VA_ARGS__); \
-+  { if (torrent::log_groups[log_group].valid())                         \
-+      torrent::log_groups[log_group].internal_print(NULL, NULL, log_dump_=
data, log_dump_size, __VA_ARGS__); }
-=20
- #define lt_log_print_hash(log_group, log_hash, log_subsystem, ...)      \
--  if (torrent::log_groups[log_group].valid())                           \
--    torrent::log_groups[log_group].internal_print(&log_hash, log_subsyste=
m, NULL, 0, __VA_ARGS__);
-+  { if (torrent::log_groups[log_group].valid())                         \
-+    torrent::log_groups[log_group].internal_print(&log_hash, log_subsyste=
m, NULL, 0, __VA_ARGS__); }
-=20
- #define lt_log_print_info_dump(log_group, log_dump_data, log_dump_size, l=
og_info, log_subsystem, ...) \
--  if (torrent::log_groups[log_group].valid())                           \
--    torrent::log_groups[log_group].internal_print(&log_info->hash(), log_=
subsystem, log_dump_data, log_dump_size, __VA_ARGS__); \
-+  { if (torrent::log_groups[log_group].valid())                         \
-+      torrent::log_groups[log_group].internal_print(&log_info->hash(), lo=
g_subsystem, log_dump_data, log_dump_size, __VA_ARGS__); }
-=20
- #define lt_log_print_subsystem(log_group, log_subsystem, ...)           \
--  if (torrent::log_groups[log_group].valid())                           \
--    torrent::log_groups[log_group].internal_print(NULL, log_subsystem, NU=
LL, 0, __VA_ARGS__);
--
--class log_buffer;
-+  { if (torrent::log_groups[log_group].valid())                         \
-+      torrent::log_groups[log_group].internal_print(NULL, log_subsystem, =
NULL, 0, __VA_ARGS__); }
-=20
- typedef std::function<void (const char*, unsigned int, int)> log_slot;
-=20
-@@ -222,7 +191,7 @@ private:
-=20
- typedef std::array<log_group, LOG_GROUP_MAX_SIZE> log_group_list;
-=20
--extern log_group_list  log_groups LIBTORRENT_EXPORT;
-+extern log_group_list log_groups LIBTORRENT_EXPORT;
-=20
- void log_initialize() LIBTORRENT_EXPORT;
- void log_cleanup() LIBTORRENT_EXPORT;
-@@ -237,9 +206,8 @@ void log_remove_group_output(int group, const char* na=
me) LIBTORRENT_EXPORT;
- void log_add_child(int group, int child) LIBTORRENT_EXPORT;
- void log_remove_child(int group, int child) LIBTORRENT_EXPORT;
-=20
--void        log_open_file_output(const char* name, const char* filename, =
bool append =3D false) LIBTORRENT_EXPORT;
--void        log_open_gz_file_output(const char* name, const char* filenam=
e, bool append =3D false) LIBTORRENT_EXPORT;
--log_buffer* log_open_log_buffer(const char* name) LIBTORRENT_EXPORT;
-+void log_open_file_output(const char* name, const char* filename, bool ap=
pend =3D false) LIBTORRENT_EXPORT;
-+void log_open_gz_file_output(const char* name, const char* filename, bool=
 append =3D false) LIBTORRENT_EXPORT;
-=20
- //
- // Implementation:
-diff --git a/src/torrent/utils/log_buffer.cc b/src/torrent/utils/log_buffe=
r.cc
-index f82d57e0..5bf159a4 100644
---- a/src/torrent/utils/log_buffer.cc
-+++ b/src/torrent/utils/log_buffer.cc
-@@ -1,46 +1,8 @@
--// libTorrent - BitTorrent library
--// Copyright (C) 2005-2011, Jari Sundell
--//
--// This program is free software; you can redistribute it and/or modify
--// it under the terms of the GNU General Public License as published by
--// the Free Software Foundation; either version 2 of the License, or
--// (at your option) any later version.
--//=20
--// This program is distributed in the hope that it will be useful,
--// but WITHOUT ANY WARRANTY; without even the implied warranty of
--// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--// GNU General Public License for more details.
--//=20
--// You should have received a copy of the GNU General Public License
--// along with this program; if not, write to the Free Software
--// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
--//
--// In addition, as a special exception, the copyright holders give
--// permission to link the code of portions of this program with the
--// OpenSSL library under certain conditions as described in each
--// individual source file, and distribute linked combinations
--// including the two.
--//
--// You must obey the GNU General Public License in all respects for
--// all of the code used other than OpenSSL.  If you modify file(s)
--// with this exception, you may extend this exception to your version
--// of the file(s), but you are not obligated to do so.  If you do not
--// wish to do so, delete this exception statement from your version.
--// If you delete this exception statement from all source files in the
--// program, then also delete it here.
--//
--// Contact:  Jari Sundell <jaris@ifi.uio.no>
--//
--//           Skomakerveien 33
--//           3185 Skoppum, NORWAY
--
- #include "config.h"
-=20
- #include "log_buffer.h"
-=20
--#include <functional>
--#include lt_tr1_functional
--
-+#include "log.h"
- #include "globals.h"
-=20
- namespace torrent {
-@@ -72,4 +34,19 @@ log_buffer::lock_and_push_log(const char* data, size_t =
length, int group) {
-   unlock();
- }
-=20
-+static void
-+log_buffer_deleter(log_buffer* lb) {
-+  delete lb;
-+}
-+
-+log_buffer_ptr
-+log_open_log_buffer(const char* name) {
-+  // TODO: Deregister when deleting.
-+  auto buffer =3D log_buffer_ptr(new log_buffer, std::bind(&log_buffer_de=
leter, std::placeholders::_1));
-+
-+  log_open_output(name, std::bind(&log_buffer::lock_and_push_log, buffer.=
get(),
-+                                  std::placeholders::_1, std::placeholder=
s::_2, std::placeholders::_3));
-+  return buffer;
-+}
-+
- }
-diff --git a/src/torrent/utils/log_buffer.h b/src/torrent/utils/log_buffer=
.h
-index befd780b..259e5910 100644
---- a/src/torrent/utils/log_buffer.h
-+++ b/src/torrent/utils/log_buffer.h
-@@ -1,47 +1,11 @@
--// libTorrent - BitTorrent library
--// Copyright (C) 2005-2011, Jari Sundell
--//
--// This program is free software; you can redistribute it and/or modify
--// it under the terms of the GNU General Public License as published by
--// the Free Software Foundation; either version 2 of the License, or
--// (at your option) any later version.
--//=20
--// This program is distributed in the hope that it will be useful,
--// but WITHOUT ANY WARRANTY; without even the implied warranty of
--// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--// GNU General Public License for more details.
--//=20
--// You should have received a copy of the GNU General Public License
--// along with this program; if not, write to the Free Software
--// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
--//
--// In addition, as a special exception, the copyright holders give
--// permission to link the code of portions of this program with the
--// OpenSSL library under certain conditions as described in each
--// individual source file, and distribute linked combinations
--// including the two.
--//
--// You must obey the GNU General Public License in all respects for
--// all of the code used other than OpenSSL.  If you modify file(s)
--// with this exception, you may extend this exception to your version
--// of the file(s), but you are not obligated to do so.  If you do not
--// wish to do so, delete this exception statement from your version.
--// If you delete this exception statement from all source files in the
--// program, then also delete it here.
--//
--// Contact:  Jari Sundell <jaris@ifi.uio.no>
--//
--//           Skomakerveien 33
--//           3185 Skoppum, NORWAY
--
--#ifndef LIBTORRENT_UTILS_LOG_BUFFER_H
--#define LIBTORRENT_UTILS_LOG_BUFFER_H
-+#ifndef LIBTORRENT_TORRENT_UTILS_LOG_BUFFER_H
-+#define LIBTORRENT_TORRENT_UTILS_LOG_BUFFER_H
-=20
- #include <string>
- #include <deque>
-+#include <functional>
-+#include <memory>
- #include <pthread.h>
--#include lt_tr1_functional
--#include <torrent/common.h>
-=20
- namespace torrent {
-=20
-@@ -57,9 +21,9 @@ struct log_entry {
-   std::string message;
- };
-=20
--class LIBTORRENT_EXPORT log_buffer : private std::deque<log_entry> {
-+class [[gnu::visibility("default")]] log_buffer : private std::deque<log_=
entry> {
- public:
--  typedef std::deque<log_entry>       base_type;
-+  typedef std::deque<log_entry>  base_type;
-   typedef std::function<void ()> slot_void;
-=20
-   using base_type::iterator;
-@@ -97,6 +61,10 @@ private:
-   slot_void           m_slot_update;
- };
-=20
-+typedef std::unique_ptr<log_buffer, std::function<void (log_buffer*)>> lo=
g_buffer_ptr;
-+
-+[[gnu::visibility("default")]] log_buffer_ptr log_open_log_buffer(const c=
har* name);
-+
- }
-=20
- #endif
-diff --git a/src/torrent/utils/net.cc b/src/torrent/utils/net.cc
-deleted file mode 100644
-index 83c9b506..00000000
---- a/src/torrent/utils/net.cc
-+++ /dev/null
-@@ -1,72 +0,0 @@
--// libTorrent - BitTorrent library
--// Copyright (C) 2005-2011, Jari Sundell
--//
--// This program is free software; you can redistribute it and/or modify
--// it under the terms of the GNU General Public License as published by
--// the Free Software Foundation; either version 2 of the License, or
--// (at your option) any later version.
--//=20
--// This program is distributed in the hope that it will be useful,
--// but WITHOUT ANY WARRANTY; without even the implied warranty of
--// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--// GNU General Public License for more details.
--//=20
--// You should have received a copy of the GNU General Public License
--// along with this program; if not, write to the Free Software
--// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
--//
--// In addition, as a special exception, the copyright holders give
--// permission to link the code of portions of this program with the
--// OpenSSL library under certain conditions as described in each
--// individual source file, and distribute linked combinations
--// including the two.
--//
--// You must obey the GNU General Public License in all respects for
--// all of the code used other than OpenSSL.  If you modify file(s)
--// with this exception, you may extend this exception to your version
--// of the file(s), but you are not obligated to do so.  If you do not
--// wish to do so, delete this exception statement from your version.
--// If you delete this exception statement from all source files in the
--// program, then also delete it here.
--//
--// Contact:  Jari Sundell <jaris@ifi.uio.no>
--//
--//           Skomakerveien 33
--//           3185 Skoppum, NORWAY
--
--#include "config.h"
--
--#include "net.h"
--#include "exceptions.h"
--
--#include <cstring>
--
--namespace torrent {
--
--addrinfo*
--address_info_lookup(const char* hostname, int family, int socktype) {
--  addrinfo hints;
--  std::memset(&hints, 0, sizeof(addrinfo));
--  hints.ai_family =3D family;
--  hints.ai_socktype =3D socktype;
-- =20
--  addrinfo* res =3D NULL;
--  int err =3D ::getaddrinfo(hostname, NULL, &hints, &res);
--
--  if (err)
--    throw address_info_error(err);
--
--  return res;
--}
--
--bool
--address_info_call(addrinfo* ai, int flags, slot_ai_success slot_success) =
{
--  while (ai !=3D NULL) {
--    slot_success(ai->ai_addr, ai->ai_addrlen);
--    return true;
--  }
--
--  return false;
--}
--
--}
-diff --git a/src/torrent/utils/net.h b/src/torrent/utils/net.h
-deleted file mode 100644
-index f5af7cc0..00000000
---- a/src/torrent/utils/net.h
-+++ /dev/null
-@@ -1,56 +0,0 @@
--// libTorrent - BitTorrent library
--// Copyright (C) 2005-2011, Jari Sundell
--//
--// This program is free software; you can redistribute it and/or modify
--// it under the terms of the GNU General Public License as published by
--// the Free Software Foundation; either version 2 of the License, or
--// (at your option) any later version.
--//=20
--// This program is distributed in the hope that it will be useful,
--// but WITHOUT ANY WARRANTY; without even the implied warranty of
--// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--// GNU General Public License for more details.
--//=20
--// You should have received a copy of the GNU General Public License
--// along with this program; if not, write to the Free Software
--// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
--//
--// In addition, as a special exception, the copyright holders give
--// permission to link the code of portions of this program with the
--// OpenSSL library under certain conditions as described in each
--// individual source file, and distribute linked combinations
--// including the two.
--//
--// You must obey the GNU General Public License in all respects for
--// all of the code used other than OpenSSL.  If you modify file(s)
--// with this exception, you may extend this exception to your version
--// of the file(s), but you are not obligated to do so.  If you do not
--// wish to do so, delete this exception statement from your version.
--// If you delete this exception statement from all source files in the
--// program, then also delete it here.
--//
--// Contact:  Jari Sundell <jaris@ifi.uio.no>
--//
--//           Skomakerveien 33
--//           3185 Skoppum, NORWAY
--
--#ifndef LIBTORRENT_UTILS_NET_H
--#define LIBTORRENT_UTILS_NET_H
--
--#include <netdb.h>
--#include lt_tr1_functional
--
--namespace torrent {
--
--typedef std::function<void (sockaddr*, socklen_t)> slot_ai_success;
--//typedef std::function<void (const char*, int)>     slot_ai_failure;
--
--// Throws address_info_error on lookup failure.
--addrinfo*   address_info_lookup(const char* hostname, int family, int soc=
ktype);
--inline void address_info_free(addrinfo* ai) { ::freeaddrinfo(ai); }
--
--bool        address_info_call(addrinfo* ai, int flags, slot_ai_success sl=
ot_success);
--
--}
--
--#endif
-diff --git a/src/torrent/utils/option_strings.cc b/src/torrent/utils/optio=
n_strings.cc
-index 5992cf37..101e2688 100644
---- a/src/torrent/utils/option_strings.cc
-+++ b/src/torrent/utils/option_strings.cc
-@@ -62,7 +62,7 @@ struct option_pair {
-   unsigned int value;
- };
-=20
--option_pair option_list_connection[] =3D {
-+option_pair option_list_connection_type[] =3D {
-   { "leech",        Download::CONNECTION_LEECH },
-   { "seed",         Download::CONNECTION_SEED },
-   { "initial_seed", Download::CONNECTION_INITIAL_SEED },
-@@ -124,6 +124,19 @@ option_pair option_list_tracker_mode[] =3D {
-   { NULL, 0 }
- };
-=20
-+const char* option_list_handshake_connection[] =3D {
-+  "none",
-+  "incoming",
-+  "outgoing_normal",
-+  "outgoing_encrypted",
-+  "outgoing_proxy",
-+  "success",
-+  "dropped",
-+  "failed",
-+  "retry_plaintext",
-+  "retry_encrypted"
-+};
-+
- const char* option_list_log_group[] =3D {
-   "critical",
-   "error",
-@@ -132,13 +145,6 @@ const char* option_list_log_group[] =3D {
-   "info",
-   "debug",
-  =20
--  "connection_critical",
--  "connection_error",
--  "connection_warn",
--  "connection_notice",
--  "connection_info",
--  "connection_debug",
-- =20
-   "dht_critical",
-   "dht_error",
-   "dht_warn",
-@@ -190,6 +196,13 @@ const char* option_list_log_group[] =3D {
-=20
-   "__non_cascading__",
-=20
-+  "connection",
-+  "connection_bind",
-+  "connection_fd",
-+  "connection_filter",
-+  "connection_hanshake",
-+  "connection_listen",
-+
-   "dht_all",
-   "dht_manager",
-   "dht_node",
-@@ -202,7 +215,10 @@ const char* option_list_log_group[] =3D {
-   "instrumentation_polling",
-   "instrumentation_transfers",
-=20
-+  "mock_calls",
-+
-   "peer_list_events",
-+  "peer_list_address",
-=20
-   "protocol_piece_events",
-   "protocol_metadata_events",
-@@ -214,6 +230,8 @@ const char* option_list_log_group[] =3D {
-   "rpc_events",
-   "rpc_dump",
-=20
-+  "system",
-+
-   "ui_events",
-=20
-   NULL
-@@ -230,7 +248,7 @@ const char* option_list_tracker_event[] =3D {
- };
-=20
- option_pair* option_pair_lists[OPTION_START_COMPACT] =3D {
--  option_list_connection,
-+  option_list_connection_type,
-   option_list_heuristics,
-   option_list_heuristics_download,
-   option_list_heuristics_upload,
-@@ -244,6 +262,7 @@ option_pair* option_pair_lists[OPTION_START_COMPACT] =
=3D {
-   { sizeof(single_name) / sizeof(const char*) - 1, single_name }
-=20
- option_single option_single_lists[OPTION_SINGLE_SIZE] =3D {
-+  OPTION_SINGLE_ENTRY(option_list_handshake_connection),
-   OPTION_SINGLE_ENTRY(option_list_log_group),
-   OPTION_SINGLE_ENTRY(option_list_tracker_event),
- };
-@@ -267,11 +286,11 @@ option_find_string(option_enum opt_enum, const char*=
 name) {
-     } while (*++itr !=3D NULL);
-   }
-=20
--  throw input_error("Invalid option name."); =20
-+  throw input_error("Invalid option name.");
- }
-=20
- const char*
--option_as_string(option_enum opt_enum, unsigned int value) {
-+option_to_string(option_enum opt_enum, unsigned int value, const char* no=
t_found) {
-   if (opt_enum < OPTION_START_COMPACT) {
-     option_pair* itr =3D option_pair_lists[opt_enum];
-  =20
-@@ -285,7 +304,27 @@ option_as_string(option_enum opt_enum, unsigned int v=
alue) {
-       return option_single_lists[opt_enum - OPTION_START_COMPACT].name[va=
lue];
-   }
-=20
--  throw input_error("Invalid option value."); =20
-+  return not_found;
-+}
-+
-+const char*
-+option_to_string_or_throw(option_enum opt_enum, unsigned int value, const=
 char* not_found) {
-+  const char* result =3D option_to_string(opt_enum, value, NULL);
-+
-+  if (result =3D=3D NULL)
-+    throw input_error(not_found);
-+  else
-+    return result;
-+}
-+
-+const char*
-+option_as_string(option_enum opt_enum, unsigned int value) {
-+  const char* result =3D option_to_string(opt_enum, value, NULL);
-+
-+  if (result =3D=3D NULL)
-+    throw input_error("Invalid option value.");
-+  else
-+    return result;
- }
-=20
- torrent::Object
-diff --git a/src/torrent/utils/option_strings.h b/src/torrent/utils/option=
_strings.h
-index 1b57efa8..f9e5ef77 100644
---- a/src/torrent/utils/option_strings.h
-+++ b/src/torrent/utils/option_strings.h
-@@ -54,17 +54,22 @@ enum option_enum {
-   OPTION_IP_TOS,
-   OPTION_TRACKER_MODE,
-=20
-+  OPTION_HANDSHAKE_CONNECTION,
-   OPTION_LOG_GROUP,
-   OPTION_TRACKER_EVENT,
-=20
-   OPTION_MAX_SIZE,
--  OPTION_START_COMPACT =3D OPTION_LOG_GROUP,
-+  OPTION_START_COMPACT =3D OPTION_HANDSHAKE_CONNECTION,
-   OPTION_SINGLE_SIZE =3D OPTION_MAX_SIZE - OPTION_START_COMPACT
- };
-=20
- int             option_find_string(option_enum opt_enum, const char* name=
) LIBTORRENT_EXPORT;
- inline int      option_find_string_str(option_enum opt_enum, const std::s=
tring& name) { return option_find_string(opt_enum, name.c_str()); }
-=20
-+const char*     option_to_string(option_enum opt_enum, unsigned int value=
, const char* not_found =3D "invalid") LIBTORRENT_EXPORT;
-+const char*     option_to_string_or_throw(option_enum opt_enum, unsigned =
int value, const char* not_found =3D "Invalid option value") LIBTORRENT_EXP=
ORT;
-+
-+// TODO: Deprecated.
- const char*     option_as_string(option_enum opt_enum, unsigned int value=
) LIBTORRENT_EXPORT;
-=20
- torrent::Object option_list_strings(option_enum opt_enum) LIBTORRENT_EXPO=
RT;
-diff --git a/src/torrent/utils/random.cc b/src/torrent/utils/random.cc
-new file mode 100644
-index 00000000..6a045429
---- /dev/null
-+++ b/src/torrent/utils/random.cc
-@@ -0,0 +1,29 @@
-+#include "config.h"
-+
-+#include "random.h"
-+
-+#include "torrent/exceptions.h"
-+
-+namespace torrent {
-+
-+// TODO: Replace with std and thread_local generator.
-+
-+template <typename T>
-+T
-+random_uniform_template(T min, T max) {
-+  if (min > max)
-+    throw internal_error("random_uniform: min > max");
-+
-+  if (min =3D=3D max)
-+    return min;
-+
-+  std::random_device rd;
-+  std::mt19937 mt(rd());
-+
-+  return min + std::uniform_int_distribution<T>(min, max)(mt) % (max - mi=
n + 1);
-+} =20
-+
-+uint16_t random_uniform_uint16(uint16_t min, uint16_t max) { return rando=
m_uniform_template<uint16_t>(min, max); }
-+uint32_t random_uniform_uint32(uint32_t min, uint32_t max) { return rando=
m_uniform_template<uint32_t>(min, max); }
-+
-+}
-diff --git a/src/torrent/utils/random.h b/src/torrent/utils/random.h
-new file mode 100644
-index 00000000..d5992ab6
---- /dev/null
-+++ b/src/torrent/utils/random.h
-@@ -0,0 +1,15 @@
-+#ifndef LIBTORRENT_TORRENT_UTILS_RANDOM_H
-+#define LIBTORRENT_TORRENT_UTILS_RANDOM_H
-+
-+#include <cinttypes>
-+#include <limits>
-+#include <random>
-+
-+namespace torrent {
-+
-+[[gnu::weak]] [[gnu::visibility("default")]] uint16_t random_uniform_uint=
16(uint16_t min =3D std::numeric_limits<uint16_t>::min(), uint16_t max =3D =
std::numeric_limits<uint16_t>::max());
-+[[gnu::weak]] [[gnu::visibility("default")]] uint32_t random_uniform_uint=
32(uint32_t min =3D std::numeric_limits<uint32_t>::min(), uint32_t max =3D =
std::numeric_limits<uint32_t>::max());
-+
-+}
-+
-+#endif
-diff --git a/src/torrent/utils/ranges.h b/src/torrent/utils/ranges.h
-index e784b084..7b1f8cb0 100644
---- a/src/torrent/utils/ranges.h
-+++ b/src/torrent/utils/ranges.h
-@@ -40,7 +40,6 @@
- #include <algorithm>
- #include <vector>
-=20
--// TODO: Use tr1 functional instead.
- #include <rak/functional.h>
-=20
- namespace torrent {
-diff --git a/src/torrent/utils/resume.cc b/src/torrent/utils/resume.cc
-index 3f528c14..f8467d54 100644
---- a/src/torrent/utils/resume.cc
-+++ b/src/torrent/utils/resume.cc
-@@ -34,8 +34,6 @@
- //           Skomakerveien 33
- //           3185 Skoppum, NORWAY
-=20
--#define __STDC_FORMAT_MACROS
--
- #include "config.h"
-=20
- #include <rak/file_stat.h>
-diff --git a/src/torrent/utils/signal_bitfield.h b/src/torrent/utils/signa=
l_bitfield.h
-index b9f57a60..ffa336d2 100644
---- a/src/torrent/utils/signal_bitfield.h
-+++ b/src/torrent/utils/signal_bitfield.h
-@@ -37,7 +37,8 @@
- #ifndef LIBTORRENT_UTILS_SIGNAL_BITFIELD_H
- #define LIBTORRENT_UTILS_SIGNAL_BITFIELD_H
-=20
--#include lt_tr1_functional
-+#include <functional>
-+
- #include <torrent/common.h>
-=20
- namespace torrent {
-diff --git a/src/torrent/utils/thread_base.h b/src/torrent/utils/thread_ba=
se.h
-index bfd443ae..b92a98ba 100644
---- a/src/torrent/utils/thread_base.h
-+++ b/src/torrent/utils/thread_base.h
-@@ -37,11 +37,12 @@
- #ifndef LIBTORRENT_UTILS_THREAD_BASE_H
- #define LIBTORRENT_UTILS_THREAD_BASE_H
-=20
-+#include <functional>
- #include <pthread.h>
- #include <sys/types.h>
-+
- #include <torrent/common.h>
- #include <torrent/utils/signal_bitfield.h>
--#include lt_tr1_functional
-=20
- namespace torrent {
-=20
-diff --git a/src/utils/instrumentation.cc b/src/utils/instrumentation.cc
-index 729b20e2..178d6a19 100644
---- a/src/utils/instrumentation.cc
-+++ b/src/utils/instrumentation.cc
-@@ -36,8 +36,6 @@
-=20
- #include "config.h"
-=20
--#define __STDC_FORMAT_MACROS
--
- #include "instrumentation.h"
-=20
- namespace torrent {
-diff --git a/src/utils/instrumentation.h b/src/utils/instrumentation.h
-index 956429bf..11e77f6d 100644
---- a/src/utils/instrumentation.h
-+++ b/src/utils/instrumentation.h
-@@ -37,9 +37,8 @@
- #ifndef LIBTORRENT_UTILS_INSTRUMENTATION_H
- #define LIBTORRENT_UTILS_INSTRUMENTATION_H
-=20
--#include lt_tr1_array
--
- #include <algorithm>
-+#include <array>
-=20
- #include "torrent/common.h"
- #include "torrent/utils/log.h"
-diff --git a/src/utils/queue_buckets.h b/src/utils/queue_buckets.h
-index de8584ff..b9174f27 100644
---- a/src/utils/queue_buckets.h
-+++ b/src/utils/queue_buckets.h
-@@ -38,9 +38,9 @@
- #define LIBTORRENT_QUEUE_BUCKETS_H
-=20
- #include <algorithm>
-+#include <array>
- #include <deque>
--#include lt_tr1_functional
--#include lt_tr1_array
-+#include <functional>
-=20
- namespace torrent {
-=20
-diff --git a/src/utils/sha_fast.h b/src/utils/sha_fast.h
-index f7ce3b87..eb357864 100644
---- a/src/utils/sha_fast.h
-+++ b/src/utils/sha_fast.h
-@@ -41,7 +41,7 @@
- #ifndef _SHA_FAST_H_
- #define _SHA_FAST_H_
-=20
--#include <inttypes.h>
-+#include <cinttypes>
-=20
- namespace torrent {
-=20
-diff --git a/test/Makefile.am b/test/Makefile.am
-index d7a9d5b3..b60a86a6 100644
---- a/test/Makefile.am
-+++ b/test/Makefile.am
-@@ -18,6 +18,17 @@ LibTorrentTest_LDADD =3D \
- 	../src/torrent/utils/libsub_torrentutils.la
-=20
- LibTorrentTest_SOURCES =3D \
-+	helpers/expect_fd.h \
-+	helpers/expect_utils.h \
-+	helpers/mock_compare.h \
-+	helpers/mock_function.cc \
-+	helpers/mock_function.h \
-+	helpers/network.h \
-+	helpers/progress_listener.cc \
-+	helpers/progress_listener.h \
-+	helpers/test_fixture.cc \
-+	helpers/test_fixture.h \
-+	\
- 	../src/thread_disk.cc \
- 	../src/thread_disk.h \
- 	\
-@@ -31,22 +42,28 @@ LibTorrentTest_SOURCES =3D \
- 	data/hash_check_queue_test.h \
- 	data/hash_queue_test.cc \
- 	data/hash_queue_test.h \
-+	\
-+	net/test_socket_listen.cc \
-+	net/test_socket_listen.h \
-+	\
- 	protocol/test_request_list.cc \
- 	protocol/test_request_list.h \
- 	\
--	torrent/net/test_socket_address_key.cc \
--	torrent/net/test_socket_address_key.h \
-+	torrent/net/test_address_info.cc \
-+	torrent/net/test_address_info.h \
-+	torrent/net/test_fd.cc \
-+	torrent/net/test_fd.h \
-+	torrent/net/test_socket_address.cc \
-+	torrent/net/test_socket_address.h \
- 	\
- 	torrent/utils/log_test.cc \
- 	torrent/utils/log_test.h \
--	torrent/utils/log_buffer_test.cc \
--	torrent/utils/log_buffer_test.h \
--	torrent/utils/net_test.cc \
--	torrent/utils/net_test.h \
- 	torrent/utils/option_strings_test.cc \
- 	torrent/utils/option_strings_test.h \
- 	torrent/utils/test_extents.cc \
- 	torrent/utils/test_extents.h \
-+	torrent/utils/test_log_buffer.cc \
-+	torrent/utils/test_log_buffer.h \
- 	torrent/utils/test_queue_buckets.cc \
- 	torrent/utils/test_queue_buckets.h \
- 	torrent/utils/test_uri_parser.cc \
-diff --git a/test/data/hash_check_queue_test.cc b/test/data/hash_check_que=
ue_test.cc
-index c6bdeaec..4b15245e 100644
---- a/test/data/hash_check_queue_test.cc
-+++ b/test/data/hash_check_queue_test.cc
-@@ -1,7 +1,7 @@
- #include "config.h"
-=20
-+#include <functional>
- #include <signal.h>
--#include lt_tr1_functional
-=20
- #include "data/hash_queue_node.h"
- #include "utils/sha1.h"
-diff --git a/test/data/hash_queue_test.cc b/test/data/hash_queue_test.cc
-index 287c28e9..d7ce3ba8 100644
---- a/test/data/hash_queue_test.cc
-+++ b/test/data/hash_queue_test.cc
-@@ -1,7 +1,7 @@
- #include "config.h"
-=20
-+#include <functional>
- #include <signal.h>
--#include lt_tr1_functional
-=20
- #include "data/hash_queue_node.h"
- #include "torrent/chunk_manager.h"
-diff --git a/test/helpers/expect_fd.h b/test/helpers/expect_fd.h
-new file mode 100644
-index 00000000..178cbabc
---- /dev/null
-+++ b/test/helpers/expect_fd.h
-@@ -0,0 +1,107 @@
-+#ifndef LIBTORRENT_HELPER_EXPECT_FD_H
-+#define LIBTORRENT_HELPER_EXPECT_FD_H
-+
-+#include "helpers/mock_function.h"
-+
-+#include <fcntl.h>
-+#include <torrent/event.h>
-+#include <torrent/net/fd.h>
-+#include <torrent/net/socket_address.h>
-+
-+typedef std::vector<torrent::sa_unique_ptr> sap_cache_type;
-+
-+inline const sockaddr*
-+sap_cache_copy_addr_c_ptr(sap_cache_type& sap_cache, const torrent::c_sa_=
unique_ptr& sap, uint16_t port =3D 0) {
-+  sap_cache.push_back(torrent::sap_copy_addr(sap, port));
-+  return sap_cache.back().get();
-+}
-+
-+inline void
-+expect_event_open_re(int idx) {
-+  mock_expect(&torrent::poll_event_open, mock_compare_map<torrent::Event>=
::begin_pointer + idx);
-+  mock_expect(&torrent::poll_event_insert_read, mock_compare_map<torrent:=
:Event>::begin_pointer + idx);
-+  mock_expect(&torrent::poll_event_insert_error, mock_compare_map<torrent=
::Event>::begin_pointer + idx);
-+}
-+
-+inline void
-+expect_event_closed_fd(int idx, int fd) {
-+  mock_expect(&torrent::fd__close, 0, fd);
-+  mock_expect(&torrent::poll_event_closed, mock_compare_map<torrent::Even=
t>::begin_pointer + idx);
-+}
-+
-+inline void
-+expect_fd_inet_tcp(int fd) {
-+  mock_expect(&torrent::fd__socket, fd, (int)PF_INET, (int)SOCK_STREAM, (=
int)IPPROTO_TCP);
-+}
-+
-+inline void
-+expect_fd_inet6_tcp(int fd) {
-+  mock_expect(&torrent::fd__socket, fd, (int)PF_INET6, (int)SOCK_STREAM, =
(int)IPPROTO_TCP);
-+}
-+
-+inline void
-+expect_fd_inet_tcp_nonblock(int fd) {
-+  mock_expect(&torrent::fd__socket, fd, (int)PF_INET, (int)SOCK_STREAM, (=
int)IPPROTO_TCP);
-+  mock_expect(&torrent::fd__fcntl_int, 0, fd, F_SETFL, O_NONBLOCK);
-+}
-+
-+inline void
-+expect_fd_inet6_tcp_nonblock(int fd) {
-+  mock_expect(&torrent::fd__socket, fd, (int)PF_INET6, (int)SOCK_STREAM, =
(int)IPPROTO_TCP);
-+  mock_expect(&torrent::fd__fcntl_int, 0, fd, F_SETFL, O_NONBLOCK);
-+}
-+
-+inline void
-+expect_fd_inet_tcp_nonblock_reuseaddr(int fd) {
-+  mock_expect(&torrent::fd__socket, fd, (int)PF_INET, (int)SOCK_STREAM, (=
int)IPPROTO_TCP);
-+  mock_expect(&torrent::fd__fcntl_int, 0, fd, F_SETFL, O_NONBLOCK);
-+  mock_expect(&torrent::fd__setsockopt_int, 0, fd, (int)SOL_SOCKET, (int)=
SO_REUSEADDR, (int)true);
-+}
-+
-+inline void
-+expect_fd_inet6_tcp_nonblock_reuseaddr(int fd) {
-+  mock_expect(&torrent::fd__socket, fd, (int)PF_INET6, (int)SOCK_STREAM, =
(int)IPPROTO_TCP);
-+  mock_expect(&torrent::fd__fcntl_int, 0, fd, F_SETFL, O_NONBLOCK);
-+  mock_expect(&torrent::fd__setsockopt_int, 0, fd, (int)SOL_SOCKET, (int)=
SO_REUSEADDR, (int)true);
-+}
-+
-+inline void
-+expect_fd_inet6_tcp_v6only_nonblock(int fd) {
-+  mock_expect(&torrent::fd__socket, fd, (int)PF_INET6, (int)SOCK_STREAM, =
(int)IPPROTO_TCP);
-+  mock_expect(&torrent::fd__setsockopt_int, 0, fd, (int)IPPROTO_IPV6, (in=
t)IPV6_V6ONLY, (int)true);
-+  mock_expect(&torrent::fd__fcntl_int, 0, fd, F_SETFL, O_NONBLOCK);
-+}
-+
-+inline void
-+expect_fd_inet6_tcp_v6only_nonblock_reuseaddr(int fd) {
-+  mock_expect(&torrent::fd__socket, fd, (int)PF_INET6, (int)SOCK_STREAM, =
(int)IPPROTO_TCP);
-+  mock_expect(&torrent::fd__setsockopt_int, 0, fd, (int)IPPROTO_IPV6, (in=
t)IPV6_V6ONLY, (int)true);
-+  mock_expect(&torrent::fd__fcntl_int, 0, fd, F_SETFL, O_NONBLOCK);
-+  mock_expect(&torrent::fd__setsockopt_int, 0, fd, (int)SOL_SOCKET, (int)=
SO_REUSEADDR, (int)true);
-+}
-+
-+inline void
-+expect_fd_bind_connect(int fd, const torrent::c_sa_unique_ptr& bind_sap, =
const torrent::c_sa_unique_ptr& connect_sap) {
-+  mock_expect(&torrent::fd__bind, 0, fd, bind_sap.get(), (socklen_t)torre=
nt::sap_length(bind_sap));
-+  mock_expect(&torrent::fd__connect, 0, fd, connect_sap.get(), (socklen_t=
)torrent::sap_length(connect_sap));
-+}
-+
-+inline void
-+expect_fd_bind_fail_range(int fd, sap_cache_type& sap_cache, const torren=
t::c_sa_unique_ptr& sap, uint16_t first_port, uint16_t last_port) {
-+  do {
-+    mock_expect(&torrent::fd__bind, -1, fd, sap_cache_copy_addr_c_ptr(sap=
_cache, sap, first_port), (socklen_t)torrent::sap_length(sap));
-+  } while (first_port++ !=3D last_port);
-+}
-+
-+inline void
-+expect_fd_bind_listen(int fd, const torrent::c_sa_unique_ptr& sap) {
-+  mock_expect(&torrent::fd__bind, 0, fd, sap.get(), (socklen_t)torrent::s=
ap_length(sap));
-+  mock_expect(&torrent::fd__listen, 0, fd, SOMAXCONN);
-+}
-+
-+inline void
-+expect_fd_connect(int fd, const torrent::c_sa_unique_ptr& sap) {
-+  mock_expect(&torrent::fd__connect, 0, fd, sap.get(), (socklen_t)torrent=
::sap_length(sap));
-+}
-+
-+#endif
-diff --git a/test/helpers/expect_utils.h b/test/helpers/expect_utils.h
-new file mode 100644
-index 00000000..c84a11e0
---- /dev/null
-+++ b/test/helpers/expect_utils.h
-@@ -0,0 +1,13 @@
-+#ifndef LIBTORRENT_HELPER_EXPECT_UTILS_H
-+#define LIBTORRENT_HELPER_EXPECT_UTILS_H
-+
-+#include "helpers/mock_function.h"
-+
-+#include <torrent/utils/random.h>
-+
-+inline void
-+expect_random_uniform_uint16(uint16_t result, uint16_t first, uint16_t la=
st) {
-+  mock_expect(&torrent::random_uniform_uint16, result, first, last);
-+}
-+
-+#endif
-diff --git a/test/helpers/mock_compare.h b/test/helpers/mock_compare.h
-new file mode 100644
-index 00000000..3ea90305
---- /dev/null
-+++ b/test/helpers/mock_compare.h
-@@ -0,0 +1,96 @@
-+#ifndef LIBTORRENT_HELPERS_MOCK_COMPARE_H
-+#define LIBTORRENT_HELPERS_MOCK_COMPARE_H
-+
-+#include <algorithm>
-+#include <type_traits>
-+#include <torrent/event.h>
-+#include <torrent/net/socket_address.h>
-+
-+// Compare arguments to mock functions with what is expected. The lhs
-+// are the expected arguments, rhs are the ones called with.
-+
-+template <typename Arg>
-+inline bool mock_compare_arg(Arg lhs, Arg rhs) { return lhs =3D=3D rhs; }
-+
-+template <int I, typename A, typename... Args>
-+typename std::enable_if<I =3D=3D 1, int>::type
-+mock_compare_tuple(const std::tuple<A, Args...>& lhs, const std::tuple<Ar=
gs...>& rhs) {
-+  return mock_compare_arg(std::get<I>(lhs), std::get<I - 1>(rhs)) ? 0 : 1=
;
-+}
-+
-+template <int I, typename A, typename... Args>
-+typename std::enable_if<1 < I, int>::type
-+mock_compare_tuple(const std::tuple<A, Args...>& lhs, const std::tuple<Ar=
gs...>& rhs) {
-+  auto res =3D mock_compare_tuple<I - 1>(lhs, rhs);
-+
-+  if (res !=3D 0)
-+    return res;
-+
-+  return mock_compare_arg(std::get<I>(lhs), std::get<I - 1>(rhs)) ? 0 : I=
;
-+}
-+
-+//template <typename T, typename std::enable_if<!std::is_const<T>::value,=
 int>::type =3D 0>
-+template <typename T>
-+struct mock_compare_map {
-+  typedef std::map<const T*, const T*> values_type;
-+
-+  constexpr static T* begin_pointer =3D reinterpret_cast<T*>(0x1000);
-+  constexpr static T* end_pointer =3D reinterpret_cast<T*>(0x2000);
-+
-+  static bool is_key(const T* k) {
-+    return k >=3D begin_pointer && k < end_pointer;
-+  }
-+
-+  static bool has_key(const T* k) {
-+    return values.find(k) !=3D values.end();
-+  }
-+
-+  static bool has_value(const T* v) {
-+    return std::find_if(values.begin(), values.end(), [v](typename values=
_type::value_type& kv) { return v =3D=3D kv.second; }) !=3D values.end();
-+  }
-+
-+  static const T* get(const T* k) {
-+    auto itr =3D values.find(k);
-+    CPPUNIT_ASSERT_MESSAGE("mock_compare_map get failed, not inserted", i=
tr !=3D values.end());
-+    return itr->second;
-+  }
-+
-+  static values_type values;
-+};
-+
-+template<typename T>
-+typename mock_compare_map<T>::values_type mock_compare_map<T>::values;
-+
-+template<typename T>
-+void mock_compare_add(T* v) {
-+  mock_compare_map<T>::add_value(v);
-+}
-+
-+//
-+// Specialize:
-+//
-+
-+template <>
-+inline bool mock_compare_arg<sockaddr*>(sockaddr* lhs, sockaddr* rhs) {
-+  return lhs !=3D nullptr && rhs !=3D nullptr && torrent::sa_equal(lhs, r=
hs);
-+}
-+template <>
-+inline bool mock_compare_arg<const sockaddr*>(const sockaddr* lhs, const =
sockaddr* rhs) {
-+  return lhs !=3D nullptr && rhs !=3D nullptr && torrent::sa_equal(lhs, r=
hs);
-+}
-+
-+template <>
-+inline bool mock_compare_arg<torrent::Event*>(torrent::Event* lhs, torren=
t::Event* rhs) {
-+  if (mock_compare_map<torrent::Event>::is_key(lhs)) {
-+    if (!mock_compare_map<torrent::Event>::has_value(rhs)) {
-+      mock_compare_map<torrent::Event>::values[lhs] =3D rhs;
-+      return true;
-+    }
-+   =20
-+    return mock_compare_map<torrent::Event>::has_key(lhs) && mock_compare=
_map<torrent::Event>::get(lhs) =3D=3D rhs;
-+  }
-+ =20
-+  return lhs =3D=3D rhs;
-+}
-+
-+#endif
-diff --git a/test/helpers/mock_function.cc b/test/helpers/mock_function.cc
-new file mode 100644
-index 00000000..83e81551
---- /dev/null
-+++ b/test/helpers/mock_function.cc
-@@ -0,0 +1,170 @@
-+#include "config.h"
-+
-+#include "mock_function.h"
-+
-+#include <fcntl.h>
-+#include <iostream>
-+#include <torrent/event.h>
-+#include <torrent/net/socket_address.h>
-+#include <torrent/net/fd.h>
-+#include <torrent/utils/log.h>
-+#include <torrent/utils/random.h>
-+
-+#define MOCK_CLEANUP_MAP(MOCK_FUNC) \
-+  CPPUNIT_ASSERT_MESSAGE("expected mock function calls not completed for =
'" #MOCK_FUNC "'", mock_cleanup_map(&MOCK_FUNC) || ignore_assert);
-+#define MOCK_LOG(log_fmt, ...)                                          \
-+  lt_log_print(torrent::LOG_MOCK_CALLS, "%s: " log_fmt, __func__, __VA_AR=
GS__);
-+
-+void
-+mock_clear(bool ignore_assert) {
-+  MOCK_CLEANUP_MAP(torrent::fd__accept);
-+  MOCK_CLEANUP_MAP(torrent::fd__bind);
-+  MOCK_CLEANUP_MAP(torrent::fd__close);
-+  MOCK_CLEANUP_MAP(torrent::fd__connect);
-+  MOCK_CLEANUP_MAP(torrent::fd__fcntl_int);
-+  MOCK_CLEANUP_MAP(torrent::fd__listen);
-+  MOCK_CLEANUP_MAP(torrent::fd__setsockopt_int);
-+  MOCK_CLEANUP_MAP(torrent::fd__socket);
-+
-+  MOCK_CLEANUP_MAP(torrent::poll_event_open);
-+  MOCK_CLEANUP_MAP(torrent::poll_event_close);
-+  MOCK_CLEANUP_MAP(torrent::poll_event_closed);
-+  MOCK_CLEANUP_MAP(torrent::poll_event_insert_read);
-+  MOCK_CLEANUP_MAP(torrent::poll_event_insert_write);
-+  MOCK_CLEANUP_MAP(torrent::poll_event_insert_error);
-+  MOCK_CLEANUP_MAP(torrent::poll_event_remove_read);
-+  MOCK_CLEANUP_MAP(torrent::poll_event_remove_write);
-+  MOCK_CLEANUP_MAP(torrent::poll_event_remove_error);
-+
-+  MOCK_CLEANUP_MAP(torrent::random_uniform_uint16);
-+  MOCK_CLEANUP_MAP(torrent::random_uniform_uint32);
-+
-+  mock_compare_map<torrent::Event>::values.clear();
-+};
-+
-+void mock_init() {
-+  log_add_group_output(torrent::LOG_MOCK_CALLS, "test_output");
-+  mock_clear(true);
-+}
-+
-+void mock_cleanup() {
-+  mock_clear(false);
-+}
-+
-+namespace torrent {
-+
-+//
-+// Mock functions for 'torrent/net/fd.h':
-+//
-+
-+int fd__accept(int socket, sockaddr *address, socklen_t *address_len) {
-+  MOCK_LOG("entry socket:%i address:%s address_len:%u",
-+           socket, torrent::sa_pretty_str(address).c_str(), (unsigned int=
)(*address_len));
-+  auto ret =3D mock_call<int>(__func__, &torrent::fd__accept, socket, add=
ress, address_len);
-+  MOCK_LOG("exit socket:%i address:%s address_len:%u",
-+           socket, torrent::sa_pretty_str(address).c_str(), (unsigned int=
)(*address_len));
-+  return ret;
-+}
-+
-+int fd__bind(int socket, const sockaddr *address, socklen_t address_len) =
{
-+  MOCK_LOG("socket:%i address:%s address_len:%u",
-+           socket, torrent::sa_pretty_str(address).c_str(), (unsigned int=
)address_len);
-+  return mock_call<int>(__func__, &torrent::fd__bind, socket, address, ad=
dress_len);
-+}
-+
-+int fd__close(int fildes) {
-+  MOCK_LOG("filedes:%i", fildes);
-+  return mock_call<int>(__func__, &torrent::fd__close, fildes);
-+}
-+
-+int fd__connect(int socket, const sockaddr *address, socklen_t address_le=
n) {
-+  MOCK_LOG("socket:%i address:%s address_len:%u",
-+           socket, torrent::sa_pretty_str(address).c_str(), (unsigned int=
)address_len);
-+  return mock_call<int>(__func__, &torrent::fd__connect, socket, address,=
 address_len);
-+}
-+
-+int fd__fcntl_int(int fildes, int cmd, int arg) {
-+  MOCK_LOG("filedes:%i cmd:%i arg:%i", fildes, cmd, arg);
-+  return mock_call<int>(__func__, &torrent::fd__fcntl_int, fildes, cmd, a=
rg);
-+}
-+
-+int fd__listen(int socket, int backlog) {
-+  MOCK_LOG("socket:%i backlog:%i", socket, backlog);
-+  return mock_call<int>(__func__, &torrent::fd__listen, socket, backlog);
-+}
-+
-+int fd__setsockopt_int(int socket, int level, int option_name, int option=
_value) {
-+  MOCK_LOG("socket:%i level:%i option_name:%i option_value:%i",
-+           socket, level, option_name, option_value);
-+  return mock_call<int>(__func__, &torrent::fd__setsockopt_int, socket, l=
evel, option_name, option_value);
-+}
-+
-+int fd__socket(int domain, int type, int protocol) {
-+  MOCK_LOG("domain:%i type:%i protocol:%i", domain, type, protocol);
-+  return mock_call<int>(__func__, &torrent::fd__socket, domain, type, pro=
tocol);
-+}
-+
-+//
-+// Mock functions for 'torrent/event.h':
-+//
-+
-+void poll_event_open(Event* event) {
-+  MOCK_LOG("fd:%i type_name:%s", event->file_descriptor(), event->type_na=
me());
-+  return mock_call<void>(__func__, &torrent::poll_event_open, event);
-+}
-+
-+void poll_event_close(Event* event) {
-+  MOCK_LOG("fd:%i type_name:%s", event->file_descriptor(), event->type_na=
me());
-+  return mock_call<void>(__func__, &torrent::poll_event_close, event);
-+}
-+
-+void poll_event_closed(Event* event) {
-+  MOCK_LOG("fd:%i type_name:%s", event->file_descriptor(), event->type_na=
me());
-+  return mock_call<void>(__func__, &torrent::poll_event_closed, event);
-+}
-+
-+void poll_event_insert_read(Event* event) {
-+  MOCK_LOG("fd:%i type_name:%s", event->file_descriptor(), event->type_na=
me());
-+  return mock_call<void>(__func__, &torrent::poll_event_insert_read, even=
t);
-+}
-+
-+void poll_event_insert_write(Event* event) {
-+  MOCK_LOG("fd:%i type_name:%s", event->file_descriptor(), event->type_na=
me());
-+  return mock_call<void>(__func__, &torrent::poll_event_insert_write, eve=
nt);
-+}
-+
-+void poll_event_insert_error(Event* event) {
-+  MOCK_LOG("fd:%i type_name:%s", event->file_descriptor(), event->type_na=
me());
-+  return mock_call<void>(__func__, &torrent::poll_event_insert_error, eve=
nt);
-+}
-+
-+void poll_event_remove_read(Event* event) {
-+  MOCK_LOG("fd:%i type_name:%s", event->file_descriptor(), event->type_na=
me());
-+  return mock_call<void>(__func__, &torrent::poll_event_remove_read, even=
t);
-+}
-+
-+void poll_event_remove_write(Event* event) {
-+  MOCK_LOG("fd:%i type_name:%s", event->file_descriptor(), event->type_na=
me());
-+  return mock_call<void>(__func__, &torrent::poll_event_remove_write, eve=
nt);
-+}
-+
-+void poll_event_remove_error(Event* event) {
-+  MOCK_LOG("fd:%i type_name:%s", event->file_descriptor(), event->type_na=
me());
-+  return mock_call<void>(__func__, &torrent::poll_event_remove_error, eve=
nt);
-+}
-+
-+//
-+// Mock functions for 'torrent/utils/random.h':
-+//
-+
-+uint16_t random_uniform_uint16(uint16_t min, uint16_t max) {
-+  MOCK_LOG("min:%" PRIu16 " max:%" PRIu16, min, max);
-+  return mock_call<uint16_t>(__func__, &torrent::random_uniform_uint16, m=
in, max);
-+}
-+
-+uint32_t random_uniform_uint32(uint32_t min, uint32_t max) {
-+  MOCK_LOG("min:%" PRIu32 " max:%" PRIu32, min, max);
-+  return mock_call<uint32_t>(__func__, &torrent::random_uniform_uint32, m=
in, max);
-+}
-+
-+}
-diff --git a/test/helpers/mock_function.h b/test/helpers/mock_function.h
-new file mode 100644
-index 00000000..6c194137
---- /dev/null
-+++ b/test/helpers/mock_function.h
-@@ -0,0 +1,133 @@
-+#ifndef LIBTORRENT_HELPERS_MOCK_FUNCTION_H
-+#define LIBTORRENT_HELPERS_MOCK_FUNCTION_H
-+
-+#include <functional>
-+#include <map>
-+#include <string>
-+#include <tuple>
-+#include <type_traits>
-+#include <utility>
-+#include <cppunit/extensions/HelperMacros.h>
-+
-+#include "helpers/mock_compare.h"
-+
-+template<typename R, typename... Args>
-+struct mock_function_map {
-+  typedef std::tuple<R, Args...> call_type;
-+  typedef std::vector<call_type> call_list_type;
-+  typedef std::map<void*, call_list_type> func_map_type;
-+
-+  typedef std::function<R (Args...)> function_type;
-+  typedef std::map<void*, function_type> redirect_map_type;
-+
-+  static func_map_type functions;
-+  static redirect_map_type redirects;
-+
-+  static bool cleanup(void* fn) {
-+    redirects.erase(fn);
-+    return functions.erase(fn) =3D=3D 0;
-+  }
-+
-+  static R ret_erase(void* fn) {
-+    auto itr =3D functions.find(fn);
-+    auto ret =3D std::get<0>(itr->second.front());
-+    itr->second.erase(itr->second.begin());
-+
-+    if (itr->second.empty())
-+      functions.erase(itr);
-+
-+    return ret;
-+  }
-+};
-+
-+template<typename R, typename... Args>
-+typename mock_function_map<R, Args...>::func_map_type mock_function_map<R=
, Args...>::functions;
-+template<typename R, typename... Args>
-+typename mock_function_map<R, Args...>::redirect_map_type mock_function_m=
ap<R, Args...>::redirects;
-+
-+struct mock_void {};
-+
-+template<typename R, typename... Args>
-+struct mock_function_type {
-+  typedef mock_function_map<R, Args...> type;
-+
-+  static int compare_expected(typename type::call_type lhs, Args... rhs) =
{
-+    return mock_compare_tuple<sizeof...(Args)>(lhs, std::make_tuple(rhs..=
.));
-+  }
-+
-+  static R    ret_erase(void* fn) { return type::ret_erase(fn); }
-+  static bool has_redirect(void* fn) { return type::redirects.find(fn) !=
=3D type::redirects.end(); }
-+  static R    call_redirect(void* fn, Args... args) { return type::redire=
cts.find(fn)->second(args...); }
-+};
-+
-+template<typename... Args>
-+struct mock_function_type<void, Args...> {
-+  typedef mock_function_map<mock_void, Args...> type;
-+
-+  static int compare_expected(typename type::call_type lhs, Args... rhs) =
{
-+    return mock_compare_tuple<sizeof...(Args)>(lhs, std::make_tuple(rhs..=
.));
-+  }
-+
-+  static void ret_erase(void* fn) { type::ret_erase(fn); }
-+  static bool has_redirect(void* fn) { return type::redirects.find(fn) !=
=3D type::redirects.end(); }
-+  static void call_redirect(void* fn, Args... args) { type::redirects.fin=
d(fn)->second(args...); }
-+};
-+
-+void mock_init();
-+void mock_cleanup();
-+
-+template<typename R, typename... Args>
-+bool
-+mock_cleanup_map(R fn[[gnu::unused]](Args...)) {
-+  return mock_function_type<R, Args...>::type::cleanup(reinterpret_cast<v=
oid*>(fn));
-+}
-+
-+template<typename R, typename... Args>
-+void
-+mock_expect(R fn(Args...), R ret, Args... args) {
-+  typedef mock_function_map<R, Args...> mock_map;
-+  mock_map::functions[reinterpret_cast<void*>(fn)].push_back(std::tuple<R=
, Args...>(ret, args...));
-+}
-+
-+template<typename... Args>
-+void
-+mock_expect(void fn(Args...), Args... args) {
-+  typedef mock_function_map<mock_void, Args...> mock_map;
-+  mock_map::functions[reinterpret_cast<void*>(fn)].push_back(std::tuple<m=
ock_void, Args...>(mock_void(), args...));
-+}
-+
-+template<typename R, typename... Args>
-+void
-+mock_redirect(R fn(Args...), std::function<R (Args...)> func) {
-+  typedef mock_function_map<R, Args...> mock_map;
-+  mock_map::redirects[reinterpret_cast<void*>(fn)] =3D func;
-+}
-+
-+template<typename R, typename... Args>
-+auto
-+mock_call_direct(std::string name, R fn(Args...), Args... args) -> declty=
pe(fn(args...)) {
-+  typedef mock_function_type<R, Args...> mock_type;
-+
-+  auto itr =3D mock_type::type::functions.find(reinterpret_cast<void*>(fn=
));
-+  CPPUNIT_ASSERT_MESSAGE(("mock_call expected function calls exhausted by=
 '" + name + "'").c_str(),
-+                         itr !=3D mock_type::type::functions.end());
-+
-+  auto mismatch_arg =3D mock_type::compare_expected(itr->second.front(), =
args...);
-+  CPPUNIT_ASSERT_MESSAGE(("mock_call expected function call argument " + =
std::to_string(mismatch_arg) + " mismatch for '" + name + "'").c_str(),
-+                         mismatch_arg =3D=3D 0);
-+
-+  return mock_type::ret_erase(reinterpret_cast<void*>(fn));
-+}
-+
-+template<typename R, typename... Args>
-+auto
-+mock_call(std::string name, R fn(Args...), Args... args) -> decltype(fn(a=
rgs...)) {
-+  typedef mock_function_type<R, Args...> mock_type;
-+
-+  if (mock_type::has_redirect(reinterpret_cast<void*>(fn)))
-+    return mock_type::call_redirect(reinterpret_cast<void*>(fn), args...)=
;
-+
-+  return mock_call_direct(name, fn, args...);
-+}
-+
-+#endif
-diff --git a/test/helpers/network.h b/test/helpers/network.h
-new file mode 100644
-index 00000000..6cf2f870
---- /dev/null
-+++ b/test/helpers/network.h
-@@ -0,0 +1,182 @@
-+#ifndef LIBTORRENT_HELPER_NETWORK_H
-+#define LIBTORRENT_HELPER_NETWORK_H
-+
-+#include <functional>
-+#include <string>
-+#include <cppunit/extensions/HelperMacros.h>
-+
-+#include "torrent/net/address_info.h"
-+
-+//
-+// Socket addresses
-+//
-+
-+#define TEST_DEFAULT_SA                                                 \
-+  auto sin_any =3D wrap_ai_get_first_sa("0.0.0.0");                      =
 \
-+  auto sin_any_5000 =3D wrap_ai_get_first_sa("0.0.0.0", "5000");         =
 \
-+  auto sin_any_5005 =3D wrap_ai_get_first_sa("0.0.0.0", "5005");         =
 \
-+  auto sin_bc =3D wrap_ai_get_first_sa("255.255.255.255");               =
 \
-+  auto sin_bc_5000 =3D wrap_ai_get_first_sa("255.255.255.255", "5000");  =
 \
-+  auto sin_bnd =3D wrap_ai_get_first_sa("123.123.123.123");              =
 \
-+  auto sin_1 =3D wrap_ai_get_first_sa("1.2.3.4");                        =
 \
-+  auto sin_1_5000 =3D wrap_ai_get_first_sa("1.2.3.4", "5000");           =
 \
-+  auto sin_1_5005 =3D wrap_ai_get_first_sa("1.2.3.4", "5005");           =
 \
-+  auto sin_1_5100 =3D wrap_ai_get_first_sa("1.2.3.4", "5100");           =
 \
-+  auto sin_2      =3D wrap_ai_get_first_sa("4.3.2.1");                   =
 \
-+  auto sin_2_5000 =3D wrap_ai_get_first_sa("4.3.2.1", "5000");           =
 \
-+  auto sin_2_5100 =3D wrap_ai_get_first_sa("4.3.2.1", "5100");           =
 \
-+                                                                        \
-+  auto sin6_any =3D wrap_ai_get_first_sa("::");                          =
 \
-+  auto sin6_any_5000 =3D wrap_ai_get_first_sa("::", "5000");             =
 \
-+  auto sin6_any_5005 =3D wrap_ai_get_first_sa("::", "5005");             =
 \
-+  auto sin6_bnd =3D wrap_ai_get_first_sa("ff01::123");                   =
 \
-+  auto sin6_1 =3D wrap_ai_get_first_sa("ff01::1");                       =
 \
-+  auto sin6_1_5000 =3D wrap_ai_get_first_sa("ff01::1", "5000");          =
 \
-+  auto sin6_1_5005 =3D wrap_ai_get_first_sa("ff01::1", "5005");          =
 \
-+  auto sin6_1_5100 =3D wrap_ai_get_first_sa("ff01::1", "5100");          =
 \
-+  auto sin6_2      =3D wrap_ai_get_first_sa("ff02::2");                  =
 \
-+  auto sin6_2_5000 =3D wrap_ai_get_first_sa("ff02::2", "5000");          =
 \
-+  auto sin6_2_5100 =3D wrap_ai_get_first_sa("ff02::2", "5100");          =
 \
-+  auto sin6_v4_1 =3D wrap_ai_get_first_sa("::ffff:1.2.3.4");             =
 \
-+  auto sin6_v4_1_5000 =3D wrap_ai_get_first_sa("::ffff:1.2.3.4", "5000");=
 \
-+  auto sin6_v4_any =3D wrap_ai_get_first_sa("::ffff:0.0.0.0");           =
 \
-+  auto sin6_v4_any_5000 =3D wrap_ai_get_first_sa("::ffff:0.0.0.0", "5000"=
); \
-+  auto sin6_v4_bc =3D wrap_ai_get_first_sa("::ffff:255.255.255.255");    =
 \
-+  auto sin6_v4_bc_5000 =3D wrap_ai_get_first_sa("::ffff:255.255.255.255",=
 "5000"); \
-+  auto sin6_v4_bnd =3D wrap_ai_get_first_sa("::ffff:123.123.123.123");   =
 \
-+                                                                        \
-+  auto c_sin_any =3D wrap_ai_get_first_c_sa("0.0.0.0");                  =
 \
-+  auto c_sin_any_5000 =3D wrap_ai_get_first_c_sa("0.0.0.0", "5000");     =
 \
-+  auto c_sin_any_5005 =3D wrap_ai_get_first_c_sa("0.0.0.0", "5005");     =
 \
-+  auto c_sin_any_5010 =3D wrap_ai_get_first_c_sa("0.0.0.0", "5010");     =
 \
-+  auto c_sin_any_6881 =3D wrap_ai_get_first_c_sa("0.0.0.0", "6881");     =
 \
-+  auto c_sin_any_6900 =3D wrap_ai_get_first_c_sa("0.0.0.0", "6900");     =
 \
-+  auto c_sin_any_6999 =3D wrap_ai_get_first_c_sa("0.0.0.0", "6999");     =
 \
-+  auto c_sin_bc =3D wrap_ai_get_first_c_sa("255.255.255.255");           =
 \
-+  auto c_sin_bc_5000 =3D wrap_ai_get_first_c_sa("255.255.255.255", "5000"=
); \
-+  auto c_sin_bnd =3D wrap_ai_get_first_c_sa("123.123.123.123");          =
 \
-+  auto c_sin_bnd_5000 =3D wrap_ai_get_first_c_sa("123.123.123.123", "5000=
"); \
-+  auto c_sin_bnd_6881 =3D wrap_ai_get_first_c_sa("123.123.123.123", "6881=
"); \
-+  auto c_sin_bnd_6900 =3D wrap_ai_get_first_c_sa("123.123.123.123", "6900=
"); \
-+  auto c_sin_bnd_6999 =3D wrap_ai_get_first_c_sa("123.123.123.123", "6999=
"); \
-+  auto c_sin_1 =3D wrap_ai_get_first_c_sa("1.2.3.4");                    =
 \
-+  auto c_sin_1_5000 =3D wrap_ai_get_first_c_sa("1.2.3.4", "5000");       =
 \
-+  auto c_sin_1_5005 =3D wrap_ai_get_first_c_sa("1.2.3.4", "5005");       =
 \
-+  auto c_sin_1_5010 =3D wrap_ai_get_first_c_sa("1.2.3.4", "5010");       =
 \
-+  auto c_sin_1_6881 =3D wrap_ai_get_first_c_sa("1.2.3.4", "6881");       =
 \
-+  auto c_sin_1_6900 =3D wrap_ai_get_first_c_sa("1.2.3.4", "6900");       =
 \
-+  auto c_sin_1_6999 =3D wrap_ai_get_first_c_sa("1.2.3.4", "6999");       =
 \
-+  auto c_sin_2      =3D wrap_ai_get_first_c_sa("4.3.2.1");               =
 \
-+  auto c_sin_2_5000 =3D wrap_ai_get_first_c_sa("4.3.2.1", "5000");       =
 \
-+  auto c_sin_2_5100 =3D wrap_ai_get_first_c_sa("4.3.2.1", "5100");       =
 \
-+                                                                        \
-+  auto c_sin6_any =3D wrap_ai_get_first_c_sa("::");                      =
 \
-+  auto c_sin6_any_5000 =3D wrap_ai_get_first_c_sa("::", "5000");         =
 \
-+  auto c_sin6_any_5005 =3D wrap_ai_get_first_c_sa("::", "5005");         =
 \
-+  auto c_sin6_any_5010 =3D wrap_ai_get_first_c_sa("::", "5010");         =
 \
-+  auto c_sin6_any_6881 =3D wrap_ai_get_first_c_sa("::", "6881");         =
 \
-+  auto c_sin6_any_6900 =3D wrap_ai_get_first_c_sa("::", "6900");         =
 \
-+  auto c_sin6_any_6999 =3D wrap_ai_get_first_c_sa("::", "6999");         =
 \
-+  auto c_sin6_bnd =3D wrap_ai_get_first_c_sa("ff01::123");               =
 \
-+  auto c_sin6_bnd_5000 =3D wrap_ai_get_first_c_sa("ff01::123", "5000");  =
 \
-+  auto c_sin6_bnd_6881 =3D wrap_ai_get_first_c_sa("ff01::123", "6881");  =
 \
-+  auto c_sin6_bnd_6900 =3D wrap_ai_get_first_c_sa("ff01::123", "6900");  =
 \
-+  auto c_sin6_bnd_6999 =3D wrap_ai_get_first_c_sa("ff01::123", "6999");  =
 \
-+  auto c_sin6_v4_1_5000 =3D wrap_ai_get_first_c_sa("::ffff:1.2.3.4", "500=
0"); \
-+  auto c_sin6_1 =3D wrap_ai_get_first_c_sa("ff01::1");                   =
 \
-+  auto c_sin6_1_5000 =3D wrap_ai_get_first_c_sa("ff01::1", "5000");      =
 \
-+  auto c_sin6_1_5005 =3D wrap_ai_get_first_c_sa("ff01::1", "5005");      =
 \
-+  auto c_sin6_1_5010 =3D wrap_ai_get_first_c_sa("ff01::1", "5010");      =
 \
-+  auto c_sin6_1_5100 =3D wrap_ai_get_first_c_sa("ff01::1", "5100");      =
 \
-+  auto c_sin6_1_6881 =3D wrap_ai_get_first_c_sa("ff01::1", "6881");      =
 \
-+  auto c_sin6_1_6900 =3D wrap_ai_get_first_c_sa("ff01::1", "6900");      =
 \
-+  auto c_sin6_1_6999 =3D wrap_ai_get_first_c_sa("ff01::1", "6999");      =
 \
-+  auto c_sin6_2      =3D wrap_ai_get_first_c_sa("ff02::2");              =
 \
-+  auto c_sin6_2_5000 =3D wrap_ai_get_first_c_sa("ff02::2", "5000");      =
 \
-+  auto c_sin6_2_5100 =3D wrap_ai_get_first_c_sa("ff02::2", "5100");
-+
-+inline bool
-+compare_sin6_addr(in6_addr lhs, in6_addr rhs) {
-+  return std::equal(lhs.s6_addr, lhs.s6_addr + 16, rhs.s6_addr);
-+}
-+
-+inline bool
-+compare_listen_result(const torrent::listen_result_type& lhs, int rhs_fd,=
 const torrent::c_sa_unique_ptr& rhs_sap) {
-+  return lhs.fd =3D=3D rhs_fd &&
-+    ((lhs.address && rhs_sap) || ((lhs.address && rhs_sap) && torrent::sa=
p_equal(lhs.address, rhs_sap)));
-+}
-+
-+inline torrent::sa_unique_ptr
-+wrap_ai_get_first_sa(const char* nodename, const char* servname =3D nullp=
tr, const addrinfo* hints =3D nullptr) {
-+  auto sa =3D torrent::ai_get_first_sa(nodename, servname, hints);
-+
-+  CPPUNIT_ASSERT_MESSAGE(("wrap_ai_get_first_sa: nodename:'" + std::strin=
g(nodename) + "'").c_str(),
-+                        sa !=3D nullptr);
-+  return sa;
-+}
-+
-+inline torrent::c_sa_unique_ptr
-+wrap_ai_get_first_c_sa(const char* nodename, const char* servname =3D nul=
lptr, const addrinfo* hints =3D nullptr) {
-+  auto sa =3D torrent::ai_get_first_sa(nodename, servname, hints);
-+
-+  CPPUNIT_ASSERT_MESSAGE(("wrap_ai_get_first_sa: nodename:'" + std::strin=
g(nodename) + "'").c_str(),
-+                        sa !=3D nullptr);
-+  return torrent::c_sa_unique_ptr(sa.release());
-+}
-+
-+//
-+// Address info tests:
-+//
-+
-+typedef std::function<int (torrent::ai_unique_ptr&)> test_ai_ref;
-+
-+enum ai_flags_enum : int {
-+      aif_none =3D 0x0,
-+      aif_inet =3D 0x1,
-+      aif_inet6 =3D 0x2,
-+      aif_any =3D 0x4,
-+};
-+
-+constexpr ai_flags_enum operator | (ai_flags_enum a, ai_flags_enum b) {
-+  return static_cast<ai_flags_enum>(static_cast<int>(a) | static_cast<int=
>(b));
-+}
-+
-+template <ai_flags_enum ai_flags>
-+inline bool
-+test_valid_ai_ref(test_ai_ref ftor, uint16_t port =3D 0) {
-+  torrent::ai_unique_ptr ai;
-+
-+  if (int err =3D ftor(ai)) {
-+    std::cout << std::endl << "valid_ai_ref got error '" << gai_strerror(=
err) << "'" << std::endl;
-+    return false;
-+  }
-+
-+  if ((ai_flags & aif_inet) && !torrent::sa_is_inet(ai->ai_addr))
-+    return false;
-+
-+  if ((ai_flags & aif_inet6) && !torrent::sa_is_inet6(ai->ai_addr))
-+    return false;
-+
-+  if (!!(ai_flags & aif_any) =3D=3D !torrent::sa_is_any(ai->ai_addr))
-+    return false;
-+
-+  if (torrent::sa_port(ai->ai_addr) !=3D port)
-+    return false;
-+
-+  return true;
-+}
-+
-+inline bool
-+test_valid_ai_ref_err(test_ai_ref ftor, int expect_err) {
-+  torrent::ai_unique_ptr ai;
-+  int err =3D ftor(ai);
-+
-+  if (err !=3D expect_err) {
-+    std::cout << std::endl << "ai_ref_err got wrong error, expected '" <<=
 gai_strerror(expect_err) << "', got '" << gai_strerror(err) << "'" << std:=
:endl;
-+    return false;
-+  }
-+
-+  return true;
-+}
-+
-+#endif
-diff --git a/test/helpers/progress_listener.cc b/test/helpers/progress_lis=
tener.cc
-new file mode 100644
-index 00000000..02803ffc
---- /dev/null
-+++ b/test/helpers/progress_listener.cc
-@@ -0,0 +1,63 @@
-+#include "config.h"
-+
-+#include "progress_listener.h"
-+
-+#include <algorithm>
-+#include <iostream>
-+#include <iterator>
-+#include <numeric>
-+#include <stdexcept>
-+#include "torrent/utils/log.h"
-+#include "torrent/utils/log_buffer.h"
-+
-+static std::string
-+get_test_path(const test_list_type& tl) {
-+  if (tl.size() < 2)
-+    return "";
-+
-+  return std::accumulate(std::next(tl.begin()), std::prev(tl.end()), std:=
:string(), [](std::string result, CppUnit::Test* test) {
-+      return std::move(result) + test->getName() + "::";
-+    });
-+}
-+
-+void
-+progress_listener::startTest(CppUnit::Test *test) {
-+  std::cout << get_test_path(m_test_path) << test->getName() << std::flus=
h;
-+
-+  torrent::log_cleanup();
-+
-+  m_last_test_failed =3D false;
-+  m_current_log_buffer =3D torrent::log_open_log_buffer("test_output");
-+}
-+
-+void
-+progress_listener::addFailure(const CppUnit::TestFailure &failure) {
-+  // AddFailure is called for parent test suits, so only deal with leafs.
-+  if (m_current_log_buffer =3D=3D nullptr)
-+    return;
-+
-+  std::cout << " : " << (failure.isError() ? "error" : "assertion");
-+
-+  m_last_test_failed =3D true;
-+  m_failures.push_back(std::move(failure_type{failure.failedTestName(), s=
td::move(m_current_log_buffer)}));
-+}
-+
-+void
-+progress_listener::endTest(CppUnit::Test *test) {
-+  std::cout << (m_last_test_failed ? "" : " : OK") << std::endl;
-+
-+  m_current_log_buffer.reset();
-+  torrent::log_cleanup();
-+}
-+
-+void
-+progress_listener::startSuite(CppUnit::Test *suite) {
-+  m_test_path.push_back(suite);
-+
-+  std::cout << std::endl << get_test_path(m_test_path) << suite->getName(=
) << ":" << std::endl;
-+}
-+
-+void
-+progress_listener::endSuite(CppUnit::Test *suite) {
-+  m_test_path.pop_back();
-+}
-diff --git a/test/helpers/progress_listener.h b/test/helpers/progress_list=
ener.h
-new file mode 100644
-index 00000000..18fb8faa
---- /dev/null
-+++ b/test/helpers/progress_listener.h
-@@ -0,0 +1,47 @@
-+#include <memory>
-+#include <vector>
-+#include <cppunit/Test.h>
-+#include <cppunit/TestFailure.h>
-+#include <cppunit/TestListener.h>
-+
-+#include "torrent/utils/log_buffer.h"
-+
-+struct failure_type {
-+  std::string name;
-+  torrent::log_buffer_ptr log;
-+};
-+
-+typedef std::unique_ptr<CppUnit::TestFailure> test_failure_ptr;
-+typedef std::vector<CppUnit::Test*> test_list_type;
-+typedef std::vector<failure_type> failure_list_type;
-+
-+class progress_listener : public CppUnit::TestListener {
-+public:
-+  progress_listener() : m_last_test_failed(false) {}
-+
-+  void startTest(CppUnit::Test *test) override;
-+  void addFailure(const CppUnit::TestFailure &failure) override;
-+  void endTest(CppUnit::Test *test) override;
-+
-+  void startSuite(CppUnit::Test *suite) override;
-+  void endSuite(CppUnit::Test *suite) override;
-+
-+  //Called by a TestRunner before running the test.
-+  // void startTestRun(CppUnit::Test *test, CppUnit::TestResult *event_ma=
nager) override;
-+
-+  // Called by a TestRunner after running the test.
-+  // void endTestRun(CppUnit::Test *test, CppUnit::TestResult *event_mana=
ger) override;
-+
-+  const failure_list_type& failures() { return m_failures; }
-+  failure_list_type&& move_failures() { return std::move(m_failures); }
-+
-+private:
-+  progress_listener(const progress_listener& rhs) =3D delete;
-+  void operator =3D(const progress_listener& rhs) =3D delete;
-+
-+  test_list_type    m_test_path;
-+  failure_list_type m_failures;
-+  bool              m_last_test_failed;
-+
-+  torrent::log_buffer_ptr m_current_log_buffer;
-+};
-diff --git a/test/helpers/test_fixture.cc b/test/helpers/test_fixture.cc
-new file mode 100644
-index 00000000..4d8d7214
---- /dev/null
-+++ b/test/helpers/test_fixture.cc
-@@ -0,0 +1,18 @@
-+#include "config.h"
-+
-+#include "test_fixture.h"
-+
-+#include "torrent/utils/log.h"
-+
-+void
-+test_fixture::setUp() {
-+  mock_init();
-+
-+  log_add_group_output(torrent::LOG_CONNECTION_BIND, "test_output");
-+  log_add_group_output(torrent::LOG_CONNECTION_FD, "test_output");
-+}
-+
-+void
-+test_fixture::tearDown() {
-+  mock_cleanup();
-+}
-diff --git a/test/helpers/test_fixture.h b/test/helpers/test_fixture.h
-new file mode 100644
-index 00000000..312d5009
---- /dev/null
-+++ b/test/helpers/test_fixture.h
-@@ -0,0 +1,14 @@
-+#ifndef LIBTORRENT_HELPER_TEST_FIXTURE_H
-+#define LIBTORRENT_HELPER_TEST_FIXTURE_H
-+
-+#include <cppunit/extensions/HelperMacros.h>
-+
-+#include "helpers/mock_function.h"
-+
-+class test_fixture : public CppUnit::TestFixture {
-+public:
-+  void setUp();
-+  void tearDown();
-+};
-+
-+#endif
-diff --git a/test/helpers/utils.h b/test/helpers/utils.h
-new file mode 100644
-index 00000000..d18450c1
---- /dev/null
-+++ b/test/helpers/utils.h
-@@ -0,0 +1,60 @@
-+#ifndef LIBTORRENT_HELPER_UTILS_H
-+#define LIBTORRENT_HELPER_UTILS_H
-+
-+#include <algorithm>
-+#include <iostream>
-+#include <cppunit/extensions/TestFactoryRegistry.h>
-+#include <torrent/utils/log.h>
-+
-+static void
-+dump_failure_log(const failure_type& failure) {
-+  if (failure.log->empty())
-+    return;
-+
-+  std::cout << std::endl << failure.name << std::endl;
-+
-+  // Doesn't print dump messages as log_buffer drops them.
-+  std::for_each(failure.log->begin(), failure.log->end(), [](const torren=
t::log_entry& entry) {
-+      std::cout << entry.timestamp << ' ' << entry.message << '\n';
-+    });
-+
-+  std::cout << std::flush;
-+}
-+
-+static void
-+dump_failures(const failure_list_type& failures) {
-+  if (failures.empty())
-+    return;
-+
-+  std::cout << std::endl
-+            << "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D" << s=
td::endl
-+            << "Failed Test Logs:" << std::endl
-+            << "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D" << s=
td::endl;
-+
-+  std::for_each(failures.begin(), failures.end(), [](const failure_type& =
failure) {
-+      dump_failure_log(failure);
-+    });
-+  std::cout << std::endl;
-+}
-+
-+static
-+void add_tests(CppUnit::TextUi::TestRunner& runner, const char* c_test_na=
mes) {
-+  if (c_test_names =3D=3D NULL || std::string(c_test_names).empty()) {
-+    runner.addTest(CppUnit::TestFactoryRegistry::getRegistry().makeTest()=
);
-+    return;
-+  }
-+
-+  const std::string& test_names(c_test_names);
-+
-+  size_t pos =3D 0;
-+  size_t next =3D 0;
-+
-+  while ((next =3D test_names.find(',', pos)) < test_names.size()) {
-+    runner.addTest(CppUnit::TestFactoryRegistry::getRegistry(test_names.s=
ubstr(pos, next - pos)).makeTest());
-+    pos =3D next + 1;
-+  }
-+
-+  runner.addTest(CppUnit::TestFactoryRegistry::getRegistry(test_names.sub=
str(pos)).makeTest());
-+}
-+
-+#endif
-diff --git a/test/main.cc b/test/main.cc
-index e69d3d70..da93fead 100644
---- a/test/main.cc
-+++ b/test/main.cc
-@@ -1,44 +1,92 @@
-+#include "config.h"
-+
-+#include <cstdlib>
- #include <stdexcept>
-+#include <signal.h>
-+#include <string.h>
- #include <cppunit/BriefTestProgressListener.h>
- #include <cppunit/CompilerOutputter.h>
- #include <cppunit/TestResult.h>
- #include <cppunit/TestResultCollector.h>
-+#include <cppunit/extensions/HelperMacros.h>
- #include <cppunit/extensions/TestFactoryRegistry.h>
- #include <cppunit/ui/text/TestRunner.h>
-=20
--int main(int argc, char* argv[])
--{
-+#ifdef USE_EXECINFO
-+#include <execinfo.h>
-+#endif
-+
-+#include "helpers/progress_listener.h"
-+#include "helpers/utils.h"
-+
-+CPPUNIT_REGISTRY_ADD_TO_DEFAULT("net");
-+CPPUNIT_REGISTRY_ADD_TO_DEFAULT("torrent/net");
-+CPPUNIT_REGISTRY_ADD_TO_DEFAULT("torrent/utils");
-+
-+void
-+do_test_panic(int signum) {
-+  signal(signum, SIG_DFL);
-+
-+  std::cout << std::endl << std::endl << "Caught " << strsignal(signum) <=
< ", dumping stack:" << std::endl << std::endl;
-+ =20
-+#ifdef USE_EXECINFO
-+  void* stackPtrs[20];
-+
-+  // Print the stack and exit.
-+  int stackSize =3D backtrace(stackPtrs, 20);
-+  char** stackStrings =3D backtrace_symbols(stackPtrs, stackSize);
-+
-+  for (int i =3D 0; i < stackSize; ++i)
-+    std::cout << stackStrings[i] << std::endl;
-+
-+#else
-+  std::cout << "Stack dump not enabled." << std::endl;
-+#endif
-+
-+  std::cout << std::endl;
-+  torrent::log_cleanup();
-+  std::abort();
-+}
-+
-+void
-+register_signal_handlers() {
-+  struct sigaction sa;
-+  sigemptyset(&sa.sa_mask);
-+  sa.sa_flags =3D SA_RESTART;
-+  sa.sa_handler =3D &do_test_panic;
-+
-+  if (sigaction(SIGSEGV, &sa, NULL) =3D=3D -1) {
-+    std::cout << "Could not register signal handlers." << std::endl;
-+    exit(-1);
-+  }
-+}
-+
-+int main(int argc, char* argv[]) {
-+  register_signal_handlers();
-+
-   CppUnit::TestResult controller;
-   CppUnit::TestResultCollector result;
--  CppUnit::BriefTestProgressListener progressListener;
-+  progress_listener progress;
-=20
-   controller.addListener( &result );       =20
--  controller.addListener( &progressListener );
--
--  // Get the top level suite from the registry
--  CppUnit::Test *suite =3D CppUnit::TestFactoryRegistry::getRegistry().ma=
keTest();
-+  controller.addListener( &progress );
-=20
--  // Adds the test to the list of test to run
-   CppUnit::TextUi::TestRunner runner;
--  runner.addTest( suite );
-+  add_tests(runner, std::getenv("TEST_NAME"));
-=20
--  // Change the default outputter to a compiler error format outputter
--  runner.setOutputter( new CppUnit::CompilerOutputter( &runner.result(),
--                                                       std::cerr ) );
-   try {
-     std::cout << "Running ";
-     runner.run( controller );
- =20
--    std::cerr << std::endl;
--=20
-+    // TODO: Make outputter.
-+    dump_failures(progress.failures());
-+
-     // Print test in a compiler compatible format.
-     CppUnit::CompilerOutputter outputter( &result, std::cerr );
-     outputter.write();                     =20
-=20
-   } catch ( std::invalid_argument &e ) { // Test path not resolved
--    std::cerr  <<  std::endl =20
--               <<  "ERROR: "  <<  e.what()
--               << std::endl;
-+    std::cerr  <<  std::endl <<  "ERROR: "  <<  e.what() << std::endl;
-     return 1;
-   }
-=20
-diff --git a/test/net/test_socket_listen.cc b/test/net/test_socket_listen.=
cc
-new file mode 100644
-index 00000000..e86a078b
---- /dev/null
-+++ b/test/net/test_socket_listen.cc
-@@ -0,0 +1,398 @@
-+#include "config.h"
-+
-+#include "test_socket_listen.h"
-+
-+#include "helpers/expect_fd.h"
-+#include "helpers/expect_utils.h"
-+#include "helpers/mock_function.h"
-+#include "helpers/network.h"
-+
-+#include <net/socket_listen.h>
-+#include <torrent/exceptions.h>
-+#include <torrent/utils/log.h>
-+
-+CPPUNIT_TEST_SUITE_NAMED_REGISTRATION(test_socket_listen, "net");
-+
-+struct test_sl_deleter {
-+  void operator()(torrent::socket_listen* sl) const { if (!sl->is_open())=
 delete sl; }
-+};
-+
-+typedef std::unique_ptr<torrent::socket_listen, test_sl_deleter> test_sl_=
unique_ptr;
-+
-+#define TEST_SL_BEGIN(name)                                     \
-+  test_sl_unique_ptr sl(new torrent::socket_listen);            \
-+  std::vector<torrent::sa_unique_ptr> sap_cache;                \
-+  lt_log_print(torrent::LOG_MOCK_CALLS, "sl_begin: %s", name);  \
-+  TEST_DEFAULT_SA;
-+
-+#define TEST_SL_ASSERT_OPEN(_sap_bind, _sap_result, _flags)             \
-+  TEST_SL_ASSERT_OPEN_PORT(_sap_bind, _sap_result, 5000, 5009, 5005, _fla=
gs); \
-+  CPPUNIT_ASSERT(sl->socket_address_port() =3D=3D 5005);
-+
-+#define TEST_SL_ASSERT_OPEN_PORT(_sap_bind, _sap_result, _first_port, _la=
st_port, _itr_port, _flags) \
-+  expect_event_open_re(0);                                              \
-+  CPPUNIT_ASSERT(sl->open(_sap_bind, _first_port, _last_port, _itr_port, =
_flags)); \
-+  CPPUNIT_ASSERT(sl->is_open());                                        \
-+  CPPUNIT_ASSERT(torrent::sa_equal(sl->socket_address(), _sap_result.get(=
)));
-+
-+#define TEST_SL_ASSERT_OPEN_SEQUENTIAL(_sap_bind, _sap_result, _first_por=
t, _last_port, _flags) \
-+  expect_event_open_re(0);                                              \
-+  CPPUNIT_ASSERT(sl->open_sequential(_sap_bind, _first_port, _last_port, =
_flags)); \
-+  CPPUNIT_ASSERT(sl->is_open());                                        \
-+  CPPUNIT_ASSERT(torrent::sa_equal(sl->socket_address(), _sap_result.get(=
)));
-+
-+#define TEST_SL_ASSERT_OPEN_RANDOMIZE(_sap_bind, _sap_result, _first_port=
, _last_port, _flags) \
-+  expect_event_open_re(0);                                              \
-+  CPPUNIT_ASSERT(sl->open_randomize(_sap_bind, _first_port, _last_port, _=
flags)); \
-+  CPPUNIT_ASSERT(sl->is_open());                                        \
-+  CPPUNIT_ASSERT(torrent::sa_equal(sl->socket_address(), _sap_result.get(=
)));
-+
-+#define TEST_SL_ASSERT_CLOSED()                           \
-+  CPPUNIT_ASSERT(!sl->is_open());                         \
-+  CPPUNIT_ASSERT(sl->file_descriptor() =3D=3D -1);            \
-+  CPPUNIT_ASSERT(sl->socket_address() =3D=3D nullptr);        \
-+  CPPUNIT_ASSERT(sl->socket_address_port() =3D=3D 0);
-+
-+#define TEST_SL_CLOSE(_fd)                                              \
-+  mock_expect(&torrent::fd__close, 0, _fd);                             \
-+  mock_expect(&torrent::poll_event_closed, (torrent::Event*)sl.get());  \
-+  CPPUNIT_ASSERT_NO_THROW(sl->close());                                 \
-+  TEST_SL_ASSERT_CLOSED();
-+
-+#define TEST_SL_MOCK_CLOSED_PORT_RANGE(_src_sap, _first_port, _last_port)=
 \
-+  { uint16_t _port =3D _first_port; do {                                 =
 \
-+      sap_cache.push_back(torrent::sap_copy(_src_sap));                 \
-+      torrent::sap_set_port(sap_cache.back(), _port);                   \
-+      mock_expect(&torrent::fd__bind, -1, 1000,                         \
-+                  (const sockaddr*)sap_cache.back().get(),              \
-+                  (socklen_t)torrent::sap_length(sap_cache.back()));    \
-+    } while (_port++ !=3D _last_port);                                   =
 \
-+  }
-+
-+void
-+test_socket_listen::test_basic() {
-+  TEST_SL_BEGIN("basic");
-+  TEST_SL_ASSERT_CLOSED();
-+  CPPUNIT_ASSERT(sl->backlog() =3D=3D SOMAXCONN);
-+  CPPUNIT_ASSERT(sl->type_name() =3D=3D std::string("socket_listen"));
-+}
-+
-+void
-+test_socket_listen::test_open_error() {
-+  { TEST_SL_BEGIN("open twice");
-+    expect_fd_inet6_tcp_nonblock(1000);
-+    expect_fd_bind_listen(1000, c_sin6_any_5005);
-+    TEST_SL_ASSERT_OPEN(torrent::sap_copy(sin6_any), c_sin6_any_5005, tor=
rent::fd_flag_stream | torrent::fd_flag_nonblock);
-+    CPPUNIT_ASSERT_THROW(sl->open(torrent::sap_copy(sin6_any), 5000, 5009=
, 5005, torrent::fd_flag_stream),
-+                         torrent::internal_error);
-+    TEST_SL_CLOSE(1000);
-+  };
-+  { TEST_SL_BEGIN("sin_any, stream, no v4only");
-+    CPPUNIT_ASSERT_THROW(sl->open(torrent::sap_copy(sin_any), 5000, 5009,=
 5005, torrent::fd_flag_stream),
-+                         torrent::internal_error);
-+    TEST_SL_ASSERT_CLOSED();
-+  };
-+}
-+
-+void
-+test_socket_listen::test_open_sap() {
-+  { TEST_SL_BEGIN("sin6_any, stream");
-+    expect_fd_inet6_tcp(1000);
-+    expect_fd_bind_listen(1000, c_sin6_any_5005);
-+    TEST_SL_ASSERT_OPEN(torrent::sap_copy(sin6_any), c_sin6_any_5005, tor=
rent::fd_flag_stream);
-+    TEST_SL_CLOSE(1000);
-+  };
-+  { TEST_SL_BEGIN("sin_any, stream|v4only");
-+    expect_fd_inet_tcp(1000);
-+    expect_fd_bind_listen(1000, c_sin_any_5005);
-+    TEST_SL_ASSERT_OPEN(torrent::sap_copy(sin_any), c_sin_any_5005, torre=
nt::fd_flag_stream | torrent::fd_flag_v4only);
-+    TEST_SL_CLOSE(1000);
-+  };
-+  { TEST_SL_BEGIN("sin_1, stream|v4only");
-+    expect_fd_inet_tcp(1000);
-+    expect_fd_bind_listen(1000, c_sin_1_5005);
-+    TEST_SL_ASSERT_OPEN(torrent::sap_copy(sin_1), c_sin_1_5005, torrent::=
fd_flag_stream | torrent::fd_flag_v4only);
-+    TEST_SL_CLOSE(1000);
-+  };
-+  { TEST_SL_BEGIN("sin6_any, stream|v6only");
-+    expect_fd_inet6_tcp(1000);
-+    mock_expect(&torrent::fd__setsockopt_int, 0, 1000, (int)IPPROTO_IPV6,=
 (int)IPV6_V6ONLY, (int)true);
-+    expect_fd_bind_listen(1000, c_sin6_any_5005);
-+    TEST_SL_ASSERT_OPEN(torrent::sap_copy(sin6_any), c_sin6_any_5005, tor=
rent::fd_flag_stream | torrent::fd_flag_v6only);
-+    TEST_SL_CLOSE(1000);
-+  };
-+  { TEST_SL_BEGIN("sin6_1, stream|v6only");
-+    expect_fd_inet6_tcp(1000);
-+    mock_expect(&torrent::fd__setsockopt_int, 0, 1000, (int)IPPROTO_IPV6,=
 (int)IPV6_V6ONLY, (int)true);
-+    expect_fd_bind_listen(1000, c_sin6_1_5005);
-+    TEST_SL_ASSERT_OPEN(torrent::sap_copy(sin6_1), c_sin6_1_5005, torrent=
::fd_flag_stream | torrent::fd_flag_v6only);
-+    TEST_SL_CLOSE(1000);
-+  };
-+}
-+
-+void
-+test_socket_listen::test_open_sap_error() {
-+  { TEST_SL_BEGIN("unspec");
-+    CPPUNIT_ASSERT_THROW(sl->open(torrent::sa_make_unspec(), 5000, 5009, =
5005, torrent::fd_flag_stream), torrent::internal_error);
-+    TEST_SL_ASSERT_CLOSED();
-+  };
-+  { TEST_SL_BEGIN("unix");
-+    CPPUNIT_ASSERT_THROW(sl->open(torrent::sa_make_unix("test"), 5000, 50=
09, 5005, torrent::fd_flag_stream), torrent::internal_error);
-+    TEST_SL_ASSERT_CLOSED();
-+  };
-+  { TEST_SL_BEGIN("sin_any_5005");
-+    CPPUNIT_ASSERT_THROW(sl->open(torrent::sap_copy(sin_any_5005), 5000, =
5009, 5005, torrent::fd_flag_stream | torrent::fd_flag_v4only), torrent::in=
ternal_error);
-+    TEST_SL_ASSERT_CLOSED();
-+  };
-+  { TEST_SL_BEGIN("sin6_any_5005");
-+    CPPUNIT_ASSERT_THROW(sl->open(torrent::sap_copy(sin6_any_5005), 5000,=
 5009, 5005, torrent::fd_flag_stream), torrent::internal_error);
-+    TEST_SL_ASSERT_CLOSED();
-+  };
-+  { TEST_SL_BEGIN("sin_any");
-+    CPPUNIT_ASSERT_THROW(sl->open(torrent::sap_to_v4mapped(sin_any), 5000=
, 5009, 5005, torrent::fd_flag_stream | torrent::fd_flag_v4only), torrent::=
internal_error);
-+    TEST_SL_ASSERT_CLOSED();
-+  };
-+  { TEST_SL_BEGIN("sin_1, v4mapped");
-+    CPPUNIT_ASSERT_THROW(sl->open(torrent::sap_to_v4mapped(sin_1), 5000, =
5009, 5005, torrent::fd_flag_stream | torrent::fd_flag_v4only), torrent::in=
ternal_error);
-+    TEST_SL_ASSERT_CLOSED();
-+  };
-+  { TEST_SL_BEGIN("sin_broadcast");
-+    CPPUNIT_ASSERT_THROW(sl->open(torrent::sap_copy(sin_bc), 5000, 5009, =
5005, torrent::fd_flag_stream | torrent::fd_flag_v4only), torrent::internal=
_error);
-+    TEST_SL_ASSERT_CLOSED();
-+  };
-+}
-+
-+void
-+test_socket_listen::test_open_flags() {
-+  { TEST_SL_BEGIN("sin_any, stream|v4only|nonblock");
-+    expect_fd_inet_tcp_nonblock(1000);
-+    expect_fd_bind_listen(1000, c_sin_any_5005);
-+    TEST_SL_ASSERT_OPEN(torrent::sap_copy_addr(sin_any), c_sin_any_5005, =
torrent::fd_flag_stream | torrent::fd_flag_v4only | torrent::fd_flag_nonblo=
ck);
-+    TEST_SL_CLOSE(1000);
-+  };
-+  { TEST_SL_BEGIN("sin6_any, stream|nonblock");
-+    expect_fd_inet6_tcp_nonblock(1000);
-+    expect_fd_bind_listen(1000, c_sin6_any_5005);
-+    TEST_SL_ASSERT_OPEN(torrent::sap_copy(sin6_any), c_sin6_any_5005, tor=
rent::fd_flag_stream | torrent::fd_flag_nonblock);
-+    TEST_SL_CLOSE(1000);
-+  };
-+  { TEST_SL_BEGIN("sin_any, stream|v4only|reuse_address");
-+    expect_fd_inet_tcp(1000);
-+    mock_expect(&torrent::fd__setsockopt_int, 0, 1000, (int)SOL_SOCKET, (=
int)SO_REUSEADDR, (int)true);
-+    expect_fd_bind_listen(1000, c_sin_any_5005);
-+    TEST_SL_ASSERT_OPEN(torrent::sap_copy_addr(sin_any), c_sin_any_5005, =
torrent::fd_flag_stream | torrent::fd_flag_v4only | torrent::fd_flag_reuse_=
address);
-+    TEST_SL_CLOSE(1000);
-+  };
-+  { TEST_SL_BEGIN("sin6_any, stream|reuse_address");
-+    expect_fd_inet6_tcp(1000);
-+    mock_expect(&torrent::fd__setsockopt_int, 0, 1000, (int)SOL_SOCKET, (=
int)SO_REUSEADDR, (int)true);
-+    expect_fd_bind_listen(1000, c_sin6_any_5005);
-+    TEST_SL_ASSERT_OPEN(torrent::sap_copy(sin6_any), c_sin6_any_5005, tor=
rent::fd_flag_stream | torrent::fd_flag_reuse_address);
-+    TEST_SL_CLOSE(1000);
-+  };
-+  { TEST_SL_BEGIN("sin_any, stream|v4only|nonblock|reuse_address");
-+    expect_fd_inet_tcp_nonblock(1000);
-+    mock_expect(&torrent::fd__setsockopt_int, 0, 1000, (int)SOL_SOCKET, (=
int)SO_REUSEADDR, (int)true);
-+    expect_fd_bind_listen(1000, c_sin_any_5005);
-+    TEST_SL_ASSERT_OPEN(torrent::sap_copy_addr(sin_any), c_sin_any_5005, =
torrent::fd_flag_stream | torrent::fd_flag_v4only | torrent::fd_flag_nonblo=
ck | torrent::fd_flag_reuse_address);
-+    TEST_SL_CLOSE(1000);
-+  };
-+  { TEST_SL_BEGIN("sin6_any, stream|nonblock|reuse_address");
-+    expect_fd_inet6_tcp_nonblock_reuseaddr(1000);
-+    expect_fd_bind_listen(1000, c_sin6_any_5005);
-+    TEST_SL_ASSERT_OPEN(torrent::sap_copy(sin6_any), c_sin6_any_5005, tor=
rent::fd_flag_stream | torrent::fd_flag_nonblock | torrent::fd_flag_reuse_a=
ddress);
-+    TEST_SL_CLOSE(1000);
-+  };
-+}
-+
-+void
-+test_socket_listen::test_open_flags_error() {
-+  { TEST_SL_BEGIN("sin6_any, fd_flags(0)");
-+    CPPUNIT_ASSERT_THROW(sl->open(torrent::sap_copy(sin6_any), 5000, 5009=
, 5005, torrent::fd_flags(0)), torrent::internal_error);
-+    TEST_SL_ASSERT_CLOSED();
-+  };
-+  { TEST_SL_BEGIN("sin6_any, fd_flags(0xffff)");
-+    CPPUNIT_ASSERT_THROW(sl->open(torrent::sap_copy(sin6_any), 5000, 5009=
, 5005, torrent::fd_flags(0xffff)), torrent::internal_error);
-+    TEST_SL_ASSERT_CLOSED();
-+  };
-+}
-+
-+void
-+test_socket_listen::test_open_port_single() {
-+  { TEST_SL_BEGIN("sin6_any, stream");
-+    expect_fd_inet6_tcp(1000);
-+    expect_fd_bind_listen(1000, c_sin6_any_5000);
-+    TEST_SL_ASSERT_OPEN_PORT(torrent::sap_copy(sin6_any), c_sin6_any_5000=
, 5000, 5000, 5000, torrent::fd_flag_stream);
-+    TEST_SL_CLOSE(1000);
-+  };
-+  { TEST_SL_BEGIN("sin_any, stream");
-+    expect_fd_inet_tcp(1000);
-+    expect_fd_bind_listen(1000, c_sin_any_5000);
-+    TEST_SL_ASSERT_OPEN_PORT(torrent::sap_copy(sin_any), c_sin_any_5000, =
5000, 5000, 5000, torrent::fd_flag_stream | torrent::fd_flag_v4only);
-+    TEST_SL_CLOSE(1000);
-+  };
-+}
-+
-+void
-+test_socket_listen::test_open_port_single_error() {
-+  { TEST_SL_BEGIN("sin6_any, 0, 0, 0");
-+    CPPUNIT_ASSERT_THROW(sl->open(torrent::sap_copy(sin6_any), 0, 0, 0, t=
orrent::fd_flag_stream), torrent::internal_error);
-+    TEST_SL_ASSERT_CLOSED();
-+  };
-+  { TEST_SL_BEGIN("sin6_any, 1000, 0, 0");
-+    CPPUNIT_ASSERT_THROW(sl->open(torrent::sap_copy(sin6_any), 1000, 0, 0=
, torrent::fd_flag_stream), torrent::internal_error);
-+    TEST_SL_ASSERT_CLOSED();
-+  };
-+  { TEST_SL_BEGIN("sin6_any, 0, 1000, 0");
-+    CPPUNIT_ASSERT_THROW(sl->open(torrent::sap_copy(sin6_any), 0, 1000, 0=
, torrent::fd_flag_stream), torrent::internal_error);
-+    TEST_SL_ASSERT_CLOSED();
-+  };
-+  { TEST_SL_BEGIN("sin6_any, 0, 0, 500");
-+    CPPUNIT_ASSERT_THROW(sl->open(torrent::sap_copy(sin6_any), 0, 0, 500,=
 torrent::fd_flag_stream), torrent::internal_error);
-+    TEST_SL_ASSERT_CLOSED();
-+  };
-+  { TEST_SL_BEGIN("sin6_any, 0, 1000, 500");
-+    CPPUNIT_ASSERT_THROW(sl->open(torrent::sap_copy(sin6_any), 0, 1000, 5=
00, torrent::fd_flag_stream), torrent::internal_error);
-+    TEST_SL_ASSERT_CLOSED();
-+  };
-+}
-+
-+void
-+test_socket_listen::test_open_port_range() {
-+  { TEST_SL_BEGIN("sin6_any, stream, first");
-+    expect_fd_inet6_tcp(1000);
-+    expect_fd_bind_listen(1000, c_sin6_any_5000);
-+    TEST_SL_ASSERT_OPEN_PORT(torrent::sap_copy(sin6_any), c_sin6_any_5000=
, 5000, 5010, 5000, torrent::fd_flag_stream);
-+    TEST_SL_CLOSE(1000);
-+  };
-+  { TEST_SL_BEGIN("sin6_any, stream, from first to middle port");
-+    expect_fd_inet6_tcp(1000);
-+    TEST_SL_MOCK_CLOSED_PORT_RANGE(sin6_any, 5000, 5004);
-+    expect_fd_bind_listen(1000, c_sin6_any_5005);
-+    TEST_SL_ASSERT_OPEN_PORT(torrent::sap_copy(sin6_any), c_sin6_any_5005=
, 5000, 5010, 5000, torrent::fd_flag_stream);
-+    TEST_SL_CLOSE(1000);
-+  };
-+  { TEST_SL_BEGIN("sin6_any, stream, from first to last port");
-+    expect_fd_inet6_tcp(1000);
-+    TEST_SL_MOCK_CLOSED_PORT_RANGE(sin6_any, 5000, 5009);
-+    expect_fd_bind_listen(1000, c_sin6_any_5010);
-+    TEST_SL_ASSERT_OPEN_PORT(torrent::sap_copy(sin6_any), c_sin6_any_5010=
, 5000, 5010, 5000, torrent::fd_flag_stream);
-+    TEST_SL_CLOSE(1000);
-+  };
-+  { TEST_SL_BEGIN("sin6_any, stream, middle");
-+    expect_fd_inet6_tcp(1000);
-+    expect_fd_bind_listen(1000, c_sin6_any_5005);
-+    TEST_SL_ASSERT_OPEN_PORT(torrent::sap_copy(sin6_any), c_sin6_any_5005=
, 5000, 5010, 5005, torrent::fd_flag_stream);
-+    TEST_SL_CLOSE(1000);
-+  };
-+  { TEST_SL_BEGIN("sin6_any, stream, from middle to last port");
-+    expect_fd_inet6_tcp(1000);
-+    TEST_SL_MOCK_CLOSED_PORT_RANGE(sin6_any, 5005, 5009);
-+    expect_fd_bind_listen(1000, c_sin6_any_5010);
-+    TEST_SL_ASSERT_OPEN_PORT(torrent::sap_copy(sin6_any), c_sin6_any_5010=
, 5000, 5010, 5005, torrent::fd_flag_stream);
-+    TEST_SL_CLOSE(1000);
-+  };
-+  { TEST_SL_BEGIN("sin6_any, stream, last");
-+    expect_fd_inet6_tcp(1000);
-+    expect_fd_bind_listen(1000, c_sin6_any_5010);
-+    TEST_SL_ASSERT_OPEN_PORT(torrent::sap_copy(sin6_any), c_sin6_any_5010=
, 5000, 5010, 5010, torrent::fd_flag_stream);
-+    TEST_SL_CLOSE(1000);
-+  };
-+  { TEST_SL_BEGIN("sin6_any, stream, from last to first port");
-+    expect_fd_inet6_tcp(1000);
-+    TEST_SL_MOCK_CLOSED_PORT_RANGE(sin6_any, 5010, 5010);
-+    expect_fd_bind_listen(1000, c_sin6_any_5000);
-+    TEST_SL_ASSERT_OPEN_PORT(torrent::sap_copy(sin6_any), c_sin6_any_5000=
, 5000, 5010, 5010, torrent::fd_flag_stream);
-+    TEST_SL_CLOSE(1000);
-+  };
-+  { TEST_SL_BEGIN("sin6_any, stream, from last to middle port");
-+    expect_fd_inet6_tcp(1000);
-+    TEST_SL_MOCK_CLOSED_PORT_RANGE(sin6_any, 5010, 5010);
-+    TEST_SL_MOCK_CLOSED_PORT_RANGE(sin6_any, 5000, 5004);
-+    expect_fd_bind_listen(1000, c_sin6_any_5005);
-+    TEST_SL_ASSERT_OPEN_PORT(torrent::sap_copy(sin6_any), c_sin6_any_5005=
, 5000, 5010, 5010, torrent::fd_flag_stream);
-+    TEST_SL_CLOSE(1000);
-+  };
-+}
-+
-+void
-+test_socket_listen::test_open_port_range_error() {
-+  { TEST_SL_BEGIN("sin6_any, first > last");
-+    CPPUNIT_ASSERT_THROW(sl->open(torrent::sap_copy(sin6_any), 5000, 4999=
, 5000, torrent::fd_flag_stream), torrent::internal_error);
-+    TEST_SL_ASSERT_CLOSED();
-+  };
-+  { TEST_SL_BEGIN("sin6_any, first > itr");
-+    CPPUNIT_ASSERT_THROW(sl->open(torrent::sap_copy(sin6_any), 5001, 5009=
, 5000, torrent::fd_flag_stream), torrent::internal_error);
-+    TEST_SL_ASSERT_CLOSED();
-+  };
-+  { TEST_SL_BEGIN("sin6_any, itr > last");
-+    CPPUNIT_ASSERT_THROW(sl->open(torrent::sap_copy(sin6_any), 5000, 5009=
, 5010, torrent::fd_flag_stream), torrent::internal_error);
-+    TEST_SL_ASSERT_CLOSED();
-+  };
-+  { TEST_SL_BEGIN("sin6_any, min first > last");
-+    CPPUNIT_ASSERT_THROW(sl->open(torrent::sap_copy(sin6_any), 2, 1, 2, t=
orrent::fd_flag_stream), torrent::internal_error);
-+    TEST_SL_ASSERT_CLOSED();
-+  };
-+  { TEST_SL_BEGIN("sin6_any, min first > itr");
-+    CPPUNIT_ASSERT_THROW(sl->open(torrent::sap_copy(sin6_any), 2, 1000, 1=
, torrent::fd_flag_stream), torrent::internal_error);
-+    TEST_SL_ASSERT_CLOSED();
-+  };
-+  { TEST_SL_BEGIN("sin6_any, min itr > last");
-+    CPPUNIT_ASSERT_THROW(sl->open(torrent::sap_copy(sin6_any), 1, 2, 3, t=
orrent::fd_flag_stream), torrent::internal_error);
-+    TEST_SL_ASSERT_CLOSED();
-+  };
-+  { TEST_SL_BEGIN("sin6_any, max first > last");
-+    CPPUNIT_ASSERT_THROW(sl->open(torrent::sap_copy(sin6_any), 0xffff, 0x=
fffe, 0xffff, torrent::fd_flag_stream), torrent::internal_error);
-+    TEST_SL_ASSERT_CLOSED();
-+  };
-+  { TEST_SL_BEGIN("sin6_any, max first > itr");
-+    CPPUNIT_ASSERT_THROW(sl->open(torrent::sap_copy(sin6_any), 0xffff, 0x=
ffff, 0xfffe, torrent::fd_flag_stream), torrent::internal_error);
-+    TEST_SL_ASSERT_CLOSED();
-+  };
-+  { TEST_SL_BEGIN("sin6_any, max itr > last");
-+    CPPUNIT_ASSERT_THROW(sl->open(torrent::sap_copy(sin6_any), 0xfffe, 0x=
fffe, 0xffff, torrent::fd_flag_stream), torrent::internal_error);
-+    TEST_SL_ASSERT_CLOSED();
-+  };
-+}
-+
-+void
-+test_socket_listen::test_open_sequential() {
-+  { TEST_SL_BEGIN("sin6_any, stream");
-+    expect_fd_inet6_tcp(1000);
-+    expect_fd_bind_listen(1000, c_sin6_any_5000);
-+    TEST_SL_ASSERT_OPEN_SEQUENTIAL(torrent::sap_copy(sin6_any), c_sin6_an=
y_5000, 5000, 5010, torrent::fd_flag_stream);
-+    TEST_SL_CLOSE(1000);
-+  };
-+}
-+
-+void
-+test_socket_listen::test_open_randomize() {
-+  { TEST_SL_BEGIN("sin6_any, stream");
-+    expect_random_uniform_uint16(5005, 5000, 5010);
-+    expect_fd_inet6_tcp(1000);
-+    expect_fd_bind_listen(1000, c_sin6_any_5005);
-+    TEST_SL_ASSERT_OPEN_RANDOMIZE(torrent::sap_copy(sin6_any), c_sin6_any=
_5005, 5000, 5010, torrent::fd_flag_stream);
-+    TEST_SL_CLOSE(1000);
-+  };
-+}
-+
-+// deal with reuse error
-+
-+void
-+test_socket_listen::test_accept() {
-+  { TEST_SL_BEGIN("sin6_any, stream");
-+    expect_fd_inet6_tcp(1000);
-+    expect_fd_bind_listen(1000, c_sin6_any_5000);
-+    TEST_SL_ASSERT_OPEN_SEQUENTIAL(torrent::sap_copy(sin6_any), c_sin6_an=
y_5000, 5000, 5010, torrent::fd_flag_stream);
-+
-+    std::vector<torrent::fd_sap_tuple> accepted_connections;
-+
-+    sl->set_slot_accepted([&accepted_connections](int accept_fd, torrent:=
:sa_unique_ptr sap) {
-+        accepted_connections.push_back(torrent::fd_sap_tuple{accept_fd, s=
td::move(sap)});
-+      });
-+
-+    // CPPUNIT_ASSERT(accepted_connections.size() > 0 && torrent::fd_sap_=
equal(accepted_connections[0], torrent::fd_sap_tuple{2000, torrent::sap_cop=
y(sin6_1_5100)}));
-+
-+    TEST_SL_CLOSE(1000);
-+  };
-+}
-diff --git a/test/net/test_socket_listen.h b/test/net/test_socket_listen.h
-new file mode 100644
-index 00000000..5d06f7f3
---- /dev/null
-+++ b/test/net/test_socket_listen.h
-@@ -0,0 +1,44 @@
-+#include "helpers/test_fixture.h"
-+
-+class test_socket_listen : public test_fixture {
-+  CPPUNIT_TEST_SUITE(test_socket_listen);
-+
-+  CPPUNIT_TEST(test_basic);
-+
-+  CPPUNIT_TEST(test_open_error);
-+  CPPUNIT_TEST(test_open_sap);
-+  CPPUNIT_TEST(test_open_sap_error);
-+  CPPUNIT_TEST(test_open_flags);
-+  CPPUNIT_TEST(test_open_flags_error);
-+
-+  CPPUNIT_TEST(test_open_port_single);
-+  CPPUNIT_TEST(test_open_port_single_error);
-+  CPPUNIT_TEST(test_open_port_range);
-+  CPPUNIT_TEST(test_open_port_range_error);
-+
-+  CPPUNIT_TEST(test_open_sequential);
-+  CPPUNIT_TEST(test_open_randomize);
-+
-+  CPPUNIT_TEST(test_accept);
-+
-+  CPPUNIT_TEST_SUITE_END();
-+
-+public:
-+  void test_basic();
-+
-+  void test_open_error();
-+  void test_open_sap();
-+  void test_open_sap_error();
-+  void test_open_flags();
-+  void test_open_flags_error();
-+
-+  void test_open_port_single();
-+  void test_open_port_single_error();
-+  void test_open_port_range();
-+  void test_open_port_range_error();
-+
-+  void test_open_sequential();
-+  void test_open_randomize();
-+
-+  void test_accept();
-+};
-diff --git a/test/torrent/net/test_address_info.cc b/test/torrent/net/test=
_address_info.cc
-new file mode 100644
-index 00000000..e3ee24d1
---- /dev/null
-+++ b/test/torrent/net/test_address_info.cc
-@@ -0,0 +1,62 @@
-+#include "config.h"
-+
-+#include "test_address_info.h"
-+
-+#include "helpers/network.h"
-+#include "torrent/net/address_info.h"
-+#include "torrent/net/socket_address.h"
-+
-+CPPUNIT_TEST_SUITE_NAMED_REGISTRATION(test_address_info, "torrent/net");
-+
-+void
-+test_address_info::test_basic() {
-+  CPPUNIT_ASSERT(test_valid_ai_ref<aif_inet|aif_any> (std::bind(torrent::=
ai_get_addrinfo, "0.0.0.0", nullptr, nullptr, std::placeholders::_1)));
-+  CPPUNIT_ASSERT(test_valid_ai_ref<aif_inet6|aif_any>(std::bind(torrent::=
ai_get_addrinfo, "::", nullptr, nullptr, std::placeholders::_1)));
-+
-+  CPPUNIT_ASSERT(test_valid_ai_ref<aif_inet> (std::bind(torrent::ai_get_a=
ddrinfo, "1.1.1.1", nullptr, nullptr, std::placeholders::_1)));
-+  CPPUNIT_ASSERT(test_valid_ai_ref<aif_inet6>(std::bind(torrent::ai_get_a=
ddrinfo, "ff01::1", nullptr, nullptr, std::placeholders::_1)));
-+  CPPUNIT_ASSERT(test_valid_ai_ref<aif_inet6>(std::bind(torrent::ai_get_a=
ddrinfo, "2001:0db8:85a3:0000:0000:8a2e:0370:7334", nullptr, nullptr, std::=
placeholders::_1)));
-+
-+  CPPUNIT_ASSERT(test_valid_ai_ref<aif_inet> (std::bind(torrent::ai_get_a=
ddrinfo, "1.1.1.1", "22123", nullptr, std::placeholders::_1), 22123));
-+  CPPUNIT_ASSERT(test_valid_ai_ref<aif_inet6>(std::bind(torrent::ai_get_a=
ddrinfo, "2001:db8:a::", "22123", nullptr, std::placeholders::_1), 22123));
-+
-+  CPPUNIT_ASSERT(test_valid_ai_ref<aif_none> (std::bind(torrent::ai_get_a=
ddrinfo, "localhost", nullptr, nullptr, std::placeholders::_1)));
-+
-+  CPPUNIT_ASSERT(test_valid_ai_ref_err(std::bind(torrent::ai_get_addrinfo=
, "1.1.1.300", nullptr, nullptr, std::placeholders::_1), EAI_NONAME));
-+  CPPUNIT_ASSERT(test_valid_ai_ref_err(std::bind(torrent::ai_get_addrinfo=
, "2001:db8:a::22123", nullptr, nullptr, std::placeholders::_1), EAI_NONAME=
));
-+}
-+
-+void
-+test_address_info::test_numericserv() {
-+  CPPUNIT_ASSERT(test_valid_ai_ref<aif_inet> (std::bind(torrent::ai_get_a=
ddrinfo, "1.1.1.1", nullptr, torrent::ai_make_hint(AI_NUMERICHOST, 0, 0).ge=
t(), std::placeholders::_1)));
-+
-+  CPPUNIT_ASSERT(test_valid_ai_ref_err(std::bind(torrent::ai_get_addrinfo=
, "localhost", nullptr, torrent::ai_make_hint(AI_NUMERICHOST, 0, 0).get(), =
std::placeholders::_1), EAI_NONAME));
-+}
-+
-+void
-+test_address_info::test_helpers() {
-+  torrent::sin_unique_ptr sin_zero =3D torrent::sin_from_sa(wrap_ai_get_f=
irst_sa("0.0.0.0"));
-+  CPPUNIT_ASSERT(sin_zero !=3D nullptr);
-+  CPPUNIT_ASSERT(sin_zero->sin_family =3D=3D AF_INET);
-+  CPPUNIT_ASSERT(sin_zero->sin_port =3D=3D 0);
-+  CPPUNIT_ASSERT(sin_zero->sin_addr.s_addr =3D=3D in_addr().s_addr);
-+
-+  torrent::sin_unique_ptr sin_1 =3D torrent::sin_from_sa(wrap_ai_get_firs=
t_sa("1.2.3.4"));
-+  CPPUNIT_ASSERT(sin_1 !=3D nullptr);
-+  CPPUNIT_ASSERT(sin_1->sin_family =3D=3D AF_INET);
-+  CPPUNIT_ASSERT(sin_1->sin_port =3D=3D 0);
-+  CPPUNIT_ASSERT(sin_1->sin_addr.s_addr =3D=3D htonl(0x01020304));
-+
-+  torrent::sin6_unique_ptr sin6_zero =3D torrent::sin6_from_sa(wrap_ai_ge=
t_first_sa("::"));
-+  CPPUNIT_ASSERT(sin6_zero !=3D nullptr);
-+  CPPUNIT_ASSERT(sin6_zero->sin6_family =3D=3D AF_INET6);
-+  CPPUNIT_ASSERT(sin6_zero->sin6_port =3D=3D 0);
-+  CPPUNIT_ASSERT(compare_sin6_addr(sin6_zero->sin6_addr, in6_addr{0}));
-+
-+  torrent::sin6_unique_ptr sin6_1 =3D torrent::sin6_from_sa(wrap_ai_get_f=
irst_sa("ff01::1"));
-+  CPPUNIT_ASSERT(sin6_1 !=3D nullptr);
-+  CPPUNIT_ASSERT(sin6_1->sin6_family =3D=3D AF_INET6);
-+  CPPUNIT_ASSERT(sin6_1->sin6_port =3D=3D 0);
-+  CPPUNIT_ASSERT(compare_sin6_addr(sin6_1->sin6_addr, in6_addr{0xff, 0x01=
, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}));
-+  CPPUNIT_ASSERT(!compare_sin6_addr(sin6_1->sin6_addr, in6_addr{0xff, 0x0=
1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2}));
-+}
-diff --git a/test/torrent/net/test_address_info.h b/test/torrent/net/test_=
address_info.h
-new file mode 100644
-index 00000000..c2ce9188
---- /dev/null
-+++ b/test/torrent/net/test_address_info.h
-@@ -0,0 +1,19 @@
-+#include <cppunit/extensions/HelperMacros.h>
-+
-+class test_address_info : public CppUnit::TestFixture {
-+  CPPUNIT_TEST_SUITE(test_address_info);
-+
-+  CPPUNIT_TEST(test_basic);
-+  CPPUNIT_TEST(test_numericserv);
-+  CPPUNIT_TEST(test_helpers);
-+
-+  CPPUNIT_TEST_SUITE_END();
-+
-+public:
-+  void setUp() {}
-+  void tearDown() {}
-+
-+  void test_basic();
-+  void test_numericserv();
-+  void test_helpers();
-+};
-diff --git a/test/torrent/net/test_fd.cc b/test/torrent/net/test_fd.cc
-new file mode 100644
-index 00000000..3cab0c5e
---- /dev/null
-+++ b/test/torrent/net/test_fd.cc
-@@ -0,0 +1,24 @@
-+#include "config.h"
-+
-+#include "test_fd.h"
-+
-+#include <torrent/net/fd.h>
-+
-+CPPUNIT_TEST_SUITE_NAMED_REGISTRATION(test_fd, "torrent/net");
-+
-+void
-+test_fd::test_valid_flags() {
-+  CPPUNIT_ASSERT(torrent::fd_valid_flags(torrent::fd_flag_stream));
-+  CPPUNIT_ASSERT(torrent::fd_valid_flags(torrent::fd_flag_stream | torren=
t::fd_flag_nonblock));
-+  CPPUNIT_ASSERT(torrent::fd_valid_flags(torrent::fd_flag_stream | torren=
t::fd_flag_reuse_address));
-+  CPPUNIT_ASSERT(torrent::fd_valid_flags(torrent::fd_flag_stream | torren=
t::fd_flag_v4only));
-+  CPPUNIT_ASSERT(torrent::fd_valid_flags(torrent::fd_flag_stream | torren=
t::fd_flag_v6only));
-+
-+  CPPUNIT_ASSERT(!torrent::fd_valid_flags(torrent::fd_flag_v4only | torre=
nt::fd_flag_v6only));
-+  CPPUNIT_ASSERT(!torrent::fd_valid_flags(torrent::fd_flag_stream | torre=
nt::fd_flag_v4only | torrent::fd_flag_v6only));
-+
-+  CPPUNIT_ASSERT(!torrent::fd_valid_flags(torrent::fd_flags()));
-+  CPPUNIT_ASSERT(!torrent::fd_valid_flags(torrent::fd_flags(~torrent::fd_=
flag_all)));
-+  CPPUNIT_ASSERT(!torrent::fd_valid_flags(torrent::fd_flags(torrent::fd_f=
lag_stream | ~torrent::fd_flag_all)));
-+  CPPUNIT_ASSERT(!torrent::fd_valid_flags(torrent::fd_flags(0x3245132)));
-+}
-diff --git a/test/torrent/net/test_fd.h b/test/torrent/net/test_fd.h
-new file mode 100644
-index 00000000..6ba718fc
---- /dev/null
-+++ b/test/torrent/net/test_fd.h
-@@ -0,0 +1,12 @@
-+#include "helpers/test_fixture.h"
-+
-+class test_fd : public test_fixture {
-+  CPPUNIT_TEST_SUITE(test_fd);
-+
-+  CPPUNIT_TEST(test_valid_flags);
-+
-+  CPPUNIT_TEST_SUITE_END();
-+
-+public:
-+  void test_valid_flags();
-+};
-diff --git a/test/torrent/net/test_socket_address.cc b/test/torrent/net/te=
st_socket_address.cc
-new file mode 100644
-index 00000000..8a1b0c8a
---- /dev/null
-+++ b/test/torrent/net/test_socket_address.cc
-@@ -0,0 +1,383 @@
-+#include "config.h"
-+
-+#include "test_socket_address.h"
-+
-+#include "helpers/network.h"
-+#include "torrent/exceptions.h"
-+#include "torrent/net/socket_address.h"
-+
-+CPPUNIT_TEST_SUITE_NAMED_REGISTRATION(test_socket_address, "torrent/net")=
;
-+
-+void
-+test_socket_address::test_sa_is_any() {
-+  TEST_DEFAULT_SA;
-+
-+  CPPUNIT_ASSERT(torrent::sap_is_any(sin_any));
-+  CPPUNIT_ASSERT(torrent::sap_is_any(sin_any_5000));
-+  CPPUNIT_ASSERT(torrent::sap_is_any(sin6_v4_any));
-+  CPPUNIT_ASSERT(torrent::sap_is_any(sin6_v4_any_5000));
-+
-+  CPPUNIT_ASSERT(!torrent::sap_is_any(sin_bc));
-+  CPPUNIT_ASSERT(!torrent::sap_is_any(sin_1));
-+  CPPUNIT_ASSERT(!torrent::sap_is_any(sin6_1));
-+  CPPUNIT_ASSERT(!torrent::sap_is_any(sin_bc_5000));
-+  CPPUNIT_ASSERT(!torrent::sap_is_any(sin_1_5000));
-+  CPPUNIT_ASSERT(!torrent::sap_is_any(sin6_1_5000));
-+
-+  CPPUNIT_ASSERT(!torrent::sap_is_any(c_sin_bc));
-+  CPPUNIT_ASSERT(!torrent::sap_is_any(c_sin_1));
-+  CPPUNIT_ASSERT(!torrent::sap_is_any(c_sin6_1));
-+  CPPUNIT_ASSERT(!torrent::sap_is_any(c_sin_bc_5000));
-+  CPPUNIT_ASSERT(!torrent::sap_is_any(c_sin_1_5000));
-+  CPPUNIT_ASSERT(!torrent::sap_is_any(c_sin6_1_5000));
-+}
-+
-+void
-+test_socket_address::test_sa_is_broadcast() {
-+  TEST_DEFAULT_SA;
-+
-+  CPPUNIT_ASSERT(torrent::sap_is_broadcast(sin_bc));
-+  CPPUNIT_ASSERT(torrent::sap_is_broadcast(sin_bc_5000));
-+  CPPUNIT_ASSERT(torrent::sap_is_broadcast(sin6_v4_bc));
-+  CPPUNIT_ASSERT(torrent::sap_is_broadcast(sin6_v4_bc_5000));
-+
-+  CPPUNIT_ASSERT(!torrent::sap_is_broadcast(sin_any));
-+  CPPUNIT_ASSERT(!torrent::sap_is_broadcast(sin_1));
-+  CPPUNIT_ASSERT(!torrent::sap_is_broadcast(sin6_any));
-+  CPPUNIT_ASSERT(!torrent::sap_is_broadcast(sin6_1));
-+  CPPUNIT_ASSERT(!torrent::sap_is_broadcast(sin_any_5000));
-+  CPPUNIT_ASSERT(!torrent::sap_is_broadcast(sin_1_5000));
-+  CPPUNIT_ASSERT(!torrent::sap_is_broadcast(sin6_any_5000));
-+  CPPUNIT_ASSERT(!torrent::sap_is_broadcast(sin6_1_5000));
-+
-+  CPPUNIT_ASSERT(!torrent::sap_is_broadcast(c_sin_any));
-+  CPPUNIT_ASSERT(!torrent::sap_is_broadcast(c_sin_1));
-+  CPPUNIT_ASSERT(!torrent::sap_is_broadcast(c_sin6_any));
-+  CPPUNIT_ASSERT(!torrent::sap_is_broadcast(c_sin6_1));
-+  CPPUNIT_ASSERT(!torrent::sap_is_broadcast(c_sin_any_5000));
-+  CPPUNIT_ASSERT(!torrent::sap_is_broadcast(c_sin_1_5000));
-+  CPPUNIT_ASSERT(!torrent::sap_is_broadcast(c_sin6_any_5000));
-+  CPPUNIT_ASSERT(!torrent::sap_is_broadcast(c_sin6_1_5000));
-+}
-+
-+void
-+test_socket_address::test_make() {
-+  torrent::sa_unique_ptr sa_unspec =3D torrent::sa_make_unspec();
-+  CPPUNIT_ASSERT(sa_unspec !=3D nullptr);
-+  CPPUNIT_ASSERT(sa_unspec->sa_family =3D=3D AF_UNSPEC);
-+
-+  torrent::sa_unique_ptr sa_inet =3D torrent::sa_make_inet();
-+  CPPUNIT_ASSERT(sa_inet !=3D nullptr);
-+  CPPUNIT_ASSERT(sa_inet->sa_family =3D=3D AF_INET);
-+
-+  sockaddr_in* sin_inet =3D reinterpret_cast<sockaddr_in*>(sa_inet.get())=
;
-+  CPPUNIT_ASSERT(sin_inet->sin_family =3D=3D AF_INET);
-+  CPPUNIT_ASSERT(sin_inet->sin_port =3D=3D 0);
-+  CPPUNIT_ASSERT(sin_inet->sin_addr.s_addr =3D=3D in_addr().s_addr);
-+
-+  torrent::sa_unique_ptr sa_inet6 =3D torrent::sa_make_inet6();
-+  CPPUNIT_ASSERT(sa_inet6 !=3D nullptr);
-+  CPPUNIT_ASSERT(sa_inet6->sa_family =3D=3D AF_INET6);
-+
-+  sockaddr_in6* sin6_inet6 =3D reinterpret_cast<sockaddr_in6*>(sa_inet6.g=
et());
-+  CPPUNIT_ASSERT(sin6_inet6->sin6_family =3D=3D AF_INET6);
-+  CPPUNIT_ASSERT(sin6_inet6->sin6_port =3D=3D 0);
-+  CPPUNIT_ASSERT(sin6_inet6->sin6_flowinfo =3D=3D 0);
-+  CPPUNIT_ASSERT(compare_sin6_addr(sin6_inet6->sin6_addr, in6_addr{0}));
-+  CPPUNIT_ASSERT(sin6_inet6->sin6_scope_id =3D=3D 0);
-+
-+  torrent::sa_unique_ptr sa_unix =3D torrent::sa_make_unix("");
-+  CPPUNIT_ASSERT(sa_unix !=3D nullptr);
-+  CPPUNIT_ASSERT(sa_unix->sa_family =3D=3D AF_UNIX);
-+}
-+
-+void
-+test_socket_address::test_sin_from_sa() {
-+  torrent::sa_unique_ptr sa_zero =3D wrap_ai_get_first_sa("0.0.0.0");
-+  torrent::sin_unique_ptr sin_zero;
-+
-+  CPPUNIT_ASSERT(sa_zero !=3D nullptr);
-+  CPPUNIT_ASSERT_NO_THROW({ sin_zero =3D torrent::sin_from_sa(std::move(s=
a_zero)); });
-+  CPPUNIT_ASSERT(sa_zero =3D=3D nullptr);
-+  CPPUNIT_ASSERT(sin_zero !=3D nullptr);
-+
-+  CPPUNIT_ASSERT(sin_zero->sin_addr.s_addr =3D=3D htonl(0x0));
-+
-+  torrent::sa_unique_ptr sa_inet =3D wrap_ai_get_first_sa("1.2.3.4");
-+  torrent::sin_unique_ptr sin_inet;
-+
-+  CPPUNIT_ASSERT(sa_inet !=3D nullptr);
-+  CPPUNIT_ASSERT_NO_THROW({ sin_inet =3D torrent::sin_from_sa(std::move(s=
a_inet)); });
-+  CPPUNIT_ASSERT(sa_inet =3D=3D nullptr);
-+  CPPUNIT_ASSERT(sin_inet !=3D nullptr);
-+
-+  CPPUNIT_ASSERT(sin_inet->sin_addr.s_addr =3D=3D htonl(0x01020304));
-+ =20
-+  CPPUNIT_ASSERT_THROW(torrent::sin_from_sa(torrent::sa_unique_ptr()), to=
rrent::internal_error);
-+  CPPUNIT_ASSERT_THROW(torrent::sin_from_sa(torrent::sa_make_unspec()), t=
orrent::internal_error);
-+  CPPUNIT_ASSERT_THROW(torrent::sin_from_sa(torrent::sa_make_inet6()), to=
rrent::internal_error);
-+}
-+
-+void
-+test_socket_address::test_sin6_from_sa() {
-+  torrent::sa_unique_ptr sa_zero =3D wrap_ai_get_first_sa("::");
-+  torrent::sin6_unique_ptr sin6_zero;
-+
-+  CPPUNIT_ASSERT(sa_zero !=3D nullptr);
-+  CPPUNIT_ASSERT_NO_THROW({ sin6_zero =3D torrent::sin6_from_sa(std::move=
(sa_zero)); });
-+  CPPUNIT_ASSERT(sa_zero =3D=3D nullptr);
-+  CPPUNIT_ASSERT(sin6_zero !=3D nullptr);
-+
-+  CPPUNIT_ASSERT(sin6_zero->sin6_addr.s6_addr[0] =3D=3D 0x0);
-+  CPPUNIT_ASSERT(sin6_zero->sin6_addr.s6_addr[1] =3D=3D 0x0);
-+  CPPUNIT_ASSERT(sin6_zero->sin6_addr.s6_addr[15] =3D=3D 0x0);
-+
-+  torrent::sa_unique_ptr sa_inet6 =3D wrap_ai_get_first_sa("ff01::1");
-+  torrent::sin6_unique_ptr sin6_inet6;
-+
-+  CPPUNIT_ASSERT(sa_inet6 !=3D nullptr);
-+  CPPUNIT_ASSERT_NO_THROW({ sin6_inet6 =3D torrent::sin6_from_sa(std::mov=
e(sa_inet6)); });
-+  CPPUNIT_ASSERT(sa_inet6 =3D=3D nullptr);
-+  CPPUNIT_ASSERT(sin6_inet6 !=3D nullptr);
-+ =20
-+  CPPUNIT_ASSERT(sin6_inet6->sin6_addr.s6_addr[0] =3D=3D 0xff);
-+  CPPUNIT_ASSERT(sin6_inet6->sin6_addr.s6_addr[1] =3D=3D 0x01);
-+  CPPUNIT_ASSERT(sin6_inet6->sin6_addr.s6_addr[15] =3D=3D 0x01);
-+
-+  CPPUNIT_ASSERT_THROW(torrent::sin6_from_sa(torrent::sa_unique_ptr()), t=
orrent::internal_error);
-+  CPPUNIT_ASSERT_THROW(torrent::sin6_from_sa(torrent::sa_make_unspec()), =
torrent::internal_error);
-+  CPPUNIT_ASSERT_THROW(torrent::sin6_from_sa(torrent::sa_make_inet()), to=
rrent::internal_error);
-+}
-+
-+void
-+test_socket_address::test_sa_equal() {
-+  TEST_DEFAULT_SA;
-+
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sa_make_unspec(), torrent::s=
a_make_unspec()));
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sa_make_inet(), torrent::sa_=
make_inet()));
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sa_make_inet6(), torrent::sa=
_make_inet6()));
-+
-+  CPPUNIT_ASSERT(!torrent::sap_equal(torrent::sa_make_unspec(), torrent::=
sa_make_inet()));
-+  CPPUNIT_ASSERT(!torrent::sap_equal(torrent::sa_make_unspec(), torrent::=
sa_make_inet6()));
-+  CPPUNIT_ASSERT(!torrent::sap_equal(torrent::sa_make_inet(), torrent::sa=
_make_inet6()));
-+  CPPUNIT_ASSERT(!torrent::sap_equal(torrent::sa_make_inet6(), torrent::s=
a_make_inet()));
-+
-+  CPPUNIT_ASSERT(torrent::sap_equal(sin_1, sin_1));
-+  CPPUNIT_ASSERT(torrent::sap_equal(sin_1, c_sin_1));
-+  CPPUNIT_ASSERT(torrent::sap_equal(c_sin_1, sin_1));
-+  CPPUNIT_ASSERT(torrent::sap_equal(c_sin_1, c_sin_1));
-+
-+  CPPUNIT_ASSERT(!torrent::sap_equal(sin_1, sin_2));
-+  CPPUNIT_ASSERT(!torrent::sap_equal(sin_1, c_sin_2));
-+  CPPUNIT_ASSERT(!torrent::sap_equal(c_sin_1, sin_2));
-+  CPPUNIT_ASSERT(!torrent::sap_equal(c_sin_1, c_sin_2));
-+
-+  CPPUNIT_ASSERT(torrent::sap_equal(sin6_1, sin6_1));
-+  CPPUNIT_ASSERT(torrent::sap_equal(sin6_1, c_sin6_1));
-+  CPPUNIT_ASSERT(torrent::sap_equal(c_sin6_1, sin6_1));
-+  CPPUNIT_ASSERT(torrent::sap_equal(c_sin6_1, c_sin6_1));
-+
-+  CPPUNIT_ASSERT(!torrent::sap_equal(sin6_1, sin6_2));
-+  CPPUNIT_ASSERT(!torrent::sap_equal(sin6_1, c_sin6_2));
-+  CPPUNIT_ASSERT(!torrent::sap_equal(c_sin6_1, sin6_2));
-+  CPPUNIT_ASSERT(!torrent::sap_equal(c_sin6_1, c_sin6_2));
-+
-+  CPPUNIT_ASSERT(torrent::sap_equal(sin_1_5000, sin_1_5000));
-+  CPPUNIT_ASSERT(torrent::sap_equal(sin6_1_5000, sin6_1_5000));
-+  CPPUNIT_ASSERT(!torrent::sap_equal(sin_1_5000, sin_1_5100));
-+  CPPUNIT_ASSERT(!torrent::sap_equal(sin6_1_5000, sin6_1_5100));
-+  CPPUNIT_ASSERT(!torrent::sap_equal(sin_1_5000, sin_2_5000));
-+  CPPUNIT_ASSERT(!torrent::sap_equal(sin6_1_5000, sin6_2_5000));
-+  CPPUNIT_ASSERT(!torrent::sap_equal(sin_1_5000, sin_2_5100));
-+  CPPUNIT_ASSERT(!torrent::sap_equal(sin6_1_5000, sin6_2_5100));
-+
-+  CPPUNIT_ASSERT_THROW(torrent::sap_equal(torrent::sa_make_unix(""), torr=
ent::sa_make_unix("")), torrent::internal_error);
-+  CPPUNIT_ASSERT_THROW(torrent::sap_equal(torrent::sa_make_unix(""), sin6=
_1), torrent::internal_error);
-+  CPPUNIT_ASSERT_THROW(torrent::sap_equal(sin6_1, torrent::sa_make_unix("=
")), torrent::internal_error);
-+}
-+
-+void
-+test_socket_address::test_sa_equal_addr() {
-+  TEST_DEFAULT_SA;
-+
-+  CPPUNIT_ASSERT(torrent::sap_equal_addr(torrent::sa_make_unspec(), torre=
nt::sa_make_unspec()));
-+  CPPUNIT_ASSERT(torrent::sap_equal_addr(torrent::sa_make_inet(), torrent=
::sa_make_inet()));
-+  CPPUNIT_ASSERT(torrent::sap_equal_addr(torrent::sa_make_inet6(), torren=
t::sa_make_inet6()));
-+
-+  CPPUNIT_ASSERT(!torrent::sap_equal_addr(torrent::sa_make_unspec(), torr=
ent::sa_make_inet()));
-+  CPPUNIT_ASSERT(!torrent::sap_equal_addr(torrent::sa_make_unspec(), torr=
ent::sa_make_inet6()));
-+  CPPUNIT_ASSERT(!torrent::sap_equal_addr(torrent::sa_make_inet(), torren=
t::sa_make_inet6()));
-+  CPPUNIT_ASSERT(!torrent::sap_equal_addr(torrent::sa_make_inet6(), torre=
nt::sa_make_inet()));
-+
-+  CPPUNIT_ASSERT(torrent::sap_equal_addr(sin_1, sin_1));
-+  CPPUNIT_ASSERT(torrent::sap_equal_addr(sin_1, c_sin_1));
-+  CPPUNIT_ASSERT(torrent::sap_equal_addr(c_sin_1, sin_1));
-+  CPPUNIT_ASSERT(torrent::sap_equal_addr(c_sin_1, c_sin_1));
-+
-+  CPPUNIT_ASSERT(!torrent::sap_equal_addr(sin_1, sin_2));
-+  CPPUNIT_ASSERT(!torrent::sap_equal_addr(sin_1, c_sin_2));
-+  CPPUNIT_ASSERT(!torrent::sap_equal_addr(c_sin_1, sin_2));
-+  CPPUNIT_ASSERT(!torrent::sap_equal_addr(c_sin_1, c_sin_2));
-+
-+  CPPUNIT_ASSERT(torrent::sap_equal_addr(sin6_1, sin6_1));
-+  CPPUNIT_ASSERT(torrent::sap_equal_addr(sin6_1, c_sin6_1));
-+  CPPUNIT_ASSERT(torrent::sap_equal_addr(c_sin6_1, sin6_1));
-+  CPPUNIT_ASSERT(torrent::sap_equal_addr(c_sin6_1, c_sin6_1));
-+
-+  CPPUNIT_ASSERT(!torrent::sap_equal_addr(sin6_1, sin6_2));
-+  CPPUNIT_ASSERT(!torrent::sap_equal_addr(sin6_1, c_sin6_2));
-+  CPPUNIT_ASSERT(!torrent::sap_equal_addr(c_sin6_1, sin6_2));
-+  CPPUNIT_ASSERT(!torrent::sap_equal_addr(c_sin6_1, c_sin6_2));
-+
-+  CPPUNIT_ASSERT(torrent::sap_equal_addr(sin_1_5000, sin_1_5000));
-+  CPPUNIT_ASSERT(torrent::sap_equal_addr(sin6_1_5000, sin6_1_5000));
-+  CPPUNIT_ASSERT(torrent::sap_equal_addr(sin_1_5000, sin_1_5100));
-+  CPPUNIT_ASSERT(torrent::sap_equal_addr(sin6_1_5000, sin6_1_5100));
-+  CPPUNIT_ASSERT(!torrent::sap_equal_addr(sin_1_5000, sin_2_5000));
-+  CPPUNIT_ASSERT(!torrent::sap_equal_addr(sin6_1_5000, sin6_2_5000));
-+  CPPUNIT_ASSERT(!torrent::sap_equal_addr(sin_1_5000, sin_2_5100));
-+  CPPUNIT_ASSERT(!torrent::sap_equal_addr(sin6_1_5000, sin6_2_5100));
-+
-+  CPPUNIT_ASSERT_THROW(torrent::sap_equal_addr(torrent::sa_make_unix(""),=
 torrent::sa_make_unix("")), torrent::internal_error);
-+  CPPUNIT_ASSERT_THROW(torrent::sap_equal_addr(torrent::sa_make_unix(""),=
 sin6_1), torrent::internal_error);
-+  CPPUNIT_ASSERT_THROW(torrent::sap_equal_addr(sin6_1, torrent::sa_make_u=
nix("")), torrent::internal_error);
-+}
-+
-+void
-+test_socket_address::test_sa_copy() {
-+  TEST_DEFAULT_SA;
-+
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy(torrent::sa_make_un=
spec()), torrent::sa_make_unspec()));
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy(torrent::sa_make_in=
et()), sin_any));
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy(torrent::sa_make_in=
et6()), sin6_any));
-+
-+  CPPUNIT_ASSERT(torrent::sap_copy(sin_1).get() !=3D sin_1.get());
-+  CPPUNIT_ASSERT(torrent::sap_copy(c_sin_1).get() !=3D c_sin_1.get());
-+  CPPUNIT_ASSERT(torrent::sap_copy(sin6_1).get() !=3D sin6_1.get());
-+  CPPUNIT_ASSERT(torrent::sap_copy(c_sin6_1).get() !=3D c_sin6_1.get());
-+  CPPUNIT_ASSERT(torrent::sap_copy(sin_1_5000).get() !=3D sin_1_5000.get(=
));
-+  CPPUNIT_ASSERT(torrent::sap_copy(sin6_1_5000).get() !=3D sin6_1_5000.ge=
t());
-+
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy(sin_1), sin_1));
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy(sin_1), c_sin_1));
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy(c_sin_1), sin_1));
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy(c_sin_1), c_sin_1))=
;
-+
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy(sin6_1), sin6_1));
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy(sin6_1), c_sin6_1))=
;
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy(c_sin6_1), sin6_1))=
;
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy(c_sin6_1), c_sin6_1=
));
-+
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy(sin_1_5000), sin_1_=
5000));
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy(sin6_1_5000), sin6_=
1_5000));
-+
-+  auto sin6_flags =3D torrent::sap_copy(sin6_1_5000);
-+  reinterpret_cast<sockaddr_in6*>(sin6_flags.get())->sin6_flowinfo =3D 0x=
12345678;
-+  reinterpret_cast<sockaddr_in6*>(sin6_flags.get())->sin6_scope_id =3D 0x=
12345678;
-+
-+  // TODO: Need 'strict' equal test.
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy(sin6_flags), sin6_f=
lags));
-+
-+  CPPUNIT_ASSERT_THROW(torrent::sap_copy(torrent::sa_unique_ptr()), torre=
nt::internal_error);
-+  CPPUNIT_ASSERT_THROW(torrent::sap_copy(torrent::c_sa_unique_ptr()), tor=
rent::internal_error);
-+}
-+
-+void
-+test_socket_address::test_sa_copy_addr() {
-+  TEST_DEFAULT_SA;
-+
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy_addr(torrent::sa_ma=
ke_unspec()), torrent::sa_make_unspec()));
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy_addr(torrent::sa_ma=
ke_inet()), sin_any));
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy_addr(torrent::sa_ma=
ke_inet6()), sin6_any));
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy_addr(torrent::sa_ma=
ke_unspec(), 5000), torrent::sa_make_unspec()));
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy_addr(torrent::sa_ma=
ke_inet(), 5000), sin_any_5000));
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy_addr(torrent::sa_ma=
ke_inet6(), 5000), sin6_any_5000));
-+
-+  CPPUNIT_ASSERT(torrent::sap_copy_addr(sin_1).get() !=3D sin_1.get());
-+  CPPUNIT_ASSERT(torrent::sap_copy_addr(c_sin_1).get() !=3D c_sin_1.get()=
);
-+  CPPUNIT_ASSERT(torrent::sap_copy_addr(sin6_1).get() !=3D sin6_1.get());
-+  CPPUNIT_ASSERT(torrent::sap_copy_addr(c_sin6_1).get() !=3D c_sin6_1.get=
());
-+  CPPUNIT_ASSERT(torrent::sap_copy_addr(sin_1_5000).get() !=3D sin_1_5000=
.get());
-+  CPPUNIT_ASSERT(torrent::sap_copy_addr(sin6_1_5000).get() !=3D sin6_1_50=
00.get());
-+
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy_addr(sin_1), sin_1)=
);
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy_addr(sin_1), c_sin_=
1));
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy_addr(c_sin_1), sin_=
1));
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy_addr(c_sin_1), c_si=
n_1));
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy_addr(sin_1, 5000), =
sin_1_5000));
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy_addr(sin_1, 5000), =
c_sin_1_5000));
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy_addr(c_sin_1, 5000)=
, sin_1_5000));
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy_addr(c_sin_1, 5000)=
, c_sin_1_5000));
-+
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy_addr(sin6_1), sin6_=
1));
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy_addr(sin6_1), c_sin=
6_1));
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy_addr(c_sin6_1), sin=
6_1));
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy_addr(c_sin6_1), c_s=
in6_1));
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy_addr(sin6_1, 5000),=
 sin6_1_5000));
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy_addr(sin6_1, 5000),=
 c_sin6_1_5000));
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy_addr(c_sin6_1, 5000=
), sin6_1_5000));
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy_addr(c_sin6_1, 5000=
), c_sin6_1_5000));
-+
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy_addr(sin_1_5000), s=
in_1));
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy_addr(sin6_1_5000), =
sin6_1));
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy_addr(sin_1_5000, 51=
00), sin_1_5100));
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy_addr(sin6_1_5000, 5=
100), sin6_1_5100));
-+
-+  auto sin6_flags =3D wrap_ai_get_first_sa("ff01::1", "5555");
-+  reinterpret_cast<sockaddr_in6*>(sin6_flags.get())->sin6_flowinfo =3D 0x=
12345678;
-+  reinterpret_cast<sockaddr_in6*>(sin6_flags.get())->sin6_scope_id =3D 0x=
12345678;
-+
-+  CPPUNIT_ASSERT(torrent::sap_equal(torrent::sap_copy_addr(sin6_flags), s=
in6_1));
-+
-+  CPPUNIT_ASSERT_THROW(torrent::sap_copy_addr(torrent::sa_unique_ptr()), =
torrent::internal_error);
-+  CPPUNIT_ASSERT_THROW(torrent::sap_copy_addr(torrent::c_sa_unique_ptr())=
, torrent::internal_error);
-+  CPPUNIT_ASSERT_THROW(torrent::sap_copy_addr(torrent::sa_unique_ptr(), 5=
000), torrent::internal_error);
-+  CPPUNIT_ASSERT_THROW(torrent::sap_copy_addr(torrent::c_sa_unique_ptr(),=
 5000), torrent::internal_error);
-+}
-+
-+void
-+test_socket_address::test_sa_from_v4mapped() {
-+  TEST_DEFAULT_SA;
-+
-+  CPPUNIT_ASSERT(torrent::sap_equal_addr(torrent::sap_from_v4mapped(sin6_=
v4_any), sin_any));
-+  CPPUNIT_ASSERT(torrent::sap_is_port_any(torrent::sap_from_v4mapped(sin6=
_v4_any)));
-+
-+  CPPUNIT_ASSERT(torrent::sap_equal_addr(torrent::sap_from_v4mapped(sin6_=
v4_1), sin_1));
-+  CPPUNIT_ASSERT(torrent::sap_is_port_any(torrent::sap_from_v4mapped(sin6=
_v4_1)));
-+
-+  CPPUNIT_ASSERT(torrent::sap_equal_addr(torrent::sap_from_v4mapped(sin6_=
v4_bc), sin_bc));
-+  CPPUNIT_ASSERT(torrent::sap_is_port_any(torrent::sap_from_v4mapped(sin6=
_v4_bc)));
-+
-+  CPPUNIT_ASSERT_THROW(torrent::sap_from_v4mapped(torrent::sa_make_unspec=
()), torrent::internal_error);
-+  CPPUNIT_ASSERT_THROW(torrent::sap_from_v4mapped(torrent::sa_make_inet()=
), torrent::internal_error);
-+  CPPUNIT_ASSERT_THROW(torrent::sap_from_v4mapped(torrent::sa_make_unix("=
")), torrent::internal_error);
-+  CPPUNIT_ASSERT_THROW(torrent::sap_from_v4mapped(sin_any), torrent::inte=
rnal_error);
-+  CPPUNIT_ASSERT_THROW(torrent::sap_from_v4mapped(sin_bc), torrent::inter=
nal_error);
-+  CPPUNIT_ASSERT_THROW(torrent::sap_from_v4mapped(sin_1), torrent::intern=
al_error);
-+}
-+
-+void
-+test_socket_address::test_sa_to_v4mapped() {
-+  TEST_DEFAULT_SA;
-+
-+  CPPUNIT_ASSERT(torrent::sap_equal_addr(torrent::sap_to_v4mapped(sin_any=
), sin6_v4_any));
-+  CPPUNIT_ASSERT(torrent::sap_is_v4mapped(torrent::sap_to_v4mapped(sin_an=
y)));
-+  CPPUNIT_ASSERT(torrent::sap_is_port_any(torrent::sap_to_v4mapped(sin_an=
y)));
-+
-+  CPPUNIT_ASSERT(torrent::sap_equal_addr(torrent::sap_to_v4mapped(sin_bc)=
, sin6_v4_bc));
-+  CPPUNIT_ASSERT(torrent::sap_is_v4mapped(torrent::sap_to_v4mapped(sin_bc=
)));
-+  CPPUNIT_ASSERT(torrent::sap_is_port_any(torrent::sap_to_v4mapped(sin_bc=
)));
-+
-+  CPPUNIT_ASSERT(torrent::sap_equal_addr(torrent::sap_to_v4mapped(sin_1),=
 sin6_v4_1));
-+  CPPUNIT_ASSERT(torrent::sap_is_v4mapped(torrent::sap_to_v4mapped(sin_1)=
));
-+  CPPUNIT_ASSERT(torrent::sap_is_port_any(torrent::sap_to_v4mapped(sin_1)=
));
-+
-+  CPPUNIT_ASSERT_THROW(torrent::sap_to_v4mapped(torrent::sa_make_unspec()=
), torrent::internal_error);
-+  CPPUNIT_ASSERT_THROW(torrent::sap_to_v4mapped(torrent::sa_make_inet6())=
, torrent::internal_error);
-+  CPPUNIT_ASSERT_THROW(torrent::sap_to_v4mapped(torrent::sa_make_unix("")=
), torrent::internal_error);
-+  CPPUNIT_ASSERT_THROW(torrent::sap_to_v4mapped(sin6_any), torrent::inter=
nal_error);
-+  CPPUNIT_ASSERT_THROW(torrent::sap_to_v4mapped(sin6_1), torrent::interna=
l_error);
-+  CPPUNIT_ASSERT_THROW(torrent::sap_to_v4mapped(sin6_v4_any), torrent::in=
ternal_error);
-+  CPPUNIT_ASSERT_THROW(torrent::sap_to_v4mapped(sin6_v4_bc), torrent::int=
ernal_error);
-+  CPPUNIT_ASSERT_THROW(torrent::sap_to_v4mapped(sin6_v4_1), torrent::inte=
rnal_error);
-+}
-diff --git a/test/torrent/net/test_socket_address.h b/test/torrent/net/tes=
t_socket_address.h
-new file mode 100644
-index 00000000..6157f366
---- /dev/null
-+++ b/test/torrent/net/test_socket_address.h
-@@ -0,0 +1,43 @@
-+#include <cppunit/extensions/HelperMacros.h>
-+
-+class test_socket_address : public CppUnit::TestFixture {
-+  CPPUNIT_TEST_SUITE(test_socket_address);
-+
-+  CPPUNIT_TEST(test_sa_is_any);
-+  CPPUNIT_TEST(test_sa_is_broadcast);
-+
-+  CPPUNIT_TEST(test_make);
-+
-+  CPPUNIT_TEST(test_sin_from_sa);
-+  CPPUNIT_TEST(test_sin6_from_sa);
-+
-+  CPPUNIT_TEST(test_sa_equal);
-+  CPPUNIT_TEST(test_sa_equal_addr);
-+  CPPUNIT_TEST(test_sa_copy);
-+  CPPUNIT_TEST(test_sa_copy_addr);
-+
-+  CPPUNIT_TEST(test_sa_from_v4mapped);
-+  CPPUNIT_TEST(test_sa_to_v4mapped);
-+
-+  CPPUNIT_TEST_SUITE_END();
-+
-+public:
-+  void setUp() {}
-+  void tearDown() {}
-+
-+  void test_sa_is_any();
-+  void test_sa_is_broadcast();
-+
-+  void test_make();
-+
-+  void test_sin_from_sa();
-+  void test_sin6_from_sa();
-+
-+  void test_sa_equal();
-+  void test_sa_equal_addr();
-+  void test_sa_copy();
-+  void test_sa_copy_addr();
-+
-+  void test_sa_from_v4mapped();
-+  void test_sa_to_v4mapped();
-+};
-diff --git a/test/torrent/net/test_socket_address_key.cc b/test/torrent/ne=
t/test_socket_address_key.cc
-deleted file mode 100644
-index 7892e730..00000000
---- a/test/torrent/net/test_socket_address_key.cc
-+++ /dev/null
-@@ -1,87 +0,0 @@
--#include "config.h"
--
--#include lt_tr1_functional
--#include <sys/types.h>
--#include <sys/socket.h>
--
--#include "test_socket_address_key.h"
--
--#include "torrent/utils/net.h"
--#include "torrent/net/socket_address_key.h"
--
--CPPUNIT_TEST_SUITE_REGISTRATION(test_socket_address_key);
--
--// TODO: Move into a test utilities header:
--
--typedef std::function<struct addrinfo* ()> addrinfo_ftor;
--
--static torrent::socket_address_key
--test_create_valid(const char* hostname, addrinfo_ftor ftor) {
--  struct addrinfo* addr_info;
--
--  try {
--    addr_info =3D ftor();
--  } catch (torrent::address_info_error& e) {
--    CPPUNIT_ASSERT_MESSAGE("Caught address_info_error for '" + std::strin=
g(hostname) + "'", false);
--  }
--
--  CPPUNIT_ASSERT_MESSAGE("test_create_valid could not find '" + std::stri=
ng(hostname) + "'",
--                         addr_info !=3D NULL);
--
--  torrent::socket_address_key sock_key =3D torrent::socket_address_key::f=
rom_sockaddr(addr_info->ai_addr);
--
--  CPPUNIT_ASSERT_MESSAGE("test_create_valid failed to create valid socket=
_address_key for '" + std::string(hostname) + "'",
--                         sock_key.is_valid());
--
--  return sock_key;
--}
--
--static bool
--test_create_throws(const char* hostname, addrinfo_ftor ftor) {
--  try {
--    ftor();
--
--    return false;
--  } catch (torrent::address_info_error& e) {
--    return true;
--  }
--}
--
--static torrent::socket_address_key
--test_create_inet(const char* hostname) {
--  return test_create_valid(hostname, std::bind(&torrent::address_info_loo=
kup, hostname, AF_INET, 0));
--}
--
--static bool
--test_create_inet_throws(const char* hostname) {
--  return test_create_throws(hostname, std::bind(&torrent::address_info_lo=
okup, hostname, AF_INET, 0));
--}
--
--static torrent::socket_address_key
--test_create_inet6(const char* hostname) {
--  return test_create_valid(hostname, std::bind(&torrent::address_info_loo=
kup, hostname, AF_INET6, 0));
--}
--
--static bool
--test_create_inet6_throws(const char* hostname) {
--  return test_create_throws(hostname, std::bind(&torrent::address_info_lo=
okup, hostname, AF_INET6, 0));
--}
--
--//
--// Basic tests:
--//
--
--void
--test_socket_address_key::test_basic() {
--  CPPUNIT_ASSERT(test_create_inet("1.1.1.1").is_valid());
--  CPPUNIT_ASSERT(test_create_inet_throws("1.1.1.300"));
--
--  CPPUNIT_ASSERT(test_create_inet6("ff01::1").is_valid());
--  CPPUNIT_ASSERT(test_create_inet6("2001:0db8:85a3:0000:0000:8a2e:0370:73=
34").is_valid());
--  CPPUNIT_ASSERT(test_create_inet6("2001:db8:a::123").is_valid());
--
--  CPPUNIT_ASSERT(test_create_inet6_throws("2001:db8:a::22123"));
--}
--
--
--// Test lexical comparison:
-diff --git a/test/torrent/object_stream_test.cc b/test/torrent/object_stre=
am_test.cc
-index c8a17049..5ad0c23e 100644
---- a/test/torrent/object_stream_test.cc
-+++ b/test/torrent/object_stream_test.cc
-@@ -1,10 +1,8 @@
- #include "config.h"
-=20
--#define __STDC_CONSTANT_MACROS
--
- #include <iostream>
- #include <sstream>
--#include <inttypes.h>
-+#include <cinttypes>
- #include <torrent/object.h>
-=20
- #include "object_stream_test.h"
-diff --git a/test/torrent/tracker_controller_features.cc b/test/torrent/tr=
acker_controller_features.cc
-index 63f163f5..0a6a57d6 100644
---- a/test/torrent/tracker_controller_features.cc
-+++ b/test/torrent/tracker_controller_features.cc
-@@ -1,7 +1,7 @@
- #include "config.h"
-=20
-+#include <functional>
- #include <iostream>
--#include lt_tr1_functional
-=20
- #include "rak/priority_queue_default.h"
-=20
-diff --git a/test/torrent/tracker_controller_requesting.cc b/test/torrent/=
tracker_controller_requesting.cc
-index 5bc25169..92e664b3 100644
---- a/test/torrent/tracker_controller_requesting.cc
-+++ b/test/torrent/tracker_controller_requesting.cc
-@@ -1,7 +1,7 @@
- #include "config.h"
-=20
-+#include <functional>
- #include <iostream>
--#include lt_tr1_functional
-=20
- #include "rak/priority_queue_default.h"
-=20
-diff --git a/test/torrent/tracker_controller_test.cc b/test/torrent/tracke=
r_controller_test.cc
-index 823a9d34..9406c99e 100644
---- a/test/torrent/tracker_controller_test.cc
-+++ b/test/torrent/tracker_controller_test.cc
-@@ -1,7 +1,7 @@
- #include "config.h"
-=20
-+#include <functional>
- #include <iostream>
--#include lt_tr1_functional
-=20
- #include "rak/priority_queue_default.h"
-=20
-diff --git a/test/torrent/tracker_list_features_test.cc b/test/torrent/tra=
cker_list_features_test.cc
-index 57c05f40..5257b1a7 100644
---- a/test/torrent/tracker_list_features_test.cc
-+++ b/test/torrent/tracker_list_features_test.cc
-@@ -1,6 +1,6 @@
- #include "config.h"
-=20
--#include lt_tr1_functional
-+#include <functional>
-=20
- #include "torrent/http.h"
- #include "net/address_list.h"
-diff --git a/test/torrent/utils/directory_events_test.cc b/test/torrent/ut=
ils/directory_events_test.cc
-index 2cea5ab5..b97fd1d4 100644
---- a/test/torrent/utils/directory_events_test.cc
-+++ b/test/torrent/utils/directory_events_test.cc
-@@ -1,6 +1,6 @@
- #include "config.h"
-=20
--#include <tr1/functional>
-+#include <functional>
- #include <torrent/exceptions.h>
- #include <torrent/utils/directory_events.h>
-=20
-@@ -8,8 +8,6 @@
-=20
- CPPUNIT_TEST_SUITE_REGISTRATION(utils_directory_events_test);
-=20
--namespace tr1 { using namespace std::tr1; }
--
- void
- utils_directory_events_test::setUp() {
- }
-diff --git a/test/torrent/utils/log_buffer_test.h b/test/torrent/utils/log=
_buffer_test.h
-deleted file mode 100644
-index f2824594..00000000
---- a/test/torrent/utils/log_buffer_test.h
-+++ /dev/null
-@@ -1,17 +0,0 @@
--#include <cppunit/extensions/HelperMacros.h>
--
--#include "torrent/utils/log_buffer.h"
--
--class utils_log_buffer_test : public CppUnit::TestFixture {
--  CPPUNIT_TEST_SUITE(utils_log_buffer_test);
--  CPPUNIT_TEST(test_basic);
--  CPPUNIT_TEST(test_timestamps);
--  CPPUNIT_TEST_SUITE_END();
--
--public:
--  void setUp();
--  void tearDown();
--
--  void test_basic();
--  void test_timestamps();
--};
-diff --git a/test/torrent/utils/log_test.cc b/test/torrent/utils/log_test.=
cc
-index 9f975636..8cc00ef8 100644
---- a/test/torrent/utils/log_test.cc
-+++ b/test/torrent/utils/log_test.cc
-@@ -3,8 +3,9 @@
- #include <algorithm>
- #include <cstring>
- #include <fstream>
-+#include <functional>
- #include <iostream>
--#include lt_tr1_functional
-+
- #include <torrent/exceptions.h>
- #include <torrent/utils/log.h>
-=20
-@@ -37,6 +38,7 @@ void
- utils_log_test::setUp() {
-   // Don't initialize since this creates the group->child connections.
-   //  torrent::log_initialize();
-+  torrent::log_cleanup();
- }
-=20
- void
-diff --git a/test/torrent/utils/net_test.cc b/test/torrent/utils/net_test.=
cc
-deleted file mode 100644
-index d136e869..00000000
---- a/test/torrent/utils/net_test.cc
-+++ /dev/null
-@@ -1,32 +0,0 @@
--#include "config.h"
--
--#include <torrent/exceptions.h>
--#include <torrent/utils/net.h>
--
--#include "net_test.h"
--
--CPPUNIT_TEST_SUITE_REGISTRATION(utils_net_test);
--
--static void inc_value(int* value) { (*value)++; }
--
--#define LTUNIT_AI_CALL(lt_ai, lt_flags) {                               \
--  int test_value =3D 0;                                                  =
 \
--  CPPUNIT_ASSERT(torrent::address_info_call(ai, 0, std::bind(&inc_value, =
&test_value))); \
--  CPPUNIT_ASSERT(test_value); }                                         \
--
--void
--utils_net_test::setUp() {
--}
--
--void
--utils_net_test::tearDown() {
--}
--
--void
--utils_net_test::test_basic() {
--  addrinfo* ai =3D torrent::address_info_lookup("localhost", AF_INET, SOC=
K_STREAM);
--
--  LTUNIT_AI_CALL(ai, 0);
--
--  torrent::address_info_free(ai);
--}
-diff --git a/test/torrent/utils/net_test.h b/test/torrent/utils/net_test.h
-deleted file mode 100644
-index e538ab39..00000000
---- a/test/torrent/utils/net_test.h
-+++ /dev/null
-@@ -1,15 +0,0 @@
--#include <cppunit/extensions/HelperMacros.h>
--
--#include "torrent/utils/net.h"
--
--class utils_net_test : public CppUnit::TestFixture {
--  CPPUNIT_TEST_SUITE(utils_net_test);
--  CPPUNIT_TEST(test_basic);
--  CPPUNIT_TEST_SUITE_END();
--
--public:
--  void setUp();
--  void tearDown();
--
--  void test_basic();
--};
-diff --git a/test/torrent/utils/option_strings_test.cc b/test/torrent/util=
s/option_strings_test.cc
-index c6302f98..a9bdcc89 100644
---- a/test/torrent/utils/option_strings_test.cc
-+++ b/test/torrent/utils/option_strings_test.cc
-@@ -1,8 +1,9 @@
- #include "config.h"
-=20
- #include <fstream>
-+#include <functional>
- #include <iostream>
--#include lt_tr1_functional
-+
- #include <torrent/exceptions.h>
- #include <torrent/utils/option_strings.h>
-=20
-diff --git a/test/torrent/utils/test_extents.cc b/test/torrent/utils/test_=
extents.cc
-index d6b8d11d..87424d62 100644
---- a/test/torrent/utils/test_extents.cc
-+++ b/test/torrent/utils/test_extents.cc
-@@ -2,7 +2,7 @@
-=20
- #include "test_extents.h"
-=20
--#include <inttypes.h>
-+#include <cinttypes>
- #include <iostream>
- #include <torrent/utils/extents.h>
-=20
-diff --git a/test/torrent/utils/log_buffer_test.cc b/test/torrent/utils/te=
st_log_buffer.cc
-similarity index 86%
-rename from test/torrent/utils/log_buffer_test.cc
-rename to test/torrent/utils/test_log_buffer.cc
-index a0ede0a0..a56a5365 100644
---- a/test/torrent/utils/log_buffer_test.cc
-+++ b/test/torrent/utils/test_log_buffer.cc
-@@ -1,23 +1,23 @@
- #include "config.h"
-=20
--#include <torrent/utils/log_buffer.h>
-+#include "test_log_buffer.h"
-=20
- #include "globals.h"
--#include "log_buffer_test.h"
-+#include <torrent/utils/log_buffer.h>
-=20
--CPPUNIT_TEST_SUITE_REGISTRATION(utils_log_buffer_test);
-+CPPUNIT_TEST_SUITE_NAMED_REGISTRATION(test_log_buffer, "torrent/utils");
-=20
- void
--utils_log_buffer_test::setUp() {
-+test_log_buffer::setUp() {
-   torrent::cachedTime =3D rak::timer::from_seconds(1000);
- }
-=20
- void
--utils_log_buffer_test::tearDown() {
-+test_log_buffer::tearDown() {
- }
-=20
- void
--utils_log_buffer_test::test_basic() {
-+test_log_buffer::test_basic() {
-   torrent::log_buffer log;
-=20
-   log.lock();
-@@ -44,7 +44,7 @@ utils_log_buffer_test::test_basic() {
- }
-=20
- void
--utils_log_buffer_test::test_timestamps() {
-+test_log_buffer::test_timestamps() {
-   torrent::log_buffer log;
-=20
-   log.lock_and_push_log("foobar", 6, 0);
-diff --git a/test/torrent/utils/test_log_buffer.h b/test/torrent/utils/tes=
t_log_buffer.h
-new file mode 100644
-index 00000000..290df4c1
---- /dev/null
-+++ b/test/torrent/utils/test_log_buffer.h
-@@ -0,0 +1,17 @@
-+#include "helpers/test_fixture.h"
-+
-+class test_log_buffer : public test_fixture {
-+  CPPUNIT_TEST_SUITE(test_log_buffer);
-+
-+  CPPUNIT_TEST(test_basic);
-+  CPPUNIT_TEST(test_timestamps);
-+
-+  CPPUNIT_TEST_SUITE_END();
-+
-+public:
-+  void setUp();
-+  void tearDown();
-+
-+  void test_basic();
-+  void test_timestamps();
-+};
-diff --git a/test/torrent/utils/test_uri_parser.cc b/test/torrent/utils/te=
st_uri_parser.cc
-index c3b46eef..1f4bebe8 100644
---- a/test/torrent/utils/test_uri_parser.cc
-+++ b/test/torrent/utils/test_uri_parser.cc
-@@ -2,7 +2,7 @@
-=20
- #include "test_uri_parser.h"
-=20
--#include <inttypes.h>
-+#include <cinttypes>
- #include <iostream>
- #include <torrent/utils/uri_parser.h>
-=20
-diff --git a/test/torrent/utils/thread_base_test.cc b/test/torrent/utils/t=
hread_base_test.cc
-index 5cb7553f..8366c9ba 100644
---- a/test/torrent/utils/thread_base_test.cc
-+++ b/test/torrent/utils/thread_base_test.cc
-@@ -1,7 +1,8 @@
- #include "config.h"
-=20
-+#include <functional>
- #include <unistd.h>
--#include lt_tr1_functional
-+
- #include <torrent/exceptions.h>
- #include <torrent/poll_select.h>
- #include <torrent/utils/thread_base.h>
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0028-libtor=
rent.pc.in-add-Libs.Private-202.patch b/meta-oe/recipes-connectivity/libtor=
rent/libtorrent/0028-libtorrent.pc.in-add-Libs.Private-202.patch
deleted file mode 100644
index d81548ceb..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0028-libtorrent.pc=
.in-add-Libs.Private-202.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From b656a77864bd322d69522f1f9d922404066e5a7c Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 21 Oct 2019 09:32:15 +0200
-Subject: [PATCH] libtorrent.pc.in: add Libs.Private (#202)
-
-Add Libs.Private: -lz so applications that want to link statically with
-libtorrent (such as rtorrent) will know that they must link with -lz
-
-Fixes:
- - http://autobuild.buildroot.org/results/075598e1699c2ac20a4dfbcb5695bbb7=
343f9a86
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- libtorrent.pc.in | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libtorrent.pc.in b/libtorrent.pc.in
-index cf6612bc..6108f7e9 100644
---- a/libtorrent.pc.in
-+++ b/libtorrent.pc.in
-@@ -7,4 +7,5 @@ Name: libtorrent
- Description: A BitTorrent library
- Version: @VERSION@
- Libs: -L${libdir} -ltorrent
-+Libs.Private: -lz
- Cflags: -I${includedir}
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0029-Fix-fo=
r-inotify-missing-quickly-renamed-files-203.patch b/meta-oe/recipes-connect=
ivity/libtorrent/libtorrent/0029-Fix-for-inotify-missing-quickly-renamed-fi=
les-203.patch
deleted file mode 100644
index 59cf76cad..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0029-Fix-for-inoti=
fy-missing-quickly-renamed-files-203.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 7c80dc3e3a47dd996ca0554fce4f69d16761a9c9 Mon Sep 17 00:00:00 2001
-From: Tadej Obrstar <tadej.obrstar@gmail.com>
-Date: Sun, 1 Dec 2019 06:59:25 +0100
-Subject: [PATCH] Fix for inotify missing quickly renamed files (#203)
-
----
- src/torrent/utils/directory_events.cc | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/src/torrent/utils/directory_events.cc b/src/torrent/utils/dir=
ectory_events.cc
-index 5d789f4e..8dcc2a61 100644
---- a/src/torrent/utils/directory_events.cc
-+++ b/src/torrent/utils/directory_events.cc
-@@ -154,8 +154,11 @@ directory_events::event_read() {
-     wd_list::const_iterator itr =3D std::find_if(m_wd_list.begin(), m_wd_=
list.end(),
-                                                std::bind(&watch_descripto=
r::compare_desc, std::placeholders::_1, event->wd));
-=20
--    if (itr !=3D m_wd_list.end())
--      itr->slot(itr->path + event->name);
-+    if (itr !=3D m_wd_list.end()) {
-+      std::string sname(event->name);
-+      if((sname.substr(sname.find_last_of(".") ) =3D=3D ".torrent"))
-+        itr->slot(itr->path + event->name);
-+    }
-=20
-     event =3D (struct inotify_event*)(next_event);
-   }
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0030-Fix-co=
mpiler-warnings.-204.patch b/meta-oe/recipes-connectivity/libtorrent/libtor=
rent/0030-Fix-compiler-warnings.-204.patch
deleted file mode 100644
index 5b26f959f..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0030-Fix-compiler-=
warnings.-204.patch
+++ /dev/null
@@ -1,470 +0,0 @@
-From 81897862edea81e9620493c473f488d1820bcf93 Mon Sep 17 00:00:00 2001
-From: Jari Sundell <sundell.software@gmail.com>
-Date: Tue, 3 Dec 2019 21:53:48 +0900
-Subject: [PATCH] Fix compiler warnings. (#204)
-
----
- configure.ac                      |  6 ++-
- scripts/ax_execinfo.m4            | 67 +++++++++++++++++++++++++++++++
- scripts/common.m4                 | 15 -------
- scripts/rak_execinfo.m4           | 11 +++++
- src/torrent/exceptions.cc         |  4 +-
- test/Makefile.am                  | 15 ++-----
- test/helpers/expect_fd.h          |  8 ++--
- test/helpers/mock_compare.h       |  6 +--
- test/helpers/progress_listener.cc |  3 +-
- test/main.cc                      |  4 +-
- test/net/Makefile.am              | 40 ++++++++++++++++++
- test/torrent/net/Makefile.am      | 44 ++++++++++++++++++++
- test/torrent/net/test_fd.cc       | 48 +++++++++++-----------
- 13 files changed, 207 insertions(+), 64 deletions(-)
- create mode 100644 scripts/ax_execinfo.m4
- create mode 100644 scripts/rak_execinfo.m4
- create mode 100644 test/net/Makefile.am
- create mode 100644 test/torrent/net/Makefile.am
-
-diff --git a/configure.ac b/configure.ac
-index 620ca552..b6708366 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -33,6 +33,7 @@ RAK_CHECK_CXXFLAGS
- RAK_ENABLE_DEBUG
- RAK_ENABLE_EXTRA_DEBUG
- RAK_ENABLE_WERROR
-+RAK_DISABLE_BACKTRACE
-=20
- RAK_CHECK_CXX11
-=20
-@@ -57,8 +58,8 @@ TORRENT_WITH_INOTIFY
-=20
- CC_ATTRIBUTE_VISIBILITY
-=20
--AX_PTHREAD
- AX_CHECK_ZLIB
-+AX_PTHREAD
-=20
- PKG_CHECK_MODULES([CPPUNIT], [cppunit],, [no_cppunit=3D"yes"])
-=20
-@@ -74,7 +75,6 @@ AC_CHECK_FUNCS(posix_memalign)
- TORRENT_CHECK_MADVISE()
- TORRENT_CHECK_CACHELINE()
- TORRENT_CHECK_POPCOUNT()
--TORRENT_CHECK_EXECINFO()
- TORRENT_CHECK_PTHREAD_SETNAME_NP()
- TORRENT_MINCORE()
-=20
-@@ -111,4 +111,6 @@ AC_OUTPUT([
- 	src/tracker/Makefile
- 	src/utils/Makefile
-         test/Makefile
-+        test/torrent/net/Makefile
-+        test/net/Makefile
- ])
-diff --git a/scripts/ax_execinfo.m4 b/scripts/ax_execinfo.m4
-new file mode 100644
-index 00000000..0ff5fc0e
---- /dev/null
-+++ b/scripts/ax_execinfo.m4
-@@ -0,0 +1,67 @@
-+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
-+#       https://www.gnu.org/software/autoconf-archive/ax_execinfo.html
-+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
-+#
-+# SYNOPSIS
-+#
-+#   AX_EXECINFO([ACTION-IF-EXECINFO-H-IS-FOUND], [ACTION-IF-EXECINFO-H-IS=
-NOT-FOUND], [ADDITIONAL-TYPES-LIST])
-+#
-+# DESCRIPTION
-+#
-+#   Checks for execinfo.h header and if the len parameter/return type can=
 be
-+#   found from a list, also define backtrace_size_t to that type.
-+#
-+#   By default the list of types to try contains int and size_t, but shou=
ld
-+#   some yet undiscovered system use e.g. unsigned, the 3rd argument can =
be
-+#   used for extensions. I'd like to hear of further suggestions.
-+#
-+#   Executes ACTION-IF-EXECINFO-H-IS-FOUND when present and the execinfo.=
h
-+#   header is found or ACTION-IF-EXECINFO-H-IS-NOT-FOUND in case the head=
er
-+#   seems unavailable.
-+#
-+#   Also adds -lexecinfo to LIBS on BSD if needed.
-+#
-+# LICENSE
-+#
-+#   Copyright (c) 2014 Thomas Jahns <jahns@dkrz.de>
-+#
-+#   Copying and distribution of this file, with or without modification, =
are
-+#   permitted in any medium without royalty provided the copyright notice
-+#   and this notice are preserved. This file is offered as-is, without an=
y
-+#   warranty.
-+
-+#serial 2
-+
-+AC_DEFUN([AX_EXECINFO],
-+  [AC_CHECK_HEADERS([execinfo.h])
-+   AS_IF([test x"$ac_cv_header_execinfo_h" =3D xyes],
-+     [AC_CACHE_CHECK([size parameter type for backtrace()],
-+	[ax_cv_proto_backtrace_type],
-+	[AC_LANG_PUSH([C])
-+	 for ax_cv_proto_backtrace_type in size_t int m4_ifnblank([$3],[$3 ])non=
e; do
-+	   AS_IF([test "${ax_cv_proto_backtrace_type}" =3D none],
-+	     [ax_cv_proto_backtrace_type=3D ; break])
-+	   AC_COMPILE_IFELSE([AC_LANG_PROGRAM([
-+#include <execinfo.h>
-+extern
-+${ax_cv_proto_backtrace_type} backtrace(void **addrlist, ${ax_cv_proto_ba=
cktrace_type} len);
-+char **backtrace_symbols(void *const *buffer, ${ax_cv_proto_backtrace_typ=
e} size);
-+])],
-+	   [break])
-+	 done
-+	 AC_LANG_POP([C])])])
-+   AS_IF([test x${ax_cv_proto_backtrace_type} !=3D x],
-+     [AC_DEFINE_UNQUOTED([backtrace_size_t], [$ax_cv_proto_backtrace_type=
],
-+        [Defined to return type of backtrace().])])
-+   AC_SEARCH_LIBS([backtrace],[execinfo])
-+   AS_IF([test x"${ax_cv_proto_backtrace_type}" !=3D x -a x"$ac_cv_header=
_execinfo_h" =3D xyes -a x"$ac_cv_search_backtrace" !=3D xno],
-+     [AC_DEFINE([HAVE_BACKTRACE],[1],
-+        [Defined if backtrace() could be fully identified.])
-+     ]m4_ifnblank([$1],[$1
-+]),m4_ifnblank([$2],[$2
-+]))])
-+dnl
-+dnl Local Variables:
-+dnl mode: autoconf
-+dnl End:
-+dnl
-diff --git a/scripts/common.m4 b/scripts/common.m4
-index b6d051f5..55e8d66e 100644
---- a/scripts/common.m4
-+++ b/scripts/common.m4
-@@ -150,21 +150,6 @@ dnl   Need to fix this so that it uses the stuff defi=
ned by the system.
-   ])
- ])
-=20
--AC_DEFUN([TORRENT_CHECK_EXECINFO], [
--  AC_MSG_CHECKING(for execinfo.h)
--
--  AC_COMPILE_IFELSE([AC_LANG_SOURCE([
--      #include <execinfo.h>
--      int main() { backtrace((void**)0, 0); backtrace_symbols((char**)0, =
0); return 0;}
--      ])],
--    [
--      AC_MSG_RESULT(yes)
--      AC_DEFINE(USE_EXECINFO, 1, Use execinfo.h)
--    ], [
--      AC_MSG_RESULT(no)
--  ])
--])
--
- AC_DEFUN([TORRENT_CHECK_ALIGNED], [
-   AC_MSG_CHECKING(the byte alignment)
-=20
-diff --git a/scripts/rak_execinfo.m4 b/scripts/rak_execinfo.m4
-new file mode 100644
-index 00000000..c1d9b2f8
---- /dev/null
-+++ b/scripts/rak_execinfo.m4
-@@ -0,0 +1,11 @@
-+AC_DEFUN([RAK_DISABLE_BACKTRACE], [
-+  AC_ARG_ENABLE(backtrace,
-+    AC_HELP_STRING([--disable-backtrace], [disable backtrace information =
[[default=3Dno]]]),
-+    [
-+        if test "$enableval" =3D "yes"; then
-+            AX_EXECINFO
-+        fi
-+    ],[
-+        AX_EXECINFO
-+    ])
-+])
-diff --git a/src/torrent/exceptions.cc b/src/torrent/exceptions.cc
-index 2aeca1d7..f834f9fa 100644
---- a/src/torrent/exceptions.cc
-+++ b/src/torrent/exceptions.cc
-@@ -42,7 +42,7 @@
- #include <sstream>
- #include <unistd.h>
-=20
--#ifdef USE_EXECINFO
-+#ifdef HAVE_BACKTRACE
- #include <execinfo.h>
- #endif
-=20
-@@ -75,7 +75,7 @@ internal_error::initialize(const std::string& msg) {
-=20
-   std::stringstream output;
-=20
--#ifdef USE_EXECINFO
-+#ifdef HAVE_BACKTRACE
-   void* stackPtrs[20];
-=20
-   // Print the stack and exit.
-diff --git a/test/Makefile.am b/test/Makefile.am
-index b60a86a6..23b260e4 100644
---- a/test/Makefile.am
-+++ b/test/Makefile.am
-@@ -1,3 +1,5 @@
-+SUBDIRS =3D torrent/net net
-+
- TESTS =3D LibTorrentTest
- AUTOMAKE_OPTIONS =3D subdir-objects
-=20
-@@ -43,19 +45,9 @@ LibTorrentTest_SOURCES =3D \
- 	data/hash_queue_test.cc \
- 	data/hash_queue_test.h \
- 	\
--	net/test_socket_listen.cc \
--	net/test_socket_listen.h \
--	\
- 	protocol/test_request_list.cc \
- 	protocol/test_request_list.h \
- 	\
--	torrent/net/test_address_info.cc \
--	torrent/net/test_address_info.h \
--	torrent/net/test_fd.cc \
--	torrent/net/test_fd.h \
--	torrent/net/test_socket_address.cc \
--	torrent/net/test_socket_address.h \
--	\
- 	torrent/utils/log_test.cc \
- 	torrent/utils/log_test.h \
- 	torrent/utils/option_strings_test.cc \
-@@ -97,9 +89,10 @@ LibTorrentTest_SOURCES =3D \
- 	torrent/tracker_timeout_test.h \
- 	tracker/tracker_http_test.cc \
- 	tracker/tracker_http_test.h \
-+	\
- 	main.cc
-=20
- LibTorrentTest_CXXFLAGS =3D $(CPPUNIT_CFLAGS)
--LibTorrentTest_LDFLAGS =3D $(CPPUNIT_LIBS)  -ldl
-+LibTorrentTest_LDFLAGS =3D $(CPPUNIT_LIBS) -ldl
-=20
- AM_CPPFLAGS =3D -I$(srcdir) -I$(top_srcdir) -I$(top_srcdir)/src
-diff --git a/test/helpers/expect_fd.h b/test/helpers/expect_fd.h
-index 178cbabc..cc77c34a 100644
---- a/test/helpers/expect_fd.h
-+++ b/test/helpers/expect_fd.h
-@@ -18,15 +18,15 @@ sap_cache_copy_addr_c_ptr(sap_cache_type& sap_cache, c=
onst torrent::c_sa_unique_
-=20
- inline void
- expect_event_open_re(int idx) {
--  mock_expect(&torrent::poll_event_open, mock_compare_map<torrent::Event>=
::begin_pointer + idx);
--  mock_expect(&torrent::poll_event_insert_read, mock_compare_map<torrent:=
:Event>::begin_pointer + idx);
--  mock_expect(&torrent::poll_event_insert_error, mock_compare_map<torrent=
::Event>::begin_pointer + idx);
-+  mock_expect(&torrent::poll_event_open, mock_compare_map<torrent::Event>=
::begin_pointer() + idx);
-+  mock_expect(&torrent::poll_event_insert_read, mock_compare_map<torrent:=
:Event>::begin_pointer() + idx);
-+  mock_expect(&torrent::poll_event_insert_error, mock_compare_map<torrent=
::Event>::begin_pointer() + idx);
- }
-=20
- inline void
- expect_event_closed_fd(int idx, int fd) {
-   mock_expect(&torrent::fd__close, 0, fd);
--  mock_expect(&torrent::poll_event_closed, mock_compare_map<torrent::Even=
t>::begin_pointer + idx);
-+  mock_expect(&torrent::poll_event_closed, mock_compare_map<torrent::Even=
t>::begin_pointer() + idx);
- }
-=20
- inline void
-diff --git a/test/helpers/mock_compare.h b/test/helpers/mock_compare.h
-index 3ea90305..3cc8d075 100644
---- a/test/helpers/mock_compare.h
-+++ b/test/helpers/mock_compare.h
-@@ -34,11 +34,11 @@ template <typename T>
- struct mock_compare_map {
-   typedef std::map<const T*, const T*> values_type;
-=20
--  constexpr static T* begin_pointer =3D reinterpret_cast<T*>(0x1000);
--  constexpr static T* end_pointer =3D reinterpret_cast<T*>(0x2000);
-+  static T* begin_pointer() { return reinterpret_cast<T*>(0x1000); }
-+  static T* end_pointer() { return reinterpret_cast<T*>(0x2000); }
-=20
-   static bool is_key(const T* k) {
--    return k >=3D begin_pointer && k < end_pointer;
-+    return k >=3D begin_pointer() && k < end_pointer();
-   }
-=20
-   static bool has_key(const T* k) {
-diff --git a/test/helpers/progress_listener.cc b/test/helpers/progress_lis=
tener.cc
-index 02803ffc..c2b60bcd 100644
---- a/test/helpers/progress_listener.cc
-+++ b/test/helpers/progress_listener.cc
-@@ -54,7 +54,8 @@ void
- progress_listener::startSuite(CppUnit::Test *suite) {
-   m_test_path.push_back(suite);
-=20
--  std::cout << std::endl << get_test_path(m_test_path) << suite->getName(=
) << ":" << std::endl;
-+  if (suite->countTestCases() > 0)
-+    std::cout << std::endl << get_test_path(m_test_path) << suite->getNam=
e() << ":" << std::endl;
- }
-=20
- void
-diff --git a/test/main.cc b/test/main.cc
-index da93fead..e8a00e1f 100644
---- a/test/main.cc
-+++ b/test/main.cc
-@@ -12,7 +12,7 @@
- #include <cppunit/extensions/TestFactoryRegistry.h>
- #include <cppunit/ui/text/TestRunner.h>
-=20
--#ifdef USE_EXECINFO
-+#ifdef HAVE_BACKTRACE
- #include <execinfo.h>
- #endif
-=20
-@@ -29,7 +29,7 @@ do_test_panic(int signum) {
-=20
-   std::cout << std::endl << std::endl << "Caught " << strsignal(signum) <=
< ", dumping stack:" << std::endl << std::endl;
-  =20
--#ifdef USE_EXECINFO
-+#ifdef HAVE_BACKTRACE
-   void* stackPtrs[20];
-=20
-   // Print the stack and exit.
-diff --git a/test/net/Makefile.am b/test/net/Makefile.am
-new file mode 100644
-index 00000000..bb951814
---- /dev/null
-+++ b/test/net/Makefile.am
-@@ -0,0 +1,40 @@
-+TESTS =3D LibTorrentTestNet
-+AUTOMAKE_OPTIONS =3D subdir-objects
-+
-+check_PROGRAMS =3D $(TESTS)
-+LibTorrentTestNet_LDADD =3D \
-+	../../src/libtorrent.la \
-+	../../src/torrent/libsub_torrent.la \
-+	../../src/torrent/data/libsub_torrentdata.la \
-+	../../src/torrent/download/libsub_torrentdownload.la \
-+	../../src/torrent/peer/libsub_torrentpeer.la \
-+	../../src/data/libsub_data.la \
-+	../../src/dht/libsub_dht.la \
-+	../../src/net/libsub_net.la \
-+	../../src/protocol/libsub_protocol.la \
-+	../../src/download/libsub_download.la \
-+	../../src/tracker/libsub_tracker.la \
-+	../../src/utils/libsub_utils.la \
-+	../../src/torrent/utils/libsub_torrentutils.la
-+
-+LibTorrentTestNet_SOURCES =3D \
-+	../helpers/expect_fd.h \
-+	../helpers/expect_utils.h \
-+	../helpers/mock_compare.h \
-+	../helpers/mock_function.cc \
-+	../helpers/mock_function.h \
-+	../helpers/network.h \
-+	../helpers/progress_listener.cc \
-+	../helpers/progress_listener.h \
-+	../helpers/test_fixture.cc \
-+	../helpers/test_fixture.h \
-+	\
-+	test_socket_listen.cc \
-+	test_socket_listen.h \
-+	\
-+	../main.cc
-+
-+LibTorrentTestNet_CXXFLAGS =3D $(CPPUNIT_CFLAGS)
-+LibTorrentTestNet_LDFLAGS =3D $(CPPUNIT_LIBS) -ldl
-+
-+AM_CPPFLAGS =3D -I$(top_srcdir) -I$(top_srcdir)/src -I$(top_srcdir)/test
-diff --git a/test/torrent/net/Makefile.am b/test/torrent/net/Makefile.am
-new file mode 100644
-index 00000000..8a531cc1
---- /dev/null
-+++ b/test/torrent/net/Makefile.am
-@@ -0,0 +1,44 @@
-+TESTS =3D LibTorrentTestTorrentNet
-+AUTOMAKE_OPTIONS =3D subdir-objects
-+
-+check_PROGRAMS =3D $(TESTS)
-+LibTorrentTestTorrentNet_LDADD =3D \
-+	../../../src/libtorrent.la \
-+	../../../src/torrent/libsub_torrent.la \
-+	../../../src/torrent/data/libsub_torrentdata.la \
-+	../../../src/torrent/download/libsub_torrentdownload.la \
-+	../../../src/torrent/peer/libsub_torrentpeer.la \
-+	../../../src/data/libsub_data.la \
-+	../../../src/dht/libsub_dht.la \
-+	../../../src/net/libsub_net.la \
-+	../../../src/protocol/libsub_protocol.la \
-+	../../../src/download/libsub_download.la \
-+	../../../src/tracker/libsub_tracker.la \
-+	../../../src/utils/libsub_utils.la \
-+	../../../src/torrent/utils/libsub_torrentutils.la
-+
-+LibTorrentTestTorrentNet_SOURCES =3D \
-+	../../helpers/expect_fd.h \
-+	../../helpers/expect_utils.h \
-+	../../helpers/mock_compare.h \
-+	../../helpers/mock_function.cc \
-+	../../helpers/mock_function.h \
-+	../../helpers/network.h \
-+	../../helpers/progress_listener.cc \
-+	../../helpers/progress_listener.h \
-+	../../helpers/test_fixture.cc \
-+	../../helpers/test_fixture.h \
-+	\
-+	test_address_info.cc \
-+	test_address_info.h \
-+	test_fd.cc \
-+	test_fd.h \
-+	test_socket_address.cc \
-+	test_socket_address.h \
-+	\
-+	../../main.cc
-+
-+LibTorrentTestTorrentNet_CXXFLAGS =3D $(CPPUNIT_CFLAGS)
-+LibTorrentTestTorrentNet_LDFLAGS =3D $(CPPUNIT_LIBS) -ldl
-+
-+AM_CPPFLAGS =3D -I$(top_srcdir) -I$(top_srcdir)/src -I$(top_srcdir)/test
-diff --git a/test/torrent/net/test_fd.cc b/test/torrent/net/test_fd.cc
-index 3cab0c5e..5e56f0f3 100644
---- a/test/torrent/net/test_fd.cc
-+++ b/test/torrent/net/test_fd.cc
-@@ -1,24 +1,24 @@
--#include "config.h"
--
--#include "test_fd.h"
--
--#include <torrent/net/fd.h>
--
--CPPUNIT_TEST_SUITE_NAMED_REGISTRATION(test_fd, "torrent/net");
--
--void
--test_fd::test_valid_flags() {
--  CPPUNIT_ASSERT(torrent::fd_valid_flags(torrent::fd_flag_stream));
--  CPPUNIT_ASSERT(torrent::fd_valid_flags(torrent::fd_flag_stream | torren=
t::fd_flag_nonblock));
--  CPPUNIT_ASSERT(torrent::fd_valid_flags(torrent::fd_flag_stream | torren=
t::fd_flag_reuse_address));
--  CPPUNIT_ASSERT(torrent::fd_valid_flags(torrent::fd_flag_stream | torren=
t::fd_flag_v4only));
--  CPPUNIT_ASSERT(torrent::fd_valid_flags(torrent::fd_flag_stream | torren=
t::fd_flag_v6only));
--
--  CPPUNIT_ASSERT(!torrent::fd_valid_flags(torrent::fd_flag_v4only | torre=
nt::fd_flag_v6only));
--  CPPUNIT_ASSERT(!torrent::fd_valid_flags(torrent::fd_flag_stream | torre=
nt::fd_flag_v4only | torrent::fd_flag_v6only));
--
--  CPPUNIT_ASSERT(!torrent::fd_valid_flags(torrent::fd_flags()));
--  CPPUNIT_ASSERT(!torrent::fd_valid_flags(torrent::fd_flags(~torrent::fd_=
flag_all)));
--  CPPUNIT_ASSERT(!torrent::fd_valid_flags(torrent::fd_flags(torrent::fd_f=
lag_stream | ~torrent::fd_flag_all)));
--  CPPUNIT_ASSERT(!torrent::fd_valid_flags(torrent::fd_flags(0x3245132)));
--}
-+#include "config.h"
-+
-+#include "test_fd.h"
-+
-+#include <torrent/net/fd.h>
-+
-+CPPUNIT_TEST_SUITE_NAMED_REGISTRATION(test_fd, "torrent/net");
-+
-+void
-+test_fd::test_valid_flags() {
-+  CPPUNIT_ASSERT(torrent::fd_valid_flags(torrent::fd_flag_stream));
-+  CPPUNIT_ASSERT(torrent::fd_valid_flags(torrent::fd_flag_stream | torren=
t::fd_flag_nonblock));
-+  CPPUNIT_ASSERT(torrent::fd_valid_flags(torrent::fd_flag_stream | torren=
t::fd_flag_reuse_address));
-+  CPPUNIT_ASSERT(torrent::fd_valid_flags(torrent::fd_flag_stream | torren=
t::fd_flag_v4only));
-+  CPPUNIT_ASSERT(torrent::fd_valid_flags(torrent::fd_flag_stream | torren=
t::fd_flag_v6only));
-+
-+  CPPUNIT_ASSERT(!torrent::fd_valid_flags(torrent::fd_flag_v4only | torre=
nt::fd_flag_v6only));
-+  CPPUNIT_ASSERT(!torrent::fd_valid_flags(torrent::fd_flag_stream | torre=
nt::fd_flag_v4only | torrent::fd_flag_v6only));
-+
-+  CPPUNIT_ASSERT(!torrent::fd_valid_flags(torrent::fd_flags()));
-+  CPPUNIT_ASSERT(!torrent::fd_valid_flags(torrent::fd_flags(~torrent::fd_=
flag_all)));
-+  CPPUNIT_ASSERT(!torrent::fd_valid_flags(torrent::fd_flags(torrent::fd_f=
lag_stream | ~torrent::fd_flag_all)));
-+  CPPUNIT_ASSERT(!torrent::fd_valid_flags(torrent::fd_flags(0x3245132)));
-+}
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0031-Fix-lo=
g-format-so-GCC-can-check-it.-205.patch b/meta-oe/recipes-connectivity/libt=
orrent/libtorrent/0031-Fix-log-format-so-GCC-can-check-it.-205.patch
deleted file mode 100644
index 0ecc0cfe5..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0031-Fix-log-forma=
t-so-GCC-can-check-it.-205.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From e813c344b1e4aa89288febb2f59109972083f1bb Mon Sep 17 00:00:00 2001
-From: Rosen Penev <rosenp@gmail.com>
-Date: Thu, 5 Dec 2019 01:55:53 -0800
-Subject: [PATCH] Fix log format so GCC can check it. (#205)
-
----
- src/torrent/utils/log.cc | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/torrent/utils/log.cc b/src/torrent/utils/log.cc
-index b855a2c6..24932996 100644
---- a/src/torrent/utils/log.cc
-+++ b/src/torrent/utils/log.cc
-@@ -16,6 +16,8 @@
- #include <functional>
- #include <memory>
-=20
-+#define GROUPFMT (group >=3D LOG_NON_CASCADING) ? ("%" PRIi32 " ") : ("%"=
 PRIi32 " %c ")
-+
- namespace torrent {
-=20
- struct log_cache_entry {
-@@ -356,9 +358,7 @@ log_gz_file_write(std::shared_ptr<log_gz_output>& outf=
ile, const char* data, siz
-=20
-   // Normal groups are nul-terminated strings.
-   if (group >=3D 0) {
--    const char* fmt =3D (group >=3D LOG_NON_CASCADING) ? ("%" PRIi32 " ")=
 : ("%" PRIi32 " %c ");
--
--    int buffer_length =3D snprintf(buffer, 64, fmt,
-+    int buffer_length =3D snprintf(buffer, 64, GROUPFMT,
-                                  cachedTime.seconds(),
-                                  log_level_char[group % 6]);
-    =20
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0032-Consol=
idate-make-script-to-optimize-build.-206.patch b/meta-oe/recipes-connectivi=
ty/libtorrent/libtorrent/0032-Consolidate-make-script-to-optimize-build.-20=
6.patch
deleted file mode 100644
index fa5cb294c..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0032-Consolidate-m=
ake-script-to-optimize-build.-206.patch
+++ /dev/null
@@ -1,843 +0,0 @@
-From 7b85e112ac2f59a39afa344148a946553c776142 Mon Sep 17 00:00:00 2001
-From: Jari Sundell <sundell.software@gmail.com>
-Date: Fri, 6 Dec 2019 00:35:21 +0900
-Subject: [PATCH] Consolidate make script to optimize build. (#206)
-
----
- configure.ac                     |  14 +--
- src/Makefile.am                  | 147 ++++++++++++++++++++++++-----
- src/data/Makefile.am             |  28 ------
- src/dht/Makefile.am              |  18 ----
- src/download/Makefile.am         |  19 ----
- src/net/Makefile.am              |  30 ------
- src/protocol/Makefile.am         |  28 ------
- src/torrent/Makefile.am          | 154 ++++++++++++++++++++++++++++---
- src/torrent/download/Makefile.am |  22 -----
- src/torrent/net/Makefile.am      |  25 -----
- src/torrent/peer/Makefile.am     |  28 ------
- src/torrent/utils/Makefile.am    |  41 --------
- src/tracker/Makefile.am          |  11 ---
- src/utils/Makefile.am            |  14 ---
- test/Makefile.am                 |  92 +++++++++++++-----
- 15 files changed, 338 insertions(+), 333 deletions(-)
- delete mode 100644 src/data/Makefile.am
- delete mode 100644 src/dht/Makefile.am
- delete mode 100644 src/download/Makefile.am
- delete mode 100644 src/net/Makefile.am
- delete mode 100644 src/protocol/Makefile.am
- delete mode 100644 src/torrent/download/Makefile.am
- delete mode 100644 src/torrent/net/Makefile.am
- delete mode 100644 src/torrent/peer/Makefile.am
- delete mode 100644 src/torrent/utils/Makefile.am
- delete mode 100644 src/tracker/Makefile.am
- delete mode 100644 src/utils/Makefile.am
-
-diff --git a/configure.ac b/configure.ac
-index b6708366..e83710cc 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -17,7 +17,7 @@ AC_SUBST(LIBTORRENT_CURRENT)
- AC_SUBST(LIBTORRENT_INTERFACE_VERSION_INFO)
- AC_SUBST(LIBTORRENT_INTERFACE_VERSION_NO)
-=20
--AM_INIT_AUTOMAKE([serial-tests])
-+AM_INIT_AUTOMAKE([serial-tests subdir-objects])
- AC_CONFIG_HEADERS(config.h)
-=20
- AC_PROG_CXX
-@@ -98,18 +98,6 @@ AC_OUTPUT([
- 	Makefile
- 	src/Makefile
- 	src/torrent/Makefile
--	src/torrent/data/Makefile
--	src/torrent/download/Makefile
--	src/torrent/net/Makefile
--	src/torrent/peer/Makefile
--	src/torrent/utils/Makefile
--	src/data/Makefile
--	src/dht/Makefile
--	src/download/Makefile
--	src/net/Makefile
--	src/protocol/Makefile
--	src/tracker/Makefile
--	src/utils/Makefile
-         test/Makefile
-         test/torrent/net/Makefile
-         test/net/Makefile
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 99aaace0..e96bd74b 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -1,30 +1,12 @@
--SUBDIRS =3D \
--	torrent \
--	data \
--	dht \
--	download \
--	net \
--	protocol \
--	tracker \
--	utils
-+SUBDIRS =3D torrent
-=20
- lib_LTLIBRARIES =3D libtorrent.la
-+noinst_LTLIBRARIES =3D libtorrent_other.la
-=20
- libtorrent_la_LDFLAGS =3D -version-info $(LIBTORRENT_INTERFACE_VERSION_IN=
FO)
- libtorrent_la_LIBADD =3D \
--	torrent/libsub_torrent.la \
--	torrent/data/libsub_torrentdata.la \
--	torrent/download/libsub_torrentdownload.la \
--	torrent/net/libsub_torrentnet.la \
--	torrent/peer/libsub_torrentpeer.la \
--	torrent/utils/libsub_torrentutils.la \
--	data/libsub_data.la \
--	dht/libsub_dht.la \
--	download/libsub_download.la \
--	net/libsub_net.la \
--	protocol/libsub_protocol.la \
--	tracker/libsub_tracker.la \
--	utils/libsub_utils.la
-+	torrent/libtorrent_torrent.la \
-+	libtorrent_other.la
-=20
- libtorrent_la_SOURCES =3D \
- 	globals.cc \
-@@ -36,4 +18,125 @@ libtorrent_la_SOURCES =3D \
- 	thread_main.cc \
- 	thread_main.h
-=20
-+libtorrent_other_la_SOURCES =3D \
-+	data/chunk.cc \
-+	data/chunk.h \
-+	data/chunk_handle.h \
-+	data/chunk_iterator.h \
-+	data/chunk_list.cc \
-+	data/chunk_list.h \
-+	data/chunk_list_node.h \
-+	data/chunk_part.cc \
-+	data/chunk_part.h \
-+	data/hash_check_queue.cc \
-+	data/hash_check_queue.h \
-+	data/hash_chunk.cc \
-+	data/hash_chunk.h \
-+	data/hash_queue.cc \
-+	data/hash_queue.h \
-+	data/hash_queue_node.cc \
-+	data/hash_queue_node.h \
-+	data/hash_torrent.cc \
-+	data/hash_torrent.h \
-+	data/memory_chunk.cc \
-+	data/memory_chunk.h \
-+	data/socket_file.cc \
-+	data/socket_file.h \
-+	\
-+	dht/dht_bucket.cc \
-+	dht/dht_bucket.h \
-+	dht/dht_hash_map.h \
-+	dht/dht_node.cc \
-+	dht/dht_node.h \
-+	dht/dht_router.cc \
-+	dht/dht_router.h \
-+	dht/dht_server.cc \
-+	dht/dht_server.h \
-+	dht/dht_tracker.cc \
-+	dht/dht_tracker.h \
-+	dht/dht_transaction.cc \
-+	dht/dht_transaction.h \
-+	\
-+	download/available_list.cc \
-+	download/available_list.h \
-+	download/chunk_selector.cc \
-+	download/chunk_selector.h \
-+	download/chunk_statistics.cc \
-+	download/chunk_statistics.h \
-+	download/delegator.cc \
-+	download/delegator.h \
-+	download/download_constructor.cc \
-+	download/download_constructor.h \
-+	download/download_main.cc \
-+	download/download_main.h \
-+	download/download_wrapper.cc \
-+	download/download_wrapper.h \
-+	\
-+	net/address_list.cc \
-+	net/address_list.h \
-+	net/data_buffer.h \
-+	net/local_addr.cc \
-+	net/local_addr.h \
-+	net/listen.cc \
-+	net/listen.h \
-+	net/protocol_buffer.h \
-+	net/socket_base.cc \
-+	net/socket_base.h \
-+	net/socket_datagram.cc \
-+	net/socket_datagram.h \
-+	net/socket_fd.cc \
-+	net/socket_fd.h \
-+	net/socket_listen.cc \
-+	net/socket_listen.h \
-+	net/socket_set.cc \
-+	net/socket_set.h \
-+	net/socket_stream.cc \
-+	net/socket_stream.h \
-+	net/throttle_internal.cc \
-+	net/throttle_internal.h \
-+	net/throttle_list.cc \
-+	net/throttle_list.h \
-+	net/throttle_node.h \
-+	\
-+	protocol/encryption_info.h \
-+	protocol/extensions.cc \
-+	protocol/extensions.h \
-+	protocol/handshake.cc \
-+	protocol/handshake.h \
-+	protocol/handshake_encryption.cc \
-+	protocol/handshake_encryption.h \
-+	protocol/handshake_manager.cc \
-+	protocol/handshake_manager.h \
-+	protocol/initial_seed.cc \
-+	protocol/initial_seed.h \
-+	protocol/peer_chunks.h \
-+	protocol/peer_connection_base.cc \
-+	protocol/peer_connection_base.h \
-+	protocol/peer_connection_leech.cc \
-+	protocol/peer_connection_leech.h \
-+	protocol/peer_connection_metadata.cc \
-+	protocol/peer_connection_metadata.h \
-+	protocol/peer_factory.cc \
-+	protocol/peer_factory.h \
-+	protocol/protocol_base.h \
-+	protocol/request_list.cc \
-+	protocol/request_list.h \
-+	\
-+	tracker/tracker_dht.cc \
-+	tracker/tracker_dht.h \
-+	tracker/tracker_http.cc \
-+	tracker/tracker_http.h \
-+	tracker/tracker_udp.cc \
-+	tracker/tracker_udp.h \
-+	\
-+	utils/diffie_hellman.cc \
-+	utils/diffie_hellman.h \
-+	utils/instrumentation.cc \
-+	utils/instrumentation.h \
-+	utils/rc4.h \
-+	utils/sha1.h \
-+	utils/sha_fast.cc \
-+	utils/sha_fast.h \
-+	utils/queue_buckets.h
-+
- AM_CPPFLAGS =3D -I$(srcdir) -I$(top_srcdir)
-diff --git a/src/data/Makefile.am b/src/data/Makefile.am
-deleted file mode 100644
-index ef41c9bd..00000000
---- a/src/data/Makefile.am
-+++ /dev/null
-@@ -1,28 +0,0 @@
--noinst_LTLIBRARIES =3D libsub_data.la
--
--libsub_data_la_SOURCES =3D \
--	chunk.cc \
--	chunk.h \
--	chunk_handle.h \
--	chunk_iterator.h \
--	chunk_list.cc \
--	chunk_list.h \
--	chunk_list_node.h \
--	chunk_part.cc \
--	chunk_part.h \
--	hash_check_queue.cc \
--	hash_check_queue.h \
--	hash_chunk.cc \
--	hash_chunk.h \
--	hash_queue.cc \
--	hash_queue.h \
--	hash_queue_node.cc \
--	hash_queue_node.h \
--	hash_torrent.cc \
--	hash_torrent.h \
--	memory_chunk.cc \
--	memory_chunk.h \
--	socket_file.cc \
--	socket_file.h
--
--AM_CPPFLAGS =3D -I$(srcdir) -I$(srcdir)/.. -I$(top_srcdir)
-diff --git a/src/dht/Makefile.am b/src/dht/Makefile.am
-deleted file mode 100644
-index a87c57bc..00000000
---- a/src/dht/Makefile.am
-+++ /dev/null
-@@ -1,18 +0,0 @@
--noinst_LTLIBRARIES =3D libsub_dht.la
--
--libsub_dht_la_SOURCES =3D \
--	dht_bucket.cc \
--	dht_bucket.h \
--	dht_hash_map.h \
--	dht_node.cc \
--	dht_node.h \
--	dht_router.cc \
--	dht_router.h \
--	dht_server.cc \
--	dht_server.h \
--	dht_tracker.cc \
--	dht_tracker.h \
--	dht_transaction.cc \
--	dht_transaction.h
--
--AM_CPPFLAGS =3D -I$(srcdir) -I$(srcdir)/.. -I$(top_srcdir)
-diff --git a/src/download/Makefile.am b/src/download/Makefile.am
-deleted file mode 100644
-index 65ceaf97..00000000
---- a/src/download/Makefile.am
-+++ /dev/null
-@@ -1,19 +0,0 @@
--noinst_LTLIBRARIES =3D libsub_download.la
--
--libsub_download_la_SOURCES =3D \
--	available_list.cc \
--	available_list.h \
--	chunk_selector.cc \
--	chunk_selector.h \
--	chunk_statistics.cc \
--	chunk_statistics.h \
--	delegator.cc \
--	delegator.h \
--	download_constructor.cc \
--	download_constructor.h \
--	download_main.cc \
--	download_main.h \
--	download_wrapper.cc \
--	download_wrapper.h
--
--AM_CPPFLAGS =3D -I$(srcdir) -I$(srcdir)/.. -I$(top_srcdir)
-diff --git a/src/net/Makefile.am b/src/net/Makefile.am
-deleted file mode 100644
-index e3a8c7e1..00000000
---- a/src/net/Makefile.am
-+++ /dev/null
-@@ -1,30 +0,0 @@
--noinst_LTLIBRARIES =3D libsub_net.la
--
--libsub_net_la_SOURCES =3D \
--	address_list.cc \
--	address_list.h \
--	data_buffer.h \
--	local_addr.cc \
--	local_addr.h \
--	listen.cc \
--	listen.h \
--	protocol_buffer.h \
--	socket_base.cc \
--        socket_base.h \
--	socket_datagram.cc \
--	socket_datagram.h \
--	socket_fd.cc \
--	socket_fd.h \
--	socket_listen.cc \
--	socket_listen.h \
--	socket_set.cc \
--	socket_set.h \
--	socket_stream.cc \
--	socket_stream.h \
--	throttle_internal.cc \
--	throttle_internal.h \
--	throttle_list.cc \
--	throttle_list.h \
--	throttle_node.h
--
--AM_CPPFLAGS =3D -I$(srcdir) -I$(srcdir)/.. -I$(top_srcdir)
-diff --git a/src/protocol/Makefile.am b/src/protocol/Makefile.am
-deleted file mode 100644
-index 2e9aba7a..00000000
---- a/src/protocol/Makefile.am
-+++ /dev/null
-@@ -1,28 +0,0 @@
--noinst_LTLIBRARIES =3D libsub_protocol.la
--
--libsub_protocol_la_SOURCES =3D \
--        encryption_info.h \
--        extensions.cc \
--        extensions.h \
--        handshake.cc \
--        handshake.h \
--	handshake_encryption.cc \
--	handshake_encryption.h \
--        handshake_manager.cc \
--        handshake_manager.h \
--	initial_seed.cc \
--	initial_seed.h \
--	peer_chunks.h \
--	peer_connection_base.cc \
--	peer_connection_base.h \
--	peer_connection_leech.cc \
--	peer_connection_leech.h \
--	peer_connection_metadata.cc \
--	peer_connection_metadata.h \
--	peer_factory.cc \
--	peer_factory.h \
--	protocol_base.h \
--	request_list.cc \
--	request_list.h
--
--AM_CPPFLAGS =3D -I$(srcdir) -I$(srcdir)/.. -I$(top_srcdir)
-diff --git a/src/torrent/Makefile.am b/src/torrent/Makefile.am
-index 8cd26ce7..30157b95 100644
---- a/src/torrent/Makefile.am
-+++ b/src/torrent/Makefile.am
-@@ -1,13 +1,89 @@
--SUBDIRS =3D \
--	data \
--	download \
--	net \
--	peer \
--	utils
-+noinst_LTLIBRARIES =3D libtorrent_torrent.la
-=20
--noinst_LTLIBRARIES =3D libsub_torrent.la
--
--libsub_torrent_la_SOURCES =3D \
-+libtorrent_torrent_la_SOURCES =3D \
-+	data/block.cc \
-+	data/block.h \
-+	data/block_failed.h \
-+	data/block_list.cc \
-+	data/block_list.h \
-+	data/block_transfer.h \
-+	data/chunk_utils.cc \
-+	data/chunk_utils.h \
-+	data/download_data.cc \
-+	data/download_data.h \
-+	data/file.cc \
-+	data/file.h \
-+	data/file_list.cc \
-+	data/file_list.h \
-+	data/file_list_iterator.cc \
-+	data/file_list_iterator.h \
-+	data/file_manager.cc \
-+	data/file_manager.h \
-+	data/file_utils.cc \
-+	data/file_utils.h \
-+	data/piece.h \
-+	data/transfer_list.cc \
-+	data/transfer_list.h \
-+\
-+	download/choke_group.cc \
-+	download/choke_group.h \
-+	download/choke_queue.cc \
-+	download/choke_queue.h \
-+	download/download_manager.cc \
-+	download/download_manager.h \
-+	download/group_entry.h \
-+	download/resource_manager.cc \
-+	download/resource_manager.h \
-+\
-+	net/address_info.cc \
-+	net/address_info.h \
-+	net/fd.cc \
-+	net/fd.h \
-+	net/socket_address.cc \
-+	net/socket_address.h \
-+	net/socket_address_key.cc \
-+	net/socket_address_key.h \
-+	net/socket_event.cc \
-+	net/socket_event.h \
-+	net/types.h \
-+\
-+	peer/choke_status.h \
-+	peer/client_info.cc \
-+	peer/client_info.h \
-+	peer/client_list.cc \
-+	peer/client_list.h \
-+	peer/connection_list.cc \
-+	peer/connection_list.h \
-+	peer/peer.cc \
-+	peer/peer.h \
-+        peer/peer_info.cc \
-+        peer/peer_info.h \
-+	peer/peer_list.cc \
-+	peer/peer_list.h \
-+\
-+	utils/directory_events.cc \
-+	utils/directory_events.h \
-+	utils/extents.h \
-+	utils/log.cc \
-+	utils/log.h \
-+	utils/log_buffer.cc \
-+	utils/log_buffer.h \
-+	utils/option_strings.cc \
-+	utils/option_strings.h \
-+	utils/random.cc \
-+	utils/random.h \
-+	utils/ranges.h \
-+	utils/resume.cc \
-+	utils/resume.h \
-+	utils/signal_bitfield.cc \
-+	utils/signal_bitfield.h \
-+	utils/thread_base.cc \
-+	utils/thread_base.h \
-+	utils/thread_interrupt.cc \
-+	utils/thread_interrupt.h \
-+	utils/uri_parser.cc \
-+	utils/uri_parser.h \
-+\
- 	bitfield.cc \
- 	bitfield.h \
- 	chunk_manager.cc \
-@@ -61,8 +137,64 @@ libsub_torrent_la_SOURCES =3D \
-=20
- AM_CPPFLAGS =3D -I$(srcdir) -I$(srcdir)/.. -I$(top_srcdir)
-=20
--libtorrentincludedir =3D $(includedir)/torrent
--libtorrentinclude_HEADERS =3D \
-+libtorrent_torrent_data_includedir =3D $(includedir)/torrent/data
-+libtorrent_torrent_data_include_HEADERS =3D \
-+	data/block.h \
-+	data/block_list.h \
-+	data/block_transfer.h \
-+	data/chunk_utils.h \
-+	data/download_data.h \
-+	data/file.h \
-+	data/file_list.h \
-+	data/file_list_iterator.h \
-+	data/file_manager.h \
-+	data/file_utils.h \
-+	data/piece.h \
-+	data/transfer_list.h
-+
-+libtorrent_torrent_download_includedir =3D $(includedir)/torrent/download
-+libtorrent_torrent_download_include_HEADERS =3D \
-+	download/choke_group.h \
-+	download/choke_queue.h \
-+	download/download_manager.h \
-+	download/group_entry.h \
-+	download/resource_manager.h
-+
-+libtorrent_torrent_net_includedir =3D $(includedir)/torrent/net
-+libtorrent_torrent_net_include_HEADERS =3D \
-+	net/address_info.h \
-+	net/fd.h \
-+	net/socket_address.h \
-+	net/socket_address_key.h \
-+	net/socket_event.h \
-+	net/types.h
-+
-+libtorrent_torrent_peer_includedir =3D $(includedir)/torrent/peer
-+libtorrent_torrent_peer_include_HEADERS =3D \
-+	peer/choke_status.h \
-+	peer/client_info.h \
-+	peer/client_list.h \
-+	peer/connection_list.h \
-+	peer/peer.h \
-+        peer/peer_info.h \
-+	peer/peer_list.h
-+
-+libtorrent_torrent_utils_includedir =3D $(includedir)/torrent/utils
-+libtorrent_torrent_utils_include_HEADERS =3D \
-+	utils/directory_events.h \
-+	utils/extents.h \
-+	utils/log.h \
-+	utils/log_buffer.h \
-+	utils/option_strings.h \
-+	utils/ranges.h \
-+	utils/resume.h \
-+	utils/signal_bitfield.h \
-+	utils/thread_base.h \
-+	utils/thread_interrupt.h \
-+	utils/uri_parser.h
-+
-+libtorrent_torrent_includedir =3D $(includedir)/torrent
-+libtorrent_torrent_include_HEADERS =3D \
- 	bitfield.h \
- 	chunk_manager.h \
- 	common.h \
-diff --git a/src/torrent/download/Makefile.am b/src/torrent/download/Makef=
ile.am
-deleted file mode 100644
-index f92c7aa4..00000000
---- a/src/torrent/download/Makefile.am
-+++ /dev/null
-@@ -1,22 +0,0 @@
--noinst_LTLIBRARIES =3D libsub_torrentdownload.la
--
--libsub_torrentdownload_la_SOURCES =3D \
--	choke_group.cc \
--	choke_group.h \
--	choke_queue.cc \
--	choke_queue.h \
--	download_manager.cc \
--	download_manager.h \
--	group_entry.h \
--	resource_manager.cc \
--	resource_manager.h
--
--AM_CPPFLAGS =3D -I$(srcdir) -I$(srcdir)/.. -I$(srcdir)/../.. -I$(top_srcd=
ir)
--
--libtorrentincludedir =3D $(includedir)/torrent/download
--libtorrentinclude_HEADERS =3D \
--	choke_group.h \
--	choke_queue.h \
--	download_manager.h \
--	group_entry.h \
--	resource_manager.h
-diff --git a/src/torrent/net/Makefile.am b/src/torrent/net/Makefile.am
-deleted file mode 100644
-index 35dd4774..00000000
---- a/src/torrent/net/Makefile.am
-+++ /dev/null
-@@ -1,25 +0,0 @@
--noinst_LTLIBRARIES =3D libsub_torrentnet.la
--
--libsub_torrentnet_la_SOURCES =3D \
--	address_info.cc \
--	address_info.h \
--	fd.cc \
--	fd.h \
--	socket_address.cc \
--	socket_address.h \
--	socket_address_key.cc \
--	socket_address_key.h \
--	socket_event.cc \
--	socket_event.h \
--	types.h
--
--AM_CPPFLAGS =3D -I$(srcdir) -I$(srcdir)/.. -I$(srcdir)/../.. -I$(top_srcd=
ir)
--
--libtorrentincludedir =3D $(includedir)/torrent/net
--libtorrentinclude_HEADERS =3D \
--	address_info.h \
--	fd.h \
--	socket_address.h \
--	socket_address_key.h \
--	socket_event.h \
--	types.h
-diff --git a/src/torrent/peer/Makefile.am b/src/torrent/peer/Makefile.am
-deleted file mode 100644
-index 1324e88a..00000000
---- a/src/torrent/peer/Makefile.am
-+++ /dev/null
-@@ -1,28 +0,0 @@
--noinst_LTLIBRARIES =3D libsub_torrentpeer.la
--
--libsub_torrentpeer_la_SOURCES =3D \
--	choke_status.h \
--	client_info.cc \
--	client_info.h \
--	client_list.cc \
--	client_list.h \
--	connection_list.cc \
--	connection_list.h \
--	peer.cc \
--	peer.h \
--        peer_info.cc \
--        peer_info.h \
--	peer_list.cc \
--	peer_list.h
--
--AM_CPPFLAGS =3D -I$(srcdir) -I$(srcdir)/.. -I$(srcdir)/../.. -I$(top_srcd=
ir)
--
--libtorrentincludedir =3D $(includedir)/torrent/peer
--libtorrentinclude_HEADERS =3D \
--	choke_status.h \
--	client_info.h \
--	client_list.h \
--	connection_list.h \
--	peer.h \
--        peer_info.h \
--	peer_list.h
-diff --git a/src/torrent/utils/Makefile.am b/src/torrent/utils/Makefile.am
-deleted file mode 100644
-index a48786c6..00000000
---- a/src/torrent/utils/Makefile.am
-+++ /dev/null
-@@ -1,41 +0,0 @@
--noinst_LTLIBRARIES =3D libsub_torrentutils.la
--
--libsub_torrentutils_la_SOURCES =3D \
--	directory_events.cc \
--	directory_events.h \
--	extents.h \
--	log.cc \
--	log.h \
--	log_buffer.cc \
--	log_buffer.h \
--	option_strings.cc \
--	option_strings.h \
--	random.cc \
--	random.h \
--	ranges.h \
--	resume.cc \
--	resume.h \
--	signal_bitfield.cc \
--	signal_bitfield.h \
--	thread_base.cc \
--	thread_base.h \
--	thread_interrupt.cc \
--	thread_interrupt.h \
--	uri_parser.cc \
--	uri_parser.h
--
--AM_CPPFLAGS =3D -I$(srcdir) -I$(srcdir)/.. -I$(srcdir)/../.. -I$(top_srcd=
ir)
--
--libtorrentincludedir =3D $(includedir)/torrent/utils
--libtorrentinclude_HEADERS =3D \
--	directory_events.h \
--	extents.h \
--	log.h \
--	log_buffer.h \
--	option_strings.h \
--	ranges.h \
--	resume.h \
--	signal_bitfield.h \
--	thread_base.h \
--	thread_interrupt.h \
--	uri_parser.h
-diff --git a/src/tracker/Makefile.am b/src/tracker/Makefile.am
-deleted file mode 100644
-index 2f1ae5cf..00000000
---- a/src/tracker/Makefile.am
-+++ /dev/null
-@@ -1,11 +0,0 @@
--noinst_LTLIBRARIES =3D libsub_tracker.la
--
--libsub_tracker_la_SOURCES =3D \
--	tracker_dht.cc \
--	tracker_dht.h \
--	tracker_http.cc \
--	tracker_http.h \
--	tracker_udp.cc \
--	tracker_udp.h
--
--AM_CPPFLAGS =3D -I$(srcdir) -I$(srcdir)/.. -I$(top_srcdir)
-diff --git a/src/utils/Makefile.am b/src/utils/Makefile.am
-deleted file mode 100644
-index 27ce359b..00000000
---- a/src/utils/Makefile.am
-+++ /dev/null
-@@ -1,14 +0,0 @@
--noinst_LTLIBRARIES =3D libsub_utils.la
--
--libsub_utils_la_SOURCES =3D \
--	diffie_hellman.cc \
--	diffie_hellman.h \
--	instrumentation.cc \
--	instrumentation.h \
--	rc4.h \
--	sha1.h \
--	sha_fast.cc \
--	sha_fast.h \
--	queue_buckets.h
--
--AM_CPPFLAGS =3D -I$(srcdir) -I$(srcdir)/.. -I$(top_srcdir)
-diff --git a/test/Makefile.am b/test/Makefile.am
-index 23b260e4..8b0291bb 100644
---- a/test/Makefile.am
-+++ b/test/Makefile.am
-@@ -1,25 +1,68 @@
--SUBDIRS =3D torrent/net net
--
--TESTS =3D LibTorrentTest
--AUTOMAKE_OPTIONS =3D subdir-objects
-+TESTS =3D \
-+	LibTorrent_Test_Torrent_Net \
-+	LibTorrent_Test_Net \
-+	LibTorrent_Test
-=20
- check_PROGRAMS =3D $(TESTS)
--LibTorrentTest_LDADD =3D \
-+
-+LibTorrent_Test_LDADD =3D \
- 	../src/libtorrent.la \
--	../src/torrent/libsub_torrent.la \
--	../src/torrent/data/libsub_torrentdata.la \
--	../src/torrent/download/libsub_torrentdownload.la \
--	../src/torrent/peer/libsub_torrentpeer.la \
--	../src/data/libsub_data.la \
--	../src/dht/libsub_dht.la \
--	../src/net/libsub_net.la \
--	../src/protocol/libsub_protocol.la \
--	../src/download/libsub_download.la \
--	../src/tracker/libsub_tracker.la \
--	../src/utils/libsub_utils.la \
--	../src/torrent/utils/libsub_torrentutils.la
-+	../src/libtorrent_other.la \
-+	../src/torrent/libtorrent_torrent.la
-+
-+LibTorrent_Test_Net_LDADD =3D $(LibTorrent_Test_LDADD)
-+LibTorrent_Test_Torrent_Net_LDADD =3D $(LibTorrent_Test_LDADD)
-+
-+# LibTorrent_Test_SOURCES =3D \
-+# 	helpers/expect_fd.h \
-+# 	helpers/expect_utils.h \
-+# 	helpers/mock_compare.h \
-+# 	helpers/mock_function.cc \
-+# 	helpers/mock_function.h \
-+# 	helpers/network.h \
-+# 	helpers/progress_listener.cc \
-+# 	helpers/progress_listener.h \
-+# 	helpers/test_fixture.cc \
-+# 	helpers/test_fixture.h
-+
-+LibTorrent_Test_Torrent_Net_SOURCES =3D \
-+	main.cc \
-+	helpers/expect_fd.h \
-+	helpers/expect_utils.h \
-+	helpers/mock_compare.h \
-+	helpers/mock_function.cc \
-+	helpers/mock_function.h \
-+	helpers/network.h \
-+	helpers/progress_listener.cc \
-+	helpers/progress_listener.h \
-+	helpers/test_fixture.cc \
-+	helpers/test_fixture.h \
-+	\
-+	torrent/net/test_address_info.cc \
-+	torrent/net/test_address_info.h \
-+	torrent/net/test_fd.cc \
-+	torrent/net/test_fd.h \
-+	torrent/net/test_socket_address.cc \
-+	torrent/net/test_socket_address.h
-=20
--LibTorrentTest_SOURCES =3D \
-+LibTorrent_Test_Net_SOURCES =3D \
-+	main.cc \
-+	helpers/expect_fd.h \
-+	helpers/expect_utils.h \
-+	helpers/mock_compare.h \
-+	helpers/mock_function.cc \
-+	helpers/mock_function.h \
-+	helpers/network.h \
-+	helpers/progress_listener.cc \
-+	helpers/progress_listener.h \
-+	helpers/test_fixture.cc \
-+	helpers/test_fixture.h \
-+	\
-+	net/test_socket_listen.cc \
-+	net/test_socket_listen.h
-+
-+LibTorrent_Test_SOURCES =3D \
-+	main.cc \
- 	helpers/expect_fd.h \
- 	helpers/expect_utils.h \
- 	helpers/mock_compare.h \
-@@ -87,12 +130,15 @@ LibTorrentTest_SOURCES =3D \
- 	torrent/tracker_list_features_test.h \
- 	torrent/tracker_timeout_test.cc \
- 	torrent/tracker_timeout_test.h \
--	tracker/tracker_http_test.cc \
--	tracker/tracker_http_test.h \
- 	\
--	main.cc
-+	tracker/tracker_http_test.cc \
-+	tracker/tracker_http_test.h
-=20
--LibTorrentTest_CXXFLAGS =3D $(CPPUNIT_CFLAGS)
--LibTorrentTest_LDFLAGS =3D $(CPPUNIT_LIBS) -ldl
-+LibTorrent_Test_Torrent_Net_CXXFLAGS =3D $(CPPUNIT_CFLAGS)
-+LibTorrent_Test_Torrent_Net_LDFLAGS =3D $(CPPUNIT_LIBS) -ldl
-+LibTorrent_Test_Net_CXXFLAGS =3D $(CPPUNIT_CFLAGS)
-+LibTorrent_Test_Net_LDFLAGS =3D $(CPPUNIT_LIBS) -ldl
-+LibTorrent_Test_CXXFLAGS =3D $(CPPUNIT_CFLAGS)
-+LibTorrent_Test_LDFLAGS =3D $(CPPUNIT_LIBS) -ldl
-=20
- AM_CPPFLAGS =3D -I$(srcdir) -I$(top_srcdir) -I$(top_srcdir)/src
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0033-Refact=
or-make-process.-207.patch b/meta-oe/recipes-connectivity/libtorrent/libtor=
rent/0033-Refactor-make-process.-207.patch
deleted file mode 100644
index 4c7a2038f..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0033-Refactor-make=
-process.-207.patch
+++ /dev/null
@@ -1,2710 +0,0 @@
-From 9cdb950c0db2bad1a4d85b48f06419e2920aa114 Mon Sep 17 00:00:00 2001
-From: Jari Sundell <sundell.software@gmail.com>
-Date: Fri, 20 Dec 2019 00:37:38 +0900
-Subject: [PATCH] Refactor make process. (#207)
-
----
- configure.ac                                  |   3 +-
- src/Makefile.am                               |   3 +-
- src/manager.h                                 |  36 ---
- src/thread_disk.h                             |  51 +---
- src/torrent/utils/thread_base.cc              |  36 ---
- src/torrent/utils/thread_base.h               |  48 +---
- test/Makefile.am                              | 140 +++++------
- ...{chunk_list_test.cc =3D> test_chunk_list.cc} |  16 +-
- .../{chunk_list_test.h =3D> test_chunk_list.h}  |  13 +-
- ...queue_test.cc =3D> test_hash_check_queue.cc} |  33 ++-
- ...k_queue_test.h =3D> test_hash_check_queue.h} |  22 +-
- ...{hash_queue_test.cc =3D> test_hash_queue.cc} |  66 +++---
- .../{hash_queue_test.h =3D> test_hash_queue.h}  |  11 +-
- test/helpers/progress_listener.cc             |   4 +-
- test/helpers/test_fixture.h                   |  28 +--
- test/helpers/test_thread.cc                   |  71 ++++++
- test/helpers/test_thread.h                    |  59 +++++
- test/helpers/test_utils.h                     |  16 ++
- test/helpers/utils.h                          | 120 +++++-----
- test/main.cc                                  |   4 +-
- test/torrent/{http_test.cc =3D> test_http.cc}   |  17 +-
- test/torrent/{http_test.h =3D> test_http.h}     |  11 +-
- test/torrent/utils/option_strings_test.h      |  17 --
- test/torrent/utils/signal_bitfield_test.h     |  23 --
- test/torrent/utils/test_extents.cc            |  63 ++---
- test/torrent/utils/test_extents.h             |   9 +-
- .../utils/{log_test.cc =3D> test_log.cc}        |  26 +-
- test/torrent/utils/{log_test.h =3D> test_log.h} |   8 +-
- test/torrent/utils/test_log_buffer.cc         |  11 +-
- test/torrent/utils/test_log_buffer.h          |   5 -
- ...strings_test.cc =3D> test_option_strings.cc} |  29 +--
- test/torrent/utils/test_option_strings.h      |  10 +
- test/torrent/utils/test_queue_buckets.cc      |  12 +-
- test/torrent/utils/test_queue_buckets.h       |  11 +-
- ...tfield_test.cc =3D> test_signal_bitfield.cc} |  31 ++-
- test/torrent/utils/test_signal_bitfield.h     |  22 ++
- test/torrent/utils/test_thread_base.cc        | 169 +++++++++++++
- test/torrent/utils/test_thread_base.h         |  25 ++
- test/torrent/utils/test_uri_parser.cc         |  31 +--
- test/torrent/utils/test_uri_parser.h          |  11 +-
- test/torrent/utils/thread_base_test.cc        | 224 ------------------
- test/torrent/utils/thread_base_test.h         |  86 -------
- test/tracker/test_tracker_http.cc             |  11 +
- test/tracker/test_tracker_http.h              |  12 +
- test/tracker/tracker_http_test.cc             |  17 --
- test/tracker/tracker_http_test.h              |  18 --
- 46 files changed, 735 insertions(+), 954 deletions(-)
- rename test/data/{chunk_list_test.cc =3D> test_chunk_list.cc} (93%)
- rename test/data/{chunk_list_test.h =3D> test_chunk_list.h} (88%)
- rename test/data/{hash_check_queue_test.cc =3D> test_hash_check_queue.cc}=
 (92%)
- rename test/data/{hash_check_queue_test.h =3D> test_hash_check_queue.h} (=
63%)
- rename test/data/{hash_queue_test.cc =3D> test_hash_queue.cc} (82%)
- rename test/data/{hash_queue_test.h =3D> test_hash_queue.h} (58%)
- create mode 100755 test/helpers/test_thread.cc
- create mode 100755 test/helpers/test_thread.h
- create mode 100644 test/helpers/test_utils.h
- rename test/torrent/{http_test.cc =3D> test_http.cc} (94%)
- rename test/torrent/{http_test.h =3D> test_http.h} (63%)
- delete mode 100644 test/torrent/utils/option_strings_test.h
- delete mode 100644 test/torrent/utils/signal_bitfield_test.h
- rename test/torrent/utils/{log_test.cc =3D> test_log.cc} (92%)
- rename test/torrent/utils/{log_test.h =3D> test_log.h} (71%)
- rename test/torrent/utils/{option_strings_test.cc =3D> test_option_string=
s.cc} (65%)
- create mode 100644 test/torrent/utils/test_option_strings.h
- rename test/torrent/utils/{signal_bitfield_test.cc =3D> test_signal_bitfi=
eld.cc} (85%)
- create mode 100644 test/torrent/utils/test_signal_bitfield.h
- create mode 100644 test/torrent/utils/test_thread_base.cc
- create mode 100644 test/torrent/utils/test_thread_base.h
- delete mode 100644 test/torrent/utils/thread_base_test.cc
- delete mode 100644 test/torrent/utils/thread_base_test.h
- create mode 100644 test/tracker/test_tracker_http.cc
- create mode 100644 test/tracker/test_tracker_http.h
- delete mode 100644 test/tracker/tracker_http_test.cc
- delete mode 100644 test/tracker/tracker_http_test.h
-
-diff --git a/configure.ac b/configure.ac
-index e83710cc..88a46edd 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -21,6 +21,7 @@ AM_INIT_AUTOMAKE([serial-tests subdir-objects])
- AC_CONFIG_HEADERS(config.h)
-=20
- AC_PROG_CXX
-+AC_SYS_LARGEFILE
-=20
- AC_C_BIGENDIAN(
-     AC_DEFINE(IS_BIG_ENDIAN, 1, Big endian),
-@@ -37,8 +38,6 @@ RAK_DISABLE_BACKTRACE
-=20
- RAK_CHECK_CXX11
-=20
--AC_SYS_LARGEFILE
--
- TORRENT_ENABLE_ALIGNED
- TORRENT_ENABLE_INTERRUPT_SOCKET
-=20
-diff --git a/src/Makefile.am b/src/Makefile.am
-index e96bd74b..95e6a7ae 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -1,7 +1,8 @@
- SUBDIRS =3D torrent
-=20
- lib_LTLIBRARIES =3D libtorrent.la
--noinst_LTLIBRARIES =3D libtorrent_other.la
-+noinst_LTLIBRARIES =3D \
-+	libtorrent_other.la
-=20
- libtorrent_la_LDFLAGS =3D -version-info $(LIBTORRENT_INTERFACE_VERSION_IN=
FO)
- libtorrent_la_LIBADD =3D \
-diff --git a/src/manager.h b/src/manager.h
-index 1db81e9b..1ada9567 100644
---- a/src/manager.h
-+++ b/src/manager.h
-@@ -1,39 +1,3 @@
--// libTorrent - BitTorrent library
--// Copyright (C) 2005-2011, Jari Sundell
--//
--// This program is free software; you can redistribute it and/or modify
--// it under the terms of the GNU General Public License as published by
--// the Free Software Foundation; either version 2 of the License, or
--// (at your option) any later version.
--//=20
--// This program is distributed in the hope that it will be useful,
--// but WITHOUT ANY WARRANTY; without even the implied warranty of
--// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--// GNU General Public License for more details.
--//=20
--// You should have received a copy of the GNU General Public License
--// along with this program; if not, write to the Free Software
--// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
--//
--// In addition, as a special exception, the copyright holders give
--// permission to link the code of portions of this program with the
--// OpenSSL library under certain conditions as described in each
--// individual source file, and distribute linked combinations
--// including the two.
--//
--// You must obey the GNU General Public License in all respects for
--// all of the code used other than OpenSSL.  If you modify file(s)
--// with this exception, you may extend this exception to your version
--// of the file(s), but you are not obligated to do so.  If you do not
--// wish to do so, delete this exception statement from your version.
--// If you delete this exception statement from all source files in the
--// program, then also delete it here.
--//
--// Contact:  Jari Sundell <jaris@ifi.uio.no>
--//
--//           Skomakerveien 33
--//           3185 Skoppum, NORWAY
--
- #ifndef LIBTORRENT_MANAGER_H
- #define LIBTORRENT_MANAGER_H
-=20
-diff --git a/src/thread_disk.h b/src/thread_disk.h
-index fa1fcb7e..7b378915 100644
---- a/src/thread_disk.h
-+++ b/src/thread_disk.h
-@@ -1,39 +1,3 @@
--// libTorrent - BitTorrent library
--// Copyright (C) 2005-2011, Jari Sundell
--//
--// This program is free software; you can redistribute it and/or modify
--// it under the terms of the GNU General Public License as published by
--// the Free Software Foundation; either version 2 of the License, or
--// (at your option) any later version.
--//=20
--// This program is distributed in the hope that it will be useful,
--// but WITHOUT ANY WARRANTY; without even the implied warranty of
--// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--// GNU General Public License for more details.
--//=20
--// You should have received a copy of the GNU General Public License
--// along with this program; if not, write to the Free Software
--// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
--//
--// In addition, as a special exception, the copyright holders give
--// permission to link the code of portions of this program with the
--// OpenSSL library under certain conditions as described in each
--// individual source file, and distribute linked combinations
--// including the two.
--//
--// You must obey the GNU General Public License in all respects for
--// all of the code used other than OpenSSL.  If you modify file(s)
--// with this exception, you may extend this exception to your version
--// of the file(s), but you are not obligated to do so.  If you do not
--// wish to do so, delete this exception statement from your version.
--// If you delete this exception statement from all source files in the
--// program, then also delete it here.
--//
--// Contact:  Jari Sundell <jaris@ifi.uio.no>
--//
--//           Skomakerveien 33
--//           3185 Skoppum, NORWAY
--
- #ifndef LIBTORRENT_THREAD_DISK_H
- #define LIBTORRENT_THREAD_DISK_H
-=20
-@@ -42,19 +6,18 @@
-=20
- namespace torrent {
-=20
--class thread_disk : public thread_base {
-+class LIBTORRENT_EXPORT thread_disk : public thread_base {
- public:
--  const char*         name() const { return "rtorrent disk"; }
--
--  virtual void        init_thread();
-+  const char*     name() const { return "rtorrent disk"; }
-+  HashCheckQueue* hash_queue() { return &m_hash_queue; }
-=20
--  HashCheckQueue*     hash_queue() { return &m_hash_queue; }
-+  virtual void    init_thread();
-=20
- protected:
--  virtual void        call_events();
--  virtual int64_t     next_timeout_usec();
-+  virtual void    call_events();
-+  virtual int64_t next_timeout_usec();
-=20
--  HashCheckQueue      m_hash_queue;
-+  HashCheckQueue  m_hash_queue;
- };
-=20
- }
-diff --git a/src/torrent/utils/thread_base.cc b/src/torrent/utils/thread_b=
ase.cc
-index 778e4c38..99d6355d 100644
---- a/src/torrent/utils/thread_base.cc
-+++ b/src/torrent/utils/thread_base.cc
-@@ -1,39 +1,3 @@
--// libTorrent - BitTorrent library
--// Copyright (C) 2005-2011, Jari Sundell
--//
--// This program is free software; you can redistribute it and/or modify
--// it under the terms of the GNU General Public License as published by
--// the Free Software Foundation; either version 2 of the License, or
--// (at your option) any later version.
--//=20
--// This program is distributed in the hope that it will be useful,
--// but WITHOUT ANY WARRANTY; without even the implied warranty of
--// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--// GNU General Public License for more details.
--//=20
--// You should have received a copy of the GNU General Public License
--// along with this program; if not, write to the Free Software
--// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
--//
--// In addition, as a special exception, the copyright holders give
--// permission to link the code of portions of this program with the
--// OpenSSL library under certain conditions as described in each
--// individual source file, and distribute linked combinations
--// including the two.
--//
--// You must obey the GNU General Public License in all respects for
--// all of the code used other than OpenSSL.  If you modify file(s)
--// with this exception, you may extend this exception to your version
--// of the file(s), but you are not obligated to do so.  If you do not
--// wish to do so, delete this exception statement from your version.
--// If you delete this exception statement from all source files in the
--// program, then also delete it here.
--//
--// Contact:  Jari Sundell <jaris@ifi.uio.no>
--//
--//           Skomakerveien 33
--//           3185 Skoppum, NORWAY
--
- #include "config.h"
-=20
- #include <cstring>
-diff --git a/src/torrent/utils/thread_base.h b/src/torrent/utils/thread_ba=
se.h
-index b92a98ba..bead9659 100644
---- a/src/torrent/utils/thread_base.h
-+++ b/src/torrent/utils/thread_base.h
-@@ -1,48 +1,12 @@
--// libTorrent - BitTorrent library
--// Copyright (C) 2005-2011, Jari Sundell
--//
--// This program is free software; you can redistribute it and/or modify
--// it under the terms of the GNU General Public License as published by
--// the Free Software Foundation; either version 2 of the License, or
--// (at your option) any later version.
--//=20
--// This program is distributed in the hope that it will be useful,
--// but WITHOUT ANY WARRANTY; without even the implied warranty of
--// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--// GNU General Public License for more details.
--//=20
--// You should have received a copy of the GNU General Public License
--// along with this program; if not, write to the Free Software
--// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
--//
--// In addition, as a special exception, the copyright holders give
--// permission to link the code of portions of this program with the
--// OpenSSL library under certain conditions as described in each
--// individual source file, and distribute linked combinations
--// including the two.
--//
--// You must obey the GNU General Public License in all respects for
--// all of the code used other than OpenSSL.  If you modify file(s)
--// with this exception, you may extend this exception to your version
--// of the file(s), but you are not obligated to do so.  If you do not
--// wish to do so, delete this exception statement from your version.
--// If you delete this exception statement from all source files in the
--// program, then also delete it here.
--//
--// Contact:  Jari Sundell <jaris@ifi.uio.no>
--//
--//           Skomakerveien 33
--//           3185 Skoppum, NORWAY
--
- #ifndef LIBTORRENT_UTILS_THREAD_BASE_H
- #define LIBTORRENT_UTILS_THREAD_BASE_H
-=20
--#include <functional>
--#include <pthread.h>
--#include <sys/types.h>
-+#import <functional>
-+#import <pthread.h>
-+#import <sys/types.h>
-=20
--#include <torrent/common.h>
--#include <torrent/utils/signal_bitfield.h>
-+#import <torrent/common.h>
-+#import <torrent/utils/signal_bitfield.h>
-=20
- namespace torrent {
-=20
-@@ -54,7 +18,7 @@ public:
-   typedef void* (*pthread_func)(void*);
-   typedef std::function<void ()>     slot_void;
-   typedef std::function<uint64_t ()> slot_timer;
--  typedef class signal_bitfield           signal_type;
-+  typedef class signal_bitfield      signal_type;
-=20
-   enum state_type {
-     STATE_UNKNOWN,
-diff --git a/test/Makefile.am b/test/Makefile.am
-index 8b0291bb..cb00dce3 100644
---- a/test/Makefile.am
-+++ b/test/Makefile.am
-@@ -1,6 +1,10 @@
- TESTS =3D \
- 	LibTorrent_Test_Torrent_Net \
-+	LibTorrent_Test_Torrent_Utils \
-+	LibTorrent_Test_Torrent \
-+	LibTorrent_Test_Data \
- 	LibTorrent_Test_Net \
-+	LibTorrent_Test_Tracker \
- 	LibTorrent_Test
-=20
- check_PROGRAMS =3D $(TESTS)
-@@ -10,22 +14,14 @@ LibTorrent_Test_LDADD =3D \
- 	../src/libtorrent_other.la \
- 	../src/torrent/libtorrent_torrent.la
-=20
--LibTorrent_Test_Net_LDADD =3D $(LibTorrent_Test_LDADD)
- LibTorrent_Test_Torrent_Net_LDADD =3D $(LibTorrent_Test_LDADD)
-+LibTorrent_Test_Torrent_Utils_LDADD =3D $(LibTorrent_Test_LDADD)
-+LibTorrent_Test_Torrent_LDADD =3D $(LibTorrent_Test_LDADD)
-+LibTorrent_Test_Data_LDADD =3D $(LibTorrent_Test_LDADD)
-+LibTorrent_Test_Net_LDADD =3D $(LibTorrent_Test_LDADD)
-+LibTorrent_Test_Tracker_LDADD =3D $(LibTorrent_Test_LDADD)
-=20
--# LibTorrent_Test_SOURCES =3D \
--# 	helpers/expect_fd.h \
--# 	helpers/expect_utils.h \
--# 	helpers/mock_compare.h \
--# 	helpers/mock_function.cc \
--# 	helpers/mock_function.h \
--# 	helpers/network.h \
--# 	helpers/progress_listener.cc \
--# 	helpers/progress_listener.h \
--# 	helpers/test_fixture.cc \
--# 	helpers/test_fixture.h
--
--LibTorrent_Test_Torrent_Net_SOURCES =3D \
-+LibTorrent_Test_Common =3D \
- 	main.cc \
- 	helpers/expect_fd.h \
- 	helpers/expect_utils.h \
-@@ -37,7 +33,10 @@ LibTorrent_Test_Torrent_Net_SOURCES =3D \
- 	helpers/progress_listener.h \
- 	helpers/test_fixture.cc \
- 	helpers/test_fixture.h \
--	\
-+	helpers/test_thread.cc \
-+	helpers/test_thread.h
-+
-+LibTorrent_Test_Torrent_Net_SOURCES =3D $(LibTorrent_Test_Common) \
- 	torrent/net/test_address_info.cc \
- 	torrent/net/test_address_info.h \
- 	torrent/net/test_fd.cc \
-@@ -45,71 +44,28 @@ LibTorrent_Test_Torrent_Net_SOURCES =3D \
- 	torrent/net/test_socket_address.cc \
- 	torrent/net/test_socket_address.h
-=20
--LibTorrent_Test_Net_SOURCES =3D \
--	main.cc \
--	helpers/expect_fd.h \
--	helpers/expect_utils.h \
--	helpers/mock_compare.h \
--	helpers/mock_function.cc \
--	helpers/mock_function.h \
--	helpers/network.h \
--	helpers/progress_listener.cc \
--	helpers/progress_listener.h \
--	helpers/test_fixture.cc \
--	helpers/test_fixture.h \
--	\
--	net/test_socket_listen.cc \
--	net/test_socket_listen.h
--
--LibTorrent_Test_SOURCES =3D \
--	main.cc \
--	helpers/expect_fd.h \
--	helpers/expect_utils.h \
--	helpers/mock_compare.h \
--	helpers/mock_function.cc \
--	helpers/mock_function.h \
--	helpers/network.h \
--	helpers/progress_listener.cc \
--	helpers/progress_listener.h \
--	helpers/test_fixture.cc \
--	helpers/test_fixture.h \
--	\
--	../src/thread_disk.cc \
--	../src/thread_disk.h \
--	\
--	rak/allocators_test.cc \
--	rak/allocators_test.h \
--	rak/ranges_test.cc \
--	rak/ranges_test.h \
--	data/chunk_list_test.cc \
--	data/chunk_list_test.h \
--	data/hash_check_queue_test.cc \
--	data/hash_check_queue_test.h \
--	data/hash_queue_test.cc \
--	data/hash_queue_test.h \
--	\
--	protocol/test_request_list.cc \
--	protocol/test_request_list.h \
--	\
--	torrent/utils/log_test.cc \
--	torrent/utils/log_test.h \
--	torrent/utils/option_strings_test.cc \
--	torrent/utils/option_strings_test.h \
-+LibTorrent_Test_Torrent_Utils_SOURCES =3D $(LibTorrent_Test_Common) \
- 	torrent/utils/test_extents.cc \
- 	torrent/utils/test_extents.h \
-+	torrent/utils/test_log.cc \
-+	torrent/utils/test_log.h \
- 	torrent/utils/test_log_buffer.cc \
- 	torrent/utils/test_log_buffer.h \
-+	torrent/utils/test_option_strings.cc \
-+	torrent/utils/test_option_strings.h \
- 	torrent/utils/test_queue_buckets.cc \
- 	torrent/utils/test_queue_buckets.h \
-+	torrent/utils/test_signal_bitfield.cc \
-+	torrent/utils/test_signal_bitfield.h \
-+	torrent/utils/test_thread_base.cc \
-+	torrent/utils/test_thread_base.h \
- 	torrent/utils/test_uri_parser.cc \
--	torrent/utils/test_uri_parser.h \
--	torrent/utils/signal_bitfield_test.cc \
--	torrent/utils/signal_bitfield_test.h \
--	torrent/utils/thread_base_test.cc \
--	torrent/utils/thread_base_test.h \
-+	torrent/utils/test_uri_parser.h
-+
-+LibTorrent_Test_Torrent_SOURCES =3D $(LibTorrent_Test_Common) \
-+	torrent/test_http.cc \
-+	torrent/test_http.h \
- 	\
--	torrent/http_test.cc \
--	torrent/http_test.h \
- 	torrent/object_test.cc \
- 	torrent/object_test.h \
- 	torrent/object_test_utils.cc \
-@@ -129,15 +85,49 @@ LibTorrent_Test_SOURCES =3D \
- 	torrent/tracker_list_features_test.cc \
- 	torrent/tracker_list_features_test.h \
- 	torrent/tracker_timeout_test.cc \
--	torrent/tracker_timeout_test.h \
-+	torrent/tracker_timeout_test.h
-+
-+LibTorrent_Test_Data_SOURCES =3D $(LibTorrent_Test_Common) \
-+	data/test_chunk_list.cc \
-+	data/test_chunk_list.h \
-+	data/test_hash_check_queue.cc \
-+	data/test_hash_check_queue.h \
-+	data/test_hash_queue.cc \
-+	data/test_hash_queue.h
-+
-+LibTorrent_Test_Net_SOURCES =3D $(LibTorrent_Test_Common) \
-+	net/test_socket_listen.cc \
-+	net/test_socket_listen.h
-+
-+LibTorrent_Test_Tracker_SOURCES =3D $(LibTorrent_Test_Common) \
-+	tracker/test_tracker_http.cc \
-+	tracker/test_tracker_http.h
-+
-+LibTorrent_Test_SOURCES =3D $(LibTorrent_Test_Common) \
-+	\
-+	../src/thread_disk.cc \
-+	../src/thread_disk.h \
- 	\
--	tracker/tracker_http_test.cc \
--	tracker/tracker_http_test.h
-+	rak/allocators_test.cc \
-+	rak/allocators_test.h \
-+	rak/ranges_test.cc \
-+	rak/ranges_test.h \
-+	\
-+	protocol/test_request_list.cc \
-+	protocol/test_request_list.h
-=20
- LibTorrent_Test_Torrent_Net_CXXFLAGS =3D $(CPPUNIT_CFLAGS)
- LibTorrent_Test_Torrent_Net_LDFLAGS =3D $(CPPUNIT_LIBS) -ldl
-+LibTorrent_Test_Torrent_Utils_CXXFLAGS =3D $(CPPUNIT_CFLAGS)
-+LibTorrent_Test_Torrent_Utils_LDFLAGS =3D $(CPPUNIT_LIBS) -ldl
-+LibTorrent_Test_Torrent_CXXFLAGS =3D $(CPPUNIT_CFLAGS)
-+LibTorrent_Test_Torrent_LDFLAGS =3D $(CPPUNIT_LIBS) -ldl
-+LibTorrent_Test_Data_CXXFLAGS =3D $(CPPUNIT_CFLAGS)
-+LibTorrent_Test_Data_LDFLAGS =3D $(CPPUNIT_LIBS) -ldl
- LibTorrent_Test_Net_CXXFLAGS =3D $(CPPUNIT_CFLAGS)
- LibTorrent_Test_Net_LDFLAGS =3D $(CPPUNIT_LIBS) -ldl
-+LibTorrent_Test_Tracker_CXXFLAGS =3D $(CPPUNIT_CFLAGS)
-+LibTorrent_Test_Tracker_LDFLAGS =3D $(CPPUNIT_LIBS) -ldl
- LibTorrent_Test_CXXFLAGS =3D $(CPPUNIT_CFLAGS)
- LibTorrent_Test_LDFLAGS =3D $(CPPUNIT_LIBS) -ldl
-=20
-diff --git a/test/data/chunk_list_test.cc b/test/data/test_chunk_list.cc
-similarity index 93%
-rename from test/data/chunk_list_test.cc
-rename to test/data/test_chunk_list.cc
-index 28647db2..18de597e 100644
---- a/test/data/chunk_list_test.cc
-+++ b/test/data/test_chunk_list.cc
-@@ -1,11 +1,11 @@
--#include "config.h"
-+#import "config.h"
-=20
--#include "chunk_list_test.h"
-+#import "test_chunk_list.h"
-=20
--#include "torrent/chunk_manager.h"
--#include "torrent/exceptions.h"
-+#import "torrent/chunk_manager.h"
-+#import "torrent/exceptions.h"
-=20
--CPPUNIT_TEST_SUITE_REGISTRATION(ChunkListTest);
-+CPPUNIT_TEST_SUITE_NAMED_REGISTRATION(test_chunk_list, "data");
-=20
- torrent::Chunk*
- func_create_chunk(uint32_t index, int prot_flags) {
-@@ -36,7 +36,7 @@ func_storage_error(torrent::ChunkList* chunk_list, const=
 std::string& message) {
- }
-=20
- void
--ChunkListTest::test_basic() {
-+test_chunk_list::test_basic() {
-   torrent::ChunkManager chunk_manager;
-   torrent::ChunkList chunk_list;
-=20
-@@ -55,7 +55,7 @@ ChunkListTest::test_basic() {
- }
-=20
- void
--ChunkListTest::test_get_release() {
-+test_chunk_list::test_get_release() {
-   SETUP_CHUNK_LIST();
-=20
-   CPPUNIT_ASSERT(!(*chunk_list)[0].is_valid());
-@@ -112,7 +112,7 @@ ChunkListTest::test_get_release() {
-=20
- // Make sure we can't go into writable when blocking, etc.
- void
--ChunkListTest::test_blocking() {
-+test_chunk_list::test_blocking() {
-   SETUP_CHUNK_LIST();
-=20
-   torrent::ChunkHandle handle_0_ro =3D chunk_list->get(0, torrent::ChunkL=
ist::get_blocking);
-diff --git a/test/data/chunk_list_test.h b/test/data/test_chunk_list.h
-similarity index 88%
-rename from test/data/chunk_list_test.h
-rename to test/data/test_chunk_list.h
-index 3979982f..85d1f77b 100644
---- a/test/data/chunk_list_test.h
-+++ b/test/data/test_chunk_list.h
-@@ -1,23 +1,22 @@
--#include <cppunit/extensions/HelperMacros.h>
-+#import "helpers/test_fixture.h"
-=20
--#include "data/chunk_list.h"
-+class test_chunk_list : public test_fixture {
-+  CPPUNIT_TEST_SUITE(test_chunk_list);
-=20
--class ChunkListTest : public CppUnit::TestFixture {
--  CPPUNIT_TEST_SUITE(ChunkListTest);
-   CPPUNIT_TEST(test_basic);
-   CPPUNIT_TEST(test_get_release);
-   CPPUNIT_TEST(test_blocking);
-+
-   CPPUNIT_TEST_SUITE_END();
-=20
- public:
--  void setUp() {}
--  void tearDown() {}
--
-   void test_basic();
-   void test_get_release();
-   void test_blocking();
- };
-=20
-+#include "data/chunk_list.h"
-+
- torrent::Chunk* func_create_chunk(uint32_t index, int prot_flags);
- uint64_t        func_free_diskspace(torrent::ChunkList* chunk_list);
- void            func_storage_error(torrent::ChunkList* chunk_list, const =
std::string& message);
-diff --git a/test/data/hash_check_queue_test.cc b/test/data/test_hash_chec=
k_queue.cc
-similarity index 92%
-rename from test/data/hash_check_queue_test.cc
-rename to test/data/test_hash_check_queue.cc
-index 4b15245e..65931273 100644
---- a/test/data/hash_check_queue_test.cc
-+++ b/test/data/test_hash_check_queue.cc
-@@ -1,20 +1,23 @@
- #include "config.h"
-=20
-+#include "test_hash_check_queue.h"
-+
-+#include "helpers/test_thread.h"
-+#include "helpers/test_utils.h"
-+
- #include <functional>
- #include <signal.h>
-=20
--#include "data/hash_queue_node.h"
-+#include "data/chunk_handle.h"
- #include "utils/sha1.h"
- #include "torrent/chunk_manager.h"
- #include "torrent/exceptions.h"
- #include "torrent/poll_select.h"
--#include "torrent/utils/thread_base_test.h"
- #include "thread_disk.h"
-=20
--#include "chunk_list_test.h"
--#include "hash_check_queue_test.h"
-+#include "test_chunk_list.h"
-=20
--CPPUNIT_TEST_SUITE_REGISTRATION(HashCheckQueueTest);
-+CPPUNIT_TEST_SUITE_NAMED_REGISTRATION(test_hash_check_queue, "data");
-=20
- pthread_mutex_t done_chunks_lock =3D PTHREAD_MUTEX_INITIALIZER;
-=20
-@@ -68,22 +71,16 @@ static torrent::Poll* create_select_poll() { return to=
rrent::PollSelect::create(
- static void do_nothing() {}
-=20
- void
--HashCheckQueueTest::setUp() {
-+test_hash_check_queue::setUp() {
-+  test_fixture::setUp();
-+
-   torrent::Poll::slot_create_poll() =3D std::bind(&create_select_poll);
-=20
-   signal(SIGUSR1, (sig_t)&do_nothing);
- }
-=20
- void
--HashCheckQueueTest::tearDown() {
--}
--
--void
--HashCheckQueueTest::test_basic() {
--}
--
--void
--HashCheckQueueTest::test_single() {
-+test_hash_check_queue::test_single() {
-   SETUP_CHUNK_LIST();
-   torrent::HashCheckQueue hash_queue;
-=20
-@@ -110,7 +107,7 @@ HashCheckQueueTest::test_single() {
- }
-=20
- void
--HashCheckQueueTest::test_multiple() {
-+test_hash_check_queue::test_multiple() {
-   SETUP_CHUNK_LIST();
-   torrent::HashCheckQueue hash_queue;
-=20
-@@ -143,7 +140,7 @@ HashCheckQueueTest::test_multiple() {
- }
-=20
- void
--HashCheckQueueTest::test_erase() {
-+test_hash_check_queue::test_erase() {
-   // SETUP_CHUNK_LIST();
-   // torrent::HashCheckQueue hash_queue;
-=20
-@@ -176,7 +173,7 @@ HashCheckQueueTest::test_erase() {
- }
-=20
- void
--HashCheckQueueTest::test_thread() {
-+test_hash_check_queue::test_thread() {
-   SETUP_CHUNK_LIST();
-   SETUP_THREAD();
-   thread_disk->start_thread();
-diff --git a/test/data/hash_check_queue_test.h b/test/data/test_hash_check=
_queue.h
-similarity index 63%
-rename from test/data/hash_check_queue_test.h
-rename to test/data/test_hash_check_queue.h
-index 5398a50d..d2d271bb 100644
---- a/test/data/hash_check_queue_test.h
-+++ b/test/data/test_hash_check_queue.h
-@@ -1,26 +1,19 @@
--#include <map>
--#include <vector>
--#include <cppunit/extensions/HelperMacros.h>
-+#import "helpers/test_fixture.h"
-=20
--#include "data/hash_check_queue.h"
--#include "torrent/hash_string.h"
-+class test_hash_check_queue : public test_fixture {
-+  CPPUNIT_TEST_SUITE(test_hash_check_queue);
-=20
--
--class HashCheckQueueTest : public CppUnit::TestFixture {
--  CPPUNIT_TEST_SUITE(HashCheckQueueTest);
--  CPPUNIT_TEST(test_basic);
-   CPPUNIT_TEST(test_single);
-   CPPUNIT_TEST(test_multiple);
-   CPPUNIT_TEST(test_erase);
-=20
-   CPPUNIT_TEST(test_thread);
-+
-   CPPUNIT_TEST_SUITE_END();
-=20
- public:
-   void setUp();
--  void tearDown();
-=20
--  void test_basic();
-   void test_single();
-   void test_multiple();
-   void test_erase();
-@@ -28,6 +21,13 @@ public:
-   void test_thread();
- };
-=20
-+#import <map>
-+#import <vector>
-+
-+#import "data/hash_queue_node.h"
-+#import "data/hash_check_queue.h"
-+#import "torrent/hash_string.h"
-+
- typedef std::map<int, torrent::HashString> done_chunks_type;
- typedef std::vector<torrent::ChunkHandle> handle_list;
-=20
-diff --git a/test/data/hash_queue_test.cc b/test/data/test_hash_queue.cc
-similarity index 82%
-rename from test/data/hash_queue_test.cc
-rename to test/data/test_hash_queue.cc
-index d7ce3ba8..d9a88c8d 100644
---- a/test/data/hash_queue_test.cc
-+++ b/test/data/test_hash_queue.cc
-@@ -1,22 +1,26 @@
--#include "config.h"
-+#import "config.h"
-=20
--#include <functional>
--#include <signal.h>
-+#import "test_hash_queue.h"
-=20
--#include "data/hash_queue_node.h"
--#include "torrent/chunk_manager.h"
--#include "torrent/exceptions.h"
--#include "torrent/hash_string.h"
--#include "torrent/poll_select.h"
--#include "torrent/utils/thread_base_test.h"
--#include "globals.h"
--#include "thread_disk.h"
-+#import "helpers/test_thread.h"
-+#import "helpers/test_utils.h"
-=20
--#include "chunk_list_test.h"
--#include "hash_queue_test.h"
--#include "hash_check_queue_test.h"
-+#import <functional>
-+#import <signal.h>
-=20
--CPPUNIT_TEST_SUITE_REGISTRATION(HashQueueTest);
-+#import "data/hash_queue.h"
-+#import "data/hash_queue_node.h"
-+#import "torrent/chunk_manager.h"
-+#import "torrent/exceptions.h"
-+#import "torrent/hash_string.h"
-+#import "torrent/poll_select.h"
-+#import "globals.h"
-+#import "thread_disk.h"
-+
-+#import "test_chunk_list.h"
-+#import "test_hash_check_queue.h"
-+
-+CPPUNIT_TEST_SUITE_NAMED_REGISTRATION(test_hash_queue, "data");
-=20
- typedef std::map<int, torrent::HashString> done_chunks_type;
-=20
-@@ -39,7 +43,9 @@ static torrent::Poll* create_select_poll() { return torr=
ent::PollSelect::create(
- static void do_nothing() {}
-=20
- void
--HashQueueTest::setUp() {
-+test_hash_queue::setUp() {
-+  test_fixture::setUp();
-+
-   CPPUNIT_ASSERT(torrent::taskScheduler.empty());
-=20
-   torrent::Poll::slot_create_poll() =3D std::bind(&create_select_poll);
-@@ -47,25 +53,9 @@ HashQueueTest::setUp() {
- }
-=20
- void
--HashQueueTest::tearDown() {
-+test_hash_queue::tearDown() {
-   torrent::taskScheduler.clear();
--}
--
--void
--HashQueueTest::test_basic() {
--  // SETUP_CHUNK_LIST();
--  // SETUP_THREAD();
--  // thread_disk->start_thread();
--
--  // torrent::HashQueue* hash_queue =3D new torrent::HashQueue(thread_dis=
k);
-- =20
--  // // Do stuff?
--
--  // delete hash_queue;
--
--  // thread_disk->stop_thread();
--  // CLEANUP_THREAD();
--  // CLEANUP_CHUNK_LIST();
-+  test_fixture::tearDown();
- }
-=20
- static void
-@@ -73,7 +63,7 @@ fill_queue() {
- }
-=20
- void
--HashQueueTest::test_single() {
-+test_hash_queue::test_single() {
-   SETUP_CHUNK_LIST();
-   SETUP_THREAD();
-   thread_disk->start_thread();
-@@ -105,7 +95,7 @@ HashQueueTest::test_single() {
- }
-=20
- void
--HashQueueTest::test_multiple() {
-+test_hash_queue::test_multiple() {
-   SETUP_CHUNK_LIST();
-   SETUP_THREAD();
-   thread_disk->start_thread();
-@@ -137,7 +127,7 @@ HashQueueTest::test_multiple() {
- }
-=20
- void
--HashQueueTest::test_erase() {
-+test_hash_queue::test_erase() {
-   SETUP_CHUNK_LIST();
-   SETUP_THREAD();
-=20
-@@ -164,7 +154,7 @@ HashQueueTest::test_erase() {
- }
-=20
- void
--HashQueueTest::test_erase_stress() {
-+test_hash_queue::test_erase_stress() {
-   SETUP_CHUNK_LIST();
-   SETUP_THREAD();
-   thread_disk->start_thread();
-diff --git a/test/data/hash_queue_test.h b/test/data/test_hash_queue.h
-similarity index 58%
-rename from test/data/hash_queue_test.h
-rename to test/data/test_hash_queue.h
-index cb5b7282..79914484 100644
---- a/test/data/hash_queue_test.h
-+++ b/test/data/test_hash_queue.h
-@@ -1,10 +1,7 @@
--#include <cppunit/extensions/HelperMacros.h>
-+#include "helpers/test_fixture.h"
-=20
--#include "data/hash_queue.h"
--
--class HashQueueTest : public CppUnit::TestFixture {
--  CPPUNIT_TEST_SUITE(HashQueueTest);
--  CPPUNIT_TEST(test_basic);
-+class test_hash_queue : public test_fixture {
-+  CPPUNIT_TEST_SUITE(test_hash_queue);
-=20
-   CPPUNIT_TEST(test_single);
-   CPPUNIT_TEST(test_multiple);
-@@ -17,8 +14,6 @@ public:
-   void setUp();
-   void tearDown();
-=20
--  void test_basic();
--
-   void test_single();
-   void test_multiple();
-   void test_erase();
-diff --git a/test/helpers/progress_listener.cc b/test/helpers/progress_lis=
tener.cc
-index c2b60bcd..7a6ed047 100644
---- a/test/helpers/progress_listener.cc
-+++ b/test/helpers/progress_listener.cc
-@@ -36,10 +36,10 @@ progress_listener::addFailure(const CppUnit::TestFailu=
re &failure) {
-   if (m_current_log_buffer =3D=3D nullptr)
-     return;
-=20
--  std::cout << " : " << (failure.isError() ? "error" : "assertion");
-+  std::cout << " : " << (failure.isError() ? "error" : "assertion") << st=
d::flush;
-=20
-   m_last_test_failed =3D true;
--  m_failures.push_back(std::move(failure_type{failure.failedTestName(), s=
td::move(m_current_log_buffer)}));
-+  m_failures.push_back(failure_type{ failure.failedTestName(), std::move(=
m_current_log_buffer) });
- }
-=20
- void
-diff --git a/test/helpers/test_fixture.h b/test/helpers/test_fixture.h
-index 312d5009..aa557a5e 100644
---- a/test/helpers/test_fixture.h
-+++ b/test/helpers/test_fixture.h
-@@ -1,14 +1,14 @@
--#ifndef LIBTORRENT_HELPER_TEST_FIXTURE_H
--#define LIBTORRENT_HELPER_TEST_FIXTURE_H
--
--#include <cppunit/extensions/HelperMacros.h>
--
--#include "helpers/mock_function.h"
--
--class test_fixture : public CppUnit::TestFixture {
--public:
--  void setUp();
--  void tearDown();
--};
--
--#endif
-+#ifndef LIBTORRENT_HELPER_TEST_FIXTURE_H
-+#define LIBTORRENT_HELPER_TEST_FIXTURE_H
-+
-+#include <cppunit/extensions/HelperMacros.h>
-+
-+#include "helpers/mock_function.h"
-+
-+class test_fixture : public CppUnit::TestFixture {
-+public:
-+  void setUp();
-+  void tearDown();
-+};
-+
-+#endif
-diff --git a/test/helpers/test_thread.cc b/test/helpers/test_thread.cc
-new file mode 100755
-index 00000000..4b3d4c95
---- /dev/null
-+++ b/test/helpers/test_thread.cc
-@@ -0,0 +1,71 @@
-+#import "config.h"
-+
-+#import "test_thread.h"
-+
-+#import <unistd.h>
-+#import <cppunit/extensions/HelperMacros.h>
-+
-+#import "thread_disk.h"
-+#import "torrent/exceptions.h"
-+#import "torrent/poll_select.h"
-+
-+const int test_thread::test_flag_pre_stop;
-+const int test_thread::test_flag_long_timeout;
-+
-+const int test_thread::test_flag_acquire_global;
-+const int test_thread::test_flag_has_global;
-+
-+const int test_thread::test_flag_do_work;
-+const int test_thread::test_flag_pre_poke;
-+const int test_thread::test_flag_post_poke;
-+
-+test_thread::test_thread() :
-+  m_test_state(TEST_NONE),
-+  m_test_flags(0) {
-+}
-+
-+void
-+test_thread::init_thread() {
-+  m_state =3D STATE_INITIALIZED;
-+  m_test_state =3D TEST_PRE_START;
-+  m_poll =3D torrent::PollSelect::create(256);
-+}
-+
-+void
-+test_thread::call_events() {
-+  if ((m_test_flags & test_flag_pre_stop) && m_test_state =3D=3D TEST_PRE=
_START && m_state =3D=3D STATE_ACTIVE)
-+    __sync_lock_test_and_set(&m_test_state, TEST_PRE_STOP);
-+
-+  if ((m_test_flags & test_flag_acquire_global)) {
-+    acquire_global_lock();
-+    __sync_and_and_fetch(&m_test_flags, ~test_flag_acquire_global);
-+    __sync_or_and_fetch(&m_test_flags, test_flag_has_global);
-+  }
-+
-+  if ((m_flags & flag_do_shutdown)) {
-+    if ((m_flags & flag_did_shutdown))
-+      throw torrent::internal_error("Already trigged shutdown.");
-+
-+    __sync_or_and_fetch(&m_flags, flag_did_shutdown);
-+    throw torrent::shutdown_exception();
-+  }
-+
-+  if ((m_test_flags & test_flag_pre_poke)) {
-+  }
-+
-+  if ((m_test_flags & test_flag_do_work)) {
-+    usleep(10 * 1000); // TODO: Don't just sleep, as that give up core.
-+    __sync_and_and_fetch(&m_test_flags, ~test_flag_do_work);
-+  }
-+
-+  if ((m_test_flags & test_flag_post_poke)) {
-+  }
-+}
-+
-+thread_management_type::thread_management_type() {
-+  CPPUNIT_ASSERT(torrent::thread_base::trylock_global_lock());
-+}
-+
-+thread_management_type::~thread_management_type() {
-+  torrent::thread_base::release_global_lock();
-+}
-diff --git a/test/helpers/test_thread.h b/test/helpers/test_thread.h
-new file mode 100755
-index 00000000..52037036
---- /dev/null
-+++ b/test/helpers/test_thread.h
-@@ -0,0 +1,59 @@
-+#import "torrent/utils/thread_base.h"
-+
-+class test_thread : public torrent::thread_base {
-+public:
-+  enum test_state {
-+    TEST_NONE,
-+    TEST_PRE_START,
-+    TEST_PRE_STOP,
-+    TEST_STOP
-+  };
-+
-+  static const int test_flag_pre_stop       =3D 0x1;
-+  static const int test_flag_long_timeout   =3D 0x2;
-+
-+  static const int test_flag_acquire_global =3D 0x10;
-+  static const int test_flag_has_global     =3D 0x20;
-+
-+  static const int test_flag_do_work   =3D 0x100;
-+  static const int test_flag_pre_poke  =3D 0x200;
-+  static const int test_flag_post_poke =3D 0x400;
-+
-+  test_thread();
-+
-+  int     test_state() const { return m_test_state; }
-+  bool    is_state(int state) const { return m_state =3D=3D state; }
-+  bool    is_test_state(int state) const { return m_test_state =3D=3D sta=
te; }
-+  bool    is_test_flags(int flags) const { return (m_test_flags & flags) =
=3D=3D flags; }
-+  bool    is_not_test_flags(int flags) const { return !(m_test_flags & fl=
ags); }
-+
-+  auto    name() const -> const char* { return "test_thread"; }
-+
-+  void    init_thread();
-+
-+  void    set_pre_stop() { __sync_or_and_fetch(&m_test_flags, test_flag_p=
re_stop); }
-+  void    set_acquire_global() { __sync_or_and_fetch(&m_test_flags, test_=
flag_acquire_global); }
-+
-+  void    set_test_flag(int flags) { __sync_or_and_fetch(&m_test_flags, f=
lags); }
-+
-+private:
-+  void    call_events();
-+  int64_t next_timeout_usec() { return (m_test_flags & test_flag_long_tim=
eout) ? (10000 * 1000) : (100 * 1000); }
-+
-+  int     m_test_state lt_cacheline_aligned;
-+  int     m_test_flags lt_cacheline_aligned;
-+};
-+
-+struct thread_management_type {
-+  thread_management_type();
-+  ~thread_management_type();
-+};
-+
-+#define SETUP_THREAD()                                                  \
-+  thread_management_type thread_management;                             \
-+  torrent::thread_disk* thread_disk =3D new torrent::thread_disk();      =
 \
-+  thread_disk->init_thread();
-+
-+#define CLEANUP_THREAD()                                                \
-+  CPPUNIT_ASSERT(wait_for_true(std::bind(&torrent::thread_base::is_inacti=
ve, thread_disk))); \
-+  delete thread_disk;
-diff --git a/test/helpers/test_utils.h b/test/helpers/test_utils.h
-new file mode 100644
-index 00000000..0c8c6b7a
---- /dev/null
-+++ b/test/helpers/test_utils.h
-@@ -0,0 +1,16 @@
-+#include <functional>
-+#include <unistd.h>
-+
-+inline bool
-+wait_for_true(std::function<bool ()> test_function) {
-+  int i =3D 100;
-+
-+  do {
-+    if (test_function())
-+      return true;
-+
-+    usleep(10 * 1000);
-+  } while (--i);
-+
-+  return false;
-+}
-diff --git a/test/helpers/utils.h b/test/helpers/utils.h
-index d18450c1..e81d22eb 100644
---- a/test/helpers/utils.h
-+++ b/test/helpers/utils.h
-@@ -1,60 +1,60 @@
--#ifndef LIBTORRENT_HELPER_UTILS_H
--#define LIBTORRENT_HELPER_UTILS_H
--
--#include <algorithm>
--#include <iostream>
--#include <cppunit/extensions/TestFactoryRegistry.h>
--#include <torrent/utils/log.h>
--
--static void
--dump_failure_log(const failure_type& failure) {
--  if (failure.log->empty())
--    return;
--
--  std::cout << std::endl << failure.name << std::endl;
--
--  // Doesn't print dump messages as log_buffer drops them.
--  std::for_each(failure.log->begin(), failure.log->end(), [](const torren=
t::log_entry& entry) {
--      std::cout << entry.timestamp << ' ' << entry.message << '\n';
--    });
--
--  std::cout << std::flush;
--}
--
--static void
--dump_failures(const failure_list_type& failures) {
--  if (failures.empty())
--    return;
--
--  std::cout << std::endl
--            << "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D" << s=
td::endl
--            << "Failed Test Logs:" << std::endl
--            << "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D" << s=
td::endl;
--
--  std::for_each(failures.begin(), failures.end(), [](const failure_type& =
failure) {
--      dump_failure_log(failure);
--    });
--  std::cout << std::endl;
--}
--
--static
--void add_tests(CppUnit::TextUi::TestRunner& runner, const char* c_test_na=
mes) {
--  if (c_test_names =3D=3D NULL || std::string(c_test_names).empty()) {
--    runner.addTest(CppUnit::TestFactoryRegistry::getRegistry().makeTest()=
);
--    return;
--  }
--
--  const std::string& test_names(c_test_names);
--
--  size_t pos =3D 0;
--  size_t next =3D 0;
--
--  while ((next =3D test_names.find(',', pos)) < test_names.size()) {
--    runner.addTest(CppUnit::TestFactoryRegistry::getRegistry(test_names.s=
ubstr(pos, next - pos)).makeTest());
--    pos =3D next + 1;
--  }
--
--  runner.addTest(CppUnit::TestFactoryRegistry::getRegistry(test_names.sub=
str(pos)).makeTest());
--}
--
--#endif
-+#ifndef LIBTORRENT_HELPER_UTILS_H
-+#define LIBTORRENT_HELPER_UTILS_H
-+
-+#include <algorithm>
-+#include <iostream>
-+#include <cppunit/extensions/TestFactoryRegistry.h>
-+#include <torrent/utils/log.h>
-+
-+static void
-+dump_failure_log(const failure_type& failure) {
-+  if (failure.log->empty())
-+    return;
-+
-+  std::cout << std::endl << failure.name << std::endl;
-+
-+  // Doesn't print dump messages as log_buffer drops them.
-+  std::for_each(failure.log->begin(), failure.log->end(), [](const torren=
t::log_entry& entry) {
-+      std::cout << entry.timestamp << ' ' << entry.message << '\n';
-+    });
-+
-+  std::cout << std::flush;
-+}
-+
-+static void
-+dump_failures(const failure_list_type& failures) {
-+  if (failures.empty())
-+    return;
-+
-+  std::cout << std::endl
-+            << "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D" << s=
td::endl
-+            << "Failed Test Logs:" << std::endl
-+            << "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D" << s=
td::endl;
-+
-+  std::for_each(failures.begin(), failures.end(), [](const failure_type& =
failure) {
-+      dump_failure_log(failure);
-+    });
-+  std::cout << std::endl;
-+}
-+
-+static
-+void add_tests(CppUnit::TextUi::TestRunner& runner, const char* c_test_na=
mes) {
-+  if (c_test_names =3D=3D NULL || std::string(c_test_names).empty()) {
-+    runner.addTest(CppUnit::TestFactoryRegistry::getRegistry().makeTest()=
);
-+    return;
-+  }
-+
-+  const std::string& test_names(c_test_names);
-+
-+  size_t pos =3D 0;
-+  size_t next =3D 0;
-+
-+  while ((next =3D test_names.find(',', pos)) < test_names.size()) {
-+    runner.addTest(CppUnit::TestFactoryRegistry::getRegistry(test_names.s=
ubstr(pos, next - pos)).makeTest());
-+    pos =3D next + 1;
-+  }
-+
-+  runner.addTest(CppUnit::TestFactoryRegistry::getRegistry(test_names.sub=
str(pos)).makeTest());
-+}
-+
-+#endif
-diff --git a/test/main.cc b/test/main.cc
-index e8a00e1f..57ae31a2 100644
---- a/test/main.cc
-+++ b/test/main.cc
-@@ -19,9 +19,11 @@
- #include "helpers/progress_listener.h"
- #include "helpers/utils.h"
-=20
--CPPUNIT_REGISTRY_ADD_TO_DEFAULT("net");
- CPPUNIT_REGISTRY_ADD_TO_DEFAULT("torrent/net");
- CPPUNIT_REGISTRY_ADD_TO_DEFAULT("torrent/utils");
-+CPPUNIT_REGISTRY_ADD_TO_DEFAULT("torrent");
-+CPPUNIT_REGISTRY_ADD_TO_DEFAULT("net");
-+CPPUNIT_REGISTRY_ADD_TO_DEFAULT("tracker");
-=20
- void
- do_test_panic(int signum) {
-diff --git a/test/torrent/http_test.cc b/test/torrent/test_http.cc
-similarity index 94%
-rename from test/torrent/http_test.cc
-rename to test/torrent/test_http.cc
-index 27e04552..24ec97b5 100644
---- a/test/torrent/http_test.cc
-+++ b/test/torrent/test_http.cc
-@@ -1,10 +1,11 @@
- #include "config.h"
-=20
--#include <sstream>
-+#include "test_http.h"
-=20
--#include "http_test.h"
-+#include <sstream>
-+#include "torrent/http.h"
-=20
--CPPUNIT_TEST_SUITE_REGISTRATION(HttpTest);
-+CPPUNIT_TEST_SUITE_NAMED_REGISTRATION(test_http, "torrent");
-=20
- #define HTTP_SETUP()                                                    \
-   bool http_destroyed =3D false;                                         =
 \
-@@ -72,7 +73,7 @@ TestHttp* create_test_http() { return new TestHttp; }
- static void increment_value(int* value) { (*value)++; }
-=20
- void
--HttpTest::test_basic() {
-+test_http::test_basic() {
-   torrent::Http::slot_factory() =3D std::bind(&create_test_http);
-=20
-   torrent::Http* http =3D torrent::Http::slot_factory()();
-@@ -94,7 +95,7 @@ HttpTest::test_basic() {
- }
-=20
- void
--HttpTest::test_done() {
-+test_http::test_done() {
-   HTTP_SETUP();
-   http->start();
-=20
-@@ -106,7 +107,7 @@ HttpTest::test_done() {
- }
-=20
- void
--HttpTest::test_failure() {
-+test_http::test_failure() {
-   HTTP_SETUP();
-   http->start();
-=20
-@@ -118,7 +119,7 @@ HttpTest::test_failure() {
- }
-=20
- void
--HttpTest::test_delete_on_done() {
-+test_http::test_delete_on_done() {
-   HTTP_SETUP();
-   http->start();
-   http->set_delete_stream();
-@@ -145,7 +146,7 @@ HttpTest::test_delete_on_done() {
- }
-=20
- void
--HttpTest::test_delete_on_failure() {
-+test_http::test_delete_on_failure() {
-   HTTP_SETUP();
-   http->start();
-   http->set_delete_stream();
-diff --git a/test/torrent/http_test.h b/test/torrent/test_http.h
-similarity index 63%
-rename from test/torrent/http_test.h
-rename to test/torrent/test_http.h
-index c6c97d08..f4334646 100644
---- a/test/torrent/http_test.h
-+++ b/test/torrent/test_http.h
-@@ -1,21 +1,18 @@
--#include <cppunit/extensions/HelperMacros.h>
-+#import "helpers/test_fixture.h"
-=20
--#include "torrent/http.h"
-+class test_http : public test_fixture {
-+  CPPUNIT_TEST_SUITE(test_http);
-=20
--class HttpTest : public CppUnit::TestFixture {
--  CPPUNIT_TEST_SUITE(HttpTest);
-   CPPUNIT_TEST(test_basic);
-   CPPUNIT_TEST(test_done);
-   CPPUNIT_TEST(test_failure);
-=20
-   CPPUNIT_TEST(test_delete_on_done);
-   CPPUNIT_TEST(test_delete_on_failure);
-+
-   CPPUNIT_TEST_SUITE_END();
-=20
- public:
--  void setUp() {}
--  void tearDown() {}
--
-   void test_basic();
-   void test_done();
-   void test_failure();
-diff --git a/test/torrent/utils/option_strings_test.h b/test/torrent/utils=
/option_strings_test.h
-deleted file mode 100644
-index 55df4f19..00000000
---- a/test/torrent/utils/option_strings_test.h
-+++ /dev/null
-@@ -1,17 +0,0 @@
--#include <cppunit/extensions/HelperMacros.h>
--
--#include "torrent/utils/option_strings.h"
--
--class option_strings_test : public CppUnit::TestFixture {
--  CPPUNIT_TEST_SUITE(option_strings_test);
--  CPPUNIT_TEST(test_basic);
--  CPPUNIT_TEST(test_entries);
--  CPPUNIT_TEST_SUITE_END();
--
--public:
--  void setUp() {}
--  void tearDown() {}
--
--  void test_basic();
--  void test_entries();
--};
-diff --git a/test/torrent/utils/signal_bitfield_test.h b/test/torrent/util=
s/signal_bitfield_test.h
-deleted file mode 100644
-index 4590de41..00000000
---- a/test/torrent/utils/signal_bitfield_test.h
-+++ /dev/null
-@@ -1,23 +0,0 @@
--#include <cppunit/extensions/HelperMacros.h>
--
--#include "torrent/utils/signal_bitfield.h"
--
--class utils_signal_bitfield_test : public CppUnit::TestFixture {
--  CPPUNIT_TEST_SUITE(utils_signal_bitfield_test);
--  CPPUNIT_TEST(test_basic);
--  CPPUNIT_TEST(test_single);
--  CPPUNIT_TEST(test_multiple);
--
--  CPPUNIT_TEST(test_thread);
--  CPPUNIT_TEST_SUITE_END();
--
--public:
--  void setUp();
--  void tearDown();
--
--  void test_basic();
--  void test_single();
--  void test_multiple();
--
--  void test_thread();
--};
-diff --git a/test/torrent/utils/test_extents.cc b/test/torrent/utils/test_=
extents.cc
-index 87424d62..8e614e10 100644
---- a/test/torrent/utils/test_extents.cc
-+++ b/test/torrent/utils/test_extents.cc
-@@ -2,34 +2,25 @@
-=20
- #include "test_extents.h"
-=20
--#include <cinttypes>
--#include <iostream>
- #include <torrent/utils/extents.h>
-+#include <torrent/utils/log.h>
-=20
--CPPUNIT_TEST_SUITE_REGISTRATION(ExtentsTest);
-+CPPUNIT_TEST_SUITE_NAMED_REGISTRATION(test_extents, "torrent/utils");
-=20
--void
--ExtentsTest::setUp() {
--}
-+#define TEST_EXTENT_BEGIN(name)                                 \
-+  lt_log_print(torrent::LOG_MOCK_CALLS, "extent: %s", name);
-=20
--void
--ExtentsTest::tearDown() {
--}
--
--//typedef torrent::extents<uint32_t, int, 8, 16, 4> extent_type_1;
- typedef torrent::extents<uint32_t, int> extent_type_1;
-=20
--// typedef torrent::extents<uint32_t, int, 0, 256, 16> extent_type_3;
--/*
- template <typename Extent>
- bool
- verify_extent_data(Extent& extent, const uint32_t* idx, const int* val) {
-   while (*idx !=3D *(idx + 1)) {
--    if (!extent.is_equal_range(*idx, *(idx + 1) - 1, *val)) {
--      // std::cout << *idx << ' ' << *(idx + 1) << ' ' << *val << std::en=
dl;
--      // std::cout << extent.at(*idx) << std::endl;
--      // std::cout << extent.at(*(idx + 1)) << std::endl;
--      return false;
-+    for (auto i =3D *idx; i !=3D *(idx + 1); i++) {
-+      lt_log_print(torrent::LOG_MOCK_CALLS, "extent: at %u", i);
-+
-+      if (extent.at(i) !=3D *val)
-+        return false;
-     }
-=20
-     idx++;
-@@ -40,34 +31,32 @@ verify_extent_data(Extent& extent, const uint32_t* idx=
, const int* val) {
- }
-=20
- static const uint32_t idx_empty[] =3D {0, 256, 256};
--static const int      val_empty[] =3D {0, 1};
-+static const int      val_empty[] =3D {0};
-=20
- static const uint32_t idx_basic_1[] =3D {0, 1, 255, 256, 256};
- static const int      val_basic_1[] =3D {1, 0, 1};
-=20
--// static const uint32_t idx_basic_2[] =3D {0, 1, 16, 255, 256, 256};
--// static const int      val_basic_2[] =3D {1, 0, 2, 1};
--*/
- void
--ExtentsTest::test_basic() {
-+test_extents::test_basic() {
-   extent_type_1 extent_1;
--/*
--  // Test empty.
--  CPPUNIT_ASSERT(verify_extent_data(extent_1, idx_empty, val_empty));
--
--  CPPUNIT_ASSERT(extent_1.at(0) =3D=3D int());
--  CPPUNIT_ASSERT(extent_1.at(255) =3D=3D int());
-+  extent_1.insert(0, 255, int());
-=20
--  extent_1.insert(0, 0, 1);
--  extent_1.insert(255, 0, 1);
-+  { TEST_EXTENT_BEGIN("empty");
-+    CPPUNIT_ASSERT(verify_extent_data(extent_1, idx_empty, val_empty));
-=20
--  CPPUNIT_ASSERT(extent_1.at(0) =3D=3D 1);
--  CPPUNIT_ASSERT(extent_1.at(255) =3D=3D 1);
-+    CPPUNIT_ASSERT(extent_1.at(0) =3D=3D int());
-+    CPPUNIT_ASSERT(extent_1.at(255) =3D=3D int());
-+  };
-+  { TEST_EXTENT_BEGIN("borders");
-=20
--  CPPUNIT_ASSERT(verify_extent_data(extent_1, idx_basic_1, val_basic_1));
-+    extent_1.insert(0, 0, 1);
-+    extent_1.insert(255, 255, 1);
-+    // This step shouldn't be needed.
-+    extent_1.insert(1, 254, int());
-=20
--  // extent_1.insert(38, 3, 2);
-+    CPPUNIT_ASSERT(extent_1.at(0) =3D=3D 1);
-+    CPPUNIT_ASSERT(extent_1.at(255) =3D=3D 1);
-=20
--  // CPPUNIT_ASSERT(verify_extent_data(extent_1, idx_basic_2, val_basic_2=
));
--*/
-+    CPPUNIT_ASSERT(verify_extent_data(extent_1, idx_basic_1, val_basic_1)=
);
-+  };
- }
-diff --git a/test/torrent/utils/test_extents.h b/test/torrent/utils/test_e=
xtents.h
-index fd790cf8..e187f6a7 100644
---- a/test/torrent/utils/test_extents.h
-+++ b/test/torrent/utils/test_extents.h
-@@ -1,13 +1,10 @@
--#include <cppunit/extensions/HelperMacros.h>
-+#include "helpers/test_fixture.h"
-=20
--class ExtentsTest : public CppUnit::TestFixture {
--  CPPUNIT_TEST_SUITE(ExtentsTest);
-+class test_extents : public test_fixture {
-+  CPPUNIT_TEST_SUITE(test_extents);
-   CPPUNIT_TEST(test_basic);
-   CPPUNIT_TEST_SUITE_END();
-=20
- public:
--  void setUp();
--  void tearDown();
--
-   void test_basic();
- };
-diff --git a/test/torrent/utils/log_test.cc b/test/torrent/utils/test_log.=
cc
-similarity index 92%
-rename from test/torrent/utils/log_test.cc
-rename to test/torrent/utils/test_log.cc
-index 8cc00ef8..fec7e505 100644
---- a/test/torrent/utils/log_test.cc
-+++ b/test/torrent/utils/test_log.cc
-@@ -1,5 +1,7 @@
- #include "config.h"
-=20
-+#include "test_log.h"
-+
- #include <algorithm>
- #include <cstring>
- #include <fstream>
-@@ -9,15 +11,13 @@
- #include <torrent/exceptions.h>
- #include <torrent/utils/log.h>
-=20
--#include "log_test.h"
-+CPPUNIT_TEST_SUITE_NAMED_REGISTRATION(test_log, "torrent/utils");
-=20
- namespace torrent {
- typedef std::vector<std::pair<std::string, log_slot> > log_output_list;
- extern log_output_list log_outputs;
- }
-=20
--CPPUNIT_TEST_SUITE_REGISTRATION(utils_log_test);
--
- const char* expected_output =3D NULL;
- unsigned int output_mask;
-=20
-@@ -35,19 +35,19 @@ test_output(const char* output, unsigned int length, u=
nsigned int mask) {
-   CPPUNIT_ASSERT(output_mask =3D=3D (mask));
-=20
- void
--utils_log_test::setUp() {
-+test_log::setUp() {
-   // Don't initialize since this creates the group->child connections.
-   //  torrent::log_initialize();
-   torrent::log_cleanup();
- }
-=20
- void
--utils_log_test::tearDown() {
-+test_log::tearDown() {
-   torrent::log_cleanup();
- }
-=20
- void
--utils_log_test::test_basic() {
-+test_log::test_basic() {
-   CPPUNIT_ASSERT(!torrent::log_groups.empty());
-   CPPUNIT_ASSERT(torrent::log_groups.size() =3D=3D torrent::LOG_GROUP_MAX=
_SIZE);
-=20
-@@ -61,7 +61,7 @@ open_output(const char* name, int mask =3D 0) {
- }
-=20
- void
--utils_log_test::test_output_open() {
-+test_log::test_output_open() {
-   CPPUNIT_ASSERT(torrent::log_groups[0].size_outputs() =3D=3D 0);
-=20
-   // Add test for unknown output names.
-@@ -92,7 +92,7 @@ utils_log_test::test_output_open() {
- // on unused log items.
-=20
- void
--utils_log_test::test_print() {
-+test_log::test_print() {
-   open_output("test_print_1", 0x1);
-   open_output("test_print_2", 0x2);
-   torrent::log_add_group_output(0, "test_print_1");
-@@ -113,7 +113,7 @@ enum {
- };
-=20
- void
--utils_log_test::test_children() {
-+test_log::test_children() {
-   open_output("test_children_1", 0x1);
-   open_output("test_children_2", 0x2);
-   torrent::log_add_group_output(GROUP_PARENT_1, "test_children_1");
-@@ -136,8 +136,8 @@ utils_log_test::test_children() {
- }
-=20
- void
--utils_log_test::test_file_output() {
--  std::string filename =3D "utils_log_test.XXXXXX";
-+test_log::test_file_output() {
-+  std::string filename =3D "test_log.XXXXXX";
-=20
-   mktemp(&*filename.begin());
-=20
-@@ -159,8 +159,8 @@ utils_log_test::test_file_output() {
- }
-=20
- void
--utils_log_test::test_file_output_append() {
--  std::string filename =3D "utils_log_test.XXXXXX";
-+test_log::test_file_output_append() {
-+  std::string filename =3D "test_log.XXXXXX";
-=20
-   mktemp(&*filename.begin());
-=20
-diff --git a/test/torrent/utils/log_test.h b/test/torrent/utils/test_log.h
-similarity index 71%
-rename from test/torrent/utils/log_test.h
-rename to test/torrent/utils/test_log.h
-index d4cb3bc6..a06c95ae 100644
---- a/test/torrent/utils/log_test.h
-+++ b/test/torrent/utils/test_log.h
-@@ -1,9 +1,7 @@
--#include <cppunit/extensions/HelperMacros.h>
-+#include "helpers/test_fixture.h"
-=20
--#include "torrent/utils/log.h"
--
--class utils_log_test : public CppUnit::TestFixture {
--  CPPUNIT_TEST_SUITE(utils_log_test);
-+class test_log : public test_fixture {
-+  CPPUNIT_TEST_SUITE(test_log);
-   CPPUNIT_TEST(test_basic);
-   CPPUNIT_TEST(test_output_open);
-=20
-diff --git a/test/torrent/utils/test_log_buffer.cc b/test/torrent/utils/te=
st_log_buffer.cc
-index a56a5365..58412750 100644
---- a/test/torrent/utils/test_log_buffer.cc
-+++ b/test/torrent/utils/test_log_buffer.cc
-@@ -7,18 +7,10 @@
-=20
- CPPUNIT_TEST_SUITE_NAMED_REGISTRATION(test_log_buffer, "torrent/utils");
-=20
--void
--test_log_buffer::setUp() {
--  torrent::cachedTime =3D rak::timer::from_seconds(1000);
--}
--
--void
--test_log_buffer::tearDown() {
--}
--
- void
- test_log_buffer::test_basic() {
-   torrent::log_buffer log;
-+  torrent::cachedTime =3D rak::timer::from_seconds(1000);
-=20
-   log.lock();
-   CPPUNIT_ASSERT(log.empty());
-@@ -46,6 +38,7 @@ test_log_buffer::test_basic() {
- void
- test_log_buffer::test_timestamps() {
-   torrent::log_buffer log;
-+  torrent::cachedTime =3D rak::timer::from_seconds(1000);
-=20
-   log.lock_and_push_log("foobar", 6, 0);
-   CPPUNIT_ASSERT(log.back().timestamp =3D=3D 1000);
-diff --git a/test/torrent/utils/test_log_buffer.h b/test/torrent/utils/tes=
t_log_buffer.h
-index 290df4c1..39c6b879 100644
---- a/test/torrent/utils/test_log_buffer.h
-+++ b/test/torrent/utils/test_log_buffer.h
-@@ -2,16 +2,11 @@
-=20
- class test_log_buffer : public test_fixture {
-   CPPUNIT_TEST_SUITE(test_log_buffer);
--
-   CPPUNIT_TEST(test_basic);
-   CPPUNIT_TEST(test_timestamps);
--
-   CPPUNIT_TEST_SUITE_END();
-=20
- public:
--  void setUp();
--  void tearDown();
--
-   void test_basic();
-   void test_timestamps();
- };
-diff --git a/test/torrent/utils/option_strings_test.cc b/test/torrent/util=
s/test_option_strings.cc
-similarity index 65%
-rename from test/torrent/utils/option_strings_test.cc
-rename to test/torrent/utils/test_option_strings.cc
-index a9bdcc89..68da1d2b 100644
---- a/test/torrent/utils/option_strings_test.cc
-+++ b/test/torrent/utils/test_option_strings.cc
-@@ -1,35 +1,22 @@
- #include "config.h"
-=20
--#include <fstream>
--#include <functional>
--#include <iostream>
-+#include "test_option_strings.h"
-=20
--#include <torrent/exceptions.h>
--#include <torrent/utils/option_strings.h>
--
--#include <torrent/connection_manager.h>
--#include <torrent/object.h>
- #include <torrent/download.h>
--#include <torrent/download/choke_group.h>
--#include <torrent/download/choke_queue.h>
-+#include <torrent/utils/option_strings.h>
- #include <torrent/utils/log.h>
-=20
--#include "option_strings_test.h"
--
--CPPUNIT_TEST_SUITE_REGISTRATION(option_strings_test);
--
--void
--option_strings_test::test_basic() {
-- =20
--}
-+CPPUNIT_TEST_SUITE_NAMED_REGISTRATION(test_option_strings, "torrent/utils=
");
-=20
- #define TEST_ENTRY(group, name, value)                                  \
--  { std::string result(torrent::option_as_string(torrent::group, value));=
 \
-+  { lt_log_print(torrent::LOG_MOCK_CALLS, "option_string: %s", name);   \
-+    std::string result(torrent::option_as_string(torrent::group, value));=
 \
-     CPPUNIT_ASSERT_MESSAGE("Not found '" + result + "'", result =3D=3D na=
me); \
--    CPPUNIT_ASSERT(torrent::option_find_string(torrent::group, name) =3D=
=3D value); }
-+    CPPUNIT_ASSERT(torrent::option_find_string(torrent::group, name) =3D=
=3D value); \
-+  }
-=20
- void
--option_strings_test::test_entries() {
-+test_option_strings::test_entries() {
-   TEST_ENTRY(OPTION_CONNECTION_TYPE, "leech", torrent::Download::CONNECTI=
ON_LEECH);
-   TEST_ENTRY(OPTION_CONNECTION_TYPE, "seed", torrent::Download::CONNECTIO=
N_SEED);
-   TEST_ENTRY(OPTION_CONNECTION_TYPE, "initial_seed", torrent::Download::C=
ONNECTION_INITIAL_SEED);
-diff --git a/test/torrent/utils/test_option_strings.h b/test/torrent/utils=
/test_option_strings.h
-new file mode 100644
-index 00000000..dc86e735
---- /dev/null
-+++ b/test/torrent/utils/test_option_strings.h
-@@ -0,0 +1,10 @@
-+#include "helpers/test_fixture.h"
-+
-+class test_option_strings : public test_fixture {
-+  CPPUNIT_TEST_SUITE(test_option_strings);
-+  CPPUNIT_TEST(test_entries);
-+  CPPUNIT_TEST_SUITE_END();
-+
-+public:
-+  void test_entries();
-+};
-diff --git a/test/torrent/utils/test_queue_buckets.cc b/test/torrent/utils=
/test_queue_buckets.cc
-index a32d17e7..49d1bae6 100644
---- a/test/torrent/utils/test_queue_buckets.cc
-+++ b/test/torrent/utils/test_queue_buckets.cc
-@@ -5,7 +5,7 @@
- #include "utils/instrumentation.h"
- #include "utils/queue_buckets.h"
-=20
--CPPUNIT_TEST_SUITE_REGISTRATION(TestQueueBuckets);
-+CPPUNIT_TEST_SUITE_NAMED_REGISTRATION(test_queue_buckets, "torrent/utils"=
);
-=20
- struct test_constants {
-   static const int bucket_count =3D 2;
-@@ -87,7 +87,7 @@ struct test_queue_bucket_compare {
- //
-=20
- void
--TestQueueBuckets::test_basic() {
-+test_queue_buckets::test_basic() {
-   torrent::instrumentation_initialize();
-=20
-   buckets_type buckets;
-@@ -129,7 +129,7 @@ TestQueueBuckets::test_basic() {
- }
-=20
- void
--TestQueueBuckets::test_erase() {
-+test_queue_buckets::test_erase() {
-   items_destroyed =3D 0;
-   torrent::instrumentation_initialize();
-=20
-@@ -162,7 +162,7 @@ bucket_queue_find_in_any(const buckets_type& buckets, =
int value) {
- }
-=20
- void
--TestQueueBuckets::test_find() {
-+test_queue_buckets::test_find() {
-   items_destroyed =3D 0;
-   torrent::instrumentation_initialize();
-=20
-@@ -183,7 +183,7 @@ TestQueueBuckets::test_find() {
- }
-=20
- void
--TestQueueBuckets::test_destroy_range() {
-+test_queue_buckets::test_destroy_range() {
-   items_destroyed =3D 0;
-   torrent::instrumentation_initialize();
-=20
-@@ -206,7 +206,7 @@ TestQueueBuckets::test_destroy_range() {
- }
-=20
- void
--TestQueueBuckets::test_move_range() {
-+test_queue_buckets::test_move_range() {
-   items_destroyed =3D 0;
-   torrent::instrumentation_initialize();
-=20
-diff --git a/test/torrent/utils/test_queue_buckets.h b/test/torrent/utils/=
test_queue_buckets.h
-index 94624573..a7f1c30a 100644
---- a/test/torrent/utils/test_queue_buckets.h
-+++ b/test/torrent/utils/test_queue_buckets.h
-@@ -1,21 +1,18 @@
--#include <cppunit/extensions/HelperMacros.h>
-+#include "helpers/test_fixture.h"
-=20
--#include "protocol/request_list.h"
-+class test_queue_buckets : public test_fixture {
-+  CPPUNIT_TEST_SUITE(test_queue_buckets);
-=20
--class TestQueueBuckets : public CppUnit::TestFixture {
--  CPPUNIT_TEST_SUITE(TestQueueBuckets);
-   CPPUNIT_TEST(test_basic);
-   CPPUNIT_TEST(test_erase);
-   CPPUNIT_TEST(test_find);
-=20
-   CPPUNIT_TEST(test_destroy_range);
-   CPPUNIT_TEST(test_move_range);
-+
-   CPPUNIT_TEST_SUITE_END();
-=20
- public:
--  void setUp() {}
--  void tearDown() {}
--
-   void test_basic();
-   void test_erase();
-   void test_find();
-diff --git a/test/torrent/utils/signal_bitfield_test.cc b/test/torrent/uti=
ls/test_signal_bitfield.cc
-similarity index 85%
-rename from test/torrent/utils/signal_bitfield_test.cc
-rename to test/torrent/utils/test_signal_bitfield.cc
-index 34b622b3..4ecd18c0 100644
---- a/test/torrent/utils/signal_bitfield_test.cc
-+++ b/test/torrent/utils/test_signal_bitfield.cc
-@@ -1,13 +1,15 @@
- #include "config.h"
-=20
-+#include "test_signal_bitfield.h"
-+
-+#include "helpers/test_thread.h"
-+#include "helpers/test_utils.h"
-+
- #include <torrent/exceptions.h>
- #include <torrent/utils/signal_bitfield.h>
- #include <torrent/utils/thread_base.h>
-=20
--#include "signal_bitfield_test.h"
--#include "thread_base_test.h"
--
--CPPUNIT_TEST_SUITE_REGISTRATION(utils_signal_bitfield_test);
-+CPPUNIT_TEST_SUITE_NAMED_REGISTRATION(test_signal_bitfield, "torrent/util=
s");
-=20
- static void
- mark_index(uint32_t* bitfield, unsigned int index) {
-@@ -20,13 +22,10 @@ check_index(uint32_t* bitfield, unsigned int index) {
- }
-=20
- void
--utils_signal_bitfield_test::setUp() {
--}
--
--void
--utils_signal_bitfield_test::tearDown() {
-+test_signal_bitfield::tearDown() {
-   CPPUNIT_ASSERT(torrent::thread_base::trylock_global_lock());
-   torrent::thread_base::release_global_lock();
-+  test_fixture::tearDown();
- }
-=20
- static bool
-@@ -54,7 +53,7 @@ verify_did_internal_error(std::function<unsigned int ()>=
 func, bool should_throw
-                                            did_throw));
-=20
- void
--utils_signal_bitfield_test::test_basic() {
-+test_signal_bitfield::test_basic() {
-   SETUP_SIGNAL_BITFIELD();
-=20
-   CPPUNIT_ASSERT(torrent::signal_bitfield::max_size =3D=3D sizeof(torrent=
::signal_bitfield::bitfield_type) * 8);
-@@ -68,7 +67,7 @@ utils_signal_bitfield_test::test_basic() {
- }
-=20
- void
--utils_signal_bitfield_test::test_single() {
-+test_signal_bitfield::test_single() {
-   SETUP_SIGNAL_BITFIELD();
-=20
-   CPPUNIT_ASSERT(signal_bitfield.add_signal(std::bind(&mark_index, &marke=
d_bitfield, 0)) =3D=3D 0);
-@@ -86,7 +85,7 @@ utils_signal_bitfield_test::test_single() {
- }
-=20
- void
--utils_signal_bitfield_test::test_multiple() {
-+test_signal_bitfield::test_multiple() {
-   SETUP_SIGNAL_BITFIELD();
-=20
-   for (unsigned int i =3D 0; i < torrent::signal_bitfield::max_size; i++)
-@@ -106,10 +105,10 @@ utils_signal_bitfield_test::test_multiple() {
- }
-=20
- void
--utils_signal_bitfield_test::test_thread() {
-+test_signal_bitfield::test_threaded() {
-   uint32_t marked_bitfield =3D 0;
--  thread_test* thread =3D new thread_test;
--  // thread->set_test_flag(thread_test::test_flag_long_timeout);
-+  test_thread* thread =3D new test_thread;
-+  // thread->set_test_flag(test_thread::test_flag_long_timeout);
-=20
-   for (unsigned int i =3D 0; i < torrent::signal_bitfield::max_size; i++)
-     CPPUNIT_ASSERT(thread->signal_bitfield()->add_signal(std::bind(&mark_=
index, &marked_bitfield, i)) =3D=3D i);
-@@ -131,7 +130,7 @@ utils_signal_bitfield_test::test_thread() {
-   }
-=20
-   thread->stop_thread();
--  CPPUNIT_ASSERT(wait_for_true(std::bind(&thread_test::is_state, thread, =
thread_test::STATE_INACTIVE)));
-+  CPPUNIT_ASSERT(wait_for_true(std::bind(&test_thread::is_state, thread, =
test_thread::STATE_INACTIVE)));
-=20
-   delete thread;
- }
-diff --git a/test/torrent/utils/test_signal_bitfield.h b/test/torrent/util=
s/test_signal_bitfield.h
-new file mode 100644
-index 00000000..2d24d955
---- /dev/null
-+++ b/test/torrent/utils/test_signal_bitfield.h
-@@ -0,0 +1,22 @@
-+#include "helpers/test_fixture.h"
-+
-+class test_signal_bitfield : public test_fixture {
-+  CPPUNIT_TEST_SUITE(test_signal_bitfield);
-+
-+  CPPUNIT_TEST(test_basic);
-+  CPPUNIT_TEST(test_single);
-+  CPPUNIT_TEST(test_multiple);
-+
-+  CPPUNIT_TEST(test_threaded);
-+
-+  CPPUNIT_TEST_SUITE_END();
-+
-+public:
-+  void tearDown();
-+
-+  void test_basic();
-+  void test_single();
-+  void test_multiple();
-+
-+  void test_threaded();
-+};
-diff --git a/test/torrent/utils/test_thread_base.cc b/test/torrent/utils/t=
est_thread_base.cc
-new file mode 100644
-index 00000000..33519b7c
---- /dev/null
-+++ b/test/torrent/utils/test_thread_base.cc
-@@ -0,0 +1,169 @@
-+#include "config.h"
-+
-+#include "test_thread_base.h"
-+
-+#include "helpers/test_thread.h"
-+#include "helpers/test_utils.h"
-+
-+#include <functional>
-+#include <unistd.h>
-+
-+#include "torrent/exceptions.h"
-+#include "torrent/poll_select.h"
-+#include "torrent/utils/log.h"
-+#include "torrent/utils/thread_base.h"
-+
-+CPPUNIT_TEST_SUITE_NAMED_REGISTRATION(test_thread_base, "torrent/utils");
-+
-+#define TEST_BEGIN(name)                                           \
-+  lt_log_print(torrent::LOG_MOCK_CALLS, "thread_base: %s", name);  \
-+
-+void throw_shutdown_exception() { throw torrent::shutdown_exception(); }
-+
-+void
-+test_thread_base::tearDown() {
-+  CPPUNIT_ASSERT(torrent::thread_base::trylock_global_lock());
-+  torrent::thread_base::release_global_lock();
-+  test_fixture::tearDown();
-+}
-+
-+void
-+test_thread_base::test_basic() {
-+  test_thread* thread =3D new test_thread;
-+
-+  CPPUNIT_ASSERT(thread->flags() =3D=3D 0);
-+
-+  CPPUNIT_ASSERT(!thread->is_main_polling());
-+  CPPUNIT_ASSERT(!thread->is_active());
-+  CPPUNIT_ASSERT(thread->global_queue_size() =3D=3D 0);
-+  CPPUNIT_ASSERT(thread->poll() =3D=3D NULL);
-+
-+  // Check active...
-+}
-+
-+void
-+test_thread_base::test_lifecycle() {
-+  test_thread* thread =3D new test_thread;
-+
-+  CPPUNIT_ASSERT(thread->state() =3D=3D torrent::thread_base::STATE_UNKNO=
WN);
-+  CPPUNIT_ASSERT(thread->test_state() =3D=3D test_thread::TEST_NONE);
-+
-+  thread->init_thread();
-+  CPPUNIT_ASSERT(thread->state() =3D=3D torrent::thread_base::STATE_INITI=
ALIZED);
-+  CPPUNIT_ASSERT(thread->is_initialized());
-+  CPPUNIT_ASSERT(thread->test_state() =3D=3D test_thread::TEST_PRE_START)=
;
-+
-+  thread->set_pre_stop();
-+  CPPUNIT_ASSERT(!wait_for_true(std::bind(&test_thread::is_test_state, th=
read, test_thread::TEST_PRE_STOP)));
-+
-+  thread->start_thread();
-+  CPPUNIT_ASSERT(wait_for_true(std::bind(&test_thread::is_state, thread, =
test_thread::STATE_ACTIVE)));
-+  CPPUNIT_ASSERT(thread->is_active());
-+  CPPUNIT_ASSERT(wait_for_true(std::bind(&test_thread::is_test_state, thr=
ead, test_thread::TEST_PRE_STOP)));
-+
-+  thread->stop_thread();
-+  CPPUNIT_ASSERT(wait_for_true(std::bind(&test_thread::is_state, thread, =
test_thread::STATE_INACTIVE)));
-+  CPPUNIT_ASSERT(thread->is_inactive());
-+
-+  delete thread;
-+}
-+
-+void
-+test_thread_base::test_global_lock_basic() {
-+  test_thread* thread =3D new test_thread;
-+ =20
-+  thread->init_thread();
-+  thread->start_thread();
-+ =20
-+  CPPUNIT_ASSERT(torrent::thread_base::global_queue_size() =3D=3D 0);
-+
-+  // Acquire main thread...
-+  CPPUNIT_ASSERT(torrent::thread_base::trylock_global_lock());
-+  CPPUNIT_ASSERT(!torrent::thread_base::trylock_global_lock());
-+
-+  torrent::thread_base::release_global_lock();
-+  CPPUNIT_ASSERT(torrent::thread_base::trylock_global_lock());
-+  CPPUNIT_ASSERT(!torrent::thread_base::trylock_global_lock());
-+   =20
-+  torrent::thread_base::release_global_lock();
-+  torrent::thread_base::acquire_global_lock();
-+  CPPUNIT_ASSERT(!torrent::thread_base::trylock_global_lock());
-+
-+  thread->set_acquire_global();
-+  CPPUNIT_ASSERT(!wait_for_true(std::bind(&test_thread::is_test_flags, th=
read, test_thread::test_flag_has_global)));
-+ =20
-+  torrent::thread_base::release_global_lock();
-+  CPPUNIT_ASSERT(wait_for_true(std::bind(&test_thread::is_test_flags, thr=
ead, test_thread::test_flag_has_global)));
-+
-+  CPPUNIT_ASSERT(!torrent::thread_base::trylock_global_lock());
-+  torrent::thread_base::release_global_lock();
-+  CPPUNIT_ASSERT(torrent::thread_base::trylock_global_lock());
-+
-+  // Test waive (loop).
-+
-+  CPPUNIT_ASSERT(torrent::thread_base::global_queue_size() =3D=3D 0);
-+
-+  torrent::thread_base::release_global_lock();
-+  thread->stop_thread();
-+  CPPUNIT_ASSERT(wait_for_true(std::bind(&test_thread::is_state, thread, =
test_thread::STATE_INACTIVE)));
-+
-+  delete thread;
-+}
-+
-+void
-+test_thread_base::test_interrupt() {
-+  test_thread* thread =3D new test_thread;
-+  thread->set_test_flag(test_thread::test_flag_long_timeout);
-+
-+  thread->init_thread();
-+  thread->start_thread();
-+
-+  // Vary the various timeouts.
-+
-+  for (int i =3D 0; i < 100; i++) {
-+    thread->interrupt();
-+    usleep(0);
-+
-+    thread->set_test_flag(test_thread::test_flag_do_work);
-+    thread->interrupt();
-+
-+    // Wait for flag to clear.
-+    CPPUNIT_ASSERT(wait_for_true(std::bind(&test_thread::is_not_test_flag=
s, thread, test_thread::test_flag_do_work)));
-+  }
-+
-+  thread->stop_thread();
-+  CPPUNIT_ASSERT(wait_for_true(std::bind(&test_thread::is_state, thread, =
test_thread::STATE_INACTIVE)));
-+
-+  delete thread;
-+}
-+
-+void
-+test_thread_base::test_stop() {
-+  { TEST_BEGIN("trylock global lock");
-+    CPPUNIT_ASSERT(torrent::thread_base::trylock_global_lock());
-+    // torrent::thread_base::acquire_global_lock();
-+  };
-+
-+  for (int i =3D 0; i < 20; i++) {
-+    CPPUNIT_ASSERT(!torrent::thread_base::trylock_global_lock());
-+
-+    test_thread* thread =3D new test_thread;
-+    thread->set_test_flag(test_thread::test_flag_do_work);
-+
-+    { TEST_BEGIN("init and start thread");
-+      thread->init_thread();
-+      thread->start_thread();
-+    };
-+
-+    { TEST_BEGIN("stop and delete thread");
-+      thread->stop_thread_wait();
-+      CPPUNIT_ASSERT(thread->is_inactive());
-+
-+      delete thread;
-+    }
-+  }
-+
-+  { TEST_BEGIN("release global lock");
-+    torrent::thread_base::release_global_lock();
-+  };
-+}
-diff --git a/test/torrent/utils/test_thread_base.h b/test/torrent/utils/te=
st_thread_base.h
-new file mode 100644
-index 00000000..7b2a3432
---- /dev/null
-+++ b/test/torrent/utils/test_thread_base.h
-@@ -0,0 +1,25 @@
-+#include "helpers/test_fixture.h"
-+
-+class test_thread_base : public test_fixture {
-+  CPPUNIT_TEST_SUITE(test_thread_base);
-+
-+  CPPUNIT_TEST(test_basic);
-+  CPPUNIT_TEST(test_lifecycle);
-+
-+  CPPUNIT_TEST(test_global_lock_basic);
-+  CPPUNIT_TEST(test_interrupt);
-+  CPPUNIT_TEST(test_stop);
-+
-+  CPPUNIT_TEST_SUITE_END();
-+
-+public:
-+  void tearDown();
-+
-+  void test_basic();
-+  void test_lifecycle();
-+
-+  void test_global_lock_basic();
-+  void test_interrupt();
-+  void test_interrupt_legacy();
-+  void test_stop();
-+};
-diff --git a/test/torrent/utils/test_uri_parser.cc b/test/torrent/utils/te=
st_uri_parser.cc
-index 1f4bebe8..66d6cda5 100644
---- a/test/torrent/utils/test_uri_parser.cc
-+++ b/test/torrent/utils/test_uri_parser.cc
-@@ -2,31 +2,22 @@
-=20
- #include "test_uri_parser.h"
-=20
--#include <cinttypes>
--#include <iostream>
-+#include <torrent/utils/log.h>
- #include <torrent/utils/uri_parser.h>
-=20
--CPPUNIT_TEST_SUITE_REGISTRATION(UriParserTest);
--
--void
--UriParserTest::setUp() {
--}
--
--void
--UriParserTest::tearDown() {
--}
-+CPPUNIT_TEST_SUITE_NAMED_REGISTRATION(test_uri_parser, "torrent/utils");
-=20
- void
- test_print_uri_state(torrent::utils::uri_state state) {
--  std::cerr << "state.uri: " << state.uri << std::endl;
--  std::cerr << "state.scheme: " << state.scheme << std::endl;
--  std::cerr << "state.resource: " << state.resource << std::endl;
--  std::cerr << "state.query: " << state.query << std::endl;
--  std::cerr << "state.fragment: " << state.fragment << std::endl;
-+  lt_log_print(torrent::LOG_MOCK_CALLS, "state.uri: %s", state.uri.c_str(=
));
-+  lt_log_print(torrent::LOG_MOCK_CALLS, "state.scheme: %s", state.scheme.=
c_str());
-+  lt_log_print(torrent::LOG_MOCK_CALLS, "state.resource: %s", state.resou=
rce.c_str());
-+  lt_log_print(torrent::LOG_MOCK_CALLS, "state.query: %s", state.query.c_=
str());
-+  lt_log_print(torrent::LOG_MOCK_CALLS, "state.fragment: %s", state.fragm=
ent.c_str());
- }
-=20
- void
--UriParserTest::test_basic() {
-+test_uri_parser::test_basic() {
-   torrent::utils::uri_state state;
-=20
-   CPPUNIT_ASSERT(state.state =3D=3D torrent::utils::uri_state::state_empt=
y);
-@@ -37,7 +28,7 @@ UriParserTest::test_basic() {
- #define MAGNET_BASIC "magnet:?xt=3Durn:sha1:YNCKHTQCWBTRNJIV4WNAE52SJUQCZ=
O5C"
-=20
- void
--UriParserTest::test_basic_magnet() {
-+test_uri_parser::test_basic_magnet() {
-   torrent::utils::uri_state state;
-=20
-   uri_parse_str(MAGNET_BASIC, state);
-@@ -63,7 +54,7 @@ UriParserTest::test_basic_magnet() {
- #define QUERY_MAGNET "magnet:?" QUERY_MAGNET_QUERY
-=20
- void
--UriParserTest::test_query_magnet() {
-+test_uri_parser::test_query_magnet() {
-   torrent::utils::uri_state state;
-   torrent::utils::uri_query_state query_state;
-=20
-@@ -82,7 +73,7 @@ UriParserTest::test_query_magnet() {
-   uri_parse_query_str(state.query, query_state);
-  =20
-   for (auto element : query_state.elements)
--    std::cerr << "query_element: " << element << std::endl;
-+    lt_log_print(torrent::LOG_MOCK_CALLS, "query_element: %s", element.c_=
str());
-=20
-   CPPUNIT_ASSERT(query_state.state =3D=3D torrent::utils::uri_query_state=
::state_valid);
-=20
-diff --git a/test/torrent/utils/test_uri_parser.h b/test/torrent/utils/tes=
t_uri_parser.h
-index 4f1c2586..f978c8ad 100644
---- a/test/torrent/utils/test_uri_parser.h
-+++ b/test/torrent/utils/test_uri_parser.h
-@@ -1,16 +1,15 @@
--#include <cppunit/extensions/HelperMacros.h>
-+#include "helpers/test_fixture.h"
-+
-+class test_uri_parser : public test_fixture {
-+  CPPUNIT_TEST_SUITE(test_uri_parser);
-=20
--class UriParserTest : public CppUnit::TestFixture {
--  CPPUNIT_TEST_SUITE(UriParserTest);
-   CPPUNIT_TEST(test_basic);
-   CPPUNIT_TEST(test_basic_magnet);
-   CPPUNIT_TEST(test_query_magnet);
-+
-   CPPUNIT_TEST_SUITE_END();
-=20
- public:
--  void setUp();
--  void tearDown();
--
-   void test_basic();
-   void test_basic_magnet();
-   void test_query_magnet();
-diff --git a/test/torrent/utils/thread_base_test.cc b/test/torrent/utils/t=
hread_base_test.cc
-deleted file mode 100644
-index 8366c9ba..00000000
---- a/test/torrent/utils/thread_base_test.cc
-+++ /dev/null
-@@ -1,224 +0,0 @@
--#include "config.h"
--
--#include <functional>
--#include <unistd.h>
--
--#include <torrent/exceptions.h>
--#include <torrent/poll_select.h>
--#include <torrent/utils/thread_base.h>
--
--#include "thread_base_test.h"
--
--CPPUNIT_TEST_SUITE_REGISTRATION(utils_thread_base_test);
--
--const int thread_test::test_flag_pre_stop;
--const int thread_test::test_flag_long_timeout;
--
--const int thread_test::test_flag_acquire_global;
--const int thread_test::test_flag_has_global;
--
--const int thread_test::test_flag_do_work;
--const int thread_test::test_flag_pre_poke;
--const int thread_test::test_flag_post_poke;
--
--void throw_shutdown_exception() { throw torrent::shutdown_exception(); }
--
--thread_test::thread_test() :
--  m_test_state(TEST_NONE),
--  m_test_flags(0) {
--}
--
--void
--thread_test::init_thread() {
--  m_state =3D STATE_INITIALIZED;
--  m_test_state =3D TEST_PRE_START;
--  m_poll =3D torrent::PollSelect::create(256);
--}
--
--void
--thread_test::call_events() {
--  if ((m_test_flags & test_flag_pre_stop) && m_test_state =3D=3D TEST_PRE=
_START && m_state =3D=3D STATE_ACTIVE)
--    __sync_lock_test_and_set(&m_test_state, TEST_PRE_STOP);
--
--  if ((m_test_flags & test_flag_acquire_global)) {
--    acquire_global_lock();
--    __sync_and_and_fetch(&m_test_flags, ~test_flag_acquire_global);
--    __sync_or_and_fetch(&m_test_flags, test_flag_has_global);
--  }
--
--  if ((m_flags & flag_do_shutdown)) {
--    if ((m_flags & flag_did_shutdown))
--      throw torrent::internal_error("Already trigged shutdown.");
--
--    __sync_or_and_fetch(&m_flags, flag_did_shutdown);
--    throw torrent::shutdown_exception();
--  }
--
--  if ((m_test_flags & test_flag_pre_poke)) {
--  }
--
--  if ((m_test_flags & test_flag_do_work)) {
--    usleep(10 * 1000); // TODO: Don't just sleep, as that give up core.
--    __sync_and_and_fetch(&m_test_flags, ~test_flag_do_work);
--  }
--
--  if ((m_test_flags & test_flag_post_poke)) {
--  }
--}
--
--bool
--wait_for_true(std::function<bool ()> test_function) {
--  int i =3D 100;
--
--  do {
--    if (test_function())
--      return true;
--
--    usleep(10 * 1000);
--  } while (--i);
--
--  return false;
--}
--
--void
--utils_thread_base_test::setUp() {
--}
--
--void
--utils_thread_base_test::tearDown() {
--  CPPUNIT_ASSERT(torrent::thread_base::trylock_global_lock());
--  torrent::thread_base::release_global_lock();
--}
--
--void
--utils_thread_base_test::test_basic() {
--  thread_test* thread =3D new thread_test;
--
--  CPPUNIT_ASSERT(thread->flags() =3D=3D 0);
--
--  CPPUNIT_ASSERT(!thread->is_main_polling());
--  CPPUNIT_ASSERT(!thread->is_active());
--  CPPUNIT_ASSERT(thread->global_queue_size() =3D=3D 0);
--  CPPUNIT_ASSERT(thread->poll() =3D=3D NULL);
--
--  // Check active...
--}
--
--void
--utils_thread_base_test::test_lifecycle() {
--  thread_test* thread =3D new thread_test;
--
--  CPPUNIT_ASSERT(thread->state() =3D=3D torrent::thread_base::STATE_UNKNO=
WN);
--  CPPUNIT_ASSERT(thread->test_state() =3D=3D thread_test::TEST_NONE);
--
--  thread->init_thread();
--  CPPUNIT_ASSERT(thread->state() =3D=3D torrent::thread_base::STATE_INITI=
ALIZED);
--  CPPUNIT_ASSERT(thread->is_initialized());
--  CPPUNIT_ASSERT(thread->test_state() =3D=3D thread_test::TEST_PRE_START)=
;
--
--  thread->set_pre_stop();
--  CPPUNIT_ASSERT(!wait_for_true(std::bind(&thread_test::is_test_state, th=
read, thread_test::TEST_PRE_STOP)));
--
--  thread->start_thread();
--  CPPUNIT_ASSERT(wait_for_true(std::bind(&thread_test::is_state, thread, =
thread_test::STATE_ACTIVE)));
--  CPPUNIT_ASSERT(thread->is_active());
--  CPPUNIT_ASSERT(wait_for_true(std::bind(&thread_test::is_test_state, thr=
ead, thread_test::TEST_PRE_STOP)));
--
--  thread->stop_thread();
--  CPPUNIT_ASSERT(wait_for_true(std::bind(&thread_test::is_state, thread, =
thread_test::STATE_INACTIVE)));
--  CPPUNIT_ASSERT(thread->is_inactive());
--
--  delete thread;
--}
--
--void
--utils_thread_base_test::test_global_lock_basic() {
--  thread_test* thread =3D new thread_test;
-- =20
--  thread->init_thread();
--  thread->start_thread();
-- =20
--  CPPUNIT_ASSERT(torrent::thread_base::global_queue_size() =3D=3D 0);
--
--  // Acquire main thread...
--  CPPUNIT_ASSERT(torrent::thread_base::trylock_global_lock());
--  CPPUNIT_ASSERT(!torrent::thread_base::trylock_global_lock());
--
--  torrent::thread_base::release_global_lock();
--  CPPUNIT_ASSERT(torrent::thread_base::trylock_global_lock());
--  CPPUNIT_ASSERT(!torrent::thread_base::trylock_global_lock());
--   =20
--  torrent::thread_base::release_global_lock();
--  torrent::thread_base::acquire_global_lock();
--  CPPUNIT_ASSERT(!torrent::thread_base::trylock_global_lock());
--
--  thread->set_acquire_global();
--  CPPUNIT_ASSERT(!wait_for_true(std::bind(&thread_test::is_test_flags, th=
read, thread_test::test_flag_has_global)));
-- =20
--  torrent::thread_base::release_global_lock();
--  CPPUNIT_ASSERT(wait_for_true(std::bind(&thread_test::is_test_flags, thr=
ead, thread_test::test_flag_has_global)));
--
--  CPPUNIT_ASSERT(!torrent::thread_base::trylock_global_lock());
--  torrent::thread_base::release_global_lock();
--  CPPUNIT_ASSERT(torrent::thread_base::trylock_global_lock());
--
--  // Test waive (loop).
--
--  CPPUNIT_ASSERT(torrent::thread_base::global_queue_size() =3D=3D 0);
--
--  torrent::thread_base::release_global_lock();
--  thread->stop_thread();
--  CPPUNIT_ASSERT(wait_for_true(std::bind(&thread_test::is_state, thread, =
thread_test::STATE_INACTIVE)));
--
--  delete thread;
--}
--
--void
--utils_thread_base_test::test_interrupt() {
--  thread_test* thread =3D new thread_test;
--  thread->set_test_flag(thread_test::test_flag_long_timeout);
--
--  thread->init_thread();
--  thread->start_thread();
--
--  // Vary the various timeouts.
--
--  for (int i =3D 0; i < 100; i++) {
--    thread->interrupt();
--    usleep(0);
--
--    thread->set_test_flag(thread_test::test_flag_do_work);
--    thread->interrupt();
--
--    // Wait for flag to clear.
--    CPPUNIT_ASSERT(wait_for_true(std::bind(&thread_test::is_not_test_flag=
s, thread, thread_test::test_flag_do_work)));
--  }
--
--  thread->stop_thread();
--  CPPUNIT_ASSERT(wait_for_true(std::bind(&thread_test::is_state, thread, =
thread_test::STATE_INACTIVE)));
--
--  delete thread;
--}
--
--void
--utils_thread_base_test::test_stop() {
--  CPPUNIT_ASSERT(torrent::thread_base::trylock_global_lock());
--  // torrent::thread_base::acquire_global_lock();
--
--  for (int i =3D 0; i < 20; i++) {
--    CPPUNIT_ASSERT(!torrent::thread_base::trylock_global_lock());
--
--    thread_test* thread =3D new thread_test;
--    thread->set_test_flag(thread_test::test_flag_do_work);
--
--    thread->init_thread();
--    thread->start_thread();
--
--    thread->stop_thread_wait();
--    CPPUNIT_ASSERT(thread->is_inactive());
--
--    delete thread;
--  }
--
--  torrent::thread_base::release_global_lock();
--}
-diff --git a/test/torrent/utils/thread_base_test.h b/test/torrent/utils/th=
read_base_test.h
-deleted file mode 100644
-index 22eb99dc..00000000
---- a/test/torrent/utils/thread_base_test.h
-+++ /dev/null
-@@ -1,86 +0,0 @@
--#include <cppunit/extensions/HelperMacros.h>
--
--#include "torrent/utils/thread_base.h"
--
--class utils_thread_base_test : public CppUnit::TestFixture {
--  CPPUNIT_TEST_SUITE(utils_thread_base_test);
--  CPPUNIT_TEST(test_basic);
--  CPPUNIT_TEST(test_lifecycle);
--
--  CPPUNIT_TEST(test_global_lock_basic);
--  CPPUNIT_TEST(test_interrupt);
--  CPPUNIT_TEST(test_stop);
--  CPPUNIT_TEST_SUITE_END();
--
--public:
--  void setUp();
--  void tearDown();
--
--  void test_basic();
--  void test_lifecycle();
--
--  void test_global_lock_basic();
--  void test_interrupt();
--  void test_interrupt_legacy();
--  void test_stop();
--};
--
--struct thread_management_type {
--  thread_management_type() { CPPUNIT_ASSERT(torrent::thread_base::trylock=
_global_lock()); }
--  ~thread_management_type() { torrent::thread_base::release_global_lock()=
; }
--};
--
--#define SETUP_THREAD()                                                  \
--  thread_management_type thread_management;                             \
--  torrent::thread_disk* thread_disk =3D new torrent::thread_disk();      =
 \
--  thread_disk->init_thread();
--
--#define CLEANUP_THREAD()                                                \
--  CPPUNIT_ASSERT(wait_for_true(std::bind(&torrent::thread_base::is_inacti=
ve, thread_disk))); \
--  delete thread_disk;
--
--bool wait_for_true(std::function<bool ()> test_function);
--
--class thread_test : public torrent::thread_base {
--public:
--  enum test_state {
--    TEST_NONE,
--    TEST_PRE_START,
--    TEST_PRE_STOP,
--    TEST_STOP
--  };
--
--  static const int test_flag_pre_stop       =3D 0x1;
--  static const int test_flag_long_timeout   =3D 0x2;
--
--  static const int test_flag_acquire_global =3D 0x10;
--  static const int test_flag_has_global     =3D 0x20;
--
--  static const int test_flag_do_work   =3D 0x100;
--  static const int test_flag_pre_poke  =3D 0x200;
--  static const int test_flag_post_poke =3D 0x400;
--
--  thread_test();
--
--  int                 test_state() const { return m_test_state; }
--  bool                is_state(int state) const { return m_state =3D=3D s=
tate; }
--  bool                is_test_state(int state) const { return m_test_stat=
e =3D=3D state; }
--  bool                is_test_flags(int flags) const { return (m_test_fla=
gs & flags) =3D=3D flags; }
--  bool                is_not_test_flags(int flags) const { return !(m_tes=
t_flags & flags); }
--
--  const char*         name() const { return "test_thread"; }
--
--  void                init_thread();
--
--  void                set_pre_stop() { __sync_or_and_fetch(&m_test_flags,=
 test_flag_pre_stop); }
--  void                set_acquire_global() { __sync_or_and_fetch(&m_test_=
flags, test_flag_acquire_global); }
--
--  void                set_test_flag(int flags) { __sync_or_and_fetch(&m_t=
est_flags, flags); }
--
--private:
--  void                call_events();
--  int64_t             next_timeout_usec() { return (m_test_flags & test_f=
lag_long_timeout) ? (10000 * 1000) : (100 * 1000); }
--
--  int                 m_test_state lt_cacheline_aligned;
--  int                 m_test_flags lt_cacheline_aligned;
--};
-diff --git a/test/tracker/test_tracker_http.cc b/test/tracker/test_tracker=
_http.cc
-new file mode 100644
-index 00000000..399d00d5
---- /dev/null
-+++ b/test/tracker/test_tracker_http.cc
-@@ -0,0 +1,11 @@
-+#include "config.h"
-+
-+#include "test_tracker_http.h"
-+
-+#include "tracker/tracker_http.h"
-+
-+CPPUNIT_TEST_SUITE_NAMED_REGISTRATION(test_tracker_http, "tracker");
-+
-+void
-+test_tracker_http::test_basic() {
-+}
-diff --git a/test/tracker/test_tracker_http.h b/test/tracker/test_tracker_=
http.h
-new file mode 100644
-index 00000000..ab11a8f7
---- /dev/null
-+++ b/test/tracker/test_tracker_http.h
-@@ -0,0 +1,12 @@
-+#include "helpers/test_fixture.h"
-+
-+#include "torrent/utils/thread_base.h"
-+
-+class test_tracker_http : public test_fixture {
-+  CPPUNIT_TEST_SUITE(test_tracker_http);
-+  CPPUNIT_TEST(test_basic);
-+  CPPUNIT_TEST_SUITE_END();
-+
-+public:
-+  void test_basic();
-+};
-diff --git a/test/tracker/tracker_http_test.cc b/test/tracker/tracker_http=
_test.cc
-deleted file mode 100644
-index deda4382..00000000
---- a/test/tracker/tracker_http_test.cc
-+++ /dev/null
-@@ -1,17 +0,0 @@
--#include "config.h"
--
--#include "tracker_http_test.h"
--
--#include "tracker/tracker_http.h"
--
--void
--tracker_http_test::setUp() {
--}
--
--void
--tracker_http_test::tearDown() {
--}
--
--void
--tracker_http_test::test_basic() {
--}
-diff --git a/test/tracker/tracker_http_test.h b/test/tracker/tracker_http_=
test.h
-deleted file mode 100644
-index 11ff8246..00000000
---- a/test/tracker/tracker_http_test.h
-+++ /dev/null
-@@ -1,18 +0,0 @@
--#include <cppunit/extensions/HelperMacros.h>
--
--#include "tracker/tracker_http.h"
--
--class tracker_http_test : public CppUnit::TestFixture {
--  CPPUNIT_TEST_SUITE(tracker_http_test);
--  CPPUNIT_TEST(test_basic);
--  CPPUNIT_TEST(test_scrape);
--  CPPUNIT_TEST_SUITE_END();
--
--public:
--  void setUp();
--  void tearDown();
--
--  void test_basic();
--
--  void test_scrape();
--};
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0034-Change=
s-automake-required-files.patch b/meta-oe/recipes-connectivity/libtorrent/l=
ibtorrent/0034-Changes-automake-required-files.patch
deleted file mode 100644
index e860045a7..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0034-Changes-autom=
ake-required-files.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From 03e1c95987917bf98534e50fdd718a948540ffb2 Mon Sep 17 00:00:00 2001
-From: rakshasa <sundell.software@gmail.com>
-Date: Thu, 25 Feb 2021 00:03:27 +0900
-Subject: [PATCH] Changes automake required files.
-
----
- autogen.sh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/autogen.sh b/autogen.sh
-index 79afab8e..6def96dd 100755
---- a/autogen.sh
-+++ b/autogen.sh
-@@ -36,7 +36,7 @@ echo automake...
-     exit 1
- }
-=20
--automake --add-missing --copy --gnu || exit 1
-+automake --add-missing --copy --foreign || exit 1
-=20
- echo autoconf...
- (autoconf --version) < /dev/null > /dev/null 2>&1 || {
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0035-Replac=
ed-custom-execinfo-autoconf-test.patch b/meta-oe/recipes-connectivity/libto=
rrent/libtorrent/0035-Replaced-custom-execinfo-autoconf-test.patch
deleted file mode 100644
index 0ff30731c..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0035-Replaced-cust=
om-execinfo-autoconf-test.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From b4a3888bd891d804a83ae1cee623592725975895 Mon Sep 17 00:00:00 2001
-From: rakshasa <sundell.software@gmail.com>
-Date: Sat, 27 Feb 2021 22:11:55 +0900
-Subject: [PATCH] Replaced custom execinfo autoconf test.
-
----
- configure.ac            |  2 +-
- scripts/rak_execinfo.m4 | 11 -----------
- 2 files changed, 1 insertion(+), 12 deletions(-)
- delete mode 100644 scripts/rak_execinfo.m4
-
-diff --git a/configure.ac b/configure.ac
-index 88a46edd..197bbc94 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -34,7 +34,6 @@ RAK_CHECK_CXXFLAGS
- RAK_ENABLE_DEBUG
- RAK_ENABLE_EXTRA_DEBUG
- RAK_ENABLE_WERROR
--RAK_DISABLE_BACKTRACE
-=20
- RAK_CHECK_CXX11
-=20
-@@ -58,6 +57,7 @@ TORRENT_WITH_INOTIFY
- CC_ATTRIBUTE_VISIBILITY
-=20
- AX_CHECK_ZLIB
-+AX_EXECINFO
- AX_PTHREAD
-=20
- PKG_CHECK_MODULES([CPPUNIT], [cppunit],, [no_cppunit=3D"yes"])
-diff --git a/scripts/rak_execinfo.m4 b/scripts/rak_execinfo.m4
-deleted file mode 100644
-index c1d9b2f8..00000000
---- a/scripts/rak_execinfo.m4
-+++ /dev/null
-@@ -1,11 +0,0 @@
--AC_DEFUN([RAK_DISABLE_BACKTRACE], [
--  AC_ARG_ENABLE(backtrace,
--    AC_HELP_STRING([--disable-backtrace], [disable backtrace information =
[[default=3Dno]]]),
--    [
--        if test "$enableval" =3D "yes"; then
--            AX_EXECINFO
--        fi
--    ],[
--        AX_EXECINFO
--    ])
--])
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0036-Added-=
option-to-disable-pthread_setname_np.patch b/meta-oe/recipes-connectivity/l=
ibtorrent/libtorrent/0036-Added-option-to-disable-pthread_setname_np.patch
deleted file mode 100644
index 9d3c0fa23..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0036-Added-option-=
to-disable-pthread_setname_np.patch
+++ /dev/null
@@ -1,135 +0,0 @@
-From e5ed6301e0d07adeaab10e9924a8c9a2e327cdc5 Mon Sep 17 00:00:00 2001
-From: rakshasa <sundell.software@gmail.com>
-Date: Thu, 29 Apr 2021 19:33:04 +0900
-Subject: [PATCH] Added option to disable pthread_setname_np.
-
----
- configure.ac                     | 30 +++++++++++++++++++-----------
- scripts/checks.m4                | 18 ++++++++++++++++++
- src/torrent/utils/thread_base.cc | 16 ++++++++++++++--
- 3 files changed, 51 insertions(+), 13 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 197bbc94..73caf712 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -24,9 +24,9 @@ AC_PROG_CXX
- AC_SYS_LARGEFILE
-=20
- AC_C_BIGENDIAN(
--    AC_DEFINE(IS_BIG_ENDIAN, 1, Big endian),
--    AC_DEFINE(IS_LITTLE_ENDIAN, 1, Little endian),
--    AC_MSG_ERROR([Could not determine endianness])
-+  AC_DEFINE(IS_BIG_ENDIAN, 1, Big endian),
-+  AC_DEFINE(IS_LITTLE_ENDIAN, 1, Little endian),
-+  AC_MSG_ERROR([Could not determine endianness])
- )
-=20
- RAK_CHECK_CFLAGS
-@@ -54,7 +54,15 @@ TORRENT_WITHOUT_STATVFS
- TORRENT_WITHOUT_STATFS
- TORRENT_WITH_INOTIFY
-=20
--CC_ATTRIBUTE_VISIBILITY
-+AC_ARG_ENABLE(attribute-visibility,
-+  AC_HELP_STRING([--disable-attribute-visibility], [disable symbol visibi=
lity attribute [[default=3Denable]]]),
-+  [
-+    if test "$enableval" =3D "yes"; then
-+      CC_ATTRIBUTE_VISIBILITY
-+    fi
-+  ],[
-+    CC_ATTRIBUTE_VISIBILITY
-+  ])
-=20
- AX_CHECK_ZLIB
- AX_EXECINFO
-@@ -71,11 +79,11 @@ TORRENT_ARG_CYRUS_RC4
-=20
- AC_CHECK_FUNCS(posix_memalign)
-=20
--TORRENT_CHECK_MADVISE()
--TORRENT_CHECK_CACHELINE()
--TORRENT_CHECK_POPCOUNT()
--TORRENT_CHECK_PTHREAD_SETNAME_NP()
--TORRENT_MINCORE()
-+TORRENT_CHECK_MADVISE
-+TORRENT_CHECK_CACHELINE
-+TORRENT_CHECK_POPCOUNT
-+TORRENT_DISABLE_PTHREAD_SETNAME_NP
-+TORRENT_MINCORE
-=20
- TORRENT_DISABLE_INSTRUMENTATION
-=20
-@@ -88,8 +96,8 @@ AC_SUBST(LIBTORRENT_CFLAGS)
- AC_DEFINE(HAVE_CONFIG_H, 1, true if config.h was included)
-=20
- CC_ATTRIBUTE_UNUSED(
--	AC_DEFINE([__UNUSED], [__attribute__((unused))], [Wrapper around unused =
attribute]),
--	AC_DEFINE([__UNUSED], [], [Null-wrapper if unused attribute is unsupport=
ed])
-+  AC_DEFINE([__UNUSED], [__attribute__((unused))], [Wrapper around unused=
 attribute]),
-+  AC_DEFINE([__UNUSED], [], [Null-wrapper if unused attribute is unsuppor=
ted])
- )
-=20
- AC_OUTPUT([
-diff --git a/scripts/checks.m4 b/scripts/checks.m4
-index 98ef17f8..915a5011 100644
---- a/scripts/checks.m4
-+++ b/scripts/checks.m4
-@@ -490,3 +490,21 @@ AC_DEFUN([TORRENT_CHECK_PTHREAD_SETNAME_NP], [
-     ])
-   ])
- ])
-+
-+AC_DEFUN([TORRENT_DISABLE_PTHREAD_SETNAME_NP], [
-+  AC_MSG_CHECKING([for pthread_setname_no])
-+
-+  AC_ARG_ENABLE(pthread-setname-np,
-+    AC_HELP_STRING([--disable-pthread-setname-np], [disable pthread_setna=
me_np]),
-+    [
-+      if test "$enableval" =3D "no"; then
-+        AC_MSG_RESULT(disabled)
-+      else
-+        AC_MSG_RESULT(checking)
-+        TORRENT_CHECK_PTHREAD_SETNAME_NP
-+      fi
-+    ], [
-+      TORRENT_CHECK_PTHREAD_SETNAME_NP
-+    ]
-+  )
-+])
-diff --git a/src/torrent/utils/thread_base.cc b/src/torrent/utils/thread_b=
ase.cc
-index 99d6355d..ec0619f3 100644
---- a/src/torrent/utils/thread_base.cc
-+++ b/src/torrent/utils/thread_base.cc
-@@ -41,10 +41,16 @@ thread_base::~thread_base() {
-=20
- void
- thread_base::start_thread() {
--  if (m_poll =3D=3D NULL)
-+  if (this =3D=3D nullptr)
-+    throw internal_error("Called thread_base::start_thread on a nullptr."=
);
-+
-+  if (m_poll =3D=3D nullptr)
-     throw internal_error("No poll object for thread defined.");
-=20
--  if (!is_initialized() || pthread_create(&m_thread, NULL, (pthread_func)=
&thread_base::event_loop, this))
-+  if (!is_initialized())
-+    throw internal_error("Called thread_base::start_thread on an uninitia=
lized object.");
-+
-+  if (pthread_create(&m_thread, NULL, (pthread_func)&thread_base::event_l=
oop, this))
-     throw internal_error("Failed to create thread.");
- }
-=20
-@@ -82,6 +88,12 @@ thread_base::should_handle_sigusr1() {
-=20
- void*
- thread_base::event_loop(thread_base* thread) {
-+  if (thread =3D=3D nullptr)
-+    throw internal_error("thread_base::event_loop called with a null poin=
ter thread");
-+
-+  if (!thread->is_initialized())
-+    throw internal_error("thread_base::event_loop call on an uninitialize=
d object");
-+
-   __sync_lock_test_and_set(&thread->m_state, STATE_ACTIVE);
-=20
- #if defined(HAS_PTHREAD_SETNAME_NP_DARWIN)
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0037-Improv=
ed-backtrace-error-checking.patch b/meta-oe/recipes-connectivity/libtorrent=
/libtorrent/0037-Improved-backtrace-error-checking.patch
deleted file mode 100644
index 5f48d76bf..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0037-Improved-back=
trace-error-checking.patch
+++ /dev/null
@@ -1,594 +0,0 @@
-From f978e68f9d907e25207d0a7d247d2b10935e5d76 Mon Sep 17 00:00:00 2001
-From: rakshasa <sundell.software@gmail.com>
-Date: Thu, 29 Apr 2021 19:34:35 +0900
-Subject: [PATCH] Improved backtrace error checking.
-
----
- src/download/download_main.cc            | 36 -------------
- src/download/download_main.h             | 36 -------------
- src/download/download_wrapper.cc         | 43 ++--------------
- src/torrent/data/download_data.h         | 36 -------------
- src/torrent/download/choke_queue.cc      | 50 +++++-------------
- src/torrent/download/resource_manager.cc | 53 +++++--------------
- src/torrent/exceptions.cc                | 65 +++++++-----------------
- src/torrent/torrent.cc                   |  1 +
- src/torrent/utils/extents.h              | 36 -------------
- src/torrent/utils/signal_bitfield.cc     | 36 -------------
- 10 files changed, 48 insertions(+), 344 deletions(-)
-
-diff --git a/src/download/download_main.cc b/src/download/download_main.cc
-index 9a3f9df2..e075038a 100644
---- a/src/download/download_main.cc
-+++ b/src/download/download_main.cc
-@@ -1,39 +1,3 @@
--// libTorrent - BitTorrent library
--// Copyright (C) 2005-2011, Jari Sundell
--//
--// This program is free software; you can redistribute it and/or modify
--// it under the terms of the GNU General Public License as published by
--// the Free Software Foundation; either version 2 of the License, or
--// (at your option) any later version.
--//=20
--// This program is distributed in the hope that it will be useful,
--// but WITHOUT ANY WARRANTY; without even the implied warranty of
--// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--// GNU General Public License for more details.
--//=20
--// You should have received a copy of the GNU General Public License
--// along with this program; if not, write to the Free Software
--// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
--//
--// In addition, as a special exception, the copyright holders give
--// permission to link the code of portions of this program with the
--// OpenSSL library under certain conditions as described in each
--// individual source file, and distribute linked combinations
--// including the two.
--//
--// You must obey the GNU General Public License in all respects for
--// all of the code used other than OpenSSL.  If you modify file(s)
--// with this exception, you may extend this exception to your version
--// of the file(s), but you are not obligated to do so.  If you do not
--// wish to do so, delete this exception statement from your version.
--// If you delete this exception statement from all source files in the
--// program, then also delete it here.
--//
--// Contact:  Jari Sundell <jaris@ifi.uio.no>
--//
--//           Skomakerveien 33
--//           3185 Skoppum, NORWAY
--
- #include "config.h"
-=20
- #include <cstring>
-diff --git a/src/download/download_main.h b/src/download/download_main.h
-index da3cf182..4783e863 100644
---- a/src/download/download_main.h
-+++ b/src/download/download_main.h
-@@ -1,39 +1,3 @@
--// libTorrent - BitTorrent library
--// Copyright (C) 2005-2011, Jari Sundell
--//
--// This program is free software; you can redistribute it and/or modify
--// it under the terms of the GNU General Public License as published by
--// the Free Software Foundation; either version 2 of the License, or
--// (at your option) any later version.
--//=20
--// This program is distributed in the hope that it will be useful,
--// but WITHOUT ANY WARRANTY; without even the implied warranty of
--// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--// GNU General Public License for more details.
--//=20
--// You should have received a copy of the GNU General Public License
--// along with this program; if not, write to the Free Software
--// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
--//
--// In addition, as a special exception, the copyright holders give
--// permission to link the code of portions of this program with the
--// OpenSSL library under certain conditions as described in each
--// individual source file, and distribute linked combinations
--// including the two.
--//
--// You must obey the GNU General Public License in all respects for
--// all of the code used other than OpenSSL.  If you modify file(s)
--// with this exception, you may extend this exception to your version
--// of the file(s), but you are not obligated to do so.  If you do not
--// wish to do so, delete this exception statement from your version.
--// If you delete this exception statement from all source files in the
--// program, then also delete it here.
--//
--// Contact:  Jari Sundell <jaris@ifi.uio.no>
--//
--//           Skomakerveien 33
--//           3185 Skoppum, NORWAY
--
- #ifndef LIBTORRENT_DOWNLOAD_MAIN_H
- #define LIBTORRENT_DOWNLOAD_MAIN_H
-=20
-diff --git a/src/download/download_wrapper.cc b/src/download/download_wrap=
per.cc
-index 59e81781..304bddce 100644
---- a/src/download/download_wrapper.cc
-+++ b/src/download/download_wrapper.cc
-@@ -1,39 +1,3 @@
--// libTorrent - BitTorrent library
--// Copyright (C) 2005-2011, Jari Sundell
--//
--// This program is free software; you can redistribute it and/or modify
--// it under the terms of the GNU General Public License as published by
--// the Free Software Foundation; either version 2 of the License, or
--// (at your option) any later version.
--//=20
--// This program is distributed in the hope that it will be useful,
--// but WITHOUT ANY WARRANTY; without even the implied warranty of
--// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--// GNU General Public License for more details.
--//=20
--// You should have received a copy of the GNU General Public License
--// along with this program; if not, write to the Free Software
--// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
--//
--// In addition, as a special exception, the copyright holders give
--// permission to link the code of portions of this program with the
--// OpenSSL library under certain conditions as described in each
--// individual source file, and distribute linked combinations
--// including the two.
--//
--// You must obey the GNU General Public License in all respects for
--// all of the code used other than OpenSSL.  If you modify file(s)
--// with this exception, you may extend this exception to your version
--// of the file(s), but you are not obligated to do so.  If you do not
--// wish to do so, delete this exception statement from your version.
--// If you delete this exception statement from all source files in the
--// program, then also delete it here.
--//
--// Contact:  Jari Sundell <jaris@ifi.uio.no>
--//
--//           Skomakerveien 33
--//           3185 Skoppum, NORWAY
--
- #include "config.h"
-=20
- #include <iterator>
-@@ -62,6 +26,8 @@
-=20
- #include "download_wrapper.h"
-=20
-+#define LT_LOG_THIS(log_fmt, ...)                                       \
-+  lt_log_print_info(LOG_TORRENT_INFO, this->info(), "download", log_fmt, =
__VA_ARGS__);
- #define LT_LOG_STORAGE_ERRORS(log_fmt, ...)                             \
-   lt_log_print_info(LOG_PROTOCOL_STORAGE_ERRORS, this->info(), "storage_e=
rrors", log_fmt, __VA_ARGS__);
-=20
-@@ -325,8 +291,8 @@ DownloadWrapper::receive_tick(uint32_t ticks) {
-=20
- void
- DownloadWrapper::receive_update_priorities() {
--  if (m_main->chunk_selector()->empty())
--    return;
-+  LT_LOG_THIS("update priorities: chunks_selected:%" PRIu32 " wanted_chun=
ks:%" PRIu32,
-+              m_main->chunk_selector()->size(), data()->wanted_chunks());
-=20
-   data()->mutable_high_priority()->clear();
-   data()->mutable_normal_priority()->clear();
-@@ -359,7 +325,6 @@ DownloadWrapper::receive_update_priorities() {
-   }
-=20
-   bool was_partial =3D data()->wanted_chunks() !=3D 0;
--
-   data()->update_wanted_chunks();
-=20
-   m_main->chunk_selector()->update_priorities();
-diff --git a/src/torrent/data/download_data.h b/src/torrent/data/download_=
data.h
-index fc212047..c701cb2f 100644
---- a/src/torrent/data/download_data.h
-+++ b/src/torrent/data/download_data.h
-@@ -1,39 +1,3 @@
--// libTorrent - BitTorrent library
--// Copyright (C) 2005-2011, Jari Sundell
--//
--// This program is free software; you can redistribute it and/or modify
--// it under the terms of the GNU General Public License as published by
--// the Free Software Foundation; either version 2 of the License, or
--// (at your option) any later version.
--//=20
--// This program is distributed in the hope that it will be useful,
--// but WITHOUT ANY WARRANTY; without even the implied warranty of
--// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--// GNU General Public License for more details.
--//=20
--// You should have received a copy of the GNU General Public License
--// along with this program; if not, write to the Free Software
--// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
--//
--// In addition, as a special exception, the copyright holders give
--// permission to link the code of portions of this program with the
--// OpenSSL library under certain conditions as described in each
--// individual source file, and distribute linked combinations
--// including the two.
--//
--// You must obey the GNU General Public License in all respects for
--// all of the code used other than OpenSSL.  If you modify file(s)
--// with this exception, you may extend this exception to your version
--// of the file(s), but you are not obligated to do so.  If you do not
--// wish to do so, delete this exception statement from your version.
--// If you delete this exception statement from all source files in the
--// program, then also delete it here.
--//
--// Contact:  Jari Sundell <jaris@ifi.uio.no>
--//
--//           Skomakerveien 33
--//           3185 Skoppum, NORWAY
--
- #ifndef LIBTORRENT_DATA_DOWNLOAD_DATA_H
- #define LIBTORRENT_DATA_DOWNLOAD_DATA_H
-=20
-diff --git a/src/torrent/download/choke_queue.cc b/src/torrent/download/ch=
oke_queue.cc
-index 7c00b686..edf47795 100644
---- a/src/torrent/download/choke_queue.cc
-+++ b/src/torrent/download/choke_queue.cc
-@@ -1,39 +1,3 @@
--// libTorrent - BitTorrent library
--// Copyright (C) 2005-2011, Jari Sundell
--//
--// This program is free software; you can redistribute it and/or modify
--// it under the terms of the GNU General Public License as published by
--// the Free Software Foundation; either version 2 of the License, or
--// (at your option) any later version.
--//=20
--// This program is distributed in the hope that it will be useful,
--// but WITHOUT ANY WARRANTY; without even the implied warranty of
--// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--// GNU General Public License for more details.
--//=20
--// You should have received a copy of the GNU General Public License
--// along with this program; if not, write to the Free Software
--// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
--//
--// In addition, as a special exception, the copyright holders give
--// permission to link the code of portions of this program with the
--// OpenSSL library under certain conditions as described in each
--// individual source file, and distribute linked combinations
--// including the two.
--//
--// You must obey the GNU General Public License in all respects for
--// all of the code used other than OpenSSL.  If you modify file(s)
--// with this exception, you may extend this exception to your version
--// of the file(s), but you are not obligated to do so.  If you do not
--// wish to do so, delete this exception statement from your version.
--// If you delete this exception statement from all source files in the
--// program, then also delete it here.
--//
--// Contact:  Jari Sundell <jaris@ifi.uio.no>
--//
--//           Skomakerveien 33
--//           3185 Skoppum, NORWAY
--
- #include "config.h"
-=20
- #include <algorithm>
-@@ -50,6 +14,10 @@
-=20
- #include "choke_queue.h"
-=20
-+// TODO: Add a different logging category.
-+#define LT_LOG_THIS(log_fmt, ...)                                       \
-+  lt_log_print_subsystem(LOG_TORRENT_INFO, "choke_queue", log_fmt, __VA_A=
RGS__);
-+
- namespace torrent {
-=20
- struct choke_manager_less {
-@@ -193,6 +161,9 @@ choke_queue::rebuild_containers(container_type* queued=
, container_type* unchoked
-=20
- void
- choke_queue::balance() {
-+  LT_LOG_THIS("balancing queue: heuristics:%i currently_unchoked:%" PRIu3=
2 " max_unchoked:%" PRIu32,
-+              m_heuristics, m_currently_unchoked, m_maxUnchoked)
-+
-   // Return if no balancing is needed. Don't return if is_unlimited()
-   // as we might have just changed the value and have interested that
-   // can be unchoked.
-@@ -216,6 +187,9 @@ choke_queue::balance() {
-=20
-   // If we have more unchoked than max global slots allow for,
-   // 'can_unchoke' will be negative.
-+  //
-+  // Throws std::bad_function_call if 'set_slot_can_unchoke' is not
-+  // set.
-   int can_unchoke =3D m_slotCanUnchoke();
-   int max_unchoked =3D std::min(m_maxUnchoked, (uint32_t)(1 << 20));
-=20
-@@ -240,8 +214,8 @@ choke_queue::balance() {
-   if (result !=3D 0)
-     m_slotUnchoke(result);
-=20
--  lt_log_print(LOG_PEER_DEBUG, "Called balance; adjust:%i can_unchoke:%i =
queued:%u unchoked:%u result:%i.",
--               adjust, can_unchoke, (unsigned)queued.size(), (unsigned)un=
choked.size(), result);
-+  LT_LOG_THIS("balanced queue: adjust:%i can_unchoke:%i queued:%" PRIu32 =
" unchoked:%" PRIu32 " result:%i",
-+               adjust, can_unchoke, queued.size(), unchoked.size(), resul=
t);
- }
-=20
- void
-diff --git a/src/torrent/download/resource_manager.cc b/src/torrent/downlo=
ad/resource_manager.cc
-index 51434c91..8ca7b02e 100644
---- a/src/torrent/download/resource_manager.cc
-+++ b/src/torrent/download/resource_manager.cc
-@@ -1,39 +1,3 @@
--// libTorrent - BitTorrent library
--// Copyright (C) 2005-2011, Jari Sundell
--//
--// This program is free software; you can redistribute it and/or modify
--// it under the terms of the GNU General Public License as published by
--// the Free Software Foundation; either version 2 of the License, or
--// (at your option) any later version.
--//=20
--// This program is distributed in the hope that it will be useful,
--// but WITHOUT ANY WARRANTY; without even the implied warranty of
--// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--// GNU General Public License for more details.
--//=20
--// You should have received a copy of the GNU General Public License
--// along with this program; if not, write to the Free Software
--// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
--//
--// In addition, as a special exception, the copyright holders give
--// permission to link the code of portions of this program with the
--// OpenSSL library under certain conditions as described in each
--// individual source file, and distribute linked combinations
--// including the two.
--//
--// You must obey the GNU General Public License in all respects for
--// all of the code used other than OpenSSL.  If you modify file(s)
--// with this exception, you may extend this exception to your version
--// of the file(s), but you are not obligated to do so.  If you do not
--// wish to do so, delete this exception statement from your version.
--// If you delete this exception statement from all source files in the
--// program, then also delete it here.
--//
--// Contact:  Jari Sundell <jaris@ifi.uio.no>
--//
--//           Skomakerveien 33
--//           3185 Skoppum, NORWAY
--
- #include "config.h"
-=20
- #include <algorithm>
-@@ -51,6 +15,11 @@
- #include "choke_queue.h"
- #include "resource_manager.h"
-=20
-+#define LT_LOG_THIS(log_fmt, ...)                                       \
-+  lt_log_print_subsystem(LOG_TORRENT_INFO, "resource_manager", log_fmt, _=
_VA_ARGS__);
-+#define LT_LOG_ITR(log_fmt, ...)                                        \
-+  lt_log_print_info(LOG_TORRENT_INFO, itr->download()->info(), "resource_=
manager", log_fmt, __VA_ARGS__);
-+
- namespace torrent {
-=20
- const Rate* resource_manager_entry::up_rate() const { return m_download->=
info()->up_rate(); }
-@@ -226,6 +195,8 @@ ResourceManager::group_index_of(const std::string& nam=
e) {
-=20
- void
- ResourceManager::set_priority(iterator itr, uint16_t pri) {
-+  LT_LOG_ITR("set priority: %" PRIu16, 0)
-+
-   itr->set_priority(pri);
- }
-=20
-@@ -283,7 +254,7 @@ ResourceManager::set_max_download_unchoked(unsigned in=
t m) {
- // possibly multiple calls of this function.
- void
- ResourceManager::receive_upload_unchoke(int num) {
--  lt_log_print(LOG_PEER_INFO, "Upload unchoked slots adjust; currently:%u=
 adjust:%i", m_currentlyUploadUnchoked, num);
-+  LT_LOG_THIS("adjusting upload unchoked slots; current:%u adjusted:%i", =
m_currentlyUploadUnchoked, num);
-=20
-   if ((int)m_currentlyUploadUnchoked + num < 0)
-     throw internal_error("ResourceManager::receive_upload_unchoke(...) re=
ceived an invalid value.");
-@@ -293,7 +264,7 @@ ResourceManager::receive_upload_unchoke(int num) {
-=20
- void
- ResourceManager::receive_download_unchoke(int num) {
--  lt_log_print(LOG_PEER_INFO, "Download unchoked slots adjust; currently:=
%u adjust:%i", m_currentlyDownloadUnchoked, num);
-+  LT_LOG_THIS("adjusting download unchoked slots; current:%u adjusted:%i"=
, m_currentlyDownloadUnchoked, num);
-=20
-   if ((int)m_currentlyDownloadUnchoked + num < 0)
-     throw internal_error("ResourceManager::receive_download_unchoke(...) =
received an invalid value.");
-@@ -387,12 +358,14 @@ ResourceManager::balance_unchoked(unsigned int weigh=
t, unsigned int max_unchoked
-     std::sort(group_first, group_last, std::bind(std::less<uint32_t>(),
-                                                  std::bind(&choke_group::=
up_requested, std::placeholders::_1),
-                                                  std::bind(&choke_group::=
up_requested, std::placeholders::_2)));
--    lt_log_print(LOG_PEER_DEBUG, "Upload unchoked slots cycle; currently:=
%u adjusted:%i max_unchoked:%u", m_currentlyUploadUnchoked, change, max_unc=
hoked);
-+
-+    LT_LOG_THIS("balancing upload unchoked slots; current_unchoked:%u cha=
nge:%i max_unchoked:%u", m_currentlyUploadUnchoked, change, max_unchoked);
-   } else {
-     std::sort(group_first, group_last, std::bind(std::less<uint32_t>(),
-                                                  std::bind(&choke_group::=
down_requested, std::placeholders::_1),
-                                                  std::bind(&choke_group::=
down_requested, std::placeholders::_2)));
--    lt_log_print(LOG_PEER_DEBUG, "Download unchoked slots cycle; currentl=
y:%u adjusted:%i max_unchoked:%u", m_currentlyDownloadUnchoked, change, max=
_unchoked);
-+
-+    LT_LOG_THIS("balancing download unchoked slots; current_unchoked:%u c=
hange:%i max_unchoked:%u", m_currentlyDownloadUnchoked, change, max_unchoke=
d);
-   }
-=20
-   while (group_first !=3D group_last) {
-diff --git a/src/torrent/exceptions.cc b/src/torrent/exceptions.cc
-index f834f9fa..7375ed8e 100644
---- a/src/torrent/exceptions.cc
-+++ b/src/torrent/exceptions.cc
-@@ -1,39 +1,3 @@
--// libTorrent - BitTorrent library
--// Copyright (C) 2005-2011, Jari Sundell
--//
--// This program is free software; you can redistribute it and/or modify
--// it under the terms of the GNU General Public License as published by
--// the Free Software Foundation; either version 2 of the License, or
--// (at your option) any later version.
--//=20
--// This program is distributed in the hope that it will be useful,
--// but WITHOUT ANY WARRANTY; without even the implied warranty of
--// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--// GNU General Public License for more details.
--//=20
--// You should have received a copy of the GNU General Public License
--// along with this program; if not, write to the Free Software
--// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
--//
--// In addition, as a special exception, the copyright holders give
--// permission to link the code of portions of this program with the
--// OpenSSL library under certain conditions as described in each
--// individual source file, and distribute linked combinations
--// including the two.
--//
--// You must obey the GNU General Public License in all respects for
--// all of the code used other than OpenSSL.  If you modify file(s)
--// with this exception, you may extend this exception to your version
--// of the file(s), but you are not obligated to do so.  If you do not
--// wish to do so, delete this exception statement from your version.
--// If you delete this exception statement from all source files in the
--// program, then also delete it here.
--//
--// Contact:  Jari Sundell <jaris@ifi.uio.no>
--//
--//           Skomakerveien 33
--//           3185 Skoppum, NORWAY
--
- #include "config.h"
-=20
- #include <cerrno>
-@@ -73,23 +37,30 @@ void
- internal_error::initialize(const std::string& msg) {
-   m_msg =3D msg;
-=20
--  std::stringstream output;
--
- #ifdef HAVE_BACKTRACE
--  void* stackPtrs[20];
-+  void* stack_ptrs[20];
-+  int stack_size =3D ::backtrace(stack_ptrs, 20);
-+  char** stack_symbol_names =3D ::backtrace_symbols(stack_ptrs, stack_siz=
e);
-=20
--  // Print the stack and exit.
--  int stackSize =3D ::backtrace(stackPtrs, 20);
--  char** stackStrings =3D backtrace_symbols(stackPtrs, stackSize);
-+  if (stack_symbol_names =3D=3D nullptr) {
-+    m_backtrace =3D "backtrace_symbols failed";
-+    return;
-+  }
-=20
--  for (int i =3D 0; i < stackSize; ++i)
--    output << stackStrings[i] << std::endl;
-+  std::stringstream output;
-=20
--#else
--  output << "Stack dump not enabled." << std::endl;
--#endif
-+  for (int i =3D 0; i < stack_size; ++i) {
-+    if (stack_symbol_names[i] !=3D nullptr && stack_symbol_names[i] > (vo=
id*)0x1000)
-+      output << stack_symbol_names[i] << std::endl;
-+    else
-+      output << "stack_symbol: nullptr" << std::endl;
-+  }
-=20
-   m_backtrace =3D output.str();
-+
-+#else
-+  m_backtrace =3D "stack dump not enabled";
-+#endif
- }
-=20
- }
-diff --git a/src/torrent/torrent.cc b/src/torrent/torrent.cc
-index fb70d247..67de4387 100644
---- a/src/torrent/torrent.cc
-+++ b/src/torrent/torrent.cc
-@@ -203,6 +203,7 @@ download_priority(Download d) {
-   return itr->priority();
- }
-=20
-+// TODO: Remove this.
- void
- download_set_priority(Download d, uint32_t pri) {
-   ResourceManager::iterator itr =3D manager->resource_manager()->find(d.p=
tr()->main());
-diff --git a/src/torrent/utils/extents.h b/src/torrent/utils/extents.h
-index c2b887b1..64605d4a 100644
---- a/src/torrent/utils/extents.h
-+++ b/src/torrent/utils/extents.h
-@@ -1,39 +1,3 @@
--// libTorrent - BitTorrent library
--// Copyright (C) 2005-2011, Jari Sundell
--//
--// This program is free software; you can redistribute it and/or modify
--// it under the terms of the GNU General Public License as published by
--// the Free Software Foundation; either version 2 of the License, or
--// (at your option) any later version.
--//=20
--// This program is distributed in the hope that it will be useful,
--// but WITHOUT ANY WARRANTY; without even the implied warranty of
--// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--// GNU General Public License for more details.
--//=20
--// You should have received a copy of the GNU General Public License
--// along with this program; if not, write to the Free Software
--// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
--//
--// In addition, as a special exception, the copyright holders give
--// permission to link the code of portions of this program with the
--// OpenSSL library under certain conditions as described in each
--// individual source file, and distribute linked combinations
--// including the two.
--//
--// You must obey the GNU General Public License in all respects for
--// all of the code used other than OpenSSL.  If you modify file(s)
--// with this exception, you may extend this exception to your version
--// of the file(s), but you are not obligated to do so.  If you do not
--// wish to do so, delete this exception statement from your version.
--// If you delete this exception statement from all source files in the
--// program, then also delete it here.
--//
--// Contact:  Jari Sundell <jaris@ifi.uio.no>
--//
--//           Skomakerveien 33
--//           3185 Skoppum, NORWAY
--
- #ifndef LIBTORRENT_UTILS_EXTENTS_H
- #define LIBTORRENT_UTILS_EXTENTS_H
-=20
-diff --git a/src/torrent/utils/signal_bitfield.cc b/src/torrent/utils/sign=
al_bitfield.cc
-index 82f81e7c..dfc3d1fe 100644
---- a/src/torrent/utils/signal_bitfield.cc
-+++ b/src/torrent/utils/signal_bitfield.cc
-@@ -1,39 +1,3 @@
--// libTorrent - BitTorrent library
--// Copyright (C) 2005-2011, Jari Sundell
--//
--// This program is free software; you can redistribute it and/or modify
--// it under the terms of the GNU General Public License as published by
--// the Free Software Foundation; either version 2 of the License, or
--// (at your option) any later version.
--//=20
--// This program is distributed in the hope that it will be useful,
--// but WITHOUT ANY WARRANTY; without even the implied warranty of
--// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--// GNU General Public License for more details.
--//=20
--// You should have received a copy of the GNU General Public License
--// along with this program; if not, write to the Free Software
--// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
--//
--// In addition, as a special exception, the copyright holders give
--// permission to link the code of portions of this program with the
--// OpenSSL library under certain conditions as described in each
--// individual source file, and distribute linked combinations
--// including the two.
--//
--// You must obey the GNU General Public License in all respects for
--// all of the code used other than OpenSSL.  If you modify file(s)
--// with this exception, you may extend this exception to your version
--// of the file(s), but you are not obligated to do so.  If you do not
--// wish to do so, delete this exception statement from your version.
--// If you delete this exception statement from all source files in the
--// program, then also delete it here.
--//
--// Contact:  Jari Sundell <jaris@ifi.uio.no>
--//
--//           Skomakerveien 33
--//           3185 Skoppum, NORWAY
--
- #include "config.h"
-=20
- #include "torrent/exceptions.h"
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0038-Fixed-=
issue-with-multiple-connections-from-NAT-not-w.patch b/meta-oe/recipes-conn=
ectivity/libtorrent/libtorrent/0038-Fixed-issue-with-multiple-connections-f=
rom-NAT-not-w.patch
deleted file mode 100644
index 8937e869f..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0038-Fixed-issue-w=
ith-multiple-connections-from-NAT-not-w.patch
+++ /dev/null
@@ -1,199 +0,0 @@
-From cabc557fdf6f12fee7029081de2cf5de88464c21 Mon Sep 17 00:00:00 2001
-From: rakshasa <sundell.software@gmail.com>
-Date: Thu, 29 Apr 2021 21:27:50 +0900
-Subject: [PATCH] Fixed issue with multiple connections from NAT not workin=
g.
-
----
- src/protocol/handshake.cc     | 36 -------------------
- src/torrent/peer/peer_list.cc | 68 +++++++++++------------------------
- src/torrent/peer/peer_list.h  | 36 -------------------
- 3 files changed, 20 insertions(+), 120 deletions(-)
-
-diff --git a/src/protocol/handshake.cc b/src/protocol/handshake.cc
-index 1b877c7a..d6f48e59 100644
---- a/src/protocol/handshake.cc
-+++ b/src/protocol/handshake.cc
-@@ -1,39 +1,3 @@
--// libTorrent - BitTorrent library
--// Copyright (C) 2005-2011, Jari Sundell
--//
--// This program is free software; you can redistribute it and/or modify
--// it under the terms of the GNU General Public License as published by
--// the Free Software Foundation; either version 2 of the License, or
--// (at your option) any later version.
--//=20
--// This program is distributed in the hope that it will be useful,
--// but WITHOUT ANY WARRANTY; without even the implied warranty of
--// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--// GNU General Public License for more details.
--//=20
--// You should have received a copy of the GNU General Public License
--// along with this program; if not, write to the Free Software
--// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
--//
--// In addition, as a special exception, the copyright holders give
--// permission to link the code of portions of this program with the
--// OpenSSL library under certain conditions as described in each
--// individual source file, and distribute linked combinations
--// including the two.
--//
--// You must obey the GNU General Public License in all respects for
--// all of the code used other than OpenSSL.  If you modify file(s)
--// with this exception, you may extend this exception to your version
--// of the file(s), but you are not obligated to do so.  If you do not
--// wish to do so, delete this exception statement from your version.
--// If you delete this exception statement from all source files in the
--// program, then also delete it here.
--//
--// Contact:  Jari Sundell <jaris@ifi.uio.no>
--//
--//           Skomakerveien 33
--//           3185 Skoppum, NORWAY
--
- #include "config.h"
-=20
- #include <stdio.h>
-diff --git a/src/torrent/peer/peer_list.cc b/src/torrent/peer/peer_list.cc
-index 080a7f13..6ce630f7 100644
---- a/src/torrent/peer/peer_list.cc
-+++ b/src/torrent/peer/peer_list.cc
-@@ -1,39 +1,3 @@
--// libTorrent - BitTorrent library
--// Copyright (C) 2005-2011, Jari Sundell
--//
--// This program is free software; you can redistribute it and/or modify
--// it under the terms of the GNU General Public License as published by
--// the Free Software Foundation; either version 2 of the License, or
--// (at your option) any later version.
--//=20
--// This program is distributed in the hope that it will be useful,
--// but WITHOUT ANY WARRANTY; without even the implied warranty of
--// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--// GNU General Public License for more details.
--//=20
--// You should have received a copy of the GNU General Public License
--// along with this program; if not, write to the Free Software
--// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
--//
--// In addition, as a special exception, the copyright holders give
--// permission to link the code of portions of this program with the
--// OpenSSL library under certain conditions as described in each
--// individual source file, and distribute linked combinations
--// including the two.
--//
--// You must obey the GNU General Public License in all respects for
--// all of the code used other than OpenSSL.  If you modify file(s)
--// with this exception, you may extend this exception to your version
--// of the file(s), but you are not obligated to do so.  If you do not
--// wish to do so, delete this exception statement from your version.
--// If you delete this exception statement from all source files in the
--// program, then also delete it here.
--//
--// Contact:  Jari Sundell <jaris@ifi.uio.no>
--//
--//           Skomakerveien 33
--//           3185 Skoppum, NORWAY
--
- #include "config.h"
-=20
- #include <algorithm>
-@@ -262,8 +226,11 @@ PeerList::available_list_size() const {
-   return m_available_list->size();
- }
-=20
-+// TODO: Rename connecting:
- PeerInfo*
- PeerList::connected(const sockaddr* sa, int flags) {
-+  // TODO: Rewrite to use new socket address api after fixing bug.
-+
-   const rak::socket_address* address =3D rak::socket_address::cast_from(s=
a);
-   socket_address_key sock_key =3D socket_address_key::from_sockaddr(sa);
-=20
-@@ -281,13 +248,7 @@ PeerList::connected(const sockaddr* sa, int flags) {
-   // We should also remove any PeerInfo objects already for this
-   // address.
-   if ((filter_value & PeerInfo::flag_unwanted)) {
--    char ipv4_str[INET_ADDRSTRLEN];
--    uint32_t net_order_addr =3D htonl(host_byte_order_ipv4_addr);
--
--    inet_ntop(AF_INET, &net_order_addr, ipv4_str, INET_ADDRSTRLEN);
--
--    lt_log_print(LOG_PEER_INFO, "Peer %s is unwanted: preventing connecti=
on", ipv4_str);
--
-+    LT_LOG_EVENTS("connecting peer rejected, flagged as unwanted: " LT_LO=
G_SA_FMT, address->address_str().c_str(), address->port());
-     return NULL;
-   }
-=20
-@@ -313,12 +274,23 @@ PeerList::connected(const sockaddr* sa, int flags) {
-     //
-     // This also ensure we can connect to peers running on the same
-     // host as the tracker.
--    if (flags & connect_keep_handshakes &&
--        range.first->second->is_handshake() &&
--        rak::socket_address::cast_from(range.first->second->socket_addres=
s())->port() !=3D address->port())
--      m_available_list->buffer()->push_back(*address);
-+    // if (flags & connect_keep_handshakes &&
-+    //     range.first->second->is_handshake() &&
-+    //     rak::socket_address::cast_from(range.first->second->socket_add=
ress())->port() !=3D address->port())
-+    //   m_available_list->buffer()->push_back(*address);
-=20
--    return NULL;
-+    LT_LOG_EVENTS("connecting peer rejected, already connected (buggy, fi=
xme): " LT_LOG_SA_FMT, address->address_str().c_str(), address->port());
-+
-+    // TODO: Verify this works properly, possibly add a check/flag
-+    // that allows the handshake manager to notify peer list if the
-+    // incoming connection was a duplicate peer hash.
-+
-+    //return NULL;
-+
-+    peerInfo =3D new PeerInfo(sa);
-+    peerInfo->set_flags(filter_value & PeerInfo::mask_ip_table);
-+
-+    base_type::insert(range.second, value_type(sock_key, peerInfo));
-   }
-=20
-   if (flags & connect_filter_recent &&
-diff --git a/src/torrent/peer/peer_list.h b/src/torrent/peer/peer_list.h
-index 4c2f707d..a9d31a54 100644
---- a/src/torrent/peer/peer_list.h
-+++ b/src/torrent/peer/peer_list.h
-@@ -1,39 +1,3 @@
--// libTorrent - BitTorrent library
--// Copyright (C) 2005-2011, Jari Sundell
--//
--// This program is free software; you can redistribute it and/or modify
--// it under the terms of the GNU General Public License as published by
--// the Free Software Foundation; either version 2 of the License, or
--// (at your option) any later version.
--//=20
--// This program is distributed in the hope that it will be useful,
--// but WITHOUT ANY WARRANTY; without even the implied warranty of
--// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--// GNU General Public License for more details.
--//=20
--// You should have received a copy of the GNU General Public License
--// along with this program; if not, write to the Free Software
--// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
--//
--// In addition, as a special exception, the copyright holders give
--// permission to link the code of portions of this program with the
--// OpenSSL library under certain conditions as described in each
--// individual source file, and distribute linked combinations
--// including the two.
--//
--// You must obey the GNU General Public License in all respects for
--// all of the code used other than OpenSSL.  If you modify file(s)
--// with this exception, you may extend this exception to your version
--// of the file(s), but you are not obligated to do so.  If you do not
--// wish to do so, delete this exception statement from your version.
--// If you delete this exception statement from all source files in the
--// program, then also delete it here.
--//
--// Contact:  Jari Sundell <jaris@ifi.uio.no>
--//
--//           Skomakerveien 33
--//           3185 Skoppum, NORWAY
--
- #ifndef LIBTORRENT_PEER_LIST_H
- #define LIBTORRENT_PEER_LIST_H
-=20
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0039-Added-=
disable-execinfo-option-to-configure.patch b/meta-oe/recipes-connectivity/l=
ibtorrent/libtorrent/0039-Added-disable-execinfo-option-to-configure.patch
deleted file mode 100644
index a631b8de9..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0039-Added-disable=
-execinfo-option-to-configure.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 532d3e54b3f012dc81530ebb80ded8b26434fdd9 Mon Sep 17 00:00:00 2001
-From: rakshasa <sundell.software@gmail.com>
-Date: Wed, 16 Jun 2021 23:28:28 +0900
-Subject: [PATCH] Added '--disable-execinfo' option to configure.
-
----
- configure.ac | 11 ++++++++++-
- 1 file changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 73caf712..a4f051e4 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -64,8 +64,17 @@ AC_ARG_ENABLE(attribute-visibility,
-     CC_ATTRIBUTE_VISIBILITY
-   ])
-=20
-+AC_ARG_ENABLE(execinfo,
-+  AC_HELP_STRING([--disable-execinfo], [disable libexecinfo [[default=3De=
nable]]]),
-+  [
-+    if test "$enableval" =3D "yes"; then
-+      AX_EXECINFO
-+    fi
-+  ],[
-+    AX_EXECINFO
-+  ])
-+
- AX_CHECK_ZLIB
--AX_EXECINFO
- AX_PTHREAD
-=20
- PKG_CHECK_MODULES([CPPUNIT], [cppunit],, [no_cppunit=3D"yes"])
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0040-Detect=
-ip-address.patch b/meta-oe/recipes-connectivity/libtorrent/libtorrent/0040=
-Detect-ip-address.patch
deleted file mode 100644
index 196d2f6af..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0040-Detect-ip-add=
ress.patch
+++ /dev/null
@@ -1,457 +0,0 @@
-From 92781533fc4afab67447e8e6d47a649383179c44 Mon Sep 17 00:00:00 2001
-From: rakshasa <sundell.software@gmail.com>
-Date: Sun, 20 Jun 2021 18:10:52 +0900
-Subject: [PATCH] Detect ip address.
-
----
- src/net/local_addr.cc                   |   6 +-
- src/torrent/Makefile.am                 |   5 +-
- src/torrent/net/fd.cc                   |   3 +
- src/torrent/net/fd.h                    |  14 ++--
- src/torrent/net/socket_address.cc       |   2 +-
- src/torrent/net/socket_address.h        |   2 +-
- src/torrent/net/utils.cc                | 104 ++++++++++++++++++++++++
- src/torrent/net/utils.h                 |   9 ++
- src/tracker/tracker_http.cc             | 104 ++++++++----------------
- test/helpers/network.h                  |   2 +
- test/torrent/net/test_fd.cc             |   9 ++
- test/torrent/net/test_socket_address.cc |   2 +-
- 12 files changed, 181 insertions(+), 81 deletions(-)
- create mode 100755 src/torrent/net/utils.cc
- create mode 100755 src/torrent/net/utils.h
-
-diff --git a/src/net/local_addr.cc b/src/net/local_addr.cc
-index 24413265..0c7116cb 100644
---- a/src/net/local_addr.cc
-+++ b/src/net/local_addr.cc
-@@ -34,6 +34,8 @@
- //           Skomakerveien 33
- //           3185 Skoppum, NORWAY
-=20
-+// TODO: Remove.
-+
- #include "config.h"
-=20
- #include <stdio.h>
-@@ -241,7 +243,7 @@ bool get_local_address(sa_family_t family, rak::socket=
_address *address) {
-       int plen =3D IFA_PAYLOAD(nlmsg);
-       for (const rtattr *rta =3D IFA_RTA(ifa);
-            RTA_OK(rta, plen);
--	   rta =3D RTA_NEXT(rta, plen)) {
-+           rta =3D RTA_NEXT(rta, plen)) {
-         if (rta->rta_type !=3D IFA_LOCAL &&
-             rta->rta_type !=3D IFA_ADDRESS) {
-           continue;
-@@ -303,7 +305,7 @@ get_local_address(sa_family_t family, rak::socket_addr=
ess *address) {
-     dummy_dest.set_address_c_str("4.0.0.0");=20
-     break;
-   case rak::socket_address::af_inet6:
--    dummy_dest.set_address_c_str("2001:700::");=20
-+    dummy_dest.set_address_c_str("2001:1::");
-     break;
-   default:
-     throw internal_error("Unknown address family");
-diff --git a/src/torrent/Makefile.am b/src/torrent/Makefile.am
-index 30157b95..5de7e8ae 100644
---- a/src/torrent/Makefile.am
-+++ b/src/torrent/Makefile.am
-@@ -46,6 +46,8 @@ libtorrent_torrent_la_SOURCES =3D \
- 	net/socket_event.cc \
- 	net/socket_event.h \
- 	net/types.h \
-+	net/utils.cc \
-+	net/utils.h \
- \
- 	peer/choke_status.h \
- 	peer/client_info.cc \
-@@ -167,7 +169,8 @@ libtorrent_torrent_net_include_HEADERS =3D \
- 	net/socket_address.h \
- 	net/socket_address_key.h \
- 	net/socket_event.h \
--	net/types.h
-+	net/types.h \
-+	net/utils.h
-=20
- libtorrent_torrent_peer_includedir =3D $(includedir)/torrent/peer
- libtorrent_torrent_peer_include_HEADERS =3D \
-diff --git a/src/torrent/net/fd.cc b/src/torrent/net/fd.cc
-index 07c91779..6d228181 100644
---- a/src/torrent/net/fd.cc
-+++ b/src/torrent/net/fd.cc
-@@ -64,6 +64,9 @@ fd_open(fd_flags flags) {
-   if ((flags & fd_flag_stream)) {
-     domain =3D SOCK_STREAM;
-     protocol =3D IPPROTO_TCP;
-+  } else if ((flags & fd_flag_datagram)) {
-+    domain =3D SOCK_DGRAM;
-+    protocol =3D IPPROTO_UDP;
-   } else {
-     LT_LOG_FLAG("fd_open missing socket type");
-     errno =3D EINVAL;
-diff --git a/src/torrent/net/fd.h b/src/torrent/net/fd.h
-index a7094646..6ab3302d 100644
---- a/src/torrent/net/fd.h
-+++ b/src/torrent/net/fd.h
-@@ -9,11 +9,12 @@ namespace torrent {
-=20
- enum fd_flags : int {
-   fd_flag_stream =3D 0x1,
--  fd_flag_nonblock =3D 0x10,
--  fd_flag_reuse_address =3D 0x20,
--  fd_flag_v4only =3D 0x40,
--  fd_flag_v6only =3D 0x80,
--  fd_flag_all =3D 0xff,
-+  fd_flag_datagram =3D 0x10,
-+  fd_flag_nonblock =3D 0x20,
-+  fd_flag_reuse_address =3D 0x40,
-+  fd_flag_v4only =3D 0x80,
-+  fd_flag_v6only =3D 0x100,
-+  fd_flag_all =3D 0x1ff,
- };
-=20
- constexpr bool fd_valid_flags(fd_flags flags);
-@@ -53,7 +54,8 @@ operator |=3D(fd_flags& lhs, fd_flags rhs) {
- constexpr bool
- fd_valid_flags(fd_flags flags) {
-   return
--    (flags & fd_flag_stream) &&
-+    ((flags & fd_flag_stream) || (flags & fd_flag_datagram)) &&
-+    !((flags & fd_flag_stream) && (flags & fd_flag_datagram)) &&
-     !((flags & fd_flag_v4only) && (flags & fd_flag_v6only)) &&
-     !(flags & ~(fd_flag_all));
- }
-diff --git a/src/torrent/net/socket_address.cc b/src/torrent/net/socket_ad=
dress.cc
-index c36ba0ae..078bee25 100644
---- a/src/torrent/net/socket_address.cc
-+++ b/src/torrent/net/socket_address.cc
-@@ -135,7 +135,7 @@ sa_unique_ptr
- sa_make_unspec() {
-   sa_unique_ptr sa(new sockaddr);
-=20
--  std::memset(sa.get(), 0, sizeof(sa));
-+  std::memset(sa.get(), 0, sizeof(sockaddr));
-   sa.get()->sa_family =3D AF_UNSPEC;
-=20
-   return sa;
-diff --git a/src/torrent/net/socket_address.h b/src/torrent/net/socket_add=
ress.h
-index f64aee68..b9586ca1 100644
---- a/src/torrent/net/socket_address.h
-+++ b/src/torrent/net/socket_address.h
-@@ -102,8 +102,8 @@ bool fd_sap_equal(const fd_sap_tuple& lhs, const fd_sa=
p_tuple& rhs) LIBTORRENT_E
-=20
- inline bool sap_is_unspec(const sa_unique_ptr& sap) { return sa_is_unspec=
(sap.get()); }
- inline bool sap_is_unspec(const c_sa_unique_ptr& sap) { return sa_is_unsp=
ec(sap.get()); }
--inline bool sap_is_inet(const c_sa_unique_ptr& sap) { return sa_is_inet(s=
ap.get()); }
- inline bool sap_is_inet(const sa_unique_ptr& sap) { return sa_is_inet(sap=
.get()); }
-+inline bool sap_is_inet(const c_sa_unique_ptr& sap) { return sa_is_inet(s=
ap.get()); }
- inline bool sap_is_inet6(const sa_unique_ptr& sap) { return sa_is_inet6(s=
ap.get()); }
- inline bool sap_is_inet6(const c_sa_unique_ptr& sap) { return sa_is_inet6=
(sap.get()); }
- inline bool sap_is_inet_inet6(const sa_unique_ptr& sap) { return sa_is_in=
et_inet6(sap.get()); }
-diff --git a/src/torrent/net/utils.cc b/src/torrent/net/utils.cc
-new file mode 100755
-index 00000000..4cb85924
---- /dev/null
-+++ b/src/torrent/net/utils.cc
-@@ -0,0 +1,104 @@
-+#import <torrent/net/utils.h>
-+
-+#import <cerrno>
-+#import <cstring>
-+#import <torrent/net/fd.h>
-+#import <torrent/net/socket_address.h>
-+#import <torrent/utils/log.h>
-+
-+#define LT_LOG_ERROR(log_fmt)                                           \
-+  lt_log_print(LOG_CONNECTION_FD, "fd: " log_fmt " (errno:%i message:'%s'=
)", \
-+               errno, std::strerror(errno));
-+#define LT_LOG_FD(log_fmt)                                              \
-+  lt_log_print(LOG_CONNECTION_FD, "fd->%i: " log_fmt, fd);
-+#define LT_LOG_FD_ERROR(log_fmt)                                        \
-+  lt_log_print(LOG_CONNECTION_FD, "fd->%i: " log_fmt " (errno:%i message:=
'%s')", \
-+               fd, errno, std::strerror(errno));
-+#define LT_LOG_FD_SIN(log_fmt)                                        \
-+  lt_log_print(LOG_CONNECTION_FD, "fd->%i: " log_fmt " (address:%s)", \
-+               fd, sin_pretty_str(sa.get()).c_str());
-+#define LT_LOG_FD_SIN6(log_fmt)                                       \
-+  lt_log_print(LOG_CONNECTION_FD, "fd->%i: " log_fmt " (address:%s)", \
-+               fd, sin6_pretty_str(sa.get()).c_str());
-+
-+namespace torrent {
-+
-+auto detect_local_sin_addr() -> sin_unique_ptr {
-+  int fd =3D fd_open(fd_flag_v4only | fd_flag_datagram);
-+  if (fd =3D=3D -1) {
-+    LT_LOG_ERROR("detect_local_sin_addr: open failed");
-+    return sin_unique_ptr();
-+  }
-+
-+  // TODO: Check if unique_ptr works.
-+  std::shared_ptr<void> _fd(nullptr, [fd](...){ fd_close(fd); });
-+
-+  auto connectAddress =3D sin_make();
-+  connectAddress.get()->sin_addr.s_addr =3D htonl(0x04000001);
-+  connectAddress.get()->sin_port =3D 80;
-+
-+  if (!fd_connect(fd, reinterpret_cast<sockaddr*>(connectAddress.get())) =
&& errno !=3D EINPROGRESS) {
-+    LT_LOG_FD_ERROR("detect_local_sin_addr: connect failed");
-+    return sin_unique_ptr();
-+  }
-+
-+  // TODO: Make sa function.
-+  socklen_t socklen =3D sizeof(sockaddr_in);
-+
-+  auto sa =3D sin_make();
-+
-+  if (::getsockname(fd, reinterpret_cast<sockaddr*>(sa.get()), &socklen) =
!=3D 0) {
-+    LT_LOG_FD_ERROR("detect_local_sin_addr: getsockname failed");
-+    return sin_unique_ptr();
-+  }
-+  if (socklen !=3D sizeof(sockaddr_in)) {
-+    LT_LOG_FD("detect_local_sin_addr: getsockname failed, invalid socklen=
");
-+    return sin_unique_ptr();
-+  }
-+
-+  LT_LOG_FD_SIN("detect_local_sin_addr: success");
-+
-+  return sa;
-+}
-+
-+auto detect_local_sin6_addr() -> sin6_unique_ptr {
-+  int fd =3D fd_open(fd_flag_v6only | fd_flag_datagram);
-+  if (fd =3D=3D -1) {
-+    LT_LOG_ERROR("detect_local_sin6_addr: open failed");
-+    return sin6_unique_ptr();
-+  }
-+
-+  // TODO: Check if unique_ptr works.
-+  std::shared_ptr<void> _fd(nullptr, [fd](...){ fd_close(fd); });
-+
-+  auto connectAddress =3D sin6_make();
-+  connectAddress.get()->sin6_addr.s6_addr[0] =3D 0x20;
-+  connectAddress.get()->sin6_addr.s6_addr[1] =3D 0x01;
-+  connectAddress.get()->sin6_addr.s6_addr[15] =3D 0x01;
-+  connectAddress.get()->sin6_port =3D 80;
-+
-+  if (!fd_connect(fd, reinterpret_cast<sockaddr*>(connectAddress.get())) =
&& errno !=3D EINPROGRESS) {
-+    LT_LOG_FD_ERROR("detect_local_sin6_addr: connect failed");
-+    return sin6_unique_ptr();
-+  }
-+
-+  // TODO: Make sa function.
-+  socklen_t socklen =3D sizeof(sockaddr_in6);
-+
-+  auto sa =3D sin6_make();
-+
-+  if (::getsockname(fd, reinterpret_cast<sockaddr*>(sa.get()), &socklen) =
!=3D 0) {
-+    LT_LOG_FD_ERROR("detect_local_sin6_addr: getsockname failed");
-+    return sin6_unique_ptr();
-+  }
-+  if (socklen !=3D sizeof(sockaddr_in6)) {
-+    LT_LOG_FD("detect_local_sin6_addr: getsockname failed, invalid sockle=
n");
-+    return sin6_unique_ptr();
-+  }
-+
-+  LT_LOG_FD_SIN6("detect_local_sin6_addr: success");
-+
-+  return sa;
-+}
-+
-+}
-diff --git a/src/torrent/net/utils.h b/src/torrent/net/utils.h
-new file mode 100755
-index 00000000..1d550c51
---- /dev/null
-+++ b/src/torrent/net/utils.h
-@@ -0,0 +1,9 @@
-+#import <torrent/common.h>
-+#import <torrent/net/socket_address.h>
-+
-+namespace torrent {
-+
-+auto detect_local_sin_addr() -> sin_unique_ptr;
-+auto detect_local_sin6_addr() -> sin6_unique_ptr;
-+
-+}
-diff --git a/src/tracker/tracker_http.cc b/src/tracker/tracker_http.cc
-index 1bf94107..de3a39ab 100644
---- a/src/tracker/tracker_http.cc
-+++ b/src/tracker/tracker_http.cc
-@@ -1,63 +1,29 @@
--// libTorrent - BitTorrent library
--// Copyright (C) 2005-2011, Jari Sundell
--//
--// This program is free software; you can redistribute it and/or modify
--// it under the terms of the GNU General Public License as published by
--// the Free Software Foundation; either version 2 of the License, or
--// (at your option) any later version.
--//=20
--// This program is distributed in the hope that it will be useful,
--// but WITHOUT ANY WARRANTY; without even the implied warranty of
--// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--// GNU General Public License for more details.
--//=20
--// You should have received a copy of the GNU General Public License
--// along with this program; if not, write to the Free Software
--// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
--//
--// In addition, as a special exception, the copyright holders give
--// permission to link the code of portions of this program with the
--// OpenSSL library under certain conditions as described in each
--// individual source file, and distribute linked combinations
--// including the two.
--//
--// You must obey the GNU General Public License in all respects for
--// all of the code used other than OpenSSL.  If you modify file(s)
--// with this exception, you may extend this exception to your version
--// of the file(s), but you are not obligated to do so.  If you do not
--// wish to do so, delete this exception statement from your version.
--// If you delete this exception statement from all source files in the
--// program, then also delete it here.
--//
--// Contact:  Jari Sundell <jaris@ifi.uio.no>
--//
--//           Skomakerveien 33
--//           3185 Skoppum, NORWAY
--
--#include "config.h"
-+#import "config.h"
-=20
- #define __STDC_FORMAT_MACROS
-=20
--#include <iomanip>
--#include <sstream>
--#include <rak/functional.h>
--#include <rak/string_manip.h>
--
--#include "net/address_list.h"
--#include "net/local_addr.h"
--#include "torrent/connection_manager.h"
--#include "torrent/download_info.h"
--#include "torrent/exceptions.h"
--#include "torrent/http.h"
--#include "torrent/object_stream.h"
--#include "torrent/tracker_list.h"
--#include "torrent/utils/log.h"
--#include "torrent/utils/option_strings.h"
--
--#include "tracker_http.h"
--
--#include "globals.h"
--#include "manager.h"
-+#import <iomanip>
-+#import <sstream>
-+#import <rak/functional.h>
-+#import <rak/string_manip.h>
-+
-+#import "net/address_list.h"
-+#import "net/local_addr.h"
-+#import "torrent/connection_manager.h"
-+#import "torrent/download_info.h"
-+#import "torrent/exceptions.h"
-+#import "torrent/http.h"
-+#import "torrent/net/utils.h"
-+#import "torrent/net/socket_address.h"
-+#import "torrent/object_stream.h"
-+#import "torrent/tracker_list.h"
-+#import "torrent/utils/log.h"
-+#import "torrent/utils/option_strings.h"
-+
-+#import "tracker_http.h"
-+
-+#import "globals.h"
-+#import "manager.h"
-=20
- #define LT_LOG_TRACKER(log_level, log_fmt, ...)                         \
-   lt_log_print_info(LOG_TRACKER_##log_level, m_parent->info(), "tracker",=
 "[%u] " log_fmt, group(), __VA_ARGS__);
-@@ -142,19 +108,19 @@ TrackerHttp::send_state(int state) {
-=20
-   const rak::socket_address* localAddress =3D rak::socket_address::cast_f=
rom(manager->connection_manager()->local_address());
-=20
--  if (!localAddress->is_address_any())
--    s << "&ip=3D" << localAddress->address_str();
-- =20
--  if (localAddress->is_address_any() && localAddress->family() =3D=3D rak=
::socket_address::pf_inet) {
--    rak::socket_address local_v6;
--    if (get_local_address(rak::socket_address::af_inet6, &local_v6))
--      s << "&ipv6=3D" << rak::copy_escape_html(local_v6.address_str());
--  }
-+  if (localAddress->is_address_any()) {
-+    auto ipv4_address =3D detect_local_sin_addr();
-+    auto ipv6_address =3D detect_local_sin6_addr();
-=20
--  if (localAddress->is_address_any() && localAddress->family() =3D=3D rak=
::socket_address::pf_inet6) {
--    rak::socket_address local_v4;
--    if (get_local_address(rak::socket_address::af_inet, &local_v4))
--      s << "&ipv4=3D" << local_v4.address_str();
-+    if (ipv4_address !=3D nullptr) {
-+      s << "&ipv4=3D" << sin_addr_str(ipv4_address.get());
-+    }
-+    if (ipv6_address !=3D nullptr) {
-+      s << "&ipv6=3D" << sin6_addr_str(ipv6_address.get());
-+    }
-+
-+  } else {
-+    s << "&ip=3D" << localAddress->address_str();
-   }
-=20
-   if (info->is_compact())
-diff --git a/test/helpers/network.h b/test/helpers/network.h
-index 6cf2f870..eb188426 100644
---- a/test/helpers/network.h
-+++ b/test/helpers/network.h
-@@ -112,6 +112,7 @@ wrap_ai_get_first_sa(const char* nodename, const char*=
 servname =3D nullptr, const
-=20
-   CPPUNIT_ASSERT_MESSAGE(("wrap_ai_get_first_sa: nodename:'" + std::strin=
g(nodename) + "'").c_str(),
-                         sa !=3D nullptr);
-+
-   return sa;
- }
-=20
-@@ -121,6 +122,7 @@ wrap_ai_get_first_c_sa(const char* nodename, const cha=
r* servname =3D nullptr, con
-=20
-   CPPUNIT_ASSERT_MESSAGE(("wrap_ai_get_first_sa: nodename:'" + std::strin=
g(nodename) + "'").c_str(),
-                         sa !=3D nullptr);
-+
-   return torrent::c_sa_unique_ptr(sa.release());
- }
-=20
-diff --git a/test/torrent/net/test_fd.cc b/test/torrent/net/test_fd.cc
-index 5e56f0f3..0a00ccd4 100644
---- a/test/torrent/net/test_fd.cc
-+++ b/test/torrent/net/test_fd.cc
-@@ -9,13 +9,22 @@ CPPUNIT_TEST_SUITE_NAMED_REGISTRATION(test_fd, "torrent/=
net");
- void
- test_fd::test_valid_flags() {
-   CPPUNIT_ASSERT(torrent::fd_valid_flags(torrent::fd_flag_stream));
-+  CPPUNIT_ASSERT(torrent::fd_valid_flags(torrent::fd_flag_datagram));
-+  CPPUNIT_ASSERT(!torrent::fd_valid_flags(torrent::fd_flag_stream | torre=
nt::fd_flag_datagram));
-+
-   CPPUNIT_ASSERT(torrent::fd_valid_flags(torrent::fd_flag_stream | torren=
t::fd_flag_nonblock));
-   CPPUNIT_ASSERT(torrent::fd_valid_flags(torrent::fd_flag_stream | torren=
t::fd_flag_reuse_address));
-   CPPUNIT_ASSERT(torrent::fd_valid_flags(torrent::fd_flag_stream | torren=
t::fd_flag_v4only));
-   CPPUNIT_ASSERT(torrent::fd_valid_flags(torrent::fd_flag_stream | torren=
t::fd_flag_v6only));
-=20
-+  CPPUNIT_ASSERT(torrent::fd_valid_flags(torrent::fd_flag_datagram | torr=
ent::fd_flag_nonblock));
-+  CPPUNIT_ASSERT(torrent::fd_valid_flags(torrent::fd_flag_datagram | torr=
ent::fd_flag_reuse_address));
-+  CPPUNIT_ASSERT(torrent::fd_valid_flags(torrent::fd_flag_datagram | torr=
ent::fd_flag_v4only));
-+  CPPUNIT_ASSERT(torrent::fd_valid_flags(torrent::fd_flag_datagram | torr=
ent::fd_flag_v6only));
-+
-   CPPUNIT_ASSERT(!torrent::fd_valid_flags(torrent::fd_flag_v4only | torre=
nt::fd_flag_v6only));
-   CPPUNIT_ASSERT(!torrent::fd_valid_flags(torrent::fd_flag_stream | torre=
nt::fd_flag_v4only | torrent::fd_flag_v6only));
-+  CPPUNIT_ASSERT(!torrent::fd_valid_flags(torrent::fd_flag_datagram | tor=
rent::fd_flag_v4only | torrent::fd_flag_v6only));
-=20
-   CPPUNIT_ASSERT(!torrent::fd_valid_flags(torrent::fd_flags()));
-   CPPUNIT_ASSERT(!torrent::fd_valid_flags(torrent::fd_flags(~torrent::fd_=
flag_all)));
-diff --git a/test/torrent/net/test_socket_address.cc b/test/torrent/net/te=
st_socket_address.cc
-index 8a1b0c8a..a27b38bc 100644
---- a/test/torrent/net/test_socket_address.cc
-+++ b/test/torrent/net/test_socket_address.cc
-@@ -83,7 +83,7 @@ test_socket_address::test_make() {
-   CPPUNIT_ASSERT(sin6_inet6->sin6_family =3D=3D AF_INET6);
-   CPPUNIT_ASSERT(sin6_inet6->sin6_port =3D=3D 0);
-   CPPUNIT_ASSERT(sin6_inet6->sin6_flowinfo =3D=3D 0);
--  CPPUNIT_ASSERT(compare_sin6_addr(sin6_inet6->sin6_addr, in6_addr{0}));
-+  CPPUNIT_ASSERT(compare_sin6_addr(sin6_inet6->sin6_addr, (in6_addr{0})))=
;
-   CPPUNIT_ASSERT(sin6_inet6->sin6_scope_id =3D=3D 0);
-=20
-   torrent::sa_unique_ptr sa_unix =3D torrent::sa_make_unix("");
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0041-Added-=
ipv6-options.patch b/meta-oe/recipes-connectivity/libtorrent/libtorrent/004=
1-Added-ipv6-options.patch
deleted file mode 100644
index 923f5c97c..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0041-Added-ipv6-op=
tions.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From e646ed5427b690b75208510d328457af66b208e8 Mon Sep 17 00:00:00 2001
-From: rakshasa <sundell.software@gmail.com>
-Date: Mon, 21 Jun 2021 21:12:56 +0900
-Subject: [PATCH] Added ipv6 options.
-
----
- src/torrent/connection_manager.cc |  6 +++++-
- src/torrent/connection_manager.h  | 13 +++++++++++++
- src/tracker/tracker_http.cc       | 13 +++++--------
- 3 files changed, 23 insertions(+), 9 deletions(-)
-
-diff --git a/src/torrent/connection_manager.cc b/src/torrent/connection_ma=
nager.cc
-index 972dcbfc..ea5efc58 100644
---- a/src/torrent/connection_manager.cc
-+++ b/src/torrent/connection_manager.cc
-@@ -89,7 +89,11 @@ ConnectionManager::ConnectionManager() :
-=20
-   m_listen(new Listen),
-   m_listen_port(0),
--  m_listen_backlog(SOMAXCONN) {
-+  m_listen_backlog(SOMAXCONN),
-+
-+  m_block_ipv4(false),
-+  m_block_ipv6(false),
-+  m_prefer_ipv6(false) {
-=20
-   m_bindAddress =3D (new rak::socket_address())->c_sockaddr();
-   m_localAddress =3D (new rak::socket_address())->c_sockaddr();
-diff --git a/src/torrent/connection_manager.h b/src/torrent/connection_man=
ager.h
-index cf43b0bf..09ccdd28 100644
---- a/src/torrent/connection_manager.h
-+++ b/src/torrent/connection_manager.h
-@@ -167,6 +167,15 @@ public:
-   // For internal usage.
-   Listen*             listen()            { return m_listen; }
-=20
-+  bool                is_block_ipv4() const  { return m_block_ipv4; }
-+  void                set_block_ipv4(bool v) { m_block_ipv4 =3D v; }
-+
-+  bool                is_block_ipv6() const  { return m_block_ipv6; }
-+  void                set_block_ipv6(bool v) { m_block_ipv6 =3D v; }
-+
-+  bool                is_prefer_ipv6() const  { return m_prefer_ipv6; }
-+  void                set_prefer_ipv6(bool v) { m_prefer_ipv6 =3D v; }
-+
- private:
-   ConnectionManager(const ConnectionManager&);
-   void operator =3D (const ConnectionManager&);
-@@ -190,6 +199,10 @@ private:
-   slot_filter_type    m_slot_filter;
-   slot_resolver_type  m_slot_resolver;
-   slot_throttle_type  m_slot_address_throttle;
-+
-+  bool                m_block_ipv4;
-+  bool                m_block_ipv6;
-+  bool                m_prefer_ipv6;
- };
-=20
- }
-diff --git a/src/tracker/tracker_http.cc b/src/tracker/tracker_http.cc
-index de3a39ab..fdbbd58a 100644
---- a/src/tracker/tracker_http.cc
-+++ b/src/tracker/tracker_http.cc
-@@ -109,16 +109,13 @@ TrackerHttp::send_state(int state) {
-   const rak::socket_address* localAddress =3D rak::socket_address::cast_f=
rom(manager->connection_manager()->local_address());
-=20
-   if (localAddress->is_address_any()) {
--    auto ipv4_address =3D detect_local_sin_addr();
--    auto ipv6_address =3D detect_local_sin6_addr();
-+    if (manager->connection_manager()->is_prefer_ipv6()) {
-+      auto ipv6_address =3D detect_local_sin6_addr();
-=20
--    if (ipv4_address !=3D nullptr) {
--      s << "&ipv4=3D" << sin_addr_str(ipv4_address.get());
-+      if (ipv6_address !=3D nullptr) {
-+        s << "&ip=3D" << sin6_addr_str(ipv6_address.get());
-+      }
-     }
--    if (ipv6_address !=3D nullptr) {
--      s << "&ipv6=3D" << sin6_addr_str(ipv6_address.get());
--    }
--
-   } else {
-     s << "&ip=3D" << localAddress->address_str();
-   }
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0042-Remove=
d-obsolete-files.patch b/meta-oe/recipes-connectivity/libtorrent/libtorrent=
/0042-Removed-obsolete-files.patch
deleted file mode 100644
index 383984179..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0042-Removed-obsol=
ete-files.patch
+++ /dev/null
@@ -1,444 +0,0 @@
-From 54caef85baca975e0be30b4f3f6de01db19c8e19 Mon Sep 17 00:00:00 2001
-From: rakshasa <sundell.software@gmail.com>
-Date: Mon, 21 Jun 2021 21:28:02 +0900
-Subject: [PATCH] Removed obsolete files.
-
----
- src/Makefile.am             |   2 -
- src/net/local_addr.cc       | 329 ------------------------------------
- src/net/local_addr.h        |  64 -------
- src/tracker/tracker_http.cc |   1 -
- 4 files changed, 396 deletions(-)
- delete mode 100644 src/net/local_addr.cc
- delete mode 100644 src/net/local_addr.h
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 95e6a7ae..925e7e15 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -76,8 +76,6 @@ libtorrent_other_la_SOURCES =3D \
- 	net/address_list.cc \
- 	net/address_list.h \
- 	net/data_buffer.h \
--	net/local_addr.cc \
--	net/local_addr.h \
- 	net/listen.cc \
- 	net/listen.h \
- 	net/protocol_buffer.h \
-diff --git a/src/net/local_addr.cc b/src/net/local_addr.cc
-deleted file mode 100644
-index 0c7116cb..00000000
---- a/src/net/local_addr.cc
-+++ /dev/null
-@@ -1,329 +0,0 @@
--// libTorrent - BitTorrent library
--// Copyright (C) 2005-2007, Jari Sundell
--//
--// This program is free software; you can redistribute it and/or modify
--// it under the terms of the GNU General Public License as published by
--// the Free Software Foundation; either version 2 of the License, or
--// (at your option) any later version.
--//=20
--// This program is distributed in the hope that it will be useful,
--// but WITHOUT ANY WARRANTY; without even the implied warranty of
--// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--// GNU General Public License for more details.
--//=20
--// You should have received a copy of the GNU General Public License
--// along with this program; if not, write to the Free Software
--// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
--//
--// In addition, as a special exception, the copyright holders give
--// permission to link the code of portions of this program with the
--// OpenSSL library under certain conditions as described in each
--// individual source file, and distribute linked combinations
--// including the two.
--//
--// You must obey the GNU General Public License in all respects for
--// all of the code used other than OpenSSL.  If you modify file(s)
--// with this exception, you may extend this exception to your version
--// of the file(s), but you are not obligated to do so.  If you do not
--// wish to do so, delete this exception statement from your version.
--// If you delete this exception statement from all source files in the
--// program, then also delete it here.
--//
--// Contact:  Jari Sundell <jaris@ifi.uio.no>
--//
--//           Skomakerveien 33
--//           3185 Skoppum, NORWAY
--
--// TODO: Remove.
--
--#include "config.h"
--
--#include <stdio.h>
--#include <rak/socket_address.h>
--#include <sys/types.h>
--#include <errno.h>
--
--#ifdef __linux__
--#include <linux/netlink.h>
--#include <linux/rtnetlink.h>
--#endif
--
--#include "torrent/exceptions.h"
--#include "socket_fd.h"
--#include "local_addr.h"
--
--namespace torrent {
--
--#ifdef __linux__
--
--namespace {
--
--// IPv4 priority, from highest to lowest:
--//
--//   1. Everything else (global address)
--//   2. Private address space (10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16)
--//   3. Empty/INADDR_ANY (0.0.0.0)
--//   4. Link-local address (169.254.0.0/16)
--//   5. Localhost (127.0.0.0/8)
--int
--get_priority_ipv4(const in_addr& addr) {
--  if ((addr.s_addr & htonl(0xff000000U)) =3D=3D htonl(0x7f000000U)) {
--    return 5;
--  }
--  if ((addr.s_addr & htonl(0xffff0000U)) =3D=3D htonl(0xa9fe0000U)) {
--    return 4;
--  }
--  if (addr.s_addr =3D=3D htonl(0)) {
--    return 3;
--  }
--  if ((addr.s_addr & htonl(0xff000000U)) =3D=3D htonl(0x0a000000U) ||
--      (addr.s_addr & htonl(0xfff00000U)) =3D=3D htonl(0xac100000U) ||
--      (addr.s_addr & htonl(0xffff0000U)) =3D=3D htonl(0xc0a80000U)) {
--    return 2;
--  }
--  return 1;
--}
--
--// IPv6 priority, from highest to lowest:
--//
--//  1. Global address (2000::/16 not in 6to4 or Teredo)
--//  2. 6to4 (2002::/16)
--//  3. Teredo (2001::/32)
--//  4. Empty/INADDR_ANY (::)
--//  5. Everything else (link-local, ULA, etc.)
--int
--get_priority_ipv6(const in6_addr& addr) {
--  const uint32_t *addr32 =3D reinterpret_cast<const uint32_t *>(addr.s6_a=
ddr);
--  if (addr32[0] =3D=3D htonl(0) &&
--      addr32[1] =3D=3D htonl(0) &&
--      addr32[2] =3D=3D htonl(0) &&
--      addr32[3] =3D=3D htonl(0)) {
--    return 4;
--  }
--  if (addr32[0] =3D=3D htonl(0x20010000)) {
--    return 3;
--  }
--  if ((addr32[0] & htonl(0xffff0000)) =3D=3D htonl(0x20020000)) {
--    return 2;
--  }
--  if ((addr32[0] & htonl(0xe0000000)) =3D=3D htonl(0x20000000)) {
--    return 1;
--  }
--  return 5;
--}
--
--int
--get_priority(const rak::socket_address& addr) {
--  switch (addr.family()) {
--  case AF_INET:
--    return get_priority_ipv4(addr.c_sockaddr_inet()->sin_addr);
--  case AF_INET6:
--    return get_priority_ipv6(addr.c_sockaddr_inet6()->sin6_addr);
--  default:
--    throw torrent::internal_error("Unknown address family given to compar=
e");
--  }
--}
--
--}
--
--// Linux-specific implementation that understands how to filter away
--// understands how to filter away secondary addresses.
--bool get_local_address(sa_family_t family, rak::socket_address *address) =
{
--  rak::socket_address best_addr;
--  switch (family) {
--  case AF_INET:
--    best_addr.sa_inet()->clear();
--    break;
--  case AF_INET6:
--    best_addr.sa_inet6()->clear();
--    break;
--  default:
--    throw torrent::internal_error("Unknown address family given to get_lo=
cal_address");
--  }
--
--  // The bottom bit of the priority is used to hold if the address is=20
--  // a secondary address (e.g. with IPv6 privacy extensions) or not;
--  // secondary addresses have lower priority (higher number).
--  int best_addr_pri =3D get_priority(best_addr) * 2;
--
--  // Get all the addresses via Linux' netlink interface.
--  int fd =3D ::socket(PF_NETLINK, SOCK_RAW, NETLINK_ROUTE);
--  if (fd =3D=3D -1) {
--    return false;
--  }
--
--  struct sockaddr_nl nladdr;
--  memset(&nladdr, 0, sizeof(nladdr));
--  nladdr.nl_family =3D AF_NETLINK;
--  if (::bind(fd, (sockaddr *)&nladdr, sizeof(nladdr))) {
--    ::close(fd);
--    return false;
--  }
--
--  const int seq_no =3D 1;
--  struct {
--    nlmsghdr nh;
--    rtgenmsg g;
--  } req;
--  memset(&req, 0, sizeof(req));
--
--  req.nh.nlmsg_len =3D sizeof(req);
--  req.nh.nlmsg_type =3D RTM_GETADDR;
--  req.nh.nlmsg_flags =3D NLM_F_ROOT | NLM_F_MATCH | NLM_F_REQUEST;
--  req.nh.nlmsg_pid =3D getpid();
--  req.nh.nlmsg_seq =3D seq_no;
--  req.g.rtgen_family =3D AF_UNSPEC;
--
--  int ret;
--  do {
--    ret =3D ::sendto(fd, &req, sizeof(req), 0, (sockaddr *)&nladdr, sizeo=
f(nladdr));
--  } while (ret =3D=3D -1 && errno =3D=3D EINTR);
--
--  if (ret =3D=3D -1) {
--    ::close(fd);
--    return false;
--  }
--
--  bool done =3D false;
--  do {
--    char buf[4096];
--    socklen_t len =3D sizeof(nladdr);
--    do {
--      ret =3D ::recvfrom(fd, buf, sizeof(buf), 0, (sockaddr *)&nladdr, &l=
en);
--    } while (ret =3D=3D -1 && errno =3D=3D EINTR);
--
--    if (ret < 0) {
--      ::close(fd);
--      return false;
--    }
--
--    for (const nlmsghdr *nlmsg =3D (const nlmsghdr *)buf;
--         NLMSG_OK(nlmsg, ret);
--         nlmsg =3D NLMSG_NEXT(nlmsg, ret)) {
--      if (nlmsg->nlmsg_seq !=3D seq_no)
--        continue;
--      if (nlmsg->nlmsg_type =3D=3D NLMSG_DONE) {
--        done =3D true;
--        break;
--      }
--      if (nlmsg->nlmsg_type =3D=3D NLMSG_ERROR) {
--        ::close(fd);
--        return false;
--      }
--      if (nlmsg->nlmsg_type !=3D RTM_NEWADDR)
--        continue;
--
--      const ifaddrmsg *ifa =3D (const ifaddrmsg *)NLMSG_DATA(nlmsg);
--
--      if (ifa->ifa_family !=3D family)
--        continue;=20
--
--#ifdef IFA_F_OPTIMISTIC
--      if ((ifa->ifa_flags & IFA_F_OPTIMISTIC) !=3D 0)
--        continue;
--#endif
--#ifdef IFA_F_DADFAILED
--      if ((ifa->ifa_flags & IFA_F_DADFAILED) !=3D 0)
--        continue;
--#endif
--#ifdef IFA_F_DEPRECATED
--      if ((ifa->ifa_flags & IFA_F_DEPRECATED) !=3D 0)
--        continue;
--#endif
--#ifdef IFA_F_TENTATIVE
--      if ((ifa->ifa_flags & IFA_F_TENTATIVE) !=3D 0)
--        continue;
--#endif
-- =20
--      // Since there can be point-to-point links on the machine, we need =
to keep
--      // track of the addresses we've seen for this interface; if we see =
both
--      // IFA_LOCAL and IFA_ADDRESS for an interface, keep only the IFA_LO=
CAL.
--      rak::socket_address this_addr;
--      bool seen_addr =3D false;
--      int plen =3D IFA_PAYLOAD(nlmsg);
--      for (const rtattr *rta =3D IFA_RTA(ifa);
--           RTA_OK(rta, plen);
--           rta =3D RTA_NEXT(rta, plen)) {
--        if (rta->rta_type !=3D IFA_LOCAL &&
--            rta->rta_type !=3D IFA_ADDRESS) {
--          continue;
--        }
--        if (rta->rta_type =3D=3D IFA_ADDRESS && seen_addr) {
--          continue;
--        }
--        seen_addr =3D true;
--        switch (ifa->ifa_family) {
--        case AF_INET:
--          this_addr.sa_inet()->clear();
--          this_addr.sa_inet()->set_address(*(const in_addr *)RTA_DATA(rta=
));
--          break;
--        case AF_INET6:
--          this_addr.sa_inet6()->clear();
--          this_addr.sa_inet6()->set_address(*(const in6_addr *)RTA_DATA(r=
ta));
--          break;
--        }
--      }
--      if (!seen_addr)
--        continue;
--      =20
--      int this_addr_pri =3D get_priority(this_addr) * 2;
--      if ((ifa->ifa_flags & IFA_F_SECONDARY) =3D=3D IFA_F_SECONDARY) {
--        ++this_addr_pri;
--      }
--
--      if (this_addr_pri < best_addr_pri) {
--        best_addr =3D this_addr;
--        best_addr_pri =3D this_addr_pri;
--      }
--    }
--  } while (!done);
--
--  ::close(fd);
--  if (!best_addr.is_address_any()) {
--    *address =3D best_addr;
--    return true;
--  } else {
--    return false;
--  }=20
--}
--
--#else
--
--// Generic POSIX variant.
--bool
--get_local_address(sa_family_t family, rak::socket_address *address) {
--  SocketFd sock;
--  if (!sock.open_datagram()) {
--    return false;
--  }
--
--  rak::socket_address dummy_dest;
--  dummy_dest.clear();
--
--  switch (family) {
--  case rak::socket_address::af_inet:
--    dummy_dest.set_address_c_str("4.0.0.0");=20
--    break;
--  case rak::socket_address::af_inet6:
--    dummy_dest.set_address_c_str("2001:1::");
--    break;
--  default:
--    throw internal_error("Unknown address family");
--  }
--
--  dummy_dest.set_port(80);
--
--  if (!sock.connect(dummy_dest)) {
--    sock.close();
--    return false;
--  }
--
--  bool ret =3D sock.getsockname(address);
--  sock.close();
--
--  return ret;
--}
--
--#endif
--
--}
-diff --git a/src/net/local_addr.h b/src/net/local_addr.h
-deleted file mode 100644
-index 43bc8206..00000000
---- a/src/net/local_addr.h
-+++ /dev/null
-@@ -1,64 +0,0 @@
--// libTorrent - BitTorrent library
--// Copyright (C) 2005-2007, Jari Sundell
--//
--// This program is free software; you can redistribute it and/or modify
--// it under the terms of the GNU General Public License as published by
--// the Free Software Foundation; either version 2 of the License, or
--// (at your option) any later version.
--//=20
--// This program is distributed in the hope that it will be useful,
--// but WITHOUT ANY WARRANTY; without even the implied warranty of
--// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--// GNU General Public License for more details.
--//=20
--// You should have received a copy of the GNU General Public License
--// along with this program; if not, write to the Free Software
--// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  =
USA
--//
--// In addition, as a special exception, the copyright holders give
--// permission to link the code of portions of this program with the
--// OpenSSL library under certain conditions as described in each
--// individual source file, and distribute linked combinations
--// including the two.
--//
--// You must obey the GNU General Public License in all respects for
--// all of the code used other than OpenSSL.  If you modify file(s)
--// with this exception, you may extend this exception to your version
--// of the file(s), but you are not obligated to do so.  If you do not
--// wish to do so, delete this exception statement from your version.
--// If you delete this exception statement from all source files in the
--// program, then also delete it here.
--//
--// Contact:  Jari Sundell <jaris@ifi.uio.no>
--//
--//           Skomakerveien 33
--//           3185 Skoppum, NORWAY
--
--// A routine to get a local IP address that can be presented to a tracker=
.
--// (Does not use UPnP etc., so will not understand NAT.)
--// On a machine with multiple network cards, address selection can be a
--// complex process, and in general what's selected is a source/destinatio=
n
--// address pair. However, this routine will give an approximation that wi=
ll
--// be good enough for most purposes and users.
--
--#ifndef LIBTORRENT_NET_LOCAL_ADDR_H
--#define LIBTORRENT_NET_LOCAL_ADDR_H
--
--#include <unistd.h>
--
--namespace rak {
--  class socket_address;
--}
--
--namespace torrent {
--
--// Note: family must currently be rak::af_inet or rak::af_inet6
--// (rak::af_unspec won't do); anything else will throw an exception.
--// Returns false if no address of the given family could be found,
--// either because there are none, or because something went wrong in
--// the process (e.g., no free file descriptors).
--bool get_local_address(sa_family_t family, rak::socket_address *address);
--
--}
--
--#endif /* LIBTORRENT_NET_LOCAL_ADDR_H */
-diff --git a/src/tracker/tracker_http.cc b/src/tracker/tracker_http.cc
-index fdbbd58a..22c409a1 100644
---- a/src/tracker/tracker_http.cc
-+++ b/src/tracker/tracker_http.cc
-@@ -8,7 +8,6 @@
- #import <rak/string_manip.h>
-=20
- #import "net/address_list.h"
--#import "net/local_addr.h"
- #import "torrent/connection_manager.h"
- #import "torrent/download_info.h"
- #import "torrent/exceptions.h"
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0043-Update=
d-and-cleaned-up-automake.-224.patch b/meta-oe/recipes-connectivity/libtorr=
ent/libtorrent/0043-Updated-and-cleaned-up-automake.-224.patch
deleted file mode 100644
index 965f61a4e..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0043-Updated-and-c=
leaned-up-automake.-224.patch
+++ /dev/null
@@ -1,2979 +0,0 @@
-From 4cfe9b1dc1349ad167969d6cf87f557600f34a2e Mon Sep 17 00:00:00 2001
-From: Jari Sundell <sundell.software@gmail.com>
-Date: Sat, 7 Aug 2021 17:49:35 +0900
-Subject: [PATCH] Updated and cleaned up automake. (#224)
-
----
- INSTALL                             | 371 +++++++----
- autogen.sh                          |  51 --
- configure.ac                        |  32 +-
- scripts/ax_check_zlib.m4            |  11 +-
- scripts/ax_cxx_compile_stdcxx.m4    | 962 ++++++++++++++++++++++++++++
- scripts/ax_cxx_compile_stdcxx_0x.m4 | 106 ---
- scripts/ax_cxx_compile_stdcxx_11.m4 | 147 -----
- scripts/ax_pthread.m4               | 453 +++++++++----
- scripts/checks.m4                   | 104 ++-
- scripts/common.m4                   |  29 +-
- scripts/rak_compiler.m4             |   6 +-
- scripts/rak_cxx.m4                  |  14 -
- 12 files changed, 1642 insertions(+), 644 deletions(-)
- delete mode 100755 autogen.sh
- mode change 100644 =3D> 100755 scripts/ax_check_zlib.m4
- create mode 100755 scripts/ax_cxx_compile_stdcxx.m4
- delete mode 100644 scripts/ax_cxx_compile_stdcxx_0x.m4
- delete mode 100644 scripts/ax_cxx_compile_stdcxx_11.m4
- mode change 100644 =3D> 100755 scripts/ax_pthread.m4
- delete mode 100644 scripts/rak_cxx.m4
-
-diff --git a/INSTALL b/INSTALL
-index 54caf7c1..8865734f 100644
---- a/INSTALL
-+++ b/INSTALL
-@@ -1,81 +1,109 @@
--Copyright (C) 1994, 1995, 1996, 1999, 2000, 2001, 2002 Free Software
-+Installation Instructions
-+*************************
-+
-+   Copyright (C) 1994-1996, 1999-2002, 2004-2016 Free Software
- Foundation, Inc.
-=20
--   This file is free documentation; the Free Software Foundation gives
--unlimited permission to copy, distribute and modify it.
-+   Copying and distribution of this file, with or without modification,
-+are permitted in any medium without royalty provided the copyright
-+notice and this notice are preserved.  This file is offered as-is,
-+without warranty of any kind.
-=20
- Basic Installation
- =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-=20
--   These are generic installation instructions.
-+   Briefly, the shell command './configure && make && make install'
-+should configure, build, and install this package.  The following
-+more-detailed instructions are generic; see the 'README' file for
-+instructions specific to this package.  Some packages provide this
-+'INSTALL' file but do not implement all of the features documented
-+below.  The lack of an optional feature in a given package is not
-+necessarily a bug.  More recommendations for GNU packages can be found
-+in *note Makefile Conventions: (standards)Makefile Conventions.
-=20
--   The `configure' shell script attempts to guess correct values for
-+   The 'configure' shell script attempts to guess correct values for
- various system-dependent variables used during compilation.  It uses
--those values to create a `Makefile' in each directory of the package.
--It may also create one or more `.h' files containing system-dependent
--definitions.  Finally, it creates a shell script `config.status' that
-+those values to create a 'Makefile' in each directory of the package.
-+It may also create one or more '.h' files containing system-dependent
-+definitions.  Finally, it creates a shell script 'config.status' that
- you can run in the future to recreate the current configuration, and a
--file `config.log' containing compiler output (useful mainly for
--debugging `configure').
-+file 'config.log' containing compiler output (useful mainly for
-+debugging 'configure').
-=20
--   It can also use an optional file (typically called `config.cache'
--and enabled with `--cache-file=3Dconfig.cache' or simply `-C') that saves
--the results of its tests to speed up reconfiguring.  (Caching is
--disabled by default to prevent problems with accidental use of stale
--cache files.)
-+   It can also use an optional file (typically called 'config.cache' and
-+enabled with '--cache-file=3Dconfig.cache' or simply '-C') that saves the
-+results of its tests to speed up reconfiguring.  Caching is disabled by
-+default to prevent problems with accidental use of stale cache files.
-=20
-    If you need to do unusual things to compile the package, please try
--to figure out how `configure' could check whether to do them, and mail
--diffs or instructions to the address given in the `README' so they can
-+to figure out how 'configure' could check whether to do them, and mail
-+diffs or instructions to the address given in the 'README' so they can
- be considered for the next release.  If you are using the cache, and at
--some point `config.cache' contains results you don't want to keep, you
-+some point 'config.cache' contains results you don't want to keep, you
- may remove or edit it.
-=20
--   The file `configure.ac' (or `configure.in') is used to create
--`configure' by a program called `autoconf'.  You only need
--`configure.ac' if you want to change it or regenerate `configure' using
--a newer version of `autoconf'.
-+   The file 'configure.ac' (or 'configure.in') is used to create
-+'configure' by a program called 'autoconf'.  You need 'configure.ac' if
-+you want to change it or regenerate 'configure' using a newer version of
-+'autoconf'.
-+
-+   The simplest way to compile this package is:
-=20
--The simplest way to compile this package is:
-+  1. 'cd' to the directory containing the package's source code and type
-+     './configure' to configure the package for your system.
-=20
--  1. `cd' to the directory containing the package's source code and type
--     `./configure' to configure the package for your system.  If you're
--     using `csh' on an old version of System V, you might need to type
--     `sh ./configure' instead to prevent `csh' from trying to execute
--     `configure' itself.
-+     Running 'configure' might take a while.  While running, it prints
-+     some messages telling which features it is checking for.
-=20
--     Running `configure' takes awhile.  While running, it prints some
--     messages telling which features it is checking for.
-+  2. Type 'make' to compile the package.
-=20
--  2. Type `make' to compile the package.
-+  3. Optionally, type 'make check' to run any self-tests that come with
-+     the package, generally using the just-built uninstalled binaries.
-=20
--  3. Optionally, type `make check' to run any self-tests that come with
--     the package.
-+  4. Type 'make install' to install the programs and any data files and
-+     documentation.  When installing into a prefix owned by root, it is
-+     recommended that the package be configured and built as a regular
-+     user, and only the 'make install' phase executed with root
-+     privileges.
-=20
--  4. Type `make install' to install the programs and any data files and
--     documentation.
-+  5. Optionally, type 'make installcheck' to repeat any self-tests, but
-+     this time using the binaries in their final installed location.
-+     This target does not install anything.  Running this target as a
-+     regular user, particularly if the prior 'make install' required
-+     root privileges, verifies that the installation completed
-+     correctly.
-=20
--  5. You can remove the program binaries and object files from the
--     source code directory by typing `make clean'.  To also remove the
--     files that `configure' created (so you can compile the package for
--     a different kind of computer), type `make distclean'.  There is
--     also a `make maintainer-clean' target, but that is intended mainly
-+  6. You can remove the program binaries and object files from the
-+     source code directory by typing 'make clean'.  To also remove the
-+     files that 'configure' created (so you can compile the package for
-+     a different kind of computer), type 'make distclean'.  There is
-+     also a 'make maintainer-clean' target, but that is intended mainly
-      for the package's developers.  If you use it, you may have to get
-      all sorts of other programs in order to regenerate files that came
-      with the distribution.
-=20
-+  7. Often, you can also type 'make uninstall' to remove the installed
-+     files again.  In practice, not all packages have tested that
-+     uninstallation works correctly, even though it is required by the
-+     GNU Coding Standards.
-+
-+  8. Some packages, particularly those that use Automake, provide 'make
-+     distcheck', which can by used by developers to test that all other
-+     targets like 'make install' and 'make uninstall' work correctly.
-+     This target is generally not run by end users.
-+
- Compilers and Options
- =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-=20
-    Some systems require unusual options for compilation or linking that
--the `configure' script does not know about.  Run `./configure --help'
-+the 'configure' script does not know about.  Run './configure --help'
- for details on some of the pertinent environment variables.
-=20
--   You can give `configure' initial values for configuration parameters
--by setting variables in the command line or in the environment.  Here
--is an example:
-+   You can give 'configure' initial values for configuration parameters
-+by setting variables in the command line or in the environment.  Here is
-+an example:
-=20
--     ./configure CC=3Dc89 CFLAGS=3D-O2 LIBS=3D-lposix
-+     ./configure CC=3Dc99 CFLAGS=3D-g LIBS=3D-lposix
-=20
-    *Note Defining Variables::, for more details.
-=20
-@@ -84,146 +112,257 @@ Compiling For Multiple Architectures
-=20
-    You can compile the package for more than one kind of computer at the
- same time, by placing the object files for each architecture in their
--own directory.  To do this, you must use a version of `make' that
--supports the `VPATH' variable, such as GNU `make'.  `cd' to the
-+own directory.  To do this, you can use GNU 'make'.  'cd' to the
- directory where you want the object files and executables to go and run
--the `configure' script.  `configure' automatically checks for the
--source code in the directory that `configure' is in and in `..'.
-+the 'configure' script.  'configure' automatically checks for the source
-+code in the directory that 'configure' is in and in '..'.  This is known
-+as a "VPATH" build.
-+
-+   With a non-GNU 'make', it is safer to compile the package for one
-+architecture at a time in the source code directory.  After you have
-+installed the package for one architecture, use 'make distclean' before
-+reconfiguring for another architecture.
-+
-+   On MacOS X 10.5 and later systems, you can create libraries and
-+executables that work on multiple system types--known as "fat" or
-+"universal" binaries--by specifying multiple '-arch' options to the
-+compiler but only a single '-arch' option to the preprocessor.  Like
-+this:
-+
-+     ./configure CC=3D"gcc -arch i386 -arch x86_64 -arch ppc -arch ppc64"=
 \
-+                 CXX=3D"g++ -arch i386 -arch x86_64 -arch ppc -arch ppc64=
" \
-+                 CPP=3D"gcc -E" CXXCPP=3D"g++ -E"
-=20
--   If you have to use a `make' that does not support the `VPATH'
--variable, you have to compile the package for one architecture at a
--time in the source code directory.  After you have installed the
--package for one architecture, use `make distclean' before reconfiguring
--for another architecture.
-+   This is not guaranteed to produce working output in all cases, you
-+may have to build one architecture at a time and combine the results
-+using the 'lipo' tool if you have problems.
-=20
- Installation Names
- =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-=20
--   By default, `make install' will install the package's files in
--`/usr/local/bin', `/usr/local/man', etc.  You can specify an
--installation prefix other than `/usr/local' by giving `configure' the
--option `--prefix=3DPATH'.
-+   By default, 'make install' installs the package's commands under
-+'/usr/local/bin', include files under '/usr/local/include', etc.  You
-+can specify an installation prefix other than '/usr/local' by giving
-+'configure' the option '--prefix=3DPREFIX', where PREFIX must be an
-+absolute file name.
-=20
-    You can specify separate installation prefixes for
- architecture-specific files and architecture-independent files.  If you
--give `configure' the option `--exec-prefix=3DPATH', the package will use
--PATH as the prefix for installing programs and libraries.
--Documentation and other data files will still use the regular prefix.
-+pass the option '--exec-prefix=3DPREFIX' to 'configure', the package uses
-+PREFIX as the prefix for installing programs and libraries.
-+Documentation and other data files still use the regular prefix.
-=20
-    In addition, if you use an unusual directory layout you can give
--options like `--bindir=3DPATH' to specify different values for particular
--kinds of files.  Run `configure --help' for a list of the directories
--you can set and what kinds of files go in them.
--
--   If the package supports it, you can cause programs to be installed
--with an extra prefix or suffix on their names by giving `configure' the
--option `--program-prefix=3DPREFIX' or `--program-suffix=3DSUFFIX'.
-+options like '--bindir=3DDIR' to specify different values for particular
-+kinds of files.  Run 'configure --help' for a list of the directories
-+you can set and what kinds of files go in them.  In general, the default
-+for these options is expressed in terms of '${prefix}', so that
-+specifying just '--prefix' will affect all of the other directory
-+specifications that were not explicitly provided.
-+
-+   The most portable way to affect installation locations is to pass the
-+correct locations to 'configure'; however, many packages provide one or
-+both of the following shortcuts of passing variable assignments to the
-+'make install' command line to change installation locations without
-+having to reconfigure or recompile.
-+
-+   The first method involves providing an override variable for each
-+affected directory.  For example, 'make install
-+prefix=3D/alternate/directory' will choose an alternate location for all
-+directory configuration variables that were expressed in terms of
-+'${prefix}'.  Any directories that were specified during 'configure',
-+but not in terms of '${prefix}', must each be overridden at install time
-+for the entire installation to be relocated.  The approach of makefile
-+variable overrides for each directory variable is required by the GNU
-+Coding Standards, and ideally causes no recompilation.  However, some
-+platforms have known limitations with the semantics of shared libraries
-+that end up requiring recompilation when using this method, particularly
-+noticeable in packages that use GNU Libtool.
-+
-+   The second method involves providing the 'DESTDIR' variable.  For
-+example, 'make install DESTDIR=3D/alternate/directory' will prepend
-+'/alternate/directory' before all installation names.  The approach of
-+'DESTDIR' overrides is not required by the GNU Coding Standards, and
-+does not work on platforms that have drive letters.  On the other hand,
-+it does better at avoiding recompilation issues, and works well even
-+when some directory options were not specified in terms of '${prefix}'
-+at 'configure' time.
-=20
- Optional Features
- =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-=20
--   Some packages pay attention to `--enable-FEATURE' options to
--`configure', where FEATURE indicates an optional part of the package.
--They may also pay attention to `--with-PACKAGE' options, where PACKAGE
--is something like `gnu-as' or `x' (for the X Window System).  The
--`README' should mention any `--enable-' and `--with-' options that the
-+   If the package supports it, you can cause programs to be installed
-+with an extra prefix or suffix on their names by giving 'configure' the
-+option '--program-prefix=3DPREFIX' or '--program-suffix=3DSUFFIX'.
-+
-+   Some packages pay attention to '--enable-FEATURE' options to
-+'configure', where FEATURE indicates an optional part of the package.
-+They may also pay attention to '--with-PACKAGE' options, where PACKAGE
-+is something like 'gnu-as' or 'x' (for the X Window System).  The
-+'README' should mention any '--enable-' and '--with-' options that the
- package recognizes.
-=20
--   For packages that use the X Window System, `configure' can usually
-+   For packages that use the X Window System, 'configure' can usually
- find the X include and library files automatically, but if it doesn't,
--you can use the `configure' options `--x-includes=3DDIR' and
--`--x-libraries=3DDIR' to specify their locations.
-+you can use the 'configure' options '--x-includes=3DDIR' and
-+'--x-libraries=3DDIR' to specify their locations.
-+
-+   Some packages offer the ability to configure how verbose the
-+execution of 'make' will be.  For these packages, running './configure
-+--enable-silent-rules' sets the default to minimal output, which can be
-+overridden with 'make V=3D1'; while running './configure
-+--disable-silent-rules' sets the default to verbose, which can be
-+overridden with 'make V=3D0'.
-+
-+Particular systems
-+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-+
-+   On HP-UX, the default C compiler is not ANSI C compatible.  If GNU CC
-+is not installed, it is recommended to use the following options in
-+order to use an ANSI C compiler:
-+
-+     ./configure CC=3D"cc -Ae -D_XOPEN_SOURCE=3D500"
-+
-+and if that doesn't work, install pre-built binaries of GCC for HP-UX.
-+
-+   HP-UX 'make' updates targets which have the same time stamps as their
-+prerequisites, which makes it generally unusable when shipped generated
-+files such as 'configure' are involved.  Use GNU 'make' instead.
-+
-+   On OSF/1 a.k.a. Tru64, some versions of the default C compiler cannot
-+parse its '<wchar.h>' header file.  The option '-nodtk' can be used as a
-+workaround.  If GNU CC is not installed, it is therefore recommended to
-+try
-+
-+     ./configure CC=3D"cc"
-+
-+and if that doesn't work, try
-+
-+     ./configure CC=3D"cc -nodtk"
-+
-+   On Solaris, don't put '/usr/ucb' early in your 'PATH'.  This
-+directory contains several dysfunctional programs; working variants of
-+these programs are available in '/usr/bin'.  So, if you need '/usr/ucb'
-+in your 'PATH', put it _after_ '/usr/bin'.
-+
-+   On Haiku, software installed for all users goes in '/boot/common',
-+not '/usr/local'.  It is recommended to use the following options:
-+
-+     ./configure --prefix=3D/boot/common
-=20
- Specifying the System Type
- =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
-=20
--   There may be some features `configure' cannot figure out
-+   There may be some features 'configure' cannot figure out
- automatically, but needs to determine by the type of machine the package
- will run on.  Usually, assuming the package is built to be run on the
--_same_ architectures, `configure' can figure that out, but if it prints
-+_same_ architectures, 'configure' can figure that out, but if it prints
- a message saying it cannot guess the machine type, give it the
--`--build=3DTYPE' option.  TYPE can either be a short name for the system
--type, such as `sun4', or a canonical name which has the form:
-+'--build=3DTYPE' option.  TYPE can either be a short name for the system
-+type, such as 'sun4', or a canonical name which has the form:
-=20
-      CPU-COMPANY-SYSTEM
-=20
- where SYSTEM can have one of these forms:
-=20
--     OS KERNEL-OS
-+     OS
-+     KERNEL-OS
-=20
--   See the file `config.sub' for the possible values of each field.  If
--`config.sub' isn't included in this package, then this package doesn't
-+   See the file 'config.sub' for the possible values of each field.  If
-+'config.sub' isn't included in this package, then this package doesn't
- need to know the machine type.
-=20
-    If you are _building_ compiler tools for cross-compiling, you should
--use the `--target=3DTYPE' option to select the type of system they will
-+use the option '--target=3DTYPE' to select the type of system they will
- produce code for.
-=20
-    If you want to _use_ a cross compiler, that generates code for a
- platform different from the build platform, you should specify the
- "host" platform (i.e., that on which the generated programs will
--eventually be run) with `--host=3DTYPE'.
-+eventually be run) with '--host=3DTYPE'.
-=20
- Sharing Defaults
- =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-=20
--   If you want to set default values for `configure' scripts to share,
--you can create a site shell script called `config.site' that gives
--default values for variables like `CC', `cache_file', and `prefix'.
--`configure' looks for `PREFIX/share/config.site' if it exists, then
--`PREFIX/etc/config.site' if it exists.  Or, you can set the
--`CONFIG_SITE' environment variable to the location of the site script.
--A warning: not all `configure' scripts look for a site script.
-+   If you want to set default values for 'configure' scripts to share,
-+you can create a site shell script called 'config.site' that gives
-+default values for variables like 'CC', 'cache_file', and 'prefix'.
-+'configure' looks for 'PREFIX/share/config.site' if it exists, then
-+'PREFIX/etc/config.site' if it exists.  Or, you can set the
-+'CONFIG_SITE' environment variable to the location of the site script.
-+A warning: not all 'configure' scripts look for a site script.
-=20
- Defining Variables
- =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-=20
-    Variables not defined in a site shell script can be set in the
--environment passed to `configure'.  However, some packages may run
-+environment passed to 'configure'.  However, some packages may run
- configure again during the build, and the customized values of these
- variables may be lost.  In order to avoid this problem, you should set
--them in the `configure' command line, using `VAR=3Dvalue'.  For example:
-+them in the 'configure' command line, using 'VAR=3Dvalue'.  For example:
-=20
-      ./configure CC=3D/usr/local2/bin/gcc
-=20
--will cause the specified gcc to be used as the C compiler (unless it is
-+causes the specified 'gcc' to be used as the C compiler (unless it is
- overridden in the site shell script).
-=20
--`configure' Invocation
-+Unfortunately, this technique does not work for 'CONFIG_SHELL' due to an
-+Autoconf limitation.  Until the limitation is lifted, you can use this
-+workaround:
-+
-+     CONFIG_SHELL=3D/bin/bash ./configure CONFIG_SHELL=3D/bin/bash
-+
-+'configure' Invocation
- =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-=20
--   `configure' recognizes the following options to control how it
-+   'configure' recognizes the following options to control how it
- operates.
-=20
--`--help'
--`-h'
--     Print a summary of the options to `configure', and exit.
-+'--help'
-+'-h'
-+     Print a summary of all of the options to 'configure', and exit.
-+
-+'--help=3Dshort'
-+'--help=3Drecursive'
-+     Print a summary of the options unique to this package's
-+     'configure', and exit.  The 'short' variant lists options used only
-+     in the top level, while the 'recursive' variant lists options also
-+     present in any nested packages.
-=20
--`--version'
--`-V'
--     Print the version of Autoconf used to generate the `configure'
-+'--version'
-+'-V'
-+     Print the version of Autoconf used to generate the 'configure'
-      script, and exit.
-=20
--`--cache-file=3DFILE'
-+'--cache-file=3DFILE'
-      Enable the cache: use and save the results of the tests in FILE,
--     traditionally `config.cache'.  FILE defaults to `/dev/null' to
-+     traditionally 'config.cache'.  FILE defaults to '/dev/null' to
-      disable caching.
-=20
--`--config-cache'
--`-C'
--     Alias for `--cache-file=3Dconfig.cache'.
-+'--config-cache'
-+'-C'
-+     Alias for '--cache-file=3Dconfig.cache'.
-=20
--`--quiet'
--`--silent'
--`-q'
-+'--quiet'
-+'--silent'
-+'-q'
-      Do not print messages saying which checks are being made.  To
--     suppress all normal output, redirect it to `/dev/null' (any error
-+     suppress all normal output, redirect it to '/dev/null' (any error
-      messages will still be shown).
-=20
--`--srcdir=3DDIR'
-+'--srcdir=3DDIR'
-      Look for the package's source code in directory DIR.  Usually
--     `configure' can determine that directory automatically.
-+     'configure' can determine that directory automatically.
-+
-+'--prefix=3DDIR'
-+     Use DIR as the installation prefix.  *note Installation Names:: for
-+     more details, including other options available for fine-tuning the
-+     installation locations.
-=20
--`configure' also accepts some other, not widely useful, options.  Run
--`configure --help' for more details.
-+'--no-create'
-+'-n'
-+     Run the configure checks, but stop before creating any output
-+     files.
-=20
-+'configure' also accepts some other, not widely useful, options.  Run
-+'configure --help' for more details.
-diff --git a/autogen.sh b/autogen.sh
-deleted file mode 100755
-index 6def96dd..00000000
---- a/autogen.sh
-+++ /dev/null
-@@ -1,51 +0,0 @@
--#! /bin/sh
--
--echo aclocal...
--(aclocal --version) < /dev/null > /dev/null 2>&1 || {
--    echo aclocal not found
--    exit 1
--}
--
--aclocal -I ./scripts -I . ${ACLOCAL_FLAGS} || exit 1
--
--echo autoheader...
--(autoheader --version) < /dev/null > /dev/null 2>&1 || {
--    echo autoheader not found
--    exit 1
--}
--
--autoheader || exit 1
--
--echo -n "libtoolize... "
--if ( (glibtoolize --version) < /dev/null > /dev/null 2>&1 ); then
--    echo "using glibtoolize"
--    glibtoolize --automake --copy --force || exit 1
--
--elif ( (libtoolize --version) < /dev/null > /dev/null 2>&1 ) ; then
--    echo "using libtoolize"
--    libtoolize --automake --copy --force || exit 1
--
--else
--    echo "libtoolize nor glibtoolize not found"
--    exit 1
--fi
--
--echo automake...
--(automake --version) < /dev/null > /dev/null 2>&1 || {
--    echo automake not found
--    exit 1
--}
--
--automake --add-missing --copy --foreign || exit 1
--
--echo autoconf...
--(autoconf --version) < /dev/null > /dev/null 2>&1 || {
--    echo autoconf not found
--    exit 1
--}
--
--autoconf || exit 1
--
--echo ready to configure
--
--exit 0
-diff --git a/configure.ac b/configure.ac
-index a4f051e4..453e2936 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1,10 +1,14 @@
--AC_INIT(libtorrent, 0.13.8, sundell.software@gmail.com)
-+AC_INIT([[libtorrent]],[[0.13.8]],[[sundell.software@gmail.com]])
-=20
--LT_INIT([disable-static])
-+AC_CONFIG_HEADERS([config.h])
-+AC_CONFIG_MACRO_DIRS([scripts])
-+AM_INIT_AUTOMAKE([serial-tests subdir-objects foreign])
-+
-+LT_INIT([[disable-static]])
-=20
- dnl Find a better way to do this
--AC_DEFINE(PEER_NAME, "-lt0D80-", Identifier that is part of the default p=
eer id)
--AC_DEFINE(PEER_VERSION, "lt\x0D\x80", 4 byte client and version identifie=
r for DHT)
-+AC_DEFINE([[PEER_NAME]], [["-lt0D80-"]], [[Identifier that is part of the=
 default peer id.]])
-+AC_DEFINE([[PEER_VERSION]], [["lt\x0D\x80"]], [[4 byte client and version=
 identifier for DHT.]])
-=20
- LIBTORRENT_CURRENT=3D21
- LIBTORRENT_REVISION=3D0
-@@ -17,9 +21,6 @@ AC_SUBST(LIBTORRENT_CURRENT)
- AC_SUBST(LIBTORRENT_INTERFACE_VERSION_INFO)
- AC_SUBST(LIBTORRENT_INTERFACE_VERSION_NO)
-=20
--AM_INIT_AUTOMAKE([serial-tests subdir-objects])
--AC_CONFIG_HEADERS(config.h)
--
- AC_PROG_CXX
- AC_SYS_LARGEFILE
-=20
-@@ -29,14 +30,14 @@ AC_C_BIGENDIAN(
-   AC_MSG_ERROR([Could not determine endianness])
- )
-=20
-+AX_CXX_COMPILE_STDCXX(14, noext, mandatory)
-+
- RAK_CHECK_CFLAGS
- RAK_CHECK_CXXFLAGS
- RAK_ENABLE_DEBUG
- RAK_ENABLE_EXTRA_DEBUG
- RAK_ENABLE_WERROR
-=20
--RAK_CHECK_CXX11
--
- TORRENT_ENABLE_ALIGNED
- TORRENT_ENABLE_INTERRUPT_SOCKET
-=20
-@@ -55,7 +56,7 @@ TORRENT_WITHOUT_STATFS
- TORRENT_WITH_INOTIFY
-=20
- AC_ARG_ENABLE(attribute-visibility,
--  AC_HELP_STRING([--disable-attribute-visibility], [disable symbol visibi=
lity attribute [[default=3Denable]]]),
-+  AS_HELP_STRING([--disable-attribute-visibility],[disable symbol visibil=
ity attribute [[default=3Denable]]]),
-   [
-     if test "$enableval" =3D "yes"; then
-       CC_ATTRIBUTE_VISIBILITY
-@@ -65,7 +66,7 @@ AC_ARG_ENABLE(attribute-visibility,
-   ])
-=20
- AC_ARG_ENABLE(execinfo,
--  AC_HELP_STRING([--disable-execinfo], [disable libexecinfo [[default=3De=
nable]]]),
-+  AS_HELP_STRING([--disable-execinfo],[disable libexecinfo [[default=3Den=
able]]]),
-   [
-     if test "$enableval" =3D "yes"; then
-       AX_EXECINFO
-@@ -109,12 +110,13 @@ CC_ATTRIBUTE_UNUSED(
-   AC_DEFINE([__UNUSED], [], [Null-wrapper if unused attribute is unsuppor=
ted])
- )
-=20
--AC_OUTPUT([
-+AC_CONFIG_FILES([
- 	libtorrent.pc
- 	Makefile
- 	src/Makefile
- 	src/torrent/Makefile
--        test/Makefile
--        test/torrent/net/Makefile
--        test/net/Makefile
-+  test/Makefile
-+  test/torrent/net/Makefile
-+  test/net/Makefile
- ])
-+AC_OUTPUT
-diff --git a/scripts/ax_check_zlib.m4 b/scripts/ax_check_zlib.m4
-old mode 100644
-new mode 100755
-index ae5705f6..1a168430
---- a/scripts/ax_check_zlib.m4
-+++ b/scripts/ax_check_zlib.m4
-@@ -1,5 +1,5 @@
- # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
--#       http://www.gnu.org/software/autoconf-archive/ax_check_zlib.html
-+#      https://www.gnu.org/software/autoconf-archive/ax_check_zlib.html
- # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
- #
- # SYNOPSIS
-@@ -47,7 +47,7 @@
- #   Public License for more details.
- #
- #   You should have received a copy of the GNU General Public License alo=
ng
--#   with this program. If not, see <http://www.gnu.org/licenses/>.
-+#   with this program. If not, see <https://www.gnu.org/licenses/>.
- #
- #   As a special exception, the respective Autoconf Macro's copyright own=
er
- #   gives unlimited permission to copy, distribute and modify the configu=
re
-@@ -62,7 +62,7 @@
- #   modified version of the Autoconf Macro, you may extend this special
- #   exception to the GPL to apply to your modified version as well.
-=20
--#serial 14
-+#serial 16
-=20
- AU_ALIAS([CHECK_ZLIB], [AX_CHECK_ZLIB])
- AC_DEFUN([AX_CHECK_ZLIB],
-@@ -108,11 +108,10 @@ then
-         LDFLAGS=3D"$LDFLAGS -L${ZLIB_HOME}/lib"
-         CPPFLAGS=3D"$CPPFLAGS -I${ZLIB_HOME}/include"
-   fi
--  AC_LANG_SAVE
--  AC_LANG_C
-+  AC_LANG_PUSH([C])
-   AC_CHECK_LIB([z], [inflateEnd], [zlib_cv_libz=3Dyes], [zlib_cv_libz=3Dn=
o])
-   AC_CHECK_HEADER([zlib.h], [zlib_cv_zlib_h=3Dyes], [zlib_cv_zlib_h=3Dno]=
)
--  AC_LANG_RESTORE
-+  AC_LANG_POP([C])
-   if test "$zlib_cv_libz" =3D "yes" && test "$zlib_cv_zlib_h" =3D "yes"
-   then
-     #
-diff --git a/scripts/ax_cxx_compile_stdcxx.m4 b/scripts/ax_cxx_compile_std=
cxx.m4
-new file mode 100755
-index 00000000..9413da62
---- /dev/null
-+++ b/scripts/ax_cxx_compile_stdcxx.m4
-@@ -0,0 +1,962 @@
-+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
-+#  https://www.gnu.org/software/autoconf-archive/ax_cxx_compile_stdcxx.ht=
ml
-+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
-+#
-+# SYNOPSIS
-+#
-+#   AX_CXX_COMPILE_STDCXX(VERSION, [ext|noext], [mandatory|optional])
-+#
-+# DESCRIPTION
-+#
-+#   Check for baseline language coverage in the compiler for the specifie=
d
-+#   version of the C++ standard.  If necessary, add switches to CXX and
-+#   CXXCPP to enable support.  VERSION may be '11' (for the C++11 standar=
d)
-+#   or '14' (for the C++14 standard).
-+#
-+#   The second argument, if specified, indicates whether you insist on an
-+#   extended mode (e.g. -std=3Dgnu++11) or a strict conformance mode (e.g=
.
-+#   -std=3Dc++11).  If neither is specified, you get whatever works, with
-+#   preference for no added switch, and then for an extended mode.
-+#
-+#   The third argument, if specified 'mandatory' or if left unspecified,
-+#   indicates that baseline support for the specified C++ standard is
-+#   required and that the macro should error out if no mode with that
-+#   support is found.  If specified 'optional', then configuration procee=
ds
-+#   regardless, after defining HAVE_CXX${VERSION} if and only if a
-+#   supporting mode is found.
-+#
-+# LICENSE
-+#
-+#   Copyright (c) 2008 Benjamin Kosnik <bkoz@redhat.com>
-+#   Copyright (c) 2012 Zack Weinberg <zackw@panix.com>
-+#   Copyright (c) 2013 Roy Stogner <roystgnr@ices.utexas.edu>
-+#   Copyright (c) 2014, 2015 Google Inc.; contributed by Alexey Sokolov <=
sokolov@google.com>
-+#   Copyright (c) 2015 Paul Norman <penorman@mac.com>
-+#   Copyright (c) 2015 Moritz Klammler <moritz@klammler.eu>
-+#   Copyright (c) 2016, 2018 Krzesimir Nowak <qdlacz@gmail.com>
-+#   Copyright (c) 2019 Enji Cooper <yaneurabeya@gmail.com>
-+#   Copyright (c) 2020 Jason Merrill <jason@redhat.com>
-+#
-+#   Copying and distribution of this file, with or without modification, =
are
-+#   permitted in any medium without royalty provided the copyright notice
-+#   and this notice are preserved.  This file is offered as-is, without a=
ny
-+#   warranty.
-+
-+#serial 12
-+
-+dnl  This macro is based on the code from the AX_CXX_COMPILE_STDCXX_11 ma=
cro
-+dnl  (serial version number 13).
-+
-+AC_DEFUN([AX_CXX_COMPILE_STDCXX], [dnl
-+  m4_if([$1], [11], [ax_cxx_compile_alternatives=3D"11 0x"],
-+        [$1], [14], [ax_cxx_compile_alternatives=3D"14 1y"],
-+        [$1], [17], [ax_cxx_compile_alternatives=3D"17 1z"],
-+        [m4_fatal([invalid first argument `$1' to AX_CXX_COMPILE_STDCXX])=
])dnl
-+  m4_if([$2], [], [],
-+        [$2], [ext], [],
-+        [$2], [noext], [],
-+        [m4_fatal([invalid second argument `$2' to AX_CXX_COMPILE_STDCXX]=
)])dnl
-+  m4_if([$3], [], [ax_cxx_compile_cxx$1_required=3Dtrue],
-+        [$3], [mandatory], [ax_cxx_compile_cxx$1_required=3Dtrue],
-+        [$3], [optional], [ax_cxx_compile_cxx$1_required=3Dfalse],
-+        [m4_fatal([invalid third argument `$3' to AX_CXX_COMPILE_STDCXX])=
])
-+  AC_LANG_PUSH([C++])dnl
-+  ac_success=3Dno
-+
-+  m4_if([$2], [], [dnl
-+    AC_CACHE_CHECK(whether $CXX supports C++$1 features by default,
-+		   ax_cv_cxx_compile_cxx$1,
-+      [AC_COMPILE_IFELSE([AC_LANG_SOURCE([_AX_CXX_COMPILE_STDCXX_testbody=
_$1])],
-+        [ax_cv_cxx_compile_cxx$1=3Dyes],
-+        [ax_cv_cxx_compile_cxx$1=3Dno])])
-+    if test x$ax_cv_cxx_compile_cxx$1 =3D xyes; then
-+      ac_success=3Dyes
-+    fi])
-+
-+  m4_if([$2], [noext], [], [dnl
-+  if test x$ac_success =3D xno; then
-+    for alternative in ${ax_cxx_compile_alternatives}; do
-+      switch=3D"-std=3Dgnu++${alternative}"
-+      cachevar=3DAS_TR_SH([ax_cv_cxx_compile_cxx$1_$switch])
-+      AC_CACHE_CHECK(whether $CXX supports C++$1 features with $switch,
-+                     $cachevar,
-+        [ac_save_CXX=3D"$CXX"
-+         CXX=3D"$CXX $switch"
-+         AC_COMPILE_IFELSE([AC_LANG_SOURCE([_AX_CXX_COMPILE_STDCXX_testbo=
dy_$1])],
-+          [eval $cachevar=3Dyes],
-+          [eval $cachevar=3Dno])
-+         CXX=3D"$ac_save_CXX"])
-+      if eval test x\$$cachevar =3D xyes; then
-+        CXX=3D"$CXX $switch"
-+        if test -n "$CXXCPP" ; then
-+          CXXCPP=3D"$CXXCPP $switch"
-+        fi
-+        ac_success=3Dyes
-+        break
-+      fi
-+    done
-+  fi])
-+
-+  m4_if([$2], [ext], [], [dnl
-+  if test x$ac_success =3D xno; then
-+    dnl HP's aCC needs +std=3Dc++11 according to:
-+    dnl http://h21007.www2.hp.com/portal/download/files/unprot/aCxx/PDF_R=
elease_Notes/769149-001.pdf
-+    dnl Cray's crayCC needs "-h std=3Dc++11"
-+    for alternative in ${ax_cxx_compile_alternatives}; do
-+      for switch in -std=3Dc++${alternative} +std=3Dc++${alternative} "-h=
 std=3Dc++${alternative}"; do
-+        cachevar=3DAS_TR_SH([ax_cv_cxx_compile_cxx$1_$switch])
-+        AC_CACHE_CHECK(whether $CXX supports C++$1 features with $switch,
-+                       $cachevar,
-+          [ac_save_CXX=3D"$CXX"
-+           CXX=3D"$CXX $switch"
-+           AC_COMPILE_IFELSE([AC_LANG_SOURCE([_AX_CXX_COMPILE_STDCXX_test=
body_$1])],
-+            [eval $cachevar=3Dyes],
-+            [eval $cachevar=3Dno])
-+           CXX=3D"$ac_save_CXX"])
-+        if eval test x\$$cachevar =3D xyes; then
-+          CXX=3D"$CXX $switch"
-+          if test -n "$CXXCPP" ; then
-+            CXXCPP=3D"$CXXCPP $switch"
-+          fi
-+          ac_success=3Dyes
-+          break
-+        fi
-+      done
-+      if test x$ac_success =3D xyes; then
-+        break
-+      fi
-+    done
-+  fi])
-+  AC_LANG_POP([C++])
-+  if test x$ax_cxx_compile_cxx$1_required =3D xtrue; then
-+    if test x$ac_success =3D xno; then
-+      AC_MSG_ERROR([*** A compiler with support for C++$1 language featur=
es is required.])
-+    fi
-+  fi
-+  if test x$ac_success =3D xno; then
-+    HAVE_CXX$1=3D0
-+    AC_MSG_NOTICE([No compiler with C++$1 support was found])
-+  else
-+    HAVE_CXX$1=3D1
-+    AC_DEFINE(HAVE_CXX$1,1,
-+              [define if the compiler supports basic C++$1 syntax])
-+  fi
-+  AC_SUBST(HAVE_CXX$1)
-+])
-+
-+
-+dnl  Test body for checking C++11 support
-+
-+m4_define([_AX_CXX_COMPILE_STDCXX_testbody_11],
-+  _AX_CXX_COMPILE_STDCXX_testbody_new_in_11
-+)
-+
-+
-+dnl  Test body for checking C++14 support
-+
-+m4_define([_AX_CXX_COMPILE_STDCXX_testbody_14],
-+  _AX_CXX_COMPILE_STDCXX_testbody_new_in_11
-+  _AX_CXX_COMPILE_STDCXX_testbody_new_in_14
-+)
-+
-+m4_define([_AX_CXX_COMPILE_STDCXX_testbody_17],
-+  _AX_CXX_COMPILE_STDCXX_testbody_new_in_11
-+  _AX_CXX_COMPILE_STDCXX_testbody_new_in_14
-+  _AX_CXX_COMPILE_STDCXX_testbody_new_in_17
-+)
-+
-+dnl  Tests for new features in C++11
-+
-+m4_define([_AX_CXX_COMPILE_STDCXX_testbody_new_in_11], [[
-+
-+// If the compiler admits that it is not ready for C++11, why torture it?
-+// Hopefully, this will speed up the test.
-+
-+#ifndef __cplusplus
-+
-+#error "This is not a C++ compiler"
-+
-+#elif __cplusplus < 201103L
-+
-+#error "This is not a C++11 compiler"
-+
-+#else
-+
-+namespace cxx11
-+{
-+
-+  namespace test_static_assert
-+  {
-+
-+    template <typename T>
-+    struct check
-+    {
-+      static_assert(sizeof(int) <=3D sizeof(T), "not big enough");
-+    };
-+
-+  }
-+
-+  namespace test_final_override
-+  {
-+
-+    struct Base
-+    {
-+      virtual ~Base() {}
-+      virtual void f() {}
-+    };
-+
-+    struct Derived : public Base
-+    {
-+      virtual ~Derived() override {}
-+      virtual void f() override {}
-+    };
-+
-+  }
-+
-+  namespace test_double_right_angle_brackets
-+  {
-+
-+    template < typename T >
-+    struct check {};
-+
-+    typedef check<void> single_type;
-+    typedef check<check<void>> double_type;
-+    typedef check<check<check<void>>> triple_type;
-+    typedef check<check<check<check<void>>>> quadruple_type;
-+
-+  }
-+
-+  namespace test_decltype
-+  {
-+
-+    int
-+    f()
-+    {
-+      int a =3D 1;
-+      decltype(a) b =3D 2;
-+      return a + b;
-+    }
-+
-+  }
-+
-+  namespace test_type_deduction
-+  {
-+
-+    template < typename T1, typename T2 >
-+    struct is_same
-+    {
-+      static const bool value =3D false;
-+    };
-+
-+    template < typename T >
-+    struct is_same<T, T>
-+    {
-+      static const bool value =3D true;
-+    };
-+
-+    template < typename T1, typename T2 >
-+    auto
-+    add(T1 a1, T2 a2) -> decltype(a1 + a2)
-+    {
-+      return a1 + a2;
-+    }
-+
-+    int
-+    test(const int c, volatile int v)
-+    {
-+      static_assert(is_same<int, decltype(0)>::value =3D=3D true, "");
-+      static_assert(is_same<int, decltype(c)>::value =3D=3D false, "");
-+      static_assert(is_same<int, decltype(v)>::value =3D=3D false, "");
-+      auto ac =3D c;
-+      auto av =3D v;
-+      auto sumi =3D ac + av + 'x';
-+      auto sumf =3D ac + av + 1.0;
-+      static_assert(is_same<int, decltype(ac)>::value =3D=3D true, "");
-+      static_assert(is_same<int, decltype(av)>::value =3D=3D true, "");
-+      static_assert(is_same<int, decltype(sumi)>::value =3D=3D true, "");
-+      static_assert(is_same<int, decltype(sumf)>::value =3D=3D false, "")=
;
-+      static_assert(is_same<int, decltype(add(c, v))>::value =3D=3D true,=
 "");
-+      return (sumf > 0.0) ? sumi : add(c, v);
-+    }
-+
-+  }
-+
-+  namespace test_noexcept
-+  {
-+
-+    int f() { return 0; }
-+    int g() noexcept { return 0; }
-+
-+    static_assert(noexcept(f()) =3D=3D false, "");
-+    static_assert(noexcept(g()) =3D=3D true, "");
-+
-+  }
-+
-+  namespace test_constexpr
-+  {
-+
-+    template < typename CharT >
-+    unsigned long constexpr
-+    strlen_c_r(const CharT *const s, const unsigned long acc) noexcept
-+    {
-+      return *s ? strlen_c_r(s + 1, acc + 1) : acc;
-+    }
-+
-+    template < typename CharT >
-+    unsigned long constexpr
-+    strlen_c(const CharT *const s) noexcept
-+    {
-+      return strlen_c_r(s, 0UL);
-+    }
-+
-+    static_assert(strlen_c("") =3D=3D 0UL, "");
-+    static_assert(strlen_c("1") =3D=3D 1UL, "");
-+    static_assert(strlen_c("example") =3D=3D 7UL, "");
-+    static_assert(strlen_c("another\0example") =3D=3D 7UL, "");
-+
-+  }
-+
-+  namespace test_rvalue_references
-+  {
-+
-+    template < int N >
-+    struct answer
-+    {
-+      static constexpr int value =3D N;
-+    };
-+
-+    answer<1> f(int&)       { return answer<1>(); }
-+    answer<2> f(const int&) { return answer<2>(); }
-+    answer<3> f(int&&)      { return answer<3>(); }
-+
-+    void
-+    test()
-+    {
-+      int i =3D 0;
-+      const int c =3D 0;
-+      static_assert(decltype(f(i))::value =3D=3D 1, "");
-+      static_assert(decltype(f(c))::value =3D=3D 2, "");
-+      static_assert(decltype(f(0))::value =3D=3D 3, "");
-+    }
-+
-+  }
-+
-+  namespace test_uniform_initialization
-+  {
-+
-+    struct test
-+    {
-+      static const int zero {};
-+      static const int one {1};
-+    };
-+
-+    static_assert(test::zero =3D=3D 0, "");
-+    static_assert(test::one =3D=3D 1, "");
-+
-+  }
-+
-+  namespace test_lambdas
-+  {
-+
-+    void
-+    test1()
-+    {
-+      auto lambda1 =3D [](){};
-+      auto lambda2 =3D lambda1;
-+      lambda1();
-+      lambda2();
-+    }
-+
-+    int
-+    test2()
-+    {
-+      auto a =3D [](int i, int j){ return i + j; }(1, 2);
-+      auto b =3D []() -> int { return '0'; }();
-+      auto c =3D [=3D](){ return a + b; }();
-+      auto d =3D [&](){ return c; }();
-+      auto e =3D [a, &b](int x) mutable {
-+        const auto identity =3D [](int y){ return y; };
-+        for (auto i =3D 0; i < a; ++i)
-+          a +=3D b--;
-+        return x + identity(a + b);
-+      }(0);
-+      return a + b + c + d + e;
-+    }
-+
-+    int
-+    test3()
-+    {
-+      const auto nullary =3D [](){ return 0; };
-+      const auto unary =3D [](int x){ return x; };
-+      using nullary_t =3D decltype(nullary);
-+      using unary_t =3D decltype(unary);
-+      const auto higher1st =3D [](nullary_t f){ return f(); };
-+      const auto higher2nd =3D [unary](nullary_t f1){
-+        return [unary, f1](unary_t f2){ return f2(unary(f1())); };
-+      };
-+      return higher1st(nullary) + higher2nd(nullary)(unary);
-+    }
-+
-+  }
-+
-+  namespace test_variadic_templates
-+  {
-+
-+    template <int...>
-+    struct sum;
-+
-+    template <int N0, int... N1toN>
-+    struct sum<N0, N1toN...>
-+    {
-+      static constexpr auto value =3D N0 + sum<N1toN...>::value;
-+    };
-+
-+    template <>
-+    struct sum<>
-+    {
-+      static constexpr auto value =3D 0;
-+    };
-+
-+    static_assert(sum<>::value =3D=3D 0, "");
-+    static_assert(sum<1>::value =3D=3D 1, "");
-+    static_assert(sum<23>::value =3D=3D 23, "");
-+    static_assert(sum<1, 2>::value =3D=3D 3, "");
-+    static_assert(sum<5, 5, 11>::value =3D=3D 21, "");
-+    static_assert(sum<2, 3, 5, 7, 11, 13>::value =3D=3D 41, "");
-+
-+  }
-+
-+  // http://stackoverflow.com/questions/13728184/template-aliases-and-sfi=
nae
-+  // Clang 3.1 fails with headers of libstd++ 4.8.3 when using std::funct=
ion
-+  // because of this.
-+  namespace test_template_alias_sfinae
-+  {
-+
-+    struct foo {};
-+
-+    template<typename T>
-+    using member =3D typename T::member_type;
-+
-+    template<typename T>
-+    void func(...) {}
-+
-+    template<typename T>
-+    void func(member<T>*) {}
-+
-+    void test();
-+
-+    void test() { func<foo>(0); }
-+
-+  }
-+
-+}  // namespace cxx11
-+
-+#endif  // __cplusplus >=3D 201103L
-+
-+]])
-+
-+
-+dnl  Tests for new features in C++14
-+
-+m4_define([_AX_CXX_COMPILE_STDCXX_testbody_new_in_14], [[
-+
-+// If the compiler admits that it is not ready for C++14, why torture it?
-+// Hopefully, this will speed up the test.
-+
-+#ifndef __cplusplus
-+
-+#error "This is not a C++ compiler"
-+
-+#elif __cplusplus < 201402L
-+
-+#error "This is not a C++14 compiler"
-+
-+#else
-+
-+namespace cxx14
-+{
-+
-+  namespace test_polymorphic_lambdas
-+  {
-+
-+    int
-+    test()
-+    {
-+      const auto lambda =3D [](auto&&... args){
-+        const auto istiny =3D [](auto x){
-+          return (sizeof(x) =3D=3D 1UL) ? 1 : 0;
-+        };
-+        const int aretiny[] =3D { istiny(args)... };
-+        return aretiny[0];
-+      };
-+      return lambda(1, 1L, 1.0f, '1');
-+    }
-+
-+  }
-+
-+  namespace test_binary_literals
-+  {
-+
-+    constexpr auto ivii =3D 0b0000000000101010;
-+    static_assert(ivii =3D=3D 42, "wrong value");
-+
-+  }
-+
-+  namespace test_generalized_constexpr
-+  {
-+
-+    template < typename CharT >
-+    constexpr unsigned long
-+    strlen_c(const CharT *const s) noexcept
-+    {
-+      auto length =3D 0UL;
-+      for (auto p =3D s; *p; ++p)
-+        ++length;
-+      return length;
-+    }
-+
-+    static_assert(strlen_c("") =3D=3D 0UL, "");
-+    static_assert(strlen_c("x") =3D=3D 1UL, "");
-+    static_assert(strlen_c("test") =3D=3D 4UL, "");
-+    static_assert(strlen_c("another\0test") =3D=3D 7UL, "");
-+
-+  }
-+
-+  namespace test_lambda_init_capture
-+  {
-+
-+    int
-+    test()
-+    {
-+      auto x =3D 0;
-+      const auto lambda1 =3D [a =3D x](int b){ return a + b; };
-+      const auto lambda2 =3D [a =3D lambda1(x)](){ return a; };
-+      return lambda2();
-+    }
-+
-+  }
-+
-+  namespace test_digit_separators
-+  {
-+
-+    constexpr auto ten_million =3D 100'000'000;
-+    static_assert(ten_million =3D=3D 100000000, "");
-+
-+  }
-+
-+  namespace test_return_type_deduction
-+  {
-+
-+    auto f(int& x) { return x; }
-+    decltype(auto) g(int& x) { return x; }
-+
-+    template < typename T1, typename T2 >
-+    struct is_same
-+    {
-+      static constexpr auto value =3D false;
-+    };
-+
-+    template < typename T >
-+    struct is_same<T, T>
-+    {
-+      static constexpr auto value =3D true;
-+    };
-+
-+    int
-+    test()
-+    {
-+      auto x =3D 0;
-+      static_assert(is_same<int, decltype(f(x))>::value, "");
-+      static_assert(is_same<int&, decltype(g(x))>::value, "");
-+      return x;
-+    }
-+
-+  }
-+
-+}  // namespace cxx14
-+
-+#endif  // __cplusplus >=3D 201402L
-+
-+]])
-+
-+
-+dnl  Tests for new features in C++17
-+
-+m4_define([_AX_CXX_COMPILE_STDCXX_testbody_new_in_17], [[
-+
-+// If the compiler admits that it is not ready for C++17, why torture it?
-+// Hopefully, this will speed up the test.
-+
-+#ifndef __cplusplus
-+
-+#error "This is not a C++ compiler"
-+
-+#elif __cplusplus < 201703L
-+
-+#error "This is not a C++17 compiler"
-+
-+#else
-+
-+#include <initializer_list>
-+#include <utility>
-+#include <type_traits>
-+
-+namespace cxx17
-+{
-+
-+  namespace test_constexpr_lambdas
-+  {
-+
-+    constexpr int foo =3D [](){return 42;}();
-+
-+  }
-+
-+  namespace test::nested_namespace::definitions
-+  {
-+
-+  }
-+
-+  namespace test_fold_expression
-+  {
-+
-+    template<typename... Args>
-+    int multiply(Args... args)
-+    {
-+      return (args * ... * 1);
-+    }
-+
-+    template<typename... Args>
-+    bool all(Args... args)
-+    {
-+      return (args && ...);
-+    }
-+
-+  }
-+
-+  namespace test_extended_static_assert
-+  {
-+
-+    static_assert (true);
-+
-+  }
-+
-+  namespace test_auto_brace_init_list
-+  {
-+
-+    auto foo =3D {5};
-+    auto bar {5};
-+
-+    static_assert(std::is_same<std::initializer_list<int>, decltype(foo)>=
::value);
-+    static_assert(std::is_same<int, decltype(bar)>::value);
-+  }
-+
-+  namespace test_typename_in_template_template_parameter
-+  {
-+
-+    template<template<typename> typename X> struct D;
-+
-+  }
-+
-+  namespace test_fallthrough_nodiscard_maybe_unused_attributes
-+  {
-+
-+    int f1()
-+    {
-+      return 42;
-+    }
-+
-+    [[nodiscard]] int f2()
-+    {
-+      [[maybe_unused]] auto unused =3D f1();
-+
-+      switch (f1())
-+      {
-+      case 17:
-+        f1();
-+        [[fallthrough]];
-+      case 42:
-+        f1();
-+      }
-+      return f1();
-+    }
-+
-+  }
-+
-+  namespace test_extended_aggregate_initialization
-+  {
-+
-+    struct base1
-+    {
-+      int b1, b2 =3D 42;
-+    };
-+
-+    struct base2
-+    {
-+      base2() {
-+        b3 =3D 42;
-+      }
-+      int b3;
-+    };
-+
-+    struct derived : base1, base2
-+    {
-+        int d;
-+    };
-+
-+    derived d1 {{1, 2}, {}, 4};  // full initialization
-+    derived d2 {{}, {}, 4};      // value-initialized bases
-+
-+  }
-+
-+  namespace test_general_range_based_for_loop
-+  {
-+
-+    struct iter
-+    {
-+      int i;
-+
-+      int& operator* ()
-+      {
-+        return i;
-+      }
-+
-+      const int& operator* () const
-+      {
-+        return i;
-+      }
-+
-+      iter& operator++()
-+      {
-+        ++i;
-+        return *this;
-+      }
-+    };
-+
-+    struct sentinel
-+    {
-+      int i;
-+    };
-+
-+    bool operator=3D=3D (const iter& i, const sentinel& s)
-+    {
-+      return i.i =3D=3D s.i;
-+    }
-+
-+    bool operator!=3D (const iter& i, const sentinel& s)
-+    {
-+      return !(i =3D=3D s);
-+    }
-+
-+    struct range
-+    {
-+      iter begin() const
-+      {
-+        return {0};
-+      }
-+
-+      sentinel end() const
-+      {
-+        return {5};
-+      }
-+    };
-+
-+    void f()
-+    {
-+      range r {};
-+
-+      for (auto i : r)
-+      {
-+        [[maybe_unused]] auto v =3D i;
-+      }
-+    }
-+
-+  }
-+
-+  namespace test_lambda_capture_asterisk_this_by_value
-+  {
-+
-+    struct t
-+    {
-+      int i;
-+      int foo()
-+      {
-+        return [*this]()
-+        {
-+          return i;
-+        }();
-+      }
-+    };
-+
-+  }
-+
-+  namespace test_enum_class_construction
-+  {
-+
-+    enum class byte : unsigned char
-+    {};
-+
-+    byte foo {42};
-+
-+  }
-+
-+  namespace test_constexpr_if
-+  {
-+
-+    template <bool cond>
-+    int f ()
-+    {
-+      if constexpr(cond)
-+      {
-+        return 13;
-+      }
-+      else
-+      {
-+        return 42;
-+      }
-+    }
-+
-+  }
-+
-+  namespace test_selection_statement_with_initializer
-+  {
-+
-+    int f()
-+    {
-+      return 13;
-+    }
-+
-+    int f2()
-+    {
-+      if (auto i =3D f(); i > 0)
-+      {
-+        return 3;
-+      }
-+
-+      switch (auto i =3D f(); i + 4)
-+      {
-+      case 17:
-+        return 2;
-+
-+      default:
-+        return 1;
-+      }
-+    }
-+
-+  }
-+
-+  namespace test_template_argument_deduction_for_class_templates
-+  {
-+
-+    template <typename T1, typename T2>
-+    struct pair
-+    {
-+      pair (T1 p1, T2 p2)
-+        : m1 {p1},
-+          m2 {p2}
-+      {}
-+
-+      T1 m1;
-+      T2 m2;
-+    };
-+
-+    void f()
-+    {
-+      [[maybe_unused]] auto p =3D pair{13, 42u};
-+    }
-+
-+  }
-+
-+  namespace test_non_type_auto_template_parameters
-+  {
-+
-+    template <auto n>
-+    struct B
-+    {};
-+
-+    B<5> b1;
-+    B<'a'> b2;
-+
-+  }
-+
-+  namespace test_structured_bindings
-+  {
-+
-+    int arr[2] =3D { 1, 2 };
-+    std::pair<int, int> pr =3D { 1, 2 };
-+
-+    auto f1() -> int(&)[2]
-+    {
-+      return arr;
-+    }
-+
-+    auto f2() -> std::pair<int, int>&
-+    {
-+      return pr;
-+    }
-+
-+    struct S
-+    {
-+      int x1 : 2;
-+      volatile double y1;
-+    };
-+
-+    S f3()
-+    {
-+      return {};
-+    }
-+
-+    auto [ x1, y1 ] =3D f1();
-+    auto& [ xr1, yr1 ] =3D f1();
-+    auto [ x2, y2 ] =3D f2();
-+    auto& [ xr2, yr2 ] =3D f2();
-+    const auto [ x3, y3 ] =3D f3();
-+
-+  }
-+
-+  namespace test_exception_spec_type_system
-+  {
-+
-+    struct Good {};
-+    struct Bad {};
-+
-+    void g1() noexcept;
-+    void g2();
-+
-+    template<typename T>
-+    Bad
-+    f(T*, T*);
-+
-+    template<typename T1, typename T2>
-+    Good
-+    f(T1*, T2*);
-+
-+    static_assert (std::is_same_v<Good, decltype(f(g1, g2))>);
-+
-+  }
-+
-+  namespace test_inline_variables
-+  {
-+
-+    template<class T> void f(T)
-+    {}
-+
-+    template<class T> inline T g(T)
-+    {
-+      return T{};
-+    }
-+
-+    template<> inline void f<>(int)
-+    {}
-+
-+    template<> int g<>(int)
-+    {
-+      return 5;
-+    }
-+
-+  }
-+
-+}  // namespace cxx17
-+
-+#endif  // __cplusplus < 201703L
-+
-+]])
-diff --git a/scripts/ax_cxx_compile_stdcxx_0x.m4 b/scripts/ax_cxx_compile_=
stdcxx_0x.m4
-deleted file mode 100644
-index 5ff134a6..00000000
---- a/scripts/ax_cxx_compile_stdcxx_0x.m4
-+++ /dev/null
-@@ -1,106 +0,0 @@
--# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
--#  http://www.gnu.org/software/autoconf-archive/ax_cxx_compile_stdcxx_0x.=
html
--# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
--#
--# SYNOPSIS
--#
--#   AX_CXX_COMPILE_STDCXX_0X
--#
--# DESCRIPTION
--#
--#   Check for baseline language coverage in the compiler for the C++0x
--#   standard.
--#
--# LICENSE
--#
--#   Copyright (c) 2008 Benjamin Kosnik <bkoz@redhat.com>
--#
--#   Copying and distribution of this file, with or without modification, =
are
--#   permitted in any medium without royalty provided the copyright notice
--#   and this notice are preserved. This file is offered as-is, without an=
y
--#   warranty.
--
--#serial 7 (+1)
--
--AU_ALIAS([AC_CXX_COMPILE_STDCXX_0X], [AX_CXX_COMPILE_STDCXX_0X])
--AC_DEFUN([AX_CXX_COMPILE_STDCXX_0X], [
--  AC_CACHE_CHECK(if g++ supports C++0x features without additional flags,
--  ax_cv_cxx_compile_cxx0x_native,
--  [AC_LANG_SAVE
--  AC_LANG_CPLUSPLUS
--  AC_TRY_COMPILE([
--  template <typename T>
--    struct check
--    {
--      static_assert(sizeof(int) <=3D sizeof(T), "not big enough");
--    };
--
--    typedef check<check<bool>> right_angle_brackets;
--
--    int a;
--    decltype(a) b;
--
--    typedef check<int> check_type;
--    check_type c;
--    check_type&& cr =3D static_cast<check_type&&>(c);],,
--  ax_cv_cxx_compile_cxx0x_native=3Dyes, ax_cv_cxx_compile_cxx0x_native=3D=
no)
--  AC_LANG_RESTORE
--  ])
--
--  AC_CACHE_CHECK(if g++ supports C++0x features with -std=3Dc++0x,
--  ax_cv_cxx_compile_cxx0x_cxx,
--  [AC_LANG_SAVE
--  AC_LANG_CPLUSPLUS
--  ac_save_CXXFLAGS=3D"$CXXFLAGS"
--  CXXFLAGS=3D"$CXXFLAGS -std=3Dc++0x"
--  AC_TRY_COMPILE([
--  template <typename T>
--    struct check
--    {
--      static_assert(sizeof(int) <=3D sizeof(T), "not big enough");
--    };
--
--    typedef check<check<bool>> right_angle_brackets;
--
--    int a;
--    decltype(a) b;
--
--    typedef check<int> check_type;
--    check_type c;
--    check_type&& cr =3D static_cast<check_type&&>(c);],,
--  ax_cv_cxx_compile_cxx0x_cxx=3Dyes, ax_cv_cxx_compile_cxx0x_cxx=3Dno)
--  CXXFLAGS=3D"$ac_save_CXXFLAGS"
--  AC_LANG_RESTORE
--  ])
--
--  AC_CACHE_CHECK(if g++ supports C++0x features with -std=3Dgnu++0x,
--  ax_cv_cxx_compile_cxx0x_gxx,
--  [AC_LANG_SAVE
--  AC_LANG_CPLUSPLUS
--  ac_save_CXXFLAGS=3D"$CXXFLAGS"
--  CXXFLAGS=3D"$CXXFLAGS -std=3Dgnu++0x"
--  AC_TRY_COMPILE([
--  template <typename T>
--    struct check
--    {
--      static_assert(sizeof(int) <=3D sizeof(T), "not big enough");
--    };
--
--    typedef check<check<bool>> right_angle_brackets;
--
--    int a;
--    decltype(a) b;
--
--    typedef check<int> check_type;
--    check_type c;
--    check_type&& cr =3D static_cast<check_type&&>(c);],,
--  ax_cv_cxx_compile_cxx0x_gxx=3Dyes, ax_cv_cxx_compile_cxx0x_gxx=3Dno)
--  CXXFLAGS=3D"$ac_save_CXXFLAGS"
--  AC_LANG_RESTORE
--  ])
--
--  if test "$ax_cv_cxx_compile_cxx0x_cxx" =3D yes; then =20
--    AC_DEFINE(HAVE_STDCXX_0X,, [Define if compiler supports C++0x feature=
s.])
--    CXXFLAGS=3D"$CXXFLAGS -std=3Dc++0x"
--  fi
--])
-diff --git a/scripts/ax_cxx_compile_stdcxx_11.m4 b/scripts/ax_cxx_compile_=
stdcxx_11.m4
-deleted file mode 100644
-index 5cf70eb6..00000000
---- a/scripts/ax_cxx_compile_stdcxx_11.m4
-+++ /dev/null
-@@ -1,147 +0,0 @@
--# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
--#  http://www.gnu.org/software/autoconf-archive/ax_cxx_compile_stdcxx_11.=
html
--# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
--#
--# SYNOPSIS
--#
--#   AX_CXX_COMPILE_STDCXX_11([ext|noext],[mandatory|optional])
--#
--# DESCRIPTION
--#
--#   Check for baseline language coverage in the compiler for the C++11
--#   standard; if necessary, add switches to CXXFLAGS to enable support.
--#
--#   The first argument, if specified, indicates whether you insist on an
--#   extended mode (e.g. -std=3Dgnu++11) or a strict conformance mode (e.g=
.
--#   -std=3Dc++11).  If neither is specified, you get whatever works, with
--#   preference for an extended mode.
--#
--#   The second argument, if specified 'mandatory' or if left unspecified,
--#   indicates that baseline C++11 support is required and that the macro
--#   should error out if no mode with that support is found.  If specified
--#   'optional', then configuration proceeds regardless, after defining
--#   HAVE_CXX11 if and only if a supporting mode is found.
--#
--# LICENSE
--#
--#   Copyright (c) 2008 Benjamin Kosnik <bkoz@redhat.com>
--#   Copyright (c) 2012 Zack Weinberg <zackw@panix.com>
--#   Copyright (c) 2013 Roy Stogner <roystgnr@ices.utexas.edu>
--#   Copyright (c) 2014 Alexey Sokolov <sokolov@google.com>
--#   Copyright (c) 2014 Jari Sundell <sundell.software@gmail.com>
--#
--#   Copying and distribution of this file, with or without modification, =
are
--#   permitted in any medium without royalty provided the copyright notice
--#   and this notice are preserved. This file is offered as-is, without an=
y
--#   warranty.
--
--#serial 5
--
--m4_define([_AX_CXX_COMPILE_STDCXX_11_testbody], [[
--  template <typename T>
--    struct check
--    {
--      static_assert(sizeof(int) <=3D sizeof(T), "not big enough");
--    };
--
--    struct Base {
--    virtual void f() {}
--    };
--    struct Child : public Base {
--    virtual void f() override {}
--    };
--
--    typedef check<check<bool>> right_angle_brackets;
--
--    int a;
--    decltype(a) b;
--
--    typedef check<int> check_type;
--    check_type c;
--    check_type&& cr =3D static_cast<check_type&&>(c);
--
--    auto d =3D a;
--    auto l =3D [](){};
--
--    void unused() {
--      l();
--    }
--]])
--
--AC_DEFUN([AX_CXX_COMPILE_STDCXX_11], [dnl
--  m4_if([$1], [], [],
--        [$1], [ext], [],
--        [$1], [noext], [],
--        [m4_fatal([invalid argument `$1' to AX_CXX_COMPILE_STDCXX_11])])d=
nl
--  m4_if([$2], [], [ax_cxx_compile_cxx11_required=3Dtrue],
--        [$2], [mandatory], [ax_cxx_compile_cxx11_required=3Dtrue],
--        [$2], [optional], [ax_cxx_compile_cxx11_required=3Dfalse],
--        [m4_fatal([invalid second argument `$2' to AX_CXX_COMPILE_STDCXX_=
11])])
--  AC_LANG_PUSH([C++])dnl
--  ac_success=3Dno
--  AC_CACHE_CHECK(whether $CXX supports C++11 features by default,
--  ax_cv_cxx_compile_cxx11,
--  [AC_COMPILE_IFELSE([AC_LANG_SOURCE([_AX_CXX_COMPILE_STDCXX_11_testbody]=
)],
--    [ax_cv_cxx_compile_cxx11=3Dyes],
--    [ax_cv_cxx_compile_cxx11=3Dno])])
--  if test x$ax_cv_cxx_compile_cxx11 =3D xyes; then
--    ac_success=3Dyes
--  fi
--
--  m4_if([$1], [noext], [], [dnl
--  if test x$ac_success =3D xno; then
--    for switch in -std=3Dgnu++11 -std=3Dgnu++0x; do
--      cachevar=3DAS_TR_SH([ax_cv_cxx_compile_cxx11_$switch])
--      AC_CACHE_CHECK(whether $CXX supports C++11 features with $switch,
--                     $cachevar,
--        [ac_save_CXXFLAGS=3D"$CXXFLAGS"
--         CXXFLAGS=3D"$CXXFLAGS $switch"
--         AC_COMPILE_IFELSE([AC_LANG_SOURCE([_AX_CXX_COMPILE_STDCXX_11_tes=
tbody])],
--          [eval $cachevar=3Dyes],
--          [eval $cachevar=3Dno])
--         CXXFLAGS=3D"$ac_save_CXXFLAGS"])
--      if eval test x\$$cachevar =3D xyes; then
--        CXXFLAGS=3D"$CXXFLAGS $switch"
--        ac_success=3Dyes
--        break
--      fi
--    done
--  fi])
--
--  m4_if([$1], [ext], [], [dnl
--  if test x$ac_success =3D xno; then
--    for switch in -std=3Dc++11 -std=3Dc++0x; do
--      cachevar=3DAS_TR_SH([ax_cv_cxx_compile_cxx11_$switch])
--      AC_CACHE_CHECK(whether $CXX supports C++11 features with $switch,
--                     $cachevar,
--        [ac_save_CXXFLAGS=3D"$CXXFLAGS"
--         CXXFLAGS=3D"$CXXFLAGS $switch"
--         AC_COMPILE_IFELSE([AC_LANG_SOURCE([_AX_CXX_COMPILE_STDCXX_11_tes=
tbody])],
--          [eval $cachevar=3Dyes],
--          [eval $cachevar=3Dno])
--         CXXFLAGS=3D"$ac_save_CXXFLAGS"])
--      if eval test x\$$cachevar =3D xyes; then
--        CXXFLAGS=3D"$CXXFLAGS $switch"
--        ac_success=3Dyes
--        break
--      fi
--    done
--  fi])
--  AC_LANG_POP([C++])
--  if test x$ax_cxx_compile_cxx11_required =3D xtrue; then
--    if test x$ac_success =3D xno; then
--      AC_MSG_ERROR([*** A compiler with support for C++11 language featur=
es is required.])
--    fi
--  else
--    if test x$ac_success =3D xno; then
--      HAVE_CXX11=3D0
--      AC_MSG_NOTICE([No compiler with C++11 support was found])
--    else
--      HAVE_CXX11=3D1
--      AC_DEFINE(HAVE_CXX11,1,
--                [define if the compiler supports basic C++11 syntax])
--    fi
--
--    AC_SUBST(HAVE_CXX11)
--  fi
--])
-diff --git a/scripts/ax_pthread.m4 b/scripts/ax_pthread.m4
-old mode 100644
-new mode 100755
-index 27f2533c..9f35d139
---- a/scripts/ax_pthread.m4
-+++ b/scripts/ax_pthread.m4
-@@ -1,5 +1,5 @@
- # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
--#        http://www.gnu.org/software/autoconf-archive/ax_pthread.html
-+#        https://www.gnu.org/software/autoconf-archive/ax_pthread.html
- # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
- #
- # SYNOPSIS
-@@ -14,24 +14,28 @@
- #   flags that are needed. (The user can also force certain compiler
- #   flags/libs to be tested by setting these environment variables.)
- #
--#   Also sets PTHREAD_CC to any special C compiler that is needed for
--#   multi-threaded programs (defaults to the value of CC otherwise). (Thi=
s
--#   is necessary on AIX to use the special cc_r compiler alias.)
-+#   Also sets PTHREAD_CC and PTHREAD_CXX to any special C compiler that i=
s
-+#   needed for multi-threaded programs (defaults to the value of CC
-+#   respectively CXX otherwise). (This is necessary on e.g. AIX to use th=
e
-+#   special cc_r/CC_r compiler alias.)
- #
- #   NOTE: You are assumed to not only compile your program with these fla=
gs,
--#   but also link it with them as well. e.g. you should link with
-+#   but also to link with them as well. For example, you might link with
- #   $PTHREAD_CC $CFLAGS $PTHREAD_CFLAGS $LDFLAGS ... $PTHREAD_LIBS $LIBS
-+#   $PTHREAD_CXX $CXXFLAGS $PTHREAD_CFLAGS $LDFLAGS ... $PTHREAD_LIBS $LI=
BS
- #
--#   If you are only building threads programs, you may wish to use these
-+#   If you are only building threaded programs, you may wish to use these
- #   variables in your default LIBS, CFLAGS, and CC:
- #
- #     LIBS=3D"$PTHREAD_LIBS $LIBS"
- #     CFLAGS=3D"$CFLAGS $PTHREAD_CFLAGS"
-+#     CXXFLAGS=3D"$CXXFLAGS $PTHREAD_CFLAGS"
- #     CC=3D"$PTHREAD_CC"
-+#     CXX=3D"$PTHREAD_CXX"
- #
- #   In addition, if the PTHREAD_CREATE_JOINABLE thread-attribute constant
--#   has a nonstandard name, defines PTHREAD_CREATE_JOINABLE to that name
--#   (e.g. PTHREAD_CREATE_UNDETACHED on AIX).
-+#   has a nonstandard name, this macro defines PTHREAD_CREATE_JOINABLE to
-+#   that name (e.g. PTHREAD_CREATE_UNDETACHED on AIX).
- #
- #   Also HAVE_PTHREAD_PRIO_INHERIT is defined if pthread is found and the
- #   PTHREAD_PRIO_INHERIT symbol is defined when compiling with
-@@ -55,6 +59,7 @@
- #
- #   Copyright (c) 2008 Steven G. Johnson <stevenj@alum.mit.edu>
- #   Copyright (c) 2011 Daniel Richard G. <skunk@iSKUNK.ORG>
-+#   Copyright (c) 2019 Marc Stevens <marc.stevens@cwi.nl>
- #
- #   This program is free software: you can redistribute it and/or modify =
it
- #   under the terms of the GNU General Public License as published by the
-@@ -67,7 +72,7 @@
- #   Public License for more details.
- #
- #   You should have received a copy of the GNU General Public License alo=
ng
--#   with this program. If not, see <http://www.gnu.org/licenses/>.
-+#   with this program. If not, see <https://www.gnu.org/licenses/>.
- #
- #   As a special exception, the respective Autoconf Macro's copyright own=
er
- #   gives unlimited permission to copy, distribute and modify the configu=
re
-@@ -82,35 +87,41 @@
- #   modified version of the Autoconf Macro, you may extend this special
- #   exception to the GPL to apply to your modified version as well.
-=20
--#serial 17
-+#serial 31
-=20
- AU_ALIAS([ACX_PTHREAD], [AX_PTHREAD])
- AC_DEFUN([AX_PTHREAD], [
- AC_REQUIRE([AC_CANONICAL_HOST])
-+AC_REQUIRE([AC_PROG_CC])
-+AC_REQUIRE([AC_PROG_SED])
- AC_LANG_PUSH([C])
- ax_pthread_ok=3Dno
-=20
- # We used to check for pthread.h first, but this fails if pthread.h
--# requires special compiler flags (e.g. on True64 or Sequent).
-+# requires special compiler flags (e.g. on Tru64 or Sequent).
- # It gets checked for in the link test anyway.
-=20
- # First of all, check if the user has set any of the PTHREAD_LIBS,
- # etcetera environment variables, and if threads linking works using
- # them:
--if test x"$PTHREAD_LIBS$PTHREAD_CFLAGS" !=3D x; then
--        save_CFLAGS=3D"$CFLAGS"
-+if test "x$PTHREAD_CFLAGS$PTHREAD_LIBS" !=3D "x"; then
-+        ax_pthread_save_CC=3D"$CC"
-+        ax_pthread_save_CFLAGS=3D"$CFLAGS"
-+        ax_pthread_save_LIBS=3D"$LIBS"
-+        AS_IF([test "x$PTHREAD_CC" !=3D "x"], [CC=3D"$PTHREAD_CC"])
-+        AS_IF([test "x$PTHREAD_CXX" !=3D "x"], [CXX=3D"$PTHREAD_CXX"])
-         CFLAGS=3D"$CFLAGS $PTHREAD_CFLAGS"
--        save_LIBS=3D"$LIBS"
-         LIBS=3D"$PTHREAD_LIBS $LIBS"
--        AC_MSG_CHECKING([for pthread_join in LIBS=3D$PTHREAD_LIBS with CF=
LAGS=3D$PTHREAD_CFLAGS])
--        AC_TRY_LINK_FUNC(pthread_join, ax_pthread_ok=3Dyes)
--        AC_MSG_RESULT($ax_pthread_ok)
--        if test x"$ax_pthread_ok" =3D xno; then
-+        AC_MSG_CHECKING([for pthread_join using $CC $PTHREAD_CFLAGS $PTHR=
EAD_LIBS])
-+        AC_LINK_IFELSE([AC_LANG_CALL([], [pthread_join])], [ax_pthread_ok=
=3Dyes])
-+        AC_MSG_RESULT([$ax_pthread_ok])
-+        if test "x$ax_pthread_ok" =3D "xno"; then
-                 PTHREAD_LIBS=3D""
-                 PTHREAD_CFLAGS=3D""
-         fi
--        LIBS=3D"$save_LIBS"
--        CFLAGS=3D"$save_CFLAGS"
-+        CC=3D"$ax_pthread_save_CC"
-+        CFLAGS=3D"$ax_pthread_save_CFLAGS"
-+        LIBS=3D"$ax_pthread_save_LIBS"
- fi
-=20
- # We must check for the threads library under a number of different
-@@ -118,12 +129,14 @@ fi
- # (e.g. DEC) have both -lpthread and -lpthreads, where one of the
- # libraries is broken (non-POSIX).
-=20
--# Create a list of thread flags to try.  Items starting with a "-" are
--# C compiler flags, and other items are library names, except for "none"
--# which indicates that we try without any flags at all, and "pthread-conf=
ig"
--# which is a program returning the flags for the Pth emulation library.
-+# Create a list of thread flags to try. Items with a "," contain both
-+# C compiler flags (before ",") and linker flags (after ","). Other items
-+# starting with a "-" are C compiler flags, and remaining items are
-+# library names, except for "none" which indicates that we try without
-+# any flags at all, and "pthread-config" which is a program returning
-+# the flags for the Pth emulation library.
-=20
--ax_pthread_flags=3D"none pthreads -Kthread -kthread lthread -pthread -pth=
reads -mthreads pthread --thread-safe -mt pthread-config"
-+ax_pthread_flags=3D"pthreads none -Kthread -pthread -pthreads -mthreads p=
thread --thread-safe -mt pthread-config"
-=20
- # The ordering *is* (sometimes) important.  Some notes on the
- # individual items follow:
-@@ -132,68 +145,163 @@ ax_pthread_flags=3D"none pthreads -Kthread -kthread=
 lthread -pthread -pthreads -mt
- # none: in case threads are in libc; should be tried before -Kthread and
- #       other compiler flags to prevent continual compiler warnings
- # -Kthread: Sequent (threads in libc, but -Kthread needed for pthread.h)
--# -kthread: FreeBSD kernel threads (preferred to -pthread since SMP-able)
--# lthread: LinuxThreads port on FreeBSD (also preferred to -pthread)
--# -pthread: Linux/gcc (kernel threads), BSD/gcc (userland threads)
--# -pthreads: Solaris/gcc
--# -mthreads: Mingw32/gcc, Lynx/gcc
-+# -pthread: Linux/gcc (kernel threads), BSD/gcc (userland threads), Tru64
-+#           (Note: HP C rejects this with "bad form for `-t' option")
-+# -pthreads: Solaris/gcc (Note: HP C also rejects)
- # -mt: Sun Workshop C (may only link SunOS threads [-lthread], but it
--#      doesn't hurt to check since this sometimes defines pthreads too;
--#      also defines -D_REENTRANT)
--#      ... -mt is also the pthreads flag for HP/aCC
-+#      doesn't hurt to check since this sometimes defines pthreads and
-+#      -D_REENTRANT too), HP C (must be checked before -lpthread, which
-+#      is present but should not be used directly; and before -mthreads,
-+#      because the compiler interprets this as "-mt" + "-hreads")
-+# -mthreads: Mingw32/gcc, Lynx/gcc
- # pthread: Linux, etcetera
- # --thread-safe: KAI C++
- # pthread-config: use pthread-config program (for GNU Pth library)
-=20
--case "${host_cpu}-${host_os}" in
--        *solaris*)
-+case $host_os in
-+
-+        freebsd*)
-+
-+        # -kthread: FreeBSD kernel threads (preferred to -pthread since S=
MP-able)
-+        # lthread: LinuxThreads port on FreeBSD (also preferred to -pthre=
ad)
-+
-+        ax_pthread_flags=3D"-kthread lthread $ax_pthread_flags"
-+        ;;
-+
-+        hpux*)
-+
-+        # From the cc(1) man page: "[-mt] Sets various -D flags to enable
-+        # multi-threading and also sets -lpthread."
-+
-+        ax_pthread_flags=3D"-mt -pthread pthread $ax_pthread_flags"
-+        ;;
-+
-+        openedition*)
-+
-+        # IBM z/OS requires a feature-test macro to be defined in order t=
o
-+        # enable POSIX threads at all, so give the user a hint if this is
-+        # not set. (We don't define these ourselves, as they can affect
-+        # other portions of the system API in unpredictable ways.)
-+
-+        AC_EGREP_CPP([AX_PTHREAD_ZOS_MISSING],
-+            [
-+#            if !defined(_OPEN_THREADS) && !defined(_UNIX03_THREADS)
-+             AX_PTHREAD_ZOS_MISSING
-+#            endif
-+            ],
-+            [AC_MSG_WARN([IBM z/OS requires -D_OPEN_THREADS or -D_UNIX03_=
THREADS to enable pthreads support.])])
-+        ;;
-+
-+        solaris*)
-=20
-         # On Solaris (at least, for some versions), libc contains stubbed
-         # (non-functional) versions of the pthreads routines, so link-bas=
ed
--        # tests will erroneously succeed.  (We need to link with -pthread=
s/-mt/
--        # -lpthread.)  (The stubs are missing pthread_cleanup_push, or ra=
ther
--        # a function called by this macro, so we could check for that, bu=
t
--        # who knows whether they'll stub that too in a future libc.)  So,
--        # we'll just look for -pthreads and -lpthread first:
-+        # tests will erroneously succeed. (N.B.: The stubs are missing
-+        # pthread_cleanup_push, or rather a function called by this macro=
,
-+        # so we could check for that, but who knows whether they'll stub
-+        # that too in a future libc.)  So we'll check first for the
-+        # standard Solaris way of linking pthreads (-mt -lpthread).
-=20
--        ax_pthread_flags=3D"-pthreads pthread -mt -pthread $ax_pthread_fl=
ags"
-+        ax_pthread_flags=3D"-mt,-lpthread pthread $ax_pthread_flags"
-         ;;
-+esac
-=20
--        *-darwin*)
--        ax_pthread_flags=3D"none -pthread $ax_pthread_flags"
-+# Are we compiling with Clang?
-+
-+AC_CACHE_CHECK([whether $CC is Clang],
-+    [ax_cv_PTHREAD_CLANG],
-+    [ax_cv_PTHREAD_CLANG=3Dno
-+     # Note that Autoconf sets GCC=3Dyes for Clang as well as GCC
-+     if test "x$GCC" =3D "xyes"; then
-+        AC_EGREP_CPP([AX_PTHREAD_CC_IS_CLANG],
-+            [/* Note: Clang 2.7 lacks __clang_[a-z]+__ */
-+#            if defined(__clang__) && defined(__llvm__)
-+             AX_PTHREAD_CC_IS_CLANG
-+#            endif
-+            ],
-+            [ax_cv_PTHREAD_CLANG=3Dyes])
-+     fi
-+    ])
-+ax_pthread_clang=3D"$ax_cv_PTHREAD_CLANG"
-+
-+
-+# GCC generally uses -pthread, or -pthreads on some platforms (e.g. SPARC=
)
-+
-+# Note that for GCC and Clang -pthread generally implies -lpthread,
-+# except when -nostdlib is passed.
-+# This is problematic using libtool to build C++ shared libraries with pt=
hread:
-+# [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D25460
-+# [2] https://bugzilla.redhat.com/show_bug.cgi?id=3D661333
-+# [3] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D468555
-+# To solve this, first try -pthread together with -lpthread for GCC
-+
-+AS_IF([test "x$GCC" =3D "xyes"],
-+      [ax_pthread_flags=3D"-pthread,-lpthread -pthread -pthreads $ax_pthr=
ead_flags"])
-+
-+# Clang takes -pthread (never supported any other flag), but we'll try wi=
th -lpthread first
-+
-+AS_IF([test "x$ax_pthread_clang" =3D "xyes"],
-+      [ax_pthread_flags=3D"-pthread,-lpthread -pthread"])
-+
-+
-+# The presence of a feature test macro requesting re-entrant function
-+# definitions is, on some systems, a strong hint that pthreads support is
-+# correctly enabled
-+
-+case $host_os in
-+        darwin* | hpux* | linux* | osf* | solaris*)
-+        ax_pthread_check_macro=3D"_REENTRANT"
-+        ;;
-+
-+        aix*)
-+        ax_pthread_check_macro=3D"_THREAD_SAFE"
-+        ;;
-+
-+        *)
-+        ax_pthread_check_macro=3D"--"
-         ;;
- esac
-+AS_IF([test "x$ax_pthread_check_macro" =3D "x--"],
-+      [ax_pthread_check_cond=3D0],
-+      [ax_pthread_check_cond=3D"!defined($ax_pthread_check_macro)"])
-+
-=20
--if test x"$ax_pthread_ok" =3D xno; then
--for flag in $ax_pthread_flags; do
-+if test "x$ax_pthread_ok" =3D "xno"; then
-+for ax_pthread_try_flag in $ax_pthread_flags; do
-=20
--        case $flag in
-+        case $ax_pthread_try_flag in
-                 none)
-                 AC_MSG_CHECKING([whether pthreads work without any flags]=
)
-                 ;;
-=20
-+                *,*)
-+                PTHREAD_CFLAGS=3D`echo $ax_pthread_try_flag | sed "s/^\(.=
*\),\(.*\)$/\1/"`
-+                PTHREAD_LIBS=3D`echo $ax_pthread_try_flag | sed "s/^\(.*\=
),\(.*\)$/\2/"`
-+                AC_MSG_CHECKING([whether pthreads work with "$PTHREAD_CFL=
AGS" and "$PTHREAD_LIBS"])
-+                ;;
-+
-                 -*)
--                AC_MSG_CHECKING([whether pthreads work with $flag])
--                PTHREAD_CFLAGS=3D"$flag"
-+                AC_MSG_CHECKING([whether pthreads work with $ax_pthread_t=
ry_flag])
-+                PTHREAD_CFLAGS=3D"$ax_pthread_try_flag"
-                 ;;
-=20
-                 pthread-config)
--                AC_CHECK_PROG(ax_pthread_config, pthread-config, yes, no)
--                if test x"$ax_pthread_config" =3D xno; then continue; fi
-+                AC_CHECK_PROG([ax_pthread_config], [pthread-config], [yes=
], [no])
-+                AS_IF([test "x$ax_pthread_config" =3D "xno"], [continue])
-                 PTHREAD_CFLAGS=3D"`pthread-config --cflags`"
-                 PTHREAD_LIBS=3D"`pthread-config --ldflags` `pthread-confi=
g --libs`"
-                 ;;
-=20
-                 *)
--                AC_MSG_CHECKING([for the pthreads library -l$flag])
--                PTHREAD_LIBS=3D"-l$flag"
-+                AC_MSG_CHECKING([for the pthreads library -l$ax_pthread_t=
ry_flag])
-+                PTHREAD_LIBS=3D"-l$ax_pthread_try_flag"
-                 ;;
-         esac
-=20
--        save_LIBS=3D"$LIBS"
--        save_CFLAGS=3D"$CFLAGS"
--        LIBS=3D"$PTHREAD_LIBS $LIBS"
-+        ax_pthread_save_CFLAGS=3D"$CFLAGS"
-+        ax_pthread_save_LIBS=3D"$LIBS"
-         CFLAGS=3D"$CFLAGS $PTHREAD_CFLAGS"
-+        LIBS=3D"$PTHREAD_LIBS $LIBS"
-=20
-         # Check for various functions.  We must include pthread.h,
-         # since some functions may be macros.  (On the Sequent, we
-@@ -204,8 +312,18 @@ for flag in $ax_pthread_flags; do
-         # pthread_cleanup_push because it is one of the few pthread
-         # functions on Solaris that doesn't have a non-functional libc st=
ub.
-         # We try pthread_create on general principles.
-+
-         AC_LINK_IFELSE([AC_LANG_PROGRAM([#include <pthread.h>
--                        static void routine(void *a) { a =3D 0; }
-+#                       if $ax_pthread_check_cond
-+#                        error "$ax_pthread_check_macro must be defined"
-+#                       endif
-+                        static void *some_global =3D NULL;
-+                        static void routine(void *a)
-+                          {
-+                             /* To avoid any unused-parameter or
-+                                unused-but-set-parameter warning.  */
-+                             some_global =3D a;
-+                          }
-                         static void *start_routine(void *a) { return a; }=
],
-                        [pthread_t th; pthread_attr_t attr;
-                         pthread_create(&th, 0, start_routine, 0);
-@@ -213,93 +331,188 @@ for flag in $ax_pthread_flags; do
-                         pthread_attr_init(&attr);
-                         pthread_cleanup_push(routine, 0);
-                         pthread_cleanup_pop(0) /* ; */])],
--                [ax_pthread_ok=3Dyes],
--                [])
-+            [ax_pthread_ok=3Dyes],
-+            [])
-=20
--        LIBS=3D"$save_LIBS"
--        CFLAGS=3D"$save_CFLAGS"
-+        CFLAGS=3D"$ax_pthread_save_CFLAGS"
-+        LIBS=3D"$ax_pthread_save_LIBS"
-=20
--        AC_MSG_RESULT($ax_pthread_ok)
--        if test "x$ax_pthread_ok" =3D xyes; then
--                break;
--        fi
-+        AC_MSG_RESULT([$ax_pthread_ok])
-+        AS_IF([test "x$ax_pthread_ok" =3D "xyes"], [break])
-=20
-         PTHREAD_LIBS=3D""
-         PTHREAD_CFLAGS=3D""
- done
- fi
-=20
-+
-+# Clang needs special handling, because older versions handle the -pthrea=
d
-+# option in a rather... idiosyncratic way
-+
-+if test "x$ax_pthread_clang" =3D "xyes"; then
-+
-+        # Clang takes -pthread; it has never supported any other flag
-+
-+        # (Note 1: This will need to be revisited if a system that Clang
-+        # supports has POSIX threads in a separate library.  This tends n=
ot
-+        # to be the way of modern systems, but it's conceivable.)
-+
-+        # (Note 2: On some systems, notably Darwin, -pthread is not neede=
d
-+        # to get POSIX threads support; the API is always present and
-+        # active.  We could reasonably leave PTHREAD_CFLAGS empty.  But
-+        # -pthread does define _REENTRANT, and while the Darwin headers
-+        # ignore this macro, third-party headers might not.)
-+
-+        # However, older versions of Clang make a point of warning the us=
er
-+        # that, in an invocation where only linking and no compilation is
-+        # taking place, the -pthread option has no effect ("argument unus=
ed
-+        # during compilation").  They expect -pthread to be passed in onl=
y
-+        # when source code is being compiled.
-+        #
-+        # Problem is, this is at odds with the way Automake and most othe=
r
-+        # C build frameworks function, which is that the same flags used =
in
-+        # compilation (CFLAGS) are also used in linking.  Many systems
-+        # supported by AX_PTHREAD require exactly this for POSIX threads
-+        # support, and in fact it is often not straightforward to specify=
 a
-+        # flag that is used only in the compilation phase and not in
-+        # linking.  Such a scenario is extremely rare in practice.
-+        #
-+        # Even though use of the -pthread flag in linking would only prin=
t
-+        # a warning, this can be a nuisance for well-run software project=
s
-+        # that build with -Werror.  So if the active version of Clang has
-+        # this misfeature, we search for an option to squash it.
-+
-+        AC_CACHE_CHECK([whether Clang needs flag to prevent "argument unu=
sed" warning when linking with -pthread],
-+            [ax_cv_PTHREAD_CLANG_NO_WARN_FLAG],
-+            [ax_cv_PTHREAD_CLANG_NO_WARN_FLAG=3Dunknown
-+             # Create an alternate version of $ac_link that compiles and
-+             # links in two steps (.c -> .o, .o -> exe) instead of one
-+             # (.c -> exe), because the warning occurs only in the second
-+             # step
-+             ax_pthread_save_ac_link=3D"$ac_link"
-+             ax_pthread_sed=3D's/conftest\.\$ac_ext/conftest.$ac_objext/g=
'
-+             ax_pthread_link_step=3D`AS_ECHO(["$ac_link"]) | sed "$ax_pth=
read_sed"`
-+             ax_pthread_2step_ac_link=3D"($ac_compile) && (echo =3D=3D=3D=
=3D >&5) && ($ax_pthread_link_step)"
-+             ax_pthread_save_CFLAGS=3D"$CFLAGS"
-+             for ax_pthread_try in '' -Qunused-arguments -Wno-unused-comm=
and-line-argument unknown; do
-+                AS_IF([test "x$ax_pthread_try" =3D "xunknown"], [break])
-+                CFLAGS=3D"-Werror -Wunknown-warning-option $ax_pthread_tr=
y -pthread $ax_pthread_save_CFLAGS"
-+                ac_link=3D"$ax_pthread_save_ac_link"
-+                AC_LINK_IFELSE([AC_LANG_SOURCE([[int main(void){return 0;=
}]])],
-+                    [ac_link=3D"$ax_pthread_2step_ac_link"
-+                     AC_LINK_IFELSE([AC_LANG_SOURCE([[int main(void){retu=
rn 0;}]])],
-+                         [break])
-+                    ])
-+             done
-+             ac_link=3D"$ax_pthread_save_ac_link"
-+             CFLAGS=3D"$ax_pthread_save_CFLAGS"
-+             AS_IF([test "x$ax_pthread_try" =3D "x"], [ax_pthread_try=3Dn=
o])
-+             ax_cv_PTHREAD_CLANG_NO_WARN_FLAG=3D"$ax_pthread_try"
-+            ])
-+
-+        case "$ax_cv_PTHREAD_CLANG_NO_WARN_FLAG" in
-+                no | unknown) ;;
-+                *) PTHREAD_CFLAGS=3D"$ax_cv_PTHREAD_CLANG_NO_WARN_FLAG $P=
THREAD_CFLAGS" ;;
-+        esac
-+
-+fi # $ax_pthread_clang =3D yes
-+
-+
-+
- # Various other checks:
--if test "x$ax_pthread_ok" =3D xyes; then
--        save_LIBS=3D"$LIBS"
--        LIBS=3D"$PTHREAD_LIBS $LIBS"
--        save_CFLAGS=3D"$CFLAGS"
-+if test "x$ax_pthread_ok" =3D "xyes"; then
-+        ax_pthread_save_CFLAGS=3D"$CFLAGS"
-+        ax_pthread_save_LIBS=3D"$LIBS"
-         CFLAGS=3D"$CFLAGS $PTHREAD_CFLAGS"
-+        LIBS=3D"$PTHREAD_LIBS $LIBS"
-=20
-         # Detect AIX lossage: JOINABLE attribute is called UNDETACHED.
--        AC_MSG_CHECKING([for joinable pthread attribute])
--        attr_name=3Dunknown
--        for attr in PTHREAD_CREATE_JOINABLE PTHREAD_CREATE_UNDETACHED; do
--            AC_LINK_IFELSE([AC_LANG_PROGRAM([#include <pthread.h>],
--                           [int attr =3D $attr; return attr /* ; */])],
--                [attr_name=3D$attr; break],
--                [])
--        done
--        AC_MSG_RESULT($attr_name)
--        if test "$attr_name" !=3D PTHREAD_CREATE_JOINABLE; then
--            AC_DEFINE_UNQUOTED(PTHREAD_CREATE_JOINABLE, $attr_name,
--                               [Define to necessary symbol if this consta=
nt
--                                uses a non-standard name on your system.]=
)
--        fi
-+        AC_CACHE_CHECK([for joinable pthread attribute],
-+            [ax_cv_PTHREAD_JOINABLE_ATTR],
-+            [ax_cv_PTHREAD_JOINABLE_ATTR=3Dunknown
-+             for ax_pthread_attr in PTHREAD_CREATE_JOINABLE PTHREAD_CREAT=
E_UNDETACHED; do
-+                 AC_LINK_IFELSE([AC_LANG_PROGRAM([#include <pthread.h>],
-+                                                 [int attr =3D $ax_pthrea=
d_attr; return attr /* ; */])],
-+                                [ax_cv_PTHREAD_JOINABLE_ATTR=3D$ax_pthrea=
d_attr; break],
-+                                [])
-+             done
-+            ])
-+        AS_IF([test "x$ax_cv_PTHREAD_JOINABLE_ATTR" !=3D "xunknown" && \
-+               test "x$ax_cv_PTHREAD_JOINABLE_ATTR" !=3D "xPTHREAD_CREATE=
_JOINABLE" && \
-+               test "x$ax_pthread_joinable_attr_defined" !=3D "xyes"],
-+              [AC_DEFINE_UNQUOTED([PTHREAD_CREATE_JOINABLE],
-+                                  [$ax_cv_PTHREAD_JOINABLE_ATTR],
-+                                  [Define to necessary symbol if this con=
stant
-+                                   uses a non-standard name on your syste=
m.])
-+               ax_pthread_joinable_attr_defined=3Dyes
-+              ])
-=20
--        AC_MSG_CHECKING([if more special flags are required for pthreads]=
)
--        flag=3Dno
--        case "${host_cpu}-${host_os}" in
--            *-aix* | *-freebsd* | *-darwin*) flag=3D"-D_THREAD_SAFE";;
--            *-osf* | *-hpux*) flag=3D"-D_REENTRANT";;
--            *solaris*)
--            if test "$GCC" =3D "yes"; then
--                flag=3D"-D_REENTRANT"
--            else
--                flag=3D"-mt -D_REENTRANT"
--            fi
--            ;;
--        esac
--        AC_MSG_RESULT(${flag})
--        if test "x$flag" !=3D xno; then
--            PTHREAD_CFLAGS=3D"$flag $PTHREAD_CFLAGS"
--        fi
-+        AC_CACHE_CHECK([whether more special flags are required for pthre=
ads],
-+            [ax_cv_PTHREAD_SPECIAL_FLAGS],
-+            [ax_cv_PTHREAD_SPECIAL_FLAGS=3Dno
-+             case $host_os in
-+             solaris*)
-+             ax_cv_PTHREAD_SPECIAL_FLAGS=3D"-D_POSIX_PTHREAD_SEMANTICS"
-+             ;;
-+             esac
-+            ])
-+        AS_IF([test "x$ax_cv_PTHREAD_SPECIAL_FLAGS" !=3D "xno" && \
-+               test "x$ax_pthread_special_flags_added" !=3D "xyes"],
-+              [PTHREAD_CFLAGS=3D"$ax_cv_PTHREAD_SPECIAL_FLAGS $PTHREAD_CF=
LAGS"
-+               ax_pthread_special_flags_added=3Dyes])
-=20
-         AC_CACHE_CHECK([for PTHREAD_PRIO_INHERIT],
--            ax_cv_PTHREAD_PRIO_INHERIT, [
--                AC_LINK_IFELSE([
--                    AC_LANG_PROGRAM([[#include <pthread.h>]], [[int i =3D=
 PTHREAD_PRIO_INHERIT;]])],
--                    [ax_cv_PTHREAD_PRIO_INHERIT=3Dyes],
--                    [ax_cv_PTHREAD_PRIO_INHERIT=3Dno])
-+            [ax_cv_PTHREAD_PRIO_INHERIT],
-+            [AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <pthread.h>]],
-+                                             [[int i =3D PTHREAD_PRIO_INH=
ERIT;
-+                                               return i;]])],
-+                            [ax_cv_PTHREAD_PRIO_INHERIT=3Dyes],
-+                            [ax_cv_PTHREAD_PRIO_INHERIT=3Dno])
-             ])
--        AS_IF([test "x$ax_cv_PTHREAD_PRIO_INHERIT" =3D "xyes"],
--            AC_DEFINE([HAVE_PTHREAD_PRIO_INHERIT], 1, [Have PTHREAD_PRIO_=
INHERIT.]))
-+        AS_IF([test "x$ax_cv_PTHREAD_PRIO_INHERIT" =3D "xyes" && \
-+               test "x$ax_pthread_prio_inherit_defined" !=3D "xyes"],
-+              [AC_DEFINE([HAVE_PTHREAD_PRIO_INHERIT], [1], [Have PTHREAD_=
PRIO_INHERIT.])
-+               ax_pthread_prio_inherit_defined=3Dyes
-+              ])
-=20
--        LIBS=3D"$save_LIBS"
--        CFLAGS=3D"$save_CFLAGS"
-+        CFLAGS=3D"$ax_pthread_save_CFLAGS"
-+        LIBS=3D"$ax_pthread_save_LIBS"
-=20
--        # More AIX lossage: must compile with xlc_r or cc_r
--        if test x"$GCC" !=3D xyes; then
--          AC_CHECK_PROGS(PTHREAD_CC, xlc_r cc_r, ${CC})
--        else
--          PTHREAD_CC=3D$CC
-+        # More AIX lossage: compile with *_r variant
-+        if test "x$GCC" !=3D "xyes"; then
-+            case $host_os in
-+                aix*)
-+                AS_CASE(["x/$CC"],
-+                    [x*/c89|x*/c89_128|x*/c99|x*/c99_128|x*/cc|x*/cc128|x=
*/xlc|x*/xlc_v6|x*/xlc128|x*/xlc128_v6],
-+                    [#handle absolute path differently from PATH based pr=
ogram lookup
-+                     AS_CASE(["x$CC"],
-+                         [x/*],
-+                         [
-+			   AS_IF([AS_EXECUTABLE_P([${CC}_r])],[PTHREAD_CC=3D"${CC}_r"])
-+			   AS_IF([test "x${CXX}" !=3D "x"], [AS_IF([AS_EXECUTABLE_P([${CXX}_r]=
)],[PTHREAD_CXX=3D"${CXX}_r"])])
-+			 ],
-+                         [
-+			   AC_CHECK_PROGS([PTHREAD_CC],[${CC}_r],[$CC])
-+			   AS_IF([test "x${CXX}" !=3D "x"], [AC_CHECK_PROGS([PTHREAD_CXX],[${C=
XX}_r],[$CXX])])
-+			 ]
-+                     )
-+                    ])
-+                ;;
-+            esac
-         fi
--else
--        PTHREAD_CC=3D"$CC"
- fi
-=20
--AC_SUBST(PTHREAD_LIBS)
--AC_SUBST(PTHREAD_CFLAGS)
--AC_SUBST(PTHREAD_CC)
-+test -n "$PTHREAD_CC" || PTHREAD_CC=3D"$CC"
-+test -n "$PTHREAD_CXX" || PTHREAD_CXX=3D"$CXX"
-+
-+AC_SUBST([PTHREAD_LIBS])
-+AC_SUBST([PTHREAD_CFLAGS])
-+AC_SUBST([PTHREAD_CC])
-+AC_SUBST([PTHREAD_CXX])
-=20
- # Finally, execute ACTION-IF-FOUND/ACTION-IF-NOT-FOUND:
--if test x"$ax_pthread_ok" =3D xyes; then
--        ifelse([$1],,AC_DEFINE(HAVE_PTHREAD,1,[Define if you have POSIX t=
hreads libraries and header files.]),[$1])
-+if test "x$ax_pthread_ok" =3D "xyes"; then
-+        ifelse([$1],,[AC_DEFINE([HAVE_PTHREAD],[1],[Define if you have PO=
SIX threads libraries and header files.])],[$1])
-         :
- else
-         ax_pthread_ok=3Dno
-diff --git a/scripts/checks.m4 b/scripts/checks.m4
-index 915a5011..b9095cee 100644
---- a/scripts/checks.m4
-+++ b/scripts/checks.m4
-@@ -21,7 +21,7 @@ AC_DEFUN([TORRENT_CHECK_XFS], [
-=20
- AC_DEFUN([TORRENT_WITHOUT_XFS], [
-   AC_ARG_WITH(xfs,
--    AC_HELP_STRING([--without-xfs], [do not check for XFS filesystem supp=
ort]),
-+    AS_HELP_STRING([--without-xfs],[do not check for XFS filesystem suppo=
rt]),
-     [
-        if test "$withval" =3D "yes"; then
-         TORRENT_CHECK_XFS
-@@ -34,7 +34,7 @@ AC_DEFUN([TORRENT_WITHOUT_XFS], [
-=20
- AC_DEFUN([TORRENT_WITH_XFS], [
-   AC_ARG_WITH(xfs,
--    AC_HELP_STRING([--with-xfs], [check for XFS filesystem support]),
-+    AS_HELP_STRING([--with-xfs],[check for XFS filesystem support]),
-     [
-       if test "$withval" =3D "yes"; then
-         TORRENT_CHECK_XFS
-@@ -63,7 +63,7 @@ AC_DEFUN([TORRENT_CHECK_EPOLL], [
-=20
- AC_DEFUN([TORRENT_WITHOUT_EPOLL], [
-   AC_ARG_WITH(epoll,
--    AC_HELP_STRING([--without-epoll], [do not check for epoll support]),
-+    AS_HELP_STRING([--without-epoll],[do not check for epoll support]),
-     [
-       if test "$withval" =3D "yes"; then
-         TORRENT_CHECK_EPOLL
-@@ -134,7 +134,7 @@ AC_DEFUN([TORRENT_CHECK_KQUEUE_SOCKET_ONLY], [
-=20
- AC_DEFUN([TORRENT_WITH_KQUEUE], [
-   AC_ARG_WITH(kqueue,
--    AC_HELP_STRING([--with-kqueue], [enable kqueue [[default=3Dno]]]),
-+    AS_HELP_STRING([--with-kqueue],[enable kqueue [[default=3Dno]]]),
-     [
-         if test "$withval" =3D "yes"; then
-           TORRENT_CHECK_KQUEUE
-@@ -145,7 +145,7 @@ AC_DEFUN([TORRENT_WITH_KQUEUE], [
-=20
- AC_DEFUN([TORRENT_WITHOUT_KQUEUE], [
-   AC_ARG_WITH(kqueue,
--    AC_HELP_STRING([--without-kqueue], [do not check for kqueue support])=
,
-+    AS_HELP_STRING([--without-kqueue],[do not check for kqueue support]),
-     [
-       if test "$withval" =3D "yes"; then
-         TORRENT_CHECK_KQUEUE
-@@ -158,7 +158,7 @@ AC_DEFUN([TORRENT_WITHOUT_KQUEUE], [
-=20
- AC_DEFUN([TORRENT_WITHOUT_VARIABLE_FDSET], [
-   AC_ARG_WITH(variable-fdset,
--    AC_HELP_STRING([--without-variable-fdset], [do not use non-portable v=
ariable sized fd_set's]),
-+    AS_HELP_STRING([--without-variable-fdset],[do not use non-portable va=
riable sized fd_set's]),
-     [
-       if test "$withval" =3D "yes"; then
-         AC_DEFINE(USE_VARIABLE_FDSET, 1, defined when we allow the use of=
 fd_set's of any size)
-@@ -172,14 +172,13 @@ AC_DEFUN([TORRENT_WITHOUT_VARIABLE_FDSET], [
- AC_DEFUN([TORRENT_CHECK_FALLOCATE], [
-   AC_MSG_CHECKING(for fallocate)
-=20
--  AC_TRY_LINK([#define _GNU_SOURCE
-+  AC_LINK_IFELSE([AC_LANG_PROGRAM([[#define _GNU_SOURCE
-                #include <fcntl.h>
--              ],[ fallocate(0, FALLOC_FL_KEEP_SIZE, 0, 0); return 0;
--              ],
--    [
-+              ]], [[ fallocate(0, FALLOC_FL_KEEP_SIZE, 0, 0); return 0;
-+              ]])],[
-       AC_DEFINE(HAVE_FALLOCATE, 1, Linux's fallocate supported.)
-       AC_MSG_RESULT(yes)
--    ], [
-+    ],[
-       AC_MSG_RESULT(no)
-     ])
- ])
-@@ -188,13 +187,12 @@ AC_DEFUN([TORRENT_CHECK_FALLOCATE], [
- AC_DEFUN([TORRENT_CHECK_POSIX_FALLOCATE], [
-   AC_MSG_CHECKING(for posix_fallocate)
-=20
--  AC_TRY_LINK([#include <fcntl.h>
--              ],[ posix_fallocate(0, 0, 0);
--              ],
--    [
-+  AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <fcntl.h>
-+              ]], [[ posix_fallocate(0, 0, 0);
-+              ]])],[
-       AC_DEFINE(USE_POSIX_FALLOCATE, 1, posix_fallocate supported.)
-       AC_MSG_RESULT(yes)
--    ], [
-+    ],[
-       AC_MSG_RESULT(no)
-     ])
- ])
-@@ -202,7 +200,7 @@ AC_DEFUN([TORRENT_CHECK_POSIX_FALLOCATE], [
-=20
- AC_DEFUN([TORRENT_WITH_POSIX_FALLOCATE], [
-   AC_ARG_WITH(posix-fallocate,
--    AC_HELP_STRING([--with-posix-fallocate], [check for and use posix_fal=
locate to allocate files]),
-+    AS_HELP_STRING([--with-posix-fallocate],[check for and use posix_fall=
ocate to allocate files]),
-     [
-       if test "$withval" =3D "yes"; then
-         TORRENT_CHECK_POSIX_FALLOCATE
-@@ -215,8 +213,7 @@ AC_DEFUN([TORRENT_CHECK_STATVFS], [
-=20
-   AC_MSG_CHECKING(for statvfs)
-=20
--  AC_TRY_LINK(
--    [
-+  AC_LINK_IFELSE([AC_LANG_PROGRAM([[
-       #if HAVE_SYS_VFS_H
-       #include <sys/vfs.h>
-       #endif
-@@ -226,12 +223,11 @@ AC_DEFUN([TORRENT_CHECK_STATVFS], [
-       #if HAVE_SYS_STATFS_H
-       #include <sys/statfs.h>
-       #endif
--    ],[
-+    ]], [[
-       struct statvfs s; fsblkcnt_t c;
-       statvfs("", &s);
-       fstatvfs(0, &s);
--    ],
--    [
-+    ]])],[
-       AC_DEFINE(FS_STAT_FD, [fstatvfs(fd, &m_stat) =3D=3D 0], Function to=
 determine filesystem stats from fd)
-       AC_DEFINE(FS_STAT_FN, [statvfs(fn, &m_stat) =3D=3D 0], Function to =
determine filesystem stats from filename)
-       AC_DEFINE(FS_STAT_STRUCT, [struct statvfs], Type of second argument=
 to statfs function)
-@@ -240,8 +236,7 @@ AC_DEFUN([TORRENT_CHECK_STATVFS], [
-       AC_DEFINE(FS_STAT_BLOCK_SIZE, [(m_stat.f_frsize)], Determine the bl=
ock size)
-       AC_MSG_RESULT(ok)
-       have_stat_vfs=3Dyes
--    ],
--    [
-+    ],[
-       AC_MSG_RESULT(no)
-       have_stat_vfs=3Dno
-     ])
-@@ -252,8 +247,7 @@ AC_DEFUN([TORRENT_CHECK_STATFS], [
-=20
-   AC_MSG_CHECKING(for statfs)
-=20
--  AC_TRY_LINK(
--    [
-+  AC_LINK_IFELSE([AC_LANG_PROGRAM([[
-       #if HAVE_SYS_STATFS_H
-       #include <sys/statfs.h>
-       #endif
-@@ -263,12 +257,11 @@ AC_DEFUN([TORRENT_CHECK_STATFS], [
-       #if HAVE_SYS_MOUNT_H
-       #include <sys/mount.h>
-       #endif
--    ],[
-+    ]], [[
-       struct statfs s;
-       statfs("", &s);
-       fstatfs(0, &s);
--    ],
--    [
-+    ]])],[
-       AC_DEFINE(FS_STAT_FD, [fstatfs(fd, &m_stat) =3D=3D 0], Function to =
determine filesystem stats from fd)
-       AC_DEFINE(FS_STAT_FN, [statfs(fn, &m_stat) =3D=3D 0], Function to d=
etermine filesystem stats from filename)
-       AC_DEFINE(FS_STAT_STRUCT, [struct statfs], Type of second argument =
to statfs function)
-@@ -277,8 +270,7 @@ AC_DEFUN([TORRENT_CHECK_STATFS], [
-       AC_DEFINE(FS_STAT_BLOCK_SIZE, [(m_stat.f_bsize)], Determine the blo=
ck size)
-       AC_MSG_RESULT(ok)
-       have_stat_vfs=3Dyes
--    ],
--    [
-+    ],[
-       AC_MSG_RESULT(no)
-       have_stat_vfs=3Dno
-     ])
-@@ -296,7 +288,7 @@ AC_DEFUN([TORRENT_DISABLED_STATFS], [
-=20
- AC_DEFUN([TORRENT_WITHOUT_STATVFS], [
-   AC_ARG_WITH(statvfs,
--    AC_HELP_STRING([--without-statvfs], [don't try to use statvfs to find=
 free diskspace]),
-+    AS_HELP_STRING([--without-statvfs],[don't try to use statvfs to find =
free diskspace]),
-     [
-       if test "$withval" =3D "yes"; then
-         TORRENT_CHECK_STATVFS
-@@ -311,7 +303,7 @@ AC_DEFUN([TORRENT_WITHOUT_STATVFS], [
-=20
- AC_DEFUN([TORRENT_WITHOUT_STATFS], [
-   AC_ARG_WITH(statfs,
--    AC_HELP_STRING([--without-statfs], [don't try to use statfs to find f=
ree diskspace]),
-+    AS_HELP_STRING([--without-statfs],[don't try to use statfs to find fr=
ee diskspace]),
-     [
-       if test "$have_stat_vfs" =3D "no"; then
-         if test "$withval" =3D "yes"; then
-@@ -333,7 +325,7 @@ AC_DEFUN([TORRENT_WITHOUT_STATFS], [
-=20
- AC_DEFUN([TORRENT_WITH_ADDRESS_SPACE], [
-   AC_ARG_WITH(address-space,
--    AC_HELP_STRING([--with-address-space=3DMB], [change the default addre=
ss space size [[default=3D1024mb]]]),
-+    AS_HELP_STRING([--with-address-space=3DMB],[change the default addres=
s space size [[default=3D1024mb]]]),
-     [
-       if test ! -z $withval -a "$withval" !=3D "yes" -a "$withval" !=3D "=
no"; then
-         AC_DEFINE_UNQUOTED(DEFAULT_ADDRESS_SPACE_SIZE, [$withval])
-@@ -354,7 +346,7 @@ AC_DEFUN([TORRENT_WITH_ADDRESS_SPACE], [
-=20
- AC_DEFUN([TORRENT_WITH_FASTCGI], [
-   AC_ARG_WITH(fastcgi,
--    AC_HELP_STRING([--with-fastcgi=3DPATH], [enable FastCGI RPC support (=
DO NOT USE)]),
-+    AS_HELP_STRING([--with-fastcgi=3DPATH],[enable FastCGI RPC support (D=
O NOT USE)]),
-     [
-       AC_MSG_CHECKING([for FastCGI (DO NOT USE)])
-=20
-@@ -365,13 +357,10 @@ AC_DEFUN([TORRENT_WITH_FASTCGI], [
-         CXXFLAGS=3D"$CXXFLAGS"
- 	LIBS=3D"$LIBS -lfcgi"       =20
-=20
--        AC_TRY_LINK(
--        [ #include <fcgiapp.h>
--        ],[ FCGX_Init(); ],
--        [
-+        AC_LINK_IFELSE([AC_LANG_PROGRAM([[ #include <fcgiapp.h>
-+        ]], [[ FCGX_Init(); ]])],[
-           AC_MSG_RESULT(ok)
--        ],
--        [
-+        ],[
-           AC_MSG_RESULT(not found)
-           AC_MSG_ERROR(Could not compile FastCGI test.)
-         ])
-@@ -382,13 +371,10 @@ AC_DEFUN([TORRENT_WITH_FASTCGI], [
-         CXXFLAGS=3D"$CXXFLAGS -I$withval/include"
- 	LIBS=3D"$LIBS -lfcgi -L$withval/lib"
-=20
--        AC_TRY_LINK(
--        [ #include <fcgiapp.h>
--        ],[ FCGX_Init(); ],
--        [
-+        AC_LINK_IFELSE([AC_LANG_PROGRAM([[ #include <fcgiapp.h>
-+        ]], [[ FCGX_Init(); ]])],[
-           AC_MSG_RESULT(ok)
--        ],
--        [
-+        ],[
-           AC_MSG_RESULT(not found)
-           AC_MSG_ERROR(Could not compile FastCGI test.)
-         ])
-@@ -403,7 +389,7 @@ AC_DEFUN([TORRENT_WITH_XMLRPC_C], [
-   AC_MSG_CHECKING(for XMLRPC-C)
-=20
-   AC_ARG_WITH(xmlrpc-c,
--    AC_HELP_STRING([--with-xmlrpc-c=3DPATH], [enable XMLRPC-C support]),
-+    AS_HELP_STRING([--with-xmlrpc-c=3DPATH],[enable XMLRPC-C support]),
-   [
-     if test "$withval" =3D "no"; then
-       AC_MSG_RESULT(no)
-@@ -419,12 +405,10 @@ AC_DEFUN([TORRENT_WITH_XMLRPC_C], [
-         CXXFLAGS=3D"$CXXFLAGS `$xmlrpc_cc_prg --cflags server-util`"
-         LIBS=3D"$LIBS `$xmlrpc_cc_prg server-util --libs`"
-=20
--        AC_TRY_LINK(
--        [ #include <xmlrpc-c/server.h>
--        ],[ xmlrpc_registry_new(NULL); ],
--        [
-+        AC_LINK_IFELSE([AC_LANG_PROGRAM([[ #include <xmlrpc-c/server.h>
-+        ]], [[ xmlrpc_registry_new(NULL); ]])],[
-           AC_MSG_RESULT(ok)
--        ], [
-+        ],[
-           AC_MSG_RESULT(failed)
-           AC_MSG_ERROR(Could not compile XMLRPC-C test.)
-         ])
-@@ -466,23 +450,23 @@ AC_DEFUN([TORRENT_CHECK_PTHREAD_SETNAME_NP], [
-=20
-   AC_MSG_CHECKING(for pthread_setname_np type)
-=20
--  AC_TRY_LINK([
-+  AC_LINK_IFELSE([AC_LANG_PROGRAM([[
-     #include <pthread.h>
-     #include <sys/types.h>
--  ],[
-+  ]], [[
-     pthread_t t;
-     pthread_setname_np(t, "foo");
--  ],[
-+  ]])],[
-     AC_DEFINE(HAS_PTHREAD_SETNAME_NP_GENERIC, 1, The function to set pthr=
ead name has a pthread_t argumet.)
-     AC_MSG_RESULT(generic)
-   ],[
--    AC_TRY_LINK([
-+    AC_LINK_IFELSE([AC_LANG_PROGRAM([[
-       #include <pthread.h>
-       #include <sys/types.h>
--    ],[
-+    ]],[[
-       pthread_t t;
-       pthread_setname_np("foo");
--    ],[
-+    ]])],[
-       AC_DEFINE(HAS_PTHREAD_SETNAME_NP_DARWIN, 1, The function to set pth=
read name has no pthread argument.)
-       AC_MSG_RESULT(darwin)
-     ],[
-@@ -495,7 +479,7 @@ AC_DEFUN([TORRENT_DISABLE_PTHREAD_SETNAME_NP], [
-   AC_MSG_CHECKING([for pthread_setname_no])
-=20
-   AC_ARG_ENABLE(pthread-setname-np,
--    AC_HELP_STRING([--disable-pthread-setname-np], [disable pthread_setna=
me_np]),
-+    AS_HELP_STRING([--disable-pthread-setname-np],[disable pthread_setnam=
e_np]),
-     [
-       if test "$enableval" =3D "no"; then
-         AC_MSG_RESULT(disabled)
-diff --git a/scripts/common.m4 b/scripts/common.m4
-index 55e8d66e..2f54402e 100644
---- a/scripts/common.m4
-+++ b/scripts/common.m4
-@@ -1,6 +1,7 @@
- AC_DEFUN([TORRENT_WITH_SYSROOT], [
-   AC_ARG_WITH(sysroot,
--    AC_HELP_STRING([--with-sysroot=3DPATH], [compile and link with a spec=
ific sysroot]),
-+    AS_HELP_STRING([--with-sysroot=3DPATH],
-+      [compile and link with a specific sysroot]),
-     [
-       AC_MSG_CHECKING(for sysroot)
-=20
-@@ -22,7 +23,8 @@ AC_DEFUN([TORRENT_WITH_SYSROOT], [
-=20
- AC_DEFUN([TORRENT_ENABLE_ARCH], [
-   AC_ARG_ENABLE(arch,
--    AC_HELP_STRING([--enable-arch=3DARCH], [comma seprated list of archit=
ectures to compile for]),
-+    AS_HELP_STRING([--enable-arch=3DARCH],
-+      [comma seprated list of architectures to compile for]),
-     [
-       AC_MSG_CHECKING(for target architectures)
-=20
-@@ -82,7 +84,8 @@ AC_DEFUN([TORRENT_MINCORE_SIGNEDNESS], [
-=20
- AC_DEFUN([TORRENT_MINCORE], [
-   AC_ARG_ENABLE(mincore,
--    AC_HELP_STRING([--disable-mincore], [disable mincore check [[default=
=3Denable]]]),
-+    AS_HELP_STRING([--disable-mincore],
-+      [disable mincore check [[default=3Denable]]]),
-     [
-       if test "$enableval" =3D "yes"; then
-         TORRENT_MINCORE_SIGNEDNESS()
-@@ -174,7 +177,8 @@ AC_DEFUN([TORRENT_CHECK_ALIGNED], [
-=20
- AC_DEFUN([TORRENT_ENABLE_ALIGNED], [
-   AC_ARG_ENABLE(aligned,
--    AC_HELP_STRING([--enable-aligned], [enable alignment safe code [[defa=
ult=3Dcheck]]]),
-+    AS_HELP_STRING([--enable-aligned],
-+      [enable alignment safe code [[default=3Dcheck]]]),
-     [
-         if test "$enableval" =3D "yes"; then
-           AC_DEFINE(USE_ALIGNED, 1, Require byte alignment)
-@@ -189,7 +193,8 @@ AC_DEFUN([TORRENT_DISABLE_INSTRUMENTATION], [
-   AC_MSG_CHECKING([if instrumentation should be included])
-=20
-   AC_ARG_ENABLE(instrumentation,
--    AC_HELP_STRING([--disable-instrumentation], [disable instrumentation =
[[default=3Denabled]]]),
-+    AS_HELP_STRING([--disable-instrumentation],
-+      [disable instrumentation [[default=3Denabled]]]),
-     [
-       if test "$enableval" =3D "yes"; then
-         AC_DEFINE(LT_INSTRUMENTATION, 1, enable instrumentation)
-@@ -206,7 +211,8 @@ AC_DEFUN([TORRENT_DISABLE_INSTRUMENTATION], [
-=20
- AC_DEFUN([TORRENT_ENABLE_INTERRUPT_SOCKET], [
-   AC_ARG_ENABLE(interrupt-socket,
--    AC_HELP_STRING([--enable-interrupt-socket], [enable interrupt socket =
[[default=3Dno]]]),
-+    AS_HELP_STRING([--enable-interrupt-socket],
-+      [enable interrupt socket [[default=3Dno]]]),
-     [
-       if test "$enableval" =3D "yes"; then
-         AC_DEFINE(USE_INTERRUPT_SOCKET, 1, Use interrupt socket instead o=
f pthread_kill)
-@@ -214,3 +220,14 @@ AC_DEFUN([TORRENT_ENABLE_INTERRUPT_SOCKET], [
-     ]
-   )
- ])
-+
-+AC_DEFUN([TORRENT_DISABLE_IPV6], [
-+  AC_ARG_ENABLE(ipv6,
-+    AS_HELP_STRING([--enable-ipv6],
-+      [enable ipv6 [[default=3Dno]]]),
-+    [
-+        if test "$enableval" =3D "yes"; then
-+            AC_DEFINE(RAK_USE_INET6, 1, enable ipv6 stuff)
-+        fi
-+    ])
-+])
-diff --git a/scripts/rak_compiler.m4 b/scripts/rak_compiler.m4
-index 9a361bed..bc1572a3 100644
---- a/scripts/rak_compiler.m4
-+++ b/scripts/rak_compiler.m4
-@@ -26,7 +26,7 @@ AC_DEFUN([RAK_CHECK_CXXFLAGS], [
-=20
- AC_DEFUN([RAK_ENABLE_DEBUG], [
-   AC_ARG_ENABLE(debug,
--    AC_HELP_STRING([--enable-debug], [enable debug information [[default=
=3Dyes]]]),
-+    AS_HELP_STRING([--enable-debug],[enable debug information [[default=
=3Dyes]]]),
-     [
-         if test "$enableval" =3D "yes"; then
-             CXXFLAGS=3D"$CXXFLAGS -g -DDEBUG"
-@@ -41,7 +41,7 @@ AC_DEFUN([RAK_ENABLE_DEBUG], [
-=20
- AC_DEFUN([RAK_ENABLE_WERROR], [
-   AC_ARG_ENABLE(werror,
--    AC_HELP_STRING([--enable-werror], [enable the -Werror and -Wall flags=
 [[default -Wall only]]]),
-+    AS_HELP_STRING([--enable-werror],[enable the -Werror and -Wall flags =
[[default -Wall only]]]),
-     [
-         if test "$enableval" =3D "yes"; then
-            CXXFLAGS=3D"$CXXFLAGS -Werror -Wall"
-@@ -54,7 +54,7 @@ AC_DEFUN([RAK_ENABLE_WERROR], [
-=20
- AC_DEFUN([RAK_ENABLE_EXTRA_DEBUG], [
-   AC_ARG_ENABLE(extra-debug,
--    AC_HELP_STRING([--enable-extra-debug], [enable extra debugging checks=
 [[default=3Dno]]]),
-+    AS_HELP_STRING([--enable-extra-debug],[enable extra debugging checks =
[[default=3Dno]]]),
-     [
-         if test "$enableval" =3D "yes"; then
-             AC_DEFINE(USE_EXTRA_DEBUG, 1, Enable extra debugging checks.)
-diff --git a/scripts/rak_cxx.m4 b/scripts/rak_cxx.m4
-deleted file mode 100644
-index 0db61b83..00000000
---- a/scripts/rak_cxx.m4
-+++ /dev/null
-@@ -1,14 +0,0 @@
--AC_DEFUN([RAK_CHECK_CXX11], [
--  AC_ARG_ENABLE([c++0x],
--    AC_HELP_STRING([--enable-c++0x], [compile with C++0x (unsupported)]),
--    [
--      if test "$enableval" =3D "yes"; then
--        AX_CXX_COMPILE_STDCXX_0X
--      else
--        AX_CXX_COMPILE_STDCXX_11(noext)
--      fi
--    ],[
--      AX_CXX_COMPILE_STDCXX_11(noext)
--    ]
--  )
--])
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0044-Create=
-FUNDING.yml.patch b/meta-oe/recipes-connectivity/libtorrent/libtorrent/004=
4-Create-FUNDING.yml.patch
deleted file mode 100644
index b9378f503..000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0044-Create-FUNDIN=
G.yml.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From eca577e2a29d64251b5df1c69be53c5b1ffe6bde Mon Sep 17 00:00:00 2001
-From: Jari Sundell <sundell.software@gmail.com>
-Date: Thu, 8 Sep 2022 05:08:44 +0900
-Subject: [PATCH] Create FUNDING.yml
-
----
- .github/FUNDING.yml | 13 +++++++++++++
- 1 file changed, 13 insertions(+)
- create mode 100644 .github/FUNDING.yml
-
-diff --git a/.github/FUNDING.yml b/.github/FUNDING.yml
-new file mode 100644
-index 00000000..ad5998e8
---- /dev/null
-+++ b/.github/FUNDING.yml
-@@ -0,0 +1,13 @@
-+# These are supported funding model platforms
-+
-+github: [rakshasa]
-+patreon: rtorrent
-+open_collective: # Replace with a single Open Collective username
-+ko_fi: # Replace with a single Ko-fi username
-+tidelift: # Replace with a single Tidelift platform-name/package-name e.g=
., npm/babel
-+community_bridge: # Replace with a single Community Bridge project-name e=
.g., cloud-foundry
-+liberapay: # Replace with a single Liberapay username
-+issuehunt: # Replace with a single IssueHunt username
-+otechie: # Replace with a single Otechie username
-+lfx_crowdfunding: # Replace with a single LFX Crowdfunding project-name e=
.g., cloud-foundry
-+custom: ['https://rakshasa.github.io/rtorrent/donate.html']
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb b/me=
ta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
index 70c173be5..fec05571d 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
@@ -6,57 +6,12 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D393a5ca445f696=
5873eca0259a17f833"
=20
 DEPENDS =3D "zlib libsigc++-2.0 openssl cppunit"
=20
-SRC_URI =3D "git://github.com/rakshasa/libtorrent;branch=3Dmaster;protocol=
=3Dhttps \
-           file://0001-Fix-compilation-issue-with-gcc-v6.x-and-empty-CXXFL=
A.patch \
-           file://0002-Modfiy-gcc-v6.x-fix-for-empty-CXXFLAGS-See-10.patch=
 \
-           file://0003-Add-space-to-fmt-str-in-log_gz_file_write.patch \
-           file://0004-IPv4-filter-enhancement-11IPv4-filter-enhancement-C=
l.patch \
-           file://0005-Disable-extents-test-to-pass-TravisCI-See-11.patch =
\
-           file://0006-Bumped-version-to-0.13.7.patch \
-           file://0007-Added-support-for-openssl-1.1.patch \
-           file://0008-Use-AC_COMPILE-instead-of-AC_RUN-to-check-for-execi=
n.patch \
-           file://0009-Modify-configure-to-prevent-unnecessary-kqueue-chec=
k.patch \
-           file://0010-Display-info-on-failed-tracker-bencode-parsing-See-=
9.patch \
-           file://0011-Strip-tags-also-when-displaying-info-on-failed-trac=
k.patch \
-           file://0012-Switch-to-C-11-MRT-RNG-for-random-bytes.patch \
-           file://0013-Prevent-loss-of-m_ipv6_socket-attribute-which-led-t=
o.patch \
-           file://0014-If-during-socket-creation-AF_INET6-failes-initializ=
e.patch \
-           file://0015-Fixes-https-github.com-rakshasa-rtorrent-issues-731=
.patch \
-           file://0016-Fix-honoring-throttle.min_peers-settings-in-rtorren=
t.patch \
-           file://0017-increase-piece-length-max.patch \
-           file://0018-Set-max-piece-size-512mb.patch \
-           file://0019-Fixed-compiler-warning.patch \
-           file://0020-Added-_GNU_SOURCE-to-fallocate-test.-neheb.patch \
-           file://0021-Fixed-diffie-hellman-implementation.patch \
-           file://0022-Increased-max-timeout-for-tracker-requests.patch \
-           file://0023-Close-log-files-when-reusing-a-name.patch \
-           file://0024-Bumped-to-version-0.13.8.patch \
-           file://0025-Allow-logs-to-be-appended-rather-than-overwritten.p=
atch \
-           file://0026-Removed-log-append-function.-Added-append-parameter=
-.patch \
-           file://0027-Backport-changes-from-feature-bind.-200.patch \
-           file://0028-libtorrent.pc.in-add-Libs.Private-202.patch \
-           file://0029-Fix-for-inotify-missing-quickly-renamed-files-203.p=
atch \
-           file://0030-Fix-compiler-warnings.-204.patch \
-           file://0031-Fix-log-format-so-GCC-can-check-it.-205.patch \
-           file://0032-Consolidate-make-script-to-optimize-build.-206.patc=
h \
-           file://0033-Refactor-make-process.-207.patch \
-           file://0034-Changes-automake-required-files.patch \
-           file://0035-Replaced-custom-execinfo-autoconf-test.patch \
-           file://0036-Added-option-to-disable-pthread_setname_np.patch \
-           file://0037-Improved-backtrace-error-checking.patch \
-           file://0038-Fixed-issue-with-multiple-connections-from-NAT-not-=
w.patch \
-           file://0039-Added-disable-execinfo-option-to-configure.patch \
-           file://0040-Detect-ip-address.patch \
-           file://0041-Added-ipv6-options.patch \
-           file://0042-Removed-obsolete-files.patch \
-           file://0043-Updated-and-cleaned-up-automake.-224.patch \
-           file://0044-Create-FUNDING.yml.patch \
-           "
-SRCREV =3D "c167c5a9e0bcf0df23ae5efd91396aae0e37eb87"
+SRC_URI =3D "git://github.com/rakshasa/libtorrent;branch=3Dmaster;protocol=
=3Dhttps"
+SRCREV =3D "e60f222241319aaae482789517ad00ae9344bd13"
=20
 CVE_STATUS[CVE-2009-1760] =3D "backported-patch: patched in our product"
=20
-PV =3D "1"
+PV =3D "0.13.8+git${SRCPV}"
=20
 S =3D "${WORKDIR}/git"
=20

