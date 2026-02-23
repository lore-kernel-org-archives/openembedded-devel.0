Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DCFFEA4FD7
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 15:19:56 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37443.1771859986153051087
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Feb 2026 07:19:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=pq4ENFVY;
 spf=pass (domain: konsulko.com, ip: 209.85.128.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-483770e0b25so41135175e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 07:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1771859984; x=1772464784; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Jb7r+tqB7r+B27Kxto0zHK8WWfXMxfmYo/jmfChOPQ=;
        b=pq4ENFVYIg+yrvP5bTzDXhDmr/3Ns0LlqWw0zhMqaCo1TG/p/Y5DYpdCEufSwqapqo
         6R8k1gsKZ6wECdH3rw70XWXLsfXKXzer5ME/hiURHRpwcqZ4MRwgvRoxzbqfz3x2bOvZ
         EaPe+5uy21IHoXdZg3u+DIeXlmyGOqrmCHpeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771859984; x=1772464784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Jb7r+tqB7r+B27Kxto0zHK8WWfXMxfmYo/jmfChOPQ=;
        b=NpPNPXtMW29kHgPyEHepvC67poVwBd6M1hLfjjSfIbTEO4SXvPw2VOS006G+Pf/lA3
         wN86Dt+/m7nm/snPuHlVeMBZD+GF/kvTgVLPff+kEp02X7m3dRhtGdJUrUnsem4pXXTo
         8g+wUYaxkbnF7VyhFLy3OYv/+alfexDYE7Wnhykqho29wL3SvNCb3xR9dseoU3Nlse6i
         QBLP5384jlR/SkqKDcuAGMwSP/0PkGN+loDHwMMnSosSFSYGDcmGDZSUXAbq5170Gq1r
         T0iPfc8ANim/e7sND7hQRYhA639LkiZ4oHrnqRCdQhPbLrNNwLtkIVInMjVyqVJAyJY5
         SttA==
X-Gm-Message-State: AOJu0YyEBEWS42s1CyIyfwY4MRhcxTk+P7fhGnkBazrg944H+zP16XTD
	ucpUaR+H8rMm1lpugd+P/XLGwdMNVBN+Z5WaUO5NZFPFpZEMvBRq2yCkDBL6CtXUGgoEjhbl0dE
	ClFcb
X-Gm-Gg: AZuq6aJybMXOZ6byMKX2tFaKohh90mP2XBOzUtCvw0f6rrr3k3Xqhsi4v1I3y/B1nn+
	OjvLNBisOITDsr0GVCE07sWZs9rRiGw5v0Zf55WDbp8+Ko7fgtRppLRaNFJuH7LsVqbgplFyWrS
	nRJG7lTY/3piuQJL7wigf89J8KW6d4HI6MuHe9pKAQ6UDbzyK3Ekagr8VQ/Zu3ixkks18WIO99n
	KACDfvu5RBim5CkQwyD30kHU6fyfP0etP1pGKNiMISEinbbhGfoLzYbAnPvhELp+h41yvX4gEXJ
	bYPTZ9oou6NX8OMBT8AI8dKSGE0kpixRXZfY+uU2hUM3jZAr53Waa2Xe/ElQ/YAJo5/n2gPMIGL
	UbNa+TU1+aPlNl8ePyhKRPBmhxfGOHgyj2bBR7FMM8AOrfuhwCP4fkRI3EkXf9A5j+XhTuNhD0F
	wK9YrDDP/HWtChkLny8HAmlYVLb1xlVNUBuzsI
X-Received: by 2002:a05:600c:8b16:b0:480:68ed:1e70 with SMTP id 5b1f17b1804b1-483a963de73mr202480025e9.35.1771859984068;
        Mon, 23 Feb 2026 07:19:44 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9cb4bb3sm195184285e9.14.2026.02.23.07.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 07:19:43 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-gunicorn: Upgrade 24.1.1 -> 25.1.0
Date: Mon, 23 Feb 2026 17:19:39 +0200
Message-ID: <20260223151939.1352991-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223151939.1352991-1-leon.anavi@konsulko.com>
References: <20260223151939.1352991-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 15:19:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124551

Upgrade to release 25.1.0:

- Control Interface (gunicornc): Add interactive control interface
  for managing running Gunicorn instances, similar to birdc for
  BIRD routing daemon
- Unix socket-based communication with JSON protocol
- Interactive mode with readline support and command history
- Commands: show all/workers/dirty/config/stats/listeners
- Worker management: worker add/remove/kill, dirty add/remove
- Server control: reload, reopen, shutdown
- New settings: --control-socket, --control-socket-mode,
  --no-control-socket
- New CLI tool: gunicornc for connecting to control socket
- Dirty Stash: Add global shared state between workers via dirty.stash
- In-memory key-value store accessible by all workers
- Supports get, set, delete, clear, keys, and has operations
- Useful for sharing state like feature flags, rate limits, or
  cached data
- Dirty Binary Protocol: Implement efficient binary protocol for
  dirty arbiter IPC using TLV (Type-Length-Value) encoding
- More efficient than JSON for binary data
- Supports all Python types: str, bytes, int, float, bool, None,
  list, dict
- Better performance for large payloads
- Dirty TTIN/TTOU Signals: Add dynamic worker scaling for dirty
  arbiters
- Send SIGTTIN to increase dirty workers
- Send SIGTTOU to decrease dirty workers
- Respects minimum worker constraints from app configurations
- ASGI Worker: Promoted from beta to stable
- Dirty Arbiters: Now marked as beta feature

License-Update: Update years

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-gunicorn_24.1.1.bb => python3-gunicorn_25.1.0.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gunicorn_24.1.1.bb => python3-gunicorn_25.1.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-gunicorn_24.1.1.bb b/meta-python/recipes-devtools/python/python3-gunicorn_25.1.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-gunicorn_24.1.1.bb
rename to meta-python/recipes-devtools/python/python3-gunicorn_25.1.0.bb
index f7951b9b32..a8b06786ae 100644
--- a/meta-python/recipes-devtools/python/python3-gunicorn_24.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-gunicorn_25.1.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "WSGI HTTP Server for UNIX"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5b70a8b30792a916f50dc96123e61ddf"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5dc9171ccd8fcbd7827c850148b3ca98"
 
-SRC_URI[sha256sum] = "f006d110e5cb3102859b4f5cd48335dbd9cc28d0d27cd24ddbdafa6c60929408"
+SRC_URI[sha256sum] = "1426611d959fa77e7de89f8c0f32eed6aa03ee735f98c01efba3e281b1c47616"
 
 inherit pypi python_setuptools_build_meta ptest
 
@@ -15,6 +15,7 @@ SRC_URI += " \
 
 # python-misc for wsgiref
 RDEPENDS:${PN}-ptest += " \
+    bash \
     python3-eventlet \
     python3-gevent \
     python3-misc \
-- 
2.47.3


