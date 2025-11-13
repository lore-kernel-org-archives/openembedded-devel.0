Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C396CCCFA18
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:20:35 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17712.1763014828770347101
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:20:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h04lEqUB;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7b991081160so71357b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014828; x=1763619628; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZm8cYHVO5giXsEv5kViLA2OWwku7b7x1eOzyEyXRpc=;
        b=h04lEqUBJWVKVcbRONrcIX///dMss8EVR9a9CUYr1GLm4NO5tybgtlUVCrPKAEGCfR
         Mqoi2AXXu2lvZq0n2q7fGYbJB6aA4JqLWuTD1meocT521cry9PI7enLzcNWp3xLmQXsN
         VLTUBKEuSTLf+KF/JPnUgrpy6dBSSsUiGLXkpWyX42qKaliSKvZnkAqnOWDVhEYNyBLe
         pS1xC1npSEOJk573CESLf0EuUjC3Rld7RDPBg1k1+5rLhEpzWHdlr5Xwwlla/27JLHAn
         tuRZtoanMR4laEHWwAz68AP1hURHZgzewQTesgdydWadVxhgX9kxVHqPFWc1N7v0dPAZ
         sOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014828; x=1763619628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iZm8cYHVO5giXsEv5kViLA2OWwku7b7x1eOzyEyXRpc=;
        b=haDimtabF/U4/E0CIp27mXWoCbAdGKyBWUgtvTdYWxLNncq+4FuFLkQtw7PccnrupQ
         a0xfGLqOaCVHt4t4qbjFrle/QdXdtZjGU/I6LP8uUCB46jWoIkYRDSL1cVPVnI1I7LMl
         p3+wO7yNOAznr5FoXILZXuLO/oLWfJHw80y4FTAkFrpMief4TKBkX6FZJ9GkHuhz1ceT
         vowDMCof3gloLRjVUw8/dZ0Xjk0Pyrg9kGiYcHWe56XEvPuZCc0gZzkGP6xYs0QZHDAz
         xGisM9lNpz4MQhIPbogW0G+m8SKq4GBl6H0QFLL5FCpCaSEO/9dymvGmOaNLI7Q8Antj
         2AJA==
X-Gm-Message-State: AOJu0YxAP2sJfL1jDyG+aZkxiGv7aDvGVDJhMXWr5gmC0repl4wYe26A
	0fUTYBR7O43byYdJdyu5sa7NBZNExX9b9SVgAXEOvK+HIsYEZT9IAf2U5vv0mA==
X-Gm-Gg: ASbGnctMw1L2u9pbgFd9XuPIbojAlGdcPfH4XQMkjQ2f2OB/fc+A4vK+z30CadTnIxI
	B73N66LlOtudKmmMgqZ8TRc4U5Lp/vUY9/ucKKUtm0WP4SHOGkcuiGLNrSpnSNR6lAmMC5AoZHc
	4pKj2q5VYFps4PyhAcXshgS8ol8XLoBPsKgRSjyPkIEf4LVOSEbQiaHuH+3sZGR9nGPdUhzmetx
	uZZB7ibW5g4qMLJ7LRkLlWKmMVcTOEe/2sv/aCrKQxEMR2evHnAAQ/j+lIOQzDfbZzUb2SUFBYG
	JdbCp+NDQxrX90iBmAABB+7t1GdmoWd4Pxy1Z92G6iXBvmKW5nH8Uc9H+nm8dAbxdaL+BMLe6my
	AMQm3oricPZ6r6/BgQGRobILBn+ybKcZDd3AfPIFEaNiCJ/h5The99UO4ODoPxrQUrqPd++NM13
	7vt8YtIKvU7ntrZg==
X-Google-Smtp-Source: AGHT+IFWB0Goba6dlwjpvcQ2OmUCumM1VUAWWLDBuq3FomZR4qaiIib+g4odXMrLODHXx6nqzZzfYg==
X-Received: by 2002:a05:6a20:918a:b0:341:a688:90b0 with SMTP id adf61e73a8af0-35908e8d22cmr8045586637.1.1763014826902;
        Wed, 12 Nov 2025 22:20:26 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm1000454b3a.69.2025.11.12.22.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:20:26 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 19/38] audit: upgrade 4.0.1 -> 4.0.2
Date: Thu, 13 Nov 2025 19:18:54 +1300
Message-ID: <20251113061914.3756301-19-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
References: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:20:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121617

From: Yi Zhao <yi.zhao@windriver.com>

