Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97ED3F36C5E
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 11:51:17 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17336.1776685867582970882
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 04:51:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=R+g2A846;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48896199cbaso31309505e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 04:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776685866; x=1777290666; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gu7sc50sM4Ssjz3wLyCp43x+3x2chiIqQKOxcILmTjo=;
        b=R+g2A846SpmYHx5tMvPNZjMGCSvEPbwhsga9+KguNa0Ruw92mqiuZa57xUDFJXVsCD
         ojUb7D5Ki7IXTFO5FeLCqXjbENecVZ1GDWFQBsru0MztuE5h0Bi4jrLQtQ53MPnMpV1A
         hh2ENsYT1bkTL3p6MkzvOJ8MA+3zmPB7rq1HRFdeTyWq0TJTqsTEcpkgT2qsg+yXnsr3
         w/OLb4ThyVzvdQ+EdQyDFvVefntm3GN2lqD4txp8dCYIjAj16T26UTXWclzkNdWomwpg
         0Mp1dek5EKg8vtaPYFTKr0wW33p4tGLObYgjuFPCARpNvA9kqeiynLqOEBI0UOvZIO2p
         A5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776685866; x=1777290666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gu7sc50sM4Ssjz3wLyCp43x+3x2chiIqQKOxcILmTjo=;
        b=a+/w02krnBEPVNlb/h5azV6DkmeilqgZVTeTmd9vDbyuoQjRgbOeIzjoFcO876UFUV
         YRzMhlHCI0PZCjksBcbwt2/DBh5NuJzhAXBU6eUsG0K0vXVWrvGWeLtb0X1LFb/la8xR
         A3it1jUiLlDNXhP3jXndnMnz04SJ6WGb2c93MzHRjQtr9qzS1kR9Z9sC28sw3Pg1Z9qi
         nz2NO7rsBa8aqXboCdGw+cIkBMV9G663EoPXs7QYP96ZnCKIQaw+CySSyN4ZIG8NP8HX
         4zDwCMHBpPtYGPwJR6WCIun6rdGa2yddmQgOTwGVjDHD83ERGQRBCJ4bSCjzQ7UGX8EJ
         E8XQ==
X-Gm-Message-State: AOJu0YyOQeyZwWXmMEgbqLqhNBu9TURSo24lUfkCHlMycOD0LuTF7AOG
	AKMf3ZKtSVZG9/Mo663Oe8QUD4qCTjJh3twod88c/aFMuGbogxnbGatn5owqaQ==
X-Gm-Gg: AeBDieuAaB10Bej7p6Ne5dB8lJccQ/O4k1hAlZlyGWV0IAtQJi/baba1n+EkUjzb4g5
	B3mG0A8/ZhJbDxrWbm8hSnY9o9/inaZ+8RETjY1SXLiELu9tLoZD61OR8DGiwTzyySPTQHPnUjH
	UAV0qEFXAOOP+l8ycvDg/INL/KVaVYoVAJqgq5cLn7U436MGprtkwfK7gEVhaiSNOsP7JwDddQF
	pWlo4F8gNZnZpeTLrHhmqB64LTxezR6WMeV/IfNVkmHfpWAoJn+zXmNxDsFjwac7jbW6t0xtaS7
	7P8jXvvaJpdQVlFr7GnofKu3+wGErJ24/vQeHyXN0K+R5F6wK7yQX81ouDLZFDUBd1LP2x2sV3z
	uVCfF1Pt/S0DdMvEdXJxe1OT9H2JjgnoH3PqVgIZ6Jt8+QMIzOngxVtjm7AJbOEo1e4qCVbZDcG
	SW53PChIr4B9uxIyI7TMWWuUryNzqe/7A=
X-Received: by 2002:a05:600c:c108:b0:488:a82f:bbb6 with SMTP id 5b1f17b1804b1-488fb78e576mr127997985e9.27.1776685865793;
        Mon, 20 Apr 2026 04:51:05 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c773fsm314595715e9.12.2026.04.20.04.51.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 04:51:05 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][whinlatter][PATCH 3/3] corosync: patch CVE-2026-35092
Date: Mon, 20 Apr 2026 13:51:00 +0200
Message-ID: <20260420115102.428743-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420115102.428743-1-skandigraun@gmail.com>
References: <20260420115102.428743-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 11:51:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126502

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-35092

