Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 61A7970F06
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Oct 2014 10:04:34 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id a1so3825686wgh.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Oct 2014 03:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=DaoWpFsT9jBQuEFTOuEOZv+J4y0QjNywoSgbVS5sIhA=;
	b=MnZpvdXmwEoOcsVz8MsGVcl7vcS5xT2USEcCcDbZlnjECtKy6eYFfklJMNhjBNtswf
	kbCoz8sbHqAvAdbpZL2zY2DOdd68Xz62YcJks9FTdRpIfhh5shwpA8VV6jhcb1X6xrlE
	DGvCKt7c1Rgg/Gf3w3bpaBKYw2aqkiLTKF9gOAn/38XDUkE80EnkEet4dHp1AO7ngZJy
	1hJWKrl5cRi6DtE9iml6jeC0X8CTQbFEkeXMeSQV0FuLW1efR0NXX8q0GJIsP07QgAiQ
	8aQvJenGuaDkerk5uptOaYFn3hJkLHr+JWnyR88cbKCu6sFqQmYBpbxAt4Z0N2Mo11nD
	ShZA==
X-Received: by 10.194.203.234 with SMTP id kt10mr989532wjc.135.1414663475076; 
	Thu, 30 Oct 2014 03:04:35 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id l4sm4721448wjx.14.2014.10.30.03.04.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Oct 2014 03:04:34 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Oct 2014 11:04:23 +0100
Message-Id: <1414663463-31222-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1414663463-31222-1-git-send-email-schnitzeltony@googlemail.com>
References: <1414663463-31222-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [master][dizzy][PATCH 2/2] gvfs: replace deprecated g_memmove by memmove
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
X-List-Received-Date: Thu, 30 Oct 2014 10:04:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* g_memmove was deprecated ib glib-2.0 2.40
* opening a remote connection created by gigolo with thunar failed with:
  | thunar: symbol lookup error: /usr/lib/modules/libgvfsdbus.so: undefined symbol: g_memmove
* further tests showed that browsing in windows networks is fixed now

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
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
1.8.3.1


