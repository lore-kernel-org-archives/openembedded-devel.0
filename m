Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 879A8E9D40D
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 16:29:38 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24772.1770222572508737797
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 08:29:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RP03BFYL;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47ee07570deso60119135e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 08:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770222571; x=1770827371; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uAVLIOe4T6ysRaNjtcm21azfsFJG6l2Sd25BlyIZhiM=;
        b=RP03BFYLXiOGnA+ESxMwyTT76n9/eVDihxrG4r/a3xWhDNprlD/g9S4CHoZsmYiD3B
         Z+g8VbgtYVuMKeDoWaB1vNctuF5fOCwM4Fja+z0KBiVpW0+8oz/702vN31PddLkqahRE
         41GK9JdX/mabxNMI1Zu2qRYBrcDcXDamDgND81tygr8ei4WOYGB4osgc/5RGUEefFoCZ
         sYkjsUFkd5OJ+++CBCRZFk14IomPD9cWkGsSv7JwGClPWJ7BIqvzhW0zyWadmP9BFu5o
         JCxE86+Zzhb64c+/0dSwLA96kE+FcztMmkCyu44rZZoR4DDI1GAsg2WW1vKrgfaemG3/
         36rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770222571; x=1770827371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uAVLIOe4T6ysRaNjtcm21azfsFJG6l2Sd25BlyIZhiM=;
        b=AuQLvGUgSKYBhFWQmp0+nxBkLhrLheMU2gtnGV9HLzgRd7JYZ0HFxeGfYEOp32dnKm
         1Ze9nzVPYFKLn8OkXcghac7JO6G/hkjl3PfEjH3yExBfmjhGZJKP8KzlMcpyMoABHt+U
         sEgi0415m62jKm2747HpMXlCQSO/ys21HXsHdDZZANVqu6hMNQJjk7cZT8qAwI5jq4mS
         5uUAoF/9bjDkBhPPFzue3Yy2k4b36dAdjPHY0gAKVzUwxGcm7zvLwgZ+wIS4B1iZSeUH
         bkTfp+1j9RBFfvHEDkKhcqKK/DpR3aIXVCcpMooYyRqSlDlvmGYUiA8BJFEHV6dPyEgf
         3zVg==
X-Gm-Message-State: AOJu0YwKI5G0nK+svuX9+NFc6kdCDQzimCaU0N/t/mury9fsrVMH5MU4
	UtVEQNZcaR8UqcmVOcyBuCqtT9kH3aHPJnOvrQzh9XCBd5YPg1nnt/SCgUGwCw==
X-Gm-Gg: AZuq6aJQA57y+2rsetfmBS3G7Hho9fc2PjTiocwHMRTR+mVGtQbvhUCFaPHS3t8msuX
	w/crEQe86Ppwx7D6+JDzqPlzRTgrqakpXJ46A9gPeezCYHGW+X7b+iyharGkQsfbO6fTUnQldKX
	z5+hfVp7P6f/EbWoIy7o+/dK+LPIAStjWcga6XGnUVp5MHoJnz11doycJuCKtIlBZdUkXtOIcsf
	YYhE2ILt6L12CPzAMPUU09DOxvIKBUxNjRqbOXBQv8RgSOUjWBlzzDySCmkUDRIiAzCFpVq1owL
	nqFn7a2LUvwlBn9aiLpetuaWqLfKWZyT6GGGaB0bKUP8Gm7GXClQz/+42LwKoUIhu3GgcobmeQG
	me0/WZjwkkW79uUjU0rizGrLZrsloU3qhUeel4vk08rzC/iejZ6/gmIt2qD3gpea4ZS67aOF4yz
	T96HuJEdGI
X-Received: by 2002:a05:600c:4e4f:b0:482:ef72:5787 with SMTP id 5b1f17b1804b1-4830e93eb28mr50248705e9.1.1770222570682;
        Wed, 04 Feb 2026 08:29:30 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830ec6fc89sm23293325e9.6.2026.02.04.08.29.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 08:29:30 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][whinlatter][PATCH 7/7] python3-aiohttp: patch CVE-2025-69230
Date: Wed,  4 Feb 2026 17:29:22 +0100
Message-ID: <20260204162924.3042284-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260204162924.3042284-1-skandigraun@gmail.com>
References: <20260204162924.3042284-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 16:29:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124142

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-69230

Backport the patch referenced by the NVD advisory.

