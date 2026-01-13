Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E34D29DD7
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 06:35:49 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53747.1768286149169454444
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 22:35:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cXrvb0OJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-432755545fcso4190014f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 22:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768286147; x=1768890947; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DMSI60NZYnpVdFSQs1/81t5KEzgOhF4sWe/TgvpNTk8=;
        b=cXrvb0OJObq6uVqiaZYVTKxGBxa8yniE88TSuLSLy4s1GdTGjmuzLXdKUJEwr+p9T3
         j1ibBfc4VsRMkiz0A6eQVUVoi0UEQzjfVjZlc6I13q2eRrAAO1lfncm9gIyAFv2A41gA
         K/Zoa3iFV8s9t8UnL6UK8BxcS1KqrGMTwXvjWsWqj9YNcUl5YrkQHAJPKSVIRoVxu2Vt
         mSa1mZBX6OsnfB52QkCvXKImI8q14pFtdAEiX80bOgVew8EVrfUA7CUsjBPvG9nuNWSP
         ugjcHvRz7QtO4xdklWhBbxBxV6UTy/wD7QHvAIKWff7Mi++D9o/ROSQjlLcatPIa9fK1
         f/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768286147; x=1768890947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DMSI60NZYnpVdFSQs1/81t5KEzgOhF4sWe/TgvpNTk8=;
        b=r4IUrH1jc6QFbo7O3C3AnHSrpHQqYiBpVyokBuZsoqz7UjceJLxsVBYYAvjGrLSwOm
         Ab4R99+0BMiD3QBhdNqDfSnlQdoGB7EmnVuyBbHK4YOR1Wa4FGrjVeyWoC51UtDcn6NX
         IC3giMcntRht00NPqGDFLPggHwIZDRwKK3q/cGL75QuOkz8L9swg5zj09Il7P0+rOSd+
         ithwSKzadPMHMHyqiWVdC4pn+OGpuLDWx8FOQcE9Gx7SLgaBERNp2nqi0SBfMccs4SCp
         +Ljkecql+zkNyAbiEk1yYgXxsG56P0hxXDLItHeiELmBk1bOdhxemQlHhO3sC5MjoPtx
         w27A==
X-Gm-Message-State: AOJu0YyZWu70Kryy42KgVSwzIr8+GK+/QwkZnKZeE+SDWto0KOonLE/E
	KsPrknssXU3jyn7vHMoRyqXA1iG/KuF1is0s4W5O74uvOx8XbSqYhYV47qrvKQ==
X-Gm-Gg: AY/fxX43VAY8XOIeRvXN7r2JpZt1uSwcGqN9m179yZNHwk4a6DCQ1rtvC9vj+QlaPdl
	bzW3myhotS4CrMZNsnssvvkfgWGQqo72g8Mk3lr/4nLmQ96MGiOTT4Ytd5YgOCLrt7RbkBgbqMx
	5U04sevC362abXewXml5se2d6h48/qj8Z2SbiwbZDX918n22IrfbHrcy3jMznerShaGoGt0Yrtc
	bm4mi+7ZKxXr+2SH79s27oiO6jeFUL4JwUyZXowIai8toO09YGdV1LHMSH/qmCHJcy5vXU4ut9A
	ju+CySixiey25eA/pqviBtjWm1SpnLMOod3EvurZU9RfT4rmejDySylNZr0r4u4U7traMU+lIqs
	ER4pZVkvt3JtCAN8ViogSxLV9i1DKa6my8XOSd691uGW4TkEfYi+XVF8jRJGaI5rjyHdkLM/g08
	MO6OOvy+MU
X-Google-Smtp-Source: AGHT+IHZq5kibQuHThvQs/rBaqVeoaJhou4roLrFJahr2o+UhSCAToVVpu/0rO6Cyyw5D/5b6QwXTg==
X-Received: by 2002:a05:6000:2404:b0:432:dfea:1fb8 with SMTP id ffacd0b85a97d-432dfea2242mr13457645f8f.27.1768286147488;
        Mon, 12 Jan 2026 22:35:47 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5edb7esm42273385f8f.30.2026.01.12.22.35.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 22:35:47 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 2/5] python3-eventlet: patch CVE-2025-58068
Date: Tue, 13 Jan 2026 07:35:43 +0100
Message-ID: <20260113063546.1497839-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113063546.1497839-1-skandigraun@gmail.com>
References: <20260113063546.1497839-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 06:35:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123397

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-58068

Pick the patch mentioned in the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python3-eventlet/CVE-2025-58068.patch     | 41 +++++++++++++++++++
 .../python/python3-eventlet_0.33.3.bb         |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-eventlet/CVE-2025-58068.patch

diff --git a/meta-python/recipes-devtools/python/python3-eventlet/CVE-2025-58068.patch b/meta-python/recipes-devtools/python/python3-eventlet/CVE-2025-58068.patch
new file mode 100644
index 0000000000..3fc7cb1b54
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-eventlet/CVE-2025-58068.patch
@@ -0,0 +1,41 @@
+From 4e151d13a160e4d2a98dc77d32e5c3fe2c42f2b9 Mon Sep 17 00:00:00 2001
+From: sebsrt <s@sebsrt.xyz>
+Date: Mon, 11 Aug 2025 11:46:28 +0200
+Subject: [PATCH] Fix request smuggling vulnerability by discarding trailers
+ (#1062)
+
+The WSGI parser is vulnerable to a request smuggling vulnerability due to not parsing trailer sections of an HTTP request. This patch fix that by discarding trailers.
+
+CVE: CVE-2025-58068
+Upstream-Status: Backport [https://github.com/eventlet/eventlet/commit/0bfebd1117d392559e25b4bfbfcc941754de88fb]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ eventlet/wsgi.py | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/eventlet/wsgi.py b/eventlet/wsgi.py
+index 7ef0254..fb0d805 100644
+--- a/eventlet/wsgi.py
++++ b/eventlet/wsgi.py
+@@ -154,6 +154,12 @@ class Input(object):
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
+@@ -204,7 +210,7 @@ class Input(object):
+                         raise ChunkReadError(err)
+                     self.position = 0
+                     if self.chunk_length == 0:
+-                        rfile.readline()
++                        self._discard_trailers(rfile)
+         except greenio.SSL.ZeroReturnError:
+             pass
+         return b''.join(response)
diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.33.3.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.33.3.bb
index c1256661b4..12ee39aee9 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.33.3.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.33.3.bb
@@ -4,6 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
 
+SRC_URI += "file://CVE-2025-58068.patch"
 SRC_URI[sha256sum] = "722803e7eadff295347539da363d68ae155b8b26ae6a634474d0a920be73cfda"
 
 inherit pypi setuptools3

