Return-Path: <straka.derek@gmail.com>
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by mail.openembedded.org (Postfix) with ESMTP id A8CFD60586
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 22:52:19 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id p125so10969967oif.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 14:52:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HsPWAv2aCFqzpJ0L7W0uvAKRVAqxfZDwz60IERq/CBc=;
	b=Zrt5+tRHzmdHGGg05e5nxRst1jw9tS5U2y+yoIANNeBfvScsAmg6UHUPNzmnng8OP9
	RykeDVy2b7lsD5sLYGPozPytH0iBDJdACJ/rixULqmEcGXYQhkc7y/GxqiBVPpeLiCrJ
	sAx4YmB16yF1CP3IhhTCm9vvi82UJ9sVNDZTvTuwjiz2UdULZ3cy2n58TobKGi3e6KdM
	WEYQo9QVNl7KMNQHOas2h1Ue7C5j7qJV1CQ4cVA8WT6DQ/kmjsDefZ14Att9/mkxBqms
	R12lWLR5HtXgBifYyJzrkeMS9GOaAFU20s4jb1H4wxwIdqmyIfHABaknMadAi4EpXVFI
	5zcQ==
X-Gm-Message-State: APjAAAWqpuiNEDs6LmB1PaNMV6MDnlyzwoEZ61zLAc46ef4rwegDx/0U
	vUuJmj77DXASEfNWwOlGo3nDpFVIeVc=
X-Google-Smtp-Source: APXvYqzfpj2E4n1JQdGwvZypBsQq4Qj6q9vDJ4VY00Vm1Ur8OnV/tpY1qlGbAhB7ouDmSCX214/7uw==
X-Received: by 2002:a54:4085:: with SMTP id i5mr3448413oii.17.1581720740243;
	Fri, 14 Feb 2020 14:52:20 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id
	r13sm2216206oic.52.2020.02.14.14.52.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 14:52:19 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Feb 2020 17:52:06 -0500
Message-Id: <20200214225206.18243-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python3-click: consolidate inc and bb files into a single bb file
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
X-List-Received-Date: Fri, 14 Feb 2020 22:52:19 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-click.inc  | 25 ------------------
 .../python/python3-click_7.0.bb               | 26 ++++++++++++++++++-
 2 files changed, 25 insertions(+), 26 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-click.inc

diff --git a/meta-python/recipes-devtools/python/python-click.inc b/meta-python/recipes-devtools/python/python-click.inc
deleted file mode 100644
index f9dfd5627f..0000000000
--- a/meta-python/recipes-devtools/python/python-click.inc
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "A simple wrapper around optparse for powerful command line utilities."
-DESCRIPTION = "\
-Click is a Python package for creating beautiful command line interfaces \
-in a composable way with as little code as necessary. It's the "Command \
-Line Interface Creation Kit". It's highly configurable but comes with \
-sensible defaults out of the box."
-HOMEPAGE = "http://click.pocoo.org/"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=c13ed890b210a882c1778216694c98c7"
-
-SRC_URI[md5sum] = "7f53d50f7b7373ebc7963f9ff697450a"
-SRC_URI[sha256sum] = "5b94b49521f6456670fdb30cd82a4eca9412788a93fa6dd6df72c94d5a8ff2d7"
-
-UPSTREAM_CHECK_REGEX = "click/(?P<pver>\d+(\.\d+)+)/"
-
-CLEANBROKEN = "1"
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-threading \
-    "
-
-BBCLASSEXTEND = "native nativesdk"
-
-PYPI_PACKAGE = "Click"
diff --git a/meta-python/recipes-devtools/python/python3-click_7.0.bb b/meta-python/recipes-devtools/python/python3-click_7.0.bb
index 1920644042..cfa3e0fe4f 100644
--- a/meta-python/recipes-devtools/python/python3-click_7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-click_7.0.bb
@@ -1,2 +1,26 @@
+SUMMARY = "A simple wrapper around optparse for powerful command line utilities."
+DESCRIPTION = "\
+Click is a Python package for creating beautiful command line interfaces \
+in a composable way with as little code as necessary. It's the "Command \
+Line Interface Creation Kit". It's highly configurable but comes with \
+sensible defaults out of the box."
+HOMEPAGE = "http://click.pocoo.org/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=c13ed890b210a882c1778216694c98c7"
+
+SRC_URI[md5sum] = "7f53d50f7b7373ebc7963f9ff697450a"
+SRC_URI[sha256sum] = "5b94b49521f6456670fdb30cd82a4eca9412788a93fa6dd6df72c94d5a8ff2d7"
+
+PYPI_PACKAGE = "Click"
 inherit pypi setuptools3
-require python-click.inc
+
+UPSTREAM_CHECK_REGEX = "click/(?P<pver>\d+(\.\d+)+)/"
+
+CLEANBROKEN = "1"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-threading \
+    "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


