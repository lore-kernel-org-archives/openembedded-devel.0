Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E652CA1012
	for <webhook@archiver.kernel.org>; Sat,  6 Sep 2025 15:19:02 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.397.1757171935369571708
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Sep 2025 08:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RWrv+cQI;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-625e1ef08eeso672633a12.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Sep 2025 08:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757171933; x=1757776733; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Eb3BtyAPRtrrKS1kmTTgpoH8U4w9tdqHexcatupNK1I=;
        b=RWrv+cQIn/oSAS2n9QoKXXAIC/48atVNtPUdRm5jEssvzX79lYwEHvhgcIiaiWXmwD
         V63rpKNX2dya2OWlENvFTZxYbr4mq5092mvNNaYZL3cZ29r2ZE2fHsMud5bCBdJYeJ2g
         s5/FLXlQRXv/v8nsM9SxqhnQxzmHPxOdT00SXOM2DhyIgoh+PnNrslMtxMu0wF8E4Jd8
         L7N8sO2O77Gb90CTI1t2+Ay1LZgRQlaGBDuzdpAwQVM521DC0PNluSUKLBkRfdeoRWvb
         j/oGOfHRKfVCUzjSfCQivhp4m6ZjITI0gEB3Ijo0Zs+wluXdgqIfOoa8fxPNQ1s1rYGY
         ihtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757171933; x=1757776733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Eb3BtyAPRtrrKS1kmTTgpoH8U4w9tdqHexcatupNK1I=;
        b=bNzb61ZhURCZUQHUB95oiZYrfdeVpzgbj5+axwfp4dgaRCeeNhvrDdt36SBg+sMe6F
         uS8gud1ZoUxFl5XxTqzWEwYPgS0PZHlrMZhb+1cS5qs7GjYehfVYfaYG5WmbnfFqs0XY
         KmWCj5ppH9hFdmXp5jci8Mvroi0U/P/1F3R6Rywtmx3Xiwv0wq4LjBbsg3MqEK2Liecb
         0jRoHGcXqQMZ4t+WpW08hAG3EIlimC5QIII3+OEgBSHhhqtcvlnL0xo2rA6usCpg2gGF
         maoEdvGQSpH6oUkOHjGtfzapDeNGLH+Dy5qRoKpiDiK1QiAxF7ASx3kn8DUXZO3o/Tu/
         dGMQ==
X-Gm-Message-State: AOJu0YxrMrK3mepnRjiN4QLpmcXkWWWtXLiiWdx2g+4UCib6KiYNx7/F
	jiO5g6ESvX8581P8A0euFB4ley1j7dKtXQMBKvAeGFJLL7c20vRj0NSM5i4/QQ==
X-Gm-Gg: ASbGncu3Kfzuo9J2axxgsz/FpqQQAixl3T/Tse33kxe6DThndh3ROpDw2pdcpTFUI47
	j9NR9i7EOEmKMSnZMZCB6qB2YveahrbA3Ot9IMBgunRmM6ir0TTL7nqQ7TJNnvQsr+9EOBIoUpu
	Qp2HtPzUVPRRukZuSJHM1aCwJKu6XRzNyxthiOh+U3OM6VMlLd7l626aPL3S2DESJMlZ1HvVJw1
	qPYqUqckzK+G7hYgfjd08vMDsO6EQG0DrDZNsctz9bE5xN8EiQHAQg9/z6ycOnV7moAFNWcYKti
	bcBFEtrF+athHNEfiWG2c5urYYnDDD4bhAc7JR1v1DiPRX0H/0daWSGYSMLvUQviJLfX9DOwBfu
	ldhnamBcNtLD2NXAhfMEE7rlBpQP2DyY=
X-Google-Smtp-Source: AGHT+IH8zpPKGm9xyPBICKEGelDR0mi8/kpIIJSD/N0kRQkzAOoa3Xy6G824QIxsU9YyeoQZvOQYNg==
X-Received: by 2002:a17:906:4788:b0:b04:286a:2fb8 with SMTP id a640c23a62f3a-b04b1764361mr211856666b.56.1757171933256;
        Sat, 06 Sep 2025 08:18:53 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0466a962c4sm935741466b.71.2025.09.06.08.18.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 08:18:52 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] geary: don't check iso codes xml at build time
Date: Sat,  6 Sep 2025 17:18:51 +0200
Message-ID: <20250906151851.2833673-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Sep 2025 15:19:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119324

In case the iso_639_xml and iso_3166_xml files are not present on the build machine,
then meson fails the compilation - however these files are used only during runtime.

To avoid this, add a patch not to check the existence of these files during building,
but also specify where these files will be located using build arguments.

This patch is a backport from master branch 73c46b265d1cb35c43956d1723c338a137f6ef56

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...check-for-iso-xml-files-during-build.patch | 31 +++++++++++++++++++
 .../recipes-connectivity/geary/geary_40.0.bb  |  5 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-connectivity/geary/geary/0001-meson-Do-not-check-for-iso-xml-files-during-build.patch

diff --git a/meta-gnome/recipes-connectivity/geary/geary/0001-meson-Do-not-check-for-iso-xml-files-during-build.patch b/meta-gnome/recipes-connectivity/geary/geary/0001-meson-Do-not-check-for-iso-xml-files-during-build.patch
new file mode 100644
index 0000000000..af11fa9eb1
--- /dev/null
+++ b/meta-gnome/recipes-connectivity/geary/geary/0001-meson-Do-not-check-for-iso-xml-files-during-build.patch
@@ -0,0 +1,31 @@
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
+
+Adapted for Kirkstone - Geary v40
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ meson.build | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index d0af9eef8..46c8106fa 100644
+--- a/meson.build
++++ b/meson.build
+@@ -221,8 +221,6 @@ if iso_3166_xml == ''
+   iso_3166_xml = iso_codes_dir / 'iso_3166.xml'
+ endif
+ 
+-files(iso_639_xml, iso_3166_xml) # Check to make sure these exist
+-
+ # Post-install scripts
+ meson.add_install_script('build-aux' / 'post_install.py')
+ 
diff --git a/meta-gnome/recipes-connectivity/geary/geary_40.0.bb b/meta-gnome/recipes-connectivity/geary/geary_40.0.bb
index 7faa69c55c..3712e4e27e 100644
--- a/meta-gnome/recipes-connectivity/geary/geary_40.0.bb
+++ b/meta-gnome/recipes-connectivity/geary/geary_40.0.bb
@@ -36,6 +36,7 @@ SRC_URI = " \
 	git://github.com/GNOME/geary.git;branch=main;protocol=https \
         file://0001-Util.Cache.Lru-Workaround-missing-generic-type-argum.patch \
         file://0002-Fix-accessibility-issues-with-initializer-of-constan.patch \
+        file://0001-meson-Do-not-check-for-iso-xml-files-during-build.patch \
 "
 
 S = "${WORKDIR}/git"
@@ -45,7 +46,9 @@ SRCREV = "e561775c1580a9f60a726355b2b897bfc9cb3382"
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data x11"
 
 GIR_MESON_OPTION = ""
-EXTRA_OEMESON = "-Dprofile=release"
+EXTRA_OEMESON = "-Dprofile=release \
+                 -Diso_639_xml=${datadir}/xml/iso-codes/iso_639.xml \
+                 -Diso_3166_xml=${datadir}/xml/iso-codes/iso_3166.xml"
 
 PACKAGECONFIG[libunwind] = "-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"
 PACKAGECONFIG[tnef] = "-Dtnef=enabled,-Dtnef=disabled,libytnef"

