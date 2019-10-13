Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 52F337D00E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2019 10:24:56 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id q21so8682405pfn.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2019 03:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=y1loygYJy1YYAXIpyZVCnVFb1nWaA3CeRKmLTjadCFM=;
	b=EGitBsh53nPkwpiMqN2EPmM2zlSXiI9eSi58KrgjDSJsnCB/0Guh2rAri8ftljhQUt
	Wi9D0dx9xCTpcGoLy2vjuN4YEzg9gLY7KEbTD1+BN9qTTF0f3rH5tEvePHYgedVsyQHL
	KreJTNMQbeMlwlPDDh/w3ZEcRCZojqedDP0zcqVnXsVJY00Sfl0AJlzOP6UU582GdY6G
	S+Sy1Gdfoit7UEaEUveCJiqdaR6VYgWraDSk/+T3F0rBYT3LilhJbmrNa+OpLfCrtNJ1
	91yjrNihw1A7gimnUNy3zpTLQslEiZ0uV1+AIS+0Sro7KeFArTUT496ALJMxpN2jqSoj
	/CFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=y1loygYJy1YYAXIpyZVCnVFb1nWaA3CeRKmLTjadCFM=;
	b=J/5wUK9GuugExjY5RLdRDTxTLzis6mSnS8L+y66DeKJ+xLlmzhFyZC5ZTjMtwZJ+La
	CX6Qc8t5ZEaITQiivaHVNqNR2ytPRkvofee4uVjyzImYI7H5EFOno1kde39RvH1bD3hG
	yEO+Rz8D4B1Sc+i4if0FzOeAlN7EzmdBO3YdM6KHyM2+hdQOOTmktVjxvhB1M6iH+3up
	2nc1grOXpcuNy4del1YghlkcqxWL1xzF/PuPUZ3YOZJpgblWlb1aNepEsBSNODZS6GR1
	rN2RU/BAJEyPTAWwHtWy+RYiPpiM4CxG62M9ASjDg56NrQF+5yv77OjicKlEC3OKl9uX
	YnbA==
X-Gm-Message-State: APjAAAXFny8hEClPRHUYVPcdQMoMNh5Q+gin5h6cSgM5AxuoOm7aohHd
	q1IkpyCiFZP8SCWwhbF+YRIiXxei64Bnpw==
X-Google-Smtp-Source: APXvYqzzH6eVmcBK2gcOKZ04R+bUlhDUo+I8NlmM8rx+bjlAQeD/s2sjx7FOMsW1cxPsL1Rle5sf7g==
X-Received: by 2002:a17:90a:a604:: with SMTP id
	c4mr29513646pjq.48.1570962296751; 
	Sun, 13 Oct 2019 03:24:56 -0700 (PDT)
Received: from localhost.localdomain ([192.55.55.41])
	by smtp.gmail.com with ESMTPSA id
	f74sm17714451pfa.34.2019.10.13.03.24.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Oct 2019 03:24:56 -0700 (PDT)
From: Ankit Navik <ankit.tarot@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Oct 2019 15:56:24 +0530
Message-Id: <1570962384-18643-1-git-send-email-ankit.tarot@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] glfw: Initial recipe for glfw
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
X-List-Received-Date: Sun, 13 Oct 2019 10:24:56 -0000

It adds generic recipe for glfw: a multi-platform library for OpenGL,
OpenGL ES, Vulkan, window and input.

Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
---
 meta-oe/recipes-core/glfw/glfw_3.3.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-core/glfw/glfw_3.3.bb

diff --git a/meta-oe/recipes-core/glfw/glfw_3.3.bb b/meta-oe/recipes-core/glfw/glfw_3.3.bb
new file mode 100644
index 0000000..b23d723
--- /dev/null
+++ b/meta-oe/recipes-core/glfw/glfw_3.3.bb
@@ -0,0 +1,20 @@
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
-- 
2.7.4


