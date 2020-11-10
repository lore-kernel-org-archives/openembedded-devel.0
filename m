Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.29050.1605022189738712430
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2020 07:29:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GYBcyeeD;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: rosbrookn@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id t191so10579226qka.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2020 07:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OLiRMLUq5dW24/edISmwKAeWXVsBlNbVWgX+nL3ZfQw=;
        b=GYBcyeeDK9YfHT0jz/t9lDOChEY2XYO8uaYcteZWiZAUMwJgNTawKS4Vl7Opcvtd9p
         W6sR+j9nOMJ/zLr+O5UzpSwEcaBHC/R3cuFOgCMLAuwdrwJuVUu0/+1i9vNYyF0Wx+sQ
         QfdNmUrqLLPEc/UfL+my9EOSvaP5Lj3u9NRGNr+f1NkokT8nS/4die+t9jKlYI4F/k0p
         p3ufHcE9bVzBz8IuP2Mphx9gKrBKcbWOet6dcym0pDY4LIHa47rs/+IbfWI9OsX3vmR5
         rmJ+Rx3YG3PQcpHcAEjcCE3FBKqbhYimhz/LIiMUWr27KUeZJC6FSA6+ya6RMCLJmP9h
         bP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OLiRMLUq5dW24/edISmwKAeWXVsBlNbVWgX+nL3ZfQw=;
        b=rwmlEwG18+qaJRUIHp0Q/LTTHDrLaSlq1omW3dkGohpEqTaJ8XMB9fO745haGVeibF
         0g9T0ze3nXw+qZDpN5zwno7gePrhH6XudgRU1eR834wjU9Aws4C77PNs+E8/rJu4W4m1
         Lw1/TvKSOM8P4zxwZkLuCO43K1hW1kDAwvxN1e9uyOAA1jCi9Z97gNmNqLhvC4INcP5Q
         R0jngv09RRGOgjts9oUnvNFuvzdJsFnPmD65GQAdvMSOwzkpoMpg25MurpMDSGewxASC
         dRag92ZW5k4Zmm7oR0XILS48jo0f9pZ3eNgOkzM1KVzPoECWWCLVjC9uybm3XOPJP2n4
         oXdA==
X-Gm-Message-State: AOAM530ShfCUMixPSM2NZu6/FLm4mSD2pSbtjnpjtY4lLs+LYgow+nJ7
	lZ+x6KnMIWFpbWqp94jxTYVzOPfkd6GG/w==
X-Google-Smtp-Source: ABdhPJx58a9bdULGUEArI/jq5CdzPcX8O2+kcGJIRfBeE+yZJgOzTfq64kj/CxfdlOoTGaEpeyyhww==
X-Received: by 2002:a37:4117:: with SMTP id o23mr19135297qka.479.1605022187662;
        Tue, 10 Nov 2020 07:29:47 -0800 (PST)
Return-Path: <rosbrookn@gmail.com>
Received: from FED-nrosbr-BE.crux.rad.ainfosec.com (209-217-208-226.northland.net. [209.217.208.226])
        by smtp.gmail.com with ESMTPSA id z13sm8680549qkl.2.2020.11.10.07.29.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Nov 2020 07:29:46 -0800 (PST)
From: "Nick Rosbrook" <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Nick Rosbrook <rosbrookn@ainfosec.com>
Subject: [meta-networking][PATCH v3 1/2] strongswan: do not use deprecated stroke and starter by default
Date: Tue, 10 Nov 2020 10:29:40 -0500
Message-Id: <e952fe4e544ce1b39dea118e1c8b38b007f2332c.1605021370.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1605021370.git.rosbrookn@ainfosec.com>
References: <cover.1605021370.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The swanctl and vici configuration of strongswan is preferred, as the stroke
plugin used with starter is deprecated. As a reasonable default, add swanctl
to PACKAGECONFIG by default, and remove stroke. When systemd is in DISTRO_FEATURES,
add systemd-charon to PACKAGECONFIG, and add charon when systemd is not in
DISTRO_FEATURES.

While here, make sure strongswan-starter.service is only installed when
charon is enabled. The current unconditional installation of
strongswan-starter.service can break systems which install strongswan.service
for use with swanctl.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 .../recipes-support/strongswan/strongswan_5.8.4.bb   | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb b/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
index ca645ed2c..7f2a2b1e4 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
@@ -25,7 +25,8 @@ EXTRA_OECONF = " \
 
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
 
-PACKAGECONFIG ??= "charon curl gmp openssl stroke sqlite3 \
+PACKAGECONFIG ??= "curl gmp openssl sqlite3 swanctl \
+        ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-charon', 'charon', d)} \
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

