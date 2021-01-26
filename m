Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.218.1611700754555580419
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jan 2021 14:39:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pfk5Lu3/;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id g10so48381wrx.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Jan 2021 14:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O5fwyHS/wShBs7iJCkg0Nn/K/FIwyhQ+6j13zUGydQU=;
        b=pfk5Lu3/MRfGejiX66FsQoR1vuUbkvlRmCZFOeMcIEJKlRQRyVO0L+5rAnXUMKwrfE
         I/jZ/BtPhIxtyEuBVtmBR+Md9jnMUxAW7CKYorsy28NlFMitXr3VZVbW44IASKzk8S2y
         VTz+ZgLSfmUDYZP8TfBlos5QvYHotQVBWr1up7y5SC+o4EtzOe7km5Ea21mDSrgxWUGA
         m9ch7usBr3E74PT4Rq0FfflAnGI1vfEwiEotBlGRrtrD/B8Ulc1pF2I4TvO0qPaouF71
         2WW+QVUGKBg5R6mmuX9LY9Epie27GOfVrL8WgakDQqFxs0ccFDdeIW4O50mOVo04mudK
         oHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O5fwyHS/wShBs7iJCkg0Nn/K/FIwyhQ+6j13zUGydQU=;
        b=gTDeI8iUGxmomTeQVuheKTr+TLBTIKXo8PgyFFRmqAnKv25nRIQ2DhMlVkK+yiEq11
         5JnCp4w5noL/q4att54QtcQPdAKdF8L0E6lxqIrEK0o0mEWxgMF/dgtknYUlqJbHGu2W
         X0j1NuQtGQLh0KzgLXPIWQFgrEHKQi5m/yXz5Jd90A7YBoSx8aogAkhuCJX5Sx0WXI/v
         PAo3m7osTdbcr0zBF323mEkb71prAwVngufkkmpvRZPmHuyyaj3Mh9x6N+imL3WtFsrB
         arfQQq0Y7Kj3w1JKcmb+2WbiOPuMQhkYp0XXc7Px7vuGypGD35nSgFm0mz9cW1Xc6Bt8
         dOOg==
X-Gm-Message-State: AOAM532XA0Utt7rc6AV0SpXa3pcR/n2EoFshKcQVkhNUAG3Da4iXPMUh
	s+Zhp8hmyrICuBTuNdXLpCuKdeT5ahe/pw==
X-Google-Smtp-Source: ABdhPJxJs/qwBe/uzGnaDzc6Q6LfSB3QjxyEIy8dmtaMue/K8rbzYcnEP54zepgkc1mqLaaXbyxuFA==
X-Received: by 2002:a5d:4c4f:: with SMTP id n15mr8472046wrt.124.1611700752939;
        Tue, 26 Jan 2021 14:39:12 -0800 (PST)
Return-Path: <adrian.freihofer@gmail.com>
Received: from md2ramxc.lan.ffah.ch ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id u16sm198886wrn.68.2021.01.26.14.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 14:39:12 -0800 (PST)
From: "Adrian Freihofer" <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [oe][meta-networking][PATCH v3 1/1] networkmanager: add missing readline depends
Date: Tue, 26 Jan 2021 23:38:56 +0100
Message-Id: <20210126223856.264908-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210126223856.264908-1-adrian.freihofer@siemens.com>
References: <20210126223856.264908-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce PACKAGECONFIG[nmcli] to make building the nmcli utility which
depends on GPLv3 licensed readline library optional.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../networkmanager/networkmanager_1.28.0.bb               | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.28.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.28.0.bb
index 1053bdd42..2fedb66cd 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.28.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.28.0.bb
@@ -19,7 +19,7 @@ DEPENDS = " \
     curl \
 "
 
-inherit gnomebase gettext update-rc.d systemd bash-completion vala gobject-introspection gtk-doc update-alternatives upstream-version-is-even
+inherit gnomebase gettext update-rc.d systemd vala gobject-introspection gtk-doc update-alternatives upstream-version-is-even
 
 SRC_URI = " \
     ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
@@ -62,11 +62,14 @@ do_compile_prepend() {
     export GIR_EXTRA_LIBS_PATH="${B}/libnm/.libs:${B}/libnm-glib/.libs:${B}/libnm-util/.libs"
 }
 
-PACKAGECONFIG ??= "nss ifupdown dnsmasq \
+PACKAGECONFIG ??= "nss ifupdown dnsmasq nmcli \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d), d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'wifi polkit', d)} \
 "
+
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'nmcli', 'bash-completion', '', d)}
+
 PACKAGECONFIG[systemd] = " \
     --with-systemdsystemunitdir=${systemd_unitdir}/system --with-session-tracking=systemd, \
     --without-systemdsystemunitdir, \
@@ -85,6 +88,7 @@ PACKAGECONFIG[wifi] = "--enable-wifi=yes,--enable-wifi=no,,wpa-supplicant"
 PACKAGECONFIG[ifupdown] = "--enable-ifupdown,--disable-ifupdown"
 PACKAGECONFIG[qt4-x11-free] = "--enable-qt,--disable-qt,qt4-x11-free"
 PACKAGECONFIG[cloud-setup] = "--with-nm-cloud-setup=yes,--with-nm-cloud-setup=no"
+PACKAGECONFIG[nmcli] = "--with-nmcli=yes,--with-nmcli=no,readline"
 
 PACKAGES =+ " \
   ${PN}-nmcli ${PN}-nmcli-doc \
-- 
2.26.2

