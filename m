Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39910.1793009967894080271
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2026 03:19:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oGU218oh;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a05f2d5cd3so1080336b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 03:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793009967; x=1793614767; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GiyYSqYPPUSOJHTQeV/4naIalJhC2vsmp1jzqh526q4=;
        b=oGU218ohjmfGWaEp5butTsfGct2dpsrpLLAvm39/4XUqHZ8Lr30tlXmD3hzwR0zpt5
         5s+E55UqSI5FJivt4+/PaL77MSzkfgvhLAR+c5s8CBBb92iZ/xy4EZJ3P747O8qKri18
         P1XP+Iglk0GFtHVloOgrCLkD30gblY4V/WwqEJdiWP+pZY/gFA1m6w2urpdJ2Shlrric
         Gs7dm3SeBr72KwxgBEYcSfczfUFf9KCfitmjaNqA5zJJpoN7vj0ZCs4t53ghcUxszYjE
         WM0gQbIzxLEHFkgDTrs6obTJPolx5sE4r33Vmxng2LyoCfgpwxKX+xVKoXim5vW+Ax7l
         qxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009967; x=1793614767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GiyYSqYPPUSOJHTQeV/4naIalJhC2vsmp1jzqh526q4=;
        b=nRk3DR2masTdqjFj/ZgM0vZKfN3wP4CfKr9ceaf5Ck3J0k6QfPMEyQzynp4bKjvmIP
         zJg+wlYR+vOYfWqi5y9YY8xsqD3QqIrnqv+oPjaVi5mg3++aT+pTz2Db0EAVyG72KfV5
         tdMBrD/U6H4wa8VEqOWzJw057EOe9DnlxKLIEWDHV6lfQwBHo5S+6ioPclb26om65xrD
         q/ujN6jNw0zQFaNvuXaCkP0qT7iOqw+TWq3tFLlmItq5I2gvA276BvtttZLj6Uc02/lf
         02yQik6ZQattG+7/iRK85jwUbUk6Q0gpRA7pyB/OzUl+tEVBVlrip9DmTssuM4/Hi9WX
         p0ug==
X-Gm-Message-State: AFq9FYLJNMFGsurstgorK1Y1XiA0xR5gYaWZp2cVNwhck3Ax+/kUmLOi
	TPmaStzymvVQuEoVgNpR8FJfvTYmHDn6fmNPe+1GB24UxHj8gd3LihRiyeaM/A==
X-Gm-Gg: AYBFou24U376Oquz8bd85Xzakk5Gicc+uNkzNSpqbl+0cORCzZ5/HMnMy/MhFggll2t
	tm9GM3NVmjMzIvQ0Ak1/9QKfJfY6+b1Yp/EPotpJuAgiXsZRlFaLSuGcWwnUtvwLYIEJb/DZB3k
	dy49G2BobxoWd0S14Z638J1345tyRRG87YwBmZqgxAkCr4tlrG/6QOC6WnsDcl9uehingGiHCDl
	0T0xCuH4cplRbrwPtO8UoKtyZ3M1NQkvs7ZyTfCmhw3khmZjSCWFFrNwqVnQG4Q1qBMZmqiB1Qn
	hOqxo8Hwx2kVw8Qmyd/x4Xe6zonmX4wYMqJJXwH6SUhi1+PC1V4LTxeOYoyAoOuAze6y0nuwnJc
	BdIqrsIc+8XTSApydRpscYpDXY/P7Sny86sHpTpxkUZcJmIkl0UR+utsRf3QYHoOoPtKFAJ3kXY
	2l5lV0Y0zAH5ntvkKvD4DTDOMurBokL2ONtqjq/6EVaxy9JKWzZoe1XCdEI9sfQlIoHzFElaKxF
	l8SeXjluLiPXsVzcC9kL5dX7W7MctleaYRuZXKH7uQiRaY3q+5c/iK7Xr3vZe+Dqt8x+EMF7+Uz
	zYtT+ZMnW0pu/Xf3TqX3oUQsXACbd5o=
