Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF200C83F1D
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 12:56:05 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.35698.1752324961435294098
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Jul 2025 05:56:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Xbg9EdsD;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202507121255597def6694841f713475-pa2xpk@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202507121255597def6694841f713475
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 12 Jul 2025 14:55:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=9tzWPxoeecIcLdC5stJ8IrCyViKZdLj687RsxBUVJjE=;
 b=Xbg9EdsDdgJ9iTdPa6yivRhAZwmHcNisHF0s+UJHsZ0WefuKFveh401ptFdSHRzAeaAXoK
 SGHycMwyiSuBqBcBbdj1poUeTdYXCvkWn+O1x48yoDrV2PNe4D2jNctladk9qPI9EgZbIOcb
 QWQ+jlzSHalJN8mTF0TyBx480rOVAyifm9EJgY8zcRIK3kAF4jfpqNVG47N+fXwq6nywjAf4
 RiZOVspTHAVC8sSvdfBXA2fUaNsUje4F3xQzQAR8Dcn1Nu7oeKMCdBosKofLSglKO9noTpJ/
 dPKeiJZoPmx+S5LnDvPq+XQMoDyyOqPgr22zgHlBFCDJ/9gzuxeuFtUA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][kirkstone][PATCH] spdlog: patch CVE-2025-6140
Date: Sat, 12 Jul 2025 14:55:12 +0200
Message-Id: <20250712125512.3282122-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 12:56:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118474

From: Peter Marko <peter.marko@siemens.com>

Pick commit [1] mentioned in [2] as listed in [3].

[1] https://github.com/gabime/spdlog/commit/10320184df1eb4638e253a34b1eb44ce78954094
[2] https://github.com/gabime/spdlog/issues/3360
[3] https://nvd.nist.gov/vuln/detail/CVE-2025-6140

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../spdlog/spdlog/CVE-2025-6140.patch         | 35 +++++++++++++++++++
 .../recipes-support/spdlog/spdlog_1.9.2.bb    |  4 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/spdlog/spdlog/CVE-2025-6140.patch

diff --git a/meta-oe/recipes-support/spdlog/spdlog/CVE-2025-6140.patch b/meta-oe/recipes-support/spdlog/spdlog/CVE-2025-6140.patch
new file mode 100644
index 0000000000..01e4558ff2
--- /dev/null
+++ b/meta-oe/recipes-support/spdlog/spdlog/CVE-2025-6140.patch
@@ -0,0 +1,35 @@
+From 10320184df1eb4638e253a34b1eb44ce78954094 Mon Sep 17 00:00:00 2001
+From: Gabi Melman <gmelman1@gmail.com>
+Date: Mon, 17 Mar 2025 15:46:31 +0200
+Subject: [PATCH] Fixed issue #3360 (#3361)
+
+CVE: CVE-2025-6140
+Upstream-Status: Backport [https://github.com/gabime/spdlog/commit/10320184df1eb4638e253a34b1eb44ce78954094]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ include/spdlog/pattern_formatter-inl.h | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/include/spdlog/pattern_formatter-inl.h b/include/spdlog/pattern_formatter-inl.h
+index b53d8051..fd408ed5 100644
+--- a/include/spdlog/pattern_formatter-inl.h
++++ b/include/spdlog/pattern_formatter-inl.h
+@@ -76,6 +76,9 @@ public:
+         else if (padinfo_.truncate_)
+         {
+             long new_size = static_cast<long>(dest_.size()) + remaining_pad_;
++            if (new_size < 0) {
++                new_size = 0;
++            }
+             dest_.resize(static_cast<size_t>(new_size));
+         }
+     }
+@@ -303,7 +306,7 @@ public:
+ 
+     void format(const details::log_msg &, const std::tm &tm_time, memory_buf_t &dest) override
+     {
+-        const size_t field_size = 10;
++        const size_t field_size = 8;
+         ScopedPadder p(field_size, padinfo_, dest);
+ 
+         fmt_helper::pad2(tm_time.tm_mon + 1, dest);
diff --git a/meta-oe/recipes-support/spdlog/spdlog_1.9.2.bb b/meta-oe/recipes-support/spdlog/spdlog_1.9.2.bb
index 6362fc7a4b..4110ba8a11 100644
--- a/meta-oe/recipes-support/spdlog/spdlog_1.9.2.bb
+++ b/meta-oe/recipes-support/spdlog/spdlog_1.9.2.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ad
 
 SRCREV = "eb3220622e73a4889eee355ffa37972b3cac3df5"
 SRC_URI = "git://github.com/gabime/spdlog.git;protocol=https;branch=v1.x; \
-           file://0001-Enable-use-of-external-fmt-library.patch"
+           file://0001-Enable-use-of-external-fmt-library.patch \
+           file://CVE-2025-6140.patch \
+"
 
 DEPENDS += "fmt"
 

