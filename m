Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 356C3C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 05:38:45 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web09.7427.1645421924759792847
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Feb 2022 21:38:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SdlPVj2V;
 spf=pass (domain: gmail.com, ip: 209.85.214.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id z2so3347958plg.8
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Feb 2022 21:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S01nzHYLPUyHP1BU+VQ6GawXE1UxTQ9qoCyE4/c/YBI=;
        b=SdlPVj2Vzoe4KI/M75tJB9q6QWp46P3xYOX8Kb3tbqfaKCsCw070mgVu4HK5Nos6x/
         8nqpFqGMfRKaWWbTVQrWDFKjEvwEf/9UKcxUBvEiunoJDWKaQymM2oybwpBundVfY2sZ
         6h3X07F73aePxurskHEXRLFt8CEx5ADZLZBiIEnsn2I1RhxahejE2si2biutPpTHuGKy
         rSUg37CjSRxesl16k9wSmhyn045kUKmovq8URJPczZBZb0fl17EB8noQMsEXF3g/XyxC
         NKSeidYYSFf7drNdws4r6gp2xKAhqeFjfR0oSE9RkebRBmdn1Q0kbujThFTNevjLCSAY
         9Zvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S01nzHYLPUyHP1BU+VQ6GawXE1UxTQ9qoCyE4/c/YBI=;
        b=0gTyopv9V864WJO//e1aDRZ8bmCZXSvYY8Gb4kch9eqIJJeyW8kVBosc+1KRL7zmu7
         NL2u1Cam5TD8MJxqjjJ/mojR+zLE4tSAbx4rcMUhno3ruk4wO/Cdj7+WLph/oWBpHwgm
         M/E3xGOsYAbmTXRGAZJa3SnmrLS6tuYpsBtajQNpbkDUD+U7BcAEwio4uAhg5GSZQqU1
         obigdKM/dU6lzKp3iNjQCGDHIQH59TOBz4LGrY2d5fYWU+DczWZgkeGx8o9tEIeqkK/Q
         L9YL6/TDVi2dlYl3wN2EdNOuiXjFfQAVcydsoCWXm4iooEFSDdtaQ06X5afEfnOsgcRr
         gwOA==
X-Gm-Message-State: AOAM533/y8N4RsaOVVDteCAeooKFVwFNssKs6Pw4zXMTbpAArxWFSqK1
	9zbQM2GJ0vqp7xBAwH1WPe5FpHx+bjRJQA==
X-Google-Smtp-Source: 
 ABdhPJzIHWa+bDrOf1ClxGoGR9C0VdVIPm8Pa6LMoEKLAqRYLMt1RdaT4Y2LZ98Y5KZDn6ViAEzYrw==
X-Received: by 2002:a17:90a:6688:b0:1bc:5492:6373 with SMTP id
 m8-20020a17090a668800b001bc54926373mr373502pjj.161.1645421923864;
        Sun, 20 Feb 2022 21:38:43 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 h7sm10527444pfi.128.2022.02.20.21.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 21:38:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2 1/6] glibmm: Add recipe for 2.70.0
Date: Sun, 20 Feb 2022 21:38:36 -0800
Message-Id: <20220221053841.98265-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Feb 2022 05:38:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95399

Upgrade 2.66 recipe to 2.66.2 minor release

Changes in 2.70.0 release
https://gitlab.gnome.org/GNOME/glibmm/-/commit/042e90eebca380686bbcc24d6803305b9d2c7823

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{glibmm_2.66.1.bb => glibmm-2.68_2.70.0.bb}      | 12 +++++++-----
 .../glib-2.0/{glibmm_2.66.1.bb => glibmm_2.66.2.bb}  |  2 +-
 2 files changed, 8 insertions(+), 6 deletions(-)
 copy meta-oe/recipes-core/glib-2.0/{glibmm_2.66.1.bb => glibmm-2.68_2.70.0.bb} (64%)
 rename meta-oe/recipes-core/glib-2.0/{glibmm_2.66.1.bb => glibmm_2.66.2.bb} (89%)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.66.1.bb b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.70.0.bb
similarity index 64%
copy from meta-oe/recipes-core/glib-2.0/glibmm_2.66.1.bb
copy to meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.70.0.bb
index 94844f21e6..357cf4f752 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.66.1.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.70.0.bb
@@ -5,23 +5,25 @@ LICENSE = "LGPLv2.1 & GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=42dfffebc56fec7527aac53b7a89d1d8 \
                     file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "mm-common glib-2.0 libsigc++-2.0 glib-2.0-native"
+DEPENDS = "mm-common glib-2.0 libsigc++-3 glib-2.0-native"
 
 GNOMEBASEBUILDCLASS = "meson"
-
+GNOMEBN = "glibmm"
 inherit gnomebase
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
-SRC_URI[archive.sha256sum] = "69bd6b5327716ca2f511ab580a969fd7bf0cd2c24ce15e1d0e530592d3ff209c"
+SRC_URI[archive.sha256sum] = "8008fd8aeddcc867a3f97f113de625f6e96ef98cf7860379813a9c0feffdb520"
+
+S = "${WORKDIR}/${GNOMEBN}-${PV}"
 
 do_install:append() {
     for i in generate_wrap_init.pl gmmproc; do
-        sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/glibmm-2.4/proc/$i
+        sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/glibmm-2.68/proc/$i
     done
 }
 
 FILES:${PN} = "${libdir}/lib*.so.*"
-FILES:${PN}-dev += "${datadir}/glibmm-* ${libdir}/glibmm-2.4/include/ ${libdir}/glibmm-2.4/proc/ ${libdir}/giomm-2.4/include/"
+FILES:${PN}-dev += "${datadir}/glibmm-* ${libdir}/${BPN}/include/ ${libdir}/${BPN}/proc/ ${libdir}/giomm-2.68/include/"
 
 RDEPENDS:${PN}-dev = "perl"
diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.66.1.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.66.2.bb
similarity index 89%
rename from meta-oe/recipes-core/glib-2.0/glibmm_2.66.1.bb
rename to meta-oe/recipes-core/glib-2.0/glibmm_2.66.2.bb
index 94844f21e6..2097ce84fc 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.66.1.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.66.2.bb
@@ -13,7 +13,7 @@ inherit gnomebase
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
-SRC_URI[archive.sha256sum] = "69bd6b5327716ca2f511ab580a969fd7bf0cd2c24ce15e1d0e530592d3ff209c"
+SRC_URI[archive.sha256sum] = "b2a4cd7b9ae987794cbb5a1becc10cecb65182b9bb841868625d6bbb123edb1d"
 
 do_install:append() {
     for i in generate_wrap_init.pl gmmproc; do
-- 
2.35.1


