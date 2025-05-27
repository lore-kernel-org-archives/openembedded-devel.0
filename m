Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0563C54ED1
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 13:28:29 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.51862.1748352506102178501
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 May 2025 06:28:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GYwY7Kyi;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a36e090102so1885872f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 May 2025 06:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748352504; x=1748957304; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PdqcOXVtfLQfqyyAVYROHvSL+xNO6PeEh5OeTmLuwzA=;
        b=GYwY7KyiV40JEr/IhuCPLnN1d7C+QGEgDmojLk37V1FX+rvwoK/p4AsLcO5zots9mT
         D0KZwXpheY9iEEhmzl/Xh808iuFLa/0/xKiDyRJ4qmblvuTKA1lZf+RgxNVBushBQ6hW
         EcXnar+JwtwMoH2LZ4kGtcySPJZa9fy/jZAbbotT+N7tPlJxa8nc+X5qoIb6awjPJORE
         kjAlGwRNk4w38F0eH+ZPSa35yUjBrSuiMG29bje88p42fW1Jpm5M+3iM3DzK6qAtTdg6
         mTGt/QhjY91tJxyRAUM4xf/Rq9FDj/rmwoyKvHgBpuo02OcKhKFCGzeUA79AQu7n8QW8
         uMJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748352504; x=1748957304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PdqcOXVtfLQfqyyAVYROHvSL+xNO6PeEh5OeTmLuwzA=;
        b=rEF7Skf0hSRfjveexXTFOFjomP1vrwsbqRq2ZfT/mqc51V1HRjcLBVsRtnmjYIlVIU
         XbxKANBgSWs0xpeJvTLdDxbmWvyYVY7bVUi+WIFSK515sH6Bom6DrHSSVTR2+7DA5BP5
         WUCcduPOU3P2QRAfwAlpE60LaAxShcm1fWUwXdc7OC1rUtckvGJnSWnSkOclU7NvKUAU
         IGgJdSIPNhZx9vcorMJ7s3gA4b0C4qgOcr9M9oNBILTejjKblcpDnumVE9CLadiV49xr
         X3nL/OZ4qEQ+NSk8YIzZrXWgZfnp03R30c332Pazgu63xoPSIUMFJv6ihA7J/jlYvAXQ
         MJyg==
X-Gm-Message-State: AOJu0YyRUwHMl9ysIvjBS2rOH1ojySkm+vCW4O0DQbPp7c1WFn799HnZ
	3l4GvrN4ijT5XhXjSEo5lZM09SCY2bA/cIvX4KodvwkkwOS/u40dfSjobwaxEGui
X-Gm-Gg: ASbGncu2HLXuHJWHX27drIlHN+d9vUKyTfDcHj0xkV6OZFFulFDjPrD8icR9IPrHo+A
	Et1joIbnlNnEf+sBxRzj5nwDO2fxQQxkyVU90khK13lmMRtnEzT1Wv6KYlB+JXAu1AyMFsxU5nM
	xN65A0tRcH3bdYza8rTTlCNjFiUE8wmX73Sm6BH3TAzMWtuEBuCtxhPuth/H1w6d/2Y09ozOSAs
	kgyzFusxLp5vvb7J1H1aK0iHqAABDvaE09Rr4jPfgZNI0eT6etFucupaFlBbujDGHp1++1TPCgA
	p0Vpuyjh4CKlaaAPXfq1jDxSRXFnsj8iPdD0FnC01mzd4nsnXSS5tpGu48Is99PG5vBLE1H58ic
	HM0vmspobSaVohz2yNNs=
X-Google-Smtp-Source: AGHT+IFQVuDnw58bkvkvojz4IIFETNn+oZAxfNwQRH5d2DmbkJVC3rISRH5eWiAofFopdjKpQp4EWA==
X-Received: by 2002:a05:6000:1786:b0:3a4:db94:76f9 with SMTP id ffacd0b85a97d-3a4db9478c1mr5959618f8f.38.1748352503864;
        Tue, 27 May 2025 06:28:23 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4cd0cf5ccsm10271358f8f.8.2025.05.27.06.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 06:28:23 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH] mdns: Upgrade 2600.100.147 -> 2600.120.12
Date: Tue, 27 May 2025 13:27:59 +0000
Message-ID: <20250527132759.626007-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 May 2025 13:28:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117636

Drop redundant limit declaration patch. Swap issetugid()/getenv() call for
secure_getenv() on Linux.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../0001-Use-secure_getenv-on-Linux.patch     | 30 ++++++++++++
 .../0005-Fix-missing-limit-declarations.patch | 49 -------------------
 ...ns_2600.100.147.bb => mdns_2600.120.12.bb} |  6 +--
 3 files changed, 33 insertions(+), 52 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/mdns/mdns/0001-Use-secure_getenv-on-Linux.patch
 delete mode 100644 meta-networking/recipes-protocols/mdns/mdns/0005-Fix-missing-limit-declarations.patch
 rename meta-networking/recipes-protocols/mdns/{mdns_2600.100.147.bb => mdns_2600.120.12.bb} (97%)

