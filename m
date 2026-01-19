Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE5E1CCF2D7
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 10:05:49 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32276.1768817146362174160
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 02:05:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=afb96nhx;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a110548cdeso27447535ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 02:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768817146; x=1769421946; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T9OSL0zAuQAzIdf/Rqe95f8DjRFWah8o9Mdk1xI0zo0=;
        b=afb96nhxVGF5aEsKnkKX+OWqg6zsJaQJeJ25Kw44iVcAlqM1MRSaFzE7ZbrRmCq6S+
         pGRuyxM8WvBEbjc1AcvaWM2Pt+Yy+s9rVFtBI4h3VBhHR5tIsqzvZ+5PH2AHyNRwEci7
         /ujzDJDeqT2IY5EQIy4niis44Bc4MLK31o8KJt78LlqBCGtoYDh3yojXoSnqCGvkd/qT
         D6fjUHzm7uypUE0nEcAz/I3GmhtEt2jnRRMKh5xHgmRV2R14dFZmrhITIi5moaKXaONs
         zg/zY3qVRBIK+lXsPk+pt4UYqTSv/WjXN0qVy/YvKgC3yGfkWBmPfQeL3okXjVXupPOB
         mxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768817146; x=1769421946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T9OSL0zAuQAzIdf/Rqe95f8DjRFWah8o9Mdk1xI0zo0=;
        b=ZfXvQobilaEzJnZEoXJWIG8YajC+JX+I+rL7JCliQIsQpjqtGnAADLWjCTQqXsoLn2
         c0GWqMrIIsPdPTxOJ6omSPmUaphBfTlcp8bhFPXzT2d1a/AxzcmZGwgHO3NHju4PLB4h
         OqcPo6HXea7FIApD05JyYjQZ2JivtYqQ5DJcMALPCjeeSmtBe+uE19j4BCnTvG5Hx0Az
         zoyRQ61mUmZ4DWKpQv7VG7EV5bu9RU+rOCM7ar5HzGlA8z1f7QIBwHItCV5dI0eTKc6f
         eg6R5n/epK0hEh42BYpbNMjE5xyp3y4WdZ7xO4IY7B0NASvqVB2fwMG8MS/K4zBfTuOX
         gO3A==
X-Gm-Message-State: AOJu0Yw4eD5ZVWib2lwQ5lUSrkB/yuevBQ7RkQxiCGKdBpTmQI5EX8Wf
	7j4mqSEmuOS415VOruGhmK40bD6EXtX2ms5NzT3uEewdcy/J0G5MVslfrFSvYg==
X-Gm-Gg: AZuq6aJnUQl9byWvUmgGZM42sOkN16My7X9Gc7R3UNHnLscHe1GJ9WDP1aqwb69wdxM
	Tnam8gfgkj9gQfZz743QjvtRVLJ6BnhhQ6loMXp/Z2nvRkc+mBfNQBUFbQCX8Hl1KvySw8gB4Qn
	MpdFlIiWBnM+dYCzZCrehl/qghNSs5ntxhvsMVJfHflu+1XoSjUAoiciXNIoNrzMJrjkhlrQ3sF
	lM06qU33uP0xVdWwJS6kZ3kwvKXcrHvYt2vjYLLYYNbiXHr6o05iLOVcdmZXdgZ629zP9hoBLAo
	MhMyltorDya4Q3gPOf3vzn/XGP/MJge1mNJCHCKN8XavAzudond+j5oN+Y9tAuj1gOnEqTSFtt2
	PpZbbJye3Gkko+36d9C1I5WBetbKD9LAMQZ+oa/KrqKwKoYax4LDJRQfNlh3eiTAxpEfiunMhBK
	76ztnhaa3+ZX7gIzsMmotfnK8=
X-Received: by 2002:a17:902:e850:b0:29e:c2de:4ad with SMTP id d9443c01a7336-2a717551d0cmr110172335ad.24.1768817145598;
        Mon, 19 Jan 2026 02:05:45 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a718f79f40sm90109935ad.0.2026.01.19.02.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:05:45 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 3/5] dante: Add _GNU_SOURCE for musl builds
Date: Mon, 19 Jan 2026 23:05:13 +1300
Message-ID: <20260119100515.95275-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119100515.95275-1-ankur.tyagi85@gmail.com>
References: <20260119100515.95275-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 10:05:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123627

From: Khem Raj <raj.khem@gmail.com>

This helps build fixes e.g. cpuset_t definitions etc.
glibc builds have _GNU_SOURCE defined inherently.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 848bac20ea27afddc3843c41ad105843ad167177)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-protocols/dante/dante_1.4.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-protocols/dante/dante_1.4.4.bb b/meta-networking/recipes-protocols/dante/dante_1.4.4.bb
index 7aa1103855..52cfba4c5f 100644
--- a/meta-networking/recipes-protocols/dante/dante_1.4.4.bb
+++ b/meta-networking/recipes-protocols/dante/dante_1.4.4.bb
@@ -29,6 +29,8 @@ CPPFLAGS += "-P"
 CFLAGS += "-I${STAGING_INCDIR}/tirpc"
 LIBS += "-ltirpc"
 
+CFLAGS:append:libc-musl = " -D_GNU_SOURCE"
+
 REQUIRED_DISTRO_FEATURES = "pam"
 
 EXTRA_AUTORECONF = "-I ${S}"

