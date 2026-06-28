Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C38C4450B
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 16:22:40 +0000 (UTC)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20728.1782663758420982026
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 09:22:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MHbch0nM;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3078e0dcd67so4380129eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 09:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782663758; x=1783268558; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4WOxWh2cmjvWcGewo2a2bY9uLVB8gxK7P7BqruVFkI=;
        b=MHbch0nMbg8Zsh50zcarm/VjEPZlRC1NjfgauhGgdY4MeXc38IzObLEQAPzDh9pYG9
         KxS/tdxJpcMf6euzWrpFwf3yeQMQruW8NdA2H9R1LIILCdnSDqWHAZqGR1HgXU5NaKtN
         qot1F4WpqxU+qYU6Y23L0SPkz5/D/y7H4KHyZ94CCmHRhZJR1D415yPuF0PDGtIhLzzl
         MsLDAt5IhEZ6LqW1wcoYlXjLnunz2ltdskOC9S3eiIhxdmjl7NF+ul4F0RKDHQwdEpLH
         7HW59pfejku2gk9oIiUTJm33zchlkt/aV0cEv0kNw8cULfSqFgZNwWx6cxO+acP7xqY8
         bqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782663758; x=1783268558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K4WOxWh2cmjvWcGewo2a2bY9uLVB8gxK7P7BqruVFkI=;
        b=NGZKv8s6bcbKLOVgOC488K86V2XAl663zuhtxEmmi3OBEyUWP37GCOkyfiBTYZi2EQ
         PJc/J3Tjwj5X2Cm0xZG+C7blhnsyUTLqBd/MzP0Gl/JO4nlJ5kCh+ZrsHjwx70YC+ydg
         Vcw9tH1sErkVQB26I5djQa6pcJn39I5TksRPXC37cGF0UUfxg//zMJutTJnatP6ZfvKa
         dWbKvyNfj79+xzeEJEcMnCh1adGCYZUj9ipl2Fh4e3fb+zJNZw8EIVMPHuzQYOfcWIqw
         UzDmUXR/ja5GM7jj0x3SjOXx29gjgZleS469fh8/RNJP2cetf+GttoENn6uvVA27CUpH
         imVQ==
X-Gm-Message-State: AOJu0YwYYII59j1AmXees7VR3+1PewsNYkgd9L8FMfxeAgs0ctfrq7cJ
	jygWoL84h/YMhiq1e/2PQ15C7RJ4kFKxegQJKf8zRVqOEPRQlCS2TKEjOlwhR3wc1Rxtsw==
X-Gm-Gg: AfdE7clVlAPgaRW4aV77zIU7hvYWD/Epn7k0LOP46gIqBvNbww5yOKwcKRrWrWRfL25
	KW3akB/9DrsgpjkImvASsZykd8GntF5R90zd5zWdTFeP7U66RWooE0vBJb1HLFC8pCRFsT1IVRj
	+ewhU/C0fE3kOgjlwqevmmi2XFvnjOJ8a/OBH1LCTuA8GqmV/E7uZfq2DvorDb9DdpmBBftL9aV
	VfcmBn2GSs88CELJqgiX0QdR+8qrUtYUMQAdxpeQHEuWAPVn5wNZJmYmPGW8t9xDCodDpuQfVBJ
	hjaG8/kaPomvVaRCJuGgxra20BVIOMRsnCQTqCDoK9ABpUu2KJD/BRSskXICezuf77mXFeFcGTC
	GAbmB7khEjF7uVrhfSQLhvwOL9nVMF9+rLog8KguhRoNSS9xidNOLqNUgFb0p473mvH+XSxoc4L
	CGs3fbEA3uJjrbHsJ14sN8v8IPNvP9qaRFy3YsGTplf/XXcxhRZahDZrRvNJg48OBupWnmORtQw
	CiZapf/SHA6ebKGSeDAuH/kdFRA9nSG/m7plzX4FYTLxAfsMKy7/8kGlBMj9Tlsu/TPsSqc9wAL
	rHY7AMT1+LUFADhQjaZqXRO2pyQNLboG0j9v0bds
