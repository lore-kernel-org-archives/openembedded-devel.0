Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQlXP-0007YZ-8r
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 May 2011 21:20:35 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so2510774fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2011 12:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=ofyXfAU9oDiAE5H+12wQt6MO19zej20VMYTrX2NINQA=;
	b=r4wwmG/JE3xofZiE7tMVoPnRc9UxOexZuDubuY/djcslH09Keh5sc91wJMu2tlRAsu
	HU6GUtH46W/SpS0N/5KWX7zo23CqZ5fn1Chs+wMzB+yjzgwswJualXPLg55dM5yYYkX2
	1MI0FriOyB00oG3z+mJwhOeUqFH9tcUrLNMO0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=P1P6JoJSEB5No5MFykqPxNJZzhFjEVmTSmI7od4GQCau5qHSRmEje1JHLiFD27C5ie
	vyFIJrqG9YG6gwFu8srAWPm65uUmj6WcOrbYyWGekhzCLrLKK/ll7nucNVKR2/R46Cky
	v/vJnuEsmREiPjfBc945Ql82uqkZZYLNq8asI=
Received: by 10.223.149.70 with SMTP id s6mr2140023fav.66.1306696650234;
	Sun, 29 May 2011 12:17:30 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id b25sm496722fab.28.2011.05.29.12.17.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 May 2011 12:17:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 May 2011 21:17:11 +0200
Message-Id: <e6bbc59f3f64c410233cb840174a8972d4ac1664.1306696348.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <cover.1306696348.git.Martin.Jansa@gmail.com>
References: <cover.1306696348.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 01/16] farsight2: fix LICENSE and add LIC_FILES_CHKSUM
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 29 May 2011 19:20:35 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-support/farsight/farsight2_0.0.22.bb   |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb b/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
index 1eb25aa..0f158ca 100644
--- a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
+++ b/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
@@ -1,7 +1,9 @@
 DESCRIPTION = "FarSight is an audio/video conferencing framework specifically designed for Instant Messengers."
 HOMEPAGE = "http://farsight.sf.net"
 SRC_URI = "http://farsight.freedesktop.org/releases/farsight2/${P}.tar.gz"
-LICENSE = "unknown"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 DEPENDS = "libnice glib-2.0 libxml2 zlib dbus gstreamer gst-plugins-base"
 
-- 
1.7.5.rc3



