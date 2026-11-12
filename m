Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8019.1794465922887509924
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 22:45:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=g2z01Hyz;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-37198ed3727so705406eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 22:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794465922; x=1795070722; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j56A8GTjhM00n0uygXAoY507+33338KqkHfqtG0EjzA=;
        b=g2z01HyzrJjzgXeQxGyf3/AgfOAS8BXSaD+VdGpoHQYvpqrK1KkE7ayQgmilwIigTj
         qC4tS+NbkQYD3lzreCUnWhZP44gd2nvyksucpuqPu/7JN7XuRG1CvpIWKQze4T1MxzBR
         n5ZtbA1uLK7a8UlZavwGTu9RvXczxI6ATXcJCaro407mt8etaJkAkh38pulgBpPe4mC4
         eXkcLbecuChFtN+SYeiCGJ4thFCQ7JdOm/M+u1JW1zdohuRZNCN1ZgcSzmCeq02WcXHd
         DVG686iNI81MqQSjRiHgmnYqn++MR+DMMjYEa4E3F0WKl14k2WtK7JrEMqQ6V338jDb/
         WOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465922; x=1795070722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j56A8GTjhM00n0uygXAoY507+33338KqkHfqtG0EjzA=;
        b=cH4mFtmYLRPuFI6eER4K5ye4L0N//eUfJQ9tEie9OslM7NEOeoHxQQzqWsX0ypf7nq
         MX0fu6b//4wWU5sZj3ZkwRQcirjM5UkErS7fX6QpSgot8BifHRMUnEqb/OPkfN8VXKBg
         /wK1shBuUso36w61+P1cWLaJGO876T3Qn4ANgZ5TUYGq3JP+PBrxlF3G4U2heY+AsVkb
         ZMM/IvcNx3OomOa/zyCeFq1P3i4o6bEJEVLN022z4Pw0aiBSdiAp/x9PF4YLh7Thu5sV
         hWLCQx7l5Zzbd8grQAkkc2H8QD7gnpC+llw+Qbyq4hnKhLpHNvcoFDmQp0mGTtDtwSOE
         eMIw==
X-Gm-Message-State: APuU4Z89nMuj5x1RvupsYlkgAp5MJyxD9VMohJWoawOnOYndkUVYJEgH
	zkHGPFPLLLhkpk/vUgZf02D6dNkR50P7+KejFcVF6GRFv0DFdFFAAbWrL9o9biY2rOY=
X-Gm-Gg: AYBFou0rqQtRhTcX0H9QDFPqgTySMuZ3t/QIEu3S0NnH7sSwV3sh18Y62BNbRHsPaJc
	+s/3FBi4EySfCNYWSyQ0qzij3qLcRozi0C8X3Eo5U3m4IU+aQG8C49HC1NAHWjvw6GsqxHnMm1z
	xzGNGP/P4SntQpsiier3cBxj396q2SYnvzVvac+mLIzgMOd05OZZO6EHY7+zZaa3JxRixCsvK3c
	KRsAK8lEKjXzigEPWo1wWnNVZIWSRytzD95h8RPS3/CYOico6rp5U9x6WUb/nuhKNoSznl1p95e
	hqMsIlePnQi0FEROYGUOVQ1B9TmglKCJd/8hgYgCysEgpsmzWQGcqwWyMQ9A4MDj6MgWp1yU1Ze
	JiubQ9G8JjYKrtxMTdKcqDIQ8/P5PZ/WdW3X0Ck29i4qZWYRxJTx5xMVdCUmEBze4ZllXTX2w7C
	xe0iLjyLTLEhumf4Vm0J7lLmiaTHAedz7JRNisKu9RlTvNieFFepb5zl7GDmAScp/IsSmj1mA8y
	zAJuN/pyptmjG10ZfkvO2iWjESO47NndTnWx1HEejKIEg/d5TSLObUiybQgcp5WBPXnI6l96iV7
	JoBj9bCj6jfbttqRvQyxlECoj/bZpHThH5yKbDNt1F+FXX+fs3Xag/s255OPhret+hDjG8ExOnL
	d42hzHVrfayDppXNoqTj6R5LlbOTqP5IvIazMMmNkSQxOVPxiOA5byKaWr0fFTy5f9A/8OZIpW8
	UtOwz0N7xNMT/p7l7K7vM91L4HYIquvMMZxdIsbrSVNaGigIyOoXEVDQHCMdzcWTJKQAWwJQ8hk
	PEt9MBaEN2BXJW4Y6J1QWgFOH2OiaMNMvCm/oyaSlCfBNWnl2DoLsjnBJShksoIQcsD0BTCQbam
	4QUu7h/oZ4fYzaKk1BOIpQADmA==
X-Received: by 2002:a05:7301:f08:b0:376:89a4:d0f4 with SMTP id 5a478bee46e88-377df6ae1bamr1508080eec.6.1794465921851;
        Wed, 11 Nov 2026 22:45:21 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751dae6377sm21055001eec.3.2026.11.11.22.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:45:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 2/5] glade: Remove unused patches
