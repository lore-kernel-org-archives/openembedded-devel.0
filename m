Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1851E65D35
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 08:52:14 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.20073.1732265526796913462
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Nov 2024 00:52:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BFq4bd/t;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7ea8c4ce232so1809398a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 00:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732265526; x=1732870326; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7zmyigRzff104p4+ghC6f0ooCCu3aEwS34sutiqS4WU=;
        b=BFq4bd/toZlw5or4CyTPkSq4K+PmOBFCEahjLeCDYiMuqMXzR9AU48CU+2d+nfKrm9
         8KvxUtFjgudnf9lxhaU97zcvJw0MpFoGzrrEw1zdRNQvxPD+CIj27nAMkt2N2M2WQZSi
         ZWN4cT3SDWa2xvb2fbuHlbUVee2rd8pnIJ99XDEVCUxmt/fGILXD/y3mim7O5VANGxwN
         usopa7zWgCc1zBJ0nveN6FIstKjHXsvp9ci/FglWuly3DYKz/EuPpofmbHrSu9c10LBf
         kV+FYTn7EGX1ZEaDRO+hH2+Txz0WI5ifFfR85IQ1z/vdOnvT8vblHDwv6GD4GiOLzf/U
         Xdyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732265526; x=1732870326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7zmyigRzff104p4+ghC6f0ooCCu3aEwS34sutiqS4WU=;
        b=dzvU7A5p4dJqIh4UPNrAXDAV0XvivLQWfKdtliKWdrBj0dnrXJYZelXtHgFFmqyk5U
         8WDxaFBX830Qmk9olWD+twVJHiPrfMgN7hu63SC3d+a/+Wg5f0+o0bgXL0GjZ7fxfDiI
         o6bJR1GVsRPNYYbXG05xHmhTgv/kQatwtkOYB38FIxFAkEsbfDzYcMQV0CAq0GF+qtWj
         BVi2vE1KvryOICx5ZdDD1GpDetE2xcB+lknq+7ycchqHl0rTUozhxXcJUVnhEU1ADGxM
         bMxl6J3vKwv5Hb/0pxc2X88qHhMoC7VcRgHIZHLJhTBULHqVLgUuEQ6+B3c13aw98z94
         AO8g==
X-Gm-Message-State: AOJu0Yw1hnqXgAA6T9ckHaHPZDIcR1OVI6gMkPW8C9dz4pdQMBFsHxKu
	I6B3rDl8VYoJ0BLpk+Dob0Zy+YJBqe3G2DknNDzOjY/+pkJyZvxAEtAD+Q==
X-Gm-Gg: ASbGncsoKlj80nST4+4jnDbJwHhc9ezOR49MHt1LK8YXPAIGC6xPkmb87CMXOz5jhSL
	i3c+meCqTp9nYyx/vIY6htHN7JWGm4LojluWxl5G7OPT7k1tvQhnj3cNXdUZ5bTuXa3BgJWygQI
	1lGHi4FQ3zFXfPNtibxqUq0LF0RxnbNvrbDc+yx408f5GoDcGUsjMZ5AbcRQAHD3zyfcw01bBF0
	5fw+H07VdWPrgNR6FjkobgLWtWtDgbFozJ/4Pp6orVzCkjxlhg=
X-Google-Smtp-Source: AGHT+IGIorsKYaKfxW2JbTelMxuNqO3XAO4vWFVXs9g1pzsnCkxHKK7HoF0eoxY2MjHndvXIwVs4Pg==
X-Received: by 2002:a05:6a20:7486:b0:1db:eb50:abb0 with SMTP id adf61e73a8af0-1e09e3cf33emr2870613637.3.1732265525825;
        Fri, 22 Nov 2024 00:52:05 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::1dd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de45647dsm1122184b3a.2.2024.11.22.00.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 00:52:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH v2] geary: Specify iso codes xml file locations
Date: Fri, 22 Nov 2024 00:52:03 -0800
Message-ID: <20241122085203.932214-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 08:52:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113991

Do not check for these files to exist during build time, they are
needed during runtime.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>
---
 ...check-for-iso-xml-files-during-build.patch | 28 +++++++++++++++++++
 .../recipes-connectivity/geary/geary_46.0.bb  |  5 ++--
 2 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 meta-gnome/recipes-connectivity/geary/geary/0001-meson-Do-not-check-for-iso-xml-files-during-build.patch

diff --git a/meta-gnome/recipes-connectivity/geary/geary/0001-meson-Do-not-check-for-iso-xml-files-during-build.patch b/meta-gnome/recipes-connectivity/geary/geary/0001-meson-Do-not-check-for-iso-xml-files-during-build.patch
new file mode 100644
index 0000000000..ecab7155e6
--- /dev/null
+++ b/meta-gnome/recipes-connectivity/geary/geary/0001-meson-Do-not-check-for-iso-xml-files-during-build.patch
@@ -0,0 +1,28 @@
+From 474cd5a9d22ef9f25c37194d3c8ce1bc4d18102d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 22 Nov 2024 00:44:49 -0800
+Subject: [PATCH] meson: Do not check for iso xml files during build
+
+These files are needed during runtime and may exist in a different
+path ( staging area ) when cross-compiled, therefore its not completely
+valid to check for these files to exist during build-time
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ meson.build | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 87261baee..032629f5f 100644
+--- a/meson.build
++++ b/meson.build
+@@ -219,8 +219,6 @@ if iso_3166_xml == ''
+   iso_3166_xml = iso_codes_dir / 'iso_3166.xml'
+ endif
+ 
+-files(iso_639_xml, iso_3166_xml) # Check to make sure these exist
+-
+ # Post-install script
+ gnome.post_install(
+   gtk_update_icon_cache: true,
diff --git a/meta-gnome/recipes-connectivity/geary/geary_46.0.bb b/meta-gnome/recipes-connectivity/geary/geary_46.0.bb
index 6d6d9f5443..7474ee0bab 100644
--- a/meta-gnome/recipes-connectivity/geary/geary_46.0.bb
+++ b/meta-gnome/recipes-connectivity/geary/geary_46.0.bb
@@ -38,6 +38,7 @@ inherit meson pkgconfig mime-xdg gsettings gtk-icon-cache gobject-introspection
 SRC_URI = " \
 	git://github.com/GNOME/geary.git;nobranch=1;protocol=https \
 	file://0001-application-client.vala-hardcode-some-paths.patch \
+	file://0001-meson-Do-not-check-for-iso-xml-files-during-build.patch \
 "
 
 S = "${WORKDIR}/git"
@@ -48,8 +49,8 @@ REQUIRED_DISTRO_FEATURES = "gobject-introspection-data opengl"
 
 GIR_MESON_OPTION = ""
 EXTRA_OEMESON = "-Dprofile=release \
-                 -Diso_639_xml=${STAGING_DATADIR}/xml/iso-codes/iso_639.xml \
-                 -Diso_3166_xml=${STAGING_DATADIR}/xml/iso-codes/iso_3166.xml \
+                 -Diso_639_xml=${datadir}/xml/iso-codes/iso_639.xml \
+                 -Diso_3166_xml=${datadir}/xml/iso-codes/iso_3166.xml \
                  "
 
 PACKAGECONFIG[libunwind] = "-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"

