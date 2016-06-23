Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 32C736FFA4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2016 16:23:20 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id b136so16710583qkg.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2016 09:23:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9UutQvDjlL4jgb9wrv2+4YxsLikVky53t+9602sR/FM=;
	b=FQ00tLWjVtLk7N6QlPnH0ErbApD23VK92crAqIrlR7DEM2PYngoNZpkrYyqPBqw1rX
	OtKcdEbd6gzS77UlusbB7PV3peCCUTIk9DTkZ7OTqHe7XUNdCva+hNGTXrl+yirC1kHl
	yvGUPIbU9u6lE2OPyLCqa42F+IXva2m7ZGBQAn9dA6KvAlh1Gx3cbqzeySsTaRUe1Ktb
	Os7vInLd+mMcSbK6T9WmxIHTElAIBQ8zlhvnzdOX97LO3C7LCOAU52F5W2HRj/Gm6bBR
	Tkn9DnL4gCbCk25xBCAN/zzpz1jdJyGgSEjM5yiLMTCiM9+p7Q6aXHnsX1E/f1gkL8+v
	imeA==
X-Gm-Message-State: ALyK8tJdvKXp8kHzY2RLS0cJaqlQcFHqr4mQFIAxqdWIk1sOLZInz36jDeukx1KS5xP9Hg==
X-Received: by 10.55.90.135 with SMTP id o129mr46241528qkb.141.1466699001676; 
	Thu, 23 Jun 2016 09:23:21 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	e187sm354398qkc.19.2016.06.23.09.23.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Jun 2016 09:23:21 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Jun 2016 12:23:13 -0400
Message-Id: <1466698993-11496-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python-yappi: add a recipe for a python profiler
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
X-List-Received-Date: Thu, 23 Jun 2016 16:23:21 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-yappi_0.94.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-yappi_0.94.bb

diff --git a/meta-python/recipes-devtools/python/python-yappi_0.94.bb b/meta-python/recipes-devtools/python/python-yappi_0.94.bb
new file mode 100644
index 0000000..bfc0e03
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-yappi_0.94.bb
@@ -0,0 +1,16 @@
+SUMMARY  = "Yet Another Python Profiler"
+HOMEPAGE = "http://yappi.googlecode.com/"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=ad426a7287507a8db02778ff586d5370"
+
+SRC_URI[md5sum] = "a02c49efe783c4e31d6bbd805a37adec"
+SRC_URI[sha256sum] = "15cc17dba1252ecaae29ced1e96c216165d93fd3e9ea05dff1f5e5866f16bd59"
+
+PYPI_PACKAGE = "yappi"
+inherit pypi setuptools
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-threading \
+    "
-- 
1.9.1


