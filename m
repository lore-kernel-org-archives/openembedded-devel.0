Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id E5E397C9C5
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2019 13:56:52 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id b6so14764384wrq.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Dec 2019 05:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Uc+7GWKGHvuGYiDWqOsit1Vvob7Su4IJk3G0d8eU4CE=;
	b=RYlyI3ljNO/OXqWMTLZwC0mdBQ37s+mu3SeGDzzaAqCx5U8tz36sRe0UKzrcXYsStI
	WGkXbyun983knSnqZfuBa3aIi+UVvYpGGLD0Tg7Fhm+zRnpd5SCyeOMd6nFQJfnAzpbR
	9IMwiKWzpq4EwB7ahtHbM58/C4nQLF4+Wi1eiLhDB5ihiPYQHz5f763NmV2jQA9hkJ93
	ZyZQ1UK5a2OmV/kjkC8zV7OUfTXRPy1lIdBif2iUqbFVSC8jWQVx2VmzHm4rZ8Scty+O
	rKrso3q001y6Q+VXEsDO8Nzmt8PAMy0cBG1bQOdUpfr0k4uAv29uRSYpKF8Ws2cB0xSA
	AlaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Uc+7GWKGHvuGYiDWqOsit1Vvob7Su4IJk3G0d8eU4CE=;
	b=XUpYOUnekjbdiQguPIbkBQNXwA5S5VAmwpBxn/RAwUI9/ULGZv1R6G15D03UwZjXNK
	1rtXS1svvkN/CoLfk2diMNT2uWav9dw6iNkcaZHWwPZRwLGb4OhigU77bUkZ3a4q3F/J
	cwmF0eqHR5U7vCAohOCnH7PSHXBn5GhZYk3fI+GOTBVsJYPlCcLllEMyPL3pTf+yupNG
	KsgoYtZaLRf914YeAHSiZ6SVsGFM18134L1k9PZzW+BeHrzUFy8yllM+GBxiI/oP3wmw
	zLO5y0GGQXQd4vow1hIAZUIjIPqK/5nu08MiuPMm3e38IqVA7ZsoylrI+pMch1lFAJQ6
	Ym4A==
X-Gm-Message-State: APjAAAVVEMPOvfemWGbWe8hA2ZYgNDGl1m9AG3H+6gH4U8471ScUo1ly
	An9aHtuF0BXBeZU66FEbQQ5AmUHe
X-Google-Smtp-Source: APXvYqy/AULFOxOUnoGhrjbn7Rd0B7A8DxDW/p1uln4ebPQf1aYqF8/AU+NuC1cALp7oufcfaQtnkA==
X-Received: by 2002:a5d:4d06:: with SMTP id z6mr18402895wrt.339.1575295013290; 
	Mon, 02 Dec 2019 05:56:53 -0800 (PST)
Received: from amue-work.zera.local ([195.50.169.54])
	by smtp.gmail.com with ESMTPSA id
	x10sm39364856wrv.60.2019.12.02.05.56.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Dec 2019 05:56:52 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Dec 2019 14:56:44 +0100
Message-Id: <20191202135646.9795-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH v2 1/2] xserver-xorg-cvt-native: initial add 1.20.5
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
X-List-Received-Date: Mon, 02 Dec 2019 13:56:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

upcoming mutter requires cvt to calculate source code tables of default video
modes - wow

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
V1 -> V2: Fix build on x-less hosts by adding xorgproto-native libxrandr-native to DEPENDS
 .../xserver-xorg-cvt-native_1.20.5.bb         | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.5.bb

diff --git a/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.5.bb b/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.5.bb
new file mode 100644
index 000000000..1d75d52d2
--- /dev/null
+++ b/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.5.bb
@@ -0,0 +1,41 @@
+SUMMARY = "X.Org X cvt"
+HOMEPAGE = "https://linux.die.net/man/1/cvt"
+LICENSE = "MIT-X"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
+
+DEPENDS += "pixman-native xorgproto-native libxrandr-native"
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


