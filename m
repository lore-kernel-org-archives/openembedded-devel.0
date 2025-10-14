Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA3BCCD190
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 20:39:29 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.6659.1760474361339869810
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 13:39:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XFNZmYEp;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-781ea2cee3fso5588104b3a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 13:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760474360; x=1761079160; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3dErGWZhUilwr6e6fZ2g5gPmNT9iqC8kjiHGvft6Ug=;
        b=XFNZmYEpqQ+LFV4KfgxE/3aH96TTHxiEJzZ3lZe3LAR6TTjlN9HxYHJjgGVJS3mVPM
         5LtKk4xC7dObbe3M7m9HDgSSobzvMLhxng6OER5CQoKZRobJKjnmJmBuzeTvoGj3RI0I
         wbqIcCgcmGwcy0ulReP6WN4Bb7Roro0l6tkVLbdUx3fSLJFAmUcexW9GKb+1/dEMYG0N
         ME5eLcCwvwAgossBaVdgw3TMF1wAKeRkcm0jcVey06IVEHqxfmTj4kxUZ+ilIv+gB1b+
         JT0/iAOP+4wdXxch0iCHUOtvc1643SUx+kNAdjJH8+24VpmAFJYzkrzz8/uJ6xTcIRIl
         TAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760474360; x=1761079160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e3dErGWZhUilwr6e6fZ2g5gPmNT9iqC8kjiHGvft6Ug=;
        b=qITlSUbg4tsRXEyf2u4e9yRzvs3owdv4YPWXqNj1vI9HySViYvJ/C3tnif4UwHnetK
         bYNCU/1HdKOxkWaXKbrL+UN4siBeJPVtXbfxftoRApBPzZDoZi0B+mNCcZhfxtZ4W4PS
         imnVtqKnBrmOXsJWhSkxdQfOksfjo+jBnPq4gGFIR/Hn60rvSk7VJYm8PZiLM2tIxvJs
         Jbj7Z+zAHoEW45sny54bhiqPH0eZ9PiG4iIOlye+KUv1KormhR8JsCaBwgbvWgf/KDtS
         cqvobimGy31l1RaixljIhVazzdUvINqsdAiRnVLsrgVkvOts9+2jflwKkA5eszfCAl0U
         GOEg==
X-Gm-Message-State: AOJu0YxDzGvsFI8Iv0gdh6daf3FrLhkrSYLnqkUIpIwcSDYPr1ihi6As
	RtYTk3WyfLo48wJpAm0k/Ym/WCnuulYTEl09Bsdo+6JJD4AqmcUTsQG4BbI6MA==
X-Gm-Gg: ASbGnctUbLJiiDq/O7AGhgPfGoKItiZBX0f66csgJZJq73Pbyjjz0vKt8UwJSyfssyr
	oHUjnyNFnDYd08zvfoE6OzA1I3ldCDHYDKwyy1CVSzOPZX/FB3Y/iX/TKyPADqnsshV+yTl3MEG
	ZKXrhy8c1LlCWvONwdLqTec21lA3mckOPl38vn26mN60fgjG60sJkcWp5BYMJx+auaClR3FCO1b
	Kwi2MZZg+adsIFk7q/YUDYJI02f0cywlvDd5dEhaWT5JLjP6clvSQeN4I+DpnBDg3uutsx4SinL
	+6pHCebM50baoF8SYWs5bOtmND+S9gOFS8cQYVp1lpmr2AFfEtwJEijhSGAXB6p8jv2EqZ54SVd
	JMb1cMi5Tsq9C7b7LcNnhKPMny6+VfIsqDFwjPPcMtMq6erQNEJW2+44=
X-Google-Smtp-Source: AGHT+IGfaYcWS+YJFFUxfg4zRHDBJeotMagKOkbhE3WOWbMxfUSvdGRknAyhyZ4SxgeGUisqx6XlJg==
X-Received: by 2002:a05:6a00:4fca:b0:78a:f6be:74d9 with SMTP id d2e1a72fcca58-793876375c2mr29374351b3a.26.1760474360536;
        Tue, 14 Oct 2025 13:39:20 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b733355sm16009495b3a.26.2025.10.14.13.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 13:39:20 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>,
	Gyorgy Sarvari <skandigraun@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 4/6] corosync: patch CVE-2025-30472
Date: Wed, 15 Oct 2025 09:38:59 +1300
Message-ID: <20251014203901.1479326-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014203901.1479326-1-ankur.tyagi85@gmail.com>
References: <20251014203901.1479326-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 20:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120629

From: Peter Marko <peter.marko@siemens.com>

Pick commit from [1] mentioned in [2] from [3]