Pick the patch that mentions the CVE ID explicitly (the same commit
was identified by Debian also[1])

[1]: https://security-tracker.debian.org/tracker/CVE-2026-35092

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../corosync/corosync/CVE-2026-35092.patch    | 57 +++++++++++++++++++
 .../corosync/corosync_3.1.10.bb               |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta-networking/recipes-extended/corosync/corosync/CVE-2026-35092.patch

diff --git a/meta-networking/recipes-extended/corosync/corosync/CVE-2026-35092.patch b/meta-networking/recipes-extended/corosync/corosync/CVE-2026-35092.patch
new file mode 100644
index 0000000000..a085d2a29f
--- /dev/null
+++ b/meta-networking/recipes-extended/corosync/corosync/CVE-2026-35092.patch
@@ -0,0 +1,57 @@
+From 8f8a4747a0223b8897deda9a40a8a099c61fa80f Mon Sep 17 00:00:00 2001
+From: Jan Friesse <jfriesse@redhat.com>
+Date: Thu, 2 Apr 2026 09:44:06 +0200
+Subject: [PATCH] totemsrp: Fix integer overflow in memb_join_sanity
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This commit addresses an integer overflow (wraparound) vulnerability
+in the check_memb_join_sanity function.
+
+Previously, the 32-bit unsigned network values proc_list_entries and
+failed_list_entries were added together before being promoted to
+size_t. This allowed the addition to wrap around in 32-bit arithmetic
+(e.g., 0x80000000 + 0x80000000 = 0), resulting in a required_len
+calculation that was incorrectly small.
+
+The solution is to cast the list entries to size_t and verify that
+neither exceeds the maximum allowed value before the addition occurs.
+
+Fixes: CVE-2026-35092
+
+Reported-by: SebastiÃ¡n Alba Vives (@Sebasteuo / 0xS4bb1) <sebasjosue84@gmail.com>
+Signed-off-by: Jan Friesse <jfriesse@redhat.com>
+Also-proposed-by: nicholasyang <nicholas.yang@suse.com>
+Reviewed-by: Christine Caulfield <ccaulfie@redhat.com>
+
+CVE: CVE-2026-35092
+Upstream-Status: Backport [https://github.com/corosync/corosync/commit/4082294f5094a7591e4e00658c5a605f05d644f1]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ exec/totemsrp.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/exec/totemsrp.c b/exec/totemsrp.c
+index 94d6c21..6845cec 100644
+--- a/exec/totemsrp.c
++++ b/exec/totemsrp.c
+@@ -3786,7 +3786,17 @@ static int check_memb_join_sanity(
+ 		failed_list_entries = swab32(failed_list_entries);
+ 	}
+ 
+-	required_len = sizeof(struct memb_join) + ((proc_list_entries + failed_list_entries) * sizeof(struct srp_addr));
++	if (proc_list_entries > PROCESSOR_COUNT_MAX ||
++	    failed_list_entries > PROCESSOR_COUNT_MAX) {
++		log_printf (instance->totemsrp_log_level_security,
++		    "Received memb_join message list_entries exceeds the maximum "
++		    "allowed value...  ignoring.");
++
++		return (-1);
++	}
++
++	required_len = sizeof(struct memb_join) +
++	  (((size_t)proc_list_entries + (size_t)failed_list_entries) * sizeof(struct srp_addr));
+ 	if (msg_len < required_len) {
+ 		log_printf (instance->totemsrp_log_level_security,
+ 		    "Received memb_join message is too short...  ignoring.");
diff --git a/meta-networking/recipes-extended/corosync/corosync_3.1.10.bb b/meta-networking/recipes-extended/corosync/corosync_3.1.10.bb
index 7ccccefed5..77dea16e98 100644
--- a/meta-networking/recipes-extended/corosync/corosync_3.1.10.bb
+++ b/meta-networking/recipes-extended/corosync/corosync_3.1.10.bb
@@ -10,6 +10,7 @@ inherit autotools pkgconfig systemd github-releases
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://corosync.conf \
            file://CVE-2026-35091.patch \
+           file://CVE-2026-35092.patch \
            "
 SRC_URI[sha256sum] = "be361c827f99b215b3bd3fa2fb071c03dac6831c2a351963d938caef62604bc8"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"

