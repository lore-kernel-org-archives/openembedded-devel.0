Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC895D2A01E
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 13:01:24 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9432.1768395683031172283
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jan 2026 05:01:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ao+ZKGD5;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-81e98a1f55eso2495982b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 05:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768395682; x=1769000482; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m91cFtlZeWmoe9cf6fmEzVxtY0HGYpJsWmxwoyidTBs=;
        b=Ao+ZKGD5gX4o26EPxBMQn//5LiAEopyrgVgAErA0dMAEqfA3nB2jYeyEcnJNJN7fdM
         wYWr0H24hCtTWU9mFSFZMfK6G2Whijrhnq6myPMAM2Uz3F1DTIBFYBsnX4a5SgB99Bmn
         iouvSsn32R0tKvjqyotlRw3GyLPnnDuSWoXiNnvQrzBdPP5FFOTT35m750d5Urm+9w83
         jJL1xyTNVujhv+Anm2IA8R7wmrND5iIjxvW9Ts/Axbe5+10sKtzJ+EAodj5GJsuVOAom
         FSszeFyYMxhnf6Ab8ZgNWmoA2Qu8hCjBgNhYz/Mq/A6VFaskWIqSBgdodAfCtwS97WSo
         yl3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768395682; x=1769000482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m91cFtlZeWmoe9cf6fmEzVxtY0HGYpJsWmxwoyidTBs=;
        b=doQtPq29CkMsVvbCchGdMBRp61hDvRP5BIeWlrXYj5Pq3hBj8O1stghqBuJ9a3A/SG
         Kyl/uCjPpAA4fgz+UmQFyXrnUzsltj4eMAyz8/Fm/ufSZG5TmcCqV8tlRLzhMpUO1xCr
         0mO1XvXFLJQpq6Q3EKHAeGEREICBnnVPuyh9Z7rC9wzdxZRYImjxMzJ0AeMATjHPdvLt
         isUGXSxycSfxzF2dPLuwVn+oZbFi03cxXOf8/4ZyH68vAqKwybRqwnDY6eQ/g7399qIE
         TpI8kgDbBR5PiPjQ/rKbbvDfBchJ8iHdGxCym0TrKyAjjNmMogU65/yLYjKAfLtJAZeG
         9fKQ==
X-Gm-Message-State: AOJu0YwzgYmm4YYDOImk2gyE446YWF/BTCGxg0Yk/ti0V5WqUnfX41kn
	fmhcQbJgmvnFaPLJo/Quw8+wQJ6DSxJ/TTpws1CEdXxTpC65I+u+h2oL6i7oBw==
X-Gm-Gg: AY/fxX56CQOmxkCpqijmgC5VpEukhVIlKhmmDusItaXnFiJjSkkRpdLByvHNY1JT32/
	sg4JWpdlzVx/jpABvwGwgrzM6BiFuWdOxpZE/MzReQ6gCdexu8xMQ86Wvso7Y03IFtTmuHWzpRg
	bXDVnMxLfTPK2BVTjYNg/3LyNhVuyC9oyfx2sv5L3DLPoo13BmuSM7dU66AXglY5S9TyzOXeeOt
	t4xB4H0nrXwpDLVkckVfs6IG+RJ8JIjjBd4YWI/LEhjSLXMaPhd5+bXD7vc8TPTdS3utjrWPySt
	BYSjxsUfGloHz6kk2YM6nZll0OYnSoM2A9ip3AnJ+pQfJgeY70vbCcRGx5xHs7LOCVGSb3Se/Po
	pFOnpLcpG8cwRQOiYYPQ7IqXM5NG1XRfMcjy1BhvRe9IPJ3K9+aZ0YEsCCBFEVP/E+sHKeVIzWx
	2IhknOG/bXgXT67IIIavY7NwM=
X-Received: by 2002:a05:6a00:8011:b0:81f:7c24:724b with SMTP id d2e1a72fcca58-81f81cf0297mr2392959b3a.21.1768395680372;
        Wed, 14 Jan 2026 05:01:20 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819ab137711sm23340853b3a.0.2026.01.14.05.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 05:01:20 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH 07/20] python3-eventlet: patch CVE-2025-58068
Date: Thu, 15 Jan 2026 02:00:44 +1300
Message-ID: <20260114130100.1016416-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
References: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 13:01:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123460

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-58068

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python3-eventlet/CVE-2025-58068.patch     | 42 +++++++++++++++++++
 .../python/python3-eventlet_0.36.1.bb         |  2 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-eventlet/CVE-2025-58068.patch

diff --git a/meta-python/recipes-devtools/python/python3-eventlet/CVE-2025-58068.patch b/meta-python/recipes-devtools/python/python3-eventlet/CVE-2025-58068.patch
new file mode 100644
index 0000000000..45dda012b6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-eventlet/CVE-2025-58068.patch
@@ -0,0 +1,42 @@
+From 2353500dc28eab63b47930851c75e9268a69ef1e Mon Sep 17 00:00:00 2001
+From: sebsrt <s@sebsrt.xyz>
+Date: Mon, 11 Aug 2025 11:46:28 +0200
+Subject: [PATCH] [SECURITY] Fix request smuggling vulnerability by discarding
+ trailers (#1062)
+
+The WSGI parser is vulnerable to a request smuggling vulnerability due to not parsing trailer sections of an HTTP request. This patch fix that by discarding trailers.
+
+CVE: CVE-2025-58068
+Upstream-Status: Backport [https://github.com/eventlet/eventlet/commit/0bfebd1117d392559e25b4bfbfcc941754de88fb]
+(cherry picked from commit 0bfebd1117d392559e25b4bfbfcc941754de88fb)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ eventlet/wsgi.py | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/eventlet/wsgi.py b/eventlet/wsgi.py
+index 3b530b18..28ad2666 100644
+--- a/eventlet/wsgi.py
++++ b/eventlet/wsgi.py
+@@ -153,6 +153,12 @@ class Input:
+             read = b''
+         self.position += len(read)
+         return read
++    
++    def _discard_trailers(self, rfile):
++        while True:
++            line = rfile.readline()
++            if not line or line in (b'\r\n', b'\n', b''):
++                break
+ 
+     def _chunked_read(self, rfile, length=None, use_readline=False):
+         if self.should_send_hundred_continue:
+@@ -203,7 +209,7 @@ class Input:
+                         raise ChunkReadError(err)
+                     self.position = 0
+                     if self.chunk_length == 0:
+-                        rfile.readline()
++                        self._discard_trailers(rfile)
+         except greenio.SSL.ZeroReturnError:
+             pass
+         return b''.join(response)
diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.36.1.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.36.1.bb
index f70099ab94..72032c756c 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.36.1.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.36.1.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
 
 SRC_URI[sha256sum] = "d227fe76a63d9e6a6cef53beb8ad0b2dc40a5e7737c801f4b474cfae1db07bc5"
 
+SRC_URI += "file://CVE-2025-58068.patch"
+
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \

