Return-Path: <marek.belisko@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id DC64B71BEE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 19:56:57 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id d127so40382472wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 12:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=aiYXLRnh6foFgzEsbnf+qVJ1EtNL14NdSkQqMnWWujE=;
	b=uDc5y1gu1H1SYRdLHdNEykY8VxtHZ8n21nslh9kA7RxJsE/xF4saZNYNaeTztbAL+5
	kO9SdIc0JeIUEJd1YrtqoQ0NRftCwSb9uSMq9fcDTonahad0JTzlJtHpMoWKAgUup8/b
	9/MJmvq8LGe1hHVCmjifgxdAEVpsXe1IVgTVUihwy3twALHfiKpgUL/rG3A76kTjvrS8
	hAOpkQ/1zNpnK4vubZY2ttLjVJbVpjHIVZuO2lbxVPVmJGh/Ar5d5N0lYyTTZqHz4dPx
	ypmr+eJtty22MqEO4gi5qoewlZoYhCIx2M63nFgIP4gZFB1WP/ZwJZiKicqoMwRDB4l/
	DPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=aiYXLRnh6foFgzEsbnf+qVJ1EtNL14NdSkQqMnWWujE=;
	b=GDeK+yPrUeCDEf/XZZklMiqXS07v9EDqPxoEPif8Pb1Z9ujz9XTpoqNTSz8DdcziKC
	Rg4aWfQuyNsk7yjShxnrEOZMO+UEdn3B+516J7fPf1slHEIK++RF3JUex964qb8hvBwE
	2czSL0Nn6/TrFmzBdZbfy2KQng+K7sedR+3Eqh9LqyunWJ5pp4i/IFnfomr4769yvKYo
	xJfSGzmpRvbQDUMuq4h8bJ9QIptLfgnHNenRb41yu/FUPCIJF3WAL/+lsjgLFAUR7lKT
	+ZMgaU4W/wLuQgAGYbkcV3TMJpXJ03H14iZDGrNzZmQVso6dY3yBUjGWrH658zIciU4F
	DCyw==
X-Gm-Message-State: AODbwcAfvoeu20C/DMLHbZAAncguRJtEaNbgWSAEHsenpftUJQK/8ojy
	J2FAZhQDpXfVGFhi
X-Received: by 10.28.29.6 with SMTP id d6mr8777600wmd.71.1494964618453;
	Tue, 16 May 2017 12:56:58 -0700 (PDT)
Received: from localhost.localdomain (109-230-21-223.static.orange.sk.
	[109.230.21.223]) by smtp.gmail.com with ESMTPSA id
	x64sm3251418wrb.10.2017.05.16.12.56.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 May 2017 12:56:57 -0700 (PDT)
Sender: Belisko Marek <marek.belisko@gmail.com>
From: Marek Belisko <marek.belisko@open-nandra.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 May 2017 21:56:55 +0200
Message-Id: <1494964615-15539-1-git-send-email-marek.belisko@open-nandra.com>
X-Mailer: git-send-email 2.7.4
Cc: Marek Belisko <marek.belisko@open-nandra.com>
Subject: [meta-oe][PATCH] recipes-support: Add handling for libgpiod
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
X-List-Received-Date: Tue, 16 May 2017 19:56:58 -0000

libgpiod - C library and tools for interacting with the linux GPIO
character device

Since linux 4.8 the GPIO sysfs interface is deprecated.
User space should use the character device instead.
This library encapsulates the ioctl calls and data structures behind a
straightforward API.

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod_0.2.bb | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod_0.2.bb

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_0.2.bb b/meta-oe/recipes-support/libgpiod/libgpiod_0.2.bb
new file mode 100644
index 0000000..fe2cd80
--- /dev/null
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_0.2.bb
@@ -0,0 +1,25 @@
+SUMMARY = "C library and tools for interacting with the linux GPIO character device"
+HOMEPAGE = "https://github.com/brgl/libgpiod"
+
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
+
+UPSTREAM_CHECK_URI = "https://github.com/brgl/libgpiod/releases"
+
+SRC_URI = "https://github.com/brgl/libgpiod/archive/v${PV}.tar.gz"
+
+SRC_URI[md5sum] = "e3430f35b6efa842693d659c0bfb7ad5"
+SRC_URI[sha256sum] = "de1947f3cb2cc4174364af430309fe6238976658575655bdbd76c60cffa7df92"
+
+inherit autotools pkgconfig
+
+# enable tools
+PACKAGECONFIG ?= "tools"
+
+PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
+PACKAGECONFIG[tools] = "--enable-tools,--disable-tools,"
+
+PACKAGES += " ${PN}-tools"
+
+FILES_${PN} = "${libdir}/*"
+FILES_${PN}-tools = "${bindir}/*"
-- 
2.7.4


