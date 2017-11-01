Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id C07EB605B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Nov 2017 16:41:31 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id 1so3418138qtn.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Nov 2017 09:41:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8HQ5x/0XKEux6+vaK7zISbJT/VBw1u3PZ3QeIhZcfYc=;
	b=rYGa+UMZUxMndU1G8yk0klyloXmyotxGE3bXSZRLbsjjnWkNBFXXYJ3ge5szAHT1Zi
	8yV+3RAaGDV6PLl/ccTmAE2fWe27geUYEYQWIwUPi7PTH65KIsOdtNH0Bo73TQ1kqAmg
	Wqh1kTZ8InK8TpH397Wbt+qht8bBNQHQZVfGGB/RdfxZuQ4Im4zaGeQ/6zbmQJ7TpYpM
	07zNg/r0FdsQV637n3Lm4ox5IDLBV1axrg7LeYGcF7jvZw+cNlXRIoSq4JTSKu99K+AU
	zYEhq9x/Mh0GgtJyC7Y7BxD3OuwUt+A1LFNkVUcKF7hTOx9vc/AiVG9D0o1JDn8OMSBr
	Qciw==
X-Gm-Message-State: AMCzsaWs4nZfkvbAKkCCjPqDL2rwxK6cLU5bYvhmXrSM3LTNnW4UWeb4
	rKadrHOuLLdkLreKzALR6Parrvz3
X-Google-Smtp-Source: ABhQp+S175PPeUAM/0MsqXT2oynDzZADn0iME8eYpSQFU5yf6YlPtOVrC2iDqiUhaIiSFBSBmp/5hg==
X-Received: by 10.237.59.249 with SMTP id s54mr778242qte.34.1509554492555;
	Wed, 01 Nov 2017 09:41:32 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id j19sm701508qtk.87.2017.11.01.09.41.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Nov 2017 09:41:32 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Nov 2017 12:41:24 -0400
Message-Id: <1509554484-22352-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-automat: add an initial recipe for version 0.6.0
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
X-List-Received-Date: Wed, 01 Nov 2017 16:41:31 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-automat.inc   | 16 ++++++++++++++++
 .../recipes-devtools/python/python-automat_0.6.0.bb      |  2 ++
 .../recipes-devtools/python/python3-automat_0.6.0.bb     |  4 ++++
 3 files changed, 22 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-automat.inc
 create mode 100644 meta-python/recipes-devtools/python/python-automat_0.6.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-automat_0.6.0.bb

diff --git a/meta-python/recipes-devtools/python/python-automat.inc b/meta-python/recipes-devtools/python/python-automat.inc
new file mode 100644
index 0000000..1ac5d3b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-automat.inc
@@ -0,0 +1,16 @@
+DESCRIPTION = "Self-service finite-state machines for the programmer on the go"
+HOMEPAGE = "https://github.com/glyph/Automat"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4ad213bcca81688e94593e5f60c87477"
+
+SRC_URI[md5sum] = "ad7bba58d262d8956d732330cb5ef53d"
+SRC_URI[sha256sum] = "3c1fd04ecf08ac87b4dd3feae409542e9bf7827257097b2b6ed5692f69d6f6a8"
+
+PYPI_PACKAGE = "Automat"
+
+inherit pypi
+
+RDEPENDS_${PN} += "\
+   ${PYTHON_PN}-attrs \
+   ${PYTHON_PN}-six \
+"
diff --git a/meta-python/recipes-devtools/python/python-automat_0.6.0.bb b/meta-python/recipes-devtools/python/python-automat_0.6.0.bb
new file mode 100644
index 0000000..8ac8c9c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-automat_0.6.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-automat.inc
diff --git a/meta-python/recipes-devtools/python/python3-automat_0.6.0.bb b/meta-python/recipes-devtools/python/python3-automat_0.6.0.bb
new file mode 100644
index 0000000..0469e61
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-automat_0.6.0.bb
@@ -0,0 +1,4 @@
+inherit setuptools3
+require python-automat.inc
+
+RDEPENDS_${PN} += "${PYTHON_PN}-enum "
-- 
2.7.4


