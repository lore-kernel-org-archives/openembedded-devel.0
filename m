Return-Path: <marek.belisko@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id CF56D77FC0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 May 2017 19:22:41 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id v4so13409310wmb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 May 2017 12:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Eqs9u78J+LbkXfuSqXGDz0B4b+9+ZevuIBsHbjOaGII=;
	b=gWnNmCP4MIoTxYrkN4S+p3+Ra9OMgGaVJX29P0LbR4d7/xbH/lX6IJLLaLS52w+zba
	sTDvcaAAkeJmiMya5FKWHhZQv5AMzQus+LJpE1VGyhU7FomgZRXPESS4LSL1bdRinVa7
	LNIYUuxAm4ga1o215zhuUa/QOxLH446R58C28I/mZbDMutzUKblzH17IzqKxWdxFf7pK
	hJmrxmcMWL1d0d6Kyl1oas8hTZhdB1etPS1mHX4dlEXjbVpHVOKfqAOnmaZ4SE5iYrvZ
	zmkxpoIyPr0QLUOfCL6agtMULwiBfLUEjzAQ6+5HnvZ5+FTRKqphpWFQNCpDmNA1hrn9
	qpXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=Eqs9u78J+LbkXfuSqXGDz0B4b+9+ZevuIBsHbjOaGII=;
	b=TaBlom60XDUc/H3kxI5dA0pzYisi55zOirDp4yhKn1npm4Y5FdIeHVW4OiDGQ665oP
	Q6FEZTO85dUZHL1YpKD53BIs4ZqDjPYUoxRGkwal9Cq5OSlRQ9dSac5XMaY3Va1uHRaQ
	o4/sdGczd3/mCIWN545xeVsQmmubUymFaWRaOtU2RXMElqZrWOr6hRvyD02Nsh+FGcS4
	yPEZUQZtt4VDmW1vdnSDW9HQD2mbAZmq27SRkp/BSnji0sFIYd28IuRX9b6z3tlJDxIN
	pptCeIujgNE5q5mQQABy9RjXIsLNfyYfQHxfOZPtZxzppril7T2Y0BUn2D5bdwxDPeJK
	Bmmg==
X-Gm-Message-State: AODbwcBXDUHu0BdqInV9gB0CBXUlTA86x/z/7KNUW9/cdeSrjwRcbvTH
	QY2rbp74cgu64A==
X-Received: by 10.28.6.82 with SMTP id 79mr3719900wmg.124.1495135362101;
	Thu, 18 May 2017 12:22:42 -0700 (PDT)
Received: from localhost.localdomain (109-230-21-223.static.orange.sk.
	[109.230.21.223])
	by smtp.gmail.com with ESMTPSA id 17sm8407703wml.32.2017.05.18.12.22.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 May 2017 12:22:41 -0700 (PDT)
Sender: Belisko Marek <marek.belisko@gmail.com>
From: Marek Belisko <marek.belisko@open-nandra.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 May 2017 21:22:39 +0200
Message-Id: <1495135359-4880-1-git-send-email-marek.belisko@open-nandra.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494964615-15539-1-git-send-email-marek.belisko@open-nandra.com>
References: <1494964615-15539-1-git-send-email-marek.belisko@open-nandra.com>
Cc: Marek Belisko <marek.belisko@open-nandra.com>
Subject: [meta-oe][PATCH v2] recipes-support: Add handling for libgpiod
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
X-List-Received-Date: Thu, 18 May 2017 19:22:43 -0000

libgpiod - C library and tools for interacting with the linux GPIO
character device

Since linux 4.8 the GPIO sysfs interface is deprecated.
User space should use the character device instead.
This library encapsulates the ioctl calls and data structures behind a
straightforward API.

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
V2: Fixed comments from Martin Jansa

 meta/recipes-support/libgpiod/libgpiod.bb | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta/recipes-support/libgpiod/libgpiod.bb

diff --git a/meta/recipes-support/libgpiod/libgpiod.bb b/meta/recipes-support/libgpiod/libgpiod.bb
new file mode 100644
index 0000000..fe56f7b
--- /dev/null
+++ b/meta/recipes-support/libgpiod/libgpiod.bb
@@ -0,0 +1,30 @@
+SUMMARY = "C library and tools for interacting with the linux GPIO character device"
+HOMEPAGE = "https://github.com/brgl/libgpiod"
+
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
+
+UPSTREAM_CHECK_URI = "git://github.com/brgl/libgpiod/releases"
+
+SRC_URI = "git://github.com/brgl/libgpiod.git"
+
+SRCREV = "7ab5e53b69cce313ba87033a442cabd417f5d895"
+
+PV = "0.2+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+SRC_URI[md5sum] = "68f039487e940c15bbfc50a10ab4715b"
+SRC_URI[sha256sum] = "7d7085d4e9cb811742ca8c5fe03458067efaeaa8abc23968d2e3c56bcc2d2ef8"
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
+FILES_${PN}-tools = "${bindir}/*"
-- 
2.7.4


