Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.1991.1604429957081384396
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2020 10:59:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZfAUsYmW;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id c20so15058543pfr.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2020 10:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z0svAUPwIsUGwV1dWnIjk639mWJSQFTM+6bTzZdX9vE=;
        b=ZfAUsYmWTwgZbSyl6n6et5tYGJ3GzmIamaqqlAIp72bXc+QygMfnEmXpqzbe5d+p1M
         YfREdEq6wypWfetjTwHisW24yT/7zInRple45G2a/s6B5I1/B07M38VBdxRSIfQ3/Efh
         Rg5Auuwo7MBhZRryM0caMEsGpEKqDD0jaK95j409XlInHgqXABCVfkWTFWb/lV7v5kRD
         LGhwgM+jE+jqfu0qa0vRKLSfKbQpNjaidAApmPB7A/TTBaPm+2pHRj2XBlM9ChqfpMNU
         ugYwRBz1X1N4LaMabDfaHEMuulvJfoF2iOJbFXvZErQrClngToyNBmKpSC5cltcPYTnq
         9ycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z0svAUPwIsUGwV1dWnIjk639mWJSQFTM+6bTzZdX9vE=;
        b=mB6bScfLJYPuCUuQjyQ4W3y6CG7Gc9U/CYNVDmv6BhEpi1uGq9q9l/SB+LkV/kBM+U
         k2jUlUcVWoZHaH/n2wUFpB7yKqRGmv0Fz8BB4BGCZ+kQ9PdVonL3vWRo7NL3GyBeA8BF
         iPWhRBAQ2Ee74gRXFa6ajecxfpRNm4b4JUYTdj+7yParEu8i5amSFWGLOZJXIvHaIGko
         BXOA9qfFOFKX2eGnNeYF5idaeggBZdXalqoGjRJCKfB24HqkygfD5M2iR8PtSFt8gXdF
         5vx33QHISmpzXohV2SmPEiafR83rz9inHm2uyPErLM49FXCxPlG1jmN4J3mTHgvCXORv
         3XeQ==
X-Gm-Message-State: AOAM530/LIt7AdGeh5HgUAynNDh4i/GuQeMUi2+MPU6j3+ifde/m4MBc
	6nWp3mAjEkpSAYvmz76fiqwja3JKNTaKEw==
X-Google-Smtp-Source: ABdhPJxANv7A2gn7Cz0Xpi0uUgi2EuTl11qmYOxqZKfcqTMDvxyTUQswLEbvhcqttgR8voUciJYljQ==
X-Received: by 2002:a63:1947:: with SMTP id 7mr10441303pgz.350.1604429956073;
        Tue, 03 Nov 2020 10:59:16 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4b05])
        by smtp.gmail.com with ESMTPSA id w13sm8148357pfd.49.2020.11.03.10.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 10:59:15 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] mdbus2: Fix build with vala 0.50
Date: Tue,  3 Nov 2020 10:59:12 -0800
Message-Id: <20201103185913.1407868-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-GLib.DBusSignalCallback-for-Vala-0..patch | 27 +++++++++++++++++++
 meta-oe/recipes-core/mdbus2/mdbus2_git.bb     |  4 ++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-core/mdbus2/mdbus2/0001-Fix-arguments-in-GLib.DBusSignalCallback-for-Vala-0..patch

diff --git a/meta-oe/recipes-core/mdbus2/mdbus2/0001-Fix-arguments-in-GLib.DBusSignalCallback-for-Vala-0..patch b/meta-oe/recipes-core/mdbus2/mdbus2/0001-Fix-arguments-in-GLib.DBusSignalCallback-for-Vala-0..patch
new file mode 100644
index 0000000000..65df09b1bc
--- /dev/null
+++ b/meta-oe/recipes-core/mdbus2/mdbus2/0001-Fix-arguments-in-GLib.DBusSignalCallback-for-Vala-0..patch
@@ -0,0 +1,27 @@
+From 01a3a35631ba3996f7e912def66b4053a4f21df9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 3 Nov 2020 10:52:17 -0800
+Subject: [PATCH] Fix arguments in GLib.DBusSignalCallback for Vala 0.50
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/main.vala | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/main.vala b/src/main.vala
+index 6d7132b0..b3183217 100644
+--- a/src/main.vala
++++ b/src/main.vala
+@@ -403,7 +403,7 @@ class Commands : Object
+         return false;
+     }
+ 
+-    public void signalHandler( GLib.DBusConnection conn, string sender, string path, string iface, string name, Variant params )
++    public void signalHandler( GLib.DBusConnection conn, string? sender, string path, string iface, string name, Variant params )
+     {
+         var line = "[SIGNAL] %s.%s  %s  %s\n%s".printf(
+           iface,
+-- 
+2.29.2
+
diff --git a/meta-oe/recipes-core/mdbus2/mdbus2_git.bb b/meta-oe/recipes-core/mdbus2/mdbus2_git.bb
index 82f2cf8c94..71ab4d45a7 100644
--- a/meta-oe/recipes-core/mdbus2/mdbus2_git.bb
+++ b/meta-oe/recipes-core/mdbus2/mdbus2_git.bb
@@ -6,7 +6,9 @@ DEPENDS = "readline"
 
 PV = "2.3.3+git${SRCPV}"
 
-SRC_URI = "git://github.com/freesmartphone/mdbus.git;protocol=http"
+SRC_URI = "git://github.com/freesmartphone/mdbus.git;protocol=http \
+           file://0001-Fix-arguments-in-GLib.DBusSignalCallback-for-Vala-0..patch \
+           "
 SRCREV = "28202692d0b441000f4ddb8f347f72d1355021aa"
 
 S = "${WORKDIR}/git"
-- 
2.29.2

