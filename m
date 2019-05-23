Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8DE147E46F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:42 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id m3so4884973wrv.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=u1M9L9bHwTcJLWXWgG2BprpYz0JlMliInrRL2PT7tLs=;
	b=C7zLUhSyTIUaHA3bfQi3wDjd0cGVFsrHlTekjyaIICa3c2M2BL8rW8nUWNwca6JZ6d
	xWM2GQbecQLjZq2M/8OQy091K0zClsXrL3hzAv1kqrgK+ZJlMCWOwvsVCAERoCB8NKKR
	W2FvL5cW/9X/P2QPNMt0EBA4R4GjSwWIja20Mc0wElfPE3rnBDVKZkFOS+3i6rMj2SoC
	ZBDVMF0u1U1ZCnQ82ovkVjndJRo/NhqUhsiF9IpnrsJ9VtLhrb90abJiCSU3rV6z8YPt
	G3YyaEvQUV2bP/j3oFwSr7YmK5crN7g4NIxBaeer3oMPqd5WiCJ2FANvnk4pD/el+sep
	2IPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=u1M9L9bHwTcJLWXWgG2BprpYz0JlMliInrRL2PT7tLs=;
	b=Q5vIhNNabSjy9kR3ekADSW7JqWw0WhI8mrtxP+LbHQeFXBUll/YMfy8MGWZltXYHKi
	frINIZoV8sBjSJAhUY+EnBeA00Mwj8qxVJO2hTkOT6k7d1D7AIGxsl2usERj1aODPv8o
	+xh4U2Ca+mr6UN0nDJZXl41b5kAVcKSObFXbYis9s8/aq4QWaM/spWgd2+xFoC/p2ocK
	tM45KASG4lXRpW4eM2aPWHIM9FLAnQFO5ttAJ3OQQqlXlov/5mQSV7DzAN5aEBIa1stp
	2XnfTf+VTSSEBFvMVXjAXYqDM0cYadlwSIrzN+zOsItMgExzxR1VP+8gQKmeLPmjLunZ
	C3BQ==
X-Gm-Message-State: APjAAAXhYKC1tUSmGdWoyhLZ/qVCr/YkBcC1tJDxN63l8eCfxnyByja3
	EoMep2cV2hJeAJVK4npFbKZ8lRVIY2E=
X-Google-Smtp-Source: APXvYqxLymsQ9zYc5mqMbDKvVL/NQaet3JtM69CH4vhpKnh4VORrJAZoumC/wP1leLcAA/uQ2kkp8Q==
X-Received: by 2002:a5d:4004:: with SMTP id n4mr2298604wrp.240.1558594183277; 
	Wed, 22 May 2019 23:49:43 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:42 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:59 +0200
Message-Id: <20190523064859.24336-42-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 41/41] xserver-xorg-cvt-native: initial add 1.20.4
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
X-List-Received-Date: Thu, 23 May 2019 06:49:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

upcoming mutter requires cvt to calculate source code tables of default video
modes - wow

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../xserver-xorg-cvt-native_1.20.4.bb         | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.4.bb

diff --git a/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.4.bb b/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.4.bb
new file mode 100644
index 000000000..c80a295a5
--- /dev/null
+++ b/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.4.bb
@@ -0,0 +1,43 @@
+# Copy & paste from oe-core/xserver-xorg
+
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
+SRC_URI[md5sum] = "c4841cc24b79420205d082fe82e0a650"
+SRC_URI[sha256sum] = "fe0fd493ebe93bfc56bede382fa204458ff5f636ea54d413a5d1bd58e19166ee"
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
2.20.1