Date: Wed, 11 Nov 2026 22:45:12 -0800
Message-ID: <20261112064515.2411568-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112064515.2411568-1-khem.raj@oss.qualcomm.com>
References: <20261112064515.2411568-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 06:45:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132195
Content-Type: text/plain; charset="utf-8"

These were dropped from SRC_URI in caf1d45b40 (glade: upgrade 3.36.0 -> 3.40.0) but the files were left behind:

  CVE-2020-36774.patch
  remove-yelp-help-rules-var.patch

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../glade/glade/CVE-2020-36774.patch          | 54 -------------------
 .../glade/remove-yelp-help-rules-var.patch    | 39 --------------
 2 files changed, 93 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/glade/glade/CVE-2020-36774.patch
 delete mode 100644 meta-oe/recipes-devtools/glade/glade/remove-yelp-help-rules-var.patch

diff --git a/meta-oe/recipes-devtools/glade/glade/CVE-2020-36774.patch b/meta-oe/recipes-devtools/glade/glade/CVE-2020-36774.patch
deleted file mode 100644
index ae44862ccf..0000000000
--- a/meta-oe/recipes-devtools/glade/glade/CVE-2020-36774.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 8f1ed202ad21c787ec406f531905b4cda64fb13c Mon Sep 17 00:00:00 2001
-From: Juan Pablo Ugarte <juanpablougarte@gmail.com>
-Date: Fri, 2 Oct 2020 16:08:23 -0300
-Subject: [PATCH] GladeGtkBox: fix glade_gtk_box_post_create
-
-Some widgets with contruct properties like GtkMessageDialog get
-rebuilt right after they are created on project loading so we need
-to check glade_project_is_loading() intead of GLADE_CREATE_LOAD
-and use the object ad the connect data to make sure it gets disconected
-if it was the object being rebuilt
-
-Fix issue #479 "Glade 3.36.0 segfaults when opening a file"
-
-CVE: CVE-2020-36774
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glade/-/commit/7acdd3c6f6934f47b8974ebc2190a59ea5d2ed17]
-
-Signed-off-by: Peng Zhang <peng.zhang1.cn@windriver.com>
----
- plugins/gtk+/glade-gtk-box.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/plugins/gtk+/glade-gtk-box.c b/plugins/gtk+/glade-gtk-box.c
-index 1153c957..c995524e 100644
---- a/plugins/gtk+/glade-gtk-box.c
-+++ b/plugins/gtk+/glade-gtk-box.c
-@@ -57,9 +57,9 @@ glade_gtk_box_create_editable (GladeWidgetAdaptor *adaptor,
- }
-
- static void
--glade_gtk_box_parse_finished (GladeProject *project, GladeWidget *gbox)
-+glade_gtk_box_parse_finished (GladeProject *project, GObject *box)
- {
--  GObject *box = glade_widget_get_object (gbox);
-+  GladeWidget *gbox = glade_widget_get_from_gobject (box);
-
-   glade_widget_property_set (gbox, "use-center-child",
-                              gtk_box_get_center_widget (GTK_BOX (box)) != NULL);
-@@ -86,11 +86,11 @@ glade_gtk_box_post_create (GladeWidgetAdaptor *adaptor,
-   g_signal_connect (G_OBJECT (gwidget), "configure-end",
-                     G_CALLBACK (glade_gtk_box_configure_end), container);
-
--  if (reason == GLADE_CREATE_LOAD)
-+  if (glade_project_is_loading (project))
-     {
-       g_signal_connect_object (project, "parse-finished",
-                                G_CALLBACK (glade_gtk_box_parse_finished),
--                               gwidget, 0);
-+                               container, 0);
-     }
- }
-
---
-2.34.1
-
diff --git a/meta-oe/recipes-devtools/glade/glade/remove-yelp-help-rules-var.patch b/meta-oe/recipes-devtools/glade/glade/remove-yelp-help-rules-var.patch
deleted file mode 100644
index 78a8719f23..0000000000
--- a/meta-oe/recipes-devtools/glade/glade/remove-yelp-help-rules-var.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 42efc94c11d510b41d8cf3407e1c3900eb52b600 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 4 Jun 2015 16:28:02 +0800
-Subject: [PATCH] Remove unused variable (YELP_HELP_RULES)
-
-Upstream-Status: Pending
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- help/Makefile.am | 2 --
- help/Makefile.in | 2 --
- 2 files changed, 4 deletions(-)
-
-diff --git a/help/Makefile.am b/help/Makefile.am
-index 50c0e84..5c5d2e9 100644
---- a/help/Makefile.am
-+++ b/help/Makefile.am
-@@ -1,5 +1,3 @@
--@YELP_HELP_RULES@
--
- HELP_ID = glade
-
- HELP_FILES = \
-diff --git a/help/Makefile.in b/help/Makefile.in
-index 6978ea5..e1c7d3b 100644
---- a/help/Makefile.in
-+++ b/help/Makefile.in
-@@ -521,8 +521,6 @@ uninstall-am:
-
- .PRECIOUS: Makefile
-
--@YELP_HELP_RULES@
--
- # Tell versions [3.59,3.63) of GNU make to not export all variables.
- # Otherwise a system limit (for SysV at least) may be exceeded.
- .NOEXPORT:
---
-1.9.1
-
