Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8DED9785B8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 12:35:35 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id p53so8708485wrc.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 05:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=as+L/tdCXwH+9p729PW10K3kKr0CZRJ+XhSn8QOjyRc=;
	b=JhWFkV3LEPxCUgnAndto15PmRQVsujI9jRX8Ztdaoqdh5BQuEXQ/u0s0EnF2EXLSqU
	UZQvw2cOA07IfiutSZ7VlDJzQ/ZYrSh4aQn0AvZlx255AnRxk6if85tOF7k3j/Bb6a3Z
	7Ry5bjndJlG/wJ7dXUUR+/s6s33x1p4eLgZnEvilq3O81Mq9bkUWsc5mHQW64nnxGJHr
	8gMVB7EOUIsaJTz0k9bXolPNfZOklzTTbUTTLOkhKp1Ma5KYD5E11i2E4K/vsx/XzPGa
	n9wXYx5AXze+qnnw52yW0B4qL5yfCsVqq5/Nkaru7hKU7nS+sIpxH4xzI8whkZ5fPHCq
	nf4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=as+L/tdCXwH+9p729PW10K3kKr0CZRJ+XhSn8QOjyRc=;
	b=HmRovgniXuM0r+9FWlRfJ1grP+avFIeEhvNW0negRKFs0PTudkEiMwuFmRX+mTp52k
	aco+YPXt1r7uPTrDYITYSOPXptjxBKE+kEhPlOsMuc+zWQfVX1bVvhtaks+6Rw26kivh
	w2/V6AubGnCzD4Z9CnOpc1wg+Y6iVs5kMakEuBm+vdnGsOyqFgndC7U5HHKKAZ8NyMJd
	IzwKRG7LW23b7aXZKHFIKyht0hHOMyCKfh3gaRK7EZs+W8MaVKRlcRICq5lJt0vkBYCy
	PRbNhH63fMardm5V+pR1RBg8ZdCqB//0Oh3U1thPBUm1POhUcSyUY0DGBNiorcRVP6E5
	2S1g==
X-Gm-Message-State: AElRT7HEmlII+a70KTXDqOdAOKmzxInC7yVAMPfwYzXud9SjAKl1Gj8E
	1lSqvyWgldIl6F2KODqPlT2vUQ==
X-Google-Smtp-Source: AG47ELtdI2Xx0WxeFF2OMo8EOATmq5TV0XDcPiKMYHnC1uXdUp3c2yQ0xFuPYRyT21oe321T3tweqw==
X-Received: by 10.223.160.195 with SMTP id n3mr29437054wrn.92.1521981335924;
	Sun, 25 Mar 2018 05:35:35 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BCB3D681E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bcb:3d68:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	v23sm11174719wmh.30.2018.03.25.05.35.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 25 Mar 2018 05:35:35 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Mar 2018 14:35:04 +0200
Message-Id: <20180325123520.16452-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180325123520.16452-1-schnitzeltony@gmail.com>
References: <20180325123520.16452-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 04/20] gnome-system-monitor: re-add 3.26.0
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
X-List-Received-Date: Sun, 25 Mar 2018 12:35:36 -0000
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


