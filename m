Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1AE5865CFA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 20:32:39 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id r10so4325129pdi.30
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 13:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pFrRHLVS0AJIchPIlPEdE4+MV2I1lXRa+lQ9iRuLOmg=;
	b=XoAjwlugwddfPlXnh6XJDbCEU1EGBxk/v2CjuqRaJJwUIVYC7eeYlc2vLccR0KkJMg
	31BDm/+94hGfwEqasatekqeORRbjPZPzX/pY52Rpyu2+KLlxF+igSnHPfJNsUA9eehtR
	lcqyAuoX8BmGIBs0ueOunDgvyMZueVRZmCKn+Zn6CedvjYFInSVTJzZ9CS9tWVLY0+CU
	RP3rt1oKzPOE+Cxy7qHYsXyhVYLx4wNNosLil20z9uh/qBy9KuL+gEblcm/3nvujhHCr
	j3uu6uZdHeBMuklgPYx9Ymg5HBO4dPkM8u+deyArRc4uR9ohOIWzQWKVb1wDNAzcHxBm
	/KpQ==
X-Received: by 10.67.13.134 with SMTP id ey6mr15802340pad.44.1398544360976;
	Sat, 26 Apr 2014 13:32:40 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	ci4sm24455471pbb.50.2014.04.26.13.32.40 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Apr 2014 13:32:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Apr 2014 13:34:25 -0700
Message-Id: <1398544484-27299-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
References: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 02/21] libxklavier: Update to 5.3 and fix build S != B
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
X-List-Received-Date: Sat, 26 Apr 2014 20:32:41 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libxklavier/{libxklavier_5.0.bb => libxklavier_5.3.bb}  |   11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)
 rename meta-gnome/recipes-gnome/libxklavier/{libxklavier_5.0.bb => libxklavier_5.3.bb} (55%)

diff --git a/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.0.bb b/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.3.bb
similarity index 55%
rename from meta-gnome/recipes-gnome/libxklavier/libxklavier_5.0.bb
rename to meta-gnome/recipes-gnome/libxklavier/libxklavier_5.3.bb
index 4c5be1d..3eff298 100644
--- a/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.0.bb
+++ b/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.3.bb
@@ -4,16 +4,17 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6e29c688d912da12b66b73e32b03d812"
 
 DEPENDS = "xkbcomp gtk+ iso-codes libxi"
 
-inherit gnome
+GNOME_COMPRESS_TYPE = "xz"
 
-SRC_URI[archive.md5sum] = "134c7ea177ff901123b909de77394780"
-SRC_URI[archive.sha256sum] = "dfd94b17a752b2839281764f0a16af2b338024c8867c10fba7015f276dec4db0"
+inherit gnomebase gettext
+SRC_URI[archive.md5sum] = "290ea2a8abc40f78a3a16bdae6f02808"
+SRC_URI[archive.sha256sum] = "ebec3bc54b5652838502b96223152fb1cd8fcb14ace5cb02d718fc3276bbd404"
 
 EXTRA_OECONF = "--with-xkb-bin-base=${bindir}"
 
 do_configure_append() {
-    find ${S} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
-    find ${S} -name Makefile | xargs sed -i s:'-I/usr/include':'-I${STAGING_INCDIR}':g
+    find ${B} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
+    find ${B} -name Makefile | xargs sed -i s:'-I/usr/include':'-I${STAGING_INCDIR}':g
 }
 
 do_compile_append() {
-- 
1.7.10.4


