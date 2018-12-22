Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2A14360402
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Dec 2018 12:42:40 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id q1so3870263pfi.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Dec 2018 04:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=p+1lnXyIjnUADZz+zjMTkpJ7AMISZsmMxFHyiTosdak=;
	b=KbJXfse2b9YWSdvBgyN/v7ukg9QywJtwNk7tKBBLMez+lEX+88klx3KtvmQaK12jPp
	4f9k7S5Vk+/1FJpu5NMvlHFU6BuECJHoyw/vqxcnDchQoEsgN01MGLq2Pc+BzxWjEcWe
	kJVqkJmhl9WGsl01hwsfhp5dKHgDp6KMpKYi8l8SxGnRoeaO13taSNASlSIRVw1ppgT+
	PzPnFMb2SBQ+dq1rz1TvKeXrYfehZY6cr9hiPqzpsEsDn13IuGp/V+PXzyi+0Dg0gqTk
	44cq6R5KNcUHqZLWI3x5gcFjnE6x+8Uba/q9aOFtgveh3Puf+3iE4yQ3HkCyNQhRShWy
	rphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=p+1lnXyIjnUADZz+zjMTkpJ7AMISZsmMxFHyiTosdak=;
	b=eo+TExJ20pvrnbeUKTj1Gei7mFvBBgX21R2h1bgF4Kba96gknHauAG3RWLLg2AmAs4
	tqJjVXg0UTajzwWagb4HFo2jszKvDBu4euWUxlA/FV8n3PIOKJm8k3Oyu8ePp09TFER4
	JgaWEbvV8DZODJIe7YyP8S8hL2fV+nBOJv94vuMHSoJGPn+I+wUv8FpjnwJdjieJh4gB
	1Z1ztpR6h53NFgfmsSnCx/aT/8UaNLrXGHdVv5ID9dZ0PmqHWHZ1bhJG6Ws9Ybp17Lvx
	yHPJlCJuRYWtWQ/ZOY8s9kAO4JJJlJVRRJAhq7YJjaP9uKxf8oeNSMB9ESY4NWzL7x/V
	XfHw==
X-Gm-Message-State: AA+aEWaLZWEfHIO0ektq9yg8mmicCfvvRL3MUDPRKFlx0qSf6xhwV8ii
	2azhd7OMwkYNJdAGI3qlVzDCsy3l5O4=
X-Google-Smtp-Source: AFSGD/Vrs0bPZSm/pzdWRuUUnHPLmNWbxbuR8MPGSMJFGecI0FWgyVn5oCwx4edNUbNhuxqCf7gphw==
X-Received: by 2002:a62:3c1:: with SMTP id 184mr6438318pfd.56.1545482560997;
	Sat, 22 Dec 2018 04:42:40 -0800 (PST)
Received: from apnavik-DESK.iind.intel.com (fmdmzpr04-ext.fm.intel.com.
	[192.55.54.39]) by smtp.gmail.com with ESMTPSA id
	q1sm37889035pfb.96.2018.12.22.04.42.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 22 Dec 2018 04:42:40 -0800 (PST)
From: Ankit Navik <ankit.tarot@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Dec 2018 18:14:06 +0530
Message-Id: <1545482646-18142-1-git-send-email-ankit.tarot@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] vulkan-headers: Initial recipe for Vulkan headers
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
X-List-Received-Date: Sat, 22 Dec 2018 12:42:40 -0000

Add generic recipe for Vulkan header files and API registry.

Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
---
 .../vulkan-headers/vulkan-headers_git.bb           | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-core/vulkan-headers/vulkan-headers_git.bb

diff --git a/meta-oe/recipes-core/vulkan-headers/vulkan-headers_git.bb b/meta-oe/recipes-core/vulkan-headers/vulkan-headers_git.bb
new file mode 100644
index 0000000..1a0a212
--- /dev/null
+++ b/meta-oe/recipes-core/vulkan-headers/vulkan-headers_git.bb
@@ -0,0 +1,23 @@
+SUMMARY  = "Vulkan API Headers"
+DESCRIPTION = "Vulkan headers and API registry from Khronos Group"
+LICENSE  = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
+SECTION = "base"
+
+S = "${WORKDIR}/git"
+SRCREV = "f54e45b92374b99de8556cacffc3602a03187b68"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git"
+
+inherit pkgconfig cmake
+
+FILES_${PN} = " \
+	/usr/share \
+	/usr/share/vulkan \
+	/usr/share/vulkan/registry \
+	/usr/share/vulkan/registry/cgenerator.py \
+	/usr/share/vulkan/registry/vk.xml \
+	/usr/share/vulkan/registry/reg.py \
+	/usr/share/vulkan/registry/genvk.py \
+	/usr/share/vulkan/registry/validusage.json \
+	/usr/share/vulkan/registry/generator.py	\
+"
-- 
2.7.4


