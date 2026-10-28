Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36230.1793161591183241191
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:26:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=a7MbjXQ8;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ae57dc1ea9so173877a91.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161590; x=1793766390; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GiyYSqYPPUSOJHTQeV/4naIalJhC2vsmp1jzqh526q4=;
        b=a7MbjXQ8OBwmHD5aypIabYGa/JwYFVZ03eiND/VukkBVMuOUARChK1xX9ZRcEDz5v2
         f0HVpb+RFb69HpmrTnZZg5hDcWWZP3SZ+278R2VfzUg51Iyp6xfa9BQs+eSU8mHO52NV
         6x8BX6GviFmF1OQTJyJerMHr7mg8kbkHfQUgoJV2pBESwr+d+JF+oDFwlw/fqNfG4Vyj
         jsr8ZuPBQoUpoKYMzgAbQKX7ker32eIULH6i1uO9oqgM76C9jKuVIf+XUTpI73+hNphF
         jZSxWo9MI7qS9MAr6X6FduklRigoJMOvosHDIJ3ueTP0GmV/mrbgSBr0Cl/fYoMhjALa
         vdMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161590; x=1793766390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GiyYSqYPPUSOJHTQeV/4naIalJhC2vsmp1jzqh526q4=;
        b=zpmQ/GvtZqolzvrbcAIUh4bHvq1y6M/oFWIMGlqbPvkkk6Dkey6g8+0HDNu+gPKC9v
         3LEek8jX5BDYdRmATKZySEBLnwRuvNn5XVWUe6/eXAr6Rgawkvul3lplmyIBlwk7cGpA
         QcEtQMuWHvuq2VWgzOF6cvL8kCgIYAoOQuXHPUD/2MhIjZH1YEB5tnFnDcXdvpWaC3a+
         Ckwul/29v/3LPciNSDuua4kgbaVHigx5iH4wSrGbMIePc5w3f08yaVrxX3euij7BpP6w
         ULbV+yZ64ja3a5jypUyfmno6y1NQOH2yjxdKsCrUGVHInXbj29BNIOPGpEvdipmQ6xkk
         weCQ==
X-Gm-Message-State: AFq9FYIDOzs4ZMk429i3Pie8MJP8EgsJr1DzdgSNoHfFXw9A9niGaXLm
	m9i3qCUpm68mitJUrTcOV5TqCkSKHXPdlrGnYOm7fgezxS/zZdo382AAm5FZTw==
X-Gm-Gg: AYBFou0yPPVndG6HboZMIJFZPUA4KguYDpoOdwuCoC2QQYD9h/YgBtQ7VkjbZsFpVpY
	54r0ZyeI3IZMw+d3b2R8H1EG9VnGuQXsQ5lAb3vgIIfNmQ/NcTqq243Pv+gY09LtN7sdEGDHPBk
	/p0oZRfGZ9T3RmWQcmOgTPAuaoYLBtlzNAKwTyNkgXFIXG8Lslc8/PwuAbXvskDg3kZcdr+YioV
	URq05GXUqzjhqIrtrr4P5Mg+Ygj1jzW17SCT2ly2kR5PvDFhmrLVTz7sHAoLSf7Z/X9Prim+NIt
	ncagWxqEa2Ictzq6UriNM/4iZIdVmmRa9w8dFIDt7/cBmZsLoU+bL31Qwnldm/Cl4jDm7PZ5mWF
	AVQuXWT4J/384/M9okXGy7zFCEV6IJzSqM2qVQ2Dd55wiKU85y7QR4dnFGQ3ZmFNPlsruzBhEaQ
	EwBwXsVuqMG8dHqXBkawLxhk7xACeLB3NqNkX1QHqA4EOuMKsMaZ/cEEvFbtW+r2lhuuLgGn/rA
	vp6gsXS4s1Lyw+V+OT6vhIkB/rC3krONmhBd1E0F0nbHasr/HvEtpTz630Djvl7WNucURvTTWC+
	LhqyyoMMI/yno5zxFDB8DrMX+ZyoYJO4GgrcoxCLDaGJADgCAAKZP/rQQ6jSObe0zYd6A4e50TN
	WJCiTjZw=
X-Received: by 2002:a17:90b:58cf:b0:3a7:cffb:8b96 with SMTP id 98e67ed59e1d1-3ae58171017mr901949a91.18.1793161590487;
        Tue, 27 Oct 2026 21:26:30 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:26:30 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 57/60] python3-oauthlib: patch CVE-2026-49265
Date: Wed, 28 Oct 2026 17:23:55 +1300
Message-ID: <d3e07213ffaaa3825518041967d2e650d2cfcf7e.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:26:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131609
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
