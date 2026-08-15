Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C475C5B572
	for <webhook@archiver.kernel.org>; Sat, 15 Aug 2026 02:51:01 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2489.1786762252315048059
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 19:50:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lbJBkoSi;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38f620399a0so1448449a91.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 19:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786762252; x=1787367052; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TOfqtiF+6PMI1DI0KscTw9RlNSE2r5dPYy0t6FhY4YQ=;
        b=lbJBkoSitHk63BqAXA1spANKTHrDt6bY4gH2Jd7CnG6CeDCFJWIt75w9M2y3w19MUy
         ggBgHYhCsFP5Oq1XPRBGluabPUYKFqjeciR1fMqOop1K8kUOzWCeHD7Br9nOMsFtFL5e
         qLuh/JubUETzDNISB/E7NZ7jFFWD2+vVmQjda8Oup+qQGXFfbGcWfowYPIHgu38uRUgT
         7iOb5R7yTWfz8hrqtT8V7OtnegK9YZOLmtFiV8T+HzRBUVt9ulLZBG5mvxad6crdpTQ4
         vMFb1WAeg9ZWcquaUW3lUNeYMxekDkuBcHhHRiAgnVn4G3FEV5oLFY8HATptGoO+XVt+
         ceqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786762252; x=1787367052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TOfqtiF+6PMI1DI0KscTw9RlNSE2r5dPYy0t6FhY4YQ=;
        b=R9hmn/Rt4vqlDosR/jhIY81DCxxBNxUwD5B3JlXuQU+LGND9qdBgDD1iZqC8sAU/9O
         GG8X0uFq+gdl4vNHro1LxL3KSImdJytVA0IvWZAid1PAL53Elu1ZqfB0R4tQu3RnTjqa
         CAFOxNr9/WKxh9qrIaP3y45aAnjEI5GhoJmxLLzubCjrGtxlSPxOkMbBfiwQ240VMLV5
         AvS6vXpVkjc2bg5sk432UqqKUKP6kakV7ehNk2UkeUg1jXayRpdoPleLZU2RR3MHCs4a
         yvkeG5MrJKVoJYZ4VTOiU0aae2Zk1WG3xOPjKc3sJgOyIqe78YNLQTtGIM5/NALkah8Y
         I6rQ==
X-Gm-Message-State: AOJu0YyJTO60RUQN+Iv+34t5JU0zdAEEpaOtG+/p4i233AdYjBPU5ZjZ
	vgwvRbUz9yHBrcwseHSpnIgd678a1Z2sbPgbEGzerbUxyFJBIDAeAa1b4XnSH5Ve
X-Gm-Gg: AR+sD10okC3thEhyidA2S7KecswMQ0WIZaf/dSCZJwchch1cr1In43NmW1GdQZB9hox
	n/tThSQHSo/ZDY8AeQd8RORzkXkj9C5Ao2WHTJCGgXHi6FTfUryo/t3fsTh3qp9T9vHWfXXnZz3
	e05gVD75Py9IT8VkRCUxXCTV8N7m5YmWZ4UkqrLyOSSedoDVsCxlNt7TvX3/mkNTQld/9LgxzCP
	kVM8jThVsfckQVznkFRE9uTUyvAgyPIudRkF4twrxIUNGMkQRLRoRhykKGZbV7XfWw95EieQ/Sz
	rFB3ndTMrhoeoLbrFPVQw29n9a4P9sUS+TwliAsoXwA1KkvU+LGYXBAHTiceB9Ta2bfeE2R2Jk3
	VI42UA4+TjQRWc2wRQzXEM/L0ZO7hEZUeJ9PnrvfeUKQGN6C+HnfcNj15FeVMr6cpSoyFgm5Rv4
	w4d5YLp+BlWNbK1GxY2MaDV3beJW+8xqyEzlaZShFVMVplNzFt1ovoBirdHBbSmehSGTf1DIRLO
	T6KXx768AWMLonC/Pds+hpA2M1PLy0S5caUmP5vHhIEIzyMPsUEbf9wdr0V8PJV39JP19fEceVv
	zmLKhJd0WgKBxJpOREQiOADSHAqo8AwHbRGNHr3LSSZLtd4PSivY6jTdcElHkZX3/pfEI9NWmbC
	dns677yyFfby/r6kNNhHgd98HtZOm53H6G18kj3SQgYMStQ==
X-Received: by 2002:a17:90b:5388:b0:38d:fda6:4873 with SMTP id 98e67ed59e1d1-3933b8fc728mr11594848a91.10.1786762251423;
        Fri, 14 Aug 2026 19:50:51 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-323050db573sm5153181eec.9.2026.08.14.19.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 19:50:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 102/109] tcpreplay: upgrade 4.5.5 -> 4.6.0
Date: Fri, 14 Aug 2026 19:50:36 -0700
Message-ID: <20260815025044.437694-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815025044.437694-1-khem.raj@oss.qualcomm.com>
References: <20260815025044.437694-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Aug 2026 02:51:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129167

Bump to the 4.6.0 release tarball. As of 4.6.0 upstream introduces
CMake as the recommended build system, but the release tarball still
ships the Autotools build files (configure/Makefile.am) and Autotools
remains fully supported for building from release tarballs (only
deprecated for eventual removal in a future release), so the existing
autotools-brokensep-based recipe continues to work unchanged.

0001-libopts.m4-set-POSIX_SHELL-to-bin-sh.patch kept unchanged, still
needed, applies cleanly.

Build-verified: tcpreplay builds and packages successfully (existing
buildpaths QA warnings for libtcpreplay.pc/defines.h are pre-existing
and expected, WARN not ERROR on this distro).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{tcpreplay_4.5.5.bb => tcpreplay_4.6.0.bb}         | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)
 rename meta-networking/recipes-support/tcpreplay/{tcpreplay_4.5.5.bb => tcpreplay_4.6.0.bb} (54%)

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.5.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.6.0.bb
similarity index 54%
rename from meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.5.bb
rename to meta-networking/recipes-support/tcpreplay/tcpreplay_4.6.0.bb
index 55bc8e198f..368308408f 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.5.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.6.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://github.com/appneta/${BPN}/releases/download/v${PV}/${BP}.tar.
     file://0001-libopts.m4-set-POSIX_SHELL-to-bin-sh.patch \
 "
 
-SRC_URI[sha256sum] = "ba37b6c9270fcebe86b83f68c4ec3d5ac8981f8c6087b582af0205a35ec4b11d"
+SRC_URI[sha256sum] = "30f73b901e74b6ffc36c0f82afccc9d5740e70ba214a15763631a59dd2cc3564"
 
 UPSTREAM_CHECK_URI = "https://github.com/appneta/tcpreplay/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
@@ -23,5 +23,13 @@ EXTRA_OECONF += "--with-libpcap=${STAGING_DIR_HOST}${prefix}"
 inherit siteinfo autotools-brokensep
 
 do_install:append() {
+    # configure --with-libpcap=${STAGING_DIR_HOST}${prefix} bakes the absolute
+    # recipe-sysroot path into defines.h's pcap.h include and into
+    # libtcpreplay.pc's Libs.private -L flag, tripping the buildpaths QA
+    # check. Strip it from both the source tree copy (shipped verbatim into
+    # the tcpreplay-src debug package) and the installed copies under ${D}.
     sed -i -e 's:${RECIPE_SYSROOT}::g' ${S}/src/defines.h
+    sed -i -e 's:${RECIPE_SYSROOT}::g' \
+        ${D}${includedir}/tcpreplay/defines.h \
+        ${D}${libdir}/pkgconfig/libtcpreplay.pc
 }

