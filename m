Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D15CCF2D6
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 12:56:24 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33750.1792414582172723654
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 05:56:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=F8yytgjM;
 spf=pass (domain: konsulko.com, ip: 209.85.128.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso18130375e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 05:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792414580; x=1793019380; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sclbHk0fGp3ZBzhNRgUGtseK5RIONTNweinLv7ikotw=;
        b=F8yytgjMHkRvFLxrjjyGw6xaHFol2lnonybxVvDn7mtZuIf/11IGOdOrhXKCj2vV+K
         FOtOSy8qbRmTaxmp2iSkxrfy6bu/yOm1dgMaO058IhNUjCqeN1+8nmQ7e1QEkK8LEH+0
         SyFrqol860/s1pyEp1e+50VgLiFz+ne4izdjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792414580; x=1793019380;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sclbHk0fGp3ZBzhNRgUGtseK5RIONTNweinLv7ikotw=;
        b=DIuZtIUZipjierWlGBNEA3fKBLnDVRbd4xMD9SGHS13Zk16n2gGocF9qHMB9w9m0qE
         ma+WW35HZJ6C/38wARFLFNKJfl5MPRcJO2x6GuA0cRprEr8DtlcIq3ecHPGy0zNyDvwM
         s6hXQ6ip6w7BMFVOSrYQEXC++fh2rI++eB3mPCyW7aHf2cUv4S7azxLHIbvWyWCBqbto
         U6HH/19MsypBmr9GEfg7ua33zIeMtyMPPE450X3+98s2RCLSxULyq+mYR2soDUC91lKf
         IysnE+BMK9597PCB04ukpUfMe3pcT2BkMu/KOUCUEnybEqcRCnzDm0/hZ0ClNUiLYNyH
         eXHA==
X-Gm-Message-State: AFq9FYLgqTLgUGgrL5mBSb+3dC+lu9QbWfFI/R0dfmQtsvs51wf17Ujo
	Z5YqT9Ss3SMZ7Idu3hW0mho2mvTKL93lrulIgJy8FwLCAWBKXE6XKjTAvtrm5A4HLAqRyUz3qVY
	/BIjR
X-Gm-Gg: AYBFou0OyrPZiT9nJHG0kTxGl4Pl+cxJcxcqJyAOaiOVjKzgrEyoIQQhmOB0MEg7qWM
	Ze/S97Sfxlje7lgNV0L15QlrMfx+GvI+kUMkKEen63JTWZaHxm/w62rdQ8xMOD+W3FpGgAXKgk5
	jf798BTA9PrD0+Z650fa2PJAv8GNpC5cQ3LKjMfY60O+t7O9rzvDCJ4XbfnjGg2Fqo1qCGk4NdZ
	j/5RkE+o16v5GKYRin9Nyi9VWdtQLP9ZQF16ie3oRqguYmIu7xmLSOaoeFXSZmUfoFTRdEaRrDR
	Jz1E7nj+PqMYZngtmFlhtsmEoYJ61jWIFzmfLkMwY9RMj9z/mZSZdLZwRyRAoWI0gJZFK6VuvWY
	uiYaO1Sx7gnuunEqfA2sWbItzMPHRfnaLamf/+Xb0aeGEFeAbH4835MKvTwlV8QjVXnh6Hz85ZU
	EW1D9pNmSG4sYQYQ/9klirOxET4CrpXUpTUJ9jXQ4omI90LNo/zpak6JtvF1Xe32xMYzny+N4U0
	5WmFTxx1O2/lL2TAySfC1pp/5pzoL1WFk+GTrY/BNzx4RWPTMOogTKFpYXJBh4dgF5VrW0rMJb1
	I0VWnBxh2v3GoFUtYN1dXAE=
X-Received: by 2002:a05:600c:820a:b0:4a0:eae0:769a with SMTP id 5b1f17b1804b1-4a1d7616cfemr146738045e9.28.1792414579945;
        Mon, 19 Oct 2026 05:56:19 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1afbf534sm1527565f8f.35.2026.10.19.05.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:56:19 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 01/10] python3-autobahn: Upgrade 26.7.1 -> 26.10.1
Date: Mon, 19 Oct 2026 15:56:07 +0300
Message-ID: <20261019125616.3888504-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 12:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131116

Upgrade to release 26.10.1:

General

- Load the vendored FlatBuffers runtime only when a FlatBuffers
  message is first built or parsed, instead of on every import
  autobahn. The runtime imports numpy whenever numpy is installed,
  so up to 26.7.1 every process importing autobahn also loaded numpy,
  including WebSocket-only users such as Django Channels applications
  served by Daphne. Every autobahn import now needs about 13-17 MB
  less memory on CPython and 18-24 MB less on PyPy, and none loads
  numpy. A new documentation page (docs/memory-footprint.rst, just
  memory-footprint) shows the import memory footprint per release on
  CPython and PyPy.

Wheels

