Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C5B4C56201
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 10:56:30 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37818.1785927387904060231
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2026 03:56:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=npCXxUDO;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8484f229529so682960b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 03:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785927387; x=1786532187; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2T6vJYgubRUaIWa0VK//eD4vty8DV1yY6EFtj2do1Z4=;
        b=npCXxUDOO6NLbDGvrATGxCaO/kZQVvTgLgUDFTc+bpG+6oMO7nITGgNIanVuJuaVu7
         3+XB295Z0Nu1qq/oWHJTKROcUtivvA1JsjSoj1XEp6NQ5PCPScSqSf5Cmlmt8Hl3iqSB
         vOdoDepZihVHNQGzgeSkuMNRocZN2OQNX9B60b3uwdg2le+UMncVbCv4ekrhtLWByW3W
         Sx5LCcQmkj0fw/stCjX2WmqTWy4ShPBPpLFpzhB2J5Q+i/2HZUcIvZuG56qT+Wux2sDa
         8WGYGRcyWiQzg4bOWGRbQQjCtnVRp7p3MbgDV392qw+0GC9KAz33zwz2JOcK8+6EycjV
         3JRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785927387; x=1786532187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2T6vJYgubRUaIWa0VK//eD4vty8DV1yY6EFtj2do1Z4=;
        b=c5+5wmpe3pMo0zivYLHd5eOZeflyVNyRtFfNrLlL9FqQ1fPL6kzSD6kE0+DLZxg0Z4
         wtBpupf7gxL/s6Ko9Xbr1FRP2VEsmSV+NoK4W6/ogqaahITbI8k//YSIK/X0qOvACSDV
         5w0aZjs+u59p5DxTPUSTe5BSrBKxWrgL2EOZ5xGDK1OQNYHfTt8y+heUAlmqWjIbOHpt
         u/RBybP/OCIwnnkquMsA2WCeqcgzH4YUKoEE7p6615WuMU4mpbrRTtplQLLIi4IHingr
         0HU6Wkdwieuu1Jkp9U8JggdvLlbHz0iAXaKJbzsOmfPsWL64H5i34Ef7dApCmQNvpS5V
         Wh7Q==
X-Gm-Message-State: AOJu0YyByUa/vGVQ/OOaAskfEa+HFpQDtNVIDdEZiigr/KvWCpHQXgFA
	n/S2ezJlA3p8ftv1XoCQ0RvDEKk0haHHNuZ4u+VHiRzBfUaNSMV8E9IDCVJcsw==
X-Gm-Gg: AR+sD11AgJaN8GKHpZsYcmY/Nu6PXgA8wKu3Y/bLDG1Hg+A269dGMqQM+KmlqSORzBq
	6gDaEKKcA4DZP6uuJuCHut1NLlFRAptevJeF/U9bwZABpZtYByYqgm4EmsrYsCn0xAfZSCiGfsY
	4NLtwttuUWqkzQdgOYuaRBTkCFoLg0rIx+pkaQKQXw1hFl2uGD7AjItE/Kvrz5+XbNviPSGsJcw
	7v94nnA9YOp8lu/Xy18VFa7QgqVkRrvCFHA331kfQc0smYz3EsIxx6wID3cElBgdKMWA4zoRnTI
	A09rxKOmSbgJxuybto3REuU3SK2I90Q0miLrePf8Vepz9oHPkk1DGhGbDuOzTxAfq4e1FvN9fFU
	ZA36QfZyVw78FPEh3ntmArCAYqaMX1e+njrNwgK4yC8N0v+6zDspdbTl678wsVUhkOAr9DZ+L56
	v8tSeK6IoAvSiWqnPojSDpPvKTTh20y6EtD2S3T93bevKlYnZXzt00B4p0B8AISiB9p97mWTPsO
	drjdyKhSam7
X-Received: by 2002:a05:6a20:9183:b0:3b3:486f:f2d1 with SMTP id adf61e73a8af0-3cb85dee539mr6418725637.3.1785927387235;
        Wed, 05 Aug 2026 03:56:27 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586790e21sm16407166eec.24.2026.08.05.03.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 03:56:26 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 4/8] gst-instruments: upgrade 0.3.1 -> 0.3.2
Date: Wed,  5 Aug 2026 22:56:07 +1200
Message-ID: <20260805105612.1648951-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805105612.1648951-1-ankur.tyagi85@gmail.com>
References: <20260805105612.1648951-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 10:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128813

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

- Dropped setting PV in the recipe and included tag in the SRC_URI.
- Upstream removed ui configuration option[1]

Changelog:
https://github.com/kirushyk/gst-instruments/compare/0.3.1...v0.3.2

[1] https://github.com/kirushyk/gst-instruments/commit/209dc6741159bbca9561df6598d45bbeab8cc2cf

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{gst-instruments_git.bb => gst-instruments_0.3.2.bb}  | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)
 rename meta-multimedia/recipes-support/gst-instruments/{gst-instruments_git.bb => gst-instruments_0.3.2.bb} (65%)

diff --git a/meta-multimedia/recipes-support/gst-instruments/gst-instruments_git.bb b/meta-multimedia/recipes-support/gst-instruments/gst-instruments_0.3.2.bb
similarity index 65%
rename from meta-multimedia/recipes-support/gst-instruments/gst-instruments_git.bb
rename to meta-multimedia/recipes-support/gst-instruments/gst-instruments_0.3.2.bb
index b3953cf5c3..476acfdb36 100644
--- a/meta-multimedia/recipes-support/gst-instruments/gst-instruments_git.bb
+++ b/meta-multimedia/recipes-support/gst-instruments/gst-instruments_0.3.2.bb
@@ -5,10 +5,9 @@ SECTION = "multimedia"
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e6a600fd5e1d9cbde2d983680233ad02"
 DEPENDS = "gstreamer1.0"
-SRCREV = "cb8977a6711657e32853159cd539d1d75fcbc772"
-PV = "0.3.1+git"
+SRCREV = "0fdaed3fbabe272e02cfc3b0a956b36da9f4ce63"
 
-SRC_URI = "git://github.com/kirushyk/gst-instruments.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/kirushyk/gst-instruments.git;protocol=https;branch=master;tag=v${PV}"
 
 
 inherit vala meson pkgconfig
@@ -17,6 +16,3 @@ FILES:${PN}-staticdev += "${libdir}/gstreamer-1.0/*a"
 FILES:${PN} += "${libdir}/*"
 
 INSANE_SKIP:${PN}-dev = "dev-elf"
-
-PACKAGECONFIG ??= "${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'ui', '', d)}"
-PACKAGECONFIG[ui] = "-Dui=enabled,-Dui=disabled,gtk+3"

