Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7CE036057B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Nov 2015 20:09:22 +0000 (UTC)
Received: by wmww144 with SMTP id w144so194430834wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Nov 2015 12:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=VqqStreojSgZGCBL392yQdpJFeKlgbawBA3jSXgXTbY=;
	b=aa2GqDBrPLyQ+iXzft5oMG25ndz8L2K+3+KujWRbfSr1mDjRXD6DerU/P0G5ZpjVC/
	kt9RHJeQ9A+wy/cleepbqScgb6SdUe+YeWcfn5MGe5QwOvOnsfSm5re9t8UdI/hpaEOz
	bTVJ5hDe/ZKqa300KQWTqqTcZlKU61kvFbs7lY/VNtOUcRkKO0603optNkonwwg0h1Hc
	yP+AxmzeuxRI0Xs5d5ENScegoAbAG/lUgpSD8l38ETHcEp9EoMdCvEmWjOa7Srui8y5E
	q8Fjjyb4Z+AXwWw8EFlRR7f0tVg5P9+el/v+SYucclZxUZD41RbeSfap6tXjem2tICYk
	r0nw==
X-Received: by 10.28.57.215 with SMTP id g206mr6884602wma.82.1448482161815;
	Wed, 25 Nov 2015 12:09:21 -0800 (PST)
Received: from localhost.localdomain (p4FDF097E.dip0.t-ipconnect.de.
	[79.223.9.126]) by smtp.googlemail.com with ESMTPSA id
	cl5sm24647164wjc.29.2015.11.25.12.09.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Nov 2015 12:09:21 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Nov 2015 21:09:07 +0100
Message-Id: <1448482147-28052-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH] faenza-icon-theme: fix host-user-contamination
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
X-List-Received-Date: Wed, 25 Nov 2015 20:09:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb b/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb
index dbaae64..a39b1a0 100644
--- a/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb
+++ b/meta-gnome/recipes-gnome/faenza-icon-theme/faenza-icon-theme_1.3.bb
@@ -20,6 +20,7 @@ do_install() {
     tar -xf emesene-faenza-theme.tar.gz -C ${D}${datadir}
     mv -f ${D}${datadir}/emesene/themes ${D}${datadir}/themes
     rm -rf ${D}${datadir}/emesene
+    chown -R root:root ${D}${datadir}
 }
 
 FILES_${PN} += "${datadir}/icons ${datadir}/themes"
-- 
2.1.0