ChangeLog:
 - Fix musl C builds
 - Many code cleanups
 - Use atomic variables if available for signal related flags
 - Dont rotate audit logs when auditd is in debug mode
 - Fix a couple memory leaks on error paths
 - Correct output when displaying rules with exe/path/dir
 - Fix auparse lookup test to not use the system libaupaurse
 - Improve auparse metrics
 - Update auparse normalizer for recent syscalls
 - Make status report uniform

Drop 0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch as
the issue has been fixed upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f7e691ff430f05ee958f6d50b5a23e0f74b8588b)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ute_malloc__-with-__attribute__-__ma.patch | 49 -------------------
 .../audit/{audit_4.0.1.bb => audit_4.0.2.bb}  |  4 +-
 2 files changed, 1 insertion(+), 52 deletions(-)
 delete mode 100644 meta-oe/recipes-security/audit/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch
 rename meta-oe/recipes-security/audit/{audit_4.0.1.bb => audit_4.0.2.bb} (96%)

diff --git a/meta-oe/recipes-security/audit/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch b/meta-oe/recipes-security/audit/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch
deleted file mode 100644
index b1f324f22d..0000000000
--- a/meta-oe/recipes-security/audit/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 88c9b2c5cebebf13f90890baebbadc60d9fe8d16 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 9 Aug 2022 23:57:03 -0700
-Subject: [PATCH] Replace __attribute_malloc__ with __attribute__((__malloc__))
-
-__attribute_malloc__ is not available on musl
-
-Fixes
-| ../../git/auparse/auparse.h:54:2: error: expected function body after function declarator
-|         __attribute_malloc__ __attr_dealloc (auparse_destroy, 1);
-|         ^
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- audisp/plugins/remote/queue.h | 2 +-
- auparse/auparse.h             | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/audisp/plugins/remote/queue.h b/audisp/plugins/remote/queue.h
-index 36b70d04..031507dc 100644
---- a/audisp/plugins/remote/queue.h
-+++ b/audisp/plugins/remote/queue.h
-@@ -53,7 +53,7 @@ void q_close(struct queue *q);
-  * On error, return NULL and set errno. */
- struct queue *q_open(int q_flags, const char *path, size_t num_entries,
- 		     size_t entry_size)
--	__attribute_malloc__ __attr_dealloc (q_close, 1) __wur;
-+	__attribute__((__malloc__)) __attr_dealloc (q_close, 1) __wur;
- 
- /* Add DATA to tail of Q. Return 0 on success, -1 on error and set errno. */
- int q_append(struct queue *q, const char *data);
-diff --git a/auparse/auparse.h b/auparse/auparse.h
-index c27f1ff9..87c52965 100644
---- a/auparse/auparse.h
-+++ b/auparse/auparse.h
-@@ -55,7 +55,7 @@ typedef void (*auparse_callback_ptr)(auparse_state_t *au,
- void auparse_destroy(auparse_state_t *au);
- void auparse_destroy_ext(auparse_state_t *au, auparse_destroy_what_t what);
- auparse_state_t *auparse_init(ausource_t source, const void *b)
--	__attribute_malloc__ __attr_dealloc (auparse_destroy, 1);
-+	__attribute__((__malloc__)) __attr_dealloc (auparse_destroy, 1);
- int auparse_new_buffer(auparse_state_t *au, const char *data, size_t data_len)
- 	__attr_access ((__read_only__, 2, 3));
- int auparse_feed(auparse_state_t *au, const char *data, size_t data_len)
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-security/audit/audit_4.0.1.bb b/meta-oe/recipes-security/audit/audit_4.0.2.bb
similarity index 96%
rename from meta-oe/recipes-security/audit/audit_4.0.1.bb
rename to meta-oe/recipes-security/audit/audit_4.0.2.bb
index a37ae3bb84..0086f8db69 100644
--- a/meta-oe/recipes-security/audit/audit_4.0.1.bb
+++ b/meta-oe/recipes-security/audit/audit_4.0.2.bb
@@ -13,10 +13,8 @@ SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=master;proto
            file://audit-volatile.conf \
           "
 
-SRC_URI:append:libc-musl = " file://0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch"
-
 S = "${WORKDIR}/git"
-SRCREV = "22ccbd984e493524050ac445f796e9a7e90e1149"
+SRCREV = "4e6deae41d4646d28bb3ba9524a8a227a38ccd0b"
 
 inherit autotools python3targetconfig update-rc.d systemd
 

