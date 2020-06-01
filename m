Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.48776.1591047952059879130
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:45:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n6ofmKzL;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id k26so1012987wmi.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=G3hokJZOT1vETifo3+HpQJTNURARxvGB9YUGDEnHDFY=;
        b=n6ofmKzLvdItc+0OIBTU/U75WTETHQzzz3S1dshCxSfbmMXmNm6mmyOraqJg/sIZXg
         dAf2YdpUbUTCnGYT7SqO+ikt1ODUs+XMHH6anJItD/LIUxGJOCoFC5XcL0pbvY7HMjMQ
         o8mB8thjl5UC/dRxdb1/IO6SVHWPC82VC5HtCvaclnundQJzCbrdup+TACUrqZK6ZxOR
         ZBOmYnzunS2mim/ls4ijDNS1+it/kpmlbMXeqEiL81R1P4w+2N6w8RQOMy7eSCk5CAgy
         mXk9ea76+W/nQPO6JyVutK/bVGc31Nrsr3cFtMFOyiIYH7qOgGDSEsQVvDUW5IPtNVA0
         8AYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G3hokJZOT1vETifo3+HpQJTNURARxvGB9YUGDEnHDFY=;
        b=kcxrufbipLgcgyA3EnixU/7s+9qvWcyEsbRxHy1C49Cymfy7pXb/IgZVAU4BXzZFd9
         AZZOgn1LiBh2D7W13tKpzk1Xy2HSov0TYsb20NdG2GryKjvCUGCnPplEWC7ClNd1O5lt
         5qjXF1VdCbV64SvdSIVYm+ybaFzwdWn1hSDXWPSwKYkFTKXu7LS9MyxAPHELe4rKsnYk
         4pCg1jXcsJovA8JW7ip9EX9I0eKIi5fnLyFC6NTnsQCm4nJxW0ESd7WiKsx/W/595m7S
         aaRcMB+Bz1+15olh0bhePmrG0/vNdUCQAZDDozJ0sVhsZrFVVRG88qsBqoRKPRF5G5Vt
         7xkQ==
X-Gm-Message-State: AOAM530GE1Xb4s6FxUOHTEucVPR2CsMFvCPIbodEYUuCV5nBsiIx7cEA
	H9vJn/8AxlFT0e0XeMeOujS7uH2XyeM=
X-Google-Smtp-Source: ABdhPJybSLZb6iltuyF7n5wfXO0r4jccPkn8i+TKv4vzfL/ksjBDlbWdiHcqEe+kDtR5eS5ql1cJTA==
X-Received: by 2002:a1c:a943:: with SMTP id s64mr1105303wme.103.1591047950359;
        Mon, 01 Jun 2020 14:45:50 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.45.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:45:49 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 23/38] gnome-keyring: upgrade 3.34.0 -> 3.36.0
Date: Mon,  1 Jun 2020 23:45:01 +0200
Message-Id: <20200601214516.26624-24-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes in version 3.36.0 are:
 * Updated translations

Changes in version 3.35.90 are:
 * Use shorter strings for prompt titles [!30]
 * pam: Provide more insight from pam_gnome_keyring about unlocking [!28]
 * Don't use GTimeVal/g_get_current_time() [!26]
 * Don't use g_type_class_add_private() [!26]
 * Build fixes [!29]
 * Updated translations

Changes in version 3.35.1 are:
 * dbus: Implement secret portal backend [!18]
 * Updated translations

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{gnome-keyring_3.34.0.bb => gnome-keyring_3.36.0.bb}     | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-keyring/{gnome-keyring_3.34.0.bb => gnome-keyring_3.36.0.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.34.0.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.36.0.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.34.0.bb
rename to meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.36.0.bb
index 52c254b28..8f318bb15 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.34.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.36.0.bb
@@ -21,8 +21,8 @@ inherit gnomebase gsettings features_check remove-libtool gettext upstream-versi
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.md5sum] = "7c8fd85e46ed4ba1add0288b2ead9aec"
-SRC_URI[archive.sha256sum] = "e9cda9542a3e37c61636145e7e9e2513c569092ea8020752a834e1f40ad41943"
+SRC_URI[archive.md5sum] = "38f0732845a510a8dff4f154c3406f65"
+SRC_URI[archive.sha256sum] = "a264b57a8d1a71fdf0d66e8cd6033d013fb828be279c35766545eb9bb3734f87"
 SRC_URI += " \
     file://0001-Set-paths-to-ssh-agent-and-ssh-add-by-configure-opti.patch \
     file://musl.patch \
@@ -39,6 +39,7 @@ EXTRA_OECONF = " \
 FILES_${PN} += " \
     ${datadir}/dbus-1/services \
     ${datadir}/p11-kit \
+    ${datadir}/xdg-desktop-portal \
     ${base_libdir}/security/*${SOLIBSDEV} \
     ${libdir}/pkcs11/gnome-keyring-pkcs11.so \
 "
-- 
2.21.3

