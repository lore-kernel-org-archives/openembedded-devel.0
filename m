Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B60E7D25037
	for <webhook@archiver.kernel.org>; Sun, 11 Jan 2026 07:36:24 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6657.1768116977485149025
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Jan 2026 23:36:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BMVtej4j;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-81f46b5e2ccso253470b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 23:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768116977; x=1768721777; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cLYfeNotp53lQKA4InTPKExI5XfJ7FlW98+BJcghUv8=;
        b=BMVtej4jtevqobQkrF1s20s3o8kCF3HY1u23wef/cmVmhWWdILPKWdzk9fSWJcyJI/
         GoQ6XCisNPb0O1ZxOGc+sV19toqJjuQjRv5IoMPmSixmZrVHBSKSZIJiXHinbUrOcwRe
         NiI+gCdtn/0A3bl74ztZgnToH1HtB6LzmNAXtNLNo0PinA1PBVv5V3bWvx4mOWNUnZHN
         Po7jY6gtq9LNi5JnCgEa7Qbz7p+DeD2k1u9uBvAW3r8LwJlyfWE6ZNmaYsWbPwoGzSoD
         qieggEOgXqyizcbqJrgu5ZnFrfUQgLBTqi6/cHn4bkoQsd5g1Rxkwjh6RyrMXl3WHlgx
         QOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768116977; x=1768721777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cLYfeNotp53lQKA4InTPKExI5XfJ7FlW98+BJcghUv8=;
        b=KZl/rD0WpZfbf9cFOIrwuOw0lzu77LWGjCHho/aQLEPmG6n4IUMYpZDB0X6p73p4wi
         XaHv92DjtHdy+o6j2/Xm0aBop3M5MowX/TmWOfKTGIp1CW5GJ8YIJu+NZqk8WS1KLXC1
         lnMjIB8vnnednVr0wMsI02QVROorrbu4gyeZE2xv8jEyeBfcCpsLUEZkz1ADskJHPXbN
         /M9cvghiyMr7P9uxw6wxcDARrKYbVHGGjVZ3SsHoGt1v9Sp2oHNjhN+hA4Xr7B8iSaWs
         PHd3qikGIuS1qY1l/0oSeLc+hDzZNr/Fb+QeOmkohF25FvGB3AUq7ajon1rAXP/CBqbz
         96+g==
X-Gm-Message-State: AOJu0YzvFBLlDaYo2QHfU6JSqJK1ADg0skcth+fPJMHcwUeNU5bH3XQE
	56miMaoq8XtCkt3h7HqIkJwdfDWvQAAvZRrl6iR0DmfkVKH3FXLa3+wFh7oE7g==
X-Gm-Gg: AY/fxX7PYCn+qz2tXRdTRUYtKHmeLhDiJNFvo1TDPA75hMgmB40Vm66NujFxmVEz4Zi
	MVEgdePaiayilG+ROEWD+ATjglPra9GMCH2aBYBHMEOFRz/84yyrFAzw0KC1gl/7XgXAzpI4uN4
	QpgK958JG03EyrkrNvLg0dyTPiCH2tjY2nOkB+pXqpB7GizKOFzCu4L4oTMmUdYvCZ2EcEmut3G
	TRQf8vg2zVeaQ87wEXiMeGFOKFOnzN7dJQ7j4gXjS+u5M/nG6kiOJY/ZSwvSUggtCNzE0QFRkz2
	OrX+1RwSguAXGJBEZmM8Osk2vBxRlqTV9bcDS04TSf64j6z8Pbt27N/ZWvWsBHvMcTBJXa651KZ
	vJ+qH3Ys8OrlbIXt3sS7EWP+CaIgu2FiAkCFU2nd55y8epzrpt4AqJT0rXlGrzEQNIM2xlrHlhO
	eQp6rWmnX+wUFPU2meOZzFcgY=
X-Google-Smtp-Source: AGHT+IHAH1n3QIbTE712KmEeha8nfzpGDTlqBRVD+4tl4PG1woH3hETMQ8khTKv6OA05JilHiU7ufw==
X-Received: by 2002:aa7:8084:0:b0:81c:717b:9d29 with SMTP id d2e1a72fcca58-81c717ba491mr9135471b3a.51.1768116976497;
        Sat, 10 Jan 2026 23:36:16 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.10])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbfd27953sm14259545a12.11.2026.01.10.23.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 23:36:16 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 1/3] synergy: patch CVE-2020-15117
