Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QjdvO-0003D0-An
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jul 2011 23:03:22 +0200
Received: by mail-fx0-f51.google.com with SMTP id 10so2387421fxh.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2011 13:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=oCP5fqqmx+mbT6WSnlsWTy2b0pQnmO0rBmU6GnC8CQk=;
	b=XwPXP0Ar7I25mtKMJz1Zcg+mng9hIfIvHyaubn/lwPipCRzutlGaQMHvlHKL2IgrYY
	6SmaGaDXvHL2BJfkRb8aEdlU+9eoTuVkXENmksZFNcc/yfNf0ztTeyhQFNOWM/TgUb+u
	xLLUsOw3bMR+XWZ5Fs3+Q2GgFbWkGQYsGiL2E=
Received: by 10.223.43.1 with SMTP id u1mr835283fae.38.1311195555649;
	Wed, 20 Jul 2011 13:59:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d6sm928682fak.34.2011.07.20.13.59.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jul 2011 13:59:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jul 2011 22:58:48 +0200
Message-Id: <447df9835c2d2e2144119b8a784c6042dc2b7e55.1311195484.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <ac2a5d6d9f55737cc5a6297303722d9188e37b33.1311195484.git.Martin.Jansa@gmail.com>
References: <ac2a5d6d9f55737cc5a6297303722d9188e37b33.1311195484.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1311195484.git.Martin.Jansa@gmail.com>
References: <cover.1311195484.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/5] tangogps: add misssing dependency bluez4
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
X-List-Received-Date: Wed, 20 Jul 2011 21:03:22 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-navigation/tangogps/tangogps_0.99.4.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-navigation/tangogps/tangogps_0.99.4.bb b/meta-oe/recipes-navigation/tangogps/tangogps_0.99.4.bb
index d583637..e04f0a5 100644
--- a/meta-oe/recipes-navigation/tangogps/tangogps_0.99.4.bb
+++ b/meta-oe/recipes-navigation/tangogps/tangogps_0.99.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://tangogps.org/"
 SECTION = "x11/applications"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-DEPENDS = "curl gtk+ gconf sqlite3 libexif libsoup-2.4"
+DEPENDS = "curl gtk+ gconf sqlite3 libexif libsoup-2.4 bluez4"
 
 SRC_URI = "http://www.tangogps.org/downloads/${P}.tar.gz"
 SRC_URI[md5sum] = "0f07ede94a21eb84f5e017fa88a1fc3d"
-- 
1.7.6



