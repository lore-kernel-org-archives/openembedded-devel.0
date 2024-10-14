Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD64CCFC512
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:03 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.50332.1728896159138399377
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:55:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Mmuk2uaL;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896160; x=1760432160;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Gj++JgJl1XtrqYkgFrUe7Nh2CEjzqHKxGWkGBoRV6HI=;
  b=Mmuk2uaLydg6J5hg+l23jsYjRm4qVIsMOrNhVdUSvsoGPFasyjJ2kYQ6
   FfNSudQ5eRI4gXMamSLdyJAW+B0c0qIhacymOdXzmhn4n6M9wSfXmU0Vm
   LW7GR1eIduBUkF2CCbiSFKUm6Wc0td5hgfBJCKpcPx4J3d+fZ85vNriCt
   I/QZPsMs+/huLl/An8Heb4N8hASw2+Hwv85bmKGhiZb8lG5TBitnkdWeY
   gRzlVy7bRL/LbfKdeoimWm4QWqsJFmHa55t3n0J8zvccQPyzsZm0l+RgC
   lvvZVjTvg8xhgcYlLHJSG5KLAPxm3K2PF9uOO6eYUYnaTYJNNl3uyxdoj
   A==;
X-CSE-ConnectionGUID: eivhUX/jT5Gy3lIHLeMvwQ==
X-CSE-MsgGUID: tuvooc0mSKODbGWulbHZmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="176692986"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="176692986"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:55:57 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id EC949D4334
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:54 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 39D13BF3C2
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C887920071A28
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 908BF1A01E9;
	Mon, 14 Oct 2024 16:55:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 06/54] libgsf: upgrade 1.14.52 -> 1.14.53
Date: Mon, 14 Oct 2024 16:54:27 +0800
Message-Id: <1728896115-2944-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10--11.134800-10.000000
X-TMASE-MatchedRID: ZsQmnj20Xtajz0nOeth/yYL5ja7E+OhykdS3kPlaZyXkABvhO7aBvqTz
	q4wH3yI2moETHaQ3q1EiQI2Lt1TPsv12TsqRMnfHGqSG/c50XgMZ9yaepMI1Vt9RlPzeVuQQli+
	BaqMwTNo1gIHPPGxSe9nl43V4kx2lWkIi5GvRHEo/QdUh6LEl0ME5XPQnBzGXR/IzlV+CMbbT0P
	pHDbMis/GreLFhOYYLg7NuIbXgE5/6C0RbcP9AphxA1AKmVGTOBGvINcfHqhdOaDdl7pggvXV12
	AgUmT2W15zUG9mZSpJ/OIVI64uT8Wk91TWmb9wjfTWvG3pXL4SZIt4iAQN6P/ZqmYjn42vPxOv8
	bbijtGv9c56RbPBO0lItKmIR0y1HDrWW+YTCqzF6YcsVu4qNbn0tCKdnhB589yM15V5aWpj6C0e
	Ps7A07RRAJC2k3BZ6yLFiM3tgMN3tXhKwxEtSdEf5VmISdqMOI1iuhhgbHEM=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112856

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Compilation-attempt-fixes-for-libxml-2.13.patch
removed since it's included in 1.14.53

Changelog:
============
* Compilation fixes for libxml 2.13
* Fix ABR in gsf-vba-dump.
* Teach gsf (the tool) to handle odf properties.
* Fix integer overflows affecting memory allocation.
* Add missing "DocumentStatus" ole2 property.
* Avoid some undefined C behaviour in overflow checks.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...lation-attempt-fixes-for-libxml-2.13.patch | 105 ------------------
 .../{libgsf_1.14.52.bb => libgsf_1.14.53.bb}  |   5 +-
 2 files changed, 2 insertions(+), 108 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/libgsf/libgsf/0001-Compilation-attempt-fixes-for-libxml-2.13.patch
 rename meta-gnome/recipes-gnome/libgsf/{libgsf_1.14.52.bb => libgsf_1.14.53.bb} (65%)

diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf/0001-Compilation-attempt-fixes-for-libxml-2.13.patch b/meta-gnome/recipes-gnome/libgsf/libgsf/0001-Compilation-attempt-fixes-for-libxml-2.13.patch
deleted file mode 100644
index 08ff51205..000000000
--- a/meta-gnome/recipes-gnome/libgsf/libgsf/0001-Compilation-attempt-fixes-for-libxml-2.13.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From 4a84e9857d83f684bf53d616942a393ce558a328 Mon Sep 17 00:00:00 2001
-From: Morten Welinder <terra@gnome.org>
-Date: Wed, 3 Jul 2024 19:18:15 -0400
-Subject: [PATCH] Compilation: attempt fixes for libxml 2.13
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libgsf/-/commit/5d4bb55095d3d6ef793c1908a88504183e28644c]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac         |  1 +
- gsf/gsf-input-http.c | 19 +++++++++++++++++++
- 2 files changed, 20 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index fceb776..7c2f946 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -238,6 +238,7 @@ AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <glib/gstdio.h>]], [[(void)g_chown("/
- 		AC_MSG_RESULT(yes)],
- 	       [AC_MSG_RESULT(no)])
- AC_CHECK_FUNCS(g_date_time_new_from_iso8601 g_date_time_format_iso8601)
-+AC_CHECK_FUNCS(xmlNanoHTTPOpen xmlNanoHTTPClose)
- CFLAGS=$SAVE_CFLAGS
- LIBS=$SAVE_LIBS
- 
-diff --git a/gsf/gsf-input-http.c b/gsf/gsf-input-http.c
-index bdde3c8..03f4045 100644
---- a/gsf/gsf-input-http.c
-+++ b/gsf/gsf-input-http.c
-@@ -23,7 +23,10 @@
- #include <gsf/gsf-input-http.h>
- #include <gsf/gsf.h>
- 
-+#ifdef HAVE_XMLNANOHTTPOPEN
-+// It's going away, so make it conditional
- #include <libxml/nanohttp.h>
-+#endif
- 
- struct _GsfInputHTTP {
-         GsfInput input;
-@@ -74,7 +77,9 @@ gsf_input_http_finalize (GObject *obj_input)
- 	input->content_type = NULL;
- 
-         if (input->ctx) {
-+#ifdef HAVE_XMLNANOHTTPCLOSE
-                 xmlNanoHTTPClose ((gpointer) input->ctx);
-+#endif
-                 input->ctx = NULL;
-         }
- 
-@@ -215,6 +220,7 @@ gsf_input_http_get_content_type (GsfInputHTTP *input)
-         return content_type;
- }
- 
-+#ifdef HAVE_XMLNANOHTTPOPEN
- static GsfInput *
- make_local_copy (gpointer *ctx)
- {
-@@ -254,6 +260,7 @@ make_local_copy (gpointer *ctx)
- 
- 	return copy;
- }
-+#endif
- 
- /**
-  * gsf_input_http_new:
-@@ -265,6 +272,7 @@ make_local_copy (gpointer *ctx)
- GsfInput *
- gsf_input_http_new (gchar const * url, GError **error G_GNUC_UNUSED)
- {
-+#ifdef HAVE_XMLNANOHTTPOPEN
-         GObject *obj;
- 	GsfInput *input;
-         gpointer ctx;
-@@ -293,6 +301,10 @@ gsf_input_http_new (gchar const * url, GError **error G_GNUC_UNUSED)
-         GSF_INPUT_HTTP (obj)->ctx = ctx;
- 
-         return GSF_INPUT (obj);
-+#else
-+        g_return_val_if_fail(url != NULL, NULL);
-+	return NULL;
-+#endif
- }
- 
- static GsfInput *
-@@ -304,6 +316,7 @@ gsf_input_http_dup (GsfInput *src, GError **err)
- static guint8 const *
- gsf_input_http_read (GsfInput *input, size_t num_bytes, guint8 *buffer)
- {
-+#ifdef HAVE_XMLNANOHTTPOPEN
-         int nread;
-         size_t total_read;
-         gpointer ctx = GSF_INPUT_HTTP (input)->ctx;
-@@ -324,6 +337,12 @@ gsf_input_http_read (GsfInput *input, size_t num_bytes, guint8 *buffer)
-                         return NULL;
-         }
-         return buffer;
-+#else
-+	(void)input;
-+	(void)num_bytes;
-+	(void)buffer;
-+	return NULL;
-+#endif
- }
- 
- static gboolean
diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.52.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.53.bb
similarity index 65%
rename from meta-gnome/recipes-gnome/libgsf/libgsf_1.14.52.bb
rename to meta-gnome/recipes-gnome/libgsf/libgsf_1.14.53.bb
index 97cbbe450..ffa24e812 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.52.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.53.bb
@@ -9,9 +9,8 @@ DEPENDS= "libxml2 bzip2 glib-2.0 zlib"
 GNOMEBASEBUILDCLASS = "autotools"
 inherit gnomebase gobject-introspection gettext gtk-doc
 
-SRC_URI[archive.sha256sum] = "9181c914b9fac0e05d6bcaa34c7b552fe5fc0961d3c9f8c01ccc381fb084bcf0"
-SRC_URI += "file://0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch \
-            file://0001-Compilation-attempt-fixes-for-libxml-2.13.patch"
+SRC_URI[archive.sha256sum] = "0eb59a86e0c50f97ac9cfe4d8cc1969f623f2ae8c5296f2414571ff0a9e8bcba"
+SRC_URI += " file://0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gdk-pixbuf] = "--with-gdk-pixbuf,--without-gdk-pixbuf,gdk-pixbuf"
-- 
2.34.1


