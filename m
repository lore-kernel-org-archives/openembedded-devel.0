Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web12.9987.1586757177433205560
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Apr 2020 22:52:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o25iT0QC;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id g32so4034171pgb.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Apr 2020 22:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VuvudXEVKRKzmm5uvgihDFJ8B44SSd9C4QnW3Kt7Flc=;
        b=o25iT0QCql1iZ3GjhKPtRDA4uvczvTNiQugjGEIUt9SK3us3gxIpCxjJBdxCtu4dxC
         ZmYRINAJre8rwUXQ/+CzqeaNu96vYp3yy7qNqw/EW4XPC7QSsK3yiRLC/6QEqD7v9jSm
         dL3KncVq8RDQzkXTdoCBZaa57wvGzvAJnCJESbAkvmN0Hvlo20VDlAlQ/qwu2oYtUrVc
         VHExDzPqb2JhbiP4arhTD18vJ6EybSq5eOAT0M2VC2CbUZu6W2N/37/ialqgb3xFzNyP
         lb4UzkPf63fVF5sPO1AvXrwMLNcio9LFPFkhreWoMobZ/FXghqTiRcfAXZtqb/L7yg8i
         8umA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VuvudXEVKRKzmm5uvgihDFJ8B44SSd9C4QnW3Kt7Flc=;
        b=FCtpDHK8He3iRmIrBHOB0YdzwXdt/YSIrjfuKRIK6gbCJSRDphdtl7GvV4/c2FLoaJ
         2K8cq/CamZcBKxhnqxa6lGs14T++CNkFlupt9BaUsKNkSViohc19Sd/zJxMepIvABEcs
         KggzCnTF8wcVAO7kndSR6ZGguWuBHfZhrAmrm+9Y6Cksgo3gMdBN6riYt+f8Xt55jE4n
         yvf+T5lBx43HpWxAAMUnLnY7LKFMVQrlWRkv7Tdj9O0aoLgV5pflRJVjSJ33TC4h5hkY
         WMHJAXKZ4OBX1joPh1PO6Ve/zGdsDaNHVcfnjKvysnf1dW6VlfeQLqZblTCbuOQYiML6
         90Rg==
X-Gm-Message-State: AGi0PuYB9WcmKXlyMOeQfdKimPPeN9uUaUWhdZ3WHvFVKU+NqpUe+zOS
	4ZpAjKR9a1/XuTVv0IfRdvEqxCd65hg=
X-Google-Smtp-Source: APiQypIXQvUUfFf0LZvmBp0nGuttTsi7izrniFTSC5GO2O29+/zozPw77jHbD5zWccyhMozasMHfuA==
X-Received: by 2002:aa7:96f8:: with SMTP id i24mr16351933pfq.321.1586757176402;
        Sun, 12 Apr 2020 22:52:56 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::58e0])
        by smtp.gmail.com with ESMTPSA id d8sm8125038pjx.12.2020.04.12.22.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2020 22:52:55 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 1/2] remmina: Check for x11 in distro features
Date: Sun, 12 Apr 2020 22:52:51 -0700
Message-Id: <20200413055252.1399706-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing dependency on libxkbfile
It cant be built without it since plugins CMake is asking for it
unconditionally

Fixes
| -- Checking for module 'xkbfile'
| --   No package 'xkbfile' found

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-support/remmina/remmina_1.3.6.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
index f9860a11fb..5b663489f8 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://remmina.org"
 SECTION = "Support"
 LICENSE = "GPLv2 & openssl"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dab7215512044d49037272ce1ac4ea8f file://LICENSE.OpenSSL;md5=c1eb3cee0a4dea27503c531267a69769"
-DEPENDS += "openssl freerdp gtk+3 gdk-pixbuf atk libgcrypt avahi-ui libsodium libssh vte json-glib libsoup-2.4 libvncserver libsecret"
+DEPENDS += "openssl freerdp gtk+3 gdk-pixbuf atk libgcrypt avahi-ui libsodium libssh vte json-glib libsoup-2.4 libvncserver libsecret libxkbfile"
 
 
 DEPENDS_append_libc-musl = " libexecinfo"
@@ -17,9 +17,7 @@ SRC_URI[sha256sum] = "fbed745438bb0c21467b60cbd67c8148a9289b5ebc7482d06db443bea5
 S = "${WORKDIR}/Remmina-v${PV}"
 
 inherit cmake features_check mime-xdg
-
-# depends on avahi-ui with this restriction
-ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+REQUIRED_DISTRO_FEATURES = "x11"
 
 EXTRA_OECMAKE += "-DWITH_APPINDICATOR=OFF -DWITH_GETTEXT=OFF -DWITH_TRANSLATIONS=OFF"
 
-- 
2.26.0

