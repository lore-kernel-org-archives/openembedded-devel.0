Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4507A770F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 23:44:22 +0000 (UTC)
Received: by wmeg8 with SMTP id g8so54570124wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 15:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=roHNG+wI+jaf38GMctyj2KRsDQbk218oCt41rGnSXjQ=;
	b=S0yzmuIEU5RSXxxHD8pN4/lQ0Uh+A5cg5j7io4oXzNZLxurqhDbs/sQTbz3HQ63h55
	X8dRaXicMvmqWO+cKEge8N5OjwM44Ijix+u6L9AZLrJFjAmMuGTJ0PbjoXpAKjpbB6Kq
	Su55NxJZJYg6eVFHFlV3Q5wdA/lJtmDeTbdDHh+CIk9ttMw8wzeaYEbFR+RIXbZ/pMW2
	H3wdMzym7sHsoZwOliVsJ1K4PlpFlh+i8+jzVyAiCbzx4umkzkvGg1u/jZnAJfBHItCi
	rTe8jwywAXGjNyhQgvp2/ejBIpZ3LyZNhDY9H3ewB2tCZ+I4a1zGrvhY8iI3eHxEnLNq
	RWtg==
X-Received: by 10.28.132.9 with SMTP id g9mr6964148wmd.0.1446680661655;
	Wed, 04 Nov 2015 15:44:21 -0800 (PST)
Received: from localhost.localdomain (p5B0A127D.dip0.t-ipconnect.de.
	[91.10.18.125]) by smtp.googlemail.com with ESMTPSA id
	184sm5390014wmk.10.2015.11.04.15.44.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Nov 2015 15:44:21 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Nov 2015 00:43:46 +0100
Message-Id: <1446680640-31722-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1446680640-31722-1-git-send-email-schnitzeltony@googlemail.com>
References: <1446680640-31722-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 04/18] gparted: update to 0.24.0
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
X-List-Received-Date: Wed, 04 Nov 2015 23:44:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Depending on gnome-doc-utils-native fixes (detected when building from scratch):

| gnome-doc-utils.make:63: error: HAVE_GNOME_DOC_UTILS does not appear in AM_CONDITIONAL
| help/Makefile.am:1:   'gnome-doc-utils.make' included from here
| gnome-doc-utils.make:133: error: ENABLE_SK does not appear in AM_CONDITIONAL
| help/Makefile.am:1:   'gnome-doc-utils.make' included from here
| gnome-doc-utils.make:182: error: ENABLE_SK does not appear in AM_CONDITIONAL
| help/Makefile.am:1:   'gnome-doc-utils.make' included from here
| ...
| autoreconf: automake failed with exit status: 1
| ERROR: autoreconf execution failed.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../gparted/{gparted_0.23.0.bb => gparted_0.24.0.bb}                | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-extended/gparted/{gparted_0.23.0.bb => gparted_0.24.0.bb} (70%)

diff --git a/meta-gnome/recipes-extended/gparted/gparted_0.23.0.bb b/meta-gnome/recipes-extended/gparted/gparted_0.24.0.bb
similarity index 70%
rename from meta-gnome/recipes-extended/gparted/gparted_0.23.0.bb
rename to meta-gnome/recipes-extended/gparted/gparted_0.24.0.bb
index 0705439..d77d1ed 100644
--- a/meta-gnome/recipes-extended/gparted/gparted_0.23.0.bb
+++ b/meta-gnome/recipes-extended/gparted/gparted_0.24.0.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 inherit autotools pkgconfig
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "5901dca33ced32213cccb13a2713dea8"
-SRC_URI[sha256sum] = "7fd1dddf29814c2982f55ab765b8918561e1b5dabf792012c66b4d3ba25da754"
+SRC_URI[md5sum] = "b8480274c68876acff5965d4346710e7"
+SRC_URI[sha256sum] = "02398ab33894a59b0bd8707e598c46d8bb56f1413cd54de48eed61e2920ecd60"
 
-DEPENDS = "glib-2.0 gtkmm parted"
+DEPENDS = "glib-2.0 gtkmm parted gnome-doc-utils-native"
 
 EXTRA_OECONF = "--disable-scrollkeeper --disable-doc"
 
-- 
2.1.0


