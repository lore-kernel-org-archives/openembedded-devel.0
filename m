Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6378.1794046334257432332
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Nov 2026 02:12:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=gwwb8kJe;
 spf=pass (domain: gmail.com, ip: 74.125.82.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-170135e43c7so2521725c88.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 02:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046334; x=1794651134; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eQHseZbmP+E4QkRM/WvRGdwzd0XQZsARZlocUKDZLDw=;
        b=gwwb8kJeUVvu3c6UlkQOfC7TgD6vm6Ujak8zvBZiWE8thl7QiLrYQHrl9Vz3tf0XzG
         LD713QnOSi3Hu2Ixz2adofjzEiCDDpvIEOcjgLiXisL2CHOkXoVPqdunXK3Gf42GpRBA
         zVvwZZFgsWG69rcRCdto9rlVfnHTlijcW1Kw8XyebwXiDJfgbtEVWGJmE0lGqG+EagOH
         GkPpGhAC1yOMMJ/iufYvJ2rBqRWMIjfbtJHPzd3ZTBFfhW/a9MJwv+IUka96p8o2C4We
         tJOiBWJrI7rTq8KbXP5e+QUzoSCF6cSdW8S1gjBQxqTKjssm4nesVZVkhEgdkq38SAmM
         WJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046334; x=1794651134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eQHseZbmP+E4QkRM/WvRGdwzd0XQZsARZlocUKDZLDw=;
        b=cc5FIMBPjUYF7nR+1Z1jCfqM6zMgBczb2hwNt8f9YRotPAzaoonkeOWlmzvl7ozsgL
         pfqI2oSYXP5Ve/sxNbOseSDamAHRDhc0oD/UG2tI4TEi8ajO9IqMWyCI1nHaplPUEgXN
         +Tks3izleBn/PdYID2WaIZiRUzPslx7GmwpdTZASTuE5l+HBkrSUJrXCgAfTTKIfwvWu
         kHlVSFyla2Dk8GQQuamiNtqwUZy8Lg9IPgdDSMbbXjaUoCJ3i19bHeepJHZTfRkSqwo8
         mhAGTEeWZls92LhSWYd3khGOcSlApSx9d2CPET0V0MnfkWwO2z4zTDAZsEQfz82fMMkJ
         q13g==
X-Gm-Message-State: APuU4Z/pmvFE8F6bzgyBvBVGY6kiU0VXqGPTc8YE/mygk57BNtk8tqpE
	RJz7jUeifQOqmUuaSOEcE7s7o0XHdQegSvQSTy86VxWdcwW05jYuY7e4A0zffg==
X-Gm-Gg: AYBFou1NKCVbXdhlob5PDMDbWdPZS9tEmkXFVAJ0KGDIaC37LFH1rNZxjcKyWS4a76O
	NDqXO/WZfXSJtt3PJ6Bg2yO9HHDJ8fI8TwWcWxH3Wgszp8d1QWi4lT3ZroOsHawVF4d6fnJN6L6
	iXkEYAohgVIUYdegfiNSIEVah9FS9z46Lc/zUC2hCdka8EO/+lgN94X14AtNfE5J3g1TiiXh1NR
	lPrJFHny/UXtJpv7SSRmtXEBFHwQwwxLCN8um/O1zyzmABn7qUsuwtlJYM2TMSGk/An+DHFyW04
	mu9GeaNiusYLtx0LXU7mec4OkF9E7FkR9QR5apr2Btm9U4GZXwnuo5f+DfdnI2Ui+FFsWrkd9JA
	rPAc6BpW0I97cv5vqyrpEwo0BllOHHsp/ypILdT0ocClvVfZZ5u2naZiw0yAi7GvkNzhT45EAXT
	hXHLy8jVsWTXiHglbYWQiXWwXVsKhSD2aUUMMNk9TvVtnN+fcvsxTTjnh8m4kkp3IlXNNpf1/zQ
	K8EfWnjGM/j0XLf87Xxu3VBwNYUEla9WouDmTDB8+AMknv7fjXeNEbFYlh+9bzHgkjl+bEMOqT1
	DgCsn+t08Y9lrmBnKyzjkihh2YaLenEPJTwTzqdzvlvzm5YerxgO/kAFqRPN9iQULoeB0Nam0oG
	fK4sqHI4=
X-Received: by 2002:a05:701b:4506:20b0:17b:fea8:1425 with SMTP id a92af1059eb24-1b25d32ef05mr6684566c88.30.1794046333520;
        Sat, 07 Nov 2026 02:12:13 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4840f3sm22856467c88.5.2026.11.07.02.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:12:13 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 7/11] sngrep: upgrade 1.8.4 -> 1.9.0
