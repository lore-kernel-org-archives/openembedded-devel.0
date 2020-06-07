Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.10337.1591545945733981498
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jun 2020 09:05:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=meI7eY/Z;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: offougajoris@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id k26so14023390wmi.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jun 2020 09:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JkmYaSUGr5TAWJp/7khBfJe83rTrv1IW62EnN3vIlf0=;
        b=meI7eY/ZZYJfbV4cwdhgvnFwUODnqkBRx5XYIpckB1TaAhA6S6N6Y94rSafzbwLJ9g
         nJzUpvAx2HGtnMnTiLDATfEYCKONduNgOONaJr7dRs81vwq6wovesAgxKguTZoV2PkeY
         CHaXCREfZhps1WryausOc7RrZ0gzYhW0ouMKh4beCX+twMOSy/uCHXMz37eKRqoGDGoE
         Xs1KzMO9Z635643FzcvxMXuNoqZpsEEa5JDzfeo0cL9g9TuYfzJSVKA7xnGdSGP8C7Tl
         tSC8jFij7wplKxvsWZFVrzGYodHQlDpxUc4uC7WiQRZ7YQNyEpjXwS1fW7jX0tIXexiO
         m0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JkmYaSUGr5TAWJp/7khBfJe83rTrv1IW62EnN3vIlf0=;
        b=qG2DGzpeugXW5lDrre6R80A7SPnF23w5B0joBSNxJ9NRtMzqqHBjeQR5O4uTZ1m7dw
         Z76O/Iy+UT2YIAdnPuqnnSlNsLvLlBvNV7T9gz4VAc2IF10B1XMRmmykcxyrF094FxnW
         +cmzsPMcSscG3dcIRfjG6sDhCFzuVouK4BCLQ+Plf2MClW90+v4ytKNXXFL0LaqacwUV
         v8hNeE1wfySzh5pt9e3I8k4OcoX8WrFH0z7oIGXicqJWhfAjlgUjUazom8lOIcZxqQFc
         XXYV6mVPUM53o3iBZfVXb8qn2WVK0DdbeKjSk7jWtN/piUVyqiWhiUCWIjHC+oaBWVHL
         kWVQ==
X-Gm-Message-State: AOAM532tfjR2664b5YF8ECeL0trgPpDm9ig0SwO7nFdZuj+2HloU47j4
	hnCI0yF72JTjnEwlofFN3gphvu9k
X-Google-Smtp-Source: ABdhPJz3JAcszBNHhT0w3I/wdz9Quk/9Cylb1gWtVt5dZ8sE2sIDqGwtYhjXXgfVL6HBNh7pNZmqrg==
X-Received: by 2002:a1c:a905:: with SMTP id s5mr12169027wme.120.1591545944028;
        Sun, 07 Jun 2020 09:05:44 -0700 (PDT)
Return-Path: <offougajoris@gmail.com>
Received: from XPS-15-7590.home ([2a01:cb19:16b:9900:6cbb:f4b2:aba4:8f23])
        by smtp.gmail.com with ESMTPSA id a16sm20785204wrx.8.2020.06.07.09.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2020 09:05:43 -0700 (PDT)
From: "Joris Offouga" <offougajoris@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Joris Offouga <offougajoris@gmail.com>
Subject: [meta-oe][PATCH] c-periphery: add recipe
Date: Sun,  7 Jun 2020 18:05:32 +0200
Message-Id: <20200607160532.415655-1-offougajoris@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Joris Offouga <offougajoris@gmail.com>
---
 .../c-periphery/c-periphery_2.2.1.bb          | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/c-periphery/c-periphery_2.2.1.bb

diff --git a/meta-oe/recipes-devtools/c-periphery/c-periphery_2.2.1.bb b/meta-oe/recipes-devtools/c-periphery/c-periphery_2.2.1.bb
new file mode 100644
index 000000000..b53cd6b19
--- /dev/null
+++ b/meta-oe/recipes-devtools/c-periphery/c-periphery_2.2.1.bb
@@ -0,0 +1,21 @@
+SUMMURY = "C-Periphery lib used to access GPIO, LED, PWM, SPI, I2C, MMIO, Serial"
+DESCRIPTION = "A C library for peripheral I/O (GPIO, LED, PWM, SPI, I2C, MMIO, Serial) in Linux"
+
+HOMEPAGE = "https://github.com/vsergeev/c-periphery"
+
+SECTION = "libs"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4097ec544cf01e9c7cfc4bdf8e4ed887"
+
+SRC_URI = "git://github.com/vsergeev/c-periphery;protocol=https"
+SRCREV = "c2aa7d164f87b807077daeeb3443a56b89e1d1c9"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON"
+
+BBCLASSEXTEND = "native nativesdk"
+
-- 
2.25.1

