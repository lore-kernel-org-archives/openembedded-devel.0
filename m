Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6219B72FC4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 23:03:07 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u63so2950625wmu.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 15:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=K4RqE5B3TGyKip8X4f9n/0q3dANvsRE4bbhx5IPR+C8=;
	b=VzcIC2/812P09e8PbcNkqA5dhIgnrs0z+ilGluZEaeWLRGdzwOFV4iOWX31D+Tb8yh
	XIwJ1YxIWPWhmwZppiFvA2z2b54knE52bENigEaCjvujjJL2SVw+tv30VmVwJDuxJszn
	IYDJ6QvfElGq0/kz0k37aLcIACYPzChHDKEqnxz1/2akZVbRdPNxMWjwxyfeHd4bUwX3
	t82WUcfVwF9e1yrXgKuz0LFrNJCzZASzQM6MiHAvrUiTLzzZDrbbSEVHk+ITSvfxXwNd
	Fmj1Y5cyJooVWAmNdbEJJFpwwLl6r1E/yLsm5dajsjxl3DfU+ON+Ltt+GcucTyGR7Y9y
	7EDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=K4RqE5B3TGyKip8X4f9n/0q3dANvsRE4bbhx5IPR+C8=;
	b=Xzfl5Ks15n07h+uvXmk4/47Cv5qUH1NjwlqL+XdniAIjLAtBfXDiNfTkhW6kjBbUd2
	rikHsjpEpG+bCciumAm9ETeH6X1sawGa80HXSgy6pNAs/29KAA8YUu5xFwYXdgh070j1
	0iIe3hIsF259h+tVP6BmMC/0zwPkfEtSy6Jz+BgghltR0eRVzmhKESBpX3Xxrm2XLeWK
	YJzcz0K64tQgi4kYB6PkY6qnOdvIkmqzZhumgRm29tXkuceQFbr08XJHUIfgpdOVNlBn
	Mau5qaedyXsao0prKRQ/HSFJBtbQSeYt2SBLYqEQPNe+Wzg0UjH00bi/1cBlpbTXHT48
	aicw==
X-Gm-Message-State: AMke39mDleGhwsua78NovzmJS3ZC29sBB9EcuiCfRp2HWdHB240+K/oUdFYMZIoVXnyqkg==
X-Received: by 10.28.172.68 with SMTP id v65mr647315wme.49.1487804589024;
	Wed, 22 Feb 2017 15:03:09 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E912A1041E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e912:a104:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	q4sm3479696wrc.35.2017.02.22.15.03.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Feb 2017 15:03:08 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2017 00:02:45 +0100
Message-Id: <20170222230250.30288-7-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170222230250.30288-1-schnitzeltony@googlemail.com>
References: <20170222230250.30288-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 06/11] fontforge: add gettext to inherit and unblacklist
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
X-List-Received-Date: Wed, 22 Feb 2017 23:03:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
index 7d30312..75abd5c 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
 DEPENDS = "glib-2.0 pango giflib tiff libxml2 jpeg python libtool uthash gnulib"
 DEPENDS_append_class-target = " libxi"
 
-inherit autotools pkgconfig pythonnative distro_features_check
+inherit autotools pkgconfig pythonnative distro_features_check gettext
 
 REQUIRED_DISTRO_FEATURES_append_class-target = " x11"
 
@@ -58,5 +58,3 @@ RDEPENDS_${PN}-python = "python"
 
 # for e.g kde's oxygen-fonts
 BBCLASSEXTEND = "native"
-
-PNBLACKLIST[fontforge] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130639/"
-- 
2.9.3


