Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85BCB10F995C
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 17:47:47 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.112352.1775670459190649986
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Apr 2026 10:47:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=SfFtWzdp;
 spf=pass (domain: axis.com, ip: 52.101.72.46, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZHwv2RCovnFJp34RdfVPLyyJnBebq8T5TWEAfZ7tgISE5ahje5ZggEfx0LQZaedVowtVZA8aNoIWAYbfcJiMqupAu0cbmVGcghKa03JiNKX2MlJoMt5nfD73X4R+Iff25O34RC0/CbJL9b076NqESHqM/siAXpWaGxKnapetGaFbGjlZc7krKnpde1KTHTdXKo6T35DCCtPNDXdaPJQhghz6IPJXiD3CNUNpl/dPBNMksvYEuOdM38lyDLyHHPVZwKOm13USu6xIOQSOGTphHsu/y4i/jMixUNQF7UsU+gbe4qOSEHLYMiAY9HDNlQWgrWr2MZNhIRnr7Lxjb0D2lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BkKE23yfVY/idL9FsUOCbgUPkC1Xm/uTGySjYZlkuE=;
 b=X2HKDOGp/+Z70fnaeAiQDTbA5ummycGTyPJZNFBrEvgI67D+5yuESt/66kcVJC24gXNPpeuWIhMkDG+eEZpKGa1h9gzju4pWXO8HletE4B9lq2PBC6JMoC8LtR/qFhmnilAuNZsK6rcc4nd0Y1CPRzsO/MF7nPUw/BlAM89NsVMK36cnm/ieyzOQ05KeKHyrQ6vv8Bk/dQX3ErXBWXXHid8TVrGI8KhMLFRxSqZBsTzJwJVk/dOdzcd5AE4RsyP8tXLkgQ+a66b0oy98C9gEluce1lkR+ZKwQXWFeL6RfvLHP9P+d4DILm1CkMvdjjRfcMZpTzIjaIN4HaoLyuwLAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BkKE23yfVY/idL9FsUOCbgUPkC1Xm/uTGySjYZlkuE=;
 b=SfFtWzdpt+o8SNBjdRHy28QkH8Pf70Z5MN4b/fJsSw9f88KptZ+bUd0J0rir6nwfPNOwwEUbc9n76xLSVHz4bmVho6sxISnKYryJPEP0E1LWdAJAy92plFB3JkaozBv9Yz2iM2+FfOqqqbNgSnQf0PNhCnvut1AwaZQkZNcFo40=
Received: from DU6P191CA0057.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::15)
 by DB9PR02MB9969.eurprd02.prod.outlook.com (2603:10a6:10:45c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 17:47:34 +0000
Received: from DB5PEPF00014B8B.eurprd02.prod.outlook.com
 (2603:10a6:10:53e:cafe::53) by DU6P191CA0057.outlook.office365.com
 (2603:10a6:10:53e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Wed,
 8 Apr 2026 17:47:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B8B.mail.protection.outlook.com (10.167.8.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 17:47:34 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 8 Apr
 2026 19:47:34 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 8 Apr 2026 19:47:34 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 44B558C6
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Apr 2026 19:47:34 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 3FA54120922; Wed,  8 Apr 2026 19:47:34 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCHv2] jq: Use Git to fetch the code
Date: Wed, 8 Apr 2026 19:47:32 +0200
Message-ID: <20260408174732.1151629-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8B:EE_|DB9PR02MB9969:EE_
X-MS-Office365-Filtering-Correlation-Id: fdebe46f-0c65-4209-01fd-08de9596ea9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|13003099007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	TrwZ2Jv29y1cUpDJ2rMqSRIndxZIz4ll76E+kYjmvLHLp3OweYXsprJAD+z1fo5V8oM+rPSSVBZawtlOuW1Jj4PjiXh56jbfYnMdBfHjwCJGXFsG1tcEEOJ9BceS9yCkNNSiquUT75BmtdN9mC42mL3ZzCQwRm2kjO/+YnTpNpWins2OdSN6m31eG4CXohYPdSuNTAN1M0dooMCn+plIk5Xp92W9CbAemaU9UiIXFQkSOzyLqDNEeI8nT9+7XIm5GyD9swOhwCTPOZXMhsaTlT0PbYKNftpPC8IS2G6ZKZxYaTywK0Gfx7KGNDpCZh5h5Wzt4jz9wxPh1LtFnkqFAW396NvaPBzuyCYeif93x0nvvBxmNzE8w8lN1JFPWvPIZrSS79FRpWRAup6bwMwSiaTxtMctpo2GCH7eNhKSwcdKC73QeELGnAB3YDMcvXXqdne+97RSfbTCR0PpFCwKKuLMEbtr/82flIcpCy3swkuBwnOnubF7MA8E/mSMbFdsIv29gS9IjY1XeNQfaMhKUrhv0cPooyTwnySbkELROzeiFteOWYFr/huCDlRUQnzFFbzF9UnTrpsjXK8af5KxpzkZXy2JJ4MDPi7HgTkKG3L1ES7IGULnrOjdisKqt/aL1pxzhVG0zr8+BWaj/Cym13cVasHB2TEy5CrLY3mA5n0R8hpejnRDJS86i7JbW644Q2qsmlEwbFVrbuCZekSNoPWwkpuiGM73tg7QBQdYtNHcGr+Cx/zkLeVyBMFEQ59XFjcFdwVsNISorLBRAIOHFg==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(13003099007)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	8MYKMj/5AVgXdZpJk2vkNPMOSvstwifUB5ZUibmPU1aMPa10wZUQ6SH37fWqU5Y0oCLRosv6nQ0b5ZobHUp+7qSntnUtbgMowhOt8Mroc4Q5IF/uQrVfkT7YW9ZKi5HUimMMPMXvWt+YoYCAP3OEMb3kZoEte0XyZ92aekMKIrZNTtrYw0Ns2fzbZ5x3wM5FABJABlI9ZOtRj6Lm8p5dZV5MFosURWmOVSwm+Raqs7YQH5l4+cmkkvPUAp5p+YDeChbrOrgIF0WjIuwQINEF2i8TZJx/I1Jtghpk0DDCGGm19bziM83rTR9bRvkEGdkCFzJ7qf8P6GiaFxFCl2Ri8W+Zhm7wrlmtBN+zvxqH6yg/QhOCmnCy3KuLjhpTCuUw0kzE1/KGTVna8e9KaSJ06ueOzgNKIkKCEf26vLoK9Px8cgV1zloWqkHXwtSuj//E
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 17:47:34.6347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdebe46f-0c65-4209-01fd-08de9596ea9b
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB9969
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Apr 2026 17:47:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126108

There is a bug (see https://github.com/jqlang/jq/issues/434), which
results in an empty version being used if autoreconf is run on the jq
sources when using a release tar ball. The incorrect assumption is that
autoreconf is only used when fetching the code using Git.

The empty version results in an incorrect libjq.pc file being created
where the version is not set, which results in, e.g.,
`pkgconf --libs 'libjq > 1.6'` failing even if version 1.8.1 of jq is
actually installed.

Switch to fetching the code using Git to workaround the bug.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: The patch has been integrated upstream so this updates the
         Upstream-Status accordingly.

 ...-with-disable-maintainer-mode-and-so.patch | 44 +++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       | 14 +++---
 2 files changed, 52 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/0001-Support-building-wi=
th-disable-maintainer-mode-and-so.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/0001-Support-building-with-disa=
ble-maintainer-mode-and-so.patch b/meta-oe/recipes-devtools/jq/jq/0001-Supp=
ort-building-with-disable-maintainer-mode-and-so.patch
new file mode 100644
index 0000000000..12a64a75ed
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/0001-Support-building-with-disable-mai=
ntainer-mode-and-so.patch
@@ -0,0 +1,44 @@
+From 27f417f4812e688a59fc5186b7768cec004cd6e5 Mon Sep 17 00:00:00 2001
+From: Peter Kjellerstedt <peter.kjellerstedt@gmail.com>
+Date: Wed, 8 Apr 2026 05:58:49 +0200
+Subject: [PATCH] Support building with --disable-maintainer-mode and sourc=
e !=3D
+ build dir (#3518)
+
+If --disable-maintainer-mode is enabled, then the rules for generating
+parser.[ch] and lexer.[ch] did nothing. This worked fine if the source
+and build directories are the same as the pre-generated parser.c and
+lexer.c files would suffice. However, if the build directory is not the
+same as the source directory, then the rest of the Make rules expect
+parser.[ch] and lexer.[ch] to have been created in the build directory
+if their source files (parser.y and lexer.l) are newer than the target
+files, which can happen in case the source is fetched using Git.
+
+Avoid the problem by copying the files to the build directory if needed.
+
+Co-authored-by: Peter Kjellerstedt <pkj@axis.com>
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/27f417f4812=
e688a59fc5186b7768cec004cd6e5]
+---
+ Makefile.am | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 96d6038..acb9443 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -41,9 +41,14 @@ src/lexer.h: src/lexer.c
+ else
+ BUILT_SOURCES =3D src/builtin.inc src/config_opts.inc src/version.h
+ .y.c:
+-	$(AM_V_YACC) echo "NOT building parser.c!"
++	$(AM_V_YACC) [ "$(<D)" =3D "$(@D)" ] || cp $(<D)/$(@F) $@
++	$(AM_V_YACC) [ "$(<D)" =3D "$(@D)" ] || cp $(<D)/$(*F).h $*.h
++	$(AM_V_YACC) touch $@ $*.h
++
+ .l.c:
+-	$(AM_V_LEX) echo "NOT building lexer.c!"
++	$(AM_V_LEX) [ "$(<D)" =3D "$(@D)" ] || cp $(<D)/$(@F) $@
++	$(AM_V_LEX) [ "$(<D)" =3D "$(@D)" ] || cp $(<D)/$(*F).h $*.h
++	$(AM_V_LEX) touch $@ $*.h
+ endif
+=20
+ # Tell YACC (Bison) autoconf macros that you want a header file created.
diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-devt=
ools/jq/jq_1.8.1.bb
index b9383c76f7..6eaa2de6df 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -8,15 +8,17 @@ SECTION =3D "utils"
 LICENSE =3D "MIT & BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcf7fcb0a1def4a7ad62c028f7d0dca4=
7"
=20
-GITHUB_BASE_URI =3D "https://github.com/jqlang/${BPN}/releases/"
-SRC_URI =3D "${GITHUB_BASE_URI}/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz =
\
+SRCREV =3D "4467af7068b1bcd7f882defff6e7ea674c5357f4"
+
+SRC_URI =3D " \
+    git://github.com/jqlang/jq.git;protocol=3Dhttps;branch=3Dmaster;tag=3D=
jq-${PV} \
     file://run-ptest \
-    "
-SRC_URI[sha256sum] =3D "2be64e7129cecb11d5906290eba10af694fb9e3e7f9fc208a3=
11dc33ca837eb0"
+    file://0001-Support-building-with-disable-maintainer-mode-and-so.patch=
 \
+"
=20
-inherit autotools github-releases ptest
+inherit autotools ptest
=20
-UPSTREAM_CHECK_REGEX =3D "releases/tag/${BPN}-(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_GITTAGREGEX =3D "${BPN}-(?P<pver>\d+(\.\d+)+)"
=20
 PACKAGECONFIG ?=3D "oniguruma"
=20

