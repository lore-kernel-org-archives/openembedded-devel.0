Return-Path: <SRS0=VQHR=5D=stusta.de=bunk@stusta.mhn.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id EA2B6605B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 19:18:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48jKZb5xjSz2J
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 20:18:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1584559111;
	bh=syvUh+oxlygzTQWhDEwOOkzt4drauFZG4n/OlOplMd0=;
	h=From:To:Subject:Date:From;
	b=sE9bech6ysPtm6HLXjR257JlWovM9uaUoP+3jG5E20Tgngz/w4YKH1monRQiEk6bM
	4cruwwbpo4WUF9ea22Zg3rR+GarWpHTXlGdHc6oPo6lL+xXWqylymoFDj71yt8vlNU
	xdLR3RK0OvxwmVTUjraUSHZjJfuLDJRZIc1VXDwL2wSZA0tQjXLe0xN9sFXZ/g0Y6p
	bp2GzUwXOp3W7H7oxPcAUcID8/YLJsBXPaGv0r4c/6eDQH9HQ3tP5lvv6gqekMrFCV
	Nz8GLsM5buYwTGGOYFDNEKDbCxeFBvvTpjjP0E9DhKejdmDIXUxZSPnr67WUlSiVut
	Cwy+mX2IkPKpqBt7AIG1+xE6D6w6DmSKFmQlPNFT13bUiOTrlgKA2+DAixbBYRzpwf
	29hYkbJk9p9owxR2ftBhBxQi5VA9Y16fiUsS3Ql894DUgFrOf7HSey7nrAuNw1+FcT
	hWK5rwTzYSckaJEJZlOD3Jz9hvZySlMscIIglh+BiDbTetcis3qKgxupG/TXHf0cup
	8Qy8+AokD2iGflm/ZzR+EwOH2kI5MjhPdgvCRZWXZoNFr14cZOm/MTfjW81+8ieeYf
	r+FIQvgkkMGmyXqswBE95ZKp+yefjtRTH83Rgaf1SZ1H4KdRGMWF1dZWkPlKANR8PM
	PRN+zDHhEN6zJ/8AjLqqRFQk=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Mar 2020 21:18:25 +0200
Message-Id: <20200318191825.18696-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] networkmanager: Upgrade 1.22.8 -> 1.22.10
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
X-List-Received-Date: Wed, 18 Mar 2020 19:18:32 -0000

Upgrade on the 1.22 stable branch.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../{networkmanager_1.22.8.bb => networkmanager_1.22.10.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.22.8.bb => networkmanager_1.22.10.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.8.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.10.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.8.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.10.bb
index 297f05618..33a2b7c0c 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.8.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.10.bb
@@ -33,8 +33,7 @@ SRC_URI_append_libc-musl = " \
     file://musl/0003-Fix-build-with-musl-for-n-dhcp4.patch \
     file://musl/0004-Fix-build-with-musl-systemd-specific.patch \
 "
-SRC_URI[md5sum] = "b512b4985fe3b7e0b37fdac7ab5b8284"
-SRC_URI[sha256sum] = "9511b92c72c6b5b4f063de9590ef6560696657bb6ba7d360676151742c7dab4f"
+SRC_URI[sha256sum] = "2b29ccc1531ba7ebba95a97f40c22b963838e8b6833745efe8e6fb71fd8fca77"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
-- 
2.17.1


