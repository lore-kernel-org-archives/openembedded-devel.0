Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.13950.1599068766998624389
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 10:46:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=PgHrTamW;
 spf=pass (domain: blade-group.com, ip: 209.85.221.52, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wr1-f52.google.com with SMTP id z4so321541wrr.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2020 10:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m2D6l806AUZjeE3Mq/Hm6ey3MfjEs76xn7jjpJdCE0Q=;
        b=PgHrTamWxoW91r2RZnj8o48ZjVlZkSYYns7uxDylS5VW6TIBVRNmyiun4KH9rVNONX
         JUJtGzjknonxGpJ4GaugFLBAFB7Ej1b90tFATIEE/wuL5Lus/+B9XiVBfvWEtv1LqTDb
         zj0SSg3D2KTW2yun/7eY77Oajc6/1qth8KbWPB1q/dkZhfBIFTXErjTdEqIemvq998nf
         BBTS6oJQCKnI6FydJ8X0mfuiWXrCOBnElLt9ZuDKQHga6j+AG2bEkWjbwB0Feal9H91D
         kFv0U2BgzOzzSj9OOLfaFKx0hVcyxErUPBTTz8oKSKweQBK//FtydazoJe8StM+0j3QX
         nJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m2D6l806AUZjeE3Mq/Hm6ey3MfjEs76xn7jjpJdCE0Q=;
        b=g9g4UIC0fIoTm37toJ3sXo/2L8OWfiGSFdlvfYIdi93gvSi6Et/sjmFIdOI75MRAS5
         V4i5VJGnB/6bZ4aGShWe39K4N68Dj8n/bt4p6hI5HoKIfl4G674QXDP6cfNlLrkC4X8a
         kWDkYzPposAArMAl2jRKAK/K4a30zyu82WE++QgYVa/5c3YfAN49MdTLJ4npXXEUxF5B
         vS+VgR9IgVIXKcqZf7jHAfUueACmrOgOFxQHFxQqycH4Zr93KJ2SZaPMCYPIrcg9+2ev
         8vH5yCGfAAGXNNSIeNy/As//rvXS9TtxCsZJt2FDXFRqimKkHrYan7WZUYt9sJJ0LaCP
         fLCg==
X-Gm-Message-State: AOAM530lIQKegMzPw5uuzRMdNZ7HGk7t6PzpBhMdB1uHvXLlNw774uFb
	i1evqKX2ceMjNOYBc6fmajDqgoJDCUlAIj/B
X-Google-Smtp-Source: ABdhPJxzmP/naoZfy4zPAzLoWmZkfH9AP3UIZOqwiZO7oS38GioYTcejazkj0OxYhZLI9QyktK8cYQ==
X-Received: by 2002:a5d:4e0b:: with SMTP id p11mr8018234wrt.32.1599068765017;
        Wed, 02 Sep 2020 10:46:05 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan (91-170-159-152.subs.proxad.net. [91.170.159.152])
        by smtp.gmail.com with ESMTPSA id h76sm624742wme.10.2020.09.02.10.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 10:46:04 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-devel@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [meta-oe][patch] New terminal emulator: st 0.8.4
Date: Wed,  2 Sep 2020 19:46:00 +0200
Message-Id: <20200902174600.675971-1-yann@blade-group.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

Can be used as a replacement for matchbox-terminal, with much less
dependencies (does not need gtk and vte), and supports "-e" flag.

Signed-off-by: Yann Dirson <yann@blade-group.com>
---
 meta-oe/recipes-graphics/suckless/st_0.8.4.bb | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/suckless/st_0.8.4.bb

diff --git a/meta-oe/recipes-graphics/suckless/st_0.8.4.bb b/meta-oe/recipes-graphics/suckless/st_0.8.4.bb
new file mode 100644
index 000000000..7d7c20e46
--- /dev/null
+++ b/meta-oe/recipes-graphics/suckless/st_0.8.4.bb
@@ -0,0 +1,28 @@
+SECTION = "shadow"
+LICENSE = "MIT-X"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=04c3ca13a702147c62db90f556c5b3ca"
+SRC_URI = " \
+ http://dl.suckless.org/${BPN}/${BPN}-${PV}.tar.gz \
+"
+
+inherit pkgconfig
+
+SRC_URI[sha256sum] = "d42d3ceceb4d6a65e32e90a5336e3d446db612c3fbd9ebc1780bc6c9a03346a6"
+
+DEPENDS += "libx11 libxft fontconfig"
+
+RDEPENDS_${PN} += "libx11-locale"
+
+do_compile() {
+    make INCS='-I. `pkg-config --cflags x11 fontconfig xft`' LIBS='-lm -lutil `pkg-config --libs x11 fontconfig xft`'
+}
+
+# don't use "make install" which builds terminfo, already in
+# ncurses-terminfo (and requires ncurses-native for "tic")
+
+do_install() {
+    mkdir -p ${D}${bindir}
+    install -m755 ${B}/st ${D}${bindir}/
+}
+
+RRECOMMENDS_${PN} += "ncurses-terminfo"
-- 
2.28.0

