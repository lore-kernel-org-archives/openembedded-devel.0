Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 872247F6E4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Oct 2019 08:35:26 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id p12so4667046pgn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Oct 2019 01:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=w3HFeVSYhLhrgbJEDKOxUKbP6Mn42cTtTyZw1Dau8H0=;
	b=T4dDl6pur5TrDwIqTJE/W2Rw89LjGBXH4kd97I2geGxEAERJ8ZRTspNefBkdwghNYr
	Zpyys3g/Lt7tP14Ff8ougBYjfs0Sba/2AdNrFiW/f9Zu0A+PePyMY4re83r5ELtN/PMb
	1Evcao1UkWtVZEQLCj8avhq9SG+ghcVZ7g7cTrcE3oo+03uvv3iM1GDrNpJF76Y4p24r
	5n97lS+vzCkvvBSYRTqw5pl7tE1EF3dZoEPdrm+7L7oxnrGMwgXkA/JeQX3G0Pq8myVU
	Ve7joe+jYccwu3vd6xESWD0iRnhb2KFAWp3qUvlWMFImpA16uZN4qQ+QqbmIkPzlE38i
	JROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=w3HFeVSYhLhrgbJEDKOxUKbP6Mn42cTtTyZw1Dau8H0=;
	b=ioL8DVuzXQEaHQDUZ6YmUAzzdJrWLCHFpDccUhl5uDIva5mZiO5TRmxa86Yh8nQuHD
	U9u3UQmfn8eYNWcEczNNzDJijTfl7q7M0gly1yTSpzJgGW5jxGjfUYarDC96f9zHsQDp
	WMnX10/Sv8MPMzGGCW2yCTED3kCpvRoBAb5AWpP7erjcuYFnIPXSeT7Q8nHi8gr+M+ZB
	4nOAaZl/Ni/Wbu1rPoIZQzzt3k66XWTzZk7GbGzOZqPkiYUrZeA5D60yHV5s4PWeql5o
	ytryxlkeZfAXHd11XCPGpzMefWvDOcxe6v770FgXz/vCwleY2TvQ6eUma1IxgYroSs5o
	zcjQ==
X-Gm-Message-State: APjAAAV+VtBZdBmIz6TW9C2P+ijZkT3gMZBfoXy7W7y9/7xlIBY4zLQj
	qWcxhrA9nJCYR+UfbfsMWlB/XTd5ksk=
X-Google-Smtp-Source: APXvYqw4Jc9ceKSnWda7/ZQXYQZLUtuettG5LobxIG828qNITXh/IZTwagClO2E3/cuqZBqMxtG/Aw==
X-Received: by 2002:a17:90a:bc41:: with SMTP id
	t1mr16064849pjv.67.1571474127299; 
	Sat, 19 Oct 2019 01:35:27 -0700 (PDT)
Received: from localhost.localdomain ([192.55.55.41])
	by smtp.gmail.com with ESMTPSA id
	193sm9635263pfc.59.2019.10.19.01.35.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 19 Oct 2019 01:35:26 -0700 (PDT)
From: Ankit Navik <ankit.tarot@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Oct 2019 14:07:07 +0530
Message-Id: <1571474227-28534-1-git-send-email-ankit.tarot@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH v2] glfw: Initial recipe for glfw
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
X-List-Received-Date: Sat, 19 Oct 2019 08:35:27 -0000

It adds generic recipe for glfw: a multi-platform library for OpenGL,
OpenGL ES, Vulkan, window and input.

Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
---
 meta-oe/recipes-core/glfw/glfw_3.3.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-core/glfw/glfw_3.3.bb

diff --git a/meta-oe/recipes-core/glfw/glfw_3.3.bb b/meta-oe/recipes-core/glfw/glfw_3.3.bb
new file mode 100644
index 0000000..e3853a2
--- /dev/null
+++ b/meta-oe/recipes-core/glfw/glfw_3.3.bb
@@ -0,0 +1,22 @@
+SUMMARY  = "A multi-platform library for OpenGL, OpenGL ES, Vulkan, window and input"
+HOMEPAGE = "https://www.glfw.org/"
+DESCRIPTION = "GLFW is an Open Source, multi-platform library for OpenGL, \
+OpenGL ES and Vulkan application development. It provides a simple, \
+platform-independent API for creating windows, contexts and surfaces, reading \
+input, handling events, etc."
+LICENSE  = "Zlib"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=98d93d1ddc537f9b9ea6def64e046b5f"
+SECTION = "lib"
+
+inherit pkgconfig cmake
+
+S = "${WORKDIR}/git"
+SRC_URI = "git://github.com/glfw/glfw.git"
+SRCREV = "d25248343e248337284dfbe5ecd1eddbd37ae66d"
+
+EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON"
+
+DEPENDS = "libpng libglu zlib libxrandr libxinerama libxi libxcursor"
+REQUIRED_DISTRO_FEATURES = "x11"
+
+COMPATIBLE_HOST_libc-musl = "null"
-- 
2.7.4


