Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6845.1794458708251688266
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 20:45:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=JDUhulX8;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b612fd74e1so1393113b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 20:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458708; x=1795063508; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bnhZOEUmH7DZgb+dCxIVsEa2abQGsaAOGIYQhRfpgCQ=;
        b=JDUhulX8lJLkY3NBEhMYWnQ7B0h4QTahm6l0pxJ8r7pu95qVrKHvvw649G8ietEb7T
         MlnuyA0+ki+FJ5tDmHzm42d5ANd/nnbin+WyPvAe6c/MVxd5oAXuB1BWd1o729/oBmTn
         zXh7bCYXDoNp3nRda+ZUrKnIRdLBcLcRMb8xjdi4EqAJ+PtXr2f1bKco2nTwQrUGJ+bq
         deUW8FNqFkyZG7Zb4RVS3Y4Ey//WD4LCpillWP9M9HSIrfkZH/2TV20ByJamvuwQ/B0h
         CkrAstRzqbNyYXXAZsFYTMSxuWD3cobN4CRLvOhBaYhBg/+/inwMagdTHmFK7yqVaOOX
         czLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458708; x=1795063508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bnhZOEUmH7DZgb+dCxIVsEa2abQGsaAOGIYQhRfpgCQ=;
        b=wb8xDDEOMkApy5DIvBWn1zOfBCl9u0PwZYW3Es28DaKssgl5ANrduVHFWsldExZvnq
         IsCxYDX6FVVFyuCO5aDW9s/G8IkoKinrvuC39wz0cMgxbGC7Jva75otvPwaB09hfmy6V
         W7UAYuqmneK6eKAeLwpxzKyJR/fCYd+Tw2IsGf69KMPHccNJRdY1syMkyRvK/nvRvhQ3
         B4FzJaIviAApXkOIQ14zIyaY6GXfAhpdYzGc3YjDJMOqOly1nJlWkErWYfIZvQSL4xVV
         vd6nzxL9OEGv+hia0TA3WHonWw63vbljxtMskmJsGGMzDDnKwQbmu9mJEgrCu/dgx2HI
         U8ZA==
X-Gm-Message-State: APuU4Z+bnRVyhjG3+yAlhC3wFJExs7xsme6Sxg0kTpKOJqiZv3QvA3+9
	jLdWYW+CzofrGbR71Pfzl3/ykTLysPps5SuG7YRRShxxyeCdZbAybFMi+X1f0Q==
X-Gm-Gg: AYBFou3jSa/O81ZaYIV0XPpPEc59tDpE7l2xBYXh+Ze9ols32qkQzl+66olRYmKPoCo
	NVjeqZfsQ/8l+3VwfsZbOyfPg2QKEeDN03+0OBppEtbpnqrpTM4nP2pEXdkfwsFd2D29BV8aRV3
	tpYt1yg7aP5362mtd67606vLl1i/jzpPm0FBSDX42pEgpPDz41W6YMDLeXl0Tjb2rN8Ugh8CesE
	/GbAYY1JDXu5wcoB61ubQaeIoybEebtdzWQ6ZCfCrtjY2TX8lrqsTdFlm+COKsnARLLHIgAwz9n
	DZdlqcRYZhE8LNuJU1GNcUmJA+dKIi9wHo3D9kRM+vWCruXM1txyQhnqMk59MItNx8LQLkAWeIt
	OA6ScJMSnd+xAuRmixEmY3GrbCV7Y5vYcZGA0I3UwCsDXqU3YCHVObare1sp6UngUc8GCgRlIvA
	O1cLqqM/GrL9/gVwyTOiEB/MN8Wh/11s1qMv9PG+wzHyZXR2oqll0OQtUMTSKvzOK0l+Ecr7c0l
	PnqO/UPMpYHnKjouAbGEGNFVANUD7mckellTCeDEexhZ1T7YmpfIx/VjXCkB4fzYr2ddu42946w
	m9lUwXxVJqd/Q8PIp5L5w2DuP3VSF5GYgkOLZ9jw+bWMYvUqhmDcDBCjmGqlLw==
X-Received: by 2002:a05:6a21:778d:b0:3eb:39fd:badf with SMTP id adf61e73a8af0-3f2f749d75amr3644779637.0.1794458707582;
        Wed, 11 Nov 2026 20:45:07 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d7dd5bbsm2238527a12.30.2026.11.11.20.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:45:07 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][blacksail][PATCH 15/16] python3-aiohttp: patch CVE-2026-111750
Date: Thu, 12 Nov 2026 17:44:25 +1300
Message-ID: <20261112044426.3933391-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112044426.3933391-1-ankur.tyagi85@gmail.com>
References: <20261112044426.3933391-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 04:45:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132166
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-111750

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python3-aiohttp/CVE-2026-111750.patch     | 82 +++++++++++++++++++
 .../python/python3-aiohttp_3.14.3.bb          |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111750.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111750.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111750.patch
