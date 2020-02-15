Return-Path: <straka.derek@gmail.com>
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
	[209.85.167.174])
	by mail.openembedded.org (Postfix) with ESMTP id B676161338
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 17:29:31 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id p125so12747791oif.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 09:29:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WYyUIWKceu7OOCoMMvA1QKek54furWf2NxbmNfyYNDM=;
	b=A10gAAIZdXK61Z0nPuwx2xdaLP6Czlpjnkb0BTGVXiGy8lsi77s3akTQZY0VdyAhTO
	ETezNwZv5NeV42pKr0WKLX5aEvzyqOgMLGIxgSufwcuAO6xiOZjXkPzytzmT4JmLxplo
	HUJ8sEiBSKhjjNje23junBoWnh2OiF6TKRE6Tc0xfPzb7gnodAmwSs+Piw+2ySpvgT+E
	ZHZLwP2Zvp/hvmD70Zn3oeTdesdEvJrb/mvtVY4fzpj0VaEkwQ3za7UHoSD9G2nkaVwA
	1Zf5MdiEqqDwIGdyi4mhgDtXhMtSfr10zN2kah1ajSPpUpl7q2/uVUNfg4TZweCseI5G
	op3g==
X-Gm-Message-State: APjAAAX4z9HykOietouW0D/I2F16i6goI1Qs9IOXQG3mNchZERfxFFJ0
	7auYAeo61oinjfJqWT46jrv2YQtTRRY=
X-Google-Smtp-Source: APXvYqyoa4hRnrJti3kcIoBm/Y0+PzdRut5kjZPoLymy3G5HnNUqXKN1TwsoP7169HODPqBM2U5MmQ==
X-Received: by 2002:a54:450d:: with SMTP id l13mr5589058oil.117.1581787772353; 
	Sat, 15 Feb 2020 09:29:32 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id
	p24sm3269718otq.64.2020.02.15.09.29.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 15 Feb 2020 09:29:31 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Feb 2020 12:29:24 -0500
Message-Id: <20200215172924.27218-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python3-coloredlogs: consolidate inc and bb files into a single bb file
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
X-List-Received-Date: Sat, 15 Feb 2020 17:29:31 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-coloredlogs.inc             | 24 -----------------
 .../python/python3-coloredlogs_10.0.bb        | 26 +++++++++++++++++--
 2 files changed, 24 insertions(+), 26 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-coloredlogs.inc

diff --git a/meta-python/recipes-devtools/python/python-coloredlogs.inc b/meta-python/recipes-devtools/python/python-coloredlogs.inc
deleted file mode 100644
index bdb1d752c5..0000000000
--- a/meta-python/recipes-devtools/python/python-coloredlogs.inc
+++ /dev/null
@@ -1,24 +0,0 @@
-DESCRIPTION = "Colored terminal output for Python's logging module"
-HOMEPAGE = "https://coloredlogs.readthedocs.io"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=690da298a43805797a4fa7bbe180b3c6"
-
-SRC_URI[md5sum] = "0a186966a1955fff8cf9489373e691d9"
-SRC_URI[sha256sum] = "b869a2dda3fa88154b9dd850e27828d8755bfab5a838a1c97fbc850c6e377c36"
-
-inherit pypi
-
-do_compile_prepend() {
-    sed -ie "s/find_pth_directory(),/'',/g" ${S}/setup.py
-}
-
-do_install_append() {
-    rm -rf ${D}${datadir}
-}
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-humanfriendly \
-"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-coloredlogs_10.0.bb b/meta-python/recipes-devtools/python/python3-coloredlogs_10.0.bb
index 3872399665..88fac87c7e 100644
--- a/meta-python/recipes-devtools/python/python3-coloredlogs_10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-coloredlogs_10.0.bb
@@ -1,2 +1,24 @@
-inherit setuptools3
-require python-coloredlogs.inc
+DESCRIPTION = "Colored terminal output for Python's logging module"
+HOMEPAGE = "https://coloredlogs.readthedocs.io"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=690da298a43805797a4fa7bbe180b3c6"
+
+SRC_URI[md5sum] = "0a186966a1955fff8cf9489373e691d9"
+SRC_URI[sha256sum] = "b869a2dda3fa88154b9dd850e27828d8755bfab5a838a1c97fbc850c6e377c36"
+
+inherit pypi setuptools3
+
+do_compile_prepend() {
+    sed -ie "s/find_pth_directory(),/'',/g" ${S}/setup.py
+}
+
+do_install_append() {
+    rm -rf ${D}${datadir}
+}
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-humanfriendly \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.17.1


