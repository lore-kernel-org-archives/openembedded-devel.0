Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.12417.1599135314896069152
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2020 05:15:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=JRNb9/vw;
 spf=pass (domain: blade-group.com, ip: 209.85.221.54, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wr1-f54.google.com with SMTP id j2so2963456wrx.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2020 05:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UVfriEck6mzhkIxQ9lg0DwTHC04jO8RXTPHPiHtXeSo=;
        b=JRNb9/vwhKq0lkXobmUSfRUgW3ly6HhMEPk8PUWLg62pg8FkxE/U25jAb/Ra/ck/Ab
         PLlquAptit+2FPrA+l8sL3ZH5f/5oRlL+IB3GBhogCzFb9Yw8PyGEMd4FoDPkMvpYK2M
         oEiSZVaGi33pPbMzQgtkQLgORccGNjQGROzwuBsh0DOS9m2XD5fWwhSzF4hRjXL1KGML
         yE/mKT6/ZASQNVtp9dqbo4QAPyeqzXlYudEzS2ZLKhLzH70cvug4souMhbGWls5sKe0p
         unAnqRAyw+LxdjIaVXcEorYv20kvv9eX/Z/2QlgOEt4YjuXl7258dKGUn0+m7mxj2bpw
         pv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UVfriEck6mzhkIxQ9lg0DwTHC04jO8RXTPHPiHtXeSo=;
        b=OlnGuyM/yENG05/2h7z4coAmtuHmG7/8z4Q5mClSap7OA4mM+EhLffJGse8JblQtQs
         cFd/VLWTjWOZ5XBza9k2In4vpCnJT5xY97+ZF0uMlprfmnIi/CpCuYK0rFhPskRWN+Jf
         83zi3F4L+qQIlE8aT1AErYFbMW2czozGNlvZCU5UGA27w17azkgGf11oLg/3/tgVmOD3
         2MdGSLTo1InrlE0Q/nidzGbatnlBQFgb2lydVJuwTnUEQl5HPsBdUDzBPfd2j55IESVv
         BT3XfIuQplhsThY7PObEv17PTTX5ptELBXXX1gnohJfNOXbqHmMXmzfLaHXPClaxhEmL
         VeVg==
X-Gm-Message-State: AOAM533psNxrD1gTaYnNUgtl198WH9kveGKS/vP9cBh0DzhhE8iUTezi
	mntnWxY+N6xKWcGjWj7cqDOsUtgjHccE74Ju
X-Google-Smtp-Source: ABdhPJx+S0F1iOWf9bN/xHWSuL+SyoKD0breSktu2fneDarWJC5PYpAUn2JcxxyrL6ViFEz/6frz8Q==
X-Received: by 2002:adf:a1d6:: with SMTP id v22mr2212864wrv.185.1599135313018;
        Thu, 03 Sep 2020 05:15:13 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan (91-170-159-152.subs.proxad.net. [91.170.159.152])
        by smtp.gmail.com with ESMTPSA id r15sm3948920wmn.24.2020.09.03.05.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 05:15:12 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-devel@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [meta-oe][patch v2 1/1] New terminal emulator: st 0.8.4
Date: Thu,  3 Sep 2020 14:14:11 +0200
Message-Id: <20200903121411.3017527-2-yann@blade-group.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200903121411.3017527-1-yann@blade-group.com>
References: <20200903121411.3017527-1-yann@blade-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

Can be used as a replacement for matchbox-terminal, with much less
dependencies (does not need gtk and vte), and supports "-e" flag.

Signed-off-by: Yann Dirson <yann@blade-group.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 +
 meta-oe/recipes-graphics/suckless/st_0.8.4.bb | 25 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/suckless/st_0.8.4.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 55d623d95..d67b2fb69 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -455,6 +455,7 @@ RDEPENDS_packagegroup-meta-oe-graphics ="\
     openbox \
     packagegroup-fonts-truetype \
     qrencode \
+    st \
     takao-fonts \
     leptonica \
     libvncserver \
diff --git a/meta-oe/recipes-graphics/suckless/st_0.8.4.bb b/meta-oe/recipes-graphics/suckless/st_0.8.4.bb
new file mode 100644
index 000000000..1f4961cb2
--- /dev/null
+++ b/meta-oe/recipes-graphics/suckless/st_0.8.4.bb
@@ -0,0 +1,25 @@
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
+DEPENDS += "libx11 libxft fontconfig ncurses-native"
+
+RDEPENDS_${PN} += "libx11-locale"
+
+do_compile() {
+    make INCS='-I. `pkg-config --cflags x11 fontconfig xft`' LIBS='-lm -lutil `pkg-config --libs x11 fontconfig xft`'
+}
+do_install() {
+    make install DESTDIR=${D} PREFIX=/usr TERMINFO=${D}${datadir}/terminfo
+}
+
+FILES_${PN} += " \
+  ${datadir}/terminfo \
+"
-- 
2.28.0

