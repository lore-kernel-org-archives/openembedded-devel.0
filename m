Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 890777707F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 23:44:19 +0000 (UTC)
Received: by wmeg8 with SMTP id g8so254922wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 15:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=RmWG9BamULNBaudeDZEk/DhRKrMqqkHnAcDzXfDQ6ds=;
	b=HDhjbd4bsVBXk9FD8Ukq+XPuDxkAsXP+A3TjLnOhSVFuwb/JIMrkDWmrIWluulhQfX
	fukCXhnMtLNXbyshHOOO2+WQck7z+vgTLTMftwDroV5gCjTCxhe9t3r3LvXbL/P2ImFB
	TmGrRx+OQga8RV0a3h/guKirX45ZnxkNVu5sn6saXvEL6xzN9f1u178GMW5gV5SM8tW1
	4D7W7NM3BkIIAYKiIOlYRgZc10pzdFsID8Zju/173ae1ZQbbxdT4vrO5liRI2otcH4Ls
	BlVAyPHbSho0Jsr82HN6E6fCoysoMMjo/5wA0sTlZFEu0jRf4PJDiM20fhhDH9mpgpeJ
	ZNOg==
X-Received: by 10.28.88.203 with SMTP id m194mr6216349wmb.68.1446680659087;
	Wed, 04 Nov 2015 15:44:19 -0800 (PST)
Received: from localhost.localdomain (p5B0A127D.dip0.t-ipconnect.de.
	[91.10.18.125]) by smtp.googlemail.com with ESMTPSA id
	184sm5390014wmk.10.2015.11.04.15.44.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Nov 2015 15:44:18 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Nov 2015 00:43:43 +0100
Message-Id: <1446680640-31722-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1446680640-31722-1-git-send-email-schnitzeltony@googlemail.com>
References: <1446680640-31722-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 01/18] xfce4-vala: unbreak by telling configure vala API version
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
X-List-Received-Date: Wed, 04 Nov 2015 23:44:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
index 7bcffe5..c1900e9 100644
--- a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
+++ b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
@@ -5,12 +5,12 @@ DEPENDS = "libxfce4util garcon xfconf libxfce4ui xfce4-panel exo vala xfce4-dev-
 
 inherit xfce
 
-PNBLACKLIST[xfce4-vala] ?= "Fails to build since vala upgrade to 0.26.1"
-
 SRC_URI = "http://archive.xfce.org/src/bindings/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "0bbb1d6e473e0fe9b335b7b1b49d8a71"
 SRC_URI[sha256sum] = "07a8f2b7c09fcdd3d86e0c52adea3c58ca011d0142a93997a01b4af77260ae7b"
 
+EXTRA_OECONF = "-with-vala-api=0.28"
+
 FILES_${PN} += "${datadir}/vala-*/vapi"
 
 RDEPENDS_${PN} = "vala"
-- 
2.1.0


