Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 110ACC54FCD
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 09:19:10 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7430.1785316749018583338
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2026 02:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=P/6WwxPY;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3174; q=dns/txt;
  s=iport01; t=1785316749; x=1786526349;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mibhsJ0hUQ48FgYtWYGMort54N4XgneR4RysZUCopG8=;
  b=P/6WwxPYyoLFO4wM4U6TJnzvMtl2nWEgE/L3QdpqoopXAyyh8m6vjJr0
   8pC9GN4m0FLqKpf1UnuCB4sFx4w3JWgMQKMjsp4nsR7zSykqlAXpaLoNs
   F6FY3HjIj8DLJ6rQBctx/zWCAJTaJ4YNcFV3q2KL7Kc2OIavoYZCbWF1e
   c78/dJ8J7UvYu5Cfcwt9NTXxCp3Zwyb6mkN/F+iO4t8Nd9LTk74rJZIvU
   T14vUPlNOqSLImj7rr4olGitRxjixAAjtsJo7JahmX+GAXHIZ1hLL8fnm
   cW2F7SOiI23kbdotWqZZZG74R+7LQzVvPqDCGnOP8qljO57omNtM2a9Sh
   A==;
X-CSE-ConnectionGUID: PQ97elZpQ8mQh9sTeqOBow==
X-CSE-MsgGUID: PKmtCotMSAyRyy5bkM7nWA==
X-IPAS-Result: =?us-ascii?q?A0BHAgB8xGlq/5UQJK1aglmCV3ReQ0kDlVtsA54bgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhQUCjWYCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GWgECAQMyAUYQHAMBAi8rIwgZgwIBgnQDEb4TgiyBAYNoAkNQ2?=
 =?us-ascii?q?y4BCxQBBYEzhT+IIFwYAYR8JxsbgXKBFYNpgQWBXAKBJ4Z+BIIiehKBWh6QN?=
 =?us-ascii?q?0iBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDRsHBYEdgSw/hFcjGTZ/g?=
 =?us-ascii?q?S91SnctaQESF4EagzkCgkEDCxgNSBEsNxQZBD5uB41vIYJEAYEOASuCLEulK?=
 =?us-ascii?q?6EPCiiDdYwhlToaM4VbpRELmH2OCpZQhGmBaDyBWXAVgyIJShkPji0BCguDY?=
 =?us-ascii?q?IUTNMkTJzILAy8BAQcCBw4DC4FokACBfgEB?=
IronPort-Data: A9a23:v6+CN6Bpo9I53xVW/3/iw5YqxClBgxIJ4kV8jS/XYbTApDMlhDRVn
 WsaXzjSM/jfY2PyLowlPNvg901Xu8eDz983OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYAD/imYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE+8w/U0wyD5UhquNOATBVy
 fEBDxoKcUXW7w626OrTpuhEj8AnKozveYgYoHwllGufBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxANWsHgBfoO3WjPn8XFJI3n+6yrnL+aDZf7lmSoMLb5kCMnVQggOe1b4G9ltqifeZQgm2fu
 kf91nXDEwBHPt+6ljy62yf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTWValrP2Rjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxoYXZ9UVuY98gzIk/CS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH69V5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:yD8t1qsasWVcvtzWQ5LdGiHF7skDrtV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWIeeAa2SS9fyKgzWQIpIH3MSN9ryuiKP1yndgShwvVoRbhj0Jczpy1iZNNXJ77V1TLu
 vl2vZ6
X-Talos-CUID: =?us-ascii?q?9a23=3AMD2WWWj77gtR43Zcxq2/WryMLzJuSkSMk3rUEVe?=
 =?us-ascii?q?BWWNQSOyOdVKJ34ljjJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AUzWzjA2sq7r1yUWRF32+FTgnTzUj24erFGsKjbA?=
 =?us-ascii?q?9kti+JD0tMTS40zKIa9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,192,1779148800"; 
   d="scan'208";a="790987073"
Received: from alln-l-core-12.cisco.com ([173.36.16.149])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jul 2026 09:19:08 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-12.cisco.com (Postfix) with ESMTPS id 15CDB18000238;
	Wed, 29 Jul 2026 09:19:08 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id AFB5ECD1450; Wed, 29 Jul 2026 02:19:07 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [meta-oe][wrynose][PATCH 2/5] libdbi-perl: Fix CVE-2026-10879
Date: Wed, 29 Jul 2026 02:18:37 -0700
Message-Id: <20260729091840.84531-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260729091840.84531-1-hthakar@cisco.com>
References: <20260729091840.84531-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: alln-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 09:19:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128552

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/perl5-dbi/dbi/commit/af79036c07aa9a457971c0f4136e37c85dc20978
[2] https://security-tracker.debian.org/tracker/CVE-2026-10879

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../perl/libdbi-perl/CVE-2026-10879.patch     | 41 +++++++++++++++++++
 .../perl/libdbi-perl_1.647.bb                 |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-10879.patch

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-10879.patch b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-10879.patch
new file mode 100644
index 0000000000..06668adf07
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-10879.patch
@@ -0,0 +1,41 @@
+From 37f2f9149944fa265ea65a8344a9efcdebc0d717 Mon Sep 17 00:00:00 2001
+From: "H.Merijn Brand - Tux" <linux@tux.freedom.nl>
+Date: Thu, 28 May 2026 14:14:50 +0200
+Subject: [PATCH] Replacing `?` with `:p#` in `preparse ()` with more than 9
+ `?` causes buffer overflow
+
+`:p1` is length 3, `?` just 1, but `:p1003` is length 6!
+
+CVE: CVE-2026-10879
+Upstream-Status: Backport [https://github.com/perl5-dbi/dbi/commit/af79036c07aa9a457971c0f4136e37c85dc20978]
+
+Backport Changes:
+- Applied the DBI.xs security fix without functional changes.
+- Omitted ChangeLog and lib/DBI/Changes.pm because they contain only
+  DBI 1.648 release-note updates.
+- Omitted dbixs_rev.h because it is generated from upstream Git history
+  and its hunk only updates the generated timestamp and revision. The
+  fix does not change the DBIXS or DBISTATE interface.
+- Omitted doc/DBI.3 and doc/DBI.man because they are generated manual
+  pages that only contain regenerated dates and are absent from the
+  DBI 1.647 CPAN source.
+
+(cherry picked from commit af79036c07aa9a457971c0f4136e37c85dc20978)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ DBI.xs | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/DBI.xs b/DBI.xs
+index 1f06d4d..fbfe405 100644
+--- a/DBI.xs
++++ b/DBI.xs
+@@ -4203,7 +4203,7 @@ preparse(SV *dbh, const char *statement, IV ps_return, IV ps_accept, void *foo)
+     }
+ 
+     /* XXX this allocation strategy won't work when we get to more advanced stuff */
+-    new_stmt_sv = newSV(strlen(statement) * 3);
++    new_stmt_sv = newSV(strlen(statement) * 6 + 16);
+     sv_setpv(new_stmt_sv,"");
+     src  = statement;
+     dest = SvPVX(new_stmt_sv);
diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
index f676f73d67..5a76924560 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=65f65488c774efe1da488e36ad6c4a36"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HM/HMBRAND/DBI-${PV}.tgz \
            file://CVE-2026-9698.patch \
+           file://CVE-2026-10879.patch \
            "
 SRC_URI[sha256sum] = "0df16af8e5b3225a68b7b592ab531004ddb35a9682b50300ce50174ad867d9aa"
 
-- 
2.35.6


