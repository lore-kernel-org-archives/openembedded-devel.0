Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EBE6EDB7D0
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 20:49:24 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.0])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.91902.1775594961225715352
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2026 13:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Hkapt3pz;
 spf=pass (domain: axis.com, ip: 52.101.83.0, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dTxZ+/m/jxb6q+as13WEaWtOMHdIfoy9/fPjTKt6PQqLa9hCQYGIn8Pjowjied4ufchOByqxmPOuVokQsKRY64xNWbICK6wiOJ4/dxZLr9YkkQAybZ3avcDiIm+yfhQExCSs+PnG4Qmf8vDevq5bULJBpVMsMap8w4rfwBWLza6BEZ45YUQ15/wGpPEVxISdGMAnLakeEOLis26Nw+MwaW0xHHyaitGEBAV4A6O89fy8a7ngfaQM6yX4QathcnHZqIVgkWZWeuwkordToOykpi16nRqYenHG2Uu80+2uoCQ+8jnGg/5BJpwe+DnTV4nfksDhrgwc9R+/bn5hRVUMpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vrkyI64ZEa2JA7beqLIanVRlYNLRl2V6uzNDLMgzElM=;
 b=SWZ7YPkB3ZSH71tdDxQJr7+5UWrHjJaHTv7xW+GD3cwByPdSsCKKXxCgllUJvG4wWZ+m6rI8jdWI7fA3laY2tlTkL/Fw/cZ92mWWyI22wnbXM2EfUqN7EkI2TaCjFqQWUVECVbnjrdRFs2WGsAKByh3QRM+kvExsul6IT34KzSE5+ViFWfyPXVb3+uj6OU6PNuU5gtsKk+O4oR7isaTNNpOTbPs7PmJHet1UYlUkszomdf1YQwpEeK5QimSTJu6okNGPehlPxGdlI0tld6WbQkqBmEd4GYsrb6Umk5dXRx0TfchOuGbE0Ra6om4sS2e+Bf0PdCTGasXhCWDak4HimQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vrkyI64ZEa2JA7beqLIanVRlYNLRl2V6uzNDLMgzElM=;
 b=Hkapt3pzhAVUK+kNWgmZXX+QSmkTitXgMgIsMbvEcIB3eZbFgtk7mHkVgXynfBsWcTCOCqzTCYPJkeq08VEsIBwirg05q+xDHzT9raDUb/WnDxxmTmJFc30/06k8GxC3Ehb/fPJ6bov3tVZEJAF55mrMj2f0Mg4wVFvV1foYgns=
Received: from DB3PR06CA0009.eurprd06.prod.outlook.com (2603:10a6:8:1::22) by
 AS4PR02MB8155.eurprd02.prod.outlook.com (2603:10a6:20b:4cd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 20:49:16 +0000
Received: from DB5PEPF00014B90.eurprd02.prod.outlook.com
 (2603:10a6:8:1:cafe::e9) by DB3PR06CA0009.outlook.office365.com
 (2603:10a6:8:1::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Tue,
 7 Apr 2026 20:49:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B90.mail.protection.outlook.com (10.167.8.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 7 Apr 2026 20:49:15 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 7 Apr
 2026 22:49:15 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 7 Apr 2026 22:49:15 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 62A3816D0
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Apr 2026 22:49:15 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 5906F120A1C; Tue,  7 Apr 2026 22:49:15 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCHv2] jq: Use Git to fetch the code
Date: Tue, 7 Apr 2026 22:49:10 +0200
Message-ID: <20260407204910.691081-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B90:EE_|AS4PR02MB8155:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c67a114-a563-40fc-0fbe-08de94e721cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|56012099003|13003099007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	2pW0PMgbSW5QcDEleEXFW1rEXSNuVhDxpGwfvCSRML/kimFZzgOReM5JKijedXMv7HYFMpvFAhAYuxb/EFOQLpK+I9gMV1BnM4b4XPL7UDNQ77VuHctn8bjuVq39B6ot0dIVVQgReKKRIUnyHguruahH9nYu1wf+MniZQKGLYe+Kyf2t8OnZg3mBAFjMMViYeHo6MfWrnJUT2d/5h4HCr6n5vmEj+v0uXU6tOzNHwER8cZl9mfTy24of3rO/dlDmAn5JeiHaW91FMZQ8RQ6qPm+9/t5GmNvDf/iEDo2Die/f0mhSOjobtU+d8zwgiaFlz/FtnWanM0njkbOiH7cdsXqQc/2koiSMGG9SistsWZyE1gVjJtIsNPudw8kzX+t+NZFsBKa5RMZk0HTRjZ+6V7tH3jKCdb0NsHg+ewViwiWQ5nnFIzzKBjdvTZ3JfJ/H71mRGz1QJqBm6ycLmeCq96RXxqE7shKgqKNiffT494HG1/U836ZoqvH8f+UnWL4cOBF00JXbLpJrFLPIoXCQCHd7jc5La+j2AxTuW9te2i7pY+X2Wlbh/wwUF52lE0RTf2nFFHofC10n54zDnqjl8UyjC7jOii2WT/Cn0gNiXkSIKE2l0iwZwXo6s8HymZCPl6SvC+fhleYVxLomWTqTpwMs1zvasJLtMODAPKG8hQE0gFL4OJ9QbPg4tNuL/d3LF6F4ZR8qkE1fQgHhA2vG8yaKuBGpIhQScJHQAdc6QNg=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(56012099003)(13003099007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	w7y/fMuahRhY8y+dOXdgnZKTuXfaJ2PU4/MwhDV7o2gtBzGS+ublBQ1ZO+rcNl8/H2hen5mYavXmqwCPVU9RBhi0I0oB5eDrotxMT3JunBt5T0XXUeXm5mO4QJersHvA78Aqaytx4OYOehRehnPaQ7zNN0ssAEvW7YpYZZwZRN0cgz7z7MD2jwrtE+gCDhB1EQYnhyVehgZwdyxaZWuPEB5aTG3NAwmi1b3GRs50zLxl1VMZk7yc+gKxsNET5QX94dZrwXIYyGqy+O0fFSkh44vmk3yh1yl7EuhDo4ulFqVUs51pd+aGi6L4XQKmauhEZqWf5KfDV2jKlvN9CFBiEMlOKaBdu4sDwZFKP235hFyqd1RMukyX/i2hB+08CkOqpi1mgNS/97be1BJ4aWhnfMKPr3XfhEDmP0RMrwDynPA2LMdLk6+jNqKsLitrXH3v
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 20:49:15.8023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c67a114-a563-40fc-0fbe-08de94e721cb
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB8155
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2026 20:49:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126090

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

PATCHv2: Add a patch to avoid generated files not existing when
         maintainer mode is disabled (which it is by default).

 ...-with-disable-maintainer-mode-and-so.patch | 43 +++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       | 14 +++---
 2 files changed, 51 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/0001-Support-building-wi=
th-disable-maintainer-mode-and-so.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/0001-Support-building-with-disa=
ble-maintainer-mode-and-so.patch b/meta-oe/recipes-devtools/jq/jq/0001-Supp=
ort-building-with-disable-maintainer-mode-and-so.patch
new file mode 100644
index 0000000000..5986fd963c
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/0001-Support-building-with-disable-mai=
ntainer-mode-and-so.patch
@@ -0,0 +1,43 @@
+From 91ea97fb0993d755ac971497da59985950b23843 Mon Sep 17 00:00:00 2001
+From: Peter Kjellerstedt <pkj@axis.com>
+Date: Tue, 7 Apr 2026 21:59:27 +0200
+Subject: [PATCH] Support building with --disable-maintainer-mode and sourc=
e !=3D
+ build dir
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
+Upstream-Status: Submitted [https://github.com/jqlang/jq/pull/3518/changes=
/282619d60d42c193ddce1095b34469e14dbe87b6]
+---
+ Makefile.am | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 1df4143..511012f 100644
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