- Publish native Windows ARM64 (win_arm64) wheels with NVX for
  CPython 3.11-3.14, built on GitHub’s windows-11-arm runners (PyPy
  publishes no Windows ARM64 interpreter); thanks to @ndabas.
  cryptography currently publishes no win_arm64 wheel, so the build
  compiles it against an OpenSSL from vcpkg.

- Build cryptography against an OpenSSL from vcpkg on Windows x86_64
  too: cryptography 50.0.2 publishes its Windows PyPy wheels for PyPy
  8 (pp80) only, and the pypy311 wheel build uses PyPy 7.3 (pp73), so
  pip builds it from source there.

WebSocket

- Make all four per-message compression extensions
  (permessage-deflate, -bzip2, -brotli, -snappy) enforce the
  decompression budget the same way: decompression stops near the
  remaining maxMessagePayloadSize budget instead of decompressing a
  whole frame first, and “over budget” as well as “budget already
  used up” raise PayloadExceededError. brotli now bounds its output
  with Decompressor.process(output_buffer_limit=...), snappy is
  decompressed one framing chunk at a time, and deflate no longer
  lets one octet through once the budget is used up.

- Add autobahn.exception.PayloadCorruptError: every compression
  extension now raises it for input it cannot decompress (corrupt,
  truncated, or not the extension’s format), instead of the library’s
  own exception (zlib.error, OSError, brotli.error, …), and snappy no
  longer accepts such input silently. The protocol fails the
  connection with close code 1007 (invalid frame payload data), the
  same for every extension and on both Twisted and asyncio.

- Fix permessage-brotli failing on the second message of a connection
  when context takeover was negotiated (the default): the compressor
  and decompressor were reused after their brotli stream had
  finished. Each message is now a new brotli stream, which is the
  wire format brotli used for the first message already, and for no
  context takeover.

- Fix an asyncio WebSocket connection being left open, but no longer
  serviced, when an exception escaped the processing of received
  data: the connection is now dropped, as on Twisted.

- Add a documentation page on WebSocket compression
  (docs/websocket/compression.rst): for each of the four extensions,
  which Python package and which compression library (and bundled
  version) it uses on CPython and on PyPy, plus context takeover,
  decompression limits and the handling of invalid data. The old,
  unpublished page under docs/work/ did not cover permessage-brotli

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...Skip-march-guessing-for-external-cross-toolchains.patch | 7 ++-----
 ...hon3-autobahn_26.7.1.bb => python3-autobahn_26.10.1.bb} | 2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_26.7.1.bb => python3-autobahn_26.10.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn/0001-Skip-march-guessing-for-external-cross-toolchains.patch b/meta-python/recipes-devtools/python/python3-autobahn/0001-Skip-march-guessing-for-external-cross-toolchains.patch
index 8f2e8f0d01..0161b09eb5 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn/0001-Skip-march-guessing-for-external-cross-toolchains.patch
+++ b/meta-python/recipes-devtools/python/python3-autobahn/0001-Skip-march-guessing-for-external-cross-toolchains.patch
@@ -1,4 +1,4 @@
-From c677aa7a80fd551abb391a8f6abd28dc9f5c43a2 Mon Sep 17 00:00:00 2001
+From 2afdc29c60812d16708041c3c48ebf8674a5d16f Mon Sep 17 00:00:00 2001
 From: Leon Anavi <leon.anavi@konsulko.com>
 Date: Mon, 20 Jul 2026 15:52:32 +0300
 Subject: [PATCH] Skip -march guessing for external cross toolchains
@@ -16,7 +16,7 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  1 file changed, 33 insertions(+), 3 deletions(-)
 
 diff --git a/src/autobahn/nvx/_compile_args.py b/src/autobahn/nvx/_compile_args.py
-index 2a35ab31..173e5fd4 100644
+index 2a35ab3..173e5fd 100644
 --- a/src/autobahn/nvx/_compile_args.py
 +++ b/src/autobahn/nvx/_compile_args.py
 @@ -81,6 +81,10 @@ CIBUILDWHEEL : str, optional
@@ -83,6 +83,3 @@ index 2a35ab31..173e5fd4 100644
  def _get_target_machine():
      """
      Return the *target* machine architecture for the build.
--- 
-2.43.0
-
diff --git a/meta-python/recipes-devtools/python/python3-autobahn_26.7.1.bb b/meta-python/recipes-devtools/python/python3-autobahn_26.10.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-autobahn_26.7.1.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_26.10.1.bb
index c24f1ef95d..9150e92981 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_26.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_26.10.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=49165a577911c4178e915dc26e2802a3"
 
 SRC_URI += "file://0001-Skip-march-guessing-for-external-cross-toolchains.patch"
 
-SRC_URI[sha256sum] = "c6949a2c6eb95fb1c218837dbda0a59abbbebafb8b11098551c01a7061dfd245"
+SRC_URI[sha256sum] = "0acc00895d4d3b06b55e4c945592d426033062c989ca2910749777a855faa27a"
 
 CVE_PRODUCT = "autobahn"
 
-- 
2.47.3


