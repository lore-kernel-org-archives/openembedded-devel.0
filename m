Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7F6D37468B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 13:32:24 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id c24so8069107wrc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=as+L/tdCXwH+9p729PW10K3kKr0CZRJ+XhSn8QOjyRc=;
	b=vCFgFiUmmyWwcEnFgWxFpROwj5YCXBCA4MTXue4t6kcNtjpaV53/E4Rwxrx5lTWvYO
	jSUKt6Oosfz9mJOo5fLiWmKjm/M8k6TZN8kziJrY7lCI6PQXMH5uP7nfxw5FKe5FfSLr
	ipIQ/LBu2NdcUC5iuL15WVjP9xTRCRsfA/S3djPdRRZyWws10t1PBUUEXCkxNhb99YhM
	AYGcTFoI5MF+GRHcamz5nR+1tir8gdvRcEVsfGvkeL9FXVxFnor3HPEzUrk+otSe7uhP
	WYDujRfJKt7l4kwsxbMU4kzSFowccnNHn3z3t5HFVVFUavsQqxSq0JckYZt6k3hKXCem
	QFIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=as+L/tdCXwH+9p729PW10K3kKr0CZRJ+XhSn8QOjyRc=;
	b=U8IES2IdGjJ45DsU7PLFK6WixzouQADS5eA0LmSCGoHP7xsG734/F5D2hO7k209lYK
	kNCOPvLBAJ3imXd+hPzybLQoaOQMLWjD7hJWODIWBmPHImeXMtX5IuNWfYMEmjra9Xov
	Nufw/bv0n+TtgYFvX/077kCSvzl3BYGlNgd9v5OvTutSF3y8GvDqvw+khsyzHxx0LtOu
	jUzsj+b5IVMnRvnjCeeSLAt/N0O++yge0vuSs9/9q76zxcSyLKW7e1Yg/ZI/L25F6u4V
	EKYrQfrMS71w7ef2j8k7nO0t9Ov/hcjqdpTpy/mvIAsLt1FSsOqvaEzQ5R/Nfg6n8vaa
	Zk8g==
X-Gm-Message-State: AElRT7FG3OIlsIBIjN7NlrDFfz9dpcd/GkTF3b9wuSnB4GGN0zIDGFh4
	EEwpj7vMyJ5VJdB5lHuuhYTf1A==
X-Google-Smtp-Source: AIpwx4/UpeTS97LmNz+HWD5F3h7CMIun+IAY2yzh0j85KwVpXByCwnCg79QyRrKbuTeB/hq37ZLkag==
X-Received: by 10.223.150.111 with SMTP id c44mr10157986wra.90.1522416745146; 
	Fri, 30 Mar 2018 06:32:25 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC180221E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:8022:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	93sm10468396wrh.46.2018.03.30.06.32.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Mar 2018 06:32:24 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Mar 2018 15:31:32 +0200
Message-Id: <20180330133151.25882-21-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180330133151.25882-1-schnitzeltony@gmail.com>
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 20/39] gnome-system-monitor: re-add 3.26.0
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
X-List-Received-Date: Fri, 30 Mar 2018 13:32:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

3.28.0 fails for glib-2.0 version:
| configure: error: Package requirements (glib-2.0 >= 2.55.0

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../files/0001-help-remove-YELP-macro.patch        | 28 +++++++++++++++++++
 .../gnome-system-monitor_3.26.0.bb                 | 32 ++++++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-system-monitor/files/0001-help-remove-YELP-macro.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.26.0.bb

diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/files/0001-help-remove-YELP-macro.patch b/meta-gnome/recipes-gnome/gnome-system-monitor/files/0001-help-remove-YELP-macro.patch
new file mode 100644
index 000000000..57b60a0d5
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/files/0001-help-remove-YELP-macro.patch
@@ -0,0 +1,28 @@
+From 4a3ee8b46d25b3d310448bfa4446e15a686fc685 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Fri, 23 Mar 2018 13:50:18 +0100
+Subject: [PATCH] help: remove YELP macro
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [embedded-specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ help/Makefile.am | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/help/Makefile.am b/help/Makefile.am
+index c5cd0d3..4b83adf 100644
+--- a/help/Makefile.am
++++ b/help/Makefile.am
+@@ -1,5 +1,3 @@
+-@YELP_HELP_RULES@
+-
+ HELP_ID = gnome-system-monitor
+ 
+ HELP_FILES = \
+-- 
+2.14.3
+
diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.26.0.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.26.0.bb
new file mode 100644
index 000000000..61af92b5d
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.26.0.bb
@@ -0,0 +1,32 @@
+SUMMARY = "Gnome system monitor"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+DEPENDS = " \
+    intltool-native \
+    gnome-common-native \
+    glib-2.0-native \
+    gtkmm3 \
+    libgtop \
+    librsvg \
+    libwnck3 \
+"
+
+inherit gnomebase
+
+SRC_URI[archive.md5sum] = "fcd59867c07f8c4853b1e28d60cbc037"
+SRC_URI[archive.sha256sum] = "f848a8c2ca5e164cf09d3a205dd49e4e4bf4b60d43b0969c10443eb519d0e6b3"
+SRC_URI += "file://0001-help-remove-YELP-macro.patch"
+
+RRECOMMENDS_${PN} = "adwaita-icon-theme"
+
+FILES_${PN} += " \
+    ${datadir}/icons \
+    ${datadir}/dbus-1 \
+    ${datadir}/gnome/autostart \
+"
+
+FILES_${PN}-doc += " \
+    ${datadir}/omf \
+    ${datadir}/gnome/help \
+"
-- 
2.14.3


