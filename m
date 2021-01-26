Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.19215.1611694625669810046
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jan 2021 12:57:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HytNN9OF;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id f16so3603459wmq.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Jan 2021 12:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vtu9g1vJ50aUiuhVfXu6AMqs9CC1ULAY8LWnYMcpyfE=;
        b=HytNN9OF/AaWlKLEtFttddQDb9yRxg414Hbtg6uoirf+y8lEcg2tF2LTFLa1B9nzCL
         i69uordhHKmINhFG8mRBmK+egElG70DU42Bg7FW60aZZ2HxCKxzdTHfeSog/o95t34TQ
         P8b6MC98H2cpZk9VOcdlyOT8SUTebkxcSoiYZ4SBN9U4ARCyYicBJaeyYk1rbFQb0Sqv
         ox3Dxe5pt1d8bbhsY9j9IFy7JN7BP3Nj35fPT9C+7QNDsxIMtBJ9iK40xVQZQ8CJ1LoR
         hEkI1kKcfmwhCwHHsPF8Ymf48GtlR6ozucmbfW4d1wEXcqkNkBqDDaICwBbIJjnvRX7w
         1CZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vtu9g1vJ50aUiuhVfXu6AMqs9CC1ULAY8LWnYMcpyfE=;
        b=dWeMjKje3K3JF46uEsBSCnPpywIIbwHrAIx3bGGSBQy5xb8aBIfv1gBfFS/WwzXg0/
         C5w8xjjWxaB2sMa+xjvZ8Nf/MgVMEkQXCRZCrcvVruo8JqlqxaBziYqYI4MR9vJICffk
         ZbtkBsUEgh2mixMrVjyUhJtUq1SEqvCH1/odLZtZ14pIOqa5C3BkHjvwmWI7KhWCeDiF
         xdeYYfhPZakQiEk4DySbYWrWojZ2vGt4un2dCQCBGY008EPmGVYz2wvn+oflh+mJ3dSN
         RkZ7nYUmqT5xAl5bEQBBb5vd8UWG14NJVVF9rt+SKVS8OAfC7cAmqAQoAENj9HYd3T5B
         3tvg==
X-Gm-Message-State: AOAM531mjAA7TRGJNyB2wNMAkxECzEUYw/tRJY35VLIDfjgz4fLEqu1Y
	3/xfLWBDGlxvx87Wf3By2mlFWPEV5UgwKw==
X-Google-Smtp-Source: ABdhPJzdFnWF6pgeENz7Bx/Konw3xwaKKtyHDDhfWeo0hbb+hfBmKzGaCAUXYQ/6rwmYW6EVmS3G6g==
X-Received: by 2002:a1c:a145:: with SMTP id k66mr1324215wme.18.1611694623788;
        Tue, 26 Jan 2021 12:57:03 -0800 (PST)
Return-Path: <adrian.freihofer@gmail.com>
Received: from md2ramxc.lan.ffah.ch ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id o12sm8114994wrx.82.2021.01.26.12.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 12:57:03 -0800 (PST)
From: "Adrian Freihofer" <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [oe][meta-networking][PATCH v2] networkmanager: add missing readline depends
Date: Tue, 26 Jan 2021 21:56:52 +0100
Message-Id: <20210126205652.3870967-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../networkmanager/networkmanager_1.28.0.bb                  | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.28.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.28.0.bb
index 1053bdd42..36d50668e 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.28.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.28.0.bb
@@ -62,7 +62,7 @@ do_compile_prepend() {
     export GIR_EXTRA_LIBS_PATH="${B}/libnm/.libs:${B}/libnm-glib/.libs:${B}/libnm-util/.libs"
 }
 
-PACKAGECONFIG ??= "nss ifupdown dnsmasq \
+PACKAGECONFIG ??= "nss ifupdown dnsmasq nmcli \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d), d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'wifi polkit', d)} \
@@ -85,6 +85,7 @@ PACKAGECONFIG[wifi] = "--enable-wifi=yes,--enable-wifi=no,,wpa-supplicant"
 PACKAGECONFIG[ifupdown] = "--enable-ifupdown,--disable-ifupdown"
 PACKAGECONFIG[qt4-x11-free] = "--enable-qt,--disable-qt,qt4-x11-free"
 PACKAGECONFIG[cloud-setup] = "--with-nm-cloud-setup=yes,--with-nm-cloud-setup=no"
+PACKAGECONFIG[nmcli] = "--with-nmcli=yes,--with-nmcli=no,readline"
 
 PACKAGES =+ " \
   ${PN}-nmcli ${PN}-nmcli-doc \
@@ -140,10 +141,12 @@ FILES_${PN}-dev += " \
 FILES_${PN}-nmcli = " \
     ${bindir}/nmcli \
 "
+ALLOW_EMPTY_${PN}-nmcli = "1"
 
 FILES_${PN}-nmcli-doc = " \
     ${mandir}/man1/nmcli* \
 "
+ALLOW_EMPTY_${PN}-nmcli-doc = "1"
 
 FILES_${PN}-nmtui = " \
     ${bindir}/nmtui \
-- 
2.26.2

