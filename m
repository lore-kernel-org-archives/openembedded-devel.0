Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id 773107FC32
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Oct 2019 08:39:44 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id v19so3307213pfm.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Oct 2019 01:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=v9FG6MHDo0iswwruHtDum4U/uOpwclwnVMz9i/CyCbQ=;
	b=oFmH/uZfdMb2XhHA4Mfxib9/ypbS0vL0SVwsbwzOCQeEmYyTqh9YaeniXq+LtBE1hQ
	1p3n0YuDRXauWBWIB2QACG9OkVhuFzuVRfDM/u8LIO6uncppcgXDT+Bh0sfcqvTBFtiG
	gnrgcJChjI9vlRqD20a4Y9aMCCv5FPOMZzJEr6j2kJ6dVthD0EFSLfOhrWTlUxfnBITk
	bTMuUfBMHP+4W5q9KjSCznx2vB/bP0qgJMRVo1YahjaC6utTkUS+zT3B4ZhYy/8pyzSb
	ywTmDVbHMPi+C0AdclShaN/fZtVR84y+DWyN2A2i5UG9ZV67RVHNy/WiqOXQy1xjLzEW
	0PkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=v9FG6MHDo0iswwruHtDum4U/uOpwclwnVMz9i/CyCbQ=;
	b=fvcn3Oep1HaTkG6NcdIKavyEBNbA9PIak/93F/H1lWwefClZEfeR9ZNYcd7XL/ci+H
	cYNKJk9+HMy30bl0Wq7JKituDznwWgaWqnARgBboFMnQttZoWcgKvNpqACkeTKzxKtOY
	ghXed9SINCduKg+04RWopmk8DZvB0Q0v2Bg5fzRl9lDlMMgEUxLoCHSOQH2P5Y2d8TOh
	23ndk2j0CGuxl4lf7DOn4H7Ipih0p2pVxDsjIJLev5m4Nor5AVyOtau6nrKbKsM6gt3A
	LYLcpQNR/HiJ6R53LPm1Hm93d0LNNOvwfbTRGBbpAit/0M6WFvXIYMGTcMmiGzA8D87v
	vCSw==
X-Gm-Message-State: APjAAAVokLJh1aT6DTD2VFhhMoGFm5iSJq40QkP0ZuY5QX10T878Md2M
	QtSpXIGzn0SxtLimIiNgOSWeb/Jus61hJQ==
X-Google-Smtp-Source: APXvYqxb7RYoljBN8p67By2yPy3ila1ELzW7FiDvna1TB7m64cUg8fSQ6qRnAtSvO7XmbI2sgE7lxw==
X-Received: by 2002:a63:471b:: with SMTP id u27mr9169968pga.96.1572079184520; 
	Sat, 26 Oct 2019 01:39:44 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::a6a5])
	by smtp.gmail.com with ESMTPSA id
	u68sm5022459pfu.39.2019.10.26.01.39.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 26 Oct 2019 01:39:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Oct 2019 01:39:27 -0700
Message-Id: <20191026083927.2700529-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] open-vm-tools: Fix build by removing deprecated G_INLINE_FUNC
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 26 Oct 2019 08:39:44 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ....-Remove-references-to-deprecated-G_.patch | 94 +++++++++++++++++++
 .../open-vm-tools/open-vm-tools_11.0.1.bb     |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-GitHub-Issue-367.-Remove-references-to-deprecated-G_.patch

diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-GitHub-Issue-367.-Remove-references-to-deprecated-G_.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-GitHub-Issue-367.-Remove-references-to-deprecated-G_.patch
new file mode 100644
index 0000000000..6cb5dfcccb
--- /dev/null
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-GitHub-Issue-367.-Remove-references-to-deprecated-G_.patch
@@ -0,0 +1,94 @@
+From 6fb28085e867d7c3ef46577d9ff193a185693bcb Mon Sep 17 00:00:00 2001
+From: Oliver Kurth <okurth@vmware.com>
+Date: Mon, 30 Sep 2019 16:24:27 -0700
+Subject: [PATCH] GitHub Issue #367. Remove references to deprecated G_INLINE_FUNC.
+
+G_INLINE_FUNC was a work-around for compilers that didn't support
+static inline.  Change uses of it to static inline.
+
+Upstream-Status: Backport
+[https://github.com/vmware/open-vm-tools/commit/89c0d444567eb525e8d083fb564c46d68e96660c]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ open-vm-tools/lib/include/vmware/tools/plugin.h     | 2 +-
+ open-vm-tools/lib/include/vmware/tools/threadPool.h | 8 ++++----
+ open-vm-tools/lib/include/vmware/tools/utils.h      | 9 ---------
+ 3 files changed, 5 insertions(+), 14 deletions(-)
+
+diff --git a/open-vm-tools/lib/include/vmware/tools/plugin.h b/open-vm-tools/lib/include/vmware/tools/plugin.h
+index f9acc6a2..deefd1f3 100644
+--- a/open-vm-tools/lib/include/vmware/tools/plugin.h
++++ b/open-vm-tools/lib/include/vmware/tools/plugin.h
+@@ -290,7 +290,7 @@ typedef struct ToolsAppCtx {
+  *
+  * @return TRUE if COM is initialized when the function returns.
+  */
+-G_INLINE_FUNC gboolean
++static inline gboolean
+ ToolsCore_InitializeCOM(ToolsAppCtx *ctx)
+ {
+    if (!ctx->comInitialized) {
+diff --git a/open-vm-tools/lib/include/vmware/tools/threadPool.h b/open-vm-tools/lib/include/vmware/tools/threadPool.h
+index 3f2082b3..5880fbcf 100644
+--- a/open-vm-tools/lib/include/vmware/tools/threadPool.h
++++ b/open-vm-tools/lib/include/vmware/tools/threadPool.h
+@@ -91,7 +91,7 @@ typedef struct ToolsCorePool {
+  *******************************************************************************
+  */
+ 
+-G_INLINE_FUNC ToolsCorePool *
++static inline ToolsCorePool *
+ ToolsCorePool_GetPool(ToolsAppCtx *ctx)
+ {
+    ToolsCorePool *pool = NULL;
+@@ -123,7 +123,7 @@ ToolsCorePool_GetPool(ToolsAppCtx *ctx)
+  *******************************************************************************
+  */
+ 
+-G_INLINE_FUNC guint
++static inline guint
+ ToolsCorePool_SubmitTask(ToolsAppCtx *ctx,
+                          ToolsCorePoolCb cb,
+                          gpointer data,
+@@ -153,7 +153,7 @@ ToolsCorePool_SubmitTask(ToolsAppCtx *ctx,
+  *******************************************************************************
+  */
+ 
+-G_INLINE_FUNC void
++static inline void
+ ToolsCorePool_CancelTask(ToolsAppCtx *ctx,
+                          guint taskId)
+ {
+@@ -197,7 +197,7 @@ ToolsCorePool_CancelTask(ToolsAppCtx *ctx,
+  *******************************************************************************
+  */
+ 
+-G_INLINE_FUNC gboolean
++static inline gboolean
+ ToolsCorePool_StartThread(ToolsAppCtx *ctx,
+                           const gchar *threadName,
+                           ToolsCorePoolCb cb,
+diff --git a/open-vm-tools/lib/include/vmware/tools/utils.h b/open-vm-tools/lib/include/vmware/tools/utils.h
+index f6574590..a3292d5c 100644
+--- a/open-vm-tools/lib/include/vmware/tools/utils.h
++++ b/open-vm-tools/lib/include/vmware/tools/utils.h
+@@ -51,15 +51,6 @@
+ #  include <sys/time.h>
+ #endif
+ 
+-
+-/* Work around a glib limitation: it doesn't set G_INLINE_FUNC on Win32. */
+-#if defined(G_PLATFORM_WIN32)
+-#  if defined(G_INLINE_FUNC)
+-#     undef G_INLINE_FUNC
+-#  endif
+-#  define G_INLINE_FUNC static __inline
+-#endif
+-
+ #ifndef ABS
+ #  define ABS(x) (((x) >= 0) ? (x) : -(x))
+ #endif
+-- 
+2.23.0
+
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb
index 5dcf818381..e43a39b613 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb
@@ -38,6 +38,7 @@ SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https \
     file://0011-Use-uintmax_t-for-handling-rlim_t.patch;patchdir=.. \
     file://0012-Use-off64_t-instead-of-__off64_t.patch;patchdir=.. \
     file://0013-misc-Do-not-print-NULL-string-into-logs.patch;patchdir=.. \
+    file://0001-GitHub-Issue-367.-Remove-references-to-deprecated-G_.patch;patchdir=.. \
 "
 SRCREV = "d3edfd142a81096f9f58aff17d84219b457f4987"
 
-- 
2.23.0


