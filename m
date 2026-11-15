Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10705.1794762012759019687
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 09:00:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=UU3C21VT;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a2761c69fbso3326146c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 09:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794762012; x=1795366812; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7s47wD9EJjguzJC0URzZ+4+5HbS0BloAyFzy/L6E7/U=;
        b=UU3C21VT+Elv83ulEXt5w7AIYHRSiiDC4nxEm0HCOP3zkxEHF122r92n0dH+Wh4leR
         Z7iI/+O5vxvZ9azkIytiVwDB5MfkTfSUSE1rgGUzTK2rE6Z2kGr90z3RgRBvZ50YHd+S
         aU71RWNOpCm5f5Rn2SunYaP9Vfys/7qzDtYnsXh/tp3l5GkID+X1sBC5SfuvFnyXi+Lk
         e6GstLBe6ETkhXD9y+VSSmqfYt5m9MOU+JYfArB+F70fcdNJGoQ6qUu7uBPCsN5u0/QN
         OOQzWPrqce6+mulGe9iNygvLZSYlLHgmTINpdtI2Timf853Q9+zpV3EYkasX7ltRXkLG
         fRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762012; x=1795366812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7s47wD9EJjguzJC0URzZ+4+5HbS0BloAyFzy/L6E7/U=;
        b=DQ3GFaZSmw/HKuGnXW5hM8lmviO802WmgpnzeEMiHDYjcQORD+4SCeaC+oCQg+Qsfw
         OA5vrtVYKM49F4KcUFAsGkkXLtmzv27NhnwIsRjgspVfAB+a2r2mVWh7HVj20LqiCd1t
         CTzJ0ziQCqANmp9uIAEGFS4kCMHfs3THKxLnAXogcSgg90nP79XV8+g+aC1qR1ww34rc
         D44krsFwqru8Xk2Mi3v+iff5pkU858jvKoO1v+acANBykyjhSBaCpArOwFUBMWZqpiML
         c+0IJALbIDwjnFZ6nAAgLh+wxzUh7Eer73v5s6PJjdgsDSq/iXS6GxdrKtT/rnNFjtaz
         78Ug==
X-Gm-Message-State: APuU4Z9LOUs9K7dnsxI5EdmVlNbAbhDRwc1qpt9D+1ryFcIBdZ697xUx
	6cIJJP3TnDlsBdoO8Mj3Wb2QvI1zlcucAaS3km2Liv9vXjIvWQRUqkwIcKko2y1j
X-Gm-Gg: AYBFou0Dn2tvE9QrK9c+B4yw17wfi8tRoDSEzprQZtBWjtQgz1k+fMfzAqXt2FGcmfk
	/dMbPRNLkMiSiUtMW0cJ0moY5LvQD1pyqSB9taG0ok8yGkYhSAWndTYzdJ6WdvhkUckrYZFoWDb
	2Sscd/gVhYUr7JxkEtj6/o2YTnyyQqB0VOGNmkXNj4+v2YQCuuyEsvlKLue+bJ6KYW/59P8jwoO
	T6A75TpXK+9fYohOSB97N8olPBp0gmfjqhRZP+QcIjmaeQlFcRQUgOoR+xISAix38eLer5henXz
	aqUSmgDvX9WreoU9DoH1GCx4qb+09qtp0ymYLnsKikde5+0vGdk/CerhBcMKfKuLLtmANjupck8
	hW6THF3j4AOLYluSYql3jMHfOxTAGJv8/ahtOVWhaPTbS+9EJ6qzgkOYCCymP/gA+DmMf9csmlx
	ARgEjEo8jC3zJ5S/pK93sg4IdllSHUfAZ0ex6EsYkwZExIl8UUeqxgYQa5glUsxeRA3NzZhKSFr
	IG28wYbu/j5Io3BUul1SOCaYYvZgvr/FyMXeOYoKFK9pq9byMEEclQIoEM2dz1CDkbE0iCjVMMI
	+7efTIsmieASq/nJXPcmPD5S1RQyWclG+opv2K9axTXTc76jJppC1A4u0h4oz5XyntxN8yPF8XU
	QL4VDGbUcwe3G0ealQ6pwaApGtIqeDtPZ6rMG+pRCjnFPj4VIsDdOr8MzfFbKUBs7X2spuTi10V
	EwxPr9MzeQuRU0ayZwM+UmdF0auqHQ9hIsIFwT88DR1nl5gRKDbnBkYA8pmB2ghOs8fYwWBVDoy
	lAES4Wlb+VL7iPsb8oCfZHB8k/AIYLJjkIjYYC46sMLjV5kMsU5dsc8TjHjwffp7/am129cvaCu
	PeeT
X-Received: by 2002:a05:701b:4554:20b0:1b3:a22c:7f37 with SMTP id a92af1059eb24-1b50319d502mr7713973c88.39.1794762011965;
        Sun, 15 Nov 2026 09:00:11 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm29442397c88.5.2026.11.15.09.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:00:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 09/15] mpd: upgrade 0.24.18 -> 0.24.19
Date: Sun, 15 Nov 2026 08:59:48 -0800
Message-ID: <20261115165955.3485789-9-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115165955.3485789-1-khem.raj@oss.qualcomm.com>
References: <20261115165955.3485789-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 17:00:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132374
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../musicpd/{mpd_0.24.18.bb => mpd_0.24.19.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.24.18.bb => mpd_0.24.19.bb} (98%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.18.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.19.bb
similarity index 98%
rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.18.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.19.bb
index 354a73430d..663a1781cb 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.18.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.19.bb
@@ -21,7 +21,7 @@ DEPENDS += " \
 SRC_URI = "git://github.com/MusicPlayerDaemon/MPD;branch=master;protocol=https;tag=v${PV} \
            file://mpd.conf.in \
            "
-SRCREV = "8a337d15d452d5bff3be9533dd8c180f695aa953"
+SRCREV = "fe4de7969f9d3c5f1a7eb9ceff2ce6a696e3d52a"


 EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-Dsystemd=enabled -Dsystemd_system_unit_dir=${systemd_system_unitdir} -Dsystemd_user_unit_dir=${systemd_user_unitdir}', '-Dsystemd=disabled', d)} \
