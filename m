Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 86EC46AB93
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 17:30:09 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id e49so3358682eek.34
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 10:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=kKSzBoA/emCAdKkBgCOn32WV6N0usb5Nu4FgOBqBLmo=;
	b=bej/fKgM5C4gjANHR4mmT5R2YrhX9dwJrXX9FMi1VOaqB3C/zkAHGDOg+4EiDnif/V
	ZnuO5ghiy6e6z+kFx4zGH9mfRtU6+O9L3tvz9ldNy+gVi9RHS2ClrzXAJaIEurl5ccSp
	UM404AKayA3h6zCqzPUOGSoWfpq0kL6RRCqyKzdEN01ioOPXtKlsHS5ctyjnpOUurZ6O
	FtgnR9u3YqJzt4UHz0x4jQmsIIP4URiALou9uT3fL/uKb3GaVdl2j4mGIYDfW82+/ntv
	7c6Rz2oJhffQ5kKvOMIJa/s4q1rV3l9LyaeazSvAXTonn+l5QtNciCgWPTZPrr6qP0wz
	pwZQ==
X-Received: by 10.14.209.5 with SMTP id r5mr3597479eeo.112.1371663010288;
	Wed, 19 Jun 2013 10:30:10 -0700 (PDT)
Received: from localhost.localdomain (p5B0A06AC.dip0.t-ipconnect.de.
	[91.10.6.172]) by mx.google.com with ESMTPSA id
	n42sm38290045eeh.15.2013.06.19.10.30.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 19 Jun 2013 10:30:09 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jun 2013 19:29:27 +0200
Message-Id: <1371662967-31734-21-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1371662967-31734-1-git-send-email-schnitzeltony@googlemail.com>
References: <1371662967-31734-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce/V2 20/20] xfce4-genmon-plugin: Allow timer period to be set at 250ms resolution
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
X-List-Received-Date: Wed, 19 Jun 2013 17:30:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...-period-to-be-set-at-250ms-resolution.-Pa.patch |   36 ++++++++++++++++++++
 .../genmon/xfce4-genmon-plugin_3.4.0.bb            |    2 +
 2 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-panel-plugins/genmon/files/0001-Allow-timer-period-to-be-set-at-250ms-resolution.-Pa.patch

diff --git a/meta-xfce/recipes-panel-plugins/genmon/files/0001-Allow-timer-period-to-be-set-at-250ms-resolution.-Pa.patch b/meta-xfce/recipes-panel-plugins/genmon/files/0001-Allow-timer-period-to-be-set-at-250ms-resolution.-Pa.patch
new file mode 100644
index 0000000..28c0eb1
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/genmon/files/0001-Allow-timer-period-to-be-set-at-250ms-resolution.-Pa.patch
@@ -0,0 +1,36 @@
+From 2d5fa307827a7b32af4f7b2ae0604f943e3a6e99 Mon Sep 17 00:00:00 2001
+From: John Lindgren <john.lindgren@aol.com>
+Date: Tue, 21 Aug 2012 19:33:45 -0400
+Subject: [PATCH] Allow timer period to be set at 250ms resolution.  Patch
+ from Miguel Guedes.  Closes: #9102.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Applied [1]
+
+[1] http://git.xfce.org/panel-plugins/xfce4-genmon-plugin/commit/?id=2d5fa307827a7b32af4f7b2ae0604f943e3a6e99
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ panel-plugin/config_gui.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/panel-plugin/config_gui.c b/panel-plugin/config_gui.c
+index a4c891d..90e55c1 100644
+--- a/panel-plugin/config_gui.c
++++ b/panel-plugin/config_gui.c
+@@ -106,8 +106,8 @@ int genmon_CreateConfigGUI (GtkWidget *vbox1,
+     gtk_widget_show (alignment1);
+     gtk_container_add (GTK_CONTAINER (eventbox1), alignment1);
+ 
+-    wSc_Period_adj = gtk_adjustment_new (15, 1, 60*60*24, 1, 1, 0);
+-    wSc_Period = gtk_spin_button_new (GTK_ADJUSTMENT (wSc_Period_adj), 1, 0);
++    wSc_Period_adj = gtk_adjustment_new (15, .25, 60*60*24, .25, 1, 0);
++    wSc_Period = gtk_spin_button_new (GTK_ADJUSTMENT (wSc_Period_adj), .25, 2);
+     gtk_widget_show (wSc_Period);
+     gtk_container_add (GTK_CONTAINER (alignment1), wSc_Period);
+     gtk_tooltips_set_tip (tooltips, wSc_Period,
+-- 
+1.7.6.5
+
diff --git a/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_3.4.0.bb b/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_3.4.0.bb
index e5ef85f..a13db62 100644
--- a/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_3.4.0.bb
+++ b/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_3.4.0.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=68ad62c64cc6c620126241fd429e68fe"
 
 inherit xfce-panel-plugin
 
+SRC_URI += "file://0001-Allow-timer-period-to-be-set-at-250ms-resolution.-Pa.patch"
+
 SRC_URI[md5sum] = "24108b339bb040ed360266f53a245224"
 SRC_URI[sha256sum] = "b0a5337b49c85623dc89f3c9e47c7374b1d466af2418033d2d6dfc57a9790387"
 
-- 
1.7.4.4


