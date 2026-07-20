Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC31C4452B
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 14:34:41 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10485.1784558071840463357
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 07:34:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Gk/4wmRv;
 spf=pass (domain: konsulko.com, ip: 209.85.221.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so7419651f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 07:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1784558070; x=1785162870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iXKLbZKIy2icSc/VcWwJBGA8ovbu/MaqwEc7usjy0AI=;
        b=Gk/4wmRvD65W7deHU+sfGMPWsABjiu70Ymm7KmHtHdTPg+ICj4y10/pShBSqHRbFBh
         /lf7sKFHfVXKzL6mEAR3JmHINXZPQY4XH4+xLV1EWljlif8Lh878U8kL34MxGT7SSZz6
         I2ZAQh8plCJeu5g5hpcJh2SR6bQjSknpt5cp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784558070; x=1785162870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iXKLbZKIy2icSc/VcWwJBGA8ovbu/MaqwEc7usjy0AI=;
        b=CsTGEaYNhT5TotWeHScLYbAAV6C4Tjxo94MfpOwPETsa8Njf7YrNR4a8wpiKSQidCe
         g5GKAD/gcieDjlB+OvGj1rpDCnfIteIiCRmD1LKQJFIGdXZ3zPZzVR4XVImw6neYIUWv
         7egk11gO7VgB9eiH1W8PaAnggTo37PojQ9AL78i69KsfWNbnVxkKasjepVa3ywMmle7S
         a4d3MXsqnz5z83/3fQBRCaTyces4bqQafvA9ierjHEqS466OyVQQcCCkBslPnR6KAC9a
         cNTDS74/qa8GDZKETvJfJMoVg8+7KC7VPT1NTQmBmA0yeYxuGt2wkISSbWY2gsW4UJa/
         sc5Q==
X-Gm-Message-State: AOJu0YxBm7T5Rnbbtu9KZFVTwO8TwDcMrZ9v5rIFFe+5JBakBbkAb7QZ
	9QpKoJeiwsrppZMwgMxZm1POi5JXF61fPbuwE9LXbUdZOObT0TK7CHRjUNtpeRNBsXSrNJ7xepm
	SGQf5
X-Gm-Gg: AR+sD13Np+DSMEF0aamKoOuXuNe+nJwZpwTgFzCE67IcVNjsoChHnG0FjfOjBMw921V
	ywsZ8FCEJoHV5O8o+sSOfshLjvUmnxQCoKIvJ5uOSPFa23KEb5COWpXWvoO8/j3Ce/oi6fU7ICA
	7HVQY76dD20oY+tDlDdIuYHDwWvpImaLWtqJSiGKXgshCerpIrtgIOhYxHHs4+UPBdHxxppYPve
	FtxOx9HuzHyk56NXd9jBwcjGIl84gLpRc7q9bHLkPlHwWSKLhL/YhpieNIDygVNr6xjAl+wdlLL
	gYpGl5gvVqKPMR+gt6r/yi/NCLm25RLnid/6s9z0USNlsJFC7+rRN+mlaZSZ14oLythFGbIJlft
	K+XxzpOc70S/1A+hkpEzOkzkDuYOHnIzf17maVSH1Cj9wE8hxm4M9SoB1f3SOl3aKESkRc7B18J
	8Vr2ZMca+coYes5ukBHfz9WAl9sB9fbROyMCQ3PhV3QMG/cRoOCIvFzPbhcF0bq8J5JhxabiclZ
	gNzeEsFJeTxEOOKPASUB4xCnQqc1Iotk+aFRZjwcQ==
X-Received: by 2002:a05:6000:2303:b0:47f:5291:fae with SMTP id ffacd0b85a97d-47f6233bec9mr17393362f8f.51.1784558069858;
        Mon, 20 Jul 2026 07:34:29 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63edd7d3sm29498970f8f.25.2026.07.20.07.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:34:29 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-autobahn: Upgrade 26.6.1 -> 26.7.1
Date: Mon, 20 Jul 2026 17:34:25 +0300
Message-ID: <20260720143426.809643-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260720143426.809643-1-leon.anavi@konsulko.com>
References: <20260720143426.809643-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 14:34:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128278

Upgrade to release 26.7.1:

- Fix WebSocket maxMessagePayloadSize being enforced against the
  compressed on-the-wire frame length instead of the uncompressed
  reassembled message size when permessage-compress
  (deflate/bzip2/snappy/brotli) is negotiated. A small compressed
  frame could inflate far beyond the configured limit and be
  delivered to the application (a decompression-bomb style
  denial-of-service; security advisory GHSA-hxp9-w8x3-p566, same
  class as CVE-2016-10544). The limit is now re-checked at the
  inflation site against the running uncompressed message size,
  and the connection is failed with close code 1009 (message too
  big) before delivery - for both the whole-message and streaming
  receive APIs and every compression backend. Behaviour change:
  a compressed message that inflates past maxMessagePayloadSize
  is now rejected where it previously passed; uncompressed traffic
  and the per-frame maxFramePayloadSize wire guard are unaffected
- Fix the permessage-deflate max_message_size receive cap silently
  truncating an over-limit message and raising a zlib error instead
  of cleanly rejecting it: the bounded decompress(..., max_length)
  left the remaining input in unconsumed_tail undrained, so the
  message was corrupted rather than reported. Decompression is now
  bounded cumulatively across frames and raises
  PayloadExceededError as soon as the uncompressed size would
  exceed the cap
- Make bounded decompression backend-agnostic:
  decompress_message_data() gains an optional max_output_len
  argument (documented on the PerMessageCompress base class) and
  every permessage-compress backend now honours it. deflate and
  bzip2 stop inflating once the limit is reached (native
  incremental cap); snappy and brotli, whose libraries expose no
  output-length argument, inflate the frame (already bounded on
  the wire by maxFramePayloadSize) and then reject - a weaker but
  still clean per-frame guarantee. The WebSocket receive path
  passes the remaining maxMessagePayloadSize budget so a
  compressed frame no longer expands unbounded into memory before
  the size check; the previous post-inflation check remains as a
  backstop. Previously only deflate had any decompressed-output
  cap, so a snappy/bzip2/brotli frame could inflate fully into
  memory first
- Make the asyncio RawSocket receive size limit configurable, at
  parity with the Twisted backend. The asyncio
  WampRawSocketFactory now exposes
  setProtocolOptions(maxMessagePayloadSize=...) /
  resetProtocolOptions() (bounds [512, 2**24], default 16 MB), and
  the configured value drives both the advertised handshake length
  exponent and the enforced receive cap (rounded up to the next
  power of two), matching the Twisted factory. Previously the
  asyncio receive limit was hardwired to 16 MB (a dead
  max_size=None branch), so an asyncio WAMP peer could not tighten
  its RawSocket receive limit for DoS hardening and Crossbar's
  RawSocket max_message_size had no effect on the asyncio path

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...essing-for-external-cross-toolchains.patch | 88 +++++++++++++++++++
 ...n_26.6.1.bb => python3-autobahn_26.7.1.bb} |  4 +-
 2 files changed, 91 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-autobahn/0001-Skip-march-guessing-for-external-cross-toolchains.patch
 rename meta-python/recipes-devtools/python/{python3-autobahn_26.6.1.bb => python3-autobahn_26.7.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn/0001-Skip-march-guessing-for-external-cross-toolchains.patch b/meta-python/recipes-devtools/python/python3-autobahn/0001-Skip-march-guessing-for-external-cross-toolchains.patch
new file mode 100644
index 0000000000..8f2e8f0d01
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-autobahn/0001-Skip-march-guessing-for-external-cross-toolchains.patch
@@ -0,0 +1,88 @@
+From c677aa7a80fd551abb391a8f6abd28dc9f5c43a2 Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Mon, 20 Jul 2026 15:52:32 +0300
+Subject: [PATCH] Skip -march guessing for external cross toolchains
+
+Don't add -march flag when CC/CROSS_COMPILE names an external cross
+toolchain (Yocto/OpenEmbedded, Buildroot, ...). These already
+inject the correct target. Avoid issues such as an unknown value
+'x86-64-v2' for '-march' when cross compiling for ARM machine.
+
+Upstream-Status: Pending [https://github.com/crossbario/autobahn-python/pull/1934]
+
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ src/autobahn/nvx/_compile_args.py | 36 ++++++++++++++++++++++++++++---
+ 1 file changed, 33 insertions(+), 3 deletions(-)
+
+diff --git a/src/autobahn/nvx/_compile_args.py b/src/autobahn/nvx/_compile_args.py
+index 2a35ab31..173e5fd4 100644
+--- a/src/autobahn/nvx/_compile_args.py
++++ b/src/autobahn/nvx/_compile_args.py
+@@ -81,6 +81,10 @@ CIBUILDWHEEL : str, optional
+ AUDITWHEEL_PLAT : str, optional
+     Set by auditwheel/manylinux builds. Indicates wheel build.
+ 
++CC, CROSS_COMPILE : str, optional
++    If either names a triplet-prefixed compiler (e.g. "aarch64-poky-linux-gcc"),
++    an external cross toolchain is assumed and no -march flag is added.
++
+ Examples
+ --------
+ 
+@@ -212,9 +216,6 @@ def get_compile_args():
+         # But default codegen is already optimized for current arch
+         return ["/O2", "/W3"]
+ 
+-    # GCC/Clang on POSIX (Linux, macOS, *BSD)
+-    machine = _get_target_machine()
+-
+     # Base flags for all POSIX platforms
+     base_args = [
+         "-std=c99",
+@@ -233,6 +234,14 @@ def get_compile_args():
+         # deployments). It is NOT safe for distributed wheels or cross-compilation.
+         return base_args + ["-march=native"]
+ 
++    if _is_external_toolchain():
++        # Cross toolchain (Yocto/OpenEmbedded, Buildroot, ...) already sets its
++        # own -march/-mtune; don't second-guess it (#1930).
++        return base_args
++
++    # GCC/Clang on POSIX (Linux, macOS, *BSD)
++    machine = _get_target_machine()
++
+     # Default for everyone (AUTOBAHN_ARCH_TARGET unset or "safe"): a portable
+     # baseline architecture. Defaulting to "safe" rather than -march=native is
+     # what makes cross-compilation work out of the box - a cross toolchain
+@@ -248,6 +257,27 @@ def get_compile_args():
+     return base_args
+ 
+ 
++def _is_external_toolchain():
++    """
++    True if ``CC`` or ``CROSS_COMPILE`` names a triplet-prefixed compiler (e.g.
++    ``aarch64-poky-linux-gcc``), the convention used by externally managed
++    toolchains such as Yocto/OpenEmbedded and Buildroot.
++
++    Returns
++    -------
++    bool
++        True if an externally managed cross toolchain is detected.
++    """
++    for var in ("CC", "CROSS_COMPILE"):
++        value = os.environ.get(var, "")
++        if not value:
++            continue
++        exe = os.path.basename(value.split()[0])
++        if "-" in exe:
++            return True
++    return False
++
++
+ def _get_target_machine():
+     """
+     Return the *target* machine architecture for the build.
+-- 
+2.43.0
+
diff --git a/meta-python/recipes-devtools/python/python3-autobahn_26.6.1.bb b/meta-python/recipes-devtools/python/python3-autobahn_26.7.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-autobahn_26.6.1.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_26.7.1.bb
index f9239b4904..7829a0e149 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_26.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_26.7.1.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "http://crossbar.io/autobahn"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=49165a577911c4178e915dc26e2802a3"
 
-SRC_URI[sha256sum] = "66b27e066a8ea265541eb07fd964e3116e2b8f51d797eea8a46b55c07fd81a07"
+SRC_URI += "file://0001-Skip-march-guessing-for-external-cross-toolchains.patch"
+
+SRC_URI[sha256sum] = "c6949a2c6eb95fb1c218837dbda0a59abbbebafb8b11098551c01a7061dfd245"
 
 CVE_PRODUCT = "autobahn"
 
-- 
2.47.3


