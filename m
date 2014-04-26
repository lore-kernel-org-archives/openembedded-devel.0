Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f41.google.com (mail-pb0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id C093565D4D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 20:32:47 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id rr13so4422982pbb.28
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 13:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dzAEJ5fM2wuCIa/2PXNr82F2fw2uN2yPmbC9U1Gi08g=;
	b=iMl5HmhzO7bHUHUxR43R3u64A6TpIn6BYaJ8Da85b4ZhbKKmcy4M8RYzN+GoakX4a/
	YbmE8SodQE7+mviMG/wf48hRJkkzdx9wocFbnw+jTqYyrotfr/WKuM6TQMtb1t8yrHCS
	+tynCHYx+Pa56/mO68zzHHvXsX2bdFX7peGNS8tzHBVzNff3LGnLYVniUFrHHEq6Uxzi
	u1Xc6/U9olAD2aP+Ktq3ZXlsgy2FzQP7Cckwo2QvIqfhxbChaoe/xCrt1B7Gb4586ZED
	iTvsUf8Ag/WKiqhuKat7gdb13GyV6fFw3xwgXjua/HKuwgTNIZOKlLxYPXyG59E0zFr2
	t0rg==
X-Received: by 10.68.248.7 with SMTP id yi7mr16093343pbc.31.1398544368590;
	Sat, 26 Apr 2014 13:32:48 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	ci4sm24455471pbb.50.2014.04.26.13.32.47 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Apr 2014 13:32:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Apr 2014 13:34:33 -0700
Message-Id: <1398544484-27299-10-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
References: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 10/21] gnome-bluetooth: Fix build when S != B
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
X-List-Received-Date: Sat, 26 Apr 2014 20:32:49 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
index 8de03a4..94bfa3b 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
@@ -21,7 +21,7 @@ EXTRA_OECONF += "--enable-nautilus-sendto=no"
 
 # No native docbook XSL stylesheets recipe in OE yet
 do_configure_prepend() {
-    sed -i s/help// Makefile.am
+    sed -i s/help// ${S}/Makefile.am
 }
 
 do_configure_append() {
-- 
1.7.10.4


