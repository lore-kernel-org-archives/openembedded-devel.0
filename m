Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 673D3CFD653
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 15:31:46 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8528.1767799900674378018
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 07:31:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=FOJGgJL5;
 spf=pass (domain: mvista.com, ip: 209.85.214.174, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a0d0788adaso16578805ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 07:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1767799899; x=1768404699; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hQpn3E1st3Mmb3nQI8cPZziAGAK8fSFG4Lf/RTq1qXY=;
        b=FOJGgJL5HhYOwmxLoCQmnX8pcRSo5fIXWkqj0Nj2D53lJOK0v+U/BZ81kqD2P0PoBy
         u9pK15eN46banuj6xS9u7EJgLrv7GEjBoBx5pL161Ow7hecics7cy4rO/qXn7pISABJm
         928GLwL/uMfK/JWHqcB4U4K4+0tHJnYqHduws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767799899; x=1768404699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQpn3E1st3Mmb3nQI8cPZziAGAK8fSFG4Lf/RTq1qXY=;
        b=rp8D0uc0ryeKfquTmrbAAKzKCudvwcIofaZKn1L5jnbwfFVgDz98NjWEYu4xay1vjP
         H5Ln6lUlY3kp6KF8TLSBHV6KQg7v19FDd7hS6tdkFKA+72kccYcObozr/zG5HsCkXfVh
         IiIPsxBRxB8rTBY5gMOyDVW3ksrgXoaWZ0cblPwxL2sCtEMhFevWAtdLejkEb2lE5u6N
         O4GGZVFsCZTHd2QNEWUGLUoti9AomkQFEtGeUeOwySxevfFgGdeHOjwU/L8HfYDuAdY7
         8877PIWBqAE2a5PiMSrjFC6C6NEKysImU4yiph+ojMkmihsT7Hg1DeS5JLAMzjab8Oiw
         yCHg==
X-Gm-Message-State: AOJu0YxKjo/RYyg4x2T44WTWW1rM1GJw8iUkU9HczSvkFqIUsCH6VfjX
	roJkvravCfBdaJHXZE+iaP/Wkye/nLbftt+JlyZuPSk1cfI/JNoS+MQfLEbnjr8pz/pGM6cUUx/
	7MWCO+6w=
X-Gm-Gg: AY/fxX4gj6iCm7X7zyeGMlF5aUl0F4H3gA3wsu7HcgJPxRb42UVnB3ENXBIpbKLGkj1
	ZgU/hGpQyR05X+9GmnBQg0g8y8neDyPFYGG9MvqTsKt3bd4qO8sP5OwmHO9y3+dk/Quf+sCw1QM
	emB9FTANt7EuXtnGN+LUIwVYLH54P83HpLM26F2cZn40RbhFwUmo5S17cLZwdpD9JDAeFUnFLpd
	uToqakK3MyWzhgchPXC1M38M2fb9knpdO8wL46gKc8xTZkP8Epg4V2WXZJPdvAtqCHyoTOphpyH
	Y3IabkHRf1zE3bTym9cbCvkwdhsKvLc+tMFTnVUfB5iXAZIHA7yIVtEvuxYCpL0P1ZIGkXHIU2w
	Du7txA87UquDONliFEUFKo6+RAAn6slqq2/BrdoADCz62L68Ub0QanHbrMTpbVLs2jNVp0F4CPo
	4OkaAiSSKl67yh+CGnzGtXQ5iK
X-Google-Smtp-Source: AGHT+IHVx9rkjMG4O3ptGxHXcLKeC4OJqLjUp1FZeeZ5xwwkXsvESXTcfUziepXLT5KiULoSUk1UxQ==
X-Received: by 2002:a17:902:ea02:b0:2a1:10f7:9717 with SMTP id d9443c01a7336-2a3ee4bcc2emr26078565ad.58.1767799899387;
        Wed, 07 Jan 2026 07:31:39 -0800 (PST)
Received: from localhost.localdomain ([2406:7400:54:f9ef:41ec:3c65:aa20:e64b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbfe1ca23sm5490366a12.12.2026.01.07.07.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 07:31:38 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-networking][kirkstone][PATCH] net-snmp: Fix for CVE-2025-68615
Date: Wed,  7 Jan 2026 21:01:25 +0530
Message-Id: <20260107153125.184305-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 15:31:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123225

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/net-snmp/net-snmp/commit/b4e6f826d9ddcc2d72eac432746807e1234266db

Reference: https://github.com/net-snmp/net-snmp/security/advisories/GHSA-4389-rwqf-q9gq

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../net-snmp/net-snmp/CVE-2025-68615.patch    | 33 +++++++++++++++++++
 .../net-snmp/net-snmp_5.9.3.bb                |  1 +
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
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
index 13dc603bfa..7b7f2be633 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
@@ -28,6 +28,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
            file://0001-ac_add_search_path.m4-keep-consistent-between-32bit.patch \
            file://CVE-2022-44792-CVE-2022-44793.patch \
            file://0001-unload_all_mibs-fix-memory-leak-by-freeing-tclist.patch \
+           file://CVE-2025-68615.patch \
            "
 SRC_URI[sha256sum] = "2097f29b7e1bf3f1300b4bae52fa2308d0bb8d5d3998dbe02f9462a413a2ef0a"
 
-- 
2.25.1


