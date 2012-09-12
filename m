Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TBmpX-0004KN-JH
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Sep 2012 15:18:11 +0200
Received: by ggmq1 with SMTP id q1so382384ggm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2012 06:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=ihdUJ041QkdqHGHs0z7+S1qm9GzN+tmNUYZwhP9bJqQ=;
	b=sTJxXMXCPe23XX4zPgU+6zkjw66oRb+ip52/9MJMs0Q+vTtV/Q3E7np3DddDnI1FRO
	oe28T0DS3rdF9VzEJfNLFTrqTg65Ryms6kQr+z1QXffXBjqQLvdBTmOJVZ/G+eL9Xq4n
	/EytQmCGWpzGEDSSxXPPp/7EmsU0c0uUE7zT3HNeWc5Q4/1IFm/6e8HsAU69yim+6DSK
	uQXfUH8vgC6M1XsQXgG2x4tTDN+7t9Cj8QieqdaJ5ayWKvYRMdUCgnnB8iewUF83+V/O
	zpjv8dJdX8ot9YsfuWsX3nOKWnb6h4H1ON9dCDcuzohw38fXljmBYwvEtCExH6cP5PC0
	0uSg==
Received: by 10.101.6.24 with SMTP id j24mr6227196ani.5.1347455139164;
	Wed, 12 Sep 2012 06:05:39 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id t57sm35839595yhg.0.2012.09.12.06.05.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Sep 2012 06:05:37 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Sep 2012 10:05:28 -0300
Message-Id: <1347455128-14588-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][for-denzil][PATCH] libxaw: Fix libxaw-dev to not depends on non-existent libxaw package
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
X-List-Received-Date: Wed, 12 Sep 2012 13:18:11 -0000

The libxaw recipe generate a binary package for each soname of libxaw
(currently libxaw6-6 and libxaw-7-7) but no libxaw so libxaw-dev
cannot depends on it.

Reported-by: Daiane Angolini <daiane.angolini@freescale.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb
index 89338d9..88863a7 100644
--- a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb
+++ b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb
@@ -5,6 +5,7 @@ DEPENDS += "xproto virtual/libx11 libxext xextproto libxt libxmu libxpm libxp pr
 LIC_FILES_CHKSUM = "file://COPYING;md5=1c65719d42900bb81b83e8293c20a364"
 
 PE = "1"
+PR = "r1"
 
 SRC_URI[md5sum] = "f1ea52debce7a18cc26b21647a00ad8b"
 SRC_URI[sha256sum] = "2d96bcf92638b8ec5c91d379f5ec2e7b15133adeb2ba22066d48bf3239ee1bdd"
@@ -24,4 +25,7 @@ FILES_libxaw6 = "${libdir}/libXaw*.so.6*"
 FILES_libxaw7 = "${libdir}/libXaw*.so.7*"
 FILES_libxaw8 = "${libdir}/libXaw8.so.8*"
 
+# Avoid dependency on libxaw as it is not build
+RDEPENDS_${PN}-dev = ""
+
 XORG_PN = "libXaw"
-- 
1.7.2.5