diff --git a/meta-networking/recipes-protocols/mdns/mdns/0001-Use-secure_getenv-on-Linux.patch b/meta-networking/recipes-protocols/mdns/mdns/0001-Use-secure_getenv-on-Linux.patch
new file mode 100644
index 000000000000..242aa7f7d819
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/mdns/0001-Use-secure_getenv-on-Linux.patch
@@ -0,0 +1,30 @@
+From 1bf3be6cd775635aed95689f97a13fa6a037c741 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Tue, 27 May 2025 13:33:30 +0100
+Subject: [PATCH] Use secure_getenv on Linux
+
+Upstream-Status: Inactive-Upstream [Upstream does not take patches]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ mDNSShared/dnssd_clientstub.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/mDNSShared/dnssd_clientstub.c b/mDNSShared/dnssd_clientstub.c
+index 6667276ee33a..e7b51813664e 100644
+--- a/mDNSShared/dnssd_clientstub.c
++++ b/mDNSShared/dnssd_clientstub.c
+@@ -801,10 +801,14 @@ static DNSServiceErrorType ConnectToServer(DNSServiceRef *ref, DNSServiceFlags f
+         #endif
+         #ifndef USE_TCP_LOOPBACK
+         char* uds_serverpath = NULL;
++#ifdef TARGET_OS_LINUX
++        uds_serverpath = secure_getenv(MDNS_UDS_SERVERPATH_ENVVAR);
++#else
+         if (!issetugid())
+         {
+             uds_serverpath = getenv(MDNS_UDS_SERVERPATH_ENVVAR);
+         }
++#endif
+         if (uds_serverpath == NULL)
+             uds_serverpath = MDNS_UDS_SERVERPATH;
+         else if (strlen(uds_serverpath) >= MAX_CTLPATH)
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0005-Fix-missing-limit-declarations.patch b/meta-networking/recipes-protocols/mdns/mdns/0005-Fix-missing-limit-declarations.patch
deleted file mode 100644
index 41b8985e27fb..000000000000
--- a/meta-networking/recipes-protocols/mdns/mdns/0005-Fix-missing-limit-declarations.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 34285024531adbbc7b67506c9fc2e60f3b36b73b Mon Sep 17 00:00:00 2001
-From: Alex Kiernan <alexk@zuma.ai>
-Date: Sat, 26 Oct 2024 13:26:09 +0000
-Subject: [PATCH] Fix missing `limit` declarations
-
-`put_attribute_tlvs` needs a limit setting which is missing, add it in.
-
-Upstream-Status: Inactive-Upstream [Upstream does not take patches]
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- mDNSShared/dnssd_clientstub.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/mDNSShared/dnssd_clientstub.c b/mDNSShared/dnssd_clientstub.c
-index 89cb90d947c7..316fc49ab078 100644
---- a/mDNSShared/dnssd_clientstub.c
-+++ b/mDNSShared/dnssd_clientstub.c
-@@ -2026,6 +2026,7 @@ DNSServiceErrorType DNSServiceRegisterInternal
-     ipc_msg_hdr *hdr;
-     DNSServiceErrorType err;
-     union { uint16_t s; u_char b[2]; } port = { portInNetworkByteOrder };
-+    const uint8_t *limit;
-     (void)attr;
- 
-     if (!sdRef || !regtype) return kDNSServiceErr_BadParam;
-@@ -2050,6 +2051,7 @@ DNSServiceErrorType DNSServiceRegisterInternal
-     if (!hdr) { DNSServiceRefDeallocate(*sdRef); *sdRef = NULL; return kDNSServiceErr_NoMemory; }
-     if (!callBack) hdr->ipc_flags |= IPC_FLAGS_NOREPLY;
- 
-+    limit = ptr + len;
-     put_flags(flags, &ptr);
-     put_uint32(interfaceIndex, &ptr);
-     put_string(name, &ptr);
-@@ -2326,6 +2328,7 @@ DNSServiceErrorType DNSServiceRegisterRecordInternal
-     ipc_msg_hdr *hdr = NULL;
-     DNSRecordRef rref = NULL;
-     DNSRecord **p;
-+    const uint8_t *limit;
-     (void)attr;
- 
-     // Verify that only one of the following flags is set.
-@@ -2375,6 +2378,7 @@ DNSServiceErrorType DNSServiceRegisterRecordInternal
-     hdr = create_hdr(reg_record_request, &len, &ptr, !(flags & kDNSServiceFlagsQueueRequest), sdRef);
-     if (!hdr) return kDNSServiceErr_NoMemory;
- 
-+    limit = ptr + len;
-     put_flags(flags, &ptr);
-     put_uint32(interfaceIndex, &ptr);
-     put_string(fullname, &ptr);
diff --git a/meta-networking/recipes-protocols/mdns/mdns_2600.100.147.bb b/meta-networking/recipes-protocols/mdns/mdns_2600.120.12.bb
similarity index 97%
rename from meta-networking/recipes-protocols/mdns/mdns_2600.100.147.bb
rename to meta-networking/recipes-protocols/mdns/mdns_2600.120.12.bb
index af1400ca6e00..b6efa528d4f6 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_2600.100.147.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_2600.120.12.bb
@@ -13,12 +13,12 @@ SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https
            file://0005-mDNSCore-Fix-broken-debug-parameter.patch \
            file://0006-make-Add-top-level-Makefile.patch \
            file://0009-remove-unneeded-headers.patch \
-           file://0005-Fix-missing-limit-declarations.patch \
            file://0001-Fix-build-with-gcc-15.patch \
+           file://0001-Use-secure_getenv-on-Linux.patch \
            file://mdns.service \
            "
-BRANCH = "main"
-SRCREV = "d89f8d1d0e001b810d6c055aa2a57b768bcf9aa2"
+BRANCH = "rel/mDNSResponder-2600"
+SRCREV = "3a0deda2995d98243dae379bcec10e57928c15e8"
 
 # We install a stub Makefile in the top directory so that the various checks
 # in base.bbclass pass their tests for a Makefile, this ensures (that amongst

