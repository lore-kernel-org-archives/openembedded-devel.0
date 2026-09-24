Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E59DC98304
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 04:33:31 +0000 (UTC)
Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.722.1790224409279007414
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 21:33:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hIV6DQae;
 spf=pass (domain: gmail.com, ip: 74.125.228.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-86868f7707dso731653b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 21:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790224409; x=1790829209; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KRFuPBka9S7iS5QVkQkVRFwI2NJGW81vs8p42NGiXCQ=;
        b=hIV6DQaebn7ieEexjfObpaTqjZmIasmN6yJZf+f6f7VpURowWsEoFtQXLgn87fjq5d
         Tp8qmSw+j/LqoJVXn7p/0Ll+YYPvLElYAWRCqOABwGc5lO2Km+epL4XSAT2YJeZuSrsL
         ZzIGfM8zMXW8+ELwojKQiC/YDaF+MP5wtFS0wpaOsaQFOdRxG+VwCtpxSwLSIlk/Tl/s
         tjrUiV1tGjHPobsiBYez24eO06ZlBrNt1a1dmVGsSv80wu5iQVLI55WcstcZnqPkU55s
         J23bWWmDao7MFSWcr5A24wgeBSrfV1oIqWh97GsF9rP4JiQdekFr2kb/NtAinH4J6fO2
         SWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790224409; x=1790829209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KRFuPBka9S7iS5QVkQkVRFwI2NJGW81vs8p42NGiXCQ=;
        b=gq6kFmpV5A8psA19zPjd2/Vykx1cgYn8kBTXpCE5Dm/HYOi08C/vuRfD0rFtWL0dqt
         5hM7Guau0rCLqjSGoWTWWHEPOycpzw/uGI2i8zInctzewJgXO6WbZfdODl3oRNH1y4vx
         PMN1rDrN8S4f7R1j8i1URVcBmL61YfRz2pO/lOTqYxdn2wEttn8IzloBEyURfspG/y3e
         uN0yHZOQhUYbgAYGx8s7N6xOcV9N6ijSoK+8Q80OkoLgT34ziElNch4nGFValWyj+hFx
         kZ9RuwNJe7oU1qoUUxwJV8dchcB8KE4z8Jiz/Vpfcfkdyrbx1ItNVzw+ZeqE6G0q9W7S
         950g==
X-Gm-Message-State: AFuF++lekqWDvav0VwddJZfU64zzJhOF7zXdAs3rjoebAp8UI6MFUwZd
	DLC4+GzqrZTnHB1Q4lkilihyLf6By9iUrCsxZOoGkzYG5tHOZKH+mLOuvQhDUQ==
X-Gm-Gg: AYBFou1CVjtvc+fEtf8sRMjufc7vRHzRm3dVg9wkEDdqcmqHkr+2bcDoGH1HI5rTaVx
	YgvfSSMz6Li1hq0KFnybMAWJdKYwsmpsUM6yxsX0qgue6IP23i5pNLy8T78mkNgClR3sOInIQGQ
	B1CTM7OR+VeIAFasAucbZY5FS2nTrPUbvgbBAfe/1yOASPyGIp0jiK/JQIfT83mC2PvI0sZobWM
	/pwii80Mjum9E28ywbYackpS8FvRy/oKpiRp9QwNAlR/bzrVU2LHjVyeXRHdYowPpwDDoINysS9
	BBG4fThc2pkMLCU1RtFUXISLBfPuHt6t1uYhB2d6vPpGT5+9hAIhWvJzk6iCUyDH834sW3toVAw
	yk/7o64VY3L5SAKWX714YeRvyCk+aAYX5cOxDfIVe/3qLJ+eEikObtSSC1gIttcXOuTWtgWJoOR
	h3l/rXPGuhqQu5BZqFgv+y5p4SlYpkIHEV1LTb4wkkiFvq/LdeJzMvdYGa2/jrjDUtElsz5mkNl
	Wc79AeelnVwI8OtKrLi2if+DJSksGVzew==
X-Received: by 2002:a05:6a00:90a7:b0:87d:ddc7:4915 with SMTP id d2e1a72fcca58-87e9e29b99bmr876140b3a.1.1790224408543;
        Wed, 23 Sep 2026 21:33:28 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1e601b5dsm2189686b3a.61.2026.09.23.21.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 21:33:27 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 4/24] sngrep: patch CVE-2026-90558
Date: Thu, 24 Sep 2026 16:32:54 +1200
Message-ID: <20260924043315.1663186-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
References: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 04:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130252

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-90558

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../sngrep/sngrep/CVE-2026-90558.patch        | 84 +++++++++++++++++++
 .../recipes-support/sngrep/sngrep_1.8.2.bb    |  4 +-
 2 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/sngrep/sngrep/CVE-2026-90558.patch

