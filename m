Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.1314.1597271988586652582
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 15:39:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RxqlDVmo;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id bo3so4009799ejb.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 15:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zTGDkA5DH4UKcBX3FAjGAg77g5AJHVXNnqK6oT3yKyE=;
        b=RxqlDVmoS7W7Q39+MI839en1OFzPXk/67q5YzakylwQfBeSA4ujVW+O3a0PlPvoSBV
         ly36pUHfe/22ims+1J1GmNUZe/EzwdjIsfZ4gbc1hcj3QhzZ/hUBOUgwFz87EHSPkTRY
         7rCAQNBlvW4/5DH1iaqMoihdkzgY577HEXaDWhARAMig7aCA83TaH4DiOlXcMxooH5b3
         BS4nsbeBrvWfDRUoZhqJkD7OVl2Af8sHOGDjJyUDg1mvCTFoHSXdywVf/YPigcF4IrTX
         AWw1BTNQEpJwiIsfOx+IR/IYQm+u+2jRNLyMCGyMqR/5jkWpCzLnCB2ZT3peFV0KvYA6
         GW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zTGDkA5DH4UKcBX3FAjGAg77g5AJHVXNnqK6oT3yKyE=;
        b=tbD8xydSBLWAbZQ5T9DtddcN5F6Df3/V4JtfrRQjVOI2GQ9A0UplSmLKCmuWEcOxSk
         e7vhLdbeAnQuwkH1NYchGGALFKF36SqXjj0jjd9b9uFe6mP61ZWww7rYDZjFMfL5Vg/i
         3yzaE9tgi7GFYSZXBhOKhWj4J+Aa57e2eQWNcvaAMk32h1Aa+95ugL8lC6ey2Igtl/vR
         rJVHjwmKFaHVFI+Y9S9PUG825SGtViowe9yxCYYK1o8zaNCKIVuGHZQQlbZlaEwMO8cx
         mgIwnoSfSQ49uj3ug8MTZqTMuvn1UXYdYcgHZhpe++WMzcON+e+YhhG036mFl12TgO1O
         U6Cg==
X-Gm-Message-State: AOAM5308wGF7x/K72X0OcIyxfZwooWVPCGTQD4qlwmpm5h/ATrmgebY3
	wrY7r0xrEgrd5qulH2qf+FgAz6Rh
X-Google-Smtp-Source: ABdhPJw+IqHoWZrzk7YsPHajvIerlnZMeL2/WcTf/xiEnuBjDP8AKQezXHlMc0k8I317NoHRViVHtA==
X-Received: by 2002:a17:906:7715:: with SMTP id q21mr2009783ejm.251.1597271986823;
        Wed, 12 Aug 2020 15:39:46 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f147e04a6500bbf92bdd781.dip0.t-ipconnect.de. [2003:f0:7f14:7e04:a650:bbf:92bd:d781])
        by smtp.gmail.com with ESMTPSA id ci27sm2569208ejc.23.2020.08.12.15.39.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 15:39:46 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 6/8] gnome-disk-utility: re-add 3.36.3
Date: Thu, 13 Aug 2020 00:39:31 +0200
Message-Id: <20200812223933.1119785-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200812223933.1119785-1-schnitzeltony@gmail.com>
References: <20200812223933.1119785-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gnome-disk-utility_3.36.3.bb              | 34 +++++++++++++++++++
 .../packagegroups/packagegroup-gnome-apps.bb  |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_3.36.3.bb

diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_3.36.3.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_3.36.3.bb
new file mode 100644
index 000000000..08fd96472
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_3.36.3.bb
@@ -0,0 +1,34 @@
+SUMMARY = "GNOME disk utility"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SECTION = "x11/gnome"
+
+DEPENDS = " \
+    gtk+3 \
+    libdvdread \
+    libcanberra \
+    libnotify \
+    libsecret \
+    libpwquality \
+    udisks2 \
+"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase gsettings gtk-icon-cache gettext features_check upstream-version-is-even mime-xdg
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+
+# As soon as elogind is of interest this needs rework: meson option is combo
+PACKAGECONFIG[systemd] = "-Dlogind=libsystemd,-Dlogind=none,systemd"
+
+SRC_URI[archive.sha256sum] = "dd033d3f36ab070bc72317cf3045e5b4927765543f1bce7612b2c7f96595167a"
+
+FILES_${PN} += " \
+    ${datadir}/metainfo \
+    ${datadir}/dbus-1 \
+"
+
diff --git a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
index 2d2d6b599..1f450fd9d 100644
--- a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
+++ b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
@@ -14,6 +14,7 @@ RDEPENDS_${PN} = " \
     ghex \
     gnome-calculator \
     gnome-calendar \
+    gnome-disk-utility \
     gnome-font-viewer \
     gnome-photos \
     gnome-terminal \
-- 
2.26.2

