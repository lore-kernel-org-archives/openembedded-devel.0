Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web11.3866.1586310625522290825
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2020 18:50:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eAbOm7o+;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id f206so1667485pfa.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2020 18:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K++CA5KBF+KjjgnlUSGbi15Y4Sw4QK1V37MedE/oWVM=;
        b=eAbOm7o+9XhTH0CuWaur/QEIbAOE1uMagHJKxl8xNQm532o2AZ3w49XuJO4fP5cXjH
         FTCog0x4zyxU7XXu9vEAKDvqddyZVJvfB8sq1bsub6O9VfQ2ZYI7Tsx3I+b4o2Ij7AHD
         /HSDBqNdAlgWLXZOPt/vUsjkFKwA+K97CzuYI8zvXP+6OfAg7qdmd5gMwZ4/PPaRrSga
         xT1LyPIS9FneLSfR0IBWvv8Hvd7/qGahSkhDC08nzsuK54rk1JG1Z7uVAnR/qNGtAJvH
         cNwM54iN1AmoW/7yH0T6XQ7/8uISsz9CEqLZTybWkSxFz+25GJUpzlkAqH/Hdg9Y1ioB
         +e+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K++CA5KBF+KjjgnlUSGbi15Y4Sw4QK1V37MedE/oWVM=;
        b=W3DRF2iYUpAnDF7VIZCor9SeIlgoLxZxWOiFmYGSEKDLX1YAoIgFcKoq7LngT1r7/1
         QyiO4QPfEcsHXRk6ChgVNGaVnuhjnt4QNdg15jiF1XPYRQGWUrPhd1asUqFOVjt2XOVD
         WCfGyIDRBF9NZQJLMIqpgZezVzzMP5xzxUHoUJbp2nUx+KBT5h+QMaLyWOmYDbkeHcpg
         s5VpZ1JTEY3WgXXsLSb1ei4P211aJ+TI9WPDUv0G9BMtGX3c3589r1wJ3uEheo8zqoI6
         rDx+FbwD0dERtCBi+LKwUUE9wGUtl8EV/LY72bThfJ6SzOX4iilC5e1HohFY3+wVK+Mj
         IVzw==
X-Gm-Message-State: AGi0PubeVeThUCYFrEgjaKAVFQd702mwfs+Z2NMizwci/3EJw/9TR/vf
	tOgH0xkNKLax7buEe9+NbM0oLnGhx7U=
X-Google-Smtp-Source: APiQypLjxKALgHqN0d2MChrxXb+rPYHar7KRXa2t3A0zgK3/qOaTDyjHuNIz0S21GNaEj0eJiyyqDw==
X-Received: by 2002:a63:4c1:: with SMTP id 184mr4759646pge.147.1586310624315;
        Tue, 07 Apr 2020 18:50:24 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::493b])
        by smtp.gmail.com with ESMTPSA id m7sm2805203pjb.7.2020.04.07.18.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 18:50:23 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] wireguard: Upgrade to latest compat external module and tools
Date: Tue,  7 Apr 2020 18:50:37 -0700
Message-Id: <20200408015037.1432166-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ule_0.0.20191219.bb => wireguard-module_1.0.20200401.bb} | 4 ++++
 ...ools_0.0.20191219.bb => wireguard-tools_1.0.20200319.bb} | 5 ++---
 meta-networking/recipes-kernel/wireguard/wireguard.inc      | 6 +-----
 3 files changed, 7 insertions(+), 8 deletions(-)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-module_0.0.20191219.bb => wireguard-module_1.0.20200401.bb} (89%)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-tools_0.0.20191219.bb => wireguard-tools_1.0.20200319.bb} (81%)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20191219.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200401.bb
similarity index 89%
rename from meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20191219.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200401.bb
index badc97a973..73199592c8 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20191219.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200401.bb
@@ -1,5 +1,9 @@
 require wireguard.inc
 
+SRCREV = "43f57dac7b8305024f83addc533c9eede6509129"
+
+SRC_URI = "git://git.zx2c4.com/wireguard-linux-compat"
+
 inherit module kernel-module-split
 
 DEPENDS = "virtual/kernel libmnl"
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20191219.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200319.bb
similarity index 81%
rename from meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20191219.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200319.bb
index 267124a294..f698b9a9af 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20191219.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200319.bb
@@ -1,13 +1,12 @@
 require wireguard.inc
 
-LIC_FILES_CHKSUM = "file://../../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+SRCREV = "a8063adc8ae9b4fc9848500e93f94bee8ad2e585"
+SRC_URI = "git://git.zx2c4.com/wireguard-tools"
 
 inherit bash-completion systemd pkgconfig
 
 DEPENDS += "wireguard-module libmnl"
 
-S = "${WORKDIR}/WireGuard-${PV}/src/tools"
-
 do_install () {
     oe_runmake DESTDIR="${D}" PREFIX="${prefix}" SYSCONFDIR="${sysconfdir}" \
         SYSTEMDUNITDIR="${systemd_unitdir}" \
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard.inc b/meta-networking/recipes-kernel/wireguard/wireguard.inc
index 1ebe7cdfba..a3a7867c23 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard.inc
+++ b/meta-networking/recipes-kernel/wireguard/wireguard.inc
@@ -10,8 +10,4 @@ LICENSE = "GPLv2"
 
 LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "https://git.zx2c4.com/WireGuard/snapshot/WireGuard-${PV}.tar.xz"
-SRC_URI[md5sum] = "5175ca88850993dc88a4c9d924ee79d4"
-SRC_URI[sha256sum] = "5aba6f0c38e97faa0b155623ba594bb0e4bd5e29deacd8d5ed8bda8d8283b0e7"
-
-S = "${WORKDIR}/WireGuard-${PV}/src/"
+S = "${WORKDIR}/git/src"
-- 
2.26.0

