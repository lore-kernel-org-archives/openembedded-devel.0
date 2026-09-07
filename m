Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51BC4C79FA7
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:24:19 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31698.1788776653370998169
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:24:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=p8d7sNhu;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7f5934ba2a5so1549490a34.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 03:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788776652; x=1789381452; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YzUPCJGl8VVhvS2IZ8pL5vSs7MKpPAZ+94Fe2R7yqSs=;
        b=p8d7sNhu1QN1Xug8ErSh0QjPZG4EpcoczdHHy5opm+7lAt92Up7eoJBrYuOYgktWLy
         yJTEaEYcSVYAPUCz2o9vYmRtYIXUZECXg92yIX6r1ncBM+OiO2nrJSAW1K0CLqonYrY8
         clIVNQpHWHmxg++7KCQ+6xgJ5mBCe1Mwz9nIkaPWm3BFNb0vrnXG5o+cJCm52pbcPrzM
         i6zz3pNrg+LQCR4X3lA9StwthwY/U++XZoUScwOUzOyERaUJ4sMWQraDi+xtGJaxnpGQ
         lDz6s7NLIlAiik/DBFlHRyXFiCoC855rh/4T+J5SVbzJhmvGLMZhWoy8ozMq2SW+FRxg
         NFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776652; x=1789381452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YzUPCJGl8VVhvS2IZ8pL5vSs7MKpPAZ+94Fe2R7yqSs=;
        b=tBtJBE2RNU2QPWprJDmEG2wsWtEe8zwVc4e+90rswA2T4Hk54rHduBpA1bPqwY4VlJ
         s3OWzff16ZQ28ifK2rGVBhlJeWCOEltw/zlgtXNJPnnJXkUufipsHj/UQWvhEjck/4w6
         XA6QH0FD1uZtltkbwDZKDT7MCq0u6ML8692OUmJ3xmPX9q6fyjnSAkFLG4pCREpMjS+7
         8OMXrqunG6hZAqDMI87yxznckRCaQk9+b+8DoaPMLvdKYllcXRyTbXFGQJEhp0iuvk7W
         OP+wgfBeYS5yij/KkBx+iu5r448AsaZdD28nss95sBnWKo+nXQ+uOfJAfH20Sdon6l0N
         YnRA==
X-Gm-Message-State: AFuF++mQgcdl3Bahtfw5rsIgiBXNy8utq54/pqsHgOHPWcS4NKh+rL2h
	qALUbzia38d4BwRodKru37fGeOySh6bSAYrtCov+1cO80818pdDuNyWTzRWNqB5Y
X-Gm-Gg: AYBFou0cc8Fd2kE2NBMYWs7r7lL6jPIMzstJkmRSnHbhuiZ48abT2UCLDv0dyKX6dw4
	Vkhe1NU1MiS5I1FkStXRUJnqtV0Ku4q8kpdwJTCqiLg/9jfLulxVe2JM9Zzy/XAuhLklMoahtN6
	HqZ3uTQqpe4U32CS+t66GrfFI6IMGLdasIrKZjgs4plktgbYLug0mypcxWQgmss9ZD3K9Y6UvLe
	GvefeD9GTn/pQWlu97zVNeHKX6Sqv2YlmhnFPJwotyGNjPsn1RpiB+lUBiJ3BjeoUcOXlHWkBbW
	netyuSnn5YgcJ64ATdITlsbW2sYOZybFncmr3xrMWeUYSGEYO22py4/xfNEtlIi1P8FdeKffv6E
	txWmJdXVmWjRHitnLAmI4SvIedOLp7nFozB5QT1hbEZZdyp0MSzfhS41q8UQwHPNCXiudielPqX
	8fR470QmC8lS0RoGYBr0z1k8Bue4Sb278qOA4UkiLnN8diRpktAnay94eUfzwca1mMLu0eiUqX
X-Received: by 2002:a05:6820:184a:b0:6b7:8396:f3d7 with SMTP id 006d021491bc7-6b78396f903mr8970748eaf.57.1788776652109;
        Mon, 07 Sep 2026 03:24:12 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm30215104c88.15.2026.09.07.03.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:24:11 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 16/33] open62541: patch CVE-2026-11946
