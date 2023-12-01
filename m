Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 950B1C4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 16:57:40 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.4681.1701449851501015610
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Dec 2023 08:57:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fKSjziSM;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-28659b38bc7so782823a91.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 Dec 2023 08:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701449850; x=1702054650; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u5QYpHH2qkURPIyOQxv0dYM/3H4cnPd4Bmrp2E1vJCU=;
        b=fKSjziSMETvJNTZOWDeO6BSglPRlGcfGE+cw07k872zWOG6YprwRfTVw1RVQaKmG0j
         FPJGicyx3R3TOeHPwzGxkk6OORrnOC2BdERN6zmGNT+bzScgourUNGdvPcmJzysTsyH6
         7BvsKxGkeNXhJJB6+NPVue2RPEY2VRlfJry2Asx2ASf6vd3EXMSU3Lzx1YaAOOnA0PqU
         +nfjd2UWPbzr73CUqhOTiY79/YievAfq4n0uaMDpebOdbeU6DYGi1Fel2tWgyCM5K0Jr
         6mLk52vhlVM2UYNR3DQxtkATYO/jmCFb45i13ZmR7Hj9dhnwiPenDnK1JkBoDcZeGpV3
         lzsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701449850; x=1702054650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u5QYpHH2qkURPIyOQxv0dYM/3H4cnPd4Bmrp2E1vJCU=;
        b=WlfpKREbtksXN3ov5Di737sRaHYaLtGVlWKy42jDHOhcNRHRa+MLmcA+wAB06twrhy
         wI6ujtxOes7UTVto297sN/UgGqbLkNAnGsPFKMPL+eC/2hQZ94Da9tBIIfwfP4N1QbQg
         11VAttbr01pUhJNumog3mIJCJFlRPw7UUde2BcSKIdqCR62wOxEVovknwM6tG1yuDzrQ
         5V058dBBDhAyCqbu0ASiN68LKGedFGxA6SzHftgDfRvxfSWX+7mKYPt8JcaoAlNhHGYX
         YW4GnsQy1mrTlX/YT3PcD3IFPtyMHnhGNFcNjjsmNtJxZDzQDfkpA3/2/quiX2bKoFt5
         IpWg==
X-Gm-Message-State: AOJu0Ywo9WRRmtdXbq76NB0j08JLt2Bp4CoIScgNWhZ0abqHRDXAnQN5
	kmxg5nfWlQ1NPsGGJjD/+37Y9TMwYhk=
X-Google-Smtp-Source: AGHT+IEWNjQqOYS35x0fy69lyC51VFBBYXFn8iEGhQjNCtnv13ypkMBFb1OFiOqtyaKsjIAKxHfTrQ==
X-Received: by 2002:a17:90b:390b:b0:286:5965:1f68 with SMTP id ob11-20020a17090b390b00b0028659651f68mr2609216pjb.4.1701449850517;
        Fri, 01 Dec 2023 08:57:30 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id kx1-20020a17090b228100b00285766fa20dsm3362969pjb.50.2023.12.01.08.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 08:57:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Mark Hatle <mark.hatle@amd.com>
Subject: [meta-multimedia][PATCH v2] gstd: Fix systemd user unit packaging
Date: Fri,  1 Dec 2023 08:57:27 -0800
Message-ID: <20231201165727.8679-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Dec 2023 16:57:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107191

We do not need to preprocess it offline as its not run per session but
per user.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Mark Hatle <mark.hatle@amd.com>
---
v2: Fix runtime systemd service launch issue

 .../recipes-multimedia/gstreamer-1.0/gstd_git.bb            | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
index 88acdb190e..cabbf2cc11 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
@@ -17,7 +17,7 @@ PV = "1.0+really0.15.0"
 
 GTKDOC_MESON_OPTION = "enable-gtk-doc"
 
-inherit meson pkgconfig gettext gtk-doc systemd python3native python3-dir python3targetconfig
+inherit meson pkgconfig gettext gtk-doc python3native python3-dir python3targetconfig
 
 do_install:append() {
         rmdir ${D}${root_prefix}${localstatedir}/run/${BPN} ${D}${root_prefix}${localstatedir}/run \
@@ -28,7 +28,7 @@ do_install:append() {
                 install -d ${D}${sysconfdir}/tmpfiles.d
                 echo "d /run/${BPN} - - - -" \
                 > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
-                echo "d /${localstatedir}/log/${BPN} 0755 root root -" \
+                echo "d ${localstatedir}/log/${BPN} 0755 root root -" \
                 >> ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
         fi
         ln -sf gst-client-1.0 ${D}${bindir}/gst-client
@@ -38,5 +38,3 @@ PACKAGES =+ "${PN}-python"
 
 FILES:${PN} += "${systemd_user_unitdir}"
 FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/*"
-
-SYSTEMD_SERVICE:${PN} = "gstd.service"
-- 
2.43.0