Date: Sun, 11 Jan 2026 20:36:05 +1300
Message-ID: <20260111073607.524248-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 11 Jan 2026 07:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123340

From: Peter Marko <peter.marko@siemens.com>

Pick commit based on [1].

Note that the pick is node from deskflow, which is open-source successor
of synergy.
If anyone uses thie recipe, it should be switched.

[1] https://github.com/deskflow/deskflow/security/advisories/GHSA-chfm-333q-gfpp

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit db283053d096cf77df8e4444ce91e5d882f8850c)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../synergy/synergy/CVE-2020-15117.patch      | 48 +++++++++++++++++++
 .../recipes-support/synergy/synergy_git.bb    |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta-oe/recipes-support/synergy/synergy/CVE-2020-15117.patch

diff --git a/meta-oe/recipes-support/synergy/synergy/CVE-2020-15117.patch b/meta-oe/recipes-support/synergy/synergy/CVE-2020-15117.patch
new file mode 100644
index 0000000000..4ad2a45275
--- /dev/null
+++ b/meta-oe/recipes-support/synergy/synergy/CVE-2020-15117.patch
@@ -0,0 +1,48 @@
+From 79efdb7c617b809e1a2daf17441d7a30f7046aa5 Mon Sep 17 00:00:00 2001
+From: Jnewbon <48688400+Jnewbon@users.noreply.github.com>
+Date: Tue, 14 Jul 2020 13:14:40 +0100
+Subject: [PATCH] Merge pull request from GHSA-chfm-333q-gfpp
+
+Attempts to fis DoS to servers with less then 4GB memory
+
+CVE: CVE-2020-15117
+Upstream-Status: Backport [https://github.com/deskflow/deskflow/commit/0a97c2be0da2d0df25cb86dfd642429e7a8bea39]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/lib/synergy/ProtocolUtil.cpp | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/src/lib/synergy/ProtocolUtil.cpp b/src/lib/synergy/ProtocolUtil.cpp
+index d9f5dc324..7d2c37ff8 100644
+--- a/src/lib/synergy/ProtocolUtil.cpp
++++ b/src/lib/synergy/ProtocolUtil.cpp
+@@ -61,6 +61,9 @@ ProtocolUtil::readf(synergy::IStream* stream, const char* fmt, ...)
+     catch (XIO&) {
+         result = false;
+     }
++    catch (std::bad_alloc & exception) {
++        result = false;
++    }
+     va_end(args);
+     return result;
+ }
+@@ -216,7 +219,15 @@ ProtocolUtil::vreadf(synergy::IStream* stream, const char* fmt, va_list args)
+                 // allocate a buffer to read the data
+                 UInt8* sBuffer = buffer;
+                 if (!useFixed) {
+-                    sBuffer = new UInt8[len];
++                    try{
++                        sBuffer = new UInt8[len];
++                    }
++                    catch (std::bad_alloc & exception) {
++                        // Added try catch due to GHSA-chfm-333q-gfpp
++                        LOG((CLOG_ERR "ALLOC: Unable to allocate memory %d bytes", len));
++                        LOG((CLOG_DEBUG "bad_alloc detected: Do you have enough free memory?"));
++                        throw exception;
++                    }
+                 }
+ 
+                 // read the data
+-- 
+2.30.2
+
diff --git a/meta-oe/recipes-support/synergy/synergy_git.bb b/meta-oe/recipes-support/synergy/synergy_git.bb
index fb767942fe..2717320886 100644
--- a/meta-oe/recipes-support/synergy/synergy_git.bb
+++ b/meta-oe/recipes-support/synergy/synergy_git.bb
@@ -10,6 +10,7 @@ DEPENDS = "virtual/libx11 libxtst libxinerama curl openssl"
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "git://github.com/symless/synergy-core;protocol=https;nobranch=1"
+SRC_URI += "file://CVE-2020-15117.patch"
 
 # Version 1.10.1-stable
 SRCREV ?= "1b4c076127687aceac931d269e898beaac1cad9f"

