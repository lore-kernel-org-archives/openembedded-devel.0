Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DDE8CD4F54
	for <webhook@archiver.kernel.org>; Sat, 23 May 2026 05:01:42 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3090.1779512498724344565
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2026 22:01:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RduKmWSx;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-835b78c3797so3555108b3a.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2026 22:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779512498; x=1780117298; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OKVlAff7V3JGqrAFBHQ739hDdZ64ywM/8MadwVkXNYc=;
        b=RduKmWSxN/BqHccAZyuR4z/dGGQvWuoIidprTRIxeipGnx60o8h+Aa1RPGHXwjJgvE
         +X848pAhSwFuLwA/Y/GK+Qke8ZsdWhkE0qextZ2Y8lB/SvDFx1uvXcV1cHBPbw+FqNv4
         YkU+4FnJ5s5PmrdvlG6kjkdRIemhCe0XGA8SYEoWNzgn6psHFx9737mENA/3JMTkBAjy
         buKwrt9V6lSkYyPU1rIqyB6NNOM3o7X2hhXCucWOza9oqelUedI4b+8XFEOI05MDeUDK
         UsbugKUZmPMPgM15NcWjLx0HJINh4Lfe75CMTfdh4ANHPgSEUxAte6zilovfS3ZP9rQ5
         ANGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779512498; x=1780117298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OKVlAff7V3JGqrAFBHQ739hDdZ64ywM/8MadwVkXNYc=;
        b=kL9rsN8XCykQA9bxIZMNWe0f0PQic+7jGhBmWgcYK25I489gGUO6mSCL47Pk08E27Z
         tsujQRC+GXGCd9NIA8p8IrsAu73Ui6FD2dOqQLiMAOzPTFYh4tZtLz4OzdvB+w4Ye7hU
         837+OIBETnN5qp+CRqDLFrrGpC/MMNe9VqvZNVQqcxC1rPFeCjti3bJ+Q3YCkYKI7iDr
         +IRlrhfxrZ9iWbOFZD8VBSnr2ycaIL8s+Li7VpMeMUYD60rYiVip9GpqCijBU74y1dGO
         H30laxZcK0DNaSIsOSseqLnj2jPXgy+Zf5eQ2u+EkP6YbCzuDPZrHO/bprSPt0FtFAmO
         XQVQ==
X-Gm-Message-State: AOJu0YxQQRDiHJFFwctCpnhtXt8RdfXVOMtLxH1P2AAkMZKdyuxV+pW1
	deucGaKG/UoAMbwuwV/Bq7XxO7ww490ev4XM1huG9sFJmKN9HU3UnCnEN87G2IO6
X-Gm-Gg: Acq92OFNxhxquSa7fQET/nhJrpaatFdzhJxktqw/jTaI+BlH9eNIKsRXU+rlvw1K48J
	QRZ6Ba4Z6a+Wtk0AqfVJttlV6E1tQu+ZKrwvFjfM74OQV8heKYstzxVv3L7Bm2QWpRIE3xcxMDI
	i96qlJvvbyjQbldoV9mUXotDCQxDI9C4XKr1gXKwNBh8i2KTu2god2H8oWV/aaBy9EhBqM4UVHy
	rbqQyPk6A2+zCz2Xy8u8s15cSGXSfRJHML3MfGsNlKm5MOSwxMkPhJ2du371SXlrbhYQvGT+ozZ
	YP7ViirQnHPakxXR/eGJb+5fFJSRUx6DCG/R8I132u/Ka343rVo5nKjDf+oxLSlXkxVixDlGCVp
	TdLTt2k8kIfiN0Br8O3Dg47Cwai/IZl5pUA2L5xB0okU/r4xTuqxXoEqwo3pumfPPv06AH7Hr6W
	3HUpW/6B5eGQ8HDduRI0CFNxyuBWWUTm4oN/i8
X-Received: by 2002:a05:6a00:4299:b0:838:af72:fb37 with SMTP id d2e1a72fcca58-8415f0f02e2mr6161496b3a.7.1779512498119;
        Fri, 22 May 2026 22:01:38 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ad2ca6sm3423107b3a.5.2026.05.22.22.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 22:01:37 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 20/25] dnsmasq: fix CVE-2026-4892
Date: Sat, 23 May 2026 17:00:22 +1200
Message-ID: <20260523050028.848327-20-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
References: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 May 2026 05:01:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127170

From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>

A heap-based out-of-bounds write vulnerability in the DHCPv6
implementation of dnsmasq allows local attackers to execute
arbitrary code with root privileges via a crafted DHCPv6 packet.

Reference:
[ https://nvd.nist.gov/vuln/detail/CVE-2026-4892 ]

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 21c3d7eb6f94f967b5e02fc61cc027d3893764a0)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-support/dnsmasq/dnsmasq_2.92.bb   |  1 +
 .../dnsmasq/files/CVE-2026-4892.patch         | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-4892.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
index 850bfd2657..cf900328ed 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
            file://CVE-2026-2291.patch \
            file://CVE-2026-4890.patch \
            file://CVE-2026-4891.patch \
+           file://CVE-2026-4892.patch \
 "
 SRC_URI[sha256sum] = "fd908e79ff37f73234afcb6d3363f78353e768703d92abd8e3220ade6819b1e1"
 
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4892.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4892.patch
new file mode 100644
index 0000000000..01637601a3
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4892.patch
@@ -0,0 +1,36 @@
+commit 011a36c51438c986535a7248ed2e7f424f8e1078
+Author: Simon Kelley <simon@thekelleys.org.uk>
+Date:   Wed Mar 25 23:16:35 2026 +0000
+
+Fix buffer overflow in helper.c with large CLIDs. CVE-2026-4892
+    
+Bug reported bt Royce M <royce@xchglabs.com>
+    
+Location: helper.c:265-270
+DHCPv6 CLIDs can be up to 65535 bytes. When --dhcp-script is configured,
+the helper hex-encodes raw CLID bytes via sprintf("%.2x") into daemon->packet (5131 bytes).
+A 1000-byte CLID writes ~3000 bytes. The helper process retains root privileges.
+    
+Note: log6_packet() correctly caps CLID to 100 bytes for logging, but the helper code path was missed.
+
+CVE: CVE-2026-4892
+
+Upstream-Status: Backport [ https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=10e6b5b83e80749cba7b090d7780b29f908f0571 ]
+
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+
+diff --git a/src/helper.c b/src/helper.c
+index 72f81fe..2c12801 100644
+--- a/src/helper.c
++++ b/src/helper.c
+@@ -261,8 +261,8 @@ int create_helper(int event_fd, int err_fd, uid_t uid, gid_t gid, long max_fd)
+ 		      data.hostname_len + data.ed_len + data.clid_len, RW_READ))
+ 	continue;
+ 
+-      /* CLID into packet */
+-      for (p = daemon->packet, i = 0; i < data.clid_len; i++)
++      /* CLID into packet: limit to 100 bytes to avoid overflowing buffer. */
++      for (p = daemon->packet, i = 0; i < data.clid_len && i < 100; i++)
+ 	{
+ 	  p += sprintf(p, "%.2x", buf[i]);
+ 	  if (i != data.clid_len - 1) 

