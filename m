Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0220CD715CA
	for <webhook@archiver.kernel.org>; Sat, 24 Jan 2026 05:32:23 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13629.1769232739048169765
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 21:32:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hqzfq0t6;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47d59da3d81so24857345e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 21:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769232737; x=1769837537; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nf3UoEXb4mf63qLTi128pZVun53rU8Lk8GIx26DSfBc=;
        b=hqzfq0t65ZmDq9kt7rYHkOiAV0NHgpx0tEYWRtG9DJJwtBLYmpc6zMaLEJ7XYyKHkF
         8yUpPlakuY3maqHVYlFr6pktGubdaWpAAfE2Vu1IRQXvKC/x/sBh+Mq+Xd0CJcF8zobo
         1IOLw1ruCigmjVK+L0VBBcUB/PjyK32OpvirrREjLIz033cXwZDy+fZwS7eMhmrwVmMZ
         CsBM8EfXtjkGzIA38aG5wdWzl5auadM7+xEN8lVF0yWrrLsvUN7YhVlFJNLeIZXDJds/
         GFd9g4sODwvUMy5i+khq0bQc/f8yBNDBVEpg/iEb2cKriYwKaroLtg4MT1/OgfKQUxf7
         Lm8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769232737; x=1769837537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Nf3UoEXb4mf63qLTi128pZVun53rU8Lk8GIx26DSfBc=;
        b=P1pi1vvOREV1zSO41berGVn9zOTiI9mChKr8VvW1NZxGkV+Lh+T8KFSbMOpYde1+7O
         xs1H0nuOo8KZdWbhgmJSo4u5g8soI1eS9AOBoXX7IPGHA9HG/OPm4Y4TM2HfpxTeIwnA
         c0JPfzyp1Crwvh1zSmCMZC3nBI2GKhYblO5q84JXN4+i58vH9nwFVf3MbCL0yivzmV/a
         p+wQNrXCsvsVxzTAZ7e9T195F9Xj74UJ7FRBmlG+J7NDnv58Qm1a+ieBShOnIHSwrjI0
         AFnWtcaUTMs2vbLBqolllxo83m7h6M6o41NBDAy7JiZXK/21n0EbyyxW7+lebArD41hc
         UHiw==
X-Gm-Message-State: AOJu0Yxq+SttM+j9SYarTB5/1JL+OIxRBx+KZJiYf6djZae9pkI+GwYb
	GFZEfwpY97BVb5rAP7zEKrG+rp3vEcuYxB9kvyGNhpqKemIWMZgw/h7uw+mxEg==
X-Gm-Gg: AZuq6aJMWM4le8Ug4qfJRv2TDZ+0NXhGVcw+nEFzLx66Z9NtKc/VY9NOBIBq6CVZ2su
	p+jAU3645e9RnZO77NV4pA1gb9+OEGXxahQrAguY/6wB8WRK+2vPB7FJ98G2+AXlTwHP8lhrZXv
	Urud+8/chk3eoLKd8mqkUYDKe1v8IM1IAKQ/ODuh8ggxhG9BDBONH6P/2hDrIguDh3tXa3v9XpD
	/s6fPB1bIV6HtzNC1Ic1+1qd1mDQ2+08m+3O97f4hZCHfSG3WFtNUt9/PgJRd2oKVgimZeeecxh
	L2uA1IMIhz2UqZKpcTHAWUFm/J97+DpxB89eShe9Am3Eo1CKEwTlIX+JT2v0+YOzlUgJ2PXxcDq
	vU4/5shmw4C6FV9DBxEDD9+BnhQTgUPM6SxBncso3Zt6Ot0/XOKex+NC9qYJRPT6aeii77eGQQJ
	+zRViP4/l5
X-Received: by 2002:a05:600c:35c6:b0:480:4a90:1afd with SMTP id 5b1f17b1804b1-4804d251994mr92726205e9.0.1769232737367;
        Fri, 23 Jan 2026 21:32:17 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804dbb6315sm40746155e9.4.2026.01.23.21.32.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 21:32:16 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 3/5] yelp: patch CVE-2025-3155
