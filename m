Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36754C98312
	for <webhook@archiver.kernel.org>; Sat, 17 Jan 2026 06:37:18 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3939.1768629410655946812
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Jan 2026 21:56:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MBJjny7O;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: jackson.james9803@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a0ac29fca1so17302575ad.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jan 2026 21:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768629410; x=1769234210; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wwTWl7lYpc5iPTO8lMG7SGgLEKwLXDcDBs9gNZQCOLc=;
        b=MBJjny7OI3MFIGcbXJVPpDVkIkuaKnYgI1fV7DQTGHiZaVHuJW5PlsWNMU1/FpMRtp
         TrJ4OfTfHSaoAGfs5g3zfvTww8mX9RHR6pLcmj3FuGELNgRyNv3ppiFldwbwrmRLQcD7
         EGc/U5qn8WY+LEAymur7QnPJtjsDJsZc+DbsxVAGMA0H1o5pibRm/NdV+XWsSTuCRypw
         agndgXz1vciWsQl43BgyBBLbnjUjM43bK7nQQYUw0NyLtlPcwwXDykCO/yOjz9lxLbP2
         jPiSDBxtERujfyg5jnjwihD6Qrtc2tsaWkvPMpK4FbKz8uqOc/K2e0jVd8FrZDi8hTPG
         aKjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768629410; x=1769234210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wwTWl7lYpc5iPTO8lMG7SGgLEKwLXDcDBs9gNZQCOLc=;
        b=gJClkbqr03mxZiuHgK1izweP62YWe4ENEBlwglzk4glnKyylsmXljXvjMt7cIKGDOO
         a1NDkCn//LsCXzlSiY8ayvizHFrFLpULGz8BzURckTyJABCuVcMAXsSpqwmeprJ9VUMR
         jkN4aNbrusJXiL5W0eBpxza5d175vjA4o9teLreltlLWrqausmNM5Z4tFDhVJlL7eDHK
         hdRohFT4FiWu5GsOv6qLlYMpjPDCG4rLJx2/TY4HfC8QvmZUIUKmWmS+AWzksR33W+5M
         SgtKSvHTJvWgOkNIu7I6Tjz/iMvvbDTWrKszjNKANikqqZRvU7qmc5J2tg8Rx8WiwoH4
         j7vA==
X-Gm-Message-State: AOJu0YwDe2WWPUGmaI0iY6DW6UnWp3UGTvWMpnDnz7zNp6QwMPU0KgGL
	VGXpDaNj0wM5XGfjiBO3rBt7vz3OZ2Dpybs8I7gEgQiwr7fgGrVi6SGhTcADlyZH
X-Gm-Gg: AY/fxX5ffFopYazyBY16oQYNVs1BYKBzGyRbhg3p9bBLQkYUj2Q5sza8OCfJnbnSfCR
	L1YnOLka3j6pVW8E9LEqxyGLYOZluPj1RpWqhO4UV498x5QPFTIcq4PwkJv/GVQVR4BHm/iLUdc
	ltuDZnJc0aq1RePBeRSfogbi3be5THlL0UKbw469MhV5FBh10BjA4mW2UiwflmkF5AnQE1KI62s
	iOIp78yO7vHh5MZlh9Ac00P1iekUqVpDwaZ6uRamj8ecU2f5GdqZmA3sbIk/ub0im4wIXk2EV8g
	t1U1nBEdonHARjirkQXbgNA8mSTpbdFpgJTMRUBJH3RGqzQO4i9Jvos5wv9EH2lv6REYz2DbRTt
	r/YWVovprRs4nm6n5hCXtizRo1IE7iunQJTNnN99FKG+a1QD+h2NHDEfG7zNBMeJ+W596EHEm15
	RPbnH0+0noRkO8zvw=
X-Received: by 2002:a17:903:f90:b0:2a0:de4f:c99 with SMTP id d9443c01a7336-2a7174f7f88mr44938135ad.9.1768629409569;
        Fri, 16 Jan 2026 21:56:49 -0800 (PST)
Received: from LL-868L.kpit.com ([49.206.128.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190ce415sm37281535ad.35.2026.01.16.21.56.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 21:56:49 -0800 (PST)
From: Jackson <jackson.james9803@gmail.com>
X-Google-Original-From: Jackson <jacksonj2@kpit.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH] tcpreplay 4.4.4: Fix CVE-2025-9384
Date: Sat, 17 Jan 2026 11:26:25 +0530
Message-Id: <20260117055625.2658058-1-jacksonj2@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 06:37:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123542

There is a NULL Pointer Dereference in ports2PORT when the user passes ill-formatted
portmap string to tcprewrite with option -r or --portmap

Upstream Repository: https://github.com/appneta/tcpreplay.git

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2025-9384
CVE: CVE-2025-9384

Signed-off-by: Jackson <jacksonj2@kpit.com>
---
 .../tcpreplay/tcpreplay/CVE-2025-9384.patch   | 38 +++++++++++++++++++
 .../tcpreplay/tcpreplay_4.4.4.bb              |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-9384.patch

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-9384.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-9384.patch
new file mode 100644
index 0000000000..a1c19d6f07
--- /dev/null
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-9384.patch
@@ -0,0 +1,38 @@
+From 5c12534cdb3c360fb8ec1a8d83ec64449bc9e41d Mon Sep 17 00:00:00 2001
+From: Jackson <jacksonj2@kpit.com>
+Date: Mon, 12 Jan 2026 00:32:07 +0530
+Subject: [PATCH] CVE-2025-9384: Bug #894 stop on --portmap syntax error
+
+src/tcprewrite -r 1:2 -i ping.pcap -c ping.cache -o out.pcap
+src/tcprewrite -r 1-:2 -i ping.pcap -c ping.cache -o out.pcap
+
+Fatal Error in ../../src/tcprewrite.c:main() line 86:
+Unable to parse args: From ../../../src/tcpedit/parse_args.c:tcpedit_post_args() line 189:
+Unable to parse --portmap=1-:2
+
+CVE: CVE-2025-9384
+
+Upstream-Status: Backport [https://github.com/appneta/tcpreplay/pull/946/commits/f6e6ee460ad9fe01e24a1579166b3f7a8c2158a7]
+Comment: Patch refreshed
+
+Signed-off-by: Jackson <jacksonj2@kpit.com>
+---
+ src/tcpedit/portmap.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/tcpedit/portmap.c b/src/tcpedit/portmap.c
+index 5fe1779..1e54728 100644
+--- a/src/tcpedit/portmap.c
++++ b/src/tcpedit/portmap.c
+@@ -104,7 +104,7 @@ ports2PORT(char *ports)
+         from_begin = strtok_r(from_s, "-", &token2);
+         from_end = strtok_r(NULL, "-", &token2);
+         long from_b = strtol(from_begin, &badchar, 10);
+-        if (strlen(badchar) != 0) {
++        if (!from_begin || !from_end || strlen(badchar) != 0) {
+             free(portmap);
+             return NULL;
+         }
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
index 29207bc89f..9e6a3301d2 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://github.com/appneta/tcpreplay/releases/download/v${PV}/tcprepl
            file://CVE-2023-43279.patch \
            file://CVE-2025-9157.patch \
            file://CVE-2025-51006.patch \
+           file://CVE-2025-9384.patch \
 "
 
 SRC_URI[sha256sum] = "44f18fb6d3470ecaf77a51b901a119dae16da5be4d4140ffbb2785e37ad6d4bf"
-- 
2.34.1


