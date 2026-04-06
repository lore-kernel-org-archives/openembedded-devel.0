Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B8FF46C5B
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 16:53:44 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.59602.1775494420173214644
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 09:53:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gY9+HWJF;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso37253495e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 09:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775494418; x=1776099218; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rs1EBDPjmvgYb1ZcaQqPIeMcYkz9lXqHNv1at3sLgKM=;
        b=gY9+HWJFbkT8EQ2Y0/VOuYZ4PRIT5rympFzHJjS5QxY0xw1zZux6ayk+QKv3wbDoMP
         GDexTS/HYpA7UYADfKKSXW9Twp7DJT4JbckJJ5yWy6n5GCGBDF24OaajvSbMsTcoxQvu
         eLxOGE434YaYaft99H0kkzJDTbvwvdnbyJ4V7nrNZecbFdiUwdV/gyevk5V+h1woCZf5
         bPYXZp/UnIg6SWDFs8QgqLZbYlSY/GFGbwhH3JQkhEQHIONCv5ORF/JTw0fxzBP4SllK
         jfhTwYTkSNCS/PUIlST4T1as4vbcDXU5k/W0kBidlK8qayGo+Ob8MuaKwR13rJfJvkkI
         P6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775494418; x=1776099218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rs1EBDPjmvgYb1ZcaQqPIeMcYkz9lXqHNv1at3sLgKM=;
        b=aV+SwPJHtUrCtNcD8DVLCEY/ZI/Q6gFB8vg59X64wWsIK15Y8n8dP52lUG1RanC09C
         PBmOsDbOabdy9xdbaJAkjO1eT0p7WcjoUpIsx11Gtj70ksukQrDXT/d/HR5geDY4e52h
         swg3CNgoUTSTev54jrKAncljn53A9GQ71XswqQkKuSERjxDSXJNuRY0eYHirm99Vfhrm
         4bd50Y8FAc2AQvled3MmroMSq7BmwGAhnDhOXzZ0FY1PE5kr0FoL/E/LyMYKgqecUpUY
         l72PR7GLl/UI9h9u2Z97MTKXexORs762blmQOvtV5KFiUg5SDBAkrMRXbHIT0qSIOeOh
         s4aA==
X-Gm-Message-State: AOJu0YzHS0UYKy42SmQvAafBJ+F3Tw9fWxBwjxQNwPpeUJURhx/SbsZf
	Pt7Lu1bQto2gwCNPTYg93W5I8VZtf2wRssaX7RcNQ9zGlz26MEfVJzgmbumgDg==
X-Gm-Gg: AeBDieuM4jiO7j/bM2g/xCZciLby/+NfXxrey+Q6HaV3+yMP3lJCqTajVmQWfIdBOzl
	03sFQCz7gTEZ191THliyjAMeLS+kp8Dhaik3JBPB8yQtROo+6URMZ0TX1SUXIbfVWOS264jOeo8
	UbScWZnxsKUw++zvoGIWv1DbPzPl61o6QE4VFLIp0+9fbXnHbaO8wVu0ucXIWwd7s9UL/haR3YH
	8NIhaLBitWcO83azXWZNZJetUUGH67M+tKTOfOVg6FGOUeYSjDf2P/45RC2UmmNMewEVxgydPpD
	aOZbVy5Mwfg+Z4Y5Z4OXwAk/NwGEdD4wJJtW0jKmPm1eD21mTlZ4ClpEPLzBD0YHMv+pxh7vkvt
	ZoMWXalcDwvzywkZMoxOdLjpAv1QjFdfvJGk+ofoN+TNe5mUZ0+JbG+LukRTBsY3zA1kxnF/JeL
	HdzshKCTJpD2vRtsTgXYwY
X-Received: by 2002:a05:600c:8216:b0:488:ac01:72de with SMTP id 5b1f17b1804b1-488ac0175camr77932605e9.5.1775494418086;
        Mon, 06 Apr 2026 09:53:38 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a65635fsm375482745e9.6.2026.04.06.09.53.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 09:53:37 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] tinyproxy: upgrade 1.11.2 -> 1.11.3
Date: Mon,  6 Apr 2026 18:53:36 +0200
Message-ID: <20260406165336.3850058-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 16:53:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126054

