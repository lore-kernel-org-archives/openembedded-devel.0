Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3790C25B48
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 05:04:33 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.595.1698383065327752956
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Oct 2023 22:04:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m8mWJIlg;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so1472364a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 22:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698383064; x=1698987864; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7QBV4fxn19IOaGqeD9Op7eJb/WfLBxnh/btUng6pY0=;
        b=m8mWJIlgT2bI047TenHDsXGE+hoDx7cKgsLpiecdMU6RsB9CPNmKJ7HKE5Vhe5BigO
         VDF3cgGG57Q702+suXMWLt+6RC+9dLQmWkPMh/YlfYvTolBHHsGA90MAJYoS3nYTQQps
         Dw61Ck7JxI26Lo+SFErvMEFXy+QcBajeYXdfOnWdH+opm+DGgjw4C20OX7YGKsKyfjsK
         g3XDEA/Rl93Iib19xQiS1RQpOS68Qv3RmmlVMn4Bw++yDG+w4vB8ZVM9ers3gXRXnZY6
         1NSDgt7Scgz62BSmsUFZwiKGjG9PTzySH1RD4ZJ0GHbdTC/IxHNvHsWihAdEpKkGVjt7
         vy8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698383064; x=1698987864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k7QBV4fxn19IOaGqeD9Op7eJb/WfLBxnh/btUng6pY0=;
        b=mfnwmqupGFIqRe8+qyvWg7eKcXCX39t+j2d70aJIUR1R99CKAx2K9dWnlpUTO+EVNL
         PkHFP0c1z/lWsBiyhjnZdh+4K0ivOL7ZSMWXCQT4vIbTMc0D8cBhraRuzB+xdeadRmZM
         j/GIxMGnCzt476QmOfvHEESjpN8xlzOY7tX036M5SbB/f2qU/C7xDmmyRXwYPl5MYzJ0
         Qjq+ypUFxu3KkUb5nIV/arSq6f/wC2grKM2dwqjkMR7WN6reAe2fkhKp6F4t2ivAQkoa
         GUXEsaybHhDKWL/QA3l5FaVXXrkFU1b1pZOaTqOacai4z8haEde3VyJth15+I+LLWM3j
         FvsQ==
X-Gm-Message-State: AOJu0YysahlgjYrdtr7Va2JpqQQawezWzsULmrzKpMssfIgcUt4vlAYl
	dyDrlXqFsSud/ahH7rCoQaZK2KMgvwk=
X-Google-Smtp-Source: AGHT+IGvL4cEFhqcSaCzLxtLBXLrbwWjjPtQB3Zi+5zuG6CZ8VnIuJ+CVB1XHdfD9r7LHjf92CdA+w==
X-Received: by 2002:a17:902:cec7:b0:1c1:f6d1:3118 with SMTP id d7-20020a170902cec700b001c1f6d13118mr1944340plg.27.1698383064442;
        Thu, 26 Oct 2023 22:04:24 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::46eb])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902680600b001c5bcc9d916sm589210plk.176.2023.10.26.22.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 22:04:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] networkmanager-openvpn,networkmanager: Update the patch to work with musl + bfd linker
Date: Thu, 26 Oct 2023 22:04:21 -0700
Message-ID: <20231027050421.969572-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231027050421.969572-1-raj.khem@gmail.com>
References: <20231027050421.969572-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Oct 2023 05:04:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105768

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-script-Do-not-export-_IO_stdin_used.patch | 40 ++++++++-----------
 ...scripts-Do-not-export-_IO_stdin_used.patch | 33 ++++-----------
 2 files changed, 25 insertions(+), 48 deletions(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn/0001-linker-script-Do-not-export-_IO_stdin_used.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn/0001-linker-script-Do-not-export-_IO_stdin_used.patch
index eafd497ae2..f9d78e69b0 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn/0001-linker-script-Do-not-export-_IO_stdin_used.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn/0001-linker-script-Do-not-export-_IO_stdin_used.patch
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
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-linker-scripts-Do-not-export-_IO_stdin_used.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-linker-scripts-Do-not-export-_IO_stdin_used.patch
index 71ad01f51c..f9d78e69b0 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-linker-scripts-Do-not-export-_IO_stdin_used.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-linker-scripts-Do-not-export-_IO_stdin_used.patch
@@ -9,33 +9,16 @@ See https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=835550
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- linker-script-binary.ver               | 1 -
  tools/create-exports-NetworkManager.sh | 1 -
  2 files changed, 2 deletions(-)
 
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
-diff --git a/tools/create-exports-NetworkManager.sh b/tools/create-exports-NetworkManager.sh
-index ef4b381..60865ad 100755
---- a/tools/create-exports-NetworkManager.sh
-+++ b/tools/create-exports-NetworkManager.sh
-@@ -54,7 +54,6 @@ get_symbols_nm () {
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1896,7 +1896,6 @@ src_libnm_core_impl_gen_metadata_nm_sett
+ 	$(NULL)
  
- get_symbols_explicit() {
-     cat <<EOF | _sort
--_IO_stdin_used
- EOF
- }
+ src_libnm_core_impl_gen_metadata_nm_settings_libnm_core_LDFLAGS = \
+-	-Wl,--version-script="$(srcdir)/linker-script-binary.ver" \
+ 	$(SANITIZER_EXEC_LDFLAGS) \
+ 	$(NULL)
  
--- 
-2.42.0
-
-- 
2.42.0


