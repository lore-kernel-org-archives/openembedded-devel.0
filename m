Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B15D167E8
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 09:29:16 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6763.1767950955993007907
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 01:29:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EIlnhFC4;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a0bb2f093aso30240055ad.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 01:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767950955; x=1768555755; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8aSlroGKUvGg7Wdwv4mpsUDy4muaL53OXGTlWAWqrwA=;
        b=EIlnhFC4YoHkeWv9rXU4soOQeo00yasfUTVAb7oIOk+n11mLNT/wDQPMt9uGSWf681
         0FBNX3DVdJuhuHyt82FR6ybqbHsiLpF8QCIQthmnCCHvqIgGnCD+fcNOQYcW2QFH2FU2
         QwtINkjFiQpGQCaeO5Bcp7L4txrc6RBXP1nLAycM9h5AsfkgqbNe6Xm07sgPL7iu3GZg
         W8bfQFGyWntpV9oojS2CYNF0nngUhq91Qfh/jumQkYlfHh5GpAuVoGIITNYZ14GOH5VL
         vYaU4LnzHZBMZYhjY8Slf5FVUdD2cuW0m5haQf+RjLWf3TfODIPvUpmN8o4Kb9bIxGWG
         Kjkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767950955; x=1768555755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8aSlroGKUvGg7Wdwv4mpsUDy4muaL53OXGTlWAWqrwA=;
        b=mXzS9brJLAFEU4jyp9yjbcw/4Cu5HPuR3J4UxchCtQwBDhB/TzujkwCTS6QQF/KVK+
         MUWHFiSNl0O9rTa9BACdRE1JnEul8MXgriJRaQkfObFaJoYLZ5Y8aUuFrRIfgl6uRlP3
         gnYbsoC3/d5bjgHGRsx/Kbq6+8yBomQth62V74tTdLJMLQ7ivT0eQsG1hbyxeIgwNgnm
         ePzQZtWxkFSC32kSikMeHUgZdH9maWPBuU2ndDT1+sm6ELXEHKlD3ZUuQqeMrK9SyC7v
         BMV3XQlwyy1qNpMndh5HLjMADjpeWzcwtj/GSkDxNbsIBCTxCkM/2PqtSYgp7Q6ADamE
         AhAg==
X-Gm-Message-State: AOJu0Yy715ag8Chiz7L2ICAbznTC/Kd3OzvGAEruUGA9uqz/P3xoUEDg
	l0OQKLi9duKVdaLQo82wPa7sOxdtCUH+usfoRdDd/e3U0BUv8WIuDAqjqX6mfA==
X-Gm-Gg: AY/fxX48gL8lhgdztrJHt9lfC/PFVy1Ylt4GJF+/UYyngOqYuIg+q7pZ4zYd8gtZRHk
	Id2PHuH4f6wVaoNXc11Qfm+ArgAzHxdDerdTHCRUPzYJQHS+ta/N36eHQBlk5Jj4O/MxkY7l+2Q
	xG7DZxVLxke4tQkfu1E/+P8y8nviI2E9F6wCyf9DZIkFM1p7JsgQN/ek8YlhPbkNKPDl5Xbg5ud
	3HGinBVaOxpA3SqDA95NjIqFtGq47eapS+MAkugt2+ebT+dga9VaeatSDlNFAEUfa3Egr60e2yz
	M7Jtb7szc8AjpATnDArX4WQIG8y3RJ3fqTgrgvxYMNTAu8B6tqOIbrQUmqQT4ooRcc3VhjY6QKJ
	XyyIVhAU37sKbjffNEBd06QSkqVtUmRxgXq0E1B9ddHiUnm3MzvaoAEK6J4ohRoaZiyqnH8A71F
	mKJq/IWsfXyKxn4u2CEdmIdC0=
X-Google-Smtp-Source: AGHT+IHvQTa55L2rWEw+4aF+yck4j3pqKWwTXtmnyY0lFM/XbGxLr3/4S9DcgFW+qodCBIiVBA4huA==
X-Received: by 2002:a17:903:3c30:b0:2a0:fe4a:d67c with SMTP id d9443c01a7336-2a3ee437a5dmr87500945ad.10.1767950955099;
        Fri, 09 Jan 2026 01:29:15 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88e3sm99529295ad.75.2026.01.09.01.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:29:14 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 10/12] tinyproxy: patch CVE-2025-63938
Date: Fri,  9 Jan 2026 22:28:40 +1300
Message-ID: <20260109092843.1924568-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109092843.1924568-1-ankur.tyagi85@gmail.com>
References: <20260109092843.1924568-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 09:29:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123288

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-63938

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tinyproxy/tinyproxy/CVE-2025-63938.patch  | 42 +++++++++++++++++++
 .../tinyproxy/tinyproxy_1.11.1.bb             |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2025-63938.patch

diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2025-63938.patch b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2025-63938.patch
new file mode 100644
index 0000000000..27b1440b23
--- /dev/null
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2025-63938.patch
@@ -0,0 +1,42 @@
+From a8167245203adb6cae66f04e4d493a4710b993ae Mon Sep 17 00:00:00 2001
+From: rofl0r <rofl0r@users.noreply.github.com>
+Date: Fri, 17 Oct 2025 22:57:39 +0000
+Subject: [PATCH] reqs: fix integer overflow in port number processing
+
+closes #586
+
+CVE: CVE-2025-63938
+Upstream-Status: Backport [https://github.com/tinyproxy/tinyproxy/commit/3c0fde94981b025271ffa1788ae425257841bf5a]
+(cherry picked from commit 3c0fde94981b025271ffa1788ae425257841bf5a)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/reqs.c | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/src/reqs.c b/src/reqs.c
+index 705ce11..b6a7d27 100644
+--- a/src/reqs.c
++++ b/src/reqs.c
+@@ -174,7 +174,7 @@ static int strip_return_port (char *host)
+ {
+         char *ptr1;
+         char *ptr2;
+-        int port;
++        unsigned port;
+ 
+         ptr1 = strrchr (host, ':');
+         if (ptr1 == NULL)
+@@ -186,8 +186,11 @@ static int strip_return_port (char *host)
+                 return 0;
+ 
+         *ptr1++ = '\0';
+-        if (sscanf (ptr1, "%d", &port) != 1)    /* one conversion required */
+-                return 0;
++
++        port = atoi(ptr1);
++        /* check that port string is in the valid range 1-0xffff) */
++        if(strlen(ptr1) > 5 || (port & 0xffff0000)) return 0;
++
+         return port;
+ }
+ 
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.1.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.1.bb
index 8aff50fac8..00e25254a8 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.1.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.1.bb
@@ -9,6 +9,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
            file://tinyproxy.conf \
            file://CVE-2022-40468.patch \
            file://0001-CVE-2023-49606.patch \
+		   file://CVE-2025-63938.patch \
            "
 
 SRC_URI[sha256sum] = "1574acf7ba83c703a89e98bb2758a4ed9fda456f092624b33cfcf0ce2d3b2047"

