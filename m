Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web11.10720.1605631187919572897
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2020 08:39:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ElU4x43Q;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: philip.balister@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id g20so4227757qtu.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2020 08:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=oGX2SnR7p8HQypUMJ9VUbMuGAQodHVvsNydijHuqM9s=;
        b=ElU4x43Q+ZER+aF4YupCvX+J82dkZSeidXdEDDgnaDyrleCi0ed5FbCJyXi5Rb/nVf
         3AtuJroW49FCqLFCyiP+f+HLXpOYUXYQNFw8bIY+x8jThM5/wU8ftatf6Jv4rAac6rxr
         gwkV/O4XngW/tUS4z0Uh3QnpkM8YU9zl+zEK1VQaW0jtDjjfAh458WwtoLAwQ6xXmFXj
         AP+U39rPHp+VR+RF9MpBnkV2CFnTHnTKqFnlUxYlygPwQGy3n1oIROHWtxswAfCWlCQ1
         eV+TAhdZan9tLSUb5X11R/RmKEVn/LrqgYGBG+Y5va82NWuLNzIc5+lqeU+KY9uHiy3Y
         NA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=oGX2SnR7p8HQypUMJ9VUbMuGAQodHVvsNydijHuqM9s=;
        b=n9KpAu3KHEjrCDNFfO6pBmNoqEjCxUOk/wEIyWvj/n3qnAjwPYo17SfA8OBVNyHzl4
         8EwfY/i4zPsmlkxOHHC6wgly5+66oy9qY1lVdA7X0UrKK0+YTsRFsZGpdVc/UiM0/CCr
         Bu8vdTk10K/v+pBGDFmu8+6rozpZNl6jvebqIGZVJZ3eN8u5YzE8daZxYhG6Ae+4kXut
         Vi2g5u49qMiBMVlxx0uWy2B1FfEYyVXpripOGf7ot3k9dyc15AB2YxLjd0LQQ8FlRQpm
         abI5nr0eHdeo03b68aSqHXJcetgNylA1QBaRQCjxAaEE3m0IQS+e7EtNpflR5Kz466SD
         //Eg==
X-Gm-Message-State: AOAM533fgjxS5pUNQUUPY7QOX+3aWHujRHwPKgtOgbg7nDh/5mlRrYQB
	fO4w119xBF4Voi5O0DH9wUDYiNtWDfc98g==
X-Google-Smtp-Source: ABdhPJyrGoyJGQzw2Ob5N4GGMJkxgV19RlofnGtLIsm/XxMY4W1GD0DJNU4I8hNKYFd14rpFTuAmaQ==
X-Received: by 2002:ac8:5c4e:: with SMTP id j14mr495991qtj.241.1605631186723;
        Tue, 17 Nov 2020 08:39:46 -0800 (PST)
Return-Path: <philip.balister@gmail.com>
Received: from prague.hsd1.va.comcast.net ([2601:5c0:c200:1421:b727:f6cb:1b56:c419])
        by smtp.gmail.com with ESMTPSA id l79sm14997441qke.1.2020.11.17.08.39.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Nov 2020 08:39:45 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: "Philip Balister" <philip@balister.org>
X-Google-Original-From: Philip Balister <philip@opensdr.com>
To: openembedded-devel@lists.openembedded.org
Cc: Philip Balister <philip@opensdr.com>
Subject: [meta-oe][PATCH] spdlog: Fix recipe so other recipes can use spdlog with external fmt.
Date: Tue, 17 Nov 2020 11:39:42 -0500
Message-Id: <20201117163942.22157-1-philip@opensdr.com>
X-Mailer: git-send-email 2.13.6

 * I enabled the shared library option to eliminate linker issues
   with a package that used spdlog.
 * Edited the tweak.h file so programs use the external fmt library
   headers, not the oners in spdlog.

Signed-off-by: Philip Balister <philip@opensdr.com>
---
 meta-oe/recipes-support/spdlog/spdlog_1.8.1.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/spdlog/spdlog_1.8.1.bb b/meta-oe/recipes-support/spdlog/spdlog_1.8.1.bb
index 7d28fff5e..c5227a5e9 100644
--- a/meta-oe/recipes-support/spdlog/spdlog_1.8.1.bb
+++ b/meta-oe/recipes-support/spdlog/spdlog_1.8.1.bb
@@ -12,10 +12,14 @@ S = "${WORKDIR}/git"
 
 BBCLASSEXTEND = "native"
 # no need to build example&text&benchmarks on pure yocto
-EXTRA_OECMAKE += "-DSPDLOG_INSTALL=on -DSPDLOG_BUILD_EXAMPLES=off -DSPDLOG_BUILD_TESTS=off -DSPDLOG_BUILD_BENCH=off -DSPDLOG_FMT_EXTERNAL=on"
+EXTRA_OECMAKE += "-DSPDLOG_INSTALL=on -DSPDLOG_BUILD_SHARED=on -DSPDLOG_BUILD_EXAMPLES=off -DSPDLOG_BUILD_TESTS=off -DSPDLOG_BUILD_BENCH=off -DSPDLOG_FMT_EXTERNAL=on"
 
 inherit cmake
 
+do_configure_append() {
+	sed -i 's|// #define SPDLOG_FMT_EXTERNAL|#define SPDLOG_FMT_EXTERNAL|' ${S}/include/spdlog/tweakme.h
+}
+
 # Header-only library
 RDEPENDS_${PN}-dev = ""
 RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
-- 
2.13.6

