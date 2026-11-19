Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1904.1795113480863662115
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:38:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=d812yLhK;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a4c72951b8so89691b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113480; x=1795718280; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bnhZOEUmH7DZgb+dCxIVsEa2abQGsaAOGIYQhRfpgCQ=;
        b=d812yLhKcZLWBwYRooB9/v7XV1TgtUHRBcY98Advkh8X/7RuP6AXOPB4dcpnpXn5fX
         USgPPUsx51LdqT6wJCJc7TmECwDTb2LU+GuX6fdY23mdi4ub4vRdNd6aQVq190HWuzWc
         Eee+LVFJSZy04dg/Di8VxPsFKfPPm89mmWjhVXEtSTFcmcFtUjzZ5BMVwW+2B2iyGnXm
         rRZ4CXSX/fydIdyc89+eVgVo3iaizoECL0WRESFeYvU9ioW+yKjRK5YFCiaVn4a8z1V3
         V/vRXKDY4/ZWNa7T/pxKWO3qtMJGeL+cGdWJjIHOp73AinlQucDApcYT0mNEmCJn+SVr
         S1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113480; x=1795718280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bnhZOEUmH7DZgb+dCxIVsEa2abQGsaAOGIYQhRfpgCQ=;
        b=dx4GaQWqqJ5m1cxmw3/RB1t77v/2vWEDH/d2eS9tgB3orGjVnswu1tRe+6IsRn5z98
         ZW+GeCEgPNbWoAvQJ3iQ3LWDEyVU9QmYjw3BXjBVrkBi8yI8O+uf3WFXc0F6mJlTqvLG
         3pirfBjSpiAFGYwqOw8vq43r/ERiNB+0Hy17oVMbP64a8YLR6MRP18RVHJPl0e7Jf1Cq
         JQTqx+JgxZkImQVnhsf+55edcDPfMEi/ox2bXqlbwybINod7rCvnb66JBs7imrga56BC
         2ODSgejY53/9qQ3WxWRbVD3YTOkw7sU+oVQAcx1ePBRNMayskXTSEDtoh55GsSHbrt5Y
         143Q==
X-Gm-Message-State: APuU4Z+3NAb0+UOO3RpdDAUe4E3Vg0KgENPrMpRfpcKIsmVRxw8QdTGq
	2TpkeGSMwyCiiF93wznV8XJEKOZr/Y/cHK3S/FB/30YxZmZfHYKPtj/PfvEzYw==
X-Gm-Gg: AYBFou2HFbUYn+SU+4NBR47/ycd1wn6wNqFTiivL1yA6/1IaiErmyRWRprjpwEIGrvM
	uDJwS5WzZRWjukP/lArYhMzLxIe8QaL6TFtHK/gieT9WdImDbLbM9wfsdsQbzUSjFYCmQUfvDk7
	EOuBqhlPLzewz7EDwW90lQzXvC3wE8emfB9t0bEOu1IA2RIQMr5M02d29gqJMCiAqwIKqidmunQ
	6ba+lRrzIThRuaHUPkDe61PDb95fCca+uoUSP3RY8/U/Zg3ecJ8rKk0s2b8DnwjjSmqXyW6d4uY
	bDluo1NzhaPLroLp0NwndY6ygFxwQnypd+e68jSlT1PYfWVnmj6/ir6c1ncZws7/PPHUeRx7GjP
	uduo5jGBQJcRr3d3FFAvieOCNylCXIIXnAZYuPD5/em27p/NsEMUZTN433ImEybTwDPZ0grz++J
	wo+ioHNMjcmLAf/0yHpOjmDNR+DhUxxtfmr0dFcnUzwF1pThMUtUAhsOVjbFiV9zS0rjZOQoCwK
	ZXsBJFz5Z/Z9NCRJDLOPbMQq9DN4LCfbgsU0Wz/8QpwqSZL8/oZoYLSYJIlqbbfqXMBcsrmEBV+
	gTi2CVqiBFguYYEnXtw7USCmzc6sKQL2btZPlAr9NU8UxS5RFsk/0F+VhL2Axw==
X-Received: by 2002:a05:6a00:2d06:b0:89e:fe2d:abe2 with SMTP id d2e1a72fcca58-8c87c862ab8mr415289b3a.44.1795113480185;
        Thu, 19 Nov 2026 10:38:00 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:37:59 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 50/64] python3-aiohttp: patch CVE-2026-111750
Date: Fri, 20 Nov 2026 07:33:18 +1300
Message-ID: <b26454909fe83d8451fc8351b838d1f8f5b0b225.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:38:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132740
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
