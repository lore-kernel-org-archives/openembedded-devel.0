Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE54C4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 08:09:15 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.18039.1701418153454149355
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Dec 2023 00:09:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C5CDCfRx;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6ce06c30b06so125231b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 Dec 2023 00:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701418152; x=1702022952; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VMn9rCqDfnhiUaTJP3uaFyHHo69j1UfjhEXdtnLhIrE=;
        b=C5CDCfRxqgs6Q2ydwego6/dJcsxUPWiZ4lllnd5gyRJ2Ng98nzJklTD+fMH+NKx0b6
         eORYjJWg1pQCBiCBQZS7rz/xVZRZDno13miom8vNcaKDCUObRAelLeo4Xd+OT3yBye6f
         UvbdwqSFa3gY71EO1dcsTUOrxby6Bdbmer+8GNWZnzmUjjkwdWl/hCAh3kbHNKn5wmgL
         4O6KgJUwcPhVQh7ZS/hFYZsFF7am2OxF/bYa3UKcupzDjLoV+HNFPYjjz0kOYov4YlYU
         LUYGd5J7JLOvnx1n9kO3Jwz6bQlmuwu5JtqecvzF0XlMroJiEAcOUZXW6pCLeKrBtxUM
         aAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701418152; x=1702022952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VMn9rCqDfnhiUaTJP3uaFyHHo69j1UfjhEXdtnLhIrE=;
        b=s5rbgt3lF9TIYBMrrAPACF1HN/96+9wNjBbc/FwyR/p3b+u/Rxc2lVXECpTIYNH8kw
         SuIUBjXrZd01HZZXTOZQVgFN0qIw+uQ+RX4+h8PSfW96e95gE8cHZNWkVVtBaMW7O6JW
         rI3VxXMkziokqEArXY6gATWqCzCUFcJNGdySuIa8TT1DgiD+pz+G6JlTOlXN3cS0lv1t
         6dXVzBVS2YHfIUxCx6gIPPJX3nKFhD4opb4j5NFo7vhvITT2/1DuhEWizf3u6S+mODxA
         ykFULPGSM6A5eOI4w51LkuC6SQvjom8JrmPVIoJY/fjTECh8UX2jCs9yE5UKpX9gbtxp
         uabA==
X-Gm-Message-State: AOJu0YzZTiGxQYd/Qi+cR4Hmk6AUf+Hh26M/DF9u6EawdgazhjlihDgi
	aofn/oZ1IhKue+6t5OaaGX1X9XecpJgQDQ==
X-Google-Smtp-Source: AGHT+IFiVbQFzSI81j+LRblXJB5NHnuBOxdzaYEefNhHhpPfHchjQhQlLmLCsOiX8d+x1J4d7w8JUQ==
X-Received: by 2002:a05:6a21:33a1:b0:18d:1790:56be with SMTP id yy33-20020a056a2133a100b0018d179056bemr7337838pzb.39.1701418152373;
        Fri, 01 Dec 2023 00:09:12 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id p30-20020a056a0026de00b006cb903ab057sm2428688pfw.83.2023.12.01.00.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 00:09:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Mark Hatle <mark.hatle@amd.com>
Subject: [meta-multimedia][PATCH] gstd: Install systemd unit into sysem unitdir folder
Date: Fri,  1 Dec 2023 00:04:41 -0800
Message-ID: <20231201080441.565612-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Dec 2023 08:09:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107184

bt default it installs into user systemd unitdir folder which can not be
preconfigured offline.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Mark Hatle <mark.hatle@amd.com>
---
 .../recipes-multimedia/gstreamer-1.0/gstd_git.bb            | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
index 88acdb190e..2068302826 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
@@ -17,6 +17,8 @@ PV = "1.0+really0.15.0"
 
 GTKDOC_MESON_OPTION = "enable-gtk-doc"
 
+EXTRA_OEMESON += "-Dwith-gstd-systemddir=${systemd_system_unitdir}"
+
 inherit meson pkgconfig gettext gtk-doc systemd python3native python3-dir python3targetconfig
 
 do_install:append() {
@@ -28,7 +30,7 @@ do_install:append() {
                 install -d ${D}${sysconfdir}/tmpfiles.d
                 echo "d /run/${BPN} - - - -" \
                 > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
-                echo "d /${localstatedir}/log/${BPN} 0755 root root -" \
+                echo "d ${localstatedir}/log/${BPN} 0755 root root -" \
                 >> ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
         fi
         ln -sf gst-client-1.0 ${D}${bindir}/gst-client
@@ -36,7 +38,7 @@ do_install:append() {
 }
 PACKAGES =+ "${PN}-python"
 
-FILES:${PN} += "${systemd_user_unitdir}"
+FILES:${PN} += "${systemd_system_unitdir}"
 FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/*"
 
 SYSTEMD_SERVICE:${PN} = "gstd.service"
-- 
2.43.0


