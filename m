Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0056EC25B6E
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 05:04:33 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.599.1698383064858618140
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Oct 2023 22:04:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZCMNB4rh;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5aa481d53e5so1342642a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 22:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698383064; x=1698987864; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4nSI58IL1b4XwjjgTKQst3tvwK2HyB9D0lMJsNjBGn8=;
        b=ZCMNB4rh5pF1oZQRO+w1ivyMErKQ5DWMzCovJ0e4GcBBOpVXDVH5kFW+GVqvk9phcB
         vUeFNT/XjyjAKVuMZS9ImuuQrHjAKYL37JgqjqIQRzLmsaI86pMZqHd5H99S1DgC5GlF
         VZhzXpA5bz6M2XJt2T8j5y5pQikGJXQHGDI30YnfM+rcYUbiqyDtNfPS+zNmasb9op22
         /8ecSxfqwBO/9YN6KOkc+dhOokWf70Dju2T+G12LP5kSoEfFnBB/MfeW9DBm7K/ERHZ7
         IBbI/BtwNyB5YNoQQIEyyJs+kBrljo9p/Y9QHEJUlIwh9bzivw5/EOY3gDHVD0Q1a1FN
         aftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698383064; x=1698987864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4nSI58IL1b4XwjjgTKQst3tvwK2HyB9D0lMJsNjBGn8=;
        b=ad6S0/c+NIZ2Ta3yHnWKcQ57dElhPqQSYU61AVUDG4T8SUe/gB61mUNWnte8vbXZkD
         1BODZfXCCa1rG8IxXdXaMwdY+wgm9BIe1pbUXZiydZ7iZ/sy8RKXFmKhil4bTHQmwHG8
         sGSajMa0vI1jxiqrmw8odEYJwp/SubTHpOlh8AvHslOyuXGuWMLoMdTCzXZqim5VxiFX
         TaG1gw/7LmHlkPlFFzGAVn74hb34YO1MW8e5AVeDfpTV9MB9y5e9LDbSfbrDOvYTJKWo
         rv3KnKwoJ7UBMbUh11qw/ajy6YnUrF9hGZgMhcOiFvANFpY7LvIjeuDVXaotekfAF9kH
         aWVQ==
X-Gm-Message-State: AOJu0YxuIkzXpriMoOQUBWR+Xs92ADgxlBTzFTkUaN7zSNmAVCQ+uExC
	oN3jPC8Uo9+0OGveiWQ26gppQT0DJ+U=
X-Google-Smtp-Source: AGHT+IFM+FnxyReWc51XI+NzApYgctx4Wmuiy8u15R0tZAHQd+ZSq59gtISyzbiQ/c5Sor0Ai4NoDw==
X-Received: by 2002:a17:903:84e:b0:1c9:e6a0:edb6 with SMTP id ks14-20020a170903084e00b001c9e6a0edb6mr1675840plb.2.1698383063731;
        Thu, 26 Oct 2023 22:04:23 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::46eb])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902680600b001c5bcc9d916sm589210plk.176.2023.10.26.22.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 22:04:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 1/2] network-manager-applet: Update the patch to work with musl + bfd linker
Date: Thu, 26 Oct 2023 22:04:20 -0700
Message-ID: <20231027050421.969572-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Oct 2023 05:04:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105767

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-script-Do-not-export-_IO_stdin_used.patch | 40 ++++++++-----------
 1 file changed, 17 insertions(+), 23 deletions(-)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet/0001-linker-script-Do-not-export-_IO_stdin_used.patch b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet/0001-linker-script-Do-not-export-_IO_stdin_used.patch
index eafd497ae2..f9d78e69b0 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet/0001-linker-script-Do-not-export-_IO_stdin_used.patch
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet/0001-linker-script-Do-not-export-_IO_stdin_used.patch
@@ -1,30 +1,24 @@
-From e09ba80e342b3b24bb2a46e11dae1c30cc61c75c Mon Sep 17 00:00:00 2001
+From 3ee6967689b3da30cc4551885d8bcdd44a7a9b52 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 3 Sep 2023 08:48:42 -0700
-Subject: [PATCH] linker-script: Do not export _IO_stdin_used
+Date: Thu, 31 Aug 2023 21:16:55 -0700
+Subject: [PATCH] linker-scripts: Do not export _IO_stdin_used
 
-This is glibc specific toolhain issue, it should have been handled in
-toolchain instead of exposing to applications. This was done to fix
-
-https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=835550
+This is glibc specific and it is not needed with musl.
+See https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=835550
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- linker-script-binary.ver | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/linker-script-binary.ver b/linker-script-binary.ver
-index a2780c0..f030d35 100644
---- a/linker-script-binary.ver
-+++ b/linker-script-binary.ver
-@@ -1,6 +1,5 @@
- {
- global:
--	_IO_stdin_used;
- local:
- 	*;
- };
--- 
-2.42.0
+ tools/create-exports-NetworkManager.sh | 1 -
+ 2 files changed, 2 deletions(-)
 
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1896,7 +1896,6 @@ src_libnm_core_impl_gen_metadata_nm_sett
+ 	$(NULL)
+ 
+ src_libnm_core_impl_gen_metadata_nm_settings_libnm_core_LDFLAGS = \
+-	-Wl,--version-script="$(srcdir)/linker-script-binary.ver" \
+ 	$(SANITIZER_EXEC_LDFLAGS) \
+ 	$(NULL)
+ 
-- 
2.42.0


