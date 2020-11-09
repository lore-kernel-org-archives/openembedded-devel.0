Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.13076.1604936074768540627
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2020 07:34:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dWajH+86;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: rosbrookn@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id d28so3156451qka.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2020 07:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=29BC4Bk/J3u3AQi+p/xIpKKSnzh50WFzZ/HNuflD2/c=;
        b=dWajH+86/EkjJOMxZ4j5HOWVqQRt5az2ESXqjzIFtglL6Qjg9otSm9A8rMwgKxAiRO
         cgpNkXiZOsNk94NPXIIU73lfQ3HjiFP+NYfLC7cySU1OyhiHStbR2sdHk1Rp2si44hjW
         yAF6qPSDshmHnlLEDgH3D4udXbNV/ztgqP6uZxLlHRsftTgp8y99MWgJDPlrFGInsIZl
         6M75OfIfAMPxyBtjLQC0Kr5Oak2svUhK05CGwqjaFrNQBY9s50bczhlw4/N3wmg6lsxJ
         ihwSQo7pWUk3XM0pjGeIFtkkQ1j0ncR8V1DsVSNO0ESV4nazHURGDWiPGdYMEwJVTaP0
         vzVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=29BC4Bk/J3u3AQi+p/xIpKKSnzh50WFzZ/HNuflD2/c=;
        b=J/KcyifUhfWWtaDXxrExkSZDET/Pq98WK5Fo8tLwwDKq+ukEsIwOLkbbf+RHRT/fa1
         9bBFKEKsbuXDxgTiwudewjEhyK9Nyahp3sbbCDlC1oVsFaOfgeE47JDohjErnHQFYGKy
         CTjgARoCHh2uRfwlk2ednpf53aB18pp+qXg22gudJvkZlY6pF8jtNk2b/ut9c8NcO9QJ
         ufCXVQIzuLjB3lLTin/di/gtW7Mg3tyjuQO6x/Wvs2Gg7uzKQWVtVJNkqXNiILZbUUOi
         czYuPoiBy2htQQydNVHUjeLfx7gi2MjKnJl0w39XcCCPTPMrTRiQ61TAixhkPHpYcHKs
         fmcQ==
X-Gm-Message-State: AOAM533zzjfcD1xh8ckmeATqxOVRIpQYuoICtSCB4R2Ag9Daa3ulMdUk
	aCJe7A2xIbUKL4Mtl4D8TO1/DykwUo09Ow==
X-Google-Smtp-Source: ABdhPJx0zXhQVtl0/O1HY631azjC+2SNNSV1klwvoiEwpcPjDTZuIzFwXouUZDYeNi6Ygda5cJLPeA==
X-Received: by 2002:a37:90c3:: with SMTP id s186mr14544747qkd.130.1604936073526;
        Mon, 09 Nov 2020 07:34:33 -0800 (PST)
Return-Path: <rosbrookn@gmail.com>
Received: from FED-nrosbr-BE.crux.rad.ainfosec.com (209-217-208-226.northland.net. [209.217.208.226])
        by smtp.gmail.com with ESMTPSA id b3sm5768656qte.85.2020.11.09.07.34.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2020 07:34:32 -0800 (PST)
From: "Nick Rosbrook" <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Nick Rosbrook <rosbrookn@ainfosec.com>
Subject: [meta-networking][PATCH v2 1/2] strongswan: do not use deprecated stroke and starter by default
Date: Mon,  9 Nov 2020 10:34:27 -0500
Message-Id: <b26c5c7085c0fea710a37de329a8972b66d9f3c8.1604935361.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1604935361.git.rosbrookn@ainfosec.com>
References: <cover.1604935361.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The swanctl and vici configuration of strongswan is preferred, as the stroke
plugin used with starter is deprecated. As a reasonable default, add swanctl
and systemd-charon to PACKAGECONFIG by default, removing charon and stroke.

While here, make sure strongswan-starter.service is only installed when
charon is enabled. The current unconditional installation of
strongswan-starter.service can break systems which install strongswan.service
for use with swanctl.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 .../recipes-support/strongswan/strongswan_5.8.4.bb   | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb b/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
index ca645ed2c..abba86e39 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
@@ -25,7 +25,8 @@ EXTRA_OECONF = " \
 
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
 
-PACKAGECONFIG ??= "charon curl gmp openssl stroke sqlite3 \
+PACKAGECONFIG ??= "curl gmp openssl sqlite3 swanctl \
+        ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-charon', '', d)} \
         ${@bb.utils.filter('DISTRO_FEATURES', 'ldap', d)} \
 "
 PACKAGECONFIG[aesni] = "--enable-aesni,--disable-aesni,,${PN}-plugin-aesni"
@@ -135,4 +136,11 @@ RDEPENDS_${PN} += "\
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'swanctl', '${BPN}.service', '', d)} ${BPN}-starter.service"
+
+# The deprecated legacy 'strongswan-starter' service should only be used when charon and
+# stroke are enabled. When swanctl is in use, 'strongswan.service' is needed.
+# See: https://wiki.strongswan.org/projects/strongswan/wiki/Charon-systemd
+SYSTEMD_SERVICE_${PN} = " \
+    ${@bb.utils.contains('PACKAGECONFIG', 'swanctl', '${BPN}.service', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'charon', '${BPN}-starter.service', '', d)} \
+"
-- 
2.17.1

