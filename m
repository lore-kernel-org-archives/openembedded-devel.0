Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D65C54791
	for <webhook@archiver.kernel.org>; Sun, 10 Mar 2024 17:55:54 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web11.43002.1710093346625686427
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Mar 2024 10:55:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=W4KhrC6B;
 spf=pass (domain: mvista.com, ip: 209.85.167.182, mailfrom: asharma@mvista.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3c20cd7ab33so1313830b6e.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 10 Mar 2024 10:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1710093346; x=1710698146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s/ZdGy73e8a7E2X3fB1D4I2cu04sA0YsDrz0hd0ZPx0=;
        b=W4KhrC6BCD3xgEFWRZwCKO5ezzcdpdNolWzmtC5xrdH31aQp0/uguBdjM2E3tRn81M
         xqu1k9cR1c5GzTMP15HNe4QX7dcrL6TmvMczKUkv58edIcAJMBdPPZfAZ++TjzWSIFHX
         VEuc948wf/K93F+i9Ox3TaA/h0XLoVdtUYw2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710093346; x=1710698146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s/ZdGy73e8a7E2X3fB1D4I2cu04sA0YsDrz0hd0ZPx0=;
        b=l6NQJEz+f/MmWyWnJbzXcVvgD7StH7V5AKD2uEoFHOBQvivyZE54mRxbKywJV1i2b7
         kjq5FOkEq429q/XDP9DayIHYEC8WgQacR4fxohfgO+Ce1DoP92mY1TCA/TMXHVLcswt/
         SWnq9mk8Cf7ABkY1NqXgZfzwsorQNfgDSQp2P/Vgzn1O7Em7HZ1RbtmZSeBelhymw0ld
         kaNiBvYNTW5lUqNhGCbBDmeCscXP6ftBfhAsyQUcWsHEdKdNiYlDzZbDesjXusRp6p+r
         abmEavFHqsR7UTTtzzux1lHx50u/5ZTzS9bxFhEuOLS0Mu/wOfX2xI83D7qMd78TJy9L
         tQlg==
X-Gm-Message-State: AOJu0YzCCuBn+GLWm0vDWxN8C8yM+1sGnA8B8gG8RNaIT2JVZ44jY4q4
	7FYC6h1PdeDgS2jccrB+XJ7kCHNNvVQfPRsHoBla5cQA/BP63EUaGeM7w7ImIHmC0wbXrStBUMH
	R
X-Google-Smtp-Source: AGHT+IGl8rmsCMod7IxbVZ2orMJYjmdKI96Ja8yTsVlJwGIUMFpEMNCZsxeFPhul4cEJk9Txl+pZoA==
X-Received: by 2002:a05:6808:eca:b0:3c2:1659:5957 with SMTP id q10-20020a0568080eca00b003c216595957mr6864955oiv.13.1710093345710;
        Sun, 10 Mar 2024 10:55:45 -0700 (PDT)
Received: from asharma-Latitude-3400 ([223.190.82.28])
        by smtp.gmail.com with ESMTPSA id e10-20020a170902f1ca00b001dd75d4c78csm2944316plc.221.2024.03.10.10.55.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Mar 2024 10:55:45 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Sun, 10 Mar 2024 23:23:30 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [oe][meta-oe][dunfell][PATCH] c-ares: Backport fix for CVE-2024-25629
Date: Sun, 10 Mar 2024 23:23:27 +0530
Message-Id: <20240310175327.3201-1-asharma@mvista.com>
X-Mailer: git-send-email 2.24.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 10 Mar 2024 17:55:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109259

Upstream-Status: Backport from debian [https://git.launchpad.net/ubuntu/+source/c-ares/commit/?h=applied/ubuntu/jammy-devel&id=3701814ad9f8570e0142f4b2bf79a32472fe89d6]
CVE: CVE-2024-25629
Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../c-ares/c-ares/CVE-2024-25629.patch        | 31 +++++++++++++++++++
 .../recipes-support/c-ares/c-ares_1.18.1.bb   |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/CVE-2024-25629.patch

diff --git a/meta-oe/recipes-support/c-ares/c-ares/CVE-2024-25629.patch b/meta-oe/recipes-support/c-ares/c-ares/CVE-2024-25629.patch
new file mode 100644
index 000000000..76f8b7c3b
--- /dev/null
+++ b/meta-oe/recipes-support/c-ares/c-ares/CVE-2024-25629.patch
@@ -0,0 +1,31 @@
+From a804c04ddc8245fc8adf0e92368709639125e183 Mon Sep 17 00:00:00 2001
+From: Brad House <brad@brad-house.com>
+Date: Thu, 22 Feb 2024 16:23:33 -0500
+Subject: [PATCH] Merge pull request from GHSA-mg26-v6qh-x48q
+
+Upstream-Status: Backport from debian [https://git.launchpad.net/ubuntu/+source/c-ares/commit/?h=applied/ubuntu/jammy-devel&id=3701814ad9f8570e0142f4b2bf79a32472fe89d6]
+CVE: CVE-2024-25629
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ src/lib/ares__read_line.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+Index: c-ares-1.18.1/src/lib/ares__read_line.c
+===================================================================
+--- c-ares-1.18.1.orig/src/lib/ares__read_line.c
++++ c-ares-1.18.1/src/lib/ares__read_line.c
+@@ -49,6 +49,14 @@ int ares__read_line(FILE *fp, char **buf
+       if (!fgets(*buf + offset, bytestoread, fp))
+         return (offset != 0) ? 0 : (ferror(fp)) ? ARES_EFILE : ARES_EOF;
+       len = offset + strlen(*buf + offset);
++
++      /* Probably means there was an embedded NULL as the first character in
++      * the line, throw away line */
++      if (len == 0) {
++        offset = 0;
++        continue;
++      }
++
+       if ((*buf)[len - 1] == '\n')
+         {
+           (*buf)[len - 1] = 0;
diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb b/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
index 2aa789760..b5936e1ad 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
@@ -10,6 +10,7 @@ SRC_URI = "git://github.com/c-ares/c-ares.git;branch=main;protocol=https \
            file://CVE-2023-31130.patch \
            file://CVE-2023-31147.patch \
            file://CVE-2023-32067.patch \
+           file://CVE-2024-25629.patch \
           "
 SRCREV = "2aa086f822aad5017a6f2061ef656f237a62d0ed"
 
-- 
2.24.4


