Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2556E6AC33
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 23:34:00 +0000 (UTC)
Received: by webcq43 with SMTP id cq43so26859767web.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 16:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=gjWN30sN+n2IAmXdxUjXt7MSweiMaxR6i05dUK58oT4=;
	b=V4rS3iwOUvyK1yg6sQK1V6GHCGQTqHykvVSFxiKStbWU6TPJYvVGITCl+ZmdSTUN7I
	8W+9ZN/5Xp6qdriKVS2Pn8jVEgcI01l+CdEYmjuIL7T6anz2lxbbD8Rn9BEIsVty7Dji
	uWC1z+9lePrux6MON+/eaU8UUwP8GC2Yz5ckx6lBdHe714j0XIGHtYcwY5d1RLd0nIGb
	6qelD/pOZ2WHUMub1t6QvEbNJCbhV45XkQPbjd1foJ3juBBICybavNOV6jvuFddEclPU
	XEDMaU8U/zsHyT2FltQzVvLzABF6x8GecUiiLgyASqefnF800OzZSdfkyHyLQXM9OoX7
	dDBQ==
X-Received: by 10.180.8.10 with SMTP id n10mr114427352wia.79.1426462441717;
	Sun, 15 Mar 2015 16:34:01 -0700 (PDT)
Received: from localhost.localdomain (p54AA52CC.dip0.t-ipconnect.de.
	[84.170.82.204]) by mx.google.com with ESMTPSA id
	r14sm12804945wiv.13.2015.03.15.16.34.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Mar 2015 16:34:00 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2015 00:33:15 +0100
Message-Id: <1426462419-10173-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
References: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce 06/30] garcon: update to 0.4.0
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
X-List-Received-Date: Sun, 15 Mar 2015 23:34:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/garcon/{garcon_0.2.1.bb => garcon_0.4.0.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-xfce/recipes-xfce/garcon/{garcon_0.2.1.bb => garcon_0.4.0.bb} (57%)

diff --git a/meta-xfce/recipes-xfce/garcon/garcon_0.2.1.bb b/meta-xfce/recipes-xfce/garcon/garcon_0.4.0.bb
similarity index 57%
rename from meta-xfce/recipes-xfce/garcon/garcon_0.2.1.bb
rename to meta-xfce/recipes-xfce/garcon/garcon_0.4.0.bb
index 44ae51f..81f6ce1 100644
--- a/meta-xfce/recipes-xfce/garcon/garcon_0.2.1.bb
+++ b/meta-xfce/recipes-xfce/garcon/garcon_0.4.0.bb
@@ -2,13 +2,12 @@ DESCRIPTION="Xfce Menu Library"
 SECTION = "x11/libs"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=04a01abcbdabffae1ca26335a293276b"
-DEPENDS = "glib-2.0 xfce4-dev-tools-native libxfce4util intltool-native"
-PR = "r1"
+DEPENDS = "xfce4-dev-tools-native libxfce4util libxfce4ui intltool-native"
 
 inherit xfce gtk-doc
 
 SRC_URI += "file://0001-xfce-applications.menu-don-t-bloat-settings-menu-by-.patch"
-SRC_URI[md5sum] = "c3cf89c836be0ddb281c81e4808fb68b"
-SRC_URI[sha256sum] = "48b644b8b2ffe597974e2526ca1a5d2d7da6a09c2d434f008dec80e9152701f7"
+SRC_URI[md5sum] = "aba62b80787aac295083bf7afd419ffb"
+SRC_URI[sha256sum] = "787dc859713b6518992d760d4b858fb02e8a30705e6f6e871d7a14cc97bca972"
 
 FILES_${PN} += "${datadir}/desktop-directories"
-- 
1.9.3


