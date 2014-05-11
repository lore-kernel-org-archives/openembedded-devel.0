Return-Path: <martin.jansa@gmail.com>
Received: from mail-ve0-f177.google.com (unknown [209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6BDE06059B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 May 2014 14:50:40 +0000 (UTC)
Received: by mail-ve0-f177.google.com with SMTP id db11so7440773veb.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 May 2014 07:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=KACZKbof95fGWwSCWho0fnYUt/VGR3h4mklsDt4VmTk=;
	b=RxNRP7om4x62plzFGi7/wXvfZBcHuFedQ8gLLmwKiImFG+xZ7GsoSwiMJIYuD/w578
	CffJI7Mw3pYSakd9U0ETWUwBa42Eo5OYrDrJtcaNI3JBRYwu+ZY6ZDbs3/k5y+Yt26Dn
	YZbdB7LQs7jfchIsvE9kgOWw1Dpmumla9EvlOUI8uJ2hg+F40fM65K/AKK2Tf5L3UDwi
	hguUm1852yItqbL8GWKFGhG69MzABlUWV02AhMHO4m1TQa8/NZoWgkrOyRzApYKJV4Qs
	+bLj+AiYwVcm89xO6Qls0RgveQgUpaCS2cD5Lzf/rhIbWD7J9uscvyT3INXE6MzrV9NB
	isMA==
X-Received: by 10.220.179.197 with SMTP id br5mr16987vcb.80.1399819372904;
	Sun, 11 May 2014 07:42:52 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u3sm11069767ves.12.2014.05.11.07.42.51 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 11 May 2014 07:42:51 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 May 2014 16:43:13 +0200
Message-Id: <1399819395-2128-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.2
Subject: [meta-oe][WIP][PATCH 1/3] maliit-framework: add dependency on dbus, gtk+ and gtk+3 for deterministic builds
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
X-List-Received-Date: Sun, 11 May 2014 14:50:41 -0000

* otherwise maliit-framework-gtk is empty
* fixes following issues from test-dependencies report:
  maliit-framework/maliit-framework-gtk/latest lost dependency on  eglibc glib-2.0 gtk+ gtk+3 libgcc libqtcore4 maliit-framework pango

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/maliit/maliit-framework_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/maliit/maliit-framework_git.bb b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
index f98512d..8d62e3d 100644
--- a/meta-oe/recipes-support/maliit/maliit-framework_git.bb
+++ b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=5c917f6ce94ceb8d8d5e16e2fca5b9ad"
 
 inherit autotools-brokensep qt4x11 gtk-immodules-cache
 
-DEPENDS = "libxcomposite"
+DEPENDS = "libxcomposite dbus gtk+3 gtk+"
 
 SRC_URI = "git://github.com/maliit/framework.git;branch=master \
     file://0001-Fix-MALIIT_INSTALL_PRF-to-allow-the-build-with-opene.patch \
-- 
1.9.2