[1] https://github.com/corosync/corosync/issues/778
[2] https://github.com/corosync/corosync/pull/779
[3] https://nvd.nist.gov/vuln/detail/CVE-2025-30472

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
(cherry picked from commit eab04e462009f938fcaefefdde5e67cc94c525e8)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../corosync/corosync/CVE-2025-30472.patch    | 69 +++++++++++++++++++
 .../corosync/corosync_3.1.9.bb                |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta-networking/recipes-extended/corosync/corosync/CVE-2025-30472.patch

diff --git a/meta-networking/recipes-extended/corosync/corosync/CVE-2025-30472.patch b/meta-networking/recipes-extended/corosync/corosync/CVE-2025-30472.patch
new file mode 100644
index 0000000000..9b36dbe3fb
--- /dev/null
+++ b/meta-networking/recipes-extended/corosync/corosync/CVE-2025-30472.patch
@@ -0,0 +1,69 @@
+From 7839990f9cdf34e55435ed90109e82709032466a Mon Sep 17 00:00:00 2001
+From: Jan Friesse <jfriesse@redhat.com>
+Date: Mon, 24 Mar 2025 12:05:08 +0100
+Subject: [PATCH] totemsrp: Check size of orf_token msg
+
+orf_token message is stored into preallocated array on endian convert
+so carefully crafted malicious message can lead to crash of corosync.
+
+Solution is to check message size beforehand.
+
+Signed-off-by: Jan Friesse <jfriesse@redhat.com>
+Reviewed-by: Christine Caulfield <ccaulfie@redhat.com>
+
+CVE: CVE-2025-30472
+Upstream-Status: Backport [https://github.com/corosync/corosync/commits/7839990f9cdf34e55435ed90109e82709032466a]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ exec/totemsrp.c | 18 +++++++++++++++++-
+ 1 file changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/exec/totemsrp.c b/exec/totemsrp.c
+index 962d0e2a..364528ce 100644
+--- a/exec/totemsrp.c
++++ b/exec/totemsrp.c
+@@ -3679,12 +3679,20 @@ static int check_orf_token_sanity(
+ 	const struct totemsrp_instance *instance,
+ 	const void *msg,
+ 	size_t msg_len,
++	size_t max_msg_len,
+ 	int endian_conversion_needed)
+ {
+ 	int rtr_entries;
+ 	const struct orf_token *token = (const struct orf_token *)msg;
+ 	size_t required_len;
+ 
++	if (msg_len > max_msg_len) {
++		log_printf (instance->totemsrp_log_level_security,
++		    "Received orf_token message is too long...  ignoring.");
++
++		return (-1);
++	}
++
+ 	if (msg_len < sizeof(struct orf_token)) {
+ 		log_printf (instance->totemsrp_log_level_security,
+ 		    "Received orf_token message is too short...  ignoring.");
+@@ -3698,6 +3706,13 @@ static int check_orf_token_sanity(
+ 		rtr_entries = token->rtr_list_entries;
+ 	}
+ 
++	if (rtr_entries > RETRANSMIT_ENTRIES_MAX) {
++		log_printf (instance->totemsrp_log_level_security,
++		    "Received orf_token message rtr_entries is corrupted...  ignoring.");
++
++		return (-1);
++	}
++
+ 	required_len = sizeof(struct orf_token) + rtr_entries * sizeof(struct rtr_item);
+ 	if (msg_len < required_len) {
+ 		log_printf (instance->totemsrp_log_level_security,
+@@ -3868,7 +3883,8 @@ static int message_handler_orf_token (
+ 	    "Time since last token %0.4f ms", tv_diff / (float)QB_TIME_NS_IN_MSEC);
+ #endif
+ 
+-	if (check_orf_token_sanity(instance, msg, msg_len, endian_conversion_needed) == -1) {
++	if (check_orf_token_sanity(instance, msg, msg_len, sizeof(token_storage),
++	    endian_conversion_needed) == -1) {
+ 		return (0);
+ 	}
+ 
diff --git a/meta-networking/recipes-extended/corosync/corosync_3.1.9.bb b/meta-networking/recipes-extended/corosync/corosync_3.1.9.bb
index b4e0f1c7db..cd9feb5da5 100644
--- a/meta-networking/recipes-extended/corosync/corosync_3.1.9.bb
+++ b/meta-networking/recipes-extended/corosync/corosync_3.1.9.bb
@@ -9,6 +9,7 @@ inherit autotools pkgconfig systemd github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://corosync.conf \
+           file://CVE-2025-30472.patch \
           "
 SRC_URI[sha256sum] = "203354bbddee1a97b3c50a076eae89c635f406dd674ccaefc94bb9092acd9535"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"

