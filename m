Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6937.1794458691142027111
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 20:44:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=IurHVTXm;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso1952699a91.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 20:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458690; x=1795063490; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DJ8Sqp2Qy8v/2Tm+GlgAu/UL6bsjajOG1m6Q/zvsfgI=;
        b=IurHVTXmxC/S/fhIOzAvcEbn7mHviKxD4gSKVPaGaa3w64tES2/zqrwoKeMABRrtvl
         qU9L+UVLHHFZ0BNbTLEBoA2jsKXRgIy/gWIiJ44yF47GeRzRMohk97ZL9aEv1AwkLpUJ
         l6lmCEdCtmCfsC+lwoeR7hMQbziK/N2UbJlD2/1s1LcuetJeVaE7pw294OxTDEZ5pUxn
         Hiv7JLAvZVN7qmE9erdLa4v6HIjNJ9bLFaT8GiE9ZX5vAMcagUE6KmgzWDL2Kv/QEkzU
         YNzKbC7r1idmAHxOrSS1httZ+dObGs1pkZRkFxNdq1EFHDyZJe/B3Os8oHMEviyJeihs
         j1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458690; x=1795063490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DJ8Sqp2Qy8v/2Tm+GlgAu/UL6bsjajOG1m6Q/zvsfgI=;
        b=YRZEnr8S7ULhw4F9K7rMv4y7hzircyW37dmyFrrdWdKprq4sAOlsjphnU46gYqMs3T
         85U/q11kXk8sD3qGyab1uZfCOT1HIKVEkJXkGdS/cxF3LpSkXXINTJsyDV/Arpm5kB0n
         aCxrfZec8DLQdScOKPsmdOrW1yrH9tgN3q5g4RCRyQEFt3TbULDN+0c/y4pNYMVE3MZB
         fP0Cccrt0M7vFZ1qUxBYeQexsaAa+kqAFX6N2SYljCk0IRHjY3+dBdwt/3PwDLXjuqA2
         afgTKPUBKdqSCw8y8qwKjwk7+YLnRW/FutbGgRz2+A418jLf3EVQW5sc4i3aFt7a1U6H
         bRDw==
X-Gm-Message-State: APuU4Z95QEpn+txS9mbiKFewT0hMt+gy+PP0NWoH5jyLPkr86U8g1yZh
	gRUAoNff0UAGdckvfeu0OVeX7JxfQ5lS0MaXmlSVPEvSl9Zhue2UospQdxrv7g==
X-Gm-Gg: AYBFou1C5R8PwQUVr7Bb6jYTfYE4m3B5fzCCJbtioL01byFnLVByhW5l9IZk30Z2oQJ
	T3XpraBo0ZSu46TatYEK6/07vglMEzGjnbrNs/m8u24orQs0AGw65hpcAAxJVwz9PWtY/8mIpBQ
	hhKwh0Ij9pMA9QlJdXlJbhjEddmmEEUZ6f5TaX5gEDwGbP6bSg44FPuR/JX0q9wU+1HqOouCVcZ
	rl4v/ldtL8O1dBuaeTaOcCeeqXtJogR0KJ9E4130uBiFIC3NipSHJ0ZWk0e8XfckCTFvJ5eZtiQ
	IcQ6TN5KukEIghiyb50eYfcbI1YIar/D4Uq5sPX83RRQ4nQv9kvyi5E0NS4QNfY0LMu/wBsp87E
	pxxvaBAIS1hMbWqPcPoWrcdnqdhpsW/HuZXfGsyUMCf0R0p+gDfa1pfTOW8fkrC42ClncyBuHyw
	bo4eirMc3xiJ5F8TdWlo9DeCna/4+zzs5uQrAew6Rz3+kPWkUWYfLED4Izv13dFa8uJyAY7xVjS
	V/hPD1S4bc1Snrmxnobk5aNMjf0WmYuAjpCPbVnZpjNZ5eLe+9DsXn6sYC+eKZ4xTL+Nm2A2+hc
	aNAEIwH1PsGk6KiJp7Fjc3B4hlu2K8VvOPo32GhX/6V6eD/UeJL0Ff9qR1jX4EFEKz8PdvTm6+M
	CQIVKNyE=