Drop patch that was merged upstream.

Shortlog: https://github.com/tinyproxy/tinyproxy/compare/1.11.2...1.11.3

Ptests passed successfully:

root@qemux86-64:~# ptest-runner
START: ptest-runner
2026-04-06T15:25
BEGIN: /usr/lib/tinyproxy/ptest
starting web server... done. listening on 127.0.0.3:32123
starting tinyproxy... done (listening on 127.0.0.2:12321)
waiting for 1 seconds. 1  done
checking direct connection to web server... ok
testing connection through tinyproxy... ok
requesting statspage via stathost url... ok
signaling tinyproxy to reload config...ok
checking direct connection to web server... ok
testing connection through tinyproxy... ok
requesting statspage via stathost url... ok
checking bogus request... ok, got expected error code 400
testing connection to filtered domain... ok, got expected error code 403
requesting connect method to denied port... ok, got expected error code 403
testing unavailable backend... ok, got expected error code 502
0 errors
killing tinyproxy... ok
killing webserver... ok
done
PASS: run_tests.sh
DURATION: 2
END: /usr/lib/tinyproxy/ptest
2026-04-06T15:25
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../tinyproxy/tinyproxy/CVE-2025-63938.patch  | 43 -------------------
 ...inyproxy_1.11.2.bb => tinyproxy_1.11.3.bb} |  3 +-
 2 files changed, 1 insertion(+), 45 deletions(-)
 delete mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2025-63938.patch
 rename meta-networking/recipes-support/tinyproxy/{tinyproxy_1.11.2.bb => tinyproxy_1.11.3.bb} (94%)

diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2025-63938.patch b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2025-63938.patch
deleted file mode 100644
index e06e0d3eae..0000000000
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2025-63938.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From cee659d2ac1e4e9d1ce388338f46df6c4bae8278 Mon Sep 17 00:00:00 2001
-From: Gyorgy Sarvari <skandigraun@gmail.com>
-Date: Fri, 17 Oct 2025 22:57:39 +0000
-Subject: [PATCH] reqs: fix integer overflow in port number processing
-
-From: rofl0r <rofl0r@users.noreply.github.com>
-
-closes #586
-
-CVE: CVE-2025-63938
-Upstream-Status: Backport [https://github.com/tinyproxy/tinyproxy/commit/3c0fde94981b025271ffa1788ae425257841bf5a]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- src/reqs.c | 9 ++++++---
- 1 file changed, 6 insertions(+), 3 deletions(-)
-
-diff --git a/src/reqs.c b/src/reqs.c
-index a65ed54..1e5895c 100644
---- a/src/reqs.c
-+++ b/src/reqs.c
-@@ -174,7 +174,7 @@ static int strip_return_port (char *host)
- {
-         char *ptr1;
-         char *ptr2;
--        int port;
-+        unsigned port;
- 
-         ptr1 = strrchr (host, ':');
-         if (ptr1 == NULL)
-@@ -186,8 +186,11 @@ static int strip_return_port (char *host)
-                 return 0;
- 
-         *ptr1++ = '\0';
--        if (sscanf (ptr1, "%d", &port) != 1)    /* one conversion required */
--                return 0;
-+
-+        port = atoi(ptr1);
-+        /* check that port string is in the valid range 1-0xffff) */
-+        if(strlen(ptr1) > 5 || (port & 0xffff0000)) return 0;
-+
-         return port;
- }
- 
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.2.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
similarity index 94%
rename from meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.2.bb
rename to meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
index 8558291c18..745c55bc0d 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.2.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
@@ -7,10 +7,9 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
            file://tinyproxy.service \
            file://tinyproxy.conf \
            file://run-ptest \
-           file://CVE-2025-63938.patch \
            "
 
-SRC_URI[sha256sum] = "2c8fe5496f2c642bfd189020504ab98d74b9edbafcdb94d9f108e157b5bdf96d"
+SRC_URI[sha256sum] = "9bcf46db1a2375ff3e3d27a41982f1efec4706cce8899ff9f33323a8218f7592"
 
 UPSTREAM_CHECK_URI = "https://github.com/tinyproxy/tinyproxy/releases"
 