X-Received: by 2002:a05:6a20:430a:b0:3de:4a1c:a95 with SMTP id adf61e73a8af0-3e7cd5507e4mr5313765637.91.1793009967258;
        Mon, 26 Oct 2026 03:19:27 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc4648dsm1383583a12.14.2026.10.26.03.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:19:26 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][blacksail][PATCH 10/10] python3-oauthlib: patch CVE-2026-49265
Date: Mon, 26 Oct 2026 23:18:50 +1300
Message-ID: <20261026101850.1470035-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026101850.1470035-1-ankur.tyagi85@gmail.com>
References: <20261026101850.1470035-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 10:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131432
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-49265

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python3-oauthlib/CVE-2026-49265.patch     | 51 +++++++++++++++++++
 .../python/python3-oauthlib_3.3.1.bb          |  2 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-49265.patch

diff --git a/meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-49265.patch b/meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-49265.patch
new file mode 100644
index 0000000000..8cbc368b6c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-49265.patch
@@ -0,0 +1,51 @@
+From f3510969587daff0de06a233cf6be3a6233b3429 Mon Sep 17 00:00:00 2001
+From: Jonathan Huot <jonathan.huot@gmail.com>
+Date: Sat, 11 Jul 2026 13:15:29 +0200
+Subject: [PATCH] Improve PKCE code comparison
+
+(cherry picked from commit 74664d3fe037a354e180e305135c6bab1747a6b0)
+
+CVE: CVE-2026-49265
+Upstream-Status: Backport [https://github.com/oauthlib/oauthlib/commit/74664d3fe037a354e180e305135c6bab1747a6b0]
+
+Dropped changes to the CHANGELOG file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ oauthlib/oauth2/rfc6749/grant_types/authorization_code.py | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/oauthlib/oauth2/rfc6749/grant_types/authorization_code.py b/oauthlib/oauth2/rfc6749/grant_types/authorization_code.py
+index 09dc619..c73314a 100644
+--- a/oauthlib/oauth2/rfc6749/grant_types/authorization_code.py
++++ b/oauthlib/oauth2/rfc6749/grant_types/authorization_code.py
+@@ -4,6 +4,7 @@ oauthlib.oauth2.rfc6749.grant_types
+ """
+ import base64
+ import hashlib
++import hmac
+ import json
+ import logging
+ 
+@@ -44,9 +45,10 @@ def code_challenge_method_s256(verifier, challenge):
+ 
+     .. _`Section 4.3`: https://tools.ietf.org/html/rfc7636#section-4.3
+     """
+-    return base64.urlsafe_b64encode(
++    expected = base64.urlsafe_b64encode(
+         hashlib.sha256(verifier.encode()).digest()
+-    ).decode().rstrip('=') == challenge
++    ).decode().rstrip('=')
++    return hmac.compare_digest(expected, challenge)
+ 
+ 
+ def code_challenge_method_plain(verifier, challenge):
+@@ -58,7 +60,7 @@ def code_challenge_method_plain(verifier, challenge):
+ 
+     .. _`Section 4.3`: https://tools.ietf.org/html/rfc7636#section-4.3
+     """
+-    return verifier == challenge
++    return hmac.compare_digest(verifier, challenge)
+ 
+ 
+ class AuthorizationCodeGrant(GrantTypeBase):
diff --git a/meta-python/recipes-devtools/python/python3-oauthlib_3.3.1.bb b/meta-python/recipes-devtools/python/python3-oauthlib_3.3.1.bb
index bdc1f0e7b4..c375b172c7 100644
--- a/meta-python/recipes-devtools/python/python3-oauthlib_3.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-oauthlib_3.3.1.bb
@@ -4,6 +4,8 @@ HOMEPAGE = "https://github.com/idan/oauthlib"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2699a9fb0d71d5eafd75d8d7c302f7df"
 
+SRC_URI += "file://CVE-2026-49265.patch"
+
 SRC_URI[sha256sum] = "0f0f8aa759826a193cf66c12ea1af1637f87b9b4622d46e866952bb022e538c9"
 
 CVE_PRODUCT = "oauthlib"
