Return-Path: <windel.bouwman@gmail.com>
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
	[209.85.208.45])
	by mail.openembedded.org (Postfix) with ESMTP id A7F8560017
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jul 2019 06:25:40 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id m10so58244575edv.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Jul 2019 23:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=udoHiPoiPLoPpsP7gLpkqLfmtgg4rLCCLWNP/xIjxlA=;
	b=kMbrOMwCE4BzuzflGb9gzqiMjQRsrZ2MQTnPtpmousrOXiW6kKl7FWZ67R1Slxi1cy
	Pa9CSOWy8eTNYvE85rT9Q9V1vGqvwoqqKSgcWcI583W7M0ryB1f/csdVPHTaik1CiCCA
	FJKJwk9M8zYKJr9f0ScqAz+UsydtaUuRsKcpgJfuXtIBFdg3fFyRvAkIqzwEKBN1M/Ly
	mEt4c6dFPUsJs6VaQgqTSpQpJlV0MLXT+LgnYxiix2uMoCu/MSj/sQNkieBYI4cYEq2y
	BWqEJMzdOykElUM2zNecmtuXFPAbFRa32SBGGHppkxniIS6N3ashR5j7od0ypcqHeid/
	ID9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=udoHiPoiPLoPpsP7gLpkqLfmtgg4rLCCLWNP/xIjxlA=;
	b=lA/B8Wn0CTN/kAGHSyTUxnUMhy9yyWNrdnwoMO8xm7XenOgRMFHorNbOMMvpkQNQgO
	feH4bQi++MxEJnzxGPtFVF8s4O454e6R4bA/Gwqs6vxs7rztBB0O1jdNQaqbKC+sWuS9
	Qc2iod9WdOI1l7D9bm5ifwNFBegE70W74w+m/U+tNtnZ7LLJtl5SzHcw7sULIw/788WK
	AyVMVkmoRfUtUolU+XrJx0LvgBoNDnu4akmIKrgdLX9igS+2CtK5/oqxmN0GMrxJ12rw
	HHAYhqETjWbLT52ci8zQfGJBioxSUa+zVrV6jURucdZIKTufbTZ23asb1bljmeAkj0xn
	3efA==
X-Gm-Message-State: APjAAAUGRFZmKWS4L7OSLs88Rt045jzBRFOBv1Oweka0CS6oWbGhS6mY
	vAgtOOAzqLiBBthucWEU/EUSHc9U
X-Google-Smtp-Source: APXvYqw3neBHEcDiG8rPD73PHutFfb400P+1pMN0zkb+BUGQHrW3y+MvPsA9DKCFQ7v895NU4KvBWQ==
X-Received: by 2002:a17:906:1804:: with SMTP id
	v4mr84974562eje.188.1564381540907; 
	Sun, 28 Jul 2019 23:25:40 -0700 (PDT)
Received: from PC771.demcon.guest ([87.215.69.65])
	by smtp.gmail.com with ESMTPSA id
	q13sm15297550edn.92.2019.07.28.23.25.39
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 28 Jul 2019 23:25:40 -0700 (PDT)
From: Windel Bouwman <windel.bouwman@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Jul 2019 08:25:09 +0200
Message-Id: <20190729062509.9367-1-windel.bouwman@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH v2] Add recipe for the coloredlogs python package.
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
X-List-Received-Date: Mon, 29 Jul 2019 06:25:40 -0000

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
index 000000000..2a4ccb37a
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
+    rm -rf ${D}${prefix}${datadir}
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


