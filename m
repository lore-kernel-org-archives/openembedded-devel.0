Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.9261.1599640972962908102
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2020 01:42:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=OlsBdujI;
 spf=pass (domain: blade-group.com, ip: 209.85.221.52, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wr1-f52.google.com with SMTP id m6so2027631wrn.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2020 01:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m2D6l806AUZjeE3Mq/Hm6ey3MfjEs76xn7jjpJdCE0Q=;
        b=OlsBdujIfxJ48688/ECLvE8X+ndVbZM2BmYgHprbCxPQW8SiGN4q4LdZUFOJM634C6
         G48VIMbTCeZzfnUoMp2ahgIdIWhbs5xz82EMVs1vHjUhdVg0F6vsmQZZYdOtsf3ekAYT
         5LlTWwMtu7U+MJdD5crraLBARUtG5Eax7jS1uKlH/0Vf/lde4eF+bOnYuGlGl4ECoxLx
         jSSSB3cZmf5PZBYZO7ESzQKX9abLwMRhCFM8z3PXIalBwgGOGLL/payhIvZdQNzR1icb
         RNYqtpQSPLUzjQFJDZc+9iWBQUp9MXgVhe7Jc0JjGlJQDwejSJMRaCBGYBDoVJBw38AD
         lJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m2D6l806AUZjeE3Mq/Hm6ey3MfjEs76xn7jjpJdCE0Q=;
        b=amSMbe/1qORF89MDAbln4MDEtW6GxNeXDMI6eI/mTsvWNVJqv2T5dLq1atZ1CXcKmM
         WBj1bymovOdx4rj4ht7PWdyeLRgEL1idk4Tnj2ikDGsYQN1y5PkvbjDni/h62fObfXPc
         Of/CzxXowPgc4TWZGNK7h0a0KnlaDGd+W1Aydw9Xkd3GydBw3sqb7yt/+VWO1EHVLfFS
         Sf60wKyN7cJ6sR+amg3SdbESr9pTe0GWnHAgY1I7AySPqRwHiqz1uut6ISe9Ax90pD8V
         4osPNmfeLVsD/uCtxNWxO1uEBGLRoM3tHPLNY6mrLr6PjHIkmfHrqdY08WJFOIp6XpqQ
         lvTA==
X-Gm-Message-State: AOAM533n7xUYDKZ9pfQo0wvLQCC/dFy/fxcz3y0H55c7ion0g5aGoqNS
	8apSmML24HOMrzpdvwNDZqm0v1kYdDht2Pgn
X-Google-Smtp-Source: ABdhPJyOILDjoKTCaQfeAqW/i+kG5LpjY0j0NgV1MtIAbGqv4lw8VHtNILPcxpf/RKi83DNL+OOUZA==
X-Received: by 2002:adf:f890:: with SMTP id u16mr2583125wrp.183.1599640971096;
        Wed, 09 Sep 2020 01:42:51 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id o4sm3027825wrv.86.2020.09.09.01.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 01:42:50 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-devel@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [meta-oe][patch] New terminal emulator: st 0.8.4
Date: Wed,  9 Sep 2020 10:41:51 +0200
Message-Id: <20200909084154.178795-2-yann@blade-group.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200909084154.178795-1-yann@blade-group.com>
References: <20200909084154.178795-1-yann@blade-group.com>
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