X-Received: by 2002:a17:90b:3c44:b0:3b0:97b8:d6bc with SMTP id 98e67ed59e1d1-3b182ec221dmr4080622a91.16.1794458690245;
        Wed, 11 Nov 2026 20:44:50 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d7dd5bbsm2238527a12.30.2026.11.11.20.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:44:49 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][blacksail][PATCH 7/16] tinyproxy: patch CVE-2026-125371
Date: Thu, 12 Nov 2026 17:44:17 +1300
Message-ID: <20261112044426.3933391-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112044426.3933391-1-ankur.tyagi85@gmail.com>
References: <20261112044426.3933391-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 04:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132158
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-125371

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tinyproxy/tinyproxy/CVE-2026-125371.patch | 70 +++++++++++++++++++
 .../tinyproxy/tinyproxy_1.11.3.bb             |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-125371.patch

diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-125371.patch b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-125371.patch
new file mode 100644
index 0000000000..7a86af207c
--- /dev/null
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-125371.patch
@@ -0,0 +1,70 @@
+From 8c8463fb1a0bf7db82d3dfc6f363d5b339e96cd3 Mon Sep 17 00:00:00 2001
+From: rofl0r <rofl0r@users.noreply.github.com>
+Date: Tue, 15 Sep 2026 06:42:05 +0000
+Subject: [PATCH] acl: use hostspec parser to disallow suffix hostname matches
+
+the existing ad-hoc parsing in acl.c allowed an attacker to
+use e.g. an "untrusted.net" domain name to access a reachable
+tinyproxy instance if it had an allow list entry for "trusted.net".
+
+exploiting it would require that the attacker has prior knowledge
+of the instance's configuration or is damn good at guessing and
+well-budgeted to register lots of potentially matching domains.
+
+fix by re-using the existing hardened hostspec parser.
+
+closes #627
+
+(cherry picked from commit 3991ac8f98c6a9f05b3265018b812dbf2ca92c28)
+CVE: CVE-2026-125371
+Upstream-Status: Backport [https://github.com/tinyproxy/tinyproxy/commit/3991ac8f98c6a9f05b3265018b812dbf2ca92c28]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/acl.c | 25 +++++++++----------------
+ 1 file changed, 9 insertions(+), 16 deletions(-)
+
+diff --git a/src/acl.c b/src/acl.c
+index 2d141ba..db526db 100644
+--- a/src/acl.c
++++ b/src/acl.c
+@@ -105,7 +105,6 @@ acl_string_processing (struct acl_s *acl, const char *ip_address,
+ {
+         int match;
+         struct addrinfo hints, *res, *ressave;
+-        size_t test_length, match_length;
+         char ipbuf[512];
+ 
+         assert (acl && acl->h.type == HST_STRING);
+@@ -153,23 +152,17 @@ STRING_TEST:
+                         return -1;
+         }
+ 
+-        test_length = strlen (string_addr);
+-        match_length = strlen (acl->h.address.string);
+-
+         /*
+-         * If the string length is shorter than AC string, return a -1 so
+-         * that the "driver" will skip onto the next control in the list.
++         * compare the reverse-resolved client hostname against the ACL
++         * entry, using the shared hostspec matcher so that hostname
++         * entries are matched at label boundaries: plain entries match
++         * the whole hostname exactly, and leading-dot entries match the
++         * apex host plus every subdomain below it. This prevents
++         * suffix-collision bypasses, e.g. "Allow trusted.net" must not
++         * admit "untrusted.net" (GH issue #627).
+          */
+-        if (test_length < match_length)
+-                return -1;
+-
+-        if (strcasecmp
+-            (string_addr + (test_length - match_length),
+-             acl->h.address.string) == 0) {
+-                if (acl->access == ACL_DENY)
+-                        return 0;
+-                else
+-                        return 1;
++        if (hostspec_match (string_addr, &acl->h) != 0) {
++                return acl->access != ACL_DENY;
+         }
+ 
+         /* Indicate that no tests succeeded, so skip to next control. */
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
index 46d3a4d7c6..86e7e906b1 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
            file://CVE-2026-54387.patch \
            file://CVE-2026-55202.patch \
            file://CVE-2026-54388.patch \
+           file://CVE-2026-125371.patch \
            "
 
 SRC_URI[sha256sum] = "9bcf46db1a2375ff3e3d27a41982f1efec4706cce8899ff9f33323a8218f7592"
