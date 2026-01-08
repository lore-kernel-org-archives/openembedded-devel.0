Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E7ABD148BD
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 07:45:29 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1634.1767858324711252194
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 23:45:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ShUkzcGh;
 spf=pass (domain: mvista.com, ip: 74.125.82.181, mailfrom: vanusuri@mvista.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2af41f558f5so2412089eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 23:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1767858323; x=1768463123; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y8MzTj2AQpCZsmnMsEmnuJi1KdW+tnWPiYOw6+if42I=;
        b=ShUkzcGhqed9a6vc8kf9PvPkiRpTpl47IGAX326Up6l0TCImk2OmbL5UcsqUFn5MiY
         4PRQoz1rZa+iAOeHI7bf9eGcYR3QAq/jB31cFgGkkFLwhBx+kHvn1W+knhxGxEo9mJH4
         OGEGprnr4UXsWe5LTD1UHuOhidYCnVO66uCpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767858323; x=1768463123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8MzTj2AQpCZsmnMsEmnuJi1KdW+tnWPiYOw6+if42I=;
        b=fxXi6ouSACOW6AoCzJERR/dPDjvMauy0PRb7I5MI4wyd0ZKfjQxqCNT4JZPlLCbFfr
         3KLSilLSJh32i0MGMnJy4Hk4kOPy+bqAIbz4xrHAq+yaPCyDjG3N1ykUChlM4tXrGBo2
         Edo3ADFrXkdkt8VJErQmOH6gpelhZ8/F6bESHGIfz7x9RmlU2fbQ5mPLQWCGYBe8Cft8
         SXFWM1KUZIp0j5CN3H8VGZFh0wXNn/mj7X1IUnq7AjP6ZdaC1rOBkAbv8fevOu0SVOZ5
         UOROD1YTuMmGnEI0MUH7uuhBgpf+B/g1wK4rc+9+p2/sgdyk0LQr0SjuteeErgNIRhYE
         4RUA==
X-Gm-Message-State: AOJu0YxTLh0l+t8/8ngl5dRVjBoWXVJ4sIOR+NXUAaBaGLxTxPju1g4U
	c68Y9REsYNChnOEiPNjnGGcBdvkTVZgqJA9F0K9+pGLY4sp23wOW3f3/yyYCjva7D6lg8DO4aUW
	YpHGGsUg=
X-Gm-Gg: AY/fxX7bHo1KquPINOFa8ONTatMxRWo/jn2HHw7wM1mEUUKI8vXThvT8wizemvtYpJg
	Y62kAivIJ5T9yAjLlw7RH0QAyP0RidM4pQB1uQ0opdadrxj+ebvmKHQkXou5qIi0lh9oAb00GDg
	3F5oeYnWpPvSNfH/Cb28bvfEJeA6oDwalJPZN3eGheftG6mLgIish6qDdxpcTwnNURazzj39xud
	HEEBhuExBjnMLvqzZZeEpfRlVj4iMB94uE4+C52P/2e1BG0/kUmWnIBxKXp2OvO/ZXc8kP29e4n
	GjDFmIg06pynWCiLlqKZtLIJ7D6jzZlJuFiPOlI/kPWf4exqSHmT8AUZB+LXcxLOsS/ZbdfLyKd
	VYA0fMBL+vZpyIJm8Jom1D4OpkQ2MDt9goF8r/8oVScixuLhOQ8IvmDYmGasLbyWKdTln2+HaoP
	9EvS8of1S1WfuqGAtT9T9K1Ug=
X-Google-Smtp-Source: AGHT+IEwA40Pp6c2k1L2b6rhl5OZfd87TIXPaJgXYLuXAXxpAmg74EgWIsGZYBALSByS+xC0HP6N9g==
X-Received: by 2002:a05:7300:1802:b0:2a4:3593:466c with SMTP id 5a478bee46e88-2b17d224efdmr4221732eec.8.1767858323352;
        Wed, 07 Jan 2026 23:45:23 -0800 (PST)
Received: from MVIN00352.mvista.com ([2406:7400:54:f9ef:e755:9b93:5870:a9a8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1706a6386sm8572191eec.14.2026.01.07.23.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 23:45:22 -0800 (PST)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-networking][scarthgap][patch] net-snmp: Fix CVE-2025-68615
Date: Thu,  8 Jan 2026 13:15:11 +0530
Message-ID: <20260108074511.83725-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 07:45:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123247

Upstream-Status: Backport from https://github.com/net-snmp/net-snmp/commit/b4e6f826d9ddcc2d72eac432746807e1234266db

Reference: https://github.com/net-snmp/net-snmp/security/advisories/GHSA-4389-rwqf-q9gq

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../net-snmp/net-snmp/CVE-2025-68615.patch    | 33 +++++++++++++++++++
 .../net-snmp/net-snmp_5.9.4.bb                |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2025-68615.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2025-68615.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2025-68615.patch
new file mode 100644
index 0000000000..1e6c65f0e5
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2025-68615.patch
@@ -0,0 +1,33 @@
+From b4e6f826d9ddcc2d72eac432746807e1234266db Mon Sep 17 00:00:00 2001
+From: Bart Van Assche <bvanassche@acm.org>
+Date: Sun, 2 Nov 2025 14:48:55 -0800
+Subject: [PATCH] snmptrapd: Fix out-of-bounds trapOid[] accesses
+
+Fixes: https://issues.oss-fuzz.com/issues/457106694
+Fixes: https://issues.oss-fuzz.com/issues/458668421
+Fixes: https://issues.oss-fuzz.com/issues/458876071
+
+Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/b4e6f826d9ddcc2d72eac432746807e1234266db]
+CVE: CVE-2025-68615
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ apps/snmptrapd_handlers.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/apps/snmptrapd_handlers.c b/apps/snmptrapd_handlers.c
+index 6cd126f266..afd93ed0fb 100644
+--- a/apps/snmptrapd_handlers.c
++++ b/apps/snmptrapd_handlers.c
+@@ -1112,6 +1112,12 @@ snmp_input(int op, netsnmp_session *session,
+ 	     */
+             if (pdu->trap_type == SNMP_TRAP_ENTERPRISESPECIFIC) {
+                 trapOidLen = pdu->enterprise_length;
++                /*
++                 * Drop packets that would trigger an out-of-bounds trapOid[]
++                 * access.
++                 */
++                if (trapOidLen < 1 || trapOidLen > OID_LENGTH(trapOid) - 2)
++                    return 1;
+                 memcpy(trapOid, pdu->enterprise, sizeof(oid) * trapOidLen);
+                 if (trapOid[trapOidLen - 1] != 0) {
+                     trapOid[trapOidLen++] = 0;
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
index 95e900b88e..d45cee86f5 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
@@ -30,6 +30,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
            file://0001-Android-Fix-the-build.patch \
            file://netsnmp-swinst-crash.patch \
            file://net-snmp-5.9.4-kernel-6.7.patch \
+           file://CVE-2025-68615.patch \
           "
 SRC_URI[sha256sum] = "8b4de01391e74e3c7014beb43961a2d6d6fa03acc34280b9585f4930745b0544"
 
-- 
2.43.0


