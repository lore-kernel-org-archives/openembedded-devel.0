Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id BE2407036A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 17:00:12 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id w62so6488590wes.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 10:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=6f1XOg0V4iHulUMrvAVEpJ8jEDOuh/oNP990P+cGsVw=;
	b=OiX9gPDzpQHhyFY71bLD1aXKB6L4tuOxagYaLIZsfyYs3UUH0rA07517CKZQ6ArrJr
	Vra88i0OFy9Mwm8hfSHhg6ofdPh9gEx7uEt0CUH9sb/bfmj06uSaTbMSDTUkQ53ZLM0c
	53AJTZa4v6CxoMSOB7XC16+4tl+ihNRvJxFi9ItShfj5t9B+T0tbSc18Wsv0+sRDLImi
	eKwXbWFjFviDUvzvRh1v/1H1ksolgZEXkvaDdidQSISZlzExjxgoHLgrBYjWOYeD0p3f
	l77siiTIQGagCDtPODF7NZuL7rggiLDfTS/3uW+QHyfvhowoxwXCu6mqu4KoZB+vUhCW
	mEDQ==
X-Received: by 10.180.36.18 with SMTP id m18mr25492448wij.74.1405875613835;
	Sun, 20 Jul 2014 10:00:13 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	au7sm30942570wjc.41.2014.07.20.10.00.12 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Jul 2014 10:00:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Jul 2014 19:00:23 +0200
Message-Id: <1405875626-8011-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [meta-oe][WIP][PATCH 1/4] libebml: upgrade to 1.3.0 required by mkvtoolnix
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
X-List-Received-Date: Sun, 20 Jul 2014 17:00:15 -0000

* otherwise mkvtoolnix tries to use it's own internal git submodule with libebml
  and fails when B!=S

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-mkv/libebml/{libebml_1.2.2.bb => libebml_1.3.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-mkv/libebml/{libebml_1.2.2.bb => libebml_1.3.0.bb} (84%)

diff --git a/meta-multimedia/recipes-mkv/libebml/libebml_1.2.2.bb b/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
similarity index 84%
rename from meta-multimedia/recipes-mkv/libebml/libebml_1.2.2.bb
rename to meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
index eafbdb3..877e176 100644
--- a/meta-multimedia/recipes-mkv/libebml/libebml_1.2.2.bb
+++ b/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
@@ -3,8 +3,8 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=f14599a2f089f6ff8c97e2baa4e3d575"
 
 SRC_URI = "http://dl.matroska.org/downloads/libebml/libebml-${PV}.tar.bz2"
-SRC_URI[md5sum] = "726cc2bd1a525929ff35ff9854c0ebab"
-SRC_URI[sha256sum] = "476b08c6436a96c024a53e788e7c945ce9b41cd8654165763444aa7e5245b7a5"
+SRC_URI[md5sum] = "efec729bf5a51e649e1d9d1f61c0ae7a"
+SRC_URI[sha256sum] = "83b074d6b62715aa0080406ea84d33df2e44b5d874096640233a4db49b8096de"
 
 do_compile() {
     cd ${S}/make/linux
-- 
2.0.0


