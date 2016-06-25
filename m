Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6D2FD60043
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jun 2016 15:06:45 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id c74so11855997pfb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jun 2016 08:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=1x/5w4EASsELUt7f5ZaN4lSpMifbdSLKWbogHOmUVK8=;
	b=bSZr1mplh4VZyPafq8ROLFmPsnQgluy2SwoE1tnGvVRjU/hIReZcxx6NeGHiBL3pIp
	uecec3Lie42OtXyFQi92+ZP9j/3dK8ZWnvln6ZZHVhSSDZIxQYaAVPWO6nJ0fIdBl4Qf
	nHUSETvgyA4GBYLVRRWLLeN47EEbUr+vNnY8mKgfkb0/LMW81n7AJroVCdSV+FAx9+tB
	rZh3dKhSsWSCnNZku3CZ0457zlKHJm6LSX2KH5B0tVkOxW4z+SYzsFfc04/+Ju08+fLs
	jUJMkSzs6jZYz36QST/JZJz7ovR6KmfgX7Muf4XOTjnSL6/dGxcAmTIbCITotzd7mp4C
	8bdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=1x/5w4EASsELUt7f5ZaN4lSpMifbdSLKWbogHOmUVK8=;
	b=Nx6ijnzeoOdXFTL+SChsxfdBji6cnEGlrSUBnysbvQPSwM1mxAWDhBKZOQn25Olyyp
	K2ZKoGQoqePYbC+r4BOia0YDEEJX/NL7UUzbHImIniXJpXbqnaoYyNiBT/CIX/8wlJl0
	sWjTac0eMbCB+EVMU9uTfuP7o+WT3XdVzyyxPrH19xlAx4NPx8ZJY22PadSCI4c5K12X
	qggOaWlvEUAte0K7F/BaI8+XLFQHw4dG4AdS+7uCnSH177kJirqZrNV/HyYG4UbhNfQx
	7MCAiVbbLZmmhgJLAc/pmxNsQm70U5yuZtatZXpybZeCrnFhkVl43caaRMixlW83+Yj6
	xmpg==
X-Gm-Message-State: ALyK8tIAstJmcYrhaLKtKfOG90Lu/B//aUK6m699ykhJAbVcp1g7Q3wiXlBZI9nK37djWw==
X-Received: by 10.98.131.206 with SMTP id h197mr17117762pfe.124.1466867206381; 
	Sat, 25 Jun 2016 08:06:46 -0700 (PDT)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	p187sm609594pfg.67.2016.06.25.08.06.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 25 Jun 2016 08:06:44 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster@mvista.com
Date: Sat, 25 Jun 2016 08:06:41 -0700
Message-Id: <1466867201-27560-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-oe][PATCH] cpuset: add new python package
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
X-List-Received-Date: Sat, 25 Jun 2016 15:06:47 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-devtools/python/python-cpuset_1.5.7.bb | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/python/python-cpuset_1.5.7.bb

diff --git a/meta-oe/recipes-devtools/python/python-cpuset_1.5.7.bb b/meta-oe/recipes-devtools/python/python-cpuset_1.5.7.bb
new file mode 100644
index 0000000..8f6532c
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-cpuset_1.5.7.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Cpuset is a Python application to make using the cpusets facilities in the Linux kernel easier"
+SECTION = "devel/python"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRCNAME = "cpuset"
+
+SRC_URI = "https://github.com/lpechacek/${SRCNAME}/archive/v${PV}.tar.gz"
+
+SRC_URI[md5sum] = "6ad79b26ba03f559604d74513cc34392"
+SRC_URI[sha256sum] = "32334e164415ed5aec83c5ffc3dc01c418406eb02d96d881fdfd495587ff0c01"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit distutils
+
+RDEPENDS_${PN} = "\
+    python-core \
+    python-re \
+    python-logging \
+    python-textutils \
+    python-unixadmin \
+    "
-- 
2.3.5