Date: Mon,  7 Sep 2026 22:23:00 +1200
Message-ID: <20260907102318.2459883-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
References: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:24:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129828

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit identified by Debian[1]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-11946

[1]https://security-tracker.debian.org/tracker/CVE-2026-11946

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../opcua/open62541/CVE-2026-11946.patch      | 48 +++++++++++++++++++
 .../opcua/open62541_1.4.16.bb                 |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/opcua/open62541/CVE-2026-11946.patch

diff --git a/meta-networking/recipes-protocols/opcua/open62541/CVE-2026-11946.patch b/meta-networking/recipes-protocols/opcua/open62541/CVE-2026-11946.patch
new file mode 100644
index 0000000000..36c9c83af1
--- /dev/null
+++ b/meta-networking/recipes-protocols/opcua/open62541/CVE-2026-11946.patch
@@ -0,0 +1,48 @@
+From 47df558c02eef86bec125a54284b78563d1928b8 Mon Sep 17 00:00:00 2001
+From: Niels Beier <niels.beier@o6-automation.com>
+Date: Thu, 7 May 2026 15:25:30 +0200
+Subject: [PATCH] fix(server): Enforce default message and chunk size limits to
+ prevent DoS
+
+When tcpMaxMsgSize or tcpMaxChunks are configured as 0, the server treats the
+limit as truly unbounded. A remote attacker can exploit this by sending
+arbitrarily large messages or an unbounded number of chunks, exhausting server
+memory and causing a denial of service.
+
+Set safe defaults (512 MB per message, 16384 chunks) whenever the configured
+value is zero, mirroring the existing behaviour for recv/sendBufferSize.
+
+This commit mitigates a vulnerability reported by Lorenzo Cannella.
+
+Internal Vulnerability Advisory: open62541-SA-2026-0002
+
+(cherry picked from commit c9563e8ea4a8db2f64059c8ff7efe0b49a35bea3)
+
+CVE: CVE-2026-11946
+Upstream-Status: Backport [https://github.com/open62541/open62541/commit/c9563e8ea4a8db2f64059c8ff7efe0b49a35bea3]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/server/ua_server_binary.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/src/server/ua_server_binary.c b/src/server/ua_server_binary.c
+index b2de3b271..13859ce56 100644
+--- a/src/server/ua_server_binary.c
++++ b/src/server/ua_server_binary.c
+@@ -1114,6 +1114,15 @@ createServerSecureChannel(UA_BinaryProtocolManager *bpm, UA_ConnectionManager *c
+     if(connConfig.sendBufferSize == 0)
+         connConfig.sendBufferSize = 1 << 16; /* 64kB */
+ 
++    if(connConfig.localMaxMessageSize == 0)
++        connConfig.localMaxMessageSize = 1 << 29; /* 512 MB */
++    if(connConfig.remoteMaxMessageSize == 0)
++        connConfig.remoteMaxMessageSize = 1 << 29; /* 512 MB */
++    if(connConfig.localMaxChunkCount == 0)
++        connConfig.localMaxChunkCount = 1 << 14; /* 16384 */
++    if(connConfig.remoteMaxChunkCount == 0)
++        connConfig.remoteMaxChunkCount = 1 << 14; /* 16384 */
++
+     /* Set up the new SecureChannel */
+     UA_SecureChannel_init(&entry->channel);
+     entry->channel.config = connConfig;
diff --git a/meta-networking/recipes-protocols/opcua/open62541_1.4.16.bb b/meta-networking/recipes-protocols/opcua/open62541_1.4.16.bb
index 32f7148f4b..b9edc5fe30 100644
--- a/meta-networking/recipes-protocols/opcua/open62541_1.4.16.bb
+++ b/meta-networking/recipes-protocols/opcua/open62541_1.4.16.bb
@@ -18,6 +18,7 @@ SRC_URI = " \
     git://github.com/Pro/mdnsd.git;name=mdnsd;protocol=https;branch=master;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/deps/mdnsd \
     git://github.com/OPCFoundation/UA-Nodeset;name=ua-nodeset;protocol=https;branch=latest;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/deps/ua-nodeset \
     git://github.com/LiamBindle/MQTT-C.git;name=mqtt-c;protocol=https;branch=master;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/deps/mqtt-c \
+    file://CVE-2026-11946.patch \
 "
 
 