Date: Sat, 24 Jan 2026 06:32:13 +0100
Message-ID: <20260124053215.4066209-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124053215.4066209-1-skandigraun@gmail.com>
References: <20260124053215.4066209-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 05:32:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123804

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-3155

Pick the patch that refers to this CVE explicitly in its description.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../yelp/yelp/CVE-2025-3155.patch             | 119 ++++++++++++++++++
 meta-gnome/recipes-gnome/yelp/yelp_42.2.bb    |   1 +
 2 files changed, 120 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/yelp/yelp/CVE-2025-3155.patch

diff --git a/meta-gnome/recipes-gnome/yelp/yelp/CVE-2025-3155.patch b/meta-gnome/recipes-gnome/yelp/yelp/CVE-2025-3155.patch
new file mode 100644
index 0000000000..01f62bf961
--- /dev/null
+++ b/meta-gnome/recipes-gnome/yelp/yelp/CVE-2025-3155.patch
@@ -0,0 +1,119 @@
+From 24d4f06a8692f448c635201c26e6fa19581f5760 Mon Sep 17 00:00:00 2001
+From: Shaun McCance <shaunm@gnome.org>
+Date: Fri, 18 Apr 2025 11:33:01 -0400
+Subject: [PATCH] Initial fix for CVE-2025-3155 from parrot409
+
+https://gitlab.gnome.org/GNOME/yelp/-/issues/221
+
+CVE: CVE-2025-3155
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/yelp/-/commit/a2f3caf8500287981331c4ff54369e9c5747cd9d]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ data/xslt/mal2html.xsl.in    |  5 +++++
+ data/xslt/man2html.xsl.in    |  2 +-
+ data/xslt/yelp-common.xsl.in |  7 +++++++
+ libyelp/yelp-transform.c     | 19 +++++++++++++++++++
+ libyelp/yelp-view.c          |  2 +-
+ 5 files changed, 33 insertions(+), 2 deletions(-)
+
+diff --git a/data/xslt/mal2html.xsl.in b/data/xslt/mal2html.xsl.in
+index 9e44b73..0a74da5 100644
+--- a/data/xslt/mal2html.xsl.in
++++ b/data/xslt/mal2html.xsl.in
+@@ -19,6 +19,11 @@
+ <xsl:param name="mal.link.prefix" select="'xref:'"/>
+ <xsl:param name="mal.link.extension" select="''"/>
+ 
++<xsl:template name="html.head.top.custom">
++  <xsl:param name="node" select="."/>
++  <meta http-equiv="Content-Security-Policy" content="default-src bogus-ghelp: bogus-gnome-help: bogus-help: bogus-help-list: bogus-info: bogus-man: ; script-src 'nonce-{$html.csp.nonce}'; style-src 'nonce-{$html.csp.nonce}'; "/>
++</xsl:template>
++
+ <xsl:template name="mal.link.target.custom">
+   <xsl:param name="node" select="."/>
+   <xsl:param name="action" select="$node/@action"/>
+diff --git a/data/xslt/man2html.xsl.in b/data/xslt/man2html.xsl.in
+index 676ce3e..56bc1f5 100644
+--- a/data/xslt/man2html.xsl.in
++++ b/data/xslt/man2html.xsl.in
+@@ -131,7 +131,7 @@
+   the correct styling and a single character which we measure the
+   width of and update each sheet as required.
+ -->
+-<script type="text/javascript" language="javascript">
++<script type="text/javascript" language="javascript" nonce="{$html.csp.nonce}">
+ <xsl:text>
+ $(document).ready (function () {
+   var div = document.getElementById("invisible-char");
+diff --git a/data/xslt/yelp-common.xsl.in b/data/xslt/yelp-common.xsl.in
+index 0c1ec9b..421fc02 100644
+--- a/data/xslt/yelp-common.xsl.in
++++ b/data/xslt/yelp-common.xsl.in
+@@ -15,6 +15,13 @@
+ <xsl:param name="html.syntax.highlight" select="true()"/>
+ <xsl:param name="html.js.root" select="'file://@XSL_JSDIR@/'"/>
+ 
++<xsl:param name="html.csp.nonce" select="yelp:generate_nonce()"/>
++
++<xsl:template name="html.head.top.custom">
++  <xsl:param name="node" select="."/>
++  <meta http-equiv="Content-Security-Policy" content="default-src bogus-ghelp: bogus-gnome-help: bogus-help: bogus-help-list: bogus-info: bogus-man: ; script-src 'nonce-{$html.csp.nonce}'; style-src 'unsafe-inline'; "/>
++</xsl:template>
++
+ <xsl:template name="html.js.mathjax">
+   <xsl:param name="node" select="."/>
+   <xsl:if test="$node//mml:*[1]">
+diff --git a/libyelp/yelp-transform.c b/libyelp/yelp-transform.c
+index e74eb46..2ce1d05 100644
+--- a/libyelp/yelp-transform.c
++++ b/libyelp/yelp-transform.c
+@@ -71,6 +71,8 @@ static void      xslt_yelp_cache            (xsltTransformContextPtr  ctxt,
+                                              xsltStylePreCompPtr      comp);
+ static void      xslt_yelp_aux              (xmlXPathParserContextPtr ctxt,
+                                              int                      nargs);
++static void      xslt_yelp_generate_nonce   (xmlXPathParserContextPtr ctxt,
++                                             int                      nargs);
+ 
+ enum {
+     PROP_0,
+@@ -412,6 +414,10 @@ transform_run (YelpTransform *transform)
+                              BAD_CAST "input",
+                              BAD_CAST YELP_NAMESPACE,
+                              (xmlXPathFunction) xslt_yelp_aux);
++    xsltRegisterExtFunction (priv->context,
++                         BAD_CAST "generate_nonce",
++                         BAD_CAST YELP_NAMESPACE,
++                         (xmlXPathFunction) xslt_yelp_generate_nonce);
+ 
+     priv->output = xsltApplyStylesheetUser (priv->stylesheet,
+                                             priv->input,
+@@ -607,3 +613,16 @@ xslt_yelp_aux (xmlXPathParserContextPtr ctxt, int nargs)
+     xsltExtensionInstructionResultRegister (tctxt, ret);
+     valuePush (ctxt, ret);
+ }
++
++static void
++xslt_yelp_generate_nonce (xmlXPathParserContextPtr ctxt, int nargs)
++{
++    GRand* rand;
++    gchar* nonce_str;
++
++    rand = g_rand_new ();
++    nonce_str = g_strdup_printf("%08x%08x", g_rand_int (rand), g_rand_int (rand));
++    xmlXPathReturnString (ctxt, xmlStrdup ((xmlChar *) nonce_str));
++    g_free(nonce_str);
++    g_rand_free(rand);
++}
+diff --git a/libyelp/yelp-view.c b/libyelp/yelp-view.c
+index 32ae131..d544c5d 100644
+--- a/libyelp/yelp-view.c
++++ b/libyelp/yelp-view.c
+@@ -971,7 +971,7 @@ view_external_uri (YelpView *view,
+ 
+     if (app_info)
+       {
+-        if (!strstr (g_app_info_get_executable (app_info), "yelp"))
++        if (!strstr (g_app_info_get_executable (app_info), "yelp") && !strstr (struri, "%3C") && !strstr (struri, "%3E"))
+           {
+             GList l;
+ 
diff --git a/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb b/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
index fe3b1105c4..65274b8704 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
@@ -9,6 +9,7 @@ inherit gnomebase itstool autotools-brokensep gsettings gettext gtk-doc features
 # for webkitgtk
 REQUIRED_DISTRO_FEATURES = "x11"
 
+SRC_URI += "file://CVE-2025-3155.patch"
 SRC_URI[archive.sha256sum] = "a2c5fd0787a9089c722cc66bd0f85cdf7088d870e7b6cc85799f8e5bff9eac4b"
 
 DEPENDS += " \

