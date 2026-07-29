Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 126BFC54F52
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 09:19:20 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7433.1785316755279572630
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2026 02:19:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=kTBWLD8b;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2859; q=dns/txt;
  s=iport01; t=1785316756; x=1786526356;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KOofz2zcevuoCGJA8fa5+3ijF8hpMafkdojey5MDlmQ=;
  b=kTBWLD8bdGMETR6G1L4pm/HOWGqDyL0cru8dTGpZfTj0AW6gaPfp9NUI
   +5wpT0WJjB6TDwlqSF7QWDlXPC6tHYKBNoMLiAo0SrZdrDUCogOa4L1pN
   w92IqLkHTjJpmMkKuYR2duoz56XrINh7QYCW42tGknsQGhcboc15sRDp8
   LyMR8NQG3KLHOK3fidlsPwO96OAPk+3nDOUsye5WwkXSX/ePSklyxfR4E
   rh6g19YkMzCM/JignBdWn7e0hGO350WHepwOmQAvZt/uCvt/9uc1JsPq0
   cRJJMapJnTRVMDDiNmrE0yA/lrIXt9HDv5XTnfzez0FEwQsQ7Axe1Jo5+
   g==;
X-CSE-ConnectionGUID: RMGs0M1ZReW2d1JpL4w/KA==
X-CSE-MsgGUID: 5YoNtYZZQUmL0MCwLYcLww==
X-IPAS-Result: =?us-ascii?q?A0BGAgDMxGlq/4sQJK1aglmCV3ReQ0mWSgOeG4F+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUFAo1mAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhloBAgEDMgFGEBwDAQIvKyMIGYMCAYJ0AxG+FIIsgQGDaAJDUNsuA?=
 =?us-ascii?q?QsUAQWBM4U/iCBcGAGEfCcbG4FyhH6BBYFcAQGBJ4EGhXgEgiJ6EoFaHpA3S?=
 =?us-ascii?q?IEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwcFgR2BLD+EVyMZNn+BL?=
 =?us-ascii?q?3VKdy1pARIXgRqDOQKCQQMLGA1IESw3FBkEPm4HjW8hgkWBDgErf6cjoQ8KK?=
 =?us-ascii?q?IN1jCGPQoV4GjOEBJQXklELmH2OCpZQhGmBaDyBRwsHcBWDIglKGQ+OLQsLg?=
 =?us-ascii?q?2CBf8xbJzILMgEBBwIHDgMLgWiQAIEeYAEB?=
IronPort-Data: A9a23:XhWmXa8bEbR09jW0hfT5DrUD1n+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 WVJDzrQMvmNZDHzeooiaY638hwP68OGm9BlGgQ5rHpEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsbThFs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kMGKIDosMuM1tDy
 qYUcRIVSkycwMGflefTpulE3qzPLeHiOIcZ/3UlxjbDALN+G9bIQr7B4plT2zJYasJmRKmFI
 ZFHL2MxKk2bMnWjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+Oe9YICNJ4DQHq25mG7Fl
 2Xg41XLMCgnMfjH7BGa1kOnovDQyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZF+k8rQXIwa3O7kPBXC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rGnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:PbIeW64iUMSpU6YlXAPXwBDXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPI
 5bAs5D4aXLfDtHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGthdB8MTMHfhLqWwLzM2faYEKA
 ==
X-Talos-CUID: 9a23:BrpnvG3gBrHDPwRHoj/MarxfIOUKaSX4lUXqLnDiBT9LUJnJVhiz0fYx
X-Talos-MUID: =?us-ascii?q?9a23=3A2k0Aog4w3fsu32tiYgJWlYTHxow10qOIFHE/o6w?=
 =?us-ascii?q?7vu3cEAdvHwaWqCuoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,192,1779148800"; 
   d="scan'208";a="788205423"
Received: from alln-l-core-02.cisco.com ([173.36.16.139])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jul 2026 09:19:16 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-02.cisco.com (Postfix) with ESMTPS id 28F49180001BF;
	Wed, 29 Jul 2026 09:19:16 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id BC55DCD144F; Wed, 29 Jul 2026 02:19:15 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [meta-oe][wrynose][PATCH 5/5] libdbi-perl: Fix CVE-2026-14740
Date: Wed, 29 Jul 2026 02:18:40 -0700
Message-Id: <20260729091840.84531-5-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260729091840.84531-1-hthakar@cisco.com>
References: <20260729091840.84531-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: alln-l-core-02.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 09:19:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128555

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/perl5-dbi/dbi/commit/fc16f9e8b3dd5c65caf1867781ab2bfe2fadcc01
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-14740

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../perl/libdbi-perl/CVE-2026-14740.patch     | 39 +++++++++++++++++++
 .../perl/libdbi-perl_1.647.bb                 |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14740.patch

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14740.patch b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14740.patch
new file mode 100644
index 0000000000..9118bcf633
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14740.patch
@@ -0,0 +1,39 @@
+From 65a5eecd6845ed1c29ede9bbe0b651fa3ba3cc2d Mon Sep 17 00:00:00 2001
+From: Robert Rothenberg <perl@rhizomnic.com>
+Date: Sat, 4 Jul 2026 10:49:42 +0100
+Subject: [PATCH] Fix out-of-bounds read in preparse when an initial comment is
+ deleted
+
+This fixes CVE-2026-14740
+
+CVE: CVE-2026-14740
+Upstream-Status: Backport [https://github.com/perl5-dbi/dbi/commit/fc16f9e8b3dd5c65caf1867781ab2bfe2fadcc01]
+
+Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>
+
+Signed-off-by: Robert Rothenberg <rrwo@cpansec.org>
+(cherry picked from commit fc16f9e8b3dd5c65caf1867781ab2bfe2fadcc01)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ DBI.xs | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/DBI.xs b/DBI.xs
+index 0f9ea9c..da5d137 100644
+--- a/DBI.xs
++++ b/DBI.xs
+@@ -4239,7 +4239,13 @@ preparse(SV *dbh, const char *statement, IV ps_return, IV ps_accept, void *foo)
+                 }
+                 if (in_comment == '/')
+                     src++;
+-                src += (*src != '\n' || *(dest-1)=='\n') ? 1 : 0;
++                /* Only inspect the previously-emitted byte if one exists;
++                   when an initial line comment is deleted, dest is still at
++                   the start of the output buffer and *(dest-1) would read
++                   one byte before it (OOB read). */
++                src += (*src != '\n'
++                        || (dest > SvPVX(new_stmt_sv) && *(dest-1)=='\n'))
++                       ? 1 : 0;
+                 in_comment = '\0';
+                 rt_comment = '\0';
+              }
diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
index 688b63d534..883827e270 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
@@ -14,6 +14,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/H/HM/HMBRAND/DBI-${PV}.tgz \
            file://CVE-2026-10879.patch \
            file://CVE-2026-14380.patch \
            file://CVE-2026-14739.patch \
+           file://CVE-2026-14740.patch \
            "
 SRC_URI[sha256sum] = "0df16af8e5b3225a68b7b592ab531004ddb35a9682b50300ce50174ad867d9aa"
 
-- 
2.35.6


