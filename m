Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA25DC83F20
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 12:57:55 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.35461.1752325069265852936
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Jul 2025 05:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=cvEMAlET;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202507121257473cf673b72914cfb879-cvyrv9@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202507121257473cf673b72914cfb879
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 12 Jul 2025 14:57:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=bj7I6hahBzMBv5fS3IunnOHLRtFzxRAG9OYviap19sI=;
 b=cvEMAlETZGvf1W7lbbOevwY30FMBV754JH2d012sAySkRGK8oVp7Skl/tkuzm/stnpflyD
 puH4R0a5xPRiKGkrd4kgqJx6cY8Rw52wPraY0JtEwYsLFclcOwhMY9P6soNTFV/d8nOwvArg
 DVwlop6NF+s9H/x/u4jkk34v5/tQAwlYoomXmIdGUaFowBT0Mm+oh8MkrZU7Uj6lfDcUSBBD
 tRX4s7a9H5Zd7wBbCyBTsuMid/u+wzXF3FrgGgPDBh89DifWnQxQSU6NysCedeq6D8h0B5Wn
 CIOI+/Erj+vOw1oIDLOqQrCwaBBiQ1ZifIt4irzEKxA2jLqDSxmgH8xw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][scarthgap][PATCH 2/2] minifi-cpp: patch spdlog CVE-2025-6140
Date: Sat, 12 Jul 2025 14:56:57 +0200
Message-Id: <20250712125657.3282239-2-peter.marko@siemens.com>
In-Reply-To: <20250712125657.3282239-1-peter.marko@siemens.com>
References: <20250712125657.3282239-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 12:57:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118475

From: Peter Marko <peter.marko@siemens.com>

Same patch as in spdlog recipe.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../minifi-cpp/files/CVE-2025-6140.patch      | 35 +++++++++++++++++++
 .../minifi-cpp/minifi-cpp_0.15.0.bb           |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/CVE-2025-6140.patch

diff --git a/meta-oe/recipes-extended/minifi-cpp/files/CVE-2025-6140.patch b/meta-oe/recipes-extended/minifi-cpp/files/CVE-2025-6140.patch
new file mode 100644
index 0000000000..3707d9e9c4
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/CVE-2025-6140.patch
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
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0.bb
index beb247c254..f84f018ea9 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0.bb
@@ -29,6 +29,7 @@ SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git;protocol=https;branch=mai
            file://0008-libsodium-aarch64_crypto.patch \
            file://systemd-volatile.conf \
            file://sysvinit-volatile.conf \
+           file://CVE-2025-6140.patch;patchdir=${S}/thirdparty/spdlog-src \
           "
 
 SRCREV = "9b55dc0c0f17a190f3e9ade87070a28faf542c25"

