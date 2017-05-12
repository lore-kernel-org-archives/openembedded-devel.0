Return-Path: <sbabic@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 8062071AB9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 May 2017 16:17:22 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3wPZr31yV7z1qrsx;
	Fri, 12 May 2017 18:17:23 +0200 (CEST)
Received: from localhost (dynscan01.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3wPZr31cFZz3jgYJ;
	Fri, 12 May 2017 18:17:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan01.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id S0GgFkGXR3fr; Fri, 12 May 2017 18:17:22 +0200 (CEST)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net
	[88.217.136.221]) by mail.mnet-online.de (Postfix) with ESMTP;
	Fri, 12 May 2017 18:17:22 +0200 (CEST)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id C722F45406B4;
	Fri, 12 May 2017 18:17:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([127.0.0.1])
	by localhost (mail.babic.homelinux.org [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id nD-glslvhzg7; Fri, 12 May 2017 18:17:18 +0200 (CEST)
Received: from papero.fritz.box (papero.fritz.box [192.168.178.132])
	by babic.homelinux.org (Postfix) with ESMTP id C1C7C4540399;
	Fri, 12 May 2017 18:17:18 +0200 (CEST)
From: Stefano Babic <sbabic@denx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 May 2017 18:17:10 +0200
Message-Id: <1494605830-18765-1-git-send-email-sbabic@denx.de>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] Fix broken package fbida
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
X-List-Received-Date: Fri, 12 May 2017 16:17:25 -0000

Missing pkgconfig does not let build the package.

Signed-off-by: Stefano Babic <sbabic@denx.de>
---

Tested on current master, i.MX6 ARM target

 meta-oe/recipes-graphics/fbida/fbida_2.10.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/fbida/fbida_2.10.bb b/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
index eb31f7b..1febac8 100644
--- a/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
+++ b/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
@@ -18,6 +18,8 @@ SRC_URI[sha256sum] = "7a5a3aac61b40a6a2bbf716d270a46e2f8e8d5c97e314e927d41398a4d
 
 B = "${WORKDIR}/build"
 
+inherit pkgconfig
+
 EXTRA_OEMAKE = "STRIP= 'srcdir=${S}' -f ${S}/GNUmakefile"
 
 PACKAGECONFIG ??= "gif png curl"
@@ -66,5 +68,3 @@ do_install() {
 }
 
 RDEPENDS_${PN} = "ttf-dejavu-sans-mono bash"
-
-PNBLACKLIST[fbida] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130677/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-- 
2.7.4


