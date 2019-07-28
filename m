Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 520A27F211
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Jul 2019 10:52:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45xKQh62cRz4M
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Jul 2019 12:52:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1564311149;
	bh=rfxH6EgXnNOVrVh0NCYtPrREtYdKRTcAzF+UI1NZ8uU=;
	h=From:To:Subject:Date:From;
	b=B+ruqhwcptNVEtTRgzriDT7xizUNFAHiRO3kacAKOHV/zQswC+o7q0i5xt7ZzGn7W
	kVQTFIa7I1HsgGajo+JRfJ6oDN8oPHIn7nshA78rKeOpBUCUzYSPG6X0RcP5VXAThc
	Kxhbna1lk1zXUX3vArJpsoyxgLXHz+0XJXLz5ngI95b4oiSlLr7GwPldNfMykF0eCu
	tess9q4HVXfM67RKZ5JaD3J3AV1VxYrNjpdu28mkHyfDVkfrhhMvGFU4NN4DUBz6gj
	goACAeI3QVh6I3wh/bjRGLWITgmuvIlyMlkjhbSpZhpEpIiQ2Hb9+m/+FS9jVzzkm6
	CRD+3Vy3WmyTrZVOo+Z8G//7f2SGjLMXFVgST3gWv00R+8U5s8/rGRzx5lbI2M2jqb
	8F92fWJFA47M/7iIt4z9cEGsPN+exkdzGRl4B7FSTHdWlx9X6hEmZhPOu2r/1c/sMp
	GQUpY6nGfX+7BtOcyDh8q8FiD2k9DjS8/c9y9kTJjcEjYVMwPStFlvsBBj1cglH1HL
	Ydg75UTLEaqpr7J2tH+n4Zl8EYVm7TCNz+JTKgOduTopWN8ijwTdB8vuOptesRfLNp
	Mw8xDBddQxHVpDd+PRkMsZbL6YHDzL777KQhsGU9/pPMrYV3VF0C/Gtfaf2FLRWTuj
	dvZIkvBnvFnuVg6hfJ2wj3y0=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 28 Jul 2019 13:52:20 +0300
Message-Id: <20190728105220.20595-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-gnome][PATCH] gnome-system-monitor: Add DEPENDS on polkit
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
X-List-Received-Date: Sun, 28 Jul 2019 10:52:28 -0000

The build fails without polkit in DISTRO_FEATURES:
FAILED: org.gnome.gnome-system-monitor.policy
msgfmt: cannot locate ITS rules for org.gnome.gnome-system-monitor.policy.in

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../gnome-system-monitor/gnome-system-monitor_3.32.0.bb          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.0.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.0.bb
index 701b0891c..8d39101e9 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.0.bb
@@ -10,6 +10,7 @@ DEPENDS = " \
     gtkmm3 \
     libgtop \
     librsvg \
+    polkit \
 "
 
 GNOMEBASEBUILDCLASS = "meson"
-- 
2.17.1


