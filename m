Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB6EC19F32
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 00:54:35 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.5672.1740704073516507160
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Feb 2025 16:54:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DWHAhM5U;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6df83fd01cbso8016556d6.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 16:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740704072; x=1741308872; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Dopgmcnaioz7vTfo5nBR6Gjxu6CwxxL0fyrL7ILCH8=;
        b=DWHAhM5UxgPD1mkuVnOJ3Nht3GH4xrscBPWY03VsL4mf+yQ0v+caHIYvtuXAykolMx
         ukaCgQF8ULxwdIOVssa3oaqEf5Ij/wu8sJwNF6EhDhOu3ru9Kd/m7OYHgyCXZRAWzET3
         l8dGpod9FhhMaeq/Jk8E8fuc2AuidGtxD9nclMA/OO3wtcMVbGHBZ8O3wryCV9TPYIIB
         R9f9kT3+MmDYmqtFFgvXZusHNEDOVfCG7k2V0lPxeROIDQ5KFztmFN7G06gtVR0nfoBW
         Zl3Iih2VBqw6rg3bAS6UXpkc2CpbYC3AxWrabaW2E5wCJ3vKv3nwRJZ1GWQFr4kE1l+v
         OPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740704072; x=1741308872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Dopgmcnaioz7vTfo5nBR6Gjxu6CwxxL0fyrL7ILCH8=;
        b=a5KEv9Kz+pNTlqtgBQ5UZjNJk+AEd+E6BYwhu1QcUEZMW3bsW6wkx+HMp5sV80TGyA
         PQBWiT14loT2tTYahEh08SkqeCsWYMrxkc/Jz9HbS2GwBhFyxnwcl0HY3NlDxGN1bVvW
         9vyLGiO9WlrDLcIydy4odWewTpqH19Msd2gaGlXbVSHXTgO0S0G13J0rhoniXM2Mxx1j
         I/jEmDdbXD8WzHBVDzkirK76E7ajuBktxCHO67lYaymwuWsgfJOQU0wHXWe/OZRdKYpD
         vQFJ2XfegnS2dEBXg3WftS7JYTZxU7J5ZzNVfoUsANK+I4kWUAusJs/74UapNLGTWRuJ
         cu7g==
X-Gm-Message-State: AOJu0YwLfWH+oVXzNzYkebWfmq+xcwEQYzjZM9up8unVMjcg+jOOHGJq
	CiHRwO3XROJXCLld3ks5FjhN9RQGBph4/Gwn9FXw8wRBsiE6FVm5KztCT+Cs
X-Gm-Gg: ASbGncuy+tW2AKDprlRMQPe42w/B+3aZ8HA0cT0qTKlqo7uxOZ4myljOQ0NaqbmiVZ5
	pyuU8NnPzwdGKy5w5DfnQnzJ1DagGQVt09Lg9v/lxmUs0wWYOfabU9Few0cH+BZPWaY3LuitQm+
	K/cuYDeZMgih/rrVEQh/fAz6sVJbGxUZYw37x9VYHcZgY6S6Eod/HOUtpAABWDM0TCWpm88zt1M
	W+8oGKspW270Kw6C/fWjXrcOhjl7VOZgq/fHd5MTuEUwI/zpPKFX2a/TFwIi2dy5l0PfPQU9R8n
	86XKG45iEVaG6CLYz8cRjU7qWabSUL5qk2YOpFQvUOEDZVnRyxcOekMSslXDYmtT1Hch0Q==
X-Google-Smtp-Source: AGHT+IEwPmuO2vfOHEnbXS72Jueq18UYCEtZdWEud410N6kIGGXThx/u0uYzqdwwxhDOw2may/68NA==
X-Received: by 2002:a05:6214:1c4e:b0:6e4:3e5e:56d5 with SMTP id 6a1803df08f44-6e8a0ccd0a3mr25017676d6.5.1740704071877;
        Thu, 27 Feb 2025 16:54:31 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c395c5376bsm128668085a.37.2025.02.27.16.54.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 16:54:31 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][meta-oe][PATCH] iperf3: throughput fix
Date: Thu, 27 Feb 2025 19:54:20 -0500
Message-ID: <20250228005420.32443-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.44.0.501.g19981daefd7c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Feb 2025 00:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115705

This is a backport of a fix to iperf3. The author saw a 40% improvement in
their network throughput, we've seen around a 55% improvement in our tests.

Link: https://github.com/esnet/iperf/pull/1708/commits/ac6b9f7fd335ddebc5212eed40083ef4cd3cb86d
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 ...-not-listen-to-old-udp-prot-listener.patch | 30 +++++++++++++++++++
 .../recipes-benchmark/iperf3/iperf3_3.16.bb   |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/do-not-listen-to-old-udp-prot-listener.patch

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/do-not-listen-to-old-udp-prot-listener.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/do-not-listen-to-old-udp-prot-listener.patch
new file mode 100644
index 000000000000..da1664ddcf67
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3/do-not-listen-to-old-udp-prot-listener.patch
@@ -0,0 +1,30 @@
+From ac6b9f7fd335ddebc5212eed40083ef4cd3cb86d Mon Sep 17 00:00:00 2001
+From: David Bar-On <david.cdb004@gmail.com>
+Date: Sun, 2 Jun 2024 11:52:03 +0300
+Subject: [PATCH] Do not listen to old pro_listener
+
+Clear old UDP prot_listener from read_set, as currently the server's select()
+always return when data (that is relevant only to the worker thread) is
+received. This makes the main thread consume a lot of unnecessary CPU, which
+reduces the total throughput - especially when only one stream is used.
+
+In my single machine environment, with the this fix the throughput is
+increased by about 40% for one stream test.
+---
+Upstream-Status: Backport [3.18]
+
+ src/iperf_udp.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/iperf_udp.c b/src/iperf_udp.c
+index a603236df..40f2b1ca7 100644
+--- a/src/iperf_udp.c
++++ b/src/iperf_udp.c
+@@ -446,6 +446,7 @@ iperf_udp_accept(struct iperf_test *test)
+     /*
+      * Create a new "listening" socket to replace the one we were using before.
+      */
++    FD_CLR(test->prot_listener, &test->read_set); // No control messages from old listener
+     test->prot_listener = netannounce(test->settings->domain, Pudp, test->bind_address, test->bind_dev, test->server_port);
+     if (test->prot_listener < 0) {
+         i_errno = IESTREAMLISTEN;
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.16.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.16.bb
index 5cec4c687444..a2cb9035621e 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.16.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.16.bb
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=dc6301c8256ceb8f71c9e3c2ae9096b9"
 SRC_URI = "git://github.com/esnet/iperf.git;branch=master;protocol=https \
            file://0002-Remove-pg-from-profile_CFLAGS.patch \
            file://0001-configure.ac-check-for-CPP-prog.patch \
+           file://do-not-listen-to-old-udp-prot-listener.patch \
            "
 
 SRCREV = "f9481e1cd35159929458513692e4a8f9fdd1bd6f"
-- 
2.44.0.501.g19981daefd7c


