Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6C7857391E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 23:34:17 +0000 (UTC)
Received: by wetk59 with SMTP id k59so26881602wet.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 16:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=TXG3l2R+DiLgR+DcZshzFdzR3hhqz54tmQ9rLbFRDRQ=;
	b=KNs+AWOlY7O12cOXfguF0yPmrQhxEGP+XtLhXtmsPtoi0xbhDC1m6HsxlMcksi0Or7
	NVKny+GGfSKOw4u4iFXI4upkIGOq2VCZmRGTQ7T1t4kfp0lzkMY/+ZPJOEFCoV2AsubP
	44l+AyicqV9xQ5IOMOMzqkPU7R5k1i6In91JWkJMm3ht661/Vy3fGTUfd/nMXPDTjstR
	0NYpemyL5CV0vViFeevb7AcwmN4f8/IcOruNKcGHsELyH2TJ/2Bnr4CwAa8nSuD4HyHI
	9WMRLB3JVQkEqGZxyatJWy3XUSig0K6xqNnrR1/UgsQDHazXQ9EADYt5OKPZEFjJknBh
	4nLw==
X-Received: by 10.180.23.193 with SMTP id o1mr676037wif.14.1426462458887;
	Sun, 15 Mar 2015 16:34:18 -0700 (PDT)
Received: from localhost.localdomain (p54AA52CC.dip0.t-ipconnect.de.
	[84.170.82.204]) by mx.google.com with ESMTPSA id
	r14sm12804945wiv.13.2015.03.15.16.34.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Mar 2015 16:34:18 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2015 00:33:27 +0100
Message-Id: <1426462419-10173-19-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
References: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce 18/30] gtk-xfce-engine: update to 3.2.0
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
X-List-Received-Date: Sun, 15 Mar 2015 23:34:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

announcement for 3.2.0 [1] notes that gtk3 engine is not used in
Xfce 4.12 and is disabled by default. For users still wanting gtk3
part build, a PACKAGECONFIG was introduced.

[1] https://mail.xfce.org/pipermail/xfce/2015-February/034198.html

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{gtk-xfce-engine_3.0.1.bb => gtk-xfce-engine_3.2.0.bb}       | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-xfce/gtk-xfce-engine/{gtk-xfce-engine_3.0.1.bb => gtk-xfce-engine_3.2.0.bb} (72%)

diff --git a/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.0.1.bb b/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb
similarity index 72%
rename from meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.0.1.bb
rename to meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb
index d62208f..6feb4bc 100644
--- a/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.0.1.bb
+++ b/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb
@@ -2,12 +2,15 @@ SUMMARY = "XFCE theme for GTK"
 SECTION = "x11/libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-DEPENDS = "gtk+ gtk+3 xfce4-dev-tools-native"
+DEPENDS = "gtk+ xfce4-dev-tools-native"
 
 inherit xfce
 
-SRC_URI[md5sum] = "174e774d0debb052ec457640275f065d"
-SRC_URI[sha256sum] = "eb03cf81da1a91e426a2141c092ed7a1634cab29ea2f3546480e901290a7a06d"
+SRC_URI[md5sum] = "363d6c16a48a00e26d45c45c2e1fd739"
+SRC_URI[sha256sum] = "875c9c3bda96faf050a2224649cc42129ffb662c4de33add8c0fd1fb860b47ed"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[gtk3] = "--enable-gtk3,--disable-gtk3, gtk+3"
 
 PACKAGES += "${PN}-themes gtk3-xfce-engine"
 FILES_${PN} += "${libdir}/gtk-2.0/*/engines/*.so"
-- 
1.9.3