diff --git a/meta-networking/recipes-support/sngrep/sngrep/CVE-2026-90558.patch b/meta-networking/recipes-support/sngrep/sngrep/CVE-2026-90558.patch
new file mode 100644
index 0000000000..64fd8044a9
--- /dev/null
+++ b/meta-networking/recipes-support/sngrep/sngrep/CVE-2026-90558.patch
@@ -0,0 +1,84 @@
+From 399346a12ca3bcf7703734fa33b5b3427775b014 Mon Sep 17 00:00:00 2001
+From: Kaian <kaian@irontec.com>
+Date: Fri, 7 Aug 2026 08:45:42 +0200
+Subject: [PATCH] fix: prevent stack buffer overflow in SIP attribute
+ formatting
+
+call_get_attribute() formatted the Call-ID, X-Call-ID and Reason header
+text with an unbounded sprintf("%s"). Call-ID/X-Call-ID can hold up to
+MAX_CALLID_SIZE/MAX_XCALLID_SIZE (1023 bytes) and Reason text is copied
+from the raw payload (up to MAX_SIP_PAYLOAD), while all callers pass a
+255-byte SIP_ATTR_MAXLEN stack buffer (call list rendering, sort compare).
+A SIP message with a long Call-ID, X-Call-ID or Reason header overflowed
+the stack, triggerable via pcap, live capture or HEP/EEP remote capture.
+
+Bound these writes with "%.*s" and SIP_ATTR_MAXLEN - 1. Also fix a
+matching off-by-one in msg_get_attribute(), where the existing "%.*s"
+used SIP_ATTR_MAXLEN as the precision and could write 256 bytes
+(255 chars + NUL) into the 255-byte buffer.
+
+Thanks to TristanInSec for reporting the issue.
+
+(cherry picked from commit 1ff74ee3ab5ff280e8ba976aa8c744dca57eb35b)
+
+CVE: CVE-2026-90558
+Upstream-Status: Backport [https://github.com/irontec/sngrep/commit/1ff74ee3ab5ff280e8ba976aa8c744dca57eb35b]
+
+SIP contract change was dropped during backport as it was introduced in
+v1.8.4[1]
+
+[1]https://github.com/irontec/sngrep/commit/c61a26d90c166f996e31aceefc9c2f8f831ccd86
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/sip_call.c | 6 +++---
+ src/sip_msg.c  | 6 +++---
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/sip_call.c b/src/sip_call.c
+index bea879a..68ecb50 100644
+--- a/src/sip_call.c
++++ b/src/sip_call.c
+@@ -257,10 +257,10 @@ call_get_attribute(sip_call_t *call, enum sip_attr_id id, char *value)
+             sprintf(value, "%d", call->index);
+             break;
+         case SIP_ATTR_CALLID:
+-            sprintf(value, "%s", call->callid);
++            sprintf(value, "%.*s", SIP_ATTR_MAXLEN - 1, call->callid);
+             break;
+         case SIP_ATTR_XCALLID:
+-            sprintf(value, "%s", call->xcallid);
++            sprintf(value, "%.*s", SIP_ATTR_MAXLEN - 1, call->xcallid);
+             break;
+         case SIP_ATTR_MSGCNT:
+             sprintf(value, "%d", vector_count(call->msgs));
+@@ -282,7 +282,7 @@ call_get_attribute(sip_call_t *call, enum sip_attr_id id, char *value)
+             break;
+         case SIP_ATTR_REASON_TXT:
+             if (call->reasontxt)
+-                sprintf(value, "%s", call->reasontxt);
++                sprintf(value, "%.*s", SIP_ATTR_MAXLEN - 1, call->reasontxt);
+             break;
+         case SIP_ATTR_WARNING:
+             if (call->warning)
+diff --git a/src/sip_msg.c b/src/sip_msg.c
+index 379a40a..6762862 100644
+--- a/src/sip_msg.c
++++ b/src/sip_msg.c
+@@ -136,13 +136,13 @@ msg_get_attribute(sip_msg_t *msg, int id, char *value)
+             }
+             break;
+         case SIP_ATTR_METHOD:
+-            sprintf(value, "%.*s", SIP_ATTR_MAXLEN, sip_get_msg_reqresp_str(msg));
++            sprintf(value, "%.*s", SIP_ATTR_MAXLEN - 1, sip_get_msg_reqresp_str(msg));
+             break;
+         case SIP_ATTR_SIPFROM:
+-            sprintf(value, "%.*s", SIP_ATTR_MAXLEN, msg->sip_from);
++            sprintf(value, "%.*s", SIP_ATTR_MAXLEN - 1, msg->sip_from);
+             break;
+         case SIP_ATTR_SIPTO:
+-            sprintf(value, "%.*s", SIP_ATTR_MAXLEN, msg->sip_to);
++            sprintf(value, "%.*s", SIP_ATTR_MAXLEN - 1, msg->sip_to);
+             break;
+         case SIP_ATTR_SIPFROMUSER:
+             if (msg->sip_from && (ar = strchr(msg->sip_from, '@'))) {
diff --git a/meta-networking/recipes-support/sngrep/sngrep_1.8.2.bb b/meta-networking/recipes-support/sngrep/sngrep_1.8.2.bb
index 12fe3ececa..1bcbebf554 100644
--- a/meta-networking/recipes-support/sngrep/sngrep_1.8.2.bb
+++ b/meta-networking/recipes-support/sngrep/sngrep_1.8.2.bb
@@ -15,7 +15,9 @@ DEPENDS = "\
     ncurses \
 "
 
-SRC_URI = "git://github.com/irontec/sngrep.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/irontec/sngrep.git;protocol=https;branch=master \
+           file://CVE-2026-90558.patch \
+"
 SRCREV = "dad1033640f249fa4994f976cf6ee96826c15702"
 
 

