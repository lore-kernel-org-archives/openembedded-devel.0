Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web12.2228.1596013427269532723
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2020 02:03:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=np7jVie5;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.169, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f169.google.com with SMTP id q7so24220261ljm.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2020 02:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8jYUpRcBgw6bOxKedj+xl4zka/R3JWcrJKUNkHPWlrs=;
        b=np7jVie5oT31URexCfdwlZf+qPOuvT/ggKOm04jHE/bgzOzgQCl9ZR1P9fKe5bDScW
         T9aF1Whj1Aa2KUpKuFEYe5XF6KAyWgJEnVIbjl6PfPbuMm05unKRCPxK4KAy/gk0KMRb
         HJvJDbD5HeoT5WU+rkoBr7fSE+Dw26XCyWZI/yXkXd/X2NqeVASInFz3QBw88GIBXxIx
         2Cd7BBvAck6uHsq0z85UagEOAwyEBm7u4pnaAMKVA7OqYLDSQpo+djCMgMe4B56bbbpo
         8sEfDYb64VYRnYKe4WK/+4Iz//jXCPXxmWXbP0PJk+dGSMMjT0VNW6K1rxmhwa/vXop7
         PBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8jYUpRcBgw6bOxKedj+xl4zka/R3JWcrJKUNkHPWlrs=;
        b=U7f4n0ggqNxQymGei1gV9Jp3jiJMfJdd66SLibJBedvSayCbxB47gPXGMrQqcxOhUy
         84BVqkV24aOglRFozj+mUHNW/vY810poirCuXE9u1K/c73BgzWPWUZqWujTAAlvZaHbw
         cPav0kQ1aGQ/KjliCZg6H2NfB38/++vz0MZxK+J2cRVCbWXHj3zt6uJXSDsdyQ5z+jUT
         0NDuonLcOFkAAD2pNBb7qU3sGMXmBKdeXmv8q+5gxTNDiktoNeau7Hb8FiCZUwt4Rl30
         u3NScIkEYSoirENHp+BoYZwc5izCC5VDTiO8xYgkq9qLaVUknmpTLL6/qguLb0wGag8J
         jAfQ==
X-Gm-Message-State: AOAM530gtj4s1RVQiHg/XFCaEAGFIP0MNY1S5HHum0CEyAducgzE9sXc
	P3yhSOsH/tkW3c8JSYt7QlLMYM0wBK0=
X-Google-Smtp-Source: ABdhPJwmQ2HlOiSRK5qy0JVVAkHhZ0D1jfPG8AitihdrH3UQH7JMB3CgfcaiYPyXnX20WLFwS0T2tA==
X-Received: by 2002:a2e:9ccb:: with SMTP id g11mr7057312ljj.421.1596013425187;
        Wed, 29 Jul 2020 02:03:45 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id 72sm313015lfh.97.2020.07.29.02.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 02:03:44 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-multimedia] mpc: update to 0.33
Date: Wed, 29 Jul 2020 11:03:40 +0200
Message-Id: <20200729090340.2770442-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../musicpd/{mpc_0.31.bb => mpc_0.33.bb}              | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpc_0.31.bb => mpc_0.33.bb} (63%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpc_0.31.bb b/meta-multimedia/recipes-multimedia/musicpd/mpc_0.33.bb
similarity index 63%
rename from meta-multimedia/recipes-multimedia/musicpd/mpc_0.31.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpc_0.33.bb
index 41abe7108..dcfc3df0b 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpc_0.31.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpc_0.33.bb
@@ -5,12 +5,9 @@ HOMEPAGE = "https://www.musicpd.org/clients/mpc/"
 
 inherit meson
 
-DEPENDS += " \
-    libmpdclient \
-"
+DEPENDS += "libmpdclient"
+
+SRC_URI = "git://github.com/MusicPlayerDaemon/mpc"
+SRCREV = "ef16b280052ef0320cb80f79d74c8ce0324005ed"
 
-SRC_URI = " \
-    git://github.com/MusicPlayerDaemon/mpc \
-"
-SRCREV = "59875acdf34e5f0eac0c11453c49daef54f78413"
 S = "${WORKDIR}/git"
-- 
2.25.1

