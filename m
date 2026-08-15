Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5124C5DF67
	for <webhook@archiver.kernel.org>; Sat, 15 Aug 2026 02:51:00 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2470.1786762260145601914
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 19:51:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NOZL/97t;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cf52d15d88so17535565ad.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 19:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786762259; x=1787367059; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sSJrzu7HtSY9TQz4cgEAmd2S6tTzW6mcBYpEZKv8HQk=;
        b=NOZL/97ter7xFetwWhvOCC4CdjsP3//f0QjG89MK3jgWo/3k2jAdydIgE9AfinTcOJ
         3ec1xXD27ZVHQJ6jdmLnMQh6UN7srnRHG4rM4ID8vGWuvw84WVsslAZ66LKXwm5KJ/oB
         iROQRR7CwC+SPmiZNUknxOLIA1ZL3FFrM0/x3VhaHq6KnNgApyfE0JP/IsNAzF52H69E
         x58Ncha1qlkOYp4ATU2nOgdIAXUl31oYIq2fYpXosGvSFGTe2W6uY+M7/QxGCvH+RcCP
         A4TuLJ4tvufsd+NwKy9toSNz7G9qyXAq4l1Cmbd1bUlMhr+LXxI58uN5iCxd9ek8K6pb
         BfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786762259; x=1787367059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sSJrzu7HtSY9TQz4cgEAmd2S6tTzW6mcBYpEZKv8HQk=;
        b=JKHSAvqo12gWNPx9HYgo8ibcML8DVFW8NyRo2Faj1vE0YkHowonnV3YKe3B8FiQCzz
         3E9kxzZ0KHaakNhh+a3CVdQ0Dk/MwAzBSjpUpxWbbzEMfEhBzasSl4o8NXWdtJMq4UGW
         sICcs+BLdXa6qZ2/nGXeldOoNSVcFFXCIj86J+sFBoiViC6ADemci26o7eYVHQSWxk9K
         c9D/oX6aHdmwFmtwnqRmrT/7wFLZRMiSLVTgtBY5QY+aeOar+TfMZthC6YByX58SsyIY
         8wX/mHNzgYp/kDLc3pddfCSyvkzUyGzab0M4c4QNdXTCWO9QZV6RngbNdiAfKhfR6ZuP
         WO5g==
X-Gm-Message-State: AOJu0YzDfFdEq1Z5s1MQGwcFlGlNbIYXYyo7XN6vjQGgse4I3CQrCMFL
	8sIDhI8Zpzb6TZNqIlX68Cqy2iKk+SCjD8AZoFJCjYITH0PoVAkCnmyuGd8TS8Am
X-Gm-Gg: AR+sD11Locv8lnfM+jzVhGHWjt24RANWJpeYhyx5vPhJsi+2o4/iZ4YYulPTglE2jim
	UEIgDfHG2XPbHNyfez892sujZUSPqhel8DM+gqRTFBXqF3E+hQVGywV+s+O+/9/4HHsG+oUQP53
	8qyrYHVzm3wSwq1l4agfU0bBVH6ZcIfjd1mxqi+zZ06TI4el2bEuwf/WK28KHTYXrs/jtaY3un5
	gr3Y4Guro1Fu3THqtJ1hs3G0dXjQgCiYotF5QmjSmAU0L8+OSz2wzdf34ezpj1XR/LcSmM6Vhuy
	D0M/tK/NYWAHhlx0ELfZVpN8srH1gX4ZjiBbBQMqVFmK6d/YwDGtT+278KagtKrehXVDJSButQa
	5Hdn70I1466D7C0ErFn6IKw6MhFUP0JasIpGaAPYS8Zaz6Ltd1/IJ9yG6BOaZVXld0s673gdmTL
	6CrDjhLixZPfj2hRoaF8B+ESSzNJ5PHOG8xj/0b5i/t7KHQDf/e63ylL0nHLqSS0XI6HgWmrrmB
	u9dbgYAqAhuARDerOV7AoVIOVblqQgAakrueh5UBSU/FaAWzf7x6ky7ldPzFv2MxX1UCu3rzDFX
	afUsUwTsEELVvuEIcUEGXguRat7F9XCVV5/qKEucGJ4oCpZFhkTeh/xUFM/DKvmp/2YO0ZSDd3h
	W9hkLWpZu1Wl7tdvsZZmmEU6R8grXdAo7o3OTtuSpchfpiA==
X-Received: by 2002:a17:903:8d0:b0:2cc:aa36:c04c with SMTP id d9443c01a7336-2d3b0ad0fa1mr123261415ad.1.1786762259381;
        Fri, 14 Aug 2026 19:50:59 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-323050db573sm5153181eec.9.2026.08.14.19.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 19:50:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 109/109] libstemmer: fix buildpaths QA warning in libstemmer-dbg package
Date: Fri, 14 Aug 2026 19:50:43 -0700
Message-ID: <20260815025044.437694-10-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815025044.437694-1-khem.raj@oss.qualcomm.com>
References: <20260815025044.437694-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Aug 2026 02:51:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129174

GNUmakefile hardcodes its own CFLAGS= assignment (patched by
0001-Build-so-lib.patch to add -fPIC for the shared-lib build). As a
plain makefile variable, that assignment overrides the CFLAGS bitbake
exports into the build environment -- including the -ffile-prefix-map
flags from DEBUG_PREFIX_MAP. Without those, -g debug info in the
compiled snowball/stemwords/libstemmer.so binaries embeds the absolute
build-tree path, tripping the buildpaths QA check on the -dbg package:

  ERROR: libstemmer-3.1.1-r0 do_package_qa: QA Issue: File
  /usr/bin/.debug/snowball in package libstemmer-dbg contains
  reference to TMPDIR [buildpaths]

Pass CFLAGS via EXTRA_OEMAKE instead, which oe_runmake places on the
make command line and therefore does take precedence over the
makefile's own CFLAGS= assignment.

Verified via cleansstate rebuild: log.do_package_qa no longer contains
any buildpaths warnings, and `strings` on the rebuilt snowball debug
binary no longer contains any build/tmp/work host paths.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/libstemmer/libstemmer_3.1.1.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-oe/recipes-support/libstemmer/libstemmer_3.1.1.bb b/meta-oe/recipes-support/libstemmer/libstemmer_3.1.1.bb
index 784b5b402d..0e74366268 100644
--- a/meta-oe/recipes-support/libstemmer/libstemmer_3.1.1.bb
+++ b/meta-oe/recipes-support/libstemmer/libstemmer_3.1.1.bb
@@ -12,6 +12,15 @@ SRCREV = "cd195b51e948a902a4312f023f4a14392516a543"
 
 LIBVER = "0.0.0"
 
+# GNUmakefile hardcodes its own CFLAGS= assignment (patched to add -fPIC for
+# the shared lib build), which as a plain makefile variable overrides the
+# CFLAGS bitbake exports in the environment -- including the
+# -ffile-prefix-map flags from DEBUG_PREFIX_MAP. Without those, -g debug
+# info embeds the absolute build-tree path, tripping the buildpaths QA
+# check. Pass CFLAGS on the make command line instead, which does take
+# precedence over the makefile's own assignment.
+EXTRA_OEMAKE += "'CFLAGS=${CFLAGS} -fPIC'"
+
 inherit lib_package
 
 do_compile:prepend:class-target() {

