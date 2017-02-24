Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id E4FCB774D4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 23:10:02 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id r90so4683357qki.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 15:10:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LxzWnpCcXN1ukR4L69hxJBuflk+jKbDb++z2Nay5WbA=;
	b=F3EkLGuOH6/+XRCK+sXgN5ge6UdT6Hr40I4FaSPApr+KR0I+qO5Z//5POApqdrsRFt
	qaWHST2CqlikS4VB/tLUnF7FP+k/QIqgn3+yQTgtaz/XN79Vxgd/GVg3iLunL0kpvqRM
	6mDaRKRcfL9PNfHzbLY0YY5/E77LB0TQNvcwM9dX6YE/qvRFAfMZt8VKYUs4b5sxfpp3
	ePXyBMtIvoth3m64eWFwyfDZrThMciark+O/inlozV/UwkdqN9NC5NjWtZwZO+DALtq7
	M+HbvaVTyjNXhr0al5ViSRTTkufFeFVti29W7DUtnqvZrgKC+XkTKJHt9+RG11gt24jZ
	RWHA==
X-Gm-Message-State: AMke39l5MIrI9FTDx5Wrw0B3v5qf46nUWvum3QrdkJC3QVX/DpZENCeAN5drpn3ZY+zVqQ==
X-Received: by 10.55.192.153 with SMTP id v25mr5209971qkv.305.1487977804051;
	Fri, 24 Feb 2017 15:10:04 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	k62sm5723463qkd.21.2017.02.24.15.10.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Feb 2017 15:10:03 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2017 18:09:55 -0500
Message-Id: <1487977795-2611-3-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487977795-2611-1-git-send-email-derek@asterius.io>
References: <1487977795-2611-1-git-send-email-derek@asterius.io>
Subject: [meta-oe][PATCH 3/3] font-bh-100dpi: update depends to fix builds with RSS
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
X-List-Received-Date: Fri, 24 Feb 2017 23:10:03 -0000

Resolves build issue exposed by RSS
See http://errors.yoctoproject.org/Errors/Details/130624/

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb
index d32a47b..4976e52 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb
@@ -6,7 +6,7 @@ SECTION = "x11/font"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cffd5e9c4b61b3d74166ca74b99e460e"
 
-DEPENDS = "util-macros-native font-util-native bdftopcf-native"
+DEPENDS += "util-macros-native font-util-native bdftopcf-native font-util"
 RDEPENDS_${PN} = "encodings font-util"
 RDEPENDS_${PN}_class-native = "font-util-native"
 
@@ -16,5 +16,3 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI[md5sum] = "9f11ade089d689b9d59e0f47d26f39cd"
 SRC_URI[sha256sum] = "23c07162708e4b79eb33095c8bfa62c783717a9431254bbf44863734ea239481"
-
-PNBLACKLIST[font-bh-100dpi] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130624/"
-- 
2.7.4


