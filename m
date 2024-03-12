Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A74FC54E58
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 14:10:39 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.10581.1710252633443125337
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Mar 2024 07:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=TqdsBR9W;
 spf=pass (domain: mvista.com, ip: 209.85.215.173, mailfrom: asharma@mvista.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5ce2aada130so4737702a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Mar 2024 07:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1710252632; x=1710857432; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f3KkBOVQEGvJsbSPXrngFeg30BGX05OI/erRMJ39Lpw=;
        b=TqdsBR9WymNA6W/Ubgpav9jIpxwlCnWB9KG3/jp8TzaewksbblsGzxzi0QEmhAnJxz
         Bq4W4gZT3WOBHdLSh2ICBhQa/b8rXubXGZLED8N6x23f19bqAKlcLSPms8PRk5QJx9kH
         KqH8GBpAPkLmsgF2jzOuQlOSp+Pu46LBm+IU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710252632; x=1710857432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f3KkBOVQEGvJsbSPXrngFeg30BGX05OI/erRMJ39Lpw=;
        b=iZ+QECCG2mHYyrW3AF/Zg3xT6xkjZ/urHZGs8O2olf3NhAXOIS0qCpZv9xA2/GI3fP
         6HxFFllFYuaA0n47+U2fN9ZWF+eS7VWv5OwyM6amq1stwkqX+F1pf+RgBKnJCbdDb4mu
         t6p/7Dbxm596uxEi5JIZnlHnfSXb7m14jE6vfb2SvPc4gSQwScYcHwgc9bgXAq4OwyOX
         HyWSLGrUeXWAXDz01SeKXQI5fkUz3VXXYfKU/SLs00PN0GJUttknJx8qzCqmU7wmxweS
         s1YA6in5M5WXP8cl8+aIrB3eBTDemHzKrtVP5Zv4i1NXx2+DHREXB77n1f57joiK0XdL
         Q21w==
X-Gm-Message-State: AOJu0YyFBb2fJBtGPaxTVnh0jJgsoiNFmmUTaSreVrsMsS1At+MLg0dV
	xHt5LBFwX3HP3qffPjEqowHD31Jw2xzhZQzwop1+OE1koI7Vwm4visjCqf1jr9qoG/xqWQm5DCp
	G
X-Google-Smtp-Source: AGHT+IHF5DjpAI8hqUKxzw0hsvAzfWmu1szUYS1SKXeMCcgJeALEy4NnmikHJxXT1XNjZO1Dt69RKg==
X-Received: by 2002:a17:90a:8d15:b0:29b:b59a:7ecf with SMTP id c21-20020a17090a8d1500b0029bb59a7ecfmr3378984pjo.27.1710252632325;
        Tue, 12 Mar 2024 07:10:32 -0700 (PDT)
Received: from asharma-Latitude-3400 ([2401:4900:1c66:53a8:4d97:8f6c:b736:c749])
        by smtp.gmail.com with ESMTPSA id w8-20020a17090aea0800b0029bb8ebdc23sm6762785pjy.37.2024.03.12.07.10.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Mar 2024 07:10:31 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Tue, 12 Mar 2024 19:40:26 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [oe][meta-oe][dunfell][PATCH V2] c-ares: Backport fix for CVE-2024-25629
Date: Tue, 12 Mar 2024 19:40:24 +0530
Message-Id: <20240312141024.27185-1-asharma@mvista.com>
X-Mailer: git-send-email 2.24.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Mar 2024 14:10:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109277

Upstream-Status: Backport [https://github.com/c-ares/c-ares/commit/a804c04ddc8245fc8adf0e92368709639125e183]

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-25629
https://github.com/c-ares/c-ares/security/advisories/GHSA-mg26-v6qh-x48q
https://security-tracker.debian.org/tracker/CVE-2024-25629

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../c-ares/c-ares/CVE-2024-25629.patch        | 32 +++++++++++++++++++
 .../recipes-support/c-ares/c-ares_1.18.1.bb   |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/CVE-2024-25629.patch

diff --git a/meta-oe/recipes-support/c-ares/c-ares/CVE-2024-25629.patch b/meta-oe/recipes-support/c-ares/c-ares/CVE-2024-25629.patch
new file mode 100644
index 000000000..288763428
--- /dev/null
+++ b/meta-oe/recipes-support/c-ares/c-ares/CVE-2024-25629.patch
@@ -0,0 +1,32 @@
+From: a804c04ddc8245fc8adf0e92368709639125e183 Mon Sep 17 00:00:00 2001
+From: Brad House <brad@brad-house.com>
+Date: Mon, 11 Mar 2024 14:29:39 +0000
+Subject: [PATCH] Merge pull request from GHSA-mg26-v6qh-x48q
+
+CVE: CVE-2024-25629
+Upstream-Status: Backport [https://github.com/c-ares/c-ares/commit/a804c04ddc8245fc8adf0e92368709639125e183]
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+---
+ src/lib/ares__read_line.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/lib/ares__read_line.c b/src/lib/ares__read_line.c
+index c62ad2a..d6625a3 100644
+--- a/src/lib/ares__read_line.c
++++ b/src/lib/ares__read_line.c
+@@ -49,6 +49,14 @@ int ares__read_line(FILE *fp, char **buf, size_t *bufsize)
+       if (!fgets(*buf + offset, bytestoread, fp))
+         return (offset != 0) ? 0 : (ferror(fp)) ? ARES_EFILE : ARES_EOF;
+       len = offset + strlen(*buf + offset);
++
++      /* Probably means there was an embedded NULL as the first character in
++       * the line, throw away line */
++      if (len == 0) {
++        offset = 0;
++        continue;
++      }
++
+       if ((*buf)[len - 1] == '\n')
+         {
+           (*buf)[len - 1] = 0;
+--
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


