Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7931.1793057199182883245
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2026 16:26:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KXenqFM/;
 spf=pass (domain: gmail.com, ip: 74.125.82.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-188406bb948so2821925c88.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 16:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793057198; x=1793661998; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tsMOWKUTixXiUtx6NQQAWzN+Aj/u9hydtSjPiFbUoqU=;
        b=KXenqFM/7sHRSs25FFsKFKz8djEACFFr+Di10irXSesPTUb8LYCT9spU97Tc/Lr6f/
         pHNU9SRBHrDmgmpsHaIuh/gNk1AEVxXLKCJ54WvrfJbOihIE1qfBhNp8ZFuMHHE6K4j/
         0b8GmrNSQo1ARlmj76UkIfK9ztlPuzywsweQadqOPjM134Pi1Y1W1KDg8lEVCMKJLGg3
         +szkX3rIM73eiI2pjV2/2lrbR5/UQ/5sVGspzJh2M4ZcZjgYGlqJduNj04NaxNTXtOyN
         bkAqrgfIitEBMJsskT2KvIifyaK+A2CIGSpxBqsBBz1yOW6/+B5+JTE6BW65Yk/0PZVG
         Xryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793057198; x=1793661998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tsMOWKUTixXiUtx6NQQAWzN+Aj/u9hydtSjPiFbUoqU=;
        b=GIGXBZmKMBp0vFMhqQYi6s26TjI0Qb4IIChKTOaiO2bgrhLr5oQTiAfvDfT7NlS/ej
         U1Nw6hZKR/f8MMEseVfwdxiFtDDjLdLfn4DrRZqWgQA8wu0c/DHIf67cccwEcGdirYqG
         25Zv2V0bjvr5/fRGmw6EXajb4o0SB1/JvlkLKz2f507lbkRqi96aaSKYwcafu5+d6ezc
         Kyw6e/a+H3vL4PdRaWHuk98X5oAAF3EjITxZ/NmUpKcd3bIA1lGFY7o2afissgc/TC+Z
         NZdrNxdPKNdTY4wrcxFkbWb3aLBwrp3k/imiKFxzt13gX6yH2zrCdpW4spi8JDosYtRS
         iklw==
X-Gm-Message-State: AFq9FYK4tcyCENnKRx8K3BWtCCc8ix7dReHTcHlpqXtH0ljyOrm84W9J
	c/E9JyXpqHOopfcJot85EAUFNvQ12vBBu9ou3pUq9eEYjYChLYTO+9RgWug4Mg==
X-Gm-Gg: AYBFou21Ezac4iwfyFWRB7fgxw77BoA4gz/Q71c1VjSOQlQc/s1/jHJO59cB3I/q1Kx
	lrYVB43HCu7sQAgC6j/IfzNof44uWM9JdEO0YJs8s/gI8kHsNkFLc5rn4v8wO0kmq9eQDc8/jSw
	2+d8ZSYnL447608oRJ0PZEUjWECf2EJulbx3gikFReevYNHnvLl2njnglzy6rTyxXPNtaQslKDd
	Pe1VFKdPnmCeQzWm6yZ1g00G0bl8ZategUt9HOBXi2KG9Py3USIDdQ7A6RdU+7Fd5mOQx1vrUN5
	GTUno7Vq8umK4JsURjYBOdS1gHT9kttLjvTwVLBoQ/v28ORSCJRrgnIQk4FLQW9P98fcu05FCnu
	w7FA1mN291Jq1RJiiLnpFoIqe+QLus0OosPc6P6iNXo8Bi+diBiITzZLOGH5m5SEFsWvh0jKE6B
	0ecDiKrmkgziRiQFBJvV1y6Na61XopYgKsJ8e/584HfI1pKzAbetPsMGDIYSCSUmdfK3Hei2vVH
	IM7o3S8TF/Mv147QtnDJYXrDwy7W68bK1ycmIkbDCXddyXiGqzFeBSzXyMm0alHJ9afeb+tvT1V
	0Bw4caP1RsWXZtCoA4w1yLjLhUc8K6WZ1d1pTYYfE3KmYhgRUWA6TqTkCvMP4yo5HJm8wTBYuws
	YPmOI/HY=
X-Received: by 2002:a05:7022:7e83:b0:1a3:dbb2:478a with SMTP id a92af1059eb24-1a3dbb24a69mr1405108c88.27.1793057198343;
        Mon, 26 Oct 2026 16:26:38 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0e8d700sm32234982c88.10.2026.10.26.16.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 16:26:37 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 4/13] mpd: upgrade 0.24.16 -> 0.24.17
Date: Tue, 27 Oct 2026 12:26:16 +1300
Message-ID: <20261026232625.1275411-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026232625.1275411-1-ankur.tyagi85@gmail.com>
References: <20261026232625.1275411-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 23:26:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131444
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/MusicPlayerDaemon/MPD/blob/v0.24.17/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../musicpd/{mpd_0.24.16.bb => mpd_0.24.17.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.24.16.bb => mpd_0.24.17.bb} (98%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.16.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.17.bb
similarity index 98%
rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.16.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.17.bb
index f5e1424a73..80858516cd 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.16.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.17.bb
@@ -21,7 +21,7 @@ DEPENDS += " \
 SRC_URI = "git://github.com/MusicPlayerDaemon/MPD;branch=master;protocol=https;tag=v${PV} \
            file://mpd.conf.in \
            "
-SRCREV = "a07478faa8c94cef77b22e62d755ab19e30b9085"
+SRCREV = "83202ab4fb35196023163b007e537c0e60da8200"
 
 
 EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-Dsystemd=enabled -Dsystemd_system_unit_dir=${systemd_system_unitdir} -Dsystemd_user_unit_dir=${systemd_user_unitdir}', '-Dsystemd=disabled', d)} \
