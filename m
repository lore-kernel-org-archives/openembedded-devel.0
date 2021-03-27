Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.3470.1616827110297947394
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Mar 2021 23:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B005840C2A
	for <openembedded-devel@lists.openembedded.org>; Sat, 27 Mar 2021 06:38:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YlIG78Jb3xWu
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Mar 2021 06:38:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9EC7640AB7
	for <openembedded-devel@lists.openembedded.org>; Sat, 27 Mar 2021 06:38:29 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 0B025174567;
	Sat, 27 Mar 2021 02:38:29 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH] glmark2: also depend on wayland-protocols when wayland distro feature is on
Date: Sat, 27 Mar 2021 02:38:26 -0400
Message-Id: <1616827106-46046-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

Fixes this:
| Checking for 'libpng12'                  : not found
| Checking for 'libpng15'                  : not found
| Checking for 'libpng16'                  : yes
| Checking for 'x11'                       : not found
| Checking for 'libdrm'                    : yes
| Checking for 'gbm'                       : yes
| Checking for 'libudev'                   : yes
| Checking for 'mirclient'                 : not found
| Checking for 'wayland-client'            : yes
| Checking for 'wayland-cursor'            : yes
| Checking for 'wayland-egl'               : yes
| Checking for 'wayland-protocols'         : not found
| The configuration failed

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index 509c5cc..f5e719a 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.SGI;beginline=5;md5=269cdab4af6748677acce51d9aa13552"
 
 DEPENDS = "libpng jpeg udev"
-DEPENDS_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland-native', '', d)}"
+DEPENDS_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland-native wayland-protocols', '', d)}"
 
 PV = "2021.02+${SRCPV}"
 
-- 
2.7.4

