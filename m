Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id A573672228
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Dec 2014 01:04:45 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id kq14so9947158pab.34
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Nov 2014 17:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=sRXrwllVD109N+BDFXKWQ9S17AcGYsLlm4QyblrgtnM=;
	b=RAFWCdMejsFrNoFnwLillxCEcOCFwO5/LRbeyN382buqxLBQfhfViYOFjagTeDKQw5
	anwXuyGAouUlTB2WayEvauwLzfXCmD46NnaKcM7FVsZdX2mbvTSdzFlbl7MUpFsn1pEo
	u4rckOI+XBFwGwJyMK6DxCj3mkqL4Cdf9Yjj/Uz6P4l47KGvS2dFhEsxXU4DzwEGzfOg
	/QhWNhRuO7BizvaKzMKScDMzC/2Pd4rdwC36rH3Ff7i8BXJD/sboJZVnlmjSs6dXb2CC
	pX47tTLjSH7NZCgHceQAVkJ7oq782yBZIOdrXpV92sMhT2XPmxxdVx2Uz1dqZzeL5ZXS
	oHQg==
X-Received: by 10.68.69.48 with SMTP id b16mr93323536pbu.59.1417395886484;
	Sun, 30 Nov 2014 17:04:46 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id v7sm11872248pdl.5.2014.11.30.17.04.44
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 30 Nov 2014 17:04:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Nov 2014 17:04:14 -0800
Message-Id: <0b7401f25af48117c687312ee19fa00845cd5a2a.1417194166.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1417194166.git.akuster808@gmail.com>
References: <cover.1417194166.git.akuster808@gmail.com>
In-Reply-To: <cover.1417194166.git.akuster808@gmail.com>
References: <cover.1417194166.git.akuster808@gmail.com>
MIME-Version: 1.0
Cc: otavio@ossystems.com.br
Subject: [PATCH 12/15] gvfs: replace deprecated g_memmove by memmove
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Dec 2014 01:04:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@googlemail.com>

* g_memmove was deprecated ib glib-2.0 2.40
* opening a remote connection created by gigolo with thunar failed with:
  | thunar: symbol lookup error: /usr/lib/modules/libgvfsdbus.so: undefined symbol: g_memmove
* further tests showed that browsing in windows networks is fixed now

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...daemonfile.c-replace-g_memmove-by-memmove.patch | 36 ++++++++++++++++++++++
 meta-gnome/recipes-gnome/gvfs/gvfs.inc             |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gvfs/files/0005-client-gdaemonfile.c-replace-g_memmove-by-memmove.patch

diff --git a/meta-gnome/recipes-gnome/gvfs/files/0005-client-gdaemonfile.c-replace-g_memmove-by-memmove.patch b/meta-gnome/recipes-gnome/gvfs/files/0005-client-gdaemonfile.c-replace-g_memmove-by-memmove.patch
new file mode 100644
index 0000000..c55a99d
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gvfs/files/0005-client-gdaemonfile.c-replace-g_memmove-by-memmove.patch
@@ -0,0 +1,36 @@
+From de7b06dea740900fa63e2e011c9f862fe4b9405c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Mon, 27 Oct 2014 10:43:40 +0100
+Subject: [PATCH] client/gdaemonfile.c: replace g_memmove by memmove
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+g_memmove was deprecated in glib 2.40 [1]
+
+Upstream-Status: pending [2]
+
+[1] https://developer.gnome.org/glib/stable/glib-Memory-Allocation.html#g-memmove
+[2] https://bugzilla.gnome.org/show_bug.cgi?id=739233
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ client/gdaemonfile.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/client/gdaemonfile.c b/client/gdaemonfile.c
+index 15c368c..593ce7a 100644
+--- a/client/gdaemonfile.c
++++ b/client/gdaemonfile.c
+@@ -256,7 +256,7 @@ g_daemon_file_get_parent (GFile *file)
+   len = (guint) 1 + base - path;
+   
+   parent_path = g_new (gchar, len + 1);
+-  g_memmove (parent_path, path, len);
++  memmove (parent_path, path, len);
+   parent_path[len] = 0;
+ 
+   parent = new_file_for_new_path (daemon_file, parent_path);
+-- 
+1.8.3.1
+
diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs.inc b/meta-gnome/recipes-gnome/gvfs/gvfs.inc
index 288b205..c516a40 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs.inc
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs.inc
@@ -15,6 +15,7 @@ SRC_URI += " \
     file://0002-Adapt-to-GLib-2.31-deprecations-and-thread-API-chang.patch \
     file://0003-Adapt-to-glib-mutex-API-changes.patch \
     file://0004-Adapt-to-glib-thread-API-changes.patch \
+    file://0005-client-gdaemonfile.c-replace-g_memmove-by-memmove.patch \
 "
 
 EXTRA_OECONF = "--with-archive-includes=${STAGING_INCDIR} \
-- 
1.9.1


