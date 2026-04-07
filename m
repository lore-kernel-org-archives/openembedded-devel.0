Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25BBAEDB7DC
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 09:19:22 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.77134.1775553556960897358
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2026 02:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=V3OomsET;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso39516955e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2026 02:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775553555; x=1776158355; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Z9mcfpHLfKrqJMD9+Xn4PkUXXRxYEXbM4u0cHBjgoU=;
        b=V3OomsETCauwriCN27dhU3W7YraLqsAA5QGMiq0fH9+cimLdQudN9jI/IbwhrR/sq2
         efUvagmQJWI75b1Z6E6CJlJpPNgTxzGCDcWX82fjj1YBJmNzCuGZ1iLyTT5CB7YeQX6x
         tmIKfhpEUbUE8mfmdXGacXRNSIeQ4+vjk5a+RmouAChGXPN+FJdvNVrMv664IgtugDoT
         npVm2N9WsCcusLrfCpC43tov6BhgCK0AUNtqQ6TZmMeQJvtfp5+yNzkp488nNlBH+1+e
         JBc5R0bioGVQXTdDFjbrsu5rT6m1hdDFd3mKPOkZ8IPlTd9EEm/cOKAlRG744r8+pnoz
         lk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775553555; x=1776158355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Z9mcfpHLfKrqJMD9+Xn4PkUXXRxYEXbM4u0cHBjgoU=;
        b=k5Z7w0ZR2wRqcZsFjd/3TO0sHX1PB6FI/A/7I9DMrlDKgebYEyGqwnZM6bpdQVIjwu
         toONhZWoukvPuzuYaFq+BxFOXoKO7fXQJmxkZwRDG4KIZACZ3czUdtClIpvIEH3o0mvn
         GdP918HAAvpntZRt3bmqk/xW5TQhV3nV5IgdX1KelHuZR5JC6Pisor/Sqre70Razg+BS
         t5rWzUvc+10w6V4pwhoH+jtp5LXO3U5nZjSE5XUfdkVrX8j0Sz9c5HtwZeMODJ0doW2H
         BdrgY/lh5L35w47TpXMq5+dgU2Y+EjR12ouPhFfZPiZrRSg1GHf0ysOnIPn16sMBmB4Y
         LdCw==
X-Gm-Message-State: AOJu0YzFW8k1zc5Ei29j9TofBUn72QtyUKbI7vT11ZKRQQzwn6+j2207
	F3rDHh3+GrJsNLBiOlt3WltF6PxPGs4eK0PTs5+ijmPXvkzNavjUPBcPbUBNdA==
X-Gm-Gg: AeBDiev/Ew8tiWQ0x+E62h+nOqY3WTCTZHcxv4CKIC3LkP7xxYUqiTIO97m5JuLe+Yl
	7iXAoh1cEOsUWuePEOKHsPEkKUqYudMLEcEa6ToV0xvFpLeo+b5wru67pRRj9VakshU7qSWqbt8
	wXiyLHILLm/REETnDWFWvNHJuwrzIdsVV1Qn0WLav8DScgmE+VaXTyfdwfu0VK2fF8xgEJqlcYU
	wU94oeM4TP6lCXKWBI7cGkgDU4WqDlFZ3E2PKMht2ApInXmXUMScBbhWxYLseAxfb7rRu+aqYU8
	EE2kT0hNAoGkrHDLtk4xvl1t+QUtcQJt6TfoeN+/WUmmj61fIUznoenJXTpuT/xH0nd383NYsSe
	BM2nGQhCv6GBDvYOe9/6482mVUzK+qkaCcnx4+cm8xLBbxH96r5miNfk/Tn2hBcHAqt8tZ8sfC4
	3C6perz/D6QLGr2VS7QFyo
X-Received: by 2002:a05:600c:621a:b0:488:af7f:7707 with SMTP id 5b1f17b1804b1-488af7f7fd3mr103549375e9.18.1775553554775;
        Tue, 07 Apr 2026 02:19:14 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a720dsm48749374f8f.4.2026.04.07.02.19.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 02:19:14 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 1/3] nodejs: upgrade 22.22.0 -> 22.22.1
Date: Tue,  7 Apr 2026 11:19:11 +0200
Message-ID: <20260407091913.3963112-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2026 09:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126078

From: Jason Schonberg <schonm@gmail.com>

License Update: Add sorttable.js under the MIT license - https://github.com/nodejs/node/pull/61348/files
  Update minimatch to the Blue Oak Model License - https://github.com/nodejs/node/commit/e72da8c7544727f90b857ba86b8c7755e631fe96

Changelog: https://github.com/nodejs/node/releases/tag/v22.22.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit db05f827bb680d6e12e27ed55adf6b32688f7466)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../nodejs/{nodejs_22.22.0.bb => nodejs_22.22.1.bb}         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_22.22.0.bb => nodejs_22.22.1.bb} (97%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.1.bb
similarity index 97%
rename from meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_22.22.1.bb
index 443cdc430d..d737a0ba72 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
-LICENSE = "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 & Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1fdf4f79da4006c3b5183fddc768f1c8"
+LICENSE = "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 & Apache-2.0 & BlueOak-1.0.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b195f4ea4368177a2fd84b879f09cba8"
 
 CVE_PRODUCT = "nodejs node.js"
 
@@ -39,7 +39,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "4c138012bb5352f49822a8f3e6d1db71e00639d0c36d5b6756f91e4c6f30b683"
+SRC_URI[sha256sum] = "87104b07e7acee748bcc5391e1bc69cf3571caa0fdfb8b1d6b5fd3f9599b7849"
 
 S = "${UNPACKDIR}/node-v${PV}"
 

