Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E6C3C5AE5E
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 08:52:02 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.8002.1700211117503554976
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Nov 2023 00:51:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ewxoxav7;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-54553e4888bso2444363a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 00:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700211116; x=1700815916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7BeIIutMrghopb5lvJpWPTl9JLE4KnyjnqiHK612w80=;
        b=Ewxoxav7g/aDuTzA0at5vzusOoXzyMoP09Q99+Jdm5RcfEzuLSgSTri7DuVAWHwpmk
         QzYv6Coc0kLLCQPiWrQ6iINNb05QcPlzgEHWRJUjeAFrZ5w4EZwnyxNHlphWbG/nAjIF
         AMLxXkkAgAtHBY0scgfwp9i0bE2wy0qKumsqxcTIuYDvpM3BNA30mLzHnQH7Akwx2JE0
         Y+RmdHilAFwXF+I2ynt/LDUkP0AUaF/MkM30U4muROMLqHncLijiv3IogwBdke0Kzb0H
         Vy9kK2Brrxo2OAWi1WXNOfCzw8KsVqmjUv67b4QJhAtfYhmP7dYoU2sfNKP6yg7k/LY1
         mH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700211116; x=1700815916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7BeIIutMrghopb5lvJpWPTl9JLE4KnyjnqiHK612w80=;
        b=J69ybiqudM5Msx3KS+tSTng2prV0k6KjKIz/pYyrA4F12oRQTvua8ORgsf/HXwm6pU
         jFA/aqMS4r188NehM0axVU7Kv4UcYvk3gydHQ1M+CpE3LEOn5sHvMGKU8FhV8HGktk6r
         0jlTjv95WhvMbaG+tPz8t7Z4jecPP/ziyNvbumDzEROcsBkhZ2AH0NVLqNfNTmxANcqU
         qYPjIELMDB1/nyvxhPaxM2eJmptwQLbl75SxKKO/Lj8nMYWShiV8xTbDM6xYL7wDsI58
         Y56iK+XIKh00pITNXnU4bzxaBpRQ9r9JCdAkgDRTn5K6k3MBN0HLwMs2lZwFG8yvfJk9
         7E2Q==
X-Gm-Message-State: AOJu0Yx0qknffJYDWQbsdUfM5hllVNeTOGK7S7M5QmDpDIo8/PVttHz4
	hjf27p5oZ6klQTGyX6NnPkETH9qJFnU=
X-Google-Smtp-Source: AGHT+IFOPTv/QH1aZnbGGoKssNnYhyNDAFcMMgDilJqaOAKxfuOLIIHJ2F06q93HoncZVxGIwj5UfQ==
X-Received: by 2002:a17:906:c0d6:b0:9bf:388e:8e93 with SMTP id bn22-20020a170906c0d600b009bf388e8e93mr14906956ejb.0.1700211115988;
        Fri, 17 Nov 2023 00:51:55 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id k26-20020a170906681a00b009dd678d7d3fsm545961ejr.211.2023.11.17.00.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 00:51:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 8/8] evince, gnome-calendar, tracker: drop ${PE}, ${PR} from /usr/src/debug paths
Date: Fri, 17 Nov 2023 09:51:43 +0100
Message-ID: <20231117085143.3813216-8-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231117085143.3813216-1-martin.jansa@gmail.com>
References: <20231117085143.3813216-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 08:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106857

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-gnome/recipes-gnome/evince/evince_45.0.bb                | 4 ++--
 .../recipes-gnome/gnome-calendar/gnome-calendar_45.1.bb       | 4 ++--
 meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb             | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evince/evince_45.0.bb b/meta-gnome/recipes-gnome/evince/evince_45.0.bb
index e2c6b3b826..8b40241751 100644
--- a/meta-gnome/recipes-gnome/evince/evince_45.0.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_45.0.bb
@@ -46,8 +46,8 @@ RRECOMMENDS:${PN} = "adwaita-icon-theme"
 PACKAGES =+ "${PN}-nautilus-extension"
 
 do_install:prepend() {
-    sed -i -e 's|${B}/../${PN}-${PV}|/usr/src/debug/${PN}/${PV}-${PR}|g' ${B}/libview/ev-view-type-builtins.c
-    sed -i -e 's|${B}/../${PN}-${PV}|/usr/src/debug/${PN}/${PV}-${PR}|g' ${B}/libdocument/ev-document-type-builtins.c
+    sed -i -e 's|${B}/../${PN}-${PV}|${TARGET_DBGSRC_DIR}|g' ${B}/libview/ev-view-type-builtins.c
+    sed -i -e 's|${B}/../${PN}-${PV}|${TARGET_DBGSRC_DIR}|g' ${B}/libdocument/ev-document-type-builtins.c
 }
 
 FILES:${PN} += "${datadir}/dbus-1 \
diff --git a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.1.bb b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.1.bb
index bcc19fbedd..99cb9f67e7 100644
--- a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.1.bb
@@ -25,8 +25,8 @@ REQUIRED_DISTRO_FEATURES = "x11 opengl"
 SRC_URI[archive.sha256sum] = "7fa8507543865aa7432bb5319830c87158b5447ca09cca45b607dc6796c71008"
 
 do_install:prepend() {
-    sed -i -e 's|${S}/src|/usr/src/debug/${PN}/${PV}-${PR}/src|g' ${B}/src/gcal-enum-types.h
-    sed -i -e 's|${S}/src|/usr/src/debug/${PN}/${PV}-${PR}/src|g' ${B}/src/gcal-enum-types.c
+    sed -i -e 's|${S}/src|${TARGET_DBGSRC_DIR}/src|g' ${B}/src/gcal-enum-types.h
+    sed -i -e 's|${S}/src|${TARGET_DBGSRC_DIR}/src|g' ${B}/src/gcal-enum-types.c
 }
 
 FILES:${PN} += " \
diff --git a/meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb b/meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb
index e7f0beb02e..c5b5c4eabc 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb
@@ -44,8 +44,8 @@ EXTRA_OEMESON = " \
 "
 
 do_install:prepend() {
-    sed -i -e 's|${B}/../${PN}-${PV}|/usr/src/debug/${PN}/${PV}-${PR}|g' ${B}/src/libtracker-sparql/tracker-sparql-enum-types.c
-    sed -i -e 's|${B}/../${PN}-${PV}|/usr/src/debug/${PN}/${PV}-${PR}|g' ${B}/src/libtracker-sparql/core/tracker-data-enum-types.c
+    sed -i -e 's|${B}/../${PN}-${PV}|${TARGET_DBGSRC_DIR}|g' ${B}/src/libtracker-sparql/tracker-sparql-enum-types.c
+    sed -i -e 's|${B}/../${PN}-${PV}|${TARGET_DBGSRC_DIR}|g' ${B}/src/libtracker-sparql/core/tracker-data-enum-types.c
 }
 
 GIR_MESON_ENABLE_FLAG = 'enabled'
-- 
2.42.1


