Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A428D116F5
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 16:17:18 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22135.1764260236504486399
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Nov 2025 08:17:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B8xc3s6a;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47118259fd8so8582605e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Nov 2025 08:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764260235; x=1764865035; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FbBjs7bEGq8SVJ2KrhnHUc2/foOEdSQ0F252krDetQk=;
        b=B8xc3s6ahQaUvYpMHaInHEHbkh8/Shk80duJE4k3SL1TTr7qPM/hCcw9lO6H0/f1lf
         r6ungk24YcO+3k79ArSO3lXFmWjpT9eYBPcxqWThxwnuUHbrKQNAEa5salAcN2CXgIyz
         CCYisybrgaNfHGX40GXxaVktKY6FaIeREbSTwwPPkL+gwLhxHiBnvnfiG/NUPdgFnpH7
         MomoPq0Ekdp2ldOZeYZN8i6FSIdqpmx05L8JePuzs8FTt1yD2oK9xNZdCSGa/4ai9b1F
         eIgPhbgOyaOSygJturS5WnhzlbK5fKA0rYWlE/T9u0fwxD7Cn4MC7SPcr/d1pVr89Ytx
         8aew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764260235; x=1764865035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FbBjs7bEGq8SVJ2KrhnHUc2/foOEdSQ0F252krDetQk=;
        b=G2w+bUZlOBKXZOM1JVPHpHcZ4zzPxcK3SkdptyaHz1qFuBvb8ivm1v15sjZLbIuwcW
         hXImu9fadkOM4/Qaebdp/14BVpOPGC8MqC0QCUy0RQLR/m/eSNKa5muL8TZjPF4ljTpx
         liXGDXhZeQkxW61JhyWncbzr2OBFaS2PseBjRH19ZUuNIqkPUCeC4TLZgnF5pxQWuRVm
         utokvOa0IfQlN9IZWKqIb/g2v6yAJ8Y2v9X7jb19t1mUcmWnvzpLLXay2FFMupo0BH3C
         04p2ooLTbYiUg4yj5IjVcA4oijJIG9HE2+s1QwZClPu3vF/z9tn4GaStfEEh182SnV0i
         vT9w==
X-Gm-Message-State: AOJu0YyhqirPJeNdAUsp7oObZ6vRGT8Rue/E28JVICCn9Q7ZzLSSLeYl
	yfl3LoEmqQfMIJo4ZTlFjCFCZqMLuXPnBkR+lEGaSaOh6mAuwzVgALaUANr02w==
X-Gm-Gg: ASbGncsOdo8hO8RR6k+trB07A86UdCD7ljeGTGIKT8JJ+5qn+wu0v7q26wS5zEVrJOY
	9vNEu1/fV9XU2H9gE4b2/59vJw4NVAgqJqA0yU+Y0HugCKy6Db/BdJEWbK3jfM+7sO3ER6nD3As
	a6eHmA+cNG7LxOla73XJIkeH7etfiqUGiD30mEmtu6Y8KOtBGcj6qLJPHF920Jr4GIvheZDaoYl
	Z0oftoUI6w5W4xQftC/M4ROF4CD0ibk3SQTHJzz3dfoqemweQx/r7RD1KuI8U+CWzVvEzYzXPC+
	hScPTPYOweE2y11pheH1Q2N8QjNrGPwICYIx1V8OKXLC2U9yJ+tvSubtVdKGStz6ITdJQjaXw0B
	XzPs00SEWn2GJXbZUuJ46HG0Ib7HpkMph+sqNv7IHvH+KMON1mQMdxd8UxnNKPNMT5QAlYcyzmn
	pw0C+jolcrSabEpa9X+24=
X-Google-Smtp-Source: AGHT+IFcPZiMr/aWl8LggTnsGu4G9LYUaEmq3+OrtcOJ/umyy0c1eMjxLrO0zHvQzWVzVxwenTPTLg==
X-Received: by 2002:a05:600c:3545:b0:477:7ab8:aba with SMTP id 5b1f17b1804b1-47904ac3ca4mr100327565e9.1.1764260234753;
        Thu, 27 Nov 2025 08:17:14 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479040ac7e8sm75263665e9.1.2025.11.27.08.17.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 08:17:14 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/3] dbus-broker: rework EXTRA_OEMESON opts to PACKAGECONFIG
Date: Thu, 27 Nov 2025 17:17:11 +0100
Message-ID: <20251127161711.2341194-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251127161711.2341194-1-skandigraun@gmail.com>
References: <20251127161711.2341194-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Nov 2025 16:17:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122112

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-core/dbus/dbus-broker_37.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-core/dbus/dbus-broker_37.bb b/meta-oe/recipes-core/dbus/dbus-broker_37.bb
index c531f555d2..ae9c8f2fcd 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_37.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_37.bb
@@ -6,8 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7b486c2338d225a1405d979ed2c15ce8"
 DEPENDS = "\
     expat \
     systemd \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'audit (>= 3.0)', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'libselinux (>= 3.2)', '', d)} \
 "
 
 SRC_URI = "https://github.com/bus1/dbus-broker/releases/download/v${PV}/${BP}.tar.xz \
@@ -23,9 +21,11 @@ SYSTEMD_SERVICE:${PN} = "${BPN}.service"
 
 inherit meson pkgconfig systemd features_check ptest
 
-EXTRA_OEMESON += "-Daudit=${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'true', 'false', d)}"
-EXTRA_OEMESON += "-Dselinux=${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'true', 'false', d)}"
-EXTRA_OEMESON += "-Dtests=${@bb.utils.contains('PTEST_ENABLED', '1', 'true', 'false', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'audit selinux', '', d)} \
+                   ${@bb.utils.contains('PTEST_ENABLED', '1', 'test', '', d)}"
+PACKAGECONFIG[audit] = "-Daudit=true, -Daudit=false, audit (>= 3.0)"
+PACKAGECONFIG[selinux] = "-Dselinux=true, -Dselinux=false, libselinux (>= 3.2)"
+PACKAGECONFIG[test] = "-Dtests=true, -Dtests=false"
 
 REQUIRED_DISTRO_FEATURES = "systemd"
 

