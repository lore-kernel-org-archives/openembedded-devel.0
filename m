Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.4415.1597297433375245506
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 22:43:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=VrPSdgT7;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=pkdr=bx=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4BRwVG042gzP9
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2020 07:43:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1597297430;
	bh=KOyDqOhDuUkPRkUQ4etfFdJ33tIWUxDFB8qrbSr5iEc=;
	h=From:To:Subject:Date:From;
	b=VrPSdgT7FzzpZhqYNRoJ5yE9LzCASMEz7A26SuLvWmB0zoqfPPrHoVrOJ+X04G5gz
	 gaTu4/Gt6xKzOly3DvPjltBr/MwAmv0OaYAcUbZBfpl0Ye7ucLQ5nIDQPMVmpkvQYk
	 xoMNBqN5N2ymQS+aCGCkgLpDEIEOMvS7rtFUELiwEUnNm4818R+82Dt7wMg4k5ZFKs
	 HhlnMymU2rcXrTH/SZs7cNwWppuJ6aaL3f66syLPjdSgK2pm5lyfSKHxBdZ4hbympk
	 JcY9VG16xXFMykzVMwbP4sGdHi9y2QyZ75IKmsIlrV6WLrZT7pDBq+Vzbyf7dWDIll
	 fKYwzLs5DAmUTaScWtR1lYIAD22/vcD5vvobjg0QSUNa3996k3NdOnpyG42MTEcPuv
	 g204xLPUCKFSOdBnHVN/Y/JY4tb7TTarZu7kvNJ84GDWQXIChgm8ndtko/fcyfbcxM
	 tZk++/NCJH0SjJGxL/e50bO7xfloQFcS17EyvoPv39PnaIl4J9CDPYG1BVxP8tuk/l
	 IN5RHJS5P7pV4avfX9xzr1QWygqLyk+pQW5Vgfq4p6Zf3Y0YZdjffFr/g5HGhVftBw
	 /5QIf7QOw71vcvQuN1Lctgjctj9QKOd3ITrboz1kTd7aAWis6Gd41L1eJyoqM7qLpO
	 gQkndeH4u/1ejGHgWqRGvLos=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-settings-daemon: smartcard support is optional, and needs nss
Date: Thu, 13 Aug 2020 08:43:48 +0300
Message-Id: <20200813054348.8194-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

../gnome-settings-daemon-3.36.1/meson.build:165:2: ERROR: Dependency "nss" not found, tried pkgconfig

This happened when networkmanager is configured without nss,
or nm support disabled in gnome-settings-daemon.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../gnome-settings-daemon/gnome-settings-daemon_3.36.1.bb       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.36.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.36.1.bb
index b38ba558c..8d90a7a40 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.36.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.36.1.bb
@@ -44,12 +44,14 @@ EXTRA_OEMESON = "--native-file ${WORKDIR}/meson.native"
 PACKAGECONFIG ??= " \
     cups nm \
     alsa gudev \
+    smartcard \
     ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)} \
 "
 PACKAGECONFIG[alsa] = "-Dalsa=true,-Dalsa=false,alsa-lib"
 PACKAGECONFIG[cups] = "-Dcups=true,-Dcups=false,cups"
 PACKAGECONFIG[gudev] = "-Dgudev=true,-Dgudev=false,libgudev"
 PACKAGECONFIG[nm] = "-Dnetwork_manager=true,-Dnetwork_manager=false,networkmanager"
+PACKAGECONFIG[smartcard] = "-Dsmartcard=true,-Dsmartcard=false,nss"
 PACKAGECONFIG[wayland] = "-Dwayland=true,-Dwayland=false,wayland"
 
 FILES_${PN} += " \
-- 
2.17.1

