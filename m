Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 954FFC4450A
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 07:47:34 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7585.1784188050310058962
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2026 00:47:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GQ5udXaC;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: max.oss.09@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493ba701891so24239685e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Jul 2026 00:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784188048; x=1784792848; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+iEg5RObku4qSP9k0F8JQbG3zbEOlmyOdHYBy7yAR6c=;
        b=GQ5udXaCuTOE70zY+qAyTb+ceNoFjMQUT+BVt+6j6vsC5aTlCAHO4Ga14qLs/YoOT7
         yBIx7AMSoOv8AbqAfy8TX0lqMosj4C3oH3ZOApipaXX9fSz3m1rMQnDnbElv+8iI5ghy
         7nYU/gll/yKvmQdKfjMzaGyyH4GcCQDEuujV51Age+QKEKhKorCbAzrvMhU5YhweweH4
         Yjf1Tt/UrSxaC85pFFRFUQVs9DSj2WmEO8TJCc3v/rLkwm8RP8j7ARZK8hBYZ8zCCEXr
         XpzC+g7SabjACaL+aAY267N/w7N5hxP1G/SAeFNIHfTfC16cqG7eK2/hwareKHJxtQ+D
         Na8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784188048; x=1784792848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+iEg5RObku4qSP9k0F8JQbG3zbEOlmyOdHYBy7yAR6c=;
        b=dU2Jf4hxMN2bkxAO08Vu4TMBSdhU4LeT2x85j4kPStrxrIgz+bDuZjc0vPJZXPsoWS
         zcXF6lSsC4SqrPxzTMzQFg4WHOxju6/N1yKGvyJdTf07u+eWHDiVFc6pI4Pb2MAqTiLA
         qC4IjBgE2MZNWcyJw9LVo+zhauE+1lVCDn7uW50LbqNKxjeOeI0cC46s0/us80b8Y6KQ
         Ll2L68s4sCp/horudTbOyUnGyfOmgCTkzZSfxLdH8xIOVf1LIR+Jh3kFb6p9Yyq9nX/8
         qUx9hN2g8aneqrSBY6cSQ1ZCV1UAbNW4TwtFzulRlsC3CvgGxHd5cf22mfBNz+xzI940
         RJHQ==
X-Gm-Message-State: AOJu0YzSdHRX92DC8vz3VYSXb6OAQWdnQK5gJFEwR67CNP8Hvf1QUrTh
	qq+r77Y3x4ppPbXPZjiAPXeqseCG0MmN9yyLuQWLzI2yeOFfGyfUEihUGiAQfQ==
X-Gm-Gg: AfdE7cnrbSMt7YoIRFVt1WifGOPmqODw40p4cAw1MNt2fLPe+pKkoLMyU9kOr2g0lfD
	9eceHeWvOzY+lQyuAR4LLgJJXbNO7qAwABxU74kR6iOCBWuznNqS2kL+IO2B+JB2obDQLi6zbDY
	5CD2gd+jX1ko0swqbTu/XqiQ0ZsGtt9gGgSqvhGq17RtusyjVW/+9xYd9mMCMEJKjGO7qwH8udh
	Dh/wH7yzryCmdb7a61mh7/h8Km72pU4Q/kohUhdd5QrUGM0TPo5DBD0/eTySqbpE2BPOEcGGpNd
	VvJsNFAn0+X8D/EWcxMNBMjEiYwEAnUMQDE0VjW+36We4T80zNoXNaSbAO7jsKc0mwViPx2qYxz
	yJw0/+eb5VdVWSiH142bCmyP3mBPscrCPPa/p0j8eWxkoOXNvJi5+8srDRWCrUCy6G6bKdVcP/Q
	uZ1G5MIXa3
X-Received: by 2002:a05:600c:638f:b0:493:bb0:3b43 with SMTP id 5b1f17b1804b1-493f87d8aa2mr226408895e9.2.1784188048393;
        Thu, 16 Jul 2026 00:47:28 -0700 (PDT)
Received: from Saturn.local.all ([81.221.206.143])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e83d8bsm37943135e9.5.2026.07.16.00.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 00:47:27 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Max Krummenacher <max.oss.09@gmail.com>
Subject: [meta-oe][PATCH] joe: Fix assign to stdin, use freopen instead
Date: Thu, 16 Jul 2026 09:47:16 +0200
Message-ID: <20260716074716.3679-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Jul 2026 07:47:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128229

This fixes building with musl.
Upstream disscussion: https://github.com/joe-editor/joe/issues/115

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---
 ...n-to-stdin-use-freopen-instead-issue.patch | 31 +++++++++++++++++++
 meta-oe/recipes-support/joe/joe_4.8.bb        |  5 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/joe/joe/0001-Fix-assign-to-stdin-use-freopen-instead-issue.patch

diff --git a/meta-oe/recipes-support/joe/joe/0001-Fix-assign-to-stdin-use-freopen-instead-issue.patch b/meta-oe/recipes-support/joe/joe/0001-Fix-assign-to-stdin-use-freopen-instead-issue.patch
new file mode 100644
index 000000000000..53c9edd6dbee
--- /dev/null
+++ b/meta-oe/recipes-support/joe/joe/0001-Fix-assign-to-stdin-use-freopen-instead-issue.patch
@@ -0,0 +1,31 @@
+From 0be9f4f2b7c4202b183f65aa65ecfd32f565385d Mon Sep 17 00:00:00 2001
+From: Joe Allen <jhallenworld@gmail.com>
+Date: Wed, 6 May 2026 09:34:34 -0400
+Subject: [PATCH] Fix assign to stdin, use freopen instead issue
+
+Upstream-Status: Backport [0be9f4f2b7c4202b183f65aa65ecfd32f565385d]
+Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
+
+---
+ joe/main.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/joe/main.c b/joe/main.c
+index bfbfb90711e8..61f0324ee094 100644
+--- a/joe/main.c
++++ b/joe/main.c
+@@ -755,7 +755,10 @@ int main(int argc, char **real_argv, const char * const *envv)
+ 			/* Close stdin, so that if user kills the copying the program feeding stdin sees a SIGPIPE */
+ 			/* It won't if there are any extra file descriptors open */
+ 			fclose(stdin);
+-			stdin = fopen("/dev/tty", "rb");
++			if (!freopen("/dev/tty", "rb", stdin))
++			{
++				/* This should not fail */
++			}
+ 		}
+ 	}
+ 
+-- 
+2.51.0
+
diff --git a/meta-oe/recipes-support/joe/joe_4.8.bb b/meta-oe/recipes-support/joe/joe_4.8.bb
index 77ffc145172e..7b901e1e3b2e 100644
--- a/meta-oe/recipes-support/joe/joe_4.8.bb
+++ b/meta-oe/recipes-support/joe/joe_4.8.bb
@@ -4,7 +4,10 @@ HOMEPAGE = "http://joe-editor.sourceforge.net/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/joe-editor/joe-${PV}.tar.gz"
+SRC_URI = " \
+    ${SOURCEFORGE_MIRROR}/joe-editor/joe-${PV}.tar.gz \
+    file://0001-Fix-assign-to-stdin-use-freopen-instead-issue.patch \
+"
 
 PACKAGECONFIG ??= "curses"
 PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses,ncurses-terminfo"
-- 
2.51.0