new file mode 100644
index 0000000000..ff9088ad3c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111750.patch
@@ -0,0 +1,82 @@
+From 18e23a890422e952b0fdbf09e02794adda56c120 Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Wed, 9 Sep 2026 01:25:13 +0100
+Subject: [PATCH] Fix head request parsing (#13671) (#13673)
+
+(cherry picked from commit 5789546e37fe35af27d0a2f840870b22bc15bfc4)
+(cherry picked from commit 9b27347e61454d9f8ca2055f4c67a37dee336e83)
+
+CVE: CVE-2026-111750
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/9b27347e61454d9f8ca2055f4c67a37dee336e83]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ CHANGES/13671.bugfix.rst  |  1 +
+ aiohttp/http_parser.py    |  6 +++++-
+ tests/test_http_parser.py | 27 ++++++++++++++++++++++++++-
+ 3 files changed, 32 insertions(+), 2 deletions(-)
+ create mode 100644 CHANGES/13671.bugfix.rst
+
+diff --git a/CHANGES/13671.bugfix.rst b/CHANGES/13671.bugfix.rst
+new file mode 100644
+index 000000000..e6fbc7000
+--- /dev/null
++++ b/CHANGES/13671.bugfix.rst
+@@ -0,0 +1 @@
++Fixed pure-Python request parser not reading a body in a ``HEAD`` request -- by :user:`Dreamsorcerer`.
+diff --git a/aiohttp/http_parser.py b/aiohttp/http_parser.py
+index 678aee020..947060c9a 100644
+--- a/aiohttp/http_parser.py
++++ b/aiohttp/http_parser.py
+@@ -433,8 +433,12 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
+ 
+                         assert self.protocol is not None
+                         # calculate payload
++                        # https://www.rfc-editor.org/info/rfc9112/#name-message-body-length
++                        # https://www.rfc-editor.org/info/rfc9110/#section-9.3.1-6
++                        # EMPTY_BODY_METHODS should only apply to responses.
++                        # self.method is None on request parser.
+                         empty_body = code in EMPTY_BODY_STATUS_CODES or bool(
+-                            method and method in EMPTY_BODY_METHODS
++                            self.method and self.method in EMPTY_BODY_METHODS
+                         )
+                         if not empty_body and (
+                             (length is not None and length > 0) or msg.chunked
+diff --git a/tests/test_http_parser.py b/tests/test_http_parser.py
+index fcc1b6018..e9d40532b 100644
+--- a/tests/test_http_parser.py
++++ b/tests/test_http_parser.py
+@@ -2181,7 +2181,32 @@ def test_http_request_chunked_payload_and_next_message(parser) -> None:
+     assert not payload2.is_eof()
+ 
+ 
+-def test_http_request_chunked_payload_chunks(parser) -> None:
++def test_http_request_parser_head_with_content_length_payload(
++    parser: HttpRequestParser,
++) -> None:
++    smuggled = b"GET /smuggled HTTP/1.1\r\nHost: a\r\n\r\n"
++    text = (
++        b"HEAD /test HTTP/1.1\r\nHost: a\r\nContent-Length: %d\r\n\r\n" % len(smuggled)
++        + smuggled
++        + b"POST /next HTTP/1.1\r\nHost: a\r\nContent-Length: 0\r\n\r\n"
++    )
++    messages, upgraded, tail = parser.feed_data(text)
++
++    assert len(messages) == 2
++    msg, payload = messages[0]
++    assert msg.method == "HEAD"
++    assert b"".join(payload._buffer) == smuggled
++    assert payload.is_eof()
++
++    msg2, payload2 = messages[1]
++    assert msg2.method == "POST"
++    assert msg2.path == "/next"
++    assert payload2.is_eof()
++    assert not upgraded
++    assert not tail
++
++
++def test_http_request_chunked_payload_chunks(parser: HttpRequestParser) -> None:
+     text = b"GET /test HTTP/1.1\r\nHost: a\r\ntransfer-encoding: chunked\r\n\r\n"
+     msg, payload = parser.feed_data(text)[0][0]
+ 
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.14.3.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.14.3.bb
index 78845ffb56..81ed8a849b 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.14.3.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.14.3.bb
@@ -11,6 +11,7 @@ SRC_URI += "file://CVE-2026-111063.patch \
             file://CVE-2026-111066.patch \
             file://CVE-2026-111748.patch \
             file://CVE-2026-111749.patch \
+            file://CVE-2026-111750.patch \
 "
 
 CVE_PRODUCT = "aiohttp:aiohttp"