The tests were only partially backported, as the original patch
touched some tests that don't exist in this version.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python3-aiohttp/CVE-2025-69230.patch      | 85 +++++++++++++++++++
 .../python/python3-aiohttp_3.12.15.bb         |  1 +
 2 files changed, 86 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69230.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69230.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69230.patch
new file mode 100644
index 0000000000..46f91b70ab
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69230.patch
@@ -0,0 +1,85 @@
+From 811f8df8521b0850f5c79931e2e8c17113dda421 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sat, 3 Jan 2026 02:53:03 +0000
+Subject: [PATCH] Log once per cookie header (#11909)
+
+From: patchback[bot] <45432694+patchback[bot]@users.noreply.github.com>
+
+**This is a backport of PR #11890 as merged into master
+(384a173022c9d057110c1418c5c4ff83a321900f).**
+
+Co-authored-by: Sam Bull <git@sambull.org>
+
+CVE: CVE-2025-69230
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/64629a0834f94e46d9881f4e99c41a137e1f3326]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ aiohttp/_cookie_helpers.py   |  8 +++++++-
+ tests/test_cookie_helpers.py |  8 ++++++--
+ tests/test_web_request.py    | 17 +++++++++++++++++
+ 3 files changed, 30 insertions(+), 3 deletions(-)
+
+diff --git a/aiohttp/_cookie_helpers.py b/aiohttp/_cookie_helpers.py
+index 4e9fc96..4edaa31 100644
+--- a/aiohttp/_cookie_helpers.py
++++ b/aiohttp/_cookie_helpers.py
+@@ -181,6 +181,7 @@ def parse_cookie_header(header: str) -> List[Tuple[str, Morsel[str]]]:
+     i = 0
+     n = len(header)
+ 
++    invalid_names = []
+     while i < n:
+         # Use the same pattern as parse_set_cookie_headers to find cookies
+         match = _COOKIE_PATTERN.match(header, i)
+@@ -193,7 +194,7 @@ def parse_cookie_header(header: str) -> List[Tuple[str, Morsel[str]]]:
+ 
+         # Validate the name
+         if not key or not _COOKIE_NAME_RE.match(key):
+-            internal_logger.warning("Can not load cookie: Illegal cookie name %r", key)
++            invalid_names.append(key)
+             continue
+ 
+         # Create new morsel
+@@ -209,6 +210,11 @@ def parse_cookie_header(header: str) -> List[Tuple[str, Morsel[str]]]:
+ 
+         cookies.append((key, morsel))
+ 
++    if invalid_names:
++        internal_logger.debug(
++            "Cannot load cookie. Illegal cookie names: %r", invalid_names
++        )
++
+     return cookies
+ 
+ 
+diff --git a/tests/test_cookie_helpers.py b/tests/test_cookie_helpers.py
+index 6deef65..28addb2 100644
+--- a/tests/test_cookie_helpers.py
++++ b/tests/test_cookie_helpers.py
+@@ -1,5 +1,7 @@
+ """Tests for internal cookie helper functions."""
+ 
++import logging
++
+ from http.cookies import (
+     CookieError,
+     Morsel,
+@@ -1374,14 +1376,16 @@ def test_parse_cookie_header_illegal_names(caplog: pytest.LogCaptureFixture) ->
+     """Test parse_cookie_header warns about illegal cookie names."""
+     # Cookie name with comma (not allowed in _COOKIE_NAME_RE)
+     header = "good=value; invalid,cookie=bad; another=test"
+-    result = parse_cookie_header(header)
++    with caplog.at_level(logging.DEBUG):
++        result = parse_cookie_header(header)
+     # Should skip the invalid cookie but continue parsing
+     assert len(result) == 2
+     assert result[0][0] == "good"
+     assert result[0][1].value == "value"
+     assert result[1][0] == "another"
+     assert result[1][1].value == "test"
+-    assert "Can not load cookie: Illegal cookie name 'invalid,cookie'" in caplog.text
++    assert "Cannot load cookie. Illegal cookie name" in caplog.text
++    assert "'invalid,cookie'" in caplog.text
+ 
+ 
+ @pytest.mark.parametrize(
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
index 84dd369753..6dc7acfbd5 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
@@ -11,6 +11,7 @@ SRC_URI += "file://CVE-2025-69224.patch \
             file://CVE-2025-69228.patch \
             file://CVE-2025-69229-1.patch \
             file://CVE-2025-69229-2.patch \
+            file://CVE-2025-69230.patch \
 "
 SRC_URI[sha256sum] = "4fc61385e9c98d72fcdf47e6dd81833f47b2f77c114c29cd64a361be57a763a2"
 