Date: Sat,  7 Nov 2026 23:11:50 +1300
Message-ID: <20261107101154.2992152-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107101154.2992152-1-ankur.tyagi85@gmail.com>
References: <20261107101154.2992152-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 10:12:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131981
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patch that is part of the upstream version

Changelog:
https://github.com/irontec/sngrep/releases/tag/v1.9.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../sngrep/sngrep/CVE-2026-90558.patch        | 84 -------------------
 .../{sngrep_1.8.4.bb => sngrep_1.9.0.bb}      |  3 +-
 2 files changed, 1 insertion(+), 86 deletions(-)
 delete mode 100644 meta-networking/recipes-support/sngrep/sngrep/CVE-2026-90558.patch
 rename meta-networking/recipes-support/sngrep/{sngrep_1.8.4.bb => sngrep_1.9.0.bb} (93%)

diff --git a/meta-networking/recipes-support/sngrep/sngrep/CVE-2026-90558.patch b/meta-networking/recipes-support/sngrep/sngrep/CVE-2026-90558.patch
deleted file mode 100644
index 64fd8044a9..0000000000
--- a/meta-networking/recipes-support/sngrep/sngrep/CVE-2026-90558.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 399346a12ca3bcf7703734fa33b5b3427775b014 Mon Sep 17 00:00:00 2001
-From: Kaian <kaian@irontec.com>
-Date: Fri, 7 Aug 2026 08:45:42 +0200
-Subject: [PATCH] fix: prevent stack buffer overflow in SIP attribute
- formatting
-
-call_get_attribute() formatted the Call-ID, X-Call-ID and Reason header
-text with an unbounded sprintf("%s"). Call-ID/X-Call-ID can hold up to
-MAX_CALLID_SIZE/MAX_XCALLID_SIZE (1023 bytes) and Reason text is copied
-from the raw payload (up to MAX_SIP_PAYLOAD), while all callers pass a
-255-byte SIP_ATTR_MAXLEN stack buffer (call list rendering, sort compare).
-A SIP message with a long Call-ID, X-Call-ID or Reason header overflowed
-the stack, triggerable via pcap, live capture or HEP/EEP remote capture.
-
-Bound these writes with "%.*s" and SIP_ATTR_MAXLEN - 1. Also fix a
-matching off-by-one in msg_get_attribute(), where the existing "%.*s"
-used SIP_ATTR_MAXLEN as the precision and could write 256 bytes
-(255 chars + NUL) into the 255-byte buffer.
-
-Thanks to TristanInSec for reporting the issue.
-
-(cherry picked from commit 1ff74ee3ab5ff280e8ba976aa8c744dca57eb35b)
-
-CVE: CVE-2026-90558
-Upstream-Status: Backport [https://github.com/irontec/sngrep/commit/1ff74ee3ab5ff280e8ba976aa8c744dca57eb35b]
-
-SIP contract change was dropped during backport as it was introduced in
-v1.8.4[1]
-
-[1]https://github.com/irontec/sngrep/commit/c61a26d90c166f996e31aceefc9c2f8f831ccd86
-
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- src/sip_call.c | 6 +++---
- src/sip_msg.c  | 6 +++---
- 2 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/src/sip_call.c b/src/sip_call.c
-index bea879a..68ecb50 100644
---- a/src/sip_call.c
-+++ b/src/sip_call.c
-@@ -257,10 +257,10 @@ call_get_attribute(sip_call_t *call, enum sip_attr_id id, char *value)
-             sprintf(value, "%d", call->index);
-             break;
-         case SIP_ATTR_CALLID:
--            sprintf(value, "%s", call->callid);
-+            sprintf(value, "%.*s", SIP_ATTR_MAXLEN - 1, call->callid);
-             break;
-         case SIP_ATTR_XCALLID:
--            sprintf(value, "%s", call->xcallid);
-+            sprintf(value, "%.*s", SIP_ATTR_MAXLEN - 1, call->xcallid);
-             break;
-         case SIP_ATTR_MSGCNT:
-             sprintf(value, "%d", vector_count(call->msgs));
-@@ -282,7 +282,7 @@ call_get_attribute(sip_call_t *call, enum sip_attr_id id, char *value)
-             break;
-         case SIP_ATTR_REASON_TXT:
-             if (call->reasontxt)
--                sprintf(value, "%s", call->reasontxt);
-+                sprintf(value, "%.*s", SIP_ATTR_MAXLEN - 1, call->reasontxt);
-             break;
-         case SIP_ATTR_WARNING:
-             if (call->warning)
-diff --git a/src/sip_msg.c b/src/sip_msg.c
-index 379a40a..6762862 100644
---- a/src/sip_msg.c
-+++ b/src/sip_msg.c
-@@ -136,13 +136,13 @@ msg_get_attribute(sip_msg_t *msg, int id, char *value)
-             }
-             break;
-         case SIP_ATTR_METHOD:
--            sprintf(value, "%.*s", SIP_ATTR_MAXLEN, sip_get_msg_reqresp_str(msg));
-+            sprintf(value, "%.*s", SIP_ATTR_MAXLEN - 1, sip_get_msg_reqresp_str(msg));
-             break;
-         case SIP_ATTR_SIPFROM:
--            sprintf(value, "%.*s", SIP_ATTR_MAXLEN, msg->sip_from);
-+            sprintf(value, "%.*s", SIP_ATTR_MAXLEN - 1, msg->sip_from);
-             break;
-         case SIP_ATTR_SIPTO:
--            sprintf(value, "%.*s", SIP_ATTR_MAXLEN, msg->sip_to);
-+            sprintf(value, "%.*s", SIP_ATTR_MAXLEN - 1, msg->sip_to);
-             break;
-         case SIP_ATTR_SIPFROMUSER:
-             if (msg->sip_from && (ar = strchr(msg->sip_from, '@'))) {
diff --git a/meta-networking/recipes-support/sngrep/sngrep_1.8.4.bb b/meta-networking/recipes-support/sngrep/sngrep_1.9.0.bb
similarity index 93%
rename from meta-networking/recipes-support/sngrep/sngrep_1.8.4.bb
rename to meta-networking/recipes-support/sngrep/sngrep_1.9.0.bb
index c7457fd0c0..43eece2b51 100644
--- a/meta-networking/recipes-support/sngrep/sngrep_1.8.4.bb
+++ b/meta-networking/recipes-support/sngrep/sngrep_1.9.0.bb
@@ -16,9 +16,8 @@ DEPENDS = "\
 "
 
 SRC_URI = "git://github.com/irontec/sngrep.git;protocol=https;branch=master;tag=v${PV} \
-           file://CVE-2026-90558.patch \
 "
-SRCREV = "9c370866afaf5ccb258bf03848b2d22f30cf61bd"
+SRCREV = "76b19854eea88bb0ca6df64f33fe8bec08130e6f"
 
 inherit cmake pkgconfig
 
