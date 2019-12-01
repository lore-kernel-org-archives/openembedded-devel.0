Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 771097F684
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Dec 2019 16:51:36 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id u8so4827163wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Dec 2019 08:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Pz7f+65hGxzVTKFY0Oe3iuln2HJjE+y9VLHMUThQYB0=;
	b=gbqK/tqQE4QxmKI2eHTzjrdzzzhKPC7lOt+YwQqT5ECl0nRjJ0mUdJdiUnG/kt4QVk
	VdE5V3B22S55yHKY0n6RxFCC8EcxkE7xbEZ4OZNAK1Pk3kzkQBm1bNbAOnueyxEYh30L
	AeZTfI+rJhif1zu0FdZmQMLTlcbCJ4m/kLWhh8Itn5AA/KDACaCDKlgQVzSAZiloTFC7
	Kym8AbnU1gvXhea17QXfEoHxsPrIm9y1rY4OlfZiIzvXevzgkyz6uyzVBLb2mn4LDKsL
	6T5FbG/4ryB37/wlPyzY55e9uulyghb8Qr2BqyHg153uv4Xo/YfDa0a6AHVjThuSxdVh
	bY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Pz7f+65hGxzVTKFY0Oe3iuln2HJjE+y9VLHMUThQYB0=;
	b=hErh0erztv/0yZYvLpWOU6WsI2uVag7OL3PqEdAv8kCCvX38D/taNxTpCWWpMlL04B
	3+XX37i1qDh9jKIIwM8H7qMfN9o3mfjCd17GaILAXpB25GcWiCWCVhHs3tKjAAczsbNP
	4IRjmZfipPYrss6YvMqVMdvR9p8o/r4x9ltFmb2KRDxaPV86SdLz0RKqkx+QWws+8/Qj
	vKEXf/PvJ0ybUCVykLw5t3K+a3/8yjsr5JD34oPsfe0KBKL3EB3lCtPjpNCIjPjBAaCB
	9dpk2pxy752YvIbVhgc9eTzOmNSlgLLSiI70JbhoJnDZsNoveuNtiRubJwwNqbb6mE49
	yG2A==
X-Gm-Message-State: APjAAAUN1iKcFYTYViaffeEcxjd4Bt/9MaQ8mZjJIQcjpBG1zYvCAxm8
	xCkwF1TI/pbiVZ0TwAyUYWB/Gm/Z
X-Google-Smtp-Source: APXvYqyhhPyVgWP6K6Ongk43XrVVmpE19vaFy0t1mhJGzVV1HpKOAgfNRdC4/92a7DrK4Mc1U+IYvA==
X-Received: by 2002:a7b:c1d3:: with SMTP id a19mr25225846wmj.127.1575219097061;
	Sun, 01 Dec 2019 08:51:37 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F3CDB845ACDC091B17366D2.dip0.t-ipconnect.de.
	[2003:f0:7f3c:db84:5acd:c091:b173:66d2])
	by smtp.gmail.com with ESMTPSA id g7sm6228088wrq.21.2019.12.01.08.51.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 01 Dec 2019 08:51:36 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  1 Dec 2019 17:51:21 +0100
Message-Id: <20191201165123.12699-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191201165123.12699-1-schnitzeltony@gmail.com>
References: <20191201165123.12699-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 5/7] xserver-xorg-cvt-native: initial add 1.20.5
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
X-List-Received-Date: Sun, 01 Dec 2019 16:51:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

upcoming mutter requires cvt to calculate source code tables of default video
modes - wow

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../xserver-xorg-cvt-native_1.20.5.bb         | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.5.bb

diff --git a/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.5.bb b/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.5.bb
new file mode 100644
index 000000000..a144e8ba0
--- /dev/null
+++ b/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.5.bb
@@ -0,0 +1,41 @@
+SUMMARY = "X.Org X cvt"
+HOMEPAGE = "https://linux.die.net/man/1/cvt"
+LICENSE = "MIT-X"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
+
+DEPENDS += "pixman-native"
+
+XORG_PN = "xorg-server"
+
+SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "c9fc7e21e11286dbedd22c00df652130"
+SRC_URI[sha256sum] = "a81d8243f37e75a03d4f8c55f96d0bc25802be6ec45c3bfa5cb614c6d01bac9d"
+
+S = "${WORKDIR}/${XORG_PN}-${PV}"
+B = "${WORKDIR}/build"
+
+inherit native pkgconfig
+
+do_configure[noexec] = "1"
+
+do_compile() {
+    cd ${S}
+    for header in `find -name '*.h'`; do
+        path=`dirname $header`
+        if ! echo "$incpaths" | grep -q "$path" ; then
+            incpaths="$incpaths -I$path"
+        fi
+    done
+    CFLAGS="${CFLAGS} -DXORG_VERSION_CURRENT=1 $incpaths `pkg-config --cflags pixman-1`"
+    LDFLAGS="${LDFLAGS} -lm `pkg-config --libs pixman-1`"
+    ${CC} $CFLAGS -o ${B}/cvt \
+        ${S}/hw/xfree86/utils/cvt/cvt.c \
+        ${S}/hw/xfree86/modes/xf86cvt.c \
+        ${S}/os/xprintf.c \
+        $LDFLAGS
+}
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 755 ${B}/cvt ${D}${bindir}
+}
-- 
2.21.0


