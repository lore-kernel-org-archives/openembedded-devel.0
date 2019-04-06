Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1B09B7D60E
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Apr 2019 18:54:16 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id a184so9962586wma.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Apr 2019 11:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9UmH+dnZCGwXe1xwO7wbWeZhg2k9VccWRUceZchJFKI=;
	b=XEcJhDYNtAnq3GX8g4TheTrmW7nRl8N4dEXahzoZEApA83aZqLec5sMO2XpJaLruDs
	hMTbLQ7BRTSaxwze0KHE/djdRV9fF2tV2x9BWZbexFtBoIQKi+r4iC+XJ4OHbnuIrIfK
	NJLoPsBvwmuFrbRyuTFZKtXZGwJFTC87WYRK6Htn35jZac7DVtnfJ9i2nNrlf+P3AkNK
	MYeoxNzKZre+bqx/O7IT/rRdLVrxn51QfzQUqREa+QdXqMXpU631ImoI2BrdQaIBBRky
	KdWraRV1qwiisyYzU8Ld5PWRYTmxoYKuQ+NovxF8MgxIyzuJ2Hl9EVoBVw3zp3HseLuK
	4O5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9UmH+dnZCGwXe1xwO7wbWeZhg2k9VccWRUceZchJFKI=;
	b=TlyKX5afaHsR7Xrrj7LZ6pTyLpgnfTjReyXi6kOARv7uye1pJvQFRJ6Ax5uDTJrHYK
	lBhufSIrjXsocQTl1tDdQkggqj4dMc+lS11FGkIfpmVTMyxkH9XE5ifJ1RmpYnXsDeFc
	RI7NWbt9+goxn8gJCcYe4FNzo1b2n2guPQqrDpVGVu0KYFX5vrvAVZ+WVw3iiV+TmWyE
	4qGNZJHsYlAxq+WkdPTmM1BYQaGQwH6U6Sucbz2s3u1MmeXXbf5l/gAnxFIGX0G8RRUk
	Y8WGxYSboPWknKUFfIf98ox9+VhhTNHPUinRp5vQeEPYfpNosnQwqcyhvu3Qn+TSq62L
	1/VA==
X-Gm-Message-State: APjAAAXhQCJeQEnWaSjjZ54w6UOd1/StNu1ddUiUiITXMyWzbxsMRfqW
	oB8alFDgqxSD3t723NkRYtA5XoOR
X-Google-Smtp-Source: APXvYqzDN5BiPv31MyPN21CtQwZDEHP6NN+a9eOL1CCfKPqrR8RdA0fgCr51AOvRj/nmkNECebbTVA==
X-Received: by 2002:a1c:d106:: with SMTP id i6mr11475402wmg.134.1554576857625; 
	Sat, 06 Apr 2019 11:54:17 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F05D956A1EBB66B84F8FD22.dip0.t-ipconnect.de.
	[2003:f0:7f05:d956:a1eb:b66b:84f8:fd22])
	by smtp.gmail.com with ESMTPSA id
	d3sm15412681wmf.46.2019.04.06.11.54.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 06 Apr 2019 11:54:16 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Apr 2019 20:54:08 +0200
Message-Id: <20190406185408.6730-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] gnome-desktop3: Disable libseccomp for all archs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 06 Apr 2019 18:54:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It does not seem mandatory and can cause unsatisfied dependency [1].

[1] https://errors.yoctoproject.org/Errors/Details/235565/

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ild-Disable-libseccomp-for-all-archs.patch | 40 +++++++++++++++++++
 .../gnome-desktop/gnome-desktop3_3.32.0.bb    |  5 ++-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop/0001-meson.build-Disable-libseccomp-for-all-archs.patch

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop/0001-meson.build-Disable-libseccomp-for-all-archs.patch b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop/0001-meson.build-Disable-libseccomp-for-all-archs.patch
new file mode 100644
index 000000000..e93d5b674
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop/0001-meson.build-Disable-libseccomp-for-all-archs.patch
@@ -0,0 +1,40 @@
+From de0d33b068a5d8e61cc0c82d88d15b9a8aa97977 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Sat, 6 Apr 2019 18:07:17 +0200
+Subject: [PATCH] meson.build: Disable libseccomp for all archs
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+It does not seem mandatory and can cause unsatisfied dependency [1].
+
+[1] https://errors.yoctoproject.org/Errors/Details/235565/
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ meson.build | 7 +------
+ 1 file changed, 1 insertion(+), 6 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 83407b4..80eab84 100644
+--- a/meson.build
++++ b/meson.build
+@@ -53,12 +53,7 @@ udev_dep = dependency('libudev', required: get_option('udev'))
+ host_os = host_machine.system()
+ host_cpu = host_machine.cpu()
+ supported_os = ['linux']
+-unsupported_cpus = ['alpha', 'ia64', 'm68k', 'sh4', 'sparc', 'sparc64']
+-if supported_os.contains(host_os) and not unsupported_cpus.contains(host_cpu)
+-  seccomp_dep = dependency('libseccomp')
+-else
+-  seccomp_dep = dependency('', required: false)
+-endif
++seccomp_dep = dependency('', required: false)
+ fontconfig_cache_path = fontconfig_dep.get_pkgconfig_variable('cachedir')
+ 
+ xkb_base = xkb_config_dep.get_pkgconfig_variable('xkb_base')
+-- 
+2.20.1
+
diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
index bba81663d..ffd7dcea4 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
@@ -17,7 +17,10 @@ UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
 SRC_URI[archive.md5sum] = "e423ed6d648c6c4f9798fa9cd9ea8d99"
 SRC_URI[archive.sha256sum] = "a6393dc5fc29fc0652ac84c73b3da205d0b0168128c4cf6d27797a08f3d07b54"
 
-SRC_URI += "file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch"
+SRC_URI += " \
+    file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch \
+    file://0001-meson.build-Disable-libseccomp-for-all-archs.patch \
+"
 
 DEPENDS += "itstool-native gsettings-desktop-schemas virtual/libx11 gtk+3 startup-notification xkeyboard-config iso-codes udev"
 
-- 
2.20.1


