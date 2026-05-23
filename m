Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2045CD5BB1
	for <webhook@archiver.kernel.org>; Sat, 23 May 2026 05:01:32 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3041.1779512489430071409
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2026 22:01:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FSQUo1aG;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82f9fdfc965so3797491b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2026 22:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779512489; x=1780117289; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gevzZ4kP2OxDYNJZXgY27d4xdIcVoqWdrhVvbhcEnQA=;
        b=FSQUo1aGmhva8OG3ZfXf/xecC0gYcqxMSD6pM5qDQpKDi8pApfGty9JCpznB5y5sV0
         cxgqvdaGPpxmwMvgYYuCTyOzcqChV9SMSMdwy6qAI/PXN5Su74GENQUG9sewMMqDxu5v
         JeIwtzHlqGbjDZXaZcZ/TJ1hkRjCw55SXLKHQaOsFR4rPxh/7m9UM2nvGNcW78aRC5R0
         7rcCjR5Rz5aw0EZB8JGC7ojQVPpy4qAxC+JAzR/nA6CYTo63X/fo2k7ik3ekyKEfTfj8
         yw2yuVIF0Stsa7JY4SxyV3sPR21GyIDpdQ3tnHYTuB05NawVD17sjoDdVwYkZInjW7I7
         SJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779512489; x=1780117289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gevzZ4kP2OxDYNJZXgY27d4xdIcVoqWdrhVvbhcEnQA=;
        b=faz4Ff1td9e7pwWPb7S0eox4XobwKGSNOQtA19uzwZLvK4EJ+rthlflZG4a0Fr9rSj
         BG6FPH/R9skxWb/ZEcNfnFkw+CnSKDEdIv0Ioh7UGUupjDjkLJR6tF1jSvhTRszuhlKR
         pCVugIVRpRaX/eJugKNUKl7tq+gGqRSWEalnGCztgfQeTV1QnClzugdGvfgd6HVaC5Hn
         r8RDscNlbLZ2Uu0FCsIirX1SxbX4N/4XSaynPCmDCIRk6eBdltAK0nm6PXsyTn/Dg81Y
         Ib+Iih77TQBscMxQvDRZOLzDD/Gb4ZKRXjKy5oJGs6KWYaUSDiQTOYnafP2KF07evTkz
         wrnQ==
X-Gm-Message-State: AOJu0YxTj7gMPlte3Joy+1lb85rcXEVT/A77vTXtcrYytHfLwxwrHxbw
	NGAQEuzaHNHkUgSSAeMwLsOsAkHSCcXqxBAleZLCMto3MubTf3mtf0HrbWeTKdbK
X-Gm-Gg: Acq92OGD4bFaf0byhrh+wUglFqCLrn8kVjM/7cp2xqsXzuE/2a8iBEHWLncahKeFeJN
	KMcV++DlcDeb6/mhAA3SgpL+c0ZZUt1v2tIuzGZF1RvZLkhUqlVyYupsfuiTvgpMJafNtY1SpAW
	FotxY+1zVvPsl30GYMTiX2aq+nOAyEzoQmAAWeumL6UKT5igWlxHTo51aH5WtBns29J0VhNIryM
	K8SIixrarrR/hIfxE6zYRSaboEAJV9owJDG9HK2tNiJTtYqn4qtIADPSU0P4uJF9MYU8N+pdS2x
	6brXOTiK6Iv/0Y098n7RShjpXBiSDmI6MztlFORf77RvdD04pZ7B1SDLAJeuMTnZY+CbcmExlXu
	ezwwYG73vlzTWZBLbwPUO/QQvarnhZe4zeQzlExFv2PXwJaU1AQ0pkHZP0i3ED34KTfLCw1CBEa
	nt7a2+3WmfKVPLZ67sYqauFfxMg4lKVs+vF226
X-Received: by 2002:a05:6a00:8c6:b0:838:af72:fb27 with SMTP id d2e1a72fcca58-8415f0f02bfmr6584436b3a.9.1779512488789;
        Fri, 22 May 2026 22:01:28 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ad2ca6sm3423107b3a.5.2026.05.22.22.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 22:01:27 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 17/25] dnsmasq: fix CVE-2026-2291
Date: Sat, 23 May 2026 17:00:19 +1200
Message-ID: <20260523050028.848327-17-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
References: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 May 2026 05:01:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127167

From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>

dnsmasqs extract_name() function can be abused to cause a heap buffer
overflow, allowing an attacker to inject false DNS cache entries,
which could result in DNS lookups to redirect to an attacker-controlled
IP address, or to cause a DoS.

Reference:
[ https://nvd.nist.gov/vuln/detail/CVE-2026-2291 ]

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit a53328688a239e97b8383ffbfd7b4b4eca108d73)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-support/dnsmasq/dnsmasq_2.92.bb   |  1 +
 .../dnsmasq/files/CVE-2026-2291.patch         | 37 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-2291.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
index 59509ecba2..bef058aa3e 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
            file://dnsmasq-resolvconf.service \
            file://dnsmasq-noresolvconf.service \
            file://dnsmasq-resolved.conf \
+           file://CVE-2026-2291.patch \
 "
 SRC_URI[sha256sum] = "fd908e79ff37f73234afcb6d3363f78353e768703d92abd8e3220ade6819b1e1"
 
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-2291.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-2291.patch
new file mode 100644
index 0000000000..6e42f32136
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-2291.patch
@@ -0,0 +1,37 @@
+commit ec2fbfbbdaa7d7db1c707dce26ce1a37cfe09660
+Author: Simon Kelley <simon@thekelleys.org.uk>
+Date:   Fri Apr 10 16:29:31 2026 +0100
+
+Fix buffer overflow in struct bigname.  CVE-2026-2291
+
+All buffers capable of holding a domain name should be
+at least MAXDNAME*2 + 1 bytes long, where MAXDNAME is the maximum
+size of a domain name. The accounts for the trailing zero and the
+fact that some characters are escaped in the internal representation
+of a domain name in dnsmasq.
+
+The declaration of struct bigname get this wrong, with the effect
+that a remote attacker capable of asking DNS queries or answering DNS
+queries can cause a large OOB write in the heap.
+
+This was first spotted by Andrew S. Fasano.
+
+CVE: CVE-2026-2291
+
+Upstream-Status: Backport [ https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=014e909f787e808bb35daa546d3f8f3663918de2 ] 
+
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+
+diff --git a/src/dnsmasq.h b/src/dnsmasq.h
+index 254bacd..58be09f 100644
+--- a/src/dnsmasq.h
++++ b/src/dnsmasq.h
+@@ -479,7 +479,7 @@ struct interface_name {
+ };
+
+ union bigname {
+-  char name[MAXDNAME];
++  char name[(2*MAXDNAME) + 1];
+   union bigname *next; /* freelist */
+ };
+

