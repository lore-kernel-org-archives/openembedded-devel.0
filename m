Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D871CC83F1D
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 12:57:55 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.35726.1752325068654747535
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Jul 2025 05:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=i0uvXSRE;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20250712125744579a5790fd5ae98db0-p9tdxx@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250712125744579a5790fd5ae98db0
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 12 Jul 2025 14:57:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=p0KoPqHECiS3tVlB8rdMeUGFLdHFKI0stqYGiGmPv1A=;
 b=i0uvXSREmwCcsCVVVIKeGYXgkvgmy/aMt5WsMsBy3mzX2NOZkeVDyMGd5T0ksd09coXx7b
 cGeq7dVEVy71s9a1PNmMKH0pkwtRjwXr8w5fQSma6TaE6L9Q8+SuaYLQuofQOg19v4EHEd9s
 JfsWY59MuZc7zYnnNhSMJXA+uwSh/vWd2v9QuaW9zjRwOco06aYervo9cYQOdBnqD4cgfGBG
 GlV4mI5o7uh/BNIQStXdHwHF2J7lb3s+WfG1povl2Ogjs7fGgtkHvX3RgUVH9ZbSJecXqzDd
 cJEAMh9ddHnZrt+w6Y/xBMpoBUB5XdmhcyLSKlcsoXqlM2jcUTBshh6w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][scarthgap][PATCH 1/2] spdlog: patch CVE-2025-6140
Date: Sat, 12 Jul 2025 14:56:56 +0200
Message-Id: <20250712125657.3282239-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 12:57:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118476

From: Peter Marko <peter.marko@siemens.com>

Pick commit [1] mentioned in [2] as listed in [3].

[1] https://github.com/gabime/spdlog/commit/10320184df1eb4638e253a34b1eb44ce78954094
[2] https://github.com/gabime/spdlog/issues/3360
[3] https://nvd.nist.gov/vuln/detail/CVE-2025-6140

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../spdlog/spdlog/CVE-2025-6140.patch         | 35 +++++++++++++++++++
 .../recipes-support/spdlog/spdlog_1.13.0.bb   |  4 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/spdlog/spdlog/CVE-2025-6140.patch

diff --git a/meta-oe/recipes-support/spdlog/spdlog/CVE-2025-6140.patch b/meta-oe/recipes-support/spdlog/spdlog/CVE-2025-6140.patch
new file mode 100644
index 0000000000..3707d9e9c4
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
+@@ -65,6 +65,9 @@ public:
+             pad_it(remaining_pad_);
+         } else if (padinfo_.truncate_) {
+             long new_size = static_cast<long>(dest_.size()) + remaining_pad_;
++            if (new_size < 0) {
++                new_size = 0;
++            }
+             dest_.resize(static_cast<size_t>(new_size));
+         }
+     }
+@@ -259,7 +262,7 @@ public:
+         : flag_formatter(padinfo) {}
+ 
+     void format(const details::log_msg &, const std::tm &tm_time, memory_buf_t &dest) override {
+-        const size_t field_size = 10;
++        const size_t field_size = 8;
+         ScopedPadder p(field_size, padinfo_, dest);
+ 
+         fmt_helper::pad2(tm_time.tm_mon + 1, dest);
diff --git a/meta-oe/recipes-support/spdlog/spdlog_1.13.0.bb b/meta-oe/recipes-support/spdlog/spdlog_1.13.0.bb
index c6a0881db9..5761766ca8 100644
--- a/meta-oe/recipes-support/spdlog/spdlog_1.13.0.bb
+++ b/meta-oe/recipes-support/spdlog/spdlog_1.13.0.bb
@@ -4,7 +4,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9573510928429ad0cbe5ba4de77546e9"
 
 SRCREV = "7c02e204c92545f869e2f04edaab1f19fe8b19fd"
-SRC_URI = "git://github.com/gabime/spdlog.git;protocol=https;branch=v1.x"
+SRC_URI = "git://github.com/gabime/spdlog.git;protocol=https;branch=v1.x \
+    file://CVE-2025-6140.patch \
+"
 
 DEPENDS = "fmt"
 

