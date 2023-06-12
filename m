Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE4FDC7EE2E
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 18:43:14 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.68435.1686595393408681345
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 11:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=D0KbKbBI;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-652a6bf4e6aso3718973b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jun 2023 11:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686595392; x=1689187392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhx57ADwnJaqgfXd+bJ6h01g5jZ3VYfGVR8zkqetung=;
        b=D0KbKbBIvGmlB2rg6ePm9dD54R/XRVgKSndeSmKjBLwQ1VzgQ4umSqcVZgIeBDyt+A
         Qz01sE3fs6eSc0Vx3pvQm8JZUGqaljjYrryyYtbCeXtoOqDDUxS/bqtECcEGwbNEAkpB
         O3bfj85f4hkOO7ocFzP0XZs0gyZXdYxEImeKsJ9mahtEVmZ0PXcDkpwiRFEybEZ3Vtja
         f3C/rn2eRNAi+PvYrVCMRheUGXAylqvylHujSNhUNPQ8Z7Qqn9BWjmR7eFd/ULDto8q2
         8S/xOafh3Z2sM0O+0JdDG8NBz0QdPlrALmaLOXFUcu5PQoEDFvdVyAhqeBHBQ/iAY5OQ
         Hasg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686595392; x=1689187392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhx57ADwnJaqgfXd+bJ6h01g5jZ3VYfGVR8zkqetung=;
        b=SZ5IM7XSeeYgFc9WVDICkbqpFWm3g6tlZoAS2/w0c9ILfI7ThqrptUOagRw+UtghLK
         P9wE32xVibD+oMctrQqickko3PJqFmgybilLBsOJtmfyM5d9tJXRNZTPlapU5BarerPS
         xMOK+sMM9OLxZGMt3SRNLQ3JonL8ArxJvQpV58i1wCAwbu3PEur/kOh8ewon+uwA5TZT
         wckKpDrflQQ+wU/wMBPHe75Z9Y3eXci7PN2C6zD157VSYHmA73uRVnNI74+A+zsUXZc2
         UV2PIdVN4bPbaRsbIZyQJz86PC2+ioeVo4LqY/8AAGAsgHJLj7rTBVYYhhGH7F+96Fp6
         8VkA==
X-Gm-Message-State: AC+VfDwGh81BpZIHHNd/LEj20N+nBQIGaDhH7H8+RGDiWWumN17yA0ru
	gvG7Z5l/wXHSye5dkVqAcjeJLC7DgQE=
X-Google-Smtp-Source: ACHHUZ62IPVZn0nY9QdfHZBtsCKlkY38HTMo9WYLq+mOUhgS/CflPm8/dI/fwdjg3g0R5nRFmSx1Mg==
X-Received: by 2002:a05:6a20:2445:b0:117:6b17:106f with SMTP id t5-20020a056a20244500b001176b17106fmr11355368pzc.11.1686595392478;
        Mon, 12 Jun 2023 11:43:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::eb87])
        by smtp.gmail.com with ESMTPSA id s18-20020a63ff52000000b0054fa8539681sm520190pgk.34.2023.06.12.11.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 11:43:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH 3/3] xfce4-sensors-plugin: Use bfd linker instead of lld
Date: Mon, 12 Jun 2023 11:43:09 -0700
Message-ID: <20230612184309.1556169-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230612184309.1556169-1-raj.khem@gmail.com>
References: <20230612184309.1556169-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jun 2023 18:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103219

lld linking fails
| aarch64-yoe-linux-ld.lld: error: undefined symbol: gtk_sensorstacho_new(GtkOrientation, unsigned int, SensorsTachoStyle)
| >>> referenced by actions.cc:143 (/usr/src/debug/xfce4-sensors-plugin/1.4.4-r0/src/../../xfce4-sensors-plugin-1.4.4/src/actions.cc:143)
| >>>               xfce4_sensors-actions.o:(refresh_tacho_view(xfce4::Ptr<t_sensors_dialog> const&))
|
| aarch64-yoe-linux-ld.lld: error: undefined symbol: gtk_sensorstacho_set_color(_GtkSensorsTacho*, char const*)
| >>> referenced by actions.cc:146 (/usr/src/debug/xfce4-sensors-plugin/1.4.4-r0/src/../../xfce4-sensors-plugin-1.4.4/src/actions.cc:146)
| >>>               xfce4_sensors-actions.o:(refresh_tacho_view(xfce4::Ptr<t_sensors_dialog> const&))
| >>> referenced by callbacks.cc:197 (/usr/src/debug/xfce4-sensors-plugin/1.4.4-r0/src/../../xfce4-sensors-plugin-1.4.4/src/callbacks.cc:197)
| >>>               xfce4_sensors-callbacks.o:(list_cell_color_edited_(_GtkCellRendererText*, char const*, char const*, xfce4::Ptr<t_sensors_dialog> const&))
|

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.4.bb b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.4.bb
index 69996d2a3f..eb1165c578 100644
--- a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.4.bb
+++ b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.4.bb
@@ -13,6 +13,8 @@ EXTRA_OECONF = " \
     --disable-xnvctrl \
 "
 
+LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' -fuse-ld=bfd', '', d)}"
+
 do_configure:prepend() {
     sed -i 's:LIBSENSORS_CFLAGS=.*:LIBSENSORS_CFLAGS=-I${STAGING_INCDIR}:g' ${S}/configure.ac
 }
-- 
2.41.0


