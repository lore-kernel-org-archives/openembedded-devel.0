Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8FFDC83F1D
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 12:59:25 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.35481.1752325164888522249
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Jul 2025 05:59:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=gBtplFv2;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202507121259236c1b2da6b24caef012-lmarnn@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202507121259236c1b2da6b24caef012
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 12 Jul 2025 14:59:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=AL5wFaYqOjSY5FpAk7JfFk7x+NCcrU84iHo2OlBkko0=;
 b=gBtplFv2fFIelZyuI6wHsQ1h7BAPMTJFjb1PF6STdO4mLLEa8PFFY+w/Th6HL3hURVlNaA
 /Zu8UMxQHpWaovODoq6y2TVuAjlwrXGPim3OC73eIslj98CG2R/s2bEeCZW7cp8hqJmj8ioB
 k7OtRyA6msmX3Dh3JRMT5B5ab7nHd0OldgSCEuUwY+QH2yZUgr010w8D3Vs0u9jzqMbXnJGL
 r+5ywWVUo5qrsb4qxdcnOXc6Yu8aLyU2K+3MEb8HSXTatThUpP04gSAKiTsk9rJjOCia7f/B
 xcd8h/peQT6WHvRLX80qIXNAG62Kime2r0WzR5E9kqa/XUE/5L4SWHNQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][walnascar][PATCH 2/2] minifi-cpp: patch spdlog CVE-2025-6140
Date: Sat, 12 Jul 2025 14:58:20 +0200
Message-Id: <20250712125820.3282479-2-peter.marko@siemens.com>
In-Reply-To: <20250712125820.3282479-1-peter.marko@siemens.com>
References: <20250712125820.3282479-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 12:59:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118478

From: Peter Marko <peter.marko@siemens.com>

Same patch as in spdlog recipe.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../minifi-cpp/files/CVE-2025-6140.patch      | 46 +++++++++++++++++++
 .../minifi-cpp/minifi-cpp_0.99.1.bb           |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/CVE-2025-6140.patch

diff --git a/meta-oe/recipes-extended/minifi-cpp/files/CVE-2025-6140.patch b/meta-oe/recipes-extended/minifi-cpp/files/CVE-2025-6140.patch
new file mode 100644
index 0000000000..af135adee2
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/CVE-2025-6140.patch
@@ -0,0 +1,46 @@
+From 10320184df1eb4638e253a34b1eb44ce78954094 Mon Sep 17 00:00:00 2001
+From: Gabi Melman <gmelman1@gmail.com>
+Date: Mon, 17 Mar 2025 15:46:31 +0200
+Subject: [PATCH] Fixed issue #3360 (#3361)
+
+CVE: CVE-2025-6140
+Upstream-Status: Backport [https://github.com/gabime/spdlog/commit/10320184df1eb4638e253a34b1eb44ce78954094]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ include/spdlog/pattern_formatter-inl.h | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/include/spdlog/pattern_formatter-inl.h b/include/spdlog/pattern_formatter-inl.h
+index b53d8051..fd408ed5 100644
+--- a/include/spdlog/pattern_formatter-inl.h
++++ b/include/spdlog/pattern_formatter-inl.h
+@@ -70,6 +70,9 @@ public:
+             pad_it(remaining_pad_);
+         } else if (padinfo_.truncate_) {
+             long new_size = static_cast<long>(dest_.size()) + remaining_pad_;
++            if (new_size < 0) {
++                new_size = 0;
++            }
+             dest_.resize(static_cast<size_t>(new_size));
+         }
+     }
+@@ -264,7 +267,7 @@ public:
+         : flag_formatter(padinfo) {}
+ 
+     void format(const details::log_msg &, const std::tm &tm_time, memory_buf_t &dest) override {
+-        const size_t field_size = 10;
++        const size_t field_size = 8;
+         ScopedPadder p(field_size, padinfo_, dest);
+ 
+         fmt_helper::pad2(tm_time.tm_mon + 1, dest);
+@@ -926,9 +929,8 @@ private:
+     memory_buf_t cached_datetime_;
+ 
+ #ifndef SPDLOG_NO_TLS
+-    mdc_formatter<null_scoped_padder> mdc_formatter_{padding_info{}};
++    mdc_formatter<null_scoped_padder> mdc_formatter_{padding_info {}};
+ #endif
+-
+ };
+ 
+ }  // namespace details
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
index 44daf94c98..229691133f 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
@@ -28,6 +28,7 @@ SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git;protocol=https;branch=mai
            file://0007-libsodium-aarch64-set-compiler-attributes-after-including-arm_.patch \
            file://systemd-volatile.conf \
            file://sysvinit-volatile.conf \
+           file://CVE-2025-6140.patch;patchdir=${S}/thirdparty/spdlog-src \
           "
 
 # minifi-cpp: 0.99.1

