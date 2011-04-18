Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QBlo9-0007Fd-Rk
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Apr 2011 12:35:53 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so3317697fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2011 03:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=6PhIExG5SldOBHwmtRDuaWIqiv7FbFZkjEjXbDnIDks=;
	b=QizZ6HaP2dJvLN1AFUI9p0uTmGgHUrjqyQaUBNxhqlhjTN+7mYYw0o12sWghCAK0kK
	MPgATvh6PQR06UkQaTEdmg3/98Vq5TB0vMiYTV1VK3dnUJ3MxquMC9I+IZDBcjKzz/FB
	h4U2PtzbXDokm1kdkAP1vSyxiX9tCVn7J/lnQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=YwLQLq1W67dEfKFtafgUFndKLyVjxeBteqkGDtpC1byntqySyds3fH/aFRmhy/F8nH
	DGONNobT23jdzUL49uaCjljFUoEIGUQvIP1nBXWus10OD3p40YkPIupiOphzIt+atqV1
	QAEjHMS7hhSGy7KQ81KsiaorrNak1hOTecyLQ=
Received: by 10.223.25.197 with SMTP id a5mr4822486fac.29.1303122813625;
	Mon, 18 Apr 2011 03:33:33 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id j18sm1623808faa.18.2011.04.18.03.33.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Apr 2011 03:33:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Apr 2011 12:33:27 +0200
Message-Id: <d68b6681ccbc9eb5b505d3c9fc4125a9cddc3fae.1303122650.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc1
In-Reply-To: <cover.1303122650.git.Martin.Jansa@gmail.com>
References: <cover.1303122650.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 06/13] libxrender: it was upgraded in oe-core, keep only .bbappend with BBCLASSEXTEND
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
X-List-Received-Date: Mon, 18 Apr 2011 10:35:54 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-graphics/xorg-lib/libxrender_0.9.6.bb  |   17 -----------------
 .../xorg-lib/libxrender_0.9.6.bbappend             |    1 +
 2 files changed, 1 insertions(+), 17 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/libxrender_0.9.6.bb
 create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend

diff --git a/meta-oe/recipes-graphics/xorg-lib/libxrender_0.9.6.bb b/meta-oe/recipes-graphics/xorg-lib/libxrender_0.9.6.bb
deleted file mode 100644
index c1bb045..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/libxrender_0.9.6.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "X11 Rendering Extension client library"
-
-require xorg-lib-common.inc
-
-LICENSE = "MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0db75cc842842b36f097fdae571b4b70"
-
-DEPENDS += "virtual/libx11 renderproto xproto xdmcp"
-
-PR = "r0"
-PE = "1"
-
-XORG_PN = "libXrender"
-
-
-SRC_URI[md5sum] = "3b3b7d076c2384b6c600c0b5f4ba971f"
-SRC_URI[sha256sum] = "7f58b1e263109e0a873eef8423aa14733a5499befbe645053aa622ed1f3ea668"
diff --git a/meta-oe/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend b/meta-oe/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend
new file mode 100644
index 0000000..608377e
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend
@@ -0,0 +1 @@
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.5.rc1