X-Received: by 2002:a05:7301:9e41:b0:30c:472a:248 with SMTP id 5a478bee46e88-30c84df9c55mr11898173eec.32.1782663757643;
        Sun, 28 Jun 2026 09:22:37 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm49849445eec.7.2026.06.28.09.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 09:22:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-xfce][PATCH 112/128] xfce4-panel: fix redefinition of autoptr cleanup for XfceTitledDialog
Date: Sun, 28 Jun 2026 09:22:06 -0700
Message-ID: <20260628162222.4081517-12-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
References: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 16:22:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127922

Newer libxfce4ui defines the XfceTitledDialog autoptr cleanup functions
the panel's guarded redefinition is redundant and breaks the build
under GCC 16. Drop it (backport of upstream 3ac941fc).

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...oe-Remove-wrong-autoptr-define-guard.patch | 42 +++++++++++++++++++
 .../xfce4-panel/xfce4-panel_4.21.1.bb         |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-panel/files/0001-panel-tic-tac-toe-Remove-wrong-autoptr-define-guard.patch

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/files/0001-panel-tic-tac-toe-Remove-wrong-autoptr-define-guard.patch b/meta-xfce/recipes-xfce/xfce4-panel/files/0001-panel-tic-tac-toe-Remove-wrong-autoptr-define-guard.patch
new file mode 100644
index 0000000000..493e468bc4
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-panel/files/0001-panel-tic-tac-toe-Remove-wrong-autoptr-define-guard.patch
@@ -0,0 +1,42 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 23 Jun 2026 00:00:00 +0000
+Subject: [PATCH] panel: tic-tac-toe: Remove wrong autoptr define guard
+
+panel-tic-tac-toe.h guarded its own
+G_DEFINE_AUTOPTR_CLEANUP_FUNC (XfceTitledDialog, g_object_unref) with
+"#ifndef glib_autoptr_clear_XfceTitledDialog". That macro is never
+defined: G_DEFINE_AUTOPTR_CLEANUP_FUNC emits static inline functions, not
+a glib_autoptr_clear_* macro, so the guard is always true.
+
+libxfce4ui (>= 4.21.8) now defines the XfceTitledDialog autoptr cleanup
+functions itself in xfce-titled-dialog.h. Because the guard never
+triggers, the panel header redefines the same static inline cleanup
+functions, which is a hard error with GCC 16 / recent clang:
+
+  error: redefinition of 'glib_autoptr_clear_XfceTitledDialog'
+
+Drop the redundant definition entirely; rely on libxfce4ui to provide it.
+
+Upstream-Status: Backport [https://gitlab.xfce.org/xfce/xfce4-panel/-/commit/3ac941fc083fee5e56b0f3e509d6f6b461b48e39]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ panel/panel-tic-tac-toe.h | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/panel/panel-tic-tac-toe.h b/panel/panel-tic-tac-toe.h
+index 1111111..2222222 100644
+--- a/panel/panel-tic-tac-toe.h
++++ b/panel/panel-tic-tac-toe.h
+@@ -24,9 +24,6 @@ G_BEGIN_DECLS
+ G_BEGIN_DECLS
+
+ #define PANEL_TYPE_TIC_TAC_TOE (panel_tic_tac_toe_get_type ())
+-#ifndef glib_autoptr_clear_XfceTitledDialog
+-G_DEFINE_AUTOPTR_CLEANUP_FUNC (XfceTitledDialog, g_object_unref)
+-#endif
+ G_DECLARE_FINAL_TYPE (PanelTicTacToe, panel_tic_tac_toe, PANEL, TIC_TAC_TOE, XfceTitledDialog)
+
+ void
+-- 
+2.43.0
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.21.1.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.21.1.bb
index 350784e083..1998a9f23e 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.21.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.21.1.bb
@@ -17,6 +17,7 @@ SRC_URI += " \
     file://0001-build-Do-not-display-full-path-in-generated-headers.patch \
     file://0001-build-Be-sure-to-generate-sub-headers-before-includi.patch \
     file://0002-build-Install-missing-libxfce4panel.h.patch \
+    file://0001-panel-tic-tac-toe-Remove-wrong-autoptr-define-guard.patch \
 "
 SRC_URI[sha256sum] = "c940dae515bef4af08a126011d2fd873ce99e815157ba8cef5332195bb60e51e"
 

