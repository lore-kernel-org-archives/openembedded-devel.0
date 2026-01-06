Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA23EC9833B
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 07:33:46 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.85362.1767684817854345450
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 23:33:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eL+zcPA1;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47774d3536dso6179825e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 23:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767684816; x=1768289616; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aA8NdNZqwumt5Uyx6VLIPCv4Au/LtXyZ5KZWAmv8d0s=;
        b=eL+zcPA1AzsjnMRiHwP2HjrPJZV6QqhOMmzcwtCkJ+YCNXTWCRzdPrF+mdTRpJsy6W
         j7Wl7WuPxWRxHEbp7o/PlVJsJINomZ/pmtVTMa1Kmj9YXrkXRvgMMpLHooOmBKGwnDyK
         N3Wg98nkBaVmk4Ey+KhodmhPmglX+/mTfv3LXEJeZkUwmZXylp0la6lgFdihAUkeZJL0
         1pr/2yBixaNkKd3Jqbdz83CiPFjqAaJcl5Tm4AuCY2KN9YhKBsPYZuJj4OAelw9uak7l
         Z3mGLWuKMRRZjpVGBlHvkx+bURtZ+0zpSn5aroFq3o7OOzxxdzy+fh3q9cF8IuZyeZzV
         UasQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767684816; x=1768289616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aA8NdNZqwumt5Uyx6VLIPCv4Au/LtXyZ5KZWAmv8d0s=;
        b=Rys9ZYBEnIqSmjOb/1ZkQKwKuAGK5yTJVJnzk5L9llmai0No6CJMoqGTCS7clg+qPY
         3rJJugWMPeuFysvBQiBn1xvTB5EN6qpJ2w8RxUj0TLpDWrDqnUAOUZcsW0LPBR7l5Ly5
         sBGqZk1O3JdHO7uXELvouvgJjntkfFElzCr3G+7q/PNpaXkUmrCsvdan/Wgu60U4+EpY
         Ww9VAPF4cj59X2Sd388zGFfJnnZ5mE0jvhfcrSEUasP9YKNOMMbqdqQovfvgE72KW1NM
         QP/EkApIcK6DacgquQHjXjOhDRrCVKPGUGHGw5LKCN+Du2e0J1rfREaoxPnlez18olG0
         eiCQ==
X-Gm-Message-State: AOJu0YzUfg72fWQc5KgFPp6j02upE6DTJRknsesV2vyXtBYLIXZMpKsV
	UfWZFCERvVLudqdxLsVoyOvCvAskDXTFrXxqYFLjVzhnXgRx1rV2JVNIhg3XgA==
X-Gm-Gg: AY/fxX7q5QabyAJu0YVUCKUdywR/u/M66uRdUJ44tRuvuSTGy7JSlb9B7HqtyDyn6Gc
	5Gys3P3fY/O/22ceE3ohXvzOd04G/fL16A3r3DP8ObczCiqx1bvDD0xGK6hMgFj4Tx76++XdnTM
	tk4gaD1NMEttdscf0Iinvp/fizhrsq/fyk4b8oZ7MRHdkp0WyYGTLRkobG3zTmwL/l0y2RQDNZ5
	Fwa3WwmrOWLBNYYdxq7sDVJTd9wm4zJ+ODmBIKVTzL6ywgy0cGRxQmboCbYoSKg1lG716yymut/
	i9i1ViGcoD/1+akwUShiW/TH+j9lPfuKBHP3ArIjoSpqNpzX/G22y+8jA62gAhtzRD000F4Gzfd
	3iw9ji5U9zRnIgH9st+Z23Yu0D8t9sRR5CPRHLgyltrSOu5JuAPN924anphCUXJFRw9D/pz+km2
	IjR8P61VNL
X-Google-Smtp-Source: AGHT+IEbYYTuR7Jf7AaZSChhBVDQ97imPnT+OnoGr2Lpazg6NVTEk2JA2KgXSflZRn5kklXwZIFwuw==
X-Received: by 2002:a05:600c:5646:b0:471:793:e795 with SMTP id 5b1f17b1804b1-47d7f398fffmr14760595e9.0.1767684815877;
        Mon, 05 Jan 2026 23:33:35 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e16f4sm2811251f8f.11.2026.01.05.23.33.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 23:33:35 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 1/5] tinyproxy: patch CVE-2025-63938
Date: Tue,  6 Jan 2026 08:33:25 +0100
Message-ID: <20260106073334.3462222-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 07:33:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123163

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-63938

Pick the patch that is referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../tinyproxy/tinyproxy/CVE-2025-63938.patch  | 41 +++++++++++++++++++
 .../tinyproxy/tinyproxy_1.11.0.bb             |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2025-63938.patch

diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2025-63938.patch b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2025-63938.patch
new file mode 100644
index 0000000000..538908863e
--- /dev/null
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2025-63938.patch
@@ -0,0 +1,41 @@
+From 0e4906a4d4dd12f78870c418f0b68812a329a16a Mon Sep 17 00:00:00 2001
+From: rofl0r <rofl0r@users.noreply.github.com>
+Date: Fri, 17 Oct 2025 22:57:39 +0000
+Subject: [PATCH] reqs: fix integer overflow in port number processing
+
+closes #586
+
+CVE: CVE-2025-63938
+Upstream-Status: Backport [https://github.com/tinyproxy/tinyproxy/commit/3c0fde94981b025271ffa1788ae425257841bf5a]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/reqs.c | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/src/reqs.c b/src/reqs.c
+index cfa87ed..e4c0c77 100644
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
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.0.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.0.bb
index 4ddb202268..57acbc451a 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.0.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.0.bb
@@ -8,6 +8,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
            file://tinyproxy.service \
            file://tinyproxy.conf \
            file://CVE-2022-40468.patch \
+           file://CVE-2025-63938.patch \
            "
 
 SRC_URI[md5sum] = "658db5558ffb849414341b756a546a99"

