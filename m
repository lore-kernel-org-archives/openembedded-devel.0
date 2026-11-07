Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6372.1794046322331194573
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Nov 2026 02:12:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=kDJOKJsh;
 spf=pass (domain: gmail.com, ip: 74.125.82.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1438d9363fbso242541c88.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 02:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046322; x=1794651122; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A6OAGKkIeb6tZ5LUXBfJyLivFyi8jec4W3qKHF016sw=;
        b=kDJOKJshOrwRMlcogeVbgHiUjuntr+1saH4sPDb76eLwTTU5F7VqO9rfcGoL/30QWM
         JuYBihonF+EcPzaNC/gmkgTRx2yKz2E7Ug9b4Cr9NL/q5dKDqEMtOP4KY5s3E4gpSHXQ
         /lcWG/R/w4dbGSWeEb5UfUWAFDritSDDd7NEMePfnzhsXemc/OBaadknAIVsXNc+jLp+
         QVTSOjrqoI2GsEmoEJL8DUp1fZvHzqmACaCtbzIr62daJwfeqQmGDueu6qjStL51mIuc
         iYtXkZkAbVRCBzNIrFklvgVCaxSm/vjK15s1R7c+Bt2jpoOzDQkk95+q5jBYkHmYIvwm
         Iswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046322; x=1794651122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A6OAGKkIeb6tZ5LUXBfJyLivFyi8jec4W3qKHF016sw=;
        b=YWBiVlgeXoo9SsSPb6DxAWODYvRj5YL7eVP344h6rSG7jkWSCVJSo5tnt/Vyn2Pben
         QfO9GpfIudUBiXJtb0PefCL8HGFHJbX8gwXehu5EEF3sK0+Am2gAL2g1cObsZVC8ewYU
         F30fMf/4k+1lCh8jMSz++2LP+D1wO7sJ3PT0QUxzxBKGDI5p5CRpQMXgJZYxKMKl1lAf
         rD612CJuFRROxnAz46y3JUbw8AmssQF2uHYb2AerXtTJ9+zzg7LCCwRZMytdsJ45JMtH
         RdHBs7Wh8rxm6WcGWMxKnEPg0Di8RVYcRQJnahblgelFR7HVb1ko/4baA4qvxvDvagnJ
         9Fyw==
X-Gm-Message-State: APuU4Z93L+124wNVgHA5+y9bkDH5CimOlVGBOptRJJDX/Ptl8Cl8/sUK
	Px2Xbkr6MuCfqXywuUVZsTo2HPjfY5okKklogKcW225rmAi9itkz+OMEcMuw+Q==
X-Gm-Gg: AYBFou2JzwrDAFwSeh9GuhJvhfgJl3l/CU1Zx+lk9rd5A3jWpcE+B4Ouf+Yx3UJEF4y
	oJvSpLmauPngxD2cZZrJMvY7CiK4Wp9u//7A6eMSQJy21E/k90oPLJAFBNzaf53Q87txapr3zIZ
	Xzco4ESted/dyvQSrh+1+qLGcPhBmnz9mtRnhzsM/xMGVQXPDfTUYX8vYOJlgoNnfXUmd48WjRp
	Mpy37a6ooYlKDXwY1QnN4XcFSM4w7q0aA06EHd/jwwXYCjNHKkovzTjV3YCZmjOsbUhEUsnDTwm
	UKE4fprCg/0s/BB4SVjmVnjIVsb6bPRvMt3sJ478BHKlDdR5sX6X7vXY0aJBzZWuhc2loBXwMlO
	8WSmOjlNGIwoQYhirXp5nY1ZoaeSgOyaeeTH0uRdnH2fS1DDhBPcP+L1pUbBzZo0atJzEwRS9Bd
	fQK5igk1rFuAJhGAKuMELIolKekp6hy2pFMxQwJGArA8W5VTT9UgNWFErjx9UIVSUt3VA4wYj5n
	TrKZtIE1gyZTIJlwJm7lD9cfl8bvHLiqq0cNeTfJzBamc19XdCEcoUfxmYFz2Fy/4KNn1rG+thJ
	HinsLWKz8OpJ2ad7o3bZwaYLQNR0yeniy61MYG7Fr2i9NtJMFcq6kI/s0hGAlQ==
X-Received: by 2002:a05:7022:264b:b0:13c:f65c:d5b5 with SMTP id a92af1059eb24-1b269a6631dmr2140638c88.3.1794046321469;
        Sat, 07 Nov 2026 02:12:01 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4840f3sm22856467c88.5.2026.11.07.02.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:12:01 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][PATCH 1/11] evolution-data-server: upgrade 3.62.0 -> 3.62.1
Date: Sat,  7 Nov 2026 23:11:44 +1300
Message-ID: <20261107101154.2992152-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 10:12:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131975
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://gitlab.gnome.org/GNOME/evolution/-/blob/3.62.1/NEWS?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../evolution-data-server/evolution-data-server.inc           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
index 8f248c7362..5f27b97acd 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
@@ -11,5 +11,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
 GNOMEBASEBUILDCLASS = "cmake"
 inherit gnomebase upstream-version-is-even
 
-SRC_URI[archive.sha256sum] = "78be88e9a511f5afe7ff2e363eade84b622dd0282647fc576edb2d4ff2962cba"
-PV = "3.62.0"
+SRC_URI[archive.sha256sum] = "b75c823445d7d30bca797eee929809e8d389abbb8d471f68ae2af60972779f26"
+PV = "3.62.1"
