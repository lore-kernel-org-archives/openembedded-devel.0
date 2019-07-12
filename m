Return-Path: <windel.bouwman@gmail.com>
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
	[209.85.208.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3B2A57EE18
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 06:56:33 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id r12so8225295edo.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 23:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=zQwntw6UYEUyKkdO8/cDAlxu2mi3ApPVOG2qy5VJCdc=;
	b=OgCkORBdULpuA+zZs5W+AJAD9GCXfRbyYKnVWiKGG35KmoVQqhiKFtXWDcxXN94own
	ATH7v+jEM1YZD6qUaLt1wMT7hFvsUqWHpOizOXInzDBnSvG+maeuBnrjcXI03OCx76bi
	McemlR2Wq0uWBolEKMnppCxfzJvbmL8fM7yP8rJ0lDyE4DTCC8CdbSjCOvhjd8I0mLuK
	7zLiMeQYDs8XMxQnEug57j8JHisdbTTPGJ1OgFEHnhQAQXrkQy8Sw+GKbIq3/6tKV7mB
	jgMrsm0fV5PWCmGR9GoVSdb/KFLdqjrmjEcyiGgUVrhetZF3yscFQtLEiHLjyAXPOW5S
	BW1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zQwntw6UYEUyKkdO8/cDAlxu2mi3ApPVOG2qy5VJCdc=;
	b=Rmq3NKIo5w6TNCr8sHaBF2SBSaL/g7sXkcFJHTvuDL0egvz27AK9tnIcRQNnuxUYEq
	Zpa9p3imZz8fL6GxxLeK76dz5FKKeF5uv5yJZ0XhejJO841RNr82RceBQU8bu+RjPFre
	LgU6imsIYrldtVG+gudTfc/XUw+fF46hpUsHqCt7BA6B+1u6B0RuQOPPinIzDBpPnY/U
	YOZK8oYcWPEQxzjY19dw3noUimN/EX8Nu69kmgtDG6xRUwZ/Fr7orK7hmaqw5beD5OJv
	f3xRVAsk/2w3C7QQkhDi4xzmtsOEOw5NGCWYXx8TRgPOu8Pj7ylVE76SY6noZl/yJY0L
	4xKA==
X-Gm-Message-State: APjAAAWo9Ou6q1hGWK9PsErAeTBw+9mdj6MoUJVdHdom8b93wPRfKKUd
	SBDoGSFc8uDiMUZOX5xfmU2FyEL5
X-Google-Smtp-Source: APXvYqw6uDRu4T86SPWIZ1Kbs008behzcTlq9W8N50ls5xNkTN/UAtovfKnz6vjc/lSHP4o0y8G22A==
X-Received: by 2002:a50:b6c7:: with SMTP id f7mr7489237ede.275.1562914593850; 
	Thu, 11 Jul 2019 23:56:33 -0700 (PDT)
Received: from PC771.demcon.guest ([87.215.69.65])
	by smtp.gmail.com with ESMTPSA id
	d12sm2233824edp.16.2019.07.11.23.56.32
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 11 Jul 2019 23:56:33 -0700 (PDT)
From: Windel Bouwman <windel.bouwman@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Jul 2019 08:56:17 +0200
Message-Id: <20190712065617.30992-1-windel.bouwman@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python] Add coloredlogs python package.
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
X-List-Received-Date: Fri, 12 Jul 2019 06:56:35 -0000

Signed-off-by: Windel Bouwman <windel.bouwman@gmail.com>
---
 .../python/python-coloredlogs.inc             | 24 +++++++++++++++++++
 .../python/python-coloredlogs_10.0.bb         |  2 ++
 .../python/python3-coloredlogs_10.0.bb        |  2 ++
 3 files changed, 28 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-coloredlogs.inc
 create mode 100644 meta-python/recipes-devtools/python/python-coloredlogs_10.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-coloredlogs_10.0.bb

diff --git a/meta-python/recipes-devtools/python/python-coloredlogs.inc b/meta-python/recipes-devtools/python/python-coloredlogs.inc
new file mode 100644
index 000000000..4a35806db
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-coloredlogs.inc
@@ -0,0 +1,24 @@
+DESCRIPTION = "Colored terminal output for Python's logging module"
+HOMEPAGE = "https://coloredlogs.readthedocs.io"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=690da298a43805797a4fa7bbe180b3c6"
+
+SRC_URI[md5sum] = "0a186966a1955fff8cf9489373e691d9"
+SRC_URI[sha256sum] = "b869a2dda3fa88154b9dd850e27828d8755bfab5a838a1c97fbc850c6e377c36"
+
+inherit pypi
+
+do_compile_prepend() {
+    sed -ie "s/find_pth_directory(),/'',/g" setup.py
+}
+
+do_install_append() {
+    rm -rf ${D}${prefix}/share
+}
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-humanfriendly \
+"
+
+BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python-coloredlogs_10.0.bb b/meta-python/recipes-devtools/python/python-coloredlogs_10.0.bb
new file mode 100644
index 000000000..0fc1b258c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-coloredlogs_10.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-coloredlogs.inc
diff --git a/meta-python/recipes-devtools/python/python3-coloredlogs_10.0.bb b/meta-python/recipes-devtools/python/python3-coloredlogs_10.0.bb
new file mode 100644
index 000000000..387239966
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-coloredlogs_10.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-coloredlogs.inc
-- 
2.17.1


