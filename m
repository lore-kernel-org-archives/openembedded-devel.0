Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC639CD4F54
	for <webhook@archiver.kernel.org>; Sat, 23 May 2026 05:01:52 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3052.1779512505481158746
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2026 22:01:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=m6K3IQNP;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-83659d38e38so3252973b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2026 22:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779512505; x=1780117305; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CdDP8wS2Bf2FwEnsv0Avmlfty9uUj6dupR1XoiNv6gA=;
        b=m6K3IQNPEbzLZFLSThbs07THZMeS7R4r6p/UmC2BPqVJEEct9JJStNLEskAJIrC3GN
         IuXLIYwnAETFeSTtBWH58GFSU6X8VFa55cdZzCOZjmXIcyUoyPOiqfdFKxZm8pdbgm9z
         cRNYJn5XWTRGQX5mixny0VOV8AWBvVRUdHv+22f0t3a7u3jPBuYZjcPrTA3saZFJqP2I
         JFMT2kKN9NFxnHAwHxkyk05wXx/+k9On6wf2VVZRBSfTK0xCaXegTZvGz5MwHPMRzM5c
         DhQJTrCy+160KNvWka+fSjWgSoIxrDiUyvMJO0Bxhn5g06t9eY+x5hNiMQ/p7mXmK9Wc
         Ncgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779512505; x=1780117305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CdDP8wS2Bf2FwEnsv0Avmlfty9uUj6dupR1XoiNv6gA=;
        b=He+oDbav6M+SP49tdQSkjB7w7I1AUqaYomrWb926gLD1b3DEvjjehBfCeFvhd+44kU
         cQfWMEIpGzLD8GI8JThj1iQt26smX8khqXCB5p9J7+aAMcN5su9KVOTcsmU2B0c+vlzC
         gxD44DYxLIJ4jVWBchZ3AHi0iqFGwgcQmUif2feR78zMUMdq3vawf2taamq1hTxoKtre
         MrLXHqWHdv8GeDmISqT6IMNoZaB98YtHwlHEW+iaJYwTyvTrlni4Havi7KwTLmI0Zfa9
         U+bGcmNyHX+Lk8kARa9iJI8pNlea5HaGV8m+acwSL6yC1epB03Cq1D/TmvEll4EtpMye
         oiSw==
X-Gm-Message-State: AOJu0YxtsFlTJXuDXJo83zbx/8XS3Iw/zdT6by7OSU3OoB/+tTrVPJSf
	zELQw39eiQg/+b0rikOPdXluTj82trr22xcmBcLrdM7+lA2mEU+PAWBHpfhkzLZS
X-Gm-Gg: Acq92OEEOskkhcNfp5Ea4WnFSREtYicYH78ZkyFIo6PMWH18Ct72kR7ybxPkF0DqsIP
	fVM211UYv3xKbJAcjRo8ta0PUjEntTsku5PqUeDYvcQM+L1KeCMbVZZkWYkGpwzse9uPJQFYB8I
	L3Fu23oIWdLg0hyQFIQLTkTgQfZ6a3A5vNAz5wRD6LKvWWPj8Ca/bA8JCuf/mKSLcSIBjKNGWMX
	8ulVoUUG8A9OLuYCpRXuOOQw0+SLBdDqdrPwjSPrXC48uJENTPyFEsooGuIP80snf6Sa04bfHKS
	Ln9l8tLxdAh3XtLEvPAAutA6q9VpSjF3zufEk/uRrQKAM8LmspIQvnIFGN7cFhrxmHS3ReQQesh
	zy4cmE8fnlez59P9EWxaEMfLhJOzdsaLuDfMh2hCC8nJgSDggyFUYC0pTYTTZ+hx3ng92GwtRGY
	/Nzfe0tbEt7PMvv2+f/7GvaLfqy8YswtIpmkbO
X-Received: by 2002:a05:6a00:2e17:b0:82f:abc8:ae0 with SMTP id d2e1a72fcca58-8415f332af0mr5946237b3a.17.1779512504853;
        Fri, 22 May 2026 22:01:44 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ad2ca6sm3423107b3a.5.2026.05.22.22.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 22:01:44 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 22/25] dnsmasq: fix CVE-2026-5172
Date: Sat, 23 May 2026 17:00:24 +1200
Message-ID: <20260523050028.848327-22-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
References: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 May 2026 05:01:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127172

From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>

A buffer overflow in dnsmasq’s extract_addresses() function allows
an attacker to trigger a heap out-of-bounds read and crash by
exploiting a malformed DNS response, enabling extract_name()
to advance the pointer past the record’s end.

Reference:
[ https://nvd.nist.gov/vuln/detail/CVE-2026-5172 ]

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 44c8962f48a67fbe0fbc8fd830d2f51ae15541a4)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-support/dnsmasq/dnsmasq_2.92.bb   |  1 +
 .../dnsmasq/files/CVE-2026-5172.patch         | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-5172.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
index 4ae650f7e7..c19467aed9 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
            file://CVE-2026-4891.patch \
            file://CVE-2026-4892.patch \
            file://CVE-2026-4893.patch \
+           file://CVE-2026-5172.patch \
 "
 SRC_URI[sha256sum] = "fd908e79ff37f73234afcb6d3363f78353e768703d92abd8e3220ade6819b1e1"
 
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-5172.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-5172.patch
new file mode 100644
index 0000000000..ce6e0f464b
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-5172.patch
@@ -0,0 +1,34 @@
+commit fa3c8ddef6712b52f562813317e6a997e1210123
+Author: Simon Kelley <simon@thekelleys.org.uk>
+Date:   Mon Mar 30 16:24:33 2026 +0100
+
+Fix buffer overflow vulnerability in extract_addresses() CVE-2026-5172
+    
+Thanks to Hugo Martinez Ray for spotting this.
+    
+The value of rdlen for an RR can be a lie, allowing the
+call to extract_name() at rfc1025.c:952 to advance the value of p1
+past the calculated end of the record. The makes the calculation
+of bytes remaining in the RR underflow to a huge number and results
+in a massive heap OOB read and certain crash.
+
+CVE: CVE-2026-5172
+
+Upstream-Status: Backport [ https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=073082ddc0aba7b8efa15a688d6183463b65effa ]
+
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+
+diff --git a/src/rfc1035.c b/src/rfc1035.c
+index f0e1082..7e05fb5 100644
+--- a/src/rfc1035.c
++++ b/src/rfc1035.c
+@@ -943,7 +943,8 @@ int extract_addresses(struct dns_header *header, size_t qlen, char *name, time_t
+ 			      /* Name, extract it then re-encode. */
+ 			      int len;
+ 			      
+-			      if (!extract_name(header, qlen, &p1, name, EXTR_NAME_EXTRACT, 0))
++			      /* rdlen may lie, and extract_name() advances p1 past where it says the record ends. */
++			      if (!extract_name(header, qlen, &p1, name, EXTR_NAME_EXTRACT, 0) || (p1 > endrr))
+ 				{
+ 				  blockdata_free(addr.rrblock.rrdata);
+ 				  return 2;

